Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD4CD98E4
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 09:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9010EF0B;
	Wed, 17 Jun 2026 09:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePZLOY0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3DD10EF0E
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781688522; x=1813224522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nfPuuRDr9ZKKzWtSAXgqvuWEVj6IERfP4aVDYshWmyQ=;
 b=ePZLOY0UmRwmXg53HNzRMBGCKN3lV4jVgiJVPhmHgUpN6n7NqTVBIpnL
 vuPqnnJsNsWVwXjDyHnHad3st/oTd/Mht0n3Lk8wohxI2WD+7ffwASBjv
 QWhZTpcn6WFapbWHxxx87JWhb3ArvIFfVmnQ6zMC4VcDeqgYnJeKieXkB
 RsRxxgji3nTx+LPyBIrm2R6BZCQbKGTOCe9CPAmtidg+hYmFUjoi5c90e
 IDR/ugcCZ9d2mbDX8S2BnJ423p9+aQsyc0YAP/yHA3sum8L4ADOdiRpLn
 f/saawPDhFKbbPNj51j4gE8etRp1KBlJXxsxtVPcVMzYw06QhdTKwffqR w==;
X-CSE-ConnectionGUID: IZUXcVAcTvK+0tN9lKN1lw==
X-CSE-MsgGUID: KkncBkgoTk2rcKs5Rc4SMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93590313"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93590313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:28:42 -0700
X-CSE-ConnectionGUID: JP5mE8EmTciTrujRFgWWiQ==
X-CSE-MsgGUID: snga8l4MQ+qiPkHhyoyqIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="252320343"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:28:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:28:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 02:28:41 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3/0URDB73HQpe3aaMio6PhPfzyb9GDjqc2w1+5eAFqrdhftinSbx+f7q0Q+fJOk8kS8KTv2Cvs2YuqnFtLozFteFIUyCULFBsSMyBVPflM4I36wKicpnl7OQ6BTBESQW5Xw8TPM8yAoeQ4U0j/owXr1jxe5OAv9HOsOKkFiPM1L2eJbq5Q/zMz2N1mDVxy0pmEk/djQiBhNYP84l1VVqfiZadEENBDLSH59q3+8PUuD2ReLeIwlb93UNM/Gv6e9gTJyXpq1mFnzKJQPvd1Qt1NjzHuDrtzGV0PGmk1MsiOfp9Lebonq73oCYpnIGoMGjdgT2BIVBCCjBki4I8MPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzOwRUYN8it5ydOL9LcQHhVbK6K68jfjLPtUEG+cT0o=;
 b=RWFPzljWGeDB+y6SLMvWNa/Yzi3Zxb5Ja5UP4nj3kqkLbYJeVgpwxc13g98qFDgxujP2LPfAJUl971yJ0ESOzUmN2+Nkw//8U7XE00JeCdoWPRKKFMIAaQ/EfNy4N+H/TB76YHYRk3GcevIscc3DIP47PpMOW9XocHw1BbtvXPp7kOLR0Mlk6SfYfosjG84n5UAPRPLZzWdcrQ+9Sglg/BGyeKa7z8omhp5Wvb5CsBeKEi/y0Um4Mi9qMc76YLb00+5McVXdRipxukT/K4km8gtjPTi1nHdIwcNqBc9XX+HZe+lKkogHrxfjwJ/CTduiora8lnXPEBILk+huLOyU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Wed, 17 Jun
 2026 09:28:38 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 09:28:38 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Test video playback across
 suspend/resume cycle
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_rpm: Test video playback across
 suspend/resume cycle
Thread-Index: AQHc/dTJu/q5q5GoPEqG729sg3zmhLZCd7SQ
Date: Wed, 17 Jun 2026 09:28:38 +0000
Message-ID: <PH7PR11MB60532C39A6C1329CAAF09D84E7E42@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260616210109.21172-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260616210109.21172-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA2PR11MB5081:EE_
x-ms-office365-filtering-correlation-id: c73a80f8-9dde-461e-da4b-08decc52d017
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|38070700021|3023799007|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info: koyiRj0utCPIxk4a1kKtzQaP/A7DGhQGmcR5rrvHwiPRRcNIzIlXtWFUWeT+js4SVtc9Dj+xq0B4tFssvCnsuPo6HJJ7mvQTDUvTp0dWf2QLdr8H+9PHng1Z/nxWU1VTW1R8GxCtnGEq4qCf2jbhXyn60Blzw+38kSiqCbBFt4L1y7k6BnFgmoPGqlTpaGkRrdMZdLlYNTPzBFPbsBVaAqt0VQNUzq8q5cW9OFq1elnJGT4802Vt5GoRVxwR8PBAQUuqlH5/Mwo6EzxM2FD3zxaCE5csrk/30VgQqi6xllBm8yCk7JQQJw3cb0c5OxnrKX+BMcVkxtECC1CTC9goxF+Lz+6pcCiMgmF0sNJIL4W9hir5Reh4TWS8GZcGlnhXwYYnA8p5dtppFrTqIeO9noiDA3tjbXn8/7xnVCYGAg6giEnadMdVF3HKBMTHARLKCl4B4D5qtG/Zwpaj1D6QVNn0owY9uoQRRKJ9jwaxF/R+VAgLNJoJT6V7SSUSeGTxzhSaLyih/+s13nNU8nIcWh8F7Wbo6vCHwLVJ9tZkChxXZu07ivjNMw4aEMjXZ2Y+JrAAe5MiL1bUMhZ+C64RQEYNJNMyF0c6L6rmOdnDlMl1il0zsadQMLixiC1D6X5VsRbZhuFtWHsu0eeF92i8JbPptN2ncyUsVfRUSDd2JCzEmXdpGmYcSUVbP23lhC9wxynAfibfpGOQntPG9TMj0ufbV4+x1lKql/fF3uWhzdeFqT1vNIcXLRbhVCiH6hPY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(38070700021)(3023799007)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xqgzbgnhRETsWT9gDSjtJYjBgDx5rx5MHnJopMFvGXGoBhiHI4GAdjtxx9M7?=
 =?us-ascii?Q?olEi0VyrJozkyG7dCU0N7u7h+JLAT0dzGBlRmhczBsfTEEJc37i6SwgC3/s5?=
 =?us-ascii?Q?/SNzrimWlwPdPPiQoxX9l7gjQCmt3STOnJiO08XNC17lQHmRNaxrPl6E7hO7?=
 =?us-ascii?Q?F+JQa8zbtpM0bVOQXXteBuodc8OBgSfC1e91FgnBwPDGovHamdPlWsHU2auK?=
 =?us-ascii?Q?7OdWnCAj1xlEKqTTWMkSGJzl7NYQ2tkMBKCuFGZoCR9ArKdrjHTxMCquzlSr?=
 =?us-ascii?Q?Kgu0xspWJpW7+oRLVSmHkWQ4JKieRnwH6941tZ5gqGOPK+jYOXNd7h693m76?=
 =?us-ascii?Q?G/w3biDiM/E7ewpJ+dr230D95MoC4FawkixXwhtz1QBa8dG9GItL5tgFnv6A?=
 =?us-ascii?Q?R6bS6jigWptS8ZTCPyjxw60mUr472PKrizg9hY3eabx4kcb65M/3bFDPacpQ?=
 =?us-ascii?Q?3PkbLklAmLpSg2eEPbqdLDJWWT8R+3Q4L2EU7m+yNIcjhRN6/MmXthr2Myb9?=
 =?us-ascii?Q?1HdLIQt51rrnqTwLpENXoxccQOBJbm5AMmC7YFwOidMl0wr9DlSqNFoO50v7?=
 =?us-ascii?Q?NcPvUksIJK+eexQF2LKI5i1aksbiqG6haKkHUBw2mkZLDSjim81WXhLwtI1t?=
 =?us-ascii?Q?H8iCTE9pDNl2Cy98W9BaTHLwoWc3fiNMa0IcxA3/FymOGGQGn+2C51/cjVYG?=
 =?us-ascii?Q?koiiMt6ZCfHP51yl8pysiXYUbLOjWRiuWAVpxbr5vHjMJlRu4pH0MuuBfkke?=
 =?us-ascii?Q?oNX1bSlJpamixJsiAEKpKdp3U5lFXrJNQDlsFmxFTQWa3z7jQqSAcJiGz+DZ?=
 =?us-ascii?Q?KJFGoY+aC6CR1t+moawbLZ+bT7ip6mlBZgiGQSDGUIFgZF1PFNIUEHL9BBqv?=
 =?us-ascii?Q?5MT+QeKuir7CSuuC2KFUhgnpbcKp8ZoWJWsw4DL0COYl54xnGW5GO7xb/6b+?=
 =?us-ascii?Q?H0+iza5zu4gCbIHbG61KFUJ+DR3aq1hbJDL1fhuFHCSC1IX+/I37StdQW1hN?=
 =?us-ascii?Q?OliqLaU1mLA5JKtXrQGw0HCN+QvX490gKTxqj77fCmJj8820kw8KoIo4ILD0?=
 =?us-ascii?Q?/TV6VZ3oK8uni7wwK/uctcHJzI99zEDafbirVIi/QnBnE5ijKJHPrpeV6CdZ?=
 =?us-ascii?Q?TuSZqB5lY9FgotzqeBYfnOF1IQ5Ry7rewwwuMUwie0Lq/n+aZqCdzbYwlCn4?=
 =?us-ascii?Q?/ySoyJZaqTGOtMT8zfaAPd2xno5U9/wcbc6gC2B8VgggwgZlH/FIpiF3Ed1y?=
 =?us-ascii?Q?ah18VCjWukWkAEVj2LA1/th//c1ulgbjULBiIZzBL8U/kPTCYlZFCYWXNNjg?=
 =?us-ascii?Q?SBHZuGK8ARMtfPkzA3veH/geCI31ATdUsFCePvAR/6OF9ZWKrHoKcDhnKaDK?=
 =?us-ascii?Q?MX4RFiGhjHGe7t2FqcEnlGTuJkUdAITQ+GM2eQvDqmHy2+HtUVFMSdw704SF?=
 =?us-ascii?Q?Lp0xgSFFmRZocfQ1BNtQY2TaVOOTJJZ8PkhRYfaW59+pTotHakjcwNO8DJ2c?=
 =?us-ascii?Q?eDn5YoucorefwekQKIzhkhw7dnCRCrL+hWN23MPJSt+Oxsy4gxM+Gxg3lah2?=
 =?us-ascii?Q?MP2CWbTRbQqCkLhqtGFvsWT8Xc01r+3uo2khTjkh9wdYOPFhZgC/PZJ1Hfyy?=
 =?us-ascii?Q?q9sW6jvbAkmoLP5wR4U8XeETs9Wi2IOCor10BHFIjg8QqVm7e9rdgAJiuFdM?=
 =?us-ascii?Q?EmC2X/PGdbtsRUI0DnOpeSHf/1e9BMlQ3HKN5hPTJvQVF8LBqlh5b8GXlndn?=
 =?us-ascii?Q?m8mwjbuELw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GMyR39evS2lW+j9zJmivICa6nyPsipJwy5eEVuAer3KQSBfcugH0B9L4S3D4xUHDuXZm70gwQGH9y9YLW5OvAmegu2zMoz1qZ9ARJImOoBI7o1iJI1192buZ//efvSjhIxKPvcpoXz7J2oQ89SYSsPQI+0FMKtSMVjWEZmF7MwrPpsWtCDTBDrfxUswy4Ad1ajeytvJ9PUYhv0G0b9REwJ9L+KNL8n4T9T6jUwdqeitce+vd5bwN224Sh0ukYZnxxqhWUo5L0g1xgdr1V6JyyYxnoJxYt4wLhV1UPH9PKpQJ5uaHVtoq5ubQTKbOhwZy7K/bdjUjhX/vkyuyyEXCwQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73a80f8-9dde-461e-da4b-08decc52d017
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 09:28:38.3520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtFcDGO2J1plF2A+a1+5ZVBxqVMVJ/aD95iHOdw/qXSTax2pEEx+i1s6yV4BtsEE60T2sRvWaR4H34Y/GtXI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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

Hi Thasleem,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Wednesday, June 17, 2026 2:31 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Test video playback across
> suspend/resume cycle
>=20
> This test simulate video playback using multiple-buffer page-flip rotatio=
n,
> suspend to idle (S0ix/FREEZE), resume, and verify that the display pipeli=
ne
> and frame flipping are correctly restored.
>=20

What exact scenario is this subtest targeting: suspend during active playba=
ck, or playback before/after suspend?
Currently, suspend is triggered only after the playback loop fully complete=
d, so it happens when page flipping is=20
no longer active, rather than while playback is running.

If the intent is suspend during playback, suspend should be triggered while=
 page flipping is still active.

Regards,
Pranay

> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 179
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> 60d0b2792..a4015516b 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -132,6 +132,11 @@
>   * SUBTEST: system-suspend-idle
>   * Description: Validate suspend-to-idle (S0ix) functionality.
>   *
> + * SUBTEST: system_suspend_idle_vpb_simulation
> + * Description: Simulate video playback using multiple-buffer page-flip
> rotation,
> + *              suspend to idle (S0ix/FREEZE), resume, and verify that t=
he
> + *              display pipeline and frame flipping are correctly restor=
ed.
> + *
>   * SUBTEST: package-g7
>   * Description: Validate the package-g7 residency.
>   */
> @@ -176,6 +181,10 @@ static const struct {
>  	{3840, 2160, 144, "4K@144"},
>  };
>=20
> +typedef struct {
> +	double r, g, b;
> +} color_t;
> +
>  /* Wait flags */
>  #define DONT_WAIT	0
>  #define WAIT_STATUS	1
> @@ -198,6 +207,7 @@ struct mode_set_data {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  	struct igt_fb fb_white;
> +	struct igt_fb fb_frame[3];
>  	uint32_t devid;
>  	int fw_fd;
>  };
> @@ -1720,6 +1730,172 @@ static void test_package_g7(void)
>  	cleanup();
>  }
>=20
> +static void paint_rectangles(drmModeModeInfo *mode,
> +			     color_t *colors,
> +			     igt_fb_t *fb)
> +{
> +	cairo_t *cr =3D igt_get_cairo_ctx(drm_fd, fb);
> +	int i, l =3D mode->hdisplay / 3;
> +	int rows_remaining =3D mode->hdisplay % 3;
> +
> +	/* Paint 3 rectangles. */
> +	for (i =3D 0; i < 3; i++) {
> +		igt_paint_color(cr, i * l, 0, l, mode->vdisplay,
> +				colors[i].r, colors[i].g, colors[i].b);
> +	}
> +
> +	if (rows_remaining > 0)
> +		igt_paint_color(cr, i * l, 0, rows_remaining, mode->vdisplay,
> +				colors[i - 1].r, colors[i - 1].g,
> +				colors[i - 1].b);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void create_color_fb(struct mode_set_data *data,
> +			    igt_fb_t *fb,
> +			    color_t *fb_color)
> +{
> +	int fb_id;
> +
> +	fb_id =3D igt_create_fb(drm_fd,
> +			      data->mode->hdisplay,
> +			      data->mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      fb);
> +	igt_assert(fb_id);
> +	paint_rectangles(data->mode, fb_color, fb); }
> +
> +static void setup_videoplayback(struct mode_set_data *data) {
> +	color_t red_green_blue[] =3D {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	color_t red_green_red[] =3D {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 1.0, 0.0, 0.0 },
> +	};
> +	color_t blue_red_green[] =3D {
> +		{ 0.0, 0.0, 1.0 },
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +	};
> +
> +	create_color_fb(data, &data->fb_frame[0], red_green_blue);
> +	create_color_fb(data, &data->fb_frame[1], red_green_red);
> +	create_color_fb(data, &data->fb_frame[2], blue_red_green); }
> +
> +static void cleanup_videoplayback(struct mode_set_data *data) {
> +	int i;
> +
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit(&data->display);
> +
> +	for (i =3D 0; i < 3; i++) {
> +		if (data->fb_frame[i].fb_id)
> +			igt_remove_fb(drm_fd, &data->fb_frame[i]);
> +	}
> +}
> +
> +static void run_videoplayback_loop(struct mode_set_data *data) {
> +	int delay;
> +	int frame =3D 0;
> +	time_t secs =3D 6;
> +	time_t start =3D time(NULL);
> +
> +	igt_require(data->primary);
> +	igt_require(data->mode);
> +
> +	/* One frame period in microseconds convention */
> +	delay =3D (1000 * 1000) / data->mode->vrefresh;
> +
> +	while (time(NULL) - start < secs) {
> +		igt_plane_set_fb(data->primary, &data->fb_frame[frame %
> 3]);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +		frame++;
> +	}
> +}
> +
> +static void configure_output(struct mode_set_data *data) {
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output;
> +	bool found =3D false;
> +	igt_crtc_t *crtc;
> +
> +	/* If output is already configured, use it */
> +	if (data->output && data->mode && data->primary)
> +		return;
> +
> +	for_each_crtc_with_valid_output(display, crtc, output) {
> +		drmModeConnectorPtr c =3D output->config.connector;
> +
> +		if (c->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> +			igt_output_set_crtc(output, crtc);
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
> +
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	/* Fallback to any connected output */
> +	if (!found) {
> +		for_each_crtc_with_valid_output(display, crtc, output) {
> +			igt_output_set_crtc(output, crtc);
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
> +
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (found) {
> +		data->output =3D output;
> +		data->mode =3D igt_output_get_mode(output);
> +		data->primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +	}
> +}
> +
> +static void system_suspend_idle_vpb_simulation(int suspend_state,
> +					       int suspend_test)
> +{
> +	igt_require_f(default_mode_params,
> +		      "No connected output available for
> +video-playback-suspend-idle\n");
> +
> +	configure_output(&ms_data);
> +	setup_output_fb();
> +
> +	/* Create video playback framebuffers */
> +	setup_videoplayback(&ms_data);
> +
> +	/* Pre-suspend video playback simulation */
> +	igt_info("Running pre-suspend video playback...\n");
> +	run_videoplayback_loop(&ms_data);
> +
> +	/* Suspend/resume cycle */
> +	igt_info("Performing suspend/resume cycle...\n");
> +	igt_system_suspend_autoresume(suspend_state, suspend_test);
> +
> +	/* Post-resume video playback simulation */
> +	igt_info("Running post-resume video playback...\n");
> +	run_videoplayback_loop(&ms_data);
> +
> +	cleanup_videoplayback(&ms_data);
> +}
> +
>  int rounds =3D 10;
>  bool stay =3D false;
>=20
> @@ -1835,6 +2011,9 @@ int igt_main_args("", long_options, help_str,
> opt_handler, NULL)
>  	igt_subtest("system-suspend-idle")
>  		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
>  					       SUSPEND_TEST_NONE);
> +	igt_subtest("system_suspend_idle_vpb_simulation")
> +
> system_suspend_idle_vpb_simulation(SUSPEND_STATE_FREEZE,
> +						    SUSPEND_TEST_NONE);
>=20
>  	/* power-wake reference tests */
>  	igt_subtest("pm-tiling") {
> --
> 2.43.0

