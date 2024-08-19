Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED0EC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 05:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C197610E190;
	Mon, 19 Aug 2024 05:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BchB8haG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92C710E190
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 05:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724043886; x=1755579886;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=23jufeFmlZ2qoR9KTAmcn9wFVzvCnhLqktGgw0s0wEc=;
 b=BchB8haGpsGCnAeHdRzenWaFj/NdnMkmB8i+PvsrMxV/v/BFGO1G305/
 3QCdQugOkVJz64+1bb+L66mPLXJTP188d57xdKs1RyDUZ4xioXGzBDM1b
 mEHmz+LddVVoyCMINR6RpX2lgpqW4XDnE752w+n93tXMSYWNZ5YMcfqV7
 tfC2/o5xlIyj7U0GCvKh5IsHYCnUr4esexj4vMIk1Qp6Sfd7Bxv3K2SBs
 voz+TLkkp8MJ09F2257RvwFePWerT+0lAPqfqOmUxYWqkHorgsv/nOos5
 RGxRIGOzmXR8beazLurre4OmpDg71O9h8lb6pDI1by7gJ8qzeB3O0D/KI w==;
X-CSE-ConnectionGUID: XWp9BijQRbGVSBFsuTMk+g==
X-CSE-MsgGUID: xZLuP/TZS7S4EiWH+8jotA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13085843"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="13085843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 22:04:45 -0700
X-CSE-ConnectionGUID: W7mbcYwgR9+p5uMClCXAdg==
X-CSE-MsgGUID: YW2PlO5YQOWhC3f55DrHew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65078320"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Aug 2024 22:04:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:04:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:04:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:04:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUnk7sL3U7BPMUlkWQdoWi/iex1JPzXFcfrkjMLRgKMWATz34b59h4ucR8rrlx0wUSw0GW0kxYJMNccZ7Gdfl9r5Ogre8etvUTE8qwRaB7rJQl/A8/Oaa5JMSAvLKpzsmvB0ZdEdW6pXXs45/s/YVHFZSK1ZAT+yNEWygFcPpmi0I+4I0a24O+xyWaKEZKGpZihQ6FvbZgWI9E29e9IL3//7odiwRtNyNeuiEwP80W3kgQUIQAoKW4+7tfJbQxOxqem16COWa7NPQ8pc2i+tYaeFFPHOn2kuK4G5cwvP0kw+WR5zp4jAGZRrvYwU5rNXc0sEQyZ5QhurEGnRxp8HYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcU+Gdc6BnyD4ixCIZ2QUx1AmX3PL8BViRqJEAQdiBk=;
 b=P46v5TRyEBX1TyBdNnPSaZumQzNF8+3EXl5zIzSva4HVOF8XVibMMw/2WGOOVS06J2fjjJlqXPHTy+Z7BJYRfgEXo1dNoK223hRH2lBHxn0pn7DJ/SDApzHh9DdDFAoWVDBEnqQe2L5YZu2KVmUh3pg88oS+0d0piDVS6h60AGC1bIeA0aHq8mVSsumjUaTE09XF7X7ioDts1WRxcufCbqdsyB9JYCPao5L7WmuR6vEKox4N2b4n3XKw30gSa7JWLBsuhQgjRr+TQJ40Rh/FlBemu0ID9HIaXmz+VI7OhB0TrvGptKg2DGtFng+CTcPID3ndxE1KkicOxG3HW0alYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 05:04:41 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 05:04:41 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try commit
 call
Thread-Topic: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try commit
 call
Thread-Index: AQHa7ThnvZxHxd3/ekCaQuA3pWH3q7IuD9Gg
Date: Mon, 19 Aug 2024 05:04:41 +0000
Message-ID: <DM4PR11MB631243C49E154335DFEAC49E908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
 <20240813041936.4014668-3-suraj.kandpal@intel.com>
In-Reply-To: <20240813041936.4014668-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB8245:EE_
x-ms-office365-filtering-correlation-id: d4d763bd-8127-4d98-34d1-08dcc00c6f05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?y5BzaJWRQNTpNM9KqZ+h/o0DWgCV0rR2dbJDON8Ahqod3gI5b6Af30q/VUdk?=
 =?us-ascii?Q?F//WyT0ce9WjK9mSlQ1i6NkzC8PIVOXS5Pz/6fJl56UtvgDJxdi0kqr59EKH?=
 =?us-ascii?Q?LTUWGz0mzI2vh/G53kvcj+5oEh/PqIB1Afa8EcelpnSpkA7xYPLlxQKVkvya?=
 =?us-ascii?Q?xg+M/41T30ZFqJgnigSwNnAh4PhlQJ9rYZ7mUNAOAHw8tqBQe8nPamrimS/V?=
 =?us-ascii?Q?OBj9Om67V0X05SzItdv36HVST7fIy+tXu8BBxyjcB+7UPeyFi5OcMl6LxV4N?=
 =?us-ascii?Q?KJJ61vMN1p3svikSQLOi/L0K9uBRtpdsynC+4F3tyZIdFFT9prD3CsHCDB8U?=
 =?us-ascii?Q?GEqYJ4XjjraKsE1OHPmefR3wrnGv1EOtfP2CsOfWyAs0RwOICHSCXw1J7+Nn?=
 =?us-ascii?Q?19USwbtS1bdOv1JBMccpcREU3gL/YvOW31i9gyfS9KpbvM3oH4h1UXvStFbf?=
 =?us-ascii?Q?EdOoJS92kCRQOjpSCeMMsc07q/8t5MbU0wYie034MYfpzPYI38UDLlC2qFnY?=
 =?us-ascii?Q?8/WgLFfM4AQId4WUZIk9EQVSpo9Hh5mZPnaTXipPJNX2C747Hpurhc91m8kf?=
 =?us-ascii?Q?Y6unKCIjaxM4RzOiVR1I5tvhy0Yj3slpY1abzCLRDD+7FpZxMJgpNi+sGZHb?=
 =?us-ascii?Q?N2uIBJ80+eSfU4fEP564zMz6endrNf/+yrn54/48zZzCCAtBc/Pd806jTebl?=
 =?us-ascii?Q?ruEYsG6z0jKU+QEKb+HMVB6txdPTx66E2tdagMG9xqv0Wbmj58m37NSdMC/E?=
 =?us-ascii?Q?+Tga78OicOj9m3o8dq/xjcZ9S5Gmh+S9n504weya64ZyyCaOpO3PuPxbdTZ+?=
 =?us-ascii?Q?s5jKbL/p9JblvVb0jLAgqeb0oBwP7nrD3Vyxr6TmDiSwkrLiQLo37Lkhg3+3?=
 =?us-ascii?Q?6ZBKEOjsHiCjgs3FDkqSomGhlxOXqWloJ+oSLfUzZc4iIMmkeLR1Ff5hsxav?=
 =?us-ascii?Q?fEwvD6FJU9QSNSTjE2Mhr4L1wk67a4urL9jMpgFigoA2RxVfBOQSxzIzOTZy?=
 =?us-ascii?Q?q2czwVoRht9HwY0j7iYDXLtcY89DmEGDxGWYQUCYX+O12ue46gGt5WPsGJ22?=
 =?us-ascii?Q?xroPHiG1CihJyLyry/vRVeVKbKAy2DcYxnADxNzY6Fehgx5sAEQibYeKPzHk?=
 =?us-ascii?Q?YFEaZ+jdHFPBo91BSnCN4B1L1upGhEi24xha5yuGZxB5YPcnpsqF38SelYMI?=
 =?us-ascii?Q?nUprKW/U98oSkXU+ci9SfmLU8EdRrJQzHD8xTilMXgTr3ZyYdxLTQdds6pSZ?=
 =?us-ascii?Q?eFi7el/avhHw64xI3FMNMVP0s0yJTzfkfq8wn0VY786GCrLYYNXw6lYW4NE7?=
 =?us-ascii?Q?ApiqOCp/TP8K7DMYTAwJ35Nufa2cOzt1IS0Mp5JfmBLNLzk93WXSV+qVLnTb?=
 =?us-ascii?Q?+MFYeJ7G+GQtgYv+JBs8Sooe8lQI76xnSxy3LfNw2CTdKCbWRA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gl2KtDdQYXD1BInu3xeH64DIjGvBnfQ38Aqy2g6YZGk46ZgpG0QiYPmb++ti?=
 =?us-ascii?Q?xivyi+YBODxuX9VdQFb5TSc2jjek7JAxJmlFSnBdmaEZSKKK7/FwNWkWlPpg?=
 =?us-ascii?Q?35MtAJvtAK5JBMKrlS6L1/TOSA9MZMVFAdD4w+iNchOyhwtU5/zPLl39SxmO?=
 =?us-ascii?Q?bOhgQBeTZfaaWmWqahJVcGDxjf9JdrVcieEsrwDCr+DHPa/SAQstClwmH4us?=
 =?us-ascii?Q?UuMcLBYm7eqZVQEsTcydnKZXu9QSbUrJ+ichSpSKLjzFoWVMDxw+BpcHzUiV?=
 =?us-ascii?Q?snvt1BbVQIV3y6XsGuwAVQjna4sk5WZTH1Z/Y7y17mCYuFx2jjUzlO484P+w?=
 =?us-ascii?Q?Am+JGFJyTA/+pp4B4sM7HwpUfeQ6fAhm7KfrjpaK5Bdwi75C91iux/j3MF+3?=
 =?us-ascii?Q?nXv6LgljmTWpXzT+2uhGIbdPORSgfXpq7xUal53hb81myAwTZm6BxBDd9vFO?=
 =?us-ascii?Q?fj9XQ+DBdFh1wjWhKJg72TXHx8kbgiJpIk15DbyThqC37Fcx/o5umvHmDaN/?=
 =?us-ascii?Q?syqbCzhZpBLuRpGMBZfH1J4k3bGMBj1CYv4SV22yxVNbZkEcoRINUNyohXrW?=
 =?us-ascii?Q?1J0D29ptJ3fIK0H5FjGf1zUmvJqsA+vLM9McRy3cbabxBXLTfftTKI1TxldU?=
 =?us-ascii?Q?4WNPhTiX4Hesy4wFpNYef9bE59jWGnCBGq0Zi+SUsW8j/ILhJjy43pZW+PTM?=
 =?us-ascii?Q?tr+vSYXwu0l/ZoA48qRkqtYk5DdoVIlHudujUJLpuz62SWmDLY/a4ESHwH5y?=
 =?us-ascii?Q?/AQEcKUQb+ORnlOjwSk7B7K+/P96HnHfpKTgkcDp8cuI572GJwn04uZMdCnh?=
 =?us-ascii?Q?9R9ap5mIa+wnkmf6YsBVo2ROWe7lEzZuO+Kz42OkvzBTlmD0J9Jbqsx24iKh?=
 =?us-ascii?Q?AjF+Esziy5niOwpuq7+r73zggzO55dYv402IuBcFDHF/ptjFxz41oRYywQs2?=
 =?us-ascii?Q?dQYBB26tcvuAuy4VCRREp+kF4Ah53WBflAfvfFS/tK9mYZeLF7b+bCDaAE9o?=
 =?us-ascii?Q?Jmuv+Q7XQ9vwm6tidN6Q7fL4TNa3ul0Kpmi0PB5gy+QDgNG2Wa/4/jm+CssC?=
 =?us-ascii?Q?GCW5lKY1q6ek5P2ueE4y7WxajzhsOkLARfUg6imPy5wOZDa9kbJ4RIn1AQFD?=
 =?us-ascii?Q?ExmSaiarXVy1BbVo/dYAom32YSAfLbDFKU6mGcK3iYzJfyJZUftrdfIQY8a5?=
 =?us-ascii?Q?8e0lQ/q7eyYqhAuyRCuUtX44MJNFLBa9P0mCRj7jbUVfGh8XLKkDN9f4IKbp?=
 =?us-ascii?Q?gVt0YOK6H+3pbTIkRgmba6edwJNSs9lEGl1p23J2DbpR8p6p3CrJjeUt60m+?=
 =?us-ascii?Q?IjRb8wXyJIEwsnHrQLZ9FU02onfme2SxxIgck4RnZFcurSdr7AC0zeV5UuDk?=
 =?us-ascii?Q?Fk/1fHDOX5sqeLw7ZlZykN/5mifuXJ2clh1w8wrx5mX4F0Slt1eCqAudo3Ol?=
 =?us-ascii?Q?5QteCmpUiWfKymyccWSyII1VopYh7CWwqi1gUJxK+bCrOQOuMO4KFbNmgqOn?=
 =?us-ascii?Q?MBb5mr+jWQYlckopYSeETZOglkwSee2VoyscLsohJg9rpdZ+xMX44uIpzloa?=
 =?us-ascii?Q?MCTFa81bhqOjvTVinD8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d763bd-8127-4d98-34d1-08dcc00c6f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:04:41.4393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjRzOmtUQyYs3PdbPve6UexF/ClFhQhUl3oPPqpqi/2pxv3dNgbdn8bXAaSDB1vqBPY3NoW5QHsbCjq7JXNIjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Suraj
> Kandpal
> Sent: Tuesday, August 13, 2024 9:50 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try commit =
call
>=20
> Currently we are calling try commit twice once in if condition and again =
right
> after that. The correct sequence should be we call try commit again only =
if the
> first one fails.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_content_protection.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 6bd744351..db6dc17b1 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -679,10 +679,10 @@ test_content_protection_mst(int content_type)
>=20
>  		for (count =3D 0; count < valid_outputs; count++)
>=20
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count]);
> -	}
>=20
> -	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> -	igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
Sequence change doesn't looks correct please reverify.=20
> +		ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
> +	}
>=20
>  	for (count =3D 0; count < valid_outputs; count++) {
>  		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> --
> 2.43.2

