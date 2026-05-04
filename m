Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF3EFF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 08:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA37F89361;
	Mon,  4 May 2026 08:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9PplOkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189C910E5EA
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777883965; x=1809419965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hrmvymMeOuNZQe6xVmIh98JAzpgghfA+CAtpFLO5dwI=;
 b=W9PplOkT5KqQG1epselq8Y/I1/UqRvLylDRmJJa+2aTqXhX1iziZfMW5
 HRap6e+9VGod1sOm2Wr5hEPDunxU6oYAAsn9wbIFqRU4mSaH8lUY3BDJq
 p27LPU3rkSpAirIYhIZDlj9M/gVH+1GtbUiNslofGv6nqj57pl+majdWc
 Yfc2QCF+QlJuYhMcTXRt7CS3xXZc6m4UjD/MhI0pvJg3BUan/Ynyf4b+i
 k5KrxBd+2m3dBpSggGnMbXtc0GkonrzBAiGy28SkEUjzzD5O2Kx+Zzlb5
 4oa9b4VBFEi86RecL0scJNtnRWADv0Uw32k4k1ZSbgkH/iXE6+TYT0iwg Q==;
X-CSE-ConnectionGUID: E+9e7c5QRmmvgLW4bc3IJw==
X-CSE-MsgGUID: U7IsVGJFSQWnTVubE2VI+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="101404912"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="101404912"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 01:39:25 -0700
X-CSE-ConnectionGUID: oZruCqsDRHevqKH2xt8GRA==
X-CSE-MsgGUID: 4NqKcPInTGiBNJYsz80zKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="234596448"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 01:39:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:39:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 01:39:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:39:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JALX1b5oVKE9Nzkx4TiM8TphvovYRpljbt9nvjZ515i6dEmZj2b7/ZyzNECBDEKTcPkMlqxOuQ9X5MedlKW++rj0pZ1a6Vg0h3llsJcLVmM9ykmpiRLV5q5M7SfLEjXHmYYmdJ0phyjjB3nTsBRXF6Wy4nO52pAWywK44poKY8pUyQ+peJ+QCyt/wSD39muXL5yykVj9UJvOP5IwuIOzx07arkwQ+xUaZN9Dl59IPPbaoybBzvCo176E0C82iwXhjg6849QcNbxJtaQ5slBWQdE3BqKlHhXAgXPqLTERWY5Gen6gUr8Zu/a+ZCde2D/sMooWdLcW0auKS7CACNws+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=du1fe7otEXNykMMUO3hMVsc9QYyPf+W8V6R4o68bUjU=;
 b=g9zTHtyGVT+4giXDAgxtiSpBOB75i/nKsO/mKUNk59wcOVy3R8sFwTtJRc/6H7+lQk2HOfhXiED+pdVT6OuMCL9GoRz74NVnBoAltaMIE0c3gkbO1yvzee4rstqoBUn8Hh9o/lyopv5V1FMvNZlS5EUCq54jpmemXXiapkzDUWR7LFwRdsu1Te9rsyIMjHfz/h9+qwACYGvvPx2a+BgLZ20kCFCl5/C4YQsaGM58whFpg+Vtxu2qQwT5LfC+0Myk5ZttgyaCJlo5mUrKfdftZcYXwxpi51nAjYy3l+hSdO2Pe06lomf5P4taYbxYNnGtgM5RszY/z5YXnsYUVHheFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 08:39:20 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 08:39:20 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/kms_sharpness_filter: Remove
 plane-scaler subtests
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/kms_sharpness_filter: Remove
 plane-scaler subtests
Thread-Index: AQHc2WYzU7he96qRqEyIdvjAc2MdirX9j/mg
Date: Mon, 4 May 2026 08:39:20 +0000
Message-ID: <IA1PR11MB646737C83CD92CE9FE666BCCE3312@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260501123738.2360414-1-swati2.sharma@intel.com>
 <20260501123738.2360414-2-swati2.sharma@intel.com>
In-Reply-To: <20260501123738.2360414-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SJ0PR11MB5917:EE_
x-ms-office365-filtering-correlation-id: 885349f0-6fd6-4e15-7b96-08dea9b8a2ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: wvXKfvl9gvKDSGgv7YccagZc8ZOLvvTlj+HF0+yEbG+ELT75rXnU4hTgL++6Q/4ImFwbE/E4nwgNK80WkysZl3blOKSlsX3bwx1DPyuFMcJu0x3GZT2QprJUZ1qyFQYY2rzPoHgIsp3rnHyn9w26JZZLyw6TPz0vTFVJb0RPjxIkgKXB/cHuix9vGH2jD7yj65Jt/5UMoKNX5qwEVEIOFvz1mjvARvz+EXWvmCLm4mLu+mzX+ZOy17DLe0o3O9NVeX6JVitunF6RDe/LGEIWUnSNu8Gur2AuCn+vXWH6dCUqrpt8YXAUAZQC8jo/Gb3R9vDmf2l79saOsowAlP8HfJXdL9DAd54dDHS+LEUOkolSXkd+3O+7LPZpY+Dn+j3d8lPfTgKEVwzjc3KkzT+WdPHdgLmVkZTAfboi+ny8lyXmBbBnrJ2ka4OlC4dADUGBP16QpfSO2aPGQyhJOBHvopkgE5DkNuFi2C/dMhh4R5cXKBsmhCf8lQMvHD7jDGNp7niAShBEptmDaDNBJK05yoYdp1wqueScOJBG425Ktbuu6IeEAfAJ8HUeBqnSSGQSPfciwF1/QfxSzGxbkY1xHGLNn4zcp31TZZMb/jbJ4aFO6vKOUPjUQJhZ4oINUYOeVKi14Tyhvvr+ppQM8h5P+Sa/3v7ESf6UfduPNHbpTE1Jx63cDRePNXfI2HBxJk7t5fyZx5AHMzkGC42SOHFrhZRl+ARBv2hrT+Js3NQ/JmXzAQjetRqoVpxoYr50vluf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?erDkK7XSfonO4OEiMwHoVvUGRz09IZiw2HNIGwru7Lifj13SS0yENxPaBs7q?=
 =?us-ascii?Q?3sM8+6CMz8VuWnyPlJvN6a79D+nLCFAStUTdjWi9eW2mZdsONtRQwSEWQShh?=
 =?us-ascii?Q?oOEv3qFerb84Sj02igrPhUMxMfQVF9Gso2bUX+Xsb/uGluungIEeVXfQjuXa?=
 =?us-ascii?Q?dCiXVq44sgaaipHOqmCXXS5p8xYzAG/WCppmXIRoUoei23mf9WIGjfHKUnJU?=
 =?us-ascii?Q?Thlj65MslGn2Ic+iwup8bNZrD5WjR3JtHVcqxO93J5rQRV9Jbsz3Cz5wA1xW?=
 =?us-ascii?Q?rqiEwfrrcRDKySF/LrW+wjvVHVXi8R6t9ddGxW4UGILB6wVayvVlwKdF5CGI?=
 =?us-ascii?Q?4ibS/C8CCwblYUUvTh86108oIcrEW7A/JMsKLS+sAHozxU3LfiYNoLSr65cw?=
 =?us-ascii?Q?ezNC1cr8XpABto0M3jcAqn094bmyw0nLqG1Jxjk2QTAk/n1oIXQwxyFLRJp4?=
 =?us-ascii?Q?jiX78IezjVstncJ4x1y7CK24VbFbdy09S6LY2b8OtVjt6QlybUqVZbUqPZ51?=
 =?us-ascii?Q?7aLgOJ6zAwfkGjYPhhCLbCVGMQwKIyiVOJgXWl460UfdD7i0cUZaGFLYs5F5?=
 =?us-ascii?Q?8L3p10svsjq6EOen1FUoOPJp/LfSNK20kARkHdvcAt++km7OralATRLg6Uan?=
 =?us-ascii?Q?euuP8T2KBwWkGy4ygdb59xC5SqAihOx62dNWFS7B9tSEeCCKgTwFIap/b6WX?=
 =?us-ascii?Q?WxmyITDVtmnT/YDJ3csuuEpqGp5fMXB7MnJxIsvcyJgA+NAFctXf0SjThN4O?=
 =?us-ascii?Q?IJlHxT6QDwpuWS6qNn40jl5KFEcl0Qg1wxd39e/+MqkID6kuQTntMuwNcIAf?=
 =?us-ascii?Q?JVdUES2xqdBAz8sOEqJpmdscHUehFITCSk7ESO044ASl47w6wrM+1yLzBMn8?=
 =?us-ascii?Q?PSCINwk/sWp3kgqdaLmUK+D44GG+tLAsESKMHiH5IDO0p4kuTuD+jC0gw17m?=
 =?us-ascii?Q?0q46GEGDXg7M9xT3doJQhTFvL48FTzLgBXP2txcciohxtgLEJjOGYris3ZMb?=
 =?us-ascii?Q?yb6/9d+eyGBTEM6GdDvsjpeP3kkYm9akodp2DfyH1+597Ezsn4tFyB6mk0cZ?=
 =?us-ascii?Q?ovYZx9giFxRfsZeVyuOSg4Efq8qcanxH8IzJF01XxQu3w1bgyGaQiBYY8boX?=
 =?us-ascii?Q?GHaPeBQM7Jh85AVlRcKzwu8XmoaP2cLcKoAO0kLq3LZVp3OD3QCqBap9rxOl?=
 =?us-ascii?Q?FECtqM4aFfC8HVBEstRS48XltGgXCpi8y5hUCFa3vP9VUba56W8+L8hu52gk?=
 =?us-ascii?Q?OQKQH08k4G0dKbQek4X7M06pChRVw6NlhV0fN1iORrUEqVNl4OMTIKY34Fae?=
 =?us-ascii?Q?pnufSRv2RwZ9tgeTUXug3bGikgKoURn8CRmJDEeAabwFn2gm0pfoF74QtrVd?=
 =?us-ascii?Q?l3eRdsz3MIHVfUSxHrgS5XjBLMOjE4UOLMKZB9HSn6HdwdOLa9fMQkQoNeQM?=
 =?us-ascii?Q?SZGiZdLG/ORPj1LRiFUCXztEW33MiSoMhXKp9BJEWN7fXULUgjA6JH+EUL6R?=
 =?us-ascii?Q?nvr4XpBODfniJ468ZrfVzVhqWmkCbqxJbXaFe+WKdETSS3x2d3oVdVEFnPXw?=
 =?us-ascii?Q?dhrEacCs2JAWtgIUZTM5H9jJp2YYmAwoFXma7C/59I44X+f5kACfIHO072Lp?=
 =?us-ascii?Q?XsKtxVUesh/YrGMKTqcGV+CdsRaXiA/+pSglWIgeC+a5oaAdTMebImB4bmmP?=
 =?us-ascii?Q?iFQ1OXzup4q9YFLLWBTHr+HuQkxBC8DV2cP220xdlphFs/w4SFWxzN2nYhKO?=
 =?us-ascii?Q?K2QmeW/BNA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: errrnZyhxYBPHCh2K7eQjaWxJopGK/p/NBw4sQWOe/WtapZze/EjSTdUQZpW4gjwfF2uTYRZSiFIWdIfklQZDme4vit8D6ct4Hy749XoIXvhf9JzTDFseRjF4yLowl2Gihde9AUQQ84AG/U2k3dMe3MVk3x5V9YD0IJNeGYH4fLqqtYQlJhkbV2o4C9GUfs+yXVG6drrhMjlAjEFoqJndI+e7u3CILk0b5CAfrI89kwFwmcNVJXzx458ungpSoLYJWspHZ5eJmVwaSzXlpw39KuyrpNq3QHTDfpbwgcBe4bic1fI7qe9IfZsXUSxUq4t8KTsZq1wGwYaeaL3KoBzfg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885349f0-6fd6-4e15-7b96-08dea9b8a2ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 08:39:20.5270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +M/ec7A0RdMtvHE+HoozXY+zMMVW/AOOK+9RTjNKKIU84mD86GNyrKWoixJDO95KGmx4D2uwG4F6ZvuS3YWA4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Friday, May 1, 2026 6:08 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; juhapekka.heikkila@gmail.com; Sharma,
> Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 1/3] tests/intel/kms_sharpness_filter: Remove plane=
-
> scaler subtests
>=20
> Remove filter-modifiers, filter-rotations, and filter-formats subtests si=
nce the
> sharpness filter operates on the pipe scaler, not the plane scaler, makin=
g
> these tests irrelevant.
>=20
> v2: -Keep filter-tap test, as it verifies that the correct mode is
>      selected based on the tap value (Nemesa)
>=20
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 95 ------------------------------
>  1 file changed, 95 deletions(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index ff2efb154..96eec8919 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -21,15 +21,6 @@
>   * SUBTEST: filter-strength
>   * Description: Verify that varying strength (0-255), affects the degree=
 of
> sharpness applied.
>   *
> - * SUBTEST: filter-modifiers
> - * Description: Verify content adaptive sharpness filter with varying
> modifiers.
> - *
> - * SUBTEST: filter-rotations
> - * Description: Verify content adaptive sharpness filter with varying ro=
tations.
> - *
> - * SUBTEST: filter-formats
> - * Description: Verify content adaptive sharpness filter with varying fo=
rmats.
> - *
>   * SUBTEST: filter-toggle
>   * Description: Verify toggling between enabling and disabling content
> adaptive sharpness filter.
>   *
> @@ -92,9 +83,6 @@ IGT_TEST_DESCRIPTION("Test to validate content
> adaptive sharpness filter");
>=20
>  enum test_type {
>  	TEST_FILTER_BASIC,
> -	TEST_FILTER_MODIFIERS,
> -	TEST_FILTER_ROTATION,
> -	TEST_FILTER_FORMATS,
>  	TEST_FILTER_STRENGTH,
>  	TEST_FILTER_TOGGLE,
>  	TEST_FILTER_TAP,
> @@ -120,24 +108,6 @@ const int filter_tap_list[] =3D {
>  	TAP_5,
>  	TAP_7,
>  };
> -static const struct {
> -	uint64_t modifier;
> -	const char *name;
> -} modifiers[] =3D {
> -	{ DRM_FORMAT_MOD_LINEAR, "linear", },
> -	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
> -	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
> -};
> -static const int formats[] =3D {
> -	DRM_FORMAT_NV12,
> -	DRM_FORMAT_RGB565,
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_XBGR16161616F,
> -};
> -static const igt_rotation_t rotations[] =3D {
> -	IGT_ROTATION_0,
> -	IGT_ROTATION_180,
> -};
>  static const uint32_t scaling_modes[] =3D {
>  	DRM_MODE_SCALE_FULLSCREEN,
>  	DRM_MODE_SCALE_ASPECT,
> @@ -146,9 +116,6 @@ static const uint32_t scaling_modes[] =3D {  enum
> subtest_iter {
>  	ITER_NONE,
>  	ITER_STRENGTH,
> -	ITER_MODIFIER,
> -	ITER_ROTATION,
> -	ITER_FORMAT,
>  	ITER_SCALING_MODE,
>  };
>=20
> @@ -173,27 +140,6 @@ static const struct subtest_entry {
>  		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
>  		.iter     =3D ITER_STRENGTH,
>  	},
> -	{
> -		.name     =3D "filter-modifiers",
> -		.describe =3D "Verify content adaptive sharpness filter with
> varying modifiers.",
> -		.type     =3D TEST_FILTER_MODIFIERS,
> -		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
> -		.iter     =3D ITER_MODIFIER,
> -	},
> -	{
> -		.name     =3D "filter-rotations",
> -		.describe =3D "Verify content adaptive sharpness filter with
> varying rotations.",
> -		.type     =3D TEST_FILTER_ROTATION,
> -		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
> -		.iter     =3D ITER_ROTATION,
> -	},
> -	{
> -		.name     =3D "filter-formats",
> -		.describe =3D "Verify content adaptive sharpness filter with
> varying formats.",
> -		.type     =3D TEST_FILTER_FORMATS,
> -		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
> -		.iter     =3D ITER_FORMAT,
> -	},
>  	{
>  		.name     =3D "filter-toggle",
>  		.describe =3D "Verify toggling between enabling and disabling
> content adaptive sharpness filter.", @@ -280,9 +226,7 @@ typedef struct {
>  	int filter_strength;
>  	int filter_tap;
>  	uint64_t modifier;
> -	const char *modifier_name;
>  	uint32_t format;
> -	igt_rotation_t rotation;
>  	uint32_t scaling_mode;
>  } data_t;
>=20
> @@ -488,14 +432,6 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)
>  		 data->format, data->modifier, &data->fb[0]);
>  	igt_plane_set_fb(data->plane[0], &data->fb[0]);
>=20
> -	if (type =3D=3D TEST_FILTER_ROTATION) {
> -		igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
> -						      data->rotation),
> -			      "No requested rotation on pipe %s\n",
> -			      igt_crtc_name(data->crtc));
> -		igt_plane_set_rotation(data->plane[0], data->rotation);
> -	}
> -
>  	if (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE)
>  		igt_require_f(has_scaling_mode(output), "No connecter
> scaling mode found on %s\n", output->name);
>=20
> @@ -561,9 +497,6 @@ static bool has_sharpness_filter(igt_crtc_t *crtc)
>=20
>  static const char * const test_type_names[] =3D {
>  	[TEST_FILTER_BASIC]                     =3D "basic",
> -	[TEST_FILTER_MODIFIERS]                 =3D NULL,
> -	[TEST_FILTER_ROTATION]                  =3D NULL,
> -	[TEST_FILTER_FORMATS]                   =3D NULL,
>  	[TEST_FILTER_STRENGTH]                  =3D NULL,
>  	[TEST_FILTER_TOGGLE]                    =3D "toggle",
>  	[TEST_FILTER_TAP]                       =3D NULL,
> @@ -587,16 +520,6 @@ static void build_test_suffix(data_t *data, enum
> test_type type,
>=20
>  	/* suffix depends on the current test parameters */
>  	switch (type) {
> -	case TEST_FILTER_MODIFIERS:
> -		snprintf(name, len, "-%s", data->modifier_name);
> -		break;
> -	case TEST_FILTER_ROTATION:
> -		snprintf(name, len, "-%srot",
> -			 igt_plane_rotation_name(data->rotation));
> -		break;
> -	case TEST_FILTER_FORMATS:
> -		snprintf(name, len, "-%s", igt_format_str(data->format));
> -		break;
>  	case TEST_FILTER_STRENGTH:
>  		snprintf(name, len, "-strength-%d", data->filter_strength);
>  		break;
> @@ -738,8 +661,6 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)  static void set_data_defaults(data_t *data)  {
>  	data->modifier        =3D DRM_FORMAT_MOD_LINEAR;
> -	data->modifier_name   =3D modifiers[0].name;
> -	data->rotation        =3D IGT_ROTATION_0;
>  	data->format          =3D DRM_FORMAT_XRGB8888;
>  	data->filter_strength =3D MID_FILTER_STRENGTH;  } @@ -749,12 +670,6
> @@ static int iter_count(enum subtest_iter iter)
>  	switch (iter) {
>  	case ITER_STRENGTH:
>  		return ARRAY_SIZE(filter_strength_list);
> -	case ITER_MODIFIER:
> -		return ARRAY_SIZE(modifiers);
> -	case ITER_ROTATION:
> -		return ARRAY_SIZE(rotations);
> -	case ITER_FORMAT:
> -		return ARRAY_SIZE(formats);
>  	case ITER_SCALING_MODE:
>  		return ARRAY_SIZE(scaling_modes);
>  	default:
> @@ -768,16 +683,6 @@ static void apply_iter_param(data_t *data, const
> struct subtest_entry *st, int i
>  	case ITER_STRENGTH:
>  		data->filter_strength =3D filter_strength_list[idx];
>  		break;
> -	case ITER_MODIFIER:
> -		data->modifier =3D modifiers[idx].modifier;
> -		data->modifier_name =3D modifiers[idx].name;
> -		break;
> -	case ITER_ROTATION:
> -		data->rotation =3D rotations[idx];
> -		break;
> -	case ITER_FORMAT:
> -		data->format =3D formats[idx];
> -		break;
>  	case ITER_SCALING_MODE:
>  		data->scaling_mode =3D scaling_modes[idx];
>  		break;
> --

LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> 2.25.1

