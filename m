Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD4606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDYgIiab
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21F10E851;
	Wed,  4 Nov 2026 08:39:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F45F10E864
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 08:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793781540; x=1825317540;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XUYlpnf/2GKhZtOPfP7bPWvy0r7bRKNx780Q+7zAD2Q=;
 b=aDYgIiab8hcHOU6Mohd/ERnGeMEoSxCS8HTtQMBlG8e/FgSqeHrXWWQ5
 Zw1ny117Pjib0LCGbLl9V1OG7RLGy7Hng47DIvpCrXhCz4RSKizDuqA6v
 0VRZRvyd9uU0d+D6wRqRIHDO5FMmDvHdSNPkn1hpOvYDV7ZBT6S3LxK3I
 /y6RrnySzQtCW2+pCNBzi/qC3rZyWItcr2KdiMcmKB6jmOpAQ4TUnp/kU
 HbFouaOzM/iYLBC/mxbpoT6HJ5WAZCSFOlKKlefzap2NUKGf6aI37IHHe
 SYaI7da8RxP68pX8gfjN4LaYqC3JA5Skuach+O7OGKKQUjrMCQhcGhYSw Q==;
X-CSE-ConnectionGUID: oLqTov6JTcmS8bpVTCHFUA==
X-CSE-MsgGUID: mQrd4NcmTQaxa36gK+ebFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2562651"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2562651"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:38:12 -0800
X-CSE-ConnectionGUID: jRX6vRvbT7ODLpuSTX+nUA==
X-CSE-MsgGUID: vbAT+6NcTHaGuA+NYjAtfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6669923"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:38:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:38:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 00:38:10 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:38:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYligJQUWwj+K3oZkMfDpEvEoexOAW2wVb39Vnz6ZHGv9tJI+YelPlP77n1+63IIvQtcvSM7LBDKtqblhwyDTTDimHdAFGwLkAbX9totVyxLTxYZzPJaMarl22pmwznpWOv14K4+BshHdgOVNvVTBTmkb6bAc6xsXyXXboT4ronmKSU4HUHb7mdMwnbVadl4oQMeoOLY/TvIIgyLnYUk3ojS4pQe/DsvO055TKZCCKjn+N9RpPSi2YCdhtZn2uStJWcZXoFf3hSYu+h+vDqkT5V8jy1MMdWEgWWhVVP30VDvMwPeIilLdCntx34uNqi0h1pnfyMeGDEnRukWhaaRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1xWLcwe4mEZqCr7eJ8mTchbTZDdWpKn2bZwerEGMoo=;
 b=T27hDo+VVFfp6o8lAUf/J6dUjmnd9FI28c4jdTdZwBfmfJRfwl7xUwlEXKbdoV5u3hqmVv8eu3qZgo1JG0qIKiNwxE05jYsMCvUgUlPhA77E4x9UUkXgtEGqIPefiH1QEFz7nIdIuR98XMo40QN/In4VF4hvAw25EpqrLcOgowYX/y5Ww8x2qMpEleyn/TmYLRUGog0E17L5Fc7FHDrsRhNqcN3obebEdppZFTyWd4fcvuREu8Y0B4+eexVlsFdAT7pnRp+NEHGg42zDrDW3CjRd0xpMujsFVaDFDeGdg7l+8unZkZtXjL4QcaDwZAHrf0MoZ7SSj9csdBU/zlwzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 08:38:03 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 08:38:03 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] tests/kms_rotation_crc: reduce multiplane CI debug
 output
Thread-Topic: [PATCH 3/3] tests/kms_rotation_crc: reduce multiplane CI debug
 output
Thread-Index: AQHdZW4Ovj3shKTKIESG5vk4THFUObcdo8Sw
Date: Wed, 4 Nov 2026 08:38:03 +0000
Message-ID: <PH7PR11MB6053A845DC2F8107AAEF61F7E7682@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261026171836.1434992-1-jeevan.b@intel.com>
 <20261026171836.1434992-4-jeevan.b@intel.com>
In-Reply-To: <20261026171836.1434992-4-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ2PR11MB8568:EE_
x-ms-office365-filtering-correlation-id: 5c67d8f6-acaf-4fda-cbfb-08df3a4ef12a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261028144727099003|261009223027099003|261026140227099003|261102123227099003|261021121427099003|261022105027099003|261022075727099003|56012099006|11063799006|4143699003|3023799007|261021123027099003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: Z/R7+fYBctyQyuQBudI7W1yoVDmvFO/ElvDVc/AYMSQu2Zm6LxBjyas3Rro1zwjsy6t45Z0qAyXHju8G522uhyB5R+EVr916H7XbF7YvQknR6QfqzZJ/mUgVeTHAlZm/Lj4oMKt3vEjFgBLZFwLTsAuWkmQOocH+wJ3k9ZtWkWA+YHuE5295eJt4HBa5TGlHzuKZG6AQWaIvXMrJmDkkvKAQRms6phsvamJFEdLjtZsOCmzOw3FUIy08ZWd2zSdZyiWkwyMLsdOVGV9UTW/W7EjwwD3PUdy4jOgfeUgZUOhLhFQCTHQiuDmZ87qLYb6nzdQ46Q5RzsRwI5kJn3LNoUYHq9gkSoVgdTgI7i+7MbCc5G2lpd0Rcx62mVn8TwkDzk6pAUlEFPETxWhk0/V+tWtvI66KODzYpPtjScPty+nHLQwZjDnf4VxQyiypIKNKJPeboRp1Ci5vcWEIiiOZnpI35QhA2fH0MzOZIPPVfRjX+GvVq8QAEAUCss/oA6LaZtiv1FvyhgteBNCeu/fXihOVE/o+8n4/72sufFmVAJJfftcZWJLy8HrISn6+aSNQTnRNBuf0bJI94eKz2SuQeqmM6yf7v2eBWSCMrMjOyhR5TG/z4qPAk/2n5sONIrkQLiyymbP0TEy6NTPORVqYAJimwzG0VZKiKs42c/XrIX8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261028144727099003)(261009223027099003)(261026140227099003)(261102123227099003)(261021121427099003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(4143699003)(3023799007)(261021123027099003)(10067099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W4nQf+1yZwX6wuR+ABXZVDy9cJJAYfV9oqs4E4zxohln/B0W4Hut5UfVwkPk?=
 =?us-ascii?Q?McaKlgFtZR/lEtXaQpxtejlAEupTBo4Ff1UWQ6FwtPmWg9rYgYyj3e+sDNnG?=
 =?us-ascii?Q?fJCcygGAI9L+49LR+sopXiOBGQpRy7g2Lat70BAA/e3RD1kWIRzyNX95/+iD?=
 =?us-ascii?Q?aKqHEsZViMOGFlhNk6cFmDdn7q29t+EAP72fg0KXiDqhJTVdNg8HnFirE7rB?=
 =?us-ascii?Q?xe61s0y8EoJiuIb3mag//dNCsY3yarlzlsW63u3gC8Hf1M/abCZ499+Ll8hK?=
 =?us-ascii?Q?1NzMenD8oGI83pL1WRfsBepyyxcw5Mt/J32A+ek9/WOZ1bSMBU37s+nhDl4B?=
 =?us-ascii?Q?Tx0QRoTGe4oLCDbdgeDn21DnV1oTb1avVmbL7H1Zs1hHPQRxkzcZH40B79+M?=
 =?us-ascii?Q?WFxwYm/5BaebFBxB8g44gcC70Pmz923D58Jg98m3KLSszL4+ApiqH4g2LyIC?=
 =?us-ascii?Q?VZPVisXJbnvrwIPdiHeOk0lM3Bvu+jQXpKT57vzLBX8a7bfvPSvq2DwJnN1t?=
 =?us-ascii?Q?G3bWtsPoOtxwXYEn9mJQL/pjgLbRPU3j6Ftw3hosfNqRSvP9lWpJpNCU8ise?=
 =?us-ascii?Q?LXMq2fQI+osVBBjEXNIDOSs45Qv9QwYpDY/3xjMNjjHwM/EbMsmuyrmvwHmP?=
 =?us-ascii?Q?yYBAffq5CkVIoKIUpQrUpsJqgq5mgo56z/WWMtrnw3yPHI/qgMgMjYWR5UF3?=
 =?us-ascii?Q?O8Te9Hjgi5AAGKsnlUKqVGmybLUIn7cwZnakzVAqdIGmuVMQsWxO7KkYdees?=
 =?us-ascii?Q?1whvr0nLBp1GWfAw9j7miR4iRrw84VPczRUHxv3rQ3yrlF+z8B5+KLC6ckpG?=
 =?us-ascii?Q?cylhjgUibA6JohYRx1uIPZiVWuUMlnwvFmQISgnla/j1mHRQ4HhTd8KxqeSX?=
 =?us-ascii?Q?IUTw5fBAZGbh5IChOs+x1RHW6OajwVq/xi1SWx0F2BOIxMSNZeIM+8rCEUbc?=
 =?us-ascii?Q?mCAFl9iw0I2UlEN49q+7JDNgv7ATdQFihzoDpqJzgR0i3iOpzR3UD2SbRyZs?=
 =?us-ascii?Q?oEBfIzIUwTH58CaFA5WeRvbyfIR2/zq/B+/Mj41+IFqSuKvzrvpTirKlZBWv?=
 =?us-ascii?Q?L3RgTxInGMtarFlzu4divS2LU91Nbbke309eRuWAa4UsXIy/g2o5kKhMTEAE?=
 =?us-ascii?Q?wFmnORSD4oYXpB1r1h0Yynu2dsgoAvXFqq1U6A9Kp9v5jNUQcw834Uc/Ehj5?=
 =?us-ascii?Q?ZYFPs9BTzZwT0HuAlMLLs25bBA5HvKtollK16sKIMYS3mqDlBof+Clu8ATXf?=
 =?us-ascii?Q?9WBRBrdNBzi9oEZou7YBckzCK0kcELRMyCqiz4uJexMFOzLEMLv3jySd3pVk?=
 =?us-ascii?Q?Vw8vpzgQ38ECy8Ky+V6LrLfNxmzuRRcyT8skH5+8qDHuUn0ZULwz8tMg2Dox?=
 =?us-ascii?Q?GhirbuhUMSmmsysaYkISSd19pUdCITgYWy9g1vWucgxIfu0eHK1jc2Aj0N/U?=
 =?us-ascii?Q?sq7xQTzeJ2yRKBMS65oht/Q235qzAoqLEWxK+KK1x+10P4VsqLGM3DmNzklD?=
 =?us-ascii?Q?xhTWd7qroZYJKQ3F3jfaSd8BdO7OA0nWmTd7k4Mdy0vV5bpT1N7pdIO9TBxH?=
 =?us-ascii?Q?Q7cqbciADCSlTUr65dhlh8U7vHAxcfEdzbw4fERSpeZpEQG+/2QUmoErVSZ0?=
 =?us-ascii?Q?S08psCevj8EMiv3LY0JLnRV7IPSXbqQ+I2o/nub4/NY6sF+qWiy1PvybgMP0?=
 =?us-ascii?Q?ENfxS7cDVacj6UdDrLvxcz1X4+Z+DoLTsEqJbj1X7GaKFjM4VSn/2NO5aE+T?=
 =?us-ascii?Q?a2p9sodKZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LwmCE4hi6SA72uqLyUFBZaWRSvx0ty7PuaRi6CTHmL3ERSO7AwkZBEzISqWG52e7FFHoSENB1ZYXiSKq/3MlzZZdrRtFHfFssETBtztqyIx++qS0CCZbvqPoPS9tWskHnxVme188xEa9e7HV/7j08XVyoAwyIlBjF7+Yd4mytoYjIVThtGAQZFNOfiS3HJhChELvCVcf3q7GGhfedHF7A7n5kwOtbZis22o4loipo32lDhPn1vbiaRFeKqwlu3it1LuRakov3+KYqKoJIsvsVIc8Ap9Em6Rj159hMH3hQtQmHXUmBtIBXNaUo+x+c9wElSARgNlUjOT6Gpol0MvVrw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c67d8f6-acaf-4fda-cbfb-08df3a4ef12a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 08:38:03.7266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+HrvItdW+yicRZ37U4/lLpEyiMcae81uxUloX+hOU9WRQXXgn4+dMYDDeY5cg+9ZBovoWcK1ulImTnbYTUq9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

HI Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Monday, October 26, 2026 10:49 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH 3/3] tests/kms_rotation_crc: reduce multiplane CI debug
> output
>=20
> Use DRM_UT_CORE in CI for multiplane-rotation and both cropping variants
> to suppress KMS debug logs while retaining CORE diagnostics. Restore the
> original mask after the group and on exit; other subtests are unchanged.
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16184
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_rotation_crc.c | 96 ++++++++++++++++++++++------------------
>  1 file changed, 53 insertions(+), 43 deletions(-)
>=20
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
> a01aac78f..c3481880b 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -31,6 +31,7 @@
>   */
>=20
>  #include "igt.h"
> +#include "igt_sysfs.h"
>  #include "igt_vec.h"
>  #include <math.h>
>=20
> @@ -1437,6 +1438,7 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>=20
>  		igt_display_require(&data.display, data.gfx_fd);
>  		igt_require(data.display.is_atomic);
> +
> 	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>  	}
>=20
>  	igt_describe("Rotation test with 90/270 degree for primary and sprite
> planes of gen9+"); @@ -1502,51 +1504,59 @@ int igt_main_args("",
> long_opts, help_str, opt_handler, &data)
>  		}
>  	}
>=20
> -	igt_describe("Rotation test on both planes by making them fully
> visible");
> -	igt_subtest_f("multiplane-rotation") {
> -		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> -
> -		igt_require(gen >=3D 9);
> -		cleanup_crtc(&data);
> -		data.planepos[0].origo =3D p_top | p_left;
> -		data.planepos[0].x =3D .2f;
> -		data.planepos[0].y =3D .1f;
> -		data.planepos[1].origo =3D p_top | p_right;
> -		data.planepos[1].x =3D -.4f;
> -		data.planepos[1].y =3D .1f;
> -		test_multi_plane_rotation(&data, crtc);
> -	}
> +	igt_subtest_group() {
> +		igt_fixture()
> +			update_debug_mask_if_ci(DRM_UT_CORE);

Nit: add a one-line comment on the group explaining why the debug mask is=20
lowered for these subtest group only.

>=20
> -	igt_describe("Rotation test on both planes by cropping left/top
> corner of primary plane and"
> -			"right/top corner of sprite plane");
> -	igt_subtest_f("multiplane-rotation-cropping-top") {
> -		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> -
> -		igt_require(gen >=3D 9);
> -		cleanup_crtc(&data);
> -		data.planepos[0].origo =3D p_top | p_left;
> -		data.planepos[0].x =3D -.05f;
> -		data.planepos[0].y =3D -.15f;
> -		data.planepos[1].origo =3D p_top | p_right;
> -		data.planepos[1].x =3D -.15f;
> -		data.planepos[1].y =3D -.15f;
> -		test_multi_plane_rotation(&data, crtc);
> -	}
> +		igt_describe("Rotation test on both planes by making them
> fully visible");
> +		igt_subtest_f("multiplane-rotation") {
> +			igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> +
> +			igt_require(gen >=3D 9);
> +			cleanup_crtc(&data);
> +			data.planepos[0].origo =3D p_top | p_left;
> +			data.planepos[0].x =3D .2f;
> +			data.planepos[0].y =3D .1f;
> +			data.planepos[1].origo =3D p_top | p_right;
> +			data.planepos[1].x =3D -.4f;
> +			data.planepos[1].y =3D .1f;
> +			test_multi_plane_rotation(&data, crtc);
> +		}
>=20
> -	igt_describe("Rotation test on both planes by cropping left/bottom
> corner of primary plane"
> -			"and right/bottom corner of sprite plane");
> -	igt_subtest_f("multiplane-rotation-cropping-bottom") {
> -		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> -
> -		igt_require(gen >=3D 9);
> -		cleanup_crtc(&data);
> -		data.planepos[0].origo =3D p_bottom | p_left;
> -		data.planepos[0].x =3D -.05f;
> -		data.planepos[0].y =3D -.20f;
> -		data.planepos[1].origo =3D p_bottom | p_right;
> -		data.planepos[1].x =3D -.15f;
> -		data.planepos[1].y =3D -.20f;
> -		test_multi_plane_rotation(&data, crtc);
> +		igt_describe("Rotation test on both planes by cropping
> left/top corner of primary "
> +			     "plane and right/top corner of sprite plane");
> +		igt_subtest_f("multiplane-rotation-cropping-top") {
> +			igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> +
> +			igt_require(gen >=3D 9);
> +			cleanup_crtc(&data);
> +			data.planepos[0].origo =3D p_top | p_left;
> +			data.planepos[0].x =3D -.05f;
> +			data.planepos[0].y =3D -.15f;
> +			data.planepos[1].origo =3D p_top | p_right;
> +			data.planepos[1].x =3D -.15f;
> +			data.planepos[1].y =3D -.15f;
> +			test_multi_plane_rotation(&data, crtc);
> +		}
> +
> +		igt_describe("Rotation test on both planes by cropping
> left/bottom corner of "
> +			     "primary plane and right/bottom corner of sprite
> plane");
> +		igt_subtest_f("multiplane-rotation-cropping-bottom") {
> +			igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> +
> +			igt_require(gen >=3D 9);
> +			cleanup_crtc(&data);
> +			data.planepos[0].origo =3D p_bottom | p_left;
> +			data.planepos[0].x =3D -.05f;
> +			data.planepos[0].y =3D -.20f;
> +			data.planepos[1].origo =3D p_bottom | p_right;
> +			data.planepos[1].x =3D -.15f;
> +			data.planepos[1].y =3D -.20f;
> +			test_multi_plane_rotation(&data, crtc);
> +		}
> +
> +		igt_fixture()
> +			igt_drm_debug_mask_reset();

Apart from this, changes LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>  	}
>=20
>  	igt_describe("Rotation test on primary plane with concurrent cursor
> movement");
> --
> 2.43.0

