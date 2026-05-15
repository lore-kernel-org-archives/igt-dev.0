Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8DFCD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 05:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A20010F3D8;
	Fri, 15 May 2026 05:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYqLqp8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D752510F3D9
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 05:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778822844; x=1810358844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T4juFqeIMe9a3VwgakxFyouRW1rJfajQdIFsZZHZH1A=;
 b=hYqLqp8YCaRRhG8C+43AU3yjVyOfykaICD1I7Cbx10yolhi8Zha96x1S
 twZciLGYYY0vjqzxaQPaUSNSA/3im4euUCuRLw4Hq5gdf5S33u536DGuB
 MDCaGx0hJJiMm2fkLK3xFD7kbg8MPdb1Lh5hhiAQNW5hyv+ZTPU5Gcujk
 MfXFEK76Xpc2mBpwbiEu3A1sp4Q3vjv7E4PYE59AVs6oC+beaPnfZRWll
 VfiMI65pvhbzpwMDRq4xejw9wPSFbc+C2TTEF2LUOyheYFlAyA9ycz9ym
 x/AFp4o8xJ88vNkTy5p/5YzLuQGVI7tWI/gZsjaGZeMDB03jF28c6ca6l g==;
X-CSE-ConnectionGUID: HoHYrsAdRI2BzY6Wt089Ag==
X-CSE-MsgGUID: SHJPBkUrQYWbzo+LT7htEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97348508"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="97348508"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 22:27:24 -0700
X-CSE-ConnectionGUID: 9wELXcQtQqusBkImBpGhkQ==
X-CSE-MsgGUID: 4Xy/WlXrR86dr6HwVHnGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="243561880"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 22:27:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:27:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 22:27:22 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:27:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsJvac3xwuhzYtzRw/TAm1TzPWL3StnlSKhkzRGB28kpePCXmkC+9jAApHNNjSFa7M6omeDATn83nx+f+ZWi0+vuauFXNgD82jLj0+twr76/PKaFJIpUjfoWtbvE06qaCarqB5Yz+EV0yQ9xlTzmbvxtpRDIJmCDM7Fp7ACRWUHbakolCV2JbFlrmvPkuLYiV9iB7SrJTp+xS68aQHQS/eEwmnYRg2+AmlBTTTWLCxKXu93PyxH4ND+SIKlBuM5vP7HpCSzAdpP52dTukD35AZr0ak2FfXafwxcFBID/OabWpEAjShkcolTsIPeT3sZ625naABLn6ptCEAlbad14Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbsAysBlCMl7L4Gw7/gfqb+f4j76mcgigg7efVP7zt4=;
 b=gt57Hp3stXL5FwldKZhFcSYlfFtgR4jFxY+jlMk/Kze6mumzESayO1dd+HHTMf5CHZuV3oR3OgxreVOkYQceVqufTyaWm98qA3lODFrD94eBy6a6nQq0V7ynZF+CzPwhmttrnrzdBXrqv/jMHlFglmUpFJoYjn/FgAVvzWydI/tgoGtVnKNS0g6OuZEBBaf8nB/gtyXe7VCNcbtBtHEjBwECXyFzNIlV59bAeVL28Ir1cUU5VQS82Bi73wVrfn0pKU3iOHvmT49GUgTYU4NVSSNChHvuo2LGJ/UKBRhqpJyWf9qYsHywn3gMJ7B+6fSfgSjwh6K2MnAckkO94Azfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6429.namprd11.prod.outlook.com
 (2603:10b6:8:b5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 05:27:18 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:27:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "jason-jh.lin@mediatek.com" <jason-jh.lin@mediatek.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "fshao@chromium.org" <fshao@chromium.org>, "Navare,
 Manasi" <navaremanasi@google.com>
Subject: RE: [PATCH i-g-t v1 2/3] Revert "tests/kms_content_protection: Pass
 crtc parameter and use per-CRTC FBs"
Thread-Topic: [PATCH i-g-t v1 2/3] Revert "tests/kms_content_protection: Pass
 crtc parameter and use per-CRTC FBs"
Thread-Index: AQHc44XX/uEDjnaZ4EGsVaaMIemTjLYOj9qw
Date: Fri, 15 May 2026 05:27:18 +0000
Message-ID: <DM3PPF208195D8DCDE02C77F166CEFE6030E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
 <20260514093510.688396-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260514093510.688396-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6429:EE_
x-ms-office365-filtering-correlation-id: d6bd0aa3-6f81-49d9-3ece-08deb242a1c5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|4143699003|38070700021|18002099003|3023799003|11063799003|22082099003|56012099003;
x-microsoft-antispam-message-info: 5JNyF+kvEj7V4Dh7FmpQpDx3b7+JlffRco+bonONahgJRxuQVWaroQTDp+yBjn1pmE7Zs1zV3hb86aK9OtJrQcEpiz5Ivj6M78LERHiv7VjSsPx0gPpVd0CNmptGo7kKpMsy9zXPXzg3Vwk2MzPfzXp4O28S5pfvZVU2fT7AVwxIB6jWOHd+bGA/IapuAQPQw7YHjW/iL2lQ+6DzKj9TbN3hcOnnmOrV2SHEyUBUX5gbIDGFfEgInBNo10o+AFRlIlbiS6Nt1IiiqnMdg+5KQdlvxBOr12ocCEWexLsnot//BXgysyrM15uyIG1KdOPXgRz0UwgQIw8SIRgr3vHBQxbv/DI6qj88x4ZssRoE/vjTB6F14RSzj2hFV4ZajfyUF/i1Cd21tLt7aoIepG09Sx8DlUOy6E/as/AnrmTLVXSXlCCQaBr6uIUvDP5Camd9uPIcFK7MP+BEB4ak8OAXZZcyH0ghKe4TntbEJLOuytFy5uOX70dhevRriHjgid2ITnyhYujIKhw6kZWmRMATEuR0z3gXlj0BHs66eiIo3ql5kBGu6ZV7k5mkpQw6Y5XCsuh+CR/Z+fBiE3tVjDr0Vw/gFFp740k+1psjFA5hpxHAM4HWqGVt/KsaGBQxB4kTPPg5VeqObYmen7nRJqzv0w4kc0BOY9EGu2jH39tsCiEdIBFszX5ZH21hCztjqBcBbys0CXsio6Jazjjt5pKaQdWJ9UrVq6P4S4PXQsyihow6uhyZTBIXAZny8T6XqSeg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(38070700021)(18002099003)(3023799003)(11063799003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RlgMj1UDTnwksPaIJksDfw/xXfaWICAnaghd9sXGeaD3gGf6YXjuP6QXfzpD?=
 =?us-ascii?Q?Zy53H5seyM0x6IZtj4r6qYoPpdNhRud5v/a6qCFOeM5GJkTmjCeUxk+lXfh6?=
 =?us-ascii?Q?J6QSn1ejRJ8HZ77mvefE1/o4BnetMabGojdHbI9OjehdMJ0xeSnisgDXEEv/?=
 =?us-ascii?Q?37R034cjBe0fEuaQodMTF1xV/25BLE2ZIvmmUwP65aa3BN2Be8m6DEfZvI2K?=
 =?us-ascii?Q?88Nu45YTuQMOAeNqG7QUhXgAXLjA7G07P9k+LOxAjZ/1cduu4W0aOO0DWafK?=
 =?us-ascii?Q?12pqq3PFkOzszeigSzqoQQ9zfjsIqjXnvTNKgpgC/X71nchobyQ+5DwTQYZe?=
 =?us-ascii?Q?VF/kemyU8tboK2MPrKVCwZ3MjHsTSsedifVEX2fsUZdxejhDF7uEX/hpPcTv?=
 =?us-ascii?Q?CjWfYeEhivmsdM+s2m1QPvZUlEkEaYZ96AiAjSaEO4vbBxu5hN+qM1yBUTKS?=
 =?us-ascii?Q?bQDxKI4VZnhJCgsBpCP6+WYzddx0OsPMDHxeMY5AFsl7iO3EV0WZGUakJUnM?=
 =?us-ascii?Q?Fiqfhd4YRHZwQpjMtgvh5K6SA7E2gaZL0mq+rmd5iUGeWID6YK8zBx5ThDvM?=
 =?us-ascii?Q?nRwe5b+lPN25WmOzz/ZwkTQ2aKlSTyRpjFz3Jtqlz9L2ZtQeKwwSm6P4RMof?=
 =?us-ascii?Q?prrYpv+9q1iPx7n/xY5gcGC0C5JB40nD0syV6NTzpOkkp547X5Gfa3aeS5Rk?=
 =?us-ascii?Q?avQFOjhZfMEpyMjBbbX/M7ImKWxhHgpEtj99NL3apstgF4T8LyMaL4Z9tmjj?=
 =?us-ascii?Q?Z0ZuvP7/K6U1jL+vDeC5odEToNnoedE4AwckBYmc18vM6+uB+ZYaIQZBQyXh?=
 =?us-ascii?Q?sogXSfOWnLmImKvAT0oEivNNwQ/1CTJu0gGavfA9gwxRQQ2ItQsgZB67EH2H?=
 =?us-ascii?Q?RMOgXDCpAUwePtbv2c/89xBnG9l4nsNa7KdX78uYyhh75xdZGzalaQYbuq1i?=
 =?us-ascii?Q?aWqb5rwF6F9+6piLqGuE5bQVB6AuI9ybaq6JPJtcYdL9AAFdl9XwOWpGNqxY?=
 =?us-ascii?Q?GF8CoxX4gp4jAENnOLo4kGPqQMEPWcPMzZ66m42Lohl+NXQakgLt2J5aFP+6?=
 =?us-ascii?Q?uawFTkdSkavh0UpS8e/7+50ZSqluFWvMAonaePpslnPW6vXSIIkb2bHYL2eB?=
 =?us-ascii?Q?pcxyd5fbLPcWYwksFmqB8XR7guOtClFvqGj4/pdqWvmGBx4VMwD/7Fr+Qmnf?=
 =?us-ascii?Q?X/OVUKriLsnyKan9ALl1XjY2TcT+FsLhuKvj9PxYGS1CWEvXQQA1iQq5VxsK?=
 =?us-ascii?Q?NLrU8GUI9Xkn+ADsFDoDn60jF6LsN5qYvTApTI2H43CeAy0QYrH6233Ib7vi?=
 =?us-ascii?Q?hCG9d/X6TxBHaul4KOkUAHruxzB+gNeQ3eiXk54ml2q4sazKNZaLubkxrJtZ?=
 =?us-ascii?Q?8qe4Yzqa4h1gZusnCbM2YxHOQkz1mcmg+184R70eKP2Ks+MD0fYXClf3xLjw?=
 =?us-ascii?Q?y4we5zzpB9hzF653d2PSS2QY6tOH8GJYtGCqpuJoo38MsZmVO8sauovjAjuG?=
 =?us-ascii?Q?TuP+oUCrBRN7MFq3qZQDsmXazLXN6sFs8CwLF9nc5Yv/je1bJERx6ip6yFfE?=
 =?us-ascii?Q?25PXZ23HNM4rDOXjKfTOrx2GLkIdB2WBd8qIpDTgaDButp3p1ByJrAQk3AUH?=
 =?us-ascii?Q?Xu/Ut5i6Z+xQZuxPHhOzUBM4IxSlHNkQEyK2gFAQNbytt41FqxXHZHi05wfH?=
 =?us-ascii?Q?R4/35FVFTQ8exIGFcc2Llfe7mNdCA6X/6NWoE+TWoZkm0HEs7y54okoqquq+?=
 =?us-ascii?Q?WT2KU+bUtA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: d48VbSlhSQvqk/ZPaMzgjIQ3//uv17bA49JaUpF1vfrnXgJ6F1BDbZeA81gQgMWi1vMvBEUxyOyGrfDpEdRlrosrThwZfsbbzjHPrlAAJIwLxPTETko2wul0cXNYrLgmmN49VMGU2uRjKEKiLiBLNuH8svgrCmCn/bUM+FZVxcxGBVSSPU74fcjxJma9cpR30zHAJIq0/WMp2RihsdjEodnQMmDQEiqht52yGiKDznwwW2W8p+1u/U2bBI6bmaiowcFwVHeabphWNqy8r3D582ziuUCp6lCTluJM9NGsQbb9tlXaYJayR6v5bOcGWYvgaX5H9IAIHYtcx2wz49n+9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bd0aa3-6f81-49d9-3ece-08deb242a1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 05:27:18.4415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRl1a0tVhAtP3M5cgFyDY59RVXrLxPACfsZ38xJOt62ck+4tcsmTI32O3UDZ++IKc9TcwJLWAD3FP5dSa9BKMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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

> Subject: [PATCH i-g-t v1 2/3] Revert "tests/kms_content_protection: Pass =
crtc
> parameter and use per-CRTC FBs"
>=20
> This reverts commit 8d7c2453de54032d1cd576a17d416ed0591ea0c4.
>=20
> cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
> cc: Fei Shao <fshao@chromium.org>
> cc: Manasi Navare <navaremanasi@google.com>
> cc: Suraj Kandpal <suraj.kandpal@intel.com>
> cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_content_protection.c | 74 ++++++++++++++--------------------
>  1 file changed, 31 insertions(+), 43 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index cddb0b6da..47ccf61d7 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -263,7 +263,7 @@ commit_display_and_wait_for_flip(enum
> igt_commit_style commit_style)
>  	}
>  }
>=20
> -static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
> +static void modeset_with_fb(igt_output_t *output,
>  			    enum igt_commit_style commit_style)  {
>  	igt_display_t *display =3D &data.display; @@ -273,19 +273,18 @@
> static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
>  	mode =3D igt_output_get_mode(output);
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
> -	igt_fb_set_size(&data.fbs[crtc->crtc_index].red, primary, mode-
> >hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(primary, &data.red);
> +	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
>=20
>  	igt_display_commit2(display, commit_style);
>=20
> -	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
> +	igt_plane_set_fb(primary, &data.green);
>=20
>  	/* Wait for Flip completion before starting the HDCP authentication */
>  	commit_display_and_wait_for_flip(commit_style);
>  }
>=20
> -static bool test_cp_enable(igt_output_t *output, igt_crtc_t *crtc,
> -			   enum igt_commit_style commit_style,
> +static bool test_cp_enable(igt_output_t *output, enum igt_commit_style
> +commit_style,
>  			   int content_type, bool type_change)  {
>  	igt_display_t *display =3D &data.display; @@ -308,7 +307,7 @@ static
> bool test_cp_enable(igt_output_t *output, igt_crtc_t *crtc,
>  	ret =3D wait_for_prop_value(output, CP_ENABLED,
>  				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  	if (ret) {
> -		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
> +		igt_plane_set_fb(primary, &data.green);
>  		igt_display_commit2(display, commit_style);
>  	}
>=20
> @@ -321,15 +320,13 @@ static void test_mst_cp_disable(igt_output_t
> *hdcp_mst_output[],  {
>  	igt_display_t *display =3D &data.display;
>  	igt_plane_t *primary;
> -	igt_crtc_t *crtc;
>  	bool ret;
>  	int count;
>  	u64 val;
>=20
>  	for (count =3D 0; count < valid_outputs; count++) {
> -		crtc =3D igt_output_get_driving_crtc(hdcp_mst_output[count]);
>  		primary =3D
> igt_output_get_plane_type(hdcp_mst_output[count],
> DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
> +		igt_plane_set_fb(primary, &data.red);
>  		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION,
>  					  CP_UNDESIRED);
>  	}
> @@ -347,8 +344,7 @@ static void test_mst_cp_disable(igt_output_t
> *hdcp_mst_output[],
>  	igt_assert_f(ret, "Content Protection not cleared on all MST
> outputs\n");  }
>=20
> -static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
> -			    enum igt_commit_style commit_style)
> +static void test_cp_disable(igt_output_t *output, enum igt_commit_style
> +commit_style)
>  {
>  	igt_display_t *display =3D &data.display;
>  	igt_plane_t *primary;
> @@ -362,7 +358,7 @@ static void test_cp_disable(igt_output_t *output,
> igt_crtc_t *crtc,
>  	 */
>  	igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION,
>  				  CP_UNDESIRED);
> -	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
> +	igt_plane_set_fb(primary, &data.red);
>  	igt_display_commit2(display, commit_style);
>=20
>  	/* Wait for HDCP to be disabled, before crtc off */ @@ -371,7 +367,7
> @@ static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
>  	igt_assert_f(ret, "Content Protection not cleared\n");  }
>=20
> -static void test_cp_enable_with_retry(igt_output_t *output, igt_crtc_t *=
crtc,
> +static void test_cp_enable_with_retry(igt_output_t *output,
>  				      enum igt_commit_style commit_style,
>  				      int retry, int content_type,
>  				      bool expect_failure,
> @@ -382,16 +378,16 @@ static void test_cp_enable_with_retry(igt_output_t
> *output, igt_crtc_t *crtc,
>=20
>  	do {
>  		if (!type_change || retry_orig !=3D retry)
> -			test_cp_disable(output, crtc, commit_style);
> +			test_cp_disable(output, commit_style);
>=20
> -		ret =3D test_cp_enable(output, crtc, commit_style,
> content_type, type_change);
> +		ret =3D test_cp_enable(output, commit_style, content_type,
> +type_change);
>=20
>  		if (!ret && --retry)
>  			igt_debug("Retry (%d/2) ...\n", 3 - retry);
>  	} while (retry && !ret);
>=20
>  	if (!ret)
> -		test_cp_disable(output, crtc, commit_style);
> +		test_cp_disable(output, commit_style);
>=20
>  	if (expect_failure)
>  		igt_assert_f(!ret,
> @@ -461,16 +457,16 @@ static void
> test_content_protection_on_output(igt_output_t *output,
>  	igt_display_t *display =3D &data.display;
>  	bool ret;
>=20
> -	test_cp_enable_with_retry(output, crtc, commit_style, 3,
> content_type, false,
> +	test_cp_enable_with_retry(output, commit_style, 3, content_type,
> +false,
>  				  false);
>=20
>  	if (data.cp_tests & CP_TYPE_CHANGE) {
>  		/* Type 1 -> Type 0 */
> -		test_cp_enable_with_retry(output, crtc, commit_style, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  HDCP_CONTENT_TYPE_0, false,
>  					  true);
>  		/* Type 0 -> Type 1 */
> -		test_cp_enable_with_retry(output, crtc, commit_style, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  content_type, false,
>  					  true);
>  	}
> @@ -480,14 +476,14 @@ static void
> test_content_protection_on_output(igt_output_t *output,
>  			     "mei_hdcp unload failed");
>=20
>  		/* Expected to fail */
> -		test_cp_enable_with_retry(output, crtc, commit_style, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  content_type, true, false);
>=20
>  		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>  			     "mei_hdcp load failed");
>=20
>  		/* Expected to pass */
> -		test_cp_enable_with_retry(output, crtc, commit_style, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  content_type, false, false);
>  	}
>=20
> @@ -506,7 +502,7 @@ static void
> test_content_protection_on_output(igt_output_t *output,
>  		ret =3D wait_for_prop_value(output, CP_ENABLED,
>=20
> KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  		if (!ret)
> -			test_cp_enable_with_retry(output, crtc,
> commit_style, 2,
> +			test_cp_enable_with_retry(output, commit_style, 2,
>  						  content_type, false,
>  						  false);
>  	}
> @@ -517,7 +513,7 @@ static void
> test_content_protection_on_output(igt_output_t *output,
>  		ret =3D wait_for_prop_value(output, CP_ENABLED,
>=20
> KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  		if (!ret)
> -			test_cp_enable_with_retry(output, crtc,
> commit_style, 2,
> +			test_cp_enable_with_retry(output, commit_style, 2,
>  						  content_type, false,
>  						  false);
>  	}
> @@ -587,24 +583,21 @@ static bool sink_hdcp2_capable(igt_output_t
> *output)
>  	return strstr(buf, "HDCP2.2");
>  }
>=20
> -static void prepare_modeset_on_mst_output(igt_output_t *output,
> igt_crtc_t *crtc, bool is_enabled)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, bool
> +is_enabled)
>  {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  	int width, height;
> -	struct igt_fb *fb;
>=20
>  	mode =3D igt_output_get_mode(output);
>=20
>  	width =3D mode->hdisplay;
>  	height =3D mode->vdisplay;
>=20
> -	fb =3D is_enabled ? &data.fbs[crtc->crtc_index].green : &data.fbs[crtc-
> >crtc_index].red;
> -
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(primary, fb);
> -	igt_fb_set_size(fb, primary, width, height);
> +	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> +	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width,
> +height);
>  	igt_plane_set_size(primary, width, height);  }
>=20
> @@ -676,11 +669,11 @@ static void reset_i915_force_hdcp14(igt_output_t
> *output)  }
>=20
>  static void
> -test_fini(igt_output_t *output, igt_crtc_t *crtc, enum igt_commit_style
> commit_style)
> +test_fini(igt_output_t *output, enum igt_commit_style commit_style)
>  {
>  	igt_plane_t *primary;
>=20
> -	test_cp_disable(output, crtc, commit_style);
> +	test_cp_disable(output, commit_style);
>  	primary =3D igt_output_get_plane_type(output,
>  					    DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> @@ -776,7 +769,7 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  			if (!intel_pipe_output_combo_valid(display))
>  				continue;
>=20
> -			modeset_with_fb(output, crtc, commit_style);
> +			modeset_with_fb(output, commit_style);
>  			if (data.is_force_hdcp14)
>  				set_i915_force_hdcp14(output);
>=20
> @@ -790,7 +783,7 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  			if (data.is_force_hdcp14)
>  				reset_i915_force_hdcp14(output);
>=20
> -			test_fini(output, crtc, commit_style);
> +			test_fini(output, commit_style);
>  			/*
>  			 * Testing a output with a pipe is enough for HDCP
>  			 * testing. No ROI in testing the connector with other
> @@ -883,11 +876,8 @@ test_mst_cp_enable_with_retry(igt_output_t
> *hdcp_mst_output[], int valid_outputs
>  		if (!ret || retries)
>  			igt_debug("Retry %d/3\n", 3 - retries);
>=20
> -		for (i =3D 0; i < valid_outputs; i++) {
> -			igt_crtc_t *crtc =3D
> igt_output_get_driving_crtc(hdcp_mst_output[i]);
> -
> -
> 	prepare_modeset_on_mst_output(hdcp_mst_output[i], crtc, ret);
> -		}
> +		for (i =3D 0; i < valid_outputs; i++)
> +
> 	prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
>=20
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  	} while (retries && !ret);
> @@ -929,7 +919,7 @@ test_content_protection_mst(int content_type)
>  		igt_assert_f(pipe_found, "No valid pipe found for %s\n",
> output->name);
>=20
>  		igt_output_set_crtc(output, crtc);
> -		prepare_modeset_on_mst_output(output, crtc, false);
> +		prepare_modeset_on_mst_output(output, false);
>  		dp_mst_outputs++;
>  		if (output_hdcp_capable(output, content_type))
>  			hdcp_mst_output[valid_outputs++] =3D output; @@ -
> 992,7 +982,6 @@ static void test_content_protection_cleanup(void)
>  {
>  	igt_display_t *display =3D &data.display;
>  	igt_output_t *output;
> -	igt_crtc_t *crtc;
>  	uint64_t val;
>=20
>  	for_each_connected_output(display, output) { @@ -1005,8 +994,7
> @@ static void test_content_protection_cleanup(void)
>  			continue;
>=20
>  		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> -		crtc =3D igt_output_get_driving_crtc(output);
> -		test_cp_disable(output, crtc, display->is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
> +		test_cp_disable(output, display->is_atomic ?
> COMMIT_ATOMIC :
> +COMMIT_LEGACY);
>  	}
>  }
>=20
> --
> 2.34.1

