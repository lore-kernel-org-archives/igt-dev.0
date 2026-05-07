Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C97ECD3439
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 00:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF0910E236;
	Thu,  7 May 2026 00:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlpTUqZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3D710EF16
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 00:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778115071; x=1809651071;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ULXndyJd7hlucaNq1gwBsjzjC0tt4b/XW1tZUMzcrpM=;
 b=PlpTUqZ+7dU4AwNfSU5jX4fGb1KGl2M01/29GiIuzHc8pMid/chAr0p0
 Ut36afsrzUyCw3jbl7VP7t4ZeB/GpCFu97QnZW0SSsk67hsq4VvG9G8HO
 HoR4VwxLOwCgoTa2CBoWUPja6UzPuYqbnQWWt/6Kz9WA9gYAqAi5tmtwk
 Tiv9qsQ09uhxPSA9rAKZMNpmEPCWdacTSWI34OH38E3s1X9cRhlwmNSYO
 9gL3bfI40l6VLUybkCGGFXt6rGH+7FgQzy/IAOGdZCr0xwRImTnRoHw1T
 qzTPFu4scr3AbtrPGPNalyZswrvEP/A0hAIGaV4a6+YDwJPxYleZ/1Sts Q==;
X-CSE-ConnectionGUID: gtFN3g+XRuWydrerXMpTaA==
X-CSE-MsgGUID: aLZ1yhHkR/S16C4ofuLKhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78908368"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78908368"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:51:09 -0700
X-CSE-ConnectionGUID: ieBGjndDSUOi84oN4leW2A==
X-CSE-MsgGUID: RftPQjjUQW2UW8PNTCEpWQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:51:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:51:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 17:51:08 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:51:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUej23SryQAwRtkhfIcMmHxiL/05SZE8QKraq2oO6cLsQEmNkRBh06gnAGGs0002D3rx8bPUFbKeRp21lehQMWrGFQWws1gaEUScamFvfbNkAg/xGclVRIC17lEeYPDbzFv4lelUj8eoY7Mj1aPGDlOxEdbhlvo+S6cg0apoFe89D4WWDDFHSgNMdXGo/T1vUJ4FOPVW5feIPeBhCUPLPcZHk6ZO8eS63GYoZMrqSMACphAo7zJN6+PwxuYvJXwR3RaKYocoNxaY9SBfwTdel3n3j/5/Z/MsG6pqKe8Hl+7LJIbleaAMLRgXABWgzcutENec3iLQ2LtS1B82FIGf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUWuKqTannEkUvheXcHIz3pDoCqQeQfk0wV3C1gt92A=;
 b=IpyDSdiiqO63UwFKpE164LPwymwR/GtPPy43uOVosl43pWEaSf10kw5VKzEEWDZ5u+DPFKNBUxts5B0MH/si3189KPBGQIrw1ikNRd9qdZcHB2kvb/TbdyF+t8GWyqW6wIgQM+GsBQ6kiWq4sbV1aoJSIrBCcbaYYVbVnFU4jtGTNNLJkRxwOV4/gjWWoCCtSVIXM6oh4y/5QWDfe9tZCxgNIs08Zc8YLuL1s+vmwJDv8LGlPd88IonnHcfY5G634RPeTx266ziMf8LItEl2wjRv5xViGxzep1bGuR0fZ6EbD95swq8kd91xAax/GfaH5akr2mv/uGt9j3Xu8um8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 00:51:01 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 00:51:01 +0000
Message-ID: <78796e94-e168-4764-873f-4783bac3a6a8@intel.com>
Date: Wed, 6 May 2026 17:50:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib/xe/xe_spin: Enhance multi-queue switch option
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-6-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260506183137.51479-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cc3566-3f75-4d62-f438-08deabd2b567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|366016|376014|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: G7w1ewZLMlPCsjtUyBySEPrQJnBtK7qywKm5Wal7z7Y0h9t4p/D8/OXEti2ehrRZUaJeYtzxRIhljyUkyB7BABnc/wQOrIy8+CBIBpLR51qtsXEeIRanWp0qo4k3LmfZNr9D0vJVCukDbqQq1vZg7wCPL7Eaa8bdZNrtKzXnLh9th+8JPfKMd6iZ2pILLOJCty2dtNZUYACPr1+nh3aBVX4HIAQR8AFPYz9Ea5wPkHbMMBCODxH1AzY806yvIyLwQ+dHCfSQwt/qayWjw0JTn09dmKZyWu3ZeeeRqJ9z7sG8EzQAffkD4nE49o7b1/RNHWgEDOXRmDQ2SdU/M+bcP98MyRmZ3bM/sqYlxzcbF+qAEiORQQpif+tqrkjJtKh6hzfATy9lwJO2eT6GoYeXtiFYncb5LVqaL3Tql0s8qy4IRme1Y8p4opsdFkAA67vw44ms7clvbH0q9Ey9cw4BpkC1Ya5Me/yM7JzF48HHEOin0xaUSm9hCX4xkdgV84p80EbUzYZLOLydocDfadufMEUZ3Tt3D3J4c+v8U/g9FmFHKTx7oNCT4wqeNjB1kQuN9uQfyVwUXR+qVeI0UQANJ2xkVLz5kuppDGfrrNDaq48g5+f5cHMgF7dHA5dfHKCvky1qsujljyEGI4erMi1RtPrUuIMYlQj3ilsE1sL0rvhe1ybw+Tg81AjUUMN8xbEc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDhQZnVyY1k0UjRLUVRQUklRWWtlK01Hb1hvK2NRSVBLZVQ3b3lQejNrTmF6?=
 =?utf-8?B?M1pqcUVGN3dCeGhnODVubExnYXlacTdVZTVnMm9aSXo4ZzRhYUduS0d3Z29q?=
 =?utf-8?B?eWl0UmdhVzlpNjBOQWNXbnBDNEhxaVluaG90eTlVTHp3a0ljL2lCUHVRcGpP?=
 =?utf-8?B?N1REOGNscVBFM1EvVjQ2aVlud2k3SXhwNGE4SloxQ3hlNmMwZXBBekpRQVBS?=
 =?utf-8?B?ZExMK3FmZ01XR1g5TmE3cXZJaXVXUmZPTll5YlU4QllvQ1FZdEprRkZFWllX?=
 =?utf-8?B?OEV4V3hmVDlXazdkMU1jc1JjK0hnbVl5d3ZMcWk0eU5rdmo1RlhnZks4a2tl?=
 =?utf-8?B?UmQxY2RZSXpIZFNSRmx6cE1TRk1icnZzc3c0RG5SL2t3N3dxSm9udWVpNExK?=
 =?utf-8?B?M2V6OERBeTdYQ3NSY21LdnNQZWt5WGdtUzdlSjdKOFBzazdQUlNYR3V2Qlla?=
 =?utf-8?B?SDFkYVpvcjBqbzFDc0lvRCsyeU1TOFhqZVlQMUhPQ3pvS1EyTFFWWDRRcE0z?=
 =?utf-8?B?TVI5OFc5Zk5jRUZ2cmNaTWtIdGN3RGpoZURZdFh4a3NlTUE5SW9NNTR0WExp?=
 =?utf-8?B?R0VqU1ZSakNHeU9MUk41WHZsUStBZlFjcXNRVC9wZkg0K2FJRmdsK00vVmV4?=
 =?utf-8?B?R1FwWS96Y3JWaklYekowa3A4RjlMa0k4M1ZyaEtvbUU1Y0VyRURuUVBQQ2hU?=
 =?utf-8?B?ZzFXY0VMNTZHdjNZRmFESno3SExVZkJ4Q3EvdDVoWFZpdnRxNnpOS1FrSzR5?=
 =?utf-8?B?U0V2Zi9RVElSLzI0MHd2VHYyWUZWZGROU0RucGM3RGNTdDBTWlZxWXIvaHhH?=
 =?utf-8?B?dzhFeXh3WkRWNHlJYnluMGIzUTY5K2xLWk0reWlveEU3UTdFaXVUeG9INUpx?=
 =?utf-8?B?R1pqa3hRVnBOa1MweE01MkdzNUNLZEExd2VlRWZUc1hjSmc4R3RDWFMrL0E2?=
 =?utf-8?B?MW5MY3pTK1h1SUVGcFRIVkhraisyYU9RRHZhNGNnbm1MYncrdmYzM1UxUkdB?=
 =?utf-8?B?Q1AvUzlScGFqWnVSVkZibnFSMGhmeXVjSW9YY0pnd010YjJKRXNmdHFSTk1O?=
 =?utf-8?B?SERmSEZTL2QwT2lDVStNVFN1YndlVHMwSjN0WDNtUlJzMlVFYjIyWXRKQ1Nq?=
 =?utf-8?B?dXllVDQ5QXFvY1BpZkZIOGl3TUVGN3piUGR3bmljZWE2MlE5YWlYNzVLdGd4?=
 =?utf-8?B?L2NBRFZLTmdwa1ByUkt0RnovWnVtbU5BTzdpOCs4SWpXN0lzUzBYSkJSQmNz?=
 =?utf-8?B?Y0VqV2hPK1VuZlBhUTUyTGhmbFY2YXJJT2FZbTkrMHExdS9NV1lLSFB2L3U3?=
 =?utf-8?B?emoybkFaME9kZWZmc3cyeTJycG9LSHdONmlvVTY1REVsRTBmZStyRE4yRGhn?=
 =?utf-8?B?THlORGpVUHVFTHZ3TjhUdzFmdXJ0MWV6cUFhOE83Ylg5dDFubXcxa3VYcUZC?=
 =?utf-8?B?bGVvOGV5VGt6SGZBUXN5WHlUcURWTTNPb1pLRFhRTGg0M2I3YjZpZytyTmZj?=
 =?utf-8?B?V1RueDVodEVZY2RUTXJuNXY4SlFEMUk3b3hXZmJ4TG40aVNxNUtCZ2Q3RUUx?=
 =?utf-8?B?ZExJcGtnd2JZczUybnJmOUdyR1JDbFRwVFhSR21BYXdxNWwwcnNnMkdZZkRN?=
 =?utf-8?B?WlhnVkM1N1dHMWNKc3IwcDZPeW94eDUvMW43WkNyZTVVQ2x4ell6QkRaT1R1?=
 =?utf-8?B?eGJqYUQzckFBRmxvS1FDdVV1aWJteng0a01WSXpGR2FoYlg4N3hRaTRJY2ta?=
 =?utf-8?B?cldJbmIrYVFTZDA2NmdXT3hyRmluQ3gxcEEyTTkxTUtOTmFrV3JJNkczdWNZ?=
 =?utf-8?B?dldVUncrdUlMSmtjRUQ4MU1VQTZKWUFnTkhaZS9FekFHNWMyZzBpd0JiaU91?=
 =?utf-8?B?M0Z3c0FXQS9iNTlscXZlUWJmdHZteEswVEZXbDFRM2Q3NmZ1V2czTmU5b3JK?=
 =?utf-8?B?Ky9zQVpjUkRTZHFwaUYzaEZnMENLVEdHTE5hQmcrY0lNc0tGeDVxbndrSFU4?=
 =?utf-8?B?SmlIb0pTM1c4WGo5WUhBUjZSQjZqblhsMUhZZm9QMU5wRW1iSFdrQzNDb05K?=
 =?utf-8?B?d1F4UXo0SldqVTdmOEMydGMwUjY4aUJIV2ZTdk1sSmtUd3VmYkdNRUdBc0k0?=
 =?utf-8?B?UCtGajhTN0tnR0RxV0tGL1BKKzlOMWFZUUQ1UXh6K3B4Tk8xZjlDWHVMem01?=
 =?utf-8?B?VG9FM3ZydE9kc3AvTlBDSFJpWnJKczFiQVFVUEdIRGh4cVVyYXNpczJFRkQx?=
 =?utf-8?B?TGhBeWw0VDUyUDhpTVVVK3RYVmtvVTdWTUtCTjVzRkJwd3E0U1FydFhtazli?=
 =?utf-8?Q?XeN0P5DYCLSTZhJO8v?=
X-Exchange-RoutingPolicyChecked: paprf8C0rP+chT3xP24+RPiXO4Mlh5C8WrYTZ/7+Zv5uRI7jW/Zi8WRLzJhem9UOVfhFjVX4yezrlLzIFdnt2k6ULKF6iYmUa/k44NRp5xNSON7CTSNgGvQqW56XofnKA7c8QjRriyDNjWHK43TInGgrddiHcXlLxqRd8iFZgiE66diJzEeb+y3NF/jfCj28LEMVsdLsepgsb/2Ta75JPDAJkvFzy05sowmhQcdI17cnZiKt/3+A64Grd3hiRbXX8w/JxQkb5Xrwi2IcWlsvnBN2sh708Vg1yiqdUYhDLeEDQ0pj/RFwjvsFg158U6xx/EbtFBnzbMERXkmtEquRlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cc3566-3f75-4d62-f438-08deabd2b567
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 00:51:00.9425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JVscmds300jpCe4nNGNuZlcGYcCSNYF1ovsIVpswXWo96sdfhuH87p/uAt8GXnri2YhzKdJTMJiiSfQb5E95g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
X-OriginatorOrg: intel.com
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



On 5/6/2026 11:31, Niranjana Vishwanathapura wrote:
> From: gta <gta@DUT4637NVLP.fm.intel.com>
Hi Niranjana,

It looks like each patch has a stray "From: gta 
<gta@DUT4637NVLP.fm.intel.com>"
line in the commit message body, likely due to a local git config mismatch.
Please fix and resend as v2.

Xin
> Allow user to control whether the multi-queue switch should
> happen after parsing the MI_SEMAPHORE_WAIT instruction or
> only if the instruction is unsuccessful in getting the
> semaphore, thus having to wait.
>
> Ensure that in xe_exec_multi_queue@priority test, the multi-queue
> switch happens only when the spinner has to wait for the semaphore.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   lib/xe/xe_spin.c                  | 13 +++++++------
>   lib/xe/xe_spin.h                  |  6 +++++-
>   tests/intel/xe_exec_multi_queue.c |  2 +-
>   3 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 4dc110c222..14952ca90e 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -179,14 +179,15 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>   	 * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition controlled
>   	 * by the user which acts as a queue switch point in multi queue mode.
>   	 */
> -	if (opts->multi_queue_switch) {
> +	if (opts->multi_queue_switch || opts->multi_queue_switch_on_wait) {
>   		uint64_t wait_addr = opts->addr + offsetof(struct xe_spin, wait_cond);
> +		uint32_t sema_cmd = MI_SEMAPHORE_WAIT_CMD | MI_SEMAPHORE_POLL |
> +				    MI_SEMAPHORE_SAD_EQ_SDD | 3;
>   
> -		spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
> -				MI_SEMAPHORE_POLL |
> -				MI_SEMAPHORE_QUEUE_SWITCH_MODE |
> -				MI_SEMAPHORE_SAD_EQ_SDD |
> -				3;
> +		if (opts->multi_queue_switch_on_wait)
> +			sema_cmd |= MI_SEMAPHORE_QUEUE_SWITCH_MODE;
> +
> +		spin->batch[b++] = sema_cmd;
>   		spin->batch[b++] = 0;
>   		spin->batch[b++] = wait_addr;
>   		spin->batch[b++] = wait_addr >> 32;
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 31154997b9..db0febd8ab 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -46,7 +46,10 @@ struct xe_spin_mem_copy {
>    * struct xe_spin_opts
>    * @addr: offset of spinner within vm
>    * @preempt: allow spinner to be preempted or not
> - * @multi_queue_switch: Add a multi-queue switch point
> + * @multi_queue_switch: Add a SEMAPHORE_WAIT multi-queue switch point
> + * and have the queue switch happen after command is parsed.
> + * @multi_queue_switch_on_wait: Add a SEMAPHORE_WAIT multi-queue switch point
> + * and have the queue switch only happen if waiting on the semaphore.
>    * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
>    * @mem_copy: container of objects used for memory copy (optional)
>    *
> @@ -56,6 +59,7 @@ struct xe_spin_opts {
>   	uint64_t addr;
>   	bool preempt;
>   	bool multi_queue_switch;
> +	bool multi_queue_switch_on_wait;
>   	uint32_t ctx_ticks;
>   	bool write_timestamp;
>   	struct xe_spin_mem_copy *mem_copy;
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index 0479554bb6..6f90c3e4e8 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -459,7 +459,7 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   	for (i = 0; i < num_queues; i++) {
>   		uint64_t spin_addr = addr + i * sizeof(struct xe_spin);
>   
> -		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = true,
> +		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch_on_wait = true,
>   				  .write_timestamp = true);
>   		/*
>   		 * Pre-set all spinners to preempt-wait so each queue, once

