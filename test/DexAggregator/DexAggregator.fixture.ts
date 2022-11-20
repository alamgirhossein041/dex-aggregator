import type { SignerWithAddress } from "@nomiclabs/hardhat-ethers/dist/src/signer-with-address";
import { ethers } from "hardhat";

import type { DexAggregator } from "../../types/contracts/DexAggregator";
import type { DexAggregator__factory } from "../../types/factories/contracts/DexAggregator__factory";

export async function deployDexAggregatorFixture(): Promise<{ dexAggregator: DexAggregator }> {
  const signers: SignerWithAddress[] = await ethers.getSigners();
  const admin: SignerWithAddress = signers[0];

  //   const greeting: string = "Hello, world!";
  const dexAggregatorFactory: DexAggregator__factory = <DexAggregator__factory>(
    await ethers.getContractFactory("DexAggregator")
  );
  const dexAggregator: DexAggregator = <DexAggregator>await dexAggregatorFactory.connect(admin).deploy();
  await dexAggregator.deployed();

  return { dexAggregator };
}
