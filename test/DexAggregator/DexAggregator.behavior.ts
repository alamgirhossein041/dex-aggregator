import { expect } from "chai";

const { BigNumber } = require("ethers");

export function shouldAddANewDex(): void {
  it("should add a new dex", async function () {
    // Act
    await this.dexAggregator.connect(this.signers.admin).addDex(this.signers.admin.address, "Dex1", true);

    // Assert
    var result = await this.dexAggregator.connect(this.signers.admin).getNumDexes();
    expect(result.eq(BigNumber.from("1"))).to.equal(true);
  });
}
