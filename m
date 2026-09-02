Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BADC61DFD
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 07:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72516891D9;
	Wed,  2 Sep 2026 07:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OytsT9I/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13771891D9
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788333378; x=1819869378;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wPw0ypyhdNgRdNN+OKCkXqJMXb81OpnbnZK3YOWgkaA=;
 b=OytsT9I/VFAPXTkkMXSdAJse22RPCj2daDkirUt/c2jPf86nqLvi39Ob
 nR6WwgqrytSXiJffVFjacQ0Qi0A2UIPVLczXizg9QbEK8n2VTjVMF3Ety
 evZWO2Z7OiBgN4Kokd6bJu4nuXI3wbpKDzZUPDh635fzx/eG73OiLg7C6
 NHKg2KMpS7sCai3MCC0aTddOGLV8loaLtAQgGlqfCOMedDpTAjNrLr0Ji
 wOU/SSJJJxNzWwY6iwuUoei7vco3b+DlAs3SJIUZ4EjmFdns5YQhCnak+
 j3o/Nb63Hzb6zp0EAklB9YaHaipS74UE11cmjk0euUuecoa4RIJdKW5+g g==;
X-CSE-ConnectionGUID: JBNncQkwSFigoF1EeSKe6g==
X-CSE-MsgGUID: FNRojrStTQOUExM22apiJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="114324517"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="114324517"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:16:17 -0700
X-CSE-ConnectionGUID: UX/Ff2GERki9UXYQfedblg==
X-CSE-MsgGUID: u64LpETcSYG3KJD9KJKFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266724724"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:16:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:16:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:16:16 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:16:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/VJtqsblWTGBts1lL4fGJlKDI3oFy3Dg6s+n4WVYbtDFbT3KNiQGwe74OCgNL15VTeMswr7zOmeQhDz5othq5yVjf6Fy7cwFwNetTVhglxl5sUSCf8heQtUiNURH90YVoZ2rJsX1JB5IKs7FWUeJfY50qN5Xs2lolENVxLXkoeGZDspMGPSjzqKi+jtvsmIjlwxJ5Y7LdpC1MrL80OQdLaIdImUeOSSXdx2i+A78fFyQzxxo8PmBrZM1W30kB8BCG8I5Jb6YrVmWRIzwsOArAMz+l3HzFxSN31hBadEBmIqrJbkV7AXdqejjOaqRV3zINsn4CNQYsgU3uIU1p+HfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uplCAOfqFSdavtDXSGQ5M4GHJnP7vea9H6yM9aPKw2I=;
 b=nNNfs7sg+vgROhsKKeOFzOvJH85Uiqi+KOcLC9lL/iMFBpYIaFuWCsn1D18wvWOLUTTKgFLUh5CS3qWOrTTObX6w7FaXMh+MqM7CEGdJlcytxeZuhRGZDTwgl8RKsJj3YZzWa63Gjdw4Bvi3wegstarFGqjamgiSNPxEcMQKwDnAlDhEiouO7DOVzcmAS7st3KePGnXuNrf9SDK0ippdX280WTne0amSvETfcZv2E2hxCH1bU0faiGicS1BbZB2HaB1nA65fxxjjidq3Ddjeve5LBtwL8lAJxKcS+8/e0AV/57tRPLHYba+SyRsOTAgaXAEcqA9pLk/4Jkx7kjwDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:16:13 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:16:13 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 3/3] tests/kms_color: Add background-color subtest to
 test the BACKGROUND_COLOR property
Thread-Topic: [PATCH v2 3/3] tests/kms_color: Add background-color subtest to
 test the BACKGROUND_COLOR property
Thread-Index: AQHc6gPCqBh6Jwn5IE+gaZy1DsYjBLa7dTGQ
Date: Wed, 2 Sep 2026 07:16:13 +0000
Message-ID: <PH7PR11MB6053050359BB9109974E4F95E7B72@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260522155635.1215421-1-dev@lankhorst.se>
 <20260522155635.1215421-4-dev@lankhorst.se>
In-Reply-To: <20260522155635.1215421-4-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA1PR11MB6145:EE_
x-ms-office365-filtering-correlation-id: 4fe24b8f-d96b-4db6-f652-08df08c21245
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|56012099006|4143699003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 7c3m5RdeCotfrrRuJL6toZLKOUAD09wI2rA3EV9JQLB7ulwfCv+Z4ti/DJL9mN4hb2FEIt9NboQ6q1Kco9TYEuY84eRCupZW0GihgByouLdPIXKPPNG2tjWSZhdwHHyNPZ7GsAQMkp8iTSRePOJ+ue6AwZRpAfatiCeoNJvU3WD3rpaa5nrHS0h4FZ+8+V3QpKCE0kRGjHp2pb6tfK4StODAlo67MeLxZrr4jB2vp4AxArnEwTGsH7gJ8M6d3K6fn8/RPAoi+dIl2HAgdcVxdvSmrfa3pS+Rtc9LZZ3lxDW+qB0XcaeNvDWvU592jNkESp334DU9lBPt4WKL9+MEWyHMkkqRuAOpbsIod4WVNCbA4vmQu8eBoniN9RUEZWq2qN8ROw5o9hbYTaDYG8tu7SRdXRVYs++KsU9x02sH2SHetaEflCoAnnXuov71G6UltYq3p0Owswr0jEi63ylvUCMRcwWGEqjfZW0/Vpqw3wl9weSS+D6DneHR8dzqhDCpeUHG9IY9rorHjGuJOTR7OhuKbeJLygJKC+nLLloJs84tjtxGDC4qQB+4D8WuG6XGpr2OUSjAvM9ARifNYmWFK/dsK7kORgQ1sLMiTdEinygCqZwLdB33I5ll26REt0G6rDwiehlUW1pHlVKb4/RQL5qVgKgxNKRDjgjuR/R00YZF5E0Ogonkxeg29CGWGcP+1/MmYimsuZwJ7KUvciPSVL64erQSeGpNjUCV9MP67S8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(3023799007)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2JtoEnjpsuYz8SI4UYxqQkATDcnQQ3Ya+bPBKnbj4s+lLctzWR9dnfdrWFX5?=
 =?us-ascii?Q?jO7XDu4AHCoN4hip6nL5SyHijlqs/kGZIWfVXGshWOWQaG5G0QMSkfF97oYG?=
 =?us-ascii?Q?1Kooga6pW3Bw99LyDuQ1IjcCE8THMbsm1Tm7Rrq/WJ3nqlYkuIz+n24/4JQi?=
 =?us-ascii?Q?wcE69z25gHjDZQGdx+KGGb8fExXz+X4H3XbXeieyB70Hx2t4g4vlQfbnEnqA?=
 =?us-ascii?Q?RW0mQQsrSeaivhjhbAJjCliHvuSgh/zKr0MwLFGmFiGIiXeF8laxuN3J0JMT?=
 =?us-ascii?Q?eKhI6L0bUaeqkLuDUv4hPGyf7LuiBMB4MvpI1v9InRmm/mLZIFxIsjqpNLmu?=
 =?us-ascii?Q?GoFQstgU39S9orHHslBfxJSkpvTDYkiLerUxNB4UDkfJvXris+hEwtMw6TnO?=
 =?us-ascii?Q?JffKC54FsY40fAQQJUUzOdPDNQ5VYH4KWeR2R73BexSzqIU5W1As/vdRk8k3?=
 =?us-ascii?Q?ejg4x+0A2OJ2380qdNxCO0qDX9EXUyFnXyQhkQ4neUjwv38yeOiPzxS5GRe7?=
 =?us-ascii?Q?+ArKcpIbUCbs8yIQN9xmyOyBNRTpJF7JRHeXl3eZ9UtVjsAu5BrDPCf39+gs?=
 =?us-ascii?Q?LIe/vEVKD2P2zqNZTaZ9VbaFD/N52gCq5Xk5Dr8iw9uOMw5+gHWIk3qoezGa?=
 =?us-ascii?Q?7PGhfcVm19FyPZ58rL1GsalJ9QK0YM9Vbw9ac4uW3J/NrOLKEaveKG4XVe3l?=
 =?us-ascii?Q?9X6WabNiOvTwkWUaw0slFGD4KQKccVH5ZptDKFim9Xkk2Rmawc8iiCAUnVJC?=
 =?us-ascii?Q?2mfDNZGuXQGE4SVtUIy2HCc+4wBNv238sYNmR+dThC+ahS+b+ccAQ9P7Gi45?=
 =?us-ascii?Q?fZY4rXaRtrfkjr/wfbUz/id3dLYxq9FSzMpdB6Ls1BjwfgVS8eRwsR723gLK?=
 =?us-ascii?Q?JBC5QQ76wZPGPN3j0mfj6/CGv8ukzeOXqF0FuY6unXLur+02e8/rLnv9s0tp?=
 =?us-ascii?Q?AZjpaN/JJ0mEKfaW0JV9jcZ93qx/BEZRnVwJ/7StdE4RqolGBBC2OsAzNT9N?=
 =?us-ascii?Q?YPlCDUqulNOhknagMkRIOxtVprcP0HaP/Q8vHtPqZMSBTrNTKDt62sx5SOGJ?=
 =?us-ascii?Q?OVikrCRl/nfxgEQVpYNBFZ7Q51EBeHIBHLfB+cdG3sLopreKAMO1TU1w8Myv?=
 =?us-ascii?Q?C53X/XKcSeTJbGhA8KtHYz1iJAMmzfm6C/LPncJ9wsTL+EyGp7UQBQwFmD8r?=
 =?us-ascii?Q?sKlc3agJOBO1LCsvqwKpWQkvN7JWPp+Ik0/7nT0iUHuyYgkhBFe+mHVVPFsA?=
 =?us-ascii?Q?5EounObQ/sWgTKPzePB+2mOfYBV5mD063bq2Ode4kyL56U9URU0cgzETtH4X?=
 =?us-ascii?Q?VleywBOnt/2gNxwD1MvOWFSsvD/GA8aZnL98qnsuQMpzkzaju5mFT+bSSwKn?=
 =?us-ascii?Q?q/NHxcjKDdOLsVzi/o+xya6E0KyYj1+M//5KUFJFioU5arN8zmn8qvZvdx/6?=
 =?us-ascii?Q?WJ2E7/qe/LGHNSEXtdx65X70iUsobc8pYypGc3QFcNjAlK+FFGtHg/A8e7tp?=
 =?us-ascii?Q?J4t1mzp7o2HoU6NwrPEUjwa8XcPiClEAeZV+IjgFJeqd1qvI5yoXlske9DVp?=
 =?us-ascii?Q?nohDL5ZeplQ9mo5pKMxQE+3/R0CCYhADOAZ8frJPJv8XDvDWhxLet7YtzYQA?=
 =?us-ascii?Q?5JW10Jb6fbvFPGu8DgMsepNw8+eTFlJqi9trTurrLzWEy+iCL9w0fhxA74w8?=
 =?us-ascii?Q?iCZjNoZSGcjxs7CXqtzWFGfs0X1ZrIl4kTGMvd+jgj9TcTsEp5Tgxeb8TXq5?=
 =?us-ascii?Q?f0jDiHOVRw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: z1T9EHAxG+Yj6uuLJZYbWwlnQRBlArOKjx6JqLzBllSQH9Vp6sJIJ7vKHha5zjAqBECAL6coYrXdwB74oOLnnaWozSG5tPTdBxC/G3bipciiANyrxJtYlhoqiozJAAhgFjPr2AiFO2VcLHJLvIzUaidHnK/+WF/DxWZvpxQiXAokv0aNWn/Z+kqdJtNQLQIs62uwEoKH2Dp4sEOaAslv/d99+CyDCm5maCHFujISfKuFhcWTEwm+You8GuyabzJNyMkTmWSK5/an8cm18kTnH+PkFDgp6zvCOQgc3zJvI+D+gwQ7vEywEVPvzOyqLnDsJfBUbhsvvdMOgYOGA9/3LQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe24b8f-d96b-4db6-f652-08df08c21245
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 07:16:13.3104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3VtzD7dZ4Ps7cpfVHFOBxuLrurQtAJgGCXi5hfp56Ert6YHbfUGbb2zgTgVhHT9rKRdj6JAWbViU/8gVbGjCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
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

HI Maarten,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Maarten Lankhorst
> Sent: Friday, May 22, 2026 9:27 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Subject: [PATCH v2 3/3] tests/kms_color: Add background-color subtest to
> test the BACKGROUND_COLOR property
>=20
> The BACKGROUND_COLOR crtc property has recently been added.
> Add some intel CRC tests to verify this property.
>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  tests/kms_color.c | 72
> +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c index
> 565edb2dc9..64ae844abf 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -46,6 +46,10 @@
>   * Description: Verify that setting the legacy gamma LUT resets the gamm=
a
> LUT
>   *              set through GAMMA_LUT property
>   *
> + * SUBTEST: background-color
> + * Description: Verify that a 8-bit background color has the same CRC
> + * as a 8-bit primary plane in the same color.
> + *
>   * SUBTEST: ctm-%s
>   * Description: Check the color transformation %arg[1]
>   *
> @@ -957,6 +961,61 @@ run_deep_color_tests_for_crtc(data_t *data,
> igt_crtc_t *crtc)
>  	test_cleanup(data);
>  }
>=20
> +static void
> +run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
> +igt_output_t *output) {
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	uint64_t black =3D DRM_ARGB64_PREP(0xffff, 0, 0, 0);
> +	uint64_t red  =3D DRM_ARGB64_PREP(0xffff, 0xffff, 0, 0);
> +	uint64_t green =3D DRM_ARGB64_PREP(0xffff, 0, 0xffff, 0);
> +	uint64_t blue =3D DRM_ARGB64_PREP(0xffff, 0, 0, 0xffff);
> +	uint64_t colors[] =3D { black, red, green, blue };
> +
> +	igt_require(igt_crtc_has_prop(crtc,
> IGT_CRTC_BACKGROUND_COLOR));
> +	test_setup(data, crtc);
> +
> +	mode =3D igt_output_get_mode(output);
> +
> +	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> &fb);
> +
> +	igt_output_set_crtc(output, crtc);
> +
> +	for (unsigned long i =3D 0; i < ARRAY_SIZE(colors); i++) {
> +		igt_crc_t plane_crc, bg_crc;
> +
> +		uint64_t color =3D colors[i];
> +		uint32_t xrgb =3D
> +			(DRM_ARGB64_GETA_BPCS(color, 8) << 24) |
> +			(DRM_ARGB64_GETR_BPCS(color, 8) << 16) |
> +			(DRM_ARGB64_GETG_BPCS(color, 8) << 8) |
> +			(DRM_ARGB64_GETB_BPCS(color, 8));
> +
> +		/*
> +		 * Set a different background color and  a fully opaque plane
> +		 * with the correct color.
> +		 */
> +		igt_draw_fill_fb(data->drm_fd, &fb, xrgb);
> +		igt_plane_set_fb(data->primary, &fb);
> +		igt_crtc_set_prop_value(crtc,
> IGT_CRTC_BACKGROUND_COLOR, colors[i ^ 1]);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &plane_crc);
> +
> +		igt_plane_set_fb(data->primary, NULL);
> +		igt_crtc_set_prop_value(crtc,
> IGT_CRTC_BACKGROUND_COLOR, color);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &bg_crc);
> +
> +		igt_assert_crc_equal(&plane_crc, &bg_crc);
> +	}
> +
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	test_cleanup(data);
> +}
> +
>  static void
>  run_invalid_tests_for_pipe(data_t *data)  { @@ -1165,6 +1224,19 @@
> run_tests_for_pipe(data_t *data)
>  				break;
>  		}
>  	}
> +
> +	igt_describe("Verify that the background color is set correctly");
> +	igt_subtest_with_dynamic("background-color") {

This test uses COMMIT_ATOMIC, so it requires atomic mode.=20
Please add igt_require(data->display.is_atomic); at the start of the subtes=
t=20
before iterating over the CRTCs.

Apart from these, changes LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

Regards,
Pranay

> +		for_each_crtc_with_valid_output(&data->display, crtc, data-
> >output) {
> +			igt_dynamic_f("pipe-%s-background-color",
> igt_crtc_name(crtc)) {
> +				run_background_color_tests_for_crtc(data,
> crtc, data->output);
> +
> +				if (igt_run_in_simulation())
> +					break;
> +			}
> +
> +		}
> +	}
>  }
>=20
>  int igt_main()
> --
> 2.53.0

