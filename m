Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B4EC28B23
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 19:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622D310EC40;
	Fri,  7 Mar 2025 19:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7fEEHHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CAE10EC42
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 19:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741376936; x=1772912936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WL0PeNm1uZNuHAHRtOi402+BnscJLVdbrXARdtNmdNA=;
 b=L7fEEHHF7Tfq+hqHQpR1XAUxlAOsF8CwySbRJ3dLPi93D8gXrAjIllxW
 zLAXzXhq+QTKRupH31NAtIDU7rUQOySJH0DBChM0D64WE6C8rlBttT7VK
 MBy0C6LSSfT1HblASRTXoDxVUksWQ0oLXJj2rHtf9jyhIMN3BBag+pese
 4i9Hsk2+KDNFKCMy12QfUxFcZf/48fA1DwfWodbtD+t4yN5JIbJTjLB5a
 /uU6BH+CDMlhroK0lExoD9PieEI8SsZtZr4CYJBJadaZ3HpqB15ogoiAb
 6r0P8jD89RoyCwWhYnVDs09fQ74L0CoaKiUhStWWT+RMOjyrrLy2YH5CQ g==;
X-CSE-ConnectionGUID: vmpED0vvTaqLV+mh5gys5w==
X-CSE-MsgGUID: PQTEyI1YQmSHHRMk4vq57Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42663774"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="42663774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 11:48:56 -0800
X-CSE-ConnectionGUID: oa8ovxNcQFGnKuoWRnX8bw==
X-CSE-MsgGUID: E+c/2TqVQNyWD3wbAnauEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="119401730"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 11:48:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 11:48:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 11:48:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 11:48:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJAMGMElU30TIs1SION6dlQuEIVKP/Gv0JXtDpiJB9jBIZIafC4VFIK+atzfBSBvVk1mHSKYQu2GdaV68HdC+CdBNNEIz1OMVxC3WZXJ6czhQmio4iaUIHGJQNuzU+xNVQvVJi7twtXNCYZYwEBgtPEpuukiMnst2GGgd5wXrRqV8Lx8/zuMS8trOVA8zU1GcJdBC6TeFhFO9FhDE5u+kjR3X0qL/iM+5JhhD1c1lRPOQcZTxHQdBZ5dQ1xgU3BCNgfeutqJIkSRZyjdpXLm0x4qY/QdslKmbQcAgX4irhcTHI3/oE7TjdgpW8xzcppG5+0IS6o+zabxbE6Nyqheog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DaaIrGeN/baX57O5lNQU7fcLTfCVZo4Ju3QtmPxL+4=;
 b=BIiK/UbbrdBYtpEnxR1nJY1w2fU+mtUL539bVDgkaTnSuI67FrtRDI+Sh2xSzghRVM0T9NWCMyX2K8GFAGmJZA5YnUxrWxwjl0kZFOj0CuWydMRd880rV/Q7DVddHgMvHUbaikpjlirFQ2wOkFjaz/jqE2SeXK3IknB/yh+j6AADZD2vJzSZEWZoVdHsIEmSOMv1ODn0sG+O7Bd4XYLE5n9X9EVMCaYOXGy3Eznb/W/lJZScSj78jWgvn/WswNxv8L8S2rBFprIfUs2z0fhs3CstV4QQgll29lOKrjruPAEvXY4TGjQOj2P2fSFHYIvW5hLHdgYEWCoKi7KmOnIyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7393.namprd11.prod.outlook.com (2603:10b6:930:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Fri, 7 Mar
 2025 19:48:10 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Fri, 7 Mar 2025
 19:48:10 +0000
Date: Fri, 7 Mar 2025 11:48:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Don't limit oa-formats to
 render engine
Message-ID: <Z8tNeMOPo7GEiXat@soc-5CG1426VCC.clients.intel.com>
References: <20250305175557.2245712-1-sai.teja.pottumuttu@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250305175557.2245712-1-sai.teja.pottumuttu@intel.com>
X-ClientProxiedBy: MW4PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:303:16d::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: e0da2125-f643-4ce8-42e5-08dd5db0fd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVRkVzlXUEwxMkVmZDVIN0J0YlZ6cHozSlZJcVVZZVdhT0xrMXExZDZ2SEto?=
 =?utf-8?B?QWpJS2FMRkJRUDZmYjdOZmxaZ0VVUEpUTk1nZVcyU044U0h4YkF3cFBDVUEr?=
 =?utf-8?B?bVljdlhDUVFKNnhQRVRJOTJrUFZEbmVZeEVxSHloNFFPNGJ1QnUxTzdrTU5W?=
 =?utf-8?B?cTloaW9HejdWR1F1UlpYSEFjczB4WWNKQlBycmNNbHBkYllHOEFFTldYVURH?=
 =?utf-8?B?NkthUk80VWltTW4rSlI2bVJ0Y2hMNUEyS1VpK3BpYUw5Y1daV1F5bUxicDVT?=
 =?utf-8?B?bVlnZGtFQ3ptdS9IcTBYWVFnWlI3TUlOU1VFMmlBb0lYbjNHTldOYWFDZk1t?=
 =?utf-8?B?MkVzaVlUdy9BZVJNdDZqdVJUaHVnK0c1SXYzLzRwZUpFemwrYzc2dE1kNHdH?=
 =?utf-8?B?YTRnSm1USldrQ3RTSnNkcjZ5eVpCV0VMSUNtUTVpVlpkVkU2RTdmZC9sTFJH?=
 =?utf-8?B?cXR3QVdzWnFyLzAwM2dTOVBGWDdVNllYbTlla2JUSm1hcCtiOU5xb2tnazhD?=
 =?utf-8?B?OTE1bUluVmhNVFkrNUFyUko4S2NzeTN6MmRpQW1yT0ZyVjlMWHNxWXZjZWNl?=
 =?utf-8?B?eEVMcjF5eUZBTDZLMHRnYzJnWWFRSzZEUnFJV2lpNzYzRGFrQmhQNXpWYmwz?=
 =?utf-8?B?VWE2aDJnSHFCSEgrZWhaaTRQd1pWaFQ2cEM5UnQwVmhFeU4zRlB1dEJQeTJl?=
 =?utf-8?B?NWNBRC84WGRwd0xqUnVQUGtsTmY3V2lJaTkvRkgvcm5mWk9CRkJma1dsL1hi?=
 =?utf-8?B?b2Yzb0NpOURaZWlTTEdvaTd4ekxUYXZXNFJtdW5HRnAxZEZCMmNFbmc2NkM0?=
 =?utf-8?B?cDY2bWpLejBMWG04RzdmUHd6Wnk5cXFOQUh3UjM4TkFDRC9WOEhBZnhoanNT?=
 =?utf-8?B?UGpPbTNXcjRsaGhPU0w0NGEyRUlibFhVME91RnFab05RM0NWbW84aTdTeEJt?=
 =?utf-8?B?WFJOZkhIOG1EUnRFUUx6OE1lQjNyNTdzK3o0S3Vla3NMTWlWVlExeDVOd2Nn?=
 =?utf-8?B?ajdXK3ZuaTVKai9Bdy9rU2dCeld4M3FXS2k5WXlRK2U5bkF0MjA5dUdYUlFD?=
 =?utf-8?B?OG9ZOWx5WG1ORUh2YnlBMWw0M3UweUM3M2dCTHZyOXhHM0ZvcnlJQytaVDNR?=
 =?utf-8?B?MjdXa1JnbTU1TkZzaXhUK2YycXlPT0RGTGNOOUR5dFZ3Y1RyOVlyNEliL2U4?=
 =?utf-8?B?UGNQNjg3aTduWFR5b3BoeVdmRUpjZE5mdjk4a2kzRHVlSkV6bGN1Sm02Nkp4?=
 =?utf-8?B?STNOMnpmVU92UXRJeWc5SmwvSWdvMXRBeDhyaUFLQlR2SkJSTFBGcGJ1YVpV?=
 =?utf-8?B?YUZUbm1aYzZHbEcrdm93VUgwd3EvSVZ0Q09WWXNyc1VFam1QL2puWlhHU1NE?=
 =?utf-8?B?ZFllM0NBNE5OU216YlZNaEV0YkRBYWlwZzE2MTIxNDZWT0Zld0dVYzYwNFRL?=
 =?utf-8?B?TVZpZUZlVUtBYlNQbGVWbVN3WHFzNHdPZCtlajgrUVdUR1hHdkNpbTRpNGg1?=
 =?utf-8?B?WGFWM3k3K1ZWck9OeG5td052bHBnb3E1SkYvcDFiTWkxa3NhN094b2tFZmo2?=
 =?utf-8?B?b2dwUElIUWQ4aEZDMWoxVHNoM1NraERFVS9OckR0T3o1dzBZYzlNYW4xZHNY?=
 =?utf-8?B?Z2JYQ25Ud0JGanBlTUJmQWJRV1hKTHJWUlZvRE5zYzNMK2VnR0hKTDZRdVN4?=
 =?utf-8?B?NHp4SFoyeWxYRkRRa0l3eDFQSC9FTlRVNTZ6dUhHMUc2Q1ZwTWEwa3JCT1dU?=
 =?utf-8?B?eHVUKzRJbGp3aVBoV0tyWG9xaU5tcFdWMmo5Q0pQMTZVRFFMU2ovWFhreDBz?=
 =?utf-8?B?THdLMmpXMWIrZG1EbWJhM2gyT3RHZ0xmS1cvazdrRHZUOEFiMENCQnJTVytH?=
 =?utf-8?Q?p3CqOSTeQoNst?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFJKS0M3cEpqSlppcG9XUzJsZy8zTG5pQUVlUDRpTUt3QmkyUmE5bUZUaWcr?=
 =?utf-8?B?b3NJQ3JXdGVrZFVmVzB2RWRsQVVUY2VROElPY1VXb0NLYkdsTVU5ZjdEUnA4?=
 =?utf-8?B?WVA1aG9EcVJtckhWVE9QVXkzU2JoaU5pdFY3bUVhNmdHK3J3TFhXWEJOc0lC?=
 =?utf-8?B?ak14K2dXNk95WXYyekczbnNkYnhuQndlZWc2NXRHclNLMytocGpIY1lJQWR3?=
 =?utf-8?B?czUvcmJRMUg0WVZaeEFXN0pDbW52L09MVE4yOU5yUllEUndWZ1RRaFFhRkZU?=
 =?utf-8?B?b2FFZlRFcG5qK295QllmWk4rUmhCS2RLcDVxNlFsbWx3RFpWR1RjdEJUOUJP?=
 =?utf-8?B?aWg5M0V2VkhpYitBQWFlY3U3RElTSGJvdEc0RmMycjUyTzdrNkg0RXpnTGF4?=
 =?utf-8?B?N3ZqeFhsbjBEYUNxV1JrWmthL3VVT0NvaitEeGpOeDNjd3RHTml3bmR1TnZl?=
 =?utf-8?B?a1kzMVRGNXFXL3Fselp2TjZzRGoyWXRyYWQ2RU5EdnJwM2xiNlpGRTY0czhP?=
 =?utf-8?B?b1NCMDhmdmJicTJrbzZhdkVnL1daYnhLSmxHeE9PRFp6MUZLNlovaGZQLzQ4?=
 =?utf-8?B?dlBCdFQxZkhORHpFLzVOVnEvUTdUVnlGcDJmU2JWUjhidnFmK3pmenk5VVRV?=
 =?utf-8?B?V2ViWk1ra2NyNzYzZDF2NmlFcnpyR3lzVVhrNkRRNFNFWDFFZ1lMbytIc1FK?=
 =?utf-8?B?NUo2bUcyN0JPQnp1ekNzbXlWVTE2MHBlKytYY2hBYUtEZDE3M3RhRzUxd28y?=
 =?utf-8?B?amxqakFBSkUzSW95WGRib0VBZzRVOTA0QjhEUThrdHJuS3JCT2ozMXBlU2RF?=
 =?utf-8?B?TUtsSjdPcTVWT3lDdVVLM3g1V2NYbDlsdE5MSHhpTmJiWjVReGRGTDBNcm4r?=
 =?utf-8?B?WGZNNmNEbTYxSTRSTU5VTWpaYjBxN3ZnQlZTNjRacWg5dFF3NHY4U2tha1dy?=
 =?utf-8?B?dlRVSkdBcHNYSnB5K0YvdENSWStpellrdmNsUERucEZGenlBcHRGNkRyelN0?=
 =?utf-8?B?OFRmNlY5UC82UWQ2TUxZVEE2aUNKTEZEQ0MweUtrY3kyQ2xhQkhwUzROcEw4?=
 =?utf-8?B?d3V4ZkJiam5pVG5GRnZkSS8xazFIMVUrZ0dBT1pwWk8xVm9BSnA4WG9JK0hD?=
 =?utf-8?B?bkNyMUNCcWJtNjBUdDBUcGYydXVDcndFVGNmYjVPSHNjR0JHMGVZeGVYdUpp?=
 =?utf-8?B?RnBlcGJPelp1Mm9VVkVyd1Z2TGQvMnc3VmRYV3lzYVc1VjQ3T3l2OVkvMmpv?=
 =?utf-8?B?bU8vS3AxQnZoTTM4QlFSTllNMzkxVHZWaWE4QVFIU1d2OVY0YVF1dUZHelY2?=
 =?utf-8?B?TFRkM2NNcEJaT1dSYzhxSDZiVXRHV1VTTDZiYXRoWElzak1ZTFdqbjZSdTFw?=
 =?utf-8?B?a3JGdFV2RFRPbXMyOGlBQk9zNlc0blhqWldJKzd0U0dBVXFabGMwSHhwQW1Q?=
 =?utf-8?B?bkRtb3ByVXU2SDArQll5V0Nhejl3Q0NJZmhMY2VJOGpwWm16MVcxSzZKVFpX?=
 =?utf-8?B?dERKZkNWZFkvKzkzSGhqdUVDckFMTHRwaFVQU0w0clh1ZTd3UHZBSldWaEgy?=
 =?utf-8?B?Rm5lTDBWTStWVkVCS0liYzVWbkFjMzZhQkc1VXlFZXNzVlF3ODV0NnhKQjZS?=
 =?utf-8?B?a2U5d3dNZGJ2ZkJmZnpOUkRkaXpUUnE4YTNLOVJ4NytmUTB5bnBDMW1XSXJL?=
 =?utf-8?B?RVd6NnF6MU9oRi81NnhhSWhvTVJKaThLNXVHZHJyUndLV3V2UVBkOGFhR0V5?=
 =?utf-8?B?QUQwM0lFanA4Y3JyM0NpSllHRFYwSnVra2NuN21pb0ZXZTVpb0pxeGljUzZY?=
 =?utf-8?B?WmQyZWpEU3NsRWpRMkZDUkVJbkNkMTV6blVZcVNJL2JKeFRCQ0lnZXlnNExP?=
 =?utf-8?B?cFplUzlyanFmS0ZaWExvTkJMK2hsQnZhZENhdm11YkhDNnJaWDI4SDBLSmps?=
 =?utf-8?B?WkVHYkthTnoxRHZ3eGE2dDlUQ1lSc0lDR1hXalhRVlpBRFJpRXcvQS9nTDNR?=
 =?utf-8?B?a2pkcEhkbDl0ZHEvU2pJTGJBMk12OWlGQ0tycFJOZXZRa05KZWFzaGhZSjd2?=
 =?utf-8?B?cktHeTlSNW42VEVmUzczdHFjcGdZVkJnRmxYT0NlMkU0WDdNc0Rwdmg1Nk1I?=
 =?utf-8?B?ZFpjZVR4dXcwSGlKNVpMMWdSdXgwVWlwNE9wY0JTUnlES2h5MlFBMHpJdzRN?=
 =?utf-8?Q?fIdp4wm+bP32sKRJEacqE8E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0da2125-f643-4ce8-42e5-08dd5db0fd8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 19:48:10.7558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JRKUvS/VwYtEK29LdHVJSm0N61J6b1eSLsPgG2biWGhwI2BC240d4lJTZXnpaLklJRsOIr2x0TYF2Ant4bmmKezN8DLcA/MrrgY1cDMvTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7393
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

On Wed, Mar 05, 2025 at 11:25:57PM +0530, Sai Teja Pottumuttu wrote:
>oa-formats test need not be limited to render engine only. Extend
>it to use any engine using __for_one_hwe_in_oag macro instead.
>
>Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index a72def0fe..81f2a7e0c 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4717,7 +4717,7 @@ igt_main
> 		test_missing_sample_flags();
>
> 	igt_subtest_with_dynamic("oa-formats")
>-		__for_one_render_engine(hwe)
>+		__for_one_hwe_in_oag(hwe)
> 			test_oa_formats(hwe);
>
> 	igt_subtest("invalid-oa-exponent")
>-- 
>2.34.1
>
