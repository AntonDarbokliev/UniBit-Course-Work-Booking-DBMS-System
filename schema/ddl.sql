CREATE TABLE ORGANIZATION (
    organization_id INTEGER PRIMARY KEY,
    address VARCHAR,
    created_at TIMESTAMP
);

CREATE TABLE MEMBER (
    member_id INTEGER PRIMARY KEY,
    organization_id INTEGER,
    firstName VARCHAR,
    lastName VARCHAR,
    created_at TIMESTAMP
);

CREATE TABLE MEETING_ROOM (
    meeting_room_id INTEGER PRIMARY KEY,
    meeting_room_name VARCHAR,
    organization_id INTEGER,
    workingFrom TIMESTAMP,
    workingTo TIMESTAMP
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
    name VARCHAR
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
