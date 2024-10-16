-- Recreate the City table
CREATE TABLE City (
    CityID INTEGER PRIMARY KEY,
    Name VARCHAR(50),
    State VARCHAR(50),
    Population INTEGER
);

-- Recreate the AppUser table (renamed from User to avoid keyword conflicts)
CREATE TABLE AppUser (
    UserID INTEGER PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

-- Recreate the CrimeData table
CREATE TABLE CrimeData (
    CityID INTEGER,
    Year INTEGER,
    CrimeType VARCHAR(50),
    IncidentsPerCapita DECIMAL,
    PRIMARY KEY (CityID, Year, CrimeType),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Recreate the EconomicData table
CREATE TABLE EconomicData (
    CityID INTEGER,
    Year INTEGER,
    UnemploymentRate DECIMAL,
    GDPPerCapita DECIMAL,
    MedianIncome DECIMAL,
    PRIMARY KEY (CityID, Year),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Recreate the RealEstateData table
CREATE TABLE RealEstateData (
    CityID INTEGER,
    Year INTEGER,
    AvgHomePrice DECIMAL,
    RentalPrice DECIMAL,
    PropertyTaxRate DECIMAL,
    PRIMARY KEY (CityID, Year),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Recreate the EducationData table
CREATE TABLE EducationData (
    CityID INTEGER,
    Year INTEGER,
    NumberOfSchools INTEGER,
    AverageClassSize DECIMAL,
    GraduationRate DECIMAL,
    PRIMARY KEY (CityID, Year),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Recreate the UserCityTable (renamed from UserCity to avoid conflicts)
CREATE TABLE UserCityTable (
    UserID INTEGER,
    CityID INTEGER,
    PRIMARY KEY (UserID, CityID),
    FOREIGN KEY (UserID) REFERENCES AppUser(UserID),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);