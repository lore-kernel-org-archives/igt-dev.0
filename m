Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F61EC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 13:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BB011271F;
	Fri, 29 Mar 2024 13:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIfePv7v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36BC11271F
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711719658; x=1743255658;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lmdHZC8wGAvbWOZliYrd+Aac+zR74rGbqa3fpYK/Zfs=;
 b=DIfePv7vx/Wi9bn1Zm0OUXJBmOw7Vb8ucfeve9+U7DPqytNdYznkLSmZ
 Ldhk2TNKh6xjlbLH2MuS4HKqomvwpveHxZa04isNgJ7l/nhIhoCBEhdT3
 Azbl4JfhTMFWUZX3vpu6POCeZd4PUyrj/4A4yazz5etiI6pm3SjYQEO3Z
 iohfoMVq6dqsL2i7jcWGRzh3bzgz11ZUGZB8IgJUh9pLbHQF5UfQ8YpQu
 SSD8IW/gDMAi/6M+i/axQrQwjl3L0qlTLd1u9j9PtOsg9SaUOHzkbydsK
 OVCP2tDcAQMlDa8/anHC+XGCykBjinYKgnwPZAy0jzuyOLX+HQqabFd8h w==;
X-CSE-ConnectionGUID: Da8dAtCbSieOH7GdCF4oaA==
X-CSE-MsgGUID: rwTGc6p1SmS/LwmVMqw1aQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24360482"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="24360482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 06:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17039670"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 06:40:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 06:40:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 06:40:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 06:40:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 06:40:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWvelZChMSJQqmo4lsUHd3wxLIaVe54TDGogZMXQhIa04y5YiGV2RgY8xj5ofWO1+WAZQjms9rp4NLoUbZf/BVzkr5yPsagNKjFbAKqSfDTW+Um9ObS8OAZpLCyHIs2SrRChw0nQ+bqXKL5W9DergsLPcyCBDU6Gf2N47+RDNYnCjwm7PQ11Ll9pUqVSizJYZdIkZ43HXIvo/QFqbjxzf72H/2REyInAgQ5i4IOG1QpQvoDOIrR3EaNBw/1+DrEiE/CZ+/2PR/f99jCCMdPVKX7Aj2lB4ctKt89nFI5NjZJPzmKqAGE+6bnyiCVITJtrRm32trp91cdh8SLXgIZ0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDuReVrZryI+Uu1Wi7bO1qZDA3F4+cFs33J929mGETw=;
 b=QenlWq7cuGhfR6RHoV8NLmpqpKORydvI8Or4AbaaL/SeViUmvDJ5Dhd1R2CzscsKkAIy1fGqW7eVjBl4ppWsVos4GsLEVL8CheMlrXQrdU04wBDLWd/WxIPDh92d1rrsV7H7ma5c20a6xRiO3+uvT0d/ydSE+P/ATMzQPgmPsvDDTOP+UFCvZdU/rXvRtlHxu/NjyKB2j9q70Bl/GUPbzsWmNClsWS1WfqjoHT5zTpxW2Fz1qRkH07ta72YiRcXerrmPPvnlYBiH9aqDv/EGkeYVDNrsuG2dW930xmHIxZ3spKlA/MWcAppE2vLKlHHoRtISPQZ5LZrRkZECq53IbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 13:40:54 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::cb4f:467b:3a52:9494]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::cb4f:467b:3a52:9494%6]) with mapi id 15.20.7409.028; Fri, 29 Mar 2024
 13:40:54 +0000
Message-ID: <8e2ab6f9-7619-43ef-8cab-29c3a7e8bbd9@intel.com>
Date: Fri, 29 Mar 2024 14:40:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/gem|xe_ccs: Check surface ccs data
 instead of naive comparison
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
 <20240329091655.1347862-3-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240329091655.1347862-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P194CA0012.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::18) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|DM4PR11MB7256:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gSzGrL/gB58LRthIxWJiFc7VB/eS+tz+77jApjO2AMYYtzOaoI1DJ8gpqX1+h70IhZ+F65b5tgr2s8wVFg3PNwMSaeTMz7S9SxD10IbAnYaogTYiuHgOkV/YNdfXuaphCBrF0xUJjPJRyqG9d1xRWwVyKaq3WCa5buaH3/dlIMGQdtwDz9CYVhcY4po8Mzn0SDTDBCHJVmFP1bVmsgnXLi0wnWPlYpzqtJ5t5s+ZPKw9sKdELyugLuR+Ui9+WMfn5bzNFM3VYT5SXr2VP3vdqGbOXK0m4cc4/rMfOdUvtRHBr5bpQ/RgBfwGQlqiqVVF/32/UiO3vf3O13iKxSv5Lk/4CbjaNoOwVT5hC6Zjn+y1OBWIkKVH5KEFEgQkmG/EqO0yVX4uwIxZ7uxx6e1KoZnJsCFffHVA8d056A/leejOo1hTekZgtBxgNZbY5OXAAVzCPXH1r6WBCwzOk/Mr9CZv2Rcr/ID8pY8ZLmPguBOSAHp/HqJG9Qw3vnBQ+PZ3W9MB1LrH+IjfMQBgWRS2DC3jU0d9FBkYuEmk0mBos/9+qXpTYSbhe6SfFSa+Wta71+yWU/qf/dSBKlq4vD+BOwJJ8PimMfg9f5P143Et/pRlMHbDNogwidZu3WVq5/djVn671/5/cnlE0RjfnSncPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3BVUU92Qk5UTGZlMmhhOXhEcDRkek85cjFXZ202UThtQVYyczZKb1FTczhU?=
 =?utf-8?B?dkN5ZFQvdXkxaFlzWndTZmR1NWRsYmk2UVMrOEhvMURuVmlMZUlSdkk0UzJR?=
 =?utf-8?B?WDFOU21DcUVDV3B6VVlVZ3FzMUtkQ1QwK0pZOFZEdkM4SjdOcmVxQXNTd1pz?=
 =?utf-8?B?WW9sU29vcGdZZmdGTXJrUEg5U3VXUHQvclBLV1ZWazd5UFNqd29USVdKcS82?=
 =?utf-8?B?NmlkZDNIQmpaK3R5L3l1S3dNanVlTWVrS3BKRHkyNlFXcDgzc2NQT2x0WGN2?=
 =?utf-8?B?MFJhVm9ET3pqS2pCYWxpMzVEQ0Q2dHhlRmx2dUw1d0VicW5TZ3pVK0lmdFJJ?=
 =?utf-8?B?MmdHNWdpVElNQzUxOG5Ed3hkQlJqVm1CZGlFZjV1TVZQeks1ZUJmQ09YWmwv?=
 =?utf-8?B?SktxTjdERWxZSFBxYktnWDgxMENQUUY4UG9FRE8xa1dTUzVnb0phTWE4Q0Ux?=
 =?utf-8?B?TzFxaStQR2gyM3R5ZHYvaWZPT1VkQkN6Z0pMNmNHUlNSclRFUitJcnc5L3NC?=
 =?utf-8?B?VVFqV0Y3N0Z1Qzh1SmhUSHBmOS8zUjF0Mnh6MVlpc0JhY1k3MGJJNmVsY081?=
 =?utf-8?B?TGlFWnJQckFRUjJ3eFhRdmNVbndWZGtlbUQ0NHFGWXU1TU9Zc1hrWE1oTTha?=
 =?utf-8?B?SnlaOVZST0lmZlZnRVJsMWJHM2k0NldlVlovbWY1MWFYU1VSaHk3QS9uMm42?=
 =?utf-8?B?SmdMNXltQ3ZCN09UOFBxeEZENjZiaHhNd3JzTWNCTUZKL3BtVDRQMFhpdk5n?=
 =?utf-8?B?Q3dhb1FGTHR4THVtMWgrdm9iQklZaW4xaThNYzlobWkveUlXeTdENEZYTFFS?=
 =?utf-8?B?N0pvR3REL0Q5b21LQS92WFc3ZTI0ZzNWUW1sYXhxcFFOZE9YbWI1TjNyMDU3?=
 =?utf-8?B?WFord3IwNXdDR0JZd0FaZjJsdURkMmRoYjRZVmsvYURIVjlTQzZDY293cjF3?=
 =?utf-8?B?SUs5QkszSm5pOHVIWURnSVVjaEYvOWhUTGlIUVllVHpPSVRJTGg4WGVEL2FN?=
 =?utf-8?B?V2VsVitSQ3RuMWgzTmw3VjF2b1FSYkczMGlGZ3d6WFpsUFNhbFVlMC94a3J4?=
 =?utf-8?B?ZW55ekxQTytiYnhDYUhJNzU5amtmU0VSZllnUmhTSVpjdHpKaFIwd1JzSjl2?=
 =?utf-8?B?MUs5Z29nWGZJQTNZbGdYQWRpNEpIaVdIYmxwMERsdnpjeWFYR1k3djVzNkxv?=
 =?utf-8?B?OU5NbklJV3VmbTBXMHc4T0JORWQrL1Y5dTdBbXp2V2FEMFAwRC9CRlZFZmRE?=
 =?utf-8?B?MFV6ZFFVSkZqNThmL1hZdFZwZFUrTVN0MkpTK2JZem9oZ0V5YVNHNmE2d0Fh?=
 =?utf-8?B?b1c4YlNyY1JUQ1J2a2dPTlZlZ09GbjkrNHJKVFhtdzVKNTVxZlkrK3VrQ0Nr?=
 =?utf-8?B?MTFFdDhCT1EvT3psMUFGRkJEeTdkVjdHRzdab3VSRFdZR3BFaGZtNFlOa081?=
 =?utf-8?B?UnpVcVRSNE9QUXFLVmQ1dkJ0T09tMW5FNnN0WExPMUlMR0VQajhBVHNpN0w2?=
 =?utf-8?B?L3BtY2Vvdk8wbCtFTlJtTDQzbnloU1Ixa1B3SzcyWVU4OTA2L251ckM4TEVh?=
 =?utf-8?B?YVRJL3JVd3pCZXJDTm9EZDc3bVIwQXJXcE0rYVQrRm9LQXV6NUJtNjFscUZ6?=
 =?utf-8?B?TTVJN3FhTC9tbkVuQVRiSEgyOElOTFF2aG5zRFFUN0t2eFZPc3lReXV2b1ZN?=
 =?utf-8?B?VW0yTU82N2VobUNkbFdzN01FRnB0aTM4c3JPN2RvMTlWMGdlMU11ZFU5YXZv?=
 =?utf-8?B?MTJOWVBvcmNpdEFKQmVMS04xSkZkampib1BTUFdad1RQWms1VVFlQWRtMXZs?=
 =?utf-8?B?UURQUjlpVUY1Ymk1Rm5UQW1EUWdYRHAzRndvbTg2d3poTDFHV2JraGU1bmtJ?=
 =?utf-8?B?Rm9rQjBDRi9TaEU4YWE3V2xiNmsvTEtyNkNLaEprZVlVT1dLWTBuYmE0djVY?=
 =?utf-8?B?Z1ROdUp1cFB4Y0dSQWY0dEJhTi80TUtocTJCT1dsaHAvcUlTVU9yQ1MyeC8r?=
 =?utf-8?B?VTE3YWF6aHhyOHl1WUlkU205WUhiWm1sQmIyZVVpUUxqRnpmTStwckJLeFFH?=
 =?utf-8?B?MWdHQkt4Vys1SEtsQi9kVldFekkzT2xzUEplTC9RWDZMV01ZVm5ZOU1ubGow?=
 =?utf-8?B?WXVsTmw5d0g5QVVkQ0hWSXhvc0dLSUhtbkMwUm1yWnVWZjJONXUvYm1rRjZp?=
 =?utf-8?B?emNYK0tNY3dTWmJ0dmhDaXIvMUZVdG1ncmIxNGZJZlpJZUxzYkdSeHhlZkNK?=
 =?utf-8?B?UXlGeGJiWU16U29JcU5ZK2FVNWhBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c64a7fe-9c1d-4529-d75e-08dc4ff5db47
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 13:40:54.5450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miHZwIEXRizvkrk1pYObBSwkFtsnpc0ev5Hji7qNBOe3dthPfJJon0P7cVDUQZQHZOvPY8REDxnxkFvYtN5F4U2FQKepoMBfkKEVHJORLIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7256
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

On 29.03.2024 10:16, Zbigniew Kempczyński wrote:
> Start using function which extracts ccs data from the surface and
> determines its compression.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   tests/intel/gem_ccs.c | 15 ++++++++++++---
>   tests/intel/xe_ccs.c  |  9 +++------
>   2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index e4126bcaa8..c59fc69fb7 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -305,6 +305,10 @@ static int blt_block_copy3(int i915,
>   	return ret;
>   }
>   
> +#define CHECK_FROM_WIDTH 256
> +#define CHECK_FROM_HEIGHT 256

I'm not a fan of adding another magic number to the mix. I know it's 
hardly magic, you found it by testing, but could we at least define it 
as a half of default dimensions (512x512)?

> +#define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
> +
>   static void block_copy(int i915,
>   		       const intel_ctx_t *ctx,
>   		       const struct intel_execution_engine2 *e,
> @@ -359,9 +363,14 @@ static void block_copy(int i915,
>   	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>   	gem_sync(i915, mid->handle);
>   
> -	/* We expect mid != src if there's compression */
> -	if (mid->compression)
> -		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> +	/*
> +	 * We expect mid != src if there's compression. Ignore this for small
> +	 * width x height for linear as compression for gradient occurs in the
> +	 * middle for bigger sizes.
> +	 */

You mention we ignore this check for small surfaces with no tiling, but 
there's no check for mid_tiling. Is that on purpose? This comment 
applies to comments both in gem_ccs and xe_ccs.

Many thanks,
Karolina

> +	if (mid->compression && FROM_EXP_WH(width, height))
> +		igt_assert(blt_surface_is_compressed(i915, (intel_ctx_t *)ctx, e,
> +						     ahnd, mid));
>   
>   	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height, bpp);
>   
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 7d0f2f2a11..5525aaed65 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -361,13 +361,10 @@ static void block_copy(int xe,
>   	/*
>   	 * We expect mid != src if there's compression. Ignore this for small
>   	 * width x height for linear as compression for gradient occurs in the
> -	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
> -	 * xmajor.
> +	 * middle for bigger sizes.
>   	 */
> -	if (mid->compression && MIN_EXP_WH(width, height)) {
> -		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
> -			igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> -	}
> +	if (mid->compression && FROM_EXP_WH(width, height))
> +		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
>   
>   	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>   
