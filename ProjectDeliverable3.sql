-- Recreate the City table
CREATE TABLE City (
    CityID INTEGER PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Population INTEGER CHECK (Population >= 0)
);

-- Refcreate the AppUser table
CREATE TABLE AppUser (
    UserID INTEGER PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Recreate the CrimeData table
CREATE TABLE CrimeData (
    CityID INTEGER,
    Year INTEGER,
    CrimeType VARCHAR(50),
    IncidentsPerCapita DECIMAL(10, 2) CHECK (IncidentsPerCapita >= 0),
    PRIMARY KEY (CityID, Year, CrimeType),
    FOREIGN KEY (CityID) REFERENCES City(CityID) ON DELETE CASCADE
);

-- Recreate the EconomicData table
CREATE TABLE EconomicData (
    CityID INTEGER,
    Year INTEGER,
    UnemploymentRate DECIMAL(5, 2) CHECK (UnemploymentRate >= 0 AND UnemploymentRate <= 100),
    GDPPerCapita DECIMAL(15, 2) CHECK (GDPPerCapita >= 0),
    MedianIncome DECIMAL(10, 2) CHECK (MedianIncome >= 0),
    PRIMARY KEY (CityID, Year),
    FOREIGN KEY (CityID) REFERENCES City(CityID) ON DELETE CASCADE
);

-- Recreate the RealEstateData table
CREATE TABLE RealEstateData (
    CityID INTEGER,
    Year INTEGER,
    AvgHomePrice DECIMAL(15, 2) CHECK (AvgHomePrice >= 0),
    RentalPrice DECIMAL(10, 2) CHECK (RentalPrice >= 0),
    PropertyTaxRate DECIMAL(5, 2) CHECK (PropertyTaxRate >= 0 AND PropertyTaxRate <= 100),
    PRIMARY KEY (CityID, Year),
    FOREIGN KEY (CityID) REFERENCES City(CityID) ON DELETE CASCADE
);

-- Recreate the EducationData table
CREATE TABLE EducationData (
    CityID INTEGER,
    Year INTEGER,
    NumberOfSchools INTEGER CHECK (NumberOfSchools >= 0),
    AverageClassSize DECIMAL(5, 2) CHECK (AverageClassSize >= 0),
    GraduationRate DECIMAL(5, 2) CHECK (GraduationRate >= 0 AND GraduationRate <= 100),
    PRIMARY KEY (CityID, Year),
    FOREIGN KEY (CityID) REFERENCES City(CityID) ON DELETE CASCADE
);

-- Recreate the UserCityTable
CREATE TABLE UserCityTable (
    UserID INTEGER,
    CityID INTEGER,
    PRIMARY KEY (UserID, CityID),
    FOREIGN KEY (UserID) REFERENCES AppUser(UserID) ON DELETE CASCADE,
    FOREIGN KEY (CityID) REFERENCES City(CityID) ON DELETE CASCADE
);

-- Indexes to improve performance for large data sets
CREATE INDEX idx_CrimeData_Year ON CrimeData (Year);
CREATE INDEX idx_EconomicData_Year ON EconomicData (Year);
CREATE INDEX idx_RealEstateData_Year ON RealEstateData (Year);
CREATE INDEX idx_EducationData_Year ON EducationData (Year);
