Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6908ED75E22
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 10:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2745510EB4C;
	Fri, 22 Nov 2024 10:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJe0fZ15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3C310EB4C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732272488; x=1763808488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LzP7U8xCkbsMT/18DFtKiRtqbnyjeXc6u/YYJ8K6vZE=;
 b=iJe0fZ15teV+fsnnHHmyKGUq9p4Q67ZCG8ODL2LZlUK8BgBcAmwOGHSL
 r2X1pHvaxttWXwUbsAhaBHpjoesnAVntDdwZ8+tS2Xl+WUe9ZBI+HT9Je
 Pzx85pfhaNTGeg+LeoaVLHlbWteo/mfLirNWjPuaZ3/iC6AAQLtKVnIiq
 s3dxmHgzMdaDdItMkTjjkPFrLCVIJULCU7/mNDgNsn+EWeCfjGnmW2sRK
 ETz6Ormg5XRDX1za9ZQUpkrdp51/T3aTDu33DQVQaIvI1AKFn7Ucb58vJ
 dDSyTwJnQlORIKdpPUMcPsDftRn1CrVUUtINufQwpr/9ji6/XJiXV3kZp g==;
X-CSE-ConnectionGUID: 9Kj0ujngRIeBesHCz3gQUg==
X-CSE-MsgGUID: oMBNZmdlTsma0ncy8iWM4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35282904"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="35282904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 02:48:07 -0800
X-CSE-ConnectionGUID: PRlVhKdiTcy+GwMdoKLKKA==
X-CSE-MsgGUID: BLzpkfsUR/ulAaqFlv1A5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90686558"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 02:48:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 02:48:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 02:48:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 02:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMebRzuqyNcAS1op08IvtGn0o/g/Wv/jgPky7xj2QMW+SC8Nr34OX9VKH5/jMKj8kNV1KHXUYSbvc8WIOH9FcLH+7O8ATrrfjRGJegxA2MyaWG3rkfLjCUrzxTzXhVWpfqYFWKk9asMzhbD2az8Ux/V9MJ57mXAnWTUozhv3cK9dk91YYCFpPGHNz05x4oZpPdipfb9XTD467eRurTY2NibozqFXANcdxMQblfahm3Nre98bdvxUgQ4r+1NRh0v+jBOdn4+kV38eFMcEbCJU40Q8dzsSng8CosftTqllZSekdVo//PmPFsuY/3pIgModIxnU9KCs13WMsMW43n5puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y82tTKozE1SNK/IxzxAh3+Y2OZ1CHPoeET68BGgG0nw=;
 b=cAT1EokQIFzTwTN11jk/YoijSHGUx3kyuHBTB/sEup1U5Wi3irJekj/r3AAJkJBLhdrBTAHJNm7ZnW464AMcoAz7RhJYcBAQ+9vSJG9zgSamx3LOGOQqPZt6x241BD5fKzq9SnHI7v8n2ZppRsovRJtHsw6Geo7r8hS7hzhkOiRu2fYto25eWHLMviQZgMoMUKgxwXNJMRu01EdO+qZqOR30IbkiCr49LDw+nrtjmvhcj9/zA15G/U5aOuPsDi61ggTQUzlx+N0NdoB/JQYWqFub9BBgxiNJa3HtYEtehz8mZMUzColbpgnzLFq9z25pX2Ez49wISGIucEEd5vUg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Fri, 22 Nov
 2024 10:47:59 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 10:47:59 +0000
Message-ID: <741fbc09-652b-4ab3-a6ba-699f9ab5b900@intel.com>
Date: Fri, 22 Nov 2024 11:47:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/gppgu_shader: Add write D32 to ppgtt
 virtual address
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <christoph.manszewski@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-2-gwan-gyeong.mun@intel.com>
 <119dcb83-dca7-446f-bd0b-d028c76f54c5@intel.com>
 <b4d29d9c-b828-46c6-abcc-313f6653cf16@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b4d29d9c-b828-46c6-abcc-313f6653cf16@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 263ecfb9-e6f7-4e5f-da68-08dd0ae3213f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXRTdnFVNC9mY0pVRSt1SlZManpzOUZxMDJjdDI4QUNyZEN1SFlPS3pYL0E4?=
 =?utf-8?B?WTFrcWtBalV0VjFxSk5WV1FWZ2R6c1NNbkxHWUNUWTdudG9LKzNWUkcxQ3JU?=
 =?utf-8?B?Tm1pM3VWdERRcVlaTlJkZDNKYy8ydm9UazFieEpaN05vZTBleE9QV05VU2ho?=
 =?utf-8?B?RlRWRnJKYndFemhDS1d1OUtQV000c0pkZ05RbVFtbXlzV1pROEhGN0NUNG9T?=
 =?utf-8?B?Zm5OV3g5VGVkenJLSEt3Qk9tUmE2OTlrV2Q0cG1DaUZIT0cxTUtWTHBxdXJ6?=
 =?utf-8?B?YUYyTXV4cHdUV1E0bzVZVWdqLzBTY2QzRUNMa2c0Q1VmanBDdnJsRFpyU2Zh?=
 =?utf-8?B?aFFFWGMyQVdBQyt3WVQzdVVocFYyeFFWckNwdzJ3S3VtOWVRaEN4dFY1d0lY?=
 =?utf-8?B?c1RnTmZDT3hBZFl4RGMvc3dzSURHQXQwTjQwMDdPeGhGUWRFbEJtbWY3dWxu?=
 =?utf-8?B?WER2b3YyeWdTb1RzcnovT09TOFlkVTdrYmZ3Q29yelUxS0pzYkpkaHgvc2ZF?=
 =?utf-8?B?NlNmQ1A0bUo2UzhoVUx3cnkyV1N0SVN6eEVBWHluMUlRekVWSTJKYjVUUTB3?=
 =?utf-8?B?RGUwL0srTXRzVjVJNXFCS1ZRZmt1dy80cVFTR3kzMmdMOCtPZW5ueS8yOEho?=
 =?utf-8?B?WU5yS0szVVRXRmFKb2lBa2ZkdlVCakl4Z2RLKzVSUHJ0MkNmMDdWT3pFVkNu?=
 =?utf-8?B?cEJ6TlVtQ3ZWQXdVaDN5S0xuUG80dTc4ME50cms4eTVWVCtKaVNVK3Z0empD?=
 =?utf-8?B?T3E3cWZFY3l3eG41NDdqYjlnRjNsUFViL2NHNnJGdmdnQ2tVR3laZ0hxREZa?=
 =?utf-8?B?VkNQQnppU2d6UzdYY1AvOXEvODd2YU84Z1FpM0lTWjRTa3E1MStra0x4Q2VT?=
 =?utf-8?B?d09jOTNKejZINjV1SysrSFViayszbEx3dVhXdjVlRC9VekwrZXFlR2htRmNt?=
 =?utf-8?B?Q3dJWCs3dFkza0hCR2xidHgzTHBXL1FiOVcvNXNtSSs1ZDgzVS9xQmVLYlBL?=
 =?utf-8?B?MElKNFUyemdHcjlUelE2ZWEyWDlBM0JUU3lEQnVJeDFKMGsxelVzTG5scm94?=
 =?utf-8?B?WjhFOVZEdFFFY3VOUTVHbmloVHhROEtVSnVmOEduQWxnY0pxTm1mYytpdG0y?=
 =?utf-8?B?ZkRRUEN2SVFGcHhrMzJ3Wjg0OXhGYjB1RjNReVBaZHBOTkUya2o0VmNuLzRU?=
 =?utf-8?B?Wk9YNUYrLzY4elExcjNQWWthOStQMmJ5aVExdEY1Y1VIUGszSVpINE1ic1p3?=
 =?utf-8?B?OHY2WC9DYVlaT0tTK1R6dWRqMDY1cEVjdHFsSUlUUGlrWHhmY25NTDlEUFo3?=
 =?utf-8?B?UHp5K2d1NmZ6UC9wN2N6SGZVQ0IzUXRaakVuNEdyUGNPbm9FSDRsMS9wS2dy?=
 =?utf-8?B?a05ZZmZCZFJJSlh3dVJ2N0laTTB1SEtBZXRwdlBHVU93bFRaOXJrZEJOMzQ5?=
 =?utf-8?B?QlpSTmsrK2x4R1Nsck8rTE9WbkxnaDdsS2M1WDBlSHE4L0FFTkxyZWMwQytp?=
 =?utf-8?B?WTNtdTJEOEZDWGlyTWFCRjY2aEZxQVFmLytoSTlYd0tUTzVkNUsyTDVmTFVx?=
 =?utf-8?B?dmZMMmtmUFIxc09wRXZxWUZKTkVoY1R1U2VpNnpCU1J3RGpQVDRaaHhWWDA3?=
 =?utf-8?B?QmtRWnRML09xcGZPZS9Qd1BTaGtXblNZZUVJUTltOVNQN3hDWGRIRGZZbmc3?=
 =?utf-8?B?ZFVuUlZVN0VuNDVtTVU4Zk5IK0hTRG4ydGVFd0hmWUpPeDI0ZnBmMzUyb1Zt?=
 =?utf-8?Q?hdrtod2lCNmAevM0oVhV96dHpZ8cUZ9jOF2kc2L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1ZzbjgwYVJPWUlhY0Y0SW41SHlVOXQ4cURwZm1BY3V2UWpMd1YwZTdLTVNt?=
 =?utf-8?B?Z083Ri9ncS9STm12WExvZjkxNjJNRVJ0Q0srQ3p5K1RXOHFjeUtrN29vbVBz?=
 =?utf-8?B?aUExUnpxeHl5b1R4TG93K3NNYVNoU0Ruem9za3gzQy82Z0pJTzkyeTB4K28w?=
 =?utf-8?B?OUlKakJROUQ2dWo0ejFRYk1HQXZONTlHL2dkK3dEcHBjSWVEaUd6dllhMVZQ?=
 =?utf-8?B?QW1CM1hLQnpybW5pUjh0eVZhbUJlenVLbzR1RFIvQUl5T2FiMXBOS1kzejB5?=
 =?utf-8?B?RzV0TkdGbkJtYk5DdzBxVTRRemU3Wkt3RWNSQ3BYdzRmWUp4blVuSmtoR3c3?=
 =?utf-8?B?SHlXdzdEbU5NcWFaZ290M1lNdS91TlU1WnJMV1VVTGpaRTNFMzZ5MkloV2FW?=
 =?utf-8?B?UFJTMjA4UWZoSk5lK0tWenF2SlVTNDJzZmFobHo4M3pmZTVJWmJFRGl0amk2?=
 =?utf-8?B?NjBwM3lKK1NYYlQ1bkFxNVladFdkWmphNm12S3A0K3B4RGN4NDJHdCsxQUdw?=
 =?utf-8?B?K3QzQUdlaVlWSXZvZ2JndDljUDMzRm1nUnZLT1FRRzdyOWh1K1l6aTUvbDR0?=
 =?utf-8?B?ZGh6Tkp6L25vSXNhMlNEK3FteGxqK1FrMCtuWVdYZGE4azN3RDR1dlF3dDVL?=
 =?utf-8?B?VkIvTWRyY2ZieUY1RHdPYnV2SkJXN0ZaaTVabFk4T2g2L0NtZHJ1MVFBYTJt?=
 =?utf-8?B?RFFocktQUEh2aVo3bnBScW1Jdy9JcmN0YWNuRFZKenp5R0kzNmRucW5RTVY0?=
 =?utf-8?B?MWdPZ3BCUGhVeENFT2dSM2hrdGxxRTduK0U3R0FXOFJQY0s2UnpEbHh5bUVV?=
 =?utf-8?B?TE5ENkpJa2tsdEsrOUFHNVpySmV3elhXSXlFaGVXUjNWN0luRi9NRTFjNlg2?=
 =?utf-8?B?eUd5aEFwLy94Umt6ckkzSnM5RlFEWlVzNHdsYnZZbms4ZFNlWTk1ZEo0bzRu?=
 =?utf-8?B?bU9Pa3NzUjlId1cxNEs1Tk41dno2a2Q4bUtxS0JFMnpYSC9YMUdoUCtkNVZn?=
 =?utf-8?B?YmJ3eGFQWmVZQmpmMU1DbjVOSTVMNzhiNHAyM1lPWE1za0VYdFhaZGovRHdt?=
 =?utf-8?B?c0krZWNDaGwzelZ4UDZyKzRsL2NLaWhiSGZWSTVuaWZRekhIUUFlMW01NVlj?=
 =?utf-8?B?K0tWYXlLM3hwY0pBQVByeHNBZHZaR0hheW1yUDd4ZElvamxueXJqeUZ0aEI5?=
 =?utf-8?B?MmhqaU1Nb09MSDV6SUcwNUtHRWhwQWVGMzM2WktLTGkwd05VYzhPcGFsUklw?=
 =?utf-8?B?ZnhkQUo5elNVdmdibWZFVlptVk13aXpJcnVaMGMrdGd5VmZqQ2ZHOGF4aElw?=
 =?utf-8?B?WUpzaU16MFRMUDdUL2VOcWhmb0tseENkem01L1JsYjhMNDRObnRTTDZFYWFI?=
 =?utf-8?B?S3hjVkxqN0R1Wk16eHdFS3prOEduWFF0NUs4RTFjYUJ1TUVKMVlNN1JaOFk1?=
 =?utf-8?B?T2grVjNHTHBZS0RHUXZyeFprQzhOY1RzZmVYd3VaRVJ2OGhTV3I4YWZsK0tv?=
 =?utf-8?B?Ukc0L1JRc0lMc0wvbDZHU2c3WTJ1SGc4WUF1dENRd0pFYkt1dk5GMk0yRGRG?=
 =?utf-8?B?NWpZU3hYVlRCSlpzWFJvMDZHc1pqNC9iZmMvTVJYSGFIK1dXa3N4cGdJWS94?=
 =?utf-8?B?TzRLVHFmZ1BIUUFGN1pNZDNjY2NDUlRSQ1Z0Mjh1SDFVbXJlN3dibmNGQ0Zo?=
 =?utf-8?B?ZU9UVmI2OFVnNW0ydlFpb0ZXTHJYUTlSaEt6bHBMb0ZHbFNNOVl0KzFOSUhw?=
 =?utf-8?B?U1lhTWI2MzE0RFZ0U0lzbUhQQno1Nmc2Yk9Hb1l1RUphemt6SGZRSGpsaG05?=
 =?utf-8?B?VXBrQW1xS2tJRm5wMHcrWnpwSnJLcVlSdTZBVytUNExrK3dhQkUwOTNJYlpz?=
 =?utf-8?B?U2F0OXdCaWRwNW1WZ2g3YWRCOFRyQ1BackJGK1N3dVVmbFVDY2FtSU9pek1Q?=
 =?utf-8?B?S1dMSHAyYXlCazZycmk2QWpTN3VtVDJ1L0Iyd2crU2pONmRvd3VUcTg1RXQ4?=
 =?utf-8?B?VklGd1FUbnN5dmRpWno4cFdwc0RJdUlyNzVoVTZJTEx6MWhSR0dRbHRUekgx?=
 =?utf-8?B?QlpNZGVJQ20wUzRPQUk0STdMd3BZNjR6dmpSeW40ZUJkZG1WR3ExYTQyYjVR?=
 =?utf-8?B?RVl1ZU0wMlFYajlKcnlXVkFnNGlIMkJhQVd5MGZGeEVGVm5nVWNkYlpLc212?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 263ecfb9-e6f7-4e5f-da68-08dd0ae3213f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:47:59.1058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7ooYnBAV5unF7IyCmOTwqO273zc5sJZkBHOnWJespJQg5i3srC9BAVNVco957xo3exL3ccV0DIqAwq32UUf9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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


W dniu 22.11.2024 o 08:51, Gwan-gyeong Mun pisze:
>
>
> On 11/21/24 6:08 PM, Hajda, Andrzej wrote:
>>
>> W dniu 21.11.2024 o 13:22, Gwan-gyeong Mun pisze:
>>> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>
>>> Create a function that adds the capabilty to write an dword size at 
>>> a given
>>> ppgtt address with a dword value. Use an Untyped 2D Block Array Store
>>> DataPort functionality of XE2+ with A64 flat addressing to direct 
>>> accessing
>>> an entire ppgtt address space.
>>>
>>> For the write to succeed, the given ppgtt virtual address has to be 
>>> bound.
>>> Otherwise a store page fault will be triggered.
>>>
>>> v2: Fix the function name to be more clear. (Andrzej)
>>>      Use lower_32_bits() / upper_32_bits() macro (Andrzej)
>>>      Drop unused code
>>>
>>> Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> ---
>>>   lib/gpgpu_shader.c          | 94 
>>> +++++++++++++++++++++++++++++++++++++
>>>   lib/gpgpu_shader.h          |  2 +
>>>   lib/iga64_generated_codes.c | 23 ++++++++-
>>>   3 files changed, 118 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>>> index 4e1b8d5e9..d9da35895 100644
>>> --- a/lib/gpgpu_shader.c
>>> +++ b/lib/gpgpu_shader.c
>>> @@ -803,3 +803,97 @@ void 
>>> gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>>>       ", 0x807fffff, /* leave breakpoint exception */
>>>       y_offset, value, 0x7fffff /* clear all exceptions */ );
>>>   }
>>> +
>>> +/**
>>> + * gpgpu_shader__write_a64_dword:
>>> + * @shdr: shader to be modified
>>> + * @ppgtt_addr: write target ppgtt virtual address
>>> + * @value: dword to be written
>>> + *
>>> + * Write one D32 data (DW; DoubleWord) directly to the target ppgtt 
>>> virtual
>>> + * address (A64 Flat Address model).
>>> + *
>>> + * Note: for the write to succeed, the address specified by 
>>> @ppgtt_addr has
>>> + * to be bound. Otherwise a store page fault will be triggered.
>>> + */
>>> +void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, 
>>> uint64_t ppgtt_addr,
>>> +                   uint32_t value)
>>
>>
>> Nice name, could be even gpgpu_shader__write_a64_d32, to follow spec 
>> convention.
>>
> Ok, will update.
>>
>>> +{
>>> +    uint64_t addr = CANONICAL(ppgtt_addr);
>>> +    igt_assert_f((addr & 0x3) == 0, "address must be aligned to 
>>> DWord!\n");
>>> +
>>> +    emit_iga64_code(shdr, write_a64_dword, " \n\
>>> +#if GEN_VER >= 2000                                \n\
>>> +// Unyped 2D Block Store                            \n\
>>> +// Instruction_Store2DBlock                            \n\
>>> +// bspec: 63981                                    \n\
>>> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies 
>>> both        \n\
>>> +//    the block parameters and the 2D Surface 
>>> parameters.            \n\
>>> +// src1 data payload format is selected by Data 
>>> Size.                \n\
>>> +// Untyped2DBLOCKAddressPayload \n\
>>> +// bspec: 63986                                    \n\
>>> +// [243:240] Array Length: 0 (length is 1) \n\
>>> +// [239:232] Block Height: 0 (height is 1) \n\
>>> +// [231:224] Block Width: 0xf (width is 16)                    \n\
>>> +// [223:192] Block Start Y: 0                            \n\
>>> +// [191:160] Block Start X: 0                            \n\
>>> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 
>>> bytes)            \n\
>>> +// [127:96] Untyped 2D Surface Height: 0 (height is 
>>> 1)                \n\
>>> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 
>>> bytes)            \n\
>>> +// [63:0] Untyped 2D Surface Base Address \n\
>>> +// initialize register                                \n\
>>> +(W)    mov (8)            r30.0<1>:uq 0x0:uq                \n\
>>> +// [0:31] Untyped 2D Surface Base Address low                    \n\
>>> +(W)    mov (1)            r30.0<1>:ud ARG(0):ud            \n\
>>> +// [32:63] Untyped 2D Surface Base Address high                    \n\
>>> +(W)    mov (1)            r30.1<1>:ud ARG(1):ud                \n\
>>> +// [95:64] Untyped 2D Surface Width: 0x3f \n\
>>> +//       (Width minus 1 (in bytes) of the 2D surface, it represents 
>>> 64)    \n\
>>> +(W)    mov (1)         r30.2<1>:ud 0x3f:ud                \n\
>>> +// [127:96] Untyped 2D Surface Height: 0x0 \n\
>>> +//        (Height minus 1 (in number of data elements) 
>>> of            \n\
>>> +//        the Untyped 2D surface, it represents 1)                \n\
>>> +(W)    mov (1)         r30.3<1>:ud 0x0:ud                \n\
>>> +// [159:128] Untyped 2D Surface Pitch: 0x3f                    \n\
>>> +//         (Pitch minus 1 (in bytes) of the 2D surface, it 
>>> represents 64)    \n\
>>> +(W)    mov (1)            r30.4<1>:ud 0x3f:ud                \n\
>>> +// [231:224] Block Width: 0xf (15)                        \n\
>>> +//         (Specifies the width minus 1 (in number of data 
>>> elements) for this    \n\
>>> +//         rectangular region, it represents 16)                \n\
>>> +// Block width (encoded_value + 1) must be a multiple of DW (4 
>>> bytes).        \n\
>>> +// [239:232] Block Height: 0                            \n\
>>> +//         (Specifies the height minus 1 (in number of data 
>>> elements) for    \n\
>>> +//         this rectangular region, it represents 1)                
>>> \n\
>>> +// [243:240] Array Length: 0                            \n\
>>> +//         (Specifies Array Length minus 1 for Load2DBlockArray 
>>> messages,    \n\
>>> +//         must be zero for 2D Block Store messages, it represents 
>>> 1)        \n\
>>> +(W)    mov (1)            r30.7<1>:ud 0xf:ud                \n\
>>
>>
>> Shouldn't this be 0x3:ud now, for dword ?
>>
> No, r30.7 needs to set 0xf:ud.


0xf mean block width is 16 bytes, it means 4 dwords, in the description 
you says one d32,

to source register r31 you enter also d32, and zeroes the rest.

So what is going here? Writing one dword, or 4dwords (one provided, and 
the rest 0) ?


Regards

Andrzej


>
> please refer the Structure_Untyped2DBLOCKAddressPayload: bspec 63986
>
> [31:0]    => r30.0:ud  <= [0:31] Untyped 2D Surface Base Address low
> [63:32]   => r30.1:ud  <= [32:63] Untyped 2D Surface Base Address high
> [95:64]   => r30.2:ud  <= [95:64] Untyped 2D Surface Width: 0x3f
> [127:96]  => r30.3:ud  <= [127:96] Untyped 2D Surface Height: 0
> [159:128] => r30.4:ud  <= [159:128] Untyped 2D Surface Pitch: 0x3f
> [191:160] => r30.5:ud  <= [191:160] Block Start X: 0
> [223:192] => r30.6:ud  <= [223:192] Block Start Y: 0
> [251:224] => r30.7:ud  <= [231:224] Block Width: 0xf
>                           [239:232] Block Height: 0
>                           [243:240] Array Length: 0
>                           ; 0xf
>
> br,
>
> G.G.
>> Beside those details:
>>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> Regards
>> Andrzej
>>
>>> +// src1 data payload size                            \n\
>>> +// Block Height x Block Width x Data size / GRF Register 
>>> size            \n\
>>> +//    => 1 x 16 x 32bit / 512bit = 1                        \n\
>>> +// data payload size is 1                            \n\
>>> +(W)    mov (8)            r31.0<1>:uq 0x0:uq                \n\
>>> +(W)    mov (1|M0)        r31.0<1>:ud ARG(2):ud            \n\
>>> +// send.ugm Untyped 2D Block Array Store \n\
>>> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc                
>>> \n\
>>> +// Execution Mask restriction: SIMT1 \n\
>>> +//                                        \n\
>>> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D 
>>> Block)    \n\
>>> +// bspec: 67780                                    \n\
>>> +// 0x0 =>                                    \n\
>>> +// [32:22] Global Y_offset: 0                            \n\
>>> +// [21:12] Global X_offset: 0                            \n\
>>> +//                                        \n\
>>> +// Message Descriptor                                \n\
>>> +// bspec: 63981                                    \n\
>>> +// 0x2020407 =>                                    \n\
>>> +// [30:29] Address Type: 0 (FLAT)                        \n\
>>> +// [28:25] Src0 Length: 1                            \n\
>>> +// [24:20] Dest Length: 0                            \n\
>>> +// [19:16] Cache : 2 (L1UC_L3UC)                        \n\
>>> +// [11:9] Data Size: 2 (D32)                            \n\
>>> +// [5:0] Store Operation: 7                            \n\
>>> +(W)    send.ugm (1)        null    r30    r31:1    0x0 0x2020407    
>>> \n\
>>> +#endif                                        \n\
>>> +    ", lower_32_bits(addr), upper_32_bits(addr), value);
>>> +}
>>> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
>>> index c7c21c115..18a4c9725 100644
>>> --- a/lib/gpgpu_shader.h
>>> +++ b/lib/gpgpu_shader.h
>>> @@ -85,6 +85,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader 
>>> *shdr, uint32_t value,
>>>                      uint32_t y_offset);
>>>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, 
>>> uint32_t dw, uint32_t x_offset,
>>>                         uint32_t y_offset, uint32_t mask, uint32_t 
>>> value);
>>> +void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, 
>>> uint64_t ppgtt_addr,
>>> +                   uint32_t value);
>>>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>>>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>>>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>>> index 6638be07b..e97bcf042 100644
>>> --- a/lib/iga64_generated_codes.c
>>> +++ b/lib/iga64_generated_codes.c
>>> @@ -3,7 +3,7 @@
>>>   #include "gpgpu_shader.h"
>>> -#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
>>> +#define MD5_SUM_IGA64_ASMS a1ee0173014ab4cda3090faeca1cbae1
>>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>>> @@ -79,6 +79,27 @@ struct iga64_template const 
>>> iga64_code_gpgpu_fill[] = {
>>>       }}
>>>   };
>>> +struct iga64_template const iga64_code_write_a64_dword[] = {
>>> +    { .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>>> +        0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>>> +        0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>>> +        0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
>>> +        0x80000061, 0x1e354220, 0x00000000, 0x00000000,
>>> +        0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
>>> +        0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>>> +        0x800c0061, 0x1f054330, 0x00000000, 0x00000000,
>>> +        0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
>>> +        0x80032031, 0x00000000, 0xf80e1e0c, 0x00801f0c,
>>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>> +    }},
>>> +    { .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
>>> +
>>> +    }}
>>> +};
>>> +
>>>   struct iga64_template const 
>>> iga64_code_end_system_routine_step_if_eq[] = {
>>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>>>           0x80000966, 0x80018220, 0x02008000, 0x00008000,
>
