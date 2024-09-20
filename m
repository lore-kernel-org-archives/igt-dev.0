Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E256DCF58CC
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 04:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765710E2D6;
	Fri, 20 Sep 2024 04:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sw6+YJs3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FFD10E2D6
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 04:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726807152; x=1758343152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ktlqE1Z+CKDagoSM0W9T8YTDgmmC05S59a6kyQIzY6M=;
 b=Sw6+YJs38CqO9Lo3n/sI+ZbVq8UJVv0VrGW45ztf675soudAKSMJVPBO
 KF6D7wVqkvR/K7FxXOttjV35p1NYl2iNUipVPdmVNTxCf7dOo6OT6aM05
 Ol+/RQzdMO44k1Nz0mfBVl7Bea2Y0QoFLlrP6MmENEbVq5Z6dtWtNfaJP
 haqONMUvkvsRNz8lMQZoc51hf3tEfHVDXYqfeFCJVy6pVA68xBk0pUDuJ
 iynQnjvG6XL1ImJ4T/gbYzzC2YVQRP09qMLbdvV/jNIu/lUvYLVY+esJW
 xqr6H2Pvg1fI5hFuMsO8HwOKhQpM64MXMDogCoLVT9V6e9U3Ogv6bR7+A w==;
X-CSE-ConnectionGUID: s6/xnKWRTgGX2QADpSkZhg==
X-CSE-MsgGUID: a8DAw+bfTZGdgJTX8fkGtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29697159"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="29697159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 21:39:11 -0700
X-CSE-ConnectionGUID: lSJ/jdnxSeW8roqrDOLeqw==
X-CSE-MsgGUID: yluHMJkvSKO1/JcLFsVuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69757542"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 21:39:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 21:39:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 21:39:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 21:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuUR4xr25/lx/yMKWJ0Rck4qxrNedljJJYYViYnBJvqrHjmAaWUeMhPSxNaXFt7RYEg/E7Gq9Jh5GQfcR4RNBQNJxdxFPkQpTPW1S7IJx8nwjxbtnL6kcxn7N7wKPZeh+b8wPBvyq1luZSi04jISIlFSZVZF9fMGLHs8Hj6rk4EQDVA118A9BFCHsBDdc4dibHJr1mBP6ZUay5kuKqlF75Mk+7KzHLv8sxX+lh6yJWkROFcuVP/acDnEop/YsAqKLDOlxN5tYtpPgJha0jWiQgB+ZPJBYGeq+KwlAUt0HTE35uwvcTZWE0h34j9DOy2FtUG43SydIevjDsmTH2jolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYpGx4MfBfRjsAFJlTDaAeFGApvHBQQATOujVPy0rGc=;
 b=qP8X7oNy7Zngc2rcotcLSXrIgG6iJjGrUoYfD/MjzBock0ZzuCiwCiQ+1MlmRNedXfLpi1hPjYVu3Vv8KSDzsY7OMoerqieqk5OR8v1HayHqUS5B/hsuQJHIgPOVpnL2zc4D1HBzd9+gIzgvRHhlGLeRnrXkTgbt7PxwQPPyxL+bFNTB6z91Z3gp+bCNg+P1VQLC0V02GwQ2YrIuwOaDVkp3/wD3Z9rdh1X8Jh61O4X8mSr8slXtHDexeGeoUHrLJU/4ZUNgHqEBClVtE1BQOCHHGKxre/f+JMW5/KRjITsSUo0n1w+V95rn/c1y6jcJStqgDDFCT7KECCtaHggDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Fri, 20 Sep 2024 04:39:08 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7962.025; Fri, 20 Sep 2024
 04:39:08 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_rmfb: Fix support for xe
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_rmfb: Fix support for xe
Thread-Index: AQHbCsrTTUG8r7UwmEiby+m6Sd1KC7JgGESg
Date: Fri, 20 Sep 2024 04:39:07 +0000
Message-ID: <DM4PR11MB6312BAE4A55F9FFF35919555906C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240919193250.1439745-1-lucas.demarchi@intel.com>
 <20240919193250.1439745-2-lucas.demarchi@intel.com>
In-Reply-To: <20240919193250.1439745-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6380:EE_
x-ms-office365-filtering-correlation-id: 145bdacc-a987-4e39-d2b1-08dcd92e2a36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ejIOyony/baWF7DHmTalTkiCtOriWox1ncRsruPc26u1ykHeb0zzTlwaQbul?=
 =?us-ascii?Q?kX6dNl24KHh6AevwiQaKNqhzpUG5lg6BtIhD1Vqi6YbN6PHoZidKkkgCocxj?=
 =?us-ascii?Q?bHp+DlNVnaFjTGHZFZiZE2QikUuiA0xjoNe2AN/kYAbXJHy6E5gjLwSu+ywH?=
 =?us-ascii?Q?izIhRbAigOC3jyMhpPixOfzUSDdWNizK0k45ojpyrRTdisoPeqaowzl7235+?=
 =?us-ascii?Q?iy/9Z/lq4RKFuuiUtcI+e0i1baAFrrB9vHiU/BKpEPwa7BAnPBr4/tX8pNQ6?=
 =?us-ascii?Q?4uzGqh+KEbnZtxI66TjL5XLD+quqiv/iiWOXu3K8S4mqbrbNyjt9Kw3BPw5b?=
 =?us-ascii?Q?gCOdN6nXEHyTjYIUg8FbXeuEhLdZWdiwb2NkGfoMXmm/xRTJVckyZv1uBMSD?=
 =?us-ascii?Q?p1YF02wZAbqMs92Xr+ZgfDX4mbsiqBHunKWZmPW96Xp+BfEz6uuMXB/3zRdh?=
 =?us-ascii?Q?WqG3NH8AFxDPEjccuasQEmQ9hxEIos3EfLRQMbP7YamzcHsRyC02hzDX/qFR?=
 =?us-ascii?Q?H9h3vMOzshcVFA4GMWX70yDJBpSTEZpzHvUTyHt562I438OMHIHXNSQm8vGc?=
 =?us-ascii?Q?RqQz5BF+lkK23GDtYXg4+IDeQoGi6+d/yBHvtejx7P5tL3ra5WLAsajFknsm?=
 =?us-ascii?Q?Br1+bMUzzZVGLQCbLxLwsF6NJhz83CHX4xUP9C5yCqDdf8DkaIE2t/tK/UFl?=
 =?us-ascii?Q?TTFCd8J6svpXz/tzu/Sum2uF0NDSVjwUD/FVgeZj+qa/meZknrZIM+acoY/8?=
 =?us-ascii?Q?URaLM4EomsiB5V/bDxj78f7RMnTaOa3ahhPK4Qzpf5TSYn9OncwtWj7LpGUi?=
 =?us-ascii?Q?nBfx0R9V4i1VbJAy7RQ2KU/Rw74ptgdeR0RIXipxjxGLiMPbkzsBkP/wYKXY?=
 =?us-ascii?Q?nEfMDAKDk3yPoW7GXeD0y5Gt8Oo9z7ttsptXHoI6H1y+gyD77EYkan8EjiOt?=
 =?us-ascii?Q?AHh2BvnToVtu7Fuvr6rGw0bEFedphrFqIr1vdx6dg+uFWLPUQsTYDaq3J2Jm?=
 =?us-ascii?Q?gxCuqVtp+cNEFCS4o5ZpYJfkXvthI3Uk+eA9ymVK3VJSQiMln2bz9JJ5UftK?=
 =?us-ascii?Q?fvD8C4lHXak/seBe6sCR9TVghSVEcdBcq291wtYgo2uYm8Yii31BJsN3Sz4D?=
 =?us-ascii?Q?HSlrRinYQgKzu7go+aUopNskfubNV9/OSXnXZntphqfw5yRgRxrGzRYZwQ/H?=
 =?us-ascii?Q?iDY3XrHQMlku3sTaxKYLONJVVQ1J9fMD6G27k1uH5tD0mhhDMp0hwWd4xFOb?=
 =?us-ascii?Q?65+AFfsZMvcqxzuY465Buh5D0mcTAoyIZi9F/1oBllbGVLndzZtX+jYMbJ/s?=
 =?us-ascii?Q?kRVbcQfVMSImv/43V063+Yb+QKy+imZ2uXhTZMDdCM53qQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZOCCuJIEvqAY1DW0dQpJaPhMVpSEftMFMqj1OlCpKEasyzxQRQDOonZof5yR?=
 =?us-ascii?Q?AEt2h+QlX23RqcA+Jk3hVppQhtuu2WTzVEyYsYUCsoUULT33mPviqstJlLqd?=
 =?us-ascii?Q?o5HvE08buz+oOQSZkgi93o7T+WQtOO7wio8/rgGe+43vmuoeOqGn1IHLoOS7?=
 =?us-ascii?Q?W5jxVlhdfyK/7N6Mg4/s7xsV3zF+T3SbKYw6rIWM13jjjwTvNLqPrgeLuDW6?=
 =?us-ascii?Q?gXGuhe4HO2LIEJaht5guMBcl12CNtrzr5yEO+6PbfGFcyDJgAr6O5lQpRznv?=
 =?us-ascii?Q?A4vKus91xSDM5hhMLRlgFWf9WYdLyIXolkExE0MF/WKv1ay/QHiLGh0wJ1oH?=
 =?us-ascii?Q?bbZqTsDjUjiQqg9dYRkRS5kVtgTcuuABtFFca6J3+9qm1Odwi70BBWPhwvWY?=
 =?us-ascii?Q?IEZRA9+csoVdyxnvRpWeLJTpu66gqiH7shFNHFU3fzjEx1p/852OyW/+iYU/?=
 =?us-ascii?Q?6RAVV8vwNYATUdyeZoIM8giiBgFwa2A9kNRXeoxiqtcrCZxUjQwu9lZ5dcZi?=
 =?us-ascii?Q?775ipm4ntVECondVvZw/rFUILiff2N6pqqhc54zx4GDZkLnQpWHIy/8ibzV8?=
 =?us-ascii?Q?DZ/iOJAM49KRVxKYLXTt0GiJZI6RBEEUalFmyFpQMZPPlFldWi7nlE7P3Li5?=
 =?us-ascii?Q?yrNPrtrT9pHGjF25K+Elsv3+rnNaM5/3kUdn8VNO9Ie9omj4JNEB5+jNKxuG?=
 =?us-ascii?Q?GGzZbzMTrLP4dUuctriVcn0P9TbMQb0TmEgPPJqaS0qSa69gEcZGYJbDzLP/?=
 =?us-ascii?Q?yhjRZBza/Yx109XzYbn47Gi2GYU8Vwqpuv/LQbjoEAKuIASp0iic6nHIUyoG?=
 =?us-ascii?Q?fNhUlnOTjxC1fgqZ3Qvr1U3YqGaC0sBCXhsZg6/mVQmYT9SUcUCzJ/O8jRab?=
 =?us-ascii?Q?+73JhA6W2SbCYdHZtIP3h+Ytg5BUqE/cYivLD83BIetthhbGUOzrOcQhu+oC?=
 =?us-ascii?Q?/0o67Sn/KfdlHw4AyOPVLGY8Bp9d/PS++ZRwnLyT/BlUc1/PO9nwt0W35PA7?=
 =?us-ascii?Q?5+H+8rDb/NrvK7kcOm9I6EqdWcKbud50t2WRvLmDcvdx6LKIg+Qj1YQ2nhLe?=
 =?us-ascii?Q?IDBI0aAz9LhDxvZ1gxy5V3dtqSTe6n9xnNBl2VRTAdsj0Lw+Od+8l5LRR/kV?=
 =?us-ascii?Q?07u1Xwxazp/1/jrSbk1xvd9+01rEXKnegrzg57yt45D1bLe4wBN3HtTBNopb?=
 =?us-ascii?Q?+CImw+SX1dGt8fWnwntsmNZojjd4fruk9v0gN2RnGG8yfdZ4hKWZV6U9Lb9q?=
 =?us-ascii?Q?pQkDLPos9OfnPMgXFsG6oRTk4Vm2Iuns3R0w1Hx//5XHDWfFJge97FI1PeVB?=
 =?us-ascii?Q?mw9inqRXwiSwcOemlH2h5xaqkrQuLfgaqOSQsdxBj8bFmkQcGQY/4pkoKSbN?=
 =?us-ascii?Q?cX7UgGCoCAJi3KW4G+dpAbohYDVdP34bFQMj6W/l0mxTHSnG8k2JyLsigYtf?=
 =?us-ascii?Q?hItgcRKA5Q4fYoTFM80w4BORNL3ErzJj0w5044600ncSQCdvoExxaMS9ED2t?=
 =?us-ascii?Q?dJFaCUYZ8Qpav1XL7uPcGhdXQBY3Bo1ixGw3R+oI3zfIyzSh73wwr3mlfUc4?=
 =?us-ascii?Q?FXRZa5l+PDRkARr76V4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145bdacc-a987-4e39-d2b1-08dcd92e2a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 04:39:07.9695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHNZ1INEZccfKZRqgzfudTxKCmdIQJfmnXLUO8Qj9D+JAJGs58CsN6OFaHMw3cBf05f7F/AsfTutYKCOoawHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
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

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De
> Marchi
> Sent: Friday, September 20, 2024 1:03 AM
> To: igt-dev@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/kms_rmfb: Fix support for xe
>=20
> Make sure to hold a drm fd open while running the test so we can check fo=
r
> fb_id =3D=3D 0 after either removing the fb or closing the previous fd.
> With i915 this is guaranteed by holding on to an fd to be used in an exit=
 handler
> in drm_open_driver().
>=20
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/kms_rmfb.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c index 0ea689d60..e4203bd=
d4
> 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -206,10 +206,15 @@ igt_main
>  				    "it" },
>  	};
>  	struct rmfb_data data =3D {};
> -	int i;
> +	int i, other_fd;
>=20
>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +		/*
> +		 * Prevent fb from changing underneath so we can check by
> +		 * fb_id =3D=3D 0 after removing the fb
> +		 */
> +		other_fd =3D drm_reopen_driver(data.drm_fd);
>=20
>  		kmstest_set_vt_graphics_mode();
>=20
> @@ -227,5 +232,6 @@ igt_main
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> +		drm_close_driver(other_fd);
>  	}
>  }
> --
> 2.46.1

