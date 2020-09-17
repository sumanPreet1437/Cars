using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Cars.Migrations
{
    public partial class Start : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Car",
                columns: table => new
                {
                    CarId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TagNumber = table.Column<string>(nullable: true),
                    Make = table.Column<string>(nullable: true),
                    Model = table.Column<string>(nullable: true),
                    CarYear = table.Column<DateTime>(nullable: false),
                    IsAvailable = table.Column<bool>(nullable: false),
                    AirConditioned = table.Column<bool>(nullable: false),
                    DVDPlayer = table.Column<bool>(nullable: false),
                    AirBags = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Car", x => x.CarId);
                });

            migrationBuilder.CreateTable(
                name: "Customer",
                columns: table => new
                {
                    Customerid = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DrvLicNumber = table.Column<int>(nullable: false),
                    FullName = table.Column<string>(nullable: true),
                    Address = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customer", x => x.Customerid);
                });

            migrationBuilder.CreateTable(
                name: "RentalRate",
                columns: table => new
                {
                    RentalRateId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DailyRate = table.Column<double>(nullable: false),
                    WeeklyRate = table.Column<double>(nullable: false),
                    MonthlyRate = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RentalRate", x => x.RentalRateId);
                });

            migrationBuilder.CreateTable(
                name: "RentalOrder",
                columns: table => new
                {
                    RentalOrderId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DateProcessed = table.Column<DateTime>(nullable: false),
                    CustomerId = table.Column<int>(nullable: false),
                    CarId = table.Column<int>(nullable: false),
                    TankLevel = table.Column<string>(nullable: true),
                    MilageStart = table.Column<int>(nullable: false),
                    MilageEnd = table.Column<int>(nullable: false),
                    Days = table.Column<int>(nullable: false),
                    RentStartDate = table.Column<DateTime>(nullable: false),
                    RentEndDate = table.Column<DateTime>(nullable: false),
                    RateApplied = table.Column<double>(nullable: false),
                    OrderTotal = table.Column<double>(nullable: false),
                    OrderStatus = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RentalOrder", x => x.RentalOrderId);
                    table.ForeignKey(
                        name: "FK_RentalOrder_Car_CarId",
                        column: x => x.CarId,
                        principalTable: "Car",
                        principalColumn: "CarId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_RentalOrder_Customer_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customer",
                        principalColumn: "Customerid",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_RentalOrder_CarId",
                table: "RentalOrder",
                column: "CarId");

            migrationBuilder.CreateIndex(
                name: "IX_RentalOrder_CustomerId",
                table: "RentalOrder",
                column: "CustomerId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "RentalOrder");

            migrationBuilder.DropTable(
                name: "RentalRate");

            migrationBuilder.DropTable(
                name: "Car");

            migrationBuilder.DropTable(
                name: "Customer");
        }
    }
}
