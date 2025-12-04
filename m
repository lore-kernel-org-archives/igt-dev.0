Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38111D2CDE4
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 23:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CFE10E22A;
	Thu,  4 Dec 2025 23:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ijH5FlZ0";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4D10E22A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 23:07:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz3rr0ov3ZaTXasz68WN1rr4wZZsEH/FtLzhvxalx8ucQwvHHZBctmQ/thH2ObiTFGbq4/W9oy96lTN73Nqw+g9oKLurA7IgYttp2fZrEAjLwIkmcR872hgNCQhAfmI8AODWU7ky6lUxRUC27pI/aaLZe/060ggXkpk2c+rqkIbhjqy28co16Dk+pEor7ScuJAqg7vHpZvpIsZhrZJUa8ySX9qcFmsgpCBnPjVyKxDTrS7Ulrp9Ex/xuQHIGF2+e8LIGQ5DLibETwW02q0j4VSA6nFIi9Mnb+Il8msOEqUvHkGYZQuaQDncJyDz3x7nXkG0B5YjBs+BqTHnaKIBSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXizrEAUsn0nKWQbYsaIQQXpCNSrPFL+nnls0idat44=;
 b=ESEhk/QLsfAMNrGgyUz8jX+xe/hu4bSMvyRB4L+PO399t2S2LwCgGHDruPzAmOITXQmPaxEMM77MWhA7E9u3aTkkbbiSVBjG4k01/TRn2WKXQa8n0nCY4GrTQZLCHnjjzseEjxa3vPmbRSecnsKXT/f12Gqfa1ESS0FbAVPhjeMpCWoi+hhuvfJNTqrbcgbq1QZXY3sPSR1A983tithXIFlM6BNYFECKzF+CGXFfpBd552UlotZQH8s+ucew5iBHOHW8aeoY7Kjm8v1RuSpMACzM6lniU11pbdvW4qKzkTvXToeG/6uGrSC1H9cO6hKmMjrpKqK0omullRvbL5V0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXizrEAUsn0nKWQbYsaIQQXpCNSrPFL+nnls0idat44=;
 b=ijH5FlZ0FRNR8TpSrpu7+8t9QMJUpPlKjONSsmkAd3ZlpPxOQu7o/igYUOXT+JpPKL2obRzUxk4d5CLOteNDtQi7I0TPNPV7gfWV+roIpmo1JHKUpw6npZQIfcw4Zpz3ifT+VYOPQ5C2sF5DIe5DLl6+Vw/KOSGAgKIvMXfKv3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 4 Dec
 2025 23:07:14 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 23:07:14 +0000
Message-ID: <e6c111a3-7700-4b19-abec-bb00052a034b@amd.com>
Date: Thu, 4 Dec 2025 16:07:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/6] Add writeback changes for intel-supported
 formats
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251203094307.3187669-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:303:b9::29) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: b374be15-6402-4a26-60e1-08de3389dc88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFhYdncweFpyNVc2b1RYQTI5anN4aXpsRFcxOTQ1NHAxMHdVdi9oZDU1R2Vy?=
 =?utf-8?B?OFBjMHdFUU4yUDMyZWhCK29nSVV5S1lUWWh5S2pzZTZnUHluMlFkdkFCR3I3?=
 =?utf-8?B?SmhYb29PdHQwQXZzTnkwSXZYMkZ1M00ySlJrVWs2VU5kTWFiOHRKc2JXUWNX?=
 =?utf-8?B?WHIwejVSc2ROb2RtdmIyWWVhaUdQTDh5aGpqOCtjYU00MSt3QzZUWnFadDJE?=
 =?utf-8?B?WWFDUWJ4UjJqZGFpN3dkbjhkWHBVMDYyeVVYYjlmYW1nc0ZkYTY0RzUrTXcz?=
 =?utf-8?B?aDg3NkRtY0hvZTBrSGNGdFd6ZjhubVJtWHQvekdmTDdiSG5Pd09UUWZ1UllN?=
 =?utf-8?B?eWtDM1VES1NHVXdaSGkwNCtMVDN4UVFyTUdCZnJpM2ZzMzNycTk1Q2hqaVgy?=
 =?utf-8?B?SmYwZEVKNWFCdTBOZlNoQzZvdGV6U0p4R1E4SXBiL0JzT3JpcFlHVzVWMnBW?=
 =?utf-8?B?VTJkUmRITDBmd1pxNERkRkIxWXdkNitYenQ0Y1NBQWd0OVU2Z2FjNFcweTR3?=
 =?utf-8?B?QjJBcTM2RzJXTGI3TzNRRlI0OWxaTXZDaEQ4UUtCbUF2L1pxaW16aVcvZUll?=
 =?utf-8?B?SktUck5qUy9xa05kL0RRU3J6M0h3OXpqaXNyUWtNa1J1cFRhSEdNQUxBNWNH?=
 =?utf-8?B?TDh2NFdvSEpsYTlHdWZWSTR6NTROK09Na3BGeC9UUG5mTmVzNW9ieWp3RVhY?=
 =?utf-8?B?aVdmRFYzdVFZRnZWdVJlZXJUNlpzblR5enlPMERrYXJVNVV3OXRXTHZTdkFh?=
 =?utf-8?B?V3pUcVhGUEhkUEhyYy9oK1FDaTZIL0YrbktXU3lxdGd0cmkrNFVvQ2xOZkY1?=
 =?utf-8?B?NGFMU2VWeHdLNEFOZnpDem10K256dWYyL0ZxVUpiRTNOcHRZdDd2NU1LSDMz?=
 =?utf-8?B?MnlyN25rdzdlU0JxRVQ1Ymlqc0xtbW1ld2dGaUpiMFIxYkUvZWhDb0pSZTBt?=
 =?utf-8?B?N2RaVFAwNmt4MUg1Rk1RNEFXRnFVbEc0UVEvRWVabC9WK09YbEhoa2dpL2Y4?=
 =?utf-8?B?TGxLVDhZaDJLL1k3NDdkS0xzYVRFcEM1SW5aUUoycTAvZ0Z1S05ycXZwY0VU?=
 =?utf-8?B?Z1MrRGhFQzZDcUNDN1NROHU3NUcxSDZCbVRGZXQzbVVsZDAzTG1weVA5TUcy?=
 =?utf-8?B?eEpEbnZUQ255SmlFWU11U2ZsQXhrY2VzUEZwSzdTVCtlVExmS1ZtMFA2MW9G?=
 =?utf-8?B?VVNKTGtEMUFweEdITHFkM1llOEtYUTRWSVl0Q3loMGp2NDFnNndTSDJRemI5?=
 =?utf-8?B?Q1pFZ2wzSnViNnlDQjI2QzJLNmhVdmFEMlRqb3RzZHNLRGFnSm1mUFR2dkZC?=
 =?utf-8?B?KzBCdXY5YStYQWlsYk93ZVZvYWNjZUNJUEtPa3M3c1R2dDlPSGczbG5ITml6?=
 =?utf-8?B?Z2g1WitHcjhMUUFGa1Jsc2dhYkhUOFhseHBnMnAzQmE2MjBuNC9LbWlzOE00?=
 =?utf-8?B?VXZTUWZma0x2blFVK0NEUEtrZ1phUDZzRkJWQmp1UHFNOGJJck9FS011cDZM?=
 =?utf-8?B?dEdwaHhxOEhrZFhDdC8rSXVEdmZBaW40a1pYbzArWnNjbzB0clF4TGpqMkVJ?=
 =?utf-8?B?aGxHeWZVZUl5WjJILzkxT2ZSczUxRDVES2RCR1IrTkhMNzJNTjBpckY3R1R3?=
 =?utf-8?B?MEJQc21URG85OUgwM2szeG5JZkJGV2dzU0dIYUpxL1RiOTdndzUwc1M5MUVR?=
 =?utf-8?B?clBjd2dPRCtQZm5LQzViQ0dkSzlQS1IzWkFkeE0yL1RUZVl0TmN3R2NydmdK?=
 =?utf-8?B?T05WL1VkbStWdk9yQVFxSkJuU3c1VDRTY1RwVG9ZakJ5SWpEQTN3bXYxUWho?=
 =?utf-8?B?c0RDT1VPTTU3NFlVTnY0YmtBaGVYTDNkdm5PZ2RTTk51dExUcUVFRDY2WmtE?=
 =?utf-8?B?bjJzTndMc0M2NG50RG5WVzdpUHN2R05mL0VJVEFjS2dvK1hUdWtUQXpNZHFX?=
 =?utf-8?Q?CZZr4lrdUI2Trei8LvTGdRDxZOwPXSql?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elNyTWZrUTRFLy8zTnAzZjNFYmlHd245ZXY2YzVPSmFuZTI2ZmQ2NFY0Tmlm?=
 =?utf-8?B?M0VJYWdpM3VycVdhSlJqLzhYMzVBMGNrdlk4eW1OaUw4K1BwMldLRUFhWFRI?=
 =?utf-8?B?M3ZsYzU0c3FaSGNxY3lGampiYXdZb2hvMUUrNXlrVk1RcTB3UmY0VmtzcStv?=
 =?utf-8?B?TllWb0VIK2Z1M2pqRFRWa2h3WkN5dHNBdExhWC9QWnFZelpJVlB6Q2JMelJK?=
 =?utf-8?B?V1I1V1FLWlhrZ3o0NUgyTzRsajNSMWlwWEVzb3g0empZOHVlNnZpei9jVlZ3?=
 =?utf-8?B?QU11dW5KS3kvWDY1TENrSXBDcjJIeEJYc2tmNCtWNmZYcUxNd1JkazZ4QXVa?=
 =?utf-8?B?Rk9LOWhpTHFReWhFeE52OFpaUDJxRlBLVTVkaHZIS2dvZFRHRjRRY3lFYlpQ?=
 =?utf-8?B?MGxKeTNJZ3B3UFFGNmNXeDd2YU1IWmFGSnVYdVZhanJIek4wQkdSZC92WFls?=
 =?utf-8?B?SjhaK21KZ2doeWJnN2U5dlJGYTF2MFp4VmtvY2Nna1c5bnRNNUdHc2tmY1hV?=
 =?utf-8?B?R2FsNUtwTnNmc1N4L1BXRHNGU0YzUW81VzRxUGxIQ3pKY21nZFpmSzM1NTVL?=
 =?utf-8?B?S2RvVjBoci92V2xoWmMxbGF6QkFPNEZpWlo1QlNRU3V1Qzl3SENrd2lscEFD?=
 =?utf-8?B?THFtQ0tUUUc0TS9jZDR6RmttTFZKcG9ZdStic0oyVXF4YUxLV1h5K1pyZit2?=
 =?utf-8?B?d3BlMm4zRjV6UnltSlUzTGpZZzl2UEI3ZVJIV00zOVNoNU1ZZHhXVmUyemxO?=
 =?utf-8?B?QVBKWDlkZUVPZDErUExvSHFhY0JwaHdkc0xVWG80K29FcERjeGltNGhGWnhX?=
 =?utf-8?B?cDdIbWVvSlVnUHhGUVRsb1pFWktWdkQxT1BCT1VBVkxqZEtJMitQZXhHeU4v?=
 =?utf-8?B?WmtSc0NuYnpRVmg5N0FzRkRKdWZNSG1EVys3REFTMGhuVFlpWStjaEVBRzR5?=
 =?utf-8?B?UjgvYzNkTS8zWTYzSGJJUnJrZHh5Zkc2eVFIWFZWVkhGTGNSbHVnUXo5aHgw?=
 =?utf-8?B?OUJteEFpMnFZUTZSaDNVUW5LYUxSd2lEVitnSEpxNEpUb0doRGVTd1J0Tng5?=
 =?utf-8?B?aHJRcmtacUhoUmx2bTYySm9NSXZIWnZIQ3l2TEJmTmtvdVU1WUNTcUZNc1Zn?=
 =?utf-8?B?dVdDdEtvY3BFaFN3V1NtMUtXWnMvbysvM3dDSThmS081Nms4MDh6MFk1cUJQ?=
 =?utf-8?B?YnFVdUhBdklsenBFVDhmL1ltMHRsVDl3MUZEbDhXbFVHWXdFUUFKcDU5K2Vi?=
 =?utf-8?B?MzBUVGtsV09RRlcyMFBCSTRkYjk3OHAvbW90eGdXODZnNnNVbkpqUnpjajQz?=
 =?utf-8?B?NzVSM2twVGJPTHQ3b0UvalZwS21pYTFIeEIvQTFjb2lSa3I0eTJIYWtVbE9r?=
 =?utf-8?B?SHFVUnhqbVhKZC9wbUd2cGcvbjNOUFQ1SkxYSjVDTWR0QUxaUTQ5SXNER0VU?=
 =?utf-8?B?V1ViQm0rVlNkVFZBSy80WWc4b0VuNFdMdTV6cFJlL3dBbDlHVjQra25NM3pZ?=
 =?utf-8?B?MXVsT3FTSG9mTnBIbDQzbGRUekUxOEVlNGhoYVQ5U01wSHZQb053dnAvLzJW?=
 =?utf-8?B?RGY2MGNWSSsrbUNvUnZHK1M5MmFoQWo2dVpTSUNTZ1ovYXZtY3ltMWJRaXFl?=
 =?utf-8?B?NE9RbjRNay82empOL3dDQi9tTU84RWp1UkY2bkJUSVNOYXZHM2V4U1dqa3Az?=
 =?utf-8?B?eVQyM1BLUlRndE1pYmFNVGRMdExXNVlyNDliRTIrR1V2dmdhdUdFa3lFcWR5?=
 =?utf-8?B?VTJjL3FqNVQvdjlnSnRXQlZZRjVXb09lRDE0TVorQnk5S2xUQ2hCWVJic1FM?=
 =?utf-8?B?NVlwM0pDenRvbThRaU9BYmlhUlhRekxyZC9uYmxQRWxiTWJyb1BMUDhldWMv?=
 =?utf-8?B?d1dQRU13c2MyV0dScDhjazJNY292OXlNT2FKeUJUM1ovL1JJQ0UvN0JUandO?=
 =?utf-8?B?Nko5N0E4N0haWGN3MGhEbU10Vm9PNlhDMVc3NUdUVzVmcHcxVUpVSG1ldjli?=
 =?utf-8?B?ODBmWjdibWFlMkZEKy8vTHJuZXZ6ZmpOUzRFTTVTdjZDNEV5cWJhVzI1aEJj?=
 =?utf-8?B?N0hoT01jM1Nwa0I1L2pJWG5rTmh1QmQ3b1IrMlpzOWpDVVUzY0FaNmM5SU52?=
 =?utf-8?Q?xJ2L4dLo9mbxX1k6EACBnjbHH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b374be15-6402-4a26-60e1-08de3389dc88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 23:07:13.9392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TC+ayBQMDjdmYZAdKVbZrGsMPLwQ8hCJe5IAEq3r3LECkNUXTGWTsApTEtkBGUm1wyLWsVys6XTnuRO77HZJGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170
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

This series is Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/3/25 02:43, Sowmiya S wrote:
> This series introduces validation for writeback functionality
> across newly supported formats specific to Intel platforms.
> existing functions with limited format support were retained
> for compatibility. After validating new formats introduced by
> the platform, additional format support was added to the
> writeback test suite. Subtests leveraging common framebuffer
> creation logic were consolidated and dynamic subtest generation
> was implemented to efficiently handle format-specific variations.
> Add negative test cases to validate format and mode.Refactored
> existing test cases to improve efficiency.
> 
> Sowmiya S (6):
>    tests/kms_writeback: Add support for intel-specific formats
>    lib/igt_fb: Validate supported formats for crc calculation
>    tests/kms_writeback: Add intel specific check
>    tests/kms_writeback: Refactor format handling in commit_and_dump_fb
>    tests/kms_writeback: Refactor writeback-fb-id subtest
>    tests/kms_writeback: Refactor writeback-check-output subtest
> 
>   lib/igt_fb.c          |   6 +-
>   tests/kms_writeback.c | 215 +++++++++++++++++++++++-------------------
>   2 files changed, 124 insertions(+), 97 deletions(-)
> 

