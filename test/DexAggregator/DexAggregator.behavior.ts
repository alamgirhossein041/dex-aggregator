import { expect } from "chai";
import { BigNumber } from "ethers";

export function shouldAddANewDexAdapter(): void {
  it("should add a new Dex adapter", async function () {
    // Act
    await this.dexAggregator.connect(this.signers.admin).addDexAdapter(this.signers.admin.address, "Dex1");

    // Assert
    const [actives, total] = await this.dexAggregator.connect(this.signers.admin).getNumDexAdapters();
    expect(actives.eq(BigNumber.from("1"))).to.equal(true);
    expect(total.eq(BigNumber.from("1"))).to.equal(true);
  });

  it("should return the Dex adapter data", async function () {
    // Arrange
    await this.dexAggregator.connect(this.signers.admin).addDexAdapter(this.signers.admin.address, "Dex1");

    // Act
    const adapter = await this.dexAggregator.connect(this.signers.admin).getDexAdapter(0);

    // Assert
    expect(adapter[0]).to.equal(this.signers.admin.address);
    expect(adapter[1]).to.equal("Dex1");
    expect(adapter[2]).to.equal(true);
  });

  // xit("should be owner to add a new Dex adapter", async function () {
  //   expect(1).to.equal(1);
  // });

  // it("should update a Dex adapter", async function () {
  //   // Arrange
  //   await this.dexAggregator.connect(this.signers.admin).addDexAdapter(this.signers.admin.address, "Dex1");

  //   // Act
  //   await this.dexAggregator.connect(this.signers.admin).updateDexAdapter(0, this.signers.user1, "Dex2", false);

  //   // Assert
  //   const result = await this.dexAggregator.connect(this.signers.admin).getNumDexAdapters();
  //   expect(result.eq(BigNumber.from("1"))).to.equal(true);
  // });
}
