Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A398AD72367
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 10:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528CD10EAA3;
	Fri, 23 Jan 2026 10:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMIzr5nu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20E210EAA3
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769164462; x=1800700462;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dBXUjm6CW6u+U2Rnl0xOmSNSu1dZD6tWMup28G/TOwQ=;
 b=CMIzr5nu190BtO0k/qsPLxdXKQvNGqXRHHe7V/pKQBAUmc8rBHe6aFx2
 3qca5MtIwP8rSvqFRyVKefXvwm0gifXEFipK+mToDzf1jKV+wWyb+Qrik
 XurVDTmFXsrrVxjjP7bhn+jytUAYfROsdl6wosU1DfZ6wOi/HRaIOud6r
 uGNQjDdhLG35R5vRBvApqvIxJVLBugOSVUlOEO3JiyA3HBsPxUd61rEJE
 qv2xPn6O770AXJ8gM8br2FDnq+hrYTC6s6/D9NY6rt/zKCTEbtUeNy28B
 hOJAdxtlt3Pr3LkAzdjnvaqXciVBq1liw27Nh3W5z55Fcu5TGp+xSr9f3 Q==;
X-CSE-ConnectionGUID: bhSq3EcfSh6w8mbvceMwkQ==
X-CSE-MsgGUID: W5EFWbSkT/GDU6FUyDiyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87835613"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="87835613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 02:34:22 -0800
X-CSE-ConnectionGUID: 1hbxYVJrR0GcJve6Uf8pwQ==
X-CSE-MsgGUID: hwk7kBJQT8+5V0KSBBxZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211997536"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 02:34:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 02:34:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 02:34:20 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 02:34:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHY1k/Ae1g/WhudxEs+Nm43fP78tTqdORI6YBRtQh6fMSpyhMEV7Je9M3M3aZvgK4bPyYQ4Q2LtPFXVtzP3RCvJ8Dd+QjLSeSh/StHxNmzwYU1sEyIoGTrSKY/K5nq2vzQl/PlriucNcmKK2dy2j75ZFDs7QZGkeIH138JtTdHgchHlEUj8XuR/wJkQOT+NW1u3TRKW2lC98tkD9FLmV7OyfborN6OyPoC16RX4+MSQirdMlBdwE+y1dppS04yWEqT/0c9rizklxia2npyR2yTPNvsTaUF8tH2QFN6EgYz/eGtCGxVI9De3Fm508aXSkgge6CiX8d7XMfI9x+BQN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxZXm3IcE4mA79owCY0rDN41KrSCIZI4xQmWsfHUem4=;
 b=nkyeIeVWQDMj3wBWLTzoAhBrMK682OdVU0j3KowCdDoKqC9WVs3DVqT5DjR5EImYNipwaAvgHQBh4hI7XxvQf1w7AwxAYMwvd6wBCHeO/liCqhKBP7YQWciN5Syiebsb24poAAWZAbDnyN+Bb0rlRpA25SbaJK0pw66hNt54Edf7p9whvigabsg+D2KmG8JJL+KCw0r4he8gEf8vtUdgsuj0z5tcX4Fb7QNLcZOl6EPN3XsJIq/TZA7/idctzQO0+hBga73BKwxJ584WJ5iPvG7PBwXw6nHpOdeSkjdjqF666S6VZ6J+f9q5EYPcGKM8bhVEvdN+R6WeiQmGA6ojcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:34:18 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:34:18 +0000
Message-ID: <3e0d1442-6464-4c7b-a275-2b18d8328775@intel.com>
Date: Fri, 23 Jan 2026 16:04:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>
References: <20260121145747.1378494-1-karthik.poosa@intel.com>
 <20260121145747.1378494-3-karthik.poosa@intel.com>
 <20260122150007.r4btixs6doti3n2z@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260122150007.r4btixs6doti3n2z@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA1PR11MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4cb401-dbd0-4327-9285-08de5a6af66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M01iVXJ5bzhrQTZia3JyZm54MDlMK3B1aHJyUGRiU3FpdFdwc3EwQ0orcHZJ?=
 =?utf-8?B?WHYrMTBadHdpZUdGYUlaZFZSMWZnMXBmU2xZTE9rcmVKY3B1TjRRMktXRlF3?=
 =?utf-8?B?S0xZanZBYUFKaDBRWWVxaUlvYk1DTlBGd0c3anIxdFQzRzl0VjI1QjB3cU1M?=
 =?utf-8?B?ZUNjR2MxaVNIcEtCM2tzSGx0UUxTbldUOFJwK09leCtTZGo2L0h5VysvbmtF?=
 =?utf-8?B?TGxUQTI0elJVZ3Q3MUQ0YU5PaXRzN0VydVpNaEdXVzloZGt1eVNQNFdiS1dO?=
 =?utf-8?B?V2JqTFZLOWhyTXpQV2FLcVl0VE85czFORmNmeEtSZVViK3VKaHE0WHduTFJF?=
 =?utf-8?B?K1owRXUzWHR4RTYwNXhVU0g1dzA4ZndkTTY5czkybjhoWWZMZXQ5OUV2OUk5?=
 =?utf-8?B?MXZtem9ZTVByYUdlalQ4bGRDWVVMZmhNOVlmTy9sbnR6TFZ5WDgzNkM4Z3pN?=
 =?utf-8?B?Y3FYZ2JWRUROUmRacVVFRDFuWTBueHBFV2Q1aDk4by9CRmkwWjAva3RadG5P?=
 =?utf-8?B?UEcwMVZUVVB3Z3M0dkFJOExLT0FlaXRpTkp1b2E1ZlR6YTNRVE1vdmFycml4?=
 =?utf-8?B?MXY3SC8renY4RytLSzZQb2szMnJEdW1TOVNHSUg4enpBKy8vWEZhRVV0MUpo?=
 =?utf-8?B?b2ZmTFZ3MjlrMjB5ZVFQSmgzN3FVVWlSdkVrU0xpQnIrYU05M21XdlNMRFZh?=
 =?utf-8?B?Vlh2UkRibm81QmVUVWF1c2ozZVgxOTdNd2R4UGE0QkJuSlExbHl1VEN2TktT?=
 =?utf-8?B?UE9sN3ZXYkxLTmFxRjBYQTFGaWtLTkp2MEl1S2RHUzcwcTYwdk5MN0FZcFJo?=
 =?utf-8?B?REtMSDNEMmJFS3lKZnRjWmkzSSt3SmY4U3U0dHl5M0JOeEtOaGhtdVVlZDM0?=
 =?utf-8?B?ZWluazBrMjhUNC83aUNnNU44eTNuZFJpaGwxRHhpdUVIZVQrSGlXeEwzNjZy?=
 =?utf-8?B?N0ZlYW0zOTBCc3htQmZqQnNFckhiUTNDQkVOT1BBUjVBTHdkcUcvUzE0b2dD?=
 =?utf-8?B?RVcwSTh4djVFQnh3d2ttalN3bHhrUWVJcFVMbEN3NXhKVlY1bzlLTFFFNzcr?=
 =?utf-8?B?cVV4WTRJMzE1bHRNYjNaZUNNdFNmTEJmaS84U1E0bUtOanZHd0pON092QVdW?=
 =?utf-8?B?OG55T1NuUzhyYmg0K1hJcnp3UGlaQmIxLzl0MG9yOEJ5eEIybkdlZW9Fd2o5?=
 =?utf-8?B?eFlVTFBnaXdpd3dhcmhqQnJON1pqejloR1doc0VzdW1sZnEwQWRQdWRvc1BD?=
 =?utf-8?B?NkVSTzg5bFlmUHJFZFh5ZmxyNzJYbnNYdXNkUE5sSWJLUFM1MUpkeXR0VTFj?=
 =?utf-8?B?bklzQS9Galh6Tlo0UEdNYVltdnFRbDRZaG4yTlgwcCsxdi9xRjdsajljZWkw?=
 =?utf-8?B?TXpCWGRYN2pOZnE5ZXB0MEdLdlJnaHM2QzhVSTF4SGx1ZFNheGdOc2FSTVov?=
 =?utf-8?B?ZkRBaHI4U282UUlXaFhodDlVT2o4K2tBTmlLT2t6R2RsS29HM3d2RjRXVzlL?=
 =?utf-8?B?QlF2NHVwYy8xRGtIbndIRkpJbEZKVGRnSHZIbFp3ajFCRTlDR1NHMml2c2dQ?=
 =?utf-8?B?OUYvc0x6YU92SExkTGYyMXU0ZGlRUHBuTUFuMU9UZmlLVnVwNlB5MVdwazBC?=
 =?utf-8?B?ek4rNzJhK09tSGw3T2pMNTJRNC8zRnBKcmR0czVOSzNmMi96ZTRrREx2MFY5?=
 =?utf-8?B?YXRRS2JwNWVwTDJRaGc0SVc1SUdQS1dHV3VSV3Y2QklvZTMrTVV6dkZRZFNE?=
 =?utf-8?B?ZlhoS0ljTnJ0aWJtbjBDZ1Zqek4wS0U4Um1zRkJwQmNZSk9SQXBPNlJqTDRt?=
 =?utf-8?B?QVFHYUZlYUJsVDFlb3N4WjIzaTBEcTVaVi9zaDdRWGNFWWNXOXoxY3VxUSty?=
 =?utf-8?B?aFVieGcxbE1FcElLUURqdk9DYWdRZEN5eU1GbGxjYklyQnVPcmNnVXVGREQz?=
 =?utf-8?B?QzV5Ny9pZDZxbEdTbE1tUTZzMkhuaDc4blBVRDJhakxFVldMM0QwRmVBYzhk?=
 =?utf-8?B?a2RHaXYvbHZiKzIwMWs3Ti9hVkN1eTY4d0lkTjlmRnpFYVJlTjlURm42MU4x?=
 =?utf-8?B?dis4ek56anRYQUVhQTliT2MvZGpkckw5a0x0U1R3d21IWVZmMzFRNFVWNXpM?=
 =?utf-8?Q?q37s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1o1NFVveDYxcFgwYkErbVhJUVNDVDBMQk0vUDAxd1ZPNkVSelBUdkJrNnV6?=
 =?utf-8?B?Q2JyOE5ERlZEVDdEWW03M3h5aUNVVUxoQkhNSEQzVWV3RldtaFB1R3M5bG9h?=
 =?utf-8?B?dkRWY0NZTlBCalVDSkNmZnRYNXppTWQrZUpFUUc4cktDZmVaTStyN0ZwdHRm?=
 =?utf-8?B?ZzR6eWxGUkpZMGNwa3RhL3o5cGc1cWFxRWsxM2FzWEFzc2M3OE94SWhocEp5?=
 =?utf-8?B?THBKZHU2Y3paY0R5YytQQTR5YkR0ZnZrRWdYdmtWVDRneVR1ZlZiUGkvZFlt?=
 =?utf-8?B?MWpjblo3eHdsWk1nWUU2UGRONGxtTUtEczN2RndXemtGWFl6ME9iazB1NXNN?=
 =?utf-8?B?Z3lWeWV6M0VOaCtEZ2o4WUxMQnFkb2QydFFtNTNkYmVwdnJxVWQxVE5XdUIx?=
 =?utf-8?B?aWVKdWNNTUZlK2sxWmV4WFFaLzliZkhNb0ZjZCt0T2g2NmlkeXpsWjg4T3lM?=
 =?utf-8?B?NFhneGEzdXRaR3g5bytPVlJtb1I4cWhXekhPbnJ2N01SS056dXZPWVRWMUt5?=
 =?utf-8?B?ODAybFFmYXZBUVdaa2NOMFliVFU1OUUzMUdDMjZXdHl2RTFrWEpDb3ZjTHNM?=
 =?utf-8?B?WEdOL0tzK1ppZm44MTFhRkQ3cjlnY3lrc0Z2RWU3eUhFVURLRVNPcGF1V0Ux?=
 =?utf-8?B?ekJJRkdoMHAxNVpiQldvVnNuRDVTbWdyVFpPeGlIZC9uOHZKcEhhb3pvZWZu?=
 =?utf-8?B?Ylk3WmhUREY0a0p4TWI2ODVNNzh2Y0I1Z3NFT29hMTlneXhKV2x4cWszSXZW?=
 =?utf-8?B?NmFBWjhCZXk3YkdDTG9ZY0pSUmdSdTltWUJpWUJ4TUNlbnBnZVBzWEo2a3d1?=
 =?utf-8?B?KzVjOHBHVzQwanY4UlJIdjdKakpRMTZOcDBLNHFVaTFvRDFVT3RrQ3VZWmV1?=
 =?utf-8?B?SitiY0ZGY3R0L3JnZkhXc2lPZVJjci82RGt1T21qeTNXdDBqMXd3MGpKdTln?=
 =?utf-8?B?STJpeFd1RDVyeGQ5cWZ0R0ZRV0Q0cm5JR0hzbjlWaHJ4a1hSYnlxN1JCWjdt?=
 =?utf-8?B?bVVPaFVZamd5SUMvcVFHVnBBSEE4bzU3bitGZlcxMkNxMG5zMzk4cWFMMjVN?=
 =?utf-8?B?QjQrVW16MjdLMWtmam81eVZHS2FJMCtSakhyS3VHVWZqSm90L1BTU0dWVmZM?=
 =?utf-8?B?OE40dTNzM0pIbnlEanVOWCs0TCt4ekN0OXJ0VXVHbW5xRVNwcjJjYW1FRGsv?=
 =?utf-8?B?RnJLVG9kUlBBOUxOaFUxU3lyT284djMyQ0Z2akF3Y1dPeHpPUUNTekhnK09k?=
 =?utf-8?B?eU12MmU5QytWSCtZc2RpNmMrYzJURUhhdmpQei9Gdy9mMmxnYWdjUzNBY0h1?=
 =?utf-8?B?WjZDMFVVTXNUdHJsdW1ic1lpUUVHNWdWNW9EV2dpUjhKRU1haVovWURjaEMv?=
 =?utf-8?B?cTRkL3lBTkRaamdrOWVtZXFZWlZuMU42bU5xVnBaLys2OVpybCtQNVg4WXZG?=
 =?utf-8?B?LzNMdHRraWJGUElJbTVSaVhZUkQxWUVOVDZKcXFYM2xzSmNJM3lkTmltSHRO?=
 =?utf-8?B?WnhMVkVUWHBIRTNPNHp6NnFWNGVSZzRsUTI5NnBGNTNaRlcxckFxaHc4WDBn?=
 =?utf-8?B?YmJZenhUdWxtMGlTdUE1QmhVaTd4ZFpRajJ0cVllczNmRTQ0OVRzMk95MjB0?=
 =?utf-8?B?VFczc2Y2WlA2bVFLMkxwZ2dzczlNeEJxK1NjOExFUW1BNmpOczNMcGxUSVo2?=
 =?utf-8?B?L3BaYmdBVmJ2SVFySWgrWVhrdUtQZHFwZVc2UXhLYUtrL2ZEdkFncHVBc292?=
 =?utf-8?B?TCtKVGEvWlNOMFVVb1FtbXJCRzlIa3FsdUJjdndNWWNyd1BvREZHNHZHMVFF?=
 =?utf-8?B?NENjT0xVR2ZjVCtWcEk0WGRUU09qTjdlK3UraHpMSnprMnQwRUswYnFlTXVD?=
 =?utf-8?B?a21NTnI1dER2NktOaTJSeFp1TFdVSVRhaFN0UnpQZ3BxQmdNOW5aemVoeTFJ?=
 =?utf-8?B?YmplZTN1aC9TUFdIZUtTZjBKTmU2TmY2TXhpRnR4ZUd6Q29MR2ZnOXVya2hk?=
 =?utf-8?B?U2Y2VFpuQ2IzenVkS1h3MXVGWmJWVTlxZ2wyZU9WdHBJOUllb2RMei9ydWhU?=
 =?utf-8?B?dXNTQnovbWhYQm15ckRONzRqS0hZQjBoZm9MU2hIOWxPZGloSWZEMk84NHJC?=
 =?utf-8?B?R3drTzlQZWtkeXgrL3c1RStERnY4ZFByQ1YyTjlLdG42Z250SENKOWQ5VUVT?=
 =?utf-8?B?bllwRHBnaE43L1MvS0FEUjEzSURnWUd0cWZzdlFGM0F2TC9mNG5Sa0NQb0pR?=
 =?utf-8?B?cENPMEpzRWtNQUF3R1pQb0NYdWdwNWw1enFMdzZCc3A2ZVkraW5OV3lGSUow?=
 =?utf-8?B?c2xFcDRkTHBCMnNPN0N5Z3V5WnlncUJSSHJhUjUzYTdKMERBaXIzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4cb401-dbd0-4327-9285-08de5a6af66d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:34:18.4635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpwWM9achS5Js0SfukSyMqM6E5TVpfSPxm4HL+l6pUy1k8Z6gVNtMRDwsniixO/Aq95pRYifIfA7aVTdOGxVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
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


On 22-01-2026 20:30, Kamil Konieczny wrote:
> Hi Karthik,
> On 2026-01-21 at 20:27:47 +0530, Karthik Poosa wrote:
>> Add subtest aspm_link_residency to verify PCIe ASPM.
>> Active State Power Management (ASPM) is a power management mechanism
>> for PCI Express (PCIe) devices that aims to save power while the devices
>> are in a fully active state.
>> This test uses link state counters from the debugfs
>> dgfx_pcie_link_residencies to verify this.
>>
>> v2:
>>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>>   - Read residency counter as unsigned long long int instead of
>>     unsigned long int.
>>   - Print residency counter before sleep also.
>>   - Don't assert if sysfs not corresponding to aspm_link_state
>>     is not present. (Badal)
>>   - Run workload before validation of aspm link residency. (Anshuman)
>>
>> v3:
>>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>>   - Move reading of residency to separate function. (Badal)
>>
>> v4:
>>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>>   - Resolve compilation warnings about using variable as format string
>>     to sscanf.
>>
>> v5:
>>   - Use igt_device_get_pci_upstream_port() which is the renamed version
>>     of igt_device_get_pci_usp().
>>
>> v6:
>>   - Refactor and enhance readability. (Badal)
>>   - Move save and restore of link states to separate functions. (Badal)
>>
>> v7:
>>   - Skip aspm_link_residency on integrated platforms as it not supported.
>>
>> v8:
>>   - Address below review comments from Riana.
>>   - Use igt_sysfs_has_attr() instead of faccess().
>>   - Remove unnecessary spaces, debug logs, if checks.
>>   - Wrap line length to 100 chars.
>>   - Use spinner instead of mmap for workload.
>>
>> v9:
>>   - Address review comments from Kamil.
>>   - Simplify couple of igt_asserts.
>>   - Remove extra spaces.
>>
>> v10:
>>   - Add exit handler for aspm_link_residency test. (Riana)
>>   - Remove unused and unnecessary variables.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 196 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 196 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index d33a87b13..2d965ef7d 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -31,12 +31,36 @@
>>   
>>   const double tolerance = 0.1;
>>   int fw_handle = -1;
>> +int fd_pci_usp;
> int fd_pci_usp = -1;
>
>> +bool rpm_disabled;
>> +bool link_states_saved;
>>   
>>   enum test_type {
>>   	TEST_S2IDLE,
>>   	TEST_IDLE,
>>   };
>>   
>> +enum link_state_index {
>> +	LINK_STATE_ASPM,
>> +	LINK_STATE_ASPM_L1_1,
>> +	LINK_STATE_ASPM_L1_2,
>> +	LINK_STATE_PCIPM_L1_1,
>> +	LINK_STATE_PCIPM_L1_2,
>> +	MAX_LINK_STATES,
>> +};
>> +
>> +struct link_state_info {
>> +	const char *filename;
>> +	char state;
>> +	const char *parse_str;
>> +} link_state_sysfs[] = {
>> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
>> +	{ "l1_1_aspm", 0, "NULL"},
>> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
>> +	{ "l1_1_pcipm", 0, NULL},
>> +	{ "l1_2_pcipm", 0, NULL},
>> +};
>> +
>>   /**
>>    * SUBTEST: gt-c6-on-idle
>>    * Description: Validate GT C6 state on idle
>> @@ -64,6 +88,10 @@ enum test_type {
>>    * SUBTEST: cpg-gt-toggle
>>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>>    *		forcewake.
>> + *
>> + * SUBTEST: aspm_link_residency
>> + * Description: Check for PCIe ASPM (Active State Power Management) link states
>> + * entry while device is in D0.
>>    */
>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>   
>> @@ -255,6 +283,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>>   	munmap(done, 4096);
>>   }
>>   
>> +static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
>> +{
>> +	igt_spin_t *spin;
>> +	uint64_t vm, ahnd;
>> +
>> +	igt_info("Running spinner on %s:%d\n",
>> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	intel_allocator_init();
>> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> +	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>> +	igt_measured_usleep(USEC_PER_SEC);
>> +	igt_spin_free(fd, spin);
>> +}
>> +
>>   static void measure_power(struct igt_power *gpu, double *power)
>>   {
>>   	struct power_sample power_sample[2];
>> @@ -370,6 +413,143 @@ static void cpg_gt_toggle(int fd)
>>   		powergate_status(fd, gt, "down");
>>   }
>>   
>> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
>> +{
>> +	int fd_debugfs_dir = 0;
>> +	int ret = 0;
>> +	char *ptr = NULL;
>> +	char buf[1024] = {0};
>> +	uint64_t residency = 0;
>> +
>> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
>> +	igt_assert(fd_debugfs_dir >= 0);
>> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf,
>> +				      sizeof(buf));
>> +	igt_assert_f(ret >= 0, "Cannot read residency file dgfx_pcie_link_residencies, ret %d\n",
>> +		     ret);
>> +
>> +	ptr = strstr(buf, parse_str);
>> +	igt_assert_f(ptr, "Cannot find residency string %s\n", parse_str);
>> +	ret = sscanf(ptr + strlen(parse_str), "%lu", &residency);
>> +	igt_assert_f(ret > 0, "Couldn't read residency value, ret %d", ret);
>> +	igt_info("Link residency %"PRIu64"\n", residency);
>> +	close(fd_debugfs_dir);
>> +
>> +	return residency;
>> +}
>> +
>> +static void save_and_disable_link_states(void)
>> +{
>> +	int i = 0;
>> +	int ret = 0;
>> +	char path[256] = {0};
>> +
>> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>> +		sprintf(path, "%s", link_state_sysfs[i].filename);
>> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
>> +			continue;
>> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
>> +		igt_assert_lt(0, ret);
>> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename,
>> +			  link_state_sysfs[i].state);
>> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> Disable should be done in separate function, so there should be two:
>
> static void save_link_states(void)
> static void disable_link_states(void)
any reason for this Kamil, it will be unnecessary extra function.
>
>> +		igt_assert_lt(0, ret);
>> +	}
>> +	link_states_saved = true;
>> +}
>> +
>> +static void restore_link_states(void)
>> +{
>> +	int i = 0;
>> +	int ret = 0;
>> +	char path[256] = {0};
>> +
>> +	if (link_states_saved && fd_pci_usp >= 0) {
>> +		/* Restore saved states of L1 sysfs entries. */
>> +		for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>> +			sprintf(path, "%s", link_state_sysfs[i].filename);
>> +			if (!igt_sysfs_has_attr(fd_pci_usp, path))
>> +				continue;
>> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
>> +			igt_assert_lt(0, ret);
>> +			igt_debug("restored %s to %c\n", link_state_sysfs[i].filename,
>> +				  link_state_sysfs[i].state);
>> +		}
>> +		link_states_saved = false;
>> +	}
>> +}
>> +
>> +static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
>> +{
>> +	struct pci_device *pci_dev;
>> +	char name[PATH_MAX];
>> +	int ret = 0;
>> +	uint64_t residency_pre = 0, residency_post = 0;
>> +
>> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
>> +
>> +	/* Get upstream port pci_dev */
>> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
>> +	igt_assert_f(pci_dev, "Couldn't get pci device of upstream port\n");
>> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
>> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +
>> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
>> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +	fd_pci_usp = open(name, O_DIRECTORY);
>> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n",
>> +		     name, fd_pci_usp);
>> +
>> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
>> +	igt_assert(igt_setup_runtime_pm(fd_xe));
>> +	igt_disable_runtime_pm();
>> +	rpm_disabled = true;
>> +
>> +	/* Check if ASPM sysfs is present. */
>> +	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, link_state_sysfs[aspm_link_state].filename),
>> +		      "%s is not present\n", link_state_sysfs[aspm_link_state].filename);
>> +	ret = igt_sysfs_scanf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c",
>> +			      &link_state_sysfs[aspm_link_state].state);
>> +	igt_assert_f((ret > 0), "Couldn't read residency for %s",
>> +		     link_state_sysfs[aspm_link_state].filename);
>> +
>> +	/* Save current state of all available link sysfs entries and disable all link states. */
>> +	save_and_disable_link_states();
>> +
>> +	/* Enable only the ASPM link state needed for test. */
>> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
>> +	ret = igt_sysfs_printf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c", '1');
>> +
>> +	/* Read link state residencies before and after idle wait time. */
>> +	residency_pre = get_link_state_residency(fd_xe,
>> +						 link_state_sysfs[aspm_link_state].parse_str);
>> +	igt_info("Waiting for link to enter idle....\n");
>> +	sleep(SLEEP_DURATION);
>> +	residency_post = get_link_state_residency(fd_xe,
>> +						  link_state_sysfs[aspm_link_state].parse_str);
>> +
>> +	restore_link_states();
>> +	igt_restore_runtime_pm();
>> +	rpm_disabled = false;
>> +	close(fd_pci_usp);
>> +	close(fd_xe);
>> +
>> +	igt_assert_f(residency_post > residency_pre,
>> +		     "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n", residency_pre,
>> +		     residency_post);
>> +}
>> +
>> +static void aspm_residency_exit_handler(int sig)
>> +{
>> +	restore_link_states();
>> +	if (rpm_disabled) {
>> +		igt_restore_runtime_pm();
>> +		rpm_disabled = false;
>> +	}
>> +	if (fd_pci_usp)
> 	if (fd_pci_usp != -1)
>
>> +		close(fd_pci_usp);
> Add:
> 	fd_pci_usp = -1;
>
>> +}
>> +
>>   int igt_main()
>>   {
>>   	uint32_t d3cold_allowed;
>> @@ -444,6 +624,22 @@ int igt_main()
>>   		cpg_gt_toggle(fd);
>>   	}
>>   
>> +	igt_describe("ASPM Link residency validation");
>> +	igt_subtest_with_dynamic("aspm_link_residency") {
> This should be igt_subtest():
>
> 	igt_subtest("aspm_link_residency") {
>
>> +		igt_require(xe_has_vram(fd));
>> +		xe_for_each_gt(fd, gt) {
>> +			xe_for_each_engine(fd, hwe) {
>> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
>> +					igt_dynamic_f("gt%u-engine-%s", gt,
>> +						      xe_engine_class_string(hwe->engine_class))
> What are you testing here? If you need to start and stop spinner
> please describe here why. If you really need it, it should be:

we want to run a basic workload before testing ASPM entry.

So we are using spinner as workload here.

>
> 				if (gt == hwe->gt_id && !hwe->engine_instance)
> 						do_spin(fd, hwe);
>
>> +						do_spin(fd, hwe);
>> +				}
>> +			}
>> +		}
> Add newline.
>
>> +		igt_install_exit_handler(aspm_residency_exit_handler);
>> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> Btw any igt_assert outside of dynamic sub-subtest here will result
> in SIGABORT, not a proper test fail.
>
> Add cleanup here:
> 		aspm_residency_exit_handler(0);
but installing exit handler already does this !
>
>> +	}
>> +
>>   	igt_fixture() {
>>   		close(fd);
>>   	}
>> -- 
>> 2.25.1
>>
