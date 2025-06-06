Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188CEC5AD49
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 06:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CAA10E122;
	Fri,  6 Jun 2025 06:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAvD0CRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84510E122
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 06:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749189738; x=1780725738;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i6bPEXXGAoAuFPX5MDYRx7Eqre9uKrAOWYGeabOW4jU=;
 b=MAvD0CRuiHyvocbEcLUTBISwMRgbWFmDkDkMrUoshSE0tpGNIoIM/6mW
 s9jCuDBggvCi7a8kKM28SXk/+Phti6SS7T0YkowSkb5o0BTXKp8Rfc90J
 N7HJzn+ah58Dm8ajNh7maZKSkedlfJ6xmOu12B1zeQH8ObvpcurNU1kTN
 CFDbj/JSbtQo1HFTpOrLQbAU4oMp2QcFer1l/ETvarLOdZrPuBUcYjoxh
 Uu4SmO85g1jS8UdRz2Aqcik5nCQ4mYnlLAiZvsWYVSykbiHjMcXtk6nIB
 jArr7dn+WldNKb2+WUlQ45ddLHD4StriplfWRk0pJwjoSbvt8ksMSurnk A==;
X-CSE-ConnectionGUID: YCqAjCh8R4OY/+LA0vXe8g==
X-CSE-MsgGUID: sn1iSSUSSF2GhpSbgTCmEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51431013"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="51431013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 23:02:17 -0700
X-CSE-ConnectionGUID: R0vXhUWFQPGEtdg+qr7eBQ==
X-CSE-MsgGUID: YexWpv3nQI6wQ3H1wTZ3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="145669759"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 23:02:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 23:02:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 23:02:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 23:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6u4gLSNmKVjOPuVs4If45GgCXLNVwhKYXqZfOkGg4lbprsGNVXcZOY726idb6FpeWu1M6vnkpWIQPDIwsO9sPAzaHczNoKt4FmeYERrYHlLfUWveoQDHxLaEPGPFHsL9doNrTioXzKuWOb6sEHepnc45Widr6cw6rB9uFYhdc+Kdv4LhqAFQeOBI0n1lMALPXNDWRHEWuniXQQqi6TAQZdcky+bLD4FygW++t8QjFCcS6kCVJAjPJ5rR8Ickj9lnXgHDRiMEzqLwrsU1eKwGFSZ7UHAIYDIsi6c8wMA7HZOJJ8NFLQ88bGqG/KGRhMgcEeWnqDuEMiHxz45xuK1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVLgy5mI8zldD66f4GpYTjyk3gOwgBDgfK6REXkjh3E=;
 b=F/+sGyBAJtHcFU3JsjZxgjmDxW+ytg+FRxhWnZqn6lULyvRaGjSqbxOJj2SWKOOyP0OWij91M9pYJfqQExA9Re20phdUmQ8X6V/gYGfbro+TRy6zU9qEnaRw4fPDQtj5VUudvcw2miej16T9xKAq/+Z5/JJesn1Pkm0fGlj8EpSyHTxpN9mLTV/Tb5S3GyrnmGzjo+XejnxLmAcM0g9kGF6Qj1T6IAyW+P4CaV15yQC9txqNviP6CvsN/miuwtw+IFhoZ9NZ9r+gEZqkYq8vjoMYWFhln8v8vjcn0sRCC8hQamY+wL0rgYtqhWOiSBtWFhQ9k1nMMFbueaGXwnJgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 06:02:14 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 06:02:14 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v13 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Topic: [PATCH i-g-t v13 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Index: AQHb1Gn883HVDP/4QE6o1zD5dAZrzbP1o4OQ
Date: Fri, 6 Jun 2025 06:02:13 +0000
Message-ID: <SJ1PR11MB6129B45B4ADEF89F18C6A271B96EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250603092758.371150-1-santhosh.reddy.guddati@intel.com>
 <20250603092758.371150-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250603092758.371150-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ1PR11MB6275:EE_
x-ms-office365-filtering-correlation-id: f7e33089-e3de-4b6c-2fd2-08dda4bfaf1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WvHPtUcn3Cxx+5kWkSlxjdwiJHfjsWiSBCBtyECtGvgTZ+2bto4diUjfpgIZ?=
 =?us-ascii?Q?SZRBFwGQv7tz8ZS9oaTEOwHPikyIB+L1oCnWs7qc4RT7FPqLNrbWjlsHiMun?=
 =?us-ascii?Q?egYODfwdsX5tYdNcZcgJsmRqe0oNUCBv2nPLkMYb8NhAJgPWHU3Qc9xVjaKi?=
 =?us-ascii?Q?KMtUCT4H2K67kXkcYgWmAf2/o6z8d/c116MZ0tyFxLKn9WMvxGrzsDtVJfv+?=
 =?us-ascii?Q?LKSOBUvPhhCZemHocLzGbVuqxIsBQjrdzqZyu5gjLEtAysQRYHkaP4NlGdOc?=
 =?us-ascii?Q?SrcCYpRUHxWdif5BRs8XSR2rPR0/HbhCVbiqB6dEyWp6MdO0ZsPlMzFqhGga?=
 =?us-ascii?Q?pODNgJOJhdwq47vK+uIIkTemFbgzkL51OeD/wJWcW02M8DCesYmOa9+SggLf?=
 =?us-ascii?Q?RNPiRWZECUAbceAZ9FoRs0auhj2osuqkog+3gAIoAOQQfQE2GJgyJEdUbvTQ?=
 =?us-ascii?Q?u6iQts3C9EQ5u/QfCpE4HAopxIdQYhdvLyHAaJU9Egm0JMMnHzdLfzI8OWIm?=
 =?us-ascii?Q?fvdsSr4/Y+iUuoRazNIgv/7IKa3Nr1EsoqlxZbEJvilYZL9UyZaAYdLUi1zQ?=
 =?us-ascii?Q?8dm1R4a+U3g5kCQuze/7j1T/biEEMtsMXFEYBbbmdEIRU7IH+mHppISBLtcX?=
 =?us-ascii?Q?eDUkLpjT59SOkMYLsRA2onobIZDzj4synzRpmlOncIsCgkZ6RvZwZYrWy3up?=
 =?us-ascii?Q?yhzg2W+nWK4zfi77p+vLnLv1oVZ+F2RwdD4ZWnn9/h0wYTwf0O19ZPRkwje4?=
 =?us-ascii?Q?OqN4TdmsQf4P5135YQMu9XNydTH6CGCoEsaKj8indK203i/WlUQn/IBn2WoI?=
 =?us-ascii?Q?gs09OBj1flrBS1a5EUj6x9R1CEEjiHdg1GjI3BLRwMBtBJ3GdhLsfx7aNvU0?=
 =?us-ascii?Q?kYm29S4bLBty8zOjmpOCKAd52XVYDI6u6FMWmAzqP6Qm3c1pTz8r6xJsEhBk?=
 =?us-ascii?Q?1Qhz1GlBlK8zYrRxz+55e8+o4B9HAxUwt8u0YKU51sA6/vnGAuvp5ccMD0or?=
 =?us-ascii?Q?ZGi9gn77wVFQDopP6Le7Vx2B7Cs8l/YLHCKGiuawhPi7TXNwCkHi1BvEvpm3?=
 =?us-ascii?Q?uT5zzcjAX2lzRWL3sg/43qQpBkkOF2tktpFRcNzEo7SxbbQ+4uBMKhy+STRQ?=
 =?us-ascii?Q?hwaMeCUs3zjullLRpu317grpdmZmt5DvrmvFije9mBu3wKn9LwG5p1QcSoOQ?=
 =?us-ascii?Q?TSn1JVrkQJ0SnKqyP+07A574sBEePGIl+zu3SS/ihz6x2LMF8MbZWBg2IHoY?=
 =?us-ascii?Q?rHDyJBfndnMK9jIfGqBG4e+1ZQqw8jDOc+UYjr5Q5QFMEVsMhakgNrYjPJR5?=
 =?us-ascii?Q?AnZTFTf5ufbyb40bDFDR+Ng4rUhP5ytkqgGolipQ7NxG1dYxl7JMc0i8Sbmn?=
 =?us-ascii?Q?QQCPml54NmUwPUc5lGw/o6PJ8GamGpBOimGUdeRjsr5XE24zPkMJfcnV78dK?=
 =?us-ascii?Q?D7tZrlAAX8K9qX0hOgZqto7vd6XFeqrstR8cGdHBQWdy+iHnd6S4E/JQK2in?=
 =?us-ascii?Q?XR25fUWxUV0/RTc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?epCr0/t6ywXMWRGZPuNRNveSwDCr5+gVAx0L5sAuMU+JXFicziNY8BsRhqVJ?=
 =?us-ascii?Q?cdA43s+ZUsr5OlhSf33GPl1Abk99/osLEJrQj+aM1IQZ4KlNmm0NrVAOYklW?=
 =?us-ascii?Q?G0Wj7bzG1g8s7nkXkIZT71zW9GNk7lplzGN66dj8DwGPfCsvpqTEP5o+HrES?=
 =?us-ascii?Q?FHqmt3bIH49uzyMEEqgdVIXpJZrCybwP7jihcUpKKtXJqT64CJZiu5u/NaST?=
 =?us-ascii?Q?kKdFctZiU6D+DoVD4LA/EcH6QnzIzaRSLwdF4QAYswPHcSkgm8Dwmi3wjOCw?=
 =?us-ascii?Q?IkCx/zv4TdwKPECbsxbGkVHnNPJVQ7W8cpjU9klIt9/fHSpLkTP1c0PAxc+e?=
 =?us-ascii?Q?Zs2y0NXcukjmtJtwZPUN6WLHi7igphSAUR98ZSyeGaEpDL2NJkUnR8LfgJ7R?=
 =?us-ascii?Q?YYqI8UEp94VgTyw0yLT4ak/EWnJMYz0AWsxy9BobKFTXNi5iDqLLUguKfXnT?=
 =?us-ascii?Q?XnZBhhjOtkSXeYCc1HKFC5TPTngHBwIH06MGXTEE7Jm3uMMnwQQQs4tBwCHg?=
 =?us-ascii?Q?QFnyR8XFn5Wle9hUIc8MwBJEx/UtNfPKLBI788255hadNvF8w4pbxK1n5LnS?=
 =?us-ascii?Q?xO6HMJerk1Qe88kXzpOUIRViBV9YiXSrWQWHVp1xprqa/k3wJWeSGJuLJyHa?=
 =?us-ascii?Q?ncelF/lXtLQCSBiolK1GnvFdF6c5Axa6uoB1ly4vh27SRMMDMY1iT/8U6s4O?=
 =?us-ascii?Q?8ApMriNQfGB/xvWB1UflLLSAo4xLuJc41vlMhJWpD5OwJuImWiXPbdx7eS08?=
 =?us-ascii?Q?yv8kTT7goYIOnKfZI0NvXQfd22BlL4+7d4vb0UYfbw+JojpQTcDAov1a+b9I?=
 =?us-ascii?Q?z0xDstfJS6oR8J1JwS74wgLd6Fx2BJ8Gb5mSnKXgmVZViFVpGBP0JxCiCMM8?=
 =?us-ascii?Q?9O02yS52bt6mrfyk3nF+YxRPuIfM1Zyt5A9PwAXlxL6uxB5ytLOe96dXRFSq?=
 =?us-ascii?Q?yy9llojqvLwwixed3Iot0jQUHyfME+V+u/j1IgMXdNKnCUA0zo4+dKKcDQr2?=
 =?us-ascii?Q?3j7b3xSZEdqqlXipDjxwJNfOxtbzYyKh6dfkixDdi/PxihF4oUbRPe7giJBm?=
 =?us-ascii?Q?F8q457MTKGi/2QVaDqcy2LiKnnwuUgLSVlon4jPSr5g/de0+WEuzzoq89bPS?=
 =?us-ascii?Q?7y6LD99m5Hjf1lgYCgcYGNYo6bo4VCOt7hRQQbclb2fJurJJFeWIOKFg7w0C?=
 =?us-ascii?Q?jwF1uylwIBcoVetiQqcnGOYUtuzK4ue8G8J7PRYiQTC8hXsEtloxvpp+4WHS?=
 =?us-ascii?Q?bcoaksXCek8xziB9dE9WUXHwonYwxTkh+7RY/H0/neUlYodxuvxBmV8Zm0bw?=
 =?us-ascii?Q?J0NEKb7pboYU0SlQrYx8MrFpOJz5nkYuVUyotgqNL9uWcRCOzy7Ux8Tu4SKS?=
 =?us-ascii?Q?yvCio/hLyAcolACt9z4IzbyZXTHinpHCmB/9VLYcFnvnPzEhqGCem4RksHtv?=
 =?us-ascii?Q?FGQvwHps3s5aFPtfyLnrsH5DfHp4auTNFMHO9AyTTMyOtVSjZ23yrUHmCNYx?=
 =?us-ascii?Q?nor0muR3mbHBt66OkI0AkMRkQnHhV5hhUnF+NIh5QI5eYM1hzLwjbPV6k8KF?=
 =?us-ascii?Q?HVQUCGP485Kj/vm0rJrMF1UlfTduLubYkmas3/C8VYYedYLi/TblrbpuyXId?=
 =?us-ascii?Q?dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e33089-e3de-4b6c-2fd2-08dda4bfaf1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 06:02:14.0012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8kzJjI6aeWcGC/naEgD1FwLgyJSKBSPgPgjOngaK5HH5XMwswy2XA7W8OmdAewPTtE5V0cSZFjhSXPS9aAM6Gw9e2Tr/DzjgFt5+i1Z/Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
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

Hi Santhosh

> -----Original Message-----
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, June 3, 2025 2:58 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v13 5/5] tests/kms_async_flips: Skip Async Flips wi=
th
> Linear Modifier
>=20
> Skip the linear modifier subtest on unsupported platforms
>=20
> V2: Remove platform check and use in_formats_async (Chaitanya)
>     Update the commit message
>=20
> V3: Fix crash
>=20
> v4: Handle the case for linear modifiers on platforms where
> IN_FORMATS_ASYNC is not supported. (Chaitanya)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> f824f60f9..586ee5d84 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -901,6 +901,28 @@ static void
> run_test_with_async_format_modifiers(data_t *data, void (*test)(data
>  	igt_vec_fini(&tested_formats);
>  }
>=20
> +static bool is_linear_supported(data_t *data) {
> +	int i;
> +
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
> +		test_init(data);
> +
> +		/* for drivers that doesn't support IN_FORMATS_ASYNC yet,
> +		 * assume linear modifier is supported.
> +		 */
> +		if (!igt_plane_has_prop(data->plane,
> IGT_PLANE_IN_FORMATS_ASYNC))
> +			return true;
> +
> +		for (i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +			if (data->plane->async_modifiers[i] =3D=3D
> DRM_FORMAT_MOD_LINEAR)
> +				return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *)=
)  {
>  	if (data->atomic_path)
> @@ -988,6 +1010,8 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive
> asynchronous "
>  			     "flips with linear modifiers");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
> linear") {
> +			igt_skip_on_f(!is_linear_supported(&data),
> +						  "Async Flips with linear
> modifier are not supported");
>  			test_init_ops(&data);
>  			data.linear_modifier =3D true;
>  			run_test(&data, test_async_flip);
> @@ -996,6 +1020,8 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive
> asynchronous "
>  			     "flips using atomic path with linear modifiers");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
> linear-atomic") {
> +			igt_skip_on_f(!is_linear_supported(&data),
> +						  "Async Flips with linear
> modifier are not supported");

Programmatically, I think it makes more sense to put this check within run_=
test().

Current logic
	-> Check if *ANY* output support linear
              -> If above is true run test in *ALL* output

Proposed logic
	-> Check if the current output support linear modifier
	-> If yes, test it

However I am not sure if you can skip here. It will result in a "silent ski=
p". Similar to


                if (!intel_pipe_output_combo_valid(display))
                        continue;

If that is acceptable we should take the later approach.

Regards

Chaitanya

>  			test_init_ops(&data);
>  			data.linear_modifier =3D true;
>  			run_test(&data, test_async_flip);
> --
> 2.34.1

