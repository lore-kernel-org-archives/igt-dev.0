Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4125C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 11:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A23410E575;
	Thu, 14 Mar 2024 11:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXD3Rwu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0094A10E575
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710414514; x=1741950514;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=4cO3oiis8ZqW+SKOElCuX1yZBzVbcIxBjbbwxyole0c=;
 b=HXD3Rwu6cNYNSMwiHFIvSDxE+fjfc5qvAlO4jQxQ0Z3URWXmfp5YRKQa
 b3LTwzHt6gaDNSaKKnAEbUn7jEfpCpJhnHl4jrflm81qGijfaEVUSpLIZ
 79gXJuHtcfNzAqOrXx8HKqjjavei7ZAloEOHRXN1eaQCoy/rHG1HDIywR
 uyVNdSSEpoCeKSIe59KIEYcLJCTUYnJZ45qu7cFRSKAwE99uZIJzmPvXK
 zdmK/YNsA2GPQlay98Zo+6/yJKcn2TNUKu/29k56yRYNCvTSulTN1ChwF
 4jBAHdLru8TMrk9PMgSvK2FoqSX1hvdeJLCmOc0GCaOXZF/e37ZEj9uU+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5165180"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208,217";a="5165180"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208,217";a="43178189"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 04:08:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 04:08:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 04:08:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 04:08:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 04:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq9Z87sGsdieJrfsWXExlWHbRp7UszUfN75wiggqdqzUAQjdUZnY76MPZkqkKa6lFJUE6roLJ78jdZdyyp1zpBD63YTHT1bP+7Nd84USGUm35Y7k3NsqH44XGfZIkH/o/0IjmHCELwgDEnHPa+cUkss4UgDuxYgA+XvZmMTOXg164KgLllXz2Y5S7gnkqSQ+rEwZTx4QZXRyuMh6y2F1rew3CfmN7J1B+jZdvtPVkjZ+SExwELXu0s0u0QINF4EfCkLyCg+Hvksa33lZ69qb+oQJoJygk0nXt8vxLUZaxRgmX3IkmgGtgLhEANZnYueBuiCFpZshondjDPlP66Xwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrYxYeM4SE4us7oKBBz/RRuGoFX/ZVXrm55dJ/0F0lQ=;
 b=mCO3NxUeLOx9KAJ2UmP3BChNUf1eLqEN4/K9UWz+Jt3UEpfz1lKSnBqjHKbmofErs3DOlw+bChJKzioB8T1LUkyGmjHJa1cKUkcbGpqyXrJ5iMMI2y4Dld2QD/eicG5Fy1434K7Jn1Rp8egPPPTSHloEJf0ZsqS/LZGmKKJOBah1nwJYGlpPIvzCKEZ3Q2fOpzOz6m0WOPrfYoCjtVTnIw8bFxpAUPCZkyQJxNruiWQ5LWf96L4Y+BfnP1JyLYEDhNvdWRL9m/yea1PKnKqPhIUgojM4x6ewJBu9pAgx4ZZpEbcsV82kJ9B1fsR9LJg/TWPl+LXS9Pv3nBXIlpsTyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.17; Thu, 14 Mar 2024 11:08:24 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Thu, 14 Mar 2024
 11:08:24 +0000
Content-Type: multipart/alternative;
 boundary="------------0Q3bS7ICnXTVlqcR00WDzESP"
Message-ID: <8abd0be7-e621-47e3-80f5-c9feef2d19a8@intel.com>
Date: Thu, 14 Mar 2024 12:08:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_compute_preempt: Add compute
 threadgroup preempt test
To: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
References: <20240313192510.2316807-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
CC: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240313192510.2316807-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: b144d2f3-0c31-4d75-499d-08dc4417112f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ja32u9NrJ1m1l7Wq/dCRpo02kPJK3PIJS4gA9MkDdnxwsfxfJwKiiyh66siykG3sCBcyL8TOhLP0b1B7tUROH1p6/1+lrgZfMDBMcPwEFmpE4e667DcKYv5jvcMlGdo6+9zeKur8yutnXHWQ5TuWe9R+aSL4HJPe1y4ZHxA7nTWThN7i1sG83sdiCMROYgdo6vtLEkxCUinxw1IUAv/QnoTuHRHoDyzIVI5KR5+5ogWa2jHG65QlVr2al+g/V09PqnEO9ud95Z/dlZpg276yZ2+qKUV90Jjr3WRsY7e+AB/YfPBr/NPiu5q9BikLIDSJNLy/J3OQAhL7SoaI54GBRDDadQTpdwSEjN9fhVIdCAecnJLcKw5oWRq+B+4Qr5MkoDx95MPHm+/60W8gwNYW39ZNiYnKnXhWwCNZsANSGJIT0rkrYtXyo1hLNubHZCQWrrQNzFUjf2UAToi0+le44KmGp7REDoKnPze9UwPDxU1dJVACwBaEFfYFU8SIiIWmltvY2IlSOP40J4DkdmCTy9exIwO/tC920J11BBJ6hLH3GpMFGTJ/ifeceTdIRf2uyjm+uD0Ol8d3Kp/0F9IXR+Zig8m2Hfh+N2tBVCPjWifpVL28hee5yK7qxlolv0EJ7p/eqVG+YaNAw1hzMzMx63N9ICrN5uVhTGUTIWTX0BE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STNWaEZzWDRRMlRpK0ZCUFJ5bVFQZXdJM09XY1pWNk1jUUdVem9lNCtnK25P?=
 =?utf-8?B?VEJqOUN0em1EcGhLdDZhSVdaSG95bjIzeUV4bDRoaDNBSXJmRHNCSjNpbUha?=
 =?utf-8?B?dnUzamdMNWw0eEgrYk11ZE0ya3FQTVJGRi9ZdU41eHlVKy9iWi9SQ1RxQmF3?=
 =?utf-8?B?VXJhc04wdklqY21adXpoSTVRNHY4cW9vMjFpRzlLR2VnV0FnOGR3MDNBUHpF?=
 =?utf-8?B?YldldUdmd09nYmJFMTNvRFZmQ1ZySUxaZnRldG0xYnl0Z2l6eEFMbEVob1Fp?=
 =?utf-8?B?eEd0OEcvUmNVaXRYdW1vZkpnVGVTVzM3dFY3Z3ZIdkJjZW4rOHZXNitXWGQw?=
 =?utf-8?B?QUNacjFacVFOTWNySUwxTWtHczIyaitOaFlJOGdsVEdlSHNzelR4YUdjUmkv?=
 =?utf-8?B?VDdGbVJWOEthMzFHeTlRSDlBTzhsRHc3U2x3dlZETmZHSk9oZENzR04zZmVz?=
 =?utf-8?B?ME56bkhmVGdQeGQydkROeDdnYm5oWjJxN1AyNUE1MTZNNzFtK3d4SlZhWnho?=
 =?utf-8?B?VFNENUVyS0poWTR1TFRNT2JOVzRlczZtYU16VTlMdStXZDJRSHA3ZU5aTklt?=
 =?utf-8?B?NHJ1TktmNHVoTTJiT3Z2NjltNWtpY3pQTkVjVTM4YTk2M0R3NHN1cVMzOGF1?=
 =?utf-8?B?cCsrZjFyYmtiT3dHUW5Pd1l1MEFKaUNnUnBjczUzWEJWdlByR1gydkVETGdr?=
 =?utf-8?B?eTlCOUtWOFFSTjlrNTdiRUFQdG5sUXV5eGozRzBmRFAyaTNSclR3QTArd3Zh?=
 =?utf-8?B?cVJHWEdiVSt0MHVYb3RKc1dTUG05OERSYVp5RDVDeUhnQkFRc3JUYmlBdER2?=
 =?utf-8?B?WFl4ZmgxOGd1MzEwcjF2QVNEQVVIQmJLL1FZVEpsY3BUdWkvY0Rid3JZTWQw?=
 =?utf-8?B?ajVZSDdXMGZXZmdORkdHaUQrUStxTjBQUXV0akdtSksvUENJd092NGJkT1Bt?=
 =?utf-8?B?SkxoaitxYXVtKzdXTUdIMDJySTRKZGJmN1JwbVJCeGJ0Q3ptTmZwcERKRFU4?=
 =?utf-8?B?b1pJSVpIS0lqZEVxN0ZqL3EzZU80QzFrczRZVlc0RGNmQ0tVdkNsSWZERStD?=
 =?utf-8?B?ZllZd3BFdDB0ckRYMlc5MlR1M0I4MnJHN0N1KzVXc3dCR2U3WEthcDNWYTdz?=
 =?utf-8?B?d2o2K1JUa1dtL3JvNytNV2xSSjIyUlRtV3pTVjh3SUN3cmVxc0MwbkxWMjZ5?=
 =?utf-8?B?NkF6WTNUQVI2VGhETUpLeFAyYUsxczFIWHdyeVNEWm4yY1JyZWtVZlhGaHpo?=
 =?utf-8?B?V29zTWNWblkvUXVMNWRQU2V4blQ3dkh0dUROOWI3WHZFZHNubGQyQ3g4Ymla?=
 =?utf-8?B?cHBWWjgwd3d3T1NuNGhIUFRlb3VQdmxDUVpKWk13N2VuUnhRVHRQVUVDTkM1?=
 =?utf-8?B?WlQzK25qbmVXTlMxMFlGZzlSY0w5UW1XeDQ2Z0U3MzFQVDFxMGVjRkczMkNj?=
 =?utf-8?B?eGZjcm9yOXNXMmNMOXROVHFxN1h1MVBsVGlieWVjaWtBZkM0UjNFL2luVWto?=
 =?utf-8?B?ZDk1cS9yTXA3dlhtWncxSFJ4T04rcnNrYkZDY05vWW9TS0VzNm1aYzNKYWw1?=
 =?utf-8?B?VlVJc0Q1VjdhOFdzNkUvbW9OZ2I0cUFoVFVjQndJYzUwWEkwemJaOU1lRGpV?=
 =?utf-8?B?cnhEVkh3Wnp6WjdxY1lvbzdOblJ5VUpwbzhjSGdDRFN5aks0SFdET01hWHov?=
 =?utf-8?B?dU9sQWtQdFVPRjZPSExYVjBwUytYYnJhbFAzNW1XOFkwQUlseTJmenNaaFhl?=
 =?utf-8?B?K3ZFemV1Y3lYbm1iT08raFlUZzdTZkZBdTlDWGs3azlGRlJmNlYra3cxZGlW?=
 =?utf-8?B?bVNVMUJmSmE0NTg1dnVEU0lvUDIwYXN6Zm5sUHBFbTdVYzZ2NWUvSjRvTkEy?=
 =?utf-8?B?ZkViQ3h1VVRjdTNrWXJ0TDRUT1NISGdPeHgyNmdMUERRL2JOejdmN0ZOSFlh?=
 =?utf-8?B?L0M3OHZpVG84akZDVkx5eFVCK0c2MElkcjBTWWdJMkVYdVpTRTRSejBqRnVN?=
 =?utf-8?B?Zm5rYlk0QXl4OGNPeXpyQjhDY1BXKzZCQzNCSFpmaHREYkV1T21XV244M1c0?=
 =?utf-8?B?a0ZaNSt4SkVGaHVxeTd0R0JnSFkyc2dkb1V4cCtCK1FOdTNrYWlmZ2FlTlow?=
 =?utf-8?Q?BUnAejKoD6Zp/TOLlKFq+0qcN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b144d2f3-0c31-4d75-499d-08dc4417112f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 11:08:24.5104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZEXlJ+RTb8exerqtBoS5+p6+Xaw6c7iwvidVWOganYQhYZ9TkB29pIaK1d5KnAPoIoGCW/gTjIgXqlmwqZDeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
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

--------------0Q3bS7ICnXTVlqcR00WDzESP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 3/13/2024 8:25 PM, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
>
> Test submits long kernel with a higher threadgroup count, lower
> iteration kernel and a short opencl kernel to exercise threadgroup
> preemption scenario with WMTP disabled.
>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Signed-off-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
> ---
>   lib/intel_compute.c              | 61 +++++++++++++++++++++++---------
>   lib/intel_compute.h              |  3 +-
>   tests/intel/xe_compute_preempt.c | 24 ++++++++++---
>   3 files changed, 67 insertions(+), 21 deletions(-)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index c5d253ebc..b33f49fb5 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1162,7 +1162,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   					uint64_t addr_state_contect_data_base,
>   					uint64_t offset_indirect_data_start,
>   					uint64_t kernel_start_pointer,
> -					uint64_t sip_start_pointer)
> +					uint64_t sip_start_pointer,
> +					bool	 threadgroup_preemption)
>   {
>   	int b = 0;
>   
> @@ -1236,7 +1237,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   	addr_bo_buffer_batch[b++] = 0xbe040000;
>   	addr_bo_buffer_batch[b++] = 0xffffffff;
>   	addr_bo_buffer_batch[b++] = 0x000003ff;
> -	addr_bo_buffer_batch[b++] = 0x00000002;
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size

Bspec says "Thread Group ID X Dimension" which is here used as thread 
group size.  Would be nice document how is this used

to control number of threads, I fine if that is done as a separate patch.

> +	else
> +		addr_bo_buffer_batch[b++] = 0x00000002;
> +
>   	addr_bo_buffer_batch[b++] = 0x00000001;
>   	addr_bo_buffer_batch[b++] = 0x00000001;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1251,7 +1257,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   
>   	addr_bo_buffer_batch[b++] = kernel_start_pointer;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00100000; // Enable Thread Preemption BitField:20
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00000000;
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00100000; // Enable Mid Thread Preemption BitField:20
> +
>   	addr_bo_buffer_batch[b++] = 0x00000000;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
>   	addr_bo_buffer_batch[b++] = 0x0c000020;
> @@ -1369,7 +1380,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>   				  ADDR_INSTRUCTION_STATE_BASE,
>   				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>   				  OFFSET_INDIRECT_DATA_START,
> -				  OFFSET_KERNEL, 0);
> +				  OFFSET_KERNEL, 0, false);
>   
>   	bo_execenv_exec(&execenv, ADDR_BATCH);
>   
> @@ -1527,7 +1538,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   					unsigned int short_kernel_size,
>   					const unsigned char *sip_kernel,
>   					unsigned int sip_kernel_size,
> -					struct drm_xe_engine_class_instance *eci)
> +					struct drm_xe_engine_class_instance *eci,
> +					bool threadgroup_preemption)
>   {
>   #define XE2_BO_PREEMPT_DICT_ENTRIES 11
>   	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
> @@ -1564,6 +1576,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
>   	struct bo_execenv execenv_short, execenv_long;
>   	float *dinput;
> +	unsigned int long_kernel_loop_count;
>   	struct drm_xe_sync sync_long = {
>   		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>   		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -1574,7 +1587,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>   		.handle = syncobj_create(fd, 0),
>   	};
> -	unsigned int long_kernel_loop_count = 1000000;
> +
> +	if (threadgroup_preemption)
> +		long_kernel_loop_count = 10;
> +	else
> +		long_kernel_loop_count = 1000000;
Lets put those const into a macros
>   
>   	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
>   		bo_dict_short[i] = bo_dict_long[i];
> @@ -1622,12 +1639,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
>   				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>   				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> -				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
> +				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, threadgroup_preemption);
>   
>   	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
>   				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>   				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> -				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
> +				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
>   
>   	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
>   
> @@ -1655,9 +1672,15 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   
>   		f1 = ((float *) bo_dict_long[5].data)[i];
>   
> -		if (f1 != long_kernel_loop_count)
> -			igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> -		igt_assert(f1 == long_kernel_loop_count);
> +		if (threadgroup_preemption) {
> +			if (f1 < long_kernel_loop_count)
> +				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);

Also document this why f1 should be > long_kernel_loop_count.

With those this is: reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> +			igt_assert(f1 > long_kernel_loop_count);
> +		} else {
> +			if (f1 != long_kernel_loop_count)
> +				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> +			igt_assert(f1 == long_kernel_loop_count);
> +		}
>   	}
>   
>   	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
> @@ -1675,7 +1698,8 @@ static const struct {
>   			     unsigned int short_kernel_size,
>   			     const unsigned char *sip_kernel,
>   			     unsigned int sip_kernel_size,
> -			     struct drm_xe_engine_class_instance *eci);
> +			     struct drm_xe_engine_class_instance *eci,
> +			     bool threadgroup_preemption);
>   	uint32_t compat;
>   } intel_compute_preempt_batches[] = {
>   	{
> @@ -1686,7 +1710,8 @@ static const struct {
>   };
>   
>   static bool __run_intel_compute_kernel_preempt(int fd,
> -		struct drm_xe_engine_class_instance *eci)
> +		struct drm_xe_engine_class_instance *eci,
> +		bool threadgroup_preemption)
>   {
>   	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>   	unsigned int batch;
> @@ -1724,7 +1749,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>   							  kernels->kernel, kernels->size,
>   							  kernels->sip_kernel,
>   							  kernels->sip_kernel_size,
> -							  eci);
> +							  eci,
> +							  threadgroup_preemption);
>   
>   	return true;
>   }
> @@ -1733,11 +1759,14 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>    * exercise preemption scenario.
>    *
>    * @fd: file descriptor of the opened DRM Xe device
> + * @eci: engine class instance
> + * @thread_preemption: enable/disable threadgroup preemption test
>    *
>    * Returns true on success, false otherwise.
>    */
>   bool run_intel_compute_kernel_preempt(int fd,
> -		struct drm_xe_engine_class_instance *eci)
> +		struct drm_xe_engine_class_instance *eci,
> +		bool threadgroup_preemption)
>   {
> -	return __run_intel_compute_kernel_preempt(fd, eci);
> +	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption);
>   }
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index fe9637b91..3c2cd010c 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -37,5 +37,6 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
>   
>   bool run_intel_compute_kernel(int fd);
>   bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
> -bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
> +bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
> +				      bool threadgroup_preemption);
>   #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 0aeb10547..2bc27eff1 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -27,11 +27,16 @@
>    * Description:
>    *      Exercise multiple walker mid thread preemption scenario
>    * Functionality: compute openCL kernel
> + * SUBTEST: compute-threadgroup-preempt
> + * GPU requirement: LNL
> + * Description:
> + *      Exercise compute walker threadgroup preemption scenario
> + * Functionality: compute openCL kernel
>    */
>   static void
> -test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
> +test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
>   {
> -	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), "GPU not supported\n");
> +	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), "GPU not supported\n");
>   }
>   
>   igt_main
> @@ -49,7 +54,7 @@ igt_main
>   				continue;
>   
>   			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> -				test_compute_preempt(xe, hwe);
> +				test_compute_preempt(xe, hwe, false);
>   		}
>   	}
>   
> @@ -61,12 +66,23 @@ igt_main
>   
>   			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
>   				igt_fork(child, 100)
> -					test_compute_preempt(xe, hwe);
> +					test_compute_preempt(xe, hwe, false);
>   				igt_waitchildren();
>   			}
>   		}
>   	}
>   
> +	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> +		xe_for_each_engine(xe, hwe) {
> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
> +			    hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER)
> +				continue;
> +
> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> +			test_compute_preempt(xe, hwe, true);
> +		}
> +	}
> +
>   	igt_fixture
>   		drm_close_driver(xe);
>   
--------------0Q3bS7ICnXTVlqcR00WDzESP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/13/2024 8:25 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:janga.rahul.kumar@intel.com">janga.rahul.kumar@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240313192510.2316807-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">From: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a>

Test submits long kernel with a higher threadgroup count, lower
iteration kernel and a short opencl kernel to exercise threadgroup
preemption scenario with WMTP disabled.

Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Signed-off-by: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a>
---
 lib/intel_compute.c              | 61 +++++++++++++++++++++++---------
 lib/intel_compute.h              |  3 +-
 tests/intel/xe_compute_preempt.c | 24 ++++++++++---
 3 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c5d253ebc..b33f49fb5 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1162,7 +1162,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_state_contect_data_base,
 					uint64_t offset_indirect_data_start,
 					uint64_t kernel_start_pointer,
-					uint64_t sip_start_pointer)
+					uint64_t sip_start_pointer,
+					bool	 threadgroup_preemption)
 {
 	int b = 0;
 
@@ -1236,7 +1237,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
 	addr_bo_buffer_batch[b++] = 0x000003ff;
-	addr_bo_buffer_batch[b++] = 0x00000002;
+
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size</pre>
    </blockquote>
    <p>Bspec says &quot;Thread Group ID X Dimension&quot; which is here used as
      thread group size.&nbsp; Would be nice document how is this used&nbsp;</p>
    <p>to control number of threads, I fine if that is done as a
      separate patch.</p>
    <blockquote type="cite" cite="mid:20240313192510.2316807-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	else
+		addr_bo_buffer_batch[b++] = 0x00000002;
+
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1251,7 +1257,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = kernel_start_pointer;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00100000; // Enable Thread Preemption BitField:20
+
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = 0x00000000;
+	else
+		addr_bo_buffer_batch[b++] = 0x00100000; // Enable Mid Thread Preemption BitField:20
+
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x0c000020;
@@ -1369,7 +1380,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				  ADDR_INSTRUCTION_STATE_BASE,
 				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				  OFFSET_INDIRECT_DATA_START,
-				  OFFSET_KERNEL, 0);
+				  OFFSET_KERNEL, 0, false);
 
 	bo_execenv_exec(&amp;execenv, ADDR_BATCH);
 
@@ -1527,7 +1538,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					unsigned int short_kernel_size,
 					const unsigned char *sip_kernel,
 					unsigned int sip_kernel_size,
-					struct drm_xe_engine_class_instance *eci)
+					struct drm_xe_engine_class_instance *eci,
+					bool threadgroup_preemption)
 {
 #define XE2_BO_PREEMPT_DICT_ENTRIES 11
 	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
@@ -1564,6 +1576,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
 	struct bo_execenv execenv_short, execenv_long;
 	float *dinput;
+	unsigned int long_kernel_loop_count;
 	struct drm_xe_sync sync_long = {
 		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
@@ -1574,7 +1587,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.handle = syncobj_create(fd, 0),
 	};
-	unsigned int long_kernel_loop_count = 1000000;
+
+	if (threadgroup_preemption)
+		long_kernel_loop_count = 10;
+	else
+		long_kernel_loop_count = 1000000;</pre>
    </blockquote>
    Lets put those const into a macros <br>
    <blockquote type="cite" cite="mid:20240313192510.2316807-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	for (int i = 0; i &lt; XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
@@ -1622,12 +1639,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, threadgroup_preemption);
 
 	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &amp;sync_long, 1);
 
@@ -1655,9 +1672,15 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 		f1 = ((float *) bo_dict_long[5].data)[i];
 
-		if (f1 != long_kernel_loop_count)
-			igt_debug(&quot;[%4d] f1: %f != %u\n&quot;, i, f1, long_kernel_loop_count);
-		igt_assert(f1 == long_kernel_loop_count);
+		if (threadgroup_preemption) {
+			if (f1 &lt; long_kernel_loop_count)
+				igt_debug(&quot;[%4d] f1: %f != %u\n&quot;, i, f1, long_kernel_loop_count);</pre>
    </blockquote>
    <p>Also document this why f1 should be &gt; <span style="white-space: pre-wrap">long_kernel_loop_count.</span></p>
    <p><span style="white-space: pre-wrap">With those this is: 
reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
</span></p>
    <br>
    <blockquote type="cite" cite="mid:20240313192510.2316807-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">
+			igt_assert(f1 &gt; long_kernel_loop_count);
+		} else {
+			if (f1 != long_kernel_loop_count)
+				igt_debug(&quot;[%4d] f1: %f != %u\n&quot;, i, f1, long_kernel_loop_count);
+			igt_assert(f1 == long_kernel_loop_count);
+		}
 	}
 
 	bo_execenv_unbind(&amp;execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
@@ -1675,7 +1698,8 @@ static const struct {
 			     unsigned int short_kernel_size,
 			     const unsigned char *sip_kernel,
 			     unsigned int sip_kernel_size,
-			     struct drm_xe_engine_class_instance *eci);
+			     struct drm_xe_engine_class_instance *eci,
+			     bool threadgroup_preemption);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
 	{
@@ -1686,7 +1710,8 @@ static const struct {
 };
 
 static bool __run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		bool threadgroup_preemption)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1724,7 +1749,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 							  kernels-&gt;kernel, kernels-&gt;size,
 							  kernels-&gt;sip_kernel,
 							  kernels-&gt;sip_kernel_size,
-							  eci);
+							  eci,
+							  threadgroup_preemption);
 
 	return true;
 }
@@ -1733,11 +1759,14 @@ static bool __run_intel_compute_kernel_preempt(int fd,
  * exercise preemption scenario.
  *
  * @fd: file descriptor of the opened DRM Xe device
+ * @eci: engine class instance
+ * @thread_preemption: enable/disable threadgroup preemption test
  *
  * Returns true on success, false otherwise.
  */
 bool run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		bool threadgroup_preemption)
 {
-	return __run_intel_compute_kernel_preempt(fd, eci);
+	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index fe9637b91..3c2cd010c 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -37,5 +37,6 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
-bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
+bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
+				      bool threadgroup_preemption);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 0aeb10547..2bc27eff1 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -27,11 +27,16 @@
  * Description:
  *      Exercise multiple walker mid thread preemption scenario
  * Functionality: compute openCL kernel
+ * SUBTEST: compute-threadgroup-preempt
+ * GPU requirement: LNL
+ * Description:
+ *      Exercise compute walker threadgroup preemption scenario
+ * Functionality: compute openCL kernel
  */
 static void
-test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
+test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), &quot;GPU not supported\n&quot;);
+	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), &quot;GPU not supported\n&quot;);
 }
 
 igt_main
@@ -49,7 +54,7 @@ igt_main
 				continue;
 
 			igt_dynamic_f(&quot;engine-%s&quot;, xe_engine_class_string(hwe-&gt;engine_class))
-				test_compute_preempt(xe, hwe);
+				test_compute_preempt(xe, hwe, false);
 		}
 	}
 
@@ -61,12 +66,23 @@ igt_main
 
 			igt_dynamic_f(&quot;engine-%s&quot;, xe_engine_class_string(hwe-&gt;engine_class)) {
 				igt_fork(child, 100)
-					test_compute_preempt(xe, hwe);
+					test_compute_preempt(xe, hwe, false);
 				igt_waitchildren();
 			}
 		}
 	}
 
+	igt_subtest_with_dynamic(&quot;compute-threadgroup-preempt&quot;) {
+		xe_for_each_engine(xe, hwe) {
+			if (hwe-&gt;engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &amp;&amp;
+			    hwe-&gt;engine_class != DRM_XE_ENGINE_CLASS_RENDER)
+				continue;
+
+			igt_dynamic_f(&quot;engine-%s&quot;, xe_engine_class_string(hwe-&gt;engine_class))
+			test_compute_preempt(xe, hwe, true);
+		}
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 
</pre>
    </blockquote>
  </body>
</html>

--------------0Q3bS7ICnXTVlqcR00WDzESP--
