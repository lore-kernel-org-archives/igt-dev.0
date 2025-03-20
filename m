Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBDDC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 05:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FAF10E58C;
	Thu, 20 Mar 2025 05:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxpmWFf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FEB10E58C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 05:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742448592; x=1773984592;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nljFK4Y5d6Y5J3b8mJsMQXBxeZLtWMaBR+Y76CHaTT4=;
 b=HxpmWFf2JcTTwYbZJgTEglaX8tkwOR8mbyypvMnl03rZLJitvTXuXXCO
 6HOYdlgM+Cn9Rb1MxQPZ1iTSA3IVALwOGAxI4TiO7JyUtWMXOTMv04Skv
 beeemJFzHrINQQn8C4pMa9Dzcnd3kmXKNsq86gPuxsolyNH/BWq5r5SRD
 XMGnKDnyu9nyK1oPamH+5wzgQynDTnj7X1dCA+zbfh9gnvQGBNZb8i4XM
 ojE1ke4wRoWKVNDsN9gtdiS7OtZlI+3w6IZbGM50AdcG+sVClM9shvebt
 2YJF/qnlIDWmn85HqzzwmWucWbhME5J86lafsBcIIt9qisztzMRkTpH/k Q==;
X-CSE-ConnectionGUID: ewPQeccISsGotARNpxDeXA==
X-CSE-MsgGUID: xE/hcIdPT+qCJUQbu3ybvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43677356"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="43677356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 22:29:51 -0700
X-CSE-ConnectionGUID: SarMWjqzSIqgXTIajYOzNg==
X-CSE-MsgGUID: wF5H/ac8RySNpZ3eKyl1Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="127136277"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 22:29:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 22:29:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 22:29:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 22:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzuxcuAhg/ytCga05uILFkg6Ybe+yEAF1z+O+F/mFtJWe17yev4noepAb98c2ZqD4skW/h0jRS9+ectoDBCKl9j5YxboCwZ53gPZLcZ0PAlJPRERgApNKCgY/UHzxW4u6GXNoE1tOy32u/LkBIzFALROIX2qUvPD4PySt8oMs2bxgt2Aw800+n9mYiD8cO+Do6ViNfVOvm1uzoo6EZ1GzfCtTHGP9kEr8mNiS5XfV/yV5zInz7YR1Cwn1WUuZoOYQtNFvBS9QS0NiXggmu/08qG8NysTwzImp/1pt1Gq+CBXbngZkEtoSpEunwjbzrnH97nJdX+XYpIszY/DeFVISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1W23x3nxMaQd3e3+KHPb/jDRegyooUU7VJLZcizc3M=;
 b=N7pIjaDtLYtDUpI7v1LTCGbFuIcnIP/WDu66bWNnyDEel9oY86bIrQmqa13qe5qzGAS1uvkEoV8e2E2GKN2qy+AKl82hYvCrLj0emNZevlkJkRU/1ULBbW53l8O7Fp2aMTIVXBn2tGQnXth19IFxb9XLVaDpC1EWebt4dwRT9GGku2i106nZMv/ZFDseS7BV8hWrOB1HjHe9LmeV7FxYndibUXgJBAzDSt343KeumGmnJgF2TOuU++2xAWyfNyDZhPZw4f8AYToanPKzDWMJaqZTYDuqRjPW/eC6YLE868KHaH+fkW3Utnt1RkcnhWBBNq4E/pRKoYwKNm1bSOoC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Thu, 20 Mar 2025 05:29:47 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 05:29:47 +0000
Message-ID: <08b6bedc-99c2-434f-8e4a-01444d7b639d@intel.com>
Date: Thu, 20 Mar 2025 10:59:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3, 1/2] tests/i915/pm_rc6_residency: Use sysfs to
 achieve peak frequency
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250306185944.2581304-1-sk.anirban@intel.com>
 <20250306185944.2581304-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250306185944.2581304-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0514ff-d4cd-4928-80e2-08dd67703abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE5BL0ZCaVBWR1ZsbjcwSHRWVU5VbDI4dXVtb242SEtwMnk0bm1qWWR3dFoy?=
 =?utf-8?B?a2E0SFc1d093Z2hyemczQlFMUnZXWFZDYzNMQ3RDU201MzBZKzVJWHNldTlY?=
 =?utf-8?B?R0J0NHJpYldRSGRnYmpHZUluZyt5QnZtSjJjVzNwaG1FMlRQc3ZwZ1paZGoy?=
 =?utf-8?B?TUtKeDJaMm1MK0F5dXpZcjFWdkdCOWRxcUQ1eHhUemxwT3JoRzRseVdQRU4v?=
 =?utf-8?B?Vld4aVZEdlBhOWU5SzVyRXQ1UTlSelpXREtkVEs1SjM1cWNld1ZjRUZINmxw?=
 =?utf-8?B?cXlnUHpvZzJ3a21NQUd4dlZnWTg2NzNraXhINy81Y0J4YVh5OHI2Nnh4VVdy?=
 =?utf-8?B?Wit3VmFCMC9UaURUaUNpeGM3N1c3L2RrTFZwdFpmdW1HNDhERk9RdDRrR3Bv?=
 =?utf-8?B?eXdRdldhQlRpOXdOU0V1dkhvZGFGU0IyQnMyQldtZUt4eU9nUUEwZ2hNR0dw?=
 =?utf-8?B?enlaa3JWSTlsSkcwaEV3Qkh0c2V4UjFKcjlGb2JNd09wd0szTmFkeSswbUlw?=
 =?utf-8?B?Y2VpekZvOVNJQ3d3ckpGVXMwci9wNEZrcmRmWkt4TWREQTNXYm1qS2FCUDdp?=
 =?utf-8?B?MklMQXVZT28vQ3M5R3NYZUlyNFBHU0FCRjBWc1MyRnJMV09lWWl0S3hZUFFk?=
 =?utf-8?B?OFRpQTRQeXhiRFl1ak14OGtwZ25YMGNLdXZMNkhEcTYwQU9FTmpFRlcySUIw?=
 =?utf-8?B?YWJMSnNMTmM3cTVocnpmbVR1dTNVY1RxV2FSUnZSL2lGL0tBV004L3YwNmlK?=
 =?utf-8?B?UFJFclVSNThsSVYwRzRPMG9kblovdzRCM2d5ZEpQOEwrZHNVeW1RMDBSeFdC?=
 =?utf-8?B?ZU0yckg2Q3JURTJJUmM1cTJQejdlcWhUcVJOWG5PRzdVL1lZTlhqcEliQVVm?=
 =?utf-8?B?TUZJdlIvMWkvUm0zR3JwbFBldi84NE40SUpzMTZ1aXBYbi8yT3R4T0VKT0Ux?=
 =?utf-8?B?ejMyajRTTm1sSm1QYnpwTWRBRVZTelJQZnB0U21tVEFDWWR1bkd6SGpOZVpG?=
 =?utf-8?B?OTZqek5vR01XcU9nRk00UFk0bWhVQW1wMjd0bHR2blpkMWFjZVFPTlNUWTFN?=
 =?utf-8?B?cThPNVE0cE5oMEU1OWlwYTJsL1FrWGhLUjI3M1M4WlE3cjBoTjNjT01GZGRu?=
 =?utf-8?B?cnY1RXlUcGd6TlVvbkQrYjdoWllvaCszYXdGZUR4d09GMW4wcUF0VWRIVWFa?=
 =?utf-8?B?SllBRFdXd05QK3J2bURYNnUwdFZkMVpoanRVbFVFb2cxUitRaGREOGtQOWd0?=
 =?utf-8?B?dEZjcitHb1h1UEdoeVhZRXEwK1JzdHA4TkhkMmFvUHJ3d25jOU0wNzVNSU5N?=
 =?utf-8?B?N1gwTHBNcUF1WWVBMW53MHpQTzBKM24yK0w4Y2sxdWlLRlRoNmpvUzRVdU83?=
 =?utf-8?B?UVRneUo3eHdkQnVDbzZGL1hCdXFrc0lrSjhyZDJ0bnZ2VXZDMmoyZEJrMGhW?=
 =?utf-8?B?REp3cWplMmR4cjZ3Vm1WUmpzZW9uSUNuN3lqOVFjNGM1VWgxQzM0NzdtQ0x1?=
 =?utf-8?B?azlUT2VwQXdFT2dHMWZpTzhESVNwMzdSaVJxZ1d4SUFEcm52ZkFVdTVHSDRo?=
 =?utf-8?B?U1E1TkJFYSt6TENodXF3eVcrdGdjbUJTQnkrNlB4R1NCaVdCVSs1a3RqY0JP?=
 =?utf-8?B?UjJnckNEcmkwNWQwNWJFNXZ0czZYSWZ5RlE0dmpJR1FuckN2dHJHb2JOS0Zy?=
 =?utf-8?B?bnhzcVhjcnFmVi9RTjNFVEhZWDh5Z0ZHeGNXNmxmUkNJRFFyVSs4NHZGY05h?=
 =?utf-8?B?NlR5WE5td2F4Rnh1aWpVQWQydjVZM0VpNFJqTHdaSEQraUphUW4xQXdNTGo0?=
 =?utf-8?B?TmVaMUJPTzFJQ0Z0My80UmdtZ08wKzhWZFBHblNhenNkOG9CQ05odTJNYWxC?=
 =?utf-8?Q?7Zi0dYLg/xOq5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVZYm1NS0RlTTRXcHRRR2ExVXg1TVVoUERtZ0ZVRXFyWHNoelZFK0Vxd3Zr?=
 =?utf-8?B?ejZ5N0dOTVpJeTBUdVBsSUphNlNWNnJkNUF4NXVtR1Nqd0dGMTZmSzZ2SzBX?=
 =?utf-8?B?b1M1ZDlXNGc1RnlNQjN2VjNOUVNKZE1uaWEycG9nVXV3N1JRY3NjdC9ZNlI1?=
 =?utf-8?B?SzNqbWZxZXhzS0d1QW9JM0c1ZTQ0L0ZZUFJzVmFJRTNsQVIveUMzcWs1bUFU?=
 =?utf-8?B?dVlBMG52d2x3NDRCaHJ4ZGt1TDBJL1NCWnc4alRNaUJKODQreE1yblJ3NGg0?=
 =?utf-8?B?NG5WbjdVYnJUeU9qSURFRTNzc1FzSEwyZmF1UTQzOEZGMlVITi9DejlXL0FD?=
 =?utf-8?B?YVQ1aE9Rc3Fwa0lraU5DN3BsRGNxUWlBazc0U3RIZ2YxSGpkMTFjVTZKWEM4?=
 =?utf-8?B?L2VTVm85OTNmMFBBSjJoMm8xZFNlL0ZEM3l2Sm1Sbm1ZWHZyYitobkM2MDMr?=
 =?utf-8?B?Q0tCWlNlb0hxVFhMclVmM2sxRlhzU3ozcGdoU01mUVlyQk5XRklNdzBsWjRu?=
 =?utf-8?B?Q1pVT0lUcUZEeHoyeDRLYUtSNldPYVhidS9aVTFUTEV2KzJkbGVrOWgxQllU?=
 =?utf-8?B?VlRHdnRXZllqRWxsU2FwUUpFZ0RKRzk5UXBzNVZ6VkFTUTBhR0cwZ3NscjJj?=
 =?utf-8?B?dFFKYitNRSsvSlo1YmE2U3hWaVdIeG12MEVZZ2U2VlcyS0h2dnB1QjRpU3A3?=
 =?utf-8?B?NHZKSW9wdTFWVGpVM3VCVC9TWjJWQ1FTMmZ4b20wT1IvRTRMSGY2eDlDSXNy?=
 =?utf-8?B?R1JDYjlUNWpaQVEvNnNTRG1vTlFLbXdQWjlYMHIrdXdXdG12dHRuY25vdDJu?=
 =?utf-8?B?UWJvUFF4Y0VMUzJ1N3FnTllPRzlMV0RrZEswTXdlOUw0Y2xwOEhFb2xiSjJv?=
 =?utf-8?B?bDJJM1ZDQ05QMy8xa1Nxa1Fiakx5c3Z1YVlobEpzRGs1VXVPZEVsYVNXS0NL?=
 =?utf-8?B?WSszWFRCU1BTRi85U2grOHBXaWlhSFU3Q1A2Y2M2aU11eXcyL2g0T1B6a3dK?=
 =?utf-8?B?bzRpKzRhbEw4YnJQdS9jWXM0TGtxZjV5VGZXZ2RiREhTTngrSXl1R00zRk5m?=
 =?utf-8?B?M1hoSXdBZS8wYy9Fa1A3dXNsd1N3aTZMMXhXVDc4dmR1bGFlWWlhNDlrYnJi?=
 =?utf-8?B?RUpUOUliVk9JQjVXYTl3WW04MlNRbHZhdjZuVXIwSTlBckNuZ1B4cGhCVElB?=
 =?utf-8?B?QVJyTVhuRkRZUVdVMDJzUTdnQVVPMnFWWnkya2VVMTZQcFNoMFZoeDhYNXMy?=
 =?utf-8?B?Y1dCYVJzN1BLZHJDcnRvemVmQWlXVWNSRk92VEUyRi95T3Q4SjUrZk5PSGVO?=
 =?utf-8?B?aDZDYXhLTjFGekIxbzBHQUg5Z0pGSGhtbUYxSjFxYnpPNlRNTHgrUjEvTjRL?=
 =?utf-8?B?NHVsaGxrRjJCcmdwNVgrcU9Jdk8yOHFkSVNGK1NxM1lFUHJSOWFpc3crc1pU?=
 =?utf-8?B?TVV1eXR5ZFU1Z2dqbnZGVTlSSFovand2T1FhYno4WHZMTDZtVDU3ZTFkS2VG?=
 =?utf-8?B?em9FOC9LU0lyMWdITlI2eEQ3K25QWWlSNkUyOUc4aGh4OXFJaHlXd3R0b0Jv?=
 =?utf-8?B?Q2RwMC96Q2dJZHRtMmZyT0NEbndBSFhQSXE0c1R2dUZibG9MckR4NDZwSW14?=
 =?utf-8?B?QW01VFUraUx5Y3AyaElBcUNqNUhieTZuL3AvSTlXNVF4WkNiNHdaT29Zdk5y?=
 =?utf-8?B?SDI1YlE5VENlMkF0R1BUNEVqZnhnYk80cTRBN0JHWkhkaFgxL1VOdFpRY0c5?=
 =?utf-8?B?cXZ0aEFnck93aVJnUlhCaG4rbjdZbDlpWnV5M2RJdnI3emFpaFFSZXZYYUZS?=
 =?utf-8?B?TVN6Z2ZwNEltVGJ5di9namJDWENTck1HM0pYU3VvVjF4UUdCUUxQRml3VkZR?=
 =?utf-8?B?VGpRZ1VEUHl1Ynp3clBCYlZHS0g5TDZ2VHVkV1MvL2h1UjY2OGczVGxoK3lx?=
 =?utf-8?B?cDBLcm1VRHFQR2gzZzBsZzBQZ2tVQ3JUb2lMRWJHVXBydGVyQXhiSGU5d3A3?=
 =?utf-8?B?cVIvT2YxTlhlUUV4VGlRMmFQRVYzSWM3ejMwdDBtT3M2cnV3T2dnc005cVB3?=
 =?utf-8?B?QllwVkwxdERVK01EVDNQdEUraTZhd1BXZDQweGNUTjMyRlJrS0ZheGJ4UEJu?=
 =?utf-8?Q?PP9wXqKiibCs0EOs5Hr6I5T+g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0514ff-d4cd-4928-80e2-08dd67703abd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 05:29:47.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLjzNpa9yYqAysQkk+Z3gLcniac8BDWvVUR1wSPEwJQPBvHiy369u+D5+vvgSQQLj55MvmdR/pQ1PNvD/2QNyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
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

Hi Anirban

On 3/7/2025 12:29 AM, Sk Anirban wrote:
> Leverage IGT spinner to trigger frequency scaling and
> set RPS minimum frequency to RP0 for achieving peak frequency.
> This method replaces the existing waitboost mechanism used
> to reach maximum frequency.
Can you specify the reason for the change? How is it helping the test?

> 
> v2:
>   - Disable power consumption check for dgfx
> 
> v3:
>   - Implement igt exit handler
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rc6_residency.c | 127 +++++++++++++++++++---------
>   1 file changed, 88 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index c9128481d..7d31e2cc0 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>   	return false;
>   }
>   
> -static uint32_t batch_create(int fd)
> -{
> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
> -	uint32_t handle;
> -
> -	handle = gem_create(fd, 4096);
> -	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> -
> -	return handle;
> -}
> -
>   static int open_pmu(int i915, uint64_t config)
>   {
>   	int fd;
> @@ -286,45 +275,85 @@ static int open_pmu(int i915, uint64_t config)
>   	return fd;
>   }
>   
> -#define WAITBOOST 0x1
> +#define FREQUENT_BOOST 0x1
FREQUENT ?>   #define ONCE 0x2
>   
>   static void sighandler(int sig)
>   {
>   }
>   
> -static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
> +static uint32_t get_freq(int dirfd, uint8_t id)
> +{
> +	uint32_t val;
> +
> +	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
> +
> +	return val;
> +}
> +
> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
> +{
> +	return igt_sysfs_rps_printf(dirfd, id, "%u", val);
> +}
> +
> +uint32_t *stash_min;
> +
> +static void restore_freq(int sig)
> +{
> +	int i915 = -1;
> +	int gt_num;
> +	int dirfd;
> +
> +	i915 = drm_open_driver(DRIVER_INTEL);
Why reopen again? Doesn't it exist when exit handler is called?> + 
for_each_sysfs_gt_dirfd(i915, dirfd, gt_num) {
> +		igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt_num]));
> +	}
> +	close(dirfd);
unnecessary for_each_sysfs_gt_dirfd is already doing that> +}
> +
> +static void bg_load(int i915, const intel_ctx_t *ctx, int dirfd, uint64_t engine_flags,
> +		    unsigned int flags, unsigned long *ctl, unsigned int gt)
>   {
>   	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
> -	struct drm_i915_gem_exec_object2 obj = {
> -		.handle = batch_create(i915),
> -	};
> -	struct drm_i915_gem_execbuffer2 execbuf = {
> -		.buffers_ptr = to_user_pointer(&obj),
> -		.buffer_count = 1,
> -		.flags = engine_flags,
> -		.rsvd1 = ctx_id,
> -	};
>   	struct sigaction act = {
>   		.sa_handler = sighandler
>   	};
> +	int64_t timeout = 1;
> +	uint64_t ahnd;
> +	int rp0;
>   
> +	ahnd = get_reloc_ahnd(i915, ctx->id);
> +	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>   	sigaction(SIGINT, &act, NULL);
>   	do {
>   		uint64_t submit, wait, elapsed;
>   		struct timespec tv = {};
> +		igt_spin_t *spin;
>   
>   		igt_nsec_elapsed(&tv);
> -
> -		gem_execbuf(i915, &execbuf);
> +		spin = igt_spin_new(i915,
> +				    .ahnd = ahnd,
> +				    .ctx = ctx,
> +				    .engine = engine_flags);
>   		submit = igt_nsec_elapsed(&tv);
> -		if (flags & WAITBOOST) {
> -			gem_sync(i915, obj.handle);
> +		if (flags & FREQUENT_BOOST) {
> +			/* Set MIN freq to RP0 to achieve the peak freq */
> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			gem_wait(i915, spin->handle, &timeout);
> +
> +			/* Restore the MIN freq back to default */
> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>   			if (flags & ONCE)
> -				flags &= ~WAITBOOST;
> +				flags &= ~FREQUENT_BOOST;
>   		} else  {
> -			while (gem_bo_busy(i915, obj.handle))
> -				usleep(0);
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>   		}
>   		wait = igt_nsec_elapsed(&tv);
>   
> @@ -350,6 +379,7 @@ static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned i
>   		/* aim for ~1% busy */
>   		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>   	} while (!READ_ONCE(*ctl));
> +	put_ahnd(ahnd);
>   }
>   
>   static void kill_children(int sig)
> @@ -361,25 +391,29 @@ static void kill_children(int sig)
>   	signal(sig, old);
>   }
>   
> -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
> +static void rc6_idle(int i915, const intel_ctx_t *ctx, uint64_t flags, unsigned int gt)
>   {
> -	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
> +	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>   	const int tolerance = 20; /* Some RC6 is better than none! */
>   	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
> +	int num_gts = igt_sysfs_get_num_gt(i915);
>   	struct {
>   		const char *name;
>   		unsigned int flags;
>   		double power;
>   	} phases[] = {
> +		{ "once", FREQUENT_BOOST | ONCE },
>   		{ "normal", 0 },
> -		{ "boost", WAITBOOST },
> -		{ "once", WAITBOOST | ONCE },
> +		{ "boost", FREQUENT_BOOST }
>   	};
> +	int dirfd = igt_sysfs_gt_open(i915, gt);
>   	struct power_sample sample[2];
>   	unsigned long slept, cycles;
>   	unsigned long *done;
>   	uint64_t rc6, ts[2];
>   	struct igt_power gpu;
> +	int sysfs_dirfd;
> +	int gt_num;
>   	int fd;
>   
>   	fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
> @@ -409,10 +443,16 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   
>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   
> +	stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> +	for_each_sysfs_gt_dirfd(i915, sysfs_dirfd, gt_num) {
> +		stash_min[gt_num] = get_freq(sysfs_dirfd, RPS_MIN_FREQ_MHZ);
> +		igt_pm_ignore_slpc_efficient_freq(i915, sysfs_dirfd, true);
> +	}
> +
>   	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>   		memset(done, 0, 2 * sizeof(*done));
>   		igt_fork(child, 1) /* Setup up a very light load */
> -			bg_load(i915, ctx_id, flags, phases[p].flags, done);
> +			bg_load(i915, ctx, dirfd, flags, phases[p].flags, done, gt);
>   
>   		igt_power_get_energy(&gpu, &sample[0]);
>   		cycles = -READ_ONCE(done[1]);
> @@ -451,15 +491,17 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   
>   	munmap(done, 4096);
>   	close(fd);
> +	close(dirfd);
> +	close(sysfs_dirfd);
>   
>   	igt_power_close(&gpu);
>   
> -	if (phases[1].power - phases[0].power > 10) {
> -		igt_assert_f(2 * phases[2].power - phases[0].power <= phases[1].power,
> +	if (phases[2].power - phases[1].power > 20 && !gt && !gem_has_lmem(i915)) {
Why 20%? and why gt check?
> +		igt_assert_f(2 * phases[0].power - phases[1].power <= phases[2].power,
>   			     "Exceeded energy expectations for single busy wait load\n"
>   			     "Used %.1fmW, min %.1fmW, max %.1fmW, expected less than %.1fmW\n",
> -			     phases[2].power, phases[0].power, phases[1].power,
> -			     phases[0].power + (phases[1].power - phases[0].power) / 2);
> +			     phases[0].power, phases[1].power, phases[2].power,
> +			     phases[1].power + (phases[2].power - phases[1].power) / 2);
>   	}
>   }
>   
> @@ -577,6 +619,8 @@ igt_main
>   	/* Use drm_open_driver to verify device existence */
>   	igt_fixture {
>   		i915 = drm_open_driver(DRIVER_INTEL);
> +		intel_allocator_multiprocess_start();
> +		igt_install_exit_handler(restore_freq);
>   	}
>   
>   	igt_subtest_with_dynamic("rc6-idle") {
> @@ -590,13 +634,18 @@ igt_main
>   			for_each_ctx_engine(i915, ctx, e) {
>   				if (e->instance == 0) {
>   					igt_dynamic_f("gt%u-%s", gt, e->name)
> -						rc6_idle(i915, ctx->id, e->flags, gt);
> +						rc6_idle(i915, ctx, e->flags, gt);
>   				}
>   			}
>   			intel_ctx_destroy(i915, ctx);
>   		}
>   	}
>   
> +	igt_fixture
> +	{
> +		intel_allocator_multiprocess_stop();
> +	}
unnecessary {}

Thanks
Riana > +
>   	igt_subtest_with_dynamic("rc6-fence") {
>   		igt_require_gem(i915);
>   		gem_quiescent_gpu(i915);

