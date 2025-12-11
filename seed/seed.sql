-- ORGANIZATION
INSERT INTO ORGANIZATION (organization_id, address, created_at) VALUES (1, '15 Vitosha Str, Sofia', TO_TIMESTAMP('2024-01-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ORGANIZATION (organization_id, address, created_at) VALUES (2, '100 Tsarigradsko Shose Blvd, Sofia', TO_TIMESTAMP('2024-02-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ORGANIZATION (organization_id, address, created_at) VALUES (3, '34 Shipka Str, Plovdiv', TO_TIMESTAMP('2024-03-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- MEMBER
INSERT INTO MEMBER (member_id, organization_id, firstName, lastName, created_at) VALUES (1, 1, 'Ivan', 'Petrov', TO_TIMESTAMP('2024-01-11 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBER (member_id, organization_id, firstName, lastName, created_at) VALUES (2, 1, 'Maria', 'Georgieva', TO_TIMESTAMP('2024-01-12 09:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBER (member_id, organization_id, firstName, lastName, created_at) VALUES (3, 1, 'Petar', 'Ivanov', TO_TIMESTAMP('2024-01-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBER (member_id, organization_id, firstName, lastName, created_at) VALUES (4, 2, 'Elena', 'Dimitrova', TO_TIMESTAMP('2024-02-16 08:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBER (member_id, organization_id, firstName, lastName, created_at) VALUES (5, 2, 'Georgi', 'Stoyanov', TO_TIMESTAMP('2024-02-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBER (member_id, organization_id, firstName, lastName, created_at) VALUES (6, 3, 'Anna', 'Nikolova', TO_TIMESTAMP('2024-03-21 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- MEETING_ROOM
INSERT INTO MEETING_ROOM (meeting_room_id, meeting_room_name, organization_id, workingFrom, workingTo) VALUES (1, 'Conference Room A', 1, '08:00:00', '18:00:00');
INSERT INTO MEETING_ROOM (meeting_room_id, meeting_room_name, organization_id, workingFrom, workingTo) VALUES (2, 'Small Room', 1, '09:00:00', '17:00:00');
INSERT INTO MEETING_ROOM (meeting_room_id, meeting_room_name, organization_id, workingFrom, workingTo) VALUES (3, 'Large Conference', 2, '08:00:00', '20:00:00');
INSERT INTO MEETING_ROOM (meeting_room_id, meeting_room_name, organization_id, workingFrom, workingTo) VALUES (4, 'Training Room', 2, '09:00:00', '18:00:00');
INSERT INTO MEETING_ROOM (meeting_room_id, meeting_room_name, organization_id, workingFrom, workingTo) VALUES (5, 'Presentation Hall', 3, '08:30:00', '17:30:00');

-- AMENITY
INSERT INTO AMENITY (amenity_id, name) VALUES (1, 'Projector');
INSERT INTO AMENITY (amenity_id, name) VALUES (2, 'Video Conferencing System');
INSERT INTO AMENITY (amenity_id, name) VALUES (3, 'Whiteboard');
INSERT INTO AMENITY (amenity_id, name) VALUES (4, 'TV');
INSERT INTO AMENITY (amenity_id, name) VALUES (5, 'Air Conditioning');
INSERT INTO AMENITY (amenity_id, name) VALUES (6, 'Flipchart');

-- ROOM_AMENITY
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (1, 1);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (2, 1);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (3, 1);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (5, 1);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (3, 2);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (5, 2);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (1, 3);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (2, 3);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (3, 3);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (4, 3);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (5, 3);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (1, 4);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (3, 4);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (6, 4);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (5, 4);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (1, 5);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (2, 5);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (4, 5);
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES (5, 5);

-- BOOKING
INSERT INTO BOOKING (booking_id, meeting_room_id, startDate, endDate, created_by) VALUES (1, 1, TO_TIMESTAMP('2024-12-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO BOOKING (booking_id, meeting_room_id, startDate, endDate, created_by) VALUES (2, 1, TO_TIMESTAMP('2024-12-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO BOOKING (booking_id, meeting_room_id, startDate, endDate, created_by) VALUES (3, 2, TO_TIMESTAMP('2024-12-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO BOOKING (booking_id, meeting_room_id, startDate, endDate, created_by) VALUES (4, 3, TO_TIMESTAMP('2024-12-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO BOOKING (booking_id, meeting_room_id, startDate, endDate, created_by) VALUES (5, 4, TO_TIMESTAMP('2024-12-17 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO BOOKING (booking_id, meeting_room_id, startDate, endDate, created_by) VALUES (6, 5, TO_TIMESTAMP('2024-12-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-18 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6);

-- BOOKING_PARTICIPANT
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (1, 1);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (2, 1);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (3, 1);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (1, 2);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (2, 2);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (3, 3);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (4, 4);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (5, 4);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (4, 5);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (5, 5);
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES (6, 6);
