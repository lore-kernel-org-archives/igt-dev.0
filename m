Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DCAEE0209
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D1310E950;
	Wed, 11 Sep 2024 05:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeKsj/TV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4754610E950
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726032788; x=1757568788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LsGxTza8YcMBZnZRQIA9Yxo9tJUUY6Gt+2FZEPy5kDM=;
 b=PeKsj/TVtB26MuUJ/IILCYsE4pj3pyP9vXiv5w63szDWfNCom3GvbdWl
 ys89nLK9WRt5j3iywDLdA7pUJYCGFK2oOngz7x/L3RRQoYP8fy76BsNh5
 R+TBDSkLfFgxyBDJsTGnmcLSA15kC7FcTrFui8BeEyRwKoqCXI5tyNvu7
 vh1E24i6dExZhfrYdUQfjUglwPdICwyna/KSAVLrKf06mpC4Lu2pXvqvw
 kfivFMnszOaSQi78R5pJekJaKLcYVkWS61iWdalPveQv8StVMKZlD7Yf1
 a6s9cIRqAW1U7vdncd9AppV+JZQ+cezoE7K5gmUhAgiq7Fq5xI9Scr9B4 A==;
X-CSE-ConnectionGUID: 0ft7JN5iQIqF0+Apc8fyrg==
X-CSE-MsgGUID: QhT2LzvNS9ipM9bOVM6XUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42332086"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="42332086"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:33:08 -0700
X-CSE-ConnectionGUID: M19n0F0QQnWEB5NwWspPdA==
X-CSE-MsgGUID: z9S/apebQAukBGhcgKKTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71627551"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 22:33:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:33:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:33:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 22:33:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 22:33:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLu1DdNGQ3CYWrqmCrjMn0Q7mvNM/dJnhIU4AVolbaH5e94R90vZQyC8mT2vjEMI1Wp0URdpNe0caHo86QZkEAYoVM7g0oxqj6EBlOWdNAkbp1hcIxcvFoxNFE538Bsp3XleRsTcbdyliULS91KSZMkkjwytz8oJ9MAlA09RG2KexUCq1yvvgkKB28xJ3zggb9xtFZqhsUQ06PPSekyLlovY7jsiaRUcwloSljxs2lHCg6EWjfP+mzTIEcvoKlFFV7KnotVc/LvIWfhZxPw3RiZJAnOTf0yItkx7oTwIPjNOD3t56HtTIxJV83CtGK0UOEkHriF5T3BhoJykJ3EKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsGxTza8YcMBZnZRQIA9Yxo9tJUUY6Gt+2FZEPy5kDM=;
 b=mX6Fvoy4lJUEVxTQ/I/vI578rwsvIe/BjrmtEsqAS7vSkO/hHiMHzMp10qOH+30/ujOhwiYbMI2rTvIGLz49yZU0llakL6w/HplbjiuoyaMtxaBgWGKajl5b45Hc8oIqJayiVY/6oFkgUyN36aiSr6hLvtW+BtsIwWurNwd0L/xM3es3jxWtal9a3fAXAEowJjC14nCmOQ0sCDwVbmjaO4GdXv5005Lm0Q/OFTHKXCwtldUVPHO2L6Kdr9swOY2tN1ZLUC41a5WKfiJe6hNBtfyIv2SP0xvoqVSprrqkw8ZJyRpm+bPkaf5nqUG6HUIiAF5vso7mbytTFY2ULWfFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 05:33:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 05:33:03 +0000
Message-ID: <71a98f56-ac4f-4dbc-a1b2-e410d19b6657@intel.com>
Date: Wed, 11 Sep 2024 11:02:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_joiner: Add tests for Ultrajoiner
 validation
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
 <20240812044739.5630-2-karthik.b.s@intel.com>
 <72b2906b-1cc0-4895-9cfa-589f118390fa@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <72b2906b-1cc0-4895-9cfa-589f118390fa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: db27605e-3b08-4150-b487-08dcd22334a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmFyYitvbWpTbHFlV2ZpSSthMzA0SEhvS2lGMm9jOFZCSHMwZ3R3UmVpLytw?=
 =?utf-8?B?cTNhSWNGc3MxcWh5WjhnUlJ3WTVUMm0yUjBPSm12WmVNaVozWlJqdkZ1aEM4?=
 =?utf-8?B?Um1DY1lXbHl4Y0R3aDN0S2tsOTJ1bFdkQzNaT1k5SHVpZlNPaEZ0U3V2K29w?=
 =?utf-8?B?aVhCdDh5YXVrdE5FeTVCZ3RTNG1XWkVOMkR5ZWxQTWtkZHhzZFJnSUlVT0ZK?=
 =?utf-8?B?bTY5clkvbVlkVHZNMys0dE02L0pzZ0hYYlVudzgrd1l0Q0puMVdhS0pvSzZ0?=
 =?utf-8?B?V3dOcGNJSVgvVVpjdzY1Q3g1MmE0YVBSdVAxbjZrcDIwQXJzRlZ6NnU2Rzhj?=
 =?utf-8?B?Q0xGK1l5bjhVaWswcEd3U2ZnWWsyWTdJK2JuY0VKOEpPdGx3TVV0ZUxnaTh5?=
 =?utf-8?B?S3BqZWdnalc0L3FZWXN0elh3T0cxUFpZZEREZnd1SmV6U1ZzRnI0eXpNUEJj?=
 =?utf-8?B?aUFZQjNheTNsOElFUWZwNEV0TitXRGlXc1dPVU1mVXZIRmR0bFMyaHJNVzdh?=
 =?utf-8?B?Qno2QlYvbEJJUGVHZWpWVXMrTkNtL3MrNHFrcEFFVTV1S1dWQzJMNG0rbm1h?=
 =?utf-8?B?WlNFZ29BcjYrSDBsc29tS3ZsMFhXaUVyRkFGUkVhREhCT0tvOVQvTGhjelh4?=
 =?utf-8?B?d1kxdlI5bEpYYU4xSXN1bmVYSDdhNWVXRXlhMEo3MS93dzk4VllZbXpsZ2Jr?=
 =?utf-8?B?MmFSditVb01aR1ozQ0lGN3BmN3NTcGs1eUhtZzFSR1VxcFAxdWgvbzlJTFFx?=
 =?utf-8?B?YkxLNVl5RVVkckxsREhiRU8rY0lTZUM4Y2VmdU9XWU5iQkhwUnd2OWtteWJy?=
 =?utf-8?B?SzZyeWFnMlVBKzl6SjZDQWIwbG4xUmJpeFBpd1c3YU54RURqY0xINU9GRzNL?=
 =?utf-8?B?QnZ5anJaeE95RE5BSVZDdm42dHhYcUQrZ2JsZXB3bG9YOWpWSXZGdXBmT3JY?=
 =?utf-8?B?b2RVLzhwNmVBTFcyZlFhdkNJVWExTlE0SWptOS90Qko3bHNvK3pybEZYNmlJ?=
 =?utf-8?B?UEdiRkFhU1BBcW04NDd0MWJnZlZQMVJkQ2dnNG5UY2FCN2FnZnJDd1RKdTFF?=
 =?utf-8?B?VHVoL09FU0pTdnJkU3VjejZtRUtYR2lWWXJpY2pGODl1VWVPZnB2c3FxWnpE?=
 =?utf-8?B?bTdWZlFKUXhZZUxPYWRFeVNNZlhOWGJ1aWkyR3BiU1pIcHdFdzc2dE9pdGF5?=
 =?utf-8?B?RUpXTG11SFNUSENFV1NubUNyNUVGeUxYQVVhT0JuMDQyNG1QQncxYUxVdTZw?=
 =?utf-8?B?T2pFMStXOEMyL2JUaFB0UUErZmpxbm80MHpFcnF5SXNKcndXZTA2OHJuQmhY?=
 =?utf-8?B?QlRlbHhKS2ZUV3kvTmc4akRYODE5TWFjc1pMYUorUmlZTm5FRkg1R0U5eGVZ?=
 =?utf-8?B?SDZOSlRZa3BlVjdBUUtOYXJQaGRLSDJrbmk2TjREQnV3OGVPcXpSL05rSkd1?=
 =?utf-8?B?bVg2VnkwaXltaVVIQmpwdmtmNC84MXJQbmN2VlQya3hBNEtUZDM5NGFXTEhL?=
 =?utf-8?B?WVNoTXhLcjRleFFKT2NRcTdmb1YwVXBsOHM1cTY0TzRRY3BrRXprcktSbXlh?=
 =?utf-8?B?aldWbC9jTnZXMWwrUDhNakxBZUpoekU2bEdSb1lEQW9MWFNSTG4xWTdhalVx?=
 =?utf-8?B?ZldFeGFZV24wU2VHWFkxWUUzVTc5TUl6eHZpN093M3pySHhnM3JSVTB3MDJ3?=
 =?utf-8?B?R1R0YXVRSlg3R0owaUQ0ZXgxWjFPV1lBelRjK3Q0dzhhU0o4bEJDekZmaG9M?=
 =?utf-8?B?QWlaN0IrQlpQWjdqT0ZyUVJLNXJac0I3TUNGYnRvRlYyeDRlNkE1N2N0ODR2?=
 =?utf-8?B?Z1VVWGZMMjgrVHFod0c2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjQ2dEhYaUVZRU92NmRGUWtjT2xOWHBYZFpVWVhmbHo5VGJ1MUxBSXpzK3VN?=
 =?utf-8?B?UjI0T283OVloMThVQWxjQUFLTkFuYkYvdW1LQTNZN2QvSnZHRjdEU0I0T1RC?=
 =?utf-8?B?QmxJVG5oL04zeXZmd2dJRmhPU0FaWjcxSk1SUXJBT1g0L05OWU1VNGJCa0Y4?=
 =?utf-8?B?ZVpHaXJhd1BoWlQyMFV3TEoyYytwOFJpRVN6aVJrUFZWdTdJYTd4WTB6VldV?=
 =?utf-8?B?TjRQdE1USnRIRW4xRjVUZFVpKytkMGtmdUhkZUZiWTBmMUVNRnh6ckN1dHBk?=
 =?utf-8?B?amhBb2N2QjQ5UDV1RDBvK1Z3MTJtK2kyRDVsL3FzYXl2QXEvMFpIUHd4UTRt?=
 =?utf-8?B?bFZGeE9oQUJpT1IyZ08xbVpFSGtkamtWWWZqM1Q5SmRUbEd5NlBoclJLQmxT?=
 =?utf-8?B?VFlMbTBNalpidHliY1ZCM2xsTkViWU00UnJ3YVlRVG4xaitHcjFSSjhwMWMv?=
 =?utf-8?B?OURoMlBENDV2dFAzQjBOT0x2cGNtRTdWZTFEZTBOME5VWXBIRXpjZ1JzRy82?=
 =?utf-8?B?cXg3V1NvaWQyanZld1UxUlZSQ1pNbitDWllLV0gycnhGTGVzY2ZWc1Z3bHVT?=
 =?utf-8?B?OFc3RVRJVVQ0MkRSODJoTjdCN2R1TTZKdWdiWlplczg4SWdmdy83U3UxZVNV?=
 =?utf-8?B?M24rb0ludXRDVjRlVUFOb2pTclB1L3hXM3YrUS84K1kvTU50UjgyNTNneTZV?=
 =?utf-8?B?QjIvbjh2WWx5UEV5WG1idkk0V0czb2RiSjR2c2dqdjJqZEtRRHNtN1d3S1ZZ?=
 =?utf-8?B?R2Z6K3U0T2xJUi9uYy85b3hsUmdEWEhuamMxQUJ4RWFndTJhM3JHSi9qOVBk?=
 =?utf-8?B?eGVUTDVkK0gvRTlIYk5lZVhvNXhnUlNsUG5EdXVobUJwMzRwR213UzJRMk5r?=
 =?utf-8?B?c3FpemhUZFBMNS9YdE5pTWVqaENUOUhLbE1Gc3hPdFU3OUcyNVh2SUFadW9v?=
 =?utf-8?B?d1BBdmQrT29yYmkvRkVxWnN4QXY3cjNhNk10V21IdlhQclZCV2xvMCs3eVZR?=
 =?utf-8?B?Ui9PQzlaNmkvUXZrdWY3cGRYNGpmZGN6bzlqSnNVV2lxNlV1QXJXL1VHTlla?=
 =?utf-8?B?REszTjBYd1FkTjY2NkFUM2R5dWVOcHpiUndsTmdrYnlpbS9tNDBjcjB5ampV?=
 =?utf-8?B?UFV0YUpqZnY2N1R2cEdVUVJyZC9sa282WUs5cEpyR1pHd25zSlp5dE9JQlph?=
 =?utf-8?B?NjFBcXczR00xOWN1Rlp0NVAxQUtKU3JJLzN3MlpxZ21hWUQvR2ozcUZzWnkv?=
 =?utf-8?B?U1FJdWhCRkUwaTJSUWxJVm92SVlvUnIrYVJtUzN0STB0RUhhaWZRK1ROMmV4?=
 =?utf-8?B?ajliSzhNVHFTZTlMTDdwcTZ4cFZqUWlNMEkrSUM2N2U2cXBNZXErK1h6bG0v?=
 =?utf-8?B?TE93QzNRZlBscFpKc3cycVFwMGRUWWtOcmRtby9RMHI5SEpLazdyK3FXa3R2?=
 =?utf-8?B?UExXbGJMRG1rdXk4L3lrQzhQNDRuOGxXWm8xNG9SNnY5dmhXSVdLakZpUmt3?=
 =?utf-8?B?eUkzSzcwakNBa2ZUSW1KdGVON1FzZmx1QVhnQXRnenB3ZHU0cDdPWmxzODVu?=
 =?utf-8?B?Q3FoNW4rTzJSbUp6eHlkc1A5ZWlLV0dRSDFSR2R3UnRnQ212bTlPQzBlanFU?=
 =?utf-8?B?RnVjbU9UcmJHdFUya0Rnbk9zV3BzMkdBRk1pR2tNNmJJakVsK2d1ay9JL3hk?=
 =?utf-8?B?Tkdtbld3aGJ2RVQxVk1mV2hJY0pkTForYmRjL3p1bnRtODVoNTVpck1Vd3pK?=
 =?utf-8?B?SElua0JqYTF3RlA3VDlKOE1UQXk3TExTSDFUdmNQRHVyNytIVnpIb1owVnhB?=
 =?utf-8?B?SmRXTmNYOVRrUjIvYjV5ZTJJRXV1WDJMQk4vdmxOakc4MzUyL1hEeGdEMVAz?=
 =?utf-8?B?WVFmc0MzRUVKMklZSi9hcGJTRDI2YkhkVitpcy9XUkRMdVgyMCtqOUdqS2xI?=
 =?utf-8?B?TkZzeFFyUWQ4NWVVZ00wY2VKVm0wMnlsaEp2Rytza2lpZ2hXcUxiVWV5TjFr?=
 =?utf-8?B?YmxSM01HOUpkZzdEajRxRkxWUlgwZGFsMXNkZ2dZQ0Fsa2pvNXlBV1FZeG4v?=
 =?utf-8?B?VkJmMWhnK1gzSXpHbVkrVURPdVNTaXNrTzFHL2xPdlhMWnJTNk12Sldha3Nm?=
 =?utf-8?Q?lw8kdX6Zhfvypkpk3spri3tBR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db27605e-3b08-4150-b487-08dcd22334a8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 05:33:03.3001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BXVKo9JpJzysXOZMHxSEPQi1IQvInib6V09H9TbBHr9aLv3OO6G7PGuD8Hze7IyuNWW/7Xcg5ntDypbLvt2Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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


On 8/12/2024 10:41 AM, Reddy Guddati, Santhosh wrote:
> Hi Karthik,
>
> typo, big joiner --> Ultra joiner.

Hi Santhosh,

Thanks for pointing this out. Will fix this in V2.

Thanks,
Karthik.B.S
>
> * Returns: True if Ultra joiner found in connector mode
>
> On 12-08-2024 10:17, Karthik B S wrote:
>> + * Returns: True if big joiner found in connector mode
>
> Regards,
> Santhosh
