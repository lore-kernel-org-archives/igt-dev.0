Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC1AF43834
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 15:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B79B10E271;
	Wed, 15 Apr 2026 15:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXUCOInx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A006910E6FA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 15:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776265250; x=1807801250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1B1/TfMQS+p6GrBnVF71bVXbHNK2TsZw2QIyIYa4c4U=;
 b=BXUCOInx0/HxyKAQmEanY81KpgY+4loCLbbp2vY20EO0dKboeM2p1/NA
 5ivIsJ6hhHtqotcxGxoA5YUg6VE6Dy1VAmjfRvOz/Aa94gq1SYkg+1iIN
 c+SelfA0ktkdY/j43DAo0nWjJv+rW32OMecs/UqulXNR5nWAQfIxyTc2U
 cAnloDXEEfVHB+yBGuiMCBeVh1hTfcfugTbJKMlf9shUtJV/RktFvR9Bz
 +X5aq/1fUurSqanEpN3NqXGqqaLS5p4IANMISMGLS4QfvkbfMKlZOsC/p
 DHK5B576YQfNI6hdod1I2bDOIw0EPSFJA00soEsaMHIphCRk9QPN0jvkp Q==;
X-CSE-ConnectionGUID: 6FPa8GQTQ+Kmec2RtD98eA==
X-CSE-MsgGUID: D151NLK8QOGZeg3FtyeIGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77150243"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77150243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 08:00:49 -0700
X-CSE-ConnectionGUID: JbhneIeFQDKv+wCZQB7ytg==
X-CSE-MsgGUID: wbFZDpcySq+fTSv1spAa7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234833439"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 08:00:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 08:00:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 08:00:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 08:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ2pM9k2qfaQztlz9L5al/Yrycw/moTTDU0SuRIz3HklLR2ZfDmCCNTzzvgnh0v0L9HsTZuxvShlCOLe0+ixLbWTvVPm5yxS3v9CyHvxfpNgPTwMlQa6Gqrg2MwcWjNtL4nyMhvV716HxICn+95vjIi5BB40kGqDEZcoO0pI96TcMeGxrjHGEgmmMMJyd96MPvSUB0Dl5wN5GltslEOIkWe+ZHCphxJDpidJC4mawwlnyV+UmuFt3vdcBMPbtiyZDYOzygvFg2achvDuf5SYfLkRJeL5FvpOImG0Pgwc29HjazeRKpoKmBcb7nMHTQUDf4+K2eDBkGKu4zuVDuwmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du8GElU5xpFECbyry3BNtuScs3tpA6+X1VDRclxOCaI=;
 b=HlOEc0cXsUq5gsfqyht1bhDGykzqNByRNpMbk5RLI1JjcQVcmiJ+zWNuIVuWSTN8PykQQrlA7T0k/lw9q54yAnaNS4Ax6+vR8uouDprxyoURXt7QNurxo13ysYdjfmlyomJOmNch7wo8Nmt6NhGk3xUlTHXBhn9+RGSLCE8kA8UrAWT8SgNzARrcGatArCQKKwb2KJvLrc0mKm5Mza5n5By6k0arDePK2wyA4TB9kUsqeDwpXyCgw4puB30Wj/+6lvUHPMa5tF+vDnoIIFWFcS1VktMU734LpHIrsA1x9a3UDIX+lPKpwYtcOnhtG8rF4JT52sJpU5PFmT3JjoZvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 15:00:45 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:00:42 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH] tests/intel/xe_configfs: Fix ctx-restore subtests register
Thread-Topic: [PATCH] tests/intel/xe_configfs: Fix ctx-restore subtests
 register
Thread-Index: AQHczJtcyl3delUD00G/6bFzwLxvk7XgM88Q
Date: Wed, 15 Apr 2026 15:00:42 +0000
Message-ID: <SA3PR11MB81186E8A26F0F12C15A0E2E6D0222@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260415062137.745993-2-nitin.r.gote@intel.com>
In-Reply-To: <20260415062137.745993-2-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|SN7PR11MB6897:EE_
x-ms-office365-filtering-correlation-id: b4f7f1c1-ef5c-4b16-987d-08de9affc3c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: ClAxXD2eEi3MTjtJO0q0LKj0uII0RKMvdiGzdfvmTKy89i7G4V60gS7kKGpQfg7IaJTF9nwo4bnLlCct5NMqGCqX11EboCgsyZVpTCLXTihZMwKuZ3G+bpJX09iiJl/Qp65UvlJQ9SuadGTCvhbtDWWBFaL0ok5SaZsAVKt6BT++wGiPEYo0rBfOE1sH4zmV//nUMAPi23cgN4gSt1ALhYj4kvCIJr6elNTvflT1GvbIq8Hgj2R8jhScXWuXhg7t6PwLeV9jHOm/52gsHldLQr+DiWbqpCsyOhIkc92Go7ARWjek/BDJbAKRKc2rfKXAqgVUOrbLPNaz68ByuxTn/6m8Merb6ijjEvl47zLTTxl7XXkAHMykjL1KiuI8tVQNWNQpUTB++neH0H/SMPcMCCDG5+VV9MEyWT8LCBgje7+vrStiPp5PQwIJ6APRSKTZoGpi6hCJXecpqDH6POpbF+MeVwknVUMYk6uPamnq5iVueTNYIinkk0u0GoYO/hQKCD6kGPU7LGAEpJ//ddDK0jdnPDZIXpKjHW29q96aeHGDv6IFHfiYvpItx0wrwdrrc/XN7VjM9Xv14PnIZgdmS061afdpWr/RVNddnCQmYVOGnV2g7OSC3QqfbPwXuUnZx+xqWHufyLmbB5QJqfPxy8Jy3Qx2HNTjnLetdUh74A2mPHp0cX5DtwGX6U3MP2om1tm+Zwu//bJYMI5cD0WY3dU1iAzS6UkuJGwcihJvia2/zUQgp+FKtw6tls1Hf97my9hfnSEkZCe33O8xvVQrH5Tu/C84p4J8wAkwttKQLSs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jbhUHTFf6exe4n34BLKh0IhQr9Aq6SSh5NLgnbNtrUBwuPlRf/sbFzKTw1im?=
 =?us-ascii?Q?dmvNGDysHE6JBnHvO8AfomSfBnO4MImjG0F3K5oIISaNIlLQQN3FxaOc83sR?=
 =?us-ascii?Q?qj08oX5lFBMJCwT2DoYGjIf0AkXxziIzhPk9Yik71hAsK34WAW+KNQYYH7v3?=
 =?us-ascii?Q?YKfi5dN7g6hG7SYWJUzWOiJ4GkOto6kNYV+u6DU3YdzE0Cwiul6p3wNNvJGk?=
 =?us-ascii?Q?W3yeZJ3W4wovNJiMSYpktaLJEz8pZxhKDLBC+bBxFSYELsgNHCrJtlbqsGxc?=
 =?us-ascii?Q?Tgutwhe5TXOMMtIppyMA6EMB3xWmNf8mqaVwNMuDD2fRlWfkRARmVPIP65Q6?=
 =?us-ascii?Q?zObn9/BE4Pi1GyrtbZSEgVnOBJ1e5oDhog8HBP/T278WV6hHkcKgowLRnleK?=
 =?us-ascii?Q?Bq7VyIJ8eC8VDHSgNRmUmygIBV/TrgiAMGdE6AyWtNBO+pn/9NrrLtWwPus6?=
 =?us-ascii?Q?1EKYJo+p4zzzzu/V+ldG7N5UPLoeenLmib82lElod2yfPSpk3mZVtmWBWStH?=
 =?us-ascii?Q?uW8c3b0FEaQ7En4N+ZgRRAK1SF1iZrl95uK/eg+Smo67E8PzHBNYLWKG+aTD?=
 =?us-ascii?Q?5Tgj9ynxKj0zMiBkd78NQH98oMtX+QvQiLqPWBMY7F2i2HpxQxuSVDj2jufP?=
 =?us-ascii?Q?dbXyrtMrPVc2AymIvfVR9oj6c5XZ2wLctPx9xSl0XSb+QPzV6+IVM8rNxzyr?=
 =?us-ascii?Q?JFbGNjVLmQu5UxpZORCaSUF27jlo7BGvfcKYPAOcicxIyt2QjxA/aOxb7iBM?=
 =?us-ascii?Q?XwsiqM0OM+bULXY4eMnLGLbFBwPoJHQKZJ+m4x/lekmbleUKj06X+rUXqmuD?=
 =?us-ascii?Q?Fh+TKakgz/1layCeTLCn2hBeO+fngSHJdNvng9Bw732ukTxpLAh+5nOgc/DC?=
 =?us-ascii?Q?T2jUfumKyUSwVt2vC+Mle1MrWwKUJGF8MtT+iMpGO80cg/vO/sGbLACW5asM?=
 =?us-ascii?Q?PuHldobq2pRmdHvXa/Y6JIiRQnJRxm4kYF87hq1djymRHI23zTvDFkBycOxa?=
 =?us-ascii?Q?EfDH7EAWtK+v3k1M1fUcvAY55Y5KXrWg0dEPBxNr3SRbkOvW4iCsNRJtZcVd?=
 =?us-ascii?Q?thjPZzl9eL2jV7M5WRLQI0MzummZer48GYc0uSXyWxkgyekqQNZYoLqb3mz2?=
 =?us-ascii?Q?Xmd4DMv5ISMhYU7cOcA6jaaJCbABzgoYgYoVLw7n7teQRj+2th65wpkqPf0K?=
 =?us-ascii?Q?IFiDHq/w/CwPTiJ1khiK8nW2mTbUEhNG68WbxTZOLjHZODa4CwIzaNmoaK+B?=
 =?us-ascii?Q?o59yunNLcvrLLD2wI4CD3jaQlBZ25uT6DRlGp2SC07WpycxbfpJyjX65HK1t?=
 =?us-ascii?Q?myR/EByoeuK5Vey7SW+C6k7NyuLjpLbRu6e8c8ZN0fxsDKwXQVUQwBaTEz6K?=
 =?us-ascii?Q?/nWV409js56Z2V3wJI7Mq2NYAcMVyfDG5w8RDURuXJygRP9n9El5D1pOCBca?=
 =?us-ascii?Q?CBIhH/ldKncq9Gq4qsLe0q5aU0X6HrU6pCqsxBMDrwtTTE5lCNsEJb/jkIMa?=
 =?us-ascii?Q?KIptn4LMdjmQJMb22CkUyDx8Bue15WmxWqyMu7jrFvCOK+Hk9tHZAEjyhBSz?=
 =?us-ascii?Q?lq1hUyygXnVbQfw18TFU+e9r1lQxex3M4A4iI4+mfRoQ4J3N4PbsgDXmE+TJ?=
 =?us-ascii?Q?7Xwl37AX5/EsqaEnPSp+9P/1UzH5YhsSff4DgNKHu3eXxQKmmsXl6WzQ53di?=
 =?us-ascii?Q?sPbPmIeN2R+SkqBwEgqBAgf+5anzZwO7pUzDJVL+gVAf8SZLo6idOTJCBcMv?=
 =?us-ascii?Q?m97tAoKlhA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rx/cDUzPAY62Gmza8gp55BDZnUdL7FqcsAlpxG0QipSwE9AP3bE0o/++nsIf1ofr1JU32zoUR5kkpxU/wc0ytTTRK+CKOrWMEKP4m2Klrjk+GB4zshqUJ3qaetjRqqmwtXMzqE6dF/5yp68Ch3e1z1ycvsZz7syzUY9oFfhZZSyq87xhBAJHPsug0MyI+agtzpl+VJmReeaHHxHec1/g7ktHcsdd831wrv3t2ngrX/Q1HnA89Z4KmDJlp7rxAv5W4RFVhw2VVoQ/M4q5/4QnLz2Ho9B10zZ4nOzIXdlixmlQpFwWfi6+oTcu1YjSmwCMLKZGwd2r4DZmYXPsuEauOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f7f1c1-ef5c-4b16-987d-08de9affc3c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 15:00:42.4695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q7XXUqGvJY3VsbjDJueC9pFXV4zeaXSRs51Pha08Hy9FY6kScoGT/gJ3hsGmGYU6tJc/P169KM2Nn/hAu7vuUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
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

Please do not review this patch. It needs correction. I will send an update=
d patch.

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nitin =
Gote
> Sent: Wednesday, April 15, 2026 11:52 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Konieczny, Kamil <kamil.konieczny@intel.com>
> Subject: [PATCH] tests/intel/xe_configfs: Fix ctx-restore subtests regist=
er
>=20
> The ctx-restore-post-bb and ctx-restore-mid-bb subtests fail due to two
> independent issues:
>=20
> 1. Register not suitable for software use: The test uses GEN7_GT_SCRATCH
>    (0x4f100/0x4f104), which per BSpec is reserved for hardware use and
>    must not be used by software. Readback may not return the expected
>    value.
>=20
> 2. No render engine on XPC/HPC platforms: The test uses "rcs" (render
>    engine class), but XPC platforms like CRI (Xe3p_XPC) and HPC
>    platforms like PVC (Xe_HPC) have no Render Command Streamer. The BB
>    is stored via configfs but never injected into any engine's LRC.
>=20
> Fix by:
> - Replacing GEN7_GT_SCRATCH with CCS0 CS_GPR3/GPR4 (0x1a618/0x1a620),
>   MI_MATH scratch registers safe for software use. LRI writes go
>   through global MMIO space, so rcs engine can write to CCS0 register
>   addresses.
> - Adding igt_require_f(has_rcs) to skip ctx-restore subtests on
>   platforms without a render engine instead of failing silently.
>=20
> Bspec: 53105, 60309
>=20
> Fixes: b6abdc26e01b ("tests/intel/xe_configfs: Check ctx_restore_post_bb"=
)
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  tests/intel/xe_configfs.c | 46 ++++++++++++++++++++++++---------------
>  1 file changed, 29 insertions(+), 17 deletions(-)
>=20
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c index
> 755524e7c..1447edf2b 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -276,35 +276,35 @@ static void test_ctx_restore(int configfs_device_fd=
,
> const char *type)
>  		 * previous execution set a specific value in the HW
>  		 */
>  		{ .test =3D "cmd-single",
> -		  .in =3D "rcs cmd 11000001 4F100 DEA0BEE0",
> -		  .out =3D "rcs: 11000001 0004f100 dea0bee0\n",
> -		  .reg =3D { 0x4f100 },
> +		  .in =3D "rcs cmd 11000001 1A618 DEA0BEE0",
> +		  .out =3D "rcs: 11000001 0001a618 dea0bee0\n",
> +		  .reg =3D { 0x1a618 },
>  		  .reg_val =3D { 0xdea0bee0 },
>  		},
>  		{ .test =3D "cmd-single-multi-values",
> -		  .in =3D "rcs cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2",
> -		  .out =3D "rcs: 11000003 0004f100 dea1bee1 0004f104
> dea2bee2\n",
> -		  .reg =3D { 0x4f100, 0x4f104 },
> +		  .in =3D "rcs cmd 11000003 1A618 DEA1BEE1 1A620 DEA2BEE2",
> +		  .out =3D "rcs: 11000003 0001a618 dea1bee1 0001a620
> dea2bee2\n",
> +		  .reg =3D { 0x1a618, 0x1a620 },
>  		  .reg_val =3D { 0xdea1bee1, 0xdea2bee2 },
>  		},
>  		{ .test =3D "cmd-multi",
> -		  .in =3D "rcs cmd 11000001 4F100 DEA3BEE3\n"
> -			"rcs cmd 11000001 4F104 DEA4BEE4",
> -		  .out =3D "rcs: 11000001 0004f100 dea3bee3 11000001 0004f104
> dea4bee4\n",
> -		  .reg =3D { 0x4f100, 0x4f104 },
> +		  .in =3D "rcs cmd 11000001 1A618 DEA3BEE3\n"
> +			"rcs cmd 11000001 1A620 DEA4BEE4",
> +		  .out =3D "rcs: 11000001 0001a618 dea3bee3 11000001 0001a620
> dea4bee4\n",
> +		  .reg =3D { 0x1a618, 0x1a620 },
>  		  .reg_val =3D { 0xdea3bee3, 0xdea4bee4 },
>  		},
>  		{ .test =3D "reg-single",
> -		  .in =3D "rcs reg 4F100 DEA5BEE5",
> -		  .out =3D "rcs: 11000001 0004f100 dea5bee5\n",
> -		  .reg =3D { 0x4f100 },
> +		  .in =3D "rcs reg 1A618 DEA5BEE5",
> +		  .out =3D "rcs: 11000001 0001a618 dea5bee5\n",
> +		  .reg =3D { 0x1a618 },
>  		  .reg_val =3D { 0xdea5bee5 },
>  		},
>  		{ .test =3D "reg-multi",
> -		  .in =3D "rcs reg 4F100 DEA6BEE6\n"
> -			"rcs reg 4F104 DEA7BEE7",
> -		  .out =3D "rcs: 11000001 0004f100 dea6bee6 11000001 0004f104
> dea7bee7\n",
> -		  .reg =3D { 0x4f100, 0x4f104 },
> +		  .in =3D "rcs reg 1A618 DEA6BEE6\n"
> +			"rcs reg 1A620 DEA7BEE7",
> +		  .out =3D "rcs: 11000001 0001a618 dea6bee6 11000001 0001a620
> dea7bee7\n",
> +		  .reg =3D { 0x1a618, 0x1a620 },
>  		  .reg_val =3D { 0xdea6bee6, 0xdea7bee7 },
>  		},
>  	};
> @@ -364,12 +364,22 @@ int igt_main()
>  	int fd, configfs_fd, configfs_device_fd;
>  	uint32_t devid;
>  	bool is_vf_device;
> +	bool has_rcs =3D false;
>=20
>  	igt_fixture() {
> +		struct drm_xe_engine_class_instance *hwe;
> +
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		devid =3D intel_get_drm_devid(fd);
>  		is_vf_device =3D intel_is_vf_device(fd);
>  		set_bus_addr(fd);
> +
> +		xe_for_each_engine(fd, hwe)
> +			if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_RENDER) {
> +				has_rcs =3D true;
> +				break;
> +			}
> +
>  		drm_close_driver(fd);
>=20
>  		configfs_fd =3D igt_configfs_open("xe"); @@ -418,6 +428,7 @@ int
> igt_main()
>  	igt_describe("Validate ctx_restore_post_bb");
>  	igt_subtest("ctx-restore-post-bb") {
>  		igt_skip_on_f(is_vf_device, "MMIO register readback not
> possible on VF\n");
> +		igt_require_f(has_rcs, "Platform has no render engine\n");
>  		configfs_device_fd =3D create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "post");
>  		close_configfs_group(configfs_fd, configfs_device_fd); @@ -
> 434,6 +445,7 @@ int igt_main()
>  	igt_describe("Validate ctx_restore_mid_bb");
>  	igt_subtest("ctx-restore-mid-bb") {
>  		igt_skip_on_f(is_vf_device, "MMIO register readback not
> possible on VF\n");
> +		igt_require_f(has_rcs, "Platform has no render engine\n");
>  		configfs_device_fd =3D create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "mid");
>  		close_configfs_group(configfs_fd, configfs_device_fd);
> --
> 2.50.1

