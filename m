Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE2BCF6497
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 08:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CFA10E023;
	Mon, 30 Sep 2024 08:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah1ciio3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381D310E023
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727686622; x=1759222622;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=m6/eelPTxdRX9qhyepwucjELOdlZP7NLjW7FWhqISbc=;
 b=ah1ciio3r8sFQ4f8XboLdEbTJ+UhkUKxfNIrMvlb98A06CWiviX7YH/m
 tZVSDrhTvnU8EUHJ289kMszI0UNNXZRHfWj6apzAOHPlLl/xMxWB5qJmQ
 1JXr/UPSt/YHwbadjS7pSQJCnzvLzM4OEHJeFVFszKV0WQguNo/9Yn//1
 12Fu8SpMsU2uUtw/foy9XVQj0PybEjLwwdr+irZjXTbYZKkI6WlBlq6HA
 PF06yo7YRr4YJLSCC4myOlPLeOV1ttVZg4Ezr0VdH0ji3SGSsOj/q+Az+
 h86snN6ypvMrq+U2fdqphxK3xrscHgORKEWyqMIRaA8o2EBiwJvLcyaWT g==;
X-CSE-ConnectionGUID: IgCwlPbrSmuC7j4s6MkgOw==
X-CSE-MsgGUID: 0TvjNbfTSPa0FM7X0/UCBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37905967"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208,217";a="37905967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 01:57:01 -0700
X-CSE-ConnectionGUID: tspZubYxQYm1U+Q0h3dDCg==
X-CSE-MsgGUID: 1y2HW6dBSPKz6JJ+whHrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208,217";a="77740560"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 01:57:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 01:57:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 01:57:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 01:57:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 01:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSa9jfnfTWipPPdEVX7kDu3dl18efzFKUwjE4zgDvRS63oBl2UGcIk7X3nP77nN3kllYw4wrEG65tTYqc6Q1GN1WNQpLvlkHQzNwPF+NEbs0MzNYioK0KSNBxRdVactE3RHwFuqbw7fUY5ProqWAh9SJNVhsBtU3L4v2hrnq/eof34GjlXJQAZHiw6ZPISjBqsua3k6HAkv6A8cZaDOyXntGbRAzDyM4q8B9ZnRdJgpSal69favZvZ/lmMvLwg73OP8Sy6TgkJmOuHMJAs1ex02DT+CrR77vvF0ANbUvfxavo05yf5v38zV+pNSjJ/6Ffrbebgv298InlQNTDr3q6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbsP3HIfmg97FuHH/XCqhR5k0k3kiakNpCKCspZ5pLg=;
 b=lfwsugIqg63sC7KojLOmLm8Pg9J1jc1yAGfe58cS9P6LIDVTOQmjQT4X8eSOBCVWd/vv5hyXvj9LUADE2rO2ATEaBbPp20WnXC9ck7DEumZxuSooVZTNPC9/m5S9t2FdDyBKFmI1imCl0TOa8v6DDrQNuGRp+RpSmuGmlJqNqlWrgD6p2sNmH6MleNdDsusis1OOn4bIPNJsHxzq38HUMipj+pCtPrpsfIcKplsw99gFOBEqRFUY+kX7zknxlMjGX8IT1d4fer387q57OCClxUru1pAFj2hbUr25cwlEZ669F6eRuuGtLsD7MIfoCVDNQr7r0mXDpjjdAmZF9D1DOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 08:56:48 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 08:56:47 +0000
Content-Type: multipart/alternative;
 boundary="------------GgbyZpshoV15Ju9f0SK4alJJ"
Message-ID: <30961c44-2911-483e-bede-a407f9d22687@intel.com>
Date: Mon, 30 Sep 2024 14:26:40 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_Add_tests_fo?=
 =?UTF-8?Q?r_ultrajoiner_validation?=
To: <igt-dev@lists.freedesktop.org>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
 <172345027029.593901.4085263743042777109@2413ebb6fbb6>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <172345027029.593901.4085263743042777109@2413ebb6fbb6>
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: b6405459-e5e7-4554-453c-08dce12dd035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enNOakZIQmNRcWhHcGVQb01WZVhYelR0OWI0TEdtQUNIQnRjTlQ4d05vMVU1?=
 =?utf-8?B?WTdVRFlXMUFuWHFIaGU1YUVkNERQblZLOWRwWDFOUk1IRkdCOTd6TldYZlln?=
 =?utf-8?B?RllReWhZVmRtM3VWam5vN1F1NDJFNkdRc0M2UmJwZGtUSjF4NDhyeVpBaFVF?=
 =?utf-8?B?c2JMUWo0ZVprc0hkbTkwVWM4bGU3aFlWcW05UlFCOTY5aGVQL21Ia0o1YVFV?=
 =?utf-8?B?VVlVTWRSYTVtbytJbFFKT1RUNjZUM2tpNGl1V2M3VWNEZ1pDUktwMVZKRXE2?=
 =?utf-8?B?RkZ4aktwZFd4NW5zSVRycGM3NnA3aTc1SGl4SjZEbUI3OVhzR2xwUjVVRmNq?=
 =?utf-8?B?Y0QwNkJSbFF3ZHd2SThlTk1vanl5YW9sUHR0aksyVnZmcWFBa09NRFBpL1FI?=
 =?utf-8?B?a0ZxLzlueFF2WlFzSFdzUEp5R25yVE1iY0haTndrL3pLYTFWaHhtTGRrcTJk?=
 =?utf-8?B?TFJYbSs4enpNQ1QwMmRoVmR4RTJITE1mbFFITDNsYld1d01lVW0wTkFVaEgy?=
 =?utf-8?B?MUJoVmJGV05EdmV2S2tjMGQ1WU4yTUhFRnZmM1lhSjMxcnJrSGtCakJkMDky?=
 =?utf-8?B?RllQOEdSSE12MVJIWDg0N25FSlBJSlFmNkczVmV0NGNlV05XdlgxOWkwcTdO?=
 =?utf-8?B?Ri9aYnBpd0ppd0NkSFNXZkFJcThyeGZ2V293aEpBY05pdnpWWndTVzRJcFVW?=
 =?utf-8?B?cFMyaFB1VHRXVGVVd1J1d3hxUzVwaXgxbHV3bS9LS3plYTVCQlRTUUwyTlp6?=
 =?utf-8?B?TkowYUQ3OE1Mb3JiM1VHcVIwWWUySEdKa2FjQk9ka25URjlVaFB2QjlpZURs?=
 =?utf-8?B?amQxNllLZStZR2ttWGVYVkVwUEQyMmVRM1p0eXF5ZEROZDh6TS9IaXlBZ1R0?=
 =?utf-8?B?MWM3dG4zQ1dFa055dmNaNkdDOWQvYlpsMlBFOVAzc1paOHY1UWphMnA1Wk11?=
 =?utf-8?B?aXY0eG9HVXVnSGUyTmR1bHNRRUMvVnpMRXdZZnR4clVYSDhYc1ducXBveHlO?=
 =?utf-8?B?dkU3VWRvRFBZVHh4Mnk3K1dkenBYSnRSbU1sK2paMVVPSE04eEdwUStZQnNH?=
 =?utf-8?B?NEU3L0FqMkU3K05kRjJHZFl4VWhId2JWbU9rOG1uak9TQXlyRGIyQkdUamNB?=
 =?utf-8?B?MCtCWFBwM2JmQ25temYreVZGM3pKVnRmUUZDdzdkSjU3dWhMb05wZWVhTERn?=
 =?utf-8?B?a0xRRkNCMTZjRGFZb2o0NDlFcmh0ak5nNVBhTUZObFRuUWFuUVg1NDkwcXpJ?=
 =?utf-8?B?cWlzTUk3aStNNURsbGdod0RsN2JDcGxKelgySzhlemRQQmFqei9BL25yb2l5?=
 =?utf-8?B?aUE2d0VwUHdBcVM4WlAzSFowT29HeHU3VlpBbWVBVExEdmkxNlZFaU9Sd3Ey?=
 =?utf-8?B?SEtiQ2VNYVJrZ3dTaWpPWlp2QlQyRVFwRUpQRTZ3UEx0MVlRQXVwdFcwMVBR?=
 =?utf-8?B?bWZKTE5pSlArK2tYbmxDQXNMaTZ1UzFYRURQT2ZheFlrTGZlUkM0YVc1SURq?=
 =?utf-8?B?aDJsZnFhKytPMXJaVEVnM05xaWJrZFNIM3NhbzhvL2V6NVFpc0xqRGRUOTdn?=
 =?utf-8?B?QU02OENZQzFaZCtmL2Y4emhFNS9lRm9UYlJpUDFCRDlVaGMwNWRDNUpaWDNh?=
 =?utf-8?Q?YbNw4SrsVx5Mi2oSS79N/kyBd8q9k4MrYjToQk3QaqAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHVzVHFhOUxCSDdYTGJCRXpFTFpmcERBY0lXTUgyUGY0bU5ySTNEVWZ5U1E5?=
 =?utf-8?B?TTVhK1FyUEJpUHRndVJlQlNZcEdIMVZBZmNOWkl2TkxRaGZKemhnR0l3Mkl2?=
 =?utf-8?B?dFZCQlNaaFhaUFZBbkFydGl4azNaUFlmQzlsZFNvQ21ZVG5WTGNLcllSVE5C?=
 =?utf-8?B?S1d1eW5GdW9xODdLMXA1SlhIazc3cUJ0ekFRZnJUZVJyOTdFbVdNaDk1Y1J2?=
 =?utf-8?B?L2N0Z2JXZEkySHdhS09STHRiZ3B0bFd2U3hNZEEvSFdTOXBJZE0zV0tXNkpF?=
 =?utf-8?B?N0p5RVBmdW8vcDcvY3l5STZMeFcvRHFJM0lKVkJrRGRjSG1CcXR3TnJZdFB3?=
 =?utf-8?B?ZGFzVUd3bFl1eEkzWDVGQUlSdjFxaC9ZYnBReTJPMEdTN3RZUmwyS2QrTm51?=
 =?utf-8?B?bEU4Um5wVmNaYlBXQjVlcmxNUnRHRlZCSmlnVjFEZERobngwYXJqOUNKUHBm?=
 =?utf-8?B?R2F3SWxrcXFXTDE0U2k3b3c3Z0Zma3hMRWtIM1ZseGdOc05kWnBEVGxnQncx?=
 =?utf-8?B?SnFaL29rbGZpV2Q5bk1BeFZYY3N1bG5DZTJQc2lSMzBuTXlpa0ZYTnF1TTh5?=
 =?utf-8?B?SHp5MThsdzY2ak04NExIWWZ4VzkxcWVyWlRxKzBrcXBLRW50bWIra1RnTCsr?=
 =?utf-8?B?MG4xbXBYQWVObTVNazEwblU2NzRtNm1kYkpSeUdBajFWZGdZNEN3SWFja2Ez?=
 =?utf-8?B?TWw2VHNuN05tc3EzTTU5eFYrMi8zMWpNanZmcTZvSElzbzk1N3ZraXNCcHNF?=
 =?utf-8?B?Ty8xTm5VR1ZNaEhtYm9tK3NCUG5BcTZSTVRHbksxMHd0K2pVVTFMSUg5dkxH?=
 =?utf-8?B?MzJCTStxR09TVUQwcW5HbWI5WWFiT0QwNHdKNEJvS2NtRnVMcmIwU3VQZzNu?=
 =?utf-8?B?TEV2OENmWHJBcm5NaURnN2I5eExGbTd2NC80ZExraG1KeUNoMDhrUUVvRzY4?=
 =?utf-8?B?UllKclMxbG9zV1hObDZqS256ak4xOUtFeG50NEpFajVTWmFPLzNRWTZsN3lB?=
 =?utf-8?B?ckVDaUEwY2hxYi9Ec3IzVkRMTUlBaEJpZGJiNlo2OVh1WDd4bWNiVzFRMzNj?=
 =?utf-8?B?ak8vTktEbktrQVhIb0NDT1FPYWJ3aHlIcld1K3hNME1uazZoNVVBZVFwdFVF?=
 =?utf-8?B?T213QkRMZEdSZEt2UVlKbkJ6VWlqWFpiUkg5bmNySUlEa0Zhb0E0VEVjazZD?=
 =?utf-8?B?b09xZkJ6UGtXY0ZaV2tNbVNrTDU3emVzVTRqT0lQNFF5Y3ovaEd3eWM3cnBr?=
 =?utf-8?B?MTh4dks1ZU9zMVRWZGJCOGd2Ymw3aWlGc3hUb1hSdFErR2lWRmlpcGJhWXBm?=
 =?utf-8?B?QzFLUzRYdWZmOUxUSU1iUWtMTVVVVmVhVEExMjlxVE1PMkROTGtqMUpwSW9p?=
 =?utf-8?B?TU9KV1RMRDdxTXNpeVQrQi8za1NJVVViYmR2aEZXUUVYai9GUXZVZ2Z2SDg3?=
 =?utf-8?B?SUFoY3ZMZjZBVkRVYjk3cU9Ea1VWbEpFb2FuZENIMlRmMzRrNU0zZVgvTTZB?=
 =?utf-8?B?RC81WmJZSTgwY1AwTkNqS1ZoanRqeDhCTktoQzIzbFdKbjYwaU1XaUdZaXQ0?=
 =?utf-8?B?MHYzZC9hckNnUWtPZG5QT01uRDFpcGQyanloL3prYXJVK2FqM2hTa3pqek9P?=
 =?utf-8?B?Y2oyeVdGUFI2UEpYWm5wLzFWRmRlNDZER2VlWGFzOXJSZ1RaY01HRU03NkVq?=
 =?utf-8?B?TlIrRGRlbXJGb2FTTUEwSTFnOXRLNUtwcWJieFVLcyswLzl2NGFnRW5JdCtk?=
 =?utf-8?B?QmpwSml1cDN6bG5NbkpmUE44TVp5YzkydXZQZFlKUFFmblJnV3BnSjNTVGhB?=
 =?utf-8?B?bkZnS2RaZDFpTXNoelB1bktsNnZKOFB2aWJMNEdYbldnUjJtTkRJZ3BpWjln?=
 =?utf-8?B?MHJuR1hGT0tla2kxNWhwUGRzTWNBNVBBYjZzRU4wb2ZwOUlxcEtZQ3lxa25J?=
 =?utf-8?B?Q2hXdnFTeWluc083NGRSQUVUTFBXWkt2aWlGY05EZEt2ZXJXY05lNW5wWGJ3?=
 =?utf-8?B?aW9pT1VmUTU0WVAydXZMRE15UGZKQjg1dEI2Y2g2UzRpK2NnZERoZ1U3Nml5?=
 =?utf-8?B?RWdWMi82TW5ZQjJqOEF0aGw1bFdjYXNLU0Z3ZjZ0aXdSZVpPWExNanNUUHUx?=
 =?utf-8?Q?oZu03hvcCoMo31vi8gLXzPcC2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6405459-e5e7-4554-453c-08dce12dd035
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 08:56:47.4721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5lffZp165FFsCp3mCE5JnLuwa/9Kzon1Npdaa/YwVFU7XXzQ4klrukVMAMTsUprhB78nKIRNjp7MGqH9K0L+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

--------------GgbyZpshoV15Ju9f0SK4alJJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/12/2024 1:41 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Add tests for ultrajoiner validation
> *URL:* 	https://patchwork.freedesktop.org/series/137133/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15213_full -> IGTPW_11555_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11555_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11555_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/index.html
>
>
>     Participating hosts (10 -> 9)
>
> Missing (1): shard-snb-0
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_11555_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-rkl-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html>
>  *
>
>     {igt@kms_joiner@basic-big-joiner} (NEW):
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-1/igt@kms_joiner@basic-big-joiner.html>
>         +4 other tests skip
>  *
>
>     {igt@kms_joiner@basic-force-big-joiner} (NEW):
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_joiner@basic-force-big-joiner.html>
>         +6 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_joiner@basic-force-big-joiner.html>
>         +3 other tests skip
>  *
>
>     {igt@kms_joiner@basic-force-ultra-joiner} (NEW):
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html>
>         +4 other tests skip
>  *
>
>     {igt@kms_joiner@invalid-modeset-force-ultra-joiner} (NEW):
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         +5 other tests skip
>
The failures on kms_joiner are expected skips currently as the kernel 
patches are not yet merged and the other failures are unrelated as this 
series only affects the kms_joiner subtest.

Thanks,
Karthik.B.S
>
>  *
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_15213_full and 
> IGTPW_11555_full:
>
>
>       New IGT tests (8)
>
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o Statuses : 7 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o Statuses : 5 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o Statuses : 3 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o Statuses : 3 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o Statuses : 4 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o Statuses : 6 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o Statuses : 6 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o Statuses : 6 skip(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11555_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@crc32:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@api_intel_bb@crc32.html>
>         (i915#6230
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>  *
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@api_intel_bb@object-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@device_reset@cold-reset-bound.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@device_reset@cold-reset-bound.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>  *
>
>     igt@drm_fdinfo@busy-idle@bcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@drm_fdinfo@busy-idle@bcs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>         +14 other tests skip
>  *
>
>     igt@drm_fdinfo@busy-idle@vecs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@drm_fdinfo@busy-idle@vecs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>         +6 other tests skip
>  *
>
>     igt@drm_fdinfo@idle@rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@drm_fdinfo@idle@rcs0.html>
>         (i915#7742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>)
>  *
>
>     igt@drm_fdinfo@most-busy-check-all@bcs0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@drm_fdinfo@most-busy-check-all@bcs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>         +5 other tests skip
>  *
>
>     igt@gem_basic@multigpu-create-close:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gem_basic@multigpu-create-close.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@gem_basic@multigpu-create-close.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_close_race@multigpu-basic-process:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>         +1 other test skip
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@gem_create@create-ext-cpu-access-big.html>
>         (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html>
>         (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>  *
>
>     igt@gem_create@create-ext-set-pat:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>  *
>
>     igt@gem_ctx_freq@sysfs@gt0:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@gem_ctx_freq@sysfs@gt0.html>
>         (i915#9561
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561>)
>  *
>
>     igt@gem_ctx_persistence@hang:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-snb5/igt@gem_ctx_persistence@hang.html>
>         (i915#1099
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>         +2 other tests skip
>  *
>
>     igt@gem_ctx_persistence@heartbeat-hostile:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-hostile.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_ctx_sseu@invalid-args:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@gem_eio@kms.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-13/igt@gem_eio@unwedge-stress.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>         +1 other test fail
>  *
>
>     igt@gem_exec_balancer@bonded-true-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@gem_exec_balancer@bonded-true-hang.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_balancer@invalid-bonds:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html>
>         (i915#4036
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html>
>         (i915#4036
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036>)
>  *
>
>     igt@gem_exec_balancer@parallel-ordering:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6117>)
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html>
>         (i915#2846
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_exec_fair@basic-deadline.html>
>         (i915#4473
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473>
>         / i915#4771
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_fair@basic-none:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@gem_exec_fair@basic-none.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>         +5 other tests skip
>  *
>
>     igt@gem_exec_fair@basic-none-rrul:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@gem_exec_fair@basic-none-rrul.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>         +1 other test fail
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>         +3 other tests fail
>  *
>
>     igt@gem_exec_fair@basic-throttle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@gem_exec_fair@basic-throttle.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_fence@concurrent:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@gem_exec_fence@concurrent.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_flush@basic-uc-set-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>  *
>
>     igt@gem_exec_reloc@basic-cpu-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +4 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-cpu:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +6 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +9 other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_fenced_exec_thrash@2-spare-fences:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@gem_fenced_exec_thrash@2-spare-fences.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +1 other test skip
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk7/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@random-engines:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk9/igt@gem_lmem_swapping@random-engines.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +5 other tests skip
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         (i915#5493
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>  *
>
>     igt@gem_lmem_swapping@verify:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@gem_lmem_swapping@verify.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html>
>         (i915#4565
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>  *
>
>     igt@gem_madvise@dontneed-before-exec:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@gem_madvise@dontneed-before-exec.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_media_fill@media-fill:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_media_fill@media-fill.html>
>         (i915#8289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289>)
>  *
>
>     igt@gem_mmap@short-mmap:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@gem_mmap@short-mmap.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +2 other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +8 other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-copy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +12 other tests skip
>  *
>
>     igt@gem_mmap_wc@close:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@gem_mmap_wc@close.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +1 other test skip
>  *
>
>     igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +4 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-snoop:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_partial_pwrite_pread@reads-snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +4 other tests skip
>  *
>
>     igt@gem_pread@snoop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@gem_pread@snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +4 other tests skip
>  *
>
>     igt@gem_pxp@create-valid-protected-context:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@gem_pxp@create-valid-protected-context.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +2 other tests skip
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-1.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@gem_pxp@reject-modify-context-protection-off-1.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +2 other tests skip
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-3:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-on:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-on.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +4 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +4 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +3 other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>         +1 other test skip
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@reads:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@writes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@gem_tiled_partial_pwrite_pread@writes.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +13 other tests skip
>  *
>
>     igt@gem_userptr_blits@coherency-sync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@gem_userptr_blits@coherency-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gem_userptr_blits@coherency-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@coherency-unsync:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@gem_userptr_blits@coherency-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@gem_userptr_blits@coherency-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>  *
>
>     igt@gem_userptr_blits@forbidden-operations:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@gem_userptr_blits@forbidden-operations.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#4880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#4880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@relocations:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_userptr_blits@relocations.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-secure:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@gen9_exec_parse@bb-secure.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +4 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@gen9_exec_parse@bb-secure.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>  *
>
>     igt@gen9_exec_parse@unaligned-access:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gen9_exec_parse@unaligned-access.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@i915_fb_tiling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@i915_fb_tiling.html>
>         (i915#4881
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881>)
>  *
>
>     igt@i915_module_load@load:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@i915_module_load@load.html>
>         (i915#6227
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@i915_module_load@load.html>
>         (i915#6227
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@i915_module_load@load.html>
>         (i915#6227
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>  *
>
>     igt@i915_pm_freq_api@freq-reset-multiple:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         +13 other tests skip
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html>
>         (i915#3591
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591>)
>  *
>
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         +14 other tests skip
>  *
>
>     igt@i915_pm_rps@min-max-config-idle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@i915_pm_rps@min-max-config-idle.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@i915_query@hwconfig_table.html>
>         (i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>  *
>
>     igt@i915_query@test-query-geometry-subslices:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@i915_query@test-query-geometry-subslices.html>
>         (i915#5723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-tglu: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#7443
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443>)
>  *
>
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_addfb_basic@basic-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>  *
>
>     igt@kms_addfb_basic@clobberred-modifier:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_addfb_basic@clobberred-modifier.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +1 other test skip
>  *
>
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +1 other test skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html>
>         (i915#8709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>         +11 other tests skip
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +6 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +8 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.html>
>         (i915#6187
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187>)
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +3 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +39 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +111 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html>
>         +412 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +169 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +43 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#10434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +5 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (i915#11616
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616>
>         / i915#7213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213>)
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@kms_cdclk@plane-scaling.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_cdclk@plane-scaling.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html>
>         (i915#4087
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087>)
>         +3 other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_chamelium_audio@hdmi-audio.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +9 other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +8 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +5 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_content_protection@content-type-change.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_content_protection@legacy.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_content_protection@legacy.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@kms_content_protection@srm.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_content_protection@srm.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#11453
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x32:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (i915#11453
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         (i915#8814
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>  *
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         (i915#9067
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (i915#8588
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (i915#8588
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588>)
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_dp_aux_dev.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         +1 other test skip
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_fbcon_fbt@psr.html>
>         (i915#3469
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_flip@2x-flip-vs-modeset.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +8 other tests skip
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-snb6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>         +1 other test fail
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a4:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a4.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a4:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a4.html>
>         (i915#11832
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8810
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#6880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +17 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +31 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +24 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         +35 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         +146 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         +28 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +19 other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html>
>         (i915#433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433>)
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         +2 other tests skip
>  *
>
>     igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html>
>         +19 other tests skip
>  *
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>)
>         +1 other test fail
>  *
>
>     igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html>
>         (i915#11614
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614>
>         / i915#3582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html>
>         (i915#10226
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226>
>         / i915#11614
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614>
>         / i915#3582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>)
>         +5 other tests skip
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (i915#9809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>
>         / i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html>
>         (i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-4.html>
>         (i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>         +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176>)
>         +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html>
>         (i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>         +7 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>
>         / i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>         +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html>
>         (i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>         +28 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-4.html>
>         (i915#9728
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html>
>         (i915#9728
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728>)
>         +3 other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (i915#9293
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9293>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#9295
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_pm_dc@dc6-psr.html>
>         (i915#10139
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10139>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_pm_dc@dc6-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#9340
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>
>         / i915#6805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_prime@basic-modeset-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-update-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#4348
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr@fbc-pr-primary-blt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_psr@fbc-pr-primary-blt.html>
>         (i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +8 other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9673
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_psr@fbc-psr2-cursor-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +19 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +23 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-onoff:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_psr@psr2-cursor-plane-onoff.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +6 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>         +2 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (i915#11131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         +1 other test skip
>  *
>
>     igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-snb4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html>
>         (i915#5465
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465>)
>         +1 other test fail
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_sysfs_edid_timing.html>
>         (IGT#2
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-glk1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html>
>         (i915#9196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html>
>         (i915#9196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@perf@gen8-unprivileged-single-ctx-counters:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>  *
>
>     igt@perf@global-sseu-config-invalid:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@perf@global-sseu-config-invalid.html>
>         (i915#7387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@perf@global-sseu-config-invalid.html>
>         (i915#7387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>  *
>
>     igt@perf@mi-rpc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@perf@mi-rpc.html>
>         (i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@perf@mi-rpc.html>
>         (i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>  *
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>  *
>
>     igt@perf_pmu@cpu-hotplug:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html>
>         (i915#8850
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850>)
>  *
>
>     igt@perf_pmu@event-wait@rcs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8807
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807>)
>  *
>
>     igt@perf_pmu@rc6-all-gts:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html>
>         (i915#8516
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html>
>         (i915#8516
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>  *
>
>     igt@prime_vgem@basic-fence-mmap:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>  *
>
>     igt@prime_vgem@basic-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@prime_vgem@basic-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>  *
>
>     igt@prime_vgem@basic-read:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@prime_vgem@basic-read.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@prime_vgem@basic-write.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@prime_vgem@basic-write.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@prime_vgem@basic-write.html>
>         (i915#10216
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@fence-flip-hang:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@prime_vgem@fence-flip-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@syncobj_timeline@invalid-wait-zero-handles:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk9/igt@syncobj_timeline@invalid-wait-zero-handles.html>
>         (i915#9781
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
>         +1 other test fail
>  *
>
>     igt@syncobj_wait@multi-wait-all-submitted:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-14/igt@syncobj_wait@multi-wait-all-submitted.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@syncobj_wait@multi-wait-all-submitted.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>
>
>         Possible fixes
>
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         (i915#7742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-rkl-5/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-dg1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#4391
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#9820
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#9820
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html>
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-snb2/igt@i915_pm_rps@reset.html>
>         (i915#7790
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7790>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-snb2/igt@i915_pm_rps@reset.html>
>  *
>
>     igt@i915_power@sanity:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-mtlp-7/igt@i915_power@sanity.html>
>         (i915#7984
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@i915_power@sanity.html>
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5:
>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-tglu-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5.html>
>         (i915#10354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10354>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5.html>
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         +1 other test pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-rkl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html>
>         (i915#9196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html>
>
>
>         Warnings
>
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2876
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876>)
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#10131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131>
>         / i915#10887
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887>
>         / i915#9820
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#10131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131>
>         / i915#10887
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887>
>         / i915#9697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-11/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#7162
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (i915#11453
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>
>         / i915#3359
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (i915#11453
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>  *
>
>     igt@kms_psr@fbc-pr-cursor-render:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-1/igt@kms_psr@fbc-pr-cursor-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@kms_psr@fbc-pr-cursor-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9673
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-render:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-11/igt@kms_psr@psr-cursor-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9673
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_psr@psr-cursor-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +10 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (i915#11131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (i915#11131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>
>         / i915#4235
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#11131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>
>         / i915#4235
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#11131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7966 -> IGTPW_11555
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_15213: ac6319ef8c6027f0fc65b71b614a8312aed19423 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11555: 986b54b86c7424ea955be579f2725238b407a686 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
--------------GgbyZpshoV15Ju9f0SK4alJJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class=3D"moz-cite-prefix">On 8/12/2024 1:41 PM, Patchwork wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:172345027029.593901.4085263743042=
777109@2413ebb6fbb6">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Add tests for ultrajoiner validation</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/137133/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/137133/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1555/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_15213_full -&gt;
        IGTPW_11555_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11555_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11555_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class=3D"moz-txt-link-freetext" href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/index.html">https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11555/index.html</a></p>
      <h2>Participating hosts (10 -&gt; 9)</h2>
      <p>Missing (1): shard-snb-0 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11555_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:</p>
          <ul>
            <li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-rkl-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html=
" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@=
a-hdmi-a2.html" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_joiner@basic-big-joiner} (NEW):</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-1/igt@kms_joiner@basic-big-joiner.ht=
ml" moz-do-not-send=3D"true">SKIP</a> +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_joiner@basic-force-big-joiner} (NEW):</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_joiner@basic-force-big-j=
oiner.html" moz-do-not-send=3D"true">SKIP</a> +6 other tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_joiner@basic-force-big-j=
oiner.html" moz-do-not-send=3D"true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_joiner@basic-force-ultra-joiner} (NEW):</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_joiner@basic-force-ultra-=
joiner.html" moz-do-not-send=3D"true">SKIP</a> +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_joiner@invalid-modeset-force-ultra-joiner} (NEW):</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html" moz-do-not-send=3D"true">SKIP</a> +5 other tests skip=
</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>The failures on kms_joiner are expected skips currently as the
      kernel patches are not yet merged and the other failures are
      unrelated as this series only affects the kms_joiner subtest.</p>
    Thanks,<br>
    Karthik.B.S<br>
    <blockquote type=3D"cite" cite=3D"mid:172345027029.593901.4085263743042=
777109@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_15213_full and
        IGTPW_11555_full:</p>
      <h3>New IGT tests (8)</h3>
      <ul>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>Statuses : 7 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>Statuses : 5 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>Statuses : 3 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>Statuses : 3 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>Statuses : 4 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>Statuses : 6 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>Statuses : 6 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>Statuses : 6 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11555_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@crc32:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@api_intel_bb@crc32.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6230" moz-do-not-send=3D"true">i915#6230</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@object-reloc-keep-cache:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@api_intel_bb@object-reloc-ke=
ep-cache.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send=3D"true">i9=
15#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@cold-reset-bound:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@device_reset@cold-reset-bound=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send=3D"true">i915#1107=
8</a>) +1 other test
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@device_reset@cold-reset-bound.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11078" moz-do-not-send=3D"true">i915#11078=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@device_reset@unbind-cold-res=
et-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send=3D"true">=
i915#11078</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-idle@bcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@drm_fdinfo@busy-idle@bcs0.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8414" moz-do-not-send=3D"true">i915#8414</a>) =
+14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-idle@vecs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@drm_fdinfo@busy-idle@vecs0.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8414" moz-do-not-send=3D"true">i915#8414</a=
>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@idle@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11555/shard-rkl-4/igt@drm_fdinfo@idle@rcs0.html" moz-do-not-send=3D=
"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7742" moz-do-not-send=3D"true">i915#7742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@drm_fdinfo@most-busy-check-al=
l@bcs0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8414" moz-do-not-send=3D"true">i915=
#8414</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_basic@multigpu-create-close:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gem_basic@multigpu-create-clos=
e.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send=3D"true">i915#7697=
</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@gem_basic@multigpu-create-clo=
se.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send=3D"true">i915#769=
7</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_ccs@ctrl-surf-copy-new-c=
tx.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send=3D"true">i915#932=
3</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy-new-ct=
x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send=3D"true">i915#9323=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-process:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@gem_close_race@multigpu-basi=
c-process.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send=3D"true">i=
915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-threads:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@gem_close_race@multigpu-basic=
-threads.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send=3D"true">i9=
15#7697</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@gem_create@create-ext-cpu-ac=
cess-big.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6335" moz-do-not-send=3D"true">i9=
15#6335</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@gem_create@create-ext-cpu-acce=
ss-big.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6335" moz-do-not-send=3D"true">i915=
#6335</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-set-pat:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@gem_create@create-ext-set-pat=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8562" moz-do-not-send=3D"true">i915#8562<=
/a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@gem_create@create-ext-set-pa=
t.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8562" moz-do-not-send=3D"true">i915#8562=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_freq@sysfs@gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@gem_ctx_freq@sysfs@gt0.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9561" moz-do-not-send=3D"true">i915#9561</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hang:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-snb5/igt@gem_ctx_persistence@hang.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1099" moz-do-not-send=3D"true">i915#1099</a>) +2=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-=
hostile.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send=3D"true">i91=
5#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-args:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@gem_ctx_sseu@invalid-args.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/280" moz-do-not-send=3D"true">i915#280</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@gem_eio@kms.html" moz-do-not-s=
end=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5784" moz-do-not-send=3D"true">i915#5784</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-13/igt@gem_eio@unwedge-stress.html" moz-do-not-s=
end=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11555/shard-dg1-16/igt@gem_eio@unwedge-stress.html" moz-do-not-s=
end=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5784" moz-do-not-send=3D"true">i915#5784</a>) +1 other test =
fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-true-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@gem_exec_balancer@bonded-true-=
hang.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send=3D"true">i915#4=
812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@invalid-bonds:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@gem_exec_balancer@invalid-bon=
ds.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4036" moz-do-not-send=3D"true">i915#403=
6</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@gem_exec_balancer@invalid-bon=
ds.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4036" moz-do-not-send=3D"true">i915#403=
6</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-ordering:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@gem_exec_balancer@parallel-o=
rdering.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6117" moz-do-not-send=3D"true">i91=
5#6117</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html" moz-do-=
not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html" mo=
z-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2846" moz-do-not-send=3D"true">i915#2846</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_exec_fair@basic-deadline=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4473" moz-do-not-send=3D"true">i915#4473<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/47=
71" moz-do-not-send=3D"true">i915#4771</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@gem_exec_fair@basic-none.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3539" moz-do-not-send=3D"true">i915#3539</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" m=
oz-do-not-send=3D"true">i915#4852</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-rrul:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@gem_exec_fair@basic-none-rrul=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send=3D"true">i915#3539<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
52" moz-do-not-send=3D"true">i915#4852</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk9/igt@gem_exec_fair@basic-none-share@=
rcs0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2842" moz-do-not-send=3D"true">i915#2=
842</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.=
html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2842" moz-do-not-send=3D"true">i915#2842</=
a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@gem_exec_fair@basic-throttle.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3539" moz-do-not-send=3D"true">i915#3539</a=
>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@concurrent:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@gem_exec_fence@concurrent.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4812" moz-do-not-send=3D"true">i915#4812</a>=
) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-set-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-d=
efault.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send=3D"true">i915=
#3539</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-nor=
eloc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send=3D"true">i915#3=
281</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3281" moz-do-not-send=3D"true">i915#3281</a=
>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_exec_reloc@basic-wc-cpu-n=
oreloc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send=3D"true">i915=
#3281</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_exec_reloc@basic-write-rea=
d-active.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send=3D"true">i9=
15#3281</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_exec_schedule@preempt-qu=
eue-contexts-chain.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send=
=3D"true">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4812" moz-do-not-send=3D"true">i915#4812</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@gem_exec_schedule@preempt-queu=
e-contexts-chain.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send=3D"=
true">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4812" moz-do-not-send=3D"true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@gem_fenced_exec_thrash@2-spare=
-fences.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send=3D"true">i91=
5#4860</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-sp=
are-fences-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-no=
t-send=3D"true">i915#4860</a>) +2 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spa=
re-fences-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-s=
end=3D"true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk7/igt@gem_huc_copy@huc-copy.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2190" moz-do-not-send=3D"true">i915#2190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@gem_lmem_swapping@parallel-ran=
dom-verify.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send=3D"true">=
i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@random-engines:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk9/igt@gem_lmem_swapping@random-engine=
s.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send=3D"true">i915#4613=
</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html" mo=
z-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem=
0.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5493" moz-do-not-send=3D"true">i915#5=
493</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@gem_lmem_swapping@verify.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4613" moz-do-not-send=3D"true">i915#4613</a>)=
 +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@gem_lmem_swapping@verify-ran=
dom-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send=3D"true">i91=
5#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_lmem_swapping@verify-rand=
om-ccs@lmem0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4565" moz-do-not-send=3D"true=
">i915#4565</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_madvise@dontneed-before-exec:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@gem_madvise@dontneed-before-=
exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send=3D"true">i915#3=
282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_fill@media-fill:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_media_fill@media-fill.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8289" moz-do-not-send=3D"true">i915#8289</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@short-mmap:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@gem_mmap@short-mmap.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4083" moz-do-not-send=3D"true">i915#4083</a>) +2 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@gem_mmap_gtt@cpuset-basic-sma=
ll-copy-xy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send=3D"true">=
i915#4077</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-c=
opy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send=3D"true">i915#40=
77</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@close:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@gem_mmap_wc@close.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4083" moz-do-not-send=3D"true">i915#4083</a>) +1 other=
 test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_mmap_wc@write-cpu-read-wc=
-unflushed.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send=3D"true">=
i915#4083</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_partial_pwrite_pread@read=
s-snoop.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send=3D"true">i91=
5#3282</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@snoop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@gem_pread@snoop.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3282" moz-do-not-send=3D"true">i915#3282</a>) +4 other =
tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-valid-protected-context:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@gem_pxp@create-valid-protected=
-context.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send=3D"true">i9=
15#4270</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@gem_pxp@reject-modify-contex=
t-protection-off-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send=
=3D"true">i915#4270</a>) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@gem_pxp@reject-modify-contex=
t-protection-off-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send=
=3D"true">i915#4270</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gem_pxp@reject-modify-context-=
protection-off-3.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send=3D"=
true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-on:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@gem_pxp@reject-modify-context=
-protection-on.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send=3D"tr=
ue">i915#4270</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_render_copy@y-tiled-ccs-to=
-yf-tiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send=3D"true">i=
915#5190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8428" moz-do-not-send=3D"true">i915#8428</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@gem_render_copy@y-tiled-to-v=
ebox-y-tiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send=3D"true=
">i915#8428</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to=
-tiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send=3D"true">i915=
#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_set_tiling_vs_blt@untile=
d-to-tiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send=3D"true">=
i915#4079</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread=
@reads.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send=3D"true">i915=
#3282</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@gem_tiled_partial_pwrite_pread=
@writes.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send=3D"true">i91=
5#4077</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-sync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@gem_userptr_blits@coherency-sy=
nc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D"true">i915#329=
7</a>) +2 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gem_userptr_blits@coherency-sy=
nc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D"true">i915#329=
7</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-unsync:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@gem_userptr_blits@coherency-u=
nsync.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D"true">i915#=
3297</a>) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@gem_userptr_blits@coherency-=
unsync.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D"true">i915=
#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D"true">i915#3297</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/332=
3" moz-do-not-send=3D"true">i915#3323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@forbidden-operations:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@gem_userptr_blits@forbidden-op=
erations.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send=3D"true">i9=
15#3282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297" moz-do-not-send=3D"true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@gem_userptr_blits@map-fixed-in=
validate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D"true">i9=
15#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4880" moz-do-not-send=3D"true">i915#4880</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_userptr_blits@map-fixed-i=
nvalidate-overlap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D=
"true">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4880" moz-do-not-send=3D"true">i915#4880</a>) +1 other test =
skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gem_userptr_blits@readonly-p=
write-unsync.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send=3D"true=
">i915#3297</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@relocations:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@gem_userptr_blits@relocations=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send=3D"true">i915#3281<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
97" moz-do-not-send=3D"true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@gen9_exec_parse@allowed-all.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2856" moz-do-not-send=3D"true">i915#2856</a=
>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-secure:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@gen9_exec_parse@bb-secure.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2527" moz-do-not-send=3D"true">i915#2527</a>)=
 +4 other tests
              skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@gen9_exec_parse@bb-secure.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2527" moz-do-not-send=3D"true">i915#2527</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856"=
 moz-do-not-send=3D"true">i915#2856</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@shadow-peek:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@gen9_exec_parse@shadow-peek.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2856" moz-do-not-send=3D"true">i915#2856</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@unaligned-access:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@gen9_exec_parse@unaligned-acce=
ss.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send=3D"true">i915#252=
7</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_fb_tiling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@i915_fb_tiling.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4881" moz-do-not-send=3D"true">i915#4881</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@load:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@i915_module_load@load.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6227" moz-do-not-send=3D"true">i915#6227</a>)</l=
i>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@i915_module_load@load.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6227" moz-do-not-send=3D"true">i915#6227</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@i915_module_load@load.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6227" moz-do-not-send=3D"true">i915#6227</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-=
multiple.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send=3D"true">i9=
15#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@i915_pm_rc6_residency@media-rc=
6-accuracy.html" moz-do-not-send=3D"true">SKIP</a> +13 other tests skip</li=
>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.h=
tml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@i915_pm_rc6_residency@rc=
6-idle@gt0-vcs0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591" moz-do-not-send=3D"t=
rue">i915#3591</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@i915_pm_rpm@gem-execbuf-stre=
ss-pc8.html" moz-do-not-send=3D"true">SKIP</a> +14 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@min-max-config-idle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@i915_pm_rps@min-max-config-id=
le.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send=3D"true">i915#11=
681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6621" moz-do-not-send=3D"true">i915#6621</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@i915_pm_rps@min-max-config-id=
le.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send=3D"true">i915#11=
681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6621" moz-do-not-send=3D"true">i915#6621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@i915_pm_sseu@full-enable.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4387" moz-do-not-send=3D"true">i915#4387</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@i915_query@hwconfig_table.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6245" moz-do-not-send=3D"true">i915#6245</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@test-query-geometry-subslices:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@i915_query@test-query-geometr=
y-subslices.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5723" moz-do-not-send=3D"true"=
>i915#5723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-8/igt@i915_suspend@basic-s3-withou=
t-i915.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7443" moz-do-not-send=3D"true=
">i915#7443</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_addfb_basic@basic-x-tile=
d-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send=3D"true">i9=
15#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@clobberred-modifier:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_addfb_basic@clobberred-mo=
difier.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send=3D"true">i915=
#4212</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_addfb_basic@framebuffer-v=
s-set-tiling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send=3D"true=
">i915#4212</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hd=
mi-a-3-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8709" moz-do-not-send=3D"true">i915#8709</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing=
:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_atomic_transition@plane-=
all-modeset-transition-fencing.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-d=
o-not-send=3D"true">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#3555</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing=
@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing@pipe-a-hdmi-a-4.html" moz-do-not-send=3D"true=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5956" moz-do-not-send=3D"true">i915#5956</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-interna=
l-panels:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_atomic_transition@plane-all=
-modeset-transition-internal-panels.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" =
moz-do-not-send=3D"true">i915#1769</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe=
-a-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_atomic_transition@plane-to=
ggle-modeset-transition@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/59=
56" moz-do-not-send=3D"true">i915#5956</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotat=
e-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send=3D"true">i915#=
5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send=3D"true">i915#=
4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5286" moz-do-not-send=3D"true">i915#5286</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb-size=
-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send=3D"=
true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip=
:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-0-async-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-d=
o-not-send=3D"true">i915#5286</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate=
-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send=3D"true">i915#36=
38</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_big_fb@linear-32bpp-rotat=
e-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send=3D"true">i915#3=
638</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotat=
e-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send=3D"true">i915#45=
38</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5190" moz-do-not-send=3D"true">i915#5190</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6187" moz-do-not-send=3D"true">i915#6187</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send=3D"true">i91=
5#4538</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-=
1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-c-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-=
do-not-send=3D"true">i915#6095</a>) +39 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-=
a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz=
-do-not-send=3D"true">i915#6095</a>) +111 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a=
-2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk7/igt@kms_ccs@ccs-on-another-bo-4-til=
ed-mtl-mc-ccs@pipe-c-hdmi-a-2.html" moz-do-not-send=3D"true">SKIP</a> +412 =
other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a=
-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs@pipe-b-hdmi-a-3.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-=
do-not-send=3D"true">i915#10307</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095" moz-do-not-send=3D"true">i915#6095</a>)=
 +169 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-=
hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
 moz-do-not-send=3D"true">i915#6095</a>) +43 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-=
1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-=
do-not-send=3D"true">i915#6095</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-til=
ed-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-s=
end=3D"true">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/10434" moz-do-not-send=3D"true">i915#10434</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do=
-not-send=3D"true">i915#6095</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cdclk@mode-transition-all-=
outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11616" moz-do-not-send=3D"true">i9=
15#11616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7213" moz-do-not-send=3D"true">i915#7213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@kms_cdclk@plane-scaling.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3742" moz-do-not-send=3D"true">i915#3742</a>)</l=
i>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_cdclk@plane-scaling.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3742" moz-do-not-send=3D"true">i915#3742</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-=
d-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4087" moz-do-not-send=3D"true">=
i915#4087</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_chamelium_audio@hdmi-audio=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send=3D"true">i915#7828<=
/a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send=3D"true">i915=
#7828</a>) +8 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_chamelium_audio@hdmi-audio=
-edid.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send=3D"true">i915#=
7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_chamelium_edid@hdmi-edid=
-stress-resolution-4k.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-sen=
d=3D"true">i915#7828</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd-wi=
th-enabled-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send=3D"t=
rue">i915#7828</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_content_protection@conten=
t-type-change.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send=3D"tru=
e">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_content_protection@legac=
y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send=3D"true">i915#6944=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
424" moz-do-not-send=3D"true">i915#9424</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_content_protection@legacy.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7118" moz-do-not-send=3D"true">i915#7118</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/942=
4" moz-do-not-send=3D"true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-6/igt@kms_content_protection@srm.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6944" moz-do-not-send=3D"true">i915#6944</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116=
" moz-do-not-send=3D"true">i915#7116</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send=3D"true">i915#7118=
</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@kms_content_protection@srm.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6944" moz-do-not-send=3D"true">i915#6944</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/11453" moz-do-not-send=3D"true"=
>i915#11453</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x32:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_cursor_crc@cursor-random-=
32x32.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#=
3555</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_cursor_crc@cursor-random=
-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/11453" moz-do-not-send=3D"true">i=
915#11453</a>) +1 other test
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@kms_cursor_crc@cursor-random=
-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3359" moz-do-not-send=3D"true">i9=
15#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-mo=
vement-32x32.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true=
">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-=
movement-64x21.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814" moz-do-not-send=3D"tr=
ue">i915#8814</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varyin=
g-size:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_cursor_legacy@flip-vs-curso=
r-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346" mo=
z-do-not-send=3D"true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cursor_legacy@modeset-atom=
ic-cursor-hotspot.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067" moz-do-not-send=3D=
"true">i915#9067</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103"=
 moz-do-not-send=3D"true">i915#4103</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103=
" moz-do-not-send=3D"true">i915#4103</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send=3D"true">i915#4213=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_display_modes@extended-m=
ode-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i=
915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_display_modes@mst-extende=
d-mode-negative.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588" moz-do-not-send=3D"t=
rue">i915#8588</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_display_modes@mst-extende=
d-mode-negative.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588" moz-do-not-send=3D"t=
rue">i915#8588</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_dp_aux_dev.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1257" moz-do-not-send=3D"true">i915#1257</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_dsc@dsc-basic.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-n=
ot-send=3D"true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp-w=
ith-bpc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send=3D"true">i91=
5#3840</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_dsc@dsc-fractional-bpp-w=
ith-bpc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send=3D"true">i91=
5#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" mo=
z-do-not-send=3D"true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_dsc@dsc-with-output-form=
ats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3840" moz-do-not-send=3D"true">i915#3840</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_fbcon_fbt@psr.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3469" moz-do-not-send=3D"true">i915#3469</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_feature_discovery@display=
-2x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send=3D"true">i915#18=
39</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_flip@2x-flip-vs-modeset.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3637" moz-do-not-send=3D"true">i915#3637</=
a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_flip@2x-modeset-vs-vblank=
-race.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send=3D"true">i915#=
9934</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send=3D"true=
">i915#3637</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:</p>
          <ul>
            <li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-snb6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.=
html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11555/shard-snb7/igt@kms_flip@flip-vs-absolute=
-wf_vblank@b-vga1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122" moz-do-not-send=3D=
"true">i915#2122</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_flip@plain-flip-fb-recreat=
e@a-hdmi-a1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2122" moz-do-not-send=3D"true"=
>i915#2122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a4:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible=
@c-hdmi-a4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_flip@wf_=
vblank-ts-check-interruptible@c-hdmi-a4.html" moz-do-not-send=3D"true">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
22" moz-do-not-send=3D"true">i915#2122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a4:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible=
@d-hdmi-a4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_flip@wf_=
vblank-ts-check-interruptible@d-hdmi-a4.html" moz-do-not-send=3D"true">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
832" moz-do-not-send=3D"true">i915#11832</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2587" moz-do-not-send=3D"true">i915#2587</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send=3D=
"true">i915#2672</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-d=
ownscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2587" moz-do-not-send=3D"true">i915#2587</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-se=
nd=3D"true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555" moz-do-not-send=3D"true">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810" moz-do-not-send=
=3D"true">i915#8810</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-down=
scaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2672" moz-do-not-send=3D"true">i915#2672</a>) +1 other test=
 skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-down=
scaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp=
-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2672" moz-do-not-send=3D"true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rc=
ccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2672" moz-do-not-send=3D"true">i915#2672</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-s=
end=3D"true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pw=
rite:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-s=
pr-indfb-draw-pwrite.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@km=
s_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-n=
ot-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6880" moz-do-not-send=3D"true">i915#6880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" mo=
z-do-not-send=3D"true">i915#1825</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2=
p-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send=3D"true">i915#=
5354</a>) +31 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" m=
oz-do-not-send=3D"true">i915#1825</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-=
tiling-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send=3D"true">i9=
15#5439</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw=
-pwrite:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcps=
r-1p-offscren-pri-indfb-draw-pwrite.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" =
moz-do-not-send=3D"true">i915#3458</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw=
-mmap-cpu:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023=
" moz-do-not-send=3D"true">i915#3023</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw=
-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a=
> +35 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gt=
t:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcps=
r-2p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do=
-not-send=3D"true">i915#8708</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr=
-rgb101010-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> +146 other test=
s skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_frontbuffer_tracking@pipe-=
fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9766" moz-do-not-send=3D"true">i91=
5#9766</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" m=
oz-do-not-send=3D"true">i915#8708</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mm=
ap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-pri-indfb-draw-mmap-gtt.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708"=
 moz-do-not-send=3D"true">i915#8708</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a>=
 +28 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-=
rgb101010-draw-mmap-cpu.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-s=
end=3D"true">i915#3458</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/433" moz-do-not-send=3D"true">i915#433</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@kms_hdr@invalid-hdr.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#3555</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do=
-not-send=3D"true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#3555</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/822=
8" moz-do-not-send=3D"true">i915#8228</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_pipe_b_c_ivb@disable-pipe-=
b-enable-pipe-c.html" moz-do-not-send=3D"true">SKIP</a> +19 other tests ski=
p</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1=
:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk1/igt@kms_plane_alpha_blend@alpha-tra=
nsparent-fb@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-=
not-send=3D"true">i915#10647</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_plane_lowres@tiling-none=
@pipe-d-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11614" moz-do-not-send=3D"tr=
ue">i915#11614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3582" moz-do-not-send=3D"true">i915#3582</a>) +1 other test sk=
ip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@kms_plane_lowres@tiling-x@pi=
pe-a-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10226" moz-do-not-send=3D"true"=
>i915#10226</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11614" moz-do-not-send=3D"true">i915#11614</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582" moz-do-not-send=3D=
"true">i915#3582</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_plane_scaling@2x-scaler-=
multi-pipe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9809" moz-do-not-send=3D"true">=
i915#9809</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-mu=
lti-pipe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send=3D"true">i9=
15#5354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9423" moz-do-not-send=3D"true">i915#9423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_plane_scaling@intel-max-=
src-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send=3D"true">i9=
15#6953</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_plane_scaling@intel-max-sr=
c-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send=3D"true">i915=
#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9423" moz-do-not-send=3D"true">i915#9423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotatio=
n@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9423" moz-do-not-send=3D"true">i915#9423</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotatio=
n@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation@pipe-a-hdmi-a-4.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9423" moz-do-not-send=3D"true">i915#9423</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifier=
s@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@kms_plane_scaling@plane-down=
scale-factor-0-5-with-modifiers@pipe-b-edp-1.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5176" moz-do-not-send=3D"true">i915#5176</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotatio=
n@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-1/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9423" moz-do-not-send=3D"true">i915#9423</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-fac=
tor-0-25@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5235" moz-do-not-send=3D"true">i915#5235</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423" moz-do-not-send=3D=
"true">i915#9423</a>) +2 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5235" moz-do-not-send=3D"true">i915#5235</a>) +1 other test ski=
p</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi=
-a-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25@pipe-d-hdmi-a-2.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423" moz=
-do-not-send=3D"true">i915#9423</a>) +28 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-fact=
or-0-25@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-5-upscale-factor-0-25@pipe-a-edp-1.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5235" moz-do-not-send=3D"true">i915#5235</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
25@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-4.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9728" moz-do-not-send=3D"true">i915#9728</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-25@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_plane_scaling@planes-upsca=
le-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9728" moz-do-not-send=3D"true">i915#9728</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms-negative:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_pm_dc@dc5-dpms-negative.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9293" moz-do-not-send=3D"true">i915#9293</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-tglu: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_15213/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11555/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send=3D"=
true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9295" moz-do-not-send=3D"true">i915#9295</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_pm_dc@dc6-psr.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/10139" moz-do-not-send=3D"true">i915#10139</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_pm_dc@dc6-psr.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9685" moz-do-not-send=3D"true">i915#9685</a>) +1 other=
 test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9685" moz-do-not-send=3D"true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9340" moz-do-not-send=3D"true">i915#9340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send=3D"true">i915#9519<=
/a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send=3D"true">i915#9519=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-10/igt@kms_pm_rpm@modeset-non=
-lpsp-stress-no-wait.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send=
=3D"true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6524" moz-do-not-send=3D"true">i915#6524</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805" =
moz-do-not-send=3D"true">i915#6805</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6524" moz-do-not-send=3D"true">i915#6524</a>)=
</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_prime@basic-crc-hybrid.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6524" moz-do-not-send=3D"true">i915#6524</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-modeset-hybrid:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_prime@basic-modeset-hybr=
id.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send=3D"true">i915#652=
4</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_psr2_sf@cursor-plane-updat=
e-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send=3D"true">i915#=
11520</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-2/igt@kms_psr2_sf@fbc-overlay-plane-=
update-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-sen=
d=3D"true">i915#11520</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@kms_psr2_sf@fbc-primary-plane=
-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send=
=3D"true">i915#11520</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-up=
date-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send=
=3D"true">i915#11520</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4348" moz-do-not-send=3D"true">i915#4=
348</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@kms_psr2_su@frontbuffer-xrgb88=
88.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send=3D"true">i915#968=
3</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb88=
88.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send=3D"true">i915#968=
3</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-3/igt@kms_psr2_su@page_flip-p010.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9683" moz-do-not-send=3D"true">i915#9683</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-blt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_psr@fbc-pr-primary-blt.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9688" moz-do-not-send=3D"true">i915#9688</a=
>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-on=
off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send=3D"true">i915#10=
72</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9732" moz-do-not-send=3D"true">i915#9732</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-=
cpu.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send=3D"true">i915#10=
72</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9673" moz-do-not-send=3D"true">i915#9673</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send=3D"true">i915=
#9732</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_psr@fbc-psr2-cursor-blt.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/1072" moz-do-not-send=3D"true">i915#1072</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732=
" moz-do-not-send=3D"true">i915#9732</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1072" moz-do-not-send=3D"true">i915#1072</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz=
-do-not-send=3D"true">i915#9732</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-7/igt@kms_psr@psr2-cursor-plane-on=
off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send=3D"true">i915#97=
32</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send=3D"=
true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send=3D"tr=
ue">i915#5190</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-6/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235" moz-do-not-send=3D=
"true">i915#4235</a>) +2 other tests
              skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131" moz-do-not-send=3D"=
true">i915#11131</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190" moz-do-not-send=3D"true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send=3D=
"true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-13/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send=
=3D"true">i915#5289</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-snb4/igt@kms_setmode@basic@pipe-a-hdmi-a=
-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5465" moz-do-not-send=3D"true">i915#546=
5</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_sysfs_edid_timing.html" mo=
z-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/igt-gpu-tools/issues/2" moz-do-not-send=3D"true">IGT#2</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@kms_tiled_display@basic-test=
-pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send=3D"true">i9=
15#8623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-3/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-sen=
d=3D"true">i915#8623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-glk1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-h=
dmi-a-1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_universal_pla=
ne@cursor-fb-leak@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196" mo=
z-do-not-send=3D"true">i915#9196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-5/igt@kms_universal_plane@cursor-f=
b-leak@pipe-d-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196" moz-do-not-send=
=3D"true">i915#9196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-vir=
tual.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send=3D"true">i915#9=
906</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-vi=
rtual.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send=3D"true">i915#=
9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@kms_writeback@writeback-chec=
k-output-xrgb2101010.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send=
=3D"true">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9412" moz-do-not-send=3D"true">i915#9412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@kms_writeback@writeback-fb-i=
d.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send=3D"true">i915#2437=
</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-7/igt@kms_writeback@writeback-fb-id.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2437" moz-do-not-send=3D"true">i915#2437</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk5/igt@kms_writeback@writeback-fb-id-x=
rgb2101010.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send=3D"true">=
i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-4/igt@perf@gen8-unprivileged-single-=
ctx-counters.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2436" moz-do-not-send=3D"true=
">i915#2436</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@perf@gen8-unprivileged-single-=
ctx-counters.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2436" moz-do-not-send=3D"true=
">i915#2436</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@global-sseu-config-invalid:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@perf@global-sseu-config-inva=
lid.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7387" moz-do-not-send=3D"true">i915#73=
87</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@perf@global-sseu-config-inval=
id.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7387" moz-do-not-send=3D"true">i915#738=
7</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@mi-rpc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@perf@mi-rpc.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2434" moz-do-not-send=3D"true">i915#2434</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-16/igt@perf@mi-rpc.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2434" moz-do-not-send=3D"true">i915#2434</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-4/igt@perf@unprivileged-single-ctx-c=
ounters.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send=3D"true">i91=
5#2433</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@perf@unprivileged-single-ctx-=
counters.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send=3D"true">i9=
15#2433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@cpu-hotplug:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8850" moz-do-not-send=3D"true">i915#8850</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@event-wait@rcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3555" moz-do-not-send=3D"true">i915#3555</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807" =
moz-do-not-send=3D"true">i915#8807</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-all-gts:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8516" moz-do-not-send=3D"true">i915#8516</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8516" moz-do-not-send=3D"true">i915#8516</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-mmap:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3708" moz-do-not-send=3D"true">i915#3708</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
7" moz-do-not-send=3D"true">i915#4077</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@prime_vgem@basic-gtt.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3708" moz-do-not-send=3D"true">i915#3708</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do=
-not-send=3D"true">i915#4077</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-read:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-4/igt@prime_vgem@basic-read.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3708" moz-do-not-send=3D"true">i915#3708</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg2-5/igt@prime_vgem@basic-write.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3291" moz-do-not-send=3D"true">i915#3291</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-=
do-not-send=3D"true">i915#3708</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-5/igt@prime_vgem@basic-write.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3291" moz-do-not-send=3D"true">i915#3291</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-=
do-not-send=3D"true">i915#3708</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11555/shard-mtlp-8/igt@prime_vgem@basic-write.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10216" moz-do-not-send=3D"true">i915#10216</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" =
moz-do-not-send=3D"true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-flip-hang:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-dg1-15/igt@prime_vgem@fence-flip-hang.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3708" moz-do-not-send=3D"true">i915#3708</a>=
)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-rkl-6/igt@prime_vgem@fence-flip-hang.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3708" moz-do-not-send=3D"true">i915#3708</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11555/shard-glk9/igt@syncobj_timeline@invalid-wait-z=
ero-handles.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9781" moz-do-not-send=3D"true"=
>i915#9781</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@syncobj_wait@multi-wait-all-submitted:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-14/igt@syncobj_wait@multi-wait-all-submitted.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11555/shard-dg1-18/igt@syncobj_wait@multi-wait-al=
l-submitted.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send=3D=
"true">i915#4423</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.h=
tml" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7742" moz-do-not-send=3D"true">i915#7742</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/sh=
ard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html" moz-do-not-sen=
d=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-rkl-5/igt@gem_exec_fair@basic-none-share@rcs0.html" =
moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-r=
kl-1/igt@gem_exec_fair@basic-none-share@rcs0.html" moz-do-not-send=3D"true"=
>PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-gl=
k7/igt@gem_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send=3D"true">P=
ASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-17/igt@i915_module_load@reload-with-fault-inject=
ion.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4391" moz-do-not-send=3D"true">i915#4=
391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4423" moz-do-not-send=3D"true">i915#4423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9820" moz-do-not-send=3D"true">i91=
5#9820</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11555/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html" =
moz-do-not-send=3D"true">PASS</a></li>
            <li>shard-tglu: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_15213/shard-tglu-7/igt@i915_module_load@reload-with-fault-injec=
tion.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9820" moz-do-not-send=3D"true">i915#=
9820</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1555/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html" mo=
z-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-snb2/igt@i915_pm_rps@reset.html" moz-do-not-send=3D"=
true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7790" moz-do-not-send=3D"true">i915#7790</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-snb2/igt@i91=
5_pm_rps@reset.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_power@sanity:</p>
          <ul>
            <li>shard-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_15213/shard-mtlp-7/igt@i915_power@sanity.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7984" moz-do-not-send=3D"true">i915#7984</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-mtlp-3/igt@i915_=
power@sanity.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5:</p>
          <ul>
            <li>shard-tglu: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_15213/shard-tglu-3/igt@kms_plane@pixel-format-source-clamping@p=
ipe-a-plane-5.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/10354" moz-do-not-send=3D"t=
rue">i915#10354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11555/shard-tglu-7/igt@kms_plane@pixel-format-source-clamping@pip=
e-a-plane-5.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9519" moz-do-not-send=3D"true">i915#9519</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-rk=
l-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send=3D"true">P=
ASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-rkl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-=
hdmi-a-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9196" moz-do-not-send=3D"true">i9=
15#9196</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11555/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.=
html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-tglu: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_15213/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html" moz-=
do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-tglu-=
9/igt@gem_exec_fair@basic-pace@rcs0.html" moz-do-not-send=3D"true">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876" =
moz-do-not-send=3D"true">i915#2876</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_15213/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injec=
tion.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/10131" moz-do-not-send=3D"true">i915=
#10131</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/10887" moz-do-not-send=3D"true">i915#10887</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9820" moz-do-not-send=3D"true=
">i915#9820</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11555/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.h=
tml" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10131" moz-do-not-send=3D"true">i915#10131=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
0887" moz-do-not-send=3D"true">i915#10887</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9697" moz-do-not-send=3D"true">i915=
#9697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-11/igt@kms_content_protection@type1.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7118" moz-do-not-send=3D"true">i915#7118</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162" moz-do-no=
t-send=3D"true">i915#7162</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424" moz-do-not-send=3D"true">i915#9424</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-=
3/igt@kms_content_protection@type1.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" m=
oz-do-not-send=3D"true">i915#7118</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424" moz-do-not-send=3D"true">i915#9424</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11453" moz-do-not-send=3D"true">i915#11453<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/33=
59" moz-do-not-send=3D"true">i915#3359</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-8/igt@kms_cursor_crc@curso=
r-offscreen-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453" moz-do-not-send=
=3D"true">i915#11453</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw=
-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-spr-indfb-draw-mmap-gtt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-no=
t-send=3D"true">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8708" moz-do-not-send=3D"true">i915#8708</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg1-=
15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8708" moz-do-not-send=3D"true">i915#8708</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-cursor-render:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-1/igt@kms_psr@fbc-pr-cursor-render.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1072" moz-do-not-send=3D"true">i915#1072</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-no=
t-send=3D"true">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@kms_psr@fbc-pr-cursor-render.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/1072" moz-do-not-send=3D"true">i915#1072</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673" =
moz-do-not-send=3D"true">i915#9673</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9732" moz-do-not-send=3D"true">i915#9732</=
a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-render:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-11/igt@kms_psr@psr-cursor-render.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1072" moz-do-not-send=3D"true">i915#1072</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673" moz-do-not-s=
end=3D"true">i915#9673</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732" moz-do-not-send=3D"true">i915#9732</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-5/i=
gt@kms_psr@psr-cursor-render.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-=
not-send=3D"true">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732" moz-do-not-send=3D"true">i915#9732</a>) +10=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x=
-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11131" moz-do-not-send=3D"true">i915#=
11131</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5190" moz-do-not-send=3D"true">i915#5190</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11555/shard-dg2-11/igt@kms_rotation_=
crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131" m=
oz-do-not-send=3D"true">i915#11131</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4235" moz-do-not-send=3D"true">i915#4235</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/519=
0" moz-do-not-send=3D"true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15213/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect=
-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11131" moz-do-not-send=3D"true">i915=
#11131</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4235" moz-do-not-send=3D"true">i915#4235</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send=3D"true">=
i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_11555/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11131" moz-do-not-send=3D"true">i915#11131</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/519=
0" moz-do-not-send=3D"true">i915#5190</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7966 -&gt; IGTPW_11555</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_15213: ac6319ef8c6027f0fc65b71b614a8312aed19423 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_11555: 986b54b86c7424ea955be579f2725238b407a686 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
  </body>
</html>

--------------GgbyZpshoV15Ju9f0SK4alJJ--
