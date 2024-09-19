Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6233CE8D5C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 08:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F54310E24A;
	Thu, 19 Sep 2024 08:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOI6T9+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEAD10E6A4
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726733692; x=1758269692;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7fn1IsitPKIlZnVzSPjEf54TVcF74JzSQih3opWUnr4=;
 b=IOI6T9+7DLS+cAEogHlGyE1l3C9ELkFbcrRpesvLtRvj/vchGYgZqCBZ
 9rQecd2+U1f64+iDzDla8YdT+LHMxFqrYJeP4Ltp+mXlNYb2MA6por/o4
 f939H1Ubpuog0AnOgIDScB3oFa/suWC8cprhyVWLWIX90Li2KmzD8ZWT7
 fHHr3v9y8Wol+pw8zxK360jhC7I/qLoZY7FTVbvTaJm22Gzh+hjfnxhVw
 /2jhVTlEWIHSw46heQFJPR4reaNB09Zm8VGXCbuU9ewQtQ8QbQ6SohaYF
 KIzLmzC14xSwehtP6aYPytUqf9S6xTRsCxdUhIAjoVCf8GwrVgKQ4TyZs A==;
X-CSE-ConnectionGUID: WIdei+5NT0GEu6GBUHtgyg==
X-CSE-MsgGUID: 8Q1YkGjlTlqUAYlLjopa+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25558997"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25558997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:14:51 -0700
X-CSE-ConnectionGUID: jVtNV0qESu6wJm0DJqlZwg==
X-CSE-MsgGUID: uRk3SgVLTki8th1S4ipb2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70322010"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:14:36 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:14:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:14:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idtwtKLM6iLH8Ju9JoxsGR/ZV/HNQgh1+myeBg+CYc0h3eJ0cLGlUxNA+LWmEq0sSXnzLFNJ8vuAjq9AHjyinGm/+gUAhxVSFiSurIE7fRFCOVB+DSOaNR9GiHiMjJHc0A41l6/BYKEriJvwAd4j5yrylu1y3zkyJoLmiAWF5EzFnWbYgSSmwwL0zXpPNUCB6BE+1SvSCxB39Q2yoSDVN3/NMIwtcZN35AyQZxhfr5PpYOMcYu+GkR8+9Neu187P+8faZdbYbvcu+oBkwms4AeuIlyPn6RsAgYLW0lFB6Uzydr2/wlmwMoa4tMdlR+QO6wO5SkjtRFZeFF/7vevuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcumO5Zvg+0mKpGthVR/sdAmXD+jWuBf79TAb/BD0zY=;
 b=oi2OVt1UwQFbO18z+BI+7h6O7kT634fT0F/9DvnLHPU8Uw0IQ6YezkpihX9ykhZado5QAgt97nT0gu4wxccPP2bLf2pTHtCWAg0dhm4A3lgwd8MJ6Du7vSPKDoEIrQJb0RLaIMWrXba9MUYBNF2xbNxzxKc8habPkwgl0tmRjk69o+qmDGA4eqFrg7/VUCoEo/sZNa+RK3idQna8jvj4PRQJZTaeRpmBPdpGkwPXaeKDwsO63h+z3+LQmjZIeTZYCvZhALSPjH81Y+IlIpJLGZ88kMWnLESLnoCJwix/DKVIU4pNunikfPmGppZ8xZmKtfAlYq3atWJWwAyRSLKbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26; Thu, 19 Sep
 2024 08:14:32 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 08:14:32 +0000
Message-ID: <b1011235-0cb1-4531-956b-5ae3cb2e4c2e@intel.com>
Date: Thu, 19 Sep 2024 13:44:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and
 sleep times
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20240919063352.1607048-1-karthik.poosa@intel.com>
 <6374b703-48ee-45eb-9529-f2bf04622ff8@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <6374b703-48ee-45eb-9529-f2bf04622ff8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|IA0PR11MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e97120-9474-47d2-4cf7-08dcd8831728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXJ1SjZDd3VHbTB0NGwyQ05CMDRCNnJiQ1VqMG16QzMzZFpiazZ6MXp5NWE0?=
 =?utf-8?B?YXBtWFd4dGZtSmo0RHJGbER1ZGo4NlZWSElsTGptNjFvSGorNVpRcElDUW1o?=
 =?utf-8?B?U1B5aGpMUVlXRHd1YWNnR3VUUksxT2cxOGJYbG5HY2RYUHNSMCtCWjU2M0RH?=
 =?utf-8?B?RzNJdFRMT2JYMTRTM2RCKzV4OXg3bXdMcUwvQnNycTZONG92dE8zMjBXZDlI?=
 =?utf-8?B?NDludVQyWDZPdGp6TW94VkxZLy9TazVVOE5qSEk0Z0lDV2d6YnUxZDI5b2hH?=
 =?utf-8?B?MWRSKzZhQnVCcDBDTDVoYjlTMjZJS2w1TjZXcmtVaWduRkd2MzI0VFgyTXl3?=
 =?utf-8?B?RTBmbVRNRW4zbm5FUndmZWx1WkRWbmlqcGVKbGlCbW1oT21hbHFKVTZBeU82?=
 =?utf-8?B?SUtqWS81aktSSkhEMWJTQTZvRGRGWWx4WDNLR25WWDlYRkZMdG80QUFyN0dz?=
 =?utf-8?B?V25weUIyb0NWTDJyQWdVWXMxVTE0OGNDS2RoaVBnSzVQWExmVkIxeURweDZM?=
 =?utf-8?B?aTRWQlFLZG9IUTN1NzEvNjdoam9tQmVuWlhoVm1naGl5dlpzdThZeXZWSnRI?=
 =?utf-8?B?Mm9KSWt0MDhIZEo0MS9PUVZKRkkwcHg5c29CVlUyVkFSMzdlb240RXR1Ym5o?=
 =?utf-8?B?THhJNXBhaWQ5Q01HMXBlODN2ekpNM01sZmVNNm01VjArRVp6cmVGN2lxd1B5?=
 =?utf-8?B?b29mTHBrNmU5Y2xDZElEdEZuZDA0dy84UFdGUklGOTJKZC9JNmJCd2E1blZ1?=
 =?utf-8?B?cGF5K0kyRnBaQ0FvdHZyejlvaGFsaXhzUldtSkkwSVFwWGJSUW1jS3d3UjZ2?=
 =?utf-8?B?WktPcHAyREZIK3VxRVZtMFgyTVBFdzg4UlVCMlRWVFFkTlN5OHBiVTNMV05Q?=
 =?utf-8?B?UzZIekt4VVFsYVg1T2IwYlJTbFBpb29uRHdRN3JXRG5IWEhQL0lGTGN1MHF1?=
 =?utf-8?B?T2dWSFBSbXJOeG9yRUJ2eFU5d2VWRmtXeWdoMVFhVnlRa3VxckJsNk9ENXVh?=
 =?utf-8?B?b2ltbU9IM3Y4b1ZQZHhyUjJrVGZMbGpRcmx0eHJCVDlpbStiTmNLZ1JiTERU?=
 =?utf-8?B?Z0Q2MlF3M3JaVnliZDRMZVRjMFptcTRiUlo5Y3hRbnhLT3JnTFVpeHBvRE4w?=
 =?utf-8?B?dFQyUnVhQllsN1lsZlJBTi9CMHhWSFVjNndxZllyQ0pGcERhbkpnd21HQU8v?=
 =?utf-8?B?N3FmMmF5LzBBYk1BOUwvdUI4VUJVREV4SW16aXZuSTBBaTdYNG8wMWhyVE4v?=
 =?utf-8?B?eGxkQW5TY0c4M2hYSGR6NE9ncEhIL1R6MUlRM2tvVmhXNTFpYlgyUUNBSkpw?=
 =?utf-8?B?RGcvSHNLcU4vRkI1RWNFWUY4Yjd1V1lhZFd5cjU5dnhCWElUQkhoTFpZU1hp?=
 =?utf-8?B?RW54QmwwVXNZU3IyWWlIaW1SYWJOSmc2bXptTkZRakxONE1yL0Y4bzNmbHZy?=
 =?utf-8?B?dDVPa0hJSTAzTnhYc0dHRU5KQmV6Sm8xUXJVMlRkTmFScU11R2diSXJyQ0hT?=
 =?utf-8?B?V3BCMnZGa05xeGRlU0NGRzFxUGpiVWZTZXRuSFc2MThqNEU3QXdsbDNWQSta?=
 =?utf-8?B?NTdLRjF5SGUvSkJDQkhXdWhFbW1TK0VwVERIUTNyUWFqdHZ0a3hNbDJKR2RN?=
 =?utf-8?B?L2FPd2FHcVc0c3QxMVpQZGdaUHVxOU5XeGhodXhIamMxWHErdVIydjZMNTFE?=
 =?utf-8?B?ZHN6cktGelRqUUxjMlFzTVJRVFRYNzdTL1FWeUo1bk1pZnpSTWgrTUVPWHJK?=
 =?utf-8?B?T29zQThmS1FaMWtGU1lDQ1pSMzVtbW84NEIwMENqVThrbDJzRVRpWmk0RTRr?=
 =?utf-8?B?cjcwWDBybmZNZmRNc3AxUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFJejRLOGtRV1ZwcDUwTm5NQklEZ1FFcDBSUmJEVER4T2ZsdnpqNWg0VzYw?=
 =?utf-8?B?d1ROTzgzRGVqUStsRGpnK0dQZHkrbFc4OFJKMWEzaHBhZWh5ZEI1WkRTc3VL?=
 =?utf-8?B?ai9hK1o3Ni9rRlVzdDIzVDdTdnNod3NwUUxHU2QvSHZmSUtSbTErZG1EanUx?=
 =?utf-8?B?aG85TGJrY0QyYlVtTUJUQk01UUl0U041Vyt5TGpsUjJCZVNhdHdMV0FxSito?=
 =?utf-8?B?aHlRcVMyVmtkZlIxRXpVQk5pcVdnaFcwSEh3QjByTTZZdGsva1dkMGVNWE11?=
 =?utf-8?B?WHdnZ1J1MWZ6SzZjWVUvVm1PNXZXYk1COW9RaS84OXhxdEYxY1pjazZsNnVt?=
 =?utf-8?B?Yy82aTR0UWg3eU5VcDZNN3Vadlkvb2VlYlgveTFkZW93bzR1NVphdlY5WFRL?=
 =?utf-8?B?RDVYNmRoQmVVaHBlTlBFdGd5Q0Y3STV1R2hxdDVEZEdmd3l0dnNiTWRUY2pY?=
 =?utf-8?B?NGNzbzZ3c2pEUzFxUk5wVmVYeTZ6UzF0bStMMGhkNERzTzlKWWhhbE9ZV2R0?=
 =?utf-8?B?a2lOdm1odFJ2eTJXM2VDZHRtb1R4OEV3NnRBN3JpRVZobm44clNWcGZJbzBi?=
 =?utf-8?B?VHFHT1YzUWQxYzBqN3RBZkpCbFlFNnIwYi9vUnRMSTdiZk5EbTZPekhOaU9B?=
 =?utf-8?B?RHc0T1Z3aHE5My8ySzkyRFBpYkVJZW44ZWVpTDYvdHpjMkx3aSt3R1RtT2VU?=
 =?utf-8?B?bHVNcWI1S0RyT3U2MUowSXNVMU0yaFpFMHQ3UjgxajAzalRONTNScTdFQ0Yr?=
 =?utf-8?B?em56aXNlQUxqVTdmMldvTk9hK3BMUHVnMGZTWTZsRDcwNmFqNUw0QWlzdlRG?=
 =?utf-8?B?ckZPTlFDbFJkbWZhTVB6STlOQXdhZXBjN045b3JKZURNTHVTSERzRjlSQ20r?=
 =?utf-8?B?Y2lUZWE4K0J3b0wwWlhCMzBRejNDS3NnZzBkOEs5cmhNYzRtYThHQVpkK3NL?=
 =?utf-8?B?d1E1eEJaeU40YmQySTRPOVI5TW1OL0xwM2creXp0SVU3SGg0eWVXZ1VyY050?=
 =?utf-8?B?dzZ1ZlNIVlgxZE95N3JZdVR3MG5pTCtpWlJkTnYvMDd4ZXErYWZIR2ZyNlRW?=
 =?utf-8?B?c2c0bEFUSmREaGpKOWJvVEx4cW9EWjY3TVpmdVQ1WkEreWw0cXlQbWM2VGtZ?=
 =?utf-8?B?VHNxdFhTbkVlRG5iSytEV0dVQXB4cFpqMm1kWEtiQmlCaURhaHZJZWhvRWV2?=
 =?utf-8?B?ZysvVG8xS2R5RTZKZTFZU0d1bjlnTlduUzkwRnpRQytrM0M5UEVaVm9FajJG?=
 =?utf-8?B?S0VrUFc0SVVqTURRb0piMFpuTGtyd05MS3JxbXBPWkYvRXNXQ3VyRmY4V2dG?=
 =?utf-8?B?ZkNRVFhSSmpxejBDU1lVdm8yQjFsTC9zdmpuNmlXNG5vR0I1VFRIVnUxTEJZ?=
 =?utf-8?B?bmxha2N1aTBGRXpIem1uZEZNelJYN24vampqS3IwcVJqd3lQdkpsZ1hsRnhT?=
 =?utf-8?B?Q2g3RklzVFpDbU14Njk2SXgyZkFuZ29vMW1NSVZPd2QxL0xxKzBlWVJPTDlB?=
 =?utf-8?B?WUhqY1lMS2NiRHhURGNvQ1ovT2xtbGFIRFRZU2crcFJhWG1rcSt2aEIxMTRW?=
 =?utf-8?B?TUczeUFIQWh6ejVIbUtFYm5vaDhOckJQRzJnSklsYm1zOTFscGczQ2kydVRR?=
 =?utf-8?B?NlJMSDROaU1jak9abFFLaTNSNTNsNU9MZVgrOEVEUjNSYThDWGRBdTZBYnNh?=
 =?utf-8?B?NDJ2bmJ1UDhGM0l1QjlINFpFa3phV2dQTjFBOXhXK1Y2aWNVVkRvb2pvZlk3?=
 =?utf-8?B?YStZc2pwa3pXNzk4RlkyK0RuQWliaWhZRFZweFNHUW5wMUdVR1BibVVEY2l5?=
 =?utf-8?B?VkZ0MHNBVWNJaThrVVAxK08yNWsrVUZId0JFa2I0WlJLL3Z0SnhJZmdEMnh5?=
 =?utf-8?B?RGdvRzlHNFQ3TWl3aWUzZzVXMTdVd0hzdnFjZGVGK3FpOU5wQ0REaTd0ZnpU?=
 =?utf-8?B?c1kvSmZpRUhqcmpMcVo4dkEvRmhRQ1RFYzZqRVowZHpBWTJiUDEzMjZXVUYr?=
 =?utf-8?B?K292b0xKSEpWSXJ5TTlMN1o2ZUpTWmhOTzJsWE92UWd5d2QvTjEzbXRjcG5O?=
 =?utf-8?B?cDdjTGVXbnk4amRZWmNCd1lmZEVFMWtMWjAwMkRvSk5Zd1ZuUmVoQWtLQnhM?=
 =?utf-8?B?eHlkdHowQmRKcElUd05mSGFydG1oNldoVWdQNG9iQWdSeExsU0dHTWQ3OUFu?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e97120-9474-47d2-4cf7-08dcd8831728
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:14:32.5062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFRpTHrSkg7tWOLDTYzj7J7nNdMCu+ojUf8m9i2ynGd/VyydrY7bPywvmlFIeOiummA4a+X8MSTam15/a+taOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
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

That is debug patch, we dont need it here.

On 19-09-2024 12:37, Riana Tauro wrote:
> Hi Karthik
>
> you had sent a patch with assert prior to this. Don't we need
> that?
>
> Thanks,
> Riana
>
> On 9/19/2024 12:03 PM, Karthik Poosa wrote:
>> Print the workload execution and sleep times of the test to help 
>> diagnose
>> timeouts.
>> This will show how long the workload ran and how long the test slept.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c 
>> b/tests/intel/xe_pm_residency.c
>> index 0e687558b..3c3b33ab1 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -139,7 +139,7 @@ static void exec_load(int fd, struct 
>> drm_xe_engine_class_instance *hwe, unsigned
>>           elapsed = igt_nsec_elapsed(&tv);
>>           igt_assert_eq(data->data, done[1]);
>>   -        igt_debug("Execution took %.3fms (submit %.1fus, wait 
>> %.1fus)\n",
>> +        igt_info("Execution took %.3fms (submit %.1fus, wait 
>> %.1fus)\n",
>>                 1e-6 * elapsed,
>>                 1e-3 * submit,
>>                 1e-3 * (elapsed - submit));
>> @@ -150,6 +150,8 @@ static void exec_load(int fd, struct 
>> drm_xe_engine_class_instance *hwe, unsigned
>>            * Execute the above workload for ~1% of the elapsed time 
>> and sleep for
>>            * the rest of the time (~99%)
>>            */
>> +        igt_info("Sleeping for %ld ms\n", ((elapsed / 10)/1000));
>> +
>>           usleep(elapsed / 10);
>>       } while (!READ_ONCE(*done));
