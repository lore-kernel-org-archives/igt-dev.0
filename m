Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6D3C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 17:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E1610E86E;
	Wed, 19 Feb 2025 17:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SPXrLghi";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8325810E86E
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 17:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBrbjmYKq93yt896dYI1w8XPM/GQipmAV29dhoB9LcJopJyclVnM22bycp7SQK0XX11BPRjAu5efBM3IeX2KHTEnDy0EthAZgbEoyjWcn/3ctFNPZSxj1bVIi6CHEQ/sSSph7Uhg3FdCGYXcubmT1cLVDnOrx83Z4l19ciQdY3Ia1m+PhgVUax+AKhBXQODG6VvOLE4R9B7G6ST+lJdn7wE9liCeV1hiM0CKyReG5o4jSYf5jnjMqVojUPkivnFlF1D82KQ5i5Q3apmqGmcvV1XctiJnuVt59TMI//Y2UoZIFtlhHGaRDwhAvVkssw5yRnb2npSF1RE4+VxpC/heUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mih+RBtZtLLAwKaoiFMDP62D34GpMUbeypr7dbnftFc=;
 b=ODT43+HkCoxSHIsbfCwCMEtFAkGpfVk/xii0dFZCZmJkOAQ7RrRRoLt4Gd/SoNNiVVGIjwhoGsgQN1DeH+IFt3+sv2gU8IvL43r+sU+6/S3etlk6xlpw4BRVnt1we9BMsg00OtllK6Y0YQ7i8jvbhPj4YDPSLJVfEsHn02IflGjUHu+zyCSOwNqfzM1Fj/L6AKIkJRWPEX9iZKYnksFrXV2SrAxWitEv4ImPM93iUsm6Na8SD4PJyVI1ybsiO6MNXrB6Ej1UfWBftGGouH5Lf0VGKnITGChcXl7AKL43SwzhjnvnlrKqWPQxCJo8SicH5/QR/s3jI+mwoEo4sysVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mih+RBtZtLLAwKaoiFMDP62D34GpMUbeypr7dbnftFc=;
 b=SPXrLghi9DIgUMV+TGNbELr5uhNV5TayGhqRJCKXm7KuYIY+Ck2RKgVVYYOkXHKepE2shb1WWheVTrqbxJk4wndIiX3QjRG3xehItsTJ4EjmAP9zZUAhIttkRx6KmQ195O1toinXKilpp1CnLTr/niaC2X9Q3EYIo2P711k2IcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 17:50:54 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 17:50:52 +0000
Message-ID: <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
Date: Wed, 19 Feb 2025 12:50:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::44) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 301ba0da-e606-44c5-1173-08dd510df3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEJtekc4cThURnRhSk13M3BRT2tieEgycXJWME9NeEFnNUZTdkdWQmllWEFM?=
 =?utf-8?B?QU5vdG5ETExYNytJQzRrVmJYRmNDYXVoWjZjTk53amRNSUdNUVhHbXNEd2F1?=
 =?utf-8?B?R2loVEFxcW9GQzFSWEdmMWZYd29VREkzMkJ2dXU3bTlaSlp3NW0yb3lJbE1p?=
 =?utf-8?B?WlFpK1BGNEJKSE5lMXhFREFsTENrakNxVHVtNGJVcUdldUh3aGVSTFJtWnBB?=
 =?utf-8?B?Q29yTUYxTy9od0s3SjdseE8wb2FjNitKWGZFRzhENm83cFpzeldIK25Cb1Nn?=
 =?utf-8?B?NzIxYStMcUh0ZXArMWN5TDBXVHFEa1oza2U1b0pDRzFWWE52ZXM2TmNRd2R2?=
 =?utf-8?B?emJWWjZEd1FkUnpab3ZvYmlFU0tUUnhPSHA0VEYwYTRHLzFLMDBIblRPNnZ4?=
 =?utf-8?B?Mjh0WlFmbFZhdFFXNWZqUXA1aXJ3TWNTV3BjYThsYnNqMlFuVFFvc1pWWTFY?=
 =?utf-8?B?eHB0TlNPY3JVaHg1WDlyN053Uy9RRUpIMGhjMjJSTnBKY2dOeUx0NTBtVXZl?=
 =?utf-8?B?blVvYkM2ZUlHT1ZLbmo2ZDFVWktRRFNNR1hrRGs2Nlh0eDUremNpdDFJVlA1?=
 =?utf-8?B?dVN2REtXL2ZaTDhZVzA3QzU4K0ZEVVpCMzYzOFFEK1VGQ0JyancvNEVLa045?=
 =?utf-8?B?NUZGemJVRzBtb0lVaEZMN3lWNk1WeDV0NVBpRGl2US9HWFJ1UUJRb3hmQUpw?=
 =?utf-8?B?OGxhVW1iK3p5MjlCSVRVUE1jd1BzdkZjREJ6WFBDZlQyaEtFN3JLZE9EL254?=
 =?utf-8?B?MFA2K25CR1RKak1TSEVtYjVTVGZwVExvZHVpbzZzUzRRa1ZhNDdNdlR5UTN0?=
 =?utf-8?B?TWJJRnJuTlk5SVB3Vmt5OHNmWTRPQ2ZVcGNuZUN5VWZXRmd6dGhsM055VzNt?=
 =?utf-8?B?cUx2QzFZZ3FkNDN3UmFuaXNBMTZ4NnZhL1V2Z3Zkd2tKeitnRWFxN01LWVpP?=
 =?utf-8?B?OHRtWGhQMm5WaTAvbnpJRGxSdmkvc1FqTmp3YW1abS9OeGVXYkM4RFJBQjYy?=
 =?utf-8?B?aUN3ZnlVYXZnUEU4OXNNS25kL1RSNE9nbEtBb3VFMElsWUEyWWQxbGFpaUJR?=
 =?utf-8?B?UVM5ejZ6dEFHd2RhSlpzaEFmMGFBZjRHTWZyYzhzTTNKMVRZZzhPRjJiZS9Q?=
 =?utf-8?B?ZCtLSUVZRzJIcVBTN0FSTkZieXgraklHK0VTUDFJZlVBQ24xNGlRR25JZTM0?=
 =?utf-8?B?QVhZRk9DY0Faa3ZmSnI1QjRwM09mTDUySTQyRGs3UWJvSXg1R0R2MnFYUHdK?=
 =?utf-8?B?dVFTc3liUWwxOUs2czZsM3EvbHUycXovanA4U0FsU3doZEtMVUxJYnU0cEdM?=
 =?utf-8?B?U05VM2xGekhFQ21RekViV0FhWHpBaDhBbm9Nc2tSbGVPL0VUMUJsTWI0d3lv?=
 =?utf-8?B?Uy84Q0poeG53Vkp1Y1ZtTjhQNVBHSVNwMVVyeHhqNnZVVEVhNXNsQ3BjTzB1?=
 =?utf-8?B?YlVFTEVSVGUxL2xZMisxRlNFQVpxN29XRjdjOEJqUm9Cb2tnZFd0NU53VDRF?=
 =?utf-8?B?MFNMdnE3c1gwN0t4Lzl5bFV0QUJiU0Q4N01UMGRhQ0NnQ2dRTFVEakkrOURr?=
 =?utf-8?B?bTIxNkxDcEl3eTNJU2wwTWxYeEptVlBtRXVpR0Nsb05LRjN2MzVpVzdEamc1?=
 =?utf-8?B?Z0F4YjVkemNQbEdEbkNoaU10MkxaSXlEdXk3akJKVGh6eVdWTXJObDNBVjNF?=
 =?utf-8?B?RjNsdm1ielpzWmZXSWN4ZCtoK2lDRk9TYnJLQjh4bjBxajE5SEMwRzRwU05r?=
 =?utf-8?B?K3Y0eHJBMjJoa3pMMzN0Tkp6TCtGaDVYNU9IdndGQmVRdmhFdjBjZUFJY1VZ?=
 =?utf-8?B?aWRueWNsQWxxMHNEV2FWcmtDbEtGQWpOWTUzV09RWE1yVlExbVRuRHdFbytD?=
 =?utf-8?Q?k9N+ELLvdLzQh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZEYlJOWWljdThiUVZkR0NXcUdyQmZUdXo3NERCWkt0QlNXbDlnMXl0bkp3?=
 =?utf-8?B?c1lhK3lRVEhheUdTWnJUTzl3RHUvWkNmbjVwRXBDR2czaEZrNnJSOXdzWXdv?=
 =?utf-8?B?NUgrMXB5TDZBblJTRWlwcVhBdjZrYW1rRElIa2dFalQ1RlBLWkh5L05jZ01E?=
 =?utf-8?B?ck8zWVhGY091d3JvZDhGRE45aWhDRU1INmxUMEZkM2pzVVNhcGM2aExxcTVL?=
 =?utf-8?B?Y1dNbXhDK0ZkZTBBMFJaaE02OFl5ajBtMndQU2dLdmVjL3VaV2JmcmxYbGkz?=
 =?utf-8?B?VWI0OUlaN0hGam1wNFpuR3RCcGZJcnlyYWo0RVd1SCtSdERBSytoWW1Ea29a?=
 =?utf-8?B?TnB2MThXUFJnaHFVR2k3NGQzQ00vVjB6OXNBRVZiS0JoKzlkU2xrd1ZyRXox?=
 =?utf-8?B?OEhZVmN2ZHpSM0JPakd0VnY4SW1sVWhBK0hqZ0g5Q2Vsa1NjdUdLWGFxQlcr?=
 =?utf-8?B?QU5Mek84dXE2QnlJdEYrWXQvV2VjYXMyWUhwWEpLaHpWZzhISTRQdFdTdXpZ?=
 =?utf-8?B?WjA4VmZIL1prRnhhVHRTOWV2dE4vcVlmWnZIYWtiT1VsVTZWQWx3VGFPbWtw?=
 =?utf-8?B?aytsNDNmTTRVeTJKQlNQWVBPdHNudWs0RjlVS3hqa2xxa3hzZ0U2V3hpRUZn?=
 =?utf-8?B?d3V1ZUxSaHEwdDBYUTdJYnN1Z1hKTEp0d3dmUjgvZGpyR3E2aGhsQU5YNTg2?=
 =?utf-8?B?UE5GTmQ0RzRkbTMyS1JkK0gvY1IvR0VPT1hrb2JaRGh1OFF4V1ZzViswckJU?=
 =?utf-8?B?NUVVMGlEcXF1d08yYkR3aWF4ZjFyeGVYY1ZWVzFBUWlWOU9IZTFnV1ZuV0Zi?=
 =?utf-8?B?RnV4VXN0dkNhMWt0bmM4VnpvZERlRSs3MEJvc3BWbi9HMU5oSVlsaSs1MFRQ?=
 =?utf-8?B?YXVCa1Y1bGY3UXZIakNhVmtFdzZBWmpuMUdEaUxRK3hYcnRwYi9PRXE5U2ww?=
 =?utf-8?B?djZEdlRnamVxUFkrNmhCTGg0Q0JQNmxLK09GRzl0ekZ2Skkwc1graVNxeTdk?=
 =?utf-8?B?NUw2YXF1aTlUZVRPdURuYXpwdGlOb0F1RUNKOHZoNm1wSUtBK3A3L1VxOHNq?=
 =?utf-8?B?VjhkS2RRN0ZZOFpmMERwVjVSWFBjRFFhOHBpQlhSQllDaWl1TmtwNTVRb3pp?=
 =?utf-8?B?MmlhUktCSHN2REpPYXFndWhwSTFKVGk5MkhDZ0ltY1RaNCtLNnhWYVc4eU9S?=
 =?utf-8?B?eGRHcDFyYXdRaHEvOTlER05WVVZPQjVkU21DQXhxZmREVkV2OE1heVRSdFFj?=
 =?utf-8?B?Ym5aV2x5YnJ4M0NGZks3ZGZkZlJXZ3NLRWNIWFNWdG9tZ1ZlSkhxakcvWjR6?=
 =?utf-8?B?S0dCalR4RHUwZXpoNUw0cFl5MWhrZHpBUFFTQytRRm5wZi8yc2Y5Z1dMcXVR?=
 =?utf-8?B?WGg5M0FqRW5oM3B2cG1PUjBZVzR5Q25jd2xZZU1UckRteVVYQmdDTlB3QWpv?=
 =?utf-8?B?RHRKYlBRUTVNd2Evb0wwYUZtZFdEUGJ2Kzc4OW9ycFFNcURySFgycGhYSFo2?=
 =?utf-8?B?SXFIQlVWOGFSWmtMZmRxVnQrYTRMMVJDUzVWREtmQlpERksxQ0lwQzVMSjR4?=
 =?utf-8?B?ZzVRNWpvZkJEMkkzQ0J5blRJdWRrNTJoZmgwTlpSaC9QekJpTkE4NUIvY3BX?=
 =?utf-8?B?V25qZFR3Q0l5Wm9aT1B1Mmw5NitNeHhZVjd2bE95T3BoNTBEVGlSQ0FUcGVi?=
 =?utf-8?B?R1ZzQ1ErUE5WaXFhWDIyQUpud3hKNjA4Yk5jNFM1WThjN1RZbWRTTkJ0VXcw?=
 =?utf-8?B?d3ZTTzdtZC83c0dCd3lKbFhtUDVqLzREZnlXZDVnMENlREhuSWZRTlN1WlJT?=
 =?utf-8?B?bUJtc25UN2QvVlV4S01ja0Y4MlgxczN5R2dMbjBxWXRjNC9LeldYYUFlcjIr?=
 =?utf-8?B?Z1FWN0tuQUhxTi9VRk5zczBhRG85UEJ1MHQ0cnhyb25CRmVkVWNWVURTWjdC?=
 =?utf-8?B?NVZHYnlaenZ1VjVtaXRCSVAwWXpMdHQ0NWg5czc5K1oxWGo0dUdIWElFOUdt?=
 =?utf-8?B?aW5QTkxHSlFwOHBiOTdKaDJmbWNnczhGcWQ0TFRZUlV4TWtkZDZDeE1lY1gw?=
 =?utf-8?B?Zld2U2lqRW0yRUk2ekErRTJtdEZGQ1Q2a0xVTHR3TFpqR2JKSXMrMDdvRTlx?=
 =?utf-8?Q?dEZu1xbb5RggrQ+BCQjY0nro7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301ba0da-e606-44c5-1173-08dd510df3e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 17:50:52.7542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObaBiU8FIH1Rx+MujI4GmbfmKRrnpEOVCOERu2QlhH/9S7wf7a+Ph8AYl3eKOwWJDFgzxylMrhRV2RRlw6Y7YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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

Hi Kamil,

Thanks for raising this question. Currently, only a single test uses the memleak feature. However, we are planning to add more. This effort requires careful selection, as we want to avoid unnecessary overhead or burden. Enabling the memleak configuration significantly slows down test execution—potentially increasing the duration by 2-3 times.

Additionally, we aim to reach internal consensus on which tests should have this feature enabled. We also want to avoid enabling both KASAN and memleak simultaneously. These considerations are the reason for the delay.

Thanks for your understanding!

Vitaly

On 2025-02-19 05:41, Kamil Konieczny wrote:
> Hi Vitaly,
> On 2025-02-18 at 06:43:41 -0500, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> refactor memory leak functions and add
>> them to the library for reuse across different tests.
>>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alexander Deucher <alexander.deucher@amd.com>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  lib/amdgpu/amd_mem_leak.c   | 112 ++++++++++++++++++++++++++++++++++++
>>  lib/amdgpu/amd_mem_leak.h   |  17 ++++++
>>  lib/meson.build             |   1 +
>>  tests/amdgpu/amd_mem_leak.c |  88 ++--------------------------
>>
> [...cut...]
>
> Why moving to library when there is only one user?
>
> Regards,
> Kamil
>
