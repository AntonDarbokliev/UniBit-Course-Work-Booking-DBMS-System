-- Тригери:


-- Проверяваме дали букинга е направен извън работните часове на залата

CREATE TRIGGER validate_meeting_room_hours
BEFORE INSERT OR UPDATE ON BOOKING
FOR EACH ROW
DECLARE
    var_workingFrom TIMESTAMP;
    var_workingTo TIMESTAMP;
BEGIN 
    SELECT workingFrom, workingTo
    INTO var_workingFrom, var_workingTo
    FROM MEETING_ROOM mr
    WHERE mr.meeting_room_id = :NEW.meeting_room_id;
    
    IF TO_CHAR(:NEW.startDate, 'HH24:MI:SS') < var_workingFrom 
        OR TO_CHAR(:NEW.endDate, 'HH24:MI:SS') > var_workingTo THEN
            RAISE_APPLICATION_ERROR(-20001, 'Invalid booking time.');
    END IF;
END;

-- Заявки:

-- Вземи удобства на зала с id = 1
SELECT a.name AS amenity_name
FROM MEETING_ROOM mr
JOIN ROOM_AMENITY ra ON mr.meeting_room_id = ra.meeting_room_id
JOIN AMENITY a ON ra.amenity_id = a.amenity_id
WHERE mr.meeting_room_id = 1;

-- Вземи букинги и покажи име на зала, име на member и старт и край на букингите
SELECT
    b.booking_id,
    mr.meeting_room_name,
    m.firstName || ' ' || m.lastName AS created_by_name,
    b.startDate,
    b.endDate
FROM BOOKING b
JOIN MEETING_ROOM mr ON b.meeting_room_id = mr.meeting_room_id
JOIN MEMBER m ON b.created_by = m.member_id;

-- Вземи букинг с id = 1 и покажи участниците в него
SELECT
    mr.meeting_room_name,
    m.firstName,
    m.lastName
FROM BOOKING b
JOIN MEETING_ROOM mr ON b.meeting_room_id = mr.meeting_room_id
JOIN BOOKING_PARTICIPANT bp ON b.booking_id = bp.booking_id
JOIN MEMBER m ON bp.member_id = m.member_id
WHERE b.booking_id = 1;

-- Покажи лист от зали с техните букинги за днес, сортирани по низходящ ред
SELECT
    mr.meeting_room_name,
    COUNT(b.booking_id) AS total_bookings
FROM MEETING_ROOM mr
JOIN BOOKING b ON mr.meeting_room_id = b.meeting_room_id
WHERE b.startDate > TRUNC(SYSDATE) -- TRUNC маха часът и остава само дата т.е началото на деня
GROUP BY mr.meeting_room_id, mr.meeting_room_name
ORDER BY total_bookings DESC;

-- Покажи лист от зали, които имат над 1 букинг
SELECT
    mr.meeting_room_name,
    COUNT(b.booking_id) AS total_bookings
FROM MEETING_ROOM mr
JOIN BOOKING b ON mr.meeting_room_id = b.meeting_room_id
GROUP BY mr.meeting_room_name
HAVING COUNT(b.booking_id) > 1;

-- Покажи лист от организации, заедно с броят посетители във всяка
SELECT
    o.organization_id,
    o.address,
    COUNT(m.member_id) AS member_count
FROM ORGANIZATION o
LEFT JOIN MEMBER m ON o.organization_id = m.organization_id
GROUP BY o.organization_id, o.address;

-- Показва лист от зали, които имат бяла дъска като удбоствно
SELECT meeting_room_id, meeting_room_name
FROM MEETING_ROOM
WHERE meeting_room_id IN (
    SELECT ra.meeting_room_id
    FROM ROOM_AMENITY ra
    JOIN AMENITY a ON ra.amenity_id = a.amenity_id
    WHERE a.name = 'Whiteboard'
);

-- Показва лист от зали, които нямат нито един букинг
SELECT mr.meeting_room_id, mr.meeting_room_name
FROM MEETING_ROOM mr
WHERE NOT EXISTS (
    SELECT 1
    FROM BOOKING b
    WHERE b.meeting_room_id = mr.meeting_room_id
);

-- Показва лист от мембъри, направили букинг
SELECT member_id, firstName, lastName
FROM MEMBER
WHERE member_id IN (
    SELECT DISTINCT created_by
    FROM BOOKING
);

-- Връща лист от участници в букунги, които не са създавали букинги
SELECT member_id FROM BOOKING_PARTICIPANT
MINUS
SELECT created_by FROM BOOKING;
