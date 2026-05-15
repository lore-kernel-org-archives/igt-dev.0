Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D0FCD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 06:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEB910E02D;
	Fri, 15 May 2026 06:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nI4Qcu8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3638510E021
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 06:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778826520; x=1810362520;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=saRUm+0Fo3dprHdZxZ/E9zYYGS4s6nG/ox9w2U5j3l4=;
 b=nI4Qcu8+I1axYv+9G1ilfEsHfFIK5rWDURljIGtXwVls6WRAEminiDcD
 csspzCcwCrt6ZJo+xAQZAKaFTCC8QdH1QSmidSzY1BoYqIG/tf4np9uA2
 7H1p6d9v5zRjJhiwBDPSxp6JCi4oFVI1szRZIoWrXoETiXsj1NuVYy/G8
 60tji/0o5oYW7b9ODs4UKycGq4tLgHA/v8LMgaSixnPebROHbIuXfMWZV
 eoJsEZxTzzbDDvJX09kpTgAcK7tfmHw6Snws4dFOhQS+VDik/u2LDy/EA
 lFQyEVm8JBVRmC2Ow0C0v8hDIyeaOrUuD7djMQqqk8CVKvhCU+rwh/JFF w==;
X-CSE-ConnectionGUID: m1HJ0zafTd2hD2f2oIMl1w==
X-CSE-MsgGUID: T/+hQRaoRVuyUS9EzlasSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79494331"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79494331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:28:40 -0700
X-CSE-ConnectionGUID: aSAR7wqqTqKLJP4lvJawYw==
X-CSE-MsgGUID: D0Q6CTlfQYqqQHHulfp44A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242603024"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:28:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:28:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 23:28:39 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJZT3WgU6PVuDGo1drjTG/BOiv2LK8oNhYxuUhXyk9knBoF53zSOhgmYGqeb16qHYdTBdUv4YoMv1FU8OIEOBqfSqjyg857mdtODlv6+q0pRXpfbeh9U58q73DKriGoNYbS2rxBChDZS2xF4U6/vyNhzwztTh9qd5xtBK55e7YcgXH7GMP8AjzzHrYOY5eYnLCqWoZmnMk9aIQ0UCr1/Eh4RDMrisCitSUUc0Vu1RGGfibgHcMBltH1X/ONMxQGdNiMcbHOpq9fGj71fYIABZDVV/sc8jRdY6Mk3P3eWEDvUyoAtlphPR3EXazhqq+gi0nbtsbIZisBlUXNKY44xHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saRUm+0Fo3dprHdZxZ/E9zYYGS4s6nG/ox9w2U5j3l4=;
 b=GyKUx3QmkI7Z6GJhL9kIRR9/0jCcRVO0sb6tg+6PNCaTyEiLpiZyzfmc5TdSsz00rL275E7U7pOwwCsmy2i4EFTNELpcuYqa8w/jyFwFQWZfI+RGbtSMh6n2vciI2RqtDnLd0t3dv2nXuQ4m6nAvZZzUeeSIBFVXYqnXsxHcJHc2vlwvtIxih0vFtBjw8UvycO+aLYKMYWim1km8qMuuatFxudT74epmFHEI+2cebJJswl6s7/1eQ3qrFOJOn6MF+4sDJtReIaAE8Qf2fXTztF0EoG0m0t/T1XITGuUPNlzS7tr0T6xgwPVdaZ/RhEj7zjonRIAwMjV06vjsER0NNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB7366.namprd11.prod.outlook.com
 (2603:10b6:208:422::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 06:28:35 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 06:28:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Add
 brightness-with-suspend subtest
Thread-Topic: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Add
 brightness-with-suspend subtest
Thread-Index: AQHc4qGueUrYLgZLAkq0VhzZoMzrC7YOm2AAgAAGRIA=
Date: Fri, 15 May 2026 06:28:35 +0000
Message-ID: <DM3PPF208195D8D91B66A1C8E1F25ED0119E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260513062208.683004-1-santhosh.reddy.guddati@intel.com>
 <80306d21-0df5-40ca-9a76-3ad59d326f50@intel.com>
In-Reply-To: <80306d21-0df5-40ca-9a76-3ad59d326f50@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB7366:EE_
x-ms-office365-filtering-correlation-id: 17db6197-662a-4644-7937-08deb24b3152
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|11063799003|56012099003|4143699003|18002099003|22082099003|3023799003;
x-microsoft-antispam-message-info: jKXf7jLpvn5L8M5THg8fuuxWtnEjYy0W1sXRa5ZJLa2TK3mFzV6OW510Y5JS303Tak+VpyzlISy2RZ/6kwE29JsZ4vSe6VQWX9fLTcxl1vUJZef+NXVDNRk2YJK3geOF6NZw0GTxPyv0dnh/pCtE1VimgIyP0HqWJJMZate8q8AAwFQL+WobeQyTFOdzrqdZ6mrIKG7/3UWrpF2oQEsOf+ZFgDoziItWP+KH/Am9/6yreNX6eMLt3kqbzKRWvt/CVZLuN7b80hBRmqsz2WLfsUseKoy7XhY1PkUtuI4k0ENYqRkXRp7ktYASvsoGZ+QMPDj8Twn/YP1Bog8CHm29EEEmDsoiipDqeHKkdL9v+yqGaO8Pn2ABCmUvhFX4r9pQ0nCV2KGHYZu5YkqLDGMqkyNpCH/GrvSxjL+xpNQSFP5prvyBRPezPwV6ZC9bevIfQK9yLNHAec/ixG78ywalmi3lBmGiJ5D5eHG8vH0CmDCGcffhJYShTGA7TEsHCkQWWf+5TVKG/tSwI8mkl+oJIPtT/XTEkikKWu/1o8OgLRnRZlFZvsVDGvZs8rmk2ZxggL3thRTtZulIVWXRmEKnyP8/8glvmHRNvL8UE2K6EOktVhJ50S2tUi2yLqIu5sFuXc4+aRj8js9SWyIy1JT5+bJYu940AMmStLesZ4T9WrT6RBFTeVATQh3C9eWo6W8PLwRHFMjH+Bo/sX6TfbBwFnNCwk/j7N6bauvf5NEJc3D2crthMR2GTlHsEk22PChR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(11063799003)(56012099003)(4143699003)(18002099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTRtWmNEcVdZM2JDN0gyV2o3YnRsMDUrQmZ1NE8rN1BpUHlWdTdGTnFmTkZj?=
 =?utf-8?B?QjBoRmc5OE5nQTRPNkFWSzgyejVDek5ibWZrSXV6WE9sZEZDaGJzdWxGSWIx?=
 =?utf-8?B?QTV3d3o3aWRxaUNLT2lZWkt4ajZyRGMrcndmNklpaHpRdk9qMVdsb09rc0l6?=
 =?utf-8?B?bHM4Y3JsQXA0MHF5V3liRENIejJMSVBzTy94R3NySzQzOHY2TUNHbWhPUkxG?=
 =?utf-8?B?WFY1U1l4SlVzbGJYUnhseTRVdkpaRmlVVUdPU2YxNVhpOGNpdEJwNXUwVDA0?=
 =?utf-8?B?N0hWL2ZwR0svQ2dYZ044akowNEwvZllEVGdoNmRvb2xJWHJDOFp3YmdrSGoy?=
 =?utf-8?B?aUJqbG5tenhxMXpFdEdBYW81cElaaHZ1d1ozd21xcllDUzNoZGphTEh0ZU5B?=
 =?utf-8?B?WTduNUFVbk1MQ2IwY2ZuUGJ1bU1wLzVvelFBTzkwVzIvYzRuYTVVczMySVJI?=
 =?utf-8?B?YUxVbkZmT2gyQUZjOS9zaE9WdWN2Y1dGcDZxZnVXaFVvb1pCTDMyZTFoSHI0?=
 =?utf-8?B?aHRTVVd6UndVOW1DRmtXY0VNTDVwWTBqd1JiamMxNkJQd1drRzU0TmgvbVl6?=
 =?utf-8?B?M2VtSEN3QVVtVWR2ZmxpRXBTNzRTeXM4YkhaVk12Y0wzY3hONjlzTHZ1N3FI?=
 =?utf-8?B?RXNsRWFTTXNJYzNpcGZOa0tXekQvREowVUlpTXdXM1dpeTlpNWJLVjhTamFM?=
 =?utf-8?B?a0UwY3hTMS9yYlVZYjYyU0hXZUF5dlBuMnQ4RWMwOThRWmxRNCswcWNORFlw?=
 =?utf-8?B?ajhjT21WWS9Qa2o0R1FiOFVYYUZvcnhVa2ttbnMzSWkxYnUwWlhhS1VNb1Fu?=
 =?utf-8?B?VmsxNjNwbkpEdFBuSHVGUHV0eGdHSm5QZ0tBeitzUFhseEVnZ2U5SWx0d2ww?=
 =?utf-8?B?aVdpZVBvK00veUlBMExhdnV4bnQvamRqazFxU3VMcE1UNGIrN3h4a1RySklY?=
 =?utf-8?B?OE9KNXhJOXJBR0hTWlBTOGZTZnAyS2Myd0pmd0tKNFpwcHVOZWJCT0VrS3E5?=
 =?utf-8?B?NFlSL3pDbTEvOHczNjFudGJ4TUtjT2taOUM1Z1ZpTGJRSjcvQ2tWRm0vVXpl?=
 =?utf-8?B?NkNPSDA5TFozR2ppaXdhbWtsc245SzgyanJHclVZNVpydTdNVm9HRSt2UWZV?=
 =?utf-8?B?aVZreFdCbCtsbzMzS2NTWFpzZHF4VVRQYzE4Ymk1ejltZHZmTXl1alJGaVJJ?=
 =?utf-8?B?bUF2R0pRQ0QwWGNFd1hiUGtxZ211Zk9PM2d2bk43SFFTcEZoS0NvaGxVNFB0?=
 =?utf-8?B?Q0d6Vk9nUSt6ZUVqYUp0bUc1ZzlDRkxjRDhRNDNwN09qdzFzRjZEeW1sTWhz?=
 =?utf-8?B?WS9LSDFPQnZwcFcxaTNVNmFXdFFSZ1lCWE50VjRsTWlBUEMyeTV2STN2QVIr?=
 =?utf-8?B?bzVVRnVFMTA2MllJMXhCdmxnWGw1MDVIY05IVWtKVS9iNE1OalVPa1NKZ3NI?=
 =?utf-8?B?M0pKQ2QwVzhOdHBCYXZMeW40eCtVZ0pBSnc5VlpEZktDaGM4emlMbWg1dkZV?=
 =?utf-8?B?cFp2MmhVTUVRZlFtMUhGNkJJOVFROXBTQ0tZbjlQY1VaV0JBa1ROaWs1WSs0?=
 =?utf-8?B?WGIxRGdZYjV2SzVHazRyYU1lNmtQQktXeC9QQThyT3ZKam16MHFBNllsUmFO?=
 =?utf-8?B?UllJOXVtTzF3UldjaXdIOFQzMFd4TmNybkJaQ3h0eldrTkJKUVd3N2d4ZXR1?=
 =?utf-8?B?WDhJd1dhZHVBMEN6NEE4NzE2VEJEeWRRMTlrb0RoMEdEZFlDNDdiK2R5WVlR?=
 =?utf-8?B?d1Y0eStERUtQaDRqdkJ5U0IzOUkyU01hd2tWbnF3SmlxbkZHNU5MNjg2TC9U?=
 =?utf-8?B?NjU1cWRDVTYxdU8yOWNXTEkyc0hFa3p5SXFWSGZJbGdEcVNabXVTZEJ0a3hk?=
 =?utf-8?B?QVdFenFLWWw5WlpLakM0M0VLYUwxSDU2WmNmdmJiUnpQT296VFU4cGpPK3Nk?=
 =?utf-8?B?MTRFNHRVbjRad1h1V2t3VG5EVDFuNzNMbFYrUExqdFV3aDY2ZVhxVGFQSU5H?=
 =?utf-8?B?UTltZU5uNENMVzZmRUlwTWJxNERZaitqWmNUYXdXTWJIeXJoT1dpN01IMUJm?=
 =?utf-8?B?SGJxcVF5eXRkMmloTXRVaHVEYnBqNHhUVHhhSGdwM09FT1BIUHI4Mk5VMHFT?=
 =?utf-8?B?T2Y1YnpsNHJTNGJuR0VQem8rZHlaNUgzN25ld29icUNJVWd5WkNVSUZxdEIr?=
 =?utf-8?B?UmN6SERpVXFXVzJRdmoyYlRyZkVzMC85V0NRaTJsenM2NU1uMmNnVVNiR2JY?=
 =?utf-8?B?M1hUd0g2bjd5TW9yd2R2VkVqQy84a1hlZXRHbmRJVDcyajJsT2dQWDVZbnB5?=
 =?utf-8?B?TFlmajFIS0UwQzhuYW1BWmpNS1U4T0t4UXNLOWp3SlQzSVA3NkJzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rtaxj4Os4L5Rg4pwBQJaYMeu+xAYG1SJhDNw5DEVTM0Vm7/PWvH5woukrUqQn0G6ggt01X85FumGXkPRhwifKrk3jwF3PbKLWvflT6byYwDXFI8tDkzFlKMClMQQqu6qu28oym2+5fwqHadvCsLxGDGjATv2G1hIyHWrAryiGAOvu7g5JBkPkrr4l4691CC7uhajzwF7Wdi913wbrKB7HzKo42hWNO7rgDD2xlbGQ9x2PyngnSXgIeLEnabav7CSxKwjBViyvohj+rqrSCeDU5JgIAOON/4O+L79rXliztEUNkqWwuMfgE/Y53awH2obj9ATQFbfzYBfZXj3+5+Abg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17db6197-662a-4644-7937-08deb24b3152
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 06:28:35.2374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFgNc7JJkc1ORmBWKA7WrcgMYNTvDXFDoMLO9zTUSCG4dsxhx3pJ9hzB60DnCTCzHKtwscPEoPREFBiPNwSjNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IHYyXSB0ZXN0cy9pbnRlbC9rbXNfcG1fYmFja2xp
Z2h0OiBBZGQgYnJpZ2h0bmVzcy0NCj4gd2l0aC1zdXNwZW5kIHN1YnRlc3QNCj4gDQo+IA0KPiBP
biA1LzEzLzIwMjYgMTE6NTIgQU0sIFNhbnRob3NoIFJlZGR5IEd1ZGRhdGkgd3JvdGU6DQo+ID4g
VmVyaWZ5IGJhY2tsaWdodCBicmlnaHRuZXNzIGlzIHByZXNlcnZlZCBhZnRlciBzdXNwZW5kIHJl
c3VtZSBjeWNsZSwNCj4gPiBUaGUgdGVzdCBzZXRzIGJhY2tsaWdodCB0byAgYSB2YWx1ZSAsIHN1
c3BlbmQgdGhlIHN5c3RlbSBhbmQgY2hlY2tzDQo+ID4gdGhlIGJyaWdodG5lc3MgdmFsdWUgaXMg
cHJlc2VydmVkIGFmdGVyIHJlc3VtZS4NCj4gPg0KPiA+IHYyOiBSZW1vdmUgdW51c2VkIGVudW0g
YW5kIHVzZSBURVNUX05PTkUsIHJlbW92ZSBsb2NhbGx5IGFkZGVkIHByaW50cw0KPiA+IGZvciBk
ZWJ1ZyAoS2FydGhpaykNCj4gPg0KDQpIYXMgdGhpcyBiZWVuIHRlc3RlZCBvbiBPTEVEIHBhbmVs
IHdoZXJlIHdlIHVzZSBBVVggVkVTQSBiYWNrbGlnaHQgdmlhIFBBTkVMIExVTUlOQU5DRSBwYXRo
DQpCZWNhdXNlIGluIHRoYXQgY2FzZSB3ZSBlaXRoZXIgZGVwZW5kIG9uIFBhbmVsIHRvIGhvbGQg
dmFsdWUgZm9yIHVzIG9yIHRoZSB1c2Vyc3BhY2Uod2hpY2ggY29tZXMgaW4gYWZ0ZXIgMXN0IG1v
ZGVzZXQgYW5kIHJlc3RvcmUgcHJldmlvdXMgYmFja2xpZ2h0IHZhbHVlKSBvciB3ZSBqdXN0IHN3
aXRjaCB0byBtYXhpbXVtLg0KVGhlcmUgY2FuIGJlIGFub3RoZXIgaW5zdGFuY2Ugd2hlcmUgcGFu
ZWwgZmFsc2VseSByZXBvcnRzIDAgY2F1c2luZyB1cyB0byBnbyBkb3duLg0KVGhvc2Ugd291bGRu
J3QgYmUgYmFja2xpZ2h0IGZhaWx1cmUgYnV0IHRoaXMgdGVzdCBtYXkgZmFpbCBiZWNhdXNlIG9m
IHRoYXQuDQpDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoYXQgY2FzZSBiZWZvcmUgZ2V0dGluZyB0
aGlzIGluLg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ID4gU2lnbmVkLW9mZi1ieTog
U2FudGhvc2ggUmVkZHkgR3VkZGF0aQ0KPiA+IDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVs
LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEthcnRoaWsgQiBTIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+
DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC9rbXNfcG1fYmFja2xpZ2h0LmMgfCAyMyArKysr
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfcG1fYmFja2xpZ2h0LmMN
Cj4gPiBiL3Rlc3RzL2ludGVsL2ttc19wbV9iYWNrbGlnaHQuYyBpbmRleCA1OGMwYjQ0MjcuLjBl
MzVhZWVkMCAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfcG1fYmFja2xpZ2h0LmMN
Cj4gPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfcG1fYmFja2xpZ2h0LmMNCj4gPiBAQCAtNjUsNiAr
NjUsOSBAQA0KPiA+ICAgICoNCj4gPiAgICAqIFNVQlRFU1Q6IGJyaWdodG5lc3Mtd2l0aC1kcG1z
DQo+ID4gICAgKiBEZXNjcmlwdGlvbjogdGVzdCBicmlnaHRuZXNzIHdpdGggZHBtcyBvbiBhbmQg
b2ZmIGN5Y2xlLg0KPiA+ICsgKg0KPiA+ICsgKiBTVUJURVNUOiBicmlnaHRuZXNzLXdpdGgtc3Vz
cGVuZA0KPiA+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCB0aGF0IGJyaWdodG5lc3Mgc2V0IGJlZm9y
ZSBzdXNwZW5kIGlzIHByZXNlcnZlZCBhZnRlcg0KPiByZXN1bWUuDQo+ID4gICAgKi8NCj4gPg0K
PiA+ICAgZW51bSB7DQo+ID4gQEAgLTIwNiw2ICsyMDksMjQgQEAgY2hlY2tfc3VzcGVuZChpZ3Rf
b3V0cHV0X3QgKm91dHB1dCkNCj4gPiAgIAlpZ3Rfc3lzdGVtX3N1c3BlbmRfYXV0b3Jlc3VtZShT
VVNQRU5EX1NUQVRFX01FTSwNCj4gU1VTUEVORF9URVNUX05PTkUpOw0KPiA+ICAgfQ0KPiA+DQo+
ID4gK3N0YXRpYyB2b2lkIGNoZWNrX3N1c3BlbmRfY3ljbGUoaWd0X2JhY2tsaWdodF9jb250ZXh0
X3QgKmNvbnRleHQpIHsNCj4gPiArCWludCBtYXgsIHZhbDEsIHZhbDI7DQo+ID4gKw0KPiA+ICsJ
aWd0X2JhY2tsaWdodF9yZWFkKCZtYXgsICJtYXhfYnJpZ2h0bmVzcyIsIGNvbnRleHQpOw0KPiA+
ICsJaWd0X2Fzc2VydChtYXgpOw0KPiA+ICsNCj4gPiArCWlndF9iYWNrbGlnaHRfd3JpdGUobWF4
IC8gMiwgImJyaWdodG5lc3MiLCBjb250ZXh0KTsNCj4gPiArCWlndF9iYWNrbGlnaHRfcmVhZCgm
dmFsMSwgImFjdHVhbF9icmlnaHRuZXNzIiwgY29udGV4dCk7DQo+ID4gKw0KPiA+ICsJaWd0X3N5
c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUoU1VTUEVORF9TVEFURV9NRU0sDQo+IFNVU1BFTkRfVEVT
VF9OT05FKTsNCj4gPiArDQo+ID4gKwlpZ3RfYmFja2xpZ2h0X3JlYWQoJnZhbDIsICJhY3R1YWxf
YnJpZ2h0bmVzcyIsIGNvbnRleHQpOw0KPiA+ICsJaWd0X2Fzc2VydF9mKHZhbDIgPT0gdmFsMSwN
Cj4gPiArCQkgICAgICJhY3R1YWxfYnJpZ2h0bmVzcyBhZnRlciByZXN1bWUgWyVkXSBkb2VzIG5v
dCBtYXRjaA0KPiB2YWx1ZSBiZWZvcmUgc3VzcGVuZCBbJWRdXG4iLA0KPiA+ICsJCSAgICAgdmFs
MiwgdmFsMSk7DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgdm9pZCB0ZXN0X2NsZWFudXAo
aWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgaWd0X2JhY2tsaWdodF9jb250ZXh0X3QNCj4gKmNvbnRl
eHQpDQo+ID4gICB7DQo+ID4gICAJaWd0X291dHB1dF90ICpvdXRwdXQgPSBjb250ZXh0LT5vdXRw
dXQ7IEBAIC0yNzMsNiArMjk0LDggQEAgaW50DQo+ID4gaWd0X21haW4oKQ0KPiA+ICAgCQl7ICJi
cmlnaHRuZXNzLXdpdGgtZHBtcyIsICJ0ZXN0IGJyaWdodG5lc3Mgd2l0aCBkcG1zIG9uIGFuZA0K
PiBvZmYgY3ljbGUuIiwNCj4gPiAgIAkJICAgY2hlY2tfZHBtc19jeWNsZSwgVEVTVF9EUE1TX0NZ
Q0xFfSwNCj4gPiAgIAkJeyAiZmFkZS13aXRoLXN1c3BlbmQiLCAidGVzdCB0aGUgZmFkZSB3aXRo
IHN1c3BlbmQuIiwNCj4gdGVzdF9mYWRlLA0KPiA+IFRFU1RfU1VTUEVORCB9LA0KPiA+ICsJCXsg
ImJyaWdodG5lc3Mtd2l0aC1zdXNwZW5kIiwgInRlc3QgYnJpZ2h0bmVzcyBpcyBwcmVzZXJ2ZWQN
Cj4gYWZ0ZXIgc3VzcGVuZC9yZXN1bWUuIiwNCj4gPiArCQkgICBjaGVja19zdXNwZW5kX2N5Y2xl
LCBURVNUX05PTkUgfSwNCj4gPiAgIAl9Ow0KPiA+DQo+ID4gICAJaWd0X2ZpeHR1cmUoKSB7DQo=
