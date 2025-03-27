Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3082C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 18:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A47410E044;
	Thu, 27 Mar 2025 18:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnwTHW9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB37D10E044
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 18:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743101314; x=1774637314;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=HUq9iQ0btiAqjGkXwEkIhR2l23IJH5QNyBF7D8Acjls=;
 b=dnwTHW9ZVwOKTiMprpq6DTeE24/KF4jMHPOi2jxXOYYNVZ5+aDoKL9mj
 B/UvON3zBtG9EWHr3f9V71Cee2mmlMja9/6MOcajAgPsoYcxAu7+XbEab
 0bJCJplJ6quf9Y2oqqh8p7NJo4B09UgW5MdqTdmpI97jxc4bDXFAFzdZJ
 REgrtVHc6UeYFrmorVo7FN8rLiShfmnDruMYtnrYP8j267AKK+8qYU9g5
 s4R2rU042GUrRIm63P5eMaqC3WH6/yqDe4EZ5VFM6WL6gm2P9l/YcxZzc
 wdCObchNxMgSoxiLukUHttqL1qRtEQMoPoEHPMr0Tz0Jf8Ja21FJI1zsS Q==;
X-CSE-ConnectionGUID: KGWSZ3iST/WbrK+VlTMmXg==
X-CSE-MsgGUID: 3RTBUZoiS9Sqn8OVuCh3tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44342259"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44342259"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 11:48:32 -0700
X-CSE-ConnectionGUID: AP95YuFNTNueQlvXkhs14w==
X-CSE-MsgGUID: h95hqe00QkqOCYghWOP03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="156225753"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 11:48:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 11:48:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 11:48:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 11:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkG27qT+ldAfV0O/AzN+7gP3x462quOy2Za+cH/pEmOyFx766MZ+1xKYCSsyUHtdTDZXaMJV08imiuk34gnCHP2ohdh3OoDRbMZlF35vmVkJxaojBUtZ/Q3YLW/IkghIym+VAdJVrrQk2D12648zbpjKqqPwtTnqwaWnynefq0814Xyie1yb6ZYIyxPkGM85/3x0x6tzHF5qE1sqTeBO9+crdX0wpL4eYxKn52yp1H5OYFsNuTCpBz85COTCTIPqTuqehA6oNNZbwcHjMzVoSSkukQJaz0nvA2YDU8X5tKJpPXMGQJJAZi4vehzAOsD0Q6R/aDr8f6qJCTTs5gNM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65bE6JuTx+qwUbcrGkCnjfyn9fJ9oGT9YyjqoqY/JT8=;
 b=NYrCVgM4a0V6wB2nWqE6MoHcDEsRF38nkjQBh8B9S5DKkRuxQo3ZBvkEGX9nClLvQS+FCZgq78JDR78V3BCcDWeY/Mgv9JoYRF6Rby/XLfPCsVtGV2L4xYnJx7zZeDzH6GkkmgmKIRNiDU7qKIcGpmrJ26Qh9G0H+EUFc3M1mAmsmxavFQA/Shx34UDvP8Xaiq4jzo6svwDLvU8qQVJmyV2G0n4how32yA3Dvd6DvSSbtm7oZ7rwb7/P/W8Fzyjkz5dp193EgDgvWDszvnBNVivNSXXph2tB7ply98jN2TYva/+1HE8HIQhT9Gsw+r7LxtJjd8Uznknjv4nMO+IXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 18:48:29 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 18:48:28 +0000
Date: Thu, 27 Mar 2025 11:48:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lure?= for
 tests/intel/xe_oa: Print oa_status value in the helper
Message-ID: <Z+Wdeksxw2RjF6bF@soc-5CG1426VCC.clients.intel.com>
References: <20250326221729.884253-1-umesh.nerlige.ramappa@intel.com>
 <174303689612.9111.5084313516886304936@e6b6f09ec485>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <174303689612.9111.5084313516886304936@e6b6f09ec485>
X-ClientProxiedBy: MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::30) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b7dddc-3f3c-401a-0fb9-08dd6d5ff6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkRhYVlWOTNaajUrNmZUV0lpbDA0em4rdHc1eTJnMUxQdmpDczJJdk5pUWVW?=
 =?utf-8?B?ZG5nMzgrb1BrNFAwejc0N3FDdmxEdEk0V1hOelNOckZiSlpvdjVVbUFrRVR0?=
 =?utf-8?B?SXRtcFdtajJ1d0pPTWRzTTNOSHl6eGlQT1U3YzhsUWhOamVCbEdZYjhQRWhH?=
 =?utf-8?B?Z0xpaDZYZ1U1M0hia1RvVytreUZ1SGZCM04rWW1JbWF3bGRRK0szQjlYVkd3?=
 =?utf-8?B?dnZNUExtM0JHSzJpY0IwZ1pLOTRFYVJGRVRsSTMvWjJlQjc2SDBJeTV1MHFE?=
 =?utf-8?B?c0laazl4SVdkakpacXJtVzNleW85N3FaUEhvZnh6WFJCL3pkSk1Lc0FHUHdL?=
 =?utf-8?B?OXA5VDJiY09UdkpFKzBsS1R0dFlVRG1lcm5lc0YwTUtPbGM4dk5YazBYdHBI?=
 =?utf-8?B?Zk1NYWcySUhabWZSd2h6STBHNEFqcGhieGlqWVd6VWtXaVdBOFIxZ04xWGpp?=
 =?utf-8?B?ZUdtd0t3QTNmYWNuT0dLSUtMTG9KS3MwNDU5eHNNQnBLeHJBY2g2QWxsNUVy?=
 =?utf-8?B?YXJQSjZMSWJmSjZDdFB2b3JtaURsd1ZYdnJQcndzeXZCVWZvdVhpL21qL2VY?=
 =?utf-8?B?YTBhL2tDellKOFRFdDNZTGNHTEFpM3Z3Ry9uSVBCWU9YTFJWUVIraE50dkkz?=
 =?utf-8?B?NTNQbjB6VlBvVWJMOURIUng2Rm9KQzN4cFE3SlVERlpWcU9TYTNDdEFaR01p?=
 =?utf-8?B?UzBrM0V5VTE1MWZBSG44d05aTTluWlIxL2wxMEhwbUhYSmp3UFN2MGZQaFF4?=
 =?utf-8?B?THVVckU0dFZtQ0pTdmZCbGpEVThSNEJEZWdtN0JIdE1uY2xUZWxpdnVtMUZv?=
 =?utf-8?B?RGc4YTRQL0txNFhHQzE1a1RkME0raHIrMDZqYmZ6SE02N3BiQ3Y1MVpydnkx?=
 =?utf-8?B?ZzBqWEhXcEVlTzJsV0lKOWNJWHpOcDJNaFgxaWVRMjdMSFBBendyQlZhNjM2?=
 =?utf-8?B?L2pIY2lUbjdmQSs5NjVwdGxacFhMNHliUGw0OXdvUm8wNUx3TU9vQlRtQ0V0?=
 =?utf-8?B?TWVOSlFnWEhPSzFZSSt6SGpnOVIrakV4c3E4MmxNUzJYeUtSclk0Wk9TbFN0?=
 =?utf-8?B?dGtCckVGUFpTR2tsVUhxSlEwYk04MFp6VXNGTm03UjVLRkJkZTRUQitEbFVF?=
 =?utf-8?B?SmM2dDNOZmVmOTZxcFFCUytNRVIxVGdadldnS1lrMWFGV0ZzdHFONDlrTlk3?=
 =?utf-8?B?a2pkclgxS0ZsZlc5TVZQcFBtUXM1NVBocVlNMkVZL1dQOTRUTk1KY1Z5RWo4?=
 =?utf-8?B?U3pYb3B5bW8rMm5xMG1xb3NVUnhNSkNNS0I2SXVKblJxUlgwS3laYTJ3VU5K?=
 =?utf-8?B?enk5SjdSVW01UnoxdzQxR2FnVEJVd1BRWEhNL1hnaVNEbnVVRVl0eXByV01H?=
 =?utf-8?B?MDRzdi9IMmNNM3JUKzFhZm9FRjYzNUowOUFybXpndnhnSVpSS3NvZzVsaFFV?=
 =?utf-8?B?THFMK1RaSzBKMVNGRTV1OVNRVzRaOFJhdEVzcmlTSUo0TkhCQXVzcHlIRDQr?=
 =?utf-8?B?QVpud0tmK2E5OE53UnQzNzVTSE5sMDVub3RoaGV1Zk92eXFEZ2NiazUrQi9o?=
 =?utf-8?B?bmxkRTJoaG1nV0ZseS9jOGdtTEVYSHhOMWJPbTRjMWlSR3I1NS82OGNiK0JI?=
 =?utf-8?B?bVlKYnR1NEt3NzIxOGxPanJ3VEgwckZBL2FHNVJIbGNZaWlORHJHRGw5aUlB?=
 =?utf-8?B?YWJsSVJIUUZMdDVXMFpWa3hmMGRueG5vazBCb0t2bjU3N0lFM3RnRUY0WU95?=
 =?utf-8?B?bkFobXRhQWNUUnpYWmI2OVFDQ09OcjZuNGxTVjRhdlVMamdOdmRJR1FRemJU?=
 =?utf-8?Q?aObuAOAuGvyZslgvdTsUIkfCYkxc7imaNbYR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzdEc3dmMEk4UG9MR1ZlcVZrREJEWmdFRk9lelhCWHlJb2ZNOXFTUCtkbGtu?=
 =?utf-8?B?U2g3Z3FBR1JIeGZIVlBwWWJ0SEhGY3d1eXJRQUNWdGxmNnZjK2kvYjJXcTFl?=
 =?utf-8?B?S0VSbm1DblAwU0orcThjNENGOGQvQURRQkh2bms5TkVSZmRQS0U2dXljUHlE?=
 =?utf-8?B?RzArdldrVGJtVGlFWWFHR2hFTkYva2NTSlo5azBwWXV3cFpiQ2p3d3ZpUkxH?=
 =?utf-8?B?OGJJNFliYlBnTHFxbGtuVWNzdWYwKzJWUjNQNUNnbGJMUDVObVZNdHlmRkgy?=
 =?utf-8?B?MklvQXlNRndYK1hrdkxkVWVWaVVOMkZQSTcrVmZwU0xLNFd5eXRMOUhaV0tp?=
 =?utf-8?B?dElCOS9PamRoc1lPclh2ZjZFYUdkVmFHYnEzYUZlYVc1U2Zlb0thS2NNV3Ex?=
 =?utf-8?B?aFRnOExwV3JZRk9SZVpFZnRhcU5Pc0pUTlJxY0xiWmxFUGZraHd2VncvNVVt?=
 =?utf-8?B?OEw5V2M5dU5mcU5WNkZYVjltdUE2dUc2UTFwSExMSldTMDlWRExacVU5WWw5?=
 =?utf-8?B?azNTZUZXb0ZlQ3Y5ZnJHcTVZenY0VEZkT04wYWFwOWRGWWpvT1IyM3FOeUlE?=
 =?utf-8?B?UjZ2M0tMVWgveHNMaWZha1RxdStTM0ZZZUhoVjVlNGVUQmJWd05iNEUzd2Jw?=
 =?utf-8?B?MkExcEF3d2lrSlhoMDFVMk5MS3NKek1tclNvbzNZOS93TldRdWp6b1lnSW9J?=
 =?utf-8?B?Z2lyUklaa2w1SHNJUlFEaXN3M292azBoS1Q1eXZ5K0gwSTVKWERvT2oyM1o2?=
 =?utf-8?B?M242WW40OWpGWTZkdkpUVkRyc3ZYVk5kOFovenk0Q2Y2bEtuVHZjUEM1akFu?=
 =?utf-8?B?NWY0MU5EbjdjbDg1MGlUZGtETFdmTExqZlE2dTNsem43UUlLRzJac0RSV3M5?=
 =?utf-8?B?Q1NjaUpJZ0dBWGlhYitSUWJiTzRKTnlKSWVVdjBTMjFRZ0dOeUZNaXVrb2Ex?=
 =?utf-8?B?M0kxYjNyb29wSlJxN0djbGFUVFV4OTF3TzNZeWFrUU96V1llcHlsMnVBS25P?=
 =?utf-8?B?cjhiT2FMMGZHN0VUNytlbGk1ZytVc3UwVXMxRStpdVBrYVRNZzdqSWtEK0hU?=
 =?utf-8?B?TVV2RjlUNHE5Vy9pVXlPT3NGeDJtTVQ3NDZrSDg5U2ZrTDRXUHkrNHpudHBa?=
 =?utf-8?B?TCt3QjdycDVyb3NzSFQ4aGlacFBEM1J3NTRseXdvRHdaWStQaEl3dVVQOUhW?=
 =?utf-8?B?UHQrcWc3d2dEY25PS3FCYld3VjNJLzVFc0RkOXc5VnJJeEx4bG52RXFFMXBR?=
 =?utf-8?B?R0c2OTFva09HbUxLb1VaZVdqcUxDUnVLcm1xWDE4VVlyN3RCa1lNWTB1aTQw?=
 =?utf-8?B?dyt5S3hHS09VS1JrWGUwTmVYSWQ5TEI0Ukh1L1FYNFZHTHB4aFl6ckZnM1dO?=
 =?utf-8?B?NGZLNmNEeXlaUTNhSlVhOFdqeUNaNTU0V3JVOWRuWjYzMkF2dE4rUlIxYW1a?=
 =?utf-8?B?Yk1uS1JVdXE4ZjFHeGJkZy9nWFZZS3M1M3VJOEo1S3hpWCtqRWdVZTA4S1NH?=
 =?utf-8?B?dHFzd3NueGdPSDdNT2R2VGUybUpxdjVVMUl1dlcxUTFURWozRXM0MzRsbEpk?=
 =?utf-8?B?Zm1OaXNqU1FRSGtpaUVSZGIxTjQ2QWxXMCszM0RtdGVZOXNnMitsUGYzb0VC?=
 =?utf-8?B?eDlRRmJtbkRxNmVWT0JkQXhobHc3Qk9LQzNoOXZaL2FpeXhvVko2QmRWekZ1?=
 =?utf-8?B?NVFjdXhxWGZBMGJibisvcmxPV3p0U2lZaHV3NzFmQkI3dGRaaU1qV2R4U0cz?=
 =?utf-8?B?UnFtVDltNFFLQzRXYmJhTnN2ejduTGJVNitsQzRxejFoMmxBWnpvVEFGZk1H?=
 =?utf-8?B?RFRlVXZTWVlWeU9MTlN3YnVsV2NlelNHRnFTUkh0cG1iSDZDbDhTeCtXVldQ?=
 =?utf-8?B?a2hqYTRWSERWTWtIZlhtM2RjbzNTVkdaaTBOV3NBMGRMTUZVZmxDc1V5TC92?=
 =?utf-8?B?M3VGYXI2UzR6OXVuMUNFUFJBZGd3Q2k3VlNMV2VQV2V1VlVQb09LdlBTdzNt?=
 =?utf-8?B?MGY3OXpkNHVnam84TGlaRG9jc1h4a3FGMVVFVUhUNUJ0Nlk2QmVURDMrNXRx?=
 =?utf-8?B?UVo5d2crbnFYbk16VlBEUHczOWFNbzRSTmNWRlpFb2pTUTJZYjFaSy9HaGhS?=
 =?utf-8?B?WFQ0bmNiZENuQkJZTm8yYnlUZThxMUhBcGZWN2NTMmxUOE0vYUIvUXdIUm5x?=
 =?utf-8?Q?nbCkjnAXAiFWVL0OP0QMwW0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b7dddc-3f3c-401a-0fb9-08dd6d5ff6d6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 18:48:28.9127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruydxvDgr/uszXcajkLtZlWhIQ7G+DHlyscOWd7+oED49ltKP/YJo2h54NfOUxswjasMzKz5b1oVOM9/94LxXMkVaJ4SBXhH7xWBlCOVIr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
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

On Thu, Mar 27, 2025 at 12:54:56AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  tests/intel/xe_oa: Print oa_status value in the helper          
>   URL:     https://patchwork.freedesktop.org/series/146829/                
>   State:   failure                                                         
>   Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12847/index.html 
>
>          CI Bug Log - changes from IGT_8288_full -> IGTPW_12847_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with IGTPW_12847_full absolutely need to be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12847_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>   External URL:
>   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12847/index.html
>
>Participating hosts (10 -> 10)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   IGTPW_12847_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@gem_workarounds@suspend-resume-fd:
>
>          * shard-glk: NOTRUN -> INCOMPLETE
>     * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>          * shard-rkl: NOTRUN -> FAIL
>     * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
>
>          * shard-rkl: NOTRUN -> INCOMPLETE
>     * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>
>          * shard-rkl: PASS -> INCOMPLETE +1 other test incomplete
>     * igt@kms_plane_multiple@2x-tiling-4:
>
>          * shard-dg2: NOTRUN -> SKIP +1 other test skip
>     * igt@kms_plane_multiple@2x-tiling-x:
>
>          * shard-dg2-9: NOTRUN -> SKIP
>          * shard-tglu-1: NOTRUN -> SKIP
>     * igt@kms_plane_multiple@2x-tiling-y:
>
>          * shard-rkl: NOTRUN -> SKIP +2 other tests skip
>     * igt@kms_plane_multiple@2x-tiling-yf:
>
>          * shard-tglu: NOTRUN -> SKIP

Unrelated since the patch here only modifies xe_oa test.

Umesh
>
>New tests
>
