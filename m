Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2306EEF4EC2
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 08:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA73F88DE5;
	Mon,  6 Apr 2026 08:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkDXb6P/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D7688DE5
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 08:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775463005; x=1806999005;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A9KanIO6Fr8jmzrauH0LPG/9i6hFGGvzRbd10QPNz5g=;
 b=OkDXb6P/fzJvZiIUhTtd/wsG5oS7gUvBPIxMAMs9E9F58PGf1eLlfAF8
 2GY4u+5D70tdyiNOqaBioJmUNwzqijP0rgHSBtRIl50sPdh0uVNBnwnLH
 ko+Nhe7tCOPowcOMhsjyCYglfJJvm4Xx5Dek02PaGuIvY/SWSe2PCBH11
 INPqBF6+YFJ7RZofr3MMXnzA7+zM/lgGEg2PLr2Ze1DqWN/kfwZv6Kgbe
 yFG+fGhALsHX/ZD9/bisoi+jU66jYRLKnAC7jUtlSUinXFaE6TD8zpiuO
 KRygM4DYnhWQWxPHydA2Y4zfFMqsV7DOfO48McTbTzGjOOeJmcvDCspbZ w==;
X-CSE-ConnectionGUID: 32Usc2VeQIG41zKzoSJQzw==
X-CSE-MsgGUID: qL2+UE0vT9W72+Kh7iw7Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="93995455"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="93995455"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:10:04 -0700
X-CSE-ConnectionGUID: HFzSOEUKTgynJmz9QBu0qg==
X-CSE-MsgGUID: QGFUg9BhSVqhQTBEzfILUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="229482289"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:10:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 01:10:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 01:10:03 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 01:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOaPqJgELzQwAO626bqqybr3Bl1kaoArNPqoGAXTozMNSmrbJlH8YN4F29ZJKMrSStklx8BXUxEBVNdQva8F1teyj1vhDY2oD//d3oSoGGSu6CYWkzj5XHWEWVWoIWlzJXAmeU8AT0qDUOvmB2Ge/518MM+JVShX2UduhNRp9o5JNQo3PmmPsLaX/DT1rrBzPbAq5UIh5u5kPJzH+nzlJMewNDVLzfk86J2HYHywOtDPelYxSVhUdvfxCh6j8/Hggz2gEOEq/gQMV7X39PQGRCEFiG461gA5coC1q9uC656f3H3yRqCwry/Y2GFfWPmicvdT5Kp/zkwtg8AYW+gAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=111QwUFCHU3V8qUAVOrBKzbBLv6a1WRN1/hoPMvS39w=;
 b=MrKQq0YNmlKMnZopzTxIFurWktIJSSsbImQGFK3+jtDdDaA2uXmQlsZKOG9TgNytc9JSapEPcLVqnXxSbATWyc9VitO22+kLYWT0DtFg3l4yD+E+QUh4LXtVmy46HpeV2zq8X4RBZkT2bKptoz/gau/rqwg/QQItzzKnlBh5xH+ICMX41K8pjv22jUUluHLMWQP5PRqNwHtGGSU4tpT0/1FHLHBH1vPk0uwt5Z3tpflrnXDxnVYwirJDVmo5Iz+goLUbV4lrr07fTDdBeLR2yvRJIO1aMtpHUYOgv1ktxZDr1CtwylCtezS79fgSf59PmcKD+Mxf59SiNr5xKz0J8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 08:10:01 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9769.015; Mon, 6 Apr 2026
 08:10:00 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v4] tests/kms_plane_alpha_blend: Skip test when no
 display is connected
Thread-Topic: [PATCH i-g-t v4] tests/kms_plane_alpha_blend: Skip test when no
 display is connected
Thread-Index: AQHcwdHzkt5gxZmL9U6gK+9+4k9bR7XRtUyg
Date: Mon, 6 Apr 2026 08:10:00 +0000
Message-ID: <PH7PR11MB67968E1E2E280DBA02C77D50E55DA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260401121855.410871-1-sumit.kishore@intel.com>
In-Reply-To: <20260401121855.410871-1-sumit.kishore@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: sumit.kishore@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SJ0PR11MB5038:EE_
x-ms-office365-filtering-correlation-id: 01122f07-4f17-470f-b150-08de93b3e669
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: XobhNQfWiHFLP4Dm8GPnQawRg6aopj7nHR3RDxo9ETjatlMxwbYeHbtZ1LTyvGHlgCZdF3WQH7Hg6LnAjp3TNVS0+BLk788SoYet2eVAjlQsAZBD36XrgKina3q+2roN5d9fOHB1u7Zzei68AE9XiDNQmJxkXMXmjIW4UKxB/880FpoxcijiGsYeV9WMa5nGpvxc6YpODqnnwMeYa1myrhaybpcvT98PDoHAoP3L57/n7A5oq4tgvC5Mrks4EZCJG2P2uRKP+bM6ay9L8n/ULqjwXiO7uZW9jOOh2DRLPsbwcRr3iFk5sDLjYL+eczsbYQ7JBo5Q7yeH5Zr6SUdC8Im4bmLsZ/PESZw6V2fvuY3+8zO6+tzu+4PEMZypJ9xnD/2DoZlmE2whWE5X2sUhXIAO9d+WSsSpBJ1cQ5GzO8KTcaC2P/DC84fUzbCWNhpfD9qeL7lXK3FhJ3AXTBI/nDtj97aEazrPnocZUaLlMEBndqUGpMBtb6ersnauavApSJLZTyY6X9NJTO6g7brLe6B+7C2mNHslkJptaTl5svxe+aTVbIELi7NZdUooupmazcVzqwXkaOMqyM7+TrB4oenuQGiFik500mW5K5u4m7ctm6ORNUCbaQUi+19trAdpOfXbzIghDT6t264M17klRnD++rgO2+y9MV3KesrtpHZPsSTxrhOHEW/T/00U1EjpWRrg247EBl7MzlS2zyLQNbJW4ieF8pVoQEH8+lA6cODlYjxkTx7H67RJAekgEygUiO50zXk8ckCwCQR/DVLw9XKFmjkcOs61pduIjCBss7o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?atp4/CaAJW7bqzadBOhd0pV4ZRz2gP5JFcWsNeZrZcdlL7VkF6/HIpLMVvyn?=
 =?us-ascii?Q?NI7Yb/D28qZ2MygGE1vg78eV+U0HTnMoL2hNxJsQ96ONK6exm1tXZdCmuQVu?=
 =?us-ascii?Q?ZxplOdJeOOPS+GMzIkqBg3dRlER6CtVRBjo9CcoacIZ1R4kpUq4pu2cy2Mar?=
 =?us-ascii?Q?3Xn0e1G3XZMSg70k5CR/a4K+/gpqhvsJP2NSTrKSvhRM9SGx9fpFkh0/Bmf7?=
 =?us-ascii?Q?4Bi6bNiJBVdbjyXuwkwe1xl6lcM1f4Jh99bEBTGcyomtBVfRCevKT5g1Jg/c?=
 =?us-ascii?Q?peOUqxmLeofzLNyl0Fn0l+28SDL6hsRCDdm0rWzU7Bxq81fNeV1FY2+UTI5m?=
 =?us-ascii?Q?AEnalLJD2jAkBo+mj0iU5Ces3cXBO6wzVme1YUA56KP01Bwp77zcj2kIKlq0?=
 =?us-ascii?Q?iYroZw86kytV4IiX7pK+kpBbfb7Z/CYu6x9PSEmSMlpxp4R6Moo88nnCqq2w?=
 =?us-ascii?Q?TXlhTGE5Doyapb8A2k6ABIIL2M68KWDN65/F/nscGZ6jHEfoZVZpmFtn0lK+?=
 =?us-ascii?Q?VrEGvzNaN6GXDe0kAyfhatuvImZe9QzsTxq0+j9rGcb+5HFiBJ5NTrB0R8oA?=
 =?us-ascii?Q?U5BQDFnnk6mL4lUtpFKl6ojDHuyf2snZjluz6Xb3yyMcgHcGijKdjrWgA7sM?=
 =?us-ascii?Q?NraQw98M19jorfbAL2DMvaSLnxTiWJOQiVlU7oiWp7mk9xEOBX7pk/aOHxf0?=
 =?us-ascii?Q?LahGmfLepm/8J3/cmfvOJOJNN9gJaHXqcxHBHWXms8qKvf3Y4/jkD6mjNQ9y?=
 =?us-ascii?Q?Ax3Iik91EQugpL2A0Xq5AAFJrAJ51YjTViVJEANECBb2unB08odOCy3CXolo?=
 =?us-ascii?Q?lkzznZuxEYOxNjMFwE5/pAIf36fIpE/QaizpdPh9N2ZDHOMNLTasYjQrYUGp?=
 =?us-ascii?Q?xbQtg17eRjKNi4P8KtGl0yIvv6Fhj2IGHkL4YkRy1xc8iX4mI67VXKAq/+tt?=
 =?us-ascii?Q?NW9tEKKxUeWmx9ObX/XXe1ea3lc3fB1NzzlVUpL3TVieqLpY04Tz15zbXjvS?=
 =?us-ascii?Q?J/x8tcqGbzAEzlL8lm3cmwSNs3ENHWX0ZtRA595HrPMCeIXd4dKceOhIYDIH?=
 =?us-ascii?Q?oAc+NMEoOCS3X+u3hHyVMu3AEMxRiLxDMxSRQsScpT8pU3eDYEFvFyElanxS?=
 =?us-ascii?Q?JTAMR4mAPi3jlotAX08QVxqm8GsFV1GYTe0+nI+GQYJqsfwcWNghgWSWetaA?=
 =?us-ascii?Q?+nZSsMJk1OiQ7j972JjLmAR2gKRPbHZaiwBEcZziPz+l3E+R0obr44l33A0N?=
 =?us-ascii?Q?v4aU3672VEPGxcBRvcJXdb1am4/tad5PKRecoTv7+E/XEft6hF/pHQrHeGGm?=
 =?us-ascii?Q?anTtYK37IQIOL0aI7YpforzuylszBQ52L7MtrcXs7xGgDZS9HuVJiq4RlLDM?=
 =?us-ascii?Q?AOvnfGy4jqAbLmAhT7orE7Cap2Et1+pWuUI4JpHlWEPYy//vMiPJoAwQ/boU?=
 =?us-ascii?Q?pPY4NB3aLSUaJB/SvR/anyatEot/BnFzPsLTizohcIb5raCDcpW3x6uYK8uW?=
 =?us-ascii?Q?qS0AW09vfOh+pVZ4g33V9DBieRx+y9CVotrP+XkWYxQ9/kDSYFcZ985lmPPa?=
 =?us-ascii?Q?zduCo145ojTuZMDQN3r9l2tWbQaDW/5U0lYoqPKIrwm3F+T20v9QBX8EoN18?=
 =?us-ascii?Q?3tRnJbUwUxyfV6GXUTwFzm+pwlUxaLo9NRXWMvleOtmJEfQ/RRkdiH0P39fT?=
 =?us-ascii?Q?XrD4P6PAgi4GWM+xKgwwbsBq1zMaQzCk5GACPKZm6xU2Nit5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G8RIAAH0XqoHle5mLklnl6y66d7orxH5LAsoV45JAaVS8nLHnyP/8OxuQ+2M2mU9p1QT1Vbtc6rrdwjHXoZ3umHLhPSGOHj2qs8Axn2wUOVlCj8cGAykEMeug6EUT52R9vj4nwlXBt+kdn6rsGy371vzh4/6gvYCOpbMKdfvOKxKZ7ImY7keEm9foRVYh5aGE+5KSrC++GMo96I/FczRhLrQ4V7U+403+hNBiEER1FXK4ExRtjWKVsrUTKCJZ2K3KWnJ2JdlK0mnrkunncn/R6pyVPLr+IQK0ZcvlVwpYX47vDGdGHrobAiXv8lemou8HHQYVYQeg1RHdqzD3xa6wQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01122f07-4f17-470f-b150-08de93b3e669
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 08:10:00.6962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2VhEazgocV1GHXRJAc31vCjR911Y5Yang/LZ0b2YWe7GiR5pcVSt0xeDl8bYegRL+J4qfDKzKYvrRFDVLEN2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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

Hi @Kishore, Sumit,

> -----Original Message-----
> From: Kishore, Sumit <sumit.kishore@intel.com>
> Sent: 01 April 2026 17:49
> To: igt-dev@lists.freedesktop.org
> Cc: S, Sowmiya <sowmiya.s@intel.com>; Kishore, Sumit
> <sumit.kishore@intel.com>
> Subject: [PATCH i-g-t v4] tests/kms_plane_alpha_blend: Skip test when no
> display is connected
>=20
> From: Sumit Kishore <sumit.kishore@intel.com>
>=20
> Add igt_display_require_output() to skip the test on headless systems wit=
h no
> active display connected.
>=20
> v2: Add igt_display_require_output. [Karthik]
> v3: Update subject and description. [Swati]
> v4: Updated the author name. [Sowmiya]
>=20
> Signed-off-by: Sumit Kishore <sumit.kishore@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.=
c
> index 3a67dd8cd..3a2649833 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -764,6 +764,9 @@ int igt_main_args("e", NULL, help_str, opt_handler,
> NULL)
>  		igt_display_require(&data.display, data.gfx_fd);
>  		igt_require(data.display.is_atomic);
>=20
> +		/* Check if at least one active display connected */
> +		igt_display_require_output(&data.display);
> +
>  		/* Get active pipes. */
>  		for_each_crtc(&data.display, crtc)
>  			active_crtcs[last_crtc_index++] =3D crtc->crtc_index;
> --
> 2.43.0

