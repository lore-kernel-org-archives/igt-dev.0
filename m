Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B885F531E3
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 02:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A76D10E059;
	Tue, 14 Apr 2026 02:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPSxF/Nh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41BB10E059
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 02:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776135385; x=1807671385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lLePTW96xRNwe7ie9UX0ahcd88qTEOm2gSNQaTKOwMA=;
 b=gPSxF/Nh7/kOEMTKidBs//vsh1EmbkMQQMIpxR4tXQzdODxCUc2ivfsN
 mURgeun56QmDokacJ9M9zfN9UPs9MzScDZGk7wZDL5NQLOA5cE90Bmsvd
 1JqYyzQAaSb4avOoywoSRKZEwdES8SJtz+W8dpdaGgD1/1na2bGepIx/7
 594hVYi1WINVutkCcAOA8SlzVNF8SopsodIVkAFYXv9ZMOOku5VbUPwUW
 SWy0CN9bgvpgUmkZ+mYuVCfdOkl8W6clQ5qYESdTeHD6RR8taVzLoaml+
 x1+VnwV3cW6XQd1QwT2vcF2Cq2VwaoXadbpmgLNVyts8Enc9+l2FpFwQC w==;
X-CSE-ConnectionGUID: 1gB+r9qQRCSyDXVm3qpTpA==
X-CSE-MsgGUID: wdcdtburTJCeCteL47FjAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64613704"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="64613704"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 19:56:24 -0700
X-CSE-ConnectionGUID: 2DqKxJCnTbaC4TEcMQXJOg==
X-CSE-MsgGUID: oncLvlQsQYWQJldH6tBjOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="223465730"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 19:56:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 19:56:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 19:56:22 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 19:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZJ3E7xwBaYnszCElFiKdvRKEkk4iTNKsU4SLMhw4mU85bVGpHKlXqyfuFYW7ndus3eWRbXNPKjK/VXDDYHyplLgcCwZ5INVk6IEmTtSja/jakrixq22o5Q5EjrRAkTfN/0I49D36Gd4F9Z/DsyGZrHJpthzh1lFAXENrA3hTfkGceuRmdiq0l6UsrN+dU0E38GBv6tHXWfQcvskg2PCxobbgp+SsJR1mLb1S+nUyrzGsnXMc362cuAnWfnFkwQcQpuvbl7T2F41TsAX9ZAMVTYPygzEe0PYFz7pjNCPAd0q1EtDWm3ZjS5pyTg7Iy4qhEgm1UO02OXxU063AA+fag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfsEO32YyemIJq9VXqaztIxSirdceyFm1urkl0PlXbY=;
 b=EXaf7dySOSXyD2YLXJ2wfNClWBoakdJ3Lzrxm81xOqYT9Hpag6H6RIINVCCnaLMrzRIR4DB36XOh9BjgVv1l4Xxwq3YiRQtyL3GANH2B48SSdMs3R0BSO3RElSclBmWWKwMoTSmlHMb7WkoxRhHxRqTdvOkyX9iQ/XL/gs3CAg7VgOxcNpGJodfa0BGRz+lhrqqf6AkT0K60/mt6nmGYgABpTmdq8ViIpRO4qT5bPtp8sPxhn7rUHH08WTWDmUE/E/Nc7RUlvgCMVk/7GSbiJsnv9yUEhAWrbEg/iNQbNRSOFWwwSuyyKKXXIQ9+pB1R+/VJsgyHocSsxkANwaxW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DSVPR11MB9766.namprd11.prod.outlook.com
 (2603:10b6:8:34d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 02:56:20 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9769.020; Tue, 14 Apr 2026
 02:56:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: John Harrison <John.Harrison@Igalia.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v3 4/4] tools/intel_hdcp: Fix flickering when
 changing HDCP state
Thread-Topic: [PATCH i-g-t v3 4/4] tools/intel_hdcp: Fix flickering when
 changing HDCP state
Thread-Index: AQHcy56I6Xer3Nwh1ky3OBHgNLJiCLXd3Rfw
Date: Tue, 14 Apr 2026 02:56:20 +0000
Message-ID: <DM3PPF208195D8D22C29540B066D0871862E3252@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
 <20260413233629.771034-5-John.Harrison@Igalia.com>
In-Reply-To: <20260413233629.771034-5-John.Harrison@Igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DSVPR11MB9766:EE_
x-ms-office365-filtering-correlation-id: fcb9e16c-ff7a-40da-9fa7-08de99d16828
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: ZwG+jPW+4ABrEohsvhhBlQYxZd0yrbymrzZ4D3lHWpio9FHzC8XVYYawxzWAIiKK9aVMQ7fFlIga6McNXKcjadthRrQZRxBIFqHSJ/XV2Vokenou1GeMSbrEwVfMTn+OyPrwFZdAnRDXk+LIKX1JivJnHWwMvj6MJXi0atX5XU4yirj0lH5zS/pKorm3cVSxFypQDZCZPwKKls8W59c0imjnodQZagIL67Y241XQ74iozbzaLboxawcksU3fdmmt1xXaV4LkXvdmcni9A7MAha/912cTmLjxzz130stR1gQZTRCUk/eDFAU+8mRAg07/XcEayIoZXBV+vFl8gDp/OUcq43/gK1SYVVh6Se2vB9yJgiO98skx1ZKrW28uoaDIH9CSpTkJxo/KI1SrVeJrD+sveuU1QvdhTLfculCmO0fe7AWYxs7wWfLENeml8j5/pV5tLnN0SmVwgCWZIneGI0W4BKav6yrjnaRNJeHITK/pAS6YVRYcrmj1bVpfli2boqbz/BfhLcfjRuK/13+99+wSnDqjuDgM3ovlc6qxI7Ja5s2T5guhFMEXp/rfDHKb9bSMiZxCo5EUt8ylFX/pZF5f0ylEZuWE2Bum+FlQlL2ZJT8dKQDgDsdYnABRpoyCExkl9Ii5061H6W87PviXgfYwiw+oF4Ao2FjYbqHPVF/f7+/KJxXLE1ys0KHBq30F+8+PZpRosyfOPervvnFJ/psEj3SN+n4mzXinVQrjHh6MhBp89JezAmMQpmEOAo0RiQ07qcGQeANb7fsR4349VTel78qNxwLaoOpaJhqI/OY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JhADydoOGvRBihxJTtEgS9QjqJ2qLAMcp2qE6PL36/ctIZaz+vkfMTyXmria?=
 =?us-ascii?Q?Y1HBcbwXI64xfq+NXxzXL+4N3AUpMguTQt98UdbQCRO5YCnWKF/oIenx03jE?=
 =?us-ascii?Q?t/HPbd9JI86weWpKBUQtXNNrTgBWPPg08Pe9RqljeadkKO0vHqizxDHoXfAd?=
 =?us-ascii?Q?h3kd+tJxwS+mCpIbeE78Uqhv4HZ8lW4PBV0euk+CjF7Pe2Doi0j3FBfzyOd5?=
 =?us-ascii?Q?M7XSF9FnWEEI19VNcO5h2rLWmnt8bt9kMa7+a5vPL8gEjGBdp71q438T57Py?=
 =?us-ascii?Q?1xu4DGm7kKkIP6tiuFP5firkfAcwPYMi4lfgew4DCrrrLTUqPqAP8J941md5?=
 =?us-ascii?Q?AJj712FVm4ek8ZPTAtAbRaZYzQVaQ86x7GD7GbTfa2iJJcbEoGQ4If3IQEQG?=
 =?us-ascii?Q?Q8AI7Cxsm1FubzbTb7jhGbGHFp7UV7NqURAJsdOHwKvcqqzU5Zc9X9s5+iaQ?=
 =?us-ascii?Q?SLnJjMbqYgLigYdDRqXHFEPIQLy6+D/vuONjhuly2lWk4P3/nMx3Xgn/F3Zr?=
 =?us-ascii?Q?P+IgucopQ5EaxY3S4Z4yUWCNPQVWpBDZFX5X0D7iJa5jLdT70RQkZ9m9MQET?=
 =?us-ascii?Q?OAdkZqfKh1QGGKI+ZJ6Fxk0D7mDKaAg7QGN3ockglgHFmsfKrtXjW++E5mgL?=
 =?us-ascii?Q?vsXfaLGDb6N8VXVkNpsoXJiY04l5kTjVJus7HwuGMc05SFEeg8CesDBvP2Rw?=
 =?us-ascii?Q?hlVH6IvkmPvDuqsBoNY4zmE73Dd4EGkI4kAkaMb7COncHMh4gFEi7SlcqBRv?=
 =?us-ascii?Q?JRDprQ9LVtohP3j5wdm2RtgyTjSxjYtbxK613Aw1LS//UlHorctBaGFFUR2s?=
 =?us-ascii?Q?qATdUIsCEb5GG9pUYmKWzwKPo1mQ90qlSGrcYGxqTNIi68R25MvCm734s2AL?=
 =?us-ascii?Q?zPWelZjXBWdpUhEJhEDYGP0YKQfIEgE6cdtV9QL19SSy28NZyi3CibG60Xt8?=
 =?us-ascii?Q?bqNDKute1OaFGA9UFKzPOqd/oEKX++foSW5A27KArjkGCJAp7g5fcjIi1qjl?=
 =?us-ascii?Q?qKUBxpWJBesKu3Yjpi9jnmeLcHNVLitsNsDJH4gGXXe9x8lh0DafuAw5SRZG?=
 =?us-ascii?Q?pEcBfZT6fWzAhSViZUYuiztkYGMr94AioFnbhaa+ZQEiNtLkD1FDAHrfwdk3?=
 =?us-ascii?Q?9bpDMyfkInDWfeLDWgjDZiLdDEF0JSdb/bYTG0ezgeahz+R4k2o0G+XjPhHk?=
 =?us-ascii?Q?92RbTTExg4pxWzeq8OmNycPWBRjCX7AOzJpFWwoxOje6OY5ZPchj858v7oVc?=
 =?us-ascii?Q?oTmwK9FSdmF+6dsrcClGZtxRa4vgJ2m+q0BIDgkKz6n2ZO244GItqdgmh5/o?=
 =?us-ascii?Q?bhXE1wDzyc1DNw7p+0XOmLzUnmxU+hXycT02/qdvy2clY9gSC0ppCMkfqLLT?=
 =?us-ascii?Q?7pSAsHQtAzUC7wfHvoHcwguzj2w1ORxDRrKmrFWQ9Mb8lndSPV88AnKNHqRz?=
 =?us-ascii?Q?ruKYFuPUpzUN52d8YBU12EkAWxiEF6zCOrrv9S1fZDc/l5MTMWbqOCguXley?=
 =?us-ascii?Q?c+QtmzAeMZDxjR4VFP8enSYgX6oNx2Kq4MRNw7nx7VCz6iom0yjf1TLZOrGm?=
 =?us-ascii?Q?BLpTYw4IB4L2mmqE6BhySV/Sr5I3NpN0YWQMCw4gnxoTDV6etuD8ly51ZRCd?=
 =?us-ascii?Q?5az/hC+JBhuPgh8UtXeyHN2/EPCXxeFFtbVJg8HwSnOJjGoFRxoofxGVQPq4?=
 =?us-ascii?Q?SPaOubHuHqwJasNAO22TPGCO6hrHqVGW4yP02R07Z+e6zspe3ETpfLmsO6h6?=
 =?us-ascii?Q?trIYZ7X+eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qov2mIKftsVvU8uOck6VEBThhV7e80pFmQshNzfVwFrbPu4Qx9jSGemNw1oPFByVfpCsVuecTWCynJ54PCHoE1v2qSfkGi7OZRBk37ZtnpcKMIEsiIJvkLKp8F4Bh1iHNqYBYB3ftU8u0eQfH4xuhXt8xrPwrYyA8OWzAugKbKP4E6AHvWRFGXyNeb2Hfh8BT22FwLZxHeM2XJnt/HUeWRlzyFUrsVxcksiCAdpIMgERc7DRMNWUBl66FqIPjuCmaXbsg/gt3hbqa9q9DSXD8dBJGllqS+/JZcoZHCLPNEzmwH2TeWqBw+IgampgJCeTCZ7qVNegwvQpQUdumuyXnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb9e16c-ff7a-40da-9fa7-08de99d16828
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 02:56:20.7361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zeKLWSOYa2jzVXPkXGQgbpxN/Wxn/9QCxTpC+jpJfPobk7jTjAhy7EoRJWxk6W9oddpPvb+/KRPZcw9nm8zFAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9766
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

> Subject: [PATCH i-g-t v3 4/4] tools/intel_hdcp: Fix flickering when chang=
ing
> HDCP state
>=20
> The menu system would redraw the screen with a special colour to denote t=
he
> current HDCP status after a change was requested. However, the screen was
> immediately redrawn by the player thread with a background colour denotin=
g
> the requested HDCP level. So all you actually got was a very brief full s=
creen
> flicker of the background colour.
>=20
> As the current HDCP status is now being shown as a separate line of text =
in
> the video player's output, there is no need to use the screen background =
to
> show the same. So, drop the menu updates once the video player is running=
 to
> remove the flickering.
>=20
> Also, don't stop the video player thread when HDCP is disabled so that th=
e
> status update continues (given that the menu thread is no longer redrawin=
g
> the screen now).
>=20
> v2: Split into two patches (review feedback by Kamil)
>=20
> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tools/intel_hdcp.c | 34 +++++-----------------------------
>  1 file changed, 5 insertions(+), 29 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> c12de06df..448d2e36d 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -102,24 +102,13 @@ static void draw_menu_text(cairo_t *cr, data_t
> *data)
>  	}
>  }
>=20
> -static void draw_menu(data_t *data, const char *status)
> +static void draw_menu(data_t *data)
>  {
>  	cairo_t *cr =3D igt_get_cairo_ctx(data->fd, &data->fb);
>=20
> -	/* Background color and text color based on HDCP status */
> -	if (strcmp(status, "INIT") =3D=3D 0) {
> -		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -	} else if (strcmp(status, "Enabled") =3D=3D 0) {
> -		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
> -	} else {
> -		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -	}
> +	cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> +	cairo_paint(cr);
> +	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>=20
>  	draw_menu_text(cr, data);
>=20
> @@ -666,13 +655,12 @@ int main(int argc, char **argv)  {
>  	data_t data;
>  	pthread_t tid;
> -	const char *status =3D NULL;
>  	igt_plane_t *primary;
>=20
>  	data.selected_connector =3D -1;
>  	test_init(&data);
>=20
> -	draw_menu(&data, "INIT");
> +	draw_menu(&data);
>  	primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data.fb);
>  	igt_display_commit2(&data.display, COMMIT_ATOMIC); @@ -706,7
> +694,6 @@ int main(int argc, char **argv)
>  			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
>  			break;
>  		case 5:
> -			stop_video_player(&data);
>  			set_hdcp_prop(&data, CP_UNDESIRED,
> HDCP_TYPE_2_2_TYPE_1,
>  				      data.selected_connector);
>  			data.hdcp_type =3D HDCP_TYPE_NONE;
> @@ -715,17 +702,6 @@ int main(int argc, char **argv)
>  			break;
>  		}
>=20
> -		if (cmd =3D=3D 1) {
> -			draw_menu(&data, "INIT");
> -		} else {
> -			status =3D get_hdcp_status(&data,
> data.selected_connector);
> -			draw_menu(&data, status);
> -		}
> -
> -		primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.fb);
> -		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> -
>  		usleep(200 * 1000);
>  	}
>=20
> --
> 2.43.0

