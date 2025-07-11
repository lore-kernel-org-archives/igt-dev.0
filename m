Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A591C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 05:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2DA10E9AB;
	Fri, 11 Jul 2025 05:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoTRinJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E013410E9AB
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 05:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752213125; x=1783749125;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zlOpIy1VHml/Qs95F31J18q4uD8njd6+M/DmyBwkt2c=;
 b=WoTRinJa9LpnefjC0cULLG216i68dnGGzyAd/79eJFTKCu75EdMqRNci
 faOj0/CjbV24jaKCeaKeVGS3TIVI301ryjVvZZv/Yd2JC5EJpk+j2/K1x
 Vtu2l725ILIhD8sIceEPxy3nQwv+xSnu891pNx45B8kE/fq8VEHWNTUE9
 QTyvXWG4xLqrHhrZnxi3iNt/MCJMlj+1bIOOn3vVJt030cbO5O0TMRC/t
 +IlLdALDiC1V8UXZ+PT7cpZNHJasl5M6Or6JxwHib0REh+wa+qERUGMbn
 GG3nsyYi8YO03ICNKR3fB/DNYI8IBdhyuNHsCQF2gkrM+GIOMmm0RDR9v Q==;
X-CSE-ConnectionGUID: Csp6mTTJQXmdQOuRsu/YRg==
X-CSE-MsgGUID: pwJZW63KSSevBZkdbxgcSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79938979"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="79938979"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:52:03 -0700
X-CSE-ConnectionGUID: kgFWQRdiT1i6/CdbEuCZ2g==
X-CSE-MsgGUID: aR6bcELwQHu1DnYEISCtHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="156408755"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:52:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:52:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 22:52:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8q4lQRZhmswuemkMaV7Ru23LZBa/iUsm0Mp4gFp5RpYPchj6h0ZCIAIoBGeN0IvAcHAvSYJYQUx2lW+iQ7cNQ1XbljUEXZKph1zQNgErP2bq/BK5w3vm1JngYiiXuIuQGAznICkIN2mMgU/z1V0h89DBA+vJpSwVdOMbykyb9huGrHQtfRUQsMhsntmckp2ANGZpno/gwFYJuV7OzWp4bxTGDfA3Ng+M32h6Ek/1/V4QmxBAddUTsgf5D+tfCasMeUqbX6/Emc5Sbfqo2IrIdW5Xeo8Ks603KoRgGoBA+3zjmQMBMovHvv/ZHS5OXuWoiWSntlT2JabAdm34f3MvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//jxT8/BNsE5JLYlP5kM0c6aPnLSYJspH+Oc9wHLkRc=;
 b=jBXCMvAgB+KkfA1llfhB1tG0enLmLfKxCcaCWywhrhRpgfDYhbJV8fhVhTpoKSotWEeNOvNkOiJz4GZ+kxvV73pJ3r9xZ8Lv9L43WXmVgPEFL3a9gPjXKMhQNjFBa602WBXTQJDC3nxY6viBjjY/wnr5Jmo/ioMCn0Z/rPb/Tg89gBp/dZ3j4Jo1JbOgxxk9nVkFD86pQzP4ZL25CUcoEama1q75Trk1R4PGhl5uxg1hybZ7jGvr5E6ibTtPSbtovwUJxOuSb9Dg5sNAJjkSYoF6VYaOs1jrkJ2nQey+5iPUJaduLs7hVAICWGkQQpMq3EsgrbjCIrFA+2SJJq0IFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB5796.namprd11.prod.outlook.com
 (2603:10b6:510:13b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 11 Jul
 2025 05:51:59 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%6]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 05:51:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v4] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Thread-Topic: [PATCH i-g-t v4] tests/kms_content_protection: Add force HDCP
 1.4 subtest
Thread-Index: AQHb8OVdwezplT7Tf0OHvQPTzuxj8rQsbVEw
Date: Fri, 11 Jul 2025 05:51:58 +0000
Message-ID: <DM3PPF208195D8DBA1E2616EEFE59C898ABE34BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250709151930.1034205-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250709151930.1034205-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB5796:EE_
x-ms-office365-filtering-correlation-id: c439b6a7-58c5-45cd-64f7-08ddc03f0cf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TgPdiF4EOhtkPIbRJqpHLT2bTmYdGbVHayvL2K8kL8JNsfnYcPx878tzPVfU?=
 =?us-ascii?Q?IXDR7XkHrgwAwqnDoLevHrqeBStDE2FSqFAcpS96fpnYDO06GDKC8WN78PwM?=
 =?us-ascii?Q?16bfnDKzk6pDHP7XV+sKEsjxwEFNmewjSNmVKkG72VtjoSYz8PLdnTSkuLdy?=
 =?us-ascii?Q?UktwE4vgpQ/2t+rT98mhx/B4RZFL9QiFZFFdabRqaJc3SqUf+HTPqFOC3Xgp?=
 =?us-ascii?Q?nFQe2qpJqBuXOpm3x2lRFo6MR+pzrjeqzyznXriAWdrzY8gwwwuRqh0thF5g?=
 =?us-ascii?Q?kUrZacWGgCa5OdVcEqF1AyzwOPssOxi456bkq5Z2U/BuUU+h42I4qKwU2OSD?=
 =?us-ascii?Q?LAoX7K870Kv3kmJKn2OHohsmV1pHwJGCsgukEJ5acNtw0UdU9BOl1Cg+x6pg?=
 =?us-ascii?Q?+7M69rWSyOcJ17t8cJz9D3K0vdRYOQEcGGnKrNKLQQ1j/7rY6g42rehCj9gC?=
 =?us-ascii?Q?kXoiy3ulKeZaHD5GrehOmg+BQbCTC4a3MyCm1l4x6rr4kDpq5FrXl6MtTZj/?=
 =?us-ascii?Q?K7s8yTCrZmeo8maGj4oLUnOUerFC0+DJk2Ug60S9fRU00eFRaBpulK02uGlp?=
 =?us-ascii?Q?LSS3QFtM6EWoxDxaS19Q4mWblqyZ1tB97NFTDkTBtoDd5+oJn0mJw/q66Igs?=
 =?us-ascii?Q?kFEHuPPBIEIYKlB5RDtP2aJ02On75wg/ED6mpcyk26BhOPX3pw8uvzS3kfiE?=
 =?us-ascii?Q?nGPclsx+9QvhqTq5P0Lo7pBVBNNv+Kpl8a+teHXtotgYu6ucSJ/ESgm4Hu4V?=
 =?us-ascii?Q?4xeVSf9gzetFFB5oMOxOc4C0/YOw2FW4lMDbsAqsgi23S0B1r+nSHz5WIJgb?=
 =?us-ascii?Q?sMMkzf+PXeeAgAiGghVPaNL0P17Ed4e1M3CDvi6O+b7yMJjNGOkNC8YAdt55?=
 =?us-ascii?Q?wCY94vgYm4X53i+uiiDAcujkPb67N/K2lBCrNWFTsherWzhbOwikxeGox/6z?=
 =?us-ascii?Q?MU1hVqTu8/gfgwY23OSoVdHueFQtHUaFjFJ0J+2Pes7OXBMNSp57NZUqPKge?=
 =?us-ascii?Q?PnuS2DNffIfjO3nQRX2SSkyzEHk8otV6xXDHqZoc0tD0vGLfazDFvtR4ZmR5?=
 =?us-ascii?Q?c8KGxpHXywhW3CpOW0yRiMAwZEGkU5Mn5J7ketqb/geRzhXywlwRJTtHPr7m?=
 =?us-ascii?Q?sXqS+rEQaTq937CVTn4ZUpsYXy5nTWry88r/9rgpOEiZa8a8kRIQHinVzmkT?=
 =?us-ascii?Q?P1pLPcT7pp08zgJrYAQjE4QIr0KCnvtugKASJOOcXY7aUzK83xyhpJQAv+I2?=
 =?us-ascii?Q?j26q0jsg/ylAXOpc6JLhBsoTxQIAp34F7MhpMOa7k5FIqxXZaOzvOcTGiUYK?=
 =?us-ascii?Q?sxROimkoMx9usWnCOrAyRnYRPiVBZ159m8pGvLx8vFt7hAL7NYPT8YG75Nl8?=
 =?us-ascii?Q?37RFT2IDUWA+E5ka0Iw/HYSLm4ouD5sXX6M/JSQhpDtqSmDr0o3DDhmThgl8?=
 =?us-ascii?Q?BX/EAu50jjvyLtM5FUaA1+/TJpuNGWLca9d5UKlK3FP+TniqH83yMA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EGBPrbIIoDKlCxDcVpIKeImR79Y+Hgz93lmhzTRuluHa+2nSerLBaIaANSWL?=
 =?us-ascii?Q?QuxxzpFrG8NgMYFplRKM2QH2A95V8Nyye/kzSA3k93777+R0I/jTFCVd2SKU?=
 =?us-ascii?Q?fN+s0Gt3IrgLZuJApSYiTRWoRlu/1nliseqwQncCzT/BkJfbzmVCZpuIovih?=
 =?us-ascii?Q?gUZzUY+lmJpvcoDvmLmrTzMZXi6bhthrowqrP/qxi2uB06a+QiE6SZ64ei62?=
 =?us-ascii?Q?EXMUhURpBVMYSNpKP+mKu0ekfjfqQUSrRfzdGqHDRqOtDfXaOmniUzv6IzDp?=
 =?us-ascii?Q?hOVsNL7Wupg9JXEpLRb0LmzFoZnKfKTQvx6d+7MXvM9ab+Fs4kiBHrLnXN1F?=
 =?us-ascii?Q?+6qSgDMwir04pSDfopznZtG1uGLYIt8U1dK+gWumFUOIWGfSo2tS6tk9ojik?=
 =?us-ascii?Q?UBEM1aHiKzMa11W7qodBk+wsr3BAZBKegFxycG6+RlD4gVyCY0q1QpQw0gre?=
 =?us-ascii?Q?nNIeTOis2oMPSjobtZ4Fk1+SsQ6Jv0t7r9+7Ec3yk7vdbaa0BgMNrcefssUk?=
 =?us-ascii?Q?c7wJNIhwbDsl22WgVnCP+UOVE+Fgebx534abv5nAV9BcdHWiGvUoRwV9VL+j?=
 =?us-ascii?Q?OgTfevP5CmbVbPnB04Sc8mft5ZXIOZ2gcX8+yQ9FT4hRULQV9yoRtGmQMYyD?=
 =?us-ascii?Q?TQSEY/YHssUNKZzb9YKOtfQxchPDkwq0UHUTu40wCO1GbSwgSS6lqGb7UeGq?=
 =?us-ascii?Q?JXtOBCR+CLL2tLwFCxRrTQ/k4xq5ATnHGtFXYvrdRrBommPZDQs/YOxKXMjV?=
 =?us-ascii?Q?uVIaXz+VmV8Wg6fB2urDiC0HxMUVL1OBYSnkt1IUkmc/UggdzEOhrBXIbMAM?=
 =?us-ascii?Q?ox0Bse4DO7uAjHAGVNAJpxSDO7Om1UhnbsJ7VNZ5v725aDMCFr/s0tC40nRi?=
 =?us-ascii?Q?NLnHfgu+MiIl7f1YvDxhI+twocw9jKl7XA6NSFUD46SNUM/gbskoKJ5ZHPgO?=
 =?us-ascii?Q?P5SQ+4ZINQYYyFXFYmcONa1aGWtWt9iIjXS7Plyg5HC+vQJ6RE+wkVrqZh0F?=
 =?us-ascii?Q?3OLzQQQWjhRCP8ABajoqzgXDhFJEbxvPPdOanF3lMpUuzGmhMNYCd2AXIv61?=
 =?us-ascii?Q?92YxQf0uTW/r6XVRi4AiAX1LFVcWdYKA7hQugirRhEKN0m61pxej8CkUsNJy?=
 =?us-ascii?Q?BP8zIfDSWZMzLHckMAQwpFpfuyePCDWT89MLQ/nTn1DpNDnZpdiatvF4voGl?=
 =?us-ascii?Q?c6KCXet2pqfidEKvnFh7nNdxoZNHhwGEJLkyk2k1jEpkDqzkFNs/RpfZx2Gu?=
 =?us-ascii?Q?Zep7Grs0mmBF6kuMiwLACELYwLdd7B5yx1iNQZzp3+QMCIA+tSnX8UatdVFE?=
 =?us-ascii?Q?QUzX/BpSPiSdzeAJRJpvTZjGbEuxhf4jfOaycNkf8zW+2mlE9AIK1yrE//vE?=
 =?us-ascii?Q?u3PN7L+7eIPdv6uGmI7Je555b8jnJ7bMD7aVfdLmi/qZdAf69krzXocxQCUJ?=
 =?us-ascii?Q?K80T6Furww+nVzHhNrZrrZnU9EGXk7fxd85Rd0hqr/ft4NAsFQHTvrw+8Rtf?=
 =?us-ascii?Q?qwPGjsBR7lMjJMa+mI3Q6sek+s+9VXOC8Fd+AMh5H4x8hMcAMpr1cfVIXkIJ?=
 =?us-ascii?Q?QhfAQWu7U+vHr18HiNs9EQSme0NGLo9JqKgvCy3s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c439b6a7-58c5-45cd-64f7-08ddc03f0cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 05:51:58.8910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdyTB4IW6N5j9sSxFpNCWoSfon2mfhENkq1Px/gxVEoRrn4FVwmUtO2atIJamN1AkNX1OpKpWEI8OOOi1EtlVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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



> Subject: [PATCH i-g-t v4] tests/kms_content_protection: Add force HDCP 1.=
4
> subtest
>=20
> If a Panel supports both HDCP1.4 and HDCP2.2 versions, the kernel will
> always choose the HDCP2.2 protection path and if this fails, then
> HDCP1.4 will be tried.
>=20
> The subtest uses debugfs support to force hdcp1.4 on the connector and
> verify content protection.
>=20
> V2: Use hdcp14 debugfs for all the supported subtests (Suraj).
>=20
> v3: Create new separate subtests for hdcp1.4 and hdcp2.2 for all the
> supported tests. (Suraj)
>=20
> v4: Add -hdcp14 suffix for subtests only for cases explicitly forcing hdc=
p1.4,
> retain original subtest names (eg atomic, type1) for default behaviour. (=
Suraj)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 154 ++++++++++++++++++++++++++++++---
>  1 file changed, 142 insertions(+), 12 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 51fc1d3be..4fa5d2c20 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -43,8 +43,8 @@
>  #include "igt_panel.h"
>=20
>  /**
> - * SUBTEST: lic-type-0
> - * Description: Test for the integrity of link for type-0 content.
> + * SUBTEST: lic-type-0-hdcp14
> + * Description: Test for the integrity of link for type-0 content with H=
DCP1.4.
>   *

Why delete the lic-type-0
Lic-type-0 works with both HDCP 2.2 and HDCP 1.4 this would essentially rem=
ove testing for HDCP 2.2 type 0 content
All you need to do is add not subtraction required
So the test will be lic-type-0 (no changes here)
And a new test  lic-type-0-hdcp14 where force_hdcp is true
Same for all the tests below.

Regards,
Suraj Kandpal

>   * SUBTEST: lic-type-1
>   * Description: Test for the integrity of link for type-1 content.
> @@ -65,6 +65,11 @@
>   * Description: Test to detect the HDCP status change when we are readin=
g
> the
>   *              uevent sent with the corresponding connector id and prop=
erty id.
>   *
> + * SUBTEST: uevent-hdcp14
> + * Description: Test to detect the status change when we are reading the
> + *              uevent sent with the corresponding connector id and prop=
erty id
> + *              with HDCP1.4 content protection.
> + *
>   * SUBTEST: %s
>   * Description: Test content protection with %arg[1]
>   *
> @@ -74,6 +79,10 @@
>   * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
>   * @legacy:         legacy style commit
>   * @type1:          content type 1 that can be handled only through HDCP=
2.2.
> + * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style
> commit.
> + * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic
> modesetting.
> + * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic
> modesetting and DPMS.
> + *
>   */
>=20
>  /**
> @@ -83,8 +92,10 @@
>   * arg[1]:
>   *
>   * @lic-type-0:   Type 0 with LIC
> + * @lic-type-0-hdcp14: Type 0 with LIC and HDCP1.4
>   * @lic-type-1:   Type 1 with LIC.
>   * @type-0:       Type 0
> + * @type-0-hdcp14: Type 0 with HDCP1.4
>   * @type-1:       Type 1
>   */
>=20
> @@ -96,6 +107,7 @@ struct data {
>  	struct igt_fb red, green;
>  	unsigned int cp_tests;
>  	struct udev_monitor *uevent_monitor;
> +	bool is_force_hdcp14;
>  } data;
>=20
>  /* Test flags */
> @@ -581,6 +593,51 @@ static bool output_hdcp_capable(igt_output_t
> *output, int content_type)
>  		return true;
>  }
>=20
> +static void set_i915_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	if (ret <=3D 0) {
> +		igt_info("i915_force_hdcp14 not supported\n");
> +		close(fd);
> +		return;
> +	}
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "yes"),
> +			 "i915_force_hdcp14 is not set to 'yes' on %s
> debugfs\n",
> +			 output->name);
> +
> +	close(fd);
> +}
> +
> +static void reset_i915_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "no"),
> +			 "i915_force_hdcp14 is not set to 'no' on %s
> debugfs\n",
> +			 "i915_force_hdcp14");
> +
> +	close(fd);
> +}
> +
>  static void
>  test_fini(igt_output_t *output, enum igt_commit_style commit_style)  { @=
@ -
> 654,10 +711,15 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  					  output->name);
>  				continue;
>  			}
> +			if (data.is_force_hdcp14)
> +				set_i915_force_hdcp14(output);
>=20
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output,
> pipe, commit_style, content_type);
>=20
> +			if (data.is_force_hdcp14)
> +				reset_i915_force_hdcp14(output);
> +
>  			test_fini(output, commit_style);
>  			/*
>  			 * Testing a output with a pipe is enough for HDCP
> @@ -719,6 +781,11 @@ test_mst_cp_enable_with_retry(igt_output_t
> *hdcp_mst_output[], int valid_outputs
>  	int retry_orig =3D retries, count, i;
>  	bool ret;
>=20
> +	if (data.is_force_hdcp14) {
> +		for (count =3D 0; count < valid_outputs; count++)
> +			set_i915_force_hdcp14(hdcp_mst_output[count]);
> +	}
> +
>  	do {
>  		if (retry_orig !=3D retries)
>  			test_mst_cp_disable(hdcp_mst_output,
> COMMIT_ATOMIC, valid_outputs); @@ -752,6 +819,11 @@
> test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> valid_outputs
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  	} while (retries && !ret);
>=20
> +	if (data.is_force_hdcp14) {
> +		for (count =3D 0; count < valid_outputs; count++)
> +			reset_i915_force_hdcp14(hdcp_mst_output[count]);
> +	}
> +
>  	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
> }
>=20
> @@ -878,54 +950,84 @@ static void create_fbs(void)
>  			    0.f, 1.f, 0.f, &data.green);
>  }
>=20
> +
> +
>  static const struct {
>  	const char *desc;
>  	const char *name;
>  	unsigned int cp_tests;
>  	bool content_type;
> +	bool is_force_hdcp14;
>  } subtests[] =3D {
> +	{ .desc =3D "Test content protection with atomic modesetting with
> HDCP1.4.",
> +	  .name =3D "atomic-hdcp14",
> +	  .cp_tests =3D 0,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
> +	},
>  	{ .desc =3D "Test content protection with atomic modesetting",
>  	  .name =3D "atomic",
>  	  .cp_tests =3D 0,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
>  	},
> -	{ .desc =3D "Test content protection with DPMS ON/OFF during atomic
> modesetting.",
> +	{ .desc =3D "Test content protection with DPMS ON/OFF during "
> +		  "atomic modesetting with HDCP1.4.",
> +	  .name =3D "atomic-dpms-hdcp14",
> +	  .cp_tests =3D CP_DPMS,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
> +	},
> +	{ .desc =3D "Test content protection with DPMS ON/OFF during atomic
> +modesetting",
>  	  .name =3D "atomic-dpms",
>  	  .cp_tests =3D CP_DPMS,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test for the integrity of link with type 0 content.",
> -	  .name =3D "lic-type-0",
> +	  .name =3D "lic-type-0-hdcp14",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test for the integrity of link with type 1 content",
>  	  .name =3D "lic-type-1",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test content protection with content type 1 "
>  		  "that can be handled only through HDCP2.2.",
>  	  .name =3D "type1",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test the teardown and rebuild of the interface between "
>  		  "Intel and mei hdcp.",
>  	  .name =3D "mei-interface",
>  	  .cp_tests =3D CP_MEI_RELOAD,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test the content type change when the content protection
> already enabled",
>  	  .name =3D "content-type-change",
>  	  .cp_tests =3D CP_TYPE_CHANGE,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
>  	},
> -	{ .desc =3D "Test to detect the HDCP status change when we are reading
> the uevent "
> +	{.desc =3D "Test to detect the HDCP status change when we are reading
> the uevent "
>  		  "sent with the corresponding connector id and property id.",
>  	  .name =3D "uevent",
>  	  .cp_tests =3D CP_UEVENT,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test to detect the HDCP status change when we are reading
> the uevent "
> +		  "sent with the corresponding connector id and property id.",
> +	  .name =3D "uevent-hdcp14",
> +	  .cp_tests =3D CP_UEVENT,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	/*
>  	 *  Testing the revocation check through SRM needs a HDCP sink with
> @@ -940,6 +1042,7 @@ static const struct {
>  	  .name =3D "srm",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  };
>=20
> @@ -948,26 +1051,43 @@ static const struct {
>  	const char *name;
>  	unsigned int cp_tests;
>  	bool content_type;
> +	bool is_force_hdcp14;
>  } mst_subtests[] =3D {
> -	{ .desc =3D "Test Content protection(Type 0) over DP MST.",
> +	{ .desc =3D "Test Content protection(Type 0) over DP MST",
>  	  .name =3D "dp-mst-type-0",
>  	  .cp_tests =3D 0,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test Content protection(Type 0) over DP MST with
> HDCP1.4.",
> +	  .name =3D "dp-mst-type-0-hdcp14",
> +	  .cp_tests =3D 0,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test Content protection(Type 0) over DP MST with LIC.",
>  	  .name =3D "dp-mst-lic-type-0",
>  	  .cp_tests =3D CP_LIC,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test Content protection(Type 0) over DP MST with LIC.",
> +	  .name =3D "dp-mst-lic-type-0-hdcp14",
> +	  .cp_tests =3D CP_LIC,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test Content protection(Type 1) over DP MST.",
>  	  .name =3D "dp-mst-type-1",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test Content protection(Type 1) over DP MST with LIC.",
>  	  .name =3D "dp-mst-lic-type-1",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  };
>=20
> @@ -980,12 +1100,20 @@ igt_main
>  		create_fbs();
>  	}
>=20
> -	igt_describe("Test content protection with legacy style commit.");
> -	igt_subtest_with_dynamic("legacy") {
> +	igt_describe("Test content protection with legacy style commit with
> HDCP1.4");
> +	igt_subtest_with_dynamic("legacy-hdcp14") {
>  		data.cp_tests =3D 0;
> +		data.is_force_hdcp14 =3D true;
>  		test_content_protection(COMMIT_LEGACY,
> HDCP_CONTENT_TYPE_0);
>  	}
>=20
> +	igt_describe("Test content protection with legacy style commit with
> HDCP2.2");
> +	igt_subtest_with_dynamic("legacy") {
> +		data.cp_tests =3D 0;
> +		data.is_force_hdcp14 =3D false;
> +		test_content_protection(COMMIT_LEGACY,
> HDCP_CONTENT_TYPE_1);
> +	}
> +
>  	igt_subtest_group {
>  		igt_fixture
>  			igt_require(data.display.is_atomic);
> @@ -995,6 +1123,7 @@ igt_main
>=20
>  			igt_subtest_with_dynamic(subtests[i].name) {
>  				data.cp_tests =3D subtests[i].cp_tests;
> +				data.is_force_hdcp14 =3D
> subtests[i].is_force_hdcp14;
>=20
>  				if (!strcmp(subtests[i].name, "srm")) {
>  					bool ret;
> @@ -1018,6 +1147,7 @@ igt_main
>=20
>  			igt_subtest(mst_subtests[i].name) {
>  				data.cp_tests =3D mst_subtests[i].cp_tests;
> +				data.is_force_hdcp14 =3D
> mst_subtests[i].is_force_hdcp14;
>=20
> 	test_content_protection_mst(mst_subtests[i].content_type);
>  			}
>  		}
> --
> 2.34.1

