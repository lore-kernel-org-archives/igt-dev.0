Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842B4EDA680
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 15:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EE710E829;
	Tue,  3 Mar 2026 15:09:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE93110E834
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772550557; x=1804086557;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8dT3vpzoaG7JYR4+H4hH8Xm/XqnNXqKtDtRpA6N0yQs=;
 b=eN9Xuk3okaWHB9pn3+LjGc89JeIJe7u6qSUOJ06SH2rf6ISoYBSojkUj
 MYof6kEcsmGLT/QGZbQ/wc/RSDjf5I5eG9Pdqw+jw0qv4xtR9trFfwbFW
 VHAhnBsslIRqh0rSL2JjDkcSbCfhSGWqcwRQQfTAClSWrzkPXOM7iWC/H
 VnrPa9YpplDjjETSzSP7xKpSsOjHg1aioL7AjP8waN958JdEENeZXsEXa
 993QkoVJ2EmEVs0ym4PPNSRQmOQZp8FJyQTvjQTrR36HaLz9EmSKVa7Rk
 jGLU2ZZFlruDqUW8BEm3noHO+S9KTsVx9FJ4VQeLpdAcZXhgCxEWG7VyE w==;
X-CSE-ConnectionGUID: FMTL3xn1T0yvxWtZQQ/gyg==
X-CSE-MsgGUID: zBHI9DbIR9CUDJUEBvVL9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73652914"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73652914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:08:25 -0800
X-CSE-ConnectionGUID: v9lyMHcBSgS6OyPCt4eZBQ==
X-CSE-MsgGUID: D5X0vMjvRbKbdivBbMLPJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222500319"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:08:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:08:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 07:08:03 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:07:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMBoXuoc4rb8eXTitDyChGZNTf4xmvth2KtmVgHik0UHlBLaaOgcq9HTuDXD3KnWmxfYhoMXaqFYrS+VFouFiqP3zo0/8xlLOxe8R60qKXZDl0Mh1Tmn5ElPNTxhVqHrSBZoD+5ffGng6rQBf6QD7AvRPpStQPo5PdpuV0vMZ6g5KfvAaX/vOBFhKWF6iokbw4hIu5xEy+WHOPNSi3QqyNHhaSePd5r6IXqQOyOPEuoNiP/zcKpmistdDGiQBTPNxpxylBsZ082MelpPgD1Y1EOwIPGR2cIy74F874zA+v/w1mWmOaNv6lb8cNLrNxdeAVlD58cBZ8NUanXRu1lDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODfcJHoTW7kFYKQmHw71bug34eVncVXIwn5XHOF4yd0=;
 b=ohnlkm+Uc8o3jq3nkEe5iBOEFRb4rvHe+s2Uq4m/PYlj0NKMrJ3FIVprN4D/hHIxlCXnxfw7fnqqJaPXG9mIIMTRKhD1ugaox4tl0MYnYGa35viWr1DWdjlDtJ7Pu8oE1BdOX5HiTPJPw7lhCqzrcbunJh9zkP4kyJwldBEqfoqlBLoSo0fSozn1HO3exM2EGzXU0nuiuQx7gKuSNDNm/A6U9uoLssvBnjO4INQdAlPyLRTBa3OgbsX4kUdBqLZ0WccNRlnqEzkU+ClHzvaXsD7vxSNzixJfjpOSGYNu8DnLKT8nH31xdsUdeePkLGKbW8XlJNvG0MRhqIEJixPPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:07:51 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9654.014; Tue, 3 Mar 2026
 15:07:51 +0000
Message-ID: <f2f35e2a-37ed-44e8-a412-ea621c264876@intel.com>
Date: Tue, 3 Mar 2026 20:37:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and loop
 size if provided
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
 <20260303134706.41948-10-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260303134706.41948-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0120.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::6) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6d9d93-50eb-4f57-161a-08de7936a3b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: FF7DwkIF3WW7vusE6gIz8mZVJXJdwL6HNh/mM/hzyzkpxFKASGaj05koZ5vVJZC2XeV0CfOgA2tX7ntjLdiJBRUP4jFSKDG/O82kVtyEWzscnKWL+5hTA9ONbgd9szc9Yd0Pi9VDaNL9XeXZoFJv5lPSsB2NqxZp7/GX/5doXttZBGcDsDI6egcKvNFPUJkJegtK9yQhxoa/y7MA11w61u42zVMtAXJ1cQQhUS2dsQeEWPIDCStIXjzChlaOYQ8uIMf+r7Lxg3JioANf+5BhJh7ZoXhl6CDQBrFYqPrj/FIA+4EVGLcp/oyiwtd4Jwx0E4egEcxuVp/QXKj4kdAJA7qFqRPai9O2cKvTlDpvkG+ggzZFpRGI+gSPhFMchtQuFnFXGDdT1NyNq39w9bpQv/hIMvCwfOs2AR3JMBDLLP5SVqVxSCcawX1632e7ucSaxefYxVAhzD05jZtLhSauCZkKSkptGT3Zk26PoE3A947H5Jra//QR84INJFKy9KOWCEZ/CM9pHH2nay70eMbEQmZt+kmBpH9ObUMcx9KIpnQBRD1EuacxCzP5zn32wSKRbrDSoxrceeuOVdArxnyEu+bBFKdu3CfhhwexLDtJy6/LSo5PRAwvpq5zJmUVIE2dPNRlProCc+/OT0te12h05oa6fI09zdVyyInEZAPbmuuZ1eH/nJamNZJarrBOdqC1BuRzu/e8iwc+Nszx7u283KGDS2Zudz+ukA1TSzUyG3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWNZRmcweDBLTTlMdFV5M3ZHd0NDU2Ewd0x4L0NLNThjeUI4RVVFelRDaWd2?=
 =?utf-8?B?RGVnaXhhRDgrempRUm85ZEhTbG5WY3pEdmJJMkxKVk9Td0VQVFl1b08zNlFx?=
 =?utf-8?B?TmRCTnVsSXRSRkFSeXM4K0N1TDNaUTVZbEZGWkNSREFWS2ZGMk9pMHdRMUt2?=
 =?utf-8?B?elJIaUFrSFcrWnFtUXllRnNwS0FPdFNId3htazBseDIraVh0cEhla1NBb3l1?=
 =?utf-8?B?dEswTVl5WElLTHBlR0dzV3orYzloWktSYUo2OGM3dzJCMTQrYlJCeUpPNmNW?=
 =?utf-8?B?a2UvdnhmZFlwUldreDJZcnRxV3VWRzN5VVM2SGpTYmdxTmlkVXE4ZUF2V2lm?=
 =?utf-8?B?K2JIMVQzTy9TRFBKWWlYK2ljbk1HM0NjUE94U1lXeW5ESllRUTFHUjlTNHo2?=
 =?utf-8?B?R3NlcU8rSzV3dWZYNjIybHVYOWxxc0s3MUprek9yNExiUmhEU1NTaG92Q0o4?=
 =?utf-8?B?clZsSllMQnNGUnFFRUdGcnlkcDY3TXFRTnNsalZTQ1Yyd3NXcnQvM1hVTXBt?=
 =?utf-8?B?ZGcvSTE4Y1BNQmVlNk8xL0U4T01VVXA5MFlwVStyY3dpZFZsMStYVVZDRGcr?=
 =?utf-8?B?YkloWTYrMGNRWVN1YURYODVwWFV4VWZqblFpUDVWSW5sWHFKM3FqZlgxQ0RK?=
 =?utf-8?B?Q3czczBVc01SUWZkMVJ0bVA0TUNGVU5mWElldngySjUyRFhDbDh1WVY0V1pS?=
 =?utf-8?B?QW1xUzc3MStHM0FtRXFpS1diQVpZZmZ2dVo0bVgwL2hZeVlSeHJWeVZHZ05t?=
 =?utf-8?B?Sml2azVGbW16YXprTmVpcE5kM1VreWRtdlcyQkhyc0hRZzZUblhZeGZFNG1D?=
 =?utf-8?B?VGVFZVFaOGZHY3FqSXJ6clhjblZNencrQ1BjQ2tHS1JWdStZUjRacWhZQm1O?=
 =?utf-8?B?MUdCbE9LZ2JFc3VJTFYwQjI3SjVEMHgvNklCU2ZPM2VMQkJHQk85YmlPZmNa?=
 =?utf-8?B?WGpUcFlRUnc4TE56cmhXQ1BwQklFMHFRUDVpYTlsbm5RejJlOHczWFpROFN0?=
 =?utf-8?B?dVFDaDArVGR0TVJnUDJGT1kxRTRTNWtKVVpJMjQ4cXFDanRyZW9CZVFxUGFn?=
 =?utf-8?B?L1k5SzgzUk1NL2QwcWpoTUEvT1JpZjZCbEpLVGFmYUliMmtIeEI0bTBPTS9n?=
 =?utf-8?B?WHhyeGpSRW5Yc2lsTGhaRnRHbG44eXkwMUZVRExQNDR2MWtLamwvZFdqZGFD?=
 =?utf-8?B?eTRwdHBIV0pmUkRMZmhIWStLZmtXSlY0RE5LZzZGdmRnYmMyVC9Jc2Q5T1BC?=
 =?utf-8?B?U3Y1WlIvSWRVWUNhNlZxQk5ac1ZLeWNCbUFKUVcvbzdLNXUyZVo3L1QySWI3?=
 =?utf-8?B?aXg1ZzNUa1RZUDZiSDVNQit2cU5XRGVzNnVBdHIrTkZMMFZpMHMxSDRhOG80?=
 =?utf-8?B?enRCVjJxTFl5WXhaM3M2amN4LzZwSnpqYTFTNGdVVlcrWDNadkVDZlk1NFpo?=
 =?utf-8?B?RENKMmhrYTdDRkI5T3VOUHpVbWJBS3hnSnpidFdjOW5nYmFTRjNORUxreEp2?=
 =?utf-8?B?TzRvQ0JaYjFIbHRVTFJoNm4zTHZLY09IY0Z5blM1eGNlQkNlM3o4cWxDb0Vo?=
 =?utf-8?B?K1htaWVBdzBDbFBEcVA1dzJ3Rkt6eEFrSEZKQnZvam1vQ09iTm90OW5YenpI?=
 =?utf-8?B?d0pCZHR2ZXRtTUZIUjNtSTZXVUxaSWtWV2tKdCs3aUEyNDBSanpraXZsS0h1?=
 =?utf-8?B?SHdEMVVuUEU3VkUxeFQvai9ZSUdIcEZCdUJCVFZaQW1CUHJpNGlTdmpWYWlm?=
 =?utf-8?B?MVM3L2tYOXpmMGNjL3RVYnprQkJFbjIrdk1FNlBIY3NtdW1WZ3krS0oyMHhi?=
 =?utf-8?B?Ni9UL3pzdjBEN1F6WFhpRlRCdXFPU05HOTRMQlF3Rm4rZ2pJUVlQNkFoc2sw?=
 =?utf-8?B?R21zNzZ3b2ZmbkdCbzM0cUpvNDhwNTJ0R0ROQTNhQ2RiTFg3RjV5ajllNWVj?=
 =?utf-8?B?VEg2WU5TcElzckJFNXlZdmJicGhzRysrVDlMMi9BTjlpY2RlajRNeVpYNXVT?=
 =?utf-8?B?WjVwcHBPcG5rSXBhOTV0RXI2UHcxVDhBZ1VNcDdlMnhkdTZ3RURjQkF1ZXAw?=
 =?utf-8?B?dzBocHh5MVBwb0tDTkEwL1FOSUlzRzExWjhWcThibHpFZm9vNU5oOVVBZ1hM?=
 =?utf-8?B?MGkwa2xKcGtwMG83bDg5ODliSDhocWRMTEh2bXQyakJTTlZvVlZZTTl4RUJv?=
 =?utf-8?B?WG5ERzVicDRpK3pLaVdCcHJaTTRlTmZjT250Wit2NVR5SXdEd01JMGZoY0M4?=
 =?utf-8?B?Q1NWdTR6VWlYUmpXcmEyNjQ0bXNLQlpkZ25jbDF5K0Yrd3hQMzhOVHVScW01?=
 =?utf-8?B?OS83SytVNmlsdVR0RlZpQkpZQi9Cc0Jid2lnY2tERHlFM1daMVJKWmZGaGVL?=
 =?utf-8?Q?eRLgmAkLlc/x+rfA=3D?=
X-Exchange-RoutingPolicyChecked: ir1JWgf+FbUHMUFr7RuvdfW3jbhefu2R6Pu5PcSN+mJAlEMJtEm0POVfKEAM55njSYsoJ2btr67b9U8lXM6646+wXrQGJiGghaOjdE+SmdLOSHM3C4btn7YNaQLfB96p4XEg0dylQl863qSF0Ma1T5MokLcTuf/CwzVp5ECpTKikxIw4LAgC9b/RWLeycbEqX7zxfic1dMkTZ1usoqaWWrw8KMFTuHrn1Kd5OXKGt+rTIz4PP0BLDvAcJVvBHkFaJNyzvqAoDASDDpy7Xb1/Uw7Pav8cUJVTXITL6LdiTBMfTWIW16V1lH/weHyO4XRceTIJORRM3IKo1ppf7O602Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6d9d93-50eb-4f57-161a-08de7936a3b9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:07:51.8435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJfGoBZgtXbqkQNa7r7Mo4831bxIe8ie8ZQKvO79tNj8Ur+bOtLPx1UPetvm79r2HydR/GZaP5zvkZ/f0fknpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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


On 3/3/2026 7:17 PM, Zbigniew Kempczyński wrote:
> If user passes its own input/output or number of iterations start
> to use it instead of hardcoded ones. This pattern was already used
> in other pipelines and only Xe3p missed this.
> Small Nitpick: Description

lib/intel_compute: Improve Xe3p pipeline flexibility by allowing 
user-provided input/output buffers and iteration count

This updates Xe3P compute pipeline to use user-supplied input and output 
buffer addresses as well as user-defined iterations/loop count

when provided. Previously, pipeline used hardcoded buffer addresses and 
iteration counts and ignored user overrides. With this change

Xe3P correctly used user-supplied buffers and counts.

Otherwise LGTM

Acked-by: Nishit Sharma <nishit.sharma@intel.com>

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> ---
>   lib/intel_compute.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 1165bdafd9..bfe0a75a7c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>   	struct inline_data idata = {};
>   	struct bo_execenv execenv;
>   	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>   	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
>   	int entries = ARRAY_SIZE(bo_dict);
>   	int64_t timeout_one_ns = 1;
> @@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>   	memcpy(bo_dict[0].data, kernel, size);
>   	memset(bo_dict[1].data, 0, 4096);
>   
> -	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> +	xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
>   				  execenv.loop_count);
>   	idata.xe3p.indirect_addr_lo = indirect_addr;
>   	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> @@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>   	}
>   
>   	if (!user || (user && !user->skip_results_check))
> -		bo_check_square(input_data, output_data, execenv.array_size);
> +		bo_check_square(input_data, output_data, execenv.loop_count);
>   
>   	bo_execenv_unbind(&execenv, bo_dict, entries);
>   	bo_execenv_destroy(&execenv);
