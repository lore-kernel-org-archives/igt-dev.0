Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC22CA5FFD
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 04:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB9C10E72E;
	Thu,  8 Oct 2026 04:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQd7X4sO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B6B10E72E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 04:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791432793; x=1822968793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KnnPU4PuDJ/NS1DY+nfuZPAFIIS5z/XmQd/zIqKKfJo=;
 b=GQd7X4sOMRyh7TEhGdzNy/pVCUVlfP6lcg7fhuJD3h3qfYTuvvlW4Zpo
 2xrkiIHZaHpg4r27/IWEmTfGwduvwCHgO/hsTj/4pbBBgluw6wDzi8fqJ
 DVCKYaAj7vA9klvr56/1bd1LmA8EsIyDLHmqCcpe1t+lutKSuKGcJyG5j
 jL58WtmoS+qxuNAS3o8iQVGR/POsN/KnfLgW8Nw0jAAxUjuWuTCdJVfiM
 jeKkUQrzjSf9PLLi0Yyf2G17TVaOt3dqUsMeXj6RxeLjQkASRzxsfn4ks
 j8MQHilKGBb1gmHquIBdKNKU87z6hFZkdYsgh0GgUBLePZtfABUoMUao7 A==;
X-CSE-ConnectionGUID: vWpjIPNgQAmZdBmN7gwZvA==
X-CSE-MsgGUID: cIrPh75/SgSU+pUgAq+3XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="104010"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="104010"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 21:13:13 -0700
X-CSE-ConnectionGUID: zseV/NRhQmW6e9L5QWjVtA==
X-CSE-MsgGUID: sb6ToNXKRdmCxwWFPp1mzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="337444"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 21:13:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 21:13:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 21:13:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 21:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOf8iU2t0eIUW1H8s67PG6h/fNUmtvLS6L361KJb6ZSqGyMZBddr1bX2zZFSAMhQIcbrsaLiDdLy+VeZTpfVg7PSRerKlz56F6d0eHSDbyiBH8YLkvo/4zxGxqcO21bL4nCKxobbQSZO2mDdz9encWjpb4m27u3dMTPqgct2QywFvsmdXNCphgIRKC95K7rkGVgWTETpZRQbOdVXMd5VY/1HGFUQuewqpzIP7KoEPEITaAEebbZtTjGFnh2mVdZ/Yydf0xUFz0s1cs9FuOK2Cr0gbEhcvD/M30mHEUl4mztUvqwCZuFHFFOi9VWU6802zjX5CDnMjIZHEhEP8FdgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gVkur+TCz8R1gJhpMbH9Xl8pC16fPz62JbPC8kT0yw=;
 b=om/GRxsKslf9HhoMqRe0KceS/Y95/V81ZcSejJxpgjpLmqqQe5PM8BfVw6et5cBDnKnlbJJWrTDrlirzr13z5CuNzn5iR+5Z/xZrjfaumSpTevqhA6WSetGjOJ9wJZdzJpFw2U1OtiarPHaBkqZxBMPBNj6KOMYGdB4e56P4YVwk+rEMTbJXaWSMFzGJnh0vvO3BjdnU6bIawr80QRD7cB1Hyi6qE4NTVUOA2Bgi8Lc8ZIe75wXiIqTgbYPeHDC7rgRPYKyJ3a6Ti77u5S2LMUpIOpJ1KouKf+sfPuO41QXxWCIShZokJFDAgvO+eCzajsVpZENlhdyxpWyomcnFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 04:13:09 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 04:13:09 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
Thread-Index: AQHdVkAd8O5+c6fo9kOMpqQeFbByHrbyFSqAgAAi+tCAAAqeAIAAxzTw
Date: Thu, 8 Oct 2026 04:13:08 +0000
Message-ID: <IA0PR11MB730735CAD2525E99CB9E8CBDBA932@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20261007-joiner-v1-0-b40826411fa8@intel.com>
 <20261007-joiner-v1-1-b40826411fa8@intel.com>
 <45b38494fa17817bbcbae211010c3161706f364a@intel.com>
 <IA0PR11MB73070C19D34943D60C22E0C3BA942@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d18d32cb4d1223e0dfb590abf6413a480c2a0aa1@intel.com>
In-Reply-To: <d18d32cb4d1223e0dfb590abf6413a480c2a0aa1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB8270:EE_
x-ms-office365-filtering-correlation-id: 0f48e474-17fd-4cc1-ab51-08df24f275ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|38070700021|5023799004|11063799006|4143699003|3023799007|6133799003|10067099003|56012099006;
x-microsoft-antispam-message-info: ZrRb5bhsUi0++QQppcPbcfQ8/UyfFoUn3pZ/kq5rr8hk/E5mooP9fcaUU10/eRXDI8PZZkMkrQD5nxjCXSW8FgdgrhgLMQjMUQhgeybTVpXbDZkmH1IWfohadN+M/pQldKPQHK1rfseLYChNN3J8ziqPDk2Hk2WeWDyy3GoSx1VZW9VxUV3v2Q/cJtfZSpvpHGJ/XEmoFLI1EENyPDRLU7OqPAexs6c3qXmOBzuPYqAUdiD7HhMwjK9+4zRTcnGOucdBAlhal1nWoB3Edz220Lma0J1XlOxWAHv/dnY2igMShcQb8SSX3aoQWKiuLTbM9fxETk1l959ZmdPqhc07QtGZl/b31H2QIzVEBYb3KTfb1/4CLWKMLoP83w6HHuP4sgvDNLUNyMjJMUXgE4sOBmLRpLdEo3+3qpmUHGrynFzI+scj/qUxP6qrQfYeOsczodhTnWq7b02wzShQ675ch8pQ1gu14KPZYDYZA7xrFHGYiZvMjLCPEJz/aps+TTxK/1GbFkTbfEonSyPNB3IXBjkrSstLmVnxDRzZobhVQVaiWtSb4f9s9zlFVEwE3V0A7VUHchU9riFpQna3vWjiLyDRmYnRQH2tm1pG1irVhUh+kDF4hrv61FjH96NaT8aWBBV+eqDFv5J5fnf6nd0JoVbecYN3FjlrVv/0kAYfhD/BwBjfClrXJWsaQdBIjGtf6ZBUF2iwMDiMFFQQuh0kQNf7Ve8/XwpfS8QCSiZy+uw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(38070700021)(5023799004)(11063799006)(4143699003)(3023799007)(6133799003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gn67s52PnCH4LQK8V9K343LA3vKF2DtBNFLDGm/ZmzYex6Yh2ddKWeRK6NG7?=
 =?us-ascii?Q?vx6BxgA6PZwvbtLPTckOM+7NpxM5O+VA1t5jyOQFkbjmNRxOLavX2yd/R2Jw?=
 =?us-ascii?Q?5B8Pgld1jaWV5g1gS7FXtzUyHQQoYm9nB9kfQCrORkR2CAXjaMxhJsUvuuu/?=
 =?us-ascii?Q?TBZufQ1rkLEHtNl6BOdP91ceRE9MtfztK20Jd5Zw55vBjetOXPl/MUyrbxMd?=
 =?us-ascii?Q?hGjHBfALHWpGr/gcLMTFlBClpuETKO0ih0xLr9oZPtNpauRTzkITEGtokUQ8?=
 =?us-ascii?Q?eU0dzCwecGdwWocO6nxHRP/CNbO9eXUA3RHmyUQKLSecqW92kLmNulwAiJK7?=
 =?us-ascii?Q?e1YrFtx+WWxBICa/pJTYTceCbuPyi73hpu89WgYMWGdf/m44eSpCFWTLOsqS?=
 =?us-ascii?Q?HQ7k3Nt65G/wpZHT4NNolZ2WOI4uB+o1Dm5O8ssp3wWasKD6FQ/aMxEMQeop?=
 =?us-ascii?Q?pGT0Vhn/HtfPjPmZroayjcW6vO72MVy2+It2GnKQ1PaJFfY93SpqCB3kYyKB?=
 =?us-ascii?Q?E57V0FQxAOBhHZRBWTrtQLHBsMIVjtktmxslSRM1p1v+W5cPkd8KFZt4Sm2e?=
 =?us-ascii?Q?/qajKYnSZyyvYNDzMKMG5kZ0PkYSWKPl0nGl3xKpkGuKHZvzsq9hs833TvI4?=
 =?us-ascii?Q?TUWm9rSjSU2nQ3ZnOHYOR5d4vxXvQ5eeAVkayHX94cG6rumDoROUXEcyxQtC?=
 =?us-ascii?Q?URnO+H04PKRTXSR21bDxWLs4ziEdA6jmwzglF/Y32Y6u/RnQZOEHPUbD1UhT?=
 =?us-ascii?Q?QwpFFUdgEIVwhQng2s0r2jmsZ6RoQiKGulGkwzgZMTZ2lkwdHpQma19Ak3Yv?=
 =?us-ascii?Q?HrEFoKRaOU+sD+xbvCVr5trYbpQmgmtryXyjWkD7O1zwb+Zp7iyD1BHeARky?=
 =?us-ascii?Q?FoVUAQQoEZTnrwvA8SzEENZ3eEOEQ/kQErOw9LSJH6L/Sn1ATvl6b1MuUcuS?=
 =?us-ascii?Q?r6kDSbYsz9jb8DunhC02V2N4BrUY75NrRud8bbiadCwkHuDE4jHZbEWrO/01?=
 =?us-ascii?Q?kHbkkYHoHkfRW272GUh8YHZn3N1FIUPgBhttxbK1NMu9NEQICOqA8HOHjAQm?=
 =?us-ascii?Q?mxtWz3sdGNid63IG/2rtwKQTRFQE7Wt+klKXcU5bzlFOOoIFgDqoh5AHo0kV?=
 =?us-ascii?Q?/xtmDIN9mewGQuroFnkijBTdwrKiMxWP091AmQmgJq++FQTFOF/7Vi40nzJx?=
 =?us-ascii?Q?du97Az3uL+hYzOU1X9Ub0MBGyDIg8+x8xUlIS67EDpcPk9jL5YT86YeSQRh2?=
 =?us-ascii?Q?Ep/JC23vEkES1teMvcsP6Aa9TidhwoYy5rhsH2dMIQKeL3waikhG12x20KLu?=
 =?us-ascii?Q?+o70DetZoO+VKa9BBMbXnmmHErRIWtgg+pTaX1kDhxc/YF5M+0eAYESOFxpZ?=
 =?us-ascii?Q?qzI/qp1KOXGni6LLhGZg61kH1o006hIs5tpJf+QBC/Zpd+/C6vHh/hWLN8O0?=
 =?us-ascii?Q?cU/nBwuD4yfxvHArePop//WL3lACaKEVGLYwGD/tVyLp2Tkxp2H+L313HLe2?=
 =?us-ascii?Q?uFmZ2c4HzZFcMHWEhN6F/DwzHLn+yVSRt6gdtqGd96o9dlTdfEOOVsiNlR+T?=
 =?us-ascii?Q?Uwujef5lvNcLM+lrl1khQHMzJV/UM5ZR//FxyI/O/El6pKy3KqhTjdwJW4+8?=
 =?us-ascii?Q?A5FUYxKIeN/vqeQrgP0kC05aWSbvW1DoYuEcK4kQU23CRY5EUcjekXOgbFEO?=
 =?us-ascii?Q?HSUAhWja+x1dRBnQKUWm+lxVRkf68fVZD8qOmbzYEfFF8k8M9lHCr01Xabqr?=
 =?us-ascii?Q?NLrvA3U1hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wCal+0nr97LOH6gHE3uGfQ1yvzz3aP/mVRqzEj2gPZzcByxzG8RUjWLACQyZP4EKuk2MznYW4Ba+G83E819hgyac3sLJXEFtCMxUTWeHMVuQBAlvUk7ltm+p8BP+QoUR/rRjfJNhN7oc0/fbvcN3SU06jeVRR+NilFLw4vXMwmmzNZWh/0Vse8lb0dMgx65ubdcHK73MoiOD73Hswpv1566uQK/WRfbMZzvo7kGDERUu+zibEBTOLIjaAz8So9WGz9zy0LutCY0k12/ir/cYUAP05yvh5wimJkFwcY8ZF4XXcQriIeSZwwRqUwlUnYENtWAq28kylPNjjqFrQDqdjQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f48e474-17fd-4cc1-ab51-08df24f275ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 04:13:08.4287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6EpR8dYCxomxopRH0LkcK6ZT7ILQDgbmxNW5jNEZQWywJK2Duue1wE5N8UFXVe3rUzZS5aiUF2t/ONdQnThQSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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


> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Wednesday, October 7, 2026 9:50 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
> igt_get_free_pipes_mask()
>=20
> On Wed, 07 Oct 2026, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> >> -----Original Message-----
> >> From: Nikula, Jani <jani.nikula@intel.com>
> >> Sent: Wednesday, October 7, 2026 7:06 PM
> >> To: Murthy, Arun R <arun.r.murthy@intel.com>;
> >> igt-dev@lists.freedesktop.org
> >> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> >> <kunal1.joshi@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> >> Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
> >> igt_get_free_pipes_mask()
> >>
> >> On Wed, 07 Oct 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> >> > The joiner tests derive the set of usable pipes from the pipe count
> >> > alone, which assumes every pipe is free. A pipe already driven by
> >> > another client is then handed to a modeset, making the commit fail.
> >> >
> >> > Add igt_get_free_pipes_mask(), which gets the current CRTC usage
> >> > via
> >> > drmModeGetCrtcList() and translates it into a bitmask of hardware
> >> > pipes.
> >> >
> >> > drmModeGetCrtcList() is a recent libdrm addition, so probe for it
> >> > in meson and fall back to plain CRTC enumeration when it is missing.
> >> >
> >> > Assisted-by: LLM
> >> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> >> > ---
> >> >  meson.build                     |  7 +++++
> >> >  tests/intel/kms_joiner_helper.c | 66
> >> > +++++++++++++++++++++++++++++++++++++++++
> >> >  tests/intel/kms_joiner_helper.h |  1 +
> >> >  3 files changed, 74 insertions(+)
> >> >
> >> > diff --git a/meson.build b/meson.build index
> >> >
> >>
> d7bbfd9698e5616ab777ac58128192ba1e0bec23..f41588c9d73361dbfd405de5
> >> ea8f
> >> > 764c6768a9c9 100644
> >> > --- a/meson.build
> >> > +++ b/meson.build
> >> > @@ -129,6 +129,13 @@ endif
> >> >
> >> >  build_info +=3D 'With libdrm: ' + ','.join(libdrm_info)
> >> >
> >> > +# drmModeGetCrtcList() is a recent libdrm addition; keep building
> >> > +against # older libdrm by falling back to plain resource enumeratio=
n.
> >> > +if cc.has_function('drmModeGetCrtcList', dependencies : libdrm,
> >> > +		   prefix : '#include <xf86drmMode.h>')
> >> > +	config.set('HAVE_DRMMODEGETCRTCLIST', 1) endif
> >> > +
> >> >  pciaccess =3D dependency('pciaccess', version : '>=3D0.10')  libkmo=
d =3D
> >> > dependency('libkmod')  # igt_procps.c reads /proc directly;
> >> > libprocps and libproc2 are not needed.
> >> > diff --git a/tests/intel/kms_joiner_helper.c
> >> > b/tests/intel/kms_joiner_helper.c index
> >> >
> >>
> 36168030475c2725130e6c8ad924dcfb971a07f6..235e227fe9d82f598d0bd7df
> >> 57ff
> >> > 65d73d717ad0 100644
> >> > --- a/tests/intel/kms_joiner_helper.c
> >> > +++ b/tests/intel/kms_joiner_helper.c
> >> > @@ -113,6 +113,72 @@ void
> >> igt_set_all_master_pipes_for_platform(igt_display_t *display,
> >> uint32_t *mas
> >> >  	}
> >> >  }
> >> >
> >> > +/**
> >> > + * igt_get_free_pipes_mask:
> >> > + * @display: The display structure containing pipe information.
> >> > + *
> >> > + * Get the CRTCs that are currently usable and translate that into
> >> > +a
> >> > + * bitmask of hardware pipes. A CRTC is reported free only when it
> >> > +is neither
> >> > + * enabled through KMS nor active in hardware, so pipes claimed by
> >> > +another
> >> > + * client (fbcon, a compositor, joiner) are never handed out to a m=
odeset.
> >> > + *
> >> > + * The returned mask reflects the state at call time, so query it
> >> > +right before
> >> > + * a modeset and after releasing the pipes a previous commit was us=
ing.
> >> > + *
> >> > + * Returns: bitmask of hardware pipes whose CRTC is free to be
> >> > +assigned. When
> >> > + * libdrm lacks drmModeGetCrtcList() every pipe of @display is
> >> > +reported
> >> free.
> >> > + */
> >> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display) {
> >> > +	uint32_t free_mask =3D 0;
> >> > +#ifdef HAVE_DRMMODEGETCRTCLIST
> >>
> >> #ifdefs belong outside of functions, not inside.
> >>
> > If DrmModeGetCrtcList() is not available in the libdrm, i.e an older li=
bdrm
> then the legacy method of getting crtc is used, which is handled in the #=
else
> part.
>=20
> Yeah, but #ifdefs still belong outside of functions, not inside.
>=20
> I'm not sure why I need to explain this in exhaustive detail.
>=20
> Don't do this:
>=20
> int foo(void)
> {
> #ifdef FOO
> 	return 1;
> #else
> 	return 0;
> #endif
> }
>=20
> Do this:
>=20
> #ifdef FOO
> int foo(void)
> {
> 	return 1;
> }
> #else
> int foo(void)
> {
> 	return 0;
> }
> #endif
>=20
> This is a contrived example; it makes a ton more sense when your function=
 is
> long and non-trivial, and the conditional compilation branches are long. =
Like in
> the function you're adding. #ifdefs make it hard to follow the code. It's=
 much
> easier to read functions that don't have conditional compilation inside t=
hem.
>=20
Ok, will get this corrected in the next revision.

Thanks and Regards,
Arun R Murthy
--------------------

> BR,
> Jani.
>=20
>=20
> >
> > Thanks and Regards,
> > Arun R Murthy
> > --------------------
> >> > +	drmModeCrtcListPtr list;
> >> > +	int i;
> >> > +
> >> > +	list =3D drmModeGetCrtcList(display->drm_fd);
> >> > +	igt_assert_f(list, "drmModeGetCrtcList() failed\n");
> >> > +
> >> > +	for (i =3D 0; i < list->count; i++) {
> >> > +		drmModeCrtcInfoPtr info =3D &list->crtcs[i];
> >> > +		igt_crtc_t *crtc =3D igt_crtc_for_crtc_id(display, info->crtc_id)=
;
> >> > +
> >> > +		/* A CRTC the display never enumerated is not ours to use. */
> >> > +		if (!crtc)
> >> > +			continue;
> >> > +
> >> > +		if (info->in_use) {
> >> > +			igt_debug("CRTC %s in use: %ux%u, fb %u\n",
> >> > +				  igt_crtc_name(crtc), info->width,
> >> > +				  info->height, info->buffer_id);
> >> > +			continue;
> >> > +		}
> >> > +
> >> > +		if (info->driver_active) {
> >> > +			igt_debug("CRTC %s active in hardware, not enabled
> >> via KMS\n",
> >> > +				  igt_crtc_name(crtc));
> >> > +			continue;
> >> > +		}
> >> > +
> >> > +		free_mask |=3D BIT(crtc->hardware_pipe);
> >> > +	}
> >> > +
> >> > +	igt_info("%d of %d CRTCs free, free pipe mask 0x%x\n",
> >> > +		 list->count_available, list->count, free_mask);
> >> > +
> >> > +	drmModeFreeCrtcList(list);
> >> > +#else
> >> > +	igt_crtc_t *crtc;
> >> > +
> >> > +	for_each_crtc(display, crtc)
> >> > +		free_mask |=3D BIT(crtc->hardware_pipe);
> >> > +
> >> > +	igt_debug("libdrm has no drmModeGetCrtcList(), assuming pipe mask
> >> 0x%x free\n",
> >> > +		  free_mask);
> >> > +#endif
> >> > +
> >> > +	return free_mask;
> >> > +}
> >> > +
> >> >  /*
> >> >   * @drm_fd: DRM file descriptor
> >> >   * @outputs: array of pointers to igt_output_t diff --git
> >> > a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> >> > index
> >> >
> >>
> a0ab75b2c165084b643ead3f3ffc05cf5364e90b..14083d25c6f09e0577f123130
> >> 697
> >> > c34c2b6a15e4 100644
> >> > --- a/tests/intel/kms_joiner_helper.h
> >> > +++ b/tests/intel/kms_joiner_helper.h
> >> > @@ -11,6 +11,7 @@
> >> >
> >> >  void igt_set_all_master_pipes_for_platform(igt_display_t *display,
> >> >  					   uint32_t *master_pipes);
> >> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display);
> >> >  bool igt_assign_pipes_for_outputs(int drm_fd,
> >> >  				  igt_output_t **outputs,
> >> >  				  int num_outputs,
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
