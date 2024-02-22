Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49961C54788
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 13:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B077F10E92B;
	Thu, 22 Feb 2024 13:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OA6KUWiy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4948D10E92B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708608941; x=1740144941;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iNeGJFuva/yq1kNTwz4ked3H4CqLK00Om84kf4fZZhU=;
 b=OA6KUWiy8etUYoB6wQnCGODUY3HnQqAsWxG2be4zGVXXKD79Mpn2/ULK
 Y+exBCwrxHZR4qhWA21eBca2Aj09MTc3bgP+G/5d204pXy52wqrbGRwBo
 A3Ptw1cUWB91ss+Y4ok314knu0AddmkxOnbEcXn16tCpf8FPFVGpUhGc7
 iI7CUO7QdO5vwks6vvQqIoTcn2RrL25iDkQNj8kLa09yOupSShzKrdwqE
 JrFyHWTq+4Z3Z/nqNjxnue1x77xzv7PWyG2EWBKN0GWgxOC9ikNeakI8+
 W3IU1mzcmIuV+GT0RLoXL7mQSpG/Y2glg0xKIrTIaMR3giF1IGjyrED+V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2983275"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2983275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 05:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5880145"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 05:35:40 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 05:35:39 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 05:35:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 05:35:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 05:35:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CST58WNjLOhtPaW/itXQZr9AUmfydA33v/udIcZVev+wboaRzWtskMtiZ2AoH6CQ07IA9UuitG4FsN15ZSf3lgMxo24gbtKkMXXYVDJ72YoFZ4WaaBF+qbt7ANaprx/JdMK+6LtMx4+tPcCIb7kXTKADg4PqrIzuKrft9m9RK9GDQ0OeokoDPm++33F+/bK8K/YUs6C6OfdBm/kCeljg6UO/+2e4bHUpDnj3Asw5UHSHFhvmYIBx9Jr1M5GX6xaQWY854IptIiDa6/SADXo4poa8ci2RDuI/cyWhFzb+OPQIr8XN7mARmIzlb8pflPfglKX8xTfVYsjloyh9NDKkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNeGJFuva/yq1kNTwz4ked3H4CqLK00Om84kf4fZZhU=;
 b=mNjmmZ3SJOqhCDxIpdaAQCRafhBKO0raHw8dqnkqu2hnsJrfBrAYpRsXjghEFdmCGiDhI/bwY0rwVEV7Q0Y1dzuCiGaAxgY47Qab/5aGOJzVtfbO5PqMxhr0HKdTAeTU+8ehE0tgSbtaajocQRNBaOaglOXqrwPPuG+EFnwt5mH4ygqapZ/EP8h6UGs9pEkhczhSWBg1RqcOmHp/QiHPNCijxoUSq8EodZcbCLoaSAtmt51YMPMwy2ZX61OUGz9xTPJ3K4ureWl8PJlgVV6sY2hdpGcHequlFBoYU6/iTgjB5XgrMvraj3e/V+WmFbZAS7G8lH3r3hXjo8Xn3OvhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Thu, 22 Feb
 2024 13:35:37 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::4aa7:758b:8cf5:a357]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::4aa7:758b:8cf5:a357%2]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 13:35:37 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/igt_draw: Don't call i915 specific ioctls on xe
 in draw rectangle
Thread-Topic: [PATCH i-g-t] lib/igt_draw: Don't call i915 specific ioctls on
 xe in draw rectangle
Thread-Index: AQHaZZGbhbgzJKb+Nk2wOfEhNMKBkbEWXEgA
Date: Thu, 22 Feb 2024 13:35:36 +0000
Message-ID: <SJ0PR11MB67899E0AB11BC7581A1BE1E58D562@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240222131803.61066-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240222131803.61066-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|SN7PR11MB7976:EE_
x-ms-office365-filtering-correlation-id: a4f95537-d084-4af3-8d3b-08dc33ab272d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L5DiEmvQXqZuPVc4ylBQGKstSVGmCk59tXKyd5KIXxP02Ys/bLrjUGc8nvvgj4q1TW6XG+TPeZjLLewqMw/+2qHhjdY9EhMf9mgjPXJKv7B5lUnS8Cz9nPG3To6Ib3LeK5w/IbN4T7+qNiuLwWW+6Ff0keCiy/VJ3fq+JM8NUhBQudipmtfOxJoNjzsSWFHbTbU2QZYmaKbg69aax+6Y1SuOkIRkVjIEWS/uBte9l1ZH6WLwjSgtCtgP/Ff0FcEsFHxbU3GrYXV6ptOYsTCXff8mFiVvQpiXhvM3mX2uZ4r+evRu9nMI7wT9JP4n3z2QuLtNQD+MGVmXiDClPdroU/Ttyzb7Gj5ahWuYCAv1LQKyzu5dhFDJUf2KQGcXr3Wo+dxE6djrJObY/3gTCrX11xPAjtA6Ww9vfNYWViNxMFVKiRz37oVd3vTNlKbafhJ8RIDku/7ZGwiGg7D1Hr0Crm0t5jhI5gLVGbM570AcH6Hhl5GaUyexwb597iVC40meXg6PxYvhEnmU10PmramzfVVbW7ZQo1EV9ULxbUZhd+RmXFFM62k57Xh/Cj5qQ/8gsxmk9Sn1q41NCPUmUeZuL+zIOI5uBc7l2OvkaL5vwro1IynCwErnCM6N3euDQBqr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d25QSXI4TU9YTU50NFpGYWlMR3R2cmYzbzlNU1NHdnZGRnUrZFFzckpveTE1?=
 =?utf-8?B?VE5lWlpwQ1ZLN28xSmE5UFh6SmdzS2FGUTlWemNyQlVONVoweWpGVUZHbXc1?=
 =?utf-8?B?V21GbHlHbDYxOTl3SFJDQUNsL1ZPZGNaR2p5a0RhdTRwMmdwNGlCbUd5YjQ2?=
 =?utf-8?B?Tjl2bndDMisycWRzTFpvMnIwc3J3R0k2c2dqOS9lTzhmaTBUWmovek9QNmJW?=
 =?utf-8?B?QUVwOTR4Mk5XaUJ6VS94bCtOMGVxajFDck0vUld3U3d3RWErMFNpUmFSWDVN?=
 =?utf-8?B?bVlIQ2VhV0wreUV1OGJTelJqa1dFR2xtSjNsUTdWR3A3TmdneTNnc2kzQ2dx?=
 =?utf-8?B?VE1DQ1JoLytvSmVpekluTFA1dUZvVm9yaWJsSmliSGFJVElNR29HS3FsalZH?=
 =?utf-8?B?V3pLMFlNeUUzOFdmMG1qSzAvQUFCMER1VW5iMzFraXNjT0pidDF4TXRDalNM?=
 =?utf-8?B?YVJ2Yndub1pGc2p4TkM2VjFFK2lNUGxLbENnQnRsMGhrODdmVlJoTEtvOVFJ?=
 =?utf-8?B?VEQ2SWU5S1M0U2syVjlrRmUxY2tkekgrZnB5VXNiTXlvUGhIclIxMEJuQklM?=
 =?utf-8?B?UlRDWUQwdEFxZzZxRmdVdlJHNFpTZGpPME9JNDRqOG5sYWNQalZjODg4TWow?=
 =?utf-8?B?YUYyays4bnMvTzZiMS9nN2FZMW80QWloY2w3RWYrTkQrcXRnejEyMUliN1dQ?=
 =?utf-8?B?RnNIcGZsMitjUU5YMHdzSDVIWkpGVFhzYWZWK0xIVW9lYlorK2hRMGVCZ2tK?=
 =?utf-8?B?bGxPTjl6cm8wakV4ckUxdkN1Z1NKMTdESnFpRHNmanRwc043dFprckJjWDQ0?=
 =?utf-8?B?aURvSWdzbGZFM0RhUjhJZER2YnkrRmpMbG5QbGtSVHFJd1JWMUttL21nd2E3?=
 =?utf-8?B?U29XUkF6Mm9Oakc0Ylc3ZGxMZEJGMkxTbnNZUXZjOWhCWjRydnpQaWozMlJi?=
 =?utf-8?B?MXc0QXdQWGl0azg3QnlTRG4xaVJPbnNsY3BaRHpxeWFGazUvWHNiSkhrT1Z0?=
 =?utf-8?B?Qll5UEpqOXNOMGlkUzhDT1o3eXlMSjNHeFkzeFZCVzRPajVRd2xabDFOUDVs?=
 =?utf-8?B?RE8vUnJ3TTQweHJlWnJFMGVWRVRFSmRPOWFUdmpVMUxRNStyRXJ3U0JsUlFM?=
 =?utf-8?B?VDlOTk5GM3JGS3laNERORFBpalJqZ3VUNUVTOXM3N1k3cDVIYlJOWFlOWkRy?=
 =?utf-8?B?ei9UeVJZS1AxRUdWakZDNU1zZFQxM1dPaHZibUFra2RJcnFBSk5ZTUllQTlE?=
 =?utf-8?B?R2Nacm1YaUQ1d1RQRFpvYTVVcEN5YzdRK0VEeDRIN0c5N1FRa1g5QzJBMzlT?=
 =?utf-8?B?T2RBbVQyRWFFazlPMVc5N3YwR3BFL3M5VUVwTTdXUFN5QkYrNUUzYlpCU0Zx?=
 =?utf-8?B?OVVSU0xHRFJYVWtJak4wMEpwdE5IQjhVUzgzVjVBZ2M4THlteXZsWkZtb2lT?=
 =?utf-8?B?RnJ5eHVtS0QzOEJOeW8veFc4M2RBalRjbHY2YXVJWTh3dHFwSVhJU0lnT2FR?=
 =?utf-8?B?QmoxWDYzNWxYNlV0d0REU0tWcHhVSmUwb21PdVVuM0VtYzVOTjE0UE53TlFt?=
 =?utf-8?B?RzdNdk1xNkZ3Q2N2Q0JHc3UvRlR5dXNLbXhsNlBOczZ2TlZJM1d2Rm1zTUtt?=
 =?utf-8?B?cTF4TlU0Qk1KdEd6WGZCT0dWWWRka3hqeXQ0WEpPWW10K3pWR3N1WC9BdGN1?=
 =?utf-8?B?bkRHT3pONU9MeDJsV2JBNjI5a2xwWk5aRTBOUVpoUGw3S2RQMjNKa2pqMzFR?=
 =?utf-8?B?SHFpWUhTdFc3ZDRna0prV1FrdmljUko2c21TSUJzL3FOQlFvRUF6Y2lDNFhQ?=
 =?utf-8?B?MHVGMzByMkQ4OVVnVUNraEpHd3VaMTFnajRwUVUrTVdBNjdocW9vdUdUYm9B?=
 =?utf-8?B?TFc0NU5GSUhpNVBCMGNNVEVUL0d2NlVGY2lVSVZZbEY2bjFET0o0LzFNQkhS?=
 =?utf-8?B?VHVhcUVYOWlHR0E1STIxM0VIUno0M0cxVGZRWGRUSlhNTnhORFYxMUdJQzQ0?=
 =?utf-8?B?cUJVU0NQYkREVE82S0tmTUdLeEpSQm51QzVaRjVnVGYzMkpncnNML1pnVkhT?=
 =?utf-8?B?bFpCVzBCaGU5cmlWQThhcFgvVlU1SXRUWjhjbnR1cCszRlByckVCdlphamFi?=
 =?utf-8?B?Z1E5c3UzbzF0TTZFOENRQ2RVVlJNc2RGVzN1aEs1dUFQRzA3bnYrREQrei95?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f95537-d084-4af3-8d3b-08dc33ab272d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 13:35:36.9080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGniM75xyVTAllp1BlKHXmefVvgw+hK/72ElIee4UBwTILSg8IQb8kiAvod8MEoSr/Tfx+Bh2qYdP2SwjbNQQtZ96O46MQd3r7fFLS4g1lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
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

TG9va3MgZ29vZCB0byBtZS4NClRoYW5rcyBmb3IgdGhlIGZpeC4NCg0KUmV2aWV3ZWQtYnk6IFZh
bmRpdGEgS3Vsa2FybmkgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjIs
IDIwMjQgNjo0OCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsg
S3Vsa2FybmksDQo+IFZhbmRpdGEgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9pZ3RfZHJhdzogRG9uJ3QgY2FsbCBpOTE1IHNwZWNpZmlj
IGlvY3RscyBvbiB4ZSBpbiBkcmF3DQo+IHJlY3RhbmdsZQ0KPiANCj4gV2UndmUgYmVlbiBvYnNl
cnZpbmcgYW5ub3lpbmcgd2FybmluZ3MgaW4ga2VybmVsIGxvZyBkdXJpbmcgZXhlY3V0aW5nDQo+
IGRyYXdpbmcgcmVjdGFuZ2xlIG9uIHhlIGxpa2U6DQo+IA0KPiBJb2N0bCBhcmd1bWVudCBjaGVj
ayBmYWlsZWQgYXQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYzo2NzY6DQo+ICFs
ZW4gfHwgbGVuID4gWEVfSFdfRU5HSU5FX01BWF9JTlNUQU5DRQ0KPiANCj4gSWYgaW9jdGwoKSBz
cGVjaWZpYyB0byB0aGUgZHJpdmVyIG5lZWRzIHRvIGJlIGV4ZWN1dGVkIGl0IHNob3VsZCBiZSBw
cm90ZWN0ZWQgYnkNCj4gY29uZGl0aW9uYWwgaXNfaTkxNV9kZXZpY2UoKSBvciBpc194ZV9kZXZp
Y2UoKS4gQWRkIHN1Y2ggY29uZGl0aW9uIGZvciBpOTE1DQo+IHdoYXQgZml4ZXMgYWJvdmUgaXNz
dWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3
LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IFZhbmRpdGEgS3Vsa2FybmkgPHZhbmRpdGEu
a3Vsa2FybmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfZHJhdy5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2lndF9kcmF3LmMgYi9saWIvaWd0X2RyYXcuYyBpbmRleCAwNzU3ZTk4MDFi
Li4xYjcwMmUzNzZkDQo+IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2RyYXcuYw0KPiArKysgYi9s
aWIvaWd0X2RyYXcuYw0KPiBAQCAtODgyLDcgKzg4Miw3IEBAIHZvaWQgaWd0X2RyYXdfcmVjdChp
bnQgZmQsIHN0cnVjdCBidWZfb3BzICpib3BzLA0KPiB1aW50MzJfdCBjdHgsDQo+ICAJfTsNCj4g
DQo+ICAJc3dpenpsZSA9IEk5MTVfQklUXzZfU1dJWlpMRV9OT05FOw0KPiAtCWlmICh0aWxpbmcg
IT0gSTkxNV9USUxJTkdfTk9ORSAmJiBnZW1fYXZhaWxhYmxlX2ZlbmNlcyhmZCkpIHsNCj4gKwlp
ZiAoaXNfaTkxNV9kZXZpY2UoZmQpICYmIHRpbGluZyAhPSBJOTE1X1RJTElOR19OT05FICYmDQo+
ICtnZW1fYXZhaWxhYmxlX2ZlbmNlcyhmZCkpIHsNCj4gIAkJZ2VtX2dldF90aWxpbmcoZmQsIGJ1
Zl9oYW5kbGUsICZidWZfdGlsaW5nLCAmc3dpenpsZSk7DQo+ICAJCWlndF9hc3NlcnQodGlsaW5n
ID09IGJ1Zl90aWxpbmcpOw0KPiAgCX0NCj4gLS0NCj4gMi4zNC4xDQoNCg==
