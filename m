Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1A5FD4616
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 04:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE44610E0FF;
	Thu, 26 Feb 2026 04:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiBxbtYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E01E10E0FF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772079980; x=1803615980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dgbgKnln0J/FGIrPUYZuZoZGdIo8tI4cqR64qXsDTp4=;
 b=MiBxbtYijwhvob7xuOGp6JHMTEEdb3QWmdYQCHTC3Np8fTNwg7qn++g/
 gqlJ/hsXq6TVwMZnSy6Tw24TeZcvLShFmk69TNUWO7hJd/ilsE0uDEE4k
 p768Lw/8xpI6SEAMrsCweS8+VRwTz7BwZ6m1zK45hL1Q5TY9mBIPHR2Uv
 G/v18G5W4ha1KyDWlMiiP8yXSMyfhBCJklMXpxOamyPO7M3kyju8BoHZ0
 qAov8uzSLLQPpSMlYSHHqzrdAdbfk1Dn8gyEX/Ns2TN3uegX9uX4vVtmP
 vCsdOGwd+GbidOigsf0tPRGLFc2YOYAadr3RSzmobyuWnentA3FUJAIbA w==;
X-CSE-ConnectionGUID: l3CfQXLuQ0qoaoIiw9P6XQ==
X-CSE-MsgGUID: 1v2wkNA7TmmPE+V5jCiSBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73236350"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73236350"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:26:20 -0800
X-CSE-ConnectionGUID: L8iVG7ULT/qPAbk7Yzu0GQ==
X-CSE-MsgGUID: jEU9edCwS4meEGcXYX7iZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="219803009"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:26:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 20:26:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Feb 2026 20:26:18 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 20:26:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD/Mv034+kdN9aN/Ikwp4SDX8ry0I3hyWYneK021ARhkmShI5q+Vp6uSH5mG5WhVDbfgZTunOC0+d2VrJvP0UUH3KF9vUhcwH3qocc6pVepBoyK0BrEqEPZoQZvz/QGb4LEpEuNC63/ASxIMa4oPggMwvYm+kxwx+49qniz8tanmlETALqzsq1sPM25XzlZeq1vZAUyO/Undoob2/Jt4ZXZ8nFIbESaoY85uK74jipMZShlBmsyRIeOHMPliJGJFMLCiCjm/RYzE3KQOeie/Sfpvm5Omg6WM8Rba2uY/2PyDDQnB99h0PgQYfHcAKzI/EWmT+qEns78i5kyE8VDPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFi1aBMfNzw4FHuMsOHqbeIxTJ8OpAdrYOltvTvvwO4=;
 b=OEb1PnSS1bHSWkNY4D1XiqGmJu1K6Bc/jQ8WpKcgY1LKIONxCbEBiGyi0oo5tjadEtWISEqxpnSqETS2PGH+oGZbARlGSq3o2Dif9QGwNla5r2B4Kq9AXUbZeFqNh541CUVlsAAQWTkXji3+mi3maYKMJfjv9mgi9nIkLbxP3aaLIm0mUAXuGV2b1Kq+eBwM7oWjypXXbZ/RF4UbH4tE6jU8Yf0phDe9X9p0d7+5j3OaNBKpjb5EjD00TPWxAjM1AdJmbK05w1fuHRI8sj7YXkgEEDad+ka2EgJAq51kdKO9b3UOk+xgyTaEo6PIDQnMnU9SOL+httjCpu2oweILjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY5PR11MB6317.namprd11.prod.outlook.com
 (2603:10b6:930:3f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 04:26:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::b65a:1e88:89fa:c16]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::b65a:1e88:89fa:c16%3]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 04:26:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 2/3] lib/igt_kms: Fix max_non_joiner_mode_found
Thread-Topic: [PATCH i-g-t 2/3] lib/igt_kms: Fix max_non_joiner_mode_found
Thread-Index: AQHconniCv91tUjexEetT71LnhlscbWUZatg
Date: Thu, 26 Feb 2026 04:26:11 +0000
Message-ID: <DM3PPF208195D8D7667BC3A4625E1D3B47CE372A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-3-kunal1.joshi@intel.com>
In-Reply-To: <20260220152239.276034-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY5PR11MB6317:EE_
x-ms-office365-filtering-correlation-id: d95f4a4e-b6bf-4c29-e470-08de74ef2bcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: qtEf+da1tqFc9l9K5zTLxlRw06KigG/p2c7VyzioSyCEMv8cFrGqPorhATNneC5qORhxYcuB9101DyussFWq1LF2IyZqC2ph9R8PmY7mMDFaUz9r9+Tg5IvrhmJmN5gZ49m949SWsf6svEtCT5NtdA9i8rm5Qlw3w3Of+Qn5Tgh5PnS8KlzTR3LjUhkuyIIqEgCptJZbLFOi7IUHEpeoKpvPMXBYdOiIFuhgJPjpZXH4ylr5qihTG8i1XWhofH6cUvBxUe8QAxMVpwieWRMMAdSiuDtSI86yvqFwBHtAnQ+dBgG623FRXIeXcQdmn2KIcwVlloyzptZGvNuJFA/mR1A1vd2pS/5TrK+IG2joLX4hXXreyoLryy6dn7ZNzKH+AML5qVU8vCBPczCuU0TT3qxqlz5/odeOsOE03BwLKTt2Ayh3BZKptc2kC+0HzLZ0z/q5Pjb6r4wgWIa/0OcBdvaV2R8OSsFXTIQFdcHGOr9fH4P++7iEqdumg7UAitEoa9mZt/W3rGgRryRDzQ8n1aFZfcUvx+PuH7VpAyd+ZThO//hs6rubtEF72zXRW6i9Ti4Qr7AiFcMoLpo+8WbiQwwo34aLVXsZ7sdz3/TL9LwxrpU97P7EakwDZ3JNT01+ZrsWYefigZh7VLMhsXzX750F/oPC1qLu+CgOInUu2DlQDAfK2xz8vOJLZa4m8X97iWaGzAES6jToNxajuMxz3fTRV82KViSpaJdAsRU6gqXWN9EL9VbZTi3V401vMEKovZqvFObEihAPj3Eq3qE+jJBljjzLtYyIBbCcUnvnXsU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I3LuH7KkbyO7u0I0HxZhcJM7nKWazoXhqqKvlDaZ+8iR6PD8XEEGicLwPfGR?=
 =?us-ascii?Q?3cHpoFQ6zw3jiTjAmemas90K3kSY3WqIaJBrLgagSechHk45NPEGbXBl40MJ?=
 =?us-ascii?Q?/ysI6Up4rfupSu0PuhEqKLjAHwlmGVVtCU7JCsvG/sr8nOul4L+k8gSnksQi?=
 =?us-ascii?Q?fPsBB29X8IrH9y+lI+Y8sxAYev7epYNS9iMYfgW/vjR37TGRG50DEzvD4Luo?=
 =?us-ascii?Q?EGhWU21/dmmyjtUXrSp0F4BhGc9TsOhIndXaFBML5pMtP4ffb7wQ1JYmjg21?=
 =?us-ascii?Q?xqj3YtGRCG7OUPK6updRmmI4bgo7Gtds0GKKL/i9PnRqMkh4LFNu2G2g4JqO?=
 =?us-ascii?Q?2sbOnurPyLJm4FJ1t8CFOMspFrsVsg72jFOEhX5CP2BMMU3K7TIi87gMmHDT?=
 =?us-ascii?Q?iO/RQCti03ja/J3sX9T8tCfvnBoN7/Nbkjwe7iETiBIa/je51E1d27Kxv5Ge?=
 =?us-ascii?Q?zwYcY0tj7QFndEZ+ZkISB9qflL25lT5KdzPG8OFm8IZcBROu4O7OucbHWXh1?=
 =?us-ascii?Q?a9NK0Tc+rmesmFKt+ixFvGkw89OvxGgYdvn2Qntyfvtpu1lnCWqoTqOLerfU?=
 =?us-ascii?Q?S0QK33ZRz9Kgyak993HIpHbApNwucQX7YXKczN45k/6RvgJ3weafCV5uTjF7?=
 =?us-ascii?Q?sdPyHfY+R6YEWGxwhagG9OvMwYq87oZeIGGSm+6XSFqJMiQTOum5S0SNW5tf?=
 =?us-ascii?Q?Y4LK3xq3Ce9HksyHlEnVr7Q20h2IkbHRo1xPjeI/u7ulbl9WXaAuLUMs0bxi?=
 =?us-ascii?Q?uyvxIjiDCOegSW1OZ9jDNDSj6+Ou97JXl/7RBcr0hu5BCrUsjDgkpwl9cLMP?=
 =?us-ascii?Q?e8bIyPYmF9NYahbVBmYImcW4/31O6o+4/KeO66y2dFilH+5bmorSwDMlA3/u?=
 =?us-ascii?Q?sRk8rVJyK4genVgyTpKnaDVylu5yTMxxm35kPKlgfQt6e2doczDF8U/j0p+Z?=
 =?us-ascii?Q?hpua4uu/wcb0E9bGbyUZyC3vrOuqgV6be+BmNvao51l7oj4TyMGZfTmX8dxV?=
 =?us-ascii?Q?bosARH4N1sCHmh8e+JqSEG+ysDqIPXEdby4qnDax4gXHaqjOwH6s0zP34+cb?=
 =?us-ascii?Q?JNpYjwdduqKLQMKuExTqiw4Xoo4jbXn3+Rrbz4ebu6xOxr6h4pimJGvppyCw?=
 =?us-ascii?Q?TOo3ejR/XNznvWz3YE1dFD4o9ez8CUQzTkaetlpIcWtRxvWq47NhJDr0Bvwz?=
 =?us-ascii?Q?3YhJ0BmntXkIseTAGFB8KkbwTwnQstuOra+y7jNicbIAyRQD1wLIMdrxoIQV?=
 =?us-ascii?Q?rgoIbyh9fmUiHqk6w4IvfdVPcfWvs3/GMEAH4JlHFyKR4eMv31qWbL2vIQJI?=
 =?us-ascii?Q?p2Shlqj9Wfu5asn5fTlF/RIFdEZ9DKRBg42t6hwPbDMn6z+y3qSuDxoa/ZmQ?=
 =?us-ascii?Q?EyZNTZqrbggweB1WmgXmjuFBNyYmSwMtGtnHnyKV++N/UwRindAxrtFDNasr?=
 =?us-ascii?Q?fOhg4UfZ6sAM86k67dZ3kzHODAd5XC52HU9sTAg6NPRHBmHXTyad9YGhKDVK?=
 =?us-ascii?Q?s17b8X8lG7DI15mruM6MUwgllN7IvzObr2U3O9CgqChVQ4uq2wXEcnVf+3Al?=
 =?us-ascii?Q?dAwcZixLLbrWaIjtMgAVs8nZC+e9p0t0+lLf/KrfCjdCpcXwTUQM7ewmEcqQ?=
 =?us-ascii?Q?Afscjz7Hwq/HhxMTkA8HDv9cDSdU0nTnKy8MNGkBrgCr6IYxvYPpP0u3BEu4?=
 =?us-ascii?Q?hXNX0CtdiKyuxZZBUWTGgE1D6587oL7LkA2U3sPkC74qCvMLjfF1SG2eE1eM?=
 =?us-ascii?Q?T9r8hjp0eQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95f4a4e-b6bf-4c29-e470-08de74ef2bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 04:26:11.3829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjeVrQ1Ilm/fyVnYV/nHaS2c7cBhnffgENWtMDIBI7KG0+xhXUjewWpQ2Rw3NDjzSizvpPqzJI9eQcsfsWPK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
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

> Subject: [PATCH i-g-t 2/3] lib/igt_kms: Fix max_non_joiner_mode_found
>=20
> The function previously required hdisplay =3D=3D max_pipe_hdisplay (5120 =
on pre-
> Gen30), which means it returned false for any connector whose maximum

Nit: Pre-Gen30 do you mean PTL if so lets use official names like pre-xe3lp=
d.
Also you can mention previously the function instead of giving the highest =
possible mode
The connector could support, it started the check with looking if the mode =
was equal to max_display.
There may be corner cases where connector never supported the highest mode =
our source support.
In that case this function would have returned false.=20

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> resolution is below the pipe limit (e.g. a 4K MST output on a 5K-capable
> platform).
>=20
> Fix this by iterating all modes and tracking the best one (highest hdispl=
ay, then
> highest clock as a tiebreaker) that does not require a big joiner, as det=
ermined
> by igt_bigjoiner_possible(). This correctly handles connectors with any m=
ax
> resolution.
>=20
> Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit=
")
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 5c4879604..c6678b02b 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6904,19 +6904,24 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,  bool max_non_joiner_mode_found(int
> drm_fd, drmModeConnector *connector,
>  			   int max_dotclock, drmModeModeInfo *mode)  {
> -	int max_hdisplay =3D get_max_pipe_hdisplay(drm_fd);
> +	bool found =3D false;
>=20
>  	for (int i =3D 0; i < connector->count_modes; i++) {
>  		drmModeModeInfo *current_mode =3D &connector->modes[i];
>=20
> -		if (current_mode->hdisplay =3D=3D max_hdisplay &&
> -		    current_mode->clock < max_dotclock) {
> +		if (igt_bigjoiner_possible(drm_fd, current_mode,
> max_dotclock))
> +			continue;
> +
> +		if (!found ||
> +		    current_mode->hdisplay > mode->hdisplay ||
> +		    (current_mode->hdisplay =3D=3D mode->hdisplay &&
> +		     current_mode->clock > mode->clock)) {
>  			*mode =3D *current_mode;
> -			return true;
> +			found =3D true;
>  		}
>  	}
>=20
> -	return false;
> +	return found;
>  }
>=20
>  /* TODO: Move these lib functions to the joiner-specific library file
> --
> 2.43.0

