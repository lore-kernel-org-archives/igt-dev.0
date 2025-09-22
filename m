Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEDACAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 01:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9CB10E05B;
	Mon, 22 Sep 2025 01:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zkcGyPAQ";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362C810E05B
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 01:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6qLc84qxxTmHKedC4Ui9HcPRRnEX8J+f1r2dk/+uCzWNe+BdBFDDrkYI1koYLKWbVoVBVI3hRS8PbcfVQjPvLVKXQJ29XtA1CXuTCpG8B79ujJMZkShf9JabjeXizhLSVgKipuwYNlKbDee3MXagH6kXOQB7sXCQ7FiotDoKXcCZHzhQE6Kt0bB5CM5A9TKoGL7kdqiOMgRo3aPUU1SAuywEd/+UV6HV3YBjBZjTuSoww9i/caCPl1FEMiRhCU72Fudp8i7TWTwE9TS82ajoThFq5d3zFL7j0hAWCiGZVEtRtS/QVxScBDfEk4S6K8o34awVdHMn4pDt9kPEeVpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmBlw/QL49NQ7PcwhLtWlHv8zq3/75LJYmiYPa74QC0=;
 b=rjEwj/4Ky7Xji6tI6ij3J5Pqk2GI1ixTfEcnz7ZKIm+irf+cQ0koWIuekToHcpDDTUOExiT4JDVSxSRuyimxrnFjjQHfYAYnovGI2ufLR7Bej1MOXFIQHue8MCTeQts8co4wpFX1yflFnudJzhizWGxEz0m/012DCEaqQg2Xtl98el36AdALA28q/D1lUAMhpngPmLUCcJ5PaVH5GJ0+2yxnLFHeHdnbB6mW2WWMofPM8UPsj+puamTUgtHF2VrDClfeVhnwdoI3BQTMY/I/PyMm99sh7n/RzpbEIOXNiO2oGksH/MZ66M3chsMLJgg+NnKq9/MztpI6ft1lxceMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmBlw/QL49NQ7PcwhLtWlHv8zq3/75LJYmiYPa74QC0=;
 b=zkcGyPAQXzL8nt2xDSxnihLwPssffyMSXRfdMbWUH26kkP2IN5tS/P1sYQhvf1jCNP2/JMj1MMYsVEexR399hdG8qeya7kAlRpPSV8RXeUrGH5mcmATz/5hW1ClkbkXJgz/uvzHwCS/lVVWrDw8s7/AvMGoiKukkB8nhp59JUcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Mon, 22 Sep
 2025 01:38:01 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 01:38:01 +0000
Content-Type: multipart/alternative;
 boundary="------------i6Vy0wAvwblJYPyiFAkd0n1F"
Message-ID: <256c715a-a38f-48c6-bfe8-1d6da9a82df6@amd.com>
Date: Sun, 21 Sep 2025 21:37:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tests/amdgpu: Exercise MMIO_REMAP remap page
 (alloc/map + HDP flush)
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: igt-dev@lists.freedesktop.org, David Yat Sin <David.YatSin@amd.com>
References: <20250918084655.2192395-1-srinivasan.shanmugam@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250918084655.2192395-1-srinivasan.shanmugam@amd.com>
X-ClientProxiedBy: YT1PR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::20) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 427d9eb8-3131-49f3-e251-08ddf978aa8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0I5VkZ6N01NRVZReWlqU2dqa3hMRFNGOUJvdWVBNmxsQmN1MlBUVG1OTEdj?=
 =?utf-8?B?Zy8yREFjeUtKZ0dBMzBTZzNzYkRzV3JtQzlQVUVWYmhBRnZWL0tzNmptc2xu?=
 =?utf-8?B?WTVoREZtTlY4VXptVUlzdXZsQVpBbzdtTmluaU9vM1Q1T3h5YWZpSDRNRU5v?=
 =?utf-8?B?VDR2bmxQME5EbWNIUTNKd2plT3JJbXJkWVVadStQSThYVkM2ZWIxUW5vdXZq?=
 =?utf-8?B?WlFKYTlwSDN5VFhDbDV6bFIrKzhoNTlPWHErdFhNNGorT1NKTDVaWDV3SmxT?=
 =?utf-8?B?dTB4UGJNNHZxTFNpckpGSEl4bFZtbjVUazRUM0UzbEtnSDVKc1dRdng0TlZF?=
 =?utf-8?B?aW9mZUpIVU1SQWh5aXZJUjRXZU44eU1OWG13SHZ5ZDl1a29XZU5YTGcxTEFq?=
 =?utf-8?B?NUx1YmRHUVZIMmFRUUUrYVorZ3VZNXErTXJiY2FkUCtHWjIyTmdRcjNFNHdu?=
 =?utf-8?B?U3hOREZOam5ZSHNsZkg1Z3FpWlg3T1pkb1V3aWdMVGxFdFErVHVyNWZCUjFk?=
 =?utf-8?B?TCtheGFxNmw2R21QV2Y2aG9nRHc1OWpmR3NhQ1hxaFVOdU1telBnTWZHVlRt?=
 =?utf-8?B?YWpsbEdUSTZTRWtURDY0bHBCOUFnQjNVMEVjSDRVSExYNi9GSFJndWwvb0hx?=
 =?utf-8?B?clJrRHlaTVBHdURlSHZhbjUvR05IT0tlRTVSUWlxdmowVHFxNXZYWEJkbGtZ?=
 =?utf-8?B?T1hNdFJVK3ZzZ043dVVjSEVvN0tOdXdZRHlSSGpVNmdidnF5dlRqOVdMQ09K?=
 =?utf-8?B?RGMzU29MZTVRMGFTZVk0Nk9pU1ZnZ3dsRnhlTFQzWEJ1eDQvVC9RZks3dE9l?=
 =?utf-8?B?dVFMMU5qSi9DblFYckQzbTBDM28vK1FnSlVXLzd5c1FQOTJMS3EwZmNHR0lx?=
 =?utf-8?B?ZG9xVjZrRkNQbHo0UTg2ckVwODEwd3gxaVViLy9KcjZBVktjVUtIaFBhNVNT?=
 =?utf-8?B?YUdjOGNTZTJBVjFzSTVqMm4yZzZyL1VKekdYZEJDdUlveGxPc01hUDM4OEJN?=
 =?utf-8?B?enRaamcrWTVDalBqZEdUeGJwbDJoc3NHZC9US3oySCt4SmszSWlpNHQ3c2pu?=
 =?utf-8?B?Uy8yNTQ5QlNPY0E3R0xMNkdnTDZodEdLTTRlMk9BK1J0U3pQYWEvOURCQkdN?=
 =?utf-8?B?bnZQR3Jxc3pHWGd6WjZjV2cxWlI0SmpGRDhPYjZYaXYvbnFIdEd5djlJRjh1?=
 =?utf-8?B?VXNXcWtlWUJNWVV2cUNBTi9Tczc0MGJIY2Q5M1huYlNuZ3k1TVpmL25XNmJD?=
 =?utf-8?B?S3FCMTcwd2tmeUVETjF4T3VJN1NxZFFNQmtRYWdrNUdtTzB3SXNlSlJ5VWpY?=
 =?utf-8?B?cTlyVTRoMHp6WmlPVFhZNENvTUdiSUZ4WnNmbEFPN1lzYklpZXJEMDI1TC9k?=
 =?utf-8?B?blE3ZzdnREFXb1pNTnhyVjZCZlhNUmE1R3dpc2Q4SnpCL0hUZzlNdXMrSGl3?=
 =?utf-8?B?YkwraGNTb1l2VWVFUU11dERCMmE0NlBId2p6T0I0OE1PbDk0TjA0MHptTjMy?=
 =?utf-8?B?TXJrRWtGSk5hNlY5aDJoMTFHSlBtUE9iYkRmZjRNUWduL1ltMzg5TGlCZTBj?=
 =?utf-8?B?bkl6UEpnVGVpOGZRSjBxcFFpTEF6d2F0TzNXRkNSb2hpNXlWbkVyQnVIVTI0?=
 =?utf-8?B?WXFoNXpKMnQ1OTJOMEJLbGpsaGNRcjkrMWtUZW1nOWtqQXZvbEFMMU5yaTJz?=
 =?utf-8?B?c1E5UUl0TWFlY2FpZ2toQU96dUE3RXF2bUVUREkvUmtsbnI3UFd3QzhKVU13?=
 =?utf-8?B?OXA0aEtKdm5LNHpESU5xU1JtZk8rdUtyQVRCVXhwS3kyN01IK0lROXBSbGZx?=
 =?utf-8?B?MjNVV3BuR3UxSWxyRjJjNXA2cVBML2pqcytjOWxqblNuVlg4Rit0S1FzY2d1?=
 =?utf-8?Q?L1p17Y5OQuGaS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUVTeUdGR1MrWHl3ZzYwZkJpZXZRV0kvd3RERnNUZkVaMjRZN0xDenllWFRW?=
 =?utf-8?B?VzhySUx2Y1g3WERscWhqdnliSE1wTFovNlNZVXl5Qzl6a0QyNDRraURUZUtB?=
 =?utf-8?B?cVA3dEhLN1RocGxtTW83L09wc1N1WDhsNEdLWUg2a212akw1OWhVM2dTckpj?=
 =?utf-8?B?bDBHNHBNVTFNaGlsRWdaaTRwNFNjMWw5TURVRTV6Q1BNZWZrdkhHVmdmY1Rm?=
 =?utf-8?B?VmYzQjh1dXBxMGJ4VG5WNytCYXdac2FFVGV0NnNHeW9rLzBhbkhtbGNBbEJQ?=
 =?utf-8?B?eExBQkdOYVZ0Tm9ObXRlekR1QmE4R0VUOXRya2lzSzNzZkFEM013R0tIdkl2?=
 =?utf-8?B?b3NIQnozbkNmYVpsQk5PWVFsd2RZVDBHZGRUbWYvWW8yc0NnWmRHMTdBNC9D?=
 =?utf-8?B?QWhEMk5pcDhTNFhXTm41YTBjUU40bFE1dDFXell0NVVRekE3ZThQOGJCczQx?=
 =?utf-8?B?RkJKVXZhd04rM3hIaHROeDA0RFVZSUc0RVp4Nmp2blIxWisyZ2tyb1RodWpv?=
 =?utf-8?B?NW5KWHNidisySzhjZ2dMZ2hTSTJSdkJlK0NqbWZTSk44dE5ENXVxbGlSa2l0?=
 =?utf-8?B?THRTTGJLOUZXR2V0c3M0RzdFcHpTRmN2YjJLWGExK1JBaU1rY0tTeEJhdFRy?=
 =?utf-8?B?ZlUwSjg3bHBvL1V3ay9XeW5YREpyUk5ESWZ1VEdhRmo0SDZmK1NhQmIyRGRu?=
 =?utf-8?B?NGQ1NWh3aVg5ZDliaEJpVFlUUGw4ampIMG9HNVlhNjNaNS9YWHFOcmZ3SlJJ?=
 =?utf-8?B?U2hWT013eTVmZ053aGdLOGgvVjBaNXZtek9YaWhNbUtoZGJBRTgwN3p4bHFK?=
 =?utf-8?B?S2pwdWluekdlWUlNdTlhbXVkSVBxYkdJb3VYRk0renB0a3U2MkVGOTh0aXZN?=
 =?utf-8?B?UE5ENHo5K1pySC8zVTN1VUc2VTkvbkhkR0phaGFSSThGT0R6YWVTUVdSZGZ2?=
 =?utf-8?B?ZmMySXE5ejhNUjRURWhNQjRCd1V4aHZUY0NwV2V5ZVlEYVMwOGhNbU5Ebm9J?=
 =?utf-8?B?YlhsY3l4VXNaYUpibUY2QzZyTFBMTjQ1SDdCQkhON05wZG4wcnNkMW1PZm8y?=
 =?utf-8?B?V0pDa1VGQW5kdjUzYUFkSnk3LzdyYWtiSDMrUFpPUTlqUjZRL1RaMStYRXhl?=
 =?utf-8?B?NUROajltdE5DampYUUsxR0NGQjBSMHZ1QXNNZEtuU1NtejZuUVhjZVo3L0NK?=
 =?utf-8?B?SzJoclhNSXc1VGVzckhxdndZR2ZvQ3MvcStwNE03ZVdWYmVKcit5bVVLS0Zt?=
 =?utf-8?B?ODMwYTRJbHlRUVlxMUExY0RoMGxHcjZuaFUwT0NuNmhUYUtLYWlXdkpXWjdo?=
 =?utf-8?B?UFlSbE5jY2tTdVFaMkFDSGFkMkpWSHlaMGMvaXFwbzR5eStBYmVudzNmL0hk?=
 =?utf-8?B?VkxaeE5jR0t4K3JaUXp1aXFMNldMMXRMaERBcGljNzVORlVtaWJRZmQ4NTZ6?=
 =?utf-8?B?TG56YWVrcW1Wd0c3dk1VVjl4eHJyenc0d3pBTFVBbXpyL0hoVndPU2JId3BB?=
 =?utf-8?B?L0RKQ1RTdEJKais5NkRlZCtNZXJhMlVnYlNWM21peGZrZTFMdXpjcDBOS1p3?=
 =?utf-8?B?T0I2czgxRmdwTHdSSWV2WkZzaWdnRk9WTGNlVDZYNWdJdFdvTXNIQzNjaTNh?=
 =?utf-8?B?VTBBeVYzOXplVlpsVlBOTms1NHgvbGt0Y2p6Kzl4VGVvRWc5dTgrakZyTHFu?=
 =?utf-8?B?UFBpY1JES1J6RzYvUFYrcHhZd0cyT3YrN2VBY2J2NzBoR0x1TXBtYzc2OXNs?=
 =?utf-8?B?YXFBdEFkSGExdDFSK2VEd0JqOXdqUVYxZGdySTFrbVhzV0JsdDhiWk10WnFO?=
 =?utf-8?B?c3JTM1VRdTc4MUtUYzVpOG03R1IzSFJiNmNnTlBrZTA2QzBLOUhuUDIyMkNh?=
 =?utf-8?B?UmhGKzBVV2xTb21lK0xsZGwxSmo5VVNQYmlYTXBiUyt2TjRiM3ZlalpZQ0FI?=
 =?utf-8?B?QTVlVmQwSGt6Z0dNY2VuNXRLTTlpcENqd3JpczNtTGxuTTBLK3Fsc2F5cXov?=
 =?utf-8?B?OGwzNlVTT1M4S0pyeHVTV0tkaEhLcjByQ1FOU2tGd0J1Ryt0MTJMai9wMXNk?=
 =?utf-8?B?T3N5MjFsdXpOY0cxL25vRmFRc0dwRDdIS3ZhUDhWWDFHSm5WY1JyNUdrdDBx?=
 =?utf-8?Q?KjXpE0M32CUvgQiUxfzgDyaq3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427d9eb8-3131-49f3-e251-08ddf978aa8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 01:38:01.3263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n37p5cLotFV5fa+fEVEFNhJgLJ4qh1qQFDpVKGsE4w4YqjRD1zXqXXhf4vSDIbP5/h8M66y7bpCn++jEjPtkhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--------------i6Vy0wAvwblJYPyiFAkd0n1F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Srini,

One small suggestion to further improve the patch:

Consider moving all skip-eligible checks (e.g., device capabilities, page size, etc.) to occur before any resource allocation, similar to how you’ve already done with page_size_ok_4k().
This helps avoid potential memory leaks when *igt_skip() is triggered — since it uses longjmp()*, any cleanup code after that call (such as amdgpu_bo_free()) will be skipped.

if (r == -EOPNOTSUPP || r == -ENODEV || r == -EINVAL) {
    amdgpu_bo_free(remap_bo); // Prevent resource leak
    igt_skip("MMIO_REMAP not available");
}
Alternatively, you could track a cleanup_needed flag or restructure the subtest logic using igt_fixture/igt_subtest blocks to ensure safe cleanup paths are always followed.

This isn’t critical, but it helps keep the test code clean — especially since this subtest might serve as a reference for future tests. Avoiding skipped-cleanup side effects early can prevent messy patterns from being copied unintentionally.

Best regards,
Vitaly

On 2025-09-18 04:46, Srinivasan Shanmugam wrote:
> This series adds two IGT subtests in amd_bo.c to exercise the MMIO_REMAP
> remap page:
>
>   1) mmio_remap_gem_create_close
>      - Allocates a 4 KiB, page-aligned BO in
>        AMDGPU_GEM_DOMAIN_MMIO_REMAP and immediately frees it. Skips
>        gracefully when the domain is not supported
>        (-EOPNOTSUPP/-ENODEV/-EINVAL) or system PAGE_SIZE > 4K.
>
>   2) mmio_remap_map_and_poke
>      - Allocates and CPU-maps the 4 KiB remap page, then write-1 to
>        HDP_MEM_FLUSH_CNTL (offset 0) twice, followed by a dummy read to
>        post the writes. Unmaps and frees on exit.
> 	   
> These tests help cover the basic KGD/KFD MMIO_REMAP path (allocation and
> BAR-mapped MMIO access).
>
> TODO: A kernel patch enabling this path is pending merge; once it lands,
> the Link below can serve as the stable reference.
>
> Link: https://patchwork.freedesktop.org/series/153209/#rev5
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: David Yat Sin <David.YatSin@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
>
> Srinivasan Shanmugam (2):
>   tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close subtest
>   tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP flush) subtest
>
>  tests/amdgpu/amd_bo.c | 144 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>
--------------i6Vy0wAvwblJYPyiFAkd0n1F
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Srini,<br>
      <br>
      One small suggestion to further improve the patch:<br>
      <br>
      Consider moving all skip-eligible checks (e.g., device
      capabilities, page size, etc.) to occur before any resource
      allocation, similar to how you’ve already done with
      page_size_ok_4k(). <br>
      This helps avoid potential memory leaks when <b>igt_skip() is
        triggered — since it uses longjmp()</b>, any cleanup code after
      that call (such as amdgpu_bo_free()) will be skipped.<br>
      <br>
      if (r == -EOPNOTSUPP || r == -ENODEV || r == -EINVAL) {<br>
      &nbsp;&nbsp;&nbsp; amdgpu_bo_free(remap_bo); // Prevent resource leak<br>
      &nbsp;&nbsp;&nbsp; igt_skip(&quot;MMIO_REMAP not available&quot;);<br>
      }<br>
      Alternatively, you could track a cleanup_needed flag or
      restructure the subtest logic using igt_fixture/igt_subtest blocks
      to ensure safe cleanup paths are always followed.<br>
      <br>
      This isn’t critical, but it helps keep the test code clean —
      especially since this subtest might serve as a reference for
      future tests. Avoiding skipped-cleanup side effects early can
      prevent messy patterns from being copied unintentionally.<br>
      <br>
      Best regards,<br>
      Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2025-09-18 04:46, Srinivasan
      Shanmugam wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250918084655.2192395-1-srinivasan.shanmugam@amd.com">
      <pre wrap="" class="moz-quote-pre">This series adds two IGT subtests in amd_bo.c to exercise the MMIO_REMAP
remap page:

  1) mmio_remap_gem_create_close
     - Allocates a 4 KiB, page-aligned BO in
       AMDGPU_GEM_DOMAIN_MMIO_REMAP and immediately frees it. Skips
       gracefully when the domain is not supported
       (-EOPNOTSUPP/-ENODEV/-EINVAL) or system PAGE_SIZE &gt; 4K.

  2) mmio_remap_map_and_poke
     - Allocates and CPU-maps the 4 KiB remap page, then write-1 to
       HDP_MEM_FLUSH_CNTL (offset 0) twice, followed by a dummy read to
       post the writes. Unmaps and frees on exit.
	   
These tests help cover the basic KGD/KFD MMIO_REMAP path (allocation and
BAR-mapped MMIO access).

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/153209/#rev5">https://patchwork.freedesktop.org/series/153209/#rev5</a>
Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: David Yat Sin <a class="moz-txt-link-rfc2396E" href="mailto:David.YatSin@amd.com">&lt;David.YatSin@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Signed-off-by: Srinivasan Shanmugam <a class="moz-txt-link-rfc2396E" href="mailto:srinivasan.shanmugam@amd.com">&lt;srinivasan.shanmugam@amd.com&gt;</a>

Srinivasan Shanmugam (2):
  tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close subtest
  tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP flush) subtest

 tests/amdgpu/amd_bo.c | 144 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

</pre>
    </blockquote>
  </body>
</html>

--------------i6Vy0wAvwblJYPyiFAkd0n1F--
