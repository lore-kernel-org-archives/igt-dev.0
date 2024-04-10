Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3EACD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ABA1133CE;
	Wed, 10 Apr 2024 14:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtmuoCn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5465A1133D0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712759784; x=1744295784;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nDW+mf+LYswXvG79nd+LeZJUMQs4L1qihgoNXhUTQNs=;
 b=KtmuoCn7/GQmNsF5CKWQ6R/pAzrosHgf4R2ksgP/3lKtXMmtyzXI1VHd
 2cdzzfSI1XsjHe4Li+i2zuBmbBURUjP9Qm+hDg0x+tBZs6UCX5w6M7NsL
 0vXkaxcrfiSpmZ6KFWiKza/SGIooa7YIqMdFNrpy5vVH6jnuKDuMTcs4T
 NfWQDMzwqPB34RE9IhE3RXtZZfdCKv1GM/IZpIQfQHwivs0l7HbsmBTtD
 ksRiR2bIN/CV7e+xGNdXMr3sepAXYTFLPkhTnwV8KvTz3YGCvu/tb+2mY
 IAKO8CLLMNZvTrOXwvS7wdqalZ3AgsDnzYvxR6IuQu4UL3PhMZR59SP2a A==;
X-CSE-ConnectionGUID: cs5remqmRFKzyjNRdEbVmw==
X-CSE-MsgGUID: veOMlw9OS12DBF5zbceYHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25634839"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25634839"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:36:23 -0700
X-CSE-ConnectionGUID: k90Md1d/QR6jOif9nz3X6Q==
X-CSE-MsgGUID: GglIGR7TS0C0360yiAmt6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="21052854"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 07:36:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 07:36:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 07:36:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 07:36:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPs8HSgCpjSw3XwbaDhbtjsiQR4bFr6UXuxVvCtw9971kupeUMeomKuPjQQ/fPepy7U0UMgFa7WMVuuzI1wKiG7lZsUPzKchH8apv62qaZndh3Au35ECDira+IWMIvkLJbOFyCTv3QZ+XNj6ymX9qFjGIBmjcRduVv59hVUMYfREplw5+cJL3c9F7IFv1D4oyYAYzVudAa8zT6lQZyw/xxO/iWMwC063dK9QCW3qOrzrDt2puAESleMAK6xEC/b2+HkVywo5/GtNWD3hbGdTYYzH93zH7njRy5PS1y6t3EHIfq8+OGIxKUcqgCrcRofvBWO7mrTbp3nK5F0a0UmQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/kD5F/kAqCOK5911eSbLzfPcUtP6VoDRJkpLLcrHz0=;
 b=GuW0CSW6Ie6OT/qVdZRLGpWLo3bmW4JCMq4tVO6sJo1Lme1q+2ohpvj4dJacPNFI/PTighBGD3FPnMJL7pT+VGTNBVLrLH4JmBSL5Ka+oXEoOs5od0csomTaelcTySUaf3DGvL2/kj6Tkj9k+d2gpuhxbQxUuMIFKlZuGyOi/TA2zqH11kTJC8tdcb7gFV567kRIkfu96ZK8BK3Pi2KhB+dSASimm+ACExGLzAesC9Ak3Fyc7yOtxU2aP96569smG49mRdfsO7mURklnPlfEQXwJt6oRHKxHA0rJBKDxiPc6Fpn8FVWZ2/Lk1ehBl5Sy6BuA/MXcvlD2VEJv/owyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 14:36:18 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7409.031; Wed, 10 Apr 2024
 14:36:18 +0000
Message-ID: <f82d5442-6504-4f9a-9395-ce81e004bb9f@intel.com>
Date: Wed, 10 Apr 2024 07:36:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/gem|xe_ccs: Check surface ccs data
 instead of naive comparison
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Stolarek <karolina.stolarek@intel.com>
References: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
 <20240410100915.48541-3-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240410100915.48541-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH0PR11MB5062:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /LrWKn/CCQ5FK3W7Zhl3Tl0LD1RHKpZ7ZOKwX8WC2tJLonJ2EXdPXbcZN6vY0qjzKlbfJWR2cmqh6SM8a2iYYhaavmpg1FQi+UDeRhJKcVqAbb9ahPJ8CUvG2Dhu+vxZmFHDanMelWAUov242oDfv/kPriG5PQSk+zsHOy9WW2Bfgo72flpNXsr994NP/ViwzDpTFiUPXq7pBSVygyd1Yg41Rm9DGnzhEK2+2/vuYs1jVEGDe3fFdNG5fbNOR2vojjD/UsKPFvPH79GhSD4uxBviUVWzbrchJX3Qh0Pn27WEZiSNafgmcWtqBm5tLUAedQjE7gEgAuo4rRL848eWlXPbva1b3FWLCLgz3D/dcafpXfhzoHT8RGKY3Nl/oenbZf7QOq33KKBOZvltOJnLsTA/ZeBIOPVO99nsd2JMUMChkBq8uqK3HsnMXaQkCYLwvcKPVEM+xlof/c6hO7EMG1ItCZ1sgXr9cIhCNfZym/zemaq/gwLAljEcdGS92akmLZySGS3mJKE6r1SV76S+uVuRbWvjOUfIDhR5ixNQR85+EeZEGkOl6Z1m/nCDFyUmV+KnJ2iifDr6XndP1oK9K7nNTN0Fa18Ytvjuvq7gSjFUO0ToE7eCXQ/u4sRcDeJ3ETDvt8QFhNBmk+PGo8llA3M/vd/sDpL4V4gwxFmemAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1oxTE1XaWhESk0zYm9qSmVMN2tUUmpKQTZEL2VGRHpzdG5XbmQvWHYxZXl6?=
 =?utf-8?B?ZHJ4YzVXdmw0dmhzTFZjQlRnN1FSeG5sUE5nTkNSdmxvZXg2UXA2TjBTdzRr?=
 =?utf-8?B?NllwWnI2QVNwMUN3T1Z2ZHNmRlo3VThLdFR1VStrMnhVNmRGNFdCU2NheW9u?=
 =?utf-8?B?T1ZueUlwOHJOT2FnOFovdzVqZU55a1JvWnNDSUVTMUg0bDVzT216aGNTM2d1?=
 =?utf-8?B?MEhsUVlaOTNMRjVNaWN3bmRsQjZISWV3VXRibmF2R3NKakRNTFZSWU8xT1JI?=
 =?utf-8?B?YU5PbWo5ak5rWm1NaHRjQXBlczVCVDRmTnhSS1JMNEw4c25pNkZ1UHQ0RkJU?=
 =?utf-8?B?cGozUExLeUtqSGlPS3J1Q2Z0VkI0SlV4NmpvSk5yL0FsbU96R0dUalVSNWlK?=
 =?utf-8?B?UVRjM0JXVWlBdnV5elFRd0lCTG5TQlZZU295d0xNV2x6dEVLaGowUEc0eVFn?=
 =?utf-8?B?bEtkTUdEQktwRlRRalN4YjhxYlZkd2FXZFdtNlFlYTZSOXI4NGc3WWg5QUlx?=
 =?utf-8?B?TmpxcWFxZ1ErR0RBcXhrSDIyK0JNeEt3eDE4OHFsRVpDUnZxcGhSVFhUSTdy?=
 =?utf-8?B?N3c2K1N4NmZ4QTN5VHY2YkR6aXVsbFNxWFI1bmJud2MxTWRsaEdOSm55QWVU?=
 =?utf-8?B?bGdERU1KVXBxZ2hDVjZWM3FZUndlNWtuNUlFZ0FrSFRCMUNicjZxMjYzUk1G?=
 =?utf-8?B?WDdlYnFZTmt6OFM0TC9FRVhLNlQycVF5a3J3OURnQzRBckJVeHVzSnhnT0l5?=
 =?utf-8?B?L1ExUEdhd1dWN3VoSWlvZEtmMi9pU2VOWjhuT3pNK2h3S0RwRksxcGd0eFJB?=
 =?utf-8?B?RkZxSnNjeTFnclVXMDRFYjBFL1lxRjlhOTU2dWJuUG05WndPcDQ2bVM1K2Er?=
 =?utf-8?B?TmZVS1NWSjlCei90RXo4S29lOVFjYlJzMHVRK0ZLL3lkM2xJN285M0lraWdE?=
 =?utf-8?B?cFI5b1c5Ti8zNjFUUXIxeGY5WVBDWWZDNnBndnQ5RHd0WFFkNGpsVkxOV05N?=
 =?utf-8?B?V3Zzc3lCZzIyMnQwbTRoQm1na3g4NVdIa3AwbkUrZ0g4eFVFbjBtaGUwVGN2?=
 =?utf-8?B?RlJnWnhXTjdzMlJ3Ri85YktjekZOYzlQanBodTV5eEd1UVFZMTVSc2ZyZDFi?=
 =?utf-8?B?c0V5VFlUenAweDRFM2JqRW4zSitxVHRzTkYxYXJLaitGN2hPcXJ2OXNFZWRB?=
 =?utf-8?B?QUFDSHhpdUplaitOZFg1cDFYK3NaeERib3lGclBQSW5ZUlNzNUUxa3l3elB3?=
 =?utf-8?B?OEk4V0lzN2NjUFZrUyswWHByS0p0QVZrVWplamlzaHdobml3VExrRitHNDRY?=
 =?utf-8?B?Q0F6UVAvcTFMYW9nRjlDNGpTbysvSHZ3NW9TbjhpdnlxQW1Gb3pUMWJmQ2xH?=
 =?utf-8?B?bWlTT3FLZzdGdUV1NVM4TkgyYjUxaWhpRWxrS3QzWlBPaUxQMmFyUmkwV2Rw?=
 =?utf-8?B?R3pLaDg5N3JzM0lQVWxISGNzUVUycDRXcFlFYlBhc1YwWkxWVW9HK1pRUVpO?=
 =?utf-8?B?TjJCV1djMjk4dy9WdVZ3UVVwZHVJZ2tzM1ROYXl3T3VkZkdta21jcXlKSWxq?=
 =?utf-8?B?OUEwN3c4RGQ5anFYNmt2ZjdHTkxJU2YvdXFFVnV5ZWYzMWs2WmZ2UWtQTkRB?=
 =?utf-8?B?dnREcjZ6QUdnNGVkUW5MZVBTMXRKNG1oWWZoTFEvZmhnQUxOanZKN1UzTjNs?=
 =?utf-8?B?SWpNUVVHUEsxZ0s2emoyZTZEMzNmdmhCWjRCdE15WHAyZHUzaGZtbzg3dkJJ?=
 =?utf-8?B?Snk4NGg2VXkwbG5SV2FLQTdxQ3dZNzlqZmtPRmloTktRSjJTUVRHaWJ6RlQw?=
 =?utf-8?B?UEcyWlJqMmlRMEx2d1lpcmdQeU15Ti9seWVYc1M5eTMyUm93QWtpZHFUM0Vl?=
 =?utf-8?B?R3hqNGhIUTZhb3VOTWJnU0xCVHN5UjZhS3BjdlpqV2dQaTR1ZkZpR0R4bWt2?=
 =?utf-8?B?RFhXOHNhMTBRNVJ3MVVOelZwM096V3dNbFk2WTNqTFpUQnlUTVR5cEw2YkFU?=
 =?utf-8?B?RmdLMjlENVFiQXZZcFpxQ0hEL3J5bC9ocHJkYVVPQyswcnprNnp1QkhsNUg1?=
 =?utf-8?B?TmNKWitScnNqM01Ec0VMTnVyVkF0NHZ6SXNzV01RVkp2U3VXWWpPOTlKdWgr?=
 =?utf-8?B?SklUTlU3VVRCdmQrMUtZclliMlQvdENVT3M3NEVzU2xzMEVHa3RrZlZQTnJO?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8338b0f9-cf00-4507-24c0-08dc596b9583
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:36:18.5414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zt+qHhRziNB571z8ZeGgdb5uHuo1nzVyu/XrLOPUN49tKICYXCuNhbcrCmUlkkTGG1dRh9+fBX6F+CQ630x70+p8HYRwp/wYyt/pqvlVm1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5062
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

Looks good to me:

Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Best,
Akshata

On 4/10/2024 3:09 AM, Zbigniew Kempczyński wrote:
> Start using function which extracts ccs data from the surface and
> determines its compression.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
> v2: rephrase comment (Karolina)
> ---
>   tests/intel/gem_ccs.c | 16 +++++++++++++---
>   tests/intel/xe_ccs.c  | 14 ++++++--------
>   2 files changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index e4126bcaa8..a8e7e8a747 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -305,6 +305,10 @@ static int blt_block_copy3(int i915,
>   	return ret;
>   }
>   
> +#define CHECK_FROM_WIDTH 256
> +#define CHECK_FROM_HEIGHT 256
> +#define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
> +
>   static void block_copy(int i915,
>   		       const intel_ctx_t *ctx,
>   		       const struct intel_execution_engine2 *e,
> @@ -359,9 +363,15 @@ static void block_copy(int i915,
>   	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>   	gem_sync(i915, mid->handle);
>   
> -	/* We expect mid != src if there's compression */
> -	if (mid->compression)
> -		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> +	/*
> +	 * If there's a compression we expect ctrl surface is not fully zeroed.
> +	 * Gradient image used as the reference may be not compressible for
> +	 * smaller sizes. Let's use some 'safe' size we're sure compression
> +	 * occurs and ctrl surface will be filled with some not-zeroed values.
> +	 */
> +	if (mid->compression && FROM_EXP_WH(width, height))
> +		igt_assert(blt_surface_is_compressed(i915, (intel_ctx_t *)ctx, e,
> +						     ahnd, mid));
>   
>   	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height, bpp);
>   
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 7d0f2f2a11..b3bf97af7e 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -359,15 +359,13 @@ static void block_copy(int xe,
>   	intel_ctx_xe_sync(ctx, true);
>   
>   	/*
> -	 * We expect mid != src if there's compression. Ignore this for small
> -	 * width x height for linear as compression for gradient occurs in the
> -	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
> -	 * xmajor.
> +	 * If there's a compression we expect ctrl surface is not fully zeroed.
> +	 * Gradient image used as the reference may be not compressible for
> +	 * smaller sizes. Let's use some 'safe' size we're sure compression
> +	 * occurs and ctrl surface will be filled with some not-zeroed values.
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
