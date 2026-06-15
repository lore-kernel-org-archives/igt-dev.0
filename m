Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4849CD98CE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 06:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406B310E1CD;
	Mon, 15 Jun 2026 06:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aR0O+iBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC61F10E1C3
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781503193; x=1813039193;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VLDUjT4H5+Pt4Op/nJXzOWpm3nL5Ij7tlebwFb8U/g8=;
 b=aR0O+iBjrWyRuwoflkoNS1DgCJauRqoN6GPlCZbHsHbyTkOqgOvRrQ2t
 WuwdkFbqws6ulO13vbcoqTjeOLYRJI9/BzTZ1I3CigR5x0HQDZXsk2udd
 wSfFDvTanw46jiqjYvtl8M/rV9dj9UGCIrbFgtYkVAOD8o+X+PnCDhIvM
 GhK0CDxC/UQ1UFPb/eJLIRGafPxCEWF57+zVAeBWzHbA4BzLWJ4A9w1Pn
 dLR2/4G3TJ0cgbAiUuwoud9epMqJRvhddvOC80zRoiF9zfsZ5btq9UZzH
 m+3abePjwzwHO/E7+QBX7A6j40d1c4J1B2j4Gh/hTi4J8F/tcwJS7aE9g A==;
X-CSE-ConnectionGUID: nf+mBWqxQEGJ+efL8SbQTQ==
X-CSE-MsgGUID: wgzbBwCeR7y9aD7k8jXkVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82137655"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="82137655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 22:59:53 -0700
X-CSE-ConnectionGUID: 0Ic5yC5+RKKk0IiwkSFUpg==
X-CSE-MsgGUID: cVoRCsudT8eYqZ/EsfvRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="244471066"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 22:59:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 22:59:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 22:59:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 22:59:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8X703jebF1gasgy1rue5uNINMED5bMt/8hZQuKlLtVLdojOGxnLBW7PtSo1IkVVQidIpwCJPKOFsOTE1sW8NczirF9BJGeNzjjf/rsK13PTdAd0ETOAcvfm4TtcIl0di9PXsrfrCTOdGH0aeI9kkpREYPwbDoMBTi9pY9slS9ImvW3IwLZGpYeqSM2tZHaa602CrTCcrSxQV/d7HIlDV6fF0w3fT8clUJs8IlCruoHYxHOON8yycykYONxtocRZcotS0dDzizr1yjnrQJM6n7TU+RNjwhICi3Cx2ijx00J9nHPeq/xkNJmZULreD1h1v2AovLxrtWlFiCmZ6GOMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rh9BC6+QZOPnrgeCWxfm6SLir35ooVyPgWLzP13cdDo=;
 b=YfNAVIUex39zs+AyKukT8iXN/wnzOeaBkPYJmsyoVCnTgJ1zE8yD2j2oMYcqEQRLMleU6aDjsa50v1QEtB7iaQft8wQy8TRKC/Ys19fpBFDN4EnHbKKooKnr4njV1h9/O6d62K3DKjsyfUm76mcAeknk+A3e8wEmkDr6vvLJ0KPd65IKrMWv4+i/KH4tFyXetxImaTreW/KCJn/yy4ilfPpySWa3UC16Hq/jpGvQPxFJ3soChg5BlG6vUPEs5qPOy1+4VuXUpZbot2URVIpt39eNmso2eseKRIbJ0fzQcRUBBu9KsSD1o0QWb/rHVwPMg/aOcLC+8i8pqPihDArPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 05:59:44 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 05:59:43 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t v3 1/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
Thread-Topic: [PATCH i-g-t v3 1/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
Thread-Index: AQHc/IW6usC/2TEiCUyZ7fd+/cpwy7Y/HkFw
Date: Mon, 15 Jun 2026 05:59:43 +0000
Message-ID: <CH3PR11MB8434422F0056FDA1B70D86988DE62@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260615051321.544506-1-nakshtra.goyal@intel.com>
 <20260615051321.544506-2-nakshtra.goyal@intel.com>
In-Reply-To: <20260615051321.544506-2-nakshtra.goyal@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB7208:EE_
x-ms-office365-filtering-correlation-id: b52b8496-610a-44db-94f7-08decaa34c0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|22082099003|18002099003|6133799003|56012099006|25016099003|4143699003|3023799007|29003799003|11063799006;
x-microsoft-antispam-message-info: iYcjyQZKveRnJBWVAb6OGmlJrnM+VmnZnCus7PglAZJPj8UALD1XNXU4brvjsFYGSJiVvTqIIrMU3mWZhcIEwVvxcg8gofFGhF2CPicl14S1xjX13HGJn9CVG1KTwDA3Y1gXocM/HpQNR0XB9o7k2xt6C+jm7Lawj1ZQji8+WymN5/1xsarlaT2Y54p+21qEJA9UArOBmmUIKKBODZeUb3njkpKQnewYFH2H37sTBrCAUftXoeVaWrZqpBC3w8oEbuScOP4XQL7qqkd1ti44miv86dnIJdDy/3y44N6u7vwdZUTNyLz/i9qob8FXzuORjCtlA9neVw+edIdNo2c7C+EbLYVuP13NDXEORGaEctLwwYunka4/sugt3XKo8gqB9E/DaGYL56EQK/fFidSt1Mz6nMCsmQkjXklsuYi5kEpC5V5xUweYyGR2NdxdLlUPXdn+fEavhC2CWc7L4goLNq4JSptSJX4GPF5TMEInmAVX7q1/rwYiy76jqZwEUp6zirSUFHPPHvbgcw53ivgI37E9XHXhoaBo4ZKsicmKQ/B1JkJkqq9wuxhoBiEYDP8FZdJHum4bO2QCURvHmTdjrFXtCEuEnxtgQuxWUMl2spw6ENL+7iySENHo0YXYAIqz52H5HZZaJZvdNxfhwBZOP8IPlvICF4cw4vbpW4XgQig/BuYI1WukSI6pH43G0j9udYpVM6XsIMS2TmuKVQrVVPlh1thgW7s4Bpc79vQhE44Its+1Ds/vDhyEJWSFUPYD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(6133799003)(56012099006)(25016099003)(4143699003)(3023799007)(29003799003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JOSRMIzv7G3mbkzbcKEwCgOFHhitJA10D/HjN2KVTAMNy/pfcvLTItiqBewC?=
 =?us-ascii?Q?4R9P8+ORFIK3Bj+8ZJaipGHsnG5Ff0xd0Gv2ut4WL4aUerhoRRVsWh6AOJP4?=
 =?us-ascii?Q?1XzLBF0TESZT0kLhOvfTKpCCoSTIjFSJ7zeXei3IvbK0qgLLb6chGgT2UU2I?=
 =?us-ascii?Q?b3qaPgw3AVL6Z0AUY7YHv7eqTV5tMV02OD6ScjFF3k/+jZWMkAa9qJvDmLhX?=
 =?us-ascii?Q?7Vhx9gXs/AeRVhPq9qu5cHxBj88QILIHKlA2l8H/yZSI4+Yds77sCDHTZYlq?=
 =?us-ascii?Q?6Ix6IbD8/5A69UYLTVpGdiG1DG4snIh2f8Cg08ExesVYVOFlK2JrtSIYdndd?=
 =?us-ascii?Q?SvH8hBlDTUvAnbi9BqbyUqCw3pVOF9cZBN+xbQ6X1vdVEqfOCz3HbXE0Siwx?=
 =?us-ascii?Q?Es5fyFdqXvIjl/tb2BsoXFhuUv3Hu2+AVu7XCD+0sgG2Ar8ig2Lpp0yL5sln?=
 =?us-ascii?Q?SJzN3X4o2tuzCz6w7tmKYQ5pENm1+quPKz7Zs/jeSaWNDNntaPRFeMAg4j89?=
 =?us-ascii?Q?dAE+NUt+yZOL3TIhuMyTuqTCYvu7jaXorkD1qG/vbjtPafK94buWn2x+OhLo?=
 =?us-ascii?Q?kt9BJ8+Q0mNAEt19kr+MA2k1WW02U4TuhXpHJHztsO5bkwPY6T0NAoFeMzgd?=
 =?us-ascii?Q?SJpQpR6RfpIl74+1nByUO89sZQPimBRFSWJ+ENg9YQ8uHXb4xwU2qcuyV9Xz?=
 =?us-ascii?Q?u7kLdf3tMepBxV0EcUIQUS3qiOrSQv3nYMTKTmDnQ+TG4IJgErehDy059Tx2?=
 =?us-ascii?Q?Wg3OM7AGUHhy8EhtHK1ISgVB1dh7fp0GQUsKcYYF7UAbLUSocEIlGX5aZBWS?=
 =?us-ascii?Q?3IzcMJl6pBvKPpcfsilxlrWfrZQNnjnnzouRl3jd4EZInfFSb8gKzRYRxl3h?=
 =?us-ascii?Q?e0w5YWSziTs+0FkgLy9IZvWYBCR78JEu2Mf3yxTasmIADwF7Ggr6nQstgbop?=
 =?us-ascii?Q?+j6iL5cwWqPDLae3jHYDu1Bz+S7/HENcuuqr6LCyBWIzP+XR3Psc5iOwHVs5?=
 =?us-ascii?Q?Wj4louJvZzaPkllxW14U+MIlb1AaZHrz9ubNG2ukC5DejSvyUFJNghthfnSl?=
 =?us-ascii?Q?FWGedS8Yvqc9fq8eLxs0Pf+TjMEspgFtxyeF+UYEtO3h+uigGV3kdty9EIbw?=
 =?us-ascii?Q?JjgveafbFAs2uoYb2VOqutRDOd1pTptBp///90nZnaGkZl9q71zOIypqHMGa?=
 =?us-ascii?Q?jYp1+28XWPM9gE0Zc3PAP5aKWwqCo4rZVgOUufM5BFEl+C2+lqt3CvYQ7/ja?=
 =?us-ascii?Q?Yw18RMMT3vSCzJyIqjG9cTYLlArESOom3Z/mLOArFe/EKdXvpgGwR6BRyE5B?=
 =?us-ascii?Q?avVy10cZMsc9y3IQgMEYRSdMNXWUokDj/AEaN+w4wtjunoi3EgxZXJZn1/Eq?=
 =?us-ascii?Q?DcykmeQeMvN+ZvqdofOJT3VuhmvttH04vpq0LTLEnzgD3j3UXh441MwWXX/I?=
 =?us-ascii?Q?+OKmbzvAu6Aks5bob7xqJX3k6/fHcNFXFHINOc7gHeNcEJn+rBYtmDXlmLSm?=
 =?us-ascii?Q?BARKmULa5jlCR8Jk4pKAqK66BIslyI8WRRKlS88udO0SCP+Hz0aGiSbZMZ8R?=
 =?us-ascii?Q?P6IMNIpMwAAguUgzy0QpR5Rpkz1MNm3i4olwCxTMYx+sEnVNzGVSRy5J4XBU?=
 =?us-ascii?Q?yXYoGEJ7k/lotMfYu4kttz5aSIaRTa7UYcBgCdUJzNKpS6B2ftKcPmQrNWQ7?=
 =?us-ascii?Q?tHyqkdeC046HViH6+cUxSlCb0Wtm2gCTukyIuX5nkq6JogB52yMihER8IhEC?=
 =?us-ascii?Q?POicaCtj7Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JDmibm5FBB7DuMyc2u4aZ1cXnZ1CrZ4QGA1s2kdqU35Z9SdF2c/lxQ3YEQ4n3A9idbBItAc/6NQve2kA+c3QIOxFtgjCd3XB2tH4A4Pk3nSr3UvVy2Sqa/gn836xTWO9hlCL7EgQi5mwClpJOZGZK5Y9D42MOWfNLuqdG1mOSFjJBErneImLJJsRMomonGPd8c0bHOxZxiVQEBxIdLyrhuMxYMLU4VCWHiiknVghkEhs7a+E6GR6a0aR4QFeXEg4uQhFEcDpHtS22Cvh7cQBQtHjFXaby0fNcChUE6LdslE5Pcmp00NiIdEodtYhaVFc/0qJQ/bjywqca4A+ek366Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52b8496-610a-44db-94f7-08decaa34c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 05:59:43.7016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcWi/KP0d+FgsEvrqavT6/S3soJOYHbE9onmojrPsyBZEVGchgAJ4ytqHQIJh51Qv/Ck0Nog2IG4Dxh4kOzjqct/HtnL/w630t66I169pIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
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
> From: Goyal, Nakshtra <nakshtra.goyal@intel.com>
> Sent: 15 June 2026 10:43 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Hajda, Andrzej
> <andrzej.hajda@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t v3 1/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> This patch series replaces all occurrences of GEN_VER/gen_ver
> with GFX_VER/gfx_ver across the IGA64 shader infrastructure
> and igt code base to align with IGT naming convention.
>=20
> v2: Changing subject as per requirement and correcting
>     commit message (Kamil)
>=20
> v3: re-compiling to change to verify with changes in
>     shader sums (Andrzej)
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  lib/gpgpu_fill.c                              |   4 +-
>  lib/gpgpu_fill.c.gen.iga64_codes.c            |  16 +-
>  lib/gpgpu_shader.c                            |  30 +--
>  lib/gpgpu_shader.c.gen.iga64_codes.c          | 186 +++++++++---------
>  lib/gpgpu_shader.h                            |   4 +-
>  lib/iga64_macros.h                            |  10 +-
>  scripts/generate_iga64_codes                  |  16 +-
>  tests/intel/xe_eudebug_online.c               |   6 +-
>  .../xe_eudebug_online.c.gen.iga64_codes.c     |  16 +-
>  tests/intel/xe_prefetch_fault.c               |   2 +-
>  .../xe_prefetch_fault.c.gen.iga64_codes.c     |   6 +-
>  11 files changed, 148 insertions(+), 148 deletions(-)
>=20
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index ed13f6eb5..2c47169d2 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -297,7 +297,7 @@ mov (1|M0)		r2.1<1>:ud
> 	r0.6<0;1,0>:ud
>  mov (8|M0)		r4.0<1>:ud	0x0:ud
>  // fill up message payload with target colour
>  mov (16|M0)		r5.0<1>:ud	r1.0<0;1,0>:ud
> -#if GEN_VER < 2000
> +#if GFX_VER < 2000
>  // load block offsets into message header payload
>  mov (2|M0)		r4.0<1>:ud	r2.0<2;2,1>:ud
>  // load block width
> @@ -356,7 +356,7 @@ static struct gpgpu_shader *__xe3p_gpgpu_kernel(int
> xe)
>  #define XCURRENT	r3.4
>  #define TMP		r3.7
>  #define ADDR_LO		r4.0
> -#if GEN_VER >=3D 3500
> +#if GFX_VER >=3D 3500
>  (W)	add (1)		XEND<1>:ud	XPOS:ud		WIDTH:ud
>  (W)	mov (1)		OFFSET<1>:ud	0x0:ud
>=20
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c
> b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index 7745a0ffe..f15a9a23a 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,10 +3,10 @@
>=20
>  #include "gpgpu_shader.h"
>=20
> -#define MD5_SUM_IGA64_ASMS 3110292a24d751e5ae12a5bf30c8bf8b
> +#define MD5_SUM_IGA64_ASMS 23974a9fa727a81b32058bbaa8d3ebbc
>=20
>  struct iga64_template const iga64_code_xe3p_gpgpu_fill[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 144, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 144, .code =3D (const uint32_t []) {
>  		0x80000040, 0x03350220, 0x02000154, 0x00100134,
>  		0x80000061, 0x03054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x03158220, 0x02000014, 0x00000004,
> @@ -44,13 +44,13 @@ struct iga64_template const
> iga64_code_xe3p_gpgpu_fill[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
>=20
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_gpgpu_fill[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 44, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>  		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>  		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> @@ -63,7 +63,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] =3D=
 {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>  		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>  		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> @@ -78,7 +78,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] =3D=
 {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>  		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>  		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> @@ -92,7 +92,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] =3D=
 {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>  		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>  		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> @@ -107,7 +107,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] =
=3D
> {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>  		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>  		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 72b05959e..ea13fd3c7 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -22,7 +22,7 @@ struct label_entry {
>  #define IGA64_ARG0 0xc0ded000
>  #define IGA64_ARG_MASK 0xffffff00
>=20
> -#define SUPPORTED_GEN_VER 1200 /* Support TGL and up */
> +#define SUPPORTED_GFX_VER 1200 /* Support TGL and up */
>=20
>  #define PAGE_SIZE 4096
>  #define BATCH_STATE_SPLIT 2048
> @@ -46,10 +46,10 @@ __emit_iga64_code(struct gpgpu_shader *shdr, struct
> iga64_template const *tpls,
>  {
>  	uint32_t *ptr;
>=20
> -	igt_require_f(shdr->gen_ver >=3D SUPPORTED_GEN_VER,
> +	igt_require_f(shdr->gfx_ver >=3D SUPPORTED_GFX_VER,
>  		      "No available shader templates for platforms older than
> XeLP\n");
>=20
> -	while (shdr->gen_ver < tpls->gen_ver)
> +	while (shdr->gfx_ver < tpls->gfx_ver)
>  		tpls++;
>=20
>  	while (shdr->max_size < shdr->size + tpls->size)
> @@ -196,7 +196,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>  		emit_sip(ibb, sip_offset);
>=20
>  	/* Inline data is at 31th/32th dword of COMPUTE_WALKER, BSpec:
> 67028 */
> -	inline_data =3D intel_bb_ptr(ibb) + 4 * (shdr->gen_ver < 2000 ? 31 : 32=
);
> +	inline_data =3D intel_bb_ptr(ibb) + 4 * (shdr->gfx_ver < 2000 ? 31 : 32=
);
>  	xehp_emit_compute_walk(ibb, 0, 0, x_dim * 16, y_dim, &idd, 0x0);
>  	fill_inline_data(inline_data, CANONICAL(target->addr.offset), target,
> x_dim);
>=20
> @@ -297,17 +297,17 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>  		       struct gpgpu_shader *sip,
>  		       uint64_t ring, bool explicit_engine)
>  {
> -	igt_require(shdr->gen_ver >=3D SUPPORTED_GEN_VER);
> +	igt_require(shdr->gfx_ver >=3D SUPPORTED_GFX_VER);
>  	igt_assert(ibb->size >=3D PAGE_SIZE);
>  	igt_assert(ibb->ptr =3D=3D ibb->batch);
>=20
>  	if (target->addr.offset =3D=3D INTEL_BUF_INVALID_ADDRESS)
>  		gpgpu_alloc_gpu_addr(ibb, target);
>=20
> -	if (shdr->gen_ver >=3D 3500)
> +	if (shdr->gfx_ver >=3D 3500)
>  		__xe3p_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
>  				      ring, explicit_engine);
> -	else if (shdr->gen_ver >=3D 1250)
> +	else if (shdr->gfx_ver >=3D 1250)
>  		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
>  				      ring, explicit_engine);
>  	else
> @@ -330,7 +330,7 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
>=20
>  	igt_assert(shdr);
>  	info =3D intel_get_device_info(intel_get_drm_devid(fd));
> -	shdr->gen_ver =3D 100 * info->graphics_ver + info->graphics_rel;
> +	shdr->gfx_ver =3D 100 * info->graphics_ver + info->graphics_rel;
>  	shdr->max_size =3D 16 * 4;
>  	shdr->code =3D malloc(4 * shdr->max_size);
>  	shdr->labels =3D igt_map_create(igt_map_hash_32,
> igt_map_equal_32);
> @@ -385,7 +385,7 @@ void gpgpu_shader_dump(struct gpgpu_shader
> *shdr)
>   */
>  void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum
> gpgpu_shader_vrt_modes vrt)
>  {
> -	igt_assert(vrt =3D=3D VRT_DISABLED || shdr->gen_ver >=3D 3000);
> +	igt_assert(vrt =3D=3D VRT_DISABLED || shdr->gfx_ver >=3D 3000);
>  	shdr->vrt =3D vrt;
>  }
>=20
> @@ -500,11 +500,11 @@ uint32_t
> gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr)
>  	enum gpgpu_shader_vrt_modes register_size =3D shdr->vrt;
>=20
>  	/* Not implemented for Xe platforms  */
> -	if (shdr->gen_ver < 2000)
> +	if (shdr->gfx_ver < 2000)
>  		return 1;
>=20
>  	/* Xe2 platforms */
> -	if (shdr->gen_ver < 3000) {
> +	if (shdr->gfx_ver < 3000) {
>  		return compute_max_threads_in_tg_xe2(shdr-
> >large_grf_mode,
>  						     shdr->simd_size,
>  						     shdr-
> >hw_local_id_generation);
> @@ -586,10 +586,10 @@ void gpgpu_shader__eot(struct gpgpu_shader
> *shdr)
>  	else
>  		emit_iga64_code(shdr, eot, R"(
>  (W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud
> -#if GEN_VER < 1250
> +#if GFX_VER < 1250
>  (W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@=
1}
>=20
> -#elif GEN_VER <=3D 3000
> +#elif GFX_VER <=3D 3000
>  (W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}
>=20
>  #else
> @@ -948,7 +948,7 @@ void gpgpu_shader__write_a64_d32(struct
> gpgpu_shader *shdr, uint64_t ppgtt_addr,
>  	igt_assert_f((addr & 0x3) =3D=3D 0, "address must be aligned to
> DWord!\n");
>=20
>  	emit_iga64_code(shdr, write_a64_d32, R"(
> -#if GEN_VER >=3D 2000
> +#if GFX_VER >=3D 2000
>  // Unyped 2D Block Store
>  // Instruction_Store2DBlock
>  // bspec: 63981
> @@ -1037,7 +1037,7 @@ void gpgpu_shader__read_a64_d32(struct
> gpgpu_shader *shdr, uint64_t ppgtt_addr)
>  	igt_assert_f((addr & 0x3) =3D=3D 0, "address must be aligned to
> DWord!\n");
>=20
>  	emit_iga64_code(shdr, read_a64_d32, R"(
> -#if GEN_VER >=3D 2000
> +#if GFX_VER >=3D 2000
>  // Unyped 2D Block Array Load
>  // Instruction_Load2DBlockArray
>  // bspec: 63972
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c
> b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index 0b116fc41..a279f1dc7 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -3,10 +3,10 @@
>=20
>  #include "gpgpu_shader.h"
>=20
> -#define MD5_SUM_IGA64_ASMS 16bafa89cc2fb5f6617e3dac61120f47
> +#define MD5_SUM_IGA64_ASMS 4068ae55c6aa50d845b74f5d61da4630
>=20
>  struct iga64_template const iga64_code_read_a64_d32[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>  		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> @@ -18,13 +18,13 @@ struct iga64_template const
> iga64_code_read_a64_d32[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
>=20
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_write_a64_d32[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>  		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> @@ -38,13 +38,13 @@ struct iga64_template const
> iga64_code_write_a64_d32[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
>=20
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_end_system_routine_step_if_eq[] =
=3D
> {
> -	{ .gen_ver =3D 3500, .size =3D 60, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 60, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
> @@ -61,7 +61,7 @@ struct iga64_template const
> iga64_code_end_system_routine_step_if_eq[] =3D {
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 3000, .size =3D 60, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3000, .size =3D 60, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
> @@ -78,7 +78,7 @@ struct iga64_template const
> iga64_code_end_system_routine_step_if_eq[] =3D {
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -92,7 +92,7 @@ struct iga64_template const
> iga64_code_end_system_routine_step_if_eq[] =3D {
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -107,7 +107,7 @@ struct iga64_template const
> iga64_code_end_system_routine_step_if_eq[] =3D {
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -121,7 +121,7 @@ struct iga64_template const
> iga64_code_end_system_routine_step_if_eq[] =3D {
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -136,7 +136,7 @@ struct iga64_template const
> iga64_code_end_system_routine_step_if_eq[] =3D {
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000166, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80030161, 0x1e054220, 0x00000000, 0x00000000,
> @@ -153,27 +153,27 @@ struct iga64_template const
> iga64_code_end_system_routine_step_if_eq[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_end_system_routine[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000165, 0x80018220, 0x02008000, 0x7ffffffd,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> @@ -181,18 +181,18 @@ struct iga64_template const
> iga64_code_end_system_routine[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_breakpoint_suppress[] =3D {
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000166, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_write_on_exception[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 64, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 64, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -210,7 +210,7 @@ struct iga64_template const
> iga64_code_write_on_exception[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 3000, .size =3D 64, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3000, .size =3D 64, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -228,7 +228,7 @@ struct iga64_template const
> iga64_code_write_on_exception[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -243,7 +243,7 @@ struct iga64_template const
> iga64_code_write_on_exception[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 60, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 60, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -260,7 +260,7 @@ struct iga64_template const
> iga64_code_write_on_exception[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 56, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 56, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000014, 0x00000002,
> @@ -276,7 +276,7 @@ struct iga64_template const
> iga64_code_write_on_exception[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 60, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 60, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -293,7 +293,7 @@ struct iga64_template const
> iga64_code_write_on_exception[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 56, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 56, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -312,53 +312,53 @@ struct iga64_template const
> iga64_code_write_on_exception[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_set_exception[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000166, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_clear_exception[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_media_block_write[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -373,7 +373,7 @@ struct iga64_template const
> iga64_code_media_block_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 3000, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3000, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -388,7 +388,7 @@ struct iga64_template const
> iga64_code_media_block_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -400,7 +400,7 @@ struct iga64_template const
> iga64_code_media_block_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -414,7 +414,7 @@ struct iga64_template const
> iga64_code_media_block_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 44, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000014, 0x00000002,
> @@ -427,7 +427,7 @@ struct iga64_template const
> iga64_code_media_block_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -441,7 +441,7 @@ struct iga64_template const
> iga64_code_media_block_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 44, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -457,30 +457,30 @@ struct iga64_template const
> iga64_code_media_block_write[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_write_aip[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000940, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000940, 0x80418220, 0x02008040, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000940, 0x80218220, 0x02008020, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000940, 0x80418220, 0x02008040, 0xc0ded000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000140, 0x80418220, 0x02008040, 0xc0ded000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_media_block_write_aip[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>  		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -495,7 +495,7 @@ struct iga64_template const
> iga64_code_media_block_write_aip[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 3000, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3000, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>  		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -510,7 +510,7 @@ struct iga64_template const
> iga64_code_media_block_write_aip[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>  		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -522,7 +522,7 @@ struct iga64_template const
> iga64_code_media_block_write_aip[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>  		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -536,7 +536,7 @@ struct iga64_template const
> iga64_code_media_block_write_aip[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 44, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>  		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000014, 0x00000002,
> @@ -549,7 +549,7 @@ struct iga64_template const
> iga64_code_media_block_write_aip[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>  		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -563,7 +563,7 @@ struct iga64_template const
> iga64_code_media_block_write_aip[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 44, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x80000161, 0x05050220, 0x00008040, 0x00000000,
>  		0x80030161, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -579,7 +579,7 @@ struct iga64_template const
> iga64_code_media_block_write_aip[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_common_target_write[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 64, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 64, .code =3D (const uint32_t []) {
>  		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -597,7 +597,7 @@ struct iga64_template const
> iga64_code_common_target_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 3000, .size =3D 64, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3000, .size =3D 64, .code =3D (const uint32_t []) {
>  		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -615,7 +615,7 @@ struct iga64_template const
> iga64_code_common_target_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -630,7 +630,7 @@ struct iga64_template const
> iga64_code_common_target_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 56, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 56, .code =3D (const uint32_t []) {
>  		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> @@ -646,7 +646,7 @@ struct iga64_template const
> iga64_code_common_target_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -661,7 +661,7 @@ struct iga64_template const
> iga64_code_common_target_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 56, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 56, .code =3D (const uint32_t []) {
>  		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> @@ -677,7 +677,7 @@ struct iga64_template const
> iga64_code_common_target_write[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>  		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> @@ -695,35 +695,35 @@ struct iga64_template const
> iga64_code_common_target_write[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_inc_r40_jump_neq[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 20, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 20, .code =3D (const uint32_t []) {
>  		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>  		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>  		0x84000020, 0x00004000, 0x00000000, 0xffffffd0,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 20, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 20, .code =3D (const uint32_t []) {
>  		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>  		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>  		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 20, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 20, .code =3D (const uint32_t []) {
>  		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>  		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>  		0x84000020, 0x00004000, 0x00000000, 0xffffffd0,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 20, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 20, .code =3D (const uint32_t []) {
>  		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>  		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>  		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 20, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 20, .code =3D (const uint32_t []) {
>  		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>  		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>  		0x80000270, 0x00018220, 0x22002804, 0xc0ded000,
> @@ -733,18 +733,18 @@ struct iga64_template const
> iga64_code_inc_r40_jump_neq[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_clear_r40[] =3D {
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000061, 0x28054220, 0x00000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000061, 0x28054220, 0x00000000, 0x00000000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_jump_dw_neq[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
>  		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> @@ -758,7 +758,7 @@ struct iga64_template const
> iga64_code_jump_dw_neq[] =3D {
>  		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 3000, .size =3D 48, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3000, .size =3D 48, .code =3D (const uint32_t []) {
>  		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
>  		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> @@ -772,7 +772,7 @@ struct iga64_template const
> iga64_code_jump_dw_neq[] =3D {
>  		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 36, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 36, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> @@ -783,7 +783,7 @@ struct iga64_template const
> iga64_code_jump_dw_neq[] =3D {
>  		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 40, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 40, .code =3D (const uint32_t []) {
>  		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>  		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> @@ -795,7 +795,7 @@ struct iga64_template const
> iga64_code_jump_dw_neq[] =3D {
>  		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 36, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 36, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>  		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
> @@ -806,7 +806,7 @@ struct iga64_template const
> iga64_code_jump_dw_neq[] =3D {
>  		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 40, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 40, .code =3D (const uint32_t []) {
>  		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>  		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> @@ -818,7 +818,7 @@ struct iga64_template const
> iga64_code_jump_dw_neq[] =3D {
>  		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 36, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 36, .code =3D (const uint32_t []) {
>  		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>  		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> @@ -832,87 +832,87 @@ struct iga64_template const
> iga64_code_jump_dw_neq[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_jump[] =3D {
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000020, 0x00004000, 0x00000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000020, 0x00004000, 0x00000000, 0x00000000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_eot[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>  		0x8000c033, 0x00000001, 0x3000000c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>  		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80030061, 0x70050220, 0x00460005, 0x00000000,
>  		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>  		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>  		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80030061, 0x70050220, 0x00460005, 0x00000000,
>  		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>  		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80030061, 0x70050220, 0x00460005, 0x00000000,
>  		0x80049031, 0x00000004, 0x7020700c, 0x10000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_eot_vrt[] =3D {
> -	{ .gen_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x50050220, 0x00460005, 0x00000000,
>  		0x800f2031, 0x00000004, 0x3000500c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1270, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1270, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80030061, 0x50050220, 0x00460005, 0x00000000,
>  		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>  		0x80034031, 0x00000004, 0x3000500c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1260, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x800c0061, 0x50050220, 0x00460005, 0x00000000,
>  		0x800f2031, 0x00000004, 0x3000500c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 1250, .size =3D 12, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 12, .code =3D (const uint32_t []) {
>  		0x80030061, 0x50050220, 0x00460005, 0x00000000,
>  		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>  		0x80034031, 0x00000004, 0x3000500c, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80030061, 0x50050220, 0x00460005, 0x00000000,
>  		0x80039031, 0x00000004, 0x3000500c, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_nop[] =3D {
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x00000060, 0x00000000, 0x00000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x00000060, 0x00000000, 0x00000000, 0x00000000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_sync_host[] =3D {
> -	{ .gen_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 1250, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000001, 0x00010000, 0xf0000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 8, .code =3D (const uint32_t []) {
>  		0x80000001, 0x00010000, 0xf0000000, 0x00000000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 7c10572bc..136d93b29 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -25,7 +25,7 @@ enum gpgpu_shader_vrt_modes {
>  };
>=20
>  struct gpgpu_shader {
> -	uint32_t gen_ver;
> +	uint32_t gfx_ver;
>  	uint32_t size;
>  	uint32_t max_size;
>  	union {
> @@ -42,7 +42,7 @@ struct gpgpu_shader {
>  };
>=20
>  struct iga64_template {
> -	uint32_t gen_ver;
> +	uint32_t gfx_ver;
>  	uint32_t size;
>  	const uint32_t *code;
>  };
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index 5b943bc27..26d41387a 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -10,7 +10,7 @@
>  #define IGA64_MACROS_H
>=20
>  /* send instruction for DG2+ requires 0 length in case src1 is null, BSp=
ec:
> 47443 */
> -#if GEN_VER <=3D 1250
> +#if GFX_VER <=3D 1250
>  #define src1_null null
>  #else
>  #define src1_null null:0
> @@ -43,7 +43,7 @@
>  (W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
>  (W)	mov (1)		dst.4<1>:ud	R0_FFTID
>=20
> -#if GEN_VER < 3000
> +#if GFX_VER < 3000
>  #define SET_SURFACE_DESC(dst)			\
>  (W)	mov (8)		dst.0<1>:ud	0x0:ud
>  #else
> @@ -67,7 +67,7 @@
>  (W)	add (1)		dst.6<1>:ud	R0_TGIDY	y	;\
>  (W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
>=20
> -#if GEN_VER < 2000
> +#if GFX_VER < 2000
>  #define SET_SHARED_SPACE_ADDR(dst, y, width)
> SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
>  #define SET_THREAD_SPACE_ADDR(dst, x, y, width)
> SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
>  #define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src
> 	src1_null 0x0	0x2190000
> @@ -75,10 +75,10 @@
>  #else
>  #define SET_SHARED_SPACE_ADDR(dst, y, width)
> SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
>  #define SET_THREAD_SPACE_ADDR(dst, x, y, width)
> SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
> -#if GEN_VER < 3000
> +#if GFX_VER < 3000
>  #define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0
> 	0x0	0x62100003
>  #define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0
> 	0x0	0x64000007
> -#elif GEN_VER < 3500
> +#elif GFX_VER < 3500
>  #define LOAD_SPACE_DW(dst, src) send.ugm (1)	dst	src	null:0
> 	0x0	0x2120003
>  #define STORE_SPACE_DW(dst, src) send.ugm (1)	null	dst	src:1
> 	0x0	0x2020007
>  #else
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index e3189d800..a5798bc59 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -7,7 +7,7 @@
>  # to minimal GPU generation supported by platform multiplied by 100 and
> platform
>  # is one of platforms supported by -p switch of iga64.
>  # Must be in decreasing order, the last one must have gen100 equal 0.
> -GEN_VERSIONS=3D"3500:3pxpc 3000:3 2000:2 1270:12p71 1260:12p72
> 1250:12p5 0:12p1"
> +GFX_VERSIONS=3D"3500:3pxpc 3000:3 2000:2 1270:12p71 1260:12p72
> 1250:12p5 0:12p1"
>=20
>  # Magic values to encode asm template args, must be the the same as in
> gpgpu_shader.c.
>  IGA64_ARG0=3D0xc0ded000
> @@ -63,7 +63,7 @@ mkdir -p $WD
>=20
>  # check if all required platforms are supported
>  touch $WD/empty
> -for gen in $GEN_VERSIONS; do
> +for gen in $GFX_VERSIONS; do
>      gen_name=3D"${gen#*:}"
This gen here can also be updated, but for now this update looks fine and c=
an be sent as an enhancement.
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>      iga64 -p=3D$gen_name -d $WD/empty 2>/dev/null || {
>          warn "WARNING: iga64 assemblies changed, but iga64 compiler does
> not support platform '$gen_name', CHANGES will have no effect. Update
> iga64 (libigc-tools package) to re-compile code."
> @@ -92,7 +92,7 @@ EOF
>  # Compiles assembly to binary representation sent to stdout.
>  compile_iga64() {
>      cmd=3D"cpp -P - -o $WD/$asm_name.$gen_name.asm"
> -    cmd+=3D" -DGEN_VER=3D$gen_ver -D'ARG(n)=3D$IGA64_ARG0 + n' -imacros
> $IGT_SRCDIR/lib/iga64_macros.h"
> +    cmd+=3D" -DGFX_VER=3D$gfx_ver -D'ARG(n)=3D$IGA64_ARG0 + n' -imacros
> $IGT_SRCDIR/lib/iga64_macros.h"
>      eval "$cmd" <<<"$asm_body" || die "cpp error for
> $asm_name.$gen_name\ncmd: $cmd"
>      cmd=3D"iga64 -Xauto-deps -Wall -p=3D$gen_name"
>      cmd+=3D" $WD/$asm_name.$gen_name.asm"
> @@ -107,8 +107,8 @@ for asm in "${ASMS[@]}"; do
>      cur_code=3D"NONE"
>      cur_ver=3D""
>      echo -e "\nstruct iga64_template const $asm_code[] =3D {" >>$OUTPUT
> -    for gen in $GEN_VERSIONS; do
> -        gen_ver=3D"${gen%%:*}"
> +    for gen in $GFX_VERSIONS; do
> +        gfx_ver=3D"${gen%%:*}"
>          gen_name=3D"${gen#*:}"
>          # Verify generated code will not contain IGA64_ARGs.
>          for d in $(IGA64_ARG0=3D0 compile_iga64 | hexdump -v -e '1/4
> "0x%08x\n"'); do
> @@ -119,12 +119,12 @@ for asm in "${ASMS[@]}"; do
>          code=3D"$(hexdump -v -e '"\t\t" 4/4 "0x%08x, " "\n"'
> $WD/$asm_name.$gen_name.bin)"
>          [ "$cur_code" =3D "NONE" ] && cur_code=3D"$code"
>          [ "$cur_code" !=3D "$code" ] && {
> -            echo -e "\t{ .gen_ver =3D $cur_ver, .size =3D $(dword_count =
"$cur_code"),
> .code =3D (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
> +            echo -e "\t{ .gfx_ver =3D $cur_ver, .size =3D $(dword_count =
"$cur_code"),
> .code =3D (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
>              cur_code=3D"$code"
>          }
> -        cur_ver=3D$gen_ver
> +        cur_ver=3D$gfx_ver
>      done
> -    echo -e "\t{ .gen_ver =3D $cur_ver, .size =3D $(dword_count "$cur_co=
de"),
> .code =3D (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
> +    echo -e "\t{ .gfx_ver =3D $cur_ver, .size =3D $(dword_count "$cur_co=
de"), .code
> =3D (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
>  done
>=20
>  cp -vp $OUTPUT $INPUT
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index f5f7594e1..6c8766a8e 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -217,7 +217,7 @@ static struct gpgpu_shader *get_shader(struct
> online_debug_data *data)
>=20
>  	shader =3D gpgpu_shader_create(data->drm_fd);
>=20
> -	if (shader->gen_ver =3D=3D 3000)
> +	if (shader->gfx_ver =3D=3D 3000)
>  		gpgpu_shader_set_vrt(shader, VRT_96);
>=20
>  	shader->simd_size =3D SIMD_SIZE;
> @@ -260,7 +260,7 @@ static struct gpgpu_shader *get_shader(struct
> online_debug_data *data)
>  			gpgpu_shader__write_a64_d32(shader, BAD_OFFSET,
> BAD_CANARY);
>  		else if (data->flags & SHADER_PAGEFAULT_ONE_OF_MANY)
>  			emit_iga64_code(shader, pagefault_one_of_many,
> R"(
> -#if GEN_VER >=3D 2000
> +#if GFX_VER >=3D 2000
>  	// prepare load descriptor for page-faulting address
>  	mov (8) r30.0<1>:uq 0x0:uq
>  	mov (1) r30.0<1>:uq 0x12345678000:uq // PF address
> @@ -296,7 +296,7 @@ static struct gpgpu_shader *get_sip(struct
> online_debug_data *data)
>  		gpgpu_shader__write_aip(sip, 0);
>  	else
>  		emit_iga64_code(sip, store_sr0_0, R"(
> -#if GEN_VER >=3D 2000
> +#if GFX_VER >=3D 2000
>  	mov (1) r5.0<1>:ud sr0.0:ud
>  	SET_THREAD_SPACE_ADDR(r4, 0, 0:ud, 4)
>  	STORE_SPACE_DW(r4, r5)
> diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> index 333281a39..8a8de09a2 100644
> --- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> @@ -3,10 +3,10 @@
>=20
>  #include "gpgpu_shader.h"
>=20
> -#define MD5_SUM_IGA64_ASMS e184c9b1ac9287f33544ad0737b2831a
> +#define MD5_SUM_IGA64_ASMS bf6c1c37f18b9c42e4f4cd789a12158e
>=20
>  struct iga64_template const iga64_code_store_sr0_0[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x00000961, 0x05050220, 0x00007000, 0x00000000,
>  		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -21,7 +21,7 @@ struct iga64_template const iga64_code_store_sr0_0[] =
=3D
> {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 3000, .size =3D 52, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3000, .size =3D 52, .code =3D (const uint32_t []) {
>  		0x00000961, 0x05050220, 0x00007000, 0x00000000,
>  		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>  		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -36,7 +36,7 @@ struct iga64_template const iga64_code_store_sr0_0[] =
=3D
> {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 40, .code =3D (const uint32_t []) {
>  		0x00000961, 0x05050220, 0x00007000, 0x00000000,
>  		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -48,13 +48,13 @@ struct iga64_template const iga64_code_store_sr0_0[]
> =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
>=20
>  	}}
>  };
>=20
>  struct iga64_template const iga64_code_pagefault_one_of_many[] =3D {
> -	{ .gen_ver =3D 3500, .size =3D 44, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
>  		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
>  		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
> @@ -67,7 +67,7 @@ struct iga64_template const
> iga64_code_pagefault_one_of_many[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 2000, .size =3D 44, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 2000, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
>  		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
>  		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
> @@ -80,7 +80,7 @@ struct iga64_template const
> iga64_code_pagefault_one_of_many[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
>=20
>  	}}
>  };
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fa=
ult.c
> index 605d48946..d3b5aff47 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -51,7 +51,7 @@ static void gpgpu_shader__prefetch_fault(struct
> gpgpu_shader *shdr,
>=20
>  	emit_iga64_code(shdr, xe_prefetch_fault_prefetch, R"(
>  #define IGA64_FLAGS ""
> -#if GEN_VER >=3D 3500
> +#if GFX_VER >=3D 3500
>  L0:
>  // Set base address with scalar register
>  (W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> index a95a09567..0df7fe20e 100644
> --- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> @@ -3,10 +3,10 @@
>=20
>  #include "gpgpu_shader.h"
>=20
> -#define MD5_SUM_IGA64_ASMS 713349079409a65ca940d805eb29083b
> +#define MD5_SUM_IGA64_ASMS 153c8c0a5a3ed448d86f86bb51e8d140
>=20
>  struct iga64_template const iga64_code_xe_prefetch_fault_prefetch[] =3D =
{
> -	{ .gen_ver =3D 3500, .size =3D 28, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 3500, .size =3D 28, .code =3D (const uint32_t []) {
>  		0x80000061, 0x60014220, 0x00000000, 0xc0ded000,
>  		0x80000061, 0x60114220, 0x00000000, 0xc0ded001,
>  		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> @@ -15,7 +15,7 @@ struct iga64_template const
> iga64_code_xe_prefetch_fault_prefetch[] =3D {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
> +	{ .gfx_ver =3D 0, .size =3D 0, .code =3D (const uint32_t []) {
>=20
>  	}}
>  };
> --
> 2.34.1

