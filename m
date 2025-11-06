Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EE2CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F8110E84E;
	Thu,  6 Nov 2025 09:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zivs8bGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AD210E849
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762419661; x=1793955661;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ohTlMwcWCLEnOqeUwvNZq+KHK4PY2kq3nqXgKCw26Ds=;
 b=Zivs8bGivE9Irn8VC4wjZYZrSIDfUyCaG/YhRGg5WFKrdBx8pdRtyXdf
 YzTZew/rbZ5ZtLevAGLH8PVWJ9FYQRTSWrute8RsNQi7GfCN7dp8uL80z
 MukBXpPpgLar81Ne0nrfVyFZ65lZrYzJi5/K7iNGdCT2vgkUXb5x5pwWJ
 9KiX1fq8yisb3kKhTXQVyM9pXIhiOEsiKIDRtQg37CM6DCTzRW/Egf5g1
 RPKDluFzOE2Im9y8JFhwCfUPS+8EVZjlfjEDCYc5kVpesdedXEOg727va
 rlZQ4TBWk9su16AeTiodknJq+P3mIelGp3PkPrrsluWBpCISKSj9vkRKa g==;
X-CSE-ConnectionGUID: rCqyG0wYQumcgkqLTLxISQ==
X-CSE-MsgGUID: 1CxRdUMUQG6Qa6agt5C1Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="82181254"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="82181254"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:01:00 -0800
X-CSE-ConnectionGUID: 1FGGQnrLTKGJxCjRz5PK8Q==
X-CSE-MsgGUID: zTxhtIBfQRSFTKAD9Xmzqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187549252"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:01:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:00:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 01:00:59 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:00:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwSpbZt3lAeJchD7PysmE1EklfCf8E2q+Srxj1LkNHucvFLY+h7Q69yTXw/VirUo5io8nV72NG3K4MwZpxSqUhnLagOMdsPahGqsqMbAF74hkxY8TJ3AF0s2bJOAc7v87yc66HLOkXxHBvMH4TDSj2LLJUnioatCU8p/J9BZ0Mt/UsPFueKq31uRVqPp7esKJb6XjJzXTMzPe1Z13/QM8vi98iCYzRRR1K69xQw8Lw0JUoUGJN4O7tFI+ruMR06jSz/eEKvC1Swp4ezN1Ox9kr/Q8FsN6oGL4Whkg1V6y4nOc4AJ6sBjCdc2piolz5b0JA95oXpI/ERC/cxbc/DYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNm8mQjwDI/xZoCwQiJMxso9aypc33ZyPScy/dATVm0=;
 b=ly6BFWXQzB2Rmj0g+sr7wZ3dBWAeZnAcaEfw6igAFgKGb3qSygAEGoc70tmp4dJCQ4L6ugIhjiedZ00hqwc2t1DIjG9r+GGdqPaS7EG/9X9Bk7L57csTTaoNDA3lcgUBGlaMZCIwifxYqQ6277u+dMFhqTFeywsFltu9+4KrQ/6dARb7/02pHslA/kVrMzCclehHZZswm+9c/08D1zZk+K667VUHebJKV40TyObC6dbQsAylA+t51Dlfl/QUo0CRJlXXFqPdr4kl6worK+JtgfZFLS67W7lEEPiYQuR9kRcJt0XAv9yIJOchRIJSYJGoiA7e1U/rQmaocpS1Cnc2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA0PR11MB7402.namprd11.prod.outlook.com (2603:10b6:208:432::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 09:00:57 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 09:00:57 +0000
Message-ID: <fe4b30b6-252e-4d28-a39b-8ba25fee11ff@intel.com>
Date: Thu, 6 Nov 2025 14:30:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_psr2_sf: Remove unnecessary et_flag
 set
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20251106085018.1755868-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20251106085018.1755868-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA0PR11MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: f0420b30-3236-4e9c-cd77-08de1d12ffb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnMxc25JTHRETldrSUZVb2lmTUtsTG9MSjlBTktnMk8rRVlZMnV4ZHZVK3M2?=
 =?utf-8?B?NUxTczVDTjEydWJjdWJ5NTVhRnc5dks1cVFCV2FEVzgrZmZPMnBHSUVrcS91?=
 =?utf-8?B?VFdwV0E4R3dvUXFBUTVLejFrbEpaRjJ2ek1PYWJndlR4Q3UwQXE0a0x3OHd2?=
 =?utf-8?B?TTJyYUEvcGpVZXRLeFhiL0FDQ2xNMjVOYzF3UFdXZVZDclN6VVArSksvaGlW?=
 =?utf-8?B?NVdWd0EyRE1waExjQVdwUURETUVMLzd5SnhvSWRGbjNRQVBTc0p5R2kzdTJV?=
 =?utf-8?B?U1FGci9rc0FLVjNEOG5hNVYyQ2Y5cHZGc2J3b2d2bW50SlVMMU8rcXNqV2dX?=
 =?utf-8?B?S3laSkpVRHpoYTBWb0JIRW5JUmtJYXJ1OHlSTUIySS8wZ3J0VklrakhrYkNp?=
 =?utf-8?B?Q1J5a2dCeE84T1VwSkg0aTNRK09HZm1RQ1JWbkFJMEI0QkhRQlNHRTNRU2Q2?=
 =?utf-8?B?VlJmcjh5VzJnUnk5OVc0ZUNOSDZnMmh4RUQ3UnUrMlB6Nnl2anZ5N2o3NmND?=
 =?utf-8?B?T000bzFhR08vVkZCb3Fsd3lsQ3Q1NVVmaVRzSFV5ZXphSGNTdjQxQitpdVp3?=
 =?utf-8?B?YVpHbkJCb1VYNlU0UzdVdVFyNkhlaTlGeVB4c0huT2RncUg3em43ci8rRnlC?=
 =?utf-8?B?SlhWVVJmUUZXT1BPTWljQUZ4dEJ0WFBPRW9wQlpJYksxTHJNOU9hUklhVzZo?=
 =?utf-8?B?ZjNZV3BHMUt4UXdNN05vZ3hwMlBEb0xGTXNMWEsxaFZhcWJDdk42Q1RHazRU?=
 =?utf-8?B?ZXM4VERobUk5dm81enM0R2lCaU8zZnl4RGtFaG4xMSs5ZWJ6R01kb0lkQTNE?=
 =?utf-8?B?dDhnWjVBZ3FaWGhGN1RqTTFZVm13Wkd1VTFscUhGWVo1dDJYcUd0bE5OMVBK?=
 =?utf-8?B?b2ozNElCMlpERlV5NnVqQ3hQZlZiSVNVOUt4ZzJ1UWNBN0hrcjhWeWZvODVO?=
 =?utf-8?B?UjZlWXd0OUVNbTlPNUNsaGx4OU1wbTkweTI5MzduKzcxZ1RMR1FPMlhqUkJM?=
 =?utf-8?B?UW5aM3UwazJJTWJWd3ZENU4wSG51VWFZVXZZZUdHbHlBOENTSHcvOEw0eXk3?=
 =?utf-8?B?RGNrV2VFbHh1MTdUdEpXdVlDaDQ1THl2aGVJRzZaeXpuTGtEYXpzaVlIaHpB?=
 =?utf-8?B?U0M4aDFQSWVyS0lGUXY5UjkrK1FYZHBGQXlRYnh6bmVUNGlNb1hhaXlicHk4?=
 =?utf-8?B?OGdLelNzM1JlWUg5TTdaTEhNTjBwQVY4MnEvbmpkQkZaR1FPU2tGSjAxS2o3?=
 =?utf-8?B?RnVaYWdoaFBGcENwQWhxVkNxVjBmRXFVUmJrazFIWHhrMmdKK3lvcEpJaVdD?=
 =?utf-8?B?OWdzYTFRMFptSjh2R1pVRzU0VEhTQUtRSHR4UzZ2cFB0NWY4blZWOE5wekVT?=
 =?utf-8?B?RFRyS3FubHlUZHNLaGpoZ01RV2FpckN6RXByaGxRYTNBMG5neXF6end2NEdQ?=
 =?utf-8?B?MlZZaW5xQTNWanl3WDk2OWxuaE5VV25oRE8rSy9kYWw3YjIzelpEOG9VM0Uv?=
 =?utf-8?B?UExWMzJUaDNLRnk2ZGVuQi9oMFlXRGZNWVdqZjhwMy96aXE5cGJDZklwL0p0?=
 =?utf-8?B?SEJuek1DVGplTmlZdGVHMW9mNlVqN2V4OEE2a0pBVzIyTklxSkI3U1V2c0tJ?=
 =?utf-8?B?NHFEeVRXMDl5MGRicThwTVh3c0g0RTgyeFhDZjdrVWxnUDVqUTBmK0ljNVVm?=
 =?utf-8?B?VVdFaGRRWjJOVy90cHJTRFh1Y3MxSlA0RTdhYmhwamZmM08rSG1lUk5Mc2pS?=
 =?utf-8?B?Y2JuVWVNRlZnaDk5L24xL1d2dmJkemlzOTl5NStyTTc4YnNmeEdLRFpsS29T?=
 =?utf-8?B?bVhHa1pWUkZPb1RMejZKSW1Sc3NMdkt5RHFIS0JJR3ZYRUxSd010Mk0vYllP?=
 =?utf-8?B?Y2V0bjlvcE1QVlFHemZzTnlCSVEweTV2dHQ1SGxoYnhKNjVOMS9tQnJFSXpO?=
 =?utf-8?Q?yt/kGDFsaQJjP5ubIwp+X8qRucpfkMih?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXU2ZXZmN1FDWWhmZ25xNG9QUUttUWx6bFRUTUg3Y293Lys1RUh2N29uODds?=
 =?utf-8?B?T3FpSVl2OXhUR2MvZnJXVGZiUmZxaGQ3dWhWMHFTUEUrRXJDYnBVdW5ZM0Fs?=
 =?utf-8?B?bmJuU1lEMDdubGJLWWpGeC8vZHY3ckhUUHVZb2txZlB2d2NURGtHS1ZQU3pK?=
 =?utf-8?B?R3dmWGdUSmFMbG5zcU1aaEdGM1ZiVXYvZFJZSU14bmVvWGVONmtyTW9qU1Qr?=
 =?utf-8?B?YUJ1TnIvanhFZVdwaWJRemxPbERkcFBMZ0hTYzd2M3VBTGcwZGtKQkU0bTYz?=
 =?utf-8?B?WVU0UWV0MldjYnFnU0R3cjh1UnVuUXhIMEE5QlBPYys2OUQ4dmR4NWlzaDlv?=
 =?utf-8?B?dVp2VVpYeGFtRmtrWGprbVZ5d1czcnVvSHJyNDBrYzkrWk5zRkNVNGM4YkpU?=
 =?utf-8?B?Y1UwUmJ3UCs0cHRFY1o1Y2RoTnB0OHFGd3BOQVNCamorMGFBM2EzbFdKbDds?=
 =?utf-8?B?OTBYV29QeElmbnkzc0FwaXJYNjdZNk5xZkYvazE0VkJRTUI3Y0UvckExTU92?=
 =?utf-8?B?OERqbVZ5MXJMa3pibmVTcWVBWXFpc2xoRGJOMHhkOXAvQXVCbVdVN1dnYW5N?=
 =?utf-8?B?dTJ4Ni82SnVFTkQ5RzhoVm9oWVlEemdLS0Y1Qk5jbjlWczNIbTRjekJXRzZX?=
 =?utf-8?B?bk51YkNrYWh0UmFwenJodWF5SGRXVkM5Tk1lZ0tmdnlxV3VlU0VsOE9wS28x?=
 =?utf-8?B?RFliZkpINGlGY3pYNUtCMGtiNHdrSnJmRzl1SWRPZW9PNTdISElBTStOQUkz?=
 =?utf-8?B?QXk4VjZRL1NLUFJwcy9OZGhCVWVvQjRQZUMyNE9oTjBPUk9lM2x3Vm5GMjBY?=
 =?utf-8?B?SVg4S01lL1hEMzA0L2lvd2NSYWUxbDVma2FMbi83eWhmaWxJQ3RySWthakZm?=
 =?utf-8?B?Z1p2ZlBVa3d6bThvNEdVTzdsS0pZemo4U1lyZmFhYWdIZVh1Y0RmNjh2Zmlt?=
 =?utf-8?B?VW96Yy9Ybm5wSXAvQjJXdDljVUs4Z0ZpY2lJN0dkNk9XWUY4WUxRcUQ1b1gv?=
 =?utf-8?B?RUVZRktlZkZzQ2pzQjE2Q2M3WFpXREdwcHZZMWUvTmZvU1p6dm0rN25BUkpa?=
 =?utf-8?B?N2hMY2FEc3VpRzhzeG9HbnhvUVR3NW91NkJOOE04RUg3UnZ0LzZiTERtRFVO?=
 =?utf-8?B?OCtvbU45MGJVQmZZcXk4WGN0SkxQQm54ZTNnd0RSRjJOZlYwd1JDZjQrZnNB?=
 =?utf-8?B?anR1ZlRacnIwTS8wWWVpMkdQTzdyOTRLbnhyZUtQNklsMWsrT1Y2Ym5tUjcz?=
 =?utf-8?B?TC9EM0htU0o3Uk9wQ1NnNVltY3lUNk04WnhhRUVsSWtrRTBWL3ZUdENacGVB?=
 =?utf-8?B?Tm1LU0RidXFpRkRrWThKZTBwVWFyZmNsRW9Ga1VMNnBpVlZ6SzVRQXUxc1FF?=
 =?utf-8?B?ZzlkSmFNdk8xT2lLRjhmRDhKS1dNeWdsZzdxVEFPSXNvNmZ2M2FJQ2xQbHg0?=
 =?utf-8?B?RERkMnNlUmNpbVROdGRmaU5GdGhrQ3M1SG02YSswM04wcFpXKzNJNnR3R3My?=
 =?utf-8?B?dGFMcEF1eFpGOU9DQWYydVlJWE9Ib2RubGZmTENqYUtqNzliNnl6a1RnRzNT?=
 =?utf-8?B?dTNyKzBpUmdYcDNoTjlLeit6bFZXYmtBU1RZVkRJVXhsY3JQcERKcmJKekMz?=
 =?utf-8?B?SW0wNm5XODlEM3V6VjJTc3VjWGxIYXkyV3VaMDNoakNHdkRHR3Q5UEgza2Zp?=
 =?utf-8?B?SzVDT29hdHdyK3ZiK2JJWmFydTBFNmxKRFdNR21tczhtVlFvRG5ZMVVSeDc1?=
 =?utf-8?B?akppRURHejNoSmlqdWJsdHFZRTFxUUFPaGM1RG5JZHZ6d0tRdktFajZXNlBN?=
 =?utf-8?B?elhwZnN2R29yMnh0aVBCYWQ3SUFybzhsanRHMktQNS90WVVobmhzdStZZjV0?=
 =?utf-8?B?bGg4L2pIOUt3WHIyV3NLNWxoaXJiN0V4djB2NlZpRXNnTmZMMzZDZnRoclQ5?=
 =?utf-8?B?ZVF2OVlSRHNIS2hlb2dzRHRFM0hER0IvOE1kMjMvRG9UKzJ6SHdzNnFHa1Z1?=
 =?utf-8?B?TDE2Y3pkYnl4ck9KMC9PRmFQcTRiWVNQVUJYbGVWUG9PNzhxaXlwd25UUU56?=
 =?utf-8?B?QzQ1NXh6aGVBSDE4bEJraDVBYXp4ak4zeUhNUlNaeXZEdC9Pd3RJajdjNTJJ?=
 =?utf-8?B?QWlmK0xDWkxMdndGS0Y2MzhOTU9GbmZkVERoTkJrR2ZTeVNhVDZEeEdnZVhq?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0420b30-3236-4e9c-cd77-08de1d12ffb5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:00:57.1394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42AU6k+VIXU35C+4ItjkvLQGX8GI3KZxt2UZ1WU0ApYPBfSn1xxWwP/flhJpB21RJj/VoyFoJSamCDMHjcOFSR801YUXl6E+0IZfXVkNGX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
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

Hi Jeevan,

On 11/6/2025 2:20 PM, Jeevan B wrote:
> PR_MODE_SEL_FETCH does not require the ET flag to be enabled.
> Setting this to true was incorrect, so fixing this.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_psr2_sf.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 12c5b4fdc..9d63808de 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -251,7 +251,6 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
>   							PR_MODE_SEL_FETCH, data->output)) {
>   		supported = true;
>   		data->psr_mode = PR_MODE_SEL_FETCH;
> -		data->et_flag = true;
>   	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
>   							PSR_MODE_2_ET, data->output)) {
>   		supported = true;

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

