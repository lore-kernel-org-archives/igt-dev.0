Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D6FC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C0A10E117;
	Thu, 10 Jul 2025 19:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X61srli1";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215F210E117
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0IMg1Uqq2rrfUsS/bM+TEp2mTQh1NUQszfB9mfsqnOZPF9yTG5A6IpK1B7Xw0srDJ6lsaHKCmmQ1G2e0sUYJuw4cvawE42nAldQUwWLIETIykN61jb8na7+3BvTz7GvnaSqKLb8VfbLed/mS1+Nb4eaxGzaplYZWDCQSEXWYL0YV5Bz6Vw049rivltEcGq2U1wXzZrRO1dqumHc90Wbwwxc7tvy1MynkTv8xXfwxHqeCPHQ3tABkLs2yJrVsBLPlXeNjbCNlrlXoyjdXeFMPcUKKdMlFiL9MyZTDAS/dgV5DMi+Jqbq+aavI5FmJqHS7f56yEJ4ossalSSbI7x+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfIZ95PQrJhnbSNOvJe3NFf6iYCa4iO+fZFNlvdj234=;
 b=hW8odSCeA14gXrDnJo8kT8KAIQimhWAGL7Jd+mtRbL6hj69MHnVnJpy562JX8ZDxwPTNkalHmne3N3IjS9o8qpenC90xoSPxWMUKdFAdhYs3olL4yxlR7n/V7/nhOwBlVFjL7hsaqUrE0SI5mJnN4R6X0uTZKSBP2qVWxR6rhqDqn68ec9X3P/yiuKbVKGU1eP20cZMxZ2S5oObmctFG+AAOsyJMS+TT/TjkPHfKptxUalZ4gKFbmfG19Nr1I+4mMS3ZEoyjuTcQjtvFisf7skOIj3VXokOC76LMrOht9A5GLhKCByPLjAA4J/gy9xdJPbRhhkREHDsxGowwPXWhaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfIZ95PQrJhnbSNOvJe3NFf6iYCa4iO+fZFNlvdj234=;
 b=X61srli1Xa3DXilcEZ6fAbR+vdST+tr1r8Ui/vRfLPQyMsSXjA4OmitDAzZWJoCKaNJ3gevhVtx1ukxGQWXoVeAVSrzhIYvGoXb3V2YrkUEutEGo6i8orUD+rQvtg9g4bHY47KjlUVWKpW7L2cjO6eHl1AeatSTp7d6TOYDiYS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 10 Jul
 2025 19:17:24 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 19:17:18 +0000
Message-ID: <bbe68bc8-f89a-4798-8d67-ab973ba04a93@amd.com>
Date: Thu, 10 Jul 2025 15:17:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/amdgpu: Add test coverage for all
 user-mode queues across IP blocks
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250708074819.624367-1-Jesse.Zhang@amd.com>
 <20250708074819.624367-3-Jesse.Zhang@amd.com>
 <85tt3kk2o3.wl-ashutosh.dixit@intel.com>
 <3263d175-1f98-41ac-a46a-f446f54ba0e7@amd.com>
 <20250710161707.jzkbcgkinoqk32eu@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250710161707.jzkbcgkinoqk32eu@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::20) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b156666-210f-4d24-4959-08ddbfe66321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2VRYnVKUEU4WE5MekRTdUwyS05GOUNNMStTZ0xEWURFZHpHMjBiQmxIVTI1?=
 =?utf-8?B?dDlERUd1b3BzamJqRUxaMHIxUWVneGxvM2lHSVVZUGVOME9PK2RxLzFpWGEy?=
 =?utf-8?B?ZjhFeWxiOEltV0JCWDluRXVVK2RLZ2JQYXBTOFBSMDhsWmFncjA0RnlWb1l4?=
 =?utf-8?B?VEE4ZUZRTDMvR08wMHdqeUpSelQ3ZzZQRWlxTEFRdnB6LzBZVkMyS2Q5OEcy?=
 =?utf-8?B?K0Rvd0FpcFdoTnZxSFBnZzFxczQ1Q0gzc2xleGJkMGVDc3ZzZzc0TEdKV05w?=
 =?utf-8?B?ZU1jdFpaeTVWOUtkcUJNUFkwSXZ6VWRibHNhbmlPTzFMbEUxcVRxVjVZbGhC?=
 =?utf-8?B?R2VFV0VKSyt6M3phZWtzMHhWT25iQ0dUcDlaeDJJSXUyVC9xSWJuTHNiNlZl?=
 =?utf-8?B?cFFpWnZwaEhZSlpleklWcXRGUjFTR1M5UUN1SHFmQ0dra0Y2MjF2Yy9kaWcw?=
 =?utf-8?B?QytDYkdaY3ZkSDZGMjVUZjVkci9oOEgyZEQzSjJ3WVlsUFZ2akV1ekpTRW43?=
 =?utf-8?B?RStGaEkrOFMzbkx1K2NHbGs1dGR3NDQ0bzluSldodE1EZmdOaGVXM2k0YnE1?=
 =?utf-8?B?Rk42RGpDbFZqWVV4V2RMeGFvRHBzeGlnOUlRMFNEUHY1d1ZTUVdrLzNndGha?=
 =?utf-8?B?aHZRcFBLVWsyZndRUjBtYXJuMktlRFlmelZRUzhOejhxNUlqQm55WS9CRmpL?=
 =?utf-8?B?akdIcWMwUXJreHBsUlNrS3o4U2VxTTZ3S1l0dEFPaVVZZXF0NUdWbE4vVkdX?=
 =?utf-8?B?V2JSQWpycnkydERrbUtacE1SZHhWai94WjFMc2MyRWdEU1h4bkxrN2g3aDJa?=
 =?utf-8?B?S1RPKzdiWkRReUJDZzUrb283dk8xNU9mNi9kZW1GY0ZudDB1NWtxQTBaSXNH?=
 =?utf-8?B?OVBBV3BZZTFFZHdZVk1uc3NSWWpZa3ZLK2tCcUxnOFNFeFNFaHhXOU5UaDFx?=
 =?utf-8?B?eDh0S2o4bk5LQ2pGUWpvemh3QSs1N2Qxak9pTWZGYXhnVXl4dGh6L0lVWW54?=
 =?utf-8?B?MGJrbE5uMnZVcVhaRnlNV2NsekZ1R2E5MTNDeXVIcjVobXhWVy9KWEx6Smtu?=
 =?utf-8?B?OVYzcE5YTUVLL1pocUtZYkRvWkJSS0JKNjduaHdPU05IeUYwVy9rdzgxcXkx?=
 =?utf-8?B?RlRhdWF6L3kxeWJ0WkoxOU9JTmRIeEhBcSszRzlxSlh5ZXhwNVRqRDJxdG5M?=
 =?utf-8?B?R0orbjl1akRTOGZ4ZStLZGZkdlFvc3cyQ25nMkRycjFXY00vZ0xoRFJSMWh5?=
 =?utf-8?B?SUxJL2gwZlQva0Vza2xia3BucVJvZjc4YXpITUtDeENIdFo4cCt3bFRVUllj?=
 =?utf-8?B?ZERScEhxOWw5Q0dtSU1jNlJtYXRvZzRaTjdGYzE0RWp4cG9oNE5RUmJSSnZJ?=
 =?utf-8?B?UENibzRrdGs0ZDc0ZEVVMGIwaFR3UURIbStMK1pFQjhLdEZPNUZ3eHJ2akxv?=
 =?utf-8?B?c0ZxVmNHa0ZkemdheUxlWDQ4eExVcHhSdFMzNlRvSG5sMUNVbXlkOU1lMXVB?=
 =?utf-8?B?UVM4VEUyeEtyVkVEK0VFdFkxejU2TDU4UWU5VVdvVlpvbUZjOUJtbHhza2VK?=
 =?utf-8?B?cEFqQUVzaTRKbVBPZXJsN2ZHNDYxb25md1dkMzJpVU9ScEZvaU03U3B2Ui9Q?=
 =?utf-8?B?UnlKRXBJUDZ1VVZ5c1NHZjZIRjl1cDBHTllET29nbFdWcFUzSVFhNG5LOWpK?=
 =?utf-8?B?Y1ZHV29iU1NZSEkvMk55cWdjUEVMbUgvZm8xNTRSekJiQmcxMEs4NDNmWXRy?=
 =?utf-8?B?Y1hrR1czK2xlajhOMEJYYy9iUWdWTk4wWTdoaFVRc1o1SDFhNDF2QWtrMktw?=
 =?utf-8?B?WjRmRjZxN0Q5MUxDR1dCa25XaEtRTi9nMFhCR3pQa0F0V2pCUXE2Wnluc0hK?=
 =?utf-8?B?ZDUyL0ZrQVc1Zm9OZEdYTGZzSkx5YWtFNE9rL2NnRUREQnlsL3dvN29ncFk1?=
 =?utf-8?Q?fWHfqeuN2TU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXFsQ2ZLb1NGZi9CVnljdXg2RkF1WkpoOUFSMFl6WTd2Q1ZSaVFJeFd5ZWEr?=
 =?utf-8?B?amVmOEErTDdKcmRlSHRqZW9mQUpUb3B4R0h1RjAyUFppRUIzVnJCOWk4Y0xU?=
 =?utf-8?B?cDEyY1NKN2x6OEdpbUNrZkpEMzZzb3NtTm5YV3o3R1hlTDdnVXFOMW4vVWlD?=
 =?utf-8?B?RGIzMGdaQnNSOUlveWV2TDc4SXZiNUUrTDlOTnR1b0l3a2hCR3JyNjFuUWZp?=
 =?utf-8?B?bEZVU3VJVlNJaDlGRjJzQytmaEdUTUFXTlZHaEwzZWduRlZSM0hQMnVrczBr?=
 =?utf-8?B?cGw0YUV5RjNjYnRwNHEvaUdmQWY2OWMrVWtPQklSNEg5cGJvdS9UZ0tSMHli?=
 =?utf-8?B?ZjlwKzBNZ0JKK2szUWVpMzVhdUg0R2k5Tm14K2VxVmVSeG1SdHFUMjEyRXdk?=
 =?utf-8?B?WjdsL3haeTE0a3BuOExSVnpJZ0dHM1UyWUNWY3pDeng5N21ZMlB0QWpyOWc5?=
 =?utf-8?B?cHJFbVg0dkVLaHRFRlVKVGppTy9BaFRKdkpxbWFQcXRFckthODZUZVBScUdQ?=
 =?utf-8?B?Y1Q5bzZpRFk0WVBSRzlUMFMrUzhvNE9jZ3FGMEhCc2Vyc2xGQmJkQ0h6MHF0?=
 =?utf-8?B?S21KWkJ0bjl5TkhJN254ZTlKbFlIb3hRbW5oQm1OeXZBRFU5Ym12bHVVRi92?=
 =?utf-8?B?cko2V0hKZUFUUDlHWk15dnJGc09FSlZISUU5RTdlaG42UVNOMnVLM21hOVd4?=
 =?utf-8?B?Z0dGd3ltUDVlWWd5VnNSRllQYk0vdTg3YW1GSHVQTHJTR3lrQ3dkaU83cytG?=
 =?utf-8?B?RDl5N3A1UkJMRElxc1gzeUJZK09pZ1p1UFlFTStOTlhRVzR4aVVIejNkVEtq?=
 =?utf-8?B?ZzU1aDQ3ZmMzU09VcEl6UG8zK3Rac0NpdHpZS091TmVsai9FSS9LVVM1a2FF?=
 =?utf-8?B?VGN1MWk3a2FJTWtKRzZBczN4UVlvNHc1ckk0cjdTNXJBcDVHeVR5SDBQdjR6?=
 =?utf-8?B?ZGN2TE43MVBVcUJIQmhrNXI0eEhSRzVwdXpuK0pIWW9uWnVpSzU4cVRTRko2?=
 =?utf-8?B?RHlkNGFZOXBHYUo4SCttamdldUhvRHkzTWVYdUFEcldqZmc4d0g4aDluR3d4?=
 =?utf-8?B?aTFaYUFZajViYnJBdTdDcUMya2c3WEk0dlFESzVtWmFWWitWaGVPeXZLRm1T?=
 =?utf-8?B?OStiK3g0NEEwb01aTkYxNVZJZkRXakFrb3Vta2FDNUpIZzZxbmhEU2FQQ1h3?=
 =?utf-8?B?YWZxT3VkK2cwMnppVUdIczI1QUp3ZEg3MkdHc0JMR3lsOForMHk1YTFjWFVZ?=
 =?utf-8?B?L2N1ejMvSzRzMDM2TVB5b0Iwa09rbTNSb0hJOWtGYXNTem52WktqSVBGM3Nw?=
 =?utf-8?B?R2J3RUhCdWllNEZheWtGOTFBOXpsTEYxVXBIS0hPeEplOUVIMkdkd3dDeHpN?=
 =?utf-8?B?bWUzWm5uSWNNV1ZSeXlaZlFrQ3FrbDZFbklDMGhsL2RwQ3pQNHF4YUFpbFNX?=
 =?utf-8?B?SksxV2tTLyt6czRCQUJta2EwWkI5elZrSyttNktlNG96Z3J4UkI0ZWJ6bHRG?=
 =?utf-8?B?eXFBTEtibkIrMlRQVVFxdldtaUJwcitoVWw2eXlCQSt5VnNRSmljSW85SGhT?=
 =?utf-8?B?Mko2UDJVR0czcUZ0bkFISjc0eHhYWmtaclozUmtOUHNFT25lYW9pSHZwaC85?=
 =?utf-8?B?QitCeFlZNG5qbWYxYlJNeENzejJNb0h6Q2dDWG83bHF6eFJKQllqOHZPU0N0?=
 =?utf-8?B?ZHVjRjl0WCtXZjZ1Z09LVWFjUWNpMXBjdHV2cnVNZU1sUEJTcExRRFAxazZn?=
 =?utf-8?B?aG1qdmxBZ2FKODlkRVhiZlhpNXpvaVBod2x2d0ZiODhTZC81RlNZeGRraGw5?=
 =?utf-8?B?bVlsRHdpOGtYbjJ5UmZYM1ZEdjE0YUowMVRoQUR0eHNSZU4xVDh5WkxpZGVx?=
 =?utf-8?B?OWxDREY3Z3dmdHFXNU5DcG9EazIzY3I0YjBHSERjVEdUVC9PZTNxMnJSVEsz?=
 =?utf-8?B?dDhkK05pTVQ2dVEyMmNQMTRpNXdoWkpvUGNzZjlTMlNFTEYxd01SR1pxeHZ2?=
 =?utf-8?B?KytxanZsRE96bmx0ZFhjb25WTlVySjBNK2RwL1d0UGlJR3JocEZLNlNNZHlx?=
 =?utf-8?B?ZnZaZCt6eE9Fc2g1OXdYUW5RYWpkYm9mSkpndmp1NExySS9SVUd1M21sNW5U?=
 =?utf-8?Q?Sb+E77VURI/BkhYmgaI41+xG9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b156666-210f-4d24-4959-08ddbfe66321
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 19:17:18.5217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0QAgYHGvTMQNbXofJmRScelD3XRo2UE7W3Nwwkjow2HeE24pc+ErCLmHotxVqyj0r8ZAp1PhKYsIk9Uv/JvrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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


On 2025-07-10 12:17, Kamil Konieczny wrote:
> Hi Vitaly,
> On 2025-07-10 at 07:23:52 -0400, vitaly prosyak wrote:
>> On 2025-07-10 01:58, Dixit, Ashutosh wrote:
>>> On Tue, 08 Jul 2025 00:47:49 -0700, Jesse.Zhang wrote:
>>>> Introduced a new test function, amdgpu_test_all_queues(), to validate
>>>> write-linear command submission across all available IP blocks (GFX, Compute, SDMA)
>>>> with user-mode queues (UMQ).
>>>>
>>>> - Adds a dynamic subtest "all-queues-test-with-UMQ" under amdgpu_basic to ensure
>>>>   all supported IP queues are exercised individually and in combination.
>>>> - Uses the newly added helper amdgpu_command_submission_write_linear_helper2() to
>>>>   manage setup, execution, and teardown across multiple IP types.
>>>>
>>>> This improves test coverage for command submission paths involving user queues
>>>> and multi-IP coordination.
>>>>
>>>> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
>>>> ---
>>>>  tests/amdgpu/amd_basic.c | 18 ++++++++++++++++++
>>>>  1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>>>> index 8c6b466ce..100a634ce 100644
>>>> --- a/tests/amdgpu/amd_basic.c
>>>> +++ b/tests/amdgpu/amd_basic.c
>>>> @@ -139,6 +139,14 @@ static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool use
>>>> 	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
>>>>  }
>>>>
>>>> +static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
>>>> +{
>>>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX, false, user_queue);
>>>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_COMPUTE, false, user_queue);
>>>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_DMA, false, user_queue);
>>>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX |AMDGPU_HW_IP_COMPUTE |
>>>> +							AMDGPU_HW_IP_DMA, false, user_queue);
>>>> +}
>>>>  /**
>>>>   * SEMAPHORE
>>>>   * @param device
>>>> @@ -830,6 +838,16 @@ igt_main
>>>> 			amdgpu_command_submission_sdma(device, true);
>>>> 		}
>>>> 	}
>>>> +
>>>> +	igt_describe("Check-all-user-queues-for-write-operation");
>>>> +	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
>>>> +		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
>>>> +				userq_arr_cap[AMD_IP_COMPUTE] &&
>>>> +				userq_arr_cap[AMD_IP_DMA]) {
>>>> +			igt_dynamic_f("all-queues-with-umq")
>>>> +			amdgpu_test_all_queues(device, true);
>>> Please clean up this warning without AMDGPU_USERQ_ENABLED:
>>>
>>> 636/1531] Compiling C object tests/amdgpu/amd_basic.p/amd_basic.c.o
>>> ../tests/amdgpu/amd_basic.c:142:13: warning: ‘amdgpu_test_all_queues’ defined but not used [-Wunused-function]
>>>   142 | static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
>>>       |             ^~~~~~~~~~~~~~~~~~~~~~
>>> [1526/1529] Generating docs/testplan/intel-ci-tests with a custom command
>> Thank you very much for the email. I’ll proceed with another patch today, as this one has already been merged.
>>
>> Vitaly
> I already proposed one but feel free to do it your way,
> any solution is good.
Hi Kamil

Your solution looks excellent to me—thanks a lot! I've replied to your patch as well

Vitaly

> Regards,
> Kamil
>
>>>
>>>> +		}
>>>> +	}
>>>>  #endif
>>>>
>>>> 	igt_fixture {
>>>> --
>>>> 2.49.0
>>>>
