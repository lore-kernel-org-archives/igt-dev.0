Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF45ED58B09
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 04:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FEC10E2B9;
	Mon, 16 Mar 2026 04:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKM1ijSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A8F10E2B9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 04:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773635207; x=1805171207;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BfRPVGyadgh0VELdPR/u3npbO9/5g2gRsAIDUUU2t1U=;
 b=cKM1ijSpYCLkvtlKYvihTzZDi5bfQUwzJ8wu7ZgH0uxRoq5kA96LbAoR
 gkoB9KdwuCO+b1wyLZJKIg5JKuZq0Bo+ICXvoYEawc0xyIzMxLbNLerjJ
 bqBKTp8+wW/DXEokl0SAB+XjOGJMAyxxTUYZsUS5C9HYaCJSD375Z/IFi
 rTHCW5J/fJxdnNA2Un2TLmyviLYcgCDZq8+Rl3bk3NQTEVCxM35GiGRMw
 ahdZytec+zEo4jfg791+OnBFcOTTvZ08OkqKEY/B3g5j781wXUlR1L9h5
 4KEsTsR1YEKALe1EvHlvQ2aJwos+Wxr6Dowa9gnMHefX1baTAFkDCkp/c Q==;
X-CSE-ConnectionGUID: TpHSKlYJR8C2/sMqQKkSfw==
X-CSE-MsgGUID: hB7iBg+IRlqjK6Mlm2zoIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="100103939"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="100103939"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 21:26:39 -0700
X-CSE-ConnectionGUID: RTDwOXlgSka4FUjBjbSJaA==
X-CSE-MsgGUID: JjSUT4fBSByoaSszlRMyBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="225903725"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 21:26:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 21:26:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 15 Mar 2026 21:26:38 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 21:26:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgDlLA/pprAi/1UqBZW8fUDPGpc6yb+/fuOeiIVGx9sbBYigw/hunBIfL+rsXPsnxX2qz0QPuRBwblovwrMUlYIADQXEEQh2Pk6oHBd9NsYHuXSSEdDJBBkFYDT27aLDHLnGrfiqIPqfsLb/RvpSOg2C9yIphHbNgljCiKCEwfBMO0brbm5J3qW20VLHgHjNJlyB+f8hZD9GLgOg3bOQcVWj1fCzoxKmMNy3CyE14j0Dg4o3a4/cLlUSMTkQhVgsNctyfz09Z6sN3mhQHsBhgVHht1mYUyJyC3fZKtx9Qnd247DzEq9brweQoK+2OHtgvjQL8N/VZtrahLE0aLZXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVt1b1T8UiAGeGBDCBI+TrnnF66KH9FF7QgVThzgFEc=;
 b=M8RkI1ewtABCJNutVOZ2ktjgwZbZtC6ctMw9LJzLD0vgIshf/29n/UVFf72yoWnPamQeI7ir2I/P7RAGk6XL457rs1+hRYnnVgB/Nl+A92TVZn7LMIFE9IrVXlfQoGY0m+ipnkg5OdBXCzylpPWOkKfZ8weVGR8oTG1pJc3TJHp5sFKjVXVOtQYPLYxZW5ru417QiMY9EnRtMusMKx7jITYnTFyhjvWaAFkbOUVCTjs4eRfGlA66lzRXRLRv6/ai1LN5mfii2oNHgZzpGz3BcVcaQBG3TOFnw+Tr4vNci+3EJ70J7VxhqQtvTnoHVGrzxXQzfqlPhWdyW2xeA+9szw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6371.namprd11.prod.outlook.com
 (2603:10b6:208:3ad::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.12; Mon, 16 Mar
 2026 04:26:35 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa%6]) with mapi id 15.20.9723.008; Mon, 16 Mar 2026
 04:26:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_content_protection: Get hdcp capable
 outputs before modeset
Thread-Topic: [PATCH i-g-t v2] tests/kms_content_protection: Get hdcp capable
 outputs before modeset
Thread-Index: AQHctPo+1RqvU94GFUyDwWLyt4BGv7WwjuVw
Date: Mon, 16 Mar 2026 04:26:35 +0000
Message-ID: <DM3PPF208195D8D0E3F6F2234DDF4014009E340A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <20260316040409.15278-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260316040409.15278-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6371:EE_
x-ms-office365-filtering-correlation-id: 05fe71f5-ceb1-4f8d-875e-08de831435b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: cH1+nroHAd7QZTW8sjiIl8EV+Bz4Mm7ZH53A9xFU40sCL/HOXK7T0khsSXXSIqVpGL4BkoqLKY1ZElmYQrV67WQlcsFWJYcrcW/jdh0b6ivXMdjnxyT6Sn2CMuXyZuNprKaic+VKmrUX8F8zHH2i5jpN/VWg3ZZGpltbpLOyq5i0SPA9oJC9QitBqrg5xdszRYKX7fB7Mw3zztNO3fxrpLBduJ4g5bszipqQ0TVtku5MyXXqzBOztwtQ1LQZlOJO9plr6pAMElwcaiC32+TTSzXgheTtK53jcz0/mr+8uh4xE72/+oRAOsJJMJf7d/fa9eAvhznnRPlI6RUVUqKxOfmEuJA8FXmv8hRg6cOd3UnnhlMoNvalW6k+bG7p5WTVf63ZxixfDs/HPNo4aBDxRVYVlpAykvwiRoj33fF+wuBfjG0E3rO/h85ODGzgxMD1fw0FMWbnF21/8ugtD0brLAcfxeoeqkM7nMPKRsUaYjoZcLJZ6cJUoEge0GUfNuTu+g13BwNWytofedBzj1usnV+OhQ4fy56G9cjjtcLI3rdc6jQDjgRQMpbwJFeTQusCHrUzpeJYcSekKOF/+haP3iI+e2dO0eStsruXsfBpMCntcwG0KkDBOSfWl5MIyKTs8noNt8qz9zxWlK0V9sDaMbwyN+WOQIC4rqgmBSBA343Y/40Zc2yAWn/B0FRwv9j8UuEJHlpbZqAVLOciZrkzANHs9fUdiDks08KBBWQJ3qeU3aAbpY3hijsAL16aO56xV7GYIxLozza3H6wV1x4/jPw8L9UJkckFghiE2l+Jl4k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eUoOspwpzaAThnOWd7bo/vqAQOS5o6GdPlpCwJmx40/B4acWI59jEaNO/+/f?=
 =?us-ascii?Q?AyffPpM76y2ydz/9Fqo4cyK++KAHqMfvBposGbiMQjnPI2oziOjbNXaCTLUs?=
 =?us-ascii?Q?gWViFYo6kNcnKJpA9t4ZB88G3V2yogYenU0cYwGMUHUR0bPyaGF2GSUYwpzY?=
 =?us-ascii?Q?pdweYc1pp/6xZ+dWBV86bsPq2HW/fgII6OskqZ8UylowIpvALD/R+ng3JLLK?=
 =?us-ascii?Q?/fiTmjkF0zDx6SyGKJo6cAqJPisSl1LcvMnjPX05LHt+XKysvUKyQ0VejJ/+?=
 =?us-ascii?Q?9dGmoGSwTcr+lrkPaYnuqFkriQ4XCrL1FvYqiF86quLd34kO/ahJ0HKQb71u?=
 =?us-ascii?Q?h5uez2oHF6gEw5NzeyqMpEsui5nymzw1cyZUtgBie5DTfQQo+CWmHrrvXjIg?=
 =?us-ascii?Q?5U37dCsp4JOqlLSaBzIUnGh5xVjzD0hDfMmNiy+fn1Nrplxj5l32ongvNZ5w?=
 =?us-ascii?Q?1tIIg67pWUnUWJ9mdxzqZiTfybvAXjQnUYCW/64JU37rVzXrXinMZW1I523O?=
 =?us-ascii?Q?tTiHbID3gogUcqLxcTDkJBIi/T1CU1tg0K4/b/qPa3pleB20TpIUJWLkdVJX?=
 =?us-ascii?Q?aTBoN9YFszk9sfnDEb+DuOGBiV5ijlL+t7phw5VR9IdRx/4lG7CsNvkQSY/L?=
 =?us-ascii?Q?BPglmIHevsB0lNL7ZV0OLBgLevws3+MBDK1T6P9qVBzACPow8+QpbnwWL1lL?=
 =?us-ascii?Q?45CVbdY5dA4cK3gGqKdeGLHE5eVBQObvpRLekb9jGzv1OeC+NqAOu9rRZNw2?=
 =?us-ascii?Q?/bMnyv0raw4h4h0/QUMQnkHGH/lN8k4HaxaoFABLx3+j44a6kDBJCRjYCJJz?=
 =?us-ascii?Q?dLSdxBPqnmOozqp5l93NeQDW68wsrOZ0gmubY0YP1fqTJrmlesvBKK22/KU1?=
 =?us-ascii?Q?V5krXHkWD79SwI7QGWoDpxDyCppn7hTsvqLjPWQbdbohCwEz3v/2ptvwh4hS?=
 =?us-ascii?Q?w01VAHoWxGAGY/KcVFYcfTKDRShK05fLc4w29Y91jt2xfHJFvzYFt29MRnHq?=
 =?us-ascii?Q?UFjk3lShCXHry1aKfNcc5qjo+sEAx4QgTA05HCruniPGzWymIBltgTrkx0H3?=
 =?us-ascii?Q?UJdJvl0EX7t1HTKcSfsQrStAzuqiSJsg1USB2NOWUYfPLWMu/VN2x9d2gVYi?=
 =?us-ascii?Q?c0yD3dV+9e3RqAMNm/QRMKDaqbjxwQS67UWrpx+OKhmUg6xd6UqI7SPexJPC?=
 =?us-ascii?Q?bh83vXjul0lcCUKPCcl2bpws58GUZX7UHTYEhB0LEfgCjOKVwyoQ5k9BHoH2?=
 =?us-ascii?Q?RMfSMou4B2kJ58IxcTzkLpzIaudOtXp+Cf2k0D7PcmvnUFg4dtpoAlUJ2e2o?=
 =?us-ascii?Q?6AfaLHn8YvAD8p213jhlCjZAtwmJv9yAznjoNk/7yKWv2J8TbDoTO/geKysW?=
 =?us-ascii?Q?0R8ACqzbQAHuFxGS4+z1xR2Uz4rbxn2/skgKdUjjrDJ5c2pdnnY1dtmDmtqy?=
 =?us-ascii?Q?2aeBEZmuUjxV3+ZjlDslxp+q0QGwpuC/NIkluuIs0RxdvLVQjA/3FEt6/M5M?=
 =?us-ascii?Q?6pn56N67QMp+c+42mX9tvr62wAsFHvdzx3wKNhMSZk8yZyvUAnDGoMQvO0Oe?=
 =?us-ascii?Q?WLXBUJIlNhbbzFJb/owgfQHdcT0nOfDBeOevCS8/ha45oQX/AfYkuRIc/PQw?=
 =?us-ascii?Q?gUgbYJyJtCkAI9Bey6eHCKRBsQhuMqZTSXZns9aap++wfknLtDvXg/POXGgd?=
 =?us-ascii?Q?jNQAlIOyD/gjCU1m07T7veCzfy11Migcl+bHA0B+kwlwLQNOv9Dt9re5Ykrk?=
 =?us-ascii?Q?DLys4b2gpA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Wy07Ih6cvO7E8HtWNK6eGpi9bVoJT68N0yTO7KxoYlPgv3fvspm0b2yaswMBHWmMokhtO1VsG2AjlAL5PKJiTv7qMoRUGcxzbUso7TsAjVPb1sHQ+spZBqmY/28xAjWd8/UR/rXbNMyyIZZpuBsTfVdxzZGr/KVT3IjMOz/2wcmyNGwM43c1pOodg+hp4RVzqodGzSiHEIZioX38CWNc6GkbGOYelAEGlGkrSwh5k+msLm9tvDtvPNrwKqi1RYjAqc4GFBDb0SPmKVCGxqmjLaNLNKyOIO5gJGlClnkQf2ptMfh4lP1H3fqNJz+SYTGC2EWgnbWocsUi9DI4RAvZhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fe71f5-ceb1-4f8d-875e-08de831435b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 04:26:35.6768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrJDF3j4T8N6O85JdPxel81ixvj9RI0+10IOQgZ3VMf7jhPaZ7VqsTwaUBshYGUnIePftVbjBggb+gv/xxA+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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

> Subject: [PATCH i-g-t v2] tests/kms_content_protection: Get hdcp capable
> outputs before modeset

* HDCP=20
Acronyms always capitalized.

>=20
> Filter out the hdcp capable outputs from the connected outputs before doi=
ng a

* HDCP=20
> modeset_with_fb. This will make the test to execute on HDCP supported

* just modeset is enough.
> panels and avoid commit failures and invalid skips on HDCP supported pane=
ls.

Also mention why we end up having invalid skips.
Something like
" Connector needs a valid CRTC connected to it, for us to be able to read i=
ts debugfs
Consistently. To avoid modeset before we check every connectors HDCP capabi=
lity,
We collect HDCP capable outputs separately which need to be tested"

With that fixed,
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

=20
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 40 ++++++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index f35c9fa73..96a62bfc5 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -707,32 +707,54 @@ static bool
> is_output_hdcp_test_exempt(igt_output_t *output)
>  	return igt_is_panel_blocked(sink_name, hdcp_blocklist,
> ARRAY_SIZE(hdcp_blocklist));  }
>=20
> +static int get_hdcp_outputs(igt_display_t *display, int content_type,
> +			    igt_output_t **hdcp_outputs)
> +{
> +	igt_output_t *output;
> +	int count =3D 0;
> +
> +	for_each_connected_output(display, output) {
> +		if (is_output_hdcp_test_exempt(output)) {
> +			igt_info("Skipping HDCP test on %s, as the panel is
> blocklisted\n",
> +				 output->name);
> +			continue;
> +		}
> +
> +		if (!output_hdcp_capable(output, content_type))
> +			continue;
> +
> +		hdcp_outputs[count++] =3D output;
> +	}
> +
> +	return count;
> +}
> +
>  static void
>  test_content_protection(enum igt_commit_style commit_style, int
> content_type)  {
>  	igt_display_t *display =3D &data.display;
>  	igt_output_t *output;
> +	igt_output_t *hdcp_outputs[10];
>  	igt_crtc_t *crtc;
> +	int hdcp_panel_count;
> +	int i;
>=20
>  	if (data.cp_tests & CP_MEI_RELOAD)
>  		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
>  			      "mei_hdcp module is not loaded\n");
>=20
> +	hdcp_panel_count =3D get_hdcp_outputs(display, content_type,
> hdcp_outputs);
> +	igt_skip_on_f(hdcp_panel_count =3D=3D 0, "No connected output with
> HDCP
> +support found\n");
> +
>  	if (data.cp_tests & CP_UEVENT) {
>  		data.uevent_monitor =3D igt_watch_uevents();
>  		igt_flush_uevents(data.uevent_monitor);
>  	}
>=20
> -	for_each_connected_output(display, output) {
> -		for_each_crtc(display, crtc) {
> -			if (!output_hdcp_capable(output, content_type))
> -				continue;
> -			if (is_output_hdcp_test_exempt(output)) {
> -				igt_info("Skipping HDCP test on %s, as the
> panel is blocklisted\n",
> -					  output->name);
> -				continue;
> -			}
> +	for (i =3D 0; i < hdcp_panel_count; i++) {
> +		output =3D hdcp_outputs[i];
>=20
> +		for_each_crtc(display, crtc) {
>  			igt_display_reset(display);
>  			igt_output_set_crtc(output,
>  				            crtc);
> --
> 2.34.1

