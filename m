Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1791FC83F27
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 00:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B103110E6D2;
	Wed, 16 Jul 2025 00:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kff/Kgws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8EE10E6D2
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 00:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752626493; x=1784162493;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=sDjHq1QLzpIlJkZOJ6yDqwH7DBODQZgXiFVals8QkzY=;
 b=kff/Kgwsem9TSEkv7Z9+55FARj3o4Qq0ESLI47MW3S8aIRbmZ+lgmaBu
 tjBCtyXB1M1wly1hEk4kTtSmg+7woOvwJDlJU348dhylrcPZFqU10AIqu
 BtdT8ov9MWk12YFSrfRj0N/phTKns2FwgsDbG8kZK+1bWUqoFDEas0GT/
 L1DZMKM5HKlYaf90E0uON3WNINVQ6QTMBSjhj20ubsSidck7gJAH3eS1V
 42IZr/d+yK/jJdEMHL8Jml+9T4EL2L9mihNskGC1eS9Lh9wvzYKgeKgi3
 Q1QWYvOMd7mUz3PXo6sgifD479Ontqu9Ona5bCXSCWWB+1DxPvxbZ0cHA w==;
X-CSE-ConnectionGUID: HmxoSp82TG6J624YlYS/fQ==
X-CSE-MsgGUID: 5+4j9b42R0uXnQNOwgph8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55011426"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208,217";a="55011426"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 17:41:33 -0700
X-CSE-ConnectionGUID: S8K3RdGrRayaiKkvZAhrlQ==
X-CSE-MsgGUID: T0wzNYN3QyuOpBUEsWftYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
 d="scan'208,217";a="157462823"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 17:41:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 17:41:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 17:41:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 17:41:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7CDT9AKi1432koqriipbETfGKtG3nCkN/vCmQiH60MZTXUw9Mj7psUHE2HtKGQl18KGMI+WB7T543ERA48iHjZjGa96S8XA761zKwyyaPVr8E9hY36TB9GcSjLqKUkDrwSriBpxcD4uK77G2kx93cnS4t3mWCyW2nQ/QI81uOOSApodgp7tVIBRcNZgUvckvrY60q8/UYQsqlhZQaq60HrzmlpWMBhtDXIF5gFwl9bP50PWyCDEZrRtuBgZ3g0aiLLDlO8wvReWDeTkurTcnPRgYm1fLUyNqMYw6facAEElqHEJW3kDSeqVLoml5FP0AdvYbUk3iBlN+pnvKEhiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2km464jvZe6X55MOn1G2UrOgFjMdYdrcRRkhYEotVA=;
 b=v80roa+fLUjmr2MnzgHCvGbWpleq2xfSek3Sl9tW2ekx0L/UpZofxRYZvjG3bBX80YdsAaAFjxZSS0dRRb+ljWf7SympQvBNXMX4KfgwOVQ/nQdxYP+TzV7GoTnOwHldvDkHKXVIM0lEIQG9NSWgs7jtEGZKPHJYSPF5thBMOf6hpYxBtjSxoVd0QBRUtRVQOC9gbrVqiqZ8KngDA8/6or2sfP0LO34lkpSpRAtUNmj9z74g3S6a32qdGW3YF+9r4Z5GpxvxyWHJeiRyJeqYTCn06lLWpCuEdkfLhJK8dq6SSqIysWTowI8tUdi9nkrMwb0YBEtjwj7f33yxAItMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 00:41:30 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.8922.025; Wed, 16 Jul 2025
 00:41:30 +0000
Content-Type: multipart/alternative;
 boundary="------------1ZFAPdrmqXQytonbhP4OuMGP"
Message-ID: <9d4ad0bd-bd00-4d7f-9b46-cf8c48368e63@intel.com>
Date: Wed, 16 Jul 2025 06:11:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2] tests/intel/kms_pipe_stress: Add support for
 additional tiling formats
To: <igt-dev@lists.freedesktop.org>
References: <20250715191457.58097-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250715191457.58097-1-swati2.sharma@intel.com>
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA1PR11MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3b236a-480f-4031-bcb3-08ddc4018103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmJxd1FacTZrNEhZYkEvelRMeWtOeU1FUlhaZkIxcmY1OUhQWURJVjYvUkpO?=
 =?utf-8?B?NCsrbExpM2RtREU0Y2doWkt4eS9EQnNqNXNaUmx4Znk3N09iZ3F5VmxCbXh0?=
 =?utf-8?B?SFYvL1RNY2RMVmZnblpYZVVnSEZhTE1pdFk4QTA1eFRBMlhIRjZZbUdOeU5M?=
 =?utf-8?B?U0RFS3piaG41TzBlc2dsUHZaVmJMN3JWUmRQQ1pHUjkyanRkdFZwQmQ4UVVj?=
 =?utf-8?B?REN2Z2g1ZFRZaWxMaXoxb3hnSkRKVWNiRmFPdE1OZjV0NGZVRXdtS1h3MXFB?=
 =?utf-8?B?d3VFaGlldXA5Z0RVajZ5NVlRZCs5NnZ2OWhMdS9GRUxqMG8rOGF6K0FVQ0dl?=
 =?utf-8?B?Mzh5QVh6NFpod3BUNzNaVHQwenJPQ1VhRGhoenYzbzdrYmF3N1lhRFd5bzJP?=
 =?utf-8?B?OUxmNGRrTllWMzNtalNYa1BwT21pRDcwcTdTUzdrUDduTFVVMmJJdGcrZG9m?=
 =?utf-8?B?eDE4Z1lpS3Urdyt2Sit3VnB5RElBSGNaNmR0eFFJc3FHZUFIRjViTGNicmwy?=
 =?utf-8?B?WnF4ZTBnMVFHMmJkVU9ualBEN2MxNmxRUk9iNXUwcXJnNng2ck5JdHFISFYw?=
 =?utf-8?B?eHVvNjVNQmUxeDZMWHU0dTRreEhlanIvbEpQbUZabCt0RHJaUGhaRjdBZTZh?=
 =?utf-8?B?amU3My9kRmxVcnBUOHNHTHl5RFRhTTZrSFIrR3Rzd0wzZXpQL21EaERYWnJv?=
 =?utf-8?B?VFBHUXZqWXFTOHVYM3E2NlFhRitMU3N4YmRXeXJYekVDVHgwbXgvVkdOTEhr?=
 =?utf-8?B?MVM3T1FvTU9vVStWN1A0dElFTFZ0TVdVaUVNU1B1akFFL2JnYVI5dFNGOGh4?=
 =?utf-8?B?NUdUSE1zZDNhSU5FSENjNnN5Ukl1WnJxWHBaaE1vNGgxdTd1SmxjckV0RTg3?=
 =?utf-8?B?dXJ2MWZKelF6T0g3QVZXVmM1TDJ3blVKNEUyK0dlNFhEc0tpdW9UdGRKOWpt?=
 =?utf-8?B?Vk9BRm9uR2FkWmxyVnMrUFF1eFllV1JmbW8xV21zVG9FUjFOMXNuUGlMaCtv?=
 =?utf-8?B?dmd1cDMzNm9iUXpSdVpTZGQwVWpJRGlEYmxacWttMVB0Q1VaRzZxMEErM0J3?=
 =?utf-8?B?dEsrQkxkSFZ3NVpIM1lmem11WmZjclQ4Y2lYWmRoS1A2NEY4NDBST1hPU1FP?=
 =?utf-8?B?UGFwdUNraTlESjZWZzJuamE5aUI4enhVUGp3b1lHa3AyVldkbHEyQ2ErbUV0?=
 =?utf-8?B?YUc3R1BJV0ZQSkhNeUxIUDZzNkt3UlJWWG1kcUNQOWtpcDVsR3BkVHgyR1lp?=
 =?utf-8?B?dWxOemxJZC9LKzZzRDFHVmtpUkZFbUNNNU9JQndyTEhLZmNSbkFzaUsvbHk0?=
 =?utf-8?B?a29ETDBWSHFTcjFvank3MnA0U1RtT1lZN3lMSkYwQmlzOUtTT2F0V3NBNmRm?=
 =?utf-8?B?c2RoVFJlbmFyMHdGajR5RXh2NFFjcldibGk0WWZMWTZ4VWhtdlFMZWJTSzRH?=
 =?utf-8?B?S0RUN0t6bzhKS3VlYkdKejJTbENZMGViYnM1VlRWYUloZFpjdFlmdUdXM3Aw?=
 =?utf-8?B?dURCUmJremg3YkNWRlgyaHArRnFzWDRVZ2NZU29NRzZFRWwxVEFQT0tkNGRj?=
 =?utf-8?B?a0wxV05FM2dhQWJRU1E1bjdNM0RkQ3k3S0FhMllYbkR5YXB3dXBiSWszNUZK?=
 =?utf-8?B?T1lGQ3FHKzFyYzBKaWtMOXlpTUdNTkN0cG00aGE4dVZ5cDY0cW1ybnhYZEZD?=
 =?utf-8?B?aEdMMExSbDR0dGpQeXNBZndleGYrT0tqdUZPK0ZzeFFxcXhWcmNzSHQ1KzlT?=
 =?utf-8?B?QW1nYnBzd2dOOHkvWDJiKzhUbWhDVVNaMzNlamhFd1AvcVJqTnN3ZytITEcv?=
 =?utf-8?B?NVI0VFVlT1J6VDFpNThwTTg3cTdvZnVNSWNBRldVa05WMzYxUjJIQ0h2d0p6?=
 =?utf-8?B?TmRRWVVHd2dMV1BycXVPMHBWMzdXNlRBTEd2YzVZbUJCV0VLTlRuNEFVeUMw?=
 =?utf-8?Q?hal8WpmqKhI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEgvUWZRV2NaZ1NQSUxSVFBQODdod2V1cFU2anlIZVhPakpFNFZseEMvcWZr?=
 =?utf-8?B?MmtrUUFncDVUQmdDb0MwRloweDNtanQ3RGZUSjUrMnZjSmNEYVY0cXJFY2t3?=
 =?utf-8?B?WFMvelo4SWJSdlBFUWx5M0p1Z2RzWlhpeWg1WnMwUm5LV1hVeTdzckFGNkVE?=
 =?utf-8?B?QXBhK3VOOU9vdzlXcXNLUU02S05vNG1tcVpReFdOcnN1blNWNFVRdkF2NFVT?=
 =?utf-8?B?VXpraDYrNG1YeGw5eTNJTU5LTnhxYkhqRTdkbUo3dFdVYjBrZFJvVCtJak00?=
 =?utf-8?B?bXJJZmI3endvUXFQRjlXMlFRMU5MYUFoWkl3cS9kcVpQbWZzVUs1T3NUN3J5?=
 =?utf-8?B?ZjZCVlhKKy82b2d5Nmw4UHhwN3c0RlBHNmpwS1hUZ0g0aFJPcnRHVXNoSWpC?=
 =?utf-8?B?aTduM3lhRXJyYUhHTm1aUkJPOElYTWFMVDB6YzFSRm9WWDc5TEdDNEszcy9l?=
 =?utf-8?B?WTVURGxJN1NENDRjcmx2UUhTM1lUZWZuZmcvNFlBN0ZkMHlkMnphT2trbzhz?=
 =?utf-8?B?d0s0MHhnbFEySW56S0swMHE0KzNuSU4yTzBXN1l5dzN0SUxDSThhM1pkWk1V?=
 =?utf-8?B?UDBoOEYvNnlpOTVGdjNKZ0UyMUhXakV0czRGSkRROXRuWUtMR25IT1FxQk80?=
 =?utf-8?B?b0EvSitlQlljMzFaTGNFckdYeTF4Z3pIVXoxTFpFT3libEo3Y25yc09NM1BB?=
 =?utf-8?B?Y2pId3pSQ2FjVitDM3hiSVdLNnZwaXJ2LysrVUdsZ29xL2d0cnVYcVMxZi9I?=
 =?utf-8?B?Vmd2TzZ4c2xJMlBJUmdtTGxwRndOOGlKZXB3WFpKQ0w1bXp6TFBPSlAxN1Jv?=
 =?utf-8?B?M2g1SjdYNjdMMFB3WVVoS1hIaHJXUE0xZHBycGZyMnk2d1BhL2EvdFptdzZN?=
 =?utf-8?B?UXJxanNhQ0RuSUUzMm9VdERqME1qbzVQUGM3YmpWazVLSlo2ODE5VElMOVhM?=
 =?utf-8?B?NW9Id09RTks4MHdjWXN4dm44RTNGaVFXcU16bmNvSTJaQytmKzFWV1Jaa0JV?=
 =?utf-8?B?UTExUVJTb0h0eTNnOWxGOTVTSnh3eE9hdWM5RklwWUxTZWpDalhNMHZsTkow?=
 =?utf-8?B?Y1c2TWFrckxsMXdLb2UrLy9qb3lZc25wV2VjK0VWM2dRQUhyMHRndjR1L1FK?=
 =?utf-8?B?dERzYnVDOHpldlRsN2VQWGZQb2t1dCt1emRYbDA0V0VJVktuTnNiYmVwVlVz?=
 =?utf-8?B?bnA4czFyMmhOSEJqTmVMZXYwOU1ja05GUXBBQlI4TW1mRnAySG5wd28vUWdh?=
 =?utf-8?B?dWJiZ0tZNFovWUorRmtyQjhQcmJTSlEyZHNnRVdpQXFZVkdhdk5ReE8vaFZ2?=
 =?utf-8?B?V2JLemRxNDhpQUZHQmJONUNsUU9VeXZ6TGNkOGJ5VThRek5pdkhXbmhwZVM0?=
 =?utf-8?B?M291UEN1Lzlrejlqbm1PN1VzeVpwMFpvQ2tIM0tDczdzVGhKZFFsNmsvenJV?=
 =?utf-8?B?UkhTdEptQ3l6aVhvOS9rVHVSTGZlRXVFVmUwUE5TMjJSWjAzRUwxbnZpMjNC?=
 =?utf-8?B?UXl2SThkRHExVCt5bSs4ZlJRdEppTTBlM2I3RVRWVGszemozRWJPK0dvUm9w?=
 =?utf-8?B?L1ZjTDJZc0psWi92K2lqY0hxYkRtbFM3L0dSbmZuQnRLT0pjUzkwbkxqengw?=
 =?utf-8?B?dUs0SENVRCtCQjhONEpocFRlNC9pdjVocGVMSEhJYXkrUFdPOEhOQTJTN2dr?=
 =?utf-8?B?a29zN2VGZTVFOG5FZ2F3NTFNQXNyZzNDWGdGbmFOcmRHWlJROGU3QVNjUTR2?=
 =?utf-8?B?dENiWXo4c0liQ1g0UU5TeXFBNGtHWEZ4RWovK1dNZ01SNWNMLzcxK2lGSUZu?=
 =?utf-8?B?ZmlJcmdZYXlNQXFkNm1oZ2JRR1JIZEVBZHl4WG94QUtIVFN3dTlIUmdQRTFo?=
 =?utf-8?B?S0FsaHlnQjFIUzhQVjJMK3ZKanJMQXhTclo0eU1kVFpsWUdRVWJZS0lIaWUy?=
 =?utf-8?B?ZnVrN3lYdzhZT2dxWHVzZ1NRc1FVRkZ6cTBlaTJUNmN1V01ubTY2R1A0Y2xy?=
 =?utf-8?B?MmRlOE1UNnFKN1pnSEVYR05QVW9RdkVkVTdrckpSK3JWS0plQlV6Z1JXSFBa?=
 =?utf-8?B?VkRmVEFONlZ0YXdqckZ3QVlFbVB0S2JqNXVvQkxSbmwyWjF6OFhFUnJqemg0?=
 =?utf-8?B?QnFNOXBEZzFISTRuNDVYWkRnNStva2xyQ01OUmNDTGVGdlpMSXIvZ0cyUlhn?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3b236a-480f-4031-bcb3-08ddc4018103
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 00:41:30.0626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlcVE4T5lnQKfuCjKenRxmNnN/MEhiN9ncO7M3RTbEd4+iG9Xbwd3RZVbl8UiFlZZs1j3p3jJe4yjnPlwJqd4N/AYeb72vrZdjG81vB0hmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
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

--------------1ZFAPdrmqXQytonbhP4OuMGP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/2025 12:44 AM, Swati Sharma wrote:
> Added support for X, Yf, and 4 TILING modifiers to increase coverage
> of buffer format combinations.
s/Added/Add/
This you can change while merging.
>
> v2: -remove .c from subject (Kamil)
>
> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 296c93b58..7551a5e9c 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -28,15 +28,18 @@
>    * Driver requirement: i915, xe
>    * Mega feature: General Display Features
>    *
> - * SUBTEST: stress-xrgb8888-untiled
> + * SUBTEST: stress-xrgb8888-%s
>    * Description:
>    *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
> - *   and resolution.
> + *   and resolution and %arg[1] modifier.
>    *
> - * SUBTEST: stress-xrgb8888-ytiled
> - * Description:
> - *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
> - *   and resolution.
> + * arg[1]:
> + *
> + * @4tiled:            TILE-4 modifier
> + * @xtiled:            TILE-X modifier
> + * @ytiled:            TILE-Y modifier
> + * @yftiled:           TILE-YF modifier
> + * @untiled:           LINEAR modifier
>    */
>   
>   IGT_TEST_DESCRIPTION("Stress test how gpu and cpu behaves if maximum amount of planes, "
> @@ -59,10 +62,13 @@ static const uint32_t formats[N_FORMATS] = {
>   	DRM_FORMAT_XRGB8888,
>   };
>   
> -#define N_TILING_METHODS 2
> +#define N_TILING_METHODS 5
>   static const uint64_t tilings[N_TILING_METHODS] = {
>   	DRM_FORMAT_MOD_LINEAR,
> +	I915_FORMAT_MOD_X_TILED,
>   	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_Yf_TILED,
> +	I915_FORMAT_MOD_4_TILED,
>   };

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
>   static const char *format_str(int format_index)
> @@ -88,6 +94,10 @@ static const char *tiling_str(int tiling_index)
>   		return "xtiled";
>   	case I915_FORMAT_MOD_Y_TILED:
>   		return "ytiled";
> +	case I915_FORMAT_MOD_Yf_TILED:
> +		return "yftiled";
> +	case I915_FORMAT_MOD_4_TILED:
> +		return "4tiled";
>   	default:
>   		igt_assert(false);
>   	}
--------------1ZFAPdrmqXQytonbhP4OuMGP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/16/2025 12:44 AM, Swati Sharma
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250715191457.58097-1-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">Added support for X, Yf, and 4 TILING modifiers to increase coverage
of buffer format combinations.</pre>
    </blockquote>
    s/Added/Add/<br>
    This you can change while merging.
    <blockquote type="cite" cite="mid:20250715191457.58097-1-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">

v2: -remove .c from subject (Kamil)

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/intel/kms_pipe_stress.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 296c93b58..7551a5e9c 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -28,15 +28,18 @@
  * Driver requirement: i915, xe
  * Mega feature: General Display Features
  *
- * SUBTEST: stress-xrgb8888-untiled
+ * SUBTEST: stress-xrgb8888-%s
  * Description:
  *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
- *   and resolution.
+ *   and resolution and %arg[1] modifier.
  *
- * SUBTEST: stress-xrgb8888-ytiled
- * Description:
- *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
- *   and resolution.
+ * arg[1]:
+ *
+ * @4tiled:            TILE-4 modifier
+ * @xtiled:            TILE-X modifier
+ * @ytiled:            TILE-Y modifier
+ * @yftiled:           TILE-YF modifier
+ * @untiled:           LINEAR modifier
  */
 
 IGT_TEST_DESCRIPTION(&quot;Stress test how gpu and cpu behaves if maximum amount of planes, &quot;
@@ -59,10 +62,13 @@ static const uint32_t formats[N_FORMATS] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-#define N_TILING_METHODS 2
+#define N_TILING_METHODS 5
 static const uint64_t tilings[N_TILING_METHODS] = {
 	DRM_FORMAT_MOD_LINEAR,
+	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_Yf_TILED,
+	I915_FORMAT_MOD_4_TILED,
 };</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by:
        Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span>
    </p>
    <blockquote type="cite" cite="mid:20250715191457.58097-1-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 static const char *format_str(int format_index)
@@ -88,6 +94,10 @@ static const char *tiling_str(int tiling_index)
 		return &quot;xtiled&quot;;
 	case I915_FORMAT_MOD_Y_TILED:
 		return &quot;ytiled&quot;;
+	case I915_FORMAT_MOD_Yf_TILED:
+		return &quot;yftiled&quot;;
+	case I915_FORMAT_MOD_4_TILED:
+		return &quot;4tiled&quot;;
 	default:
 		igt_assert(false);
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------1ZFAPdrmqXQytonbhP4OuMGP--
