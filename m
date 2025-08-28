Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A767CA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 16:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D6010EA48;
	Thu, 28 Aug 2025 16:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Utb2wse9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8423610EA48
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756398467; x=1787934467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K7gST6+buoD+xJ6rtX7yzl4e/P8+C5N7hCLgNqwydTM=;
 b=Utb2wse9/duyjeHvJgBHFWgIox4xV/L0COwCct4++479lSSkicWpn5OJ
 0mMhZXZnUaM4zgBIR4LKLY4PuEGmFXg+P6ae053qp0rR/eeKMQqRGcw45
 NOAcN2TavpTqbMjEc7YXNsoFbCoWTHXlvBh18h6lzuALWRTaOHzaRW1xj
 m5HMeBOSHbzjK+wTW4qKcfYY5tt4yN0w2LWnY+GhxswULcuv2Qq63uMSU
 Wxrl0ChfxHZC2JGz8+c47+M406xpUv2VRMjF/CuDU/udYqi/pAG4RAqiG
 AynIiZ1jJb2Z41hwuuo/7DXqIEPRO6WcW8zLmSyh7mkvn3JOf5Ir3kmsO w==;
X-CSE-ConnectionGUID: d4zeLIR8R8GPJONqybvSdQ==
X-CSE-MsgGUID: +XAmIfAQQGGJcj+rwxqIGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58527805"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="58527805"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:27:46 -0700
X-CSE-ConnectionGUID: GbopayzlQy2QwEMEi5uYdA==
X-CSE-MsgGUID: czwK+AcIQKuMAC9vhUigTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="170053767"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:27:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:27:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 09:27:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:27:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMqRnV/bpa2XvnlsnL3InpQP/UiYbR8UMZGRuUKG5gPO3fNNbCdIQgM03Tl1OR7sX7WoVJbB8z0HEpyBpiZjOEaWkck4JvbeTNIPyW11fA74K2I+BgPOJ3qc1PP9+99Lyl48T/4qSoLdQnS4P+k29QYlOtn3/7Dhf4I/dVofo3URgo1INTAe95jClUB9XXQNbByGMc6DloTJdEtPO4UwzoBTLknWyFh+TIa04T6ef08UJV4VwrgWwPYfyO1JnO/D45IoKwwlhPH9UVYyOgVh4rJOYI4M0P7ZG0j0SKn3fzid7OYWy9wldFPM8OCNBMX9tc6hqkCGmijccrhM3pIC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJCNUTYl62B4jBY+yJpok8oDrGUuvWgl2qyV+k7gu0Q=;
 b=rtFK9T22muuYrYGu94Mf5D9R32zk3wUp6fDajAlZovYAwNaaf7ppbGG3lDByqZX6S37ItycqwUGwq/vsjf6LG2aunQjwt42HLC/QqgLHApA41RUBbk6wMZnBssOkbhD53hQjtwMxPHOEVP8JWitzzM+5Xm+DmggJD8FDKVNINPMWcUOoLLgHuWcR0oA1wlg9bS4YBXMqTFVFSqOz1s/fonQBjxvNc7RsOvce9pvoDnYkH+BpbF1OH0l1fs83TNc75Z89eDBGZwNfLANnlVlMqYOGX+m1P2BIMz3G0ZDCW7t7DOcsxtEKEj19iSpg0bYJdA1djZ+yWURvMftxdOAJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 16:27:38 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 16:27:37 +0000
Message-ID: <3e1bbc35-2356-4120-a7bb-d9a633c1cc14@intel.com>
Date: Thu, 28 Aug 2025 21:57:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Added
 atomic_batch test in IGT
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-6-nishit.sharma@intel.com>
 <BL1PR11MB552505685B3BB6A6567E1D3B843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <BL1PR11MB552505685B3BB6A6567E1D3B843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 5209cb0c-511c-44ef-8481-08dde64fcd15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1gwdC9RMjVRWStrZENRTlZSQVZIVGRsRFhqT3A2cU9RK1VJdTVGUjlDb3Qw?=
 =?utf-8?B?WWp2T3RVOVpvOG9SUmlIR0NoMk1JRmwxZEZiSnRBcEVhcEdaRmh0MjZUczBz?=
 =?utf-8?B?RjRNMHJJV2E5bGlaejdjVUJFQnF5Wm1tSlNuSytiZTBOM251MTI0aFI3bkUy?=
 =?utf-8?B?UmpoYVNDL0JiWTFsYVJPbTI5WmMwa29YUjR6RUVyQWFGb2xYMHU4VVRwbDc5?=
 =?utf-8?B?RXFEemNDNWxHN29pT0p1RW52aXFYd0Q0YXZkMnYzZlNSaWhkcjljakhOVGJM?=
 =?utf-8?B?Skt5R1JYanoyd1dKUVdWNllZVEt3VGZtMjYrMkpGTGFmTDc0VFBuU1VUYmJB?=
 =?utf-8?B?aFNtQmpwdUl2ZGlpZDN6cDlneTZMczUxQUVHRGwrZFlheVhaZ1E1VU9IdkZT?=
 =?utf-8?B?V05UOXMrR2IwQ0l0YTVOU0VhYkV1NmFQWEtodnp1UTNIRHNCVDFOYVpQemJJ?=
 =?utf-8?B?V3NaWUpBTzV2ZG10NTN6RDZIelJHdE5nSE15cmtGQlB0ek1SR1RtYm1qb3gz?=
 =?utf-8?B?RlVRQ2wycTdHWTBub2ErbVB5WWhuOUY3U3kzQmMwc1lYZ0VDSk9wS3ZUN2Zk?=
 =?utf-8?B?QnFxeVVKdVk2MXlqUmFGUUc1bFAxQms3L2lQYWZadTVEYUFWdUVwWGRSWkJG?=
 =?utf-8?B?TE5NSkdFWlYzdXV5cXBsYS9DTU1rYmhTUzNWY2VKcDU5Y0dLTWZaSEFYSDdZ?=
 =?utf-8?B?VVZVV3pSeDVhbDY2bzJ4QS9BZnh5T3BXcWlDUmdyQ1pjRnExQU02NG82dkYr?=
 =?utf-8?B?RWY1Wm1ITGJtWjhoOXhSWGdjYXdlRTEyN2NMdW50UnozMVlsVitQK3NVZzgr?=
 =?utf-8?B?YlRmN29wWmR5b3c2enFpWDFGYjhkNExubE5oa3RKY3p0aVViN2tvNGhKYitx?=
 =?utf-8?B?bnBKSWp0NXRTSm5FVFVWSXJYM25Mcm5lYXhhTXBFc2JZRnlmQVlhaGZiMEpR?=
 =?utf-8?B?bVFZS01SOW82V0RTSzVDL2xZbjVkS05kaFAyb0RiTnQ0MkE4RUltMnE5akNH?=
 =?utf-8?B?TFh5TGt4dGhzNzd0TDJRcm5kU3M5MiswMDhPeUJDc0hTSnRMUVk4c2Z3bU1C?=
 =?utf-8?B?bEpUUXV1bW5HMUNQSXRSZ1NmUTdWZGdLbTFmcHJOSjI2cmd1Snh6Smg5Ly9I?=
 =?utf-8?B?amhLTm1XQ0RNUVVmRVJBeW9zaUI2YTMzcEgyV2Q5djNkc281Vm8xN1lVT3ds?=
 =?utf-8?B?ZHVnK1JkMk92N1VoZm5rK0o5cS9CeXNrOXJvM1RoY2hDQWpqajhjTVVkcjlF?=
 =?utf-8?B?UC9acTlpeVNCTmVUTldpeFVVNk1pWXp0K2oyMW04S1MxQ1c2blNEN3JiWkFQ?=
 =?utf-8?B?UGYvL09VcEJaM3h6TkxnQ0RYalE4bkluZDJna29jbm5BeElVcnR2UmYzUlRM?=
 =?utf-8?B?bytYMWFDa09YQ0NINUVRK2Q2UXpINHVMZWs4TnNWWUpINit6ZzNLTlZ2akQ4?=
 =?utf-8?B?NG9iT0J2NTZtTmZSRVNyYXJwTThGenF1V0dvQUk2YWRuZ3NhSm9LUjdJeFNV?=
 =?utf-8?B?YzcrS1RzVHpBM2x6RlZNaFk4RWhkS1ZwT1A2RDl6ckVldHpUVXNrajRwaG1S?=
 =?utf-8?B?VjdKYm5QQjdJcUtFQko1NWovREowT0lVZ01jK2ZSWmg4R0pOM1IwNldtRCtX?=
 =?utf-8?B?RStLTTVsb2pGMGdGMmxoQmorNVA0Vkh5TGlOUmoyanNhZk5LYVhnM3VPbWE3?=
 =?utf-8?B?bkZFWXdueTBES3R5bDdFU09BU0RETytNRSs0ckVnZ3hxOE04Q3ZVeG9aKzNr?=
 =?utf-8?B?YkhkS2RPTm1WSFZFS0RtNjZ2Qjgrd1VFV0NJTU9hYlVXY0lwZlJDYndsZjJJ?=
 =?utf-8?B?UDI1bnlBMlZLb2pFckxTeVFkeDVqeU5VSTJ2cE9UM1Y0dWxIT2ZydWxJLzBI?=
 =?utf-8?B?SVpqSTNiTmdJbjB0YVVSejVveFlUQXN3S3g2RHl0SUZ6bGtYbG1Ed1NVVEdx?=
 =?utf-8?Q?Nda+Zur3lNI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3VBZEd1TmswYnZaTk5BKytSMHNocDFiVEQxaExkTDRFU3NiZ1RqVlpDdDlj?=
 =?utf-8?B?UnRKVlFoKzN0aHNRdVZ6dHY5bTNzY1dObWh4ckdFcDVCVEU2RXA5YlllSW5I?=
 =?utf-8?B?djNnVlE3NDVWR1VzUGpQdnhNbWhoSXNPYjdoejVocEpJSUhJcWxYZU9sQWZl?=
 =?utf-8?B?ZXpyU2VXaUVBSUFRK3lXSDVBQnhPc3pNanR2VUpnOGFJUEd6OXpIeG5nME91?=
 =?utf-8?B?Wmd0REVEK0FiZFRQamVqVUlQVTAwOHZ5Si91U2VTaGkxcHcySTBuNWMvdmd4?=
 =?utf-8?B?c0x5dXU5UGs4dGxKS2RMcllZeSs1ZEk0VTVTSXZJeWtZWWp2d29hUHdPRk11?=
 =?utf-8?B?dDIzdXgzSDlRcVFHNVc4bHZZV0xMWlFGNEtzM3pUem00NTlieElWbC9OYnVn?=
 =?utf-8?B?bUcwVGRPMFNhbm1mcGdTMnV6VVBPNmNuV0NWcWZHcnpEWHlFczg5ZldBR1VR?=
 =?utf-8?B?cjl2anhDSy96TGtORG5aa1VMeE5YNDRiZjFRdm5hdVJFd1lPOU4vQm5Jd3Jw?=
 =?utf-8?B?Yzc1Zk1XMkxnWDB2T0VYR3lWalo2bklPL25uRWlYVm9WdjEvdEk0MXNjRURX?=
 =?utf-8?B?QVFrU0Fva0syQ3pXZG15WVk0OHhhL2lPNkcwMWtUUDZ1VHBCMG9qOElnNlJt?=
 =?utf-8?B?cldGT1Y4WEp3NEV4ckhIQ1FaWkcrcXcrKzVEeDlnRUhyTlpETEpxMm1ZNXRU?=
 =?utf-8?B?ajdjUTdvL2JEME00TFNhTjgzdGlqc3AxWm1PS0dsemhzbVdobjZBdE9FSUNF?=
 =?utf-8?B?TUJsb2I4US9SZG91ZXFBOEtyRis5QlRhWjc1WnpQZ0Q2NUxMNjJpSFZOTUdU?=
 =?utf-8?B?SE9aa1BLbmIxWWY5dWNUWEJ2aWdUckc2TTBYc0o1UEh5ci9qQnkyY0RKc0Jv?=
 =?utf-8?B?cjBEbStmYkxSTDhNK1hGTkVKcW13bTVaS2srcnp2QWhqQ1lEbXJiNzdxdkxh?=
 =?utf-8?B?eG5IV3BoZi9IVDdoZmJoOE85SGZ4RUJycmZFenZhUktPUTBZb09XRVltY0Ew?=
 =?utf-8?B?Q3BaMitHQnplMVhkVU1XUGJFL3BjelRrMzNEeUdYNEFUVzNOSTlVQ3l0U2FE?=
 =?utf-8?B?QTJDdG1mZkwxQ2lHcXAyWkJIWklvQUI5ekxMSEhGOWpoZEIvUTZ5ejdIQTFB?=
 =?utf-8?B?VC91MFBqb0VVOGNpZXhBdjdMWkd1NWFUY0ZVbGNwdUxQWng4ZEJabTVJRlo4?=
 =?utf-8?B?SWtGRzJ2NWt4ZHd3RzdneGdTK01GSVVYZk5SSHdSeDRJY1FXNnVHT2xKUGhP?=
 =?utf-8?B?YXZhN1pRNmxWL3VUeVBSaDhTK1c4UmVJaTRDd3UvYUw5VW8wLzZIbXVxdm1G?=
 =?utf-8?B?UnlGNExUeStQU0tNV1hrZTM4N0pyNDJUNFg2WE50a0luRHpFbzQzQm8zQTBv?=
 =?utf-8?B?MzZQTmp2TEtGd2wwK1U1SXYzU2xzVVZyR3FVczM2cnQ1UVpVVjBlNktFa2dt?=
 =?utf-8?B?VVJ1VjJxTTlnb01MOHJBczlVUlFRSFdQaURvd2FuRW9adjNXTUhralAyUVhs?=
 =?utf-8?B?ZUJsbWdxSGJQaWNRQ2hkN2MvYWtQbHZHbWc2cnROR3l6QWREV3JldUUwejZM?=
 =?utf-8?B?eFY1L2Z2dG5HTlVmaVJJY1pqWmhVTXlqaFg1NmdYcWtVUDFROE5Wc05SOUtx?=
 =?utf-8?B?alJiblRFMnJ6Uk1JM1F3R2tHcDcybVpWbmMvcE1oTlpzeU9GNDhSdVU5dW4y?=
 =?utf-8?B?RXBUZVRaMm9YWTBJRDJNS0hRN2owbWt2V2FtZ2Z2NERzYzUwdjl6Q2FmYnIr?=
 =?utf-8?B?VHhTUnpIQXA0anlWV1FUZTFLRlBaemxrOTJvYzQyV3pzc3dEaHpNQ0hvbUd3?=
 =?utf-8?B?MW5URGpaTDRlWlhDM1NXZjl0MTNMdmdxNDVmTXpwS0R4OWdJVFJFR2Nza2Mv?=
 =?utf-8?B?RkpmZEQyaFR5YllLc091UkhEYzVIQ1lhK0o2ZjJyYlV3Ni83bmpOQytuY0U1?=
 =?utf-8?B?UzZiNmNoUnIrV1lsYVo3TFJoTGRGZTNGbGYrU3ZHU2x5d0RmUHpIdTR2RldL?=
 =?utf-8?B?d1hvVnBBOTc3WGZEZEtjZjhSbDh0WWZhU2g4THo1R1l4cS9md1ZWdHN4UXdL?=
 =?utf-8?B?MGpaeFh3Wm1YM1QrYVF4ZG16OFp1ZG1CQVVXN1VwQVBFTW0rLzNDNWl2SUJZ?=
 =?utf-8?B?NVNHRXdUamVWczA2a2JFQ0JGNW5OR2lvSUV2b0hVNHVhQ0M5dEMzc3hBRlpv?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5209cb0c-511c-44ef-8481-08dde64fcd15
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 16:27:37.7582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSm9rkUKh/Z9Y/zAsnNgf/ZSU8mSrRSvCSFPdRKMmhZeme0T62lubf2H01P2asw2aYqGHTiwsLPRQ/fnutoJLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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


On 8/28/2025 8:38 PM, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> nishit.sharma@intel.com
>> Sent: Tuesday, August 26, 2025 2:12 PM
>> To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
>> Subject: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Added
>> atomic_batch test in IGT
>>
>> From: Nishit Sharma <nishit.sharma@intel.com>
>>
> Title cane be "] tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT"
>
>> ATOMIC_BATCH flag is introduced when true MI_ATOMIC |
>> MI_ATOMIC_INC operation will be called. This will avoid writing another
>> function which performs atomic increment operations. ATOMIC_BATCH flag
>> is passed as argument in write_dword() if true then value will be written on
>> passed address and incremented by ATOMIC_INC operation. For all memory
>> operations this flag will be used to verify if ATOMIC operation is working or
>> not.
>>
>> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
>> ---
>>   tests/intel/xe_exec_system_allocator.c | 482 +++++++++++++++++++++---
>> -
>>   1 file changed, 412 insertions(+), 70 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index 70ca5fc2e..4569ace8d 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -29,6 +29,14 @@
>>   #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>>   #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>>   #define FIVE_SEC		(5LL * NSEC_PER_SEC)
> Space here . and runc checkpatch.pl
>> +struct test_exec_data {
>> +	uint32_t batch[32];
>> +	uint64_t pad;
>> +	uint64_t vm_sync;
>> +	uint64_t exec_sync;
>> +	uint32_t data;
>> +	uint32_t expected_data;
>> +};
>>
>>   struct batch_data {
>>   	uint32_t batch[16];
>> @@ -37,6 +45,7 @@ struct batch_data {
>>   	uint32_t expected_data;
>>   };
>>
>> +#define VAL_ATOMIC_EXPECTED  56
>>   #define WRITE_VALUE(data__, i__)	({			\
>>   	if (!(data__)->expected_data)				\
>>   		(data__)->expected_data = rand() << 12 | (i__);	\
>> @@ -53,10 +62,19 @@ static void __write_dword(uint32_t *batch, uint64_t
>> sdi_addr, uint32_t wdata,
>>   	batch[(*idx)++] = wdata;
>>   }
>>
>> -static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
>> -			int *idx)
>> +static void write_dword(struct test_exec_data *data, uint64_t sdi_addr,
>> uint32_t wdata,
>> +			int *idx, bool atomic)
>>   {
>> -	__write_dword(batch, sdi_addr, wdata, idx);
>> +	uint32_t *batch = data->batch;
>> +
>> +	if (atomic) {
>> +		data->data = 55;
>> +		batch[(*idx)++] = MI_ATOMIC | MI_ATOMIC_INC;
>> +		batch[(*idx)++] = sdi_addr;
>> +		batch[(*idx)++] = sdi_addr >> 32;
>> +	} else {
>> +		__write_dword(batch, sdi_addr, wdata, idx);
>> +	}
>>   	batch[(*idx)++] = MI_BATCH_BUFFER_END;  }
>>
>> @@ -271,7 +289,7 @@ check_all_pages_threads(void *ptr, uint64_t
>> alloc_size, uint64_t stride,
>>
>>   static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>>   			    uint64_t alloc_size, uint64_t stride,
>> -			    struct timespec *tv, uint64_t *submit)
>> +			    struct timespec *tv, uint64_t *submit, bool atomic)
>>   {
>>   	struct drm_xe_sync sync[1] = {
>>   		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, @@ -302,7
>> +320,8 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void
>> *ptr,
>>   		uint64_t sdi_addr = addr + sdi_offset;
>>   		int b = 0;
>>
>> -		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i),
>> &b);
>> +		write_dword((struct test_exec_data *)data, sdi_addr,
>> WRITE_VALUE(data, i),
>> +			     &b, atomic ? true : false);
>>   		igt_assert(b <= ARRAY_SIZE(data->batch));
>>   	}
>>
>> @@ -407,34 +426,45 @@ static void __aligned_partial_free(struct
>> aligned_alloc_type  *aligned_alloc_typ
>>
>>   #define MAX_N_EXEC_QUEUES       16
>>
>> -#define MMAP                    (0x1 << 0)
>> -#define NEW                     (0x1 << 1)
>> -#define BO_UNMAP                (0x1 << 2)
>> -#define FREE                    (0x1 << 3)
>> -#define BUSY                    (0x1 << 4)
>> -#define BO_MAP                  (0x1 << 5)
>> -#define RACE                    (0x1 << 6)
>> -#define SKIP_MEMSET             (0x1 << 7)
>> -#define FAULT                   (0x1 << 8)
>> -#define FILE_BACKED             (0x1 << 9)
>> -#define LOCK                    (0x1 << 10)
>> -#define MMAP_SHARED             (0x1 << 11)
>> -#define HUGE_PAGE               (0x1 << 12)
>> -#define SHARED_ALLOC            (0x1 << 13)
>> -#define FORK_READ               (0x1 << 14)
>> -#define FORK_READ_AFTER         (0x1 << 15)
>> -#define MREMAP                  (0x1 << 16)
>> -#define DONTUNMAP               (0x1 << 17)
>> -#define READ_ONLY_REMAP         (0x1 << 18)
>> -#define SYNC_EXEC               (0x1 << 19)
>> -#define EVERY_OTHER_CHECK       (0x1 << 20)
>> -#define MULTI_FAULT             (0x1 << 21)
>> -#define PREFETCH                (0x1 << 22)
>> -#define THREADS                 (0x1 << 23)
>> -#define PROCESSES               (0x1 << 24)
>> -#define PREFETCH_BENCHMARK      (0x1 << 25)
>> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
>> -#define PREFERRED_LOC_SMEM      (0x1 << 27)
>> +#define MMAP				(0x1 << 0)
>> +#define NEW				(0x1 << 1)
>> +#define BO_UNMAP			(0x1 << 2)
>> +#define FREE				(0x1 << 3)
>> +#define BUSY				(0x1 << 4)
>> +#define BO_MAP				(0x1 << 5)
>> +#define RACE				(0x1 << 6)
>> +#define SKIP_MEMSET			(0x1 << 7)
>> +#define FAULT				(0x1 << 8)
>> +#define FILE_BACKED			(0x1 << 9)
>> +#define LOCK				(0x1 << 10)
>> +#define MMAP_SHARED			(0x1 << 11)
>> +#define HUGE_PAGE			(0x1 << 12)
>> +#define SHARED_ALLOC			(0x1 << 13)
>> +#define FORK_READ			(0x1 << 14)
>> +#define FORK_READ_AFTER			(0x1 << 15)
>> +#define MREMAP				(0x1 << 16)
>> +#define DONTUNMAP			(0x1 << 17)
>> +#define READ_ONLY_REMAP			(0x1 << 18)
>> +#define SYNC_EXEC			(0x1 << 19)
>> +#define EVERY_OTHER_CHECK		(0x1 << 20)
>> +#define MULTI_FAULT			(0x1 << 21)
>> +#define PREFETCH			(0x1 << 22)
>> +#define THREADS				(0x1 << 23)
>> +#define PROCESSES			(0x1 << 24)
>> +#define PREFETCH_BENCHMARK		(0x1 << 25)
>> +#define PREFETCH_SYS_BENCHMARK		(0x1 << 26)
>> +#define PREFERRED_LOC_SMEM		(0x1 << 27)
> diff should be seen after this

Initially the Macros were defined after partial sub-test. Few macros 
were called by different sub-tests before they were defined and giving 
compilation issue.

hence moved macros upwards so that each macro is accessible to all 
sub-tests.

>> +#define ATOMIC_BATCH			(0x1 << 28)
>> +#define MIGRATE_ALL_PAGES		(0x1 << 29)
>> +#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1 << 30)
>> +#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 31)
>> +#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 32)
>> +#define MADVISE_MULTI_VMA		(0x1ull << 33)
>> +#define MADVISE_SPLIT_VMA		(0x1ull << 34)
>> +#define MADVISE_ATOMIC_VMA		(0x1ull << 35)
>> +#define PREFETCH_SPLIT_VMA		(0x1ull << 36)
>> +#define PREFETCH_CHANGE_ATTR		(0x1ull << 37)
>> +#define PREFETCH_SAME_ATTR		(0x1ull << 38)
>>
>>   #define N_MULTI_FAULT           4
>>
>> @@ -478,6 +508,47 @@ static void __aligned_partial_free(struct
>> aligned_alloc_type  *aligned_alloc_typ
>>    * SUBTEST: processes-evict-malloc-mix-bo
>>    * Description: multi-process trigger eviction of VRAM allocated via malloc
>> and BO create
>>    * Test category: stress test
>> + *
>> + * SUBTEST: madvise-multi-vma
>> + * Description: performs multiple madvise operations on multiple
>> + virtual memory area using atomic device attributes
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-split-vma
>> + * Description: perform madvise operations on multiple type VMAs (BO
>> + and CPU VMAs)
>> + * Test category: perform madvise operations on multiple type VMAs (BO
>> + and CPU VMAs)
>> + *
>> + * SUBTEST: madvise-atomic-vma
>> + * Description: perform madvise atomic operations on BO in VRAM/SMEM if
>> + atomic ATTR global/device
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-split-vma-with-mapping
>> + * Description: performs prefetch and page migration
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-preffered-loc-atomic-vram
>> + * Description: performs both atomic and preferred loc madvise
>> + operations atomic device attributes set
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-preffered-loc-atomic-gl
>> + * Description: performs both atomic and preferred loc madvise
>> + operations with atomic global attributes set
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-preffered-loc-atomic-cpu
>> + * Description: performs both atomic and preferred loc madvise
>> + operations with atomic cpu attributes set
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-preffered-loc-sram-migrate-pages
>> + * Description: performs preferred loc madvise operations and migrating
>> + all pages in smem
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-no-range-invalidate-same-attr
>> + * Description: performs atomic global madvise operation, prefetch and
>> + again madvise operation with same atomic attribute
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: madvise-range-invalidate-change-attr
>> + * Description: performs atomic global madvise operation, prefetch and
>> + again madvise operation with different atomic attribute
>> + * Test category: functionality test
>> + *
>>    */
>>
>>   static void
>> @@ -544,7 +615,7 @@ many_allocs(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   		allocs[i] = alloc;
>>
>>   		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size,
>> stride,
>> -				&tv, &submit);
>> +				&tv, &submit, flags & ATOMIC_BATCH);
>>   	}
>>
>>   	if (barrier)
>> @@ -692,7 +763,7 @@ partial(int fd, struct drm_xe_engine_class_instance
>> *eci, unsigned int flags)
>>   		.num_syncs = 1,
>>   		.syncs = to_user_pointer(sync),
>>   	};
>> -	struct {
>> +	struct batch_data {
> Any reason batch_data is added , no difference between these two declarations. If not needed can you please drop
batch_data was already part of original xe_exec_system_allocator. For 
newly added madvise tests new structure has been defined with extra 
members.
>>   		uint32_t batch[16];
>>   		uint64_t pad;
>>   		uint64_t vm_sync;
>> @@ -750,7 +821,8 @@ partial(int fd, struct drm_xe_engine_class_instance
>> *eci, unsigned int flags)
>>   		uint64_t sdi_addr = addr + sdi_offset;
>>   		int b = 0;
>>
>> -		write_dword(data[i].batch, sdi_addr,
>> WRITE_VALUE(&data[i], i), &b);
>> +		write_dword((struct test_exec_data *)&data[i], sdi_addr,
>> WRITE_VALUE(&data[i], i),
>> +			     &b, ATOMIC_BATCH ? true : false);
>>   		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>>
>>   		if (!i)
>> @@ -773,7 +845,10 @@ partial(int fd, struct drm_xe_engine_class_instance
>> *eci, unsigned int flags)
>>   		xe_wait_ufence(fd, new ?: exec_ufence,
>> USER_FENCE_VALUE,
>>   			       exec_queue, FIVE_SEC);
>>   		if (i || (flags & CPU_FAULT))
>> -			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
>> +			igt_assert_eq(data[i].data,
>> +				      flags & ATOMIC_BATCH
>> +				      ? VAL_ATOMIC_EXPECTED
>> +				      : READ_VALUE(&data[i]));
>>   		exec_ufence[0] = 0;
>>
>>   		if (!i) {
>> @@ -1072,16 +1147,6 @@ partial(int fd, struct
>> drm_xe_engine_class_instance *eci, unsigned int flags)
>>    * Description: Create multiple threads with a faults on different hardware
>> engines to same addresses, racing between CPU and GPU access
>>    * Test category: stress test
>>    */
>> -
>> -struct test_exec_data {
>> -	uint32_t batch[32];
>> -	uint64_t pad;
>> -	uint64_t vm_sync;
>> -	uint64_t exec_sync;
>> -	uint32_t data;
>> -	uint32_t expected_data;
>> -};
>> -
>>   static void igt_require_hugepages(void)  {
>>   	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
>> @@ -1090,11 +1155,52 @@ static void igt_require_hugepages(void)
>>   		      "No huge pages available!\n");
>>   }
>>
>> +static int
>> +xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range,
>> +			int pat_index)
>> +{
>> +	int err;
>> +
>> +	err = xe_vm_madvise(fd, vm, addr, range, 0,
>> +			    DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
>> +	if (err)
>> +		return err;
>> +	return 0;
>> +}
>> +
> this more simplified way. In failure case we are asserting  can you please is this possible?
> static int xe_vm_madvise_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range, int pat_index)
> {
>      return xe_vm_madvise(fd, vm, addr, range, 0,
>                           DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
> }
>
>> +static int
>> +xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range,
>> +			  int mem_attr)
>> +{
>> +	int err;
>> +
>> +	err = xe_vm_madvise(fd, vm, addr, range, 0,
>> +			    DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>> +			    mem_attr, 0);
>> +	if (err)
>> +		return err;
>> +	return 0;
>> +}
>> +
>> +static int
>> +xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr,
>> +uint64_t range) {
>> +	int err;
>> +
>> +	err = xe_vm_madvise(fd, vm, addr, range, 0,
>> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>> +			    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
>> +			    DRM_XE_MIGRATE_ALL_PAGES);
>> +	if (err)
>> +		return err;
>> +	return 0;
>> +}
>> +
> Same here as well
>>   static void
>>   test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>>   	  int n_exec_queues, int n_execs, size_t bo_size,
>>   	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
>> -	  unsigned int flags)
>> +	  unsigned long long flags)
>>   {
>>   	uint64_t addr;
>>   	struct drm_xe_sync sync[1] = {
>> @@ -1107,9 +1213,10 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   		.syncs = to_user_pointer(sync),
>>   	};
>>   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>> -	struct test_exec_data *data, *next_data = NULL;
>> +	struct test_exec_data *data, *next_data = NULL, *org_data;
>>   	uint32_t bo_flags;
>>   	uint32_t bo = 0, bind_sync = 0;
>> +	uint32_t val;
>>   	void **pending_free;
>>   	u64 *exec_ufence = NULL, *bind_ufence = NULL;
>>   	int i, j, b, file_fd = -1, prev_idx, pf_count, err; @@ -1234,6 +1341,133
>> @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>>   				 strerror(errno), vm, to_user_pointer(data),
>> bo_size);
>>   	}
>>
>> +	if (flags & PREFERRED_LOC_SMEM) {
>> +		if (flags & MIGRATE_ALL_PAGES) {
>> +			err = xe_vm_madvise_migrate_pages(fd, vm,
>> to_user_pointer(data), bo_size);
>> +			if (err)
>> +				igt_warn("failure in page migration err = %s,
>> vm =%u, data=%"PRIu64"\n",
>> +					 strerror(errno), vm,
>> to_user_pointer(data));
>> +		} else {
>> +			err = xe_vm_madvise(fd, vm, to_user_pointer(data),
>> bo_size, 0,
>> +
>> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>> +
>> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
>> +		}
>> +	}
>> +	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
>> +		err = xe_vm_madvise_migrate_pages(fd, vm,
>> to_user_pointer(data), bo_size);
>> +		if (err)
>> +			igt_warn("failure in page migration err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +
>> +		err = xe_vm_madvise_atomic_attr(fd, vm,
>> to_user_pointer(data), bo_size,
>> +						DRM_XE_ATOMIC_DEVICE);
>> +		if (err)
>> +			igt_warn("failure in atomic device attr err = %s, vm
>> =%u data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +	}
>> +	if (flags & PREFERRED_LOC_ATOMIC_GL) {
>> +		err = xe_vm_madvise_migrate_pages(fd, vm,
>> to_user_pointer(data), bo_size);
>> +		if (err)
>> +			igt_warn("failure in page migration err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +		err = xe_vm_madvise_atomic_attr(fd, vm,
>> to_user_pointer(data), bo_size,
>> +						DRM_XE_ATOMIC_GLOBAL);
>> +		if (err)
>> +			igt_warn("failure in atomic global attr err = %s, vm
>> =%u data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +	}
>> +	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
>> +		err = xe_vm_madvise_migrate_pages(fd, vm,
>> to_user_pointer(data), bo_size);
>> +		if (err)
>> +			igt_warn("failure in page migration err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +
>> +		err = xe_vm_madvise_atomic_attr(fd, vm,
>> to_user_pointer(data), bo_size,
>> +						DRM_XE_ATOMIC_CPU);
>> +		if (err)
>> +			igt_warn("failure in atomic cpu attr err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +	}
>> +	if (flags & MADVISE_MULTI_VMA) {
>> +		if (bo_size)
>> +			bo_size = ALIGN(bo_size, SZ_4K);
>> +		err = xe_vm_madvise_atomic_attr(fd, vm,
>> to_user_pointer(data) + bo_size/2,
>> +						bo_size/2,
>> DRM_XE_ATOMIC_DEVICE);
>> +		if (err)
>> +			igt_warn("failure in atomic device attr err = %s, vm
>> =%u data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +
>> +		err = xe_vm_madvise_atomic_attr(fd, vm,
>> to_user_pointer(data) + bo_size,
>> +						bo_size,
>> DRM_XE_ATOMIC_DEVICE);
>> +		if (err)
>> +			igt_warn("failure in atomic multi_vma err = %s, vm
>> =%u data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +
>> +		err = xe_vm_madvixe_pat_attr(fd, vm,
>> to_user_pointer(data), bo_size, 4);
>> +		if (err)
>> +			igt_warn("failure in pat attr index 4 err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +
>> +		err = xe_vm_madvixe_pat_attr(fd, vm,
>> to_user_pointer(data), bo_size, 3);
>> +		if (err)
>> +			igt_warn("failure in pat attr index 3 err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +
>> +		err = xe_vm_madvixe_pat_attr(fd, vm,
>> to_user_pointer(data) + bo_size/2, bo_size/2,
>> +					     8);
> PAT index values differ across platforms.
> It is better to use the library functions in lib/intel_pat to obtain the correct PAT index values for each platform.
> -- Pravalika
>
>> +		if (err)
>> +			igt_warn("failure in pat attr index 8 err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +	}
>> +	if (flags & MADVISE_SPLIT_VMA) {
>> +		if (bo_size)
>> +			bo_size = ALIGN(bo_size, SZ_4K);
>> +
>> +		bo_flags =
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>> +		bo = xe_bo_create(fd, vm, bo_size,
>> +				  vram_if_possible(fd, eci->gt_id), bo_flags);
>> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) +
>> bo_size/2,
>> +				 bo_size/2, 0, 0);
>> +
>> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data)
>> + bo_size/2,
>> +				    bo_size/2, DRM_XE_VM_BIND_OP_MAP,
>> +
>> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
>> +				    1, 0, 0);
>> +		xe_wait_ufence(fd, &data[0].vm_sync,
>> USER_FENCE_VALUE, 0, FIVE_SEC);
>> +		data[0].vm_sync = 0;
>> +		gem_close(fd, bo);
>> +		bo = 0;
>> +
>> +		err = xe_vm_madvise_atomic_attr(fd, vm,
>> to_user_pointer(data),
>> +						bo_size/2,
>> DRM_XE_ATOMIC_DEVICE);
>> +		if (err)
>> +			igt_warn("failure in split atomic device attr err = %s,
>> vm =%u data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +	}
>> +	if (flags & MADVISE_ATOMIC_VMA) {
>> +		if (bo_size)
>> +			bo_size = ALIGN(bo_size, SZ_4K);
>> +
>> +		bo_flags =
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>> +		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci-
>>> gt_id), bo_flags);
>> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data),
>> bo_size, 0,
>> +0);
>> +
>> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data),
>> bo_size,
>> +				    DRM_XE_VM_BIND_OP_MAP,
>> +
>> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
>> +				    1, 0, 0);
>> +		xe_wait_ufence(fd, &data[0].vm_sync,
>> USER_FENCE_VALUE, 0, FIVE_SEC);
>> +		data[0].vm_sync = 0;
>> +		gem_close(fd, bo);
>> +		bo = 0;
>> +
>> +		err = xe_vm_madvise_atomic_attr(fd, vm,
>> to_user_pointer(data), bo_size/2,
>> +						DRM_XE_ATOMIC_GLOBAL);
>> +		if (err)
>> +			igt_warn("failure in atomic vma err = %s, vm =%u
>> data=%"PRIu64"\n",
>> +				 strerror(errno), vm, to_user_pointer(data));
>> +	}
>> +
>>   	if (flags & BO_UNMAP) {
>>   		bo_flags =
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>>   		bo = xe_bo_create(fd, vm, bo_size,
>> @@ -1307,6 +1541,16 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
>>   		bool fault_injected = (FAULT & flags) && i > n_execs;
>>
>> +		if (flags & MADVISE_MULTI_VMA) {
>> +			addr = addr + bo_size;
>> +			org_data = data;
>> +			data = from_user_pointer(addr);
>> +			batch_offset = (char *)&(data[idx].batch) - (char
>> *)data;
>> +			batch_addr = addr + batch_offset;
>> +			sdi_offset = (char *)&(data[idx].data) - (char *)data;
>> +			sdi_addr = addr + sdi_offset;
>> +		}
>> +
>>   		if (barrier)
>>   			pthread_barrier_wait(barrier);
>>
>> @@ -1316,18 +1560,74 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   				__write_dword(data[idx].batch,
>>   					      sdi_addr + j * orig_size,
>>   					      WRITE_VALUE(&data[idx], idx),
>> &b);
>> -			write_dword(data[idx].batch, sdi_addr + j *
>> orig_size,
>> -				    WRITE_VALUE(&data[idx], idx), &b);
>> +			write_dword(&data[idx], sdi_addr + j * orig_size,
>> +				    WRITE_VALUE(&data[idx], idx), &b,
>> +				    flags & ATOMIC_BATCH ? true : false);
>>   			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
>>   		} else if (!(flags & EVERY_OTHER_CHECK)) {
>>   			b = 0;
>> -			write_dword(data[idx].batch, sdi_addr,
>> -				    WRITE_VALUE(&data[idx], idx), &b);
>> +			write_dword(&data[idx], sdi_addr,
>> +				    WRITE_VALUE(&data[idx], idx), &b,
>> +				    flags & ATOMIC_BATCH ? true : false);
>>   			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
>> +			if (flags & PREFETCH) {
>> +				if (flags & PREFETCH_SPLIT_VMA) {
>> +					bo_size = ALIGN(bo_size, SZ_4K);
>> +
>> +					xe_vm_prefetch_async(fd, vm, 0, 0,
>> addr, bo_size, NULL, 0, 0);
>> +
>> +					igt_info("num_vmas before madvise
>> = %d \n", val);
>> +
>> +					val =
>> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
>> +bo_size);
>> +
>> +					err =
>> xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
>> +					if (err)
>> +						igt_warn("failure in prefetch
>> split vma err = %s, vm =%u data=%"PRIu64"\n",
>> +
>> 	strerror(errno), vm, to_user_pointer(data));
>> +					igt_info("num_vmas after madvise=
>> %d \n", val);
>> +					val =
>> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
>> +				} else if (flags & PREFETCH_SAME_ATTR) {
>> +					err =
>> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>> +
>> 	DRM_XE_ATOMIC_GLOBAL);
>> +					if (err)
>> +						igt_warn("failure in prefetch
>> same attr err = %s, vm =%u data=%"PRIu64"\n",
>> +
>> 	strerror(errno), vm, to_user_pointer(data));
>> +					val =
>> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
>> +					xe_vm_prefetch_async(fd, vm, 0, 0,
>> addr, bo_size, NULL, 0, DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
>> +					err =
>> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
>> +
>> 	DRM_XE_ATOMIC_GLOBAL);
>> +					if (err)
>> +						igt_warn("failure in prefetch
>> atomic attr err = %s, vm =%u data=%"PRIu64"\n",
>> +
>> 	strerror(errno), vm, to_user_pointer(data));
>> +				} else if (flags & PREFETCH_CHANGE_ATTR) {
>> +					err =
>> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>> +
>> 	DRM_XE_ATOMIC_GLOBAL);
>> +					if (err)
>> +						igt_warn("failure in prefetch
>> atomic attr err = %s, vm =%u data=%"PRIu64"\n",
>> +
>> 	strerror(errno), vm, to_user_pointer(data));
>> +					val =
>> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
>> +bo_size);
>> +
>> +					xe_vm_prefetch_async(fd, vm, 0, 0,
>> addr, bo_size, NULL, 0,
>> +DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
>> +
>> +					err =
>> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>> +
>> 	DRM_XE_ATOMIC_DEVICE);
>> +					if (err)
>> +						igt_warn("failure in prefetch
>> change attr err = %s, vm =%u data=%"PRIu64"\n",
>> +
>> 	strerror(errno), vm, to_user_pointer(data));
>> +					val =
>> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
>> +					}
>> +				} else {
>> +					b = 0;
>> +					write_dword((struct test_exec_data
>> *)&data[idx], sdi_addr,
>> +						     WRITE_VALUE(&data[idx],
>> idx), &b,
>> +						     flags & ATOMIC_BATCH ?
>> true : false);
>> +						     igt_assert(b <=
>> ARRAY_SIZE(data[idx].batch));
>> +				}
>>   		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
>>   			b = 0;
>> -			write_dword(data[idx].batch, sdi_addr,
>> -				    WRITE_VALUE(&data[idx], idx), &b);
>> +			write_dword(&data[idx], sdi_addr,
>> +				    WRITE_VALUE(&data[idx], idx), &b,
>> +				    flags & ATOMIC_BATCH ? true : false);
>>   			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
>>
>>   			aligned_alloc_type = __aligned_alloc(aligned_size,
>> bo_size); @@ -1346,10 +1646,11 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   			__aligned_partial_free(&aligned_alloc_type);
>>
>>   			b = 0;
>> -			write_dword(data[next_idx].batch,
>> +			write_dword(&data[next_idx],
>>   				    to_user_pointer(next_data) +
>>   				    (char *)&data[next_idx].data - (char
>> *)data,
>> -				    WRITE_VALUE(&data[next_idx], next_idx),
>> &b);
>> +				    WRITE_VALUE(&data[next_idx], next_idx),
>> &b,
>> +				    flags & ATOMIC_BATCH ? true : false);
>>   			igt_assert(b <= ARRAY_SIZE(data[next_idx].batch));
>>   		}
>>
>> @@ -1404,9 +1705,18 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   					       exec_queues[e], &timeout);
>>   			igt_assert(err == -ETIME || err == -EIO);
>>   		} else {
>> -			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
>> -				       &data[idx].exec_sync,
>> USER_FENCE_VALUE,
>> -				       exec_queues[e], FIVE_SEC);
>> +			if (flags & PREFERRED_LOC_ATOMIC_CPU) {
>> +				int64_t timeout = QUARTER_SEC;
>> +				err = __xe_wait_ufence(fd, exec_ufence ?
>> exec_ufence :
>> +						       &data[idx].exec_sync,
>> +						       USER_FENCE_VALUE,
>> +						       exec_queues[e],
>> &timeout);
>> +				if (err)
>> +					goto cleanup;
>> +			} else
>> +				xe_wait_ufence(fd, exec_ufence ?
>> exec_ufence :
>> +					       &data[idx].exec_sync,
>> USER_FENCE_VALUE,
>> +					       exec_queues[e], FIVE_SEC);
>>   			if (flags & LOCK && !i)
>>   				munlock(data, bo_size);
>>
>> @@ -1456,17 +1766,17 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   				if (flags & FORK_READ) {
>>   					igt_fork(child, 1)
>>   						igt_assert_eq(data[idx].data,
>> -
>> READ_VALUE(&data[idx]));
>> +							      flags &
>> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
>> +READ_VALUE(&data[idx]));
>>   					if (!(flags & FORK_READ_AFTER))
>>   						igt_assert_eq(data[idx].data,
>> -
>> READ_VALUE(&data[idx]));
>> +							      flags &
>> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
>> +READ_VALUE(&data[idx]));
>>   					igt_waitchildren();
>>   					if (flags & FORK_READ_AFTER)
>>   						igt_assert_eq(data[idx].data,
>> -
>> READ_VALUE(&data[idx]));
>> +							      flags &
>> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
>> +READ_VALUE(&data[idx]));
>>   				} else {
>>   					igt_assert_eq(data[idx].data,
>> -
>> READ_VALUE(&data[idx]));
>> +						      flags & ATOMIC_BATCH ?
>> VAL_ATOMIC_EXPECTED :
>> +READ_VALUE(&data[idx]));
>>
>>   					if (flags &
>> PREFETCH_SYS_BENCHMARK) {
>>   						struct timespec tv = {};
>> @@ -1494,13 +1804,13 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   								((void *)data)
>> + j * orig_size;
>>
>>
>> 	igt_assert_eq(__data[idx].data,
>> -
>> READ_VALUE(&data[idx]));
>> +								      flags &
>> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
>> +READ_VALUE(&data[idx]));
>>   						}
>>   					}
>>   				}
>>   				if (flags & EVERY_OTHER_CHECK)
>>   					igt_assert_eq(data[prev_idx].data,
>> -
>> READ_VALUE(&data[prev_idx]));
>> +						      flags & ATOMIC_BATCH ?
>> VAL_ATOMIC_EXPECTED :
>> +READ_VALUE(&data[prev_idx]));
>>   			}
>>   		}
>>
>> @@ -1521,6 +1831,9 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   			gem_close(fd, bo);
>>   		}
>>
>> +		if (flags & MADVISE_MULTI_VMA)
>> +			data = org_data;
>> +
>>   		if (flags & NEW) {
>>   			if (flags & MMAP) {
>>   				if (flags & FREE)
>> @@ -1610,6 +1923,7 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   				 pf_count, pf_count_after);
>>   	}
>>
>> +cleanup:
>>   	if (bo) {
>>   		sync[0].addr = to_user_pointer(bind_ufence);
>>   		__xe_vm_bind_assert(fd, vm, 0,
>> @@ -1864,7 +2178,7 @@ processes(int fd, int n_exec_queues, int n_execs,
>> size_t bo_size,
>>
>>   struct section {
>>   	const char *name;
>> -	unsigned int flags;
>> +	unsigned long long flags;
>>   };
>>
>>   igt_main
>> @@ -1964,6 +2278,19 @@ igt_main
>>   		{ "malloc-mix-bo", MIX_BO_ALLOC },
>>   		{ NULL },
>>   	};
>> +	const struct section msections[] = {
>> +		{ "preffered-loc-sram-migrate-pages",
>> PREFERRED_LOC_SMEM | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
>> +		{ "preffered-loc-atomic-vram",
>> PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
>> +		{ "preffered-loc-atomic-gl", PREFERRED_LOC_ATOMIC_GL |
>> ATOMIC_BATCH },
>> +		{ "preffered-loc-atomic-cpu",
>> PREFERRED_LOC_ATOMIC_CPU | ATOMIC_BATCH },
>> +		{ "multi-vma", MADVISE_MULTI_VMA | ATOMIC_BATCH },
>> +		{ "split-vma", MADVISE_SPLIT_VMA | ATOMIC_BATCH },
>> +		{ "atomic-vma", MADVISE_ATOMIC_VMA | ATOMIC_BATCH
>> },
>> +		{ "split-vma-with-mapping", PREFETCH |
>> PREFETCH_SPLIT_VMA | ATOMIC_BATCH },
>> +		{ "range-invalidate-change-attr", PREFETCH |
>> PREFETCH_CHANGE_ATTR | ATOMIC_BATCH },
>> +		{ "no-range-invalidate-same-attr", PREFETCH |
>> PREFETCH_SAME_ATTR | ATOMIC_BATCH },
>> +		{ NULL },
>> +	};
>>   	int fd;
>>   	int num_sections;
>>
>> @@ -1983,15 +2310,22 @@ igt_main
>>   	for (const struct section *s = sections; s[num_sections].name;
>> num_sections++)
>>   		;
>>
>> -	for (int i = 0; i < num_sections * 2; i++) {
>> -		struct section *s = &sections[i % num_sections];
>> +	for (int i = 0; i < num_sections * 3; i++) {
>> +		struct section p = sections[i % num_sections];
>> +		struct section *s = &p;
>>
>> -		if (i/num_sections == 0) {
>> +		if (i/num_sections == 1) {
>>   			static char modified_name[256];
>>   			snprintf(modified_name, sizeof(modified_name),
>> "%s-preferred-loc-smem", s->name);
>>   			s->name = modified_name;
>>   			s->flags |= PREFERRED_LOC_SMEM;
>>   		}
>> +		if (i/num_sections == 2) {
>> +			static char modified_name[256];
>> +			snprintf(modified_name, sizeof(modified_name),
>> "atomic-batch-%s", s->name);
>> +			s->name = modified_name;
>> +			s->flags |= ATOMIC_BATCH;
>> +		}
>>
>>   		igt_subtest_f("once-%s", s->name)
>>   			xe_for_each_engine(fd, hwe)
>> @@ -2175,6 +2509,14 @@ igt_main
>>   			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>>   	}
>>
>> +	for (const struct section *s = msections; s->name; s++) {
>> +		igt_subtest_f("madvise-%s", s->name) {
>> +			xe_for_each_engine(fd, hwe)
>> +				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
>> +						NULL, s->flags);
>> +		}
>> +	}
>> +
>>   	igt_fixture {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
