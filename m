Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A57CF54ACF
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 15:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3C210E716;
	Tue, 24 Mar 2026 15:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0CHHqHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E325B10E6ED
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774365562; x=1805901562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E//orCTbty3FpS24hh7vPYAn42I5tRDbjccDQI6lJf0=;
 b=b0CHHqHFwWV4X9NZko5vMIel/+a49l+sRymZjxCLJV67lXRfjNlUAcXw
 7ssoEVu6mLgTnKlf1Z2d5XKNMGuJhK1b6aCYNqHlD9s0uVpxxIL5fYuE6
 9n1A5BX3/2944qNGAzeeoMsMRa30E+9XtbSZ7FJjwKDcidyClkZYfKvt9
 x8yNp4+kgR2u+l3DqvI4XxKyXYOdfl9VOSOm4+p2xGlrIXUXQ7DkdqYtF
 CUkwder97ZiH/E7dv+sBrkRCKq3qysbiSZQ3RvQ+Ak3c71AO/gJF+MdRb
 Sk6Zfwp1CD2baSy4DnlLv5+fJAX8IRwgs3ioaCARbhyIncE84iPtweJYr g==;
X-CSE-ConnectionGUID: nX6sDU/iRmWNnYaK6LQRgw==
X-CSE-MsgGUID: oKgbGkngSL6xHJgNgf7nIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75268883"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75268883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:19:22 -0700
X-CSE-ConnectionGUID: 71SMh2FSQQ6bhitySLSXTA==
X-CSE-MsgGUID: +OLkNCjsTDiMPVIz+w4Cvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="247979885"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:19:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 08:19:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 08:19:20 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 08:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+OU5veGT3Ld48Yi3NYfmk/uhZurd8bYCrLl8qlvOH3QeepsTdmXnvH4quKUmiJJVnDn6/fumw4+zKldl4YOY+/WwadNeMpAIA0r32+qyDC1i5mOa/qOCAbDiPiw1NjbQnB0lRUBIzzsZtASM8qWA+MOivTNSxTR5xnnHzZvga9zJstCznzg26p9KGQOCMoxdBlFoU49rpcAsU7pG4yvmPKcdaemjZ6GPqNEJmfF9gA//+Uu2fDsaMULSk6UvcJggt4vJEXkYyXGl9B+bcGByp8W0JvUkPQGvUnqKZOdQPsod0Ftoh/EEj8T5i/4BprXyGkCALvdPYimvy2vZK00oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bmLQQW15+rTWY4IKDRktYjmdY388fZBv8/iRu3+Z5A=;
 b=QzlrE7zl3jlAT+iHvZRBaK/5NQcQZatqPIuozXrXzrrAov8+qJQ5qfOtM8WN/m2NEgrBOIDMN+hyprFXgq9ydg9LbZAiOafyBXSbZV5UUPf4ZjYwFafHM8QPVQfCleDm40JutDyk/eey6ImJyPGLrTbj9o49oOOt9sZHqxCCtjACHHE/aEhBIswXa6+jJ1KtvWv8s3ofstB8sOxhS03uzqwhuBuwuA1zPpGcQNjC3Jzca7EVCqjhnXs0AWfHLSkRMuns8VDcO0QyHvUv/BfTHmA7oZJFYKIx0WsRg9a+F7zNGHKod++EYjR5bW/0XZ+KxTMgBrmjLC4YJBPMYS8pfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 15:19:12 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 15:19:12 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix stale mode
 pointer in joiner bypass
Thread-Topic: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix stale mode
 pointer in joiner bypass
Thread-Index: AQHcus1/j2OVYfuj/EWwKEXABQxQ1LW9zU4Q
Date: Tue, 24 Mar 2026 15:19:12 +0000
Message-ID: <IA1PR11MB64670504FC76F9BB55764C0DE348A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260323141101.2657652-1-pranay.samala@intel.com>
In-Reply-To: <20260323141101.2657652-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA1PR11MB8490:EE_
x-ms-office365-filtering-correlation-id: 032fc28e-7020-4c5e-9095-08de89b8b45f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099003|7053199007;
x-microsoft-antispam-message-info: XzbQwmapzwzQ4Cnyj1TkEIA7irrJulSZSDpYjdn+Kz7ZP5fspbWRO4cw0sFufpPhFI+Moi2UZV7YETSzg3Zc44lg6LAZAr37tXpR2m5ZKtAEv84o9dp8gaAuqCeOtO4XlJl9b9PHUaBYRv6dqqyq/E1N/toIEAQPafnkRI1UFAvIrXxuhBGbegYvOOE2qhujikB9hvQ/WK1GTW6Y+KG4l5EPTWH3crYYfqPi0ONPi3hnAQpGjVrGtd02l5/qlT4mlDtqWMclixNrmNY14KiuJ1vOQrApjR/YOXZRojSjBVSfyd5rnuRvd28rzWPkz3+6Fi1ciQptS8sdiB1Xc4RL3sZDiN1U3DSoreRgACdzmqomJj6HSq726r//v/Qc6X45uKI2QGUEzzUfV0P+MC/taRQxm30xW5y30z2pPfQaqIbNtrLYOi8YksFRRFtQzABK/oPrOyzO8a9hTvjSdn65/TC0bOBthE4cbJPluyk8z7ZIZrJLrUYFgeEVCYMgw+RqQrghUxuH3ocdIzbmOqTGeJr2tDMz9zymC/4MIGwD47l0ALlq/pLL7cqI7au2m57/V9zT/RqrKo5zQnHQ/nxX3Wf6gRwfNHdhczI1taFpgV9dmNwz1e44+49tj6wsdzbUGb03uH1NmfXYz0Oe0EBw5+jk3vjI71bbd+vQhnXKiADQAswLBreOsb2+c76IJ1NT7JAdlpUC3C4Nk03UMij03J6F5rlRGzZEpTT7g9xfNZlDf16f58VKD2eJEZqaFNVm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dvuDqK37IO/JJ5tbotpTmiafWkHPFRnnQcdcB2BhePGjX/o/S8FGkxsgfZs0?=
 =?us-ascii?Q?iHrVTrBqZDeaho6vdINiZQ0D5lNKgr/GswHJsAO44D/b3cqrCIeBtB5QO2MA?=
 =?us-ascii?Q?6u7iRuqogpPo8I+9iR7josly95OwqbnXOCRW7o4sXa08/tlk8zbnp+/STymd?=
 =?us-ascii?Q?wLQBnJmlOp0AuD6bGYE6z63usPxotymTWbFteejxADTbUUj5uoGlMb2WDKg6?=
 =?us-ascii?Q?Mt0UtvbsymZENV3lNEPn2sXVINOsAMo70S7Rx9a5nDNk+Jn8EUSQHiZbfPch?=
 =?us-ascii?Q?9dB5lneyyBI1UgiJ8b1Zb//Id1Oz7XHsoByrTIRZGtjX0gSlM/CqfRP1A3HU?=
 =?us-ascii?Q?6yklPQGV++da1MaMRuXssWtZjMTsVejEAGnCwYpJibHhSYdUQD/ZR2R3SKng?=
 =?us-ascii?Q?+lnPnqUFpPat0rnROy5KsyynxDVSRhXqZRP7avo+33za6amRkJePU0qIcI49?=
 =?us-ascii?Q?xHRdrubdyvjZy4H/MOqWOg0qOq/t5fx4OASNeNPzt87RsAxPF8XAkX2dDVfp?=
 =?us-ascii?Q?4nd+Ju2qOStbb7a6ZTwa+THbfGyjqALOR1ZsqC9ExMshyucCLIxp1Ww4b7ks?=
 =?us-ascii?Q?1SbvbWYtPkalf++4oQq0ICOWlWxpkyAyAZ+09uSgLgRC+zxgpbqIvc9QknsA?=
 =?us-ascii?Q?1n/2jRFEl+EEgcJjCDzD2LW7B0rDiq0Fbcs/iZ3yKNdhjNdvMaCZ0lK7l4p1?=
 =?us-ascii?Q?JEgZDPQHjTXLt38KeBCqfDVO7v+MdjAGA/dxed6lymxS3g617+KYSDyaH6c6?=
 =?us-ascii?Q?9LXfBj521ftFxfat4+oE90eQyegZCw2OB+bdkMaCVOcs6rHvPYe8ihiCzLMP?=
 =?us-ascii?Q?tGFG+13K60TeixENxyV5oObLRki1TQy1EmLVE/exYNsOwkPtAF57ZRl5EoOg?=
 =?us-ascii?Q?03bVhOnIFoZ9GMk1naiISPwJVlBno+GWJse2MdcuLbhYDsbgt5iV8bNfukSY?=
 =?us-ascii?Q?Xc0lKwoQqopBby2uZ1GFP5ew+pKlOjlSqBXAayFTUzZuKFfL0xKZEBWUpxFK?=
 =?us-ascii?Q?zIzzF9zoGHo9hAHA3OkmBOeUYNz5FuQNjevLkPpdH7xzu9Y7FxSF0prll5Jy?=
 =?us-ascii?Q?SijcO0W44lx14tpbFEq34bzO9P1HZBuCP2XHF0TGuAIzgQllYFpfqGogFy3r?=
 =?us-ascii?Q?S7mpWDg4i42KXkqMwhy9DgGm1cTLi/QyqrL3iFwBKT34KzttgxBqDnyfDmrZ?=
 =?us-ascii?Q?S+dKZiSvUYEfT2jgFcwAI0fO6VLKLysDbTtaknT45nt/toormc+fd/knNuIk?=
 =?us-ascii?Q?JydoELdT0sP1QsqBohndjFKUSPSbs4w9NHiCT6XbPyGAawhXXwfIhI7AyddC?=
 =?us-ascii?Q?4u7La5cvGvY+T4sZeagrIdqD617pTEcTs2qDZDK89sE9adXdnn+xXglsfBTs?=
 =?us-ascii?Q?Sfz6tlppXe6CFzYssbTnpGSwC+zcAAdcmxtj0IpxBok+Zb17+7ySyok0PfDc?=
 =?us-ascii?Q?azY+jDKPBGC/vFFqq5bOGuo7y07Bn9khALZqU6NTKGu/lN4k6r5v7xX8iFLB?=
 =?us-ascii?Q?+ggRpDawsGgZD2G2f8ASsKo6ZRudEjFrR+3uF84oofN7Ufg29VGDkBzWz21T?=
 =?us-ascii?Q?S4m+/jL9XTANDNbKy0suNpTTS4vGcn+qzsi9V/SqFMgTTtRLuOsuCc1hcihJ?=
 =?us-ascii?Q?rBLsdIwGG5Pm6xMCW6EEH3bU6GkKbodOuo5zCwHSfEShf5nu9vUNGeKlKeEG?=
 =?us-ascii?Q?o/4dAW9OjsdeSK5EB2DR50re+TEiQ3DlN6/cq74JklMYmvZnCtU2XuVEvepL?=
 =?us-ascii?Q?LL5BbHt5jw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SeDo4E1DvtLcoDOJT2w/iHo8BRdTcWciBtlJc87bDRjrE5FF/L6NQyggoEkTfPCGgC6Pi32rSqAe8Ja4b3kGl8zkVpXlQyKxpYz1TR55G0c3qXSTKDmV4GYpipWTuhnwgyygRYyHm6mnDhNBqqBrFwswIMhTJ3HvwcM/BXQKAHOj1cOGmpn2hi0h/a8zPlZJudG0TOB0vI/Wl5QDmetgGXJPGfBir5X0/h3P35gHV6eN7eoYv0ETwJDhIYSdULUACWsdxb2jXXf6kDW3N5H36RV/Vet/NGvXkmfq4H1a1j4BKUgR8oWCmQgH2RlOlKp38y0zCJFY16DXmA6eOnADZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032fc28e-7020-4c5e-9095-08de89b8b45f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 15:19:12.5650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OLLD/qqc54wqo1pH7NiZrjWZJM5WEB7oWmkG1wgRV8oCfNa7B4wGyso/NWXyxC+YvbOpRcISNJMM7NRMh7RFXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Monday, March 23, 2026 7:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix stale mode p=
ointer
> in joiner bypass
>=20
> When joiner mode is detected, the returned mode pointer from
> igt_get_non_joiner_mode() points into connector-owned memory which can
> become invalid after subsequent display state changes.
>=20
> Fix this by copying the mode into local variable for stable storage. Skip=
 the
> output if no non-joiner mode is found.
>=20
> Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass
> joiner modes")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7045
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index 96fb139ae..c2295c0ee 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -430,6 +430,7 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> +	drmModeModeInfo *m, selected_mode;
>  	char name[40];
>=20
>  	for_each_connected_output(display, output) { @@ -438,7 +439,6
> @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>=20
>  			data->output =3D output;
>  			data->crtc =3D crtc;
> -			data->mode =3D igt_output_get_mode(data->output);
>=20
>  			/*
>  			 * FIXME: Joiner + CASF currently unsupported.
> @@ -446,7 +446,15 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)
>  			 * Until then, run on non-joiner mode in joiner
> configuration.
>  			 */
>  			if (is_joiner_mode(data->drm_fd, data->output)) {
> -				data->mode =3D
> igt_get_non_joiner_mode(data->drm_fd, data->output);
> +				m =3D igt_get_non_joiner_mode(data->drm_fd,
> data->output);
> +				if (!m) {
> +					igt_info("No non-joiner mode found
> on %s\n",
> +						 igt_output_name(data-
> >output));
> +					continue;
> +				}
> +
> +				selected_mode =3D *m;
> +				data->mode =3D &selected_mode;
>  				igt_info("Executing on mode %dx%d@%d\n",
>  					 data->mode->hdisplay,
>  					 data->mode->vdisplay,
> @@ -463,6 +471,7 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)
>=20
>  			igt_output_set_crtc(data->output,
>  					    data->crtc);
> +			igt_output_override_mode(data->output, data-
> >mode);
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

>  			if (!intel_pipe_output_combo_valid(display)) {
>  				igt_output_set_crtc(data->output, NULL);
> --
> 2.34.1

