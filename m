Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F9C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 17:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CD210E2A1;
	Fri, 26 Jul 2024 17:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="krQ/nd15";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C029110E2A1
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 17:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YN9GtcC5+1qL7RcN+cR+wOUtIJSAXoNAD13T7EzV8VIHOv+zq+bzpbret1Bn2BQbyq1AUGkosQjm5voSZxNFF5gnZL9qT4STCG4Ckx/ZHHg1N/mYepXM/JeLfH/YZda6rlRU8Pu/mOBhuxl2mHr7ht0gfZGxMzCjOIb1rhGO2OaQ00gFCf/+APOab/u4s04UYCFsmIQVUzpHB6uOpUIh6DGe+i2jUNTYCdwLyzeqslPuZmt4kk3dYff1X9GFcuMBlKuj5uqDaqhZegjoukz6exxzv/XZ4li5k8ydas1w/kcrT3SSpXJoXCP4dCFMr+Lwu9OprQ1sxkid7wnjNa5Rig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB2Prj+HpE4SNaEQYxsd0yCBw8pGEGZ5hhOWRPXUEGY=;
 b=ugqJkEBoNSxRd8M2Da6QIO3LqJ6790llVT3TDjdy3xm5tWUsVTGbCy9KqmGFP/UsltOyiczdcKOcibHa5MnR7CHJJLhntafBearJsznfBCVKjG1UEkdTEgJ/wXvKHiqmCN07zr7iv9Ol5lvw7T0fBkRDkK9EIPbdHQUIihjHWMfOVFnf3eLnUQcJypADTBqTmUzjZAQEpv2R9VlYwDZrW/tkvcvcBJKsqXkiZ4Z0x/X6cMsUeo2uoYYNmpvN6oS5c07KDatPeq6Ha4Q2d9CXIOG8N1dpsnBFfchfaXNYzpxGQTVoe7KGpkozIpuG1otVSSzlO/LvrYdqFL1qp07xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB2Prj+HpE4SNaEQYxsd0yCBw8pGEGZ5hhOWRPXUEGY=;
 b=krQ/nd15l1StaSapVdNzwJgZrwC5U2dFUKtZ/ELekNTcU72US1TnY+gsbbnGiB+8cPAyunafIk1Gss8NKfvAznQyJI6f+qwywJtjw8O/RCIvq63Wf11BIlpIE3V/qoxFofjucfeU9zQNylmLf3LyUge/H/7ugSRjPP+yWqg115k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DM6PR12MB4329.namprd12.prod.outlook.com (2603:10b6:5:211::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.29; Fri, 26 Jul 2024 17:14:22 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 17:14:22 +0000
Message-ID: <12f81286-3607-469f-bca8-ee65977b2365@amd.com>
Date: Fri, 26 Jul 2024 13:14:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3] tests/amdgpu/amd_replay: Add amd_replay IGT test
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com
References: <20240617094703.29421-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240617094703.29421-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0450.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::29) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DM6PR12MB4329:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c38c18-5303-4339-a0b3-08dcad9663f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGtIVmRiZnpnZzNEN2F2d0tlN01veUpscGFmZVEvMnBIdFlvYno1TXdOOWE1?=
 =?utf-8?B?S2ZJeFBBUjhUQzdnd3E1RStEU05jVUhWWktNU0wvS0taYXBwZ2dmSzhHM05G?=
 =?utf-8?B?eUpvSUJVQWlOMGNhU1NaV1VwUUVwT0kzODljOGttdGcwZWlseDgyck1mQkdT?=
 =?utf-8?B?YlNHN0pBdTRWQW1TL1ZqVytHbXpzQXdFM0VkSWI3cnFTdEhBZ0h1OVRPWDJC?=
 =?utf-8?B?dzNBTkVwN3U3L1haNExHeFVxTFhBdnpGVVg3MlZvVFZjTkQrMldHZVlQVlIz?=
 =?utf-8?B?RS9MVE0yK1pqekN1SWZJNlFWUG9mclZEM3hkbGpyQTFyNVN6U0trenlvWGh4?=
 =?utf-8?B?akxYbmZXWkpOSERrR3BzQmxFNExsVWZEYTFRaEo1S1hzdXpTZTltSEpKbzF5?=
 =?utf-8?B?aWJsMWJNcjV1ZE9JelRUY0VUYWVNQnFSaGN1dEw1cGpscjB6eERJeVlkYyts?=
 =?utf-8?B?YzBwNU40WkZ4Vzl5MklhUGdjeVFnK1BONmhVMHRMZEVQemJxbElVNVAvYWpz?=
 =?utf-8?B?V2syM3pzU1owOGpZakRFTHdzWjRNOGZSdFh1d2IvRjhYSjFNTXFrQWhTaEJI?=
 =?utf-8?B?MTl2eldGejY5aWNGYkdRSjFLc0IzMVZvbGxlUkRiVGVGK0h4ZFJQNG0xQTJw?=
 =?utf-8?B?T0tINWNDdFk4Q2lST1ZSazUwd1pqRTlQbEtHTUxiRmdjZkpmNDliWE85enZv?=
 =?utf-8?B?QWxGelRuYTZxU3JmOHZ6c05WU2UvV2ZLRVlBUW5tcVptendyWVRsZ0pmSUJG?=
 =?utf-8?B?d1B3QjVpOTdwSWdlanRNcXREWUt2NC9xaTJrdXByd1UwS2xkNVRzL0xhTzUv?=
 =?utf-8?B?bzhIQXVCemcxYUZFSlRuMnFqYllEQmxZdm9MQ2NlYkl3WHZldHFsTWxGcGZY?=
 =?utf-8?B?WWZZdktCeUJEZ2NEK085OGtNR0NlVVU4UmtMbWJpd0dLdFRzSTNxNG9UODV0?=
 =?utf-8?B?bFNaM1RkN1dORnRvUWVmSVlQdG1IbDg0U3ErbmY0K2R3NTl5OGxHRktadDdR?=
 =?utf-8?B?TW5JSEZvTWlVT2VhMWFzc20yYWhRbVV4VWdDalZFeGZVNXhuWjU3RkllWC9V?=
 =?utf-8?B?RmlibjVSWFdlaE9FaHB6RkZTY0owTDc3eW9HMFBXQkQvUlh4YWtzMzRoTkdG?=
 =?utf-8?B?NjFsSWZsQWVRdXJ3bFBPMWNPNnZJa285MjhtS1NseXBTUDQzOGw4N1FBU0RD?=
 =?utf-8?B?THdlVjVLR0JXemVYbEw3bHJPdHF3emRmM0dUWmc3UzA4RWsvSVVNZlFSSGE2?=
 =?utf-8?B?enp3SXMwSE9vSlBIL0pidVNOWGdoOHNGZys2UGxiQkYzTTgxVnFJWUlsQnlP?=
 =?utf-8?B?RHZxMXFRcGxKdVFxWXlMT01JZEorelpMd1FFemk3NTVRTnBTclVhODBMUVV6?=
 =?utf-8?B?RjVnR2labi9LR2wwYytwNS82THFPQ1lrVEp5SmlNL0lHZkNueU1aOGUwUDZK?=
 =?utf-8?B?WU9jWGppdVdkYWNhY0tON3Z4a0EwbHYrS1Myb2xUQzkxUlZQY0hmK3RmZ1E4?=
 =?utf-8?B?U3dlek9valNhMnF1NGJNOXNhanMvNkYvZXUwYVkydXBSRFFDZUxsa09HSDN5?=
 =?utf-8?B?cWovYVNVSWdUWi9Ja3FMRHlQV3lEMlh1VDVtaG1PQzVlVUJ5VmhQbW1yVi8z?=
 =?utf-8?B?VzNYN3haUC9YRmRuSVl1UGo0SWMvTm04K3RqUWo2QmZ6Tjc5ZDNyNVoxS1F6?=
 =?utf-8?B?czNFejVFVkVXR2F5ZFdPTnM0VTFPcFFoWng4WUVLTmJ5c0gyOTQvVFN5NXpq?=
 =?utf-8?B?b3FKd1BGMHFOQ3c2SlFzM2krWC9JekZxMENEOXFLK3pmcGRxcDNhRUtONlli?=
 =?utf-8?B?MkRWMXVaNHpEN0ZseWwzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNSNnNmcVZiRVJsUWFoQnlhTjVpbWF6eXlhWFcxNXFLT3JCVWREWUhtaFBK?=
 =?utf-8?B?bDUzWFZjQlpiL2xFTEp5NzZJQWpzTWJla0s1VkV0RUNBN1BySEIyckZXRE5q?=
 =?utf-8?B?NEo1NEFVanR6Qm5NWDB0NEhMSENacmJNZTBlWE4ya2ZkUWM5dHlaTTliblp3?=
 =?utf-8?B?N3BFaWd0b0xyOGdoSDZneE1tMGVDS1EwdGZYTHppWklhdWtpNTZaOGhLOWdM?=
 =?utf-8?B?bHFhZ1E2YThvWVZzTjBrMmZUVUJRUW1rN2lKRnN1WTZoMHE5L2FsRmhnaUZk?=
 =?utf-8?B?blpSVGVBalJnWFI5VnpoSnpXaXcxR0FSS2t5TTRWRW5ZNDZwYUJ2QUJkYy9w?=
 =?utf-8?B?ZTRmWW12UUtNbzZsdkNBdHp4b050NDg3TGFoelVBMkZlZklCK28za0psbHE2?=
 =?utf-8?B?S0hJdUVObUpzeDl0ZUxFdGRHaDNsTWY3d1B2NGxqT21sYU1lc1FtSnNKTlhJ?=
 =?utf-8?B?MTd2SFdRWkp4ZjNqUGV6WVJ4dzJUMHpteXluaE1id0NzQ3Q2MSt2UElOZGha?=
 =?utf-8?B?Zjh2OFlNbDZGWW9XdFBKMjZ1Tm1SZ01GVlRlYWpnandqUVNaaDlOYzhKQ2Yv?=
 =?utf-8?B?NjFMTi9VeGt5ZFVMTlAyNTJ1Mk9Icjgwa1ZBTXJoRnlwOEloL3UxbW9pYzlv?=
 =?utf-8?B?a1NQSERBN1pPZTAxaFNyUzRHME1hN3ZoOHJ3cGJUb2ROVHh3NVdVcGJ1VFZv?=
 =?utf-8?B?Mml3cmFtdU5TNFdzZU92OXJYYWlaT2tMck1UbUpuWEs4MjFPeW8wZlhDbE9O?=
 =?utf-8?B?QTdSMVM4VzRUSEwrN1lRSjF3UDV3TGtnQVpjUmM3cDlmbm9kQm1tamw2OHRj?=
 =?utf-8?B?bXhaTDdTNjFYTFhoUEJlV2ZacGVTZ2pjMU9Edlowd1VxTTQzWDRUbEFqbjZT?=
 =?utf-8?B?bFppbmVIT1lhMHh5NDdORGxpUzlWN1BDYllHMXg2Zm1PTlUyd3pVdmVMdVlz?=
 =?utf-8?B?L1dzU3JJK0NmQzVNNWw3Q2xPZWdCYTVBWnYyV1A3YWcyUGVKUmo0bURWWmpU?=
 =?utf-8?B?ZzhxbElaM3JuS1pKa3RibFk1UUl5K0pNa1BxT3V2ZjJuTlFHcms4SDZRUmNW?=
 =?utf-8?B?RkpLOGVZbitQVzJMbXFoVDVDZlJtVUJmdjdHZGd4alRPQVFQMXJZRTFlNURv?=
 =?utf-8?B?SnRLY1VSd0VyVFpBWXdGeTFHVkRvYWwzTXhlcXpMN1l0SHNnOVV0d1BHSVBs?=
 =?utf-8?B?Y2NjL2JidlBvaEFsMXVDRnpma2dFVmh2M0J1QmxuUTRJNjViaXJ5L1JnMSt2?=
 =?utf-8?B?MDIvQUVaelhIR2ZoMGlMV1g4TGhhRDZUWEZ1MVdTMEZzdTdhb0tMbEFTTGNV?=
 =?utf-8?B?VFAwN0FJN3MwQkJqWC91MTdrTWZvRHpNVDdsN1R3NlhsT1lQYnBxOHZIaEZ1?=
 =?utf-8?B?N1ZDLyt1aGVlTy9IUGRPK2xHZ1hjWUFYL3lyV0tRWEtsM0g4akJXR2RjRVJG?=
 =?utf-8?B?RFFTZnBoYy9SR1dmcXoySFg2NUV0aGhsSG1tZFFJZUxEUmJ4Q2hJd3VxTDFh?=
 =?utf-8?B?dEJ2dUxLamxCZXNjTUN4dFVUdWF4VHErWGN6bmFiYm9JN1c4WHhNREpacnRE?=
 =?utf-8?B?SERTVHByUGoyQUVmbmFOcnJ4SWZnREc1NlozQTIwNnVvaUp4N09zWGtDTUJM?=
 =?utf-8?B?TWkyeXIrM2p0V1dzUHNwOS9LZWo2dDNmOGpMM3d3UmdLelNRYXpPSVcwTTRJ?=
 =?utf-8?B?Z0dPVERUYXVYZTZudExmZHk5ZEFsNXFhU1Z1bHU0L212WTlPT2N2YUZGN2N1?=
 =?utf-8?B?YjQ4SUgvcjN2bC9vVWpjZUI3Zlp6RXFYK1poMmhjWlMzVUwzb3dwZmg0d0JH?=
 =?utf-8?B?elRodmtZVFVFWHRvWlFPVlZ0bGI4bFZhRjNhd2MwOHVsQmk3Tmh0cjRtUGZ1?=
 =?utf-8?B?Nit5S1hWQmVsVzdZY25uS25FYjZ4anBQK1YvVXY2VlV5b0QycHJFOHVmSkJ3?=
 =?utf-8?B?VE1YZThxbjl6b2FCczBuU2JvQk8rK21UcFo1aElPT2RiWXpyczZsWjVUaXdF?=
 =?utf-8?B?bmhRb3dEVngxVkpsbXBZWjh1MEdMYzdLYytIM1JXWFhkTWE2cDY2bU9lOHVq?=
 =?utf-8?B?NG45blZHdGluRkxjdnlGTkE2UCthTTBWakoxaFh2OHhobTROOWxEK3dpVC8x?=
 =?utf-8?Q?Laz0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c38c18-5303-4339-a0b3-08dcad9663f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 17:14:22.0626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VftqrJSJirYcc+tzA7EGP93WUTyCCWq6ntZeZc3XGJvDbE3QcjYjPzw+rB7Jegvg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4329
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



On 2024-06-17 05:47, Tom Chung wrote:
> [why]
> Add a basic IGT test for panel replay feature.
> 
> [how]
> Subtest case
> 
> a. static screen
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Stop video flip and wait for a while.
>     4. Check if replay state is in Replay mode.
> 
> b. Live mode (intermittent)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
>     4. Stop video flip and wait for a while.
>     5. Check if replay state is in Replay mode.
>     6. Repaet 2 to 5.
> 
> c. Live mode (constant)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
> 
> d. Resume from Suspend
>     1. Suspend the system and resume
>     2. Start video flip for a while.
>     3. Stop video flip and wait for a while.
>     4. Check if replay state is in Replay mode.
> 
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
> v2: Modify the include header files in tests/amdgpu/amd_replay.c
> v3: Fix some coding style issues. Add a new subtest case.
> 
>   lib/igt_amd.c             | 105 +++++++++
>   lib/igt_amd.h             |  39 +++-
>   tests/amdgpu/amd_replay.c | 464 ++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build  |   1 +
>   4 files changed, 608 insertions(+), 1 deletion(-)
>   create mode 100644 tests/amdgpu/amd_replay.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 149af5151..a7db95c86 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1014,6 +1014,111 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>   	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
>   }
>   
> +/**
> + * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
> +}
> +
> +/**
> + * igt_amd_replay_support_sink: check if sink device support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Sink support: yes");
> +}
> +
> +/**
> + * igt_amd_replay_support_drv: check if driver support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Driver support: yes");
> +}
> +
> +/**
> + * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
> +}
> +
> +/**
> + * @brief Read Panel Replay State from debugfs interface
> + * @param drm_fd DRM file descriptor
> + * @param connector_name The connector's name, on which we're reading the status
> + * @return Panel Replay state as integer
> + */
> +int igt_amd_read_replay_state(int drm_fd, char *connector_name)

It would be nice to return type 'enum replay_state' here.

> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
> +
> +		return -1;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_STATE, connector_name);
> +
> +	return strtol(buf, NULL, 10);
> +}
> +
>   /**
>    * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
>    * @drm_fd: DRM file descriptor
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 6780b99de..a41b423b7 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -47,6 +47,8 @@
>   #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>   #define MAX_SUPPORTED_ILR 8
>   #define MULTIPLIER_TO_LR 270000
> +#define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
> +#define DEBUGFS_EDP_REPLAY_STATE "replay_state"
>   #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>   #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>   #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
> @@ -100,6 +102,35 @@ enum dc_link_training_type {
>   	LINK_TRAINING_NO_PATTERN
>   };
>   
> +/*
> + * enumeration of REPLAY STATE below should be aligned to the upstreamed
> + * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
> + */
> +enum replay_state {
> +	REPLAY_STATE_0 = 0x0,
> +	REPLAY_STATE_1 = 0x10,
> +	REPLAY_STATE_1A = 0x11,
> +	REPLAY_STATE_2 = 0x20,
> +	REPLAY_STATE_3 = 0x30,
> +	REPLAY_STATE_3INIT = 0x31,
> +	REPLAY_STATE_4 = 0x40,
> +	REPLAY_STATE_4A = 0x41,
> +	REPLAY_STATE_4B = 0x42,
> +	REPLAY_STATE_4C = 0x43,
> +	REPLAY_STATE_4D = 0x44,
> +	REPLAY_STATE_4B_LOCKED = 0x4A,
> +	REPLAY_STATE_4C_UNLOCKED = 0x4B,
> +	REPLAY_STATE_5 = 0x50,
> +	REPLAY_STATE_5A = 0x51,
> +	REPLAY_STATE_5B = 0x52,
> +	REPLAY_STATE_5A_LOCKED = 0x5A,
> +	REPLAY_STATE_5B_UNLOCKED = 0x5B,
> +	REPLAY_STATE_6 = 0x60,
> +	REPLAY_STATE_6A = 0x61,
> +	REPLAY_STATE_6B = 0x62,
> +	REPLAY_STATE_INVALID = 0xFF
> +};

Latest amd-staging-drm-next introduced states 2A and 4E, so this needs an update.

> +
>   /*
>    * enumeration of PSR STATE below should be aligned to the upstreamed
>    * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
> @@ -135,7 +166,8 @@ enum amdgpu_debug_visual_confirm {
>   	VISUAL_CONFIRM_HDR	= 2,
>   	VISUAL_CONFIRM_MPCTREE	= 4,
>   	VISUAL_CONFIRM_PSR	= 5,
> -	VISUAL_CONFIRM_SWIZZLE	= 9
> +	VISUAL_CONFIRM_SWIZZLE  = 9,
> +	VISUAL_CONFIRM_REPLAY = 12
>   };
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size);
> @@ -189,6 +221,11 @@ void igt_amd_write_ilr_setting(
>   	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>   	uint8_t link_rate_set);
>   bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
> +int  igt_amd_read_replay_state(int drm_fd, char *connector_name);
>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
>   bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
>   bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> new file mode 100644
> index 000000000..551544238
> --- /dev/null
> +++ b/tests/amdgpu/amd_replay.c
> @@ -0,0 +1,464 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include <dirent.h>
> +
> +#include "igt_amd.h"
> +
> +/* hardware requirements:
> + * eDP panel that supports Panel Replay
> + */
> +IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
> +
> +#define REPLAY_SETTLE_DELAY 10
> +
> +/* Common test data. */
> +struct test_data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;
> +	int fd;
> +	int debugfs_fd;
> +	int w, h;
> +};
> +
> +struct {
> +	bool visual_confirm;
> +} opt = {
> +	.visual_confirm = false,	/* visual confirm debug option */
> +};
> +
> +const char *help_str =
> +"  --visual-confirm           Panel Replay visual confirm debug option enable\n";
> +
> +struct option long_options[] = {
> +	{"visual-confirm",	required_argument, NULL, 'v'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +enum test_mode {
> +	TEST_MODE_STATIC_SCREEN = 0,
> +	TEST_MODE_INTERMITTENT_LIVE,
> +	TEST_MODE_CONSTANT_LIVE,
> +	TEST_MODE_COUNT
> +};
> +
> +/* Common test setup. */
> +static void test_init(struct test_data *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	/* It doesn't matter which pipe we choose on amdpgu. */
> +	data->pipe_id = PIPE_A;
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +
> +	igt_display_reset(display);
> +
> +	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
> +	igt_require(data->output);
> +	igt_info("output %s\n", data->output->name);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +	kmstest_dump_mode(data->mode);
> +
> +	data->primary =
> +		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +
> +	if (opt.visual_confirm) {
> +		/**
> +		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
> +		 * to have Panel Replay visual confirm enable take effect. DPMS off -> ON transition
> +		 * is one of many approaches.
> +		 */
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +			 DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +			 DRM_MODE_DPMS_ON);
> +	}
> +}
> +
> +/* Common test cleanup. */
> +static void test_fini(struct test_data *data)
> +{
> +		igt_display_t *display = &data->display;
> +
> +		igt_display_reset(display);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +static int check_conn_type(struct test_data *data, uint32_t type)
> +{
> +	int i;
> +
> +	for (i = 0; i < data->display.n_outputs; i++) {
> +		uint32_t conn_type = data->display.outputs[i].config.connector->connector_type;
> +
> +		if (conn_type == type)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static bool replay_mode_supported(struct test_data *data)
> +{
> +	/* run Panel Replay test if eDP panel support Panel Replay */
> +	if (!igt_amd_output_has_replay_cap(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_CAP);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
> +		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
> +		igt_warn(" kernel driver not support Panel Replay mode\n");
> +
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* Read from /dev/drm_dp_aux
> + * addr: DPCD offset
> + * val:  Read value of DPCD register
> + */
> +static bool dpcd_read_byte(int drm_fd,
> +	drmModeConnector *connector, uint32_t addr, uint8_t *val)
> +{
> +	DIR *dir;
> +	int dir_fd;
> +	uint8_t buf[16] = {0};
> +	*val = 0;
> +
> +	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
> +	igt_assert(dir_fd >= 0);
> +
> +	dir = fdopendir(dir_fd);
> +	igt_assert(dir);
> +
> +	for (;;) {
> +		struct dirent *ent;
> +		char path[5 + sizeof(ent->d_name)];
> +		int fd, ret, i, j, k;
> +
> +		ent = readdir(dir);
> +		if (!ent)
> +			break;
> +
> +		if (strncmp(ent->d_name, "drm_dp_aux", 10))
> +			continue;
> +
> +		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
> +
> +		fd = open(path, O_RDONLY);

open() gave me a build error without #include <fcntl.h>.

> +		igt_assert(fd >= 0);
> +
> +		k = (addr / 16) + 1;
> +		j = addr % 16;
> +
> +		/* read 16 bytes each loop */
> +		for (i = 0; i < k; i++) {
> +			ret = read(fd, buf, sizeof(buf));
> +			if (ret < 0)
> +				break;
> +			if (ret != sizeof(buf))
> +				break;
> +		}
> +
> +		close(fd);
> +
> +		closedir(dir);
> +		close(dir_fd);
> +
> +		if (ret > 0)
> +			*val = buf[j];
> +
> +		return (ret > 0);
> +	}
> +
> +	closedir(dir);
> +	close(dir_fd);
> +
> +	return false;
> +}
> +
> +static void run_check_replay(struct test_data *data, enum test_mode test_mode)
> +{
> +	int edp_idx, ret, frame_count, replay_state;
> +	igt_fb_t ref_fb, ref_fb2;
> +	igt_fb_t *flip_fb;
> +	igt_output_t *output;
> +	uint8_t panel_dpcd = 0;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		flip_fb = &ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +			 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		/* Check Panel Replay state */
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
> +		igt_fail_on_f(replay_state < REPLAY_STATE_2,
> +			 "Panel Replay was not enabled for connector %s\n", output->name);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		for (frame_count = 0; frame_count <= 20; frame_count++) {
> +			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +				 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +			igt_require(ret == 0);
> +			kmstest_wait_for_pageflip(data->fd);
> +
> +			if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
> +				 && frame_count > 5) {
> +				/* Panel Replay state needs few frame to enter the live mode */
> +				replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +				dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +				igt_debug("replay_state live mode = 0x%X\n", replay_state);
> +				igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +					 "State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +				igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +			}
> +
> +			if (frame_count % 2 == 0)
> +				flip_fb = &ref_fb2;
> +			else
> +				flip_fb = &ref_fb;
> +		}
> +
> +		/* Check Panel Replay state in static screen */
> +		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		/* Do another page flip if we do the replay_intermittent_live test */
> +		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
> +			for (frame_count = 0; frame_count <= 30; frame_count++) {
> +				ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +					 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +				igt_require(ret == 0);
> +				kmstest_wait_for_pageflip(data->fd);
> +
> +				if (frame_count > 5) {
> +					/* Needs few frames to let state enter the live mode */
> +					replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +					dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +					igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE during flip = 0x%X\n",
> +						 replay_state);
> +					igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +						 "State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +					igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +				}
> +
> +				if (frame_count % 2 == 0)
> +					flip_fb = &ref_fb2;
> +				else
> +					flip_fb = &ref_fb;
> +			}

This seems identical to the first flip loop, perhaps we can pull it out into a 
helper? Something like test_flip_live_mode().

Thanks,
Leo

> +
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
> +				 replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		igt_remove_fb(data->fd, &ref_fb);
> +		igt_remove_fb(data->fd, &ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static void run_check_replay_suspend(struct test_data *data)
> +{
> +	int edp_idx, ret, frame_count, replay_state;
> +	igt_fb_t ref_fb, ref_fb2;
> +	igt_fb_t *flip_fb;
> +	igt_output_t *output;
> +	uint8_t panel_dpcd = 0;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		flip_fb = &ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +			 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Suspend and Resume */
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		for (frame_count = 0; frame_count <= 10; frame_count++) {
> +			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +				 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +			igt_require(ret == 0);
> +			kmstest_wait_for_pageflip(data->fd);
> +
> +			if (frame_count % 2 == 0)
> +				flip_fb = &ref_fb2;
> +			else
> +				flip_fb = &ref_fb;
> +		}
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +		igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +			 "State should be REPLAY_STATE_3 (Active)\n");
> +		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +
> +		igt_remove_fb(data->fd, &ref_fb);
> +		igt_remove_fb(data->fd, &ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static int opt_handler(int option, int option_index, void *data)
> +{
> +	switch (option) {
> +	case 'v':
> +		opt.visual_confirm = strtol(optarg, NULL, 0);
> +		igt_info("Panel Replay Visual Confirm %s\n",
> +			 opt.visual_confirm ? "enabled" : "disabled");
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	struct test_data data;
> +
> +	igt_skip_on_simulation();
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		if (data.fd == -1)
> +			igt_skip("Not an amdgpu driver.\n");
> +
> +		data.debugfs_fd = igt_debugfs_dir(data.fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(&data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
> +		/* check if visual confirm option available */
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
> +				 "set Panel Replay visual confirm failed\n");
> +		}
> +	}
> +
> +	igt_describe("Test whether Panel Replay can be enabled with static screen");
> +	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
> +	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
> +	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
> +	igt_subtest("replay_suspend") run_check_replay_suspend(&data);
> +
> +	igt_fixture
> +	{
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
> +				 "reset Panel Replay visual confirm failed\n");
> +		}
> +		close(data.debugfs_fd);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 3982a665f..69706fa70 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
>   			  'amd_prime',
>   			  'amd_psr',
>   			  'amd_ras',
> +			  'amd_replay',
>   			  'amd_security',
>   			  'amd_uvd_dec',
>   			  'amd_uvd_enc',
