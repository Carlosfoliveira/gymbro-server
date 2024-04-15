-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Workout" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "trainType" TEXT NOT NULL,
    "wod" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Workout_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Workout" ("date", "id", "name", "trainType", "userId", "wod") SELECT "date", "id", "name", "trainType", "userId", "wod" FROM "Workout";
DROP TABLE "Workout";
ALTER TABLE "new_Workout" RENAME TO "Workout";
CREATE UNIQUE INDEX "Workout_userId_key" ON "Workout"("userId");
CREATE TABLE "new_UsersInvites" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "workoutId" TEXT NOT NULL,
    "acceptFlag" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "UsersInvites_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "Workout" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UsersInvites_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_UsersInvites" ("acceptFlag", "id", "userId", "workoutId") SELECT "acceptFlag", "id", "userId", "workoutId" FROM "UsersInvites";
DROP TABLE "UsersInvites";
ALTER TABLE "new_UsersInvites" RENAME TO "UsersInvites";
CREATE UNIQUE INDEX "UsersInvites_userId_workoutId_key" ON "UsersInvites"("userId", "workoutId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
