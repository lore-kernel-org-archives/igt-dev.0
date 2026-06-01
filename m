Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87862CD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 06:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BB3112DFD;
	Mon,  1 Jun 2026 06:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLOAsXpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D95112E01
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 06:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780294025; x=1811830025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2/MuaKbOLhtqNVycHAb5hNt1KWoKJFr3LPZykemyw98=;
 b=KLOAsXpzZDp/UifEznOr2Zpe4GfYO2zwaeyzNQaxxMuuiwxiRC9A0WtX
 99NICq4ihDR2osSbPKfoVBneagwECtLxXLRoblhjnKWRNHhgEmkhTSw/9
 NVkh7SWCYCtstRtgqLVpFMffc+No/bLtfkkEQQ5E/VuVGFizzoa+2dheo
 EOb0rmX1Ah5mhkgg4QbGViq4Sj7cc+LCZqlReS2ysfq8ZTgQ/6Y+DdIR1
 lAFh+8gGjZFTnxFnXNLV5Mez6PCPlVOhKJyHG4vY6uwt2kRtEwkjT0iaG
 D/RUsBG1M2YER6FGCUbyUT7mkfLI+V6H6ym56GYS29TmprlmPSFJ12ZpI g==;
X-CSE-ConnectionGUID: Os28qHtiQp6M6OuV0h+f9w==
X-CSE-MsgGUID: Vquw7SO4TaO73c+uRaEinA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80775367"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80775367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 23:07:05 -0700
X-CSE-ConnectionGUID: hus5jRIkQ5Ofocf+MJOH1w==
X-CSE-MsgGUID: Tsvso4WeQvSu3ZHliGaGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="237131575"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 23:07:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 23:07:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 23:07:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 23:07:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUQEfBQ0RbYjO15URB0pr7jcRvZXD4TBUpvOJHE9JpopP+n5R9aeY4Y8OpxoxR6nF96MXdU00FXTS7KjRnzkMHRu51A3jeC9WjBONn+/ZJehPubx4l4QOvLpG5f5SEPifhVQ8hnVgZyMKa7S85TyGAZadnKYFmIq47DqD6B0+JGtnz1U5vxS3qICM///e3r/+E7s0sM7WsHdq1Nj4pKm0ODkmsMyhXICXiJcKyb5evoqKkMINYeHJpmV5uCIyOo6pHSRSUTutrgWSKfmWgcjc7VwRmZQhWN+nTY55axawSyGoRWL5ar4Mgz4xC6YUkxovKomVc9db3rWdqmFJefA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrRjWrs92uf8mCpe7TpT6cArfBCRTx5XGfmUlAI1xzs=;
 b=EJyW0VmsWKdaxhZirI0xY3Bpa4PsrBlSA1mUKM1IBG+BbF1tpeZ0nMubdjayqVqsvCTpL3laj0Y/Uf1syvs8pHrm2CVDprybGXrDptBiEJn8IOR8FQ+4vB8vQygZj5PzMLbu46pSXYm5jLiuQOZ4S87Qajf2h4VRoLZwhGumz916qXYkOg6mGTa0/tN4/d0PwU2xbRZ1YdU5RsFcVjqKbp0JCjE7/O9C/0r3uBLl8qT+NnhCylHX99CcyMhYScj3GiOfHLPIk3RToXTha44upQRRYRU/PoRlfxUzxA2jiK3K8iSgani6EQjOt/XxyPp9N5h5zz1E4ouUddd+kPcn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB6761.namprd11.prod.outlook.com
 (2603:10b6:303:20d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 06:07:00 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::8015:f6df:e093:52bd]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::8015:f6df:e093:52bd%8]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:07:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 3/6] lib/igt_kms: Rename max_non_joiner_mode_found
 to intel_boundary_non_joiner_mode_found
Thread-Topic: [PATCH i-g-t 3/6] lib/igt_kms: Rename max_non_joiner_mode_found
 to intel_boundary_non_joiner_mode_found
Thread-Index: AQHc8YiF4/27HBNhykC9QihUCNckVrYpNogA
Date: Mon, 1 Jun 2026 06:07:00 +0000
Message-ID: <DM3PPF208195D8D968116849ED90B23D887E3152@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
 <20260601055545.1982351-4-kunal1.joshi@intel.com>
In-Reply-To: <20260601055545.1982351-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB6761:EE_
x-ms-office365-filtering-correlation-id: c15b1085-9bf3-4f31-f2fe-08debfa3feb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099006|6133799003|4143699003|11063799006|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: 1XUsFw2ZROhBj4v/ALBf/qffgku1QTGtjg/jtdT5yOZV5r0ih+DjhJKSgAdh+avzlDIW8jCPJFTh9PfReRP0J61XywsZvUO0m7R6soF9ZWHMrjDIVj98IWM9ogeo/440iLwdSznHQKxVSE3o06YbkiNqTz2BGhUO3/7EalE3GNYJSnMsFPctAuA5wd45mZK2HNXNZwgmisBvFX6Oc8t1jZpB0jbd+TNAfoWeyZ2KYK7vDhjZfsie/yecdd5vekz31GFI9QgufcLcG9euVYfl8vuLh4x7xI9D1lznxfPkIeAZQP2oPLmJOHG+p4zutj3pbWw+uansjyEMnNe7ptU5NMBCdNRnOai+f0rANdjDqp81mzXGLQvLtfDWojgcT+7/Ci4+1AUbN1NVr2hfXXydrvvdhMEPLtbfN0faOVRaPZp4xSCusykrD1E7m0oibg30qRcqGJ1mak3xEu/sXu+9ijI+5bws/VD2py+uOTx2BbvW4OhNsm+fsgBCuClgz5WPODh5vt/CdhK96+AVXBH5xzCqixFoH44B4c2w9n6BDMMFMULPnB4dpnNYPrEpdCeZWcrFCYAc7g5lkjN8sPefzbVFaV6mveNDq1Ico3Pcr+OdHzOssg4sTCLwXorQajRZcaysK+MMc3rG+G46L/UmX2zpu1pHV7vfyMA0emohIjgzddsHyIQLTcjsxPnx84tcrGVl7bonaSSvIblGP1owR4N2fuPDD/Tj3fN2+e+ywlHRwY7am+3csiZhJsWxQRMz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099006)(6133799003)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PdnhBoFfG189K3lvMfB1kQcdAzLq8Lk9Yd/y/25fTUCZa2SbTvT/uQHBL+vP?=
 =?us-ascii?Q?dveDi0gKEKWpp9nz2LjRoJOQysB9Bi4ufK80xpsnfiL489eFhjJkRAYZVibL?=
 =?us-ascii?Q?9t+/L0+VxDLPLc+e4h0gK6W72vM+nm9SaTqT797FHVCqC7G49RJuu5VpwUvp?=
 =?us-ascii?Q?GlJp0w2E+4VRvetmQaETXZVvDS4Ok1xwwqJcndRC7yN01cK/2lWjpxhqw+8C?=
 =?us-ascii?Q?B2sXaIeQGnTQVirfugWYPmgU3YVbQHjd+tNr+HF6joNMfaEg08Ogob8L3/4c?=
 =?us-ascii?Q?g/pmLzE3A3utSV5MGzVPqWph7t43iJ5VfkOV6HyHVOCkBe5VLZBgBY7EFKZ0?=
 =?us-ascii?Q?/rzY+2NENhlCmi10hbzCqbGIUgKh4qdGLya7zX4BVcjwx6Qd4A81oW76dwlt?=
 =?us-ascii?Q?4QxNp/lGjTwJmKST9RN22jdtCwWFST+KpmwmM+A4vf7yEl5cQVq1+Ngpdz9U?=
 =?us-ascii?Q?wLkQIvwYDhyJ8eVg9WUXzlPFusPRd8ash+bT+ADRai9+DSkhk+woQWWxpaFZ?=
 =?us-ascii?Q?jnrOMikT6bR72FVfMFaJoHq7ZJ2/J9b+os+S1AIYMP2MyuqUJ1XafGtSI+s9?=
 =?us-ascii?Q?Tmz7c54zSlnKqNg/cJg8AhZmODi5+Z8OnRjUm+iu23KZ+wrm3j4uF31xcw80?=
 =?us-ascii?Q?yIoYJDiPfce/PkfARP8eanAhInkeh9Peqg9WpR+jv36x+hIhOntR1Fpx4M44?=
 =?us-ascii?Q?Xvh5UeygB93y2OO18KcGq5JFRHk1QmkWRHEYoK1NtsPWJH57DM34Yf7arYSn?=
 =?us-ascii?Q?EaorRs5bCF6SUImoadVC0P4Gk4vFBHaTlJHUN3FV69di2eVnL37eTsIRac/5?=
 =?us-ascii?Q?dfnMJfrWVjuTaBgE42P0BMn6cICYuGsCGCqPYzqoimpACiKvC+QS8wSFu+XW?=
 =?us-ascii?Q?79xeug8abukis62p5OiBy0W5hCLMHG9abrsX3Rr6/GDfts2hhpDvXDwD/Ktz?=
 =?us-ascii?Q?3joqtSS7ISXPfWHgc/6fo0QUXhngKqPMq67V6eyufayx2vSY9+DW/eZneWBG?=
 =?us-ascii?Q?U2s4ybFfPl1me1Yu2dcVnn4NYshWGZDjysQ9ChRmX4c0B9QeEWuSYPi5AeB0?=
 =?us-ascii?Q?qgOGpX0g7PDdt1NtUo5aTSryQcY7qlwoN+/+HXIVp4PAESbleHzcXn2tHeXY?=
 =?us-ascii?Q?CJGjIgMRHPZ2awFMz8czkEkedcxVfbPpvAkrN/bEXJ2ZKDM2qmcpJqP3QOTT?=
 =?us-ascii?Q?hblJJk4j+8tQpC5rDDKwEkDJvyflhao12BiM9xMm0ZcLw6xhkEZdU4pd7ZC1?=
 =?us-ascii?Q?duOcuJ5aMAyM+xBC1yl+g2C8Qw4oEOA3wo9RksNLcT30U5D+IDLcsN3KfuIl?=
 =?us-ascii?Q?x1rhGyT/K6CVQ45ZUUI+S1NLf3LzcO7J8iLGEiDuDANqy6QHW7eLJ9IySVxI?=
 =?us-ascii?Q?hsy1ErdsnRmkHQdnwwnOxftFrvJWj62I7wvwR1Q4vQHCsKY5XIhcaKE/HFsO?=
 =?us-ascii?Q?vMkMs2Zh4DIp1HScGlzoOoK3+/VYnNU+TgzfN+ssF+kYjEoPPhn6+KHr2Vue?=
 =?us-ascii?Q?H7IdJ1DJ856fdOuGyonatLGEalMXhSEdS0VHUKJI6ldqgQZfkYVPBFUYkSLu?=
 =?us-ascii?Q?6Tzce61Xb+rJzAKgzO7JlQrgLUkW8patDkihqbwcX/C51OlkkxiOHhXdcm0v?=
 =?us-ascii?Q?8iKSgZtROtdyff02DSznF2ZrVsfISknsAn0j2OYZD/tJ4SbEqBdXtIH5EI2/?=
 =?us-ascii?Q?NPW9kTnoU9ZHiCMemTclPOgie8hJociw9C3FDZfy88PzthJCkMoiebSD/VdX?=
 =?us-ascii?Q?Ryr9qNj6AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: A5wYgFVrxuArT6bfOn/RUoK8HUjLDxm89+TZjPhJxZu4QZ8j/CPa0ib8tQvcyhnc5SZF+yjrxDqNf57tdInSwHXwbjikwikj8xv5XUNSi+AD6egXT5KlpYUqz0BCkYD1iTZKa+JZtRwr4VMfN5AjS2rX9ruTC4q5zjFPu59IDsRsPnjqEPjLVcNLC8Kc259A8SHkUZqZvEnRH+3ZeieSHfvQXmnUYsS/h2aYf6lVWzK3HkYNciy3KNN79Quo66EnC3Z5i+OJIy7oN69VR6ii8T8BnUdxOl2CsMZi8orVYK0NX0Obx6g3AJR+/R4I7f8XXRvrPNQiHWjF4sz/qTe0lA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15b1085-9bf3-4f31-f2fe-08debfa3feb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 06:07:00.6309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqF/CUaG8Q5VPFeqwnBqg6C2Esb7xQv1iXZ3Px+BUqjY0WUHN3lvifhHuRji/LNkiGSg/30JEQqK62yo4SgHXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6761
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

> Subject: [PATCH i-g-t 3/6] lib/igt_kms: Rename max_non_joiner_mode_found
> to intel_boundary_non_joiner_mode_found
>=20
> The function checks if a connector supports a mode at the platform's maxi=
mum
> single-pipe hdisplay boundary. Rename to clarify intent with intel_ prefi=
x to
> indicate Intel-specific semantics.
>=20
> Update all call sites in tests to use the new name.
>=20
> Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit=
")
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  lib/igt_kms.c            | 12 ++++++------
>  lib/igt_kms.h            |  4 ++--
>  tests/intel/kms_joiner.c | 10 +++++-----
>  3 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 0f1ce03a9..ef2d92812 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6979,20 +6979,20 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,  }
>=20
>  /**
> - * max_non_joiner_mode_found:
> + * intel_boundary_non_joiner_mode_found:
>   * @drm_fd: drm file descriptor
>   * @connector: libdrm connector
>   * @max_dot_clock: max dot clock frequency
>   * @mode: libdrm mode to be filled
>   *
> - * Finds the highest possible display mode that does
> - * not require a big joiner.
> + * Check if connector supports a mode at the platform's maximum
> + single-pipe
> + * hdisplay boundary.
>   *
> - * Returns: True if a valid non-joiner mode is found,
> + * Returns: True if a valid non-joiner mode at the boundary is found,
>   * false otherwise.
>   */
> -bool max_non_joiner_mode_found(int drm_fd, drmModeConnector
> *connector,
> -			   int max_dotclock, drmModeModeInfo *mode)
> +bool intel_boundary_non_joiner_mode_found(int drm_fd,
> drmModeConnector *connector,
> +					  int max_dotclock,
> drmModeModeInfo *mode)
>  {
>  	int max_hdisplay =3D get_max_pipe_hdisplay(drm_fd);
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index c2a3099de..01a7b0d4a 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1268,8 +1268,8 @@ int igt_get_current_cdclk(int fd);  bool
> igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> max_dotclock);  bool bigjoiner_mode_found(int drm_fd, drmModeConnector
> *connector,
>  			  int max_dotclock, drmModeModeInfo *mode); -bool
> max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> -			       int max_dotclock, drmModeModeInfo *mode);
> +bool intel_boundary_non_joiner_mode_found(int drm_fd,
> drmModeConnector *connector,
> +					   int max_dotclock,
> drmModeModeInfo *mode);
>  bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);  bool
> igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int
> max_dotclock);  bool ultrajoiner_mode_found(int drm_fd, drmModeConnector
> *connector, diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joine=
r.c index
> 86226a3ba..58ebfdd5e 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -594,9 +594,9 @@ static void test_basic_max_non_joiner(data_t *data)
>  				igt_assert_f(crtc, "There is no pipe %s\n",
> kmstest_pipe_name(pipe));
>=20
>  				igt_output_set_crtc(output, crtc);
> -
> 	igt_require(max_non_joiner_mode_found(data->drm_fd,
> -								      output-
> >config.connector,
> -
> max_dotclock, &mode));
> +
> 	igt_require(intel_boundary_non_joiner_mode_found(data->drm_fd,
> +
> output->config.connector,
> +
> max_dotclock, &mode));
>  				igt_output_override_mode(output, &mode);
>  				igt_info("Appplying mode =3D %dx%d@%d\n",
> mode.hdisplay,
>  					 mode.vdisplay, mode.vrefresh);
> @@ -662,8 +662,8 @@ int igt_main()
>  			 */
>  			bigjoiner_found =3D bigjoiner_mode_found(data.drm_fd,
> connector, max_dotclock, &mode);
>  			ultrajoiner_found =3D
> ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> -			non_joiner_found =3D
> max_non_joiner_mode_found(data.drm_fd, connector,
> -
> max_dotclock, &mode);
> +			non_joiner_found =3D
> intel_boundary_non_joiner_mode_found(data.drm_fd, connector,
> +
> max_dotclock, &mode);
>=20
>  			if (igt_has_force_joiner_debugfs(data.drm_fd, output-
> >name))
>  				force_joiner_supported =3D true;
> --
> 2.25.1

