Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C4BF588C2
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 12:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF12B10E5AC;
	Mon, 20 Apr 2026 12:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KA6ZE1OI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472210E5AC
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776689942; x=1808225942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gWk80sQbVeplhJZPUpNwgU2LiU30B+uWJAxrXqM2xFc=;
 b=KA6ZE1OIOpoqxjhXqM2AbfYX0fnWX5mk0AoHxsbGVlYm5jF8QVp2AMQ7
 qHpChzECVCA2sYz15XLR3kwE406PuatPDXpldLTmuBChUdO/Scu2gMaQ1
 UX2sWGqTBir9cSAGfMDV1Aq8oAdJ5nklPBAVHTkjcs/8VyzhwdXcMLc0e
 Rj4l+pC6AUUjD5vvfcIwYCpOAl4obBlqrdH+ff6skQWHCsl9hCKk/hBOI
 leI5ReI9Fl5t/jOJKvDiKqeaip75NgULjXngs+ebBBEUdRLYpXLv3s2ua
 Ni7ZCEi0jrzURpIwSfmuGQm2MKL7NsHsh7xS9neieCXGDeIH8s1ikIaW0 w==;
X-CSE-ConnectionGUID: ZEBGIW+JQCWyEH6BN44Ohw==
X-CSE-MsgGUID: zrwtkMp/T6uviO/3mBnpig==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77579281"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77579281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:59:01 -0700
X-CSE-ConnectionGUID: U9T3jJtRS7Kfgx5w1nbQjA==
X-CSE-MsgGUID: AVQFEOuNS+WNTERUT7RYiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231622364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:59:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 05:59:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 05:59:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 05:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTLrcyiYixIf3ZF1juMQ5PVXt0TktjC1MgINpZUQl4hMHof6gddb9rQfHWBtp1Yz8yGAXBrU5G4AFn99DQFT+hOPsei/VoYkcXPm++O1FrCjs8FeHXBCRzo+2nAVgl2TbUoIYe7svoTaxM5qYhuJC3zqrDpKr0GbvB8uXoynLaBDAVAdme9azmPNbITSETjDGHNfHYdj1j+1BELTMgr0uv79aSBuvbY1kS3f/z/qX5gTDgyxqfN29EL2FzArgAGzlQSwm7Itf2whleVacRqpFRTRS70Bba6rabeT+lX9C0V7DLOxneGp+3kZcNwAPEmVNGPZS1OU3UJui67sUNkm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWk80sQbVeplhJZPUpNwgU2LiU30B+uWJAxrXqM2xFc=;
 b=ZO9HS6X29v3sgwYWApuD3x3iLcXhgokgrJexu/SQUOyEyi6b0NsPG8RmPQTrGeYaBYztKqnIHI3jOAKF4F6FMr1AlQ6LFo3UGXiGn2gJs3Ip3h9Sj0503rvc/Pgg08HF94uB0ytomIyCwuU5lHIa6t8DzL8V0nttlFZhj9McKkogmD/xg7aEo7oYQsFq1A9SvbBpsxcvPMhUHnCpqwYpyAV4ydkKykdWFP2PysZCBgll10iSmg/wbmBtxblUO+G7zVwzNVh3XZWRtACQCecelIHAJYdPVh5iUd3xP2PaJHiFqgP+xEvihtGkCC3aBKuYTWmH3HuhqSzbX83UzSmAhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 12:58:55 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9846.012; Mon, 20 Apr 2026
 12:58:55 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v2 1/7] Revert "tests/intel/kms_pm_dc: Ensure eDP
 detection before skipping test"
Thread-Topic: [PATCH v2 1/7] Revert "tests/intel/kms_pm_dc: Ensure eDP
 detection before skipping test"
Thread-Index: AQHczkZT/c/tye0Kw0O0bj8iO43AdLXjEiGAgATakvA=
Date: Mon, 20 Apr 2026 12:58:55 +0000
Message-ID: <LV8PR11MB84859339ED9B1988D754A4CDE42F2@LV8PR11MB8485.namprd11.prod.outlook.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <20260417083506.33404-2-mohammed.thasleem@intel.com>
 <20260417104543.edcay3f74xnrmoyl@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260417104543.edcay3f74xnrmoyl@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8485:EE_|SJ2PR11MB7545:EE_
x-ms-office365-filtering-correlation-id: 34cf5bda-782b-4873-0395-08de9edc947b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|8126099003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: e+gy2mqItABKNhbHDwBYnKbPXQgN5R4Pw8vXHfEYRtT6mTu2+i2XvZQeSvykhwXutJKxR9P0l53QFSN7AD1nL54152sUC72okqbjGl6GTLujmdpoqmazBY3MbIrAsIw/l8n3s37rSZiGQFdEfeK4vgFtGeXnqmmJWduyqYP5M9zZoGsjYE75BYHvflG7qNtPoCcaIUpNuHpyL5CrXfoXDiUIqyqRCDcbJJPei/Fe2jyiyxAT31bueeNSSeErDVqpw1CX09zIXCxUMOfJ5dDdAgJRGs1MHarrQi16IOKnUGuhjvOhbZf/kmehyKvlWXRJXuflnscdwWXxhdmfgbgy6o3ho6L5LSEHwO1zZ4Z9zMIQE/sgosaRnRLt+3dRB2mE12pB+0Ic5yumX5AxMZN8tvAUTevyU4uv0zLo3usIQECID9xp4jZkaBDnXU9EfI0KVc0eDqP4sKYJ3DqO9MELGt6iKup8vnQncDbuz460A3ANTTxa+anw5AaWVbfBCCQ+UDYquyuH8cZ0k9+2xynNKmM9P6lWXP2AEDVWNjXuOZbejvB3GSrAZD7a9PvoHqbJd3ax4vkU89DQK4cLDRy0XWwS9H84nmDs7KzCrGoTPFoGebmF74BurLyC8ursj3q0cyzvyZGT14Lpl6qNgw2m1AZvqP7fdKk+fIr//C+fVGX2i1g079XAlli2Zg9+pMjWXRjcafEBMXi7zx8JJVMq4lr1/TA6tRyZgv31OtM4lWE6o+FlcDsEwNNQKVWQTrxg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(8126099003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZU9ySk0vNGhEWldEWkVCRW82dnNDc0tZUHNBNmpJU2VOSjliZTJ4eFlIUUFh?=
 =?utf-8?B?VERLUkJGcXB0bzgrak9waWgxenM4UlhicDNoK3MrNjZwK1NKUDdXaHZud1k3?=
 =?utf-8?B?TnZvRFBMcWxvNnErMndHSjFmaXVPV282MmVCRS9JcHRsNjJlR3NxMVRpZ25F?=
 =?utf-8?B?MklENjVGVTNtN1B0ZnVlUi9iNkUwNG40L0pMTW9CQUJodXRuYWRsNHQxZmZ5?=
 =?utf-8?B?a0xkdnh6dEpvS2JQRXM3VzVIVklHeUxxVCtlVFhSR1Q2TjRPdlRWS3ZOd0Nh?=
 =?utf-8?B?VkpBU2packNzQ1Fad0kvazFtRUFNamt2YXJLSmYvTTNpQVJzT3NNRmRlV0Y4?=
 =?utf-8?B?MHdac091cVJGcXlPV1A3YkpnbzdNbWNjVTM4Ky9Sa0RxSnVIQ0NoYk4vT0c5?=
 =?utf-8?B?TDB6a1BMSFBuazJydkxsb0hSMGs2VTlXTk1Ta05iL3lEaDlxYmp2d3E4Mld5?=
 =?utf-8?B?SU9WYnZrZUFUMW9OcFRpYm85RkNsVDc5YzVJcjc1UXBua1N6L1ltQWZvNWNz?=
 =?utf-8?B?RlhQS2VwR1N2WFBrRDNTWUJBd1QyZWpsaHZJRGNrUnpUR1ZzKzNORHI1SHNS?=
 =?utf-8?B?V04zZ2s4TithSktsT2NzeTBHUFpybTM1U0ZRc2FhZUdXWHFrNXArMU5vcXBR?=
 =?utf-8?B?SEhNNWt0bUpwSm92Ty9sWm5rTmxrWEFQbDFrWkpObWREck1pQTdhWmNsdHBT?=
 =?utf-8?B?T0xmdjdsWDFhN1NaRzlJaE9JTStUT3lrN05oOFFKNHd3UWw4VjFtNnh6NlhF?=
 =?utf-8?B?YjR4MmdxWks2TUJzMTlTUE1rSUNCck1WdDJLdnl1VTJwNFJIR3I0QWthdzR3?=
 =?utf-8?B?RFVFV3UzQVErNDhGUENua1R6dEtSKy9QSG1VeTl6U2RvM3pmeXAzc01Obk5w?=
 =?utf-8?B?WGE5ZFkwSmdPWExDOEVsWkVVOHpuM21FQmF2ZWpLTjVFOFdyM01qbkVYQjMv?=
 =?utf-8?B?SmUyUzQzZGc3OStOT3NlVzM5OTNKMGpET3pLMXMzY0VCWCtubVVmTnZ5OHNP?=
 =?utf-8?B?WFZEaTdoV3hmZXdka3hldzdVMzByeWNGMkFLaUNCcW4wcjBnTXZ1bE44ZFF0?=
 =?utf-8?B?Z1FJWG9ibVZ6U25ybDVmWWpwRVRQU09iSTFwOVpZZVBIZkRWTSswbFZ6bGxs?=
 =?utf-8?B?cllRSFFrdHQvU2lIV0JPbHpPWGtJM1lzRUhld1VkRmJqeFRjL3BoWTBOaUpi?=
 =?utf-8?B?enVmZXdSRitRY1U2a0lCVktaekg3dDllQkkvdjJTTnpHeHRkaDk2MGJjZGhz?=
 =?utf-8?B?SCtUVFRoWVVxTG8rYnpNOXZ0UXdhalMzWGt5NXBSUklBbkpXdFZQdWtUWE9G?=
 =?utf-8?B?NVNrb01NMTBkdkd3MVRkOGJHWEsvLzJ1Snlhc1JiY1NnZ3FlTkg4OE5taXRl?=
 =?utf-8?B?L0ZNUlZQMmdFdzFZbWZWeUVqbVAwUlBLR0pBSnd5OVlXQ01wZnhtYnQ5alpu?=
 =?utf-8?B?aTAxdFVZSG5jOHYzN3g4azQzZEpRTy82NEZ6VVJRWWJCZnI5aEpLM2VIVVlj?=
 =?utf-8?B?WWxxMXpGaDc5ZnhoMWUwMTRoYmFLMFFLTk51dFk4d1FPK29Za0ZkMTE5bVNE?=
 =?utf-8?B?OTFCYW9HQ0NQRGJxZjdzNWh0R0hnUVgwaDhwUWtxVUw3UzAwYW1RLzNYQ2FL?=
 =?utf-8?B?SkFlakVKaWVLaHNjWGZDQU1iSTUzZ0NlYXRxTm52VTNNZHMyUnBtQStIcjRt?=
 =?utf-8?B?WDVKQVIxdE9WbVowaGlwcHNwc2Nzcnh1L0s0MFlqUGhOZy9tQU4zSitNQTR2?=
 =?utf-8?B?Mnd6R005YUVmaW5yRXlMakR5ckUvSC8zS2JZaVFQU0gxVnpsZCtHc0t5dEJJ?=
 =?utf-8?B?aW5lZXNsWHlNL3ZyOVE1YjlzRTdoeCszcjExaVhTbjdMT3dMWEF0U2NDZkly?=
 =?utf-8?B?cExRaUZvQVd0TitxTjN0RzhFZDNRUlBrYmhTekxWRmM0RnRxS3VuTWJMRWZI?=
 =?utf-8?B?RkFsN3orRXBocUh0OTlFdVM5S1JwVmNEWlFlcnR3dW1KZ2xkQkZ6WEFFbXBj?=
 =?utf-8?B?K25ValJYRmZHQWxVM1VTRVg4T0dYQ29JY0o3V2VLNU42YW9BSFp1VGpIYkRL?=
 =?utf-8?B?dit3SU9EUDZBVXdQM3k0UUdEUk9hNXlTVXFFTVp6bEpnNlYyOEpiOFczVmFR?=
 =?utf-8?B?Y2QxR1o1Q2o3MWdyRGdpVFNVdjIySnZKRmtvaUd1Z2ZCd2NvS2JWZ1BEOGxl?=
 =?utf-8?B?dDMxcExxT21GdDdwZ3o2S0Jud0JRdjhjc09YUEFVa25EU1ZESEpCRW1zcHBM?=
 =?utf-8?B?azBFWDVmN05VVFN3VHZPTG5GV2hGcEE3dUk5UXpVdUZIR1NGQlNGcjNDem5p?=
 =?utf-8?B?TTZ4cDRsK3BiNUhBQzI3Q1Jxc3RJa2VtZlcwM1BMM2hlaUxnUWFTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LvsYyBCfIOI7m5E4Y6ZBGGjctZY1PGHdkVuGIjk4LglK6BHKa+VL8gRj6/gKByuIXTwRzWYWvD61bP5rcrhbFO9JzVPz3xdOfqakBNyE6DLZ7bC9AptOGjlbvzHmgsBQ5zgtAADtp5pzbtHWMQCNkIizzTQM2piNWbt9+s8c4uezc8BTuapMjmP9chi+c0irksSMAsBWfi9SrNspK797hBsjQuajdongGAyj3Bb00/9Qu1abDoNXDPX3g6HA4KTqkMmA24Hpvu5I2URs6emssq9nIhOiIxxSOkDazBPifq0S6Q1hBIupcdGBaK5xsN6wMUS6yvb6HSzQL3StO3J3SA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cf5bda-782b-4873-0395-08de9edc947b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 12:58:55.3392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAQ+QKVnHdQenfwALWV/BSB9bHSyZLRu4/JV7YG8bP1gtdtcmVK3XwALB+EkAF3DrtN6sRTn9Ipy646IzpvV+/NTZISVnrLge2RaPxCnkWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
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

RmxvYXRlZCBuZXcgdmVyc2lvbiA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTY1MDU0LyANCkJvdGggaW5kaXZpZHVhbCBjaGFuZ2VzIGNvbXBpbGUgc3VjY2Vzc2Z1
bGx5LCBhbmQgdGhleSBhbHNvIGNvbXBpbGUgY29ycmVjdGx5IHdoZW4gY29tYmluZWQgdXNpbmcg
Z2l0IHJlYmFzZSAtaSBvcmlnaW4gLXggJ25pbmphIC1DIGJ1aWxkJw0KDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBs
aW51eC5pbnRlbC5jb20+IA0KU2VudDogMTcgQXByaWwgMjAyNiAwNDoxNiBQTQ0KVG86IFRoYXNs
ZWVtLCBNb2hhbW1lZCA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KQ2M6IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRl
bC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT4NClN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMS83XSBSZXZlcnQgInRlc3RzL2ludGVsL2ttc19wbV9kYzogRW5zdXJlIGVE
UCBkZXRlY3Rpb24gYmVmb3JlIHNraXBwaW5nIHRlc3QiDQoNCkhpIE1vaGFtbWVkLA0KT24gMjAy
Ni0wNC0xNyBhdCAxNDowNTowMCArMDUzMCwgTW9oYW1tZWQgVGhhc2xlZW0gd3JvdGU6DQo+IFRo
aXMgcmV2ZXJ0cyBjb21taXQgZDA2M2NlYWVhZjJkMmQ1NjE2NzA5NDVlOWU4MWI4OTc2YTE2ZjA4
MC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1vaGFtbWVkIFRoYXNsZWVtIDxtb2hhbW1lZC50aGFz
bGVlbUBpbnRlbC5jb20+DQoNCkFzIEphbmkgc2FpZCwgdGhpcyBpcyBub3QgY29tcGlsaW5nLCBz
byBwbGVhc2UgZml4IGNvbXBpbGF0aW9uIGF0IGZpcnN0IGNoYW5nZSBhbmQgYW1lbmQgYSBmaXgu
IERvIHRoaXMgc3RlcCBieSBzdGVwLCBzbyBiaXNlY3Qgc2hvdWxkIHdvcmsuDQoNCkphbmkncyBo
aW50OiBUaGlzIHNob3VsZCB3b3JrIGZvciB5b3VyIHNlcmllczoNCg0KJCBnaXQgcmViYXNlIC1p
IG9yaWdpbiAteCAnbmluamEgLUMgYnVpbGQnDQoNCitjYyBKYW5pDQoNClJlZ2FyZHMsDQpLYW1p
bCANCg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL2ttc19wbV9kYy5jIHwgMzkgKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwv
a21zX3BtX2RjLmMgYi90ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYyBpbmRleCANCj4gODEzODkzM2Q0
Li5kYTc0YTIxY2UgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jDQo+ICsr
KyBiL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jDQo+IEBAIC01NDMsMzggKzU0MywzMSBAQCBzdGF0
aWMgdm9pZCB0ZXN0X2RlZXBfcGtnY19zdGF0ZShkYXRhX3QgKmRhdGEpDQo+ICAJdGltZV90IGRl
bGF5Ow0KPiAgCWlndF9jcnRjX3QgKmNydGM7DQo+ICAJYm9vbCBwa2djX2ZsYWcgPSBmYWxzZTsN
Cj4gLQlib29sIGZsaXAgPSB0cnVlLCBlZHBfZm91bmQgPSBmYWxzZTsNCj4gKwlib29sIGZsaXAg
PSB0cnVlOw0KPiAgDQo+ICAJaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLT5kaXNwbGF5
Ow0KPiAgCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KPiAgCWlndF9vdXRwdXRfdCAqb3V0cHV0ID0g
TlVMTDsNCj4gIAlkcm1Nb2RlTW9kZUluZm8gKm1vZGU7DQo+ICANCj4gLQlmb3JfZWFjaF9jcnRj
X3dpdGhfdmFsaWRfb3V0cHV0KGRpc3BsYXksIGNydGMsIG91dHB1dCkgew0KPiAtCQlpZiAob3V0
cHV0LT5jb25maWcuY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNU
T1JfZURQKSB7DQo+IC0NCj4gLQkJCWVkcF9mb3VuZCA9IHRydWU7DQo+IC0JCQkvKiBDaGVjayBW
UlIgY2FwYWJpbGl0aWVzIGJlZm9yZSBzZXR0aW5nIHVwICovDQo+IC0JCQlpZiAoaWd0X291dHB1
dF9oYXNfcHJvcChvdXRwdXQsIElHVF9DT05ORUNUT1JfVlJSX0NBUEFCTEUpICYmDQo+IC0JCQkg
ICAgaWd0X291dHB1dF9nZXRfcHJvcChvdXRwdXQsIElHVF9DT05ORUNUT1JfVlJSX0NBUEFCTEUp
KSB7DQo+IC0JCQkJLyoNCj4gLQkJCQkgKiBUT0RPOiBBZGQgY2hlY2sgZm9yIHZtaW4gPSB2bWF4
ID0gZmxpcGxpbmUgaWYgVlJSIGVuYWJsZWQNCj4gLQkJCQkgKiB3aGVuIEtNRCBhbGxvd3MgZm9y
IHN1Y2ggY2FwYWJpbGl0eS4NCj4gLQkJCQkgKi8NCj4gLQkJCQlpZ3RfY3J0Y19zZXRfcHJvcF92
YWx1ZShjcnRjLCBJR1RfQ1JUQ19WUlJfRU5BQkxFRCwgZmFsc2UpOw0KPiAtCQkJCWlndF9hc3Nl
cnQoaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwNCj4gLQkJCQkJCQkJCSBE
Uk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVCwNCj4gLQkJCQkJCQkJCSBOVUxMKSA9PSAwKTsN
Cj4gLQkJCX0NCj4gKwlmb3JfZWFjaF9waXBlX3dpdGhfdmFsaWRfb3V0cHV0KGRpc3BsYXksIHBp
cGUsIG91dHB1dCkgew0KPiArCQlpZiAob3V0cHV0LT5jb25maWcuY29ubmVjdG9yLT5jb25uZWN0
b3JfdHlwZSAhPSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiArCQkJaWd0X3NraXAoIk5vIGVE
UCBvdXRwdXQgZm91bmQsIHNraXBwaW5nIHRoZSB0ZXN0LlxuIik7DQo+ICsJCS8qIENoZWNrIFZS
UiBjYXBhYmlsaXRpZXMgYmVmb3JlIHNldHRpbmcgdXAgKi8NCj4gKwkJaWYgKGlndF9vdXRwdXRf
aGFzX3Byb3Aob3V0cHV0LCBJR1RfQ09OTkVDVE9SX1ZSUl9DQVBBQkxFKSAmJg0KPiArCQkgICAg
aWd0X291dHB1dF9nZXRfcHJvcChvdXRwdXQsIElHVF9DT05ORUNUT1JfVlJSX0NBUEFCTEUpKSB7
DQo+ICsJCQkvKg0KPiArCQkJICogVE9ETzogQWRkIGNoZWNrIGZvciB2bWluID0gdm1heCA9IGZs
aXBsaW5lIGlmIFZSUiBlbmFibGVkDQo+ICsJCQkgKiB3aGVuIEtNRCBhbGxvd3MgZm9yIHN1Y2gg
Y2FwYWJpbGl0eS4NCj4gKwkJCSAqLw0KPiArCQkJaWd0X3BpcGVfc2V0X3Byb3BfdmFsdWUoZGlz
cGxheSwgcGlwZSwNCj4gKwkJCQkJCUlHVF9DUlRDX1ZSUl9FTkFCTEVELCBmYWxzZSk7DQo+ICsJ
CQlpZ3RfYXNzZXJ0KGlndF9kaXNwbGF5X3RyeV9jb21taXRfYXRvbWljKGRpc3BsYXksDQo+ICsJ
CQkJCQkJCSBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVCwNCj4gKwkJCQkJCQkJIE5VTEwp
ID09IDApOw0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gIAl9DQo+IC0NCj4gLQlpZiAoIWVkcF9m
b3VuZCkgew0KPiAtCQlpZ3Rfc2tpcCgiTm8gZURQIG91dHB1dCBmb3VuZCwgc2tpcHBpbmcgdGhl
IHRlc3QuXG4iKTsNCj4gLQkJcmV0dXJuOw0KPiAtCX0NCj4gLQ0KPiAgCWlndF9kaXNwbGF5X3Jl
c2V0KGRpc3BsYXkpOw0KPiAgDQo+ICAJaWd0X291dHB1dF9zZXRfY3J0YyhvdXRwdXQsIGNydGMp
Ow0KPiAtLQ0KPiAyLjQzLjANCj4gDQo=
