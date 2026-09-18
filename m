Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF7DC982D2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 03:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465E10E077;
	Fri, 18 Sep 2026 03:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJImnVqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE4D10E077
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 03:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789701794; x=1821237794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fb9aPR2/jJss6Y991qHXzi0fsZ2hEFNd/wSDCx2G4nY=;
 b=AJImnVqThZ9CUXfW1CMVgSo5YQ/FiFTb73tw2p/g6JcJVztwCG6XGqLW
 7ISv4GgN+vlFME6+vM6PbEN8po0bMAsMb1AV8HsSZ7eby65mg4v9N4Kuq
 JIWNxfN5TbzlmuwbY9BZobkjToQZtjsgKtExtU13LNhsD+9j3D5Ymbloj
 raOnA48ajpbEkZRG4m4nTLUJPxwEwq7gVjN3oBSQpBDeN7icAVNK9Drzl
 jHO194eDCmT3v1gsxV79fu32s4SU0cijEHw36zJ8rQcaSk6Oz/FyG4i/v
 62GokkJdZNmpIyADqsSRqHJdM3E9CypFFCyX+XgiHbRnwLpgNrGu2ySIC Q==;
X-CSE-ConnectionGUID: dPNNDTP0Q2KWqodTfbG18A==
X-CSE-MsgGUID: /wxxk4FiQkeYa+FsgVlcdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107685687"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107685687"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:23:14 -0700
X-CSE-ConnectionGUID: UUOhwEYzTHmNvRgYi2apbQ==
X-CSE-MsgGUID: aqt68HIDSIile1a9s9LO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279397752"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:23:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:23:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:23:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:23:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InkLpRrLupZeyfh6dEXCTPE+/kpyeRrFhYBJx9ZYNBcDHk1EDXGXf6CxG68YE1jf4ZfZApGYQvx3FEMNGEnt/rLPYoJCTrkcNtua0agL/0l/o7c0wdIJcOIN8cZeEvAwyFT9UBFcDReteTX1/q5l51ULAmws8bZ3reOXhIvGFlrXz+zkkLJNVaqYu1/W9Vy0YsZFA2E/cfWMpyciaHjQ1AljYVe4oOJq9w0S5BdbijhBkAdlp0FTuFvedKmER6Q7/hY9m2i8ZxE0PLM7KU81dScTYBk6Vew0xU+7s0EOA54MS9podDAw/Ku93Xh6il6/y6+u9+tJj4484IhQEefaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ORcujvk/mK/o+q52gwsR6yjpI3PMGVixW5bSYbUAh4=;
 b=xzypz4hPytLpFobKdYETlGndyIcC2lf9j1OJLxuw+IJReIbSxw4pvYsl0wLhdZq10CuXcoCxoBXkfbHZtQb7omhRvpSWXHL2PqP/M+IViipsMsIa5r1K7jiKoMWTyK4Bq4EUJfzDEdpyYvrBGhbkU9qR6AkqyqKnvx0swjoTE42zKdOIm6U+ijlqX/oqfcssPrMlSyVB4PdID6AoJbrY0x1mxtH2dWa3LaVup0bqRynK5sKLR5fQILYhMnlVfX9CsiQauCY36eQsHd6Z7yEJxAsO+x0yth55pbx/04VqeuS5Kq0ctwITdFBRsig/b9IA7CNLpIhYdq6Zb1PGkw5AAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 03:23:06 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:23:06 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t, v3 9/9] lib/kms: Add NVL joiner exceptions for 4K
 high-refresh modes
Thread-Topic: [PATCH i-g-t, v3 9/9] lib/kms: Add NVL joiner exceptions for 4K
 high-refresh modes
Thread-Index: AQHdQjEXLXY9Rfdsj0i61jP2w5gg17bTtYDQ
Date: Fri, 18 Sep 2026 03:23:06 +0000
Message-ID: <PH7PR11MB679658BD67F04865182BE6CDE5872@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
 <20260911210709.943683-10-swati2.sharma@intel.com>
In-Reply-To: <20260911210709.943683-10-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|CY8PR11MB7798:EE_
x-ms-office365-filtering-correlation-id: 6e76b499-a0a3-4678-8b80-08df15342808
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|38070700021|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 0zN+e2y9oeg8jW4PXWGlNeyHXfXWnPRz6934tzme1bPOLqE7zufGWO69rWuljAuW4pBqBd9727QUkuk12fq2BfWfb9WcaS5fYf5DsUAxfipMwoZ/XSdAF8dUwF0F0PMjL6QYjFJbXJzsajqhLSGAack+sI/VX5LnbjkO3yS6QyO2uJ8Aaf7rsF7IfEM0F5/mSOBb7+SzE5XrTx0wWhnFWFlIcRnK2BYYjxN98pzCY3/LuVlj+va7GKJAHMxRo8wXMy4iZnonzNjfiame7D1pHEw7QSf/JF7NwMyqwlqu4JEyFVntmS9H6IYgInx3kpkcZYm8Sg2y8S2bXsvmi8/mUbEljrdU7xrIlORVYqPvgSaiTEyeMaIc4u316/eRBz/Jc6uLtvPjj9uURqe7qrYgp4dTEexF0bJ9qr5q/pIxJ994cgggsW/4b4HTTTCH06qCmhovlAfHmVbFG/OwJ8jmDMnYGVVVaRjhdBW8/W9vC3+bsMb0mcW1MD/gWT2gab/+18B2kFoJeyavPOy06wnzEGbEMnpH3v2SknFCXYmJ/gCUt5bIwfCBjabIcPUVLexVNNOrNAwu/pbxk4icOICRXloLwULRS01PENhMtNHjzkO2o4krZuSUyZ4ViLn/wqAc02Rw2K3sxbH7joyC/ZgG+Enc2MNL7Ox53HsTyh7WK9mtYncz12W9AmwPDNPFb5JGrJu1Et0l2p0aLShSRMz8A3TjuSuQ9vK7m9LT6Gp/Q0I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(38070700021)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OrX1ZzTTEhDwTtnNUwzDHizrSTbIheMbx6MXS6HgEY1lSWACLbSyH5/IFtq2?=
 =?us-ascii?Q?n4eA2Uf5OxXDmS0XTQDRXBNXvT8XkGWUIp8fT/TfJp4dHsTdYU+5fKDdEy3U?=
 =?us-ascii?Q?Ts+MV9WIFJ9nsjazY1jIXKPWpKmzNJbQk/EOzZj/hxAOC3TXk6ZProy4nsV3?=
 =?us-ascii?Q?ij/aYmaTSVNx2x8iRYgRJVH666fnRCszsi7jSaxJccluakXbcVpNtWO9I915?=
 =?us-ascii?Q?k44M2HzsK8QA+SnjO45MdANmRt0I7ZpYZLaiCEjKN6RM5j7s76xLsY1fCokP?=
 =?us-ascii?Q?ordQh1Q+snk+Q/Pqa9bFNf0loKw46cR0zjhjv6HMDhHZVgpb2tlPXQraelXr?=
 =?us-ascii?Q?EGYzgkA02ZZpDrmJ+TiGrJeTMFv1/jVnHjroJlTk1zv3aM1owwy1GfvUctKT?=
 =?us-ascii?Q?GVKGDmL4Vq1Vy6+6GvXgY2Yn7TTSL4bm3K8izwAqr7ItLukWT3jHT2N1eFoB?=
 =?us-ascii?Q?E+ynTbpNTRGEACr05rR1y3rFXuTgHIOlPxZ3n9r+ycs6FZ2YkxzF4nb+DckK?=
 =?us-ascii?Q?JoCuLcxlW42F55evdwhiOVmZocvW8VLHnQrdlQ2YBki4asHR5pnnsqGkY6QW?=
 =?us-ascii?Q?Ep2UnFR/lYNUZPtFxCmXVIe+na2FkJAjzvBMassvxmMAbgksd9uf6KR4+LLD?=
 =?us-ascii?Q?xXFnW27YN6yQa4qQkkDrxYOydBd+kLkKW1S7v3F3h1slq9DVYiibODemShaM?=
 =?us-ascii?Q?c1zga1vNGydJaYVDDF/NQeKHQaVowOQyxfXLKwW7sIEq3x38ogd302rqWyWt?=
 =?us-ascii?Q?iZU7YOn6yBMl+KcO61uJs18g2WCNuUeYcPulkNXvNdeOCkRbSGtVbe3oT4pJ?=
 =?us-ascii?Q?mxWiY2dQPR1KyM4kQBrHHQFpHVM9tTxO8Ol7JDqnZfTvRQtp63Q9TNZyOUbQ?=
 =?us-ascii?Q?gdRuR8IdlGwCcUvG5JNX9O8g4DmOuwAtiCIs1ECHjsl2OcjIbAysNtfJ8wLx?=
 =?us-ascii?Q?uoozzW0TyjZSh8Fz20SId13BsaE6hAp8AmFhQgbAdNmvu+hsdpJsWnk6Aiip?=
 =?us-ascii?Q?+nUY1Liviz7TpXvfPDNFvuVB9Wwg/kycD6/+P9JIEdDM3iE4sP3mQHINoVy1?=
 =?us-ascii?Q?uO8Auu4+3G4PGrdOgElIJiP6cSXtBULYVPzjXaA+xCuW98/oGoh2VEgZW8kl?=
 =?us-ascii?Q?gD4IUzlZtJaBkUDXBGrk+I1lmTK4INqUO9paWB3pkfFWUP8iA+lNG0qrKKm9?=
 =?us-ascii?Q?kvQwNWDJiZwmx3KDyuJnJIHFHwAgu1bC/u+Kpxa1e8VHrvQT6t6oIBpPcUWT?=
 =?us-ascii?Q?2ir0Qh+5hTWbUdltbX2zRllBI49icJVtQ/4Lmj0fabUuzCitWbOTbK9uzt2s?=
 =?us-ascii?Q?nnbi+1NYzHaDaDC1RerdDLjsH+z+qcOES+pEb2ngZqBvHAZEf0EeULpXbM3J?=
 =?us-ascii?Q?BC6k9bgWbOHqiqhSvJ0yM8Ahl8KJkMKFYs4lEbYE+T7Inzr1QOgz9R6DGJHr?=
 =?us-ascii?Q?33ceQiz0OqUIVT8sq7WXZKv1RuZWXAusytlLZ+YeRww86/cKbjt1H2myD2k4?=
 =?us-ascii?Q?K2d9PXS64TTtL8OUYMoCWCBDjYd6lzXRR+8Mly1bFkWksM5bZt8Qxzn+EzAZ?=
 =?us-ascii?Q?UrJOJTRoKGQ0/x1EtDRP4mUYn5tD4g7G4VO+uMd9z83CNo2jQ8Oq0OaqFnqd?=
 =?us-ascii?Q?77ue8uWCjtDhKwmLeeSkujKKJ0SkMo7R1R8LpDL2O9AM8OAZaRMOCvVl+6Av?=
 =?us-ascii?Q?tUK39RlzbSsP26VLeFoTHdcv/EMIkcmNcsB23xYqiB1R502L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GLiC5GsQwX8J0xHBWPOd406hTdzyRw602mBiyUEkr06ycQvhB8g2duj5CZJWD8uK6Fd4qrQYItKigeUYjgH6WM6UuJuxotggEM+EOwdTPkLWXolPvtTlfNLm0QW0eAePGiLN7EcanvHpu3ZDlBmYNazOFLTusCbNn+SktiSDZF4/52GlBojdvXZT+KFAqmgOzd6FmDAjrUzxt8RQKlB2yd/zjz+xDseYfxnzbQ9JcYpZ5kQ3j0jN2R7kFdJF3kLK5ccRFTRe+D2346GQN7cmgKlb5Bnr9zddxg7s1etBAsyXYzR8/stnOK+nsdVS9hwvRBRiuImlzLUKBTvBQg584Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e76b499-a0a3-4678-8b80-08df15342808
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:23:06.3833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Q6ZDpaeD2bR2urcSPVVQDv/IcTN2sDB7c+LtUYnQLRM6EDdpOrhDDyErcjjkyUb83yvHAl60elI8W5ZpFYCzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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

Hi @Sharma, Swati2,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: 12 September 2026 02:37
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t, v3 9/9] lib/kms: Add NVL joiner exceptions for 4K =
high-
> refresh modes
>=20
> Add the 4K high-refresh modes used by Dell AW2725QF, ASUS PG32UQXR, and
> Gigabyte AORUS FO32U2P to the NVL joiner exception list.
>=20
> The driver enables bigjoiner for these DSC modes due to DSC bubble overhe=
ad
> that IGT cannot compute. Without the exception, the test can select pipe =
D as a
> joiner primary, which fails because no following pipe is available for th=
e joiner
> secondary.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
LGTM,=20
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2d78e3bee..6e5c242cb 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7094,6 +7094,9 @@ static bool
> match_joiner_exception(drmModeModeInfo *mode,
>   */
>  static const struct joiner_mode_exception nvl_joiner_exception_modes[] =
=3D {
>  	{ 6144, 3456, 1413390 }, /* 6144x3456@60Hz */
> +	{ 3840, 2160, 1543000 }, /* 3840x2160@165Hz */
> +	{ 3840, 2160, 1398400 }, /* 3840x2160@160Hz */
> +	{ 3840, 2160, 2291120 }, /* 3840x2160@240 */
>  };
>=20
>  /*
> --
> 2.25.1

