Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4888FCD0A7
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 04:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E7410E72E;
	Wed, 18 Mar 2026 04:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJRyceTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E55010E6A0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773808158; x=1805344158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uq0E15pdDyvXlh/NwhSoc4Ay+ppKz/q7rZgSbnIm6l8=;
 b=WJRyceTH0BZRTVKEHnwwuZfBQjdrPwnd0gsFIOeIN/9WLEP0AowiJXfI
 H0lJXbo6Ai8i71h1fu6GUGeTGn1k03uAG532Ne7w3Nm3Sv+BAjNUFs3oM
 GRcxeSbYloTOu1x5Gm4Msf7gXBuVdT6mXscEBgqGJ7sSGBgHe4dPTxvBn
 3j3Wq+VW50XYQMns9NTZc2BWiUrTu97S+9yOz3LFXY3qGy/8JBYnK960a
 DvDS09H2Jl14+Ig2JcZQtkIzCXBhKWWmaxTjdPHG9+PuZBRPPeJPVrAdO
 bDamO+ewSNjb/YQ+1SPHTKbEErUMoFICMl04GnjVy/NfTZKwFMzx2nGsI w==;
X-CSE-ConnectionGUID: woynDe8NTymMt/yTvl7hGg==
X-CSE-MsgGUID: spNeDH0RTbimlGWXUu0Orw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85170861"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="85170861"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 21:29:17 -0700
X-CSE-ConnectionGUID: PDi+yECBQeG1n12WiKMduw==
X-CSE-MsgGUID: 8n5N3mfwQGWlJJOcAtX37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="260384775"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 21:29:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 21:29:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 21:29:16 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 21:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sz2pW6Nwrh7pW+7RhmJsakW3edQ5E+2Zy5RuugYUrTvg/dqndrLcgKHEkCHcgp6CRN4MeyrOYC+e/9kzVoClZWBGFDhxq+apHTct3DuHQva7ZyApZ+oxsf1+VDTzNFndBjWqY2uwiiaLs61NQ7JKY6A/OxiIlgSWLXozIctn5cysStiRDniGtJG3oC1avi42ignsR7OgQIj6gXh2JobyNdgUocD6mXZumnGdZzzJVOCBlIbPishL/teSG0GcHKLEuzseNeUOMr5enaDwhCEcQ+NiQP+d8ypz9Ke06oHHuFl82lnR3N61tnl2cO7LD/hK1Qu7c9xshjk/aOG0s46cuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vQ/Pva519rbBROqWqEoIVTN+u6wdq3QNqDShBNu9bk=;
 b=XgXXajv+D+2W2B1ldFO8ZjwYvH/fJnnuTtNk2lTJnuVYUak5FPQ7+oF4X1pZy2B1TbRQLzZmjiQbCAtVJbX04zwczks6jU7aJhvYbhlX39Vb0UshW01pjSpZy3/VQgVduVLlkmALHGLOrsz0eFxdJrMXnxm8Divq58ggvqnMSPeoFotLaGUti07v0Wy/jQHbV2mTW7+FFmB0GD2w1nRYkSn2xyAkqcXaRfK0SLgTliur4kWjt1xIZB4jkgQkQTvIyUH/DeJN2yryfzgWywcYOAx+1NJJsjg/yUaAKiWc6s7izn3xlFGU+bT1PkqUawykmiUvE9E8/dDRJL1v6JO9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH8PR11MB9607.namprd11.prod.outlook.com (2603:10b6:510:3a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 04:29:14 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 04:29:14 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
Thread-Topic: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
Thread-Index: AQHcteEMGyg3XggzSEGKB1myfRfDdrWzsQdw
Date: Wed, 18 Mar 2026 04:29:14 +0000
Message-ID: <PH7PR11MB6053B6D3D427BDD02B7556ECE74EA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260311074036.219075-2-ramanaidu.naladala@intel.com>
 <20260317073842.713155-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260317073842.713155-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH8PR11MB9607:EE_
x-ms-office365-filtering-correlation-id: 986ed232-611b-4b0d-25ff-08de84a6e96a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: +8x2HrHIyllCqDrGdqN6piH5JlIQlY9CkpfOEcDsixT7JXto32yjzwu+GxNZS2on+yLCZWUgDFc9MAkza9/gXDeb1puMFNPhE2maaVzmhKESX5K5kIh61uMGxFq02A1sG7H6kVGBQ9LflHo+Be8+HutsY/vN1LfGozJxg8OKQ5RfgTaoCLBeOw3Xcf+7Wf5p7HlourRSkKGFD7E0y4HMfoaVESh0p0+w4Iu6EP2JrBMH1foudTDeEQl19Rh49mqvA/qxRXfcaEpcsMswvRBj/rkNd3LA5Y+pTzWm4cTW3hPJ34hK4TKs2HV1UkUkkixjzBKFkD9X4pyBK2ITvlOZo8Iixb4EnZaiPHcQGGe4yzxGH3vDAEby1yFj5Gs2jSUupQfjR1N4pHMTSEvreOD0nmyeWGB1PYGOoAiJ7dnCKWZPNSqC+kp5kT3AjM7EZMToioDrI7zAjTfTMa7llmzyqNzxxTEEcPERTOw31dSK602QS+LfayZPyr1ZL9B77MYGRj6CJflM8BqSP171HhadwY982V1vfoUe1w6Bj/ibuSJ56CQkbrkxdMm6ejV1EvjdaWkL7euDSTukbmVk8fISzIrQmj44bdy0M9kzZcusXdWcS6P3KxxBM6uodQA3nVvHZ4k7qIXW+cIYr2P8BT0QgHOzmdO1aTuJILp5eW7r3PMroI8gnwDUcn8mHzIXNBL0EWbHxbWWGL7YqlqvNy/ZHQxrLAW126HRSSgDSWv1/YNeiunqj91NgTM977l/2wGMAUrALO3lTW311Swy87hETzJJNUKbq1vHHWYuqvvXRyU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YDu8rjYlq/acmuhlCn1x4lJNQtUXTt22V8770BNISdnFlX1+xHAen5EWGq7G?=
 =?us-ascii?Q?AWsXiDmjDGPAQc7xVIW0BfIxrrqqxsQYHHVJyio9udGQx9EtY/uHDp8kdDSc?=
 =?us-ascii?Q?KWGkuC/wOr53GCFg1QF0kmK0dh7RB8NRq9zTItEnCGOrl2CM6yIFUV7k3oDk?=
 =?us-ascii?Q?hNPVSny7OgD8eChOGpMXddTqSQ8kg+x/l1E8c3MamcmdqokopFLiV5qxK5fv?=
 =?us-ascii?Q?GIxudEwbhMin8HqkPLBKKzOxg3F0yT1oQ3rann4RiI8ZrFe53jXCPV0T8Y+N?=
 =?us-ascii?Q?tmrzgFHbrzFD4EUv3bMdDpkTAlGBj/k9LHxPXqXrznntzi49auM2fCed7zkf?=
 =?us-ascii?Q?9j3zJZBbIBxcVXV2bseaeSGZideSf+1TaTlkCdKPzKgNesxXQQli39ge+jZZ?=
 =?us-ascii?Q?Z/9BgJmci8wqwAfi2BnP3CeN5TgrocY35b6viPeGx5PSJRWO1q6+2HQEh6Li?=
 =?us-ascii?Q?2E57R9J1AYd3+R3J4dnXjWBNMkQ2l2pF8v90bWBNAflUYohB+KGAP4wBThyW?=
 =?us-ascii?Q?k8AcL5t4EmXUROO8X1BJDjbkcvSAT7ZtbE02fpWRxgBQky3SiKiN5qmynDs4?=
 =?us-ascii?Q?UO/HFH8O45ZacD6oKdkmoAYRFv4a6+3sXPlNMSpUNuFEv+ngRetkQHc5GaHm?=
 =?us-ascii?Q?MXf0I3ByJVgmUKyV35J6FRBa2cA9rtd6bgNcJN4CXb3+Vu+XG6DRpHiXkLRc?=
 =?us-ascii?Q?Gq+ue/s8rO9FwVfk3IjGHHDk/8y4I7cIIldDi0FFHUdqwLnDs28k3uAguqHc?=
 =?us-ascii?Q?a8n2gXLz8VLcZqUvRO2sIfO3BZm4I9SniHcaAk/CEoScM1zXZHvC9KbfCi3u?=
 =?us-ascii?Q?fJcUAoZktgPVIJgnhwESYg5iwz/8MM9HM1/Lkg+Lwh5L7Y12Tfal5YIJfpmx?=
 =?us-ascii?Q?nJA5kg2ylRmbNj45JZPRiG6NuHK+sR64x1W31ydk8Z1M6up46xbhWQz5QuzP?=
 =?us-ascii?Q?jqTQ4CAwm0dXhxwNTr2Qs8VLMCl3+3GmygNgZg9F2F+sLyvLAfnIZ6UFJoqa?=
 =?us-ascii?Q?PkQRzPyOp+7PmEcX0AUjgrJi6KBevG5ybM7wowZPXmLjOTJ0x5szQio9Y2ac?=
 =?us-ascii?Q?9wGyrxizmTONu1a1RLc8y75LbQ9UYpXKGo9MpkaY0H/2XGBSUjV96plXehmV?=
 =?us-ascii?Q?K7iqmebiqTlNZwzF6kpTSAYvUf/wAUPlKRs8qUqGK9PsIGfUVnhuErX6yfGg?=
 =?us-ascii?Q?Oqhh7Ozxder6PaKWKQ9GZ6muRTP53fg+JqjiZjwtVSsjFCJPe+KxK+Te32Ph?=
 =?us-ascii?Q?PuoBVOvd/f8G+IJBvh04v3g0q38znPs0+55gyNyCiK8UuvdbriLnlEAVjVxW?=
 =?us-ascii?Q?lo3XxFcmScU3XGkpm9waSJ1/qLPhkrrLi3kEe+Hz40YLVOxxq0IFGnyR2+UV?=
 =?us-ascii?Q?ic70RFa7hNJYQwuLpvhnREUQ6O8sItp0klINhWhbx6OlywH+TE7wVkR42Csp?=
 =?us-ascii?Q?nEZEst3OT+B4G9SAgCO6t3Pt30tzXBoGh8sXzkGQZnAQZ6x9uT1t6pJzQTGi?=
 =?us-ascii?Q?9/DlUx4C3DCLBV1NPglT7Zbh/ggMKijMsQTGNLps+yVa2OOp8tuQQ355VMmr?=
 =?us-ascii?Q?fL1pMWZonOtQ561vsjmgkNW6KLlvpZ04YZG8Lf0fZtRw9ifHldoo5qfap8fs?=
 =?us-ascii?Q?7IcpLHjtY9nTFYerRS+JVYWFJqaa8K6SnPjQc8enZRr18mhgVEm5rtapjAA6?=
 =?us-ascii?Q?yt15oqVYjC0QnrE7iL29F6Tl2NZWoqgcOYk5JdQrH+SyTr8+8jQaXWm9FjWK?=
 =?us-ascii?Q?7npXLSAvSw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lUBKV0mwls+6CZQdc+IIsMuOEbsrXE6da30gSKaQivLkPnUYsFDta9wOBZYAykc0fxECo+UH0VPnmX4tgqRrXSc1d7QbR/WI5wrdUOaxXNBzg9XdMScK4oowsw+Bb4+wKgUAzDA6YwVHmM6XhZffzxAsrgtmZ+rrjUcCu4CE4UIlNPA9xjQu0WgDdksCJBL6WgjnWTJnVwhFcRKU63fWbWm/VBXfgGHGq6QfluYjJrN81mImielObJ/ix3V3fo5As/vUI8M9/Ve/BzS+H7XDmE1ucHIr2TBabANMjqY2iIr7gspRRHErpn9vhNZCkMuVjC99HT4o0q/BSywLWKF1Xw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986ed232-611b-4b0d-25ff-08de84a6e96a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 04:29:14.8641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uf6w3/GYyj7LyvOSdFPhzxvQtGWTCNzfHIzFVvxiN98fIxmn2FRXt9youZY6g28zhmBZzVTgVIoG0Nvdy9Fy8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9607
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

Hi Ramanaidu,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Naladala Ramanaidu
> Sent: Tuesday, March 17, 2026 1:09 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported scali=
ng
> scenarios
>=20
> Skip unsupported downscale tests on Intel platforms, aligning test covera=
ge
> with hardware limitations and reducing CI noise.
>=20
> v2: Convert helper to issue skips for unsupported downscale
>     requirements. Address review comments. (Jeevan)
>=20
> Bspec: 50441
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> ab619fb2b..3e25d9743 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -533,6 +533,22 @@ const struct {
>  	},
>  };
>=20
> +static void is_intel_downscale_supported(data_t *data, const char * cons=
t
> name,
> +					 const enum scaler_combo_test_type
> test_type) {
> +	if ((intel_display_ver(data->devid) >=3D 14) &&
> +	    (test_type =3D=3D TEST_PLANES_DOWNSCALE))
> +		igt_skip("Required downscale not supported on scalar 2.\n");

Here instead of using if with igt_skip, this can be simplified by using igt=
_skip_on_f().

> +
> +	if ((intel_display_ver(data->devid) >=3D 14) &&

Imho, to avoid repeated calls to intel_display_ver(), consider caching its =
value in a variable=20
during initial fixture and use it wherever needed.

> +	    (test_type =3D=3D TEST_PLANES_UPSCALE_DOWNSCALE) &&
> +	    strstr(name, "planes-upscale"))
> +		igt_skip("Required downscale not supported on scalar 2.\n");

Same as above.

> +
> +	if (strstr(name, "downscale-factor-0-25"))
> +		igt_skip("Required downscale not supported.\n"); }

Same as above.

Regards,
Pranay

> +
>  static int get_width(drmModeModeInfo *mode, double scaling_factor)  {
>  	if (scaling_factor =3D=3D 0.0)
> @@ -1373,6 +1389,10 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
>=20
> 	igt_describe(scaler_with_pixel_format_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].na
> me) {
> +				if (is_intel_device(data.drm_fd))
> +					is_intel_downscale_supported(&data,
> +
> 	scaler_with_pixel_format_tests[index].name,
> +							0);
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> @@ -1404,6 +1424,10 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_rotation_tests); index++) {
>=20
> 	igt_describe(scaler_with_rotation_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
> +				if (is_intel_device(data.drm_fd))
> +					is_intel_downscale_supported(&data,
> +
> 	scaler_with_rotation_tests[index].name,
> +							0);
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> @@ -1435,6 +1459,10 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
>=20
> 	igt_describe(scaler_with_modifiers_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name)
> {
> +				if (is_intel_device(data.drm_fd))
> +					is_intel_downscale_supported(&data,
> +
> 	scaler_with_modifiers_tests[index].name,
> +							0);
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> @@ -1548,6 +1576,10 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
>=20
> 	igt_describe(scaler_with_2_planes_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name)
> {
> +				if (is_intel_device(data.drm_fd))
> +					is_intel_downscale_supported(&data,
> +
> 	scaler_with_2_planes_tests[index].name,
> +
> 	scaler_with_2_planes_tests[index].test_type);
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> --
> 2.43.0

