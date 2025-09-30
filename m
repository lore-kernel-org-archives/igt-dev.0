Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAE8CAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 01:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9DF10E038;
	Tue, 30 Sep 2025 01:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CWaLRNRy";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011010.outbound.protection.outlook.com
 [40.93.194.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092CB10E038
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 01:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDEKMn2FmSklor0Aunq/5w4/wzTA4/K4gjmExY54c8U9Chur+Tp2Kjyp3FGd9aKrE4xSV7weCsIGn7WeEnlL0M2InTrnze2rTSVIK3KdMcvXffBoxfH3QJLz2AsR0sGxV26mletRTkFRZ5J2ozwd+roYsNqWnBIJ+raVr8zIdrupF2VMLP0od8LcKvP2yx6KLm7HNSWIiUwe+sAVeTR4B0poYvXFM5MxhkVHbWx5MfC1YSub+9uh/OGf/rS6RCiNcMF5ACZXT9Ru912lfHb2pVuxZ4YtSwEMGecLt5T/ziOu9nqrSwY1ZKzwW+3trBFsC5h7U6hyhi7lKYRCXGbwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb++zApXYmf6owMPpkuTyuyeGOnMEWltAJOdF+xYKAA=;
 b=MUgYqAYr6a+M/igTS98hmvWw3On8TjjFlLX/wejhEdBNRelG1a9P7bW1655RejajsX4kNALQvzY9gsWaHhZ9B8SVWyFyE/YFGnl+T7/fTLCbZS79gpu19jeUkqKUiMK66G05I+p94w+nHQ0gc63hejBiNsXouAkNsCBMgh/nZ77WJarU7xNU7vh9MezYz+dWYSc8iAf6Ax2o8i2oDY1oZ06VByeLmQNhHWYk6lCpyIFsnxDokqS0Taurw3mWM2ixLOKPtY/Y6hjvzhgV8gjTRH7lmMU3SmCUPrxvUEZKQJ/nK/fWkWeHwno4gOKG4l9avUQmC85JXQUYAH0iK5mOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb++zApXYmf6owMPpkuTyuyeGOnMEWltAJOdF+xYKAA=;
 b=CWaLRNRyh9BQxkA9ZGDSTVPdCwJnU4D5oAwHijXCiwdxnmz/rufYsnYfLOQwxq8EGPtD3/lyZbGZqGBv/zceCoHWoO7PiLKZABgMnWs9e8zWRA/pzr8+zu8DzEsuQTDQd43o2MYvyTweHX5/i20nnJz3lZDZGucSmqon3YR1bBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ5PPF8AECCE022.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 30 Sep
 2025 01:04:01 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 01:04:00 +0000
Message-ID: <e550a620-2d7a-4cc7-80d5-6b7d0d6f701c@amd.com>
Date: Mon, 29 Sep 2025 21:03:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/amdgpu: Extend JPEG direct register support
 to version 5
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20250928031812.3006673-1-Jesse.Zhang@amd.com>
 <20250928031812.3006673-2-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250928031812.3006673-2-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0333.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ5PPF8AECCE022:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4707c9-3daf-47b2-9b2d-08ddffbd3d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlBEWklEbkVEbFpJcDN3U3JDK1dKc3FzbElHeENtOWZWTllMWjA5TVk5Q1E5?=
 =?utf-8?B?RmRsYmpIeks2WmZVWmZxL0xrcXM5a0U0TjNHMlBHaVEwOG1oOWFDcUE4VXhO?=
 =?utf-8?B?N2FXVGtidS9tUW1udEZKRjBxWEw0Z0ZCcmk2YTgzb0hmK1p6TEg3WXN5RWR0?=
 =?utf-8?B?QjhLbHc0RG03TTI3eTdvVU1GWndnMldDR0dZZURzTXQxZDZMbFJ0dlNYTWts?=
 =?utf-8?B?SGtzeUoxL3BZY05YVnRxMGt0NGJLdldjUEdKTXlXM04wZFU0dXFYdTFWNEVp?=
 =?utf-8?B?VnNhZWNUd0t5QTdYZ0ExenpONUhJNVowUjREQUdZa0RSRDZkS08xVmt4Tjlv?=
 =?utf-8?B?WlRGK3VoaTRBSXFDQ2pmdFBnNG85WGp5VkpKTEhQRlJpNFF6ckd6ZVpsMWIr?=
 =?utf-8?B?dDFwQ2NaaTRrSHVEbHVNM0J6SFdhOUhLajVpVDh6YXJaekVxczRac3BJWXZu?=
 =?utf-8?B?dnU5L2RSRHd3SHkxZXljMXdEMHB3T1FVMERERE1pZTAxeCtyMGhDSzlnYmNS?=
 =?utf-8?B?WG9zRHNRU3Z1L3A2RkU1enBNbnI5NVlkMVplaVI3MGNXa2VpZ05TZDg1akJR?=
 =?utf-8?B?WGFvdXp3UnM4YzRESHlqWG5FNE5CcDNSSlp6NjAyV2ZJV2tRVmNTN1RRaWhu?=
 =?utf-8?B?TktDUHJOTzhsZVVqYmU5Y1V3Yzg4ZTBBT3JlOWZER2liMGlYTlhnaGdtV3B1?=
 =?utf-8?B?dHFoelBBbE54VlhGczVsdmhqbk5sSTRjNXpJb3NKcjUyaFBVSlIwUkk2TFly?=
 =?utf-8?B?WVhGY0dXRmFFQTNZdC8vdS9FeTY2QVdPdmdwUVJudEozYlpmbWtMS2NRT2to?=
 =?utf-8?B?WUtwR1dRZC9RQnpEb3ROalBHOGRLWG9KTmVydWFZWnRWZ2RmSHFBNzVnei9a?=
 =?utf-8?B?dTJJYUJCUnRyVDdFQXB6cVYwOFBYcllxbm5uN05oNitna0srV25oeEJ3S2wz?=
 =?utf-8?B?OUVQY0FYWHlMaDNTaWMwUU84bGt2QzlDZWpwY2FsamVhdVArZlI3ZGczQUxF?=
 =?utf-8?B?SWtSSkloVmJPb3ZuOHZQQ1AzczZRYnAyUWpUcG5xdnd3eGhjbVU5bUY1eEd1?=
 =?utf-8?B?UWJ2RENrR1F6dVRGNzRMYXhZMldSV25RdkdLZC9nOHVBQTl3R3haOEwxWVNO?=
 =?utf-8?B?RVM3OFdEUzhpSFBtdkllRnNlSVdrTnUxSytnSklPaFZxcWl4SFNocUxOSDRE?=
 =?utf-8?B?ZXdFdWFSMzZZcE1MK1BySXJIY2l1dmxwbEhxOS8xeXlCeXpEalVnSDZidHRh?=
 =?utf-8?B?aW1CRXA5aVdRdVV0NFhTaHVkT0ROc0YwMW5CTVMrejc1VTRNaGwvdDdFRU92?=
 =?utf-8?B?L3BNNmp1L01XY010N2taYStYTG9hZkVuUXhMWGk5azZrRERMUDhxSEx6cnFC?=
 =?utf-8?B?SFc1SGp6RkFZV0pnMG1RK0puVzFjR3lGZDVpYVJRYlY0R1FJblVPVlJNTzUx?=
 =?utf-8?B?Mm01NXZiNitFcGc1VlV5YmJ5WU15VVRteFFNN2xFWnc4UVJuS05QYzZGV00w?=
 =?utf-8?B?eHVrT1BpTnRNNCs0aUJRSGlBQ1drRW5uMExoQzBuMWFUZGRmL2M1cFJORUd5?=
 =?utf-8?B?cy81c1FFMzUwajhXemR5V2M0SmJkNmU4NFZwOTh6aFhrOERkMjczRnN6WXR2?=
 =?utf-8?B?c3c0NEdFdDZ3eE1pS2t6b1VtS3VyYWVqVXA1c3U5NEtRUDN5R1BSMjlhS2FL?=
 =?utf-8?B?R1JiYkR1NDBlV3A0a0dUS0MrM2RjZFBZaVBCQkoxWmFIODFWekZsNGw2NU4w?=
 =?utf-8?B?bk5qTjM4ZzBVbFdHcWpyVTRHRFJ0eS9COEJXY1dtUVhlOXhNdmRSL1hYOW14?=
 =?utf-8?B?c1k3enZUMmttZ1R0QkFSWlRhMFhGZmNwcTVzOWJlNUNmN3JJbmlsWGp5bFFi?=
 =?utf-8?B?Uk5Xa01FdWlOcFpWTVh0blVBZDJ6ZlFTS3YxM2FXeEJwRmh1MUdscVR4bnM4?=
 =?utf-8?Q?5EyUZe614L9fBYha6e2KSqkwczSDWQD2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDdKZWtMeEFhMkNwQ2E1ZUdEZzlabWp2eVE3QUVkYXZwODhRam9yZU41OW92?=
 =?utf-8?B?UXlpL2hBZzAveFMwd3h2aytzQUFBeStlTWVMVDRoTm1wR0IrV0pSbVNhYU1Q?=
 =?utf-8?B?QVEwMHY2T2RXUjFwV2hHVitOODU5ODE2SktzNVJHSFl0S0JqN3Y3QXUvaEVT?=
 =?utf-8?B?ZnZBWG5vMUxoU2lrQmRWbmlJbnliQ0kzZHBrM0ZSMWwrU2tPS0RLdUJKQjJo?=
 =?utf-8?B?aC9XOHExN0p4TjJMN1dPSjFjN0pKN0JSQWNJbUQxeUF5ZWJTV0dVVGIrQ1k0?=
 =?utf-8?B?M0FsUEM4TVBabDZhbjR4WUttSzB0SzRFTVkzL2hpN2ZCc1ZsaHc1OVY5UmlZ?=
 =?utf-8?B?ZEI5YXJ4VlpSRFE3bWJWa3UvSnJ4eGlZbklXdnlVd2Qwbm9CbFFKMTJQcGhF?=
 =?utf-8?B?QjZpbmxGSmxpRVJKNlhJZEkvaWNsc2p0WGhtcVJMU3VCamdpMit2QW96OFRn?=
 =?utf-8?B?Zmp6K1g2R3gzbzR0T2oyNmJ4Ty92MEpxSm1Nc1UxUTRTNFpRRVdBQ2E2aE5K?=
 =?utf-8?B?MUFhVFlTcVJRWDlvTmRvU0JDb3B4T3dCNmc1NitiVVZxR2U1Uit6cldoZHFY?=
 =?utf-8?B?YXZzNll4eThKejgyTzJlbFNZalBUYVE2UVE5SEZ6QmJGK0hLMmRPMjFneUVm?=
 =?utf-8?B?U3FXRFkwY0hoSnNPVDJrNVNROE0wdFp2MGZYVk9KNk1tQnczWkpybi81VU5k?=
 =?utf-8?B?VGNCVFJwN3BUaEEvaEpBVWFYVldrdTQ5b3VnM2JxZXdIZEd0bXRlUFZaUHNK?=
 =?utf-8?B?SmRSU2o3S2g3M3FScnlnSHgzNmVOTVU4dTEzbFh5YlBnL2FQSHZ1dFZ6L2wv?=
 =?utf-8?B?SS91TExmUzEveDl4eUFrRjJaYi9rdEFLN29JRUpJZVFtcU54SVdJMFVPazdU?=
 =?utf-8?B?dGlZempJN3hpQWhEZmlYM1IxTlVja2M5U1kvK0tvYmpaSHJDajFqS2d5NDN1?=
 =?utf-8?B?NkVjSnJwVmtqemJyS1BMRndnN3lkY2dQMHh4ZVowdW4rYXVLWkxoakVwTmdi?=
 =?utf-8?B?andOZ0NiaWlaK3BFQyt6UWEwQk1hNUE1dDJ6L2dlVTFkKzlVQmNGRTRhdU1j?=
 =?utf-8?B?SmxldWZiMGVWM1BSbjAwdmhGZDlFZmZvOHZURGgxeVhwQ2srSk1MUVR5UllV?=
 =?utf-8?B?N1lWR0NQend5N0hHYjJSdTBQT1JJZjFZSi94QXZMRHRqZlQ4NHdKclRhK2Jw?=
 =?utf-8?B?Ky90QXR5SDJzeHRxNndsNXJOcUc3OHFVdGJUREt0eURvTHJ1L3VSYUFvMnow?=
 =?utf-8?B?N0hWVlNBdkI5SkR0YytRQmVBTU1QOHdtTFhzY2ROSHZCdVZDRm9oWFhPdERZ?=
 =?utf-8?B?WHF5SWN5dEV3TnRoNVVBUEo5UDdtY2tpR013MlBDS3NBUGtuVlNEVEJsQ1ky?=
 =?utf-8?B?a2NjSkVQTTliSlh5cm9IU3RZQWFGZk45eUNIQVdtSi9HTm5Wc28rT2N0UDlD?=
 =?utf-8?B?ck9OOVpLTWVuenJMWWVZWitlY0xTL1MxMGtFNFRKWmREc29wUG40eUtHbVNo?=
 =?utf-8?B?RHUrMHdlV1BaZmdDaXZxK241L29UNzhkeGZWQUhBaUlZOUxrWWRyS1RhOThr?=
 =?utf-8?B?cE52cDkrY1E2VVV2QUU0ZG1wWHlPSktBc24rd0xMckg4Qks4TjNMYjRpVzFV?=
 =?utf-8?B?UGl1SHJvV0tER0g5d2RndzV3N2Z6cVBscWt3WXZYbFlzSzQzeWVjbjdNL0tJ?=
 =?utf-8?B?SHgrWGFXa2w4M2VEU0NUQ2NmZnlwWWl2OFltVUpzOEIyYWx4RTkvaUdMdzlJ?=
 =?utf-8?B?b0hIRG1JSkVJdDVWUC9GbUtuMm9CeFE1clpUZUwvQ1FTMW52T1gwS0hlSllH?=
 =?utf-8?B?amhnRkhXRE1vSnBhR1N5d1lLd0k2YVBRSll4STg5T1RVWU90ZkNXSDV5bW5l?=
 =?utf-8?B?aGtCd093RTVDdVY1MjkxRDBGamNpeHU2SUpua2tYK0tTSnIxYkRMS3RQcTlu?=
 =?utf-8?B?MGw1VElBVkkrWkM4WjRKUy8yc3NVYlNwMnpWa0VZaExxc1pNVHovRU5VVHlT?=
 =?utf-8?B?bkRNeTJ1NVR2ektmQ0l5VkNnUGxQV2ZWOFJBMGZpL2l1VEMzSGtvenFtSnIw?=
 =?utf-8?B?Q2NtbE9RQmZZa3c5aUNZRUZIWlBCM2h1ZlN4eVBoQk1xdkdUZFZ5NGRlU1NC?=
 =?utf-8?Q?Sc6NOivG+A/VfMfV9fGZQcPcU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4707c9-3daf-47b2-9b2d-08ddffbd3d87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 01:04:00.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr+dDFdi9dsKa2j1B4L2EDl6AmpKxUqik8bu72xpNvmzx+ZRBpKHJJky5n1yrNY2BmHRoYd5KNj6H3Y4kEK+jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8AECCE022
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

Both patches looks good to me. Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-09-27 23:17, Jesse.Zhang wrote:
> Update the JPEG IP version check to include version 5 for direct register access.
>
> The change:
> - Extends the condition from `info.hw_ip_version_major <= 4` to `<= 5`
> - Allows JPEG version 5 hardware to use direct register access mode
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_jpeg_shared.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/amdgpu/amd_jpeg_shared.c b/lib/amdgpu/amd_jpeg_shared.c
> index e9f673a42..4c17f89b7 100644
> --- a/lib/amdgpu/amd_jpeg_shared.c
> +++ b/lib/amdgpu/amd_jpeg_shared.c
> @@ -22,7 +22,7 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
>  
>  	if (info.hw_ip_version_major == 1)
>  		context->jpeg_direct_reg = false;
> -	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 4)
> +	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 5)
>  		context->jpeg_direct_reg = true;
>  	else
>  		return false;
> @@ -188,4 +188,4 @@ send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
>  	/* set jpeg_rb_wptr */
>  	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
>  			(JPEG_DEC_BSD_SIZE >> 2), idx);
> -}
> \ No newline at end of file
> +}
