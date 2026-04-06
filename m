Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81C6E9D82F
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 03:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7840410E151;
	Mon,  6 Apr 2026 03:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0d2REX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660B710E151
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 03:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775446076; x=1806982076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uZ64ZUX+eYkkpcSKKhdbcn70rARWbCj0T8NbA4gwGCY=;
 b=G0d2REX29z15TPaXUOsNGMl8b2xehF4C4wj8GWp6I4UivPnYrZ6W7tmS
 bdXXim6BLHYgMlxyBY4NkNDRxwuIsbMINV/GhbfJIoWVKlPLW+/LUVRDu
 IxjUNXcKXhCR4Gu9v13vBuJeYiIaGv6LrgvKDTDqy7epWU1MDu/jpwS+R
 NlfrZb3d6IKVXS0o9aWliIe5vMrHTbzGngrvItp0hhUaYe3lMX4lXnEdK
 JG5CM+zJ82MY7XJyR1gfM5hlQLah8WY7fBgSCnDpQ5hxzqZMuxrkDz2oz
 1/GCKMpNqILFyW1rJOjax5pI8vMIuyc9S4HIoFvLml3e7qZX0Tsc+Qa7E Q==;
X-CSE-ConnectionGUID: 9uGI6QHgQZeTO9l4PuIZOw==
X-CSE-MsgGUID: tlWX99zJTcCGw0e60p0w8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87106622"
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; d="scan'208";a="87106622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 20:27:55 -0700
X-CSE-ConnectionGUID: xLI5xz4GS52KzsTQ+ZD9VQ==
X-CSE-MsgGUID: J1cT6XzATtmVeizps9Kirw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; d="scan'208";a="258234923"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 20:27:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 20:27:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 20:27:54 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 20:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnX3DYYtpKnnyf9HjE30GgMbZTh4l8iFDvFYsNl4kR3qB4z2BJOR64v6YTjYRe/PPzFLyPzwOPIrEQfMfKbkEOn186WM3Rp6RhYw34PYBEHZ7sgdYvtwIedVOUvgSnD0j/U27N/Z5YXcUDo3yL6SrtGVyvG/49zwIx0L8PICCjkxGJosR6SJkNC3cHJo/+H91jjjwwa47UfE+OfOpqxMj5YwvxJCcKufy1+RHTisgGerV6BVbNKkuBPPjfUtqM98O1PIQUlGs+LApa8usNzFVqtIG/GYmXFD7O10cPqAR+jBQ+1qsSpKK8uapTq9ST5xAaZ+/DE/H+NPlWWcXSO+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ64ZUX+eYkkpcSKKhdbcn70rARWbCj0T8NbA4gwGCY=;
 b=PCktDjaIP405/CF6cVKqbuxVH1chl283kIwiU6JwcFRZ/AZVoiVbpWMzd5VdaYiAIr9oSvaMjM5NJVBRQiWhM9VJDJA+EuhLZL36fwR2zX/vJj7k5Tt37hlQTa4T5Oq7D+rH83Dvxug7tQeg2judW2zHQPDiLPASUH3U9AU7zPw81xPyZr3CVwKFdeTEqhLwmYbBrZwQnqdkExqro6/+OVTPGS1gybVq2YWe2KXnXn6dkH5Ms7wAxf9cYFNa9zNF2TkGEzYMVwYpPPsSk8TnNxOlEeJwZpP6/wHMW7zoAh8cE67oIyOkZ6dfz2uyluWP4pjfcemjiGAJcf0qNf2Z6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 03:27:49 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 03:27:49 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Thread-Topic: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Thread-Index: AQHcwqewLJGx1IHYZkuGKgamtvxxWLXL3FMAgAWI2KA=
Date: Mon, 6 Apr 2026 03:27:49 +0000
Message-ID: <PH7PR11MB8252F8F779CF99DB4D91B16E895DA@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
 <20260402145600.4m3qwxyqwowsvcr2@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260402145600.4m3qwxyqwowsvcr2@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|SA1PR11MB6566:EE_
x-ms-office365-filtering-correlation-id: 3c41d551-d752-4f89-9eba-08de938c7a97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: mfvSg71Agnos78rOSyXx0H3drSElcM7IXQJ1UzhYpm3cS5RL/xOMDDyjR5mBKmu3v70Igh2sBDKc2TAwUhBVscV8vP1SxjsjvhNKIEEU25CLltXUYWT9WIEloMyxiC29qGJA1BC6RzKoGIKTxwy84UHYZI6Ic0x/PSL1SyN3F2PqpPoRPKkhquYYc07YPp86+ZSH8xuQo5IYYW7xBZazIi99VdL4Gc45s03Eh0kbPwS1bvrW4aJrykTE6xaHki/YeKXdkUSzGmAfbscr96SVhy8i511IGFNFhhzdq8dqNrZYFjEFkkFDXJSdlP+pmbaCAHulrmaURdOVt6wJup27YUUfbbk/8+5YsNNjffqR7o8LwBH/QOi47RuG2aTYWG8N4tvzKLlZY9ixwT0Zj0VUNmUUzLuuzqjKPdgQU72LAmBM00o1xpH0vpda/yYV5mcetuRwkELzd9u1BCOdHuKGxMwnnVNhJQCDU7Wiua8c5tE0Deh/wOEGSkQrfeV/NcUhKA4Tf68koRxz4Z3K245VbmTDtqo4vOeUCk3qNGw5yjOxT1knaEX/QDMbpBe9YiyrI++qMJFympYWVDISxjaiFQDtvu54Y9tM53/9hv/Xzry/g2rAv6hMZMq7c+poc/gvszMNX5aCSlzXYRnhq4Ea2f29GjPbfvXvZCo+6Pz0e/EAIzaFss2gLOB7zUOSE/tfBo6FB8b0ntW8Y5K49tCKgMrw9WqQCBGssBLRRSJBfmQvLwjy4/fzX86DuKKtJgCA2pduGdq3pSqszXD649KxPEEH78oLQcPK/F/eaAfejP4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGFGc3U4cTNSN3NVSVVyYUdtRXFKSUVYMUlMdDlraWZ5dnQ1NTJoMkwzUXFM?=
 =?utf-8?B?dGwzdkIrM0lqVnRPOEpjTlRmRjVvVllnUE1wVS9wdWNQOGw0bXF0SDQ3YlVK?=
 =?utf-8?B?Y2ZJQTBLRzlITkJYNUNqamkzVnNuVlRRa2pIRlUrTUFoUG5LRS9EZnVIMlFu?=
 =?utf-8?B?VENnVVlkQ00wdnRma1ZlM0xURlVFZityTSt6VnFsT1ZQSklVL3Bxeit2YTY3?=
 =?utf-8?B?SEsyNHVidUxvaDFEVlR0aGl2N25xeFIrc0FhT0xTYXFRVHZBalRKUUczdzFs?=
 =?utf-8?B?akRqM1U3MmJGdGhOU1llVnpIVWxEaGN1bitXUzR5SFcxRERRRDNvd053YS8x?=
 =?utf-8?B?aDlIcGtxZXJuR1JmRHo4RVRhVDg4TkM4VWFXZ213ekFaUDZVbGlUMmZlUi9B?=
 =?utf-8?B?NWZqaE4zOXFUMEVGSzlVWTdqVjBxb1hnSnhKWlZsZG9Mek1GOGc5V0FEMTN1?=
 =?utf-8?B?a05TNWFETUl1a3RJNzRYNXdycFVDaHBtY09GUkViQmFzN0N0WEthS0Fxd004?=
 =?utf-8?B?M1ZvOGo0YXNKazRJZXdUWjkzUEhHay9kYTdWdzFRN0QyMEJqMkREZUI5VlRv?=
 =?utf-8?B?NDNlTG9DZ1o2WVpmN2tKSFY5OHRINWJnUGEwRXZ6elJuZFRUbW84WDZwWSt2?=
 =?utf-8?B?QkF2ZDdsRkxyNmFQeFFmR1d4K3ExMlI1eVk3M2hwRjRJdWRJOVd5Q3lFK3N6?=
 =?utf-8?B?OWpjeWtiaTREMk5JTGt6YTZpajJvRTJUSzFHbmRhRjRlNlBZOXBNb2NSY2wy?=
 =?utf-8?B?azdHUHAwRFFpQlNxREs4M3JCUExyRWU3SUZIN3R5STQxTUljYThDMDdKOVJk?=
 =?utf-8?B?a2dMQUM5aTJSQXJDSTRlYVdnb1lOcEhvb3YyelduZGF5S3hlU1RoblIya2cv?=
 =?utf-8?B?LzJuVU5yOWZvdDA5QlUrRkNrdXNaMCs2TWdVbUZTaTkvNTYwOVVnREhtbERX?=
 =?utf-8?B?OFZUYjJJeEVaczJWd1FyU1duelY3TjJvWm1oeDJLWmZFU1ovaldlS0Fwblhy?=
 =?utf-8?B?SEhKY3BwdFVWdXp1dTFyeVk0dlNVR01yWVB2TUFoSXd4TnovdTZZVDh5ZkFZ?=
 =?utf-8?B?b25XakVGMGhUeCs3MUdkdk4rc2pHcGI2dWRGSkNQcXQwSWdvK1BOWmpKMWFN?=
 =?utf-8?B?cWNaT0Ywc01JSVJkM1JsYXlTa2hNM1RXVUg1cDRvSkNkUzhkSWQyTzczWlRX?=
 =?utf-8?B?L0lQZ051N3dMa0hkcGJNdnZHWmRjSDljc3pxcVJNMFh6RzBlT0JVQTNuRnkw?=
 =?utf-8?B?ZzI0aUIreHVoWFBCbWpnSVByUnZ0bFZsZGZyY2J3OVBZV3lKVDlOencwSFJR?=
 =?utf-8?B?SjJXbzI2OXF3UHNMaGNTTWpQOEhkWGJwajJPU2Vha3l3bnJIQkQwc1oyeFRT?=
 =?utf-8?B?TVR2Nnp1dngrZ0xZRHk2dU9BcEg0c0JFNU9tZW1reUxwNThpUVdJNEljcmJM?=
 =?utf-8?B?SzFpeEpLdDNwSkNkS2lrbHJmbElXUjhrOWtTZnVsUkY5VmxEdFZXT1BVVGhR?=
 =?utf-8?B?QW5kTElvNmJJSWtpT28vNGFMYnM1dVNXcDFqVlZUMUNYMHhlWEp3N1NIeHlp?=
 =?utf-8?B?Wm93Q0xINUxYMmhoZXRMcEtHTE4xY2tXQnl5ZDFESkFiRVo4L1hGV09RTGV0?=
 =?utf-8?B?YmxrbDgyMXEzbVY4enphWjJ3aWYyTUVPV0ladUxGTittQkozeTlIblV6T1BT?=
 =?utf-8?B?UmZqMTFEdG54THVvNVcvUjJPTzlDcjRDb0NVZFZiTk82TlRiZXFLZDYyVlly?=
 =?utf-8?B?cXpLaWxnQUR0UW8zTmdYSGV1ZHA5UEp0Y3AvZndPRXloNHRrWTJ5Tzc5Vzhm?=
 =?utf-8?B?NVpjeFVEdno5d3BqN2d4Rk9mMHUwcWwxaVV5VTFIbmpjRG5pbklwUGxLLzQ0?=
 =?utf-8?B?bFJiWE1PKzNNdHN1MGs2UTZzVjEyZVJxZEU3L0I0RkF2aC96aXVrb0h5S1F4?=
 =?utf-8?B?S0wwRnFWY200Sm5vT05zZDVxN2FkVlh6RWhRZjVHVGxqaVRKOGtjMXRVNitn?=
 =?utf-8?B?MEErSEdaM3ZJK0xkUjdwMm5ScUJ5YUR3M2N0UHlqNmFML2hwZXYxUXJybDFS?=
 =?utf-8?B?bHg4a0NJNTJzb2JsSk11THpjVzBMRDRTTHFLMndBLzlMdVhWdWs5czYxOHVt?=
 =?utf-8?B?MVduREhSQ05JUGNwMXJ2bU5hZlpsY1NrVVV0QVdsajQ3R0MrZkYxd3hqOGlL?=
 =?utf-8?B?SURTcHdFdit3TU1Hdm9oc2ZKM3RWSWVMaTdmdVUvZmhqSjFFNmZSOHZpS3Mz?=
 =?utf-8?B?SjVKZGNuRENJV1N0d3llNXpCTDBTN2J2aENvSEw2Q1A5bStLVXJWOHdJOUFh?=
 =?utf-8?B?TkdFYmVFK3dVVnJsSitwY0xiNkwzNWxuZnk5Y2dteXovWGVMdDA1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nu6WlpLExZt/frbs6cxA7QQRRuNWtcmCqpRVSeWeOjRn5Zoqtz6dqRub52vGch2Lnoc31OheUK/p9f6X/tT4ABoD3QVSSsNgBRnVHzS11QMj0XGefIO24CgMK7XPSqb5FQt+WhmVjd/QdJo18+dXcRuZByr+oMwpfn57rNrBwKp6IKZoVapExPMk4xlBTsVMhcjnAK/sMduRQ+OpirVv4b2Jm06M9R86ERYPnIY/Slr717l/kHLrd9ORfv2EzKQf6gVJ9HBUwDESmpRrbZgbKIy6QxJb4ynnAgGU1w17wz7WWbN5AvP37aJl4njp6Wd79BCqWKiWExK9Nd4Q9eVi7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c41d551-d752-4f89-9eba-08de938c7a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 03:27:49.4457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mqj54Xzic9eA0iCZpipCT/cCfHUUGUXS8XCxnZNCUSsm3OZ4AS2ucsuN9Ovh8b+9JCQ0FJcyLeSDTlhupCWvEZwB54p4k+cDkEO6j8eUB6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAwMiBBcHJpbCAyMDI2
IDIwOjI2DQo+IFRvOiBTcmluaXZhcywgVmlkeWEgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT4N
Cj4gQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHRvb2xzL2dwdXRvcDogRml4IHplcm8gb3V0cHV0IHdoZW4gc3Rkb3V0IGlzIG5vdCBhDQo+
IHRlcm1pbmFsDQo+IA0KPiBIaSBWaWR5YSwNCj4gT24gMjAyNi0wNC0wMiBhdCAxOToxNToyMSAr
MDUzMCwgVmlkeWEgU3Jpbml2YXMgd3JvdGU6DQo+ID4gV2hlbiBncHV0b3Agb3V0cHV0IGlzIHJl
ZGlyZWN0ZWQgdG8gYSBmaWxlIG9yIHBpcGUsIHN1Y2ggYXM6DQo+ID4NCj4gPiAgIGdwdXRvcCAt
biA1IC1kIDEgPiByZXN1bHRzLnR4dA0KPiA+ICAgZ3B1dG9wIC1uIDMgLWQgMiB8IGdyZXAgcmNz
DQo+ID4NCj4gPiBpb2N0bCgwLCBUSU9DR1dJTlNaKSBmYWlscyB3aXRoIC0xIHNpbmNlIHN0ZGlu
IGlzIG5vdCBhIHRlcm1pbmFsLg0KPiA+IHVwZGF0ZV9jb25zb2xlX3NpemUoKSB0aGVuIHJldHVy
bnMgd2l0aG91dCBzZXR0aW5nICp3IGFuZCAqaCwgbGVhdmluZw0KPiA+IGNvbl93IGFuZCBjb25f
aCBhdCB0aGVpciBpbml0aWFsIHZhbHVlIG9mIC0xLg0KPiA+DQo+ID4gVGhlIG1haW4gZGlzcGxh
eSBsb29wIHVzZXMgJ2lmIChsaW5lcyA+PSBjb25faCkgYnJlYWsnIHRvIGxpbWl0IG91dHB1dA0K
PiA+IHRvIHRoZSB0ZXJtaW5hbCBoZWlnaHQuIFdpdGggY29uX2ggPSAtMSwgdGhlIGNvbmRpdGlv
biAoMCA+PSAtMSkgaXMNCj4gPiBpbW1lZGlhdGVseSB0cnVlIG9uIHRoZSB2ZXJ5IGZpcnN0IGxp
bmUsIGNhdXNpbmcgYWxsIGNsaWVudCBvdXRwdXQgdG8NCj4gPiBiZSBzaWxlbnRseSBzdXBwcmVz
c2VkLiBUaGUgcmVzdWx0IGlzIHRoYXQgZ3B1dG9wIHByb2R1Y2VzIG9ubHkgQU5TSQ0KPiA+IGNs
ZWFyLSBzY3JlZW4gZXNjYXBlIHNlcXVlbmNlcyBhbmQgemVybyBhY3R1YWwgZGF0YS4NCj4gPg0K
PiA+IFRoaXMgYWZmZWN0cyBhbnlvbmUgdXNpbmcgZ3B1dG9wIGluIGF1dG9tYXRpb24sIENJIHBp
cGVsaW5lcywgb3IgYW55DQo+ID4gbm9uLWludGVyYWN0aXZlIGNvbnRleHQgb24gTGludXggb3Ig
QW5kcm9pZCB3aGVyZSBvdXRwdXQgaXMgcmVkaXJlY3RlZA0KPiA+IG9yIHBpcGVkLg0KPiA+DQo+
ID4gRml4IHRoaXMgYnkgZmFsbGluZyBiYWNrIHRvIGEgZGVmYXVsdCBjb25zb2xlIHNpemUgb2Yg
ODB4NTAgd2hlbiB0aGUNCj4gPiBpb2N0bCBmYWlscywgY29uc2lzdGVudCB3aXRoIHRoZSBleGlz
dGluZyBmYWxsYmFjayBmb3Igc2VyaWFsIGNvbnNvbGVzDQo+ID4gKHdoZXJlIHdzX2NvbCBhbmQg
d3Nfcm93IGFyZSBib3RoIDApLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmlkeWEgU3Jpbml2
YXMgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT4NCj4gDQo+IEdvb2QgY2F0Y2gsIExHVE0NCj4g
DQo+IFJldmlld2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5p
bnRlbC5jb20+DQoNCkhlbGxvIEthbWlsDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSBy
ZXZpZXcuDQoNClJlZ2FyZHMNClZpZHlhDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0K
PiA+IC0tLQ0KPiA+ICB0b29scy9ncHV0b3AuYyB8IDUgKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2dwdXRvcC5jIGIvdG9vbHMvZ3B1dG9wLmMgaW5kZXgNCj4gPiA5YjJlOGNiNmYuLjEx
MmVjNWRkYiAxMDA2NDQNCj4gPiAtLS0gYS90b29scy9ncHV0b3AuYw0KPiA+ICsrKyBiL3Rvb2xz
L2dwdXRvcC5jDQo+ID4gQEAgLTUwNSw4ICs1MDUsMTEgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2Nv
bnNvbGVfc2l6ZShpbnQgKncsIGludCAqaCkNCj4gPiB7DQo+ID4gIAlzdHJ1Y3Qgd2luc2l6ZSB3
cyA9IHt9Ow0KPiA+DQo+ID4gLQlpZiAoaW9jdGwoMCwgVElPQ0dXSU5TWiwgJndzKSA9PSAtMSkN
Cj4gPiArCWlmIChpb2N0bCgwLCBUSU9DR1dJTlNaLCAmd3MpID09IC0xKSB7DQo+ID4gKwkJKncg
PSA4MDsNCj4gPiArCQkqaCA9IDUwOw0KPiA+ICAJCXJldHVybjsNCj4gPiArCX0NCj4gPg0KPiA+
ICAJKncgPSB3cy53c19jb2w7DQo+ID4gIAkqaCA9IHdzLndzX3JvdzsNCj4gPiAtLQ0KPiA+IDIu
NDUuMg0KPiA+DQo=
