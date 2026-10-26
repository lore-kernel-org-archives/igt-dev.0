Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C2606A322
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J/JmlmYf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60C210E035;
	Mon, 26 Oct 2026 11:46:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B4610EE63
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015132; x=1824551132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w22YOLzhSmvhUcCZhHkDcEBgWeB5+a+PzDlCnO+DQ4Q=;
 b=J/JmlmYfzXAEgY2rhGkfuSz5YjTwkbpUvZWJVIb6RDUN889n0LD0qKYl
 06FQ/9iC7DUi3oc9fj6g6dHeRjGlPuo9XWPEGGqhDitfR8S2KD28PtULJ
 r0w5szGOWK9VapP8gCPOmI5MU9MLMXnQs/w7VsPNMHGM0wrwfPhlrUq3I
 AjVjl2Bhh7wHv05AEc+namox/Xw6TlonMMVXFbCZ8fMqtQrfzGkhHGE8Z
 Iz5WdLJ8NzeXXeY2RGOY1oAaL/FaoI/mzQtL45rvbKv1mZI7E3UllrZut
 70UW60Qm8u8g/O/+FBY2fLevaPYE2ys+RHcYs7P71VZJ0cxRG9UcrFGX3 A==;
X-CSE-ConnectionGUID: 8mzXXVQ1RmmC+OJ02F4s9Q==
X-CSE-MsgGUID: DuqyyBJUSne+bOdxHuQxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1689469"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1689469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:45:31 -0700
X-CSE-ConnectionGUID: np1kgR4qT96mk9N1ryTfJA==
X-CSE-MsgGUID: vZmfChsAT7if+PPQQwLl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4149199"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:45:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:45:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 04:45:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVmf+k0gRZDVJvGaAgGTeoxQDxVjZ2ZlBzDA9r7Pbunu2XfHwKrFcb4dVcYbd36O9koSj7D4ZKF/t1xg1u11fi6WTdGJqRWsy57OgLNOFhe1zK9DRkTtbPwM+MhbcK1Xmg4gvZj2ZFGlNFy7G19MeovGg4v4p1us3p6Kc5gtikKVnQ/OYYxnooTcJDYm+GR/lmgK1lkKhTsyBcShj1lf3gZlxiwZuKyB/cdpHhLF3vn1/+igkyfrq0G6fhvvat6HEMwLnHAbWP/tBGkNCxIfaPWUIJUCSoh+bI8+aLIakliqYxE4kCfN2BpfqevuFY0FrBxbr4Z3KBP5jty3sZXf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShPnQw4dbm4dadfnwKZvEuskP3M1At00j9d0GBiNJJU=;
 b=EUGsAxVrFkB+XM5dFFbjV1fOB7BTyw09kBmGoDhOMJZHROmf2IzpCB6k33wEjSmln/8eGmw+Cq9myZdq8G7fiN+qxpTZlXYb9A6MvSSgjr9XyXLoUAaEdCSw/l48mYY79VNOQhmjpka4gTKnV/M+t1I/OVpMna8BKMrAxp0cEEltuc39wr7vVhSeqWXPWziNvkKhz6/CeJZH7BmGHxy4c5uA0yNEjlGHVdjv1WKhJC1rNxmqQduoxRjOE44mv76tBs/M6sH36p3agWCaTgXv8sxB/X3V1ZqOQbRWK+0YQCKWqTke1shC3YsuSMn015Qbh8Dg8kYH/yeSu/pgoexyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:45:28 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:45:28 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH] tests/kms_cursor_legacy: reduce CI debug output
Thread-Topic: [PATCH] tests/kms_cursor_legacy: reduce CI debug output
Thread-Index: AQHdZS7hCs9E8NTiVUG7yP6CTeBuaLcPsnvA
Date: Mon, 26 Oct 2026 11:45:28 +0000
Message-ID: <PH7PR11MB60533C56BF93F3436945563CE7612@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261026094521.1410518-1-jeevan.b@intel.com>
In-Reply-To: <20261026094521.1410518-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB7770:EE_
x-ms-office365-filtering-correlation-id: d4bde142-15a1-4e9e-8c20-08df3356a198
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|3023799007|56012099006|11063799006|261021123027099003|261021121427099003|10067099003|261009223027099003|261022105027099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info: 7b/+D0LkDkfUPeaVv8pttH2kHjm5w/61i9l5ytPOAUUqgIy/cp5HarTFH59CmILhoH4n4FaD1aTKN7iR99Nms5339Urhn0+G9t3w9yXfxMXvr7nTCEJ9nX7ZCtFhfV4PRHcxOwaxSHbY43BgKX7fhmQqc8tFbTGCpACTV4xOMun/wAzxTrf/b/9dtr0n7P6a8OXy24NbnA98/lOHpkK/yNq85bFAriTc9jrNZzYFQlHFGkNgoflF64a0Vr1x319CxDW1OmI3oUaVAxaIJP3JiEssT3H8JygBxvewf0Mijlrja8R6D+8AiDlcR+WRsRaKTeg/IrlBwziMy5uxIDmVcFG4sqz5cOqdeS78Dgkw2nElcjjQaAe/mhVAoBPCSAzGnLvjnI8HsRE4leZ16f5yPY1Lwkj0XnjhPj2vP/VoYGM/p7GpalLpPMYQf/s00/Zz/VzzQ/+AMEpjAFEhZhlWAnnNm6812WOUREPS6Z3KDjSoXWTZokPb8qYzzOgcj2+6b4VLlhbMRnW58di46MlZkdhXg7eu55XxnACnbrs0b4n5VOWYVaMJ0A2Eu3Hsk/wNGOcQADqZjAGYDpEz3zslGoh5RDQLBCsqY049vFWXhEQ58INtz/8SLRd4mXECbuEJz6jhEzcOgoibPutbtayHxwE9mkPckBjrAXeVjnzmlV8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003)(261022075727099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gU1jquUkCkhu7SBw7jXA3hgbsQwcluyAuiQJt60shuzjW3gTnppEhzcoGGsp?=
 =?us-ascii?Q?5JVY5VqacgXorAhvC0mEQ33glCcNP5wTBQZGrMSUuvCxFpAeXKpcrc69M04j?=
 =?us-ascii?Q?9NH2qy+b+GQ8AUpSoE0759wSPnGnkTO/VG+ynMtIb10psqzXxqYxIqSO21yS?=
 =?us-ascii?Q?j7Eqlfcd+pFDK+qkD/n5oIF2lgDN47tExYsNAkQkPYCQQF8E7YIw13/pemSq?=
 =?us-ascii?Q?nkUaxSVBWDhFF8ce6Fky83wIpyqbhX5oHQqtIXWq0rMJYRQtZspSqZUtcVFg?=
 =?us-ascii?Q?llRb2j/45VskKeFoWMMbQ4kyf1Rp5z/J/x1J7dAjY4BA3i46TokLFHhx7XRY?=
 =?us-ascii?Q?VAcwtCOKu1ibWuNM9dqvimqMTDC6xmAgva6BNkNINjw4p9BEGnA7BG5p+2EZ?=
 =?us-ascii?Q?40tXsCWks3OF3O1G16Y90ezQ1jlhmBcrkVE4lSwQm0RFQPmjAE46/VZ7NXRb?=
 =?us-ascii?Q?Tt+owz3qi6N1ZLUkGeW47k7BIO1cYvtCiFmxugYMv+GRKkFPyK/EnRlo2UTx?=
 =?us-ascii?Q?tmUcLCWuhqgf4y1o6o70hcgDRx3VFexJ19SPAzE1lyiA4nfo20FXMpCAJDdE?=
 =?us-ascii?Q?fFklYCUwSKHJPXmYNaWzafIDxOOxuT4qxdCzYCxMEM4mqxd3c99iPVtIcUFg?=
 =?us-ascii?Q?rhF++e6OJZxBFi4vxJ1vROBqVC0K72eDBM1DLF5LbJwv53Pndyj9CWXD9CVb?=
 =?us-ascii?Q?joTuA+aym/DvIaz3mPv56aYGJRvXNex+Wy3TANYwYOeqITyaduM36qyAEYj0?=
 =?us-ascii?Q?MinCBR3LQKNj3+s4kw4t5rls9uaMTXNNCNxo8WrNT34L/e4SEg+A3yUC43c6?=
 =?us-ascii?Q?Noir0UlDanSZPLhNJphnauDk2dawfSSASBlwCMbZB20m5fbfjZRD4CUqOsbJ?=
 =?us-ascii?Q?nosEhlGuIrKYF7GrvjytrDhSvi0qa8PNtZZDPbbDLGnlOwfeQUuD2CyrvAjD?=
 =?us-ascii?Q?9dy4oGamkqLb+stMFWctXJt2AvdRaelqarA/hDaP0zkGlsn5ToSpcJp7YJCZ?=
 =?us-ascii?Q?rlPvR15CGRTPaewVOUT+Ku5tDMbeRg5EKBgMzTfrQYITBWiWOpnmYs4bceOs?=
 =?us-ascii?Q?G6/S/ekS7vD2fW6Yb4VP9mMbrAk1axQEgZj4TfWv0GqUX5DciQCQZqjwLDMd?=
 =?us-ascii?Q?YuobOyr/6Np0bqY3WyLt1eXvAHCWta15swL+jvBjy/wjt6MJqUmRWiax2ZaB?=
 =?us-ascii?Q?iTJX8IKI0OE/Ty3GSwVNjT1zaDnvIthbp3ytyDN1xPHOGiVe3LkDmJr1+KIk?=
 =?us-ascii?Q?JXSYMYJE6e8l6NzTaKK6EIE4qj1BF1D8JK1X2VIhBsvNAG6J2epVAiGvm5Nt?=
 =?us-ascii?Q?zsWUSPZJivMLQV45UqnzeXIE6dBTzOFTCRS5JUU78Tzp6c5ZXl5NgoD5RF7u?=
 =?us-ascii?Q?5BSCnRcZNAY2GyCaqWza64F8tqHCfB0NFot2ReMMi3TqRHkgpw4XIrNzA5YS?=
 =?us-ascii?Q?3ZpsHHIvkIbkZU9AU7dvjJe9Igh3FX0YKr1W0Mq8aa0u42Y5/n2msFlN8T0h?=
 =?us-ascii?Q?DgA0JKyvsECx/q7unXzgGbzIhORTbdzY7/eZ89shWu8/atc+pL7BPsnZ7yfm?=
 =?us-ascii?Q?xAorYxw7V7kuvJzT19grPMtbs74zRb6s2dHvpZk2TRGElcPpjyzoXSRDLh25?=
 =?us-ascii?Q?XsWnOafovAzixL0ntx1zG1owca63b7VHpMtoF26+gGKyYHA/7rvdaCqNEac2?=
 =?us-ascii?Q?UqP283ythPvL1fkt6CgHseyXensD/rf3/oe7NQMSOpXlk8sBBu5LRI6ouAMl?=
 =?us-ascii?Q?GBYlpydzBQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Efu6rSFgv85RpSP/xnPVIrDTBj1VqqDjzY1PQp5NPTXmgJori41slI3Y91hqoHIzbl40aEIpyd6+ZcRvGH8CJnK/rU397jGsSSR07DV+p6x6RlYotkxaLtLfJtWXtzUQZaRamoJVZJovESUrutsL2Zz0QuQXgiyLMQUfRAJjlfIrpp2DNl362uaob736bs65iyGKG7LPQCvMOpTSu/Dr5hAqVrkjnhk/xCurr3RayYgB4quOjgHpoRUHCm5WSwo4MmiCf8wmaxFsv6Rd4IlNUP5jUf5PAx9+BY6wsBHNrf4eYJTMOrpqZ3rtCGZ1xKj/r2oxh9p+a4KVoEjwzbH7kw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bde142-15a1-4e9e-8c20-08df3356a198
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 11:45:28.0661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lNCEtmkHNeYAvoHlQiOLoivZpfZAjA1Bx/7Yb+Jxq2Lc5dP14PwX8vkNEcD3oXhLbX6F4Dxqr8nGiFHiUlyLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeevan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan
> B
> Sent: Monday, October 26, 2026 3:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH] tests/kms_cursor_legacy: reduce CI debug output
>=20
> Reduce CI output to avoid exceeding the runner's per-test limit.
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16960
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16961
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c index
> 62339855e..9c6b63cbd 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1888,7 +1888,8 @@ int igt_main()
>  	};
>=20
>  	igt_fixture() {
> -		unsigned int debug_mask_if_ci =3D DRM_UT_KMS;
> +		/* KMS debug logs can exceed the CI per-test output limit
> here. */
> +		unsigned int debug_mask_if_ci =3D 0;

1. The library's update_debug_mask_if_ci() log message will be wrong.=20
It will always print "reducing the DRM debug mask to 0x4".=20
With this patch it sets 0, so CI logs will claim KMS debug is on=20
when it isn't. Fix it in the same patch/series.

2. Please mention for which subtests (if any specific) this log reduction i=
s applicable=20
in commit message.

3. Rather than turning DRM debug logging off completely, have you tried a
lower mask first, e.g., DRM_UT_CORE (0x1) or DRM_UT_DRIVER (0x2)?

	enum drm_debug_category {
		DRM_UT_CORE   =3D 1 << 0,
		DRM_UT_DRIVER =3D 1 << 1,
		DRM_UT_KMS    =3D 1 << 2,

If CORE or DRIVER keeps the output under the limit, we would still have som=
e
useful context in the logs.

Regards,
Pranay

>  		display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>=20
> --
> 2.43.0

