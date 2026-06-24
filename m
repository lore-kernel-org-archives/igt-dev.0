Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E0CDB475
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 03:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F9510E051;
	Wed, 24 Jun 2026 03:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXD1EVLO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112CE10E051
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 03:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782272132; x=1813808132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t2OuiMYmGfLbl0TtIo3A+QEMhLexIla2PUF48VD0CiI=;
 b=VXD1EVLOzyrNtzpiuTKlR5MgXXPPEubisoZ+cZu5dEe+Tlru58xcZBxC
 hDH5Gr1qN3aW68p/Vde2l2/igUJLTA6imj//VX/AjdH/eH/yDQhr/biWb
 BekkCwOG7T1lRE8Jh/ItwT1imKFN2CFUKzJdBnOeJZvXeKljEkZy6MBRt
 BaYpp6RXzKHFaEFaKeJNH+Zri4w0ZEUw9JI9x5yaE6E6kjAI72SRMN/zE
 T60/lMiS995C8JIshO2dUtqA13SN7DJRCQ1yTcXjgpDzKAX9V5b+fY5DH
 vnMBzTrLQkELC7Ft6pdvYxty2FIpFDDcnyLeI09ymfDE471z6223ZEdua g==;
X-CSE-ConnectionGUID: 3CwO3xBeTV+GQFpoFMuHYg==
X-CSE-MsgGUID: 96SsjNl7T3Olblw+om3lNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93610387"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="93610387"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 20:35:32 -0700
X-CSE-ConnectionGUID: ktIUZm36QCaCYLLGNagmUw==
X-CSE-MsgGUID: GcNndhEyRYOI855v61usxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="273760559"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 20:35:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 20:35:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 20:35:31 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 20:35:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5osarwrmA0KWrDzwggCU7JRfUJum9q7YCE8t5eS/bC5j1NLEZQkQy8lAE5u0dFl4vKS382Wf0auG+/1ngo3AUetwl28GK7smuu540ptSqc6yGChNIhTFZ/PELEOeCVLovIOz2ib6LfNVUGooLu+gs4QmRuukAfurq2fxWbbwtdQ5ftMxeN4p9h7Lv7JmSOZMny9evfZAbyg2qMRG1RWpz014Jo4NajpnrcQpAkCyuHsvDmiJe/0Q1xlqgsCR54MUQ4gwdWwSSa+kYGeYkTCxGQxEzok6q+Chvau/AWspMOQ/PfU82lsksR6OgnGRY7bgp+VC4DBWkWlfj6ctzQciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzjb2zm9I6oSxu+l0nZKBjqWtsWb0Bt0TAWWZy11av8=;
 b=ZRqMshlVXuwdiMCX6Pi+dLXeDLVnO+y/M67Uty5+VQCO3Fq9YHLhTvUaKQsW5fvjmynICG//53Aj/cjO6+GdAgjl73stJ+9eUL4rxsLMwx8dJzE/54MvBwhMT+6eYnsLbx+Er5BeJkJfocU3t/ubRiE4EARcA7y6L6cZORVhzZ0bv5iAjHQDT80jKhNNL4uMk5uFw6q+5D9ZYbJ5PBPe88oPkW9cYO3dfTMaN1XTzI/+kncK0d5J5y30ulpfoGU1/b4SnPV1swuVoP1e9e1SNtURL/FBzhdrwrLgYzN8Q2ucb1Kk+yKEXvYM6Nu8+OKG+bPAr8GCg67naf5ZHSXayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.18; Wed, 24 Jun 2026 03:35:28 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 03:35:28 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/kms_rotation_crc: concurrent cursor
 movement with rotation
Thread-Topic: [PATCH i-g-t v3] tests/kms_rotation_crc: concurrent cursor
 movement with rotation
Thread-Index: AQHc/6P4CF6VxEYGSEGLS8aY42FwaLZNFXmA
Date: Wed, 24 Jun 2026 03:35:28 +0000
Message-ID: <DM4PR11MB63120C4C528B72A5C01931E190ED2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260619041903.999144-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260619041903.999144-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM6PR11MB4532:EE_
x-ms-office365-filtering-correlation-id: 29b0eb47-84c8-410a-10d2-08ded1a1a2a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|3023799007|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: jmu0Mjo/AR5wrGzSqCeR4y0VeL4xWBk3EKduoxxTBfNd/0V86GI90WozanMy0rl3pkNqSHuE8lJ/54DXBwCReEwbatCH2rXeiio+Cu6JcoMx20eWSjPFTieTna460QRV5xMX21Xfbf+9xYjkPOJfbLvId98TWqIF26/uT24J2emeK3ULkHNhpxQMepXMhLzVTGDZYpB+XloKdkEBZFVsGoCana0IBWd0phdoLwiNiDDLSq1Ked+73EkLRIFnVezFuLaoNAqmNqO4CwlrwmgRt/FzpjPYqWGh5df7v48A5Zk2UR5HUmcE1rKKmKDe8wKc7hWbXZjoxA82SZVsMALZc/aQfySGTp4oiwBmHX5MKn6X0zm+DPwWSPZ5E0gL+bpRWp7sajvT+Z66gcs++vSaq46ZfyKcvvoy1I91/vh/FfIjmSICtRHdVOubhHnqZnpFKCQyVB9swscyN2IbUNutOyzdqyVLlyU3DGSy0vvrjE1CdlWDFKA+J2f+jKLldcU1M4v7SNnAi+QwYFOEvV778mIiKtbj3nfJzxc1EoUiSk700R2XUXV0oCzTGI4nwcakOF8XejzrUNkOrC0Mxf+Lxm7/++/gYwHWDmelNOEZeNBBf4cA7Jh4WoEqsfoCWBB63Zok1lH4XLIj7cSI/GdmXAg+44JO45neY5Oo3lGE9UdBJVNPdhQw/Pk1lr8vNsTQXusBWsI8afnxyNuy00vwyjFM/uftAniatGtTiDGzF+I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(3023799007)(22082099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3ej+I/H5S50zzplifN3qx3NrKnr8GDdLAvJu9Dy3OuTqou3wskiYp5FZ6rnE?=
 =?us-ascii?Q?b9PC2yJ2pkVGroM5VYUGnDJIcXwUG5dO9yhqizA5X4s31Ld8uNIthaWjNm3J?=
 =?us-ascii?Q?sO46AInsIAyCNQq9t4UFnW7qGROMU1CcHuj3c2Cf6HYON5VT1Vg8BNWPvySM?=
 =?us-ascii?Q?50hgrYxm4evnidA9GjfvvA5pKv3lmZHCuXMwhEfBwvlKeiRbLEKNfDGy1CmU?=
 =?us-ascii?Q?72M4p9EZTrSC9BGM22V1qfji3nerotQzPUJr8jQISSWg8pHnx7fxglLJrMn2?=
 =?us-ascii?Q?Iy3WuiV/TY36mMbjA+pF4KSOkOlTtpjvXTZFo/uZqa9YUebc5EG1iR3yDtqa?=
 =?us-ascii?Q?SRLq2I70pdHNNp14RQcrXBG9v4uKAY6aMwui5FK6+ILCV8YXgHntiOUNdaCA?=
 =?us-ascii?Q?HfA9GOOazkD94Cj2KZIlGUeDav2XwfwjAtD9ywY2AxuoS9jXrKbNTRO6AJmk?=
 =?us-ascii?Q?w4/eNIv4zW7TrgbhCBMAOAkOfWnlSBQ7vlXtN8wPWEf0TsmxOcyDeicU/mEt?=
 =?us-ascii?Q?kKYYDKH3pW8FRbRgjz0pECsxP9Vj11Nd7pHDX2yWZ39VuuyQqIFgbl3Daxsj?=
 =?us-ascii?Q?at3ruH5I/GTpOZmDdgyCtWtdAtdSLVo4LDdZsIHtN4L0TPFzSKzJzIXPigpM?=
 =?us-ascii?Q?lm1meRcp6JJ4gfhA9MpJOuTO+ZzmHXaTD11l/6QhYCjq7Iw1GhvCN1+Ew079?=
 =?us-ascii?Q?kYGQBW2fAiHuAd+AnNwW58rKNhGYE+b2mgK6gmMbxh05YIryaf98yDiHnqRv?=
 =?us-ascii?Q?wloNHpMRrap6A2dLlrNnsQJxGrTjVSbJ3iTgHSitBWUx7t+AjpFzkk92vEU4?=
 =?us-ascii?Q?p93XnyCkIKAWy9BfSToFuhRa6YOIef/RDpLtElvrbVUqUpMaeW8uJN19LZxK?=
 =?us-ascii?Q?GzryxNy5/Xzz/OLENGts/Iah1z3zXi1KfEblXjNyzx6UoBMhEzxPXENzbwao?=
 =?us-ascii?Q?1j6gJlwAHcj7CRtuhmgbayRB5RY2zzELGe/JHO5QWDrpWLa065vmNwbQA+W6?=
 =?us-ascii?Q?W60pYLvB9XVokPl6s+k3iNJVDFe3zL0egalpcjD191e3zT8m4AHaY2AhxYaF?=
 =?us-ascii?Q?axyyFblRP4Y2ySNjeAKO2odKn3VXSLr/Pcj2U6Ik0DQmeKLLY/Z0z4CeJ/wG?=
 =?us-ascii?Q?xlHkR8SopCW0ERnT7d941VRaxFOmkHB/MybV3UtiBl9TSyxCuHOG0byvohxi?=
 =?us-ascii?Q?VfVWHKNyUapcfH0TbrIL8+k2grgEcCqhHynccaMSIJvN07lqeocm6Y+8T4OX?=
 =?us-ascii?Q?DY7aVM/YekFrM9aiFq53GdsScR2x9jCcrIkQnNHJZquT2r8BQ1mR1py10xHX?=
 =?us-ascii?Q?8TkD3ia2cRex5BmwjceJZBDtZezSorTRZ2KM03rdr2Y2vsNXTxBzC1t4Atmg?=
 =?us-ascii?Q?+a6q7/m8/lQF6tbaOiXcacc22EkdfmYRVgQpqZX+ZM5zS1nIw6h7ckiLAu+J?=
 =?us-ascii?Q?2W4ate59J6RyYtyeMLrEN3/7mVsQMT1Dt89HJaXsAxTA3WSYxujPkfF3+tHS?=
 =?us-ascii?Q?9KmUo95pZjbCCd7Ylmv2F0T/fDDEP5aP3teGbOP4XpOKmR6EEdkVaC+SdvgP?=
 =?us-ascii?Q?EkZzNa7/vAmUrkkTHHfcoGa9Wt7BzS5F49e0LRW+4jaUED1q8svrjRYPQ2iw?=
 =?us-ascii?Q?7Rbp0WZEfk7y84zn9i7IGHFJmJAL5MDjxwac79aa/ejFxQsFxwloLmG5qQ9V?=
 =?us-ascii?Q?h48Iqe4JrzOLEoI/FsF9XV7Zpo8ZVmilzbY1JioeCKPUdhR6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O9FOf41kLQpppnDiUPM07gYqMAaFHIVipBmTk/zkte0qVKw4cMFxERjgd8oxQfcLqurxurn0LLM5x20ATqw2XkUOYsegKwEoy5cNmtI8/AOTXSIk3jjpm1Kz1FD+FFoC+Fq9hHlQP/X1V5SYLZ0abcLMOOvkJ2Yc3MADZPLRABGG/NzQJHzAQXt3UCXKwXUCMTtzQTHVYMjkKiczNI9gVIJeFVgioxzppK89UNMdjh/d4M1o1+Ev6vouXxxAFtS2wU/EecxHfCM+JBm57elZoKM8HDEP/cV6ye3NzBcCtJhz6EmLL8Tclrzg2Dn8jjn1fcjYRmhAFJ0JbMHqWVX52w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b0eb47-84c8-410a-10d2-08ded1a1a2a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 03:35:28.1048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcLU5242WArpoD0Ay2lggz1F2HRjL0RLYWlPOhNbS/ue/c2EQQmXYCXResN8JWiBN3EY8Ixb/LumtJoSvpLgyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Friday, June 19, 2026 9:49 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; B, Jeevan <jeevan.b@intel.com>; Reddy
> Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v3] tests/kms_rotation_crc: concurrent cursor
> movement with rotation
>=20
> Add a new subtest to validate primary plane rotation 180 degree while mov=
ing
> the cursor across the screen.
>=20
> Use a triangular pattern fb which is easy to identify rotations on the pl=
ane. Use
> CRCs to verify the plane rotation with cursor movement doesn't cause arti=
facts
> on screen.
>=20
> v2: Remove hardcoded cursor dimensions, rename variables. (Jeevan)
>=20
> v3: Make test dynamic per output/pipe and cover all valid CRTC/output pai=
rs.
> Drop unused parameter in paint traingle (Jeevan)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_rotation_crc.c | 204
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
>=20
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
> 4a249ed21..a01aac78f 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -68,6 +68,13 @@
>   * Description: This test intends to check for fence leaks exhaustively
>   */
>=20
> +/**
> + * SUBTEST: rotation-with-cursor-movement
> + * Description: This test draws a simple triangle on the primary plane, =
rotates
> the
> + *              plane by 180 degrees, and then moves a cursor through di=
fferent
> + *              screen positions.
> + */
> +
>  /**
>   * SUBTEST: primary-%s-tiled-reflect-x-%d
>   * Description: Test for %arg[1] & %arg[2] degree rotation on primary pl=
ane
> @@ -118,6 +125,7 @@  #define MAX_TESTED_MODES 8  #define
> MULTIPLANE_REFERENCE 0  #define MULTIPLANE_ROTATED 1
> +#define CURSOR_EDGE_SET 16
>=20
>  struct p_struct {
>  	igt_plane_t *plane;
> @@ -274,6 +282,80 @@ paint_squares(data_t *data, igt_rotation_t rotation,
>  	igt_put_cairo_ctx(cr);
>  }
>=20
> +static void paint_triangle(data_t *data, igt_rotation_t rotation,
> +			   struct igt_fb *fb)
> +{
> +	cairo_t *cr;
> +	unsigned int w =3D fb->width;
> +	unsigned int h =3D fb->height;
> +	rgb_color_t color;
> +	int i;
> +	bool rotate_180 =3D (rotation & IGT_ROTATION_180);
> +
> +	cr =3D igt_get_cairo_ctx(data->gfx_fd, fb);
> +	set_color(&color, 0.0f, 0.0f, 0.0f);
> +	igt_paint_color(cr, 0, 0, w, h, RGB_COLOR(color));
> +
> +	/* Build a simple upward triangle using horizontal strips. */
> +	for (i =3D 0; i < 9; i++) {
> +		int strip_h =3D h / 14;
> +		int y =3D h / 8 + i * strip_h;
> +		int strip_w =3D (i + 1) * w / 14;
> +		int x =3D w / 2 - strip_w / 2;
> +
> +		if (rotate_180) {
> +			x =3D (int)w - (x + strip_w);
> +			y =3D (int)h - (y + strip_h);
> +		}
> +
> +		set_color(&color, 1.0f, 0.0f, 0.0f);
> +		igt_paint_color(cr, x, y,
> +				strip_w, strip_h,
> +				RGB_COLOR(color));
> +	}
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void collect_current_crc(data_t *data, igt_crc_t *crc) {
> +	if (is_amdgpu_device(data->gfx_fd))
> +		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
> +	else
> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc, crc);
> +}
> +
> +struct cur_data {
> +	int x;
> +	int y;
> +};
> +
> +static void set_cursor_positions(const drmModeModeInfo *mode,
> +				 const struct igt_fb *cursor_fb,
> +				 struct cur_data positions[5])
> +{
> +	int cw =3D cursor_fb->width;
> +	int ch =3D cursor_fb->height;
> +	int x_min =3D CURSOR_EDGE_SET;
> +	int y_min =3D CURSOR_EDGE_SET;
> +	int x_max =3D mode->hdisplay - cw - CURSOR_EDGE_SET;
> +	int y_max =3D mode->vdisplay - ch - CURSOR_EDGE_SET;
> +
> +	x_max =3D max(x_max, x_min);
> +	y_max =3D max(y_max, y_min);
> +
> +	positions[0].x =3D x_min;
> +	positions[0].y =3D y_min;
> +	positions[1].x =3D x_max;
> +	positions[1].y =3D y_min;
> +	positions[2].x =3D x_min;
> +	positions[2].y =3D y_max;
> +	positions[3].x =3D x_max;
> +	positions[3].y =3D y_max;
> +	positions[4].x =3D (mode->hdisplay - cw) / 2;
> +	positions[4].y =3D (mode->vdisplay - ch) / 2; }
> +
>  static void remove_fbs(data_t *data)
>  {
>  	igt_remove_fb(data->gfx_fd, &data->fb); @@ -1159,6 +1241,115
> @@ static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_=
t
> *crtc,
>  		igt_remove_fb(fd, &fb[i]);
>  }
>=20
> +static int test_rotation_with_cursor_movement(data_t *data, igt_crtc_t
> +*crtc) {
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output;
> +	int tested =3D 0;
> +	int i;
> +
> +	igt_display_require_output(display);
> +	igt_require(display->has_cursor_plane);
> +
> +	for_each_valid_output_on_crtc(display, crtc, output) {
> +		igt_plane_t *primary, *cursor;
> +		struct igt_fb ref_fb, hw_fb, cursor_fb;
> +		drmModeModeInfo *mode;
> +		igt_crc_t ref_crc, hw_crc_atomic, hw_crc_sequential;
> +		struct cur_data cur_positions[5] =3D {};
> +		uint64_t cur_w, cur_h;
> +
> +		mode =3D igt_output_get_mode(output);
> +		igt_assert_f(mode, "Failed to get mode for output %s\n",
> +igt_output_name(output));
> +
> +		igt_display_reset(display);
> +		igt_output_set_crtc(output, crtc);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +		cursor =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_CURSOR);
> +
> +		if (!igt_plane_has_prop(primary, IGT_PLANE_ROTATION) ||
> +		    !igt_plane_has_rotation(primary, IGT_ROTATION_180))
> +			continue;
> +
> +		tested++;
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(output)) {
> +			prepare_crtc(data, output, crtc, primary, true);
> +
> +			igt_create_fb(data->gfx_fd, mode->hdisplay, mode-
> >vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, &ref_fb);
> +			paint_triangle(data, IGT_ROTATION_180, &ref_fb);
> +
> +			igt_create_fb(data->gfx_fd, mode->hdisplay, mode-
> >vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, &hw_fb);
> +			paint_triangle(data, IGT_ROTATION_0, &hw_fb);
> +
> +			do_or_die(drmGetCap(display->drm_fd,
> DRM_CAP_CURSOR_WIDTH, &cur_w));
> +			do_or_die(drmGetCap(display->drm_fd,
> DRM_CAP_CURSOR_HEIGHT,
> +&cur_h));
> +
> +			igt_skip_on(cur_w <=3D 64 && cur_h <=3D 64);
> +			igt_create_color_fb(data->gfx_fd, cur_w, cur_h,
> +					    DRM_FORMAT_ARGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +					    1.0, 1.0, 1.0, &cursor_fb);
> +
> +			set_cursor_positions(mode, &cursor_fb,
> cur_positions);
> +
> +			for (i =3D 0; i < ARRAY_SIZE(cur_positions); i++) {
> +				int x =3D cur_positions[i].x;
> +				int y =3D cur_positions[i].y;
> +
> +				/* Reference: SW-rotated triangle, no HW
> rotation. */
> +				igt_plane_set_fb(primary, &ref_fb);
> +				igt_plane_set_rotation(primary,
> IGT_ROTATION_0);
> +				igt_plane_set_fb(cursor, &cursor_fb);
> +				igt_plane_set_position(cursor, x, y);
> +				igt_display_commit2(display,
> COMMIT_ATOMIC);
> +				collect_current_crc(data, &ref_crc);
> +
> +				/* HW path: unrotated triangle with HW 180
> rotation. */
> +				igt_plane_set_fb(primary, &hw_fb);
> +				igt_plane_set_rotation(primary,
> IGT_ROTATION_180);
> +				igt_plane_set_fb(cursor, &cursor_fb);
> +				igt_plane_set_position(cursor, x, y);
> +				igt_display_commit2(display,
> COMMIT_ATOMIC);
> +				collect_current_crc(data, &hw_crc_atomic);
> +				igt_assert_crc_equal(&ref_crc,
> &hw_crc_atomic);
> +
> +				/*
> +				 * move cursor first with no rotation, then
> +				 * enable primary rotation while cursor
> remains active.
> +				 */
> +				igt_plane_set_fb(primary, &hw_fb);
> +				igt_plane_set_rotation(primary,
> IGT_ROTATION_0);
> +				igt_plane_set_fb(cursor, &cursor_fb);
> +				igt_plane_set_position(cursor, x, y);
> +				igt_display_commit2(display,
> COMMIT_ATOMIC);
> +
> +				igt_plane_set_rotation(primary,
> IGT_ROTATION_180);
> +				igt_display_commit2(display,
> COMMIT_ATOMIC);
> +				collect_current_crc(data,
> &hw_crc_sequential);
> +				igt_assert_crc_equal(&ref_crc,
> &hw_crc_sequential);
> +
> +				igt_assert_crc_equal(&hw_crc_atomic,
> &hw_crc_sequential);
> +			}
> +
> +			igt_plane_set_fb(cursor, NULL);
> +			igt_plane_set_fb(primary, NULL);
> +			igt_plane_set_rotation(primary, IGT_ROTATION_0);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			igt_remove_fb(data->gfx_fd, &cursor_fb);
> +			igt_remove_fb(data->gfx_fd, &ref_fb);
> +			igt_remove_fb(data->gfx_fd, &hw_fb);
> +			cleanup_crtc(data);
> +		}
> +	}
> +
> +	return tested;
> +}
> +
>  static const char *plane_test_str(unsigned plane)  {
>  	switch (plane) {
> @@ -1358,6 +1549,19 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		test_multi_plane_rotation(&data, crtc);
>  	}
>=20
> +	igt_describe("Rotation test on primary plane with concurrent cursor
> movement");
> +	igt_subtest_with_dynamic("rotation-with-cursor-movement") {
> +		igt_crtc_t *crtc;
> +		int tested =3D 0;
> +
> +		for_each_crtc(&data.display, crtc) {
> +			cleanup_crtc(&data);
> +			tested +=3D
> test_rotation_with_cursor_movement(&data, crtc);
> +		}
> +
> +		igt_skip_on_f(!tested, "No connected output can be tested on
> any CRTC.\n");
> +	}
> +
>  	/*
>  	 * exhaust-fences should be last test, if it fails we may OOM in
>  	 * the following subtests otherwise.
> --
> 2.34.1

