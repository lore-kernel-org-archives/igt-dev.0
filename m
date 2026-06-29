Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86411C43602
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 12:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1FE10E081;
	Mon, 29 Jun 2026 12:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIQNJWnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DED10E081
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782734395; x=1814270395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FcRwmhqNW/RiPWZKuPZSq5AiaRRDXLA4t0F9lfnKc4I=;
 b=iIQNJWnzUyiIu0NlhgW9uWTL3hx7zX8fbLI5qAYkK381PzccEkX38at+
 mggLSDHCudmI6Y1K2DIvZKRURdVDg1fQHHbpUPL37sxHiBh2/fK6v6qaa
 5H90UE+eDTW+0jdFz+se9vN4gd9Q1YBXMgnksqFxRUaDYyCab6+B0fcG7
 qZyjB2QwUdD2jcB8aOwv/XZDRGHc9hBo0hQhLaWzOg0/IOdf4xbH4i/i9
 IAB954oQAt2OFBGOtC2/LJtPrvC5A28D2QFIxnNxp5dACL4He25St//So
 7lc8azT3dDJx4L34yMEcu2RRPN4Ua2F/TI8Sqhl3s2Iaveeu8Vd5C0wM1 Q==;
X-CSE-ConnectionGUID: Wfiy0Wb/RS2C4KwNmiF6lw==
X-CSE-MsgGUID: FTFPdui+SCmEEAAAP0vByQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94806593"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94806593"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 04:59:55 -0700
X-CSE-ConnectionGUID: Noeks2nDSt21bkm/lik77A==
X-CSE-MsgGUID: LOEPrGsoQTKBWHsRoaCR6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="250246029"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 04:59:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 04:59:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 04:59:54 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 04:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+fwggs5ZxOBhLlpAA7lBrDxNzp85s8LFUXlDQ3voOuAdjcioCPRdOffpM16Zgaa//4OiWkcvQJMdxP9KCdi5UVUn5us1zC40wr0QEiMWUJthI96Dx5gxXDO/lvNk4auQQEXgKutIrqo7odskygAA5D0ehdyn52KswZ6DirXiwiFgOJwYlEzmAXLIBrHTBgFfImXFxuOWUBNsMXSIU7CRCO2YYmDTJzInSn2Fyt4wm58Ys2LUCRJ6DvfxWyZ1j++E+69mrHcMleYAxuRHYOq/gIqAWLxsP+jQTDz1bcZb/Syb/2YRauGcT2HrwLL5A4K4UHtvff03j7BOy3jzUbinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcRwmhqNW/RiPWZKuPZSq5AiaRRDXLA4t0F9lfnKc4I=;
 b=OdkscCgRxceqCpboYLRcz236XCFHqsi84wkshTxqmkd6GPSeEFaQdS++nbCzNPbxCamqARaFrl+LtkiTqN/4XjvjYZy0qM9/z5V5fPuAW/PUuZPJjb4xIvVDdNNDFXa8gCD51E+O4LWSE9pDQjLYcKvgVHmoXfLYL5K9M1qxa9nH46fJPmEwAoHaP+uQcnt6IMAJuVG7CYh/PTWHwlax/+OPkJXmRa6w3yfZQtkTyo0OMn9MNXduON6mn7GvuwTVHUI6SWFzUauznDp1Wo8oFi7hGsBEDCLRBDz81iNnEcJmrH4B+3l4IT2Jnp1wp3mzUtvb52HIVhOykwyxNB8NTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Mon, 29 Jun
 2026 11:59:51 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 11:59:51 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
Thread-Topic: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
Thread-Index: AQHdB74NUB6WJS1WEEuoyThVpHevELZVbhcA
Date: Mon, 29 Jun 2026 11:59:50 +0000
Message-ID: <d328c5bf13290b9747f9b51f4e5d423967413b94.camel@intel.com>
References: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|DS0PR11MB7558:EE_
x-ms-office365-filtering-correlation-id: 8e786451-2704-4055-4805-08ded5d5ecde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: GVE0FEbdIe2bdPegl6HjyGbZaAVSQdIX+FDsYUvAqymVuWpVB6/4uKPBI4UjmnJNyQd6nPqMPssQzRqwfqr3udGxhDvhs8t2srCBrpcQjxbpA5clg9RtZ3pfVINW9CezMuW4lZnzZZt03EMXEvOXKEVRRY0GKRkCMCE8aJSZZJ5yRF7FI8Nuu9AGB/wHaNL5x39pWey97TOLVpA7dmVFEDdWeEm33ZWy0O6DrEqz8IOTcYiMebnk1SA9aZXHtLcj8tux1wuojqlSFhq0nwns522qjuPZwHOpJC8a4L+/ISMtev/cua9c8sP54KbHg3TYOWOSOR/0aNjpNaJApUVOIONaVv+m46OwOyrYzOZf1YlYhzubox1HOUSIhatI8MZQkjVefOZQdsSkhMVEFOqsSJNmADHVUD0XpuV7p2UP/jxIkCBfP/+NlLcl/H2t4jKlc8me2ev/Os0XtrJ5egoaXw6Zyerqa04TQk1D5U9pXwfoYOdTn+2xFGc/GQY1/Qg4X0umE1bYbZNPss153apfRzSdElBAIVghxKTfuWoQGTUXw06YVOvRAUYbGyxPO4rwhufq63DWErJQYznoUFXapj6UFqmthW7J6O+kBV72726QS6DyVZ1ahCE7PRKhDNvznWERUtrbpmH4pIuYIFGsLVI1rUgFcEbnw2gDto2H+4WDkiiZIARRadDZmIcm/Byt8Kre5WjtcM0EN9liz9DI0RG9vZYXBAceZ34r1vHaA5c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUptL3Fla1huaXQ3V3hWSUZiZGhtK3o1TVVQcHB1bkN0NUVBS056OE1zdXF3?=
 =?utf-8?B?ZlgrdFNSWXdZVFZsQ1Btb0MzMWJGaXY2ZGZDVlFjbk03K1kzS1YzOHd4d0tv?=
 =?utf-8?B?am1LaXdGdlNieVpFUFJ4UjBWeGl1aWEwTnNPRW1oQWFINUdyMWRTV2JWVk9S?=
 =?utf-8?B?dTJDYVFqdjUwaDZSU0R3ZFNUakhFWHFEcytnc09sVjlmWS9ydDJHVUVPZXVH?=
 =?utf-8?B?d25KTVJVTTVHWEx4U0U3R3EzUUE2RXpXWTE3UFBIWSt6RVlVVURYM1cvL1pN?=
 =?utf-8?B?NGRBMk45a1h6Q0RBdERrM2pPQmtPR3NHSmRTbUQ5RlNDSVgrRXVTK2FwYWdl?=
 =?utf-8?B?WW1hanE4QitscTBkYXg5NjN1bExpSGNOZ1Fzc1ZqTWdiWnRhQW1UVlhKK0Ez?=
 =?utf-8?B?U0t1NmpyUjA3Q245M2UyZFZSRGEzdWlDNzhDTUJ4VUxSaTZzTHBVQTNMZTVB?=
 =?utf-8?B?czJHYWhiMExwMURVaU16eGw5S01maFFMbEpBTE54SFI4QU1XMXpoK0dma0FG?=
 =?utf-8?B?TUFJd2EyM091eDRtYlFpWmMzMGNGakh5OVRBWjNZK2FwS1ZtZit1TUhjWENN?=
 =?utf-8?B?Y0grek1MMWlRMVRYN2k3aSt5SDVqSi9UMldaM0FZZStJZlBpTGVZanpWZ21M?=
 =?utf-8?B?Nk9lZVBFSnl1QjQycFVaMnQ2UklrcEJOMUo0dldVK0lmRXc2Z3FaYzhaUlMr?=
 =?utf-8?B?eGQ2K3JiM2hNVDgvckt1cWgzcWFWRFJrQVZ2d0JkNFhuQWZqY1UyM0V4N0R5?=
 =?utf-8?B?OXA3U1phNzJuK1ZHMmpQc3pRZGtTdkYrNklTVGZkcGI1QWlaMEFQN2NnTnY1?=
 =?utf-8?B?aHRqWDB3dWdRV29JSW5wN1VvTUpjRUxvZGxKMjFIYk9qd0s5dHFRbFpWcytQ?=
 =?utf-8?B?L2JvdW1uaDJkdU1jOGdzdmVSaGovTUJFSDUrMGlOemI4REpFb3pDTmp2eE92?=
 =?utf-8?B?T2JPMjdpV0dDeUY3T1BoUXBQS0JJSXRNVzNib1M3ZGQyckZTT2RYaXVRaTNq?=
 =?utf-8?B?NllyRlA3YUR0TWIrQzRKa1RBMnlqd1ZRWkpOVlc1UVRROUphQW1WM1N3RzJM?=
 =?utf-8?B?enNTWUk3Y0NJMlRlRzlHUjBDVmtMWERka3g0R2w2NXU0aVg4WWlGMUVzMTdD?=
 =?utf-8?B?bE1JQThvR0h4by9tSzJaWDlSMXN2Qkt0WWhBdGtGakNBTzJkU0hIMEdLTkdw?=
 =?utf-8?B?cUdJcjhoMi8xSEdGTmFFNnpMMGdWbDd2VVFJRXFxUmNjZmJ1RTh3dDA2akpB?=
 =?utf-8?B?dWx3MFdRaDNuMHkxQUJRWjJ3ek9lbDYwTWRxdUJuS2o4UDcrOVFNOVNOYmJE?=
 =?utf-8?B?cjR0UENORE9aUS9vZVhpQXl3Qm9VS0F6Sks5dW9WNnJ1d2lUSWlrMjNwU3lq?=
 =?utf-8?B?d2twRDZZRDNEdGlGU0ZmajJQM3QrRlliRFphRk5sYmhVNEJtcXU2cnJSVjF6?=
 =?utf-8?B?V2h1Nncwd0RyNk9jbVNrTXFCa2tyTEpGcGpRcWZpQm02NkFCaGdXY1BOanRF?=
 =?utf-8?B?dDVNeFZMVDRQems1WnRKV0ZQcmx4K0RuZzhla2dSS0o2YTFHOG9XTEJIdENV?=
 =?utf-8?B?MTJhYzRQalUwZFJ2MGJXTXg4TjU5SWpmYzAyZTM1SDZaS21BZ3l2WExCQ05z?=
 =?utf-8?B?Y21saDU3OVcxMklNK3gvV0Z4UGw0TllpZXpCREh4bm1qeUFOV3k5eHZ2SUx2?=
 =?utf-8?B?c3crWmpJbDA0SkdIQ0w1Sk55OGdCRXBLUnB3Ymx5ekRTUGVxQmpDZWpFUEhz?=
 =?utf-8?B?b0U1L3c4eWNDMTR4U0hNUW41MGRwaUZoMlhmV24va0FjL1RaNVdEclZMekhQ?=
 =?utf-8?B?WDR5ZXArNTdtVjFFNFBrZmJWYUFhVGZNcEZZVHliM1UvUTdsS2hESHJLcnJK?=
 =?utf-8?B?ZllJYUpjbUJUZGZuK0JvSnd3QlFWN0RMM1JrMkUrTjU3OFdOZWJKS2s3ZTRW?=
 =?utf-8?B?eGdBZXZXRUtSeHAvUHdVNElTd0d6N3Z2UlFCZUdhOEhEZHAvaDgvQklEUzRx?=
 =?utf-8?B?enhmSEZrRFZWc3BRQUlwN3FwUWtsWXN1VFU5Uk5jS2tpZFZWZ3NoZnVVVWtI?=
 =?utf-8?B?MW8yaldUUFMxbDhsODRLckJ3SHlWaWppMmlwRW1veXM1eWtrWDBUUzE0K0xB?=
 =?utf-8?B?TTg1emF1c3RMYmh5Yy9lQktpYklRUEJaODBHK1NtT1JzTFQ2UFZYVTdSQ0ZR?=
 =?utf-8?B?YUlVbzB6ZFpoalZZQlA5bTI5VEJQek5lVVlXMHZ6MTJ4Rjd5MEVpUTJncFFS?=
 =?utf-8?B?VG5yOW11K0RHZzRWK0JkeU1adWsrdGhOSnlCdHpER2o1N3ZuMHVYUG1lbXh3?=
 =?utf-8?B?OGNqOXp5VGNYNHhUUHhQQWg5MEpmOUxkaThxRCt5dzJ5T3N3Mkl2amxDa1lB?=
 =?utf-8?Q?jK8O4oi5URWweI9I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76B14332897D4446B64DD80233F52FC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lvY/5z42pqJaSsxOidmykfsXAnfsFiqJJaxlCRL95MhgTvFrcLUT/4aXWc5FisSuoqIGhu0zxiv4sOXXHiuYQmTTYhwxMRsPEqJd5+XqX7jrl9dTD7Fyn7VhJfmAnz2HdGn5Cf+AzZV19k4DimMBUMpatPUVlqG58SC4X/kaN3PxxrFf74+hMy4PdWJLLztjtgy1OfubbfXqlYvjklmJ2HVv9qklreBXNTbbw7d7NI+4aLZ+9jQqzSlcwZUsPrZj6OBGJ8rSiSD8j3MHTlOU9qf4wDW7NLAigdPOtz2YV+14I/umDXfi4ITUxfoBGox2WaEpATiE9lNOUQKPmGXcxg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e786451-2704-4055-4805-08ded5d5ecde
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 11:59:51.1624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5J3P/TuVkoDtWMOQU3/B8A307DCpIlZKHlJK2sbvB8jJL67AReJNBbf2wtc7rzR2q/ukcEXnxgapQ2X1VxV0+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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

UmV2aWV3ZWQtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCg0KT24g
TW9uLCAyMDI2LTA2LTI5IGF0IDEzOjU0ICswMjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kgd3Jv
dGU6DQo+IERvdWJsaW5nIHRlc3QgbmFtZSBzaXplIG1pZ2h0IGJlIG5vdCBlbm91Z2ggZm9yIHJl
YWxsb2MgaWYgdGFyZ2V0IG5hbWUNCj4gbGVuZ3RoIGlzIGxhcmdlciB0aGFuIHRlc3Qvc3VidGVz
dCBuYW1lIHNpemUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kg
PHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IEd1c3Rhdm8gU291c2EgPGd1
c3Rhdm8uc291c2FAaW50ZWwuY29tPg0KPiBDYzogUnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfaG9vay5jIHwgMiArLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
bGliL2lndF9ob29rLmMgYi9saWIvaWd0X2hvb2suYw0KPiBpbmRleCBiOGYyNWI2YzdhLi5hNDRi
ODUyZGExIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2hvb2suYw0KPiArKysgYi9saWIvaWd0X2hv
b2suYw0KPiBAQCAtMzAwLDcgKzMwMCw3IEBAIHN0YXRpYyB2b2lkIGlndF9ob29rX3VwZGF0ZV90
ZXN0X25hbWVfcHJlX2NhbGwoc3RydWN0IGlndF9ob29rICppZ3RfaG9vaywgc3RydWN0DQo+ICAJ
aWYgKGxlbiArIDEgPiAqc2l6ZV9wdHIpIHsNCj4gIAkJc2l6ZV90IGZ1bGxuYW1lX3NpemU7DQo+
ICANCj4gLQkJKnNpemVfcHRyICo9IDI7DQo+ICsJCSpzaXplX3B0ciArPSBsZW4gKyAxOw0KPiAg
CQkqbmFtZV9wdHIgPSByZWFsbG9jKCpuYW1lX3B0ciwgKnNpemVfcHRyKTsNCj4gIA0KPiAgCQlm
dWxsbmFtZV9zaXplID0gaWd0X2hvb2tfY2FsY190ZXN0X2Z1bGxuYW1lX3NpemUoaWd0X2hvb2sp
Ow0K
