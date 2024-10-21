Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C98D3C53F
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 05:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAE910E229;
	Mon, 21 Oct 2024 05:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvKxG8W1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD61C10E229
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 05:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729490335; x=1761026335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OKyPa17JvyPNG7qog2tr6OaHVrQKH6EVD4SwvDvQerQ=;
 b=DvKxG8W1ZELy/xnw1ksnzLazUagUmv5LVxsmegIB70yUoeCKgmvHq6HI
 SfzbFMPM1aqz8grrr6C2UZzajQcgjq+XEEry5oJq9fuP+6au/9b2UZoFO
 6D8l/+mi2GMKXbrBDdIMEnaTIzgEF+7QvaynIbcjAvnkzEilSvUEWKrXa
 mJJOZAK4xqaqPzkB4lxdtEDQQ/JwBh3bHoquMLXQzIDF5iz0VWkKF6Dv5
 FSoBLS/7qWmn6/2MMKQi7HGbmUppm1iCeftZWVPYyzbo1XkU9ZrkQBarF
 p98LHJRW5e7flj7WV3ppRv1d6XPq84cfr+GNm1JNCYRPQXl53qBRTan63 w==;
X-CSE-ConnectionGUID: 9TncOhSRQYaaUnJiLp3sMg==
X-CSE-MsgGUID: vgA9Z1RLTRydmbWzs5DySg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32874399"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="32874399"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:58:54 -0700
X-CSE-ConnectionGUID: QxXSQNwRTG6drSUxKk3z/g==
X-CSE-MsgGUID: mV7rZuqdQ6GHerWRKW6+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79434307"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 22:58:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 22:58:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 22:58:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 22:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZNz3nu37yyfvXJAAdp8yF5W3EAzjKfrwZNy+tP0YcneZsRLwkzBvAOOr97Yzb0gYq93ovfyKGAKeLU9zIMp5Pcrix5ZSgg+Kz6XNIB852ZHm7AbCg0/XHPwynmg+1+uCuHDWjHcsFdQq/MrmwoMcGDokns9mdqTor5tPr4H3pLegXFowOO6NrM1fAysXRdroXZxk/m3e7oYn0ZqVDfjAFff/h1STWN3gd94I6b0TBvlsDI6dwnIkPC2f89B8k0PLVbutqd7FffaWStv1IpUxwGLOk+IbAiHZZ7uIYssMgxQDvNPiG5C072BFDdArrxjvZ3UjOw56ChmdViBoZ1WxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh3qbEl1fKUT0E6HqWDnQlV3mZIqtJm0ElcSCQBicpQ=;
 b=wGno/5KTYbX1oLRsYeojnCGSl1BkfPBrmqO+/j6iOyArBylvAUnagknLkEZZw/pkHVQb+usyHInFF2Nh9mZPdnvyrDLZGbdDqhTFfS77QjldLjuJ273ggP5dT3RbfvTP41ekrF86jcsgIw5Oo1q8OVog4mT8i1AMq2/ugXTtbPLqx1m9UldoKX8e+qxNYPXUuxoUQERxLfcIGGI71T9rKBwYsn+Qw8DDgBB9DBV0PdHt+yxzVEIS4xdJAeHqi87OdQ9jo/knLF3mWGlR5QP5WCQuUlzEMb4qPfCx8pN0vJV4qG7xiBKPIlqjDA7HfYFEla6cTm15qZM/Z1Nii3FvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Mon, 21 Oct
 2024 05:58:50 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 05:58:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Golani, 
 Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Reddy Guddati,
 Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_kms: Added library functions for
 aux-less ALPM status
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_kms: Added library functions for
 aux-less ALPM status
Thread-Index: AQHbC0AtCEG3J/odeE69pTK1PAplmLKQ5grg
Date: Mon, 21 Oct 2024 05:58:50 +0000
Message-ID: <DM4PR11MB6312B90DFF3AD3A07FB388F090432@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240920094521.1222304-1-jeevan.b@intel.com>
 <20240920094521.1222304-2-jeevan.b@intel.com>
In-Reply-To: <20240920094521.1222304-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB6744:EE_
x-ms-office365-filtering-correlation-id: a271ad52-809e-4337-ebac-08dcf1956fa9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?erwVUYftzzEa0yikzGQyw7IEEWjgdFiVsx9/s/ctYdC4QMtvPPkNENaSjO9U?=
 =?us-ascii?Q?54181kHNLm/DurGdRuWM/mhwsWFjqD7bFYkV3xtuL9S4Com+I7E8tYrkGfdZ?=
 =?us-ascii?Q?gemcGprx4lDB+eWw0uuZ7hIxA38IH7/nW4LbUoIIDaNy9L1yzRgXLi+YcoX2?=
 =?us-ascii?Q?Obk4BkL2G/F8oeNp5OCkHGUC5Z+2UIOx8BkDZQPxXDZLJLE2IZJfWEnSxE4y?=
 =?us-ascii?Q?1zIfCog8eBZa40Z9L/1eYeChPgn7ixurBlFEJifVISIjnfqoDEZtYCBXihLt?=
 =?us-ascii?Q?U2ZQ1O+3zdXMxwcEWqAQleOOwvmy35QDTfDSqcvk/8zQ+3s80WFvorjNEM2H?=
 =?us-ascii?Q?qRZl8rTk5x87UlAYjdNrsrhAqS9sFmFdOG5WlWrFDpR9L9xqGgV7WDT+sekE?=
 =?us-ascii?Q?eXPrnor3kA9AY6jzpbxAiWr6zvAl6o2V0+oGZ8j+kt1aANkIcFtOaQCDGBxG?=
 =?us-ascii?Q?i4I0n17GDOOQJzvuu1uW2mc/ZrIfc9adkAF9BrIsx6OxuIbpcO6qLT8DXwRd?=
 =?us-ascii?Q?Ye+Yi7abJdXMXY8LEx8l6qMzKNPczl2wCtjeoj3TgASt+L+zsoX31/Rzy7rZ?=
 =?us-ascii?Q?gAogyfsRjN50fyGMUxjfl54crPP2novlyzvHAEiSoorFoMFyh+pEtl38Y/wN?=
 =?us-ascii?Q?LPPZqN56oGdHY0tOySk7rIUnSf8ak+QUILQRCco6GDIGkmZgDRt6uKMw13a9?=
 =?us-ascii?Q?n84iqQ66ENtbg8xjJw2bN7wijcA1LeNAQUj77ki5jS/k95Ko3skucEARreg2?=
 =?us-ascii?Q?xlV/CR5gcPV6qzEtxBEwoUp6VoGZoguXZcDBpqlDmZ5UbLtuH+sk2+hZksja?=
 =?us-ascii?Q?QG+jiOibhYFJmxr5egxm/TvhZiqvSdrwFhEK5rsfbnzPIJgW3FfwAt2tIeyh?=
 =?us-ascii?Q?32v512f1yn1oJDSX9fYc9G8WHvJMQ55mxn0RyLEN3vFfiNo+aCq7TiteCQa5?=
 =?us-ascii?Q?tNZK73n6flUWw8wU38VX9HUDPCoqMUZG1u7ojqgbDSef6BiWdpy8Md0Jtjb3?=
 =?us-ascii?Q?i7f+JwhbvJCUxYl3HiqQF4PZmhmlmPlfYTlOA2ppWc7w5Wb2GZ4uPgOjvwU9?=
 =?us-ascii?Q?m3NHO2TG2KU8HZt6xsxhcm9Ia24TryCVATyFTKgvVK4V5UY/dYR+P2wKKND2?=
 =?us-ascii?Q?8VKvkF4aDTgduyW4eNVG0YprWOEqiCio32wIq2ofjkTOdQ0g6PXvbzP41nQO?=
 =?us-ascii?Q?r0oLZ5hCMXh0cGgap5nRqwAVJrhrK50es1afUq6Msd6liGvJJ8ASjG4gOMrw?=
 =?us-ascii?Q?52KyCowXe6mpVB2iPJTGxpbhhJdpMArG0Ist066j4rNyHMj9DK6DIbxOahys?=
 =?us-ascii?Q?SzpUNR+sAhejC9LlEOxhq9vuYbM8KoYLY4NVWw7bryEpJXw46BhJ7KN9rinr?=
 =?us-ascii?Q?j06LNCk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wDJFL3T6CJOU9eAC14caJpM3h2Eh5zblzORZRRHprfjzDuYqVWFDmNlutjjF?=
 =?us-ascii?Q?slpLBzsact0982O44MovisVA8dFQiaotKBKDboLbNWfa4PCtCcxidtVzQtSL?=
 =?us-ascii?Q?V7ImkT79NpB57yns0fq/EudKB9i6EK2IUQD/+UTUUC0dKYCZcLGbzfbFXeOm?=
 =?us-ascii?Q?E0vwZ5t882yh6TDWAyncieQMKtYgFLOyhelQt0X/1q5RHNhuK93DWDfPIq/I?=
 =?us-ascii?Q?6ivL6ZphoPVHx6GKKiOjiR3PJInFfUbLDD4M5Dcl2jeOUNZaha/tl5qi2hi9?=
 =?us-ascii?Q?BaNMtSoJYTx/D5ajsyomlegqwP9ZqAYBIBPS+EXGZBkUZJ6aJf/HacsPV4y6?=
 =?us-ascii?Q?hEVMwar14jms2GHJ0j6Bjfu/UezVW7Kd9Fpa3KeNLeVSaHEkCcR9MC9+Vsj9?=
 =?us-ascii?Q?Y8IZc+UVHqyXkxtJlWIynzGOXq889Zp1el2x9mb3/w8OJezdKnCqEY/WXnSy?=
 =?us-ascii?Q?M58jaCTw1rQmCR2Gizqd7pzX9oRI0aqeXXBsyQq+1fnFamjZdBg6OMvp0Pz9?=
 =?us-ascii?Q?mgAa184sfTjLiuQAUre7ewsr2vMblmmeCtwhmbY3wKMB7Uq0TnS6b4dmp6NK?=
 =?us-ascii?Q?M8t6a1NcFeL3fCNXRf1T4v/Qut3AzcN0gJZuw/M+yQNeCMDfh5p2C1bMjT97?=
 =?us-ascii?Q?OPw4neEwzf1ZxBI4Ld1IzV/DcWIt8Nf9BAqnRru7buLXirpgmP09VcXgCs4T?=
 =?us-ascii?Q?zB/fRQvb6LN018Sm30807S6WXPK9+vqnbh5hggvFLJmCPrdaDUKR7D39f3Gn?=
 =?us-ascii?Q?jrTobDGmqrYEmrxmOAeYthv5Dantk+Xvx1+NPyxozKBPDC37yEepKkrS8O6E?=
 =?us-ascii?Q?ToyRReus2uyJn1ucDGXrXAYqsPTSnejie9na6ORe1hp6DMGu6CEfBU/3ynwL?=
 =?us-ascii?Q?U9ZXWNIgaYeP+TmMA8oS56Jx/nPzMfyF2FNW3j1HYe4bohLT9zkL6lyT9192?=
 =?us-ascii?Q?f3eH8O486vAkxBwHmIJyGYe6WnTavbvaukmzsDwZJGyIBoMWFJyditgGDQl/?=
 =?us-ascii?Q?XdEVj6ESK/lUY81nafZltR32HI5BtGP3EkzzGZ/Pd+1A88DAlkCLjaE3A/jN?=
 =?us-ascii?Q?PoNINOaT6IbICxpTutbdZzMkKCKF0k50OTefTXwI4BTyUWp88UA/T8TpyerH?=
 =?us-ascii?Q?4E1buEuF+Z3pP8GotHQiTyTin4yXLLof9kZfeeay5qAieKV0crJUEH00yuZx?=
 =?us-ascii?Q?vJZ+5NTU/gQylGZkPdIbLCwFvFH4Hd/cX1QVdSQixWoOZxajgo7Dd+UG9BVe?=
 =?us-ascii?Q?1DV4iJjrD2gQZS07On/z2bO8PCiNJGAQ0fPwdjbZAFb8ee3BQ6ofuQcQKVOh?=
 =?us-ascii?Q?QHsLxFA7wYysRBvvKOmjquxggbgZ/BTvJ9XO3uFDyqN/K1lFXZd2RVvjjnWv?=
 =?us-ascii?Q?/84bwijvOxqWzgWwOPCftWNWfllAym3+z6fpN8w1sw3qAVekLbSPjQuKMr9d?=
 =?us-ascii?Q?ZJVSefzLWiv7vgDg5IIOL+ivoK8McPi/QnOInLTdenGAP5mPTOVlHkZZqDTu?=
 =?us-ascii?Q?w3pO2OZgXP0DAXJw0hVpopqxWtVKC1zKtW3qLmg1FqA9RfTb81UNMufprWnj?=
 =?us-ascii?Q?0qpSo7Lyy0uRwYbhCg4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a271ad52-809e-4337-ebac-08dcf1956fa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 05:58:50.5191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3efR6O8D/ERePT8JoN7y4C6w7pr7xYIEU/uz9XaySWMKKhE+7LoA8KDcpthDKIgVwm4DpPUZbSzZe4AXbdyPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
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

++Mitul=09

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Friday, September 20, 2024 3:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Reddy Guddati,
> Santhosh <santhosh.reddy.guddati@intel.com>; B, Jeevan <jeevan.b@intel.co=
m>
> Subject: [PATCH i-g-t 1/2] lib/igt_kms: Added library functions for aux-l=
ess ALPM
> status
>=20
> Added helper functions to check aux-less alpm status to check weather it =
is
> enabled or disabled.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_kms.c | 23 +++++++++++++++++++++++  lib/igt_kms.h |  1 +
>  2 files changed, 24 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index b40470c02..be6d6536a 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6094,6 +6094,29 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char
> *connector_name)
>  	return strstr(buf, "LOBF status: enabled");  }
>=20
> +/**
> + * igt_get_aux_less_alpm_status
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Return: True if its enabled.
> + */
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name) {
> +	char buf[24];
> +	int fd, res;
> +
> +	fd =3D igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
> +	igt_assert(fd >=3D 0);
> +
> +	res =3D igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(b=
uf));
> +	igt_require(res > 0);
> +
> +	close(fd);
> +
> +	return strstr(buf, "Aux-less alpm status: enabled"); }
> +
>  /**
>   * igt_get_output_max_bpc:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 25ba50916..8bbb6225b 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1196,6 +1196,7 @@ void igt_dump_connectors_fd(int drmfd);  void
> igt_dump_crtcs_fd(int drmfd);  bool
> igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);  =
bool
> igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name);
>  unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
> unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);  void
> igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
> --
> 2.25.1

