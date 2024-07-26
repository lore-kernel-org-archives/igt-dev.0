Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC51C3DA63
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 06:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9E10E930;
	Fri, 26 Jul 2024 06:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+ZhjCd4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6D310E930
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976965; x=1753512965;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9s8EyWkqrgcRzDixKFA4YVUFS3lydlX/fxMmiCfEKJw=;
 b=a+ZhjCd4ZW4ro6ILeoRIgv6pgsGWRRSqLDaxv4+1/S0bj5C5Ys36XDVf
 o+FpX5JiipBAx1UJ7xir/yFPMrVTCPBLqhYMw82vV64FdtPMkPpXWFyAf
 UsQFoRigM4bgjwMSu4xUqba6x8cTSubZyp6iOp9ACg1F0aTgqNfurxakF
 oN9AcPAnUq83Nw3QDqmuvYvCvlIneE02XcA3d/VBu5a/dQkEd2xm8RRQG
 BrBnXWbgeRFoWLRRIqEAk3RIZH9OcjHxuiiJsm/hajRbUYe0tAgCNO6z2
 vRw2XgeUEK5ji6ADg5WadB1EM7CQ/77RiIE6D/NJUTvNScEPusK14Nx+l Q==;
X-CSE-ConnectionGUID: 5w1iFYxeQpqAum/g6rZ1MA==
X-CSE-MsgGUID: DYTKJgAnQRa21Q66I2tNIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="42285064"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="42285064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:56:04 -0700
X-CSE-ConnectionGUID: gyIVktbmQ1iwIba9ddaDjg==
X-CSE-MsgGUID: gZ6q4a+hRnq939vjZ8qokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57456645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 23:56:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 23:56:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 23:56:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 23:56:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 23:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKyC0EpPIjObGQv4r9jC5vVOBOMMoLDCe98IuFE1xYks2kKcYndzIsPOX2fjJNFddSUOCyoitLzfH/IBt9+s0DqaM5YI71Nx7OCN+pFGO1nfG7c4AFHIorPdpCiUd3VbU+3yD/4H+YxLVu7gd5T9wKAYWGQ6tGJjKG2ycX61dc7HQMD987qLoBln8B85FMWpL+/o227ey8w3hBwxGUCHhuEadYKTZuzTLbi81VE5TUlVbk7AXAM/nr87OAs9+FO8yPWIaIZxJzu29iVPJWjzLR+H0xwDr/7Hlb+rsnpGmFzdufgD2aRvM+r/EcOKGYeNSK8wsdizkB7QPPVpHRGnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVfGxGVuDc08YvXdRqErGesVdzukY6+Llk6Ky6v0k6A=;
 b=UNdrzgMNQ5BBbEdgQnp4W5CTgOemq2yaPj6suqHLvLn2QjWi7RmNnRLWpYnHriv6iXSO7Cg8Na3VSe+KwJL5CtgmUkW4a6ge7p9E/7iGRyibgXBM7rKtz8pY18bYNayAIqtpoumetC9UXRdjQdS436VqDCxTsx6UWqiPAeSP6VXyr5F02zDyOPY5HumKIqa3XA8fEMRLqn40nNXHlKrUzrtXPm3un0KDRodRzvMg/Z138WucKvhce7A9yVbIuec91WMMifUYNIO3yR04THxzFTHP6HrjQ9kj9QdXdIO7Mp131QYy61iZ0vjJXoXjatkhCG6xGw5eDAdhPIvZkW3viQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.29; Fri, 26 Jul 2024 06:56:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 06:56:01 +0000
Message-ID: <a1c2f1ec-e2f2-49cf-9c91-3d1e4730b251@intel.com>
Date: Fri, 26 Jul 2024 12:25:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v3] tests/intel/i915_pm_rps: Disable threshold
 subtests when SLPC is enabled
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
CC: <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>
References: <20240726065112.106444-1-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240726065112.106444-1-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ef703f-b552-4b40-77ac-08dcad400263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzAwczVsOUt0RjlMRXgwL3ZaQ2h1SHNGOVBXU0dwWlhlWkl6aG02VXdLMkx6?=
 =?utf-8?B?aUdPRFFHVmNqZXNBSHdoVjhHMk5TaWxkSDFKUTRjNmZDUEFlWHUvZDlqSlgy?=
 =?utf-8?B?Z1NHTTRNcURoZi8vT0xWanJ6S0NucktSZS9FYkUzVW0vRStlY1hPa3BXNjRT?=
 =?utf-8?B?SWdJQVBSY1NJSS9CVTJWRnM2YXpjUWpLWFRDdkpHVDBZSldNNktXT3ozRFVZ?=
 =?utf-8?B?VHd6WE1pQXRMQzgxK1FNNjZxakdwN3BIa2JneEVUZ3F1YmhkR1dqdmE4SHNU?=
 =?utf-8?B?bHJGNnJ2L29saUxVV2dxN1M1dmFXOHBMSW1XNnNaQTJ4R1pVZU9uUWhmclRB?=
 =?utf-8?B?V2I2YXB0aFBsMnFweXVEVTQ1ZDZMZkExd2pTNDd0UTdDWXEvbER1aytwT1Az?=
 =?utf-8?B?dFBLN3ZQTjdLSDRMbExrSld6WTNPakdFUStlVnlLQ0piN0FuaTVQdnlrTjZa?=
 =?utf-8?B?RzNLSFo1a2tQeXRBNUtzeGtJdyt4ZUwwV1JybHFvL1hNcFFkWEpuNnptQWho?=
 =?utf-8?B?S3c4Z01Xcm11UnVKR0pNUENUb1dRMllnQVhicmpScGRyU1BPRWNuQXphdW5H?=
 =?utf-8?B?cnNmcmxXMWM1dnBNaXRPVjByeDA1dE5VSlBiem1IYmZ1d2xnZXdEak83Ull0?=
 =?utf-8?B?dnQ1ZC9tNTZCLzhCSnNXOFlSazZudnBHSzdkdFYzcHB5YlVFd0hqRHpYOWR0?=
 =?utf-8?B?RjJYamNHVHFuak1JR3krazRxVFZ6dTgvcmhKRTE3Vk1aM1Rmb25JVHlLeUJ1?=
 =?utf-8?B?T2V2T0JVQkFFL1VOaU1jeTlER0p2anpzYVU4WWV1QTk0dGduV003dW9YcThI?=
 =?utf-8?B?dklUbGZvNGNjL3dReHBGZytDZEsxWEgrYlowMWhXTkRYeGs1MlFJOEJLMlEz?=
 =?utf-8?B?NTNFRFFhVDBoYjk4aUN0RTI0OUNMWEJqaUpuaStLY3ZDS1ZKMmZqQTR4RWRq?=
 =?utf-8?B?ckV4dGx1VHA0RGlVVmlBcWxYVHdTV3dZTGt1bFV3VWV2V3FOYUI5MUY2ajVK?=
 =?utf-8?B?YWthU3ZmaklFR1FCRFlUaUlTMFVhbDY3L1VJWmQ4NFJDSHZJMTAvUUZYR1pC?=
 =?utf-8?B?Q2xHRnNkU2JPWUtNSkdxY011NVJ5eUswZEV1dkMybzRIb0RUZzVCa25ZY1NC?=
 =?utf-8?B?QVJKUG44SS9RdHVwVW9FM2N3YThuVVNaWkc4bDVLT3MwL2RTZnJ3cVVxL0VT?=
 =?utf-8?B?V2d0SG02VEhvdUtqNXdnWlU1NGxmWlQ3R3lXU1lZaGhTandvY1Q4OHVzd3A0?=
 =?utf-8?B?Ykd0L1ZLL1E5cllsU0hMdWI3OXgrRVRKY0twVElmNFVqdmdQQ3BiSGY1eTBa?=
 =?utf-8?B?T1VQbkxPUmRWVlFMTUpnS0VkNXBLREZ2R0s5U0RJL0RWYVpqd0lKTEh5c2Yr?=
 =?utf-8?B?OXAxMEY2ZEYrZVZCRGVPeUMwQ2FtSUxGcy85TFRXRENtVWZPN2RPY2phOG1j?=
 =?utf-8?B?RDNrWjRGY0xMdUhIUWh5ZzkxNHZSbWJvaWRCdWRjV3k3QWN3Nlh6ditIazNo?=
 =?utf-8?B?WDV0bE1INnZqaHpoZXNKQldvbms4d0JsQWxPWXJrRmlwekNIMHV2WWo0RFZs?=
 =?utf-8?B?cjN5SE5HaEl1aWxNZENhQkU2MkhoVVpCZ29KVDlJajRER0FWN08vWEFFSXA4?=
 =?utf-8?B?dmNPbDJzNGYxWHc0ZUdtTjROOGVFOHpKa1N1MmlUc1JkRlZNQUxCUG00RWI5?=
 =?utf-8?B?dmI3dTJOZm5LUmkydm93cG91cFVwVmtrNXZYcitqOUVIeUdURHBkK1J0eW1O?=
 =?utf-8?Q?eAuryHVOmU29CtJ7BY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnB5R3k0cTRvWXc1elhST3dpZ0h2NnJuem9PejlxR0Ftd0NiQitjc1l6bzY2?=
 =?utf-8?B?MkVTclBlZ01sTk45Rll6K3QvLzV0eDZIMGRMeXBJSTFuOE92alo2RDdzWGM1?=
 =?utf-8?B?Ui82Q28wSzJWeXExQjBCV0NRVUZYR0E2YzhTT2xRQzlKa05RV1RocFZKQlRP?=
 =?utf-8?B?d2M4MDJNcVIzODE2djMvSDg2dVVza0w4dnhvTUVXdEl5enVqYnloamlKUUR6?=
 =?utf-8?B?NUNwVUxvZ0J5eXV4VDNGbElvbEhWMDdWeHJmSWVINDQvbE9WbmpEWVNYSVU2?=
 =?utf-8?B?Nkp0Tm5ValZ2b3IwcjlWTW9qUTBVU1c5RDk4OG5vVHV2OFkvb3oxRzFUNWI4?=
 =?utf-8?B?ZzhuK2ZRblhtTTdHNXRNd0RVbnNJNHh6UjNLYmZJQkNGWHA1cEhSbEpOM2ky?=
 =?utf-8?B?eVVONGZ5Y0F1R3BjLy9OYnZrVC9oQUd6M1pJZXFKV215MDlqeUhvWVdIMWdp?=
 =?utf-8?B?OWVoZ0NPMzl3Nng0RURPWjZWWDYxa1hnOWtkTUwwT0pIWmtRbXl4SmdkU2Fk?=
 =?utf-8?B?aC8vMXlCMitjTGhjYU1HRm5qQnhScVN5Wlg5M1l2aUN1U1FCdS9LWFZZcVhR?=
 =?utf-8?B?djZLK3hsNGZkOWVQQXF3VWhmVXZMN2JoZXZueStDVENpdWRuVjNUL2tYSTMr?=
 =?utf-8?B?bHZtOVhkWVgzcEpyV0pRbmlzT2lGUEdnT2NOTTBIamFVaGFwSVNqZmFnb1lu?=
 =?utf-8?B?MVpMeXJ4N1JkYjZJdCtic0RSczFreXMyaXNLc01xVlF5SHZ4Vy9xNGowQTBl?=
 =?utf-8?B?WjBJa005S1kreVRRcnJ1eUNMWllGUHowZk8wN21jOXVSU2JwVzFaTkdNU1RW?=
 =?utf-8?B?K3NEOTUyRnFyeE91THZjTXMyMjJ0OCtTUVZqSWpQNG9tZ0FzT1VlTk9ITFR4?=
 =?utf-8?B?azRmVFppLzRUL1RzUHhyNHJrRVhSZXgvY2tYR0JPaHdCNzBaVTJuWWFkZjBU?=
 =?utf-8?B?RzJLZ0szTzdSUm10UThMVlI0NVJPTWRaWUR6UThsMVFxZWgzZStmb0pDOWRG?=
 =?utf-8?B?UkhyQkFldnl0MmN0ZzhIa3p2MVdpWWw3N0lkUnBoYkUwQjBrTXpOaS8rZkI5?=
 =?utf-8?B?UVUwL0NsVUNzN1JDZ3J3Mis0VFVSV0NYcHdMdEdQcS8rakd3L0JwQkt1cUlz?=
 =?utf-8?B?aHNnY3NHMk5aZ2xJV25VRlR2Z01DMUY5TDZpTHZnM1E0NXJOY1RCWXhETXZo?=
 =?utf-8?B?TkxWTC9kWEUyc21BdGNMRlJuRXRmSTA4VTNud0RIK1VmMml2Q0phMDAyZ3Mr?=
 =?utf-8?B?bklHL1hUQzZsYVcxM0FrSmwxNFZIdzY0YVNSbjZUYTg4MjB1dGxPOXVZcUtm?=
 =?utf-8?B?RXd1QVZDY1RWem55bDgreXd0bS84NUIySHdsM3lkbEM5N3NSWXJNcmZ5VWhS?=
 =?utf-8?B?NGE4QUdPNm5lRXhveWtTMm5xbk9oa3l3Z2hGMG45dVRnelJudzJlMTVGQWF1?=
 =?utf-8?B?MWNpZDZQMmptcVVFbXZTdml6bm1pak9QZHg1TWlrRkJpWXlVbVJHUkNGanVG?=
 =?utf-8?B?dVhUa2t1RVZNb3FFa2s1S0NZM3IwL3g0akFQMG43WVJraTBxTVVlVUFDbU5I?=
 =?utf-8?B?K1k0U1N4TkVrQk9rQzhURWtWY2hlWjFBY0NsVldPQWdqRlZyVEdSNFdCZ2s0?=
 =?utf-8?B?UzZUVmIyMk9hdUxiTi9tVTlPSHRTY0VIZ2NDMFlWTmpaTlRCNmhhblg1cEF1?=
 =?utf-8?B?RjVkWG1qRDVyOUJqQmNYc3pobHdlcGxrODNmTlhUVVEzNjU1d0Y1b3k2QnNI?=
 =?utf-8?B?WldtTjBYVDZTMVF4QjVYNy9PZEFuMytJT1VPNHNNYlVFT096ZnlUV2xkdjFn?=
 =?utf-8?B?bUJ2TEJQeURCMm9oNEI4anZ2TmNXelpLZWVRakdvc1lLSkx0WG84cmVkZWk3?=
 =?utf-8?B?UWlzK0txYkFrTTZ1aHRnWEdmbDJidjJ2TEtRYlpteElnbG1SdE1mRmRiZDJn?=
 =?utf-8?B?Y3RkMlNwcW1zTnVOS2Y0V2hxbkE0SlRyWmdUNUVYZjlCN01CdHk0ME44eXFq?=
 =?utf-8?B?Y3F4blVSNnZ1UitKbnhvc0dkTU93M2trWDVoR3RxeWhTZnVQMXZIS2pwRGYx?=
 =?utf-8?B?Y2I0SWY2TWdpQzMvcGNaekpOSjhEclM3V2FLdFA3QlI1MlNwa0lGZ1g0N3pW?=
 =?utf-8?Q?d116ahCZJ+iuRBKCvHtYUAqHO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ef703f-b552-4b40-77ac-08dcad400263
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 06:56:01.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXvcckl1Itqo+8IaKFwWtpo39G0j0eHECsgEQ24QDhtKChQ3GMzu87qiBDNPbH9KxT2lhtd7COhQ/W6O2rBA2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

On 7/26/2024 12:21 PM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Skip these tests when SLPC is enabled as it fails frequently.
> These tests are designed for host turbo and sysfs is not available
> when SLPC is enabled.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11455
> 
> v2: Add a skip all the threesold subtests
Typo again
>      Provide explanations for failures (Riana)
>      Addressed cosmetic review comments (Riana)
> v3: Addressed cosmetic review comments (Riana)
> 
> Reviewed-by: Tauro, Riana <riana.tauro@intel.com>
Wrong format. No comma First name and then last name
Copy paste the RB sent.

Thanks,
Riana
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rps.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 99b83f315..ace22b00c 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -1161,7 +1161,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds-idle") {
>   		int tmp, gt;
> -
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
>   				test_thresholds(drm_fd, gt, TEST_IDLE);
> @@ -1170,7 +1171,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds") {
>   		int tmp, gt;
> -
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
>   				test_thresholds(drm_fd, gt, 0);
> @@ -1179,7 +1181,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds-park") {
>   		int tmp, gt;
> -
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
>   				test_thresholds(drm_fd, gt, TEST_PARK);
> @@ -1188,6 +1191,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds-idle-park") {
>   		int tmp, gt;
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
