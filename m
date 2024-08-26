Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207C1C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 13:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FF188284;
	Mon, 26 Aug 2024 13:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWd+qDGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3465488284
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724678520; x=1756214520;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=wj95Ae4y8205ywqml/VMvdqrvU7fBGDvc+P2ZTwRJYE=;
 b=jWd+qDGdCLuQ4Kr8GRl1tUTI3jtoOcYbjvqfxdfAE1OPnpEmMBjeSDL1
 l5gagS539YBCs5zqb6sCHUh/kWg8ky2srbR6DK68YOBQ7AxUSjfDh8xkG
 1cpRp9Oim3IdDATqVz97HVJ0+sn+eOcyRDZo/A/IQoWylstIz6HM1ME2j
 xtx+ce+nB3TrERjjNC+ID6bhVWyZGGLFj6ZTpyScJ+qwXsE58AUpl2/+b
 ha7MpjbzMpzMeoU82no2eSzgQYVFBVF2NJL5st2W+N5f6EkrhMYpcjpmd
 wFcfGnDEpj4JDkx3PGe+A1a80f+pTp6nH9aipwmK/sed5sSMvo5gJRICQ g==;
X-CSE-ConnectionGUID: yAY+cPygRKuWPZUDe3Hn8g==
X-CSE-MsgGUID: 22ecZpZlR6KkWpYIGwY0EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13210873"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="13210873"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:22:00 -0700
X-CSE-ConnectionGUID: JUYsQ8lOR0eQ7mVod/MM9g==
X-CSE-MsgGUID: IvmgiOy2SJGkzBaSnz/Pcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="67437406"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 06:22:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:21:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 06:21:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 06:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0XGzFrjVArcTZhVrCgsLenqEHVf70NdRl7VBs9SW1CPsaoF1o00EmWJBlZy6UzaZ7xk42gLWxqo1wVmsoUVcUdnVRgzJfNGjAfl1/b02lESzRDvwf+Q+rKJNxc1d3EWBK3x8QB7MWnmQPocZEv3gXALVzGvgty8HSjAEgscoWFni34ijyvlQmAEl/02VmwdG7TavKduFJRUGYNGmtj8PhF3ze8LjBAMSwmC0YGVyunaPRSObJfd3m/8t+HROEv1EdG/15TDHX0tGdljimszWv8Y+voFNkeeSsjkgKQbUuGwWugLgOsIpL8KvFGe6Mt0Z5knpllMb6IgeCFqBbS6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj1ucEMASynfA078Cat7muEFk8jSQqDhMccHy8Fc0/s=;
 b=Z5jmIKP1LKeNgygEBUiIYOWe5IidWtkMhmwAgeJjKCrJ2xd0qh1cC4ZncXhecHUT0I1ugidR42KLpOJog2W7PYsQ7Yd9W7MDr+3rWCfDbh+TbU7blNe/vz3X90dyUWDDIijCKgOut+tOyyI9m90yjsmLUxmSMRhxjDJXqng9FL1GaYKGXYDophauoCpzXZ+Mt47ccGjrY7K0ggARFHptmI2cnBQQZ04mvQ+7MiBAsk4A/NBJTidP6j0dPDCjGWiOOYbbAXUu58HFGaZjjVPUb91Qgf6IXsr5fASdJyacVYEIjieLA/xLzgnHTtOF1FxvQelGebNHNoYBog3jMcuO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 13:21:46 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.7875.019; Mon, 26 Aug 2024
 13:21:46 +0000
Date: Mon, 26 Aug 2024 15:21:40 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Introduce memory mapping tests (rev3)
Message-ID: <4bmh4fngsecryhguertln55t3sxyzc733yvfc64dbmbnbih5br@cju5wyaonykr>
References: <20240822124744.13054-1-krzysztof.niemiec@intel.com>
 <172440302942.745285.12169590266964310297@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <172440302942.745285.12169590266964310297@2413ebb6fbb6>
X-ClientProxiedBy: VI1PR07CA0299.eurprd07.prod.outlook.com
 (2603:10a6:800:130::27) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec43318-242e-410f-89ae-08dcc5d2089f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1lPN1JEZHY2cVNHNWFXZWVzbUNxVFdqOWNmcWZrYksvUEcyRFlFY2ZzUndT?=
 =?utf-8?B?aDl4enZiMTMwT0kwV2xuOWt0RzdCN3ZEZW1KeU8zQUZOYWZHOXJlYWhFM0NJ?=
 =?utf-8?B?Q1ZmRXd6MkNpQk15bjVkOFZjTmlIRVhudUtwVE9KeXhmcStqYTFZa0xvSVVT?=
 =?utf-8?B?WG1CZFJGNlp0Umc0NWUrRUpwU1FIdjJrUUhMeElzVlR3cDRERFgvdHhlM0hT?=
 =?utf-8?B?UCtudCtwSmJ1S2NaajdhcTJwN2FyRUFNUzlGTGVQMGJXUW9mVS9LenFpTVRL?=
 =?utf-8?B?ekFwVGM4RjhHb09IeFF4UUd1UjdVNVFuRllzVXd1ZmpyUHRhdW56Z0tlN3BG?=
 =?utf-8?B?UVBuekswVXFHaFFtTVhxd2xxdXgxK3Z2VGRKZEsxY0xHQ2cxS2VEb1hqU3pE?=
 =?utf-8?B?RHdQYTNWR0JlTFgrK1JONGFMQlIyWWhFZlJjbmR5alBKZlR4Rk42UnQ5cHdj?=
 =?utf-8?B?WDRBVzFyU2J2Mjg5MkRhRzhGM2xCVTNOVi9JYW1OMy9KMUtNN3BUZVpGancy?=
 =?utf-8?B?RFJXNFphMDVsL2V0YldBczRPTHZQVGFQTWljMjlhSkRGT2xKV0gzNnZDcU0x?=
 =?utf-8?B?bW1Zck1HMHRpdER6VzFPY2R4c1FYRUU3RmxLclAyR3RYamp1Uk9aQURwMkJ3?=
 =?utf-8?B?dWZpVjhZOUpIUExVeHFhRTlUYW02SHZLTjZGYjZRNGhpMmxvMDFUdnpsZnI5?=
 =?utf-8?B?bGdCRUkyQjF0aHdhdnlYbVZrWWU5Z243bEZtUitnQSt2N2lsbG5ETXoydVNQ?=
 =?utf-8?B?djVQUHlLWXFFZ2hDNnNLUFNkUjJqWjN4RlJtN09uYjgyYkF6a2VZaCtYbkhG?=
 =?utf-8?B?dE12TjNOa2FBSVd1SitnMTVTci9GSlpLbVNlL3hTMzVsajY0cTkrU0V1OUNT?=
 =?utf-8?B?WnFqdm5xenVOL0lLRUZiT2pMQWtxVklWNHc4SjJLNWhLN3Q3MnJBVE5zcjRv?=
 =?utf-8?B?eWZpM2NsSjgwNktndWd0bFVHOTJVZ3l3MU9VZzNHNEs3VmFZbXhpMkJCcWZL?=
 =?utf-8?B?MWpCLzJPMzVhVUtqVVRoRC9keTN1SGhWZDI5Ty95TGJralRLZUpYY2dXTUZN?=
 =?utf-8?B?MWVUSkozMmw2bjgrYXlqRXJod3RnUHNTSVRaelNsUzQzQzN3UlZDK3VJMWlH?=
 =?utf-8?B?TmdLK1hyNWFzRmFSVzNHdFB0MklkK2RGQzFmTVBWVEo4OVJhOWJ4anFMZGRT?=
 =?utf-8?B?VlBZL2ZETWhqOXdlb3A0K2ZyV3NGVThFakdQK21kVDNBMnR0Q1dVZ0U4U0s0?=
 =?utf-8?B?am5XNUxsWkJsdWtwY1AzK0RXZlg4Y2VFMi9Gemhyd1R0NThZbElJNjZDWVU2?=
 =?utf-8?B?bUFmMzhlQjRuMGhGVDNkZkNFZGxYRmRwUVVsZGVMaWlxQ0N1TVBveU0vSE05?=
 =?utf-8?B?OUI0dng3eUJPRGEvRnh6UU4wQjk3R2JBdkJLcUJQTzdCRXppaFlabGVPZkR2?=
 =?utf-8?B?UHdHcWJxaERqOHN4eXl4TjdmS2xXZWY5WTdqbEFjVHpiN2FMeEQ1R3BvRDI3?=
 =?utf-8?B?anBLcG45cUNuVGtsMHRVOGUwRjdqZEJGVWpqQTU1bStSQmY4ZFk5bjkva0Yv?=
 =?utf-8?B?VkNlS2J0dDI4QXY4VTk1T1Y5TzlPR1lva2Q0UEh6aDlrQjhMb29iOVJiWlZw?=
 =?utf-8?B?M2R5RERLL3QvbGVHZ2pIM3RQdFFnd1dTajBRTk9hMnNVaUdTUnJzQWNPZ3lV?=
 =?utf-8?B?ZFpMcWxSRkRpd2dQWHNxUmtDNVVDZXRJTll2clRHdFd3dlZCYlF5Y0JiRlQx?=
 =?utf-8?Q?itiA8G4WUmoyfPLTic=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEp6NHpyTVUzeUoxRy9BZWpxYytSZUxrNHFSeXdJc3luK1YrclRNamMySjlv?=
 =?utf-8?B?SGhSQWI3Z3lEZGRNeG02Mmhkb29DMDNEcWh4Z3ZDVTI4OGgreStJelpJalM3?=
 =?utf-8?B?bVNRUk10UGl3KzcrY1prc0p3T0tuQW9MWVY4Wk16VlowMVRqZnVTdkZ2cC9U?=
 =?utf-8?B?elRlQjU4aDVyenlkbS9MTG1NdmVSWitWVkpJODFubFRaVlMxR1pUUzZacGFX?=
 =?utf-8?B?UWZnajV3azBjUmtCbVlEclJ0RkZxUE85eVFKWkx2NXRSUk01eS9TTlZHTFpM?=
 =?utf-8?B?d3M5bjFtUmlwSVQ0V3dkSVdzMlhvSnRrYWl4UDhJZ2Jwd1VnNVNRQVovN3BE?=
 =?utf-8?B?cUU4ckJ4ckJUcGI2aHY0MmpMUjVYalNvQlJMeG05cHh5VEM4YmZwemZyRnVP?=
 =?utf-8?B?VFdyRXFCa2dFOFFHWWJBZ3c4RHpkRXVMUjM1d0V4WHpDSTNmSDJGTy9SeEs5?=
 =?utf-8?B?RWs4MC9GZHAzeWJzN0NEY0FCMWlCcXcyOUpEM0F3aWd0LzlScFJKR3VndjZ5?=
 =?utf-8?B?cjBNUDJWbmphMkp3d2ZsUnNkUmF2OEk2cWtmVTdaOGJJLzlQVWhadHVuYlZM?=
 =?utf-8?B?WHVkY1UzRklNb1ZWKzJ3algrS25ya0RqSEFoUXJVOTloTVZmRWpKWVo4cjJN?=
 =?utf-8?B?eloxa0MwVitobnZ6SlRFdlNpV0dlOVdHTktaZUNYaEh4QVRNM1QzTjV6OVZY?=
 =?utf-8?B?cHlvbStvMjNLV1kwQ2xNd1RMTlRSTDIvb1d3K2k5UFY2REI5TENNT0J4OThm?=
 =?utf-8?B?cnBkenVPeUsxK04zU0RlUXVNS2pJcTlSc1hTeFNvSXFKd0FQLy9Ibm1BRDFl?=
 =?utf-8?B?U3NacDFOMHlydkMyNkJvSWorK3BMMTFOQmNnU094eXc5VnJvZjdTTmV0cndo?=
 =?utf-8?B?dDNYVm1FMkxuaXJmbGg3ZXN1SmZUa29YZEgrdUQ2bDE2NmFjeFBiK2FydGVs?=
 =?utf-8?B?ZCtQZWpKci9wZ0lPRmU5UnNmY2pmdjlaTCtyWVVNSVFhbnNKWDJoZmVFcVBm?=
 =?utf-8?B?QWdXcFRMK2UweFFWd2hsblN6ZUlHQTR3UDJHNGt4a1RyQjd0Yk9sd3N2Z3dm?=
 =?utf-8?B?NURGdFAvMlV0b0c2aGRzU2oyREQ4bm5Wdy9XVlVQaVhTdytBMkpRdkFEQmdF?=
 =?utf-8?B?cEI1RCtQeFVkSDdhbXErVWIwL1BoZmRuZktyTThtK1RtbDJNRVQvQit5VEVm?=
 =?utf-8?B?aW9icWV2Tll6elBlcXFibEdSNkdjdGpQVHpTRThjU3B6djNpdTJaQ2NJK0pL?=
 =?utf-8?B?R1pSY2tubFQ5WFpTSi9JU3luc1d0WVM5ZXJ2RG9VaFFxT2k0alZzSEJ1bm5T?=
 =?utf-8?B?R2Z2QnRzNmpPeHdMeGVVVU0xY0FxYUdvSnJ4VG55NDA5RUtmMHNKZXdYK3Ba?=
 =?utf-8?B?dG1lTWoyMSt2UWdrcWNoTXJjbkJ0MCtwVVFjL2IvTWoyTWVES3J3eUg2cFBL?=
 =?utf-8?B?UlVWSzNLaUFwaTNiOGw1dHJkMTdKbHFIRDV6bmlvRGlwZWQvVDhlNG9PaVFa?=
 =?utf-8?B?VjJQQkFtQjJOaFAwWHZ1a3ptM0cxVXZmUldFcCswZjd0WU9hL0YzOUR6eE9C?=
 =?utf-8?B?N1dMZDlFWU1lOG45SWtsK2tuT0FFMkR2UXFvNXdHRExWYmpNVUJ2NFRPSkdi?=
 =?utf-8?B?ajBvQ2t1SVJkRUN4Q3FmVjRiMHFKZ0lFeFowRjNmeVFDNytJTmFWWTVMeE96?=
 =?utf-8?B?TUY2cXJlN3Y2T3FxdjBBaUFtN2ZuVzVOei8zOUw3L3JuTUErSXBWZ1c3Uzgw?=
 =?utf-8?B?T1lVVDk2V1AyL2JoWXM5T0FpTWxRaTJjUnNJdUM3RHpvMDVncVlFcmpUK1JZ?=
 =?utf-8?B?dkNIYUlnVS9VZEhma0NVdEwreEMzRmN1RFFGbGxvRDYvbDQ5VW9BUU1WZEF0?=
 =?utf-8?B?dWZ2aUJvdE5hMnVsdDl2bVdjYkoxTG9pMy9xTmpyVjQ2ZlkwVjhmTnI0TTFw?=
 =?utf-8?B?SFhpRU40S1l5cGw0QTkrK1lmUTdZMktrRkMvUFp2SDR6dXRTUDFqNjVUTUd4?=
 =?utf-8?B?Vit6UmFwQ2xValpteVlOdlFUNHR2VW9JbW96Q0Iyd0lySmlPMjVyS0lyYnRR?=
 =?utf-8?B?M2FVOUoyb3pmNzJEYVJlam1kRk03UEdFK094Z1I2TWN5UkkvTWkwYUtxTnRz?=
 =?utf-8?B?OVozU0hPZFdqU0hrQi9oZ0VKeFd6MWFOUmVvVFFOQjk3UWdWaHpHdndVM0M2?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec43318-242e-410f-89ae-08dcc5d2089f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 13:21:45.9258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NfOluhwOlAnXIctHqbSnyshtSvM0ggA4N9kVOkhkyrnwZnXbcSYFJsUnzf/8WS4vtrYU2tCH47sdIvode3rbBmD+++03xx8cEnVMf+mzYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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

On 2024-08-23 at 08:50:29 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce memory mapping tests (rev3)
> URL   : https://patchwork.freedesktop.org/series/137303/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7984_full -> IGTPW_11618_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11618_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11618_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11618/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11618_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-snb:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7984/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11618/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-dg2:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7984/shard-dg2-8/igt@kms_pm_rpm@basic-rte.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11618/shard-dg2-11/igt@kms_pm_rpm@basic-rte.html
> 

These are not related to the newly introduced tests.

Thanks
Krzysztof

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_7984_full and IGTPW_11618_full:
> 
> ### New IGT tests (15) ###
> 
>   * igt@gem_mmap_offset@mmap-boundaries:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_mmap_offset@mmap-boundaries@lmem0:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.07, 0.26] s
> 
>   * igt@gem_mmap_offset@mmap-boundaries@smem0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.14, 1.32] s
> 
>   * igt@gem_mmap_offset@mmap-unmap:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_mmap_offset@mmap-unmap@lmem0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.62] s
> 
>   * igt@gem_mmap_offset@mmap-unmap@smem0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.89, 55.90] s
> 
>   * igt@gem_mmap_offset@partial-mmap:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_mmap_offset@partial-mmap@lmem0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@gem_mmap_offset@partial-mmap@smem0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_mmap_offset@partial-remap:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_mmap_offset@partial-remap@lmem0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@gem_mmap_offset@partial-remap@smem0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_mmap_offset@partial-unmap:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_mmap_offset@partial-unmap@lmem0:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@gem_mmap_offset@partial-unmap@smem0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.51] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11618_full that come from known issues:
> 
(snip)
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11618/index.html
