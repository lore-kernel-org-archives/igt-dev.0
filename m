Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD944E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 08:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60B10E66F;
	Mon,  9 Dec 2024 08:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntcRTr12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9C110E66F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733734526; x=1765270526;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Vmnc9XHMW37gw3pMffDedcjCoSiAM3uXr5+TNhp5dgE=;
 b=ntcRTr12AlnV1i828gV4D63H6Uu4SXqcI+ZzuXYZi4fxC3aLxaClGrp6
 sAESVvBWooo3PaKYYb38yrvv5YoDsM6sEpa+fg/AAOsSoJW6ErJ51kyN0
 W3eMfPkXcjwkf4yATm6Yqb3BpFyX5mUq+wPtIzE4UzsksuIovufsu4pYc
 vlcP67AnTH1E/ImacZfG17+XfIMbn8+r4Ek8R9/DfaqWQeWRwqINc5JxE
 dirDvp4ILbXP20ApsNNapsrSd/M49JWD/DbMGEZQFwgT6dqIXKwMHdG+Y
 /DBvMjRvooBAmc+4rWw6IgT9nW39kZ696pS4GzjWc+bDK8UTYiwpQhpOj w==;
X-CSE-ConnectionGUID: ucZewD1KRFSJpKCa36QU5w==
X-CSE-MsgGUID: 1DJgcYHbTLKAYq4Aw99ABA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34157043"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="34157043"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:55:26 -0800
X-CSE-ConnectionGUID: 1qX5juGSQtW4p4on7Ihnkw==
X-CSE-MsgGUID: Py+pmg3UTCmat8KwFSwjUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="94884682"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 00:55:25 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 00:55:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 00:55:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 00:55:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6Svt3z46JIi0lHcybfmuau8rhjJtSOz3UK/QbUEVYOg9vF2VKjUO7+SgEnbY8jlPZJNO9q7X4J1CkOc6ViOiKKPszOCJ2QRII1k87o7RpvzKodojusRnfSiOy2zxjJ8jRHXlrXb2UiIB0tVJpdFc1TGaRkt9O8S7uEkoh3H8m5vgS+DgVe7dw4YNZmuPR57BYPwpDJQKkBYEBGrJwVOu0GYAQZSAnZlRETSMHdk4WTBmPpcQobz5giZQ4S0vzehhxksjm0z7zpVzWHILqkC5qZpBlA2ZMEEmEw5JhpM/abbE1TgBopVChr2Kxo3fN6UcLHff1xU1rMLB35JH6ZlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpIzEQlOuUqOVELxpQFbIg4zdT7Ag0HOsdRezGxN3/s=;
 b=K8PQHFv9iDKTFkBbrqworF4RBqa2Iuq4Z6XDUhCI3q1ptpigrGi1iBl90UTLnNgZdJ5ldAdlzUfop/brP9kRKQBud4U9/5pHT0VoCGxd9f2fIjJgW+EGRG1mT/gUQ89WXtIqbf8n/XLxPvb6o1Pa0qJk/jZ5IIEr2OQpAlDykr+kPvEaWBUSSV6ItojLaOwiHZJPxhD6+sg0FgFq+EB4T/9gN0M3L8v1PbXMOpMm0X6Lzro1cTSuAf6d+YA919jKyDzWCbdxm+LbK9QTHSbeC8SDmig7JZ3pK7NPefcG7rTKn3NAsg6pzpk5u7/Eft1QiVsbsjG/atcrc/II0D2HFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 08:55:21 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 08:55:21 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/lobf: Remove lobf supported check
Thread-Topic: [PATCH i-g-t] tests/intel/lobf: Remove lobf supported check
Thread-Index: AQHbQj0SpaDCd3PjOE6JWvPth1kUhbLdgENQ
Date: Mon, 9 Dec 2024 08:55:21 +0000
Message-ID: <DM4PR11MB63127568D25A84677343BA82903C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241129084006.3448688-1-animesh.manna@intel.com>
In-Reply-To: <20241129084006.3448688-1-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB7370:EE_
x-ms-office365-filtering-correlation-id: b0628f9e-fc01-4ec9-5d63-08dd182f36c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Y/xR2Ay2tOTUZ5TWK0Mxpbo3hgT1M8SaBQVYMQ7rPaX5HGoF1acmb1TD5JZ+?=
 =?us-ascii?Q?Y8heFT6QwmUvX1Kp3O3wfIW03ftNt4AReNZWnqkKjZeOVObQU6pEZCHvitFg?=
 =?us-ascii?Q?F9MQjftiYRf7q8XPt4gm46gySyeZ7C9wElewrGNWCty1eyw29ILVJA8FxMjQ?=
 =?us-ascii?Q?pGPwV6CYs57dPG5tOQ32EKilKaRXQt0F75Hl3jYB75QfMxnU24QU0Y7QNu2g?=
 =?us-ascii?Q?HJnwrECRxJTRUa4uk5zAgXhAc7vyjNsteyaHaTp/+PtJyToUMHR9drpEC8/z?=
 =?us-ascii?Q?vCINucmY7Pn1GVVe7C7ezuGvTkmjYkdPOwW8RaTO/Vefd1UeHY4WoW/XTamh?=
 =?us-ascii?Q?/w3eDMw4zaRqVeYTB37HL8QRRb0zx1TqEWcFSxZ4edsxMpvBh2ulHEvOa/kJ?=
 =?us-ascii?Q?gnLEPtEsLO/2yFqWYdebUCsCT10X6K7JF4+E80+gcMrWEO4zHKoBrmpQJMnt?=
 =?us-ascii?Q?K5XtplPByN/sSvfIhV+BSpW/SzLsKkSsF82lAnVpeEzWru1weq7jCqVtMpHA?=
 =?us-ascii?Q?C4t/lIPTSDxTbsHFffat8dlciGh3kbU7D7RXv5K3PF49XtRTeGpElJMz9ZYj?=
 =?us-ascii?Q?cKVBFq2OdX63Pv6Qo/eadhJTxQ2bHRe1ZHqvSzmD6oJ+cMbOz/aRXvOMx3Cx?=
 =?us-ascii?Q?zesjXp54wZ/cDh0Px7zVL0Y7GiCKPNuWBqcNh3SNg2tzRdcG97nfdS9GKx6K?=
 =?us-ascii?Q?OwoNHu0OPm9l4NgqlQxLKWAw2P6Io7p2Hz06b2JCVr9VTxhj2V5uUgWFfeO2?=
 =?us-ascii?Q?11gGsdU4gMVc/4J38OPOp74v6S1mXCsXDOkccQGdqGjTQ+FNUvSPZ/4pB6tn?=
 =?us-ascii?Q?ZaxENBOWGAD+As/0gD8pi5gy2uSHkxt72iffhMcdxHfFhihCQyYIGluWyP03?=
 =?us-ascii?Q?TvZvymSrmA58dbxXwpwiKqQRhUR1wArBBpGDoRIt2r7u1XonufWc9miX1lZn?=
 =?us-ascii?Q?khIMr0bzkwiaOCDqMYDGuLn5d+4S6GGhOltOzXYOa9QMiGmHpFQ3usy8F7TI?=
 =?us-ascii?Q?SWPp3m0DK7Zke6o1JzyeCLlJckeV3vgnHki2Iuv/KToVgwQOYTp39t3Uef5u?=
 =?us-ascii?Q?g7AOwuB0zOdgaXiu6XZLfUEwsRmdSJNHrqq+7gXSiIssirMmOF7m/lm8KKh9?=
 =?us-ascii?Q?wkzjIxn4bVYzIwbg6MZsLIrj98MisJ19Q+xDSFlCs4ad3lLBOD5gITT46jYR?=
 =?us-ascii?Q?sGcfIw23T0MBCptuUyRZ0BlMyZyMLFURzqtnTj6xZ9wmFFsdxxB8PJbEYk81?=
 =?us-ascii?Q?CfM9BLoAQXK+poj4fTWulHLIcSa+9SFXTn//9dKBm3ZpnAHnaWlZsEkH8o85?=
 =?us-ascii?Q?ZY0bVhIcTe3YH5kjdw3Npz4fVVxGgbK722pmW5MAr41GBWelS8OM3FqdTp+S?=
 =?us-ascii?Q?v8g+f3CknaH7fq3V3rNel6V3a/0hZAG5E7ZLt03j7sP+OJt4lA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mFK1P8CQCViGuoXjEUeKTHUOOeSvMZR5VWTHVbIyd2MTOnzuTISg1aMO8glc?=
 =?us-ascii?Q?hpFGRaYPyXYJeDYPHbdC3GrYTQzQRmJHIz7v/Ru67KOSND8lbcGVY44Ct6X4?=
 =?us-ascii?Q?RvY7GhcQ/mqZwTTza2XxRaVy+G6Z8ERAjQi05LSEJqTAS9fpRQWWI8x3NFMs?=
 =?us-ascii?Q?8PviGuDyO5DxJKewl85s4d8vTuSYASCR5bxCNNpIn4qQLoZd8BZ7FI9kQtFW?=
 =?us-ascii?Q?ZEkMDyYBPrJyd8kcK0wGVPWIOWgQuYn39JMN/cHCjOG5wOMquJ/PGYmIfnLQ?=
 =?us-ascii?Q?IsywvG1p1APL9l2Dn5VRYU+zZ+oHpPBy2e8bD0/0D54Q+vd6SvV5XIHUiuPm?=
 =?us-ascii?Q?ZdysTOGDHOnErPKO+b3w1uftF8t8AGqzquUc32hcI4mTEY9AzJElPApoMeAf?=
 =?us-ascii?Q?M1GNvYOD6aCgTzAAY/S4t7pBqoDD0VgqgO/8b7bg37q1xzKoBCJnAWhaHprF?=
 =?us-ascii?Q?ARyep7DXd6mfVWKq7Eh6TLnPBZoD4z1gtKlpTkLGO1iLFF/Bl+krVsDDRoPK?=
 =?us-ascii?Q?6csFz2ml+XEYE3+L6Lm3sxHvRk2LFO62EchODlMhQFXG/qn9D2+LgFD0pJqW?=
 =?us-ascii?Q?0iI8PCKoS5w6YspiFaxtKWrXKa4X15i/BTvLJJKzXDM7fnJhh6kppxjjNq2j?=
 =?us-ascii?Q?nYvwaTsga6jUttwL9iemWDw9C0IaVsjOPLq7g1JyyFSIQ0fA/OLfMdQguG68?=
 =?us-ascii?Q?rfDCEUtj2I/573YA7BZBZII9g/tGpXr/br11CVBHMWLrJ8kCWbXX6pmHRC0m?=
 =?us-ascii?Q?xrSL15t8j6mAKi+QTeRULHUVlbT4W0AdX0K4TvsHigDSdFFhAyk4XV2cScuC?=
 =?us-ascii?Q?jQ2GxJCTb9WWyS7IBDnYTFhXJyRj/n9CX/DYo7/xz8lBqTldf2HYFyVchesP?=
 =?us-ascii?Q?/AevWbwNrWLuuEdvvgyEQU/+qt3q9xoiKOZeLpfoc0HQdCHZJTiiQLopp1aM?=
 =?us-ascii?Q?nEPR5Lp3o6KyJ/5nMzTqq1nAnr5UivCXNqbk+gjpw4R+IVOL2Iuk5Bj0B1QP?=
 =?us-ascii?Q?Uib88HdPNPsypksoUmUHoxaPs4zKFK1t9vV5FTBBPPC/MuRsACMr1LhQznIT?=
 =?us-ascii?Q?4q1zSCwWCVUXJJ1RKuk9GtIS9FSiC0hOzk+lPyZRkSaneYzE/5P+Ol0xPLP+?=
 =?us-ascii?Q?iMonuVPyoVyynAq18C70HoLwPCyjh4y1aT7ic8LAjoN9BwytoFSdp51jOp0d?=
 =?us-ascii?Q?x4g0v4XiYRtrXSDLUUes/Ib0m4qMRGfugFTFxQCpKcJdudsFqroq1+cn60FN?=
 =?us-ascii?Q?KPz/hI889zoVhWdZVLdSZkqUZTs+SZMfHDVF/Io+nlgjvh8JCg4bUTK8a+ud?=
 =?us-ascii?Q?czMJDv1+9Swd6A5Jq7N0LgNiRRWW9T0ryQQ4DLoLjBw0WArEcRLalMDTBdHT?=
 =?us-ascii?Q?XxtHRCclhax8a4Qfu0XPPSNgvEoyABunPfMjt8ymkFvb7GMoMe5X61nszkIz?=
 =?us-ascii?Q?y90kwtrc++UA4/TlseQuD9xmNUTsuravQAnagJXdO6r9HnUTuM43k5wDGIm2?=
 =?us-ascii?Q?etItOjiP/r8OIxa8X0zGGXeSjyfDAdbscpcN1iPQbh+BmhMHiRVf61hpLLsH?=
 =?us-ascii?Q?jorQMpEtHfBFfcEHrFk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0628f9e-fc01-4ec9-5d63-08dd182f36c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 08:55:21.7883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQBplQ/9djz0A+M1WV8K1doxM/D7PqTXJa92RqdideJdUJgRdbOCoZyFklwbT+7SDDiIfpAPFgSsMrMVFv7p9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Manna, Animesh <animesh.manna@intel.com>
> Sent: Friday, November 29, 2024 2:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Manna, Animesh <animesh.manna@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/intel/lobf: Remove lobf supported check
>=20
> From kernel driver debugfs support is not present so remove the lobf supp=
orted
> check from igt.
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  tests/kms_vrr.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index f0564bb6a..e7d2ff1db=
 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -890,11 +890,6 @@ static bool output_constraint(data_t *data, igt_outp=
ut_t
> *output, uint32_t flags
>  		if (psr_sink_support(data->drm_fd, data->debugfs_fd,
> PSR_MODE_1, NULL) ||
>  		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> NULL))
>  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> -
> -		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
> -			igt_info("%s: LOBF not supported.\n",
> igt_output_name(output));
> -			return false;
> -		}
>  	}
>=20
>  	/* Reset output */
> --
> 2.29.0

