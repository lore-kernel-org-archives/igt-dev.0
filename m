Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F77C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 07:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6294610E48C;
	Wed, 31 Jul 2024 07:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fv9TFrl7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD63F10E483
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 07:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722411010; x=1753947010;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zpZsN9m+A3tSiiHvtp7Q+r4DT8YCF5/7coyJpU4IrM0=;
 b=Fv9TFrl75IYD19p0I+oz7Y6w11VG3TFtvUv14OSC3tCpAUhd3KuSp080
 41hgIF+EHxM9IwJHFbtIrKoLPDROwT1auBcDhQhIIkib6DhCvgl69SvYD
 iSQNlC/9/3F3YhTjmyfJZyQRBTvarkVGGdlxpv0K+r1OaFFZxo8/o2tcm
 ieN19cr08M33TJviuF/CA0y7VFvo1ou5tyX2lBY8MgULwe4owBllSVv7Y
 W9IIpeFjFhvMYQl8PCFFhsXTcs0UBF0DwYhFFIRL4AxEfxAIK95yKHqCH
 YQB2cjZ0hqV05M7X2LBVdJWPm3tynFmVE9AF0yK6+0CieUiCKojHQev2k g==;
X-CSE-ConnectionGUID: Jwvn81CGSmSq/dr1O7b81w==
X-CSE-MsgGUID: 2ER/8enkQHyTSLJKwMDlbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37743618"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="37743618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 00:30:10 -0700
X-CSE-ConnectionGUID: 5GhzQF+zTRucxW79DdNRwg==
X-CSE-MsgGUID: /uSzt3KqQfCUHhGvHV1C9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="85526074"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 00:30:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 00:30:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 00:30:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 00:30:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 00:30:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPTlnA3/OL9Me24/MzqVV/e93HpxgA9/+dXgQM+iz3jiDO6d01gBxAWvjcRx3f+oSXbmE6WxCSnWeApX83fT3F6wAE4WpiHXpoAdzZa/Is2LNGr4bfEWrVIvKf3bRI9lCfzs1lI4KzWnWKToHL4rQNwGIgfOlyeHxDOf+9fM1Ea+iuq8gvS/FF/uueSK3mvTmWf79kjyrDuy+osoUb9dqns3d52j5bpesniofIh5e63toe1sJ0lhVGZwCxPpltNJO7wbr4/bQs1oY+gwPruFYPYDWGZ4ZpVxoV5dtfenKgKEc3Sxpl6UTjM/E26t//ElfgCr+6xWWyKQ3b+ZH88hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klq2zaKMPywcs/GR81hkEiJ3VGRBT/f2NtwiQfjXhs8=;
 b=GE7K20XZwHpz9L90jAPk1xKcud7VrJcfQEILfbnAdEA7h5HDW9UT2oYQt+zs4MNatdxZSkUXyfG579aQY+KK2d53Zu9aUwqfGGJ4ZcvQsvqY/cLkz+92yUGiqlIvf6VfFVF3VfQIZesyeKggk1N1L6dkNYc5qyKpHemjJ4+oUGAFW8TvEkVkc1mN+Zq3RissmKYw1aMAspm8M6wKObSY/3GKJ4vNbcLxBHWTUqZyFf0zuJL/H0I6B0yBCowasbKyyDmTl/gH4w3E/w1JN8Kc/bQLfOooi4iCectf+cvpkY2DE4S+MmRTFcUYOZduZFrhjDH0b/2Un15ltmSA/bFvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Wed, 31 Jul 2024 07:30:06 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 07:30:06 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t] tests/intel-ci/xe: Block kms_rmfb@close-fd test
Thread-Topic: [i-g-t] tests/intel-ci/xe: Block kms_rmfb@close-fd test
Thread-Index: AQHa4xJWd+xJq8Q62EiO+N6d93fzX7IQcGxw
Date: Wed, 31 Jul 2024 07:30:06 +0000
Message-ID: <DM4PR11MB63121C27365C33B68F22585190B12@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240731061512.1954095-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240731061512.1954095-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW3PR11MB4555:EE_
x-ms-office365-filtering-correlation-id: 5a82fbab-3cb9-41c7-a85a-08dcb132997b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?u/gEA8NYZfldS6KWBa7siw8UZj9j+vV58tuh0U8lwJ0pe1Fy4GdXS9R/ZLx4?=
 =?us-ascii?Q?GtGZSROE2rtq0gQ6TOLXgCKVw+Q1205nYpaMzZ2vPTPJSPvx++P95RcLofLo?=
 =?us-ascii?Q?x7mctoZGAwy6n+mQx1lapjYz3ZotUqzR8LhrMgWmYyT90GLR8rABafeG2ysf?=
 =?us-ascii?Q?W4zNcAGg7EbgIpNOLBRM3SrhSw8PLz01G8xyu4F7Lxn6qoiCerndBwRROVhD?=
 =?us-ascii?Q?rrB4Ch6rAlu6CDChdZ+KzlnxGWsmxTUL5QK7YDsAU6hhSUFFT/fjapfndoq+?=
 =?us-ascii?Q?jNpUTDg2pg+TPYvNPCJfAea3VeMWk7tU9iZAqX86HmmyYqnZQBtj+GQpvN8l?=
 =?us-ascii?Q?rPFt4h4KRwe4N0viqM7fV1Q4GLPpWk+mawICKiixD0/ZOYYEd+bg2+9tThN1?=
 =?us-ascii?Q?XmxppaJBIMtmsCyxHW1gCEqeKiIpbBmrOGKtZ4eDp9DpkSHazFmArH90ig60?=
 =?us-ascii?Q?aRMQ0wY4LKbmxwv5R7xIKqvyMfPoTav2dEAtxwsdgJiSdGciVSFVDPXjS1e0?=
 =?us-ascii?Q?EbNnPtEoiU54zFPknE8SDKeHe5I+2jR1sjI3grBup/CrYkxY1iDptObYszH7?=
 =?us-ascii?Q?wDSg2OgJGtUbZcITa8wgjG3BALqcDI3DuOzxgsXHehxYGJB5sLES/v6PZX8o?=
 =?us-ascii?Q?W5sJQML3r+2fk1RzAKk6cojSUJnu/IKDNYx+9/7o1hdn/CWhD3H9gv3Mlroc?=
 =?us-ascii?Q?g5+kHBGSsAt3PXNqnPhro3+ePtOF7iNDqqymJfeB4IWNdo6BakqpP8mD0G7p?=
 =?us-ascii?Q?Oorf7Jznucj+WibihlIyjn3D9Cusd7ffzZj2CSS0PopEydupdqJK52AHdOb3?=
 =?us-ascii?Q?Z+fU9juYj491fPWfncs32ZGKOkZjCkFqRkOwx5hc/ay+WgeA6bZsog6dxtYP?=
 =?us-ascii?Q?Blc5ySslLwpz4pj0ULlmGksHTH+kMuL6oGdOBvB8pq0+ItFsi9FePk5m2SxN?=
 =?us-ascii?Q?TJsSZ+0ZV387W4UHkN6thl6NpyubHBkt3678xUlVMjmItUmP+2piMSLiiKJa?=
 =?us-ascii?Q?RuwlpfP88xl3eHAPPM+4ne4yO+dCQGaNjsvBue2KFiDZKPhIbgcaT7+iQD/V?=
 =?us-ascii?Q?vZXglomYxO8iDA0WrQD54Dq4ll0uHEuGjUcP5eUvOuWPpNWlbmK3F1G5Zxqd?=
 =?us-ascii?Q?B3ZNWOiw/IkdRpoEhhtAgtiFiJ4h9pcD34+sG3Gg3lUO5iOxpMxXFOIfmWTQ?=
 =?us-ascii?Q?e5wdMkIaC7J0shP4+GnnCQCKy20zjUwdAWJ2f7aLOBzJrP9OzZvjA3hPKTCr?=
 =?us-ascii?Q?nneTfBmpJL2eUvLdNP+WeTvc2Z8mFVmfwsi09G/b133z47fN0mGiLLLHWVNq?=
 =?us-ascii?Q?nAAju4e4kxYRCH+enfLSCU2hdq4Ai7EVSDE4bEqi6VDdCK3xgUEnjjxoAjQc?=
 =?us-ascii?Q?F1DBYyg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zvSS0Ae+K8vB85ZPek2Wf9KR/b1e8IxJPGDKKRaq7xuCD7acCJzmWbcuRiLc?=
 =?us-ascii?Q?oNvvZvCSFrf3oXrSlzK7yTKXHDfSNaY43rQe+SUZzI68IlAcA92TE9STV8fy?=
 =?us-ascii?Q?XLcVP4qNROCy2iZfCOBVYDzFDrMPPNmInoLV5FPcaPksoawUajUjpF40OuGU?=
 =?us-ascii?Q?L8/b2OcPymBBCJfmZP4nDJtnaIC8Gzzj1sXlCvS8LQvDqvPLIw1NpC7f2Tjp?=
 =?us-ascii?Q?Hcsj3rnohcU4XtQXAEAv+vB6QWvCFHT/QYJq/PnjAoepAjHywvh9kfRcNSU4?=
 =?us-ascii?Q?8w981yJmP7k1gUWB8dFBUY1Nc0J17Ewqht2QeGFRqzFGYCesSPU/WSrOsbKS?=
 =?us-ascii?Q?P6+cZHTaVrm5YDYaqoY5TVHHz7K4VChC02/1AeM8TlFGxaKV6SklgSRip4Dy?=
 =?us-ascii?Q?kxDgNEheB+kLEnGeY2m213eQbAfPCTy8wiVAr3Hb6OuA4VWbP9uWXHQxZVC+?=
 =?us-ascii?Q?xoQirGR1ir6foR5CqOVXklQWLbJy1M5Lcm3uKfE8OOX2IR+I+gS9zozMBysj?=
 =?us-ascii?Q?rF0Ol9ONY0GnG9jV/xTvH+zlyUkhZNUIY1bmU8j7ztET2eamgohPiTuKwqYV?=
 =?us-ascii?Q?IWLkPei5TauLKYATpLAeA+x1+p81pWM9u2Qh+93dpMgv/HTkHY7eKmBxSp46?=
 =?us-ascii?Q?1WtlFqxpdhGFHiGR76ydZT1arL3yAhHJX1P5hRFS3xMBS8WaIxAknEfuRXRU?=
 =?us-ascii?Q?MZV4HOAcPCyCPMjCdnpKtxmauFf/PewIlE0zlhV7ugQZLx6HBFwYp8gPXo+U?=
 =?us-ascii?Q?6/a6guqngeerA+f8w2Ca0zSEGCaRP5X3Vsn7Miggw27t1KwirJyhuEuNJrnd?=
 =?us-ascii?Q?YQctBgBpIfalWebxxpiZbQuH4PXy9EjqYE2q1k40YXv+A/zTbkj6cgF8Iq5h?=
 =?us-ascii?Q?2zDrQDk702Ik7Tc2t42xzFT8qXO+nl0E97Ya8zETk6kYCwuRh7tBL4Soiihb?=
 =?us-ascii?Q?ckhlyE+5mHQW2cATGeO6ZnD6pg8s5rlgyGALuO5kLedFSH2rPfrPcx36Rwyb?=
 =?us-ascii?Q?tj4cup1+6cnmX3pa40DpGPU6919kIMXvXw9S4TYIbIQ80MZLdbnYSnJmFLPO?=
 =?us-ascii?Q?1TBRLcTBg4CKk4JvRyVW7QQt72qXPw85lscxL5mg+tTOAWIcgfDm8j09NVd0?=
 =?us-ascii?Q?V/cZZ3HYmCbycUKMoPBtUlVkcyGOYs94T4bnsTN750HnZheD00906WVCk/Cq?=
 =?us-ascii?Q?LTCmTVWnxXwCKX/Rpog6qZgZ1bsPt1yTbrf5P069rrhzNNoCEVGdhzYP1RYf?=
 =?us-ascii?Q?Z6VTuYKwkQmGFd9sxzbRf41ijqeMbH3+L15w+aoPraeYvWtmmSCNtAQrqive?=
 =?us-ascii?Q?qoEOvgIKiI7AvtXEie32eD6h6HtsrmYxO+pSwv6WwofNlepM/PyrwhiY8xMF?=
 =?us-ascii?Q?ilx4+bTiU6o4sr7yVXXQ7Gi9QGI2nN3c9KybmvJ7kziD01Yk6OeFP0Orbbx5?=
 =?us-ascii?Q?+73Ui0mz1YQZc0DcNiXX0C5nTMfyysmg0sa5g6sI6r5qvbPBNZSVzpOGiaV/?=
 =?us-ascii?Q?0edogSRO54annR/5dil8jKoCX3Hh8tjtjJDWwXB5xUox5+e4xRiW0HCxJfGp?=
 =?us-ascii?Q?cKwLlIc/yEW/M1jocYs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a82fbab-3cb9-41c7-a85a-08dcb132997b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 07:30:06.0731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfkgIkYS8jh1fNG/Vp1VQwTxvb1MPIMuPSVqSWaa8EpxQwKZhKWN0NnMV3/JA4cW6iZirD9QEHpKO+h/wmZhNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
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

LGTM=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Wednesday, July 31, 2024 11:45 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t] tests/intel-ci/xe: Block kms_rmfb@close-fd test
>=20
> Upon reopening the driver, the 'kms_rmfb@close-fd' test expects that 'get=
crtc'
> should return an FB ID of 0. However, due to the default modeset, 'getcrt=
c'
> always returns a non-zero FB ID, which is expected behavior.
>=20
> In the case of the i915 driver, the 'i915_gem_drop_caches' clears the cac=
he and
> sets the FB ID to 0. Currently, there is no equivalent mechanism in the X=
E driver.
>=20
> Therefore, we should block this test from XE execution until an alternati=
ve
> solution is implemented.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> f9ef612c4..4ee8fb0d4 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -78,6 +78,10 @@ igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
>  # KMS: Yet to add/missing XE support
>  ##################################################################
>  igt@kms_prime@.*
> +
> +# Expected failure on XE:
> +# https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
> +igt@kms_rmfb@close-fd
>  ##################################################################
>  # KMS: Non-Intel tests
>  ##################################################################
> --
> 2.43.2

