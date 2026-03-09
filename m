Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE5EFCD7A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 10:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BA210E4C5;
	Mon,  9 Mar 2026 10:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmJXGJat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1672610E4C5
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 10:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773050632; x=1804586632;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CRng1+Gj38Vo1K1FQftwgbp+OXMQbi+e1HRBaMZ5cy8=;
 b=OmJXGJat5YgRz/Bdz0zEkzwMvQMVxXat99bR69knEhlzURS74Rb31Ar4
 TdOHdyhfVIQbtAB2xO+4a7YRaYf+O8jXxS5PdmJyeWTIW1BAFItg8E6VC
 J2NU0iR4CCXsTQhQgbW/BQVnYUjofVoS0yk+zkf2nqrpdpW+Be0OKjCao
 5rNrhk/Mmvl0BjYnPi1xiDXX8Z4j+8kxYfPj0Vva1S25sgyKXogPtrTM9
 zrRmY89e8jIDvVtkFvZlcplICQIwD7zcy0EgbGuICmNQCNZ4Mikoi2tNb
 CKaH+L4BZyUMeAPMb75ubWlhheIi8lai8DFz4MaKJs/JBAeYgfdJITHez A==;
X-CSE-ConnectionGUID: vmcVprS/Q5eKFHYZTTLOCg==
X-CSE-MsgGUID: q7ozfiW6SQWOMu/pGmgQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74148288"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74148288"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:03:52 -0700
X-CSE-ConnectionGUID: D7IprlQ+SAaHg+lN+tRPug==
X-CSE-MsgGUID: 9vyfECW0QniCgYwmvarf0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218844363"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:03:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:03:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 03:03:50 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixav6u//znwA52cZv50snsUifkXmXkkA12M1Iq7AUYzXoIJTh1+fTnEedG/h6EH/fl6Ky+YaPaxpDudBi/JQKb+92u27SKi5h4d6PeEl7a+tKs9UoXAtl19mYLT2TG0kI14refGEuk/ww2/f8z8XqQmzhhPMvaS99RtUWRD7lkef2fQSMtZ8xnDHhNAUZ8EUNJgxzaflNnhG9HH52NEWXVy4nmSvWRkgxk3fIxCun2WaQYseswDPV2zZBIJIexzOjy8yUDmn3lmWvVJK3P5sp71bMq75c8+p0s64+q/8GxMI5rQq4GMnVsrX7N0vbvEc/KhWA7jzShVyklRyKcC2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U87v5VnYtqHEbDzUqiiGmSXF+0I8OnqwK/kfRYG+VUY=;
 b=NTt7r/Q9HLMpncOs8jf2v85c3Wn40fzqfKwU22QbF5w2joQU0LijTdNx+IFDV/KCtvXImYuKD7nVJyL1SxIk9wHBE8L0Kq2aVEIC6g13T2cHHxehkQ+fcVzzNo8bvr+Q6/8KJeRmlhhDVRC2NRNToRotHeYtOz4I6f01V3r+LQI2EKNKtVljEONiFk5rAw61M05sJ7Bs7PUr/de+1gCtw+ysVn2IKi/WBs6Xc3wxfjkq2J+lFlEI9OQPJMVA+7D3T/J34a4KGcdoUNsvqFQjznRLWLK6AJyyjJKtDnhgAJG62NMpm2F8oMH4gnd3MMhta3WrygwgIGilmfm6iLBs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 10:03:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 10:03:47 +0000
Message-ID: <d5d123a9-5559-4d08-a696-c499a656607e@intel.com>
Date: Mon, 9 Mar 2026 15:33:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,6/6] tests/intel/kms_usb4_switch: Add USB4 switch test
 suite
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260225212859.876713-7-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260225212859.876713-7-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: f3436933-4761-4380-a095-08de7dc327aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: YA+tzqvPZnJz1T2izI5VUlWordBEBTXh2Mm6GXaCbStEikwTHBDwYFiPAPzUAcb7JdFkwW/8ghg2/0aV1RwgTHWkDE0zYBuNCDaWDel5v9ntylytVp9bztVEarl8s+KLGltZd+cjhuBEu4pXind+gNSBjALGTPJt9BoWB45PL/JiWm2+WkAGb7YVMJT8sXoQTFeuxDgQhAC2P7CLuofC+IohK8Eelnptnt/0e9k+b0uYFa3VjKjaB8Lv0WXBDtwArFaWyPIInPUczBui0KmQ77ZAZTpA68o3bvqYLmaMMbxs5ZCYlR7HW5KuJrv0JGIQZd0dB3fvqe6/B6jsWyER53AhppCDoDfPWGl6yhZcYckSvgJZxLu6U9gXWI9gpdnYTi5erFPsDM7Ugq3JtfV/kLSgOACIZaQFfDOic3pJU1gCiYxyT3Qs5ju9OHTm+7c665EKX1wDjEtdXOAAbz+HTAQj08ZtJssSECgx/RmSv1fGSS8ppy5gONzBkGNhAhAwDd9yNm4Iw31VmGK/ufAaMUqtF5Uy2Fcv0y7vyP0uZcvLQI0T5aN/Qtga5NDrj7QzqnYru4gdflpNgvFNLUhjLwDt/pXd2sunhNXgoISjDjwPEsyQEaDOn9N8mbQWytzUTuf1AFFHBcgzAB++9NKAfhmW+QR2qYfBm8h80wtiqmeCVcdEII+p0wWGLPN2B1aOKYd7f8l1wCKhlW1Uu8bfCLgqrGsA28QZNWuMfz4SG/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJ5cEd0YWxBNUtvMWdwRVJKK2lBK0dOeHNTWXExSStBcWd1cFRRZFo5ZDZS?=
 =?utf-8?B?MU1ZYmNSMFpMY1R5dVZlaHNGZ05yTUdRZGFSQ3BwY0s3c3F2aEpvR2x1L0cx?=
 =?utf-8?B?MmVFY084dElpZW1qSkJmL1l5WENJdFFjcndXK2dSaEhzelFTbS81cTlnUjVM?=
 =?utf-8?B?Vjh4VnNWeXd0Z1FZaVNOTUtYOGNGb3JsUWpnMmN4cnVPR1JpdmdveVF4WXA3?=
 =?utf-8?B?LzAxd293a2J4cFQ0NUZNdTU2ekxSUFhqSyt0RTN4R2RMQ09NRnpIb3NPZEV3?=
 =?utf-8?B?YllZczA5VGdnaThtRW1PVTlXTEt0WkVVSFJEd2dmT3dSbEhjanZCSC9zWklH?=
 =?utf-8?B?TWhRVVgwOEpIb3VadHg2Y296V2FBdGVlQ2t5VmZwL3JoM2RJbHpYUm5WZWZk?=
 =?utf-8?B?cEIzMFBTZ1VlTXJRRkxwY29FOVNaNVhTTmo5YUcvdEllZDBMamZyKzdncUht?=
 =?utf-8?B?dzBmR2ZiUFBDb2pKYzJNRDFWTHpjYmR5bmJUM1JxZk5XY3JKNnFrK1J3cXl4?=
 =?utf-8?B?d2VYTzBVU09IdHozbSt6d0lZZFNTdVpwN0RRUHlEYW9qc01aMEpjckVtdld2?=
 =?utf-8?B?SGs3bkg3a3Y4b2lTbDJVdmdjWXpTYVJ5OVlWVGc3Y29zTnIrb1VhRHFBQlFh?=
 =?utf-8?B?QUM2d0haSGdSRzRPZ01MTEUrditMV3J0djN6dHlQcnpEdnBidWhxdnFyTGtT?=
 =?utf-8?B?MDR0OHpObWE5cGVad0duNlc2Nnc1djB4YnRlcGRqUWI3TDA1cnhCeWlDZHNu?=
 =?utf-8?B?aDhjd016TTRHR2VUWVNvaEI3ZzU5MndGZC9STWNiS3RQT0pmektPbTlwckpl?=
 =?utf-8?B?TnpPZjZ0WGVKeHNPckRzN0Y1VDFzdFBudnhBbUtOeWlXeGxtNjIxeWh6V3dt?=
 =?utf-8?B?cnkwakZIK1lGbXpXWE0reC92K09QNWZPWDJqNXFoQTZvQjBya2JlMmYvc3Ux?=
 =?utf-8?B?c00zVXN0TzJ4N1g2T3UxMGRUVnd6cVBsNVI4OW1MdG0zditkQ2QvZC80cGh1?=
 =?utf-8?B?WVVQS0RVdzlPd1JLWFlITFk4eU5Mclo5cHFXVUNSd09Pb0VDNGswMHhqRXFM?=
 =?utf-8?B?VVdRNmMvSzFFeS9NRTZ3djhXbWdUamlZbExXY21kajIxRUQ1cmFnWWozdkJ0?=
 =?utf-8?B?NnNFV1ErZ1VSSmYvdzBWbm0wNTg3dzMxeE9Gc3hjZTVEeFp2Zmd3OFpjSlV6?=
 =?utf-8?B?YVdYWVRVTzZIcE9aMmMzYjhCWFR1QzVFcjJsTWpWcUtMQTB2L3pXWW15bC9t?=
 =?utf-8?B?VWZRQ3JZUDNrVkVSNmhtV2VmcnMvZXdzZzlramk1cTFhTk1RN3pZRGdJNHg0?=
 =?utf-8?B?RmNSb3BNQ1J0SG5MRVpZV1VSZFoxcnpZRGZXbTB0YzZyS01uRmMrck1sY2kr?=
 =?utf-8?B?TDhyUktnUUdVbTl4RHlZN1BVOHVnTXFDRStFZ3BLM1o2VUF2aSszR3NaQStr?=
 =?utf-8?B?eXNsbm84TDJnUzRydWIxMys2Z2xMTTdyaDNSZ3BtRXRCbjJWTkQvQjZZL3ov?=
 =?utf-8?B?N096d2dNU3J2c0pNaUt4ZWlUNk1QTVV6Wi93T3Jrdzd2WVVlbVFtclYyZits?=
 =?utf-8?B?Mi9tOGdYV2xtNnZJUVJLSVdrODZpK0F0QkJLMUQ5VzFOQzFhMUlWYUYvMytz?=
 =?utf-8?B?bTlsemx6ckJjdEFLZWlsOUY1TndCQXI3K2FRMDZrd1hPZUl3REp2WHlKWk9R?=
 =?utf-8?B?RHJIZitkYXV0QkRVcGZmRHZlVUw4RkJDUU5aRkRYWFV4eFJKdEdacmFwTFVm?=
 =?utf-8?B?N3F2REJpWmErcEdEVk5GdWFLL1hLYVNQSjJMYlpIdGtTSGVXWjJndHgwamVr?=
 =?utf-8?B?N0pKbFl4V1JMN0NkaStKbkZDUWhTNi9zQTVBK2k2K1l6RmxIazJmU1RPZU5K?=
 =?utf-8?B?SThjRHppOXJraEx2Rlh1SDhxMWQ0aVJoMmJuR09TQThLU3BKL0ZzMFR5ZGxy?=
 =?utf-8?B?SUJPTlFDR0pzQjRySXgvcG8wc3VYazk3UTczS2wzeGpmd0IwSVhiaXhQYWVJ?=
 =?utf-8?B?dlNWVy9sakFoRjFURlhVZDhieFVEY0FNVFl1UmNyWkhWek1zRUtEaGFLZUdF?=
 =?utf-8?B?U1E4c1Vvd1NVcTdYc2VjdllIelUrU3B0ZFh3QXVqZHR4bjJTZG1KRzE1WU9P?=
 =?utf-8?B?M1czQ2I2dWZWdU50QXd1LzdLK3B3MjBVNlZrditvQkVDNkRIakpYQ3JBSDhv?=
 =?utf-8?B?NjVycjQ1QTdxc2ZlM2JVRkRZckR2UnNkNjhPdHlPd2Y2RjBuT08rSDlKUEM5?=
 =?utf-8?B?b2lVZG40V09JSStLKzh6c2F4UFNCZ1U5OStsZWp3ZzVUcHF5UHhCMmpYY3E3?=
 =?utf-8?B?NHAwM0JveHZBdWlwWTByOHlOdVdZTkZ0VmFsMzBINkc5WUU3Y2RtUT09?=
X-Exchange-RoutingPolicyChecked: tAhXo6QNc+dG6aI8PGqrPtfjbCRlge3Y2ccRvoYfCpUJ8rFhUv8W51onMAQQ1dEX4S4K1m7JiYxYqVfTekC6sCvfRsg1W0mVkuoPVT3VjzkKJedprCMZZ68XFzOQk5Lcw8cjfpnUESQHrS9P+dw8MlgS9dDymiDalFk4fqIaMo9NYtlbVl8pe1PoUUMev2qxdzqpxFum+GS0j9yzYcDyLYHB+qMkQJltdouyY31PdmO3nfvB+QNZWxsSPVxe5m9D0U3+s471dppZSMrfrOSeKJyKwozo8nFyYtOXcwXNV5LA9aD2mp1R7hVxRuWeXawyeSe4mnoGlebpwTaFhzVPNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3436933-4761-4380-a095-08de7dc327aa
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:03:47.4098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whJ/8xC7Fv5LIuh10LajTMjTTTF3Wf3LvfR9yIv0naNlNpLGNie1oSzExUL/gX9PeVGbJHEugdRL++8zfJEGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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


On 26-02-2026 02:58, Kunal Joshi wrote:
> Add a comprehensive test suite for USB4/Thunderbolt dock/undock and
> port switching scenarios using the Microsoft USB4 Switch 3141:
>
>   - dock-undock: Basic dock/undock cycles with display verification
>   - dock-undock-sr: Dock/undock with suspend/resume stability
>   - dock-undock-during-suspend: Dock while system is suspended
>   - switch: Port-to-port switching with display verification
>   - switch-sr: Port switching with suspend/resume stability
>   - switch-during-suspend: Port switch during suspend via HW delay
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_usb4_switch.c | 1254 +++++++++++++++++++++++++++++++++
>   tests/meson.build             |    2 +
>   2 files changed, 1256 insertions(+)
>   create mode 100644 tests/intel/kms_usb4_switch.c
>
> diff --git a/tests/intel/kms_usb4_switch.c b/tests/intel/kms_usb4_switch.c
> new file mode 100644
> index 000000000..403ad7255
> --- /dev/null
> +++ b/tests/intel/kms_usb4_switch.c
> @@ -0,0 +1,1254 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms usb4 switch
> + * Category: Display
> + * Description:        USB4/Thunderbolt dock/undock and port switching tests
> + * Driver requirement: i915, xe
> + * Mega feature:       General Display Features
> + *
> + * SUBTEST: dock-undock
> + * Description:        Test dock/undock cycles with display verification.
> + *                     Verifies hotplug events, EDID serial matching, modeset with
> + *                     max non-joiner mode, and pipe CRC stability.
> + *
> + * SUBTEST: dock-undock-sr
> + * Description:        Test dock/undock with suspend/resume stability.
> + *                     Docks, verifies displays with modeset and CRC, suspends/resumes,
> + *                     then verifies displays still produce valid CRC after resume.
> + *
> + * SUBTEST: dock-during-suspend
> + * Description:        Test docking while system is suspended.
> + *                     Simulates user plugging into a suspended laptop by triggering
> + *                     dock during suspend using hardware delay command. Verifies
> + *                     modeset and pipe CRC after resume.
> + *
> + * SUBTEST: undock-during-suspend
> + * Description:        Test undocking while system is suspended.
> + *                     Docks first, verifies displays, then schedules a delayed
> + *                     undock during suspend. After resume, verifies all port
> + *                     displays have been removed.
> + *
> + * SUBTEST: switch
> + * Description:        Test switching between USB4 switch ports.
> + *                     Verifies hotplug events, display verification with modeset
> + *                     and pipe CRC when switching from one port to another.
> + *
> + * SUBTEST: switch-sr
> + * Description:        Test port switching with suspend/resume stability.
> + *                     Switches ports, verifies displays with modeset and CRC,
> + *                     suspends/resumes, then verifies CRC stability after resume.
> + *
> + * SUBTEST: switch-during-suspend
> + * Description:        Test port switching during suspend using hardware delay.
> + *                     Schedules a delayed switch, suspends system, switch occurs during
> + *                     suspend, then verifies modeset and pipe CRC on new port after resume.
> + */
> +
> +#include <ctype.h>
> +#include <sys/poll.h>
> +
> +#include "igt.h"
> +#include "igt_edid.h"
> +#include "igt_kms.h"
> +#include "igt_pipe_crc.h"
> +#include "igt_usb4_switch.h"
> +#include "igt_connector_helper.h"
> +#include "kms_joiner_helper.h"
> +
> +/*
> + * Extended timeout for switch operations.
> + * Port switching requires longer stabilization time than simple dock/undock
> + * due to hardware state transitions and MST topology rebuilds.
> + */
> +#define USB4_SWITCH_TIMEOUT_S 20
> +
> +/* Number of CRC samples for stability check (solid color FB should be stable) */
> +#define CRC_STABILITY_SAMPLES 3
> +
> +/* Maximum displays expected on a single USB4 switch port (MST hub) */
> +#define MAX_DISPLAYS_PER_PORT 4
> +
> +/* Number of reprobe cycles for MST topology stabilization after resume */
> +#define MST_STABILIZE_REPROBE_COUNT 10
> +
> +/* Inter-reprobe delay in microseconds (500 ms) */
> +#define MST_STABILIZE_DELAY_US 500000
> +
> +/*
> + * Iteration helpers for dynamic subtest generation.
> + * Skip ports (or pairs) that have no displays configured.
> + *
> + * for_each_usb4_port_pair iterates adjacent cyclic pairs (0->1, 1->2, ...,
> + * N-1->0).  For the 2-port Switch 3141 this covers the only possible pair.
> + * If the hardware grows beyond 2 ports, consider generating all distinct
> + * pairs instead.
> + */
> +#define for_each_usb4_port(sw, count, p, pcfg)				\
> +	for ((p) = 0,							\
> +	     (pcfg) = usb4switch_get_port_config((sw), 0);		\
> +	     (p) < (count) && (pcfg) && (pcfg)->display_count > 0;	\
> +	     (pcfg) = usb4switch_get_port_config((sw), ++(p)))
> +
> +#define for_each_usb4_port_pair(sw, count, p, pa, pb)			\
> +	for ((p) = 0,							\
> +	     (pa) = usb4switch_get_port_config((sw), 0),		\
> +	     (pb) = usb4switch_get_port_config((sw), 1 % (count));	\
> +	     (p) < (count) && (pa) && (pb) &&				\
> +	     (pa)->display_count > 0 && (pb)->display_count > 0;	\
> +	     ++(p),							\
> +	     (pa) = usb4switch_get_port_config((sw), (p)),		\
> +	     (pb) = usb4switch_get_port_config((sw), ((p) + 1) % (count)))
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	struct usb4switch *sw;
> +	struct udev_monitor *hotplug_mon;
> +	int max_dotclock;
> +	uint32_t master_pipes;
> +	uint32_t valid_pipes;
> +} data_t;
> +
> +/*
> + * Per-display modeset state, used by the composable display building blocks.
> + * Holds everything needed to arm, commit, collect CRC, and disarm one display.
> + */
> +struct display_ctx {
> +	uint32_t conn_id;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +	drmModeModeInfo mode;
> +	bool valid;
> +};
> +
> +/*
> + * find_output_by_id - Find an igt_output_t by DRM connector ID.
> + */
> +static igt_output_t *find_output_by_id(igt_display_t *display,
> +				       uint32_t connector_id)
> +{
> +	int i;
> +
> +	for (i = 0; i < display->n_outputs; i++) {
> +		if (display->outputs[i].id == connector_id)
> +			return &display->outputs[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * select_max_non_joiner_mode - Pick the largest mode that fits a single pipe.
> + *
> + * "Non-joiner" means hdisplay <= max_pipe_hdisplay AND clock <= max_dotclock.
> + * Among qualifying modes, pick by:
> + *   1. Highest pixel area (hdisplay * vdisplay)
> + *   2. Highest vrefresh (tie-break)
> + *   3. Highest clock (tie-break)
> + *
> + * If max_dotclock is 0 (debugfs unavailable), only hdisplay is checked.
> + *
> + * TODO: Remove this filter when joiner CRC collection is supported;
> + *       the pipe allocator already handles joiner pipe counts.
> + *
> + * Returns: Pointer to a function-static copy of the best mode, or NULL
> + *          if none found. Not reentrant — single-threaded callers only.
> + */
> +static drmModeModeInfo *select_max_non_joiner_mode(int drm_fd,
> +						   igt_output_t *output,
> +						   int max_dotclock)
> +{
> +	static drmModeModeInfo best;
> +	drmModeConnector *conn = output->config.connector;
> +	uint64_t best_area = 0;
> +	uint32_t best_vrefresh = 0;
> +	int best_clock = 0;
> +	bool found = false;
> +	int i;
> +
> +	if (!conn || conn->count_modes == 0)
> +		return NULL;
> +
> +	for (i = 0; i < conn->count_modes; i++) {
> +		drmModeModeInfo *m = &conn->modes[i];
> +		uint64_t area;
> +
> +		if (igt_bigjoiner_possible(drm_fd, m, max_dotclock))
> +			continue;
> +
> +		area = (uint64_t)m->hdisplay * m->vdisplay;
> +
> +		if (area > best_area ||
> +		    (area == best_area && m->vrefresh > best_vrefresh) ||
> +		    (area == best_area && m->vrefresh == best_vrefresh &&
> +		     m->clock > best_clock)) {
> +			best = *m;
> +			best_area = area;
> +			best_vrefresh = m->vrefresh;
> +			best_clock = m->clock;
> +			found = true;
> +		}
> +	}
> +
> +	return found ? &best : NULL;
> +}
> +
> +/*
> + * find_connector - Find a connector ID for the given display config.
> + * Prefers PATH property (stable for MST) with name as fallback.
> + */
> +static bool find_connector(int drm_fd,
> +			   const struct usb4switch_display *disp,
> +			   uint32_t *connector_id)
> +{
> +	if (!disp || !connector_id)
> +		return false;
> +
> +	if (disp->connector_path &&
> +	    igt_connector_find_by_path(drm_fd, disp->connector_path,
> +				       connector_id))
> +		return true;
> +
> +	if (disp->connector_name &&
> +	    igt_connector_find_by_name(drm_fd, disp->connector_name,
> +				       connector_id))
> +		return true;
> +
> +	return false;
> +}
> +
> +/*
> + * reprobe_connectors - Force reprobe of connectors and wait for MST topology.
> + * Critical after suspend/resume — without this MST connectors may take 90+ s.
> + *
> + * Timing rationale: MST hubs need ~3 s after reprobe to fully enumerate
> + * their downstream topology, based on empirical testing with USB4/TBT docks.
> + */
> +static void reprobe_connectors(int drm_fd)
> +{
> +	igt_connector_reprobe_all(drm_fd);
> +	igt_debug("reprobe: Connector reprobe completed\n");
> +}
> +
> +static bool verify_port_displays(data_t *data,
> +				 const struct usb4switch_port *port_cfg)
> +{
> +	int i;
> +
> +	for (i = 0; i < port_cfg->display_count; i++) {
> +		const struct usb4switch_display *disp = &port_cfg->displays[i];
> +		uint32_t conn_id;
> +		char name[32];
> +		char serial[64];
> +
> +		if (!find_connector(data->drm_fd, disp, &conn_id)) {
> +			igt_warn("Display %d not found for port %d\n",
> +				 i + 1, port_cfg->port_num);
> +			return false;
> +		}
> +
> +		if (disp->edid_serial) {
> +			if (!igt_connector_get_info(data->drm_fd, conn_id,
> +						    name, sizeof(name),
> +						    serial, sizeof(serial),
> +						    NULL, 0)) {
> +				igt_warn("Failed to get EDID serial for display %d\n",
> +					 i + 1);
> +				return false;
> +			}
> +
> +			if (strcmp(serial, disp->edid_serial) != 0) {
> +				igt_warn("EDID serial mismatch for display %d: expected '%s', got '%s'\n",
> +					 i + 1, disp->edid_serial, serial);
> +				return false;
> +			}
> +
> +			igt_debug("Display %d EDID serial verified: %s\n",
> +				  i + 1, serial);
> +		} else {
> +			igt_debug("Display %d: No EDID serial configured, "
> +				  "skipping verification\n", i + 1);
> +		}
> +	}
> +
> +	igt_info("Port %d: All %d displays verified\n",
> +		 port_cfg->port_num, port_cfg->display_count);
> +	return true;
> +}
> +
> +/*
> + * init_display_ctx - Resolve a usb4switch_display to an output and select mode.
> + *
> + * Finds the connector, resolves to igt_output_t, and selects the max
> + * non-joiner mode. Must be called before arm_display().
> + */
> +static void init_display_ctx(data_t *data, struct display_ctx *ctx,
> +			     const struct usb4switch_display *disp)
> +{
> +	drmModeModeInfo *mode;
> +
> +	memset(ctx, 0, sizeof(*ctx));
> +
> +	igt_assert_f(find_connector(data->drm_fd, disp, &ctx->conn_id),
> +		     "Display not found for pipeline test\n");
> +
> +	ctx->output = find_output_by_id(&data->display, ctx->conn_id);
> +	igt_assert_f(ctx->output,
> +		     "No output for connector %u\n", ctx->conn_id);
> +
> +	mode = select_max_non_joiner_mode(data->drm_fd, ctx->output,
> +					  data->max_dotclock);
> +	igt_skip_on_f(!mode,
> +		      "No non-joiner mode for connector %u\n", ctx->conn_id);
> +
> +	ctx->mode = *mode;
> +	ctx->valid = true;
> +}
> +
> +/*
> + * arm_display - Create FB, set primary plane, configure mode override.
> + *
> + * Pipe assignment must be done before this (by setup_port_displays).
> + * After arming, caller must commit with igt_display_commit2().
> + */
> +static void arm_display(data_t *data, struct display_ctx *ctx)
> +{
> +	igt_assert(ctx->valid);
> +
> +	igt_output_override_mode(ctx->output, &ctx->mode);
> +
> +	ctx->primary = igt_output_get_plane_type(ctx->output,
> +						 DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(ctx->primary);
> +
> +	igt_create_color_fb(data->drm_fd,
> +			    ctx->mode.hdisplay, ctx->mode.vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 1.0, 0.0, /* green */
> +			    &ctx->fb);
> +	igt_plane_set_fb(ctx->primary, &ctx->fb);
> +
> +	igt_info("  Display %s: armed %dx%d@%d (clock %d)\n",
> +		 igt_output_name(ctx->output),
> +		 ctx->mode.hdisplay, ctx->mode.vdisplay,
> +		 ctx->mode.vrefresh, ctx->mode.clock);
> +}
> +
> +/*
> + * collect_display_crc - Collect CRC samples and verify stability.
> + *
> + * Collects CRC_STABILITY_SAMPLES, asserts they are identical (expected
> + * for a solid color FB), and returns the representative CRC in *out_crc.
> + * Display must be armed and committed before calling.
> + */
> +static void collect_display_crc(data_t *data, struct display_ctx *ctx,
> +				igt_crc_t *out_crc)
> +{
> +	igt_crtc_t *crtc = igt_output_get_driving_crtc(ctx->output);
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t samples[CRC_STABILITY_SAMPLES];
> +	int i;
> +
> +	igt_assert(crtc);
> +
> +	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_assert(pipe_crc);
> +
> +	igt_pipe_crc_start(pipe_crc);
> +	for (i = 0; i < CRC_STABILITY_SAMPLES; i++)
> +		igt_pipe_crc_get_single(pipe_crc, &samples[i]);
> +	igt_pipe_crc_stop(pipe_crc);
> +
> +	/* Solid color FB: all samples must be identical */
> +	for (i = 1; i < CRC_STABILITY_SAMPLES; i++)
> +		igt_assert_crc_equal(&samples[0], &samples[i]);
> +
> +	*out_crc = samples[0];
> +
> +	igt_info("  Display %s: CRC stable (%d samples, pipe %s)\n",
> +		 igt_output_name(ctx->output), CRC_STABILITY_SAMPLES,
> +		 igt_crtc_name(crtc));
> +
> +	igt_pipe_crc_free(pipe_crc);
> +}
> +
> +/*
> + * disarm_display - Clear plane, output, and remove FB.
> + *
> + * After disarming all outputs, caller must commit to apply changes.
> + */
> +static void disarm_display(data_t *data, struct display_ctx *ctx)
> +{
> +	if (!ctx->valid)
> +		return;
> +
> +	if (ctx->primary)
> +		igt_plane_set_fb(ctx->primary, NULL);
> +
> +	igt_output_set_crtc(ctx->output, NULL);
> +	igt_output_override_mode(ctx->output, NULL);
> +
> +	if (ctx->fb.fb_id)
> +		igt_remove_fb(data->drm_fd, &ctx->fb);
> +
> +	ctx->primary = NULL;
> +	ctx->fb.fb_id = 0;
> +	ctx->valid = false;
> +}
> +
> +/*
> + * setup_port_displays - Init contexts, allocate pipes, arm all displays.
> + *
> + * Resolves all displays on a port, selects modes, allocates pipes using
> + * the joiner-aware pipe allocator, and arms all displays.
> + * Caller must commit with igt_display_commit2() after this returns.
> + *
> + * Returns: Number of displays set up.
> + */
> +static int setup_port_displays(data_t *data, struct display_ctx *ctxs,
> +			       const struct usb4switch_port *port_cfg)
> +{
> +	igt_output_t *outputs[MAX_DISPLAYS_PER_PORT];
> +	uint32_t used_pipes = 0;
> +	int i;
> +
> +	igt_assert(port_cfg->display_count <= MAX_DISPLAYS_PER_PORT);
> +
> +	for (i = 0; i < port_cfg->display_count; i++) {
> +		init_display_ctx(data, &ctxs[i], &port_cfg->displays[i]);
> +		outputs[i] = ctxs[i].output;
> +	}
> +
> +	/* Joiner-aware pipe allocation */
> +	igt_assert_f(igt_assign_pipes_for_outputs(data->drm_fd, outputs,
> +						  port_cfg->display_count,
> +						  data->display.n_crtcs,
> +						  &used_pipes,
> +						  data->master_pipes,
> +						  data->valid_pipes),
> +		     "Failed to allocate pipes for port %d displays\n",
> +		     port_cfg->port_num);
> +
> +	for (i = 0; i < port_cfg->display_count; i++)
> +		arm_display(data, &ctxs[i]);
> +
> +	return port_cfg->display_count;
> +}
> +
> +static void teardown_port_displays(data_t *data, struct display_ctx *ctxs,
> +				   int count)
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++)
> +		disarm_display(data, &ctxs[i]);
> +}
> +
> +/*
> + * verify_port_display_pipeline - Modeset all port displays and verify CRC.
> + *
> + * Used in non-suspend paths to confirm the display pipeline is functioning.
> + * Arms all displays, commits, collects stable CRCs, then tears down.
> + */
> +static void verify_port_display_pipeline(data_t *data,
> +					 const struct usb4switch_port *port_cfg)
> +{
> +	struct display_ctx ctxs[MAX_DISPLAYS_PER_PORT];
> +	igt_crc_t crc;
> +	int count, i;
> +
> +	count = setup_port_displays(data, ctxs, port_cfg);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	for (i = 0; i < count; i++)
> +		collect_display_crc(data, &ctxs[i], &crc);
> +
> +	teardown_port_displays(data, ctxs, count);
> +
> +	igt_info("Port %d: Pipeline verification passed for %d displays\n",
> +		 port_cfg->port_num, count);
> +}
> +
> +/*
> + * get_port_reference_crcs - Modeset and collect reference CRCs before suspend.
> + *
> + * Arms all displays, commits, collects a baseline CRC per display into
> + * ref_crcs[], then tears down. The reference CRCs are compared with
> + * post-resume CRCs to detect display corruption.
> + */
> +static void get_port_reference_crcs(data_t *data,
> +				    const struct usb4switch_port *port_cfg,
> +				    igt_crc_t *ref_crcs)
> +{
> +	struct display_ctx ctxs[MAX_DISPLAYS_PER_PORT];
> +	int count, i;
> +
> +	count = setup_port_displays(data, ctxs, port_cfg);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	for (i = 0; i < count; i++)
> +		collect_display_crc(data, &ctxs[i], &ref_crcs[i]);
> +
> +	teardown_port_displays(data, ctxs, count);
> +
> +	igt_info("Port %d: Collected %d reference CRCs for suspend comparison\n",
> +		 port_cfg->port_num, count);
> +}
> +
> +/*
> + * verify_port_crcs_after_resume - Compare post-resume CRCs with pre-suspend.
> + *
> + * Arms all displays with the same mode/FB as before suspend, commits,
> + * collects new CRCs, and asserts each matches the corresponding reference.
> + * A mismatch indicates the display is showing garbage after resume.
> + */
> +static void verify_port_crcs_after_resume(data_t *data,
> +					  const struct usb4switch_port *port_cfg,
> +					  const igt_crc_t *ref_crcs)
> +{
> +	struct display_ctx ctxs[MAX_DISPLAYS_PER_PORT];
> +	igt_crc_t resume_crc;
> +	int count, i;
> +
> +	count = setup_port_displays(data, ctxs, port_cfg);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	for (i = 0; i < count; i++) {
> +		collect_display_crc(data, &ctxs[i], &resume_crc);
> +		igt_assert_crc_equal(&ref_crcs[i], &resume_crc);
> +		igt_info("  Display %s: CRC matches pre-suspend reference\n",
> +			 igt_output_name(ctxs[i].output));
> +	}
> +
> +	teardown_port_displays(data, ctxs, count);
> +
> +	igt_info("Port %d: All %d CRCs match pre-suspend reference\n",
> +		 port_cfg->port_num, count);
> +}
> +
> +/*
> + * refresh_display - Reinitialize display structure to pick up new connectors.
> + * After hotplug events (dock/undock), new MST connectors may be created.
> + *
> + * WARNING: Any previously cached igt_output_t pointers become invalid
> + * after this call.  Callers must re-resolve outputs via find_output_by_id()
> + * or init_display_ctx() before using them.
> + */
> +static void refresh_display(data_t *data)
> +{
> +	igt_display_fini(&data->display);
> +	igt_display_require(&data->display, data->drm_fd);
> +}
> +
> +/*
> + * wait_for_displays - Wait for all displays on a port to connect.
> + */
> +static bool wait_for_displays(data_t *data,
> +			      const struct usb4switch_port *port,
> +			      int timeout_s)
> +{
> +	int elapsed = 0;
> +	int found = 0;
> +	int i;
> +
> +	if (!port)
> +		return false;
> +
> +	while (elapsed < timeout_s) {
> +		reprobe_connectors(data->drm_fd);
> +
> +		found = 0;
> +		for (i = 0; i < port->display_count; i++) {
> +			uint32_t id;
> +
> +			if (find_connector(data->drm_fd,
> +					   &port->displays[i], &id))
> +				found++;
> +		}
> +
> +		if (found == port->display_count) {
> +			igt_debug("All %d displays found for port %d\n",
> +				  port->display_count, port->port_num);
> +			/*
> +			 * Reprobe cycles above may have created new MST
> +			 * connectors.  Rebuild igt_display_t so callers
> +			 * see up-to-date connector IDs and outputs.
> +			 */
> +			refresh_display(data);
> +			return true;
> +		}
> +
> +		sleep(1);
> +		elapsed++;
> +	}
> +
> +	igt_warn("Timeout waiting for displays (found %d/%d)\n",
> +		 found, port->display_count);
> +	return false;
> +}
> +
> +static void wait_for_hotplug(data_t *data, int timeout_s)
> +{
> +	bool detected;
> +
> +	detected = igt_hotplug_detected(data->hotplug_mon, timeout_s);
> +
> +	if (detected)
> +		igt_debug("Hotplug detected\n");
> +	else
> +		igt_warn("Hotplug uevent not detected within %ds\n",
> +			 timeout_s);
> +
> +	reprobe_connectors(data->drm_fd);
> +	refresh_display(data);
> +}
> +
> +/*
> + * mst_stabilize - Extended MST topology stabilization after resume.
> + * MST hubs need additional time and reprobe cycles to rebuild their
> + * topology after suspend/resume. Ten iterations with 500 ms spacing
> + * gives the hub firmware enough time to re-enumerate all downstream
> + * ports, based on empirical testing with USB4/TBT docks.
> + */
> +static void mst_stabilize(data_t *data)
> +{
> +	int i;
> +
> +	for (i = 0; i < MST_STABILIZE_REPROBE_COUNT; i++) {
> +		reprobe_connectors(data->drm_fd);
> +		usleep(MST_STABILIZE_DELAY_US);
> +	}
> +}
> +
> +/*
> + * port_dynamic_name - Format dynamic subtest name for a port.
> + * Uses port name if configured, otherwise falls back to "port-N".
> + *
> + * IGT requires subtest names to contain only [a-zA-Z0-9_-] and to be
> + * lower-case.  Any upper-case letter is lowered, any other invalid
> + * character (e.g. spaces) is replaced with '-'.
> + */
> +static const char *port_dynamic_name(const struct usb4switch_port *port,
> +				     char *buf, size_t len)
> +{
> +	size_t i;
> +
> +	if (port->name) {
> +		snprintf(buf, len, "%s", port->name);
> +		for (i = 0; buf[i]; i++) {
> +			buf[i] = tolower((unsigned char)buf[i]);
> +			if (!isalnum((unsigned char)buf[i]) &&
> +			    buf[i] != '-' && buf[i] != '_')
> +				buf[i] = '-';
> +		}
> +	} else {
> +		snprintf(buf, len, "port-%d", port->port_num);
> +	}
> +	return buf;
> +}
> +
> +/*
> + * pair_dynamic_name - Format dynamic subtest name for a port pair.
> + * Combines both port names with "-to-" separator.
> + */
> +static const char *pair_dynamic_name(const struct usb4switch_port *a,
> +				     const struct usb4switch_port *b,
> +				     char *buf, size_t len)
> +{
> +	char na[32], nb[32];
> +
> +	port_dynamic_name(a, na, sizeof(na));
> +	port_dynamic_name(b, nb, sizeof(nb));
> +	snprintf(buf, len, "%s-to-%s", na, nb);
> +	return buf;
> +}
> +
> +static void test_dock_undock(data_t *data,
> +			     const struct usb4switch_port *port_cfg)
> +{
> +	int iterations = usb4switch_get_iterations(data->sw);
> +	int timeout = usb4switch_get_hotplug_timeout(data->sw);
> +	int i;
> +
> +	igt_info("Testing port %d (%s) with %d displays, %d iterations\n",
> +		 port_cfg->port_num,
> +		 port_cfg->name ? port_cfg->name : "unnamed",
> +		 port_cfg->display_count, iterations);
> +
> +	for (i = 0; i < iterations; i++) {
> +		igt_info("Iteration %d/%d\n", i + 1, iterations);
> +
> +		/* Dock */
> +		igt_info("  Docking port %d...\n",
> +			 port_cfg->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_cfg->port_num));
> +		wait_for_hotplug(data, timeout);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg, timeout),
> +			     "Displays did not enumerate on port %d\n",
> +			     port_cfg->port_num);
> +
> +		igt_assert_f(verify_port_displays(data, port_cfg),
> +			     "Display verification failed on port %d\n",
> +			     port_cfg->port_num);
> +
> +		verify_port_display_pipeline(data, port_cfg);
> +
> +		/* Undock */
> +		igt_info("  Undocking...\n");
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +		wait_for_hotplug(data, timeout);
> +	}
> +}
> +
> +static void test_dock_undock_sr(data_t *data,
> +				const struct usb4switch_port *port_cfg)
> +{
> +	igt_crc_t ref_crcs[MAX_DISPLAYS_PER_PORT];
> +	int iterations = usb4switch_get_iterations(data->sw);
> +	int timeout = usb4switch_get_hotplug_timeout(data->sw);
> +	int i;
> +
> +	igt_info("Testing port %d (%s) dock/undock with S/R, %d iterations\n",
> +		 port_cfg->port_num,
> +		 port_cfg->name ? port_cfg->name : "unnamed",
> +		 iterations);
> +
> +	for (i = 0; i < iterations; i++) {
> +		igt_info("Iteration %d/%d\n", i + 1, iterations);
> +
> +		/* Dock */
> +		igt_info("  Docking port %d...\n",
> +			 port_cfg->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_cfg->port_num));
> +		wait_for_hotplug(data, timeout);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg,
> +					       timeout),
> +			     "Displays did not enumerate\n");
> +
> +		igt_info("  Verifying displays before suspend...\n");
> +		igt_assert_f(verify_port_displays(data, port_cfg),
> +			     "Display verification failed before suspend\n");
> +
> +		/* Collect reference CRCs before suspend */
> +		get_port_reference_crcs(data, port_cfg, ref_crcs);
> +
> +		/* Suspend/Resume while docked */
> +		igt_info("  Suspending while docked...\n");
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +		igt_info("  Resumed\n");
> +
> +		mst_stabilize(data);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg,
> +					       timeout),
> +			     "Displays did not enumerate after resume\n");
> +		igt_info("  Verifying displays after resume...\n");
> +		igt_assert_f(verify_port_displays(data, port_cfg),
> +			     "Display verification failed after resume\n");
> +
> +		/* Compare post-resume CRCs with pre-suspend reference */
> +		verify_port_crcs_after_resume(data, port_cfg, ref_crcs);
> +
> +		/* Undock */
> +		igt_info("  Undocking...\n");
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +		wait_for_hotplug(data, timeout);
> +	}
> +}
> +
> +static void test_dock_during_suspend(data_t *data,
> +				     const struct usb4switch_port *port_cfg)
> +{
> +	int iterations = usb4switch_get_iterations(data->sw);
> +	int timeout = usb4switch_get_hotplug_timeout(data->sw);
> +	int i;
> +
> +	igt_info("Testing port %d (%s) dock-during-suspend, %d iterations\n",
> +		 port_cfg->port_num,
> +		 port_cfg->name ? port_cfg->name : "unnamed",
> +		 iterations);
> +
> +	for (i = 0; i < iterations; i++) {
> +		igt_info("Iteration %d/%d\n", i + 1, iterations);
> +
> +		/*
> +		 * Schedule dock during suspend using hardware delay.
> +		 * Port change executes at T+7s while system is
> +		 * suspended (15s suspend cycle).
> +		 */
> +		igt_info("  Scheduling dock during suspend (T+7s)...\n");
> +		igt_assert(usb4switch_port_enable_delayed(data->sw,
> +							  port_cfg->port_num,
> +							  7));
> +
> +		igt_info("  Suspending (15s, dock at T+7s)...\n");
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +		igt_info("  Resumed\n");
> +
> +		igt_info("  Reprobing connectors for MST discovery...\n");
> +		mst_stabilize(data);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg,
> +					       timeout),
> +			     "Displays did not enumerate after dock-during-suspend\n");
> +
> +		igt_info("  Verifying displays after dock-during-suspend...\n");
> +		igt_assert_f(verify_port_displays(data, port_cfg),
> +			     "Display verification failed after dock-during-suspend\n");
> +
> +		verify_port_display_pipeline(data, port_cfg);
> +
> +		/* Undock to restore disconnected state for next iteration */
> +		igt_info("  Undocking...\n");
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +		wait_for_hotplug(data, timeout);
> +	}
> +}
> +
> +static void test_undock_during_suspend(data_t *data,
> +				       const struct usb4switch_port *port_cfg)
> +{
> +	int iterations = usb4switch_get_iterations(data->sw);
> +	int timeout = usb4switch_get_hotplug_timeout(data->sw);
> +	int i;
> +
> +	igt_info("Testing port %d (%s) undock-during-suspend, %d iterations\n",
> +		 port_cfg->port_num,
> +		 port_cfg->name ? port_cfg->name : "unnamed",
> +		 iterations);
> +
> +	for (i = 0; i < iterations; i++) {
> +		int j, found;
> +
> +		igt_info("Iteration %d/%d\n", i + 1, iterations);
> +
> +		/* Dock first */
> +		igt_info("  Docking port %d...\n", port_cfg->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_cfg->port_num));
> +		wait_for_hotplug(data, timeout);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg, timeout),
> +			     "Displays did not enumerate on port %d\n",
> +			     port_cfg->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg),
> +			     "Display verification failed on port %d\n",
> +			     port_cfg->port_num);
> +
> +		verify_port_display_pipeline(data, port_cfg);
> +
> +		/*
> +		 * Schedule undock during suspend using hardware delay.
> +		 * Port disable executes at T+7s while system is
> +		 * suspended (15s suspend cycle).
> +		 */
> +		igt_info("  Scheduling undock during suspend (T+7s)...\n");
> +		igt_assert(usb4switch_port_disable_delayed(data->sw, 7));
> +
> +		igt_info("  Suspending (15s, undock at T+7s)...\n");
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +		igt_info("  Resumed\n");
> +
> +		mst_stabilize(data);
> +
> +		/* Verify displays are gone after undock-during-suspend */
> +		reprobe_connectors(data->drm_fd);
> +		found = 0;
> +		for (j = 0; j < port_cfg->display_count; j++) {
> +			uint32_t id;
> +
> +			if (find_connector(data->drm_fd,
> +					   &port_cfg->displays[j], &id))
> +				found++;
> +		}
> +		igt_assert_f(found == 0,
> +			     "Port %d: %d/%d displays still present after undock-during-suspend\n",
> +			     port_cfg->port_num, found,
> +			     port_cfg->display_count);
> +
> +		igt_info("Port %d: All displays removed after undock-during-suspend\n",
> +			 port_cfg->port_num);
> +	}
> +}
> +
> +static void test_switch(data_t *data,
> +			const struct usb4switch_port *port_a,
> +			const struct usb4switch_port *port_b)
> +{
> +	int iterations = usb4switch_get_iterations(data->sw);
> +	int timeout = USB4_SWITCH_TIMEOUT_S;
> +	int i;
> +
> +	igt_info("Testing switch port %d -> port %d, %d iterations\n",
> +		 port_a->port_num, port_b->port_num, iterations);
> +
> +	for (i = 0; i < iterations; i++) {
> +		igt_info("Iteration %d/%d\n", i + 1, iterations);
> +
> +		/* Enable port A */
> +		igt_info("  Enabling port %d...\n",
> +			 port_a->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_a->port_num));
> +		wait_for_hotplug(data, timeout);
> +
> +		igt_assert_f(wait_for_displays(data, port_a,
> +					       timeout),
> +			     "Displays did not enumerate on port %d\n",
> +			     port_a->port_num);
> +		igt_assert_f(verify_port_displays(data, port_a),
> +			     "Display verification failed on port %d\n",
> +			     port_a->port_num);
> +		verify_port_display_pipeline(data, port_a);
> +
> +		/* Switch to port B */
> +		igt_info("  Switching to port %d...\n",
> +			 port_b->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_b->port_num));
> +		wait_for_hotplug(data, timeout);
> +
> +		igt_assert_f(wait_for_displays(data, port_b,
> +					       timeout),
> +			     "Displays did not enumerate after switch to port %d\n",
> +			     port_b->port_num);
> +		igt_assert_f(verify_port_displays(data, port_b),
> +			     "Display verification failed after switch to port %d\n",
> +			     port_b->port_num);
> +
> +		verify_port_display_pipeline(data, port_b);
> +	}
> +
> +	igt_flush_uevents(data->hotplug_mon);
> +	igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +	wait_for_hotplug(data, timeout);
> +}
> +
> +static void test_switch_during_suspend(data_t *data,
> +				       const struct usb4switch_port *port_cfg_a,
> +				       const struct usb4switch_port *port_cfg_b)
> +{
> +	int iterations = usb4switch_get_iterations(data->sw);
> +	int timeout = USB4_SWITCH_TIMEOUT_S;

No use of this having as a variable, why not use the macro directly?
Same for all above!


> +	int i;
> +
> +	igt_info("Testing switch during suspend port %d <-> port %d, %d iterations\n",
> +		 port_cfg_a->port_num, port_cfg_b->port_num, iterations);
> +
> +	for (i = 0; i < iterations; i++) {
> +		igt_info("Iteration %d/%d\n", i + 1, iterations);
> +
> +		/* Start on port A */
> +		igt_info("  Enabling port %d...\n", port_cfg_a->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_cfg_a->port_num));
> +		wait_for_hotplug(data, timeout);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg_a, timeout),
> +			     "Displays did not enumerate on port %d\n",
> +			     port_cfg_a->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg_a),
> +			     "Display verification failed on port %d\n",
> +			     port_cfg_a->port_num);
> +
> +		verify_port_display_pipeline(data, port_cfg_a);
> +
> +		/* Schedule switch to B during suspend */
> +		igt_info("  Scheduling switch to port %d during suspend (T+7s)...\n",
> +			 port_cfg_b->port_num);
> +		igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +		igt_assert(usb4switch_port_enable_delayed(data->sw,
> +							  port_cfg_b->port_num,
> +							  7));
> +
> +		igt_info("  Suspending (15s, switch at T+7s)...\n");
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +		igt_info("  Resumed\n");
> +
> +		igt_info("  Reprobing connectors for MST discovery...\n");
> +		mst_stabilize(data);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg_b, timeout),
> +			     "Displays did not enumerate on port %d after switch-during-suspend\n",
> +			     port_cfg_b->port_num);
> +		igt_info("  Verifying displays on port %d...\n",
> +			 port_cfg_b->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg_b),
> +			     "Display verification failed on port %d after switch-during-suspend\n",
> +			     port_cfg_b->port_num);
> +
> +		verify_port_display_pipeline(data, port_cfg_b);
> +
> +		/* Schedule switch back to A during suspend */
> +		igt_info("  Scheduling switch to port %d during suspend (T+7s)...\n",
> +			 port_cfg_a->port_num);
> +		igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +		igt_assert(usb4switch_port_enable_delayed(data->sw,
> +							  port_cfg_a->port_num,
> +							  7));
> +
> +		igt_info("  Suspending (15s, switch at T+7s)...\n");
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +		igt_info("  Resumed\n");
> +
> +		mst_stabilize(data);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg_a, timeout),
> +			     "Displays did not enumerate on port %d after switch-during-suspend\n",
> +			     port_cfg_a->port_num);
> +		igt_info("  Verifying displays on port %d...\n",
> +			 port_cfg_a->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg_a),
> +			     "Display verification failed on port %d after switch-during-suspend\n",
> +			     port_cfg_a->port_num);
> +
> +		verify_port_display_pipeline(data, port_cfg_a);
> +	}
> +
> +	igt_flush_uevents(data->hotplug_mon);
> +	igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +	wait_for_hotplug(data, timeout);
> +}
> +
> +static void test_switch_sr(data_t *data,
> +			   const struct usb4switch_port *port_cfg_a,
> +			   const struct usb4switch_port *port_cfg_b)
> +{
> +	igt_crc_t ref_crcs[MAX_DISPLAYS_PER_PORT];
> +	int iterations = usb4switch_get_iterations(data->sw);
> +	int timeout = USB4_SWITCH_TIMEOUT_S;
Why not have it as a const or use the macro directly?
> +	int i;
> +
> +	igt_info("Testing switch with S/R port %d <-> port %d, %d iterations\n",
> +		 port_cfg_a->port_num, port_cfg_b->port_num, iterations);
> +
> +	for (i = 0; i < iterations; i++) {
> +		igt_info("Iteration %d/%d\n", i + 1, iterations);
> +
> +		/* Enable port A */
> +		igt_info("  Enabling port %d...\n", port_cfg_a->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_cfg_a->port_num));
> +		wait_for_hotplug(data, timeout);
> replace timeout with the macro/magic value directly.
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg_a, timeout),
> +			     "Displays did not enumerate on port %d\n",
> +			     port_cfg_a->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg_a),
> +			     "Display verification failed on port %d\n",
> +			     port_cfg_a->port_num);
> +
> +		/* Collect reference CRCs on port A before suspend */
> +		get_port_reference_crcs(data, port_cfg_a, ref_crcs);
> +
> +		/* Suspend/Resume */
> +		igt_info("  Suspending with port %d active...\n",
> +			 port_cfg_a->port_num);
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +		igt_info("  Resumed\n");
> +
> +		mst_stabilize(data);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg_a, timeout),
> +			     "Displays did not enumerate on port %d after resume\n",
> +			     port_cfg_a->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg_a),
> +			     "Display verification failed on port %d after resume\n",
> +			     port_cfg_a->port_num);
> +
> +		/* Compare post-resume CRCs with pre-suspend reference */
> +		verify_port_crcs_after_resume(data, port_cfg_a, ref_crcs);
> +
> +		/* Switch to port B */
> +		igt_info("  Switching to port %d...\n",
> +			 port_cfg_b->port_num);
> +		igt_flush_uevents(data->hotplug_mon);
> +		igt_assert(usb4switch_port_switch(data->sw,
> +						  port_cfg_b->port_num));
> +		wait_for_hotplug(data, timeout);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg_b, timeout),
> +			     "Displays did not enumerate on port %d\n",
> +			     port_cfg_b->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg_b),
> +			     "Display verification failed on port %d\n",
> +			     port_cfg_b->port_num);
> +
> +		/* Collect reference CRCs on port B before suspend */
> +		get_port_reference_crcs(data, port_cfg_b, ref_crcs);
> +
> +		/* Suspend/Resume with port B */
> +		igt_info("  Suspending with port %d active...\n",
> +			 port_cfg_b->port_num);
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +		igt_info("  Resumed\n");
> +
> +		mst_stabilize(data);
> +
> +		igt_assert_f(wait_for_displays(data, port_cfg_b, timeout),
> +			     "Displays did not enumerate on port %d after resume\n",
> +			     port_cfg_b->port_num);
> +		igt_assert_f(verify_port_displays(data, port_cfg_b),
> +			     "Display verification failed on port %d after resume\n",
> +			     port_cfg_b->port_num);
> +
> +		/* Compare post-resume CRCs with pre-suspend reference */
> +		verify_port_crcs_after_resume(data, port_cfg_b, ref_crcs);
> +	}
> +
> +	igt_flush_uevents(data->hotplug_mon);
> +	igt_assert(usb4switch_port_disable_and_wait(data->sw));
> +	wait_for_hotplug(data, timeout);
> +}
> +
> +int igt_main()
> +{
> +	const struct usb4switch_port *pcfg, *pa, *pb;
> +	data_t data = {};
> +	igt_crtc_t *crtc;
> +	char name[80];
> +	int port_count;
> +	int p;
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		igt_require(data.drm_fd >= 0);
> +
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +
> +		data.sw = usb4switch_init(data.drm_fd);
> +		igt_require_f(data.sw, "USB4 Switch 3141 not available\n");
> +
> +		igt_require_pipe_crc(data.drm_fd);
> +		data.max_dotclock = igt_get_max_dotclock(data.drm_fd);
> +
> +		data.hotplug_mon = igt_watch_uevents();
> +		igt_require(data.hotplug_mon);
> +
> +		/* Compute pipe masks for joiner-aware allocation */
> +		igt_set_all_master_pipes_for_platform(&data.display,
> +						      &data.master_pipes);
> +		data.valid_pipes = 0;
> +		for_each_crtc(&data.display, crtc)
> +			data.valid_pipes |= BIT(crtc->pipe);
> +
> +		/* Ensure all ports are disconnected */
> +		igt_assert(usb4switch_port_disable_and_wait(data.sw));
> +	}
> +
> +	igt_describe("Dock/undock cycles with display verification");
> +	igt_subtest_with_dynamic("dock-undock") {
> +		port_count = usb4switch_get_port_count(data.sw);
> +
> +		for_each_usb4_port(data.sw, port_count, p, pcfg) {
> +			port_dynamic_name(pcfg, name, sizeof(name));
> +			igt_dynamic(name)
> +				test_dock_undock(&data, pcfg);
> +		}
> +	}
> +
> +	igt_describe("Dock/undock with suspend/resume stability");
> +	igt_subtest_with_dynamic("dock-undock-sr") {
> +		port_count = usb4switch_get_port_count(data.sw);
> +
> +		for_each_usb4_port(data.sw, port_count, p, pcfg) {
> +			port_dynamic_name(pcfg, name, sizeof(name));
> +			igt_dynamic(name)
> +				test_dock_undock_sr(&data, pcfg);
> +		}
> +	}
> +
> +	igt_describe("Dock during suspend with display verification");
> +	igt_subtest_with_dynamic("dock-during-suspend") {
> +		port_count = usb4switch_get_port_count(data.sw);
> +
> +		for_each_usb4_port(data.sw, port_count, p, pcfg) {
> +			port_dynamic_name(pcfg, name, sizeof(name));
> +			igt_dynamic(name)
> +				test_dock_during_suspend(&data, pcfg);
> +		}
> +	}
> +
> +	igt_describe("Undock during suspend with display verification");
> +	igt_subtest_with_dynamic("undock-during-suspend") {
> +		port_count = usb4switch_get_port_count(data.sw);
> +
> +		for_each_usb4_port(data.sw, port_count, p, pcfg) {
> +			port_dynamic_name(pcfg, name, sizeof(name));
> +			igt_dynamic(name)
> +				test_undock_during_suspend(&data, pcfg);
> +		}
> +	}
> +
> +	igt_describe("Port switching with display verification");
> +	igt_subtest_with_dynamic("switch") {
> +		port_count = usb4switch_get_port_count(data.sw);
> +		igt_require(port_count > 1);
> +
> +		for_each_usb4_port_pair(data.sw, port_count, p, pa, pb) {
> +			pair_dynamic_name(pa, pb, name, sizeof(name));
> +			igt_dynamic(name)
> +				test_switch(&data, pa, pb);
> +		}
> +	}
> +
> +	igt_describe("Port switching with suspend/resume stability");
> +	igt_subtest_with_dynamic("switch-sr") {
> +		port_count = usb4switch_get_port_count(data.sw);
> +		igt_require(port_count > 1);
> +
> +		for_each_usb4_port_pair(data.sw, port_count, p, pa, pb) {
> +			pair_dynamic_name(pa, pb, name, sizeof(name));
> +			igt_dynamic(name)
> +				test_switch_sr(&data, pa, pb);
> +		}
> +	}
> +
> +	igt_describe("Port switching during suspend via hardware delay");
> +	igt_subtest_with_dynamic("switch-during-suspend") {
> +		port_count = usb4switch_get_port_count(data.sw);
> +		igt_require(port_count > 1);
> +
> +		for_each_usb4_port_pair(data.sw, port_count, p, pa, pb) {
> +			pair_dynamic_name(pa, pb, name, sizeof(name));
> +			igt_dynamic(name)
> +				test_switch_during_suspend(&data, pa, pb);
> +		}
> +	}
> +
> +	igt_fixture() {
> +		if (!usb4switch_port_disable_and_wait(data.sw))
> +			igt_warn("Failed to disable ports during cleanup\n");
> +		igt_cleanup_uevents(data.hotplug_mon);
> +		usb4switch_deinit(data.sw);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f356de9b..563c65240 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -276,6 +276,7 @@ intel_kms_progs = [
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
>   	'kms_sharpness_filter',
> +	'kms_usb4_switch',
>   ]
>   
>   intel_xe_progs = [
> @@ -400,6 +401,7 @@ extra_sources = {
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_usb4_switch': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>   }
>   
>   # Extra dependencies used on core and Intel drivers
