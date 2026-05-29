Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396FECD6E59
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 15:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EB9112181;
	Fri, 29 May 2026 15:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFPYUWiP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1B9112180
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780069890; x=1811605890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uWS41Uh5k4Zym8hxhWcv3TRv5mqG0D/dQwackKyEuT4=;
 b=OFPYUWiPKOvc2mxzRoniywnkjGgMXq5QGmcFcqWijVvEh5OMKIG99QyO
 Hyl+GQyPrUV9NrlbP11DAwHBnHsOWYExUaSZu/U/78o6TJASLTrbWREJ+
 zHhEVqajZQEN60ZHI+Cf8CYuhGQsC6E3IyrJeYgnfLBHBezPszvMjxCZJ
 hb4ILp3jrfCpOWd2eS4EfGwH4rA7zRqeqLukP/hAgX5+nZ3Ns6tq1PDTq
 5keQyKlau41iCt+TKn5a5VyeT1aObNfgeVlbFpPd6dTmkndPwaUW8Xwx1
 P3OV9J6/6AX7D2rWnMP3z5G5RPGIfDltJNiJoPa9zuNCVIJRvD0XlXGB4 Q==;
X-CSE-ConnectionGUID: hE0mcau1TWyOa0/WnKo3UA==
X-CSE-MsgGUID: 9KB5wij3Rte85OCDsc9vNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81107337"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="81107337"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:51:29 -0700
X-CSE-ConnectionGUID: y2Cpyj02SBKIdgQlCt3eDQ==
X-CSE-MsgGUID: cxHmsyTkQWW9DMkFhmvnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="247979021"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:51:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:51:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 08:51:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWdfIERdJjJWtlCiB9nUpmGCI+ACSltn+saeSiyBxXoNaNkI1u3mvNhVfipHTt0Vw4ONg1zNco8eIUdiEr3qSupC4dajga7Ujcnj0NF4F75xmjqw/Tzm5ZPXtkSQMSCnJPOAwmZBUT+esYsc4q6+wAHMJyUJoRx+iLQFJn4Vm0KxSF9xDkuXr28frfLsmqtH0Hy8zJF1tGge2729gK+8usrdEsGdY72gX5/F5c3GC7h+H2hvTPcnEu7+4oHXMtpIvmYj4nQf6f86HaPP0uUQ3ypBCoKH0smrEWxFxIETWm8BKWPZ6evewJDOsHXf7mNZXstNu8u5+2ayCz5SgGXb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWS41Uh5k4Zym8hxhWcv3TRv5mqG0D/dQwackKyEuT4=;
 b=IH16PNa5xvwOfZSYUVqopR0dFzMDL5+ReO7IG875q/mjANpxpCrGjNZOuZ1GeWvJFwDlkQ9HRc44X/FOmCWugLcA70IY4bdGk19y3JiQ1qT1jsHjQby5ShrcnCECKA/WNI5FwITFy1ILuLREYcqkIYBEIqQQIuNGiN06zh6BEkDAXuIJ0NFPV61+tgpJgp+tC5JWmDo6RoyNoetVk5vAiM+Qdvq0fXyd2feupiYEbZ7du74FMA79wUahKbzD663MwdlJ49hIjIb7VZpIpd/NRnUpnRudTD6ia15NV/RMJJn7IJ1o6qF1YqDSPxiwDGkFl0roHVuIk6ggRENAiPErCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by SAVPR11MB9576.namprd11.prod.outlook.com (2603:10b6:806:4e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 15:51:24 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 15:51:23 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas,
 Sobin" <sobin.thomas@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
Thread-Topic: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
Thread-Index: AQHc6HBTYdanRA9ltkWSpYQFKgbRmLYk9jYAgAAM2YCAACZcAIAAC7IA
Date: Fri, 29 May 2026 15:51:23 +0000
Message-ID: <42f2c711a4b6308951e91c08489538620278a575.camel@intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
 <5a9494611b1644f3113d6972e55103e3aeead1fa.camel@intel.com>
 <425e70c4ff7133d6101ed0e52902aa3d73dc3dc1@intel.com>
 <ahmsKpVfFj3G8DP9@intel.com>
In-Reply-To: <ahmsKpVfFj3G8DP9@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|SAVPR11MB9576:EE_
x-ms-office365-filtering-correlation-id: d9fe5000-c8ff-40fc-1c65-08debd9a22c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|5023799004|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: I6lgzGiU6Q7K0o+MhLldZ6aCjo3WWrlotuouM589lwZHAhjuQgATZ6mwiINUbplJRQCSqjumCqDgUiWdyuyHoZvDvf3tdD1fkRJuop/zDtqoXzlVRbbxDibmxzKbGbjLrIx4JB3J7HQBKMLR0wYwvbiA06Dr68Puan4IKmEeX9TaP+TJZQEjOHNIRcu3SdpuQ0C+7K1iChhz4DPUarltDLwgKAqamQ3DmmTnKwNBguEwXig546TKYmVqqMW/cWToDIRpeKjme+HzNzMSPhMWuBtgDU/CjWBMqSieB8b7Z+BERE277jCtTnwY6NQ4WSzL8go+iucY8LuqjRp7BS00IcTJF8LZ0rBkDYT0piZ43BX2wimsQWyB/+3BHKwXIF7QXHE1zMRdJ8Vn6X6Dhkj/zPAiyILP+YQEqhYkadII8GHMz3Mghv9Qv/N5Ke0uBMV6hnWgs4w87cSE2Oo1UelRrxNSD8S9UklebhVdosqgNLUiHXuloKajgpTG5QH7JV5cjYOFTxrC5D4gZxWuZ0sp0PVl1/fXkIMT8A3hixOvmm70nXAMF0ZXIuqwWlbMLg/PIBaXC9qiLgLykoeWRWCGlTZGK2BYhKdVCtEJmHdGBZuSDBAB1QbB/pAkjXtye9WVaGKnjpz/fvCRJtBwsboZJS4cANRXfpUSNeW/31GEzdyn6QgWeq21BBIwr1J5olSF+yo6+UDjbhnzoCZbENzCtIY8fQ+FekU7VB7AoGXC8r8ktnOu9+UyFh5jQu4L4Nej
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(5023799004)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFFoeDRJd1hvN0c2d2lJNUJrMXZBcnJkL2k4SlRGaVozTHZoZzAxanp2blB2?=
 =?utf-8?B?bGp4RnhrakIraXFjQiszcDhEakd2Y08vRVdLeW41WllleUx1ZFZ1LzViekVH?=
 =?utf-8?B?YkRGTE0wUlFYUkpPSzN6QWNvNWtYZTNwaGcxSUFJMTd3d05ZNmVmeFV3WkZN?=
 =?utf-8?B?ZlNhSEtJRUhtT1NBZVJkR2tRWitURld3MG15dzdNQnFwZXRhTC9vbkRVN1dS?=
 =?utf-8?B?NkQvaHpPdnRISVF5b0M0NmcydFFhdmlFdm5FRDZ6YjdmbFpFb2ZIaEtGSFBw?=
 =?utf-8?B?eWpuQ3g3V1hheTF3VWVzcHJXMEFXK1pSYzUxazRTd0ZZcFRVRHZVbzJYRUZx?=
 =?utf-8?B?Mm1ReC9yOC9JdnVwU3VueWlFdEtrVkdGdW5xbFlETlJyTGRzN2lMWFhPWXFr?=
 =?utf-8?B?QnFua0ZzcnRsMEFDekFvK2dTKytTZXRzdWQvQi91aUdOcEVrSklDUXVORCtr?=
 =?utf-8?B?SU56MU5qVEwvV2p3WUYyQUNBczBUVCsxYWdtSm9EdWt1a3RGSENJbjVwaEI4?=
 =?utf-8?B?L0JrZUp2a09WVGw2Tm5XcjVEcnVVQ20xa3pOZHRnQWFaQ3Z2eFJYcVp2R3F6?=
 =?utf-8?B?cGRZMTcraHppMC9wRytJbXplVDh6R21ZR29nSnF1cktUSVBhUVdVSHRCOXdG?=
 =?utf-8?B?aHpoZDR5UTdwUTQxWWM1eWp5emZYWUY3UFVPMUpCM1JDMVVPUkVEOW45ajBx?=
 =?utf-8?B?azhKaW1BNjdnNWdCUGZXSStkTnFYM0JCVXZ3MUZTTFNiV24xSDNNWTRULzEw?=
 =?utf-8?B?UWpGTHJSMHV0WHlYK3UreENYQWZQK0hVNVdHTmRWZUkvR1lrdDZJUTg1amlk?=
 =?utf-8?B?MlFOd2FYZlc3YjJ1a2ZOTWxBenI0SzZranFMQWk5UzdVdDF6NUxGSE9vQkIy?=
 =?utf-8?B?SFN2c3dOM2xMMUU2c0VLVFI2dm4rTmo3VVpjeVgvNEZUclgxSmhyNkJBZnow?=
 =?utf-8?B?bEZvazNMaTB4bnR3dkxERDFJcG9ZOGltUzNrTFRlY0lIZ3JPY2c3Lzlsb3FT?=
 =?utf-8?B?bW1uODFSRUcwOXRtT2NKbWVGUlZpbUx2VTVaM0d1OFNVc0J5UTVSTjdKZmIr?=
 =?utf-8?B?RzRreHpHdjVQbEtVb094VEl1Qm1CU0ZYdXBmZ2dLT3ZpSGVlOU91dGgvYWVM?=
 =?utf-8?B?bFVhWDBJTHlCeFBPWk1GWmI5VDNUZGxKdWtVeStyb24wVzAvaUdLK2NBZkR1?=
 =?utf-8?B?d01hU1luZXN2VTN2SWt2WXdsS0R3VGdzbGlUV1FIWjBxZHZNSGZmVTdXRUpE?=
 =?utf-8?B?bVJsZ21nOEZ6bVR4UEI1T09OQlRMWnRoTzRhditEazh3N1lmT0h0dURqVDBH?=
 =?utf-8?B?T3pRQlV1blpCa09pMnR2M2pManRyYUc3eFlhMmZ0Vkt6d2NNbENaTVo1R2dD?=
 =?utf-8?B?Z0pVSkxLUEJpWklUOHVpSVhIblRLWXlobW1FYzlKQ0NINjJUL3hzajgrMEZP?=
 =?utf-8?B?dzM2a3hIa1dwWXlHL1dYb25KQmVieGg3MWxkYkRxMk5CL0paVHZSa0dwbGhu?=
 =?utf-8?B?UEtHd0RFZ0NaYVE2R2l0Y0hiMThRYWp3U2VsK3kzdHh4T01ueCtmR1Z2TnBz?=
 =?utf-8?B?Qklyc0RSR0FXcC8weXhJZHc5WGNlaXRUN0pIZlB1bGpoc2d2NlJYOTVSb2lq?=
 =?utf-8?B?SnppblowZU5IZmpBT3JOa0dnc3MzQ01jTzZ0UDk1Y0Ivci9LZVVhaFM0QUov?=
 =?utf-8?B?Q0VISDh6ZVA1QW8wdTJzZUh4Zi9ZaUxEbElVS3luMWRTSXEzcm9ZZTBiUzVV?=
 =?utf-8?B?Q1ljUFJvUWVTNE5PaDVrUFBycnE2UGVqME1LV0wyUk9yYkVpQUJGS2NpQStF?=
 =?utf-8?B?dHh5YXM0bWFBTm1uOFlNcElNT00yRDc5Z2hPQmV4K2NmOXQ2eDBwN2FCSk56?=
 =?utf-8?B?VEY2OUd0OWJJb1I3c0Y4WUU2UC9FQ21zajMyemo2RDhyZ1VUV24relFCQjVU?=
 =?utf-8?B?cS8xSytzNEZGeTJmUjdRQWhLWEtMTnZwY3FNS2RQTXZ5aTlCWU9uQXh5czkv?=
 =?utf-8?B?SjdITXE4dWZtM1JhbUdNZkVuNnJXa1FLMWFXT0lKRSt0WlFOOEhpa1dQdkdu?=
 =?utf-8?B?Ui8vbmY0S3djcERWallGczFqWi9LbTByVXVkWXNiNzMyblYvQ1U5Ykl0dXZt?=
 =?utf-8?B?KzV6dDBPYmJKQXQ5UmMyWk9RaWIvNWFvZVVoSXlIYzJmdHBsU2ZtWGRjNjE1?=
 =?utf-8?B?RkgreXMrK3pYZDVDT0Y2VXpjanlrWXE5Z3JjQmRTVlFqRkY2NzZuMzg4NnRn?=
 =?utf-8?B?aVNwZDRZaUEvNzdqTE5Ra1lxejl1azBoSVRubVpqT0l1UGZIUGMzRUROeWRJ?=
 =?utf-8?B?ZHN5TnM5RzVpRVVKc2I3amRuOUR2RS9JWmN0d20wOGJGbzdod2F5NXAxdGZP?=
 =?utf-8?Q?MC/yzcQihnxO2Woc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3709596833D91B489861C4F9D6BC4E51@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: guzKDlQ2HZECpK3VaXuluvPdMwkQHK16/FagNeWzhKtIjMvOeTyS+DyBJNW9d18oCsSal+Bhz6YclUJ+tEYRbpxhfHGduneJOfr0yDHSy2SZEUcPj3t9Hk1SM+JwVgBWmVDrqCtyb5czYN8WPVyOFIC+i5TtJdqUw+whe6NgZcb3GF3/8yZsapOu/RCiAY/tZmKjbcu4te9oBd0RVGwagJ16udqmVbb9NQdUzeNbBZYdxaijnKcayMO2egsjgMvRSDlSpMjvQG62upVbuH8aOl+HwXQV/mMY0+FoZsunNgDWRDuPaKPZ7+UAJKllVCGUSq2upmVEWFGO1ss6RXh3tg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fe5000-c8ff-40fc-1c65-08debd9a22c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 15:51:23.8302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gx15x0LXHz0DWB5xrN7VOLj+T/vXtHEVv4vV8XQNJR4OLY3/DVLqKeJSz4PBJHhiQB40xYeR3k5XzYSJAbsZYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9576
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

T24gRnJpLCAyMDI2LTA1LTI5IGF0IDE4OjA5ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIEZyaSwgTWF5IDI5LCAyMDI2IGF0IDAzOjUyOjEzUE0gKzAzMDAsIEphbmkgTmlrdWxh
IHdyb3RlOg0KPiA+IE9uIEZyaSwgMjkgTWF5IDIwMjYsICJLbm9wLCBSeXN6YXJkIiA8cnlzemFy
ZC5rbm9wQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiBJTU8gdGhpcyBpcyBnb2luZyB0byBlbmQg
dXAgZWl0aGVyIHVudXNlZCwgYW5kIHBlb3BsZSB3aWxsIGtlZXANCj4gPiA+IGNvbXBsYWluaW5n
IHRoZXkgd2FudCBhIGhpZ2hlciBsaW1pdCBhbnl3YXlzLCBvciBvdmVydXNlZCwgYW5kIHBlb3Bs
ZQ0KPiA+ID4gd2lsbCBjb21wbGFpbiB3aHkgc29tZSBvZiB0aGVpciBsb2dzIGFyZSByYW5kb21s
eSBtaXNzaW5nIGZyb20gQ0kgbG9ncy4NCj4gPiA+IA0KPiA+ID4gSW4gZ2VuZXJhbCBpdCBzZWVt
cyBsaWtlIHRoaXMgZG9lcyBub3QgYnJlYWsgdGhlIENJIGluZnJhIGRpcmVjdGx5LCBzbw0KPiA+
ID4gSSB3b24ndCBzYXkgbm8gdG8gYW55dGhpbmcgaGVyZSwgYnV0IGl0J3Mgb25lIG9mIHRob3Nl
IHRoaW5ncyB0aGF0IGRpYWwNCj4gPiA+IHVwIHRoZSBtYWdpYyBhbmQgd2Ugc2VlbSB0byBoYXZl
IGxvdHMgb2YgdGhhdCBpbiBkaXNrIGxpbWl0cyByZWNlbnRseS4NCj4gPiANCj4gPiBPdmVyYWxs
IHNlZW1zIGxpa2UgdGhlcmUgYXJlIGEgbnVtYmVyIG9mIGhhY2t5IGFwcHJvYWNoZXMgYmVpbmcg
YWRkZWQsDQo+ID4gZS5nLiB0d2Vha2luZyBvZiB0aGUgZHJtLmRlYnVnIHBhcmFtZXRlciB2YWx1
ZSwgYW5kIGZpbHRlcmluZyBwYXJ0cyBvZg0KPiA+IHRoZSBkbWVzZy4NCj4gPiANCj4gPiBEZWJ1
Z2dpbmcgaXNzdWVzIGlzIG9mdGVuIHNlcmlvdXNseSBkaWZmaWN1bHQgZXZlbiB3aXRoIHRoZSBm
dWxsDQo+ID4gZG1lc2cuIEhhdmluZyBhbiBpbWNvbXBsZXRlIGRtZXNnIG1ha2VzIGV2ZXJ5dGhp
bmcgbW9yZSBkaWZmaWN1bHQuIEFuZA0KPiA+IGl0J3MgdGhlIHdvcnN0IGlmIHlvdSBkb24ndCBl
dmVuIGtub3cgdGhhdCB3aGVuIGxvb2tpbmcgYXQgdGhlIGRtZXNnLg0KPiA+IA0KPiA+IFdlIGNv
dWxkICptYXliZSogZGlzY3VzcyByZWR1Y2luZyB0aGUgc3RvcmVkIGRtZXNncyBmb3IgdGVzdHMg
dGhhdA0KPiA+IHBhc3NlZC4gT3IgcmVkdWNlIHRoZSB0aW1lIHRoZSBkbWVzZ3MgYXJlIHN0b3Jl
ZCBmb3IgcGFzc2VkIGRtZXNncy4gQnV0DQo+ID4gZXZlbiB0aGVuIGl0J3Mgb2Z0ZW4gdXNlZnVs
IHRvIHNlZSB0aGUgcGFzc2VkIHJlc3VsdHMgd2hlbiBkZWJ1Z2dpbmcNCj4gPiBmYWlsZWQgcmVz
dWx0cy4NCj4gPiANCj4gPiBCdXQgbm8gbWF0dGVyIHdoYXQsIGZ1bGwgZG1lc2dzIHNob3VsZCBi
ZSB0aGUgc3RhbmRhcmQgZm9yIGZhaWxlZCB0ZXN0cywNCj4gPiBhbmQgbm90aGluZyBsZXNzIGlz
IGFjY2VwdGFibGUuDQo+IA0KPiBJZiBkaXNrIHNwYWNlIGlzIHRoZSBpc3N1ZSB0aGVuIGp1c3Qg
Y29tcHJlc3MgdGhlIGRhbW4gbG9ncy4NCg0KVGhlIHByb2JsZW0gaXMgbm90IGRpc2sgc3BhY2Us
IHRoZSBwcm9ibGVtIGlzIGV2ZXJ5dGhpbmcgdGhhdCBoYXBwZW5zDQpiZXR3ZWVuIHJhdyBsb2dz
IGJlaW5nIHByb2R1Y2VkIGFuZCB0aGVtIGxhbmRpbmcgZm9yIGNvbnN1bXB0aW9uIC0NCnByb2Nl
c3NpbmcsIHZpc3VhbGl6YXRpb24sIGV0Yy4gUmlnaHQgbm93LCBpZiB5b3Ugb3ZlcmRvIGl0LCB0
aGUgd2hvbGUNCnBpcGVsaW5lIGJsb3dzIHVwLCBzbyB3ZSAqcmVhbGx5KiBkb24ndCB3YW50IHRv
IGJ1bXAgdGhlIHRlc3QgbGltaXQuDQoNClRoaXMgaXMgYmVpbmcgcmV3b3JrZWQgc28gdGhhdCBp
dCdzIG5vIGxvbmdlciBhIHByb2JsZW0sIHNvIG9uY2UgdGhhdCdzDQpkb25lLCB3ZSB3aWxsIGJl
IGFibGUgdG8gaW5jcmVhc2UgdGhlIGxpbWl0IGluc3RlYWQgb2YgZ29pbmcgdGhyb3VnaA0KYWxs
IG9mIHRoaXMgc3R1ZmYuDQo=
