Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D86FD2D70
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 12:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCD510E282;
	Tue, 10 Mar 2026 12:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/jNXcss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DDD10E282
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773147444; x=1804683444;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b2df2sXx9AQE6IHE+2FTtpqeICVUCg7BjB3Z4RyaHCw=;
 b=i/jNXcss5dryQFZZHYFvO5Wfw82PFpFp/8LEu/zoQclQ4PtPG8QenDIH
 RM9nxhmmd8fljxDQwfwie84Xxcmvlbwr5sMjmCfo8S/S4uQ9u77DBN8Ms
 pIxP1OOCYBVXdXDhMpj/euuID8lmA+DJKpxsPn3xlDyAjCU1fFaKmxcGL
 p8EDZn/yQwqG0GlGUOqRieVMUKpR+EMUs2Q9M3JARiMp5yadAG5pIQpJv
 Tehee/339IaKSJpz8umJ+mYG24EG4+zKZjUe62hShqQ/vbUWaQq8VJ7vO
 hFsyMbA2v9tpt0PeZlePEN6sTbXWEflJNWoU+7okMuaHcgYQS2PBHTLIN w==;
X-CSE-ConnectionGUID: wGacogi6SdivhGoMDHkHxQ==
X-CSE-MsgGUID: tgu1dBKVQo+I9JomeICiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85668332"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85668332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:57:23 -0700
X-CSE-ConnectionGUID: xTFbAU+8Qle6HcCT++QXug==
X-CSE-MsgGUID: s2z33UYZRWWIwR0XQqTU0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224559967"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:57:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 05:57:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 05:57:22 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 05:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNqk2yY6u/2GlBzs4epNzQlpFnjCAkSv/aFXgT2x5bhEH29Tjq9g9cDdGc537khxKJJBTptnz9J2mAIAb676NkkgI+jXml64UdqUaJPGktdaTdP5qc49F5IPaf40Oo6ofryGD9xr2qIXk2LKcGdi2A3g/JSjf07iKXrwaeOElyVh3+o6497GJSbB+6rfFBPjqFg4Jc/vaGuDaoW8AA/0SIo/MfEug9ruFv5+gfXofdUvGTzRZpSyCdPejSrvq+CaIUji5o9HtLJmwv9lNJcu/AfTdyLMT9AGesCupXqs2jPaCzIulmTU9tL9jjoceQxPapHpyv48Lw5T87ofEMVWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2df2sXx9AQE6IHE+2FTtpqeICVUCg7BjB3Z4RyaHCw=;
 b=gXupe0WHvZrlpHHK/mTub2ucJjzsx50uegd0kfz8fgQ/cqy15XxvEsWHnccSt2HxVl9NarQCY1uHU464BS/DwgUb9e1laAUQThGcOJBaNpe5+vLd33hNmb4DTKYGOu26NIqn8iAm16mn1EpbLDRHDvuTG+34rwSWcGuPxm48kXNGygFMQnLejJ+KnFh58ExHdEwCDFjz+57voaVF+5kWTXX7QniKesZ1k2j+Ju98ORMKBwdCVUuOmu8IN3yxUnyZ6WzbWvXxEmh3kJgPBuDske7veMFMgoiUVRn6f4yB3YEitAhvR1SELIBFhZ850ePlW2z0g9xXS3NaNyrAjHcmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:57:20 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:57:20 +0000
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v4 1/5] tests/xe/xe_eudebug: Change pthread_join to
 pthread_timedjoin_np
Thread-Topic: [PATCH i-g-t v4 1/5] tests/xe/xe_eudebug: Change pthread_join to
 pthread_timedjoin_np
Thread-Index: AQHcon73yn5QyfbIdkCWthxkThWUX7Wn1bCQ
Date: Tue, 10 Mar 2026 12:57:19 +0000
Message-ID: <DM4PR11MB817957E37E22D2F5C9D52E2C9446A@DM4PR11MB8179.namprd11.prod.outlook.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
 <20260220153748.210381-8-christoph.manszewski@intel.com>
In-Reply-To: <20260220153748.210381-8-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7117:EE_
x-ms-office365-filtering-correlation-id: 242af89c-93ed-47e1-4d5f-08de7ea490e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099002|7053199007; 
x-microsoft-antispam-message-info: w/Z5xnpF1H5lWG6yeeRgDEgQ2e5G3dESgFUkT94gz9OJ02jMMZWERxXCmJsASZcdoeUG0g6DHrVLkT8lMB9VLma6MAE7A6oP7ErtYbY+OS8OzqBh+3web6t6OkE2i1SVONskugEBNpMjmmDE6rvEVJXZsDtreLBuQURLr0B7P+xCUR3ZopYFLbUDhcQ+qX+IATNgQRYsn8TsAWQWKMqjHUJXX8OKKQhGrNu6DV1LO+QGHcqTjlS4jkO3IDmOkQ3PxcQTNdLN/Cg4Kt+eET2mgXq6i8XngpzW/wCJg3wSJ+C7n+GhM7lhWm+9gJ6OYkr5FUVJfbQf5sKHIBJmHRGIPmUUkvG6fB+XzbVyntowT5KtXUVrmSD/qQtl+BbvZtKcZtnCI9OHZXPOgj1iQb7tn8VfMQqlHr3PDZgJQE//M1RppTn+qRT84J2ALzZbSUgpJyyhhLuQO15dqyuLYh4w47DHJK+doat0RLG3bplvWMIJvK/5ScGT9+jls/Tg1FGDximVMC/TW/7qAFa8k7y0DJTuKxO4qWWDYiAip2QgGUzszfYPm0IqInMGLiVM6ae8J/R1jj+WwBfLeDutcFIwI4MFb9HiP1N0B8hdDvs3GeCTkVDHdpXwMZOGFieMCNczgE93ypSJeCuOfViTVrLqvP5oqFu0RLLlRMJH0muGRGC/F4rWDRkb0AUq99lJWvZNING01hj6Am73angmf7yli2/eqMEl7cO7g2VVWDyIZ7zqkxlngDPptpWB+IRR4v0ptexEXncOZBVTVo+skZjgcH3/zsF4Yf9jFzeZOt8WY+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099002)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTgvMkdFOThQTXlucUx6L3lxazJnd0JvVTF3V3Nabk1IaERnQjVUaVgvNTkx?=
 =?utf-8?B?bHp0S2tTTjJyNk1FS05ld0lsaDBCRk1vWGhwS1ZhTmwvZFBTM0Y1MFVLZzJq?=
 =?utf-8?B?TzFOQ1F2UmZDa2Q4d1NUQ1E5bXg4aytaZHcyQXlXcjcrUzJaSFdJNG9QRTNl?=
 =?utf-8?B?VjM4UjFKWW5TN08vMUFLd3B5ZzNuWmRzcTBaNnpYVzdpRnoyQThNNHR3N2V3?=
 =?utf-8?B?Q3IzUmdNdzRLNlJydXhldE1PVTRVSWxGT0FzY3U2d0NwZVcyRVNXY3BIVFIy?=
 =?utf-8?B?YXEvRy84TEI1SWNrU1RkV3FKQlBWUk1zM1JiMTZsSis2anptNXR3ald4cHNm?=
 =?utf-8?B?UnJHNDhEWFN0YmtqdDhvV1ZoNTYyOEEwWGdvMXlpeDlrZ3dUSDFPSi81dDBJ?=
 =?utf-8?B?RUlRL2M2UXVXbEVETE1pb1c5VFcwWENDamd1dVU1bnVpZVdWNVNLZjcrUStP?=
 =?utf-8?B?VTVIU0EzY241Y2dMRUtiYzNlelZTMUc3MTNVTE1VWWZuSzlTaDNUU3FabURN?=
 =?utf-8?B?NHJ1UGpCUzlkWFBoS21RNytsclJ0bml3V2dvU2RjU1puNm1iZ2dlQnlsVUsv?=
 =?utf-8?B?WjlMaUhnM3VGMXpkT2VITWIrYmpxU25kV2Q4Qk5td3A2Qm1hNXZ3QUJ2TFIw?=
 =?utf-8?B?VVN6Z1FwU3FtbkdHMk1QbzkzdTgyV1BLTS9Pckd6UVVJRUV1cXg4bEE2L3J3?=
 =?utf-8?B?aFlKaThuWmR5d3RRNmVrL0hIaER0RkhaRGsvY1o1VkJYMHdGV1lFdlNzSDF4?=
 =?utf-8?B?Q2hMMEVnY3BISGdLL2pKMDBxOVl6Y05zZVdJdlNTUlJmcVZaYkh3dGRtZzQ0?=
 =?utf-8?B?YzlaM2V1K2cydzM1cmpkNmo0WWZhRGN2MVBBYVVlYWJnMWZQb2VkNEZPU2ZX?=
 =?utf-8?B?SUNYWThkc3lWalJEbmhpaGtUV3Y5d0lNbkxTVEMvbkc3K0dYZlVibGJlcmJa?=
 =?utf-8?B?NXBhOStqK2hmbVNZTXNzWnFOa25HMDZxMUtXdzl3a2JZbUZUVUNEbTVOcStR?=
 =?utf-8?B?azNPa3dvUDU1NkFGTnFtMStVVUJrbmlpSkU0bFI2SFBsK2tZNnlaZnlTd3d4?=
 =?utf-8?B?RU8rKyt4eUE4ZHpJWmgvbEpUUlF1UVBucDh3b1RNdEtTSzBHME8rb1NnTlJF?=
 =?utf-8?B?b2I3VXN3Zkx3S3hHNW0vdzFpMUw2RWtwUDczTlFWSW1kVFJWRFMyd25zRHlZ?=
 =?utf-8?B?WU9rcTZoMHB2N0ZwMXhrNFNRdnQ4SEpGbE5iUXZWYXNVVmhVWnM5ZDB3YTd1?=
 =?utf-8?B?M2ZiSzZSNmJCZWN6OGo2NlphOWl3V1VWZUtrRW9udEFrUUF1WGV3cHFXRU5m?=
 =?utf-8?B?aUxvUDY1ZUxhaEFkS1h1aVdBOTJTVVBIMytoaXJVL1ovYWpWMWMwUExsT3dk?=
 =?utf-8?B?NGJxQ2Flakk0YUhHUEJVeEpYc3ZkcG1qWGUybjlxMW53U1BGRVpIQllDdExi?=
 =?utf-8?B?N0ZtMkxRNjN4UmFhSGJsb0pVcytMUUZmcmxhSjBaemFRQVZKL3c1d09rWGEr?=
 =?utf-8?B?UEQ0L2pKblBqb0l5SERsaHRLVVlnZ3pVTGtiblhKenl0NHNTaVJMNmU0UTlO?=
 =?utf-8?B?VFF4dE9UcXhyT09vZ3dMaXNvN3c2ZFE3bHBCVFdtWUlZRUlQWHgxMDNvb01S?=
 =?utf-8?B?U2JvcGRlUkJKZnY5aEwrVmJHR2JYUUlFdUxMYXU4Y3dxYXFSeVpSR054NzEv?=
 =?utf-8?B?Y1NScGVWU2g2TzFWNzRkY1QzTFcrdmpETjVzeDhmdmMvZXViZ282MG9sMVdo?=
 =?utf-8?B?TUh5bGVmdkFsSkpLSWQvT21PKzhYN0xGTk1RSkF4d1Y3RnRiaVR1cEdoWEEv?=
 =?utf-8?B?dmVKRlYyazhycUxMUmc2azY4Kzg3cWJTNy9LNEZaZjFpaHhuZndHSmV3RG1o?=
 =?utf-8?B?cjI5LzllbSs5TnFsbHZLOUt3eEo1WGJwcEUvQWh1K2lWaUMyVzZZT0N3Zm9v?=
 =?utf-8?B?dS9qLzZNTG5OdlZBSk5uVURYMVNCM1gwQlIyZlpYVDJMNlZpVVhiaFFQQlFn?=
 =?utf-8?B?N2xuazJ1dXNvRDF1ZUdJNUxCWXJ6bkcxYm52LzAzMkQ0RWxXOTB5bGhPeWZM?=
 =?utf-8?B?cGl4dXFDTzlQU3BnOEQ0THZ5dkJnTFA4Q2ZVV081K3NFT2tQRHBsZXdhZTRz?=
 =?utf-8?B?aWhIRnNHUGtpdDExUnpQQlFPSU5hY1hkUVI3YjJ0dVpQVDJNby95dzBzZDAy?=
 =?utf-8?B?a0h0cUpGMXdRKzhkQSs5ZzBZSG94K1dIRGppeWM0NERUdkpkTGp1T2FvTlVF?=
 =?utf-8?B?dndSYjM4TnVuQytQbkpSSTlDdGJVemJZeCtFMEw5dG5TZmJhMndva3ZOYmI1?=
 =?utf-8?B?a05CbDZma3N0bnNzdHN4UHdDNHZkV2tjSjY5MDhRc1dBRjJLSHBpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: imvoeeSSgjcJ/qbAyU3v+D6TEGCj2ZhS6DpkDQDdDowGmiErpL9Zwc4em7Rf2J1eDk0z7L0KAg4YJ74N4kqz6+DQYqUdvITjDy2eH6EfYAIriAx8fUI7GgsWCvEqqvP8+N23ERcwpnyVPhAKO8X+GdnTRYzW8pb3rVtH85rW4B36hRy2c49/pOa9mBJfR9iExIxmfdoJz/572Ztg7nlbdV+TM2MgF+FbuY6wwnvlCbQ+kzuNjygPVguS7W5+qo87fGL4H4sr7zvbKvjS+ztVyaHslcNmZjxJzt05dweX/qrIauxNnH6jOI+A7cPg3mIuQj1YFbPqDmhx5pWChJgwHg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242af89c-93ed-47e1-4d5f-08de7ea490e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 12:57:19.8844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQZe4AuAESWew22C1I/f6lO/b6iV14e5gyquvGq9pZnx8xg0xBggfzLL1Lx8WUnWZRC9ju8tVrRaitB/iXXy+kgeqXv9SaYEJ1oS+bKzoEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
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

TEdUTSwNClJldmlld2VkLWJ5OiBQaW90ciBSdWRuaWNraSA8cGlvdHIucnVkbmlja2lAaW50ZWwu
Y29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hbnN6ZXdza2ks
IENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlk
YXksIEZlYnJ1YXJ5IDIwLCAyMDI2IDQ6MzggUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBSdWRuaWNraTsgUnVkbmlja2ksIFBpb3RyIDxwaW90ci5ydWRuaWNr
aUBpbnRlbC5jb20+OyBQaWF0a293c2tpOyBQaWF0a293c2tpLA0KPiBEb21pbmlrIEthcm9sIDxk
b21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsgU29rb2xvd3NraSwgSmFuDQo+IDxq
YW4uc29rb2xvd3NraUBpbnRlbC5jb20+OyBNYW5zemV3c2tpLCBDaHJpc3RvcGgNCj4gPGNocmlz
dG9waC5tYW5zemV3c2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHY0IDEv
NV0gdGVzdHMveGUveGVfZXVkZWJ1ZzogQ2hhbmdlIHB0aHJlYWRfam9pbiB0bw0KPiBwdGhyZWFk
X3RpbWVkam9pbl9ucA0KPiANCj4gRnJvbTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9t
aW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gDQo+IENoYW5nZSBwdGhyZWFkX2pv
aW4gdG8gcHRocmVhZF90aW1lZGpvaW5fbnAgaW4gZGlzY292ZXJ5LXJhY2UqIGFuZA0KPiBkaXNj
b3ZlcnktZW1wdHkqIHRlc3RzIHRvIGF2b2lkIGhhbmcgYmVmb3JlIHJlYWNoaW5nIGNsZWFudXAg
aW4gaWd0X2ZpeHR1cmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0
a293c2tpIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggTWFuc3pld3NraSA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWcuYyB8IDEzICsrKysrKysrKystLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYyBiL3Rlc3RzL2ludGVsL3hl
X2V1ZGVidWcuYyBpbmRleA0KPiAxMzRmMzE3NjYuLjZmNTEwM2ExOSAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcu
Yw0KPiBAQCAtMTI0MCw2ICsxMjQwLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9yYWNlX2Rpc2NvdmVy
eShpbnQgZmQsIHVuc2lnbmVkIGludA0KPiBmbGFncywgaW50IGNsaWVudHMpDQo+ICAJaW50IGNv
dW50ID0gY2xpZW50cyAqIGRlYnVnZ2Vyc19wZXJfY2xpZW50Ow0KPiAgCXN0cnVjdCB4ZV9ldWRl
YnVnX3Nlc3Npb24gKnNlc3Npb25zLCAqczsNCj4gIAlzdHJ1Y3QgeGVfZXVkZWJ1Z19jbGllbnQg
KmM7DQo+ICsJc3RydWN0IHRpbWVzcGVjIHQgPSB7fTsNCj4gIAlwdGhyZWFkX3QgKnRocmVhZHM7
DQo+ICAJaW50IGksIGo7DQo+IA0KPiBAQCAtMTI3MCw3ICsxMjcxLDkgQEAgc3RhdGljIHZvaWQg
dGVzdF9yYWNlX2Rpc2NvdmVyeShpbnQgZmQsIHVuc2lnbmVkIGludA0KPiBmbGFncywgaW50IGNs
aWVudHMpDQo+ICAJfQ0KPiANCj4gIAlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgew0KPiAt
CQlwdGhyZWFkX2pvaW4odGhyZWFkc1tpXSwgTlVMTCk7DQo+ICsJCWlndF9hc3NlcnRfZXEoY2xv
Y2tfZ2V0dGltZShDTE9DS19SRUFMVElNRSwgJnQpLCAwKTsNCj4gKwkJdC50dl9zZWMgKz0gWEVf
RVVERUJVR19ERUZBVUxUX1RJTUVPVVRfU0VDOw0KPiArCQlpZ3RfYXNzZXJ0X2VxKHB0aHJlYWRf
dGltZWRqb2luX25wKHRocmVhZHNbaV0sIE5VTEwsICZ0KSwgMCk7DQo+ICAJfQ0KPiANCj4gIAlm
b3IgKGkgPSBjb3VudCAtIDE7IGkgPiAwOyBpLS0pIHsNCj4gQEAgLTEzMjIsNiArMTMyNSw3IEBA
IHN0YXRpYyB2b2lkIHRlc3RfZW1wdHlfZGlzY292ZXJ5KGludCBmZCwgdW5zaWduZWQgaW50DQo+
IGZsYWdzLCBpbnQgY2xpZW50cykNCj4gIAlzdHJ1Y3QgeGVfZXVkZWJ1Z19zZXNzaW9uICoqczsN
Cj4gIAlwdGhyZWFkX3QgKnRocmVhZHM7DQo+ICAJaW50IGksIGV4cGVjdGVkID0gZmxhZ3MgJiBE
SVNDT1ZFUllfQ0xPU0VfQ0xJRU5UID8gMCA6DQo+IFJFU09VUkNFX0NPVU5UOw0KPiArCXN0cnVj
dCB0aW1lc3BlYyB0ID0ge307DQo+IA0KPiAgCWlndF9hc3NlcnQoZmxhZ3MgJiAoRElTQ09WRVJZ
X0RFU1RST1lfUkVTT1VSQ0VTIHwNCj4gRElTQ09WRVJZX0NMT1NFX0NMSUVOVCkpOw0KPiANCj4g
QEAgLTEzMzcsOCArMTM0MSwxMSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2VtcHR5X2Rpc2NvdmVyeShp
bnQgZmQsIHVuc2lnbmVkIGludA0KPiBmbGFncywgaW50IGNsaWVudHMpDQo+ICAJCXB0aHJlYWRf
Y3JlYXRlKCZ0aHJlYWRzW2ldLCBOVUxMLCBhdHRhY2hfZGV0dGFjaF90aHJlYWQsIHNbaV0pOw0K
PiAgCX0NCj4gDQo+IC0JZm9yIChpID0gMDsgaSA8IGNsaWVudHM7IGkrKykNCj4gLQkJcHRocmVh
ZF9qb2luKHRocmVhZHNbaV0sIE5VTEwpOw0KPiArCWZvciAoaSA9IDA7IGkgPCBjbGllbnRzOyBp
KyspIHsNCj4gKwkJaWd0X2Fzc2VydF9lcShjbG9ja19nZXR0aW1lKENMT0NLX1JFQUxUSU1FLCAm
dCksIDApOw0KPiArCQl0LnR2X3NlYyArPSBYRV9FVURFQlVHX0RFRkFVTFRfVElNRU9VVF9TRUM7
DQo+ICsJCWlndF9hc3NlcnRfZXEocHRocmVhZF90aW1lZGpvaW5fbnAodGhyZWFkc1tpXSwgTlVM
TCwgJnQpLCAwKTsNCj4gKwl9DQo+IA0KPiAgCWZvciAoaSA9IDA7IGkgPCBjbGllbnRzOyBpKysp
IHsNCj4gIAkJeGVfZXVkZWJ1Z19jbGllbnRfd2FpdF9kb25lKHNbaV0tPmNsaWVudCk7DQo+IC0t
DQo+IDIuNDcuMQ0KDQo=
