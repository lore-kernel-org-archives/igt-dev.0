Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4FD0BB5B
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 05:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77BC10E0C7;
	Thu, 24 Oct 2024 05:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flTUQWrC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5520410E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 05:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729746004; x=1761282004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ClCYlt2B+38v8Hw2eGGvX6ntzZaFSQvYjDZncRJz/eY=;
 b=flTUQWrCtRYgy+kr/JYG6gdBoyscCrSeDfxDomPl9/YGeUXkDpmPKLZd
 k3/wJWBZurClM7mo/sYDZANBF7ZGxLDcThlKAaRUaRIGwd0dy0HcczGDj
 ohwYNmDsw9QENriKiQw+W2++eFn8yVkkWXCzypBBIfcvsLezNc6PXZD1O
 h2DK14ZLhJDYaHmWS3FSiqWiINxsVQP/BrNi5FUYFpwCTWj4uFbdWyYG8
 pSr8cVVRjlEDD8jbIsVe4OIOYdyap/hQx6LnB2jZdqbAaLrEJ/C552kJ4
 rkPTGiCEYBMnBNIytW0FKersKU6Zj5LUoNib73ZMfWVidE8UVzJGoDMcM w==;
X-CSE-ConnectionGUID: tNoYxu5ARFaDROaxfKVBtQ==
X-CSE-MsgGUID: vV/ostGgQme7h1BOANOGWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29221885"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29221885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:00:03 -0700
X-CSE-ConnectionGUID: 9L674ohKQXKp274/M/EdTg==
X-CSE-MsgGUID: 6wHisKjvS1i/5MDFdxSfYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="111324298"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 22:00:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 22:00:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 22:00:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 22:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOjj2vlFBnhcX6VwrSNNXSHGp8AR83RS6Pg580JBNfTuH3Mm8t7vVT47Z0SXSnvzUO6M6mhgYeWgMnbMyyZtBK9XnB70U1cb/59TFzA+6K8hNjlm2A1jvHHPIen/ttJKrtzSYD0tvQjDlEAK15jm9VMgJIQa2gFOL6eNN5LaWJ6TSLEDOVUJPt3qAoGRGfYDutXM2FcDfULmOE9jySB2S53xnOTiiatnnN0z9YGXIP6mPnQA8HWC0dg1JTYCOHVNLi9RloEoZ8P0u9MsaV+qvU9xn6N7CxnWgSBeiTMLGoxajGJnaewQiS/tql7jjpmXbXyjQOsNdgrwUuOkqPaguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WiKVlpry6Rg2xpqVQY/m+dTAvOulKxhAL6Hyle6u3c=;
 b=pfSHnyFf/ZbdQg8+1xya0NKQONfzuRxYm/vuHsxetUraWgAFL+MvgKjDAxMsv/mqNaxiSikgdnKKca2G+X3GFr4+to4lNCYeDotOyVSg3LzcLWuLyPZ0H9sKyCsFNChBkVv4QzeC+rxPkBySH+uts5zuL26UQ2+kfksGb4IoWEY3JIMXHD6ofLzekYWAsbgW7MEzbJeh9sBTOqy5w4mvfKQWxJ6LdJ65wVnmLGIq9I3PTTHCuiwaROYNotC0QfZujcI5KkGWgmiRby+lwXYCGv2MztSV0u8pTtBEr7tayftlki/feKCnksV9TXcJaxbWb2VPNYyPGKiSaR+2Dy6lww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Thu, 24 Oct
 2024 04:59:54 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 04:59:54 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v4 3/3] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v4 3/3] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbJdDhhAsWtEy4PUaGlE/rsupxI7KVV1pg
Date: Thu, 24 Oct 2024 04:59:54 +0000
Message-ID: <SN7PR11MB675044951F6419D57B307F65E34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
 <20241024045212.1697869-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241024045212.1697869-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH7PR11MB6427:EE_
x-ms-office365-filtering-correlation-id: d8166ea1-81af-41ea-296a-08dcf3e8b303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mm0ifHldXYO3/8mGzMsimrh2lSvbND191RThoaob1b8HhE4sDzdqcCg0LOiZ?=
 =?us-ascii?Q?ro8aGL4kY/bR07lU2yEndWNaRBVwPVKItI1SBdJSXBw8oOBPppkZq09vcRb9?=
 =?us-ascii?Q?+qzqiZdvAqd8hG+udI9Dix596E9SzwuG0OCmR8FnYtb58mq+HPz+s46kNrU3?=
 =?us-ascii?Q?qCWELU3JYJbnHn1BQiggrwMhNb88Hrtut8PjcmB0V42PZubbdF6HGxJcWHcH?=
 =?us-ascii?Q?Ds2BF385s7wGDgBGeZqeynmrn4BaJvPDQsbtYM9Cj0jtafoKalw8yw7Yl9hz?=
 =?us-ascii?Q?9KRLZcgOeiLR/fCHipPIwv0mM7AZaCrWBot27PG0O1mhnXcOdxIDQMBmSwfn?=
 =?us-ascii?Q?LAcVi86DW5zMBdCPtntkFtjSCu7bNSxMwT8kNKrU1M0XvG/FE+5PYrlUZYTK?=
 =?us-ascii?Q?xgvWa0lTusX3enNUAy+IPMSofhVUx8xldkKO8wrYQWTs5UMoP1N/rXdENm36?=
 =?us-ascii?Q?sB3UNQuguqze9qjNmTeKqHP1/iRFhtFXO8aYMFriZ1EUlsQlPdXrexLX7QLg?=
 =?us-ascii?Q?Hmvk5Ob0ilAKYdfqZNr6KQfru/jPSa6s8nAwzpCxaUhH/IsRMU+SFAujlulM?=
 =?us-ascii?Q?gK/xo4nuibR3b3zriZbnWyuLIkDmjl4CPsOoIG9m9fGdAKQC1lsX4WeWXldC?=
 =?us-ascii?Q?/O7vWpb391MKL2vtiX/rRle9BruL6JhgydX4jNJaBLNEBl3G9oGLOCS2RyzQ?=
 =?us-ascii?Q?Cgu3dVVcHFEgecqz2J7ojwLOqxyh63pYGuI96bGGo22uK6DGygkohZ0vdYDC?=
 =?us-ascii?Q?Jatvmxrye6Ifb2OwLqUUIVTjhrQ8o6dIIAsn/GDh10ehYI9zn0omS7kdk8Tn?=
 =?us-ascii?Q?z1jCI2uBysxBjetUk9X/pMkjia05ur6qJBEovoSJ9bMabJqqEzq//KvFvroy?=
 =?us-ascii?Q?HRc03qqkXGOSwkk7BdoYNZ+GjXoKhbY0vSPgqdtyaN0oBINGfQoLRAxOzs7O?=
 =?us-ascii?Q?j2XFYoWVmkQgwAZsP/yzqyOkCuerWwjHcax+nAMLF2sTC/biCLX+/zpo745J?=
 =?us-ascii?Q?OyZOnw781zvNmjMJJLFlngI37GKhgKspqu+RhEh03BbJ0/zgxYfGBtUAGZdx?=
 =?us-ascii?Q?hYhJF7KhrVx5h/pcxw0S8N+4WXV+AxNpCP78xxPbjO8ztjJowvde7P6FUjGC?=
 =?us-ascii?Q?9BNbs9SUWLN8qTfYgJK1vTTmSVNW2X3E8voC+rdpqnYKRx1Hw/t4lEqGhYGE?=
 =?us-ascii?Q?nHhQe7Q+APlKhuDn6+/SzyS894Gz5WAG+1saOxAgXQanHvZOY14AqS/6j7OH?=
 =?us-ascii?Q?SiPxwojFAd7iMfTnB6v8PV1SSP2Z1S0ICbiDqf1ECxKcww6sJFVdITFQA/6b?=
 =?us-ascii?Q?OUhoTTS5z8mq36pRqmM71nT30aCnl6eCaqUsPL/qZcvC/4VqdNK5kioRAYVp?=
 =?us-ascii?Q?yoW5K44=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7YT0bpdBQcVJozWYVG+pM0gBbSK4uXs/852I5WBbx9aGcW02MNG1qc1evA+Z?=
 =?us-ascii?Q?T7IvHzeq6bNvk5u/o9+WC8r6lB7e7xr971sKBot8Anb4t8EG42egxmHSJa9i?=
 =?us-ascii?Q?8Diq/5QqPCCERm2M7Qu0IuwY91BBvKuLuC7bzo2JcNnuR5+ZQVMvry/79BQN?=
 =?us-ascii?Q?1zELl+58CdY62HamSJTE6lf/8WB6bT/3K8d780uVUGQc6tE4exMSkwuBrLPn?=
 =?us-ascii?Q?k0TaRrjx3o9Y3d/mjXwo2RU0thiBBQlQD1fnitxlxKReFd5IulxeD9X3blDq?=
 =?us-ascii?Q?zTyflTBsBsOxOs3XWKPsaQqUiRLF+HEVsUzFNPksbnIEakLt1d9Ad0ieRzxT?=
 =?us-ascii?Q?P9A/cxMQkTAYH3quBpImWV98M7/IrY6l7ZgClNHUVsQeliSofJDfFc2BkfYr?=
 =?us-ascii?Q?8/Pvlip9DfrmEYkB/QleNOiecbHDT492lSmZPQINCGXIfsHyJH2ohlv6W3UH?=
 =?us-ascii?Q?QFUCeFOOxGHyxTj5hnqhtg/RiPPIuh4eQGKFTxrPsymYRJYPrBm9G1+4Qxe6?=
 =?us-ascii?Q?DAnpKHBg4tMKBLb1Q4zQA1maovNDJgXpXPqxdh09logahOc9XCoBxAUJDWR1?=
 =?us-ascii?Q?a69Nh6UGkQvqMbJzVDeNn3fQ6X6JCiwD9wO2IhW+YyU6rb5dUilDg0wVgot7?=
 =?us-ascii?Q?sba0RiYdMzLEf7XnChdqsw7yVvfhX4Z8CBsblaR4uCIYBYbWh1slXbHFxVSM?=
 =?us-ascii?Q?Hkk5C3lYbDpQDa7yReOpt9aWnHsRFXYafEgllw11nuD0WM17SaxEAsBgpvxV?=
 =?us-ascii?Q?7brHodb/bHiVPf4UnH23KKcg7qvv35Z5FbqcYaPpWRCx4TUEuaw85tSPchV0?=
 =?us-ascii?Q?IjzsTqpDDcUW5bxxB6GlhAONVFeovwCZF5YtjKn75rXYec0T+vFj1A6qz+WZ?=
 =?us-ascii?Q?2LwXUlYcFghWTsTVKO+NxnvJHREY9tfj2KvAPJeQ/jt6TzuFKvPFEK6RUeso?=
 =?us-ascii?Q?thnvimAnDM/yyjpbmEMpTsHclDFchYROt1pWiJz7p4rM9USHFJqXOcQVbaNj?=
 =?us-ascii?Q?DhCoYyhpmR1NvE+NTr/Zik+IBEQnDDXSf3C8a5kd3WxWGCkHgTvt7fYfUjYv?=
 =?us-ascii?Q?zf9DXyIWpu4QGnIJb+rbOr81amkkNx6/ljZ04+bjQE0Yn/FK+CsY1wBkf3de?=
 =?us-ascii?Q?tvRYo9ZmpRDKb/deHCv2V5p3OnjwgplZJIoVCDljJjru0Cz3EOTL/Jgvqx6D?=
 =?us-ascii?Q?+WmLyAJx4PieLR6w3bhQKTAaIgqZ8kkYAhX/OYjUIcKZpaiOXuLlOo0A/vT+?=
 =?us-ascii?Q?QGS26TryWJpuyPdcLiXVpR+6iA9VtGbn1qBkmqUkhY4xZiGgDyHmHwqgE90R?=
 =?us-ascii?Q?/sx7iSDoN2mgbIIqjuwYilf1SZoMnE8d5/5e7rGrTjSUB0ufjB+veqQI1tFA?=
 =?us-ascii?Q?Sxaaf+07hO6UcXKL65n8qtrznm4A07yruyOdpE6iX8mL+/1xShrEOlThTnLT?=
 =?us-ascii?Q?BMi0C9lNHAaaQFcdht4JLh51XXILL30N0mDbFqarO9VLGIJJcpCZ1u+VaNB0?=
 =?us-ascii?Q?iVEtrS/o6SIqZPmH5IYnV+kyE9XIWs3mdrKzREf4DWr+nekw5NbAGubKHUMP?=
 =?us-ascii?Q?xw6gnJci8nI50M1LSHrj+w1QxYRg8KsBrgEq6X6t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8166ea1-81af-41ea-296a-08dcf3e8b303
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 04:59:54.0840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFz0mjeeSBQ/J4TX78JMF4g/v5ezz3+xG9JjUqgTUECV4AbWDwlfv/qmcGgbTtwoJiHiatJXdIfMwOG+3DKCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
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
> Sent: Thursday, October 24, 2024 10:22 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Samala, Pranay <pranay.samala@intel.com>;
> Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v4 3/3] tests/kms_hdr: Test brightness manipulation=
 in
> HDR mode
>=20
> Add subtests for backlight control on hdr enabled edp panels by changing
> brightness via sysfs.
>=20
> use igt_backlight_read and igt_backlight_write from library.
> v4: improve the test description and cosmetics (Suraj).
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_hdr.c | 42 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index f123c6b36..b67902d43
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -64,6 +64,10 @@
>   * Description: Tests static toggle with suspend
>   * Functionality: colorspace, static_hdr, suspend
>   *
> + * SUBTEST: brightness-with-hdr
> + * Description: Tests brightness with HDR
> + * Functionality: colorspace, static_hdr
> + *
>   * SUBTEST: static-%s
>   * Description: Tests %arg[1].
>   * Functionality: colorspace, static_hdr @@ -81,6 +85,8 @@
> IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>  #define HDR_STATIC_METADATA_BLOCK       0x06
>  #define USE_EXTENDED_TAG		0x07
>=20
> +#define BACKLIGHT_PATH "/sys/class/backlight"
> +
>  /* DRM HDR definitions. Not in the UAPI header, unfortunately. */  enum
> hdmi_metadata_type {
>  	HDMI_STATIC_METADATA_TYPE1 =3D 0,
> @@ -100,6 +106,7 @@ enum {
>  	TEST_SWAP =3D 1 << 3,
>  	TEST_INVALID_METADATA_SIZES =3D 1 << 4,
>  	TEST_INVALID_HDR =3D 1 << 5,
> +	TEST_BRIGHTNESS =3D 1 << 6,
>  };
>=20
>  /* BPC connector state. */
> @@ -448,6 +455,28 @@ static void fill_hdr_output_metadata_st2048(struct
> hdr_output_metadata *meta)
>  	meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
>  }
>=20
> +static void adjust_brightness(data_t *data, uint32_t flags) {
> +	igt_backlight_context_t context;
> +	int r_bright, w_bright;
> +
> +	snprintf(context.path, PATH_MAX, "intel_backlight");
> +	snprintf(context.backlight_dir_path, PATH_MAX, "%s",
> BACKLIGHT_PATH);
> +
> +	igt_assert(igt_backlight_read(&context.max, "max_brightness",
> &context) > -1);
> +	igt_assert(context.max);
> +	igt_assert(igt_backlight_read(&context.old, "brightness", &context) >
> +-1);
> +
> +	for (w_bright =3D 0; w_bright <=3D context.max ; w_bright +=3D 50) {
> +		igt_assert_eq(igt_backlight_write(w_bright, "brightness",
> &context), 0);
> +		igt_display_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_assert_eq(igt_backlight_read(&r_bright, "brightness",
> &context), 0);
> +		igt_assert_eq(w_bright, r_bright);
> +	}
> +
> +	igt_assert_eq(igt_backlight_write(context.old, "brightness",
> +&context), 0); }
> +
>  static void test_static_toggle(data_t *data, enum pipe pipe,
>  			       igt_output_t *output,
>  			       uint32_t flags)
> @@ -483,6 +512,12 @@ static void test_static_toggle(data_t *data, enum
> pipe pipe,
>  		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown
> EOTF [0-9]+\""), 0);
>  		goto cleanup;
>  	}
> +
> +	if (flags & TEST_BRIGHTNESS) {
> +		igt_require_f(is_intel_device(data->fd), "Only supported on
> Intel devices\n");
> +		adjust_brightness(data, flags);
> +	}
> +
>  	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
>=20
>  	/* Verify that the CRC are equal after DPMS or suspend. */ @@ -685,7
> +720,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>=20
>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe), output->name)
> {
> -				if (flags & (TEST_NONE | TEST_DPMS |
> TEST_SUSPEND | TEST_INVALID_HDR))
> +				if (flags & (TEST_NONE | TEST_DPMS |
> TEST_SUSPEND |
> +					     TEST_INVALID_HDR |
> TEST_BRIGHTNESS))
>  					test_static_toggle(data, pipe, output,
> flags);
>  				if (flags & TEST_SWAP)
>  					test_static_swap(data, pipe, output);
> @@ -734,6 +770,10 @@ igt_main
>  	igt_subtest_with_dynamic("static-toggle-suspend")
>  		test_hdr(&data, TEST_SUSPEND);
>=20
> +	igt_describe("Tests brightness while in HDR mode");
> +	igt_subtest_with_dynamic("brightness-with-hdr")
> +		test_hdr(&data, TEST_BRIGHTNESS);
> +
>  	igt_describe("Tests swapping static HDR metadata");
>  	igt_subtest_with_dynamic("static-swap")
>  		test_hdr(&data, TEST_SWAP);
> --
> 2.34.1

