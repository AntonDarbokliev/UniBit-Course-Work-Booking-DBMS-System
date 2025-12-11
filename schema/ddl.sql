CREATE TABLE ORGANIZATION (
    organization_id INTEGER PRIMARY KEY,
    address VARCHAR2(100),
    created_at TIMESTAMP
);

CREATE TABLE MEMBER (
    member_id INTEGER PRIMARY KEY,
    organization_id INTEGER,
    firstName VARCHAR2(20),
    lastName VARCHAR2(35),
    created_at TIMESTAMP
);

CREATE TABLE MEETING_ROOM (
    meeting_room_id INTEGER PRIMARY KEY,
    meeting_room_name VARCHAR2(30),
    organization_id INTEGER,
    workingFrom VARCHAR2(8), -- Запазваме като стринг понебе ORACLE не предоставя тип за "време"
    workingTo VARCHAR2(8)
);

CREATE TABLE BOOKING (
    booking_id INTEGER PRIMARY KEY,
    meeting_room_id INTEGER,
    startDate TIMESTAMP,
    endDate TIMESTAMP,
    created_by INTEGER,
    CHECK (endDate > startDate)
);

CREATE TABLE AMENITY (
    amenity_id INTEGER PRIMARY KEY,
    name VARCHAR2(30)
);

CREATE TABLE ROOM_AMENITY (
    amenity_id INTEGER,
    meeting_room_id INTEGER,
    PRIMARY KEY (amenity_id, meeting_room_id)
);

CREATE TABLE BOOKING_PARTICIPANT (
    member_id INTEGER,
    booking_id INTEGER,
    PRIMARY KEY (member_id, booking_id)
);
