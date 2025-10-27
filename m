Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB13ACCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 05:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4B710E0A0;
	Mon, 27 Oct 2025 05:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGgsUmWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220CF10E0A0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 05:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544359; x=1793080359;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MyGe5YeuJ6ujMWpiPBN/T86uil8+Ab1g1oqaBVYN6R4=;
 b=oGgsUmWSMnZWBss+C9jPGqiF6TqDvXhKvaeFibwBFyRnQapLoG3ze9rJ
 RR06UQV8unvQzKLPjSX1nMNLLd7+QsJITVxYkCweSykFcMc9+7OJO/+kp
 wUrtyuUPMy+WunCOYRGU+sK35O5VYvMS6fy/O6Uxfa3bSr9RYUdpWDB8B
 Dm1TVdUY5oVodOzqZAU8z/mOmOFkdU5/MCiGpjghm/zSCU6J/jcQsVhzV
 /j3fpuTky9stBIBypn7SF68yw0uLtQfZ7YEv8VuDZu8uoqqckSM8iGdtq
 9dpEH7T9of9cq6KdEeCCt+8MvDmxPIoEd/Qpyr8v1Km+czrvYiBZS29xC w==;
X-CSE-ConnectionGUID: DyplBCZ4SB2OrZSiXRHAdw==
X-CSE-MsgGUID: ZdnSCUKJQZ+48SQD0ACb4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86247093"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="86247093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:52:38 -0700
X-CSE-ConnectionGUID: KvK+yDWzTpWqadHoWMxM6w==
X-CSE-MsgGUID: wAOZ/eXnT62tPCjHc3VSHA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:52:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 22:52:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 22:52:38 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 22:51:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpYax/wdNHDl3/rOphto6fdNDv+6RS14VESnaL43KgiNpVPOOdPSlYPCFIM5uMcihE/uRkwzxO0MsvhjGTKrivsiRJ1LS4FGKHiY5hbGPqqYTRdmWhTgzcWUAU7jJZuCdEq6VVmlBFV05kqaOKEY+ZqCp+ZeiN6Qwkwm69jtnPNGgd8C8rW6VXgwiKxtk1o75Pc3vdI6QiGtJ7ZCQgjv571nvV2RbrwPNdovUBVV1sxIh8PSaFaaa9IqqAOKT4PGRMTGoh38ywf82vgpWFzv3B3BmijK7sOJfsaYbgjq3sw0qyR99ojbgX6d6y/xCwNmEmjVU7L2MWZCdqYAKFBCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrNd1FxSyPWUwO0tzY7me6X35IgWljiirKoie/BS9y8=;
 b=eiajxM87xg4yzY/Wbz5UsI0HlhWjMjzCwCDP6hp7WYtB6nhCxL9jngorFs4krnyevEk8vSdMdlc/XaGvnj3ecAIOqq3mZc3Wdxo/UohqeBLbfxVDMVCkA3kuVq+yYGY67dROxI1exbbzSqjs56hGNCmkHW5/zLszPefT5pOGjY9MwR2O0I831lMcbcWeW2kPIdtiAzyZyyUcjNEs5XEOY6N1LiCxgOilG/ISOJTCpXxWkqYT0NK/SOFjVbU2F3UnHN9NKQRoJ+8VVvORZcKXVMA/vQWlIS0kR/ucnswoDLD8sax4OE7FLIoVUyEBSYlW/NKRyhmQvjLsBRwqUrhduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 05:51:51 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 05:51:51 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 3/6] lib/igt_kms: add helpers for connector type
Thread-Topic: [PATCH i-g-t 3/6] lib/igt_kms: add helpers for connector type
Thread-Index: AQHcPbrVwiwOWOKXi0aIZRF1taIXLbTVjvVQ
Date: Mon, 27 Oct 2025 05:51:50 +0000
Message-ID: <DM4PR11MB6312D8441DBE770DFF85DECA90FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
 <20251015101759.3982477-4-kunal1.joshi@intel.com>
In-Reply-To: <20251015101759.3982477-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB5912:EE_
x-ms-office365-filtering-correlation-id: 685655d2-e123-4776-9d65-08de151cecde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NK2hTW381G1UWEzFo8tnZdCpdVN7X7Sc1zwcvmPtl1dr7F+Uy3e+2gUvqd+K?=
 =?us-ascii?Q?jyNxET1/dKlrXJvDf86VKNY+Jy9LgPNVxLsGUCr3QR12/rPg1o9DnxkQ1JV4?=
 =?us-ascii?Q?T2wCPCw7SV1kacuMOUrN96pkd+2LauOua3R4UdGMC5KyM/nLDRxWkIKbm2B4?=
 =?us-ascii?Q?sU9EOP38i9A60N9Bscw+PCXGPSAIsZ//QQpsmtQ60aUGk3mBd9HmxqEkL+wD?=
 =?us-ascii?Q?U/UOPUs3W97MnHusxmZsrzwob7oA+SAXsVKflgVJQ+DtjrD6ubbM+yifCqEC?=
 =?us-ascii?Q?ILl2klb2Pb84dUqPKgR8T5PagMAlQIxBVzQQ2UgSUxDD5Veo7FmF5PIJAiyP?=
 =?us-ascii?Q?xm+kJIPLR6h+Cii8Rh0bX2ns9VYq9FNzJCdoO4fz65Yid71CvfDb8PSgG5iq?=
 =?us-ascii?Q?2Al+UmnYIxONt/6MEZu7jkbbQ8Cn1zBWwBn56q6iXlE/U6CKif7Slhre3M1v?=
 =?us-ascii?Q?EVeIwfR2inz0kC7AthI4FXRU+miOtzmnYKwxS/WHCjKRwfcHC9CLXeNYbGhe?=
 =?us-ascii?Q?Xpgb5uUbJ9/1x6WrMUO1H7LPuhH30IgpCSsxyd8AJp9WKXWaNOxWh2nZv4ls?=
 =?us-ascii?Q?YbrEzZudeiSx+lA6qixQXC2Y3DrtYqGhpT82nCy+WUk6a9tQ6dHBuhun+hse?=
 =?us-ascii?Q?FTLieVve9gfr5Lzm1B8Yu6h5HjZUkmm5/f4FkVKyy75PzqzNHNJJihc/l4mK?=
 =?us-ascii?Q?7QRUDc8VVweKZMPUvYc6F9rDgP3txtA7XtmQsSZO1/uP5SmWzrSFYc/PiRme?=
 =?us-ascii?Q?O79VTpD4BJeplrlaowEyMoAPG1r8DaqQlIAxie0J8qSlLhefPEJVe2vw266r?=
 =?us-ascii?Q?zIirT1rMwEEOdEc6GpbQtOLjHX5epE4kuEjv7KkfWWt4xBhTMjmo8ksBhu7m?=
 =?us-ascii?Q?KUDsdGq09tjS2ZSN7ZCn/oKHMAvbInoBrGV0Vdwgsww3dh4tI0BlQx2TGgft?=
 =?us-ascii?Q?PINmuVaQcSrhuugEPIyZ6BFu23fsy9GYN/5cH6J6PHZkUV5+sQTxjR6Axq0i?=
 =?us-ascii?Q?IrVR2DK2Ltkvj2Qn41Fww0jeSGllPhPLARALQhq4tBVGS9/siw6D3J7//yNt?=
 =?us-ascii?Q?DiM6extSHPbCeCDDU0caWMzDrsNWp/xZQ1eq9owFvHfJIh5L2+wAvepJpe2n?=
 =?us-ascii?Q?CouSfc4voGX/XRIzsaSo3V5pNrrVeS9pEqN4rncVFF12YKcVxC39+RJMDoQN?=
 =?us-ascii?Q?TI4dtRTGO6469VvtmFSD8B0iTc2vQgjKM374+u0V8nwiONQUvB75nF5FEBrU?=
 =?us-ascii?Q?/oEJ4TnDL7TEblwocdImCNHdWfw2avnAh6sy/BA6gd1OJ0A346gj2Dx2Xkni?=
 =?us-ascii?Q?gcUWNDTeBbIDAKQbCoJL2Z3FK90o3Yr9uQKzBuZsh1HBP1z8nru2G1VHkN5a?=
 =?us-ascii?Q?2Y0W1Hhek25m77fPq4xD9GAbDvgcwcbJwMH6TUShP/pe4zkpNKGE4B2XPWrk?=
 =?us-ascii?Q?G5DNiKy/ovulYorA0tVCE2CqunhLi9myA0xrx2nhjPpWZbFMUZZD5CXHSEjW?=
 =?us-ascii?Q?B/aZ7ApbFEZoTW282qOb6odhf51f4PbSGuW4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?17jnMeYu+rhcZnKYPNv42QpYIiohxt7XQFAsrXrzEgdk75xpfJeO6Wio1f08?=
 =?us-ascii?Q?8Xxa8xx9ypjzRVOPhfpR+OvCFZ1vw6SxysURyYe0BpnW1NXq3ffMY8Vtk4Ie?=
 =?us-ascii?Q?77KmOBZuIjwwaOLjFwLmQ0Sv+wXF608qmK6TIs5ant96YweqTGo9mW077+0i?=
 =?us-ascii?Q?whi3fAdB7eKA18JMoWj7fZkhy0zSfy/aMEvV7OOgoDZGH1RNWPgTchELvJBH?=
 =?us-ascii?Q?mTycA2RcFh+xRT1xxKy53zy3KI8LBzszeowntYn32xHxydFyODkbZDEI0B60?=
 =?us-ascii?Q?P0TExGZ6hRSOniJbUMNksJxejpOXlCBL6czrxzoqRDetVCXYPklvMWTn73rF?=
 =?us-ascii?Q?LS/BxAMTl2vC3EzM3EwRrqLJVOcw+MXuWoNC4iZH+KNprDc7x0gBqv1pUNRD?=
 =?us-ascii?Q?M7yiyOtNYzL1C95ICK35hpFQCjKCOweHdHd6Uy0LzI2id3lnT+SreaPH2bn4?=
 =?us-ascii?Q?gVYvpjys3sZhzcRQX9NgTE6XTu14kl/avHt566/e8vYMtYwtiSzRfTaakPBp?=
 =?us-ascii?Q?mohl6ABSOjddwmRKUD/R4z5UbdC5iik0YqVr1dmwwCJmvY0QD3rQCosKJabQ?=
 =?us-ascii?Q?YNxlNgkpgiKVHKJL+/26xIxwtcdYmxlarmQ18GYZGo5F9jXNUnLMt3GGgfVD?=
 =?us-ascii?Q?Ngohja4rUHfbHEFp91pnJbeLUdpn7opXDjymKM+0bMLZey4ZRemVHyY4R0y+?=
 =?us-ascii?Q?MeICif3teXP3t/+ys1zdfLKndF2uPXCrdhVveML2x7EBGmCw34tPuLnljkLH?=
 =?us-ascii?Q?9tXQY6CmUNTzJR21bFwJ3zTxE6KmrjmUwpPEfAoPl8uxk8mw2HDx5xqgd52z?=
 =?us-ascii?Q?DFPn7+pR+36pHN1GPzw0CPnJsEW+f/h6lvODhwrwjBkG00UETOoRotfWP/Oq?=
 =?us-ascii?Q?DpxMJTlxFcVpxb/IU0ilhhDlSUwu4sJ0Z/lCUoUuBBFhYoZyUJ03FN2HTbiB?=
 =?us-ascii?Q?jUNXapdZ/MBWjDmmA2pTvky9mQCGacWHQ3UmTqFjJsGo7pbKSuRjGMqvRyZp?=
 =?us-ascii?Q?mQzL9Dt6C4bCFPNSNx+QlHDYAAX5lp+KxBkvJ/XiANtQAB5qTDQOyRK8Xs/C?=
 =?us-ascii?Q?nWr4tft9i3X/umlCNksniMAwXC625DcBda7as+3t64NloQXiUA6RLegUdtp/?=
 =?us-ascii?Q?YsP0EoVS1vJDexgvzoZGAC0ePT8KTcTQ7OEDekzzmB6Ds+V0NHcRKwHNm/nu?=
 =?us-ascii?Q?ulUh7YpFAEuQqAebvA4LLtG6ZXyg7Kgs80TyiQB563B+33iGsiCiLQG6uYQ0?=
 =?us-ascii?Q?zfdZuEBI5HUbA5ga00g9z10f/sxJN3UjWyfRHuXog2TmBgG93TjAZYsxxDhF?=
 =?us-ascii?Q?jPtJB1F+MFpdUTWrOwWa0ibQB+Tjr784mKAZd3TIwGRIxqVQIIoAVsLy3JjT?=
 =?us-ascii?Q?3TPBHG01duo0/UWEEe+d/zO045ZybOAmrbtwlf0oc3uKYZxblvUI1JiN0GGG?=
 =?us-ascii?Q?xauamBTyd8JeEl7eOGLrj3/iqDwAZum2lVJEM6yksK7iQmWbBdCTPCsbq657?=
 =?us-ascii?Q?ZFVBsNus/kKRiXpU/QeOtjFZXnFL8fUxt891Lal7vvcXknwgASmqrqWi5hPV?=
 =?us-ascii?Q?ju3I7JJMZKAzKuDldEs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685655d2-e123-4776-9d65-08de151cecde
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 05:51:51.0041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lts7oZrvUooQug1asVq4XMllMTXvBiPTo03Stg5d6iUbMZcJqb8R23b/th6CGnGoks8wwzWU5bPbz55JBenZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Wednesday, October 15, 2025 3:48 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 3/6] lib/igt_kms: add helpers for connector type
>=20
> Introduce helpers for checking output
> connector type, reuse same mechanism for output_is_internal_panel.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c                  | 74 ++++++++++++++++++++++++++++------
>  lib/igt_kms.h                  |  9 ++++-
>  tests/intel/kms_dsc_helper.c   |  2 +-
>  tests/intel/kms_pm_backlight.c |  2 +-
>  tests/kms_atomic_transition.c  |  4 +-
>  tests/kms_hdr.c                |  2 +-
>  6 files changed, 74 insertions(+), 19 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index eab4cb92f..f29778f2d 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3479,22 +3479,70 @@ igt_plane_t
> *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,  }
>=20
>  /**
> - * output_is_internal_panel:
> + * igt_output_type_in_mask - test connector type membership
> + * @output: output (may be NULL)
> + * @mask: bitmask where bit N corresponds to DRM_MODE_CONNECTOR_*
> value
> +N
> + *
> + * Returns: true if @output has a connector and its connector_type bit
> +is set
> + * in @mask. Safe for DRM_MODE_CONNECTOR_Unknown (0). If @output or its
> + * connector is NULL, returns false.
> + */
> +bool igt_output_type_in_mask(igt_output_t *output, uint64_t mask) {
> +	unsigned int type;
> +
> +	if (!output || !output->config.connector)
> +		return false;
> +
> +	type =3D output->config.connector->connector_type;
> +
> +	return (mask & CONNECTOR_TYPE_BIT(type)) !=3D 0; }
> +
> +/**
> + * igt_output_is_dp_family - classify DP/eDP as DP family
> + * @output: output
> + *
> + * Returns: true if @output is DisplayPort or eDP.
> + */
> +bool igt_output_is_dp_family(igt_output_t *output) {
> +	uint64_t mask =3D
> +		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DisplayPort)
> |
> +		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_eDP);
> +
> +	return igt_output_type_in_mask(output, mask); }
> +
> +/**
> + * igt_output_is_hdmi - classify HDMI connectors
> + * @output: output
> + *
> + * Returns: true if @output is HDMI (A or B).
> + */
> +bool igt_output_is_hdmi(igt_output_t *output) {
> +	uint64_t mask =3D
> +		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_HDMIA) |
> +		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_HDMIB);
> +
> +	return igt_output_type_in_mask(output, mask); }
> +
> +/**
> + * igt_output_is_internal_panel:
>   * @output: Target output
>   *
>   * Returns: True if the given @output type is internal else False.
>   */
> -bool output_is_internal_panel(igt_output_t *output)
> +bool igt_output_is_internal_panel(igt_output_t *output)
>  {
> -	switch (output->config.connector->connector_type) {
> -	case DRM_MODE_CONNECTOR_LVDS:
> -	case DRM_MODE_CONNECTOR_eDP:
> -	case DRM_MODE_CONNECTOR_DSI:
> -	case DRM_MODE_CONNECTOR_DPI:
> -		return true;
> -	default:
> -		return false;
> -	}
> +	uint64_t mask =3D
> CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_LVDS) |
> +
> 	CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_eDP)  |
> +
> 	CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DSI)  |
> +
> 	CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DPI);
> +
> +	return igt_output_type_in_mask(output, mask);
>  }
Code looks good, but I have one small suggestion. You could define the bitm=
ask values once and reuse them, instead of manually composing them in each =
helper.

#define CONNECTOR_MASK_DP_FAMILY \
	(CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DisplayPort) | \
	 CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_eDP))

#define CONNECTOR_MASK_HDMI \
	(CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_HDMIA) | \
	 CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_HDMIB))

#define CONNECTOR_MASK_INTERNAL_PANEL \
	(CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_LVDS) | \
	 CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_eDP)  | \
	 CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DSI)  | \
	 CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DPI))
>=20
>  igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_o=
utput_t
> **chosen_outputs) @@ -3521,7 +3569,7 @@ igt_output_t
> **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
>  			uint32_t pipe_mask =3D output-
> >config.valid_crtc_idx_mask & full_pipe_mask;
>  			bool found =3D false;
>=20
> -			if (output_is_internal_panel(output)) {
> +			if (igt_output_is_internal_panel(output)) {
>  				/*
>  				 * Internal panel should be assigned to pipe A
>  				 * if possible, so make sure they're enumerated
> @@ -3549,7 +3597,7 @@ igt_output_t
> **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
>  					    * Overwrite internal panel if not
> assigned,
>  					    * external outputs are faster to do
> modesets
>  					    */
> -
> output_is_internal_panel(chosen_outputs[j]))
> +
> igt_output_is_internal_panel(chosen_outputs[j]))
>  					chosen_outputs[j] =3D output;
>  			}
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 7121ab985..c8d394ea9 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -569,7 +569,14 @@ igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pip=
e,
> int plane_type);  int igt_pipe_count_plane_type(igt_pipe_t *pipe, int pla=
ne_type);
> igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_ty=
pe,
>  					   int index);
> -bool output_is_internal_panel(igt_output_t *output);
> +#ifndef CONNECTOR_TYPE_BIT
> +#define CONNECTOR_TYPE_BIT(e) (1ULL << (e)) #endif
> +
> +bool igt_output_type_in_mask(igt_output_t *output, uint64_t mask); bool
> +igt_output_is_dp_family(igt_output_t *output); bool
> +igt_output_is_hdmi(igt_output_t *output); bool
> +igt_output_is_internal_panel(igt_output_t *output);
>  igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enu=
m pipe
> pipe);
>=20
>  void igt_pipe_request_out_fence(igt_pipe_t *pipe); diff --git
> a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c index
> cea4304e4..4f23c39af 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -74,7 +74,7 @@ bool is_dsc_supported_by_sink(int drmfd, igt_output_t
> *output)
>  		return false;
>  	}
>=20
> -	if (!output_is_internal_panel(output) &&
> +	if (!igt_output_is_internal_panel(output) &&
>  	    !igt_is_fec_supported(drmfd, output->name)) {
>  		igt_info("DSC cannot be enabled without FEC on %s\n",
>  			  output->name);
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backligh=
t.c
> index a0ecf2b0e..27c31d695 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -239,7 +239,7 @@ igt_main
>  		igt_display_require(&display, drm_open_driver(DRIVER_INTEL |
> DRIVER_XE));
>=20
>  		for_each_connected_output(&display, output) {
> -			if (!output_is_internal_panel(output))
> +			if (!igt_output_is_internal_panel(output))
>  				continue;
>=20
>  			if (found)
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.=
c index
> a13830965..8e0ed9d08 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1224,11 +1224,11 @@ igt_main_args("", long_opts, help_str, opt_handle=
r,
> &data)
>  				 * panels with long power cycle delays.
>  				 */
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET) &&
> -				    output_is_internal_panel(output))
> +				    igt_output_is_internal_panel(output))
>  					continue;
>=20
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET_FAST) &&
> -				    !output_is_internal_panel(output))
> +				    !igt_output_is_internal_panel(output))
>  					continue;
>=20
>  				if (pipe_count =3D=3D 2 * count && !data.extended)
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index efa5964cf..c1c1663a2
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -730,7 +730,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>  			continue;
>  		}
>=20
> -		if ((flags & TEST_BRIGHTNESS) &&
> !output_is_internal_panel(output)) {
> +		if ((flags & TEST_BRIGHTNESS) &&
> +!igt_output_is_internal_panel(output)) {
>  			igt_info("%s: Can't run brightness test on non-internal
> panel.\n",
>  				 igt_output_name(output));
>  			continue;
> --
> 2.25.1

