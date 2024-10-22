Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C740D0E6FC
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 04:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D516E10E1C8;
	Tue, 22 Oct 2024 04:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmQlWGW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FB510E1C8
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 04:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729572579; x=1761108579;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T+tCvv2nfWIN79Gtu7XRfii1Xy4e1gHNKDGMZk+uj8U=;
 b=EmQlWGW5FqPuV/+0VnYrSAn9geQ5YDkvt+jJb+sGUKhQVzgtLotCk4Gb
 VI45BgNKHzUuq99BPgft9djtVx0hvLTBDCYaUIgnaanZq5wqvvEojBgcY
 V/TSyQnJ1b79wdY37or+kC5QOxkmVab+GdkK9Js0GkvvgcXI3h5TdQ6CS
 +h2ipPmSq1xFM6jx9NrzopPME7m35b+1C3WC/BOVEj+02zO/PCbOGQAMM
 g28pb//xMYbAN++ubq0jmXPbBbJ38slApFLhZxoZqSks0KjAWNZaJjBvg
 c//qP9A/o8+z6cOETJB7LwcXn6ko/6pI0ErLOZtoR9pPE4gWG+GEQfpcW w==;
X-CSE-ConnectionGUID: ES+mA2HYQ4uArBd/NJOoYA==
X-CSE-MsgGUID: FLNYO/ivQmKjr+XBxkEnjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40204248"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40204248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 21:49:38 -0700
X-CSE-ConnectionGUID: laK6g2gWSUyA0rJ56ghuLg==
X-CSE-MsgGUID: 9Zuwzm2jSt+AA36LZzcM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79308242"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 21:49:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 21:49:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 21:49:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 21:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGNt2z4ZyNfuQ9L2rbELqXTE/NGakBZ7i4C4pVKjGf1YTLhAv6jbSgOGHr0G4fUcIuJkCEDCUQGear4EeH2rAiL2sL+ACpCfnMVf5kclvlcYHSAd1FbB0ADnVtw20kt9cbuLqoXjKW1gjXE8SH6tDCZRuGyzuLFx/XwABW05vg1kxMTNlKC+DpoTF3zGZj57LSGQQPy2YHkyonac8Wl7XSTcjcbhxk5DJhpAZAIhVcLD26fTDgehIbFpCAdSQYAHW/an+Iyc45cAWWKvVeK7qJxYPmSS24XhnT8gXJbpM3poNRLNa+cOOfPnssYdT3p2wG9ih4l4cjeH6IymGMWKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNpCI2x/8eAhSVox4CGFcH5PSOZo9WwsJaUdy5MdBlM=;
 b=YPl7EimyuTQcy7lnnflt+9P67MYMzLohHqqoEo1Jn9n3BxyGqWdn9SHxQvKSV0uqA+k5YjQRwcW7EZjGaVXDZDg5O8IbCc5rYQaepLRLYRTbqBTL4SKi7sRea7xe3SStra3j4cEj3lG8IFgO+/YBdp+6h1gmXzi3+TdEeAExb3+3x6/coOaDFOGVkUez5T1zbyV/Hc7CScMVyCKN97FWDm8WHNAUTTl4U00gA11zMuYddz02DwvT5GKyL8ThqDwUb0VTyMjpEfKjqyyLqq0UQXSOsTSFxArAiGQkM6QTr26h3i3i0JH8NfJHN9YsToY340hM/y5lla5RbC4QWVGmMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 04:49:28 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 04:49:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] lib/igt_kms: Move backlight read and write
 to lib
Thread-Topic: [PATCH i-g-t v2 1/2] lib/igt_kms: Move backlight read and write
 to lib
Thread-Index: AQHbILgOHKMpxePi00iYif8QcgIkmLKSOeMg
Date: Tue, 22 Oct 2024 04:49:28 +0000
Message-ID: <SN7PR11MB67505B043FE809C99D770111E34C2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241017171223.533843-1-santhosh.reddy.guddati@intel.com>
 <20241017171223.533843-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241017171223.533843-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ0PR11MB4845:EE_
x-ms-office365-filtering-correlation-id: d0047a32-471e-457c-2339-08dcf254e95a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hLv8hoX118WHLJrn9g3xBZzBkNExMKQR0YCggGbRV8y/nqT/2doVIHLe6k0Q?=
 =?us-ascii?Q?Ar0nJJ/QVRN2CnOdmf+sYgPmIx1R/YQcds7MC/KQWASUSqs/wuxpn0gPfwM6?=
 =?us-ascii?Q?3L/2tDKoiv/b/EUruNfz5TSSB0zLg6weKnO9giFX6ZyaJSdged+jWw9WnOMX?=
 =?us-ascii?Q?DUtmZkxbFpPNaucQW9KIrmyBe9z11+9AUmIAWci8cJLiE+TIzj6DyaHh35Zr?=
 =?us-ascii?Q?UtYXdIzCyo8JVaJGzvJ9rEVyZZTJVuDDag/yHsstnPIdW2Ne8VhxVqe3dPF9?=
 =?us-ascii?Q?YxPFwZ19ERMBP6lzpLDyjTHdbdUAuNij+Q46amoMiO3k2J3TM4yKOl7Reiw1?=
 =?us-ascii?Q?NOsu84EB2jtQB/LFz21IxFk4JspHS5p25WvcbMklR6VUIDKWosX7joo75nMX?=
 =?us-ascii?Q?DfzsNmDPrEH5dqWCTSFnyyY99FCVTaEJuBAlh5j1dP8DUbZiRq+gqXx8X92k?=
 =?us-ascii?Q?Ma7yV7+GArTj5I8meJbi5ANz7V80AvzZmK+cPLfJV91B2pANZ5YyBaHc9ZTm?=
 =?us-ascii?Q?sQLqfn7hBe5GSmJ37YxDI4oMI9jATYbzp2Ghsye5JrCTvxdsFHBWL4sDhgat?=
 =?us-ascii?Q?hKM3BzrrgJ+0ZBrHuwVoCfeOcDnvVSUXfZCHDkyrVLaLu350fTASOW/N/wiT?=
 =?us-ascii?Q?mZXcaPLOb8fRenA71S332hN/+42wAQOQmCHD+ktGutKMbBW0P5OErglTfSUp?=
 =?us-ascii?Q?nyAmP+uPneWRc8rKKOMG1JH8b9BXtK16czNTRT0/V2+lnu+mlh71/rOyB+vA?=
 =?us-ascii?Q?EYLDxM6tdmxFheGFuWDhIXJl9jqmmr5Vyvqmor7BTDHsP1rx8ktMYdZ0LFxe?=
 =?us-ascii?Q?VNU6+xOhHXtxtqNbVAtbUWBgtbFrgkxT1ySBQXOFk2gyvpOh98af14h6xrgR?=
 =?us-ascii?Q?1bZ5kXHyLLtS/DDRAXSpnl/7o/CYxJSKNWFyvNAId2ogEvE4Qbt8QmX4zlqe?=
 =?us-ascii?Q?1fgtdHHO/58S/fPqjylzee7IoX0j2nt6Bs5iTtSeV2VvrSQ3eVGz4skyXb4f?=
 =?us-ascii?Q?04fSi2T99837wDJ+6V39EnOYNo5Z2tXIsTL/gJZvNyX6b5YxouIDJvPrPy2n?=
 =?us-ascii?Q?AYrZZhgQtG9gXu5VhEfx2hhM9Hh8kBj0zlkc39jj/Cm/3PnWe0Lae+sroUIm?=
 =?us-ascii?Q?j2Q7ogk5V8WGM85FpJ0dBcSeGH0EpdiNF8KTKXkt6qBZPzyQbdaLmW8TY/2C?=
 =?us-ascii?Q?dGdwdc+/B4t3fHaUmAoZqPhixt8tPxNtK+iu0Pt/UWNeOw+VzoTw1kwWzPRc?=
 =?us-ascii?Q?o1bHwxhuMmVmPep09YvvdHlFAUC3NHulBxJCX/h96yrw2IU2poQ998JoyzW0?=
 =?us-ascii?Q?GbhYXDlLwEBOmf3JpGfgMiSX8R6+GUXet7rEvj1FNONZTMZj+IyGmsbWR6Wa?=
 =?us-ascii?Q?BaAPXxg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JPOHREFhj+K9+Pj63O0OdQD10o7OV6q+FIpB3dxYHoNIiA9gyxxATX+vb7g+?=
 =?us-ascii?Q?zDNLaNARg30P/DC4zbhSIqu+P8E4k1zoufKoiT2FnSTjbcEkbviz2prmyP00?=
 =?us-ascii?Q?wsu08VMIQcjCOyTWipbyEtDAQwCe76lhsxHmbUz3GLfNklo2iRWLUoq5b2bx?=
 =?us-ascii?Q?aAZT8eVO7BA8Nw7KdJ3qIY90ViyzmWuOF1wFTk3QNb08Fj3Xhcp3vZft9PtQ?=
 =?us-ascii?Q?1x9FqwfMn/I9kCogF9WJL91rKp9PQdNINUC9bfbZjKxxH3dlpR2v2IXl/5Vz?=
 =?us-ascii?Q?LGmBw6917GgtnTeNhTFoafJxkprlbAyWB61dUCR0876h3tKKDinbhRtLppBV?=
 =?us-ascii?Q?rXZF2Yxj83tvgwFD2SAN7xGVrwGm8Vanvf3Ok1w1lm3bt+s8ZWEGMnVymKdO?=
 =?us-ascii?Q?dcq/wj7POWAzbmJpsRbu6v3ywvRiTWaXSZusM8qjG9OhD6yM7CzEDYg/4uMI?=
 =?us-ascii?Q?lHYucN0CofChiHrKIsgE81v3UZwD6WsHrXeXFaHgNOacl71B0SF5Yoyw8Xgf?=
 =?us-ascii?Q?IGdZ8xe3PCjDEa2PH8WXJ2KWqSGUrdyR+hBYRV6e+hWIrWuQmEKgL6HG6BDI?=
 =?us-ascii?Q?Tt/JsjT/4qKh5lqu338DfBsMTp1F/m+jf7qMForN1sg3HvAqa6H2PlBMWXcw?=
 =?us-ascii?Q?pl9Fhno8gekn1zKEQxw+gc9y3NwECD7sr/PttR24KfV1PYUm4B4sM4EYmI9B?=
 =?us-ascii?Q?STxXJFjKgwCGvk/qqw/5QM8rSD1SMlIbo96UelfnbQQAht8Z+bShVZkwMihX?=
 =?us-ascii?Q?UBpUApeOjS2m2ya3O1CB8WahPDh+NvrYIq4ZBmX/dC13Sq6ES0BJ1Ccbulit?=
 =?us-ascii?Q?c8bjrx7mG3vPIRIo6QO1okfkTTKU0J29auPLwYEQRqq6tXKOSYNcmuja1nOo?=
 =?us-ascii?Q?/02zY/6ifDyQXwzouF7qGrw9IEQMfuc4I0zOrPFRYH3JbhO4OxUQ99nIO8ji?=
 =?us-ascii?Q?RV2YArdDTNx7xkP2KqtS6lyS/vZtj/0DFCohdq/0zdZwegJomy/pc6qYVH3T?=
 =?us-ascii?Q?LOlP7Xdg23u0c6Tjuk8B7Ea9iVKx8XXb2DgJ8e8/4E69LCIMEACsXihXUqOF?=
 =?us-ascii?Q?arBBXd6X5sDlDCOVL2yDieVTDg+H/BbkR/G05cPQKOvXmy9C3doNRM8KBHR3?=
 =?us-ascii?Q?wE/Vm4VfW8Ncp+4fUrmUU3KZSotwNQFa09ooNy1B/POPbw4ZThv1wTwdTPkD?=
 =?us-ascii?Q?dnDFlZZkrk7ol5TlQ2TyAMBxJs+KrnKKFHM0fqv7ufnIrxJVLOgeTjGEf0ZF?=
 =?us-ascii?Q?jQQYUIKDiL+00XIjytPg4R0xHdDhKreKhlmQdCEwfAmuV2OW5tXxpDAhW1OE?=
 =?us-ascii?Q?Lst4NekiIdSWEzM6fSGfkU7Bq3YzypqL+8jgy+gVW9aTi37411lPVyvm77a6?=
 =?us-ascii?Q?37sDKAldKNXRAY0Wba5lMlU+OHIH1i6yllqnLBOWz0oQw6BIlqTqlU/0k4B9?=
 =?us-ascii?Q?3JKmO6AryX3dNRCcD6naxZeP0y13N1ZUHdz0iLwzfUQxfatOniPshPc+DUVy?=
 =?us-ascii?Q?rFTbvqRA5NSGFBAO2hyAQ4VkkiVfcixsMuUBw6MHf5+yZx1mdKhKOEItjb9J?=
 =?us-ascii?Q?XxApgRdTrC5EPbEr1bFvdTQgqSXtEUvqySrekFdk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0047a32-471e-457c-2339-08dcf254e95a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 04:49:28.5784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Al51v+ax1KN3gZ456XmQSgS8t+7BQ/+4gJeA5Bd1zTENE2/DXXk4mNTM+2e6VGcXTKY0l8PZeDNS2hnjWUjztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, October 17, 2024 10:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Move backlight read and write =
to
> lib
>=20
> move backlight_read and backlight_write functions from kms_pm_backlight
> to library to reuse in other tests.
>=20
> move and rename struct context to intel_backlight_context_t.
>=20
> v2: Rename backlight_read to igt_backlight_read and backlight_write to
> backlight_write (Suraj).
> Add a new member to intel_backlight_context_t to cache vendor specific
> backlight path.
>=20
> Signed-off-by: Santhosh Reddy Guddati
> <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 66
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h | 12 ++++++++++
>  2 files changed, 78 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index bb35d4b82..b85b38023
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7119,3 +7119,69 @@ void igt_reset_link_params(int drm_fd,
> igt_output_t *output)
>  	temp =3D drmModeGetConnector(drm_fd, output->config.connector-
> >connector_id);
>  	drmModeFreeConnector(temp);
>  }
> +
> +/**
> + * igt_backlight_read:
> + * @result:	Pointer to store the result
> + * @fname:	Name of the file to read
> + * @context:	Pointer to the context structure
> + */
> +int igt_backlight_read(int *result, const char *fname,
> +intel_backlight_context_t *context) {
> +	int fd;
> +	char full[PATH_MAX];
> +	char dst[64];
> +	int r, e;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> +			    context->backlight_dir_path,
> +			    context->path,
> +			    fname) < PATH_MAX);
> +
> +	fd =3D open(full, O_RDONLY);
> +	if (fd =3D=3D -1)
> +		return -errno;
> +
> +	r =3D read(fd, dst, sizeof(dst));
> +	e =3D errno;
> +	close(fd);
> +
> +	if (r < 0)
> +		return -e;
> +
> +	errno =3D 0;
> +	*result =3D strtol(dst, NULL, 10);
> +	return errno;
> +}
> +
> +/**
> + * igt_backlight_write:
> + * @value:		Value to write
> + * @fname:		Name of the file to write
> + * @context:	Pointer to the context structure
> + */
> +int igt_backlight_write(int value, const char *fname,
> +intel_backlight_context_t *context) {
> +	int fd;
> +	char full[PATH_MAX];
> +	char src[64];
> +	int len;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> +			    context->backlight_dir_path,
> +			    context->path,
> +			    fname) < PATH_MAX);
> +
> +	fd =3D open(full, O_WRONLY);
> +	if (fd =3D=3D -1)
> +		return -errno;
> +
> +	len =3D snprintf(src, sizeof(src), "%i", value);
> +	len =3D write(fd, src, len);
> +	close(fd);
> +
> +	if (len < 0)
> +		return len;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 2b26d2bbf..3546aff72 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -33,6 +33,7 @@
>  #include <stdint.h>
>  #include <stddef.h>
>  #include <assert.h>
> +#include <limits.h>
>=20
>  #include <xf86drmMode.h>
>=20
> @@ -513,6 +514,15 @@ typedef struct {
>  	uint16_t tile_h_size, tile_v_size;
>  } igt_tile_info_t;
>=20
> +/* Backlight context*/
> +typedef struct {
> +	int max;
> +	int old;
> +	igt_output_t *output;
> +	char path[PATH_MAX];
> +	char backlight_dir_path[PATH_MAX];
> +} intel_backlight_context_t;
> +

Should be igt_backlight_context_t now

Regards,
Suraj Kandpal
>  void igt_display_reset_outputs(igt_display_t *display);  void
> igt_display_require(igt_display_t *display, int drm_fd);  void
> igt_display_fini(igt_display_t *display); @@ -1253,5 +1263,7 @@ bool
> igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t
> *output  int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t
> *output);  int igt_get_dp_pending_retrain(int drm_fd, igt_output_t
> *output);  void igt_reset_link_params(int drm_fd, igt_output_t *output);
> +int igt_backlight_read(int *result, const char *fname,
> +intel_backlight_context_t *context); int igt_backlight_write(int value,
> +const char *fname, intel_backlight_context_t *context);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1

