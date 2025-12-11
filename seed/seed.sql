-- ORGANIZATION
INSERT INTO ORGANIZATION (organization_id, address, created_at) VALUES
(1, '15 Vitosha Str, Sofia', '2024-01-10 09:00:00'),
(2, '100 Tsarigradsko Shose Blvd, Sofia', '2024-02-15 10:30:00'),
(3, '34 Shipka Str, Plovdiv', '2024-03-20 14:00:00');

-- MEMBER
INSERT INTO MEMBER (member_id, organization_id, firstName, lastName, created_at) VALUES
(1, 1, 'Ivan', 'Petrov', '2024-01-11 08:00:00'),
(2, 1, 'Maria', 'Georgieva', '2024-01-12 09:30:00'),
(3, 1, 'Petar', 'Ivanov', '2024-01-15 11:00:00'),
(4, 2, 'Elena', 'Dimitrova', '2024-02-16 08:45:00'),
(5, 2, 'Georgi', 'Stoyanov', '2024-02-18 10:00:00'),
(6, 3, 'Anna', 'Nikolova', '2024-03-21 09:00:00');

-- MEETING_ROOM
INSERT INTO MEETING_ROOM (meeting_room_id, meeting_room_name, organization_id, workingFrom, workingTo) VALUES
(1, 'Conference Room A', 1, '08:00:00', '18:00:00'),
(2, 'Small Room', 1, '09:00:00', '17:00:00'),
(3, 'Large Conference', 2, '08:00:00', '20:00:00'),
(4, 'Training Room', 2, '09:00:00', '18:00:00'),
(5, 'Presentation Hall', 3, '08:30:00', '17:30:00');

-- AMENITY
INSERT INTO AMENITY (amenity_id, name) VALUES
(1, 'Projector'),
(2, 'Video Conferencing System'),
(3, 'Whiteboard'),
(4, 'TV'),
(5, 'Air Conditioning'),
(6, 'Flipchart');

-- ROOM_AMENITY
INSERT INTO ROOM_AMENITY (amenity_id, meeting_room_id) VALUES
(1, 1), (2, 1), (3, 1), (5, 1),
(3, 2), (5, 2),
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3),
(1, 4), (3, 4), (6, 4), (5, 4),
(1, 5), (2, 5), (4, 5), (5, 5);

-- BOOKING
INSERT INTO BOOKING (booking_id, meeting_room_id, startDate, endDate, created_by) VALUES
(1, 1, '2024-12-15 10:00:00', '2024-12-15 11:30:00', 1),
(2, 1, '2024-12-15 14:00:00', '2024-12-15 15:00:00', 2),
(3, 2, '2024-12-16 09:00:00', '2024-12-16 10:00:00', 3),
(4, 3, '2024-12-15 09:00:00', '2024-12-15 12:00:00', 4),
(5, 4, '2024-12-17 13:00:00', '2024-12-17 16:00:00', 5),
(6, 5, '2024-12-18 10:00:00', '2024-12-18 11:00:00', 6);

-- BOOKING_PARTICIPANT
INSERT INTO BOOKING_PARTICIPANT (member_id, booking_id) VALUES
(1, 1), (2, 1), (3, 1),
(1, 2), (2, 2),
(3, 3),
(4, 4), (5, 4),
(4, 5), (5, 5),
(6, 6);
