Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB43EC197BF
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 23:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987E310EBBB;
	Thu, 27 Feb 2025 23:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZbbHDo9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC87110EBB9;
 Thu, 27 Feb 2025 23:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740700673; x=1772236673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Ef7+VZ2ZYFBrc2QzaJ+5nH8B1iIZcXzTFWC/Hbqkos=;
 b=QZbbHDo9qiJL2m+9PRXUYJMzVE39bioRsi9h2Op6t2L5OVyxK+FbyypT
 GpcGyLM84149aufLUMz77YAEbUXAuVx1Ws2ldpkalrrj68Nmcvklr8b+R
 jNmfqX4iMfZ0BkNkCEPEPLf6Krg/aX1NI42lTppqCNmXBQBtz5Y62d25y
 eAKSyxwUqnka2YjvVt1VPshbuRO/LEi08evv4pft5q3MUUg4oS/WJF0TN
 86d3e3manCeag3tzudNl67s+9ZfjX9HyoQPW9g9gDt+uES98+szmxKDNM
 /A0+pMkGhQCorl1IX/UK1E01gz2T5FqwTVzd6TRpXGtGJnbyG5UIh7rXH A==;
X-CSE-ConnectionGUID: AOPtm7zNQ8KkLA/a3RZkgw==
X-CSE-MsgGUID: 7me3Cn7vQGKPyh6u5iDhVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41741759"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41741759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:57:53 -0800
X-CSE-ConnectionGUID: F+ADLwFXQB675qj1e3HMAg==
X-CSE-MsgGUID: QoxxZah4THKlCY3kWc1LLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117361147"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 15:57:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 15:57:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 15:57:51 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 15:57:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbbMWm0I+i4Qi003zHKAp0OIVa4ShhnCrBaJ+mptUdFXHopnowFYoKel85FDYTCG+SvTN+kcmTVMwNbJJseSsKBXd6Pitxj5TkBwI9h+KGYgHZ19NZNnZvQ97WgxznmioxFXPtGOmml34+VgLuv17FX/quZEpYwm9sZRCz9/3R2m6JdKY72ecrtWRuYXihCnBAIWDPuz0IF6XwHhowUYn72cmhDtUKGt0bc+/H56TTS2iZb1HndC2P2tqIRegoDkbnzicN0siSJYhL3Nm3XxTkXt6Z5wC0qmAkLXPKI1/L8DWDiHcF2MkzOKK86wZRU92wZ1Fx3DKkttMrQ4Jq/jBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ef7+VZ2ZYFBrc2QzaJ+5nH8B1iIZcXzTFWC/Hbqkos=;
 b=W52+rqFbPBVTSI+2G21I9BUmk18rL83UOc+pLqQMKlzLbLOwu4KMWxVLigBm58e1Pj/CBDVJUjTprNHIb2qrZw/tKP/dLS69ehNpjwVvLiDOiKtg2vejOKG5dyedXawv1OIJvlM5JxEi9keMnVs940OzCvXzuD1opwIuUjZOkr3GogWyNqBTVDNiTYL8qeKymL7viTPreRs7oQ95pKtTzkzV+aSn7kVqUStiR9CUUCYqGImRpAdSuvqD7nUgmMkx/CvgKq7ySE5gE+slHm5VQpUOAnItKQQI85x5YflBJ+XY1LVU1qp9jW8hQvMiP5ZRr7/XQWRsfzQXq+3NiDXgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 23:57:44 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 23:57:43 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVzIHN0YXJ0?=
 =?utf-8?B?aW5nIHdpdGggW2ktZy10LDEvMl0gbGliL3N5bmNvYmo6IE1ha2UgcnVubmlu?=
 =?utf-8?Q?g_under_Valgrind_quiet?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBzZXJpZXMgc3RhcnRpbmcg?=
 =?utf-8?B?d2l0aCBbaS1nLXQsMS8yXSBsaWIvc3luY29iajogTWFrZSBydW5uaW5nIHVu?=
 =?utf-8?Q?der_Valgrind_quiet?=
Thread-Index: AQHbiQZ+CXdY1rfDHkqjllxdoAxw5bNb1PGA
Date: Thu, 27 Feb 2025 23:57:43 +0000
Message-ID: <CH0PR11MB549159BDEDC18BCC748BB414EFCD2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
 <174063814648.2601346.6022084386360518790@b555e5b46a47>
 <20250227105736.mfszr7xkbmx3ygi4@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250227105736.mfszr7xkbmx3ygi4@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|IA0PR11MB7378:EE_
x-ms-office365-filtering-correlation-id: e09bd1e8-1df3-492c-3e12-08dd578a86ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MitLL3pOYXdUcnpVdjJFSHM0a1dsTDhTNitYY2l4UndIZWRuTTVQb0N6c05C?=
 =?utf-8?B?d0lVV2pGNk1ET0VCTjJKczBVNTgzMU8vMU1ldUNRYkFqa29XSCt4TjQyOXk1?=
 =?utf-8?B?UDk0NHBDVnN4Snc1cHdLM0l5MXlBZkM5eURHdElJNm84b0ltMUFtQWswb1VB?=
 =?utf-8?B?THJvdDBnNVJpc2Z6aHEzV3Job1FnUk5wUVAyUDJ0S0wxbnlEOC9MNDVWMHFh?=
 =?utf-8?B?cld3OE45ekdUWVhkKy9HdUc2NklMTlhaQVpXNXEzayt3dGVZRXJWdVBmMW95?=
 =?utf-8?B?OEZGQWJXYXl1SEZPTzhBcnFkdTRpcm43UzltN1MwdjFZa1VDMkxLNXlvMmlv?=
 =?utf-8?B?N3M0TVJpaGNNQllLYm5GNHIvR1NyenM3ZEpRbkpZVW9tekVHVjBsQTVtMTEw?=
 =?utf-8?B?b24zZU9nai9DSEcyUHloTkIyb1pSSUhMTSt3WGpHbzdRY0xvWDZDeFlWQVN4?=
 =?utf-8?B?SzFxWVhHRU1ySklxclF0MjVwN1VuR3JkWXdWVzRLSUVIUXVWTG9hbU03ck8r?=
 =?utf-8?B?ODRKbWcwYWlPdmk1a0JYZjJtdUtyMWZoRFBuYm16elRYeUExRHhHc1hGaGFC?=
 =?utf-8?B?bzVtWXoyT3U5ZXIxZEY3NFRBVnhScVYrVmtYU3A4MGRmSUJtZDdabENwSHE0?=
 =?utf-8?B?dUo3ZFBZVm43ZWFvdUc1SHNPNFMyMFVWazFabk01emtVT0syTmFVTitMQlBv?=
 =?utf-8?B?NG0zZlNBbGVYbnAycUFJSkxRYzdzYTRMV2hCazZ0L3N0WXgraUZLQktuZ1V2?=
 =?utf-8?B?Y29oL1RWVnhTUG5EcklWQTRJWExGaWdqTk1yU25lZkFkRHdYTXRCOEZZOWdH?=
 =?utf-8?B?Ym5IK2JWKzRsWlpteWpjVHp6dkdYbE50dkh2UzJOMU9MTmhvRDVob1A3UTJ4?=
 =?utf-8?B?SERGdVRXZVlpVjA1OGhtNWNtMHhCN25XTzhlNjhmWlRYM2NIbnhhckcwVWJq?=
 =?utf-8?B?d3dpMUN3WkdzL0FaZEV1dXNaakhoSGUxNTgyQ0hjTm1acUllWndROGZnRHFr?=
 =?utf-8?B?Y09jelg0NjJSRFpreEZGRnk2WU5WUTl5YzQxcFdxaHRwZG56RUhRV1dJSGpo?=
 =?utf-8?B?NWlxN3FEdGF1dUFCUFk5djlFUlQyc0JyS3dtRlNtcXlvenhqQzBINW5mOWhB?=
 =?utf-8?B?S2FyMWZaQ3pOSG9xdDBOYnNJVFRNNXc0WWVmRjhXcitSNXM0V0ViQU4rSHVR?=
 =?utf-8?B?Ny85NHdkN2puQmtIckhUNG5GejBEMGNiejRRMGVZU3BqZnZNaWhjZkI5eXZ5?=
 =?utf-8?B?dHVMSEp5WDNmMzY2aXNUbjVpS2VoeFNoYjk2K0xwRkVCYXh4anowYjZjRU0x?=
 =?utf-8?B?OVY3cUNZZFdKeTdMT1c2ZTAvdmQ2ejc3Q3oraTVSUnJISzdxbExGQkd1UkZt?=
 =?utf-8?B?YVlXSXVEYVRkMENVU1kxcXFKN0NpeU5OajBjY1JOeHJBcG1NV0M2T0RiRTYx?=
 =?utf-8?B?UGtYam00YWxubi9qbW5HWi9tREl4WnNiYjFkUjgxTFhLUUIza1kwVDFXaHdV?=
 =?utf-8?B?dUp3bEZwOTRrYVBrOCtFRDVDMFRwQmxvMGhZM2o3K1JzT3lrSXU5M0p3L3JZ?=
 =?utf-8?B?UWxOaGxhMDRBK3dJV21PaEl6Sk1uU0tTS2RjbUxIZHZIVStRNnVSL3p0VUpM?=
 =?utf-8?B?VzdIcjRBQzYreHBkYXB5YmFSTlVrbWVyeDgxREZndWhIRTFrVEFzS2kvbG9t?=
 =?utf-8?B?TDFyODFMeUI5L2NmdDRkdW5xMGNsNHpSN0d2RHZPTXZRcEZYbWtySkd3dEJF?=
 =?utf-8?B?UGZXOEtsSzU4dENpV3I4VEViM1V3QUQwby9uVGpnbjAxR2NqVFVya05YTHZN?=
 =?utf-8?B?b1Q1MG9hZTU3VnVhbVc5LzZNL2pqT2VoZmI5REdFdDVIVmJ3SHFmUjc1QXhO?=
 =?utf-8?B?V09UVE15NDRlUVBQaHdCYklIQmdRaHFGUHhUVnM5SVlnUVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnN3dC9UdVQxbU1keEMzbzBMaW1pRERJdUV5SWJPaGN0cjNDV2tDMWJKVkF6?=
 =?utf-8?B?RHlPMkp2T3lmY3M5UzBFa05rMjhnbEQ1NTBDZE5xWE1xbnEvV2FwRUd1Y25w?=
 =?utf-8?B?ZTRJa0JhcDYwclYrejhmODJZdUdqbHZxSkduajZaRnhFYTdCeVZmcmdUWTBR?=
 =?utf-8?B?WHFnYkQ5NFJ0eTRHb1lhZFk2T2lGUkVTcXpDM1NzMU51THJpZGJKMVV6WlZI?=
 =?utf-8?B?WDF5YkI4dStsTm82WGphNlJlTjlaR0NkSnhxVUxqV1ZrZ0R3Q21uWlBFTlJa?=
 =?utf-8?B?alRSUytsYWoyRTdzc3J6WndwZWpQRGo2Qk1HU3NWZThKMzlsYzhsOGNObjZm?=
 =?utf-8?B?NFZ3ZUxLNlhtNFFtb3N6WE54VzJGVHNWMithNjQzT0FjN2c2cDM5b3dmYTZw?=
 =?utf-8?B?Q05wWUtzTktaRjRGeTRhd1Y4NGZEN0NXZnJKZDVaZVk1cFo1L1NQOFlIS3Zp?=
 =?utf-8?B?Mlg2WFBQaXV2Sm4zUXRqdndrNVRZSnJicFN0SGhESXpURjVBeHYveVI3WmJ5?=
 =?utf-8?B?dHFQZHZiTVpVM0xnMGNPQWxocVZtTCtNN1V5U0NGVzFKcGZLYjVzc1BCeUF6?=
 =?utf-8?B?MW9MbG9UdkQ5TFMrcnY1blBOT2xxTDdXS2htNXlWUmNBb0lwTkI2MXdscTE3?=
 =?utf-8?B?dk51L1RpS2JGendvcUUybE1zZldYRkl4SlFqdFZ4WWhlYlNrQkgzUnRaU3VQ?=
 =?utf-8?B?bVFlYVFsWWJ3UFRKODluR0d4R0RmT2VFZkVpdGlmRnVJUWZRM0lqZjczWjBq?=
 =?utf-8?B?blZ0Ti9razFYOUd0YzhVdHZOQnV2ekNoNEFXNzAydFRtdVVzVXk5N0l0UG9s?=
 =?utf-8?B?dDBua2Rlb0RZZnRQcG9nanY5NEJaTWFwZzJUK293MXFOV1RlZmFmZm1NSU1V?=
 =?utf-8?B?SlZxeVlTbXYrczBqMnpzdG9wU2ZWTXFJWWdab0l4QlpPaTBKeGJ0VU9uNHNu?=
 =?utf-8?B?Ti83M1JkWU03djBUNDd1c0hsaFpuT3lHUm1NUVp0WG5OdHEwdnBaTS83aEE1?=
 =?utf-8?B?QnU3YzFva1lqbHhMOXhRdk9nUldtMGJqd3dKU292YVRvZDE3ZzlvZm82VE11?=
 =?utf-8?B?N0haNXQ4TzZMay9EWTFUeitpV00xOVFGbHN4c0lVWHRweUtwU1UyTzhxRlZi?=
 =?utf-8?B?RjlMby9hcjV4WlpoSWwyOW9xaGlLQlMyaWhxbDdxTk1rcUpvMFI2NERkZVVH?=
 =?utf-8?B?UkxIM1VxSlZLeCs5dGd1MVFDa1RJZ251emJDenZGMm1tQ1JHc3ZibjRXY0Nm?=
 =?utf-8?B?azQzNm5vMlhLZkVrL083WWQ5MTkwOTRCeW5HZGZzU2szTEkwaFZOUjkxOU00?=
 =?utf-8?B?anNaMEdKY1lORk5rWS9LVll5dkZuZm5ocS9xSzUxTzkxS0hSWERGL2FDMnNa?=
 =?utf-8?B?UktEVmdhQUNxclBlKy84bC9OS0lad0svZHl0bEVCUFRka2tScmkzTXVsYzZ5?=
 =?utf-8?B?MU5hMmRaL1ZWTTVEb2RHUkZKU3o0N3VJSWdNTmlBeHYvWkFpVHk4aGhaYnhS?=
 =?utf-8?B?U0lRQ1k4aUsxQ2h5VmN3elpPb2FlaHAxaldXUEVZcUwxNGhSSTJxcURSbGlW?=
 =?utf-8?B?S051Y0tMOGxCdnBaUDl4Y2JIblFGalJRNEUwVVMvZjFXeWxxMTE5Qy9FVjBG?=
 =?utf-8?B?NjJGTWwxVTlINHlMb0F3VVZjRTB4b2JFNlRoc1FoNTVYR25OSVd1SjVUMGZ4?=
 =?utf-8?B?dU5aRFExV2laN3V0d3IrM3VXeWJ0YU5GNWpuSTNXaCtkR3piQ2Zkblhhbml2?=
 =?utf-8?B?VVpDamp4eldSTDBpZ1JpSkVmWThqMGFmMTMxTkk1OXFPOEtTNm8vUHhjKzR6?=
 =?utf-8?B?RFRtWUdCdzZiQmc3TmFGdmRRTHlIc1ljRnpaT1cvbldEeEZvaUlMcmkwWWVE?=
 =?utf-8?B?N0xUVm9PRTB1Y2kvWXlua2Rxa0xySzJKVi9heko3czZ2eGVFd1JsOVRjTDlI?=
 =?utf-8?B?ejlrKzF3eE5vRWE0b1dDeUliK243TTk1MllDQjFJU3ZtY2tseFQvRXhzcUV4?=
 =?utf-8?B?cVdIcXNIWmN5ZWlaRGpDS3hXT2VZemU4VHlpU0I2bE53cks5dHlhNmM0MStw?=
 =?utf-8?B?NjNuUGJiTGQ4YThuRXAwRFk4OU5uQ3FCQWYvbmErYS9pSVRSaU52aDcxQTBt?=
 =?utf-8?B?SDMyeXNCQkRoVXRkcC9vTEc3VlZSMVhQUTZWNHFTY2xyaFZvSm5ZU2R3bkt0?=
 =?utf-8?Q?yixSGhm843PiF9bg1LyqvHquTuXt5I+z2vLP0v7jQ5u3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09bd1e8-1df3-492c-3e12-08dd578a86ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 23:57:43.6658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IRoNyvFjT2SXFgFU9R4k1RocHX89v3hfAc5/ipscQA6cGsbpDRS6uwvYwHCaKUCLvktvULK2sbkomm84ENfj3ZbmXa8Q7eEKsyk188i54l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ1NDAzLy0g
UmUtcmVwb3J0ZWQuDQoNCmk5MTUuQ0kuQkFUIC0gUmUtcmVwb3J0ZWQuDQpYZS5DSS5GdWxsIC0g
QWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBjYW5ub3QgYmUgcmUtcmVwb3J0ZWQuDQoNClRoYW5rcywN
ClJhdmFsaS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5m
cmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBLYW1pbCBLb25pZWN6bnkNClNlbnQ6IDI3IEZlYnJ1YXJ5IDIwMjUgMTY6MjgNClRvOiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28u
dXJzdWxpbkBpZ2FsaWEuY29tPjsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
ClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHNlcmllcyBzdGFydGlu
ZyB3aXRoIFtpLWctdCwxLzJdIGxpYi9zeW5jb2JqOiBNYWtlIHJ1bm5pbmcgdW5kZXIgVmFsZ3Jp
bmQgcXVpZXQNCg0KSGkgaWd0LWRldiwNCk9uIDIwMjUtMDItMjcgYXQgMDY6MzU6NDYgLTAwMDAs
IFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczog
c2VyaWVzIHN0YXJ0aW5nIHdpdGggW2ktZy10LDEvMl0gbGliL3N5bmNvYmo6IE1ha2UgcnVubmlu
ZyB1bmRlciBWYWxncmluZCBxdWlldA0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMTQ1NDAzLw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1
bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdUXzgyNDkgLT4gSUdU
UFdfMTI2NjUgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0K
PiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xMjY2NSBh
YnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCg0KVW5yZWxhdGVk
IHRvIGEgY2hhbmdlLCBwbGVhc2UgZmlsZSBidWdzIGFuZCByZS1ydW4uDQoNClJlZ2FyZHMsDQpL
YW1pbA0KDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUg
bm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18x
MjY2NSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZh
aWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiAN
Cj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEyNjY1L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMg
KDQ0IC0+IDQ0KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTm8g
Y2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVz
DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hh
bmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMjY2NToNCj4gDQo+
ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMj
Iw0KPiANCj4gICAqIGlndEBpOTE1X21vZHVsZV9sb2FkQGxvYWQ6DQo+ICAgICAtIGJhdC10d2wt
MTogICAgICAgICAgW1BBU1NdWzFdIC0+IFtETUVTRy1XQVJOXVsyXQ0KPiAgICBbMV06IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgyNDkvYmF0LXR3bC0xL2ln
dEBpOTE1X21vZHVsZV9sb2FkQGxvYWQuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjY1L2JhdC10d2wtMS9pZ3RAaTkx
DQo+IDVfbW9kdWxlX2xvYWRAbG9hZC5odG1sDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RA
bGl2ZUByZXNldDoNCj4gICAgIC0gYmF0LWFkbHAtMTE6ICAgICAgICBbUEFTU11bM10gLT4gW0FC
T1JUXVs0XQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvSUdUXzgyNDkvYmF0LWFkbHAtMTEvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUByZXNldC5odG1s
DQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTI2NjUvYmF0LWFkbHAtMTEvaWd0QGkNCj4gOTE1X3NlbGZ0ZXN0QGxpdmVAcmVzZXQu
aHRtbA0KPiANCj4gICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAc2xwYzoNCj4gICAgIC0gYmF0
LXR3bC0xOiAgICAgICAgICBOT1RSVU4gLT4gW0lOQ09NUExFVEVdWzVdDQo+ICAgIFs1XTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2NjUvYmF0
LXR3bC0xL2lndEBpOTENCj4gNV9zZWxmdGVzdEBsaXZlQHNscGMuaHRtbA0KPiANCj4gICANCj4g
S25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgY2hhbmdl
cyBmb3VuZCBpbiBJR1RQV18xMjY2NSB0aGF0IGNvbWUgZnJvbSBrbm93biBpc3N1ZXM6DQo+IA0K
PiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIElzc3VlcyBoaXQgIyMjIw0KPiANCj4g
ICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+ICAgICAtIGJhdC1hZGxwLTExOiAgICAgICAg
W1BBU1NdWzZdIC0+IFtBQk9SVF1bN10gKFtpOTE1IzEzNjk2XSkNCj4gICAgWzZdOiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MjQ5L2JhdC1hZGxwLTExL2ln
dEBpOTE1X3NlbGZ0ZXN0QGxpdmUuaHRtbA0KPiAgICBbN106IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjY1L2JhdC1hZGxwLTExL2lndEBpDQo+
IDkxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZl
QHJlc2V0Og0KPiAgICAgLSBiYXQtdHdsLTI6ICAgICAgICAgIFtQQVNTXVs4XSAtPiBbQUJPUlRd
WzldIChbaTkxNSMxMjkxOV0gLyBbaTkxNSMxMzUwM10pICsxIG90aGVyIHRlc3QgYWJvcnQNCj4g
ICAgWzhdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MjQ5
L2JhdC10d2wtMi9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHJlc2V0Lmh0bWwNCj4gICAgWzldOiAN
Cj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjY2NS9i
YXQtdHdsLTIvaWd0QGk5MQ0KPiA1X3NlbGZ0ZXN0QGxpdmVAcmVzZXQuaHRtbA0KPiANCj4gICAN
Cj4gIyMjIyBQb3NzaWJsZSBmaXhlcyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfbW9kdWxlX2xv
YWRAbG9hZDoNCj4gICAgIC0gYmF0LW10bHAtOTogICAgICAgICBbRE1FU0ctV0FSTl1bMTBdIChb
aTkxNSMxMzQ5NF0pIC0+IFtQQVNTXVsxMV0NCj4gICAgWzEwXTogaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODI0OS9iYXQtbXRscC05L2lndEBpOTE1X21vZHVs
ZV9sb2FkQGxvYWQuaHRtbA0KPiAgICBbMTFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjY2NS9iYXQtbXRscC05L2lndEBpOQ0KPiAxNV9tb2R1
bGVfbG9hZEBsb2FkLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGV4ZWNs
aXN0czoNCj4gICAgIC0gYmF0LXR3bC0xOiAgICAgICAgICBbSU5DT01QTEVURV1bMTJdIC0+IFtQ
QVNTXVsxM10NCj4gICAgWzEyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RfODI0OS9iYXQtdHdsLTEvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBleGVjbGlzdHMu
aHRtbA0KPiAgICBbMTNdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RQV18xMjY2NS9iYXQtdHdsLTEvaWd0QGk5MQ0KPiA1X3NlbGZ0ZXN0QGxpdmVAZXhl
Y2xpc3RzLmh0bWwNCj4gDQo+ICAgDQo+ICMjIyMgV2FybmluZ3MgIyMjIw0KPiANCj4gICAqIGln
dEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+ICAgICAtIGJhdC10d2wtMTogICAgICAgICAgW0lOQ09N
UExFVEVdWzE0XSAtPiBbSU5DT01QTEVURV1bMTVdIChbaTkxNSMxMzc2MV0pDQo+ICAgIFsxNF06
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgyNDkvYmF0LXR3
bC0xL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmUuaHRtbA0KPiAgICBbMTVdOiANCj4gaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjY2NS9iYXQtdHdsLTEvaWd0
QGk5MQ0KPiA1X3NlbGZ0ZXN0QGxpdmUuaHRtbA0KPiANCj4gICANCj4gICBbaTkxNSMxMjkxOV06
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMv
MTI5MTkNCj4gICBbaTkxNSMxMzQ5NF06IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9k
cm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTM0OTQNCj4gICBbaTkxNSMxMzUwM106IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTM1MDMNCj4g
ICBbaTkxNSMxMzY5Nl06IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9r
ZXJuZWwvLS9pc3N1ZXMvMTM2OTYNCj4gICBbaTkxNSMxMzc2MV06IA0KPiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEzNzYxDQo+IA0KPiAN
Cj4gQnVpbGQgY2hhbmdlcw0KPiAtLS0tLS0tLS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIwMTkw
NTI5IC0+IE5vbmUNCj4gICAqIElHVDogSUdUXzgyNDkgLT4gSUdUUFdfMTI2NjUNCj4gICAqIExp
bnV4OiBDSV9EUk1fMTYxODkgLT4gQ0lfRFJNXzE2MTkwDQo+IA0KPiAgIENJLTIwMTkwNTI5OiAy
MDE5MDUyOQ0KPiAgIENJX0RSTV8xNjE4OTogMWFmZGU5MjYyMDRlNjRmYmM4ZTRlOThhZWY0OWY4
YzU2MjI4YmY3MCBAIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1jaS9saW51eA0K
PiAgIENJX0RSTV8xNjE5MDogODU0MWE2NDE1NGNkOGI5YzA3OTc3ZGVkYzFkMjI4ODNmNDMyNzlh
MCBAIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1jaS9saW51eA0KPiAgIElHVFBX
XzEyNjY1OiAxMjY2NQ0KPiAgIElHVF84MjQ5OiA4Y2IzNGYyNjBhMjg1ZmY3ZWFhM2Q3OWNmNzFm
MGE0OTYwZTRjODkwIEAgDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0
LWdwdS10b29scy5naXQNCj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMg
c2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18x
MjY2NS9pbmRleC5odG1sDQo=
