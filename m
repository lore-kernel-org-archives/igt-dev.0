Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67258E9DE62
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 08:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EFD10E761;
	Thu,  9 Apr 2026 08:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfixVuYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7A710E763
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775722044; x=1807258044;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PKz5oN7onaWeMUdTU8sSdzFpq2IpPHA78AMTttTo+Sg=;
 b=jfixVuYod7UnXFXot9NifftMgtpz8+gGnfJB1/+U6xv0qAU4LVcDRimi
 6rgks4pnblRLIUdWqNksLTieTdQtNM9xtz4xs06BoHa7uPDDWAE3R4aiz
 eqQBI1BSA49Cz3LVpOnnDq3GCdTob1YCMkX4b/Io7dCy4S+BDnw9ti2PI
 7xNT3rpGOCbtWI7T7S2QLLZPMGLb1whjeytZPIZAzDtjRsqKE7raqGsNl
 5SQMUUuetAu9+R/VwtOHPcF697GMBa6ctzJHyWY4uX9TmLYnNXMQBcdvV
 Ba2vqH6MpEc8z3vhbXjI9NGYOekywmDD7WWTDm902C1HYLYfkytbiGv9v Q==;
X-CSE-ConnectionGUID: 95HsyyZ8TC6/vuWAYCaxlA==
X-CSE-MsgGUID: wFxKG30QTDqbXGc9k3aJCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75757881"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="75757881"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 01:07:23 -0700
X-CSE-ConnectionGUID: sxc1KPYlTRSfwN1MfhWe7g==
X-CSE-MsgGUID: M6TvvS0vS0OAcOrb3HdJ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="228941618"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 01:07:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 01:07:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 01:07:22 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 01:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMQaMWBKaVrt7rliygCXcy0DA+rkx2o7dogDfMizQKOlbcHjm6og20ytJ4b/ISpp6LZun4tqd7vwpZaCwlG48uJmoOcCMD6JlCQhQWWi1kwua9qnqFMY91ddriVBtbgxe5g+4fI2ymja7ybTyI3fNU7xVeQbDCwiabyZYg/sjdPhiLs2qReBcxy4x/rWGoNRzGGS1DvbZUaTm7jla6ITE19od8vYt19H+IyZ1+uGZOI5J1jwMQluKRcGXXyuQlICrBib9V2S4uvmvZqOEAYkQDC7YR/l+3MGlCqdF5+AQIo24iWHTPEe7Jyznxn+dVKwXAF/xMKipTryJqWYoD2Big==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuXmK3lDrdu4J6qN5Ht61wBuRnxMHFRtdeR8/SiCmoU=;
 b=U6PYi50hidgfOg2x66uTI5xvqtKwRAv95LmXlXIJStPnn+SwGO8ImbtgdpvXblJqy7SnbOM+ugBGBkPxZv5TRl0/2EmqEkKYXvDNBhj8SJpPfYDku6FRIdAdYpmDpm25brKSsNIfp8L4/GyS8UcxgRCJw9DFdV/LCih5tXtJ3G5XB4js+ukYmo9DmkWRDYJCFzP9/e9vzuVMeRW8WXbC/XN6g7zg91WaPKkG6FPHSnEcBrw4rnELZXAJUOcOcDPFV5O46zOIzduLuKxS2RauUOyylIufwg6vovBCeMXbVqQ9kTEFHaFOMIyY0bBVjz4+FFYBtbxYmyEf2a5bItPaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB8158.namprd11.prod.outlook.com
 (2603:10b6:8:18b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 08:06:17 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 08:06:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
Subject: RE: [PATCH] tests/kms_writeback: fix coding style issues
Thread-Topic: [PATCH] tests/kms_writeback: fix coding style issues
Thread-Index: AQHcx6vurYXNBSXuukSnlw47bkjz9bXWX/xw
Date: Thu, 9 Apr 2026 08:06:17 +0000
Message-ID: <DM3PPF208195D8D0FEB3A265EA65CF1332BE3582@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260408230245.442843-1-alex.hung@amd.com>
In-Reply-To: <20260408230245.442843-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB8158:EE_
x-ms-office365-filtering-correlation-id: 4a2d7792-74ee-4381-7586-08de960ee058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: gJGadIF8NusnKVd0xnA+DKVJC44qNSyR93ZAA0igcqA4jHvJvX9c3T2ShJ3vWzt76nwJxZECQiNbERimw34Svg/pBq8hW5jdHpe5EZY7kQ/J/Q/16hc26hqt/OtdigFCbO9N6+v7lyWvny4XTM220nVIp/Opsk07AQRbxCfiq+QDkvU4cV2aMG/3TE5uFuJON5yF0VV2ucGImB+fO66figg25ri1vmF3eG4c53+9Kl/HWuIMeiHxCeXftSiR3mrxOdlcLfMaKvonCh/HEhXA0BOaqxcqbSwJfrn8noWNhtJmQdTESecoIuLRztBvgiYFkjAfo4kYJZdepLn0aTFVHDENdyZXCqvi0y14ZmrFzjHcMa+TavAlV8JrgjYxNYoqjJfpKEU1+2M3ILymTys9rXfq7c6Cza1bfPvEgP9rH3w9UJhQiSqUB0hlT9iYQ+XjDLdq4D4tr3AeK8YZign9JrEu3jkpK0XszZMbADxWddzQ7Z7So43xGY2oVrO2E+j2VU+JDKfj742ENixyi6dUhHMeYiIsAAH3LsntkKj3k7tyvFx0Peh6nKDsnYY6Cw/YFW/t6G2oyI3Fe96oKvKyR5Y94cNQ7f9BBn+3w1cTdNsnqg2Ba7IFGtkOkMJK9tubNWugwphHcEUp6t5dD+xKkDNfXf9CBeLTVrTCQyG4M1tSrYV/JviErWTcBrwbnkfI8SeNocPPqtIfjPAo5dx2o18eP4839c+20zZMzzPqbBSyHrl25l5tWMpAKZkp2RRanhSWz2Zseamwt9KXO3Zr9k+f/DBOPsBjzGdke7MhAyM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZR2pNBAf8IxB5HmsDuhqPApIeuMmqs4pU38Hdn+qlmXfs0dz9kIFGASocUzk?=
 =?us-ascii?Q?4Se5gwB0NaehKyxE5EniMzrVYGd2smfAq02TUa9C9+8WK6VhtNgVN3T69TJd?=
 =?us-ascii?Q?2tXqkNr/8k9Ysje4JKZqQBYvEk4GOaA4E0b3HKeDuGkYkiJ6u0ifIAsmydts?=
 =?us-ascii?Q?8IX+7xpagxtnEafavZy+LPC+nHNUkgpfFZMXBMIMAQHvNH95nNlt3UA4qtWJ?=
 =?us-ascii?Q?bj8tNqSqm5Ug7AWxc/Pv3A/tdULVMwWISnBW7M/hReeFuTemxvQsNzEMw34w?=
 =?us-ascii?Q?IkeX7GKw6AIIWx9IptTV6p4vY+kHjqKXzjJqMSr8JavbJPsVe90LZGBcOm4v?=
 =?us-ascii?Q?TKyaSW+CPp8wyQkO5Yb/zbiICQeS3KEzdIjsTTrF1zCBfm2X4/FLrXdYMTOI?=
 =?us-ascii?Q?uNLPSJwpB56h2hQpUCogFwE4MCWvRsy5BcvU4Q2P77pTP8LDxOK70o+GnJjm?=
 =?us-ascii?Q?LStV9KRZWsZQl2dXm0LPrb8HwvtmDXxkx42F5m5Xol1+mNdmei6gD7J3Kdbj?=
 =?us-ascii?Q?jkHUGpmkdF5Z/7qVDmNSGoAD6/UUkKwkcnDM/IXLn/G490o8rRLumq8DNEUg?=
 =?us-ascii?Q?uTW/yxa1l0yJN2TbTyfEeJauorXX15sxMZXooF1plg8eCKemAWh8BHV6FqYg?=
 =?us-ascii?Q?3wjzEen/IgI5+1qqcZoOqQq1vydB0gze15dyPOxjMPsnc/ISngP0yuj7+Zd2?=
 =?us-ascii?Q?PPAOhar5Ag0oi214a8uxwZ2DkfdX7yxD2aqj4yC/X9Iw/T3j3toV95nF319j?=
 =?us-ascii?Q?sD+iggjChTvSyzMb8Ht4H5ZN++Yk/9uVImTp5hzrZqVoK9RAep7GFFCfsDBZ?=
 =?us-ascii?Q?0sODhWvqInxknTca9qb+S0BpepB9iOFbValMwkA0+vwOyrszpawwlbxJyNjN?=
 =?us-ascii?Q?jk6flEXJKRB0S/2vVmbiIvUIq0J1AqQC0wiCGVsoAxATcsievn7OlrwyYjBh?=
 =?us-ascii?Q?E2ppElFYEC2HEpCXxk2EkTdxy00qNz8vByfe91eu+D6nJiKjLoVT1OCYsFSd?=
 =?us-ascii?Q?s05fjJops3ZGFd68E+z+IHGwPmS2mAuVYQBOP45k1tTRS5g9RUKn39H6TeBS?=
 =?us-ascii?Q?BWH2eZH0WczNWAnS1gfQIwr+Ql+8cv9r+2rJm5MUTFtRUImA3hQukReDk1ti?=
 =?us-ascii?Q?pzb+utp9fMAmblqkPTPlww8Yv8T1OKEKiWBz4y5OGFDcqruCTK98yU8uMM26?=
 =?us-ascii?Q?qzsN96SGoiaMnDC3hcRsSoHXoBtqQol/BKUJZJvzNCljHpSWacUS745pngDy?=
 =?us-ascii?Q?ATp8UapFSIBKilyjZhKPhBDGUhpw67OjX+MPcyly1PpfKASK7RO+u6Vt6jV1?=
 =?us-ascii?Q?b6SJjItjDD+XIs0ILWniSgYB0QnTZgogpQmtq3qZomVK522/Et3c/rwMKQBD?=
 =?us-ascii?Q?2HwkWVcyPwshkNtx26z17a9R+iJ1xbtI0yWijSNee+DgmGWPcpkjiQl/zaGf?=
 =?us-ascii?Q?kEPoWQPIMKzzjI/6hiJyXjmjWKjaidWFmr3wEzdf5dkHHWfZGbT2y/2UotPu?=
 =?us-ascii?Q?5beGGsWE4MM85LtlirdSsHSmlqtxKLsicI3pLs7+hLdtNaCLpCDiG5tBbWMG?=
 =?us-ascii?Q?E9rCPkOYVUqrTuomqWNinD/N3PmQPXUSG3335qfvDe1y8ap8TyroITYDqGfy?=
 =?us-ascii?Q?bAtcm2r8ZAPvdOKchR13Y1I2yESbrZ1TIiAQLcMFIg/tNILNybGrazWFp5lz?=
 =?us-ascii?Q?owAW9E5BPytRdlesPjN8UDE6nAotjTnuSn7Bo6BBlaXNjctN1DmpaU8+nu/H?=
 =?us-ascii?Q?cek+Xf0LeA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZcLMpetW2Ujz0zzztVX6cQP5M+SuOzFLhquyzHxEZ8GOMXwSo6EWFps8y2gwOk+0kAzzm2lmOpFJxNnFgXraTqCjbNQe3Nd+AIuomu7CiQ97FgXBZtwHOiNMef9T3PJb2swJqYC+ebwSXjFfA2w08O//33ndcRjZQKK6MUptnc1A35y3lJR5VYLfNEhJJe2RQouH2RvSCgrQo8U0Pa/2mo3RTERlpXj1QGm79ZlGwuUmaH7gGa4mLgWAzgUQKrf3fb2HJ49VjOBEFrlQb73pihRxidr6LaKUE3LJagzySTjjdoYXOKoyPdyQbEDpR1b9MhYG3aVnZY8d1IGnj8JFhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2d7792-74ee-4381-7586-08de960ee058
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 08:06:17.0399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBlxyoiOMvzX287xCTqBwwTyD5g7oELUKjw2KzK/gQpj+sChIR1IhHUAhq7XU+X/cp3l+0vR3gzciYOlFaWlhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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

> Subject: [PATCH] tests/kms_writeback: fix coding style issues
>=20
> Fix missing spaces after comma in two igt_skip_on_f() calls and in the
> writeback-invalid-parameters subtest description strings.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_writeback.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> f15abba96..5031fcb83 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -58,8 +58,8 @@
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
>   * SUBTEST: writeback-invalid-parameters
> - * Description: Writeback has a couple of parameters linked together(out=
put
> - *              framebuffer and fence); this test goes throughthe combin=
ation
> + * Description: Writeback has a couple of parameters linked together (ou=
tput
> + *              framebuffer and fence); this test goes through the combi=
nation
>   *              of possible bad options
>   *
>   * SUBTEST: writeback-pixel-formats
> @@ -620,8 +620,8 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		drmModeFreePropertyBlob(formats_blob);
>  	}
>=20
> -	igt_describe("Writeback has a couple of parameters linked together"
> -		     "(output framebuffer and fence); this test goes through"
> +	igt_describe("Writeback has a couple of parameters linked together "
> +		     "(output framebuffer and fence); this test goes through "
>  		     "the combination of possible bad options");
>  	igt_subtest("writeback-invalid-parameters") {
>  		igt_fb_t invalid_output_fb;
> @@ -644,7 +644,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		igt_fb_t output_fb;
>=20
>  		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> +		igt_skip_on_f(!(data.supported_colors & XRGB8888),
> +"DRM_FORMAT_XRGB8888 is unsupported\n");
>  		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
>  				      DRM_FORMAT_XRGB8888,
>  				      DRM_FORMAT_MOD_LINEAR,
> @@ -678,7 +678,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		igt_fb_t output_fb;
>=20
>  		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> +		igt_skip_on_f(!(data.supported_colors & XRGB8888),
> +"DRM_FORMAT_XRGB8888 is unsupported\n");
>  		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
>  				      DRM_FORMAT_XRGB8888,
>  				      igt_fb_mod_to_tiling(0),
> --
> 2.43.0

