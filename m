Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D0C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 16:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B98910E519;
	Tue, 27 May 2025 16:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DNHCvMd7";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126110E138
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 16:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8gooMMvKJHJflXG81/VbUF7gapKDefBQ7nuS/G9AEO8DyKcgojRKwOqH14KHQM+cpbqqXSFbzTmW/At+KQO7CJfSwDaeLH5XR7yQwUkidDKGQBf417wixhsGBpNMI8OqfCHNarJps27NFJk1+33xShPLmfUzFXST1h6rMPJZeiuz+3XpzD6VEOv+WBceRJxMsn/+O5XWMPkH9AYzSVpzHRY6GTWwFm/lp2Zlz/5Kqu5adBeBiyuwx+N7pcn6or4Dc3tQavyYbT0/5I8CJL3v7rh1p9JqShxMm4bksS9XqmAzE6w2vCrCoDuMTnEjBEaClkiwneZhew0T2XcaK1qdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hXcTfL0vUHErojE9n1g9ZjKkqEYJHUE1a3S11z9IKo=;
 b=Vj0mxQDvte4paznFRTpPgd9/Zyv+BEr2/H3EKQZAuh2g2qNgio8XjYdiVhs5mwEQZ1WG6rC3pr4Jv4p1FvCk8gZcmxqUJIo8+Djnu1y9W+xtPGznxQAxGGyjozfCsQo8T1EQaCxSUgVvDdqV3SxMA1mXCrMq4p8py0KEJKmbvRAyXlKWgG6k0Ps+OwLFXuWNvZYotFr4lhTpfq2zmHwG/DzAJ2d3yxjr5SPX6IXBbtCbDI5NQnKHVpVKsvYS+U3kpcc1Lvc5HT/H3jgV/3rv1SOk7xKg4kBVfmvaJn741H5pznn+twLVfqd5QSExtLeX5DvhHtTOqLgCKPBPvNS3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hXcTfL0vUHErojE9n1g9ZjKkqEYJHUE1a3S11z9IKo=;
 b=DNHCvMd7+mfm+jho0a5apPj7PJC2wykKS2gYEfanoPAtjqMrTGJ0lfOT+RrjusvB6yrP8KTcVDD7QytnDAlY93fA0SPAH2pF8V9EeEWQOF4NzsdU9WNzfC57IOt2VTF3Re+uXxC3GfeUiUdsT8alUdriY9ty+zgXr3cvcmTHdA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 16:28:25 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 16:28:24 +0000
Message-ID: <67151c33-0ec0-4d31-b8ce-aebc1f65e2ab@amd.com>
Date: Tue, 27 May 2025 12:28:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/9] tests/amdgpu: fixup print formatting for
 files in tests
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
 <20250527120421.79026-3-jan.sokolowski@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250527120421.79026-3-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::23) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad4ca93-9598-48bb-ec69-08dd9d3b8099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTFZdmxLSnFDeURqSnVzWEZVbko1ZUM5ZEROR0ZoeU5aUDRBTytlKzVFSlQx?=
 =?utf-8?B?L1o2V1d1WGlkVXkydEpNNEhMUFRNQXp4SXNubWVxTXJ5STVDUTd5VFAxSEVh?=
 =?utf-8?B?L0xaSm5ZcEJ5dGNZdm03OFM1RnN2azlTRlFKdyt1YmdYZytSSjVvaEFjTXNp?=
 =?utf-8?B?RkJaaktRTDdDdlRlb29vQlZFd3RteDJTa2lIUWp5c3Bsc1c0aW55YkRRbFZC?=
 =?utf-8?B?SFBDayt5bE9JUDdmR1JnZ28vVVY4eE5uMDd6ZXUrM21TK2x5VDRPekV6d0p5?=
 =?utf-8?B?dDlaQXhYYmZUelpXNlNsTkFYdSttcCsvZVE0bjJTMnFVSWRxK3NQYTQyYTIx?=
 =?utf-8?B?TkZMaXN0OVNBK2djOUZoeXNHa3ZUWlpFOUxCYXdhbndPUDVLSXB6ZzZQR3RH?=
 =?utf-8?B?cmRaRmFwU3Q5aVRFUlJwMWJpcGR0S1RzZEg2RHV3MUV1TVExQVFCMnRaTzM3?=
 =?utf-8?B?dUFPVmthU1BIUk91czdGM2pEcjMraGliVEtBZnZoSWJ1WHFvL0FoZGwyVTlp?=
 =?utf-8?B?WUNNd29KNC9iakV0UE16WHAvWm1PRDU2RTA4eEZHRXNtY0JxbDFYZmZaQks1?=
 =?utf-8?B?blJZWXNxN2oycVAzbWlKc0NqVWxZaFVLdVZsREhIM0RRY21hbjBUZjMxOEFm?=
 =?utf-8?B?dG12UXlBMWJKMDRVZHF3cmY4N3NxckNxMi8xL0VRZjRQbi9OWVRXMmJUbHAw?=
 =?utf-8?B?YUV2VkNpdmRRcTV3dzJtTS9mOXlFZTJvVm5RZ2NLd29Kb0xMajVwK05YTFBX?=
 =?utf-8?B?ZHJkUWxNMEFNUmJvUFJRdERFUWtLYnZpZ25rZlA4R0xvQU41bUMvUDZXa0Vj?=
 =?utf-8?B?QWxyeDNpUnZ5cUpoN21aa0Z5RTJhODN3S3FzcVVTb3k5NkRsUXRETk9GSHVQ?=
 =?utf-8?B?aGRZUCtIa2p2WlEwRXFNeWY1UFVvQUMvZnJQUVdMb1B6d0lXQzhJOUZsVUtW?=
 =?utf-8?B?MkRPUlRhbG9vMTl1K1N6em1JY2pEYkZnVEQ1Z0FCM0hFaUh6ZWVRMFhpZ1Mw?=
 =?utf-8?B?UVpEUmlCbHdPZ3NoSEhsTm5XUWFhVVRNczE4cERGaGJ0WVNkZEtROGJrMU1X?=
 =?utf-8?B?bmtHVlJqclhEQTZwSnhzNGxBbWE2elUyVkR2cEZEZmd2VkVIRVhBcyt4aVlY?=
 =?utf-8?B?dFRVS2RzSEZsaExQZytvaUQxeEs5V2FSbW9Sam1OY0lNMk10L3RhRmIzWXdt?=
 =?utf-8?B?L1B2eUFCL1hyZUlxWktiK21xdDhPN3lLZGxDZVdHMm8rbWJYL3JKVXAxWllh?=
 =?utf-8?B?eXhoVTBoMkdEOFM4YUtYYVE0NHlZRXRtY0RLaGVyRzcyK0Rld1RTR21qanBH?=
 =?utf-8?B?SzZHcDNFTE5UcTlSS0w4UkpZQjMvVVVnZmpLbkdCK2lpL3V2V05jNDQ3MG1q?=
 =?utf-8?B?Sms5TlNrSWUrTE03djNnQW1wQ05iUmJtcWl0UTE3OStRSEIvaG1BLzcyWFVk?=
 =?utf-8?B?eVJiTWo1TkQwb0Q2bERkN0pPalptbngxenhHV012Q2d6djd2OE5RRTUyVFMr?=
 =?utf-8?B?UGpBTncrVDJVaVJaeEJCeWYwWGdtYU5Wem40NTdMU0hINGlQYjhZNVFZWXVC?=
 =?utf-8?B?SEhSODBneDBobkNXTzdkTzFDWlJvYndXZ2xxLy9aUFhOSi9HTlp6Mjl4WGZY?=
 =?utf-8?B?blF3eWRrUVVXRmdBS1hHV3ZMb1l4N0tsZzJ2YXlJWEFLMzczcDZuKzZUTzRQ?=
 =?utf-8?B?bVhLVXorbm1OeW5JbHlFVGNFQTZ3VUhwVVY4ekQ1UEVSbVdpcllOU3d3b0lB?=
 =?utf-8?B?dmxsUmFIUWdjRUJ1eVNLTDVTRjZGSzBSNG56blFncUJxeFZpSlo0S2JhQW5D?=
 =?utf-8?B?MzJzeHU2VlZyZ3dnWW1Hd09oQUpwamdpdkpKVmswSEljeFZHa2ozc2d6dHE1?=
 =?utf-8?B?bmU2Yk5yN3BCU0w3N2N2TmZYa3VHdExub2F5cWVLUzBVVTFJOE9QazRTWHJL?=
 =?utf-8?Q?0dvOtE9ydfw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0Uvb1U4NU5BZzVqNms0V3ZST2NnTDFLYUJFMTAra3hmTU03VHpmU2ZzdDJa?=
 =?utf-8?B?UHJzU1V4Q2hxeDg1QWM5OVh2VmUvdjZ5M295QXRia0hlUjc1SzlvbzE4THBn?=
 =?utf-8?B?M1QrWTYrNXpJUEkySmg3OWJyNWJqRHZKTzI5c013WnZRYm5IVTd1bjBMdDQ0?=
 =?utf-8?B?b2pBTXVwWTVsZnNtRWRhZnZZVVNVWTNNamVPV0FML3NUUFdUcmRQOFZWRExL?=
 =?utf-8?B?V285NytPQnhvSU9TREIrc3hVN1VEYzlIZlZKVElUUzQ1Uk90Zmxqbm5qbWt5?=
 =?utf-8?B?ZGR3Q0tGUktvOFNhSmdkZGdnUVZ2bXo0NXFHRzBibXdPZTkyVUhzbWh5SVFY?=
 =?utf-8?B?WitPSitud2NFU2paNk1HK0MrQ21MYUkvQ3RMUmFTRXZ2NnRsUG9nV0lhaFVZ?=
 =?utf-8?B?ZHEwZHNrdzdTS0FrQzlHaTg0YnN0S2ttNFE5NmFJS2pGV0lCVVFGTFR4OWIz?=
 =?utf-8?B?QTNXcE5RL1Mzemh4c2l1UzBmOUx4eFZ3SkRNK21RanZKdnF0amlBVGdXUWRj?=
 =?utf-8?B?NFQ1M1pieHNpYzQ2akc0Zk5uL2VIeDBJbXRDdGxXeHhtUExyTkpHY0dwbENY?=
 =?utf-8?B?YTVZREFLVmpOcVRTd21hejlzNnp1aVRKTXpWblhmU20zUGQ0VkMyc0pZZUZY?=
 =?utf-8?B?b2xmaUZGc2FqbDlDU3dwMjlZK1FDd0xVYzNTOU54TnBBaUpTUzJkU1E3UGdS?=
 =?utf-8?B?N3BMdXp3L1NNMjJSNVBqbS9iS0JCVWxyUXVuU290V3lESkMxV3RpQWlST2Nj?=
 =?utf-8?B?d0U1Qy9hdm9SQXRoVFcyMS84WmFPZ3VlbFNTQ3hmRm9hM0t3YmsvbzhTbGdn?=
 =?utf-8?B?RXRkY0ZOSG5oVTQ5NTUvUDZaV3gzdDJ3QnN1VnI2NEEzWVZjbWZ2RDJKWTJB?=
 =?utf-8?B?V1RhdXBPNDdEWVp0ejlwMlhLQkhFKzNZZXBrZ0svV3VzUFE3ZTdqTStyc2Rt?=
 =?utf-8?B?bXBGb0VhaGFBdDZ6SXJKcElxOWZ5N0dJY000Z3V3RWFiTVRWWHJMby8zYkZo?=
 =?utf-8?B?R0pNUW5YZS9yV2FQWCtmZUtjaFBzSGM1aWlYeW4wQVJGeWkrZzBKR3YwNnpJ?=
 =?utf-8?B?RGNneFhYS0hPNjY0M0MrbzFvM0t4elBRNnpHUjBpNnFnQyt0bGdBUEVQcFdo?=
 =?utf-8?B?OE83VlgwTjIrVHA1UXhOUTcxaHdSMExXYUt3RjBpUUN3aHVWeFpzWFd6TEI5?=
 =?utf-8?B?YWJZcURycXkrNFU5L3lWWGFpMnRZeXQyZkpOazFQaVRNdWFWNDZVMmFGMzc4?=
 =?utf-8?B?dTJRK1FDSEpicFV5QkhObXcyTXRnNUdJTUpISnpudVJNSkZ4Ym13QUg2TkJv?=
 =?utf-8?B?cVRWN29GY0JjVTNqdmhza2VQV3VhdlJQUVVyTUNpN1RhcEhJR2tFVTdxNWZm?=
 =?utf-8?B?bHgxQ0JFNTVxakhGV0lUVUQ0TXVSMkczSEdaL0VBZ0JYS1FYc0dadjR5K1pa?=
 =?utf-8?B?Vm5TZ3pwYjArU2VaWEVua2o2RVU3S0RORU1nTi95WFk0QU44STNVQjhYb3Bs?=
 =?utf-8?B?bkpScE5nNWpna2N3OER3UjlCTytjNG9rVWQ3R0JKV2JyOHNxY09YTXl4ZVFy?=
 =?utf-8?B?dXQrQUhvM0FhSGp3TWZ0MUVpeVlHV3pEeVhzMG5td1FKelQ2S0Q4dDZDZ0Zh?=
 =?utf-8?B?MzlMNTVzcSt2dHh6bVIvOUp3dTR0QXZqTjVmclJvZERuM2VVREo3YTdySEZ2?=
 =?utf-8?B?OW8weFlsSHdWZGhkYWtpOGJzei91dk9jc0lpQ0FaUVI5aXN3cTFmNzhWRjBr?=
 =?utf-8?B?Z3pDanVNTmdjeEZRVE5MYUtNYmVGVUpJcDJOUnh1QzFLWlRiSEE4MUpEWTBT?=
 =?utf-8?B?WmFieGhHTUpOZkRuZzRVT0xOR1N0TFJEc09meDE5M2hURFFpOUZjcU1OVjV4?=
 =?utf-8?B?UTkzWERXN0hzd3krN0NKVlMzUTlPRDV5aTZPLzJqMCttcVRLN1ZvcWttTVhv?=
 =?utf-8?B?QVE0ZlEwUlZEcWhqY2htRTZ3azNER1hCNkJ2eStydGtyWTlpRHcxT09QVFpr?=
 =?utf-8?B?c2NBZEVUTGQxY1d1UUkxVERxOTEwSGhnYVoxdTBBY21rRTB5eW5sMyt3MVFV?=
 =?utf-8?B?VjZXZ0h1YWJjU29wR0dOZDVLaGdmY3NoR2FDNUQveUxTUkVVdXcwZFRKYnZY?=
 =?utf-8?Q?0D917cZ2vfIo3dTJSz+mmm3Om?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad4ca93-9598-48bb-ec69-08dd9d3b8099
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:28:24.6040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWFbd/aegmykCCdaFvvsH8810znMSPSBmZ8LJFesVJJ1Z4ZS/t8BekUNAslgcbMTZiSb8pLsfBIDTkwCpyOi0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793
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

Thanks, the change looks good to me.

Reviewed-by Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2025-05-27 08:04, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print formatting warnings.
>
> Fix formatting by using proper formatters, eg. PRIu64.
>
> Cc: George Zhang <george.zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/amdgpu/amd_freesync_video_mode.c | 4 ++--
>  tests/amdgpu/amd_info.c                | 2 +-
>  tests/amdgpu/amd_ras.c                 | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
> index 7716598dc..adfc8a810 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -482,7 +482,7 @@ static int prepare_custom_mode(
>  	den = refresh_rate * 1000 * (unsigned long long)base_mode->htotal;
>  	target_vtotal = num / den;
>  	target_vtotal_diff = target_vtotal - base_mode->vtotal;
> -	igt_debug("num=%lu, den=%lu, target_vtotal=%lu, target_vtotal_diff=%lu, base_mode->vtotal=%d\n",
> +	igt_debug("num=%" PRIu64 ", den=%" PRIu64 ", target_vtotal=%" PRIu64 ", target_vtotal_diff=%" PRIu64 ", base_mode->vtotal=%d\n",
>  		num, den, target_vtotal, target_vtotal_diff, base_mode->vtotal);
>  
>  	/* Check for illegal modes */
> @@ -634,7 +634,7 @@ flip_and_measure(
>  	do_flip(data);
>  	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
>  							DRM_EVENT_FLIP_COMPLETE);
> -	igt_debug("interval_ns=%lu\n", interval_ns);
> +	igt_debug("interval_ns=%" PRIu64 "\n", interval_ns);
>  
>  	for (;;) {
>  		uint64_t event_ns, wait_ns;
> diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
> index 53706003f..ace739da4 100644
> --- a/tests/amdgpu/amd_info.c
> +++ b/tests/amdgpu/amd_info.c
> @@ -73,7 +73,7 @@ query_timestamp_test(amdgpu_device_handle dev, uint32_t sleep_time, int sample_c
>  
>  		/* make sure the GPU timestamps are ordered */
>  		igt_assert_f(gpu_delta > 0,
> -			     "The GPU time is not moving or is ticking in the wrong direction (start=%lu, end=%lu, end-start=%lu)\n",
> +			     "The GPU time is not moving or is ticking in the wrong direction (start=%" PRIu64 ", end=%" PRIu64 ", end-start=%" PRIu64 "\n",
>  			     ts_start, ts_end, gpu_delta);
>  
>  		igt_stats_push_float(&stats, corrected_gpu_delta / cpu_delta);
> diff --git a/tests/amdgpu/amd_ras.c b/tests/amdgpu/amd_ras.c
> index c9307395a..fdf1bc27d 100644
> --- a/tests/amdgpu/amd_ras.c
> +++ b/tests/amdgpu/amd_ras.c
> @@ -765,7 +765,7 @@ __amdgpu_ras_ip_inject_test(struct amd_ras_single_test_setup *test,
>  			}
>  			timeout -= 1;
>  		}
> -		igt_info("\t%4s: test:%s block:%s sub-block:%d error type:%s address:%ld value:%ld\n",
> +		igt_info("\t%4s: test:%s block:%s sub-block:%d error type:%s address:%" PRIu64 " value:%" PRIu64 "\n",
>  				pass ? "Pass" : "Fail",
>  				ip_test[i].name,
>  				ip_test[i].block,
