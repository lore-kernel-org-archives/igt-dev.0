Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6144CC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 10:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85BC10E2D9;
	Tue, 13 Aug 2024 10:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e83Kg29S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D443910E2D9
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723543959; x=1755079959;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vQ305Br4XGGvAu1yaYVEHZ7ZQoT0Qy6Xd1ANHqo3Ml8=;
 b=e83Kg29SQshZZqy+JprF0t/0N20MvII6Fr+CjvL6UvVMC80Wcd+ZVCwm
 Yq05EnKJ2Eo+irM0SejPl36+3wAvKN4jbNtQDfFz05/qJjCkoLs7cYl+v
 pFeXR02o8afI5DvM3rrFhrZymmkPpaj9wE/FMJRwjCM9GNKX0rRYDnMnI
 ydENggKcICGbAtffJ9ZXcGd8FRu2uHYJMOlrKBxbOMIuyWtTaMoC+ZB3d
 uXIE36qV8UusvkUIOiFUefjBx+1hzkcv1zPsdglnBJ56gFV7SMEV9x61+
 t7Me4nwPZA6OyTHVs0kTtqIqAjh0mMsBvC8BJTdyKGjnXFIzwEJEyAkyf A==;
X-CSE-ConnectionGUID: ao19fv+BRdGrPyJawnZECQ==
X-CSE-MsgGUID: 1IPr/qQ2RqyLNKPUEvaESA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32270399"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="32270399"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:12:37 -0700
X-CSE-ConnectionGUID: HizWnJD+SMCz3MXZ+2BUZQ==
X-CSE-MsgGUID: dMABJv1tRT6OITNlU3c05A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63305274"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 03:12:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 03:12:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 03:12:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 03:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgtVOPy44NnbTe1/96INLdI9BdzjEPIlBm0D44SNgAyhuxdSYy59Ztk+cKVPqaASaIvwilew79ZacIvjoTDyfpnv6OvnImLOt7WN8INC+wFkTKX163Vk87FDykUJFJ/wQLlGdZWdvCH1+kndl6fQ5iHgvlfQvCKX1BzjJtZZzMLwm2hTEhmA8ql8fMUixcA+wF0igyK7mSUzDWJWCozepyfdCSpJLV98y2F/gZxG1VwBuqZIm0CCCiWMUtIHG6HpIS4OcnIwLDraBb47Lt1lkS0FpslBx0Ov5D2RSMmiCx/FJz0hSfJ/S/0qHv/YLx47Lh+/kKJDcfv77bI0ooRbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0r6JVmuCEAJbeMR8WA7gvNO/I/dYN/D2+03ywwy91o=;
 b=r31sPfuJiK4+FDVy7npNWijW9YiSORJcHHLLcBGEdLWcGWN098rLL7eRaKpSmN2IXMO1kNqCAOKklAspSvIx6xe4MJtbGjPYP7jrOOq22UuuNl2JbKrFE6gs/i7p17o/6U/Ina1ovEU7rHL0lMhGus2RU1/XZrrwLIcI85xJfZ8VAsnxwvV/Ou+TSpDG+vJYGA2XNHsjCnyPZ4BqgzN5/hD1NCc9he48zhs19BWlKDWOq4Go9/et5aS+2w7uqDV7Hp1ZHGu9FN9e3uh3kuPvV0D019Z42q38x5iV6O42EilCl4/IsBOiuOaIeEO377ovChr9OTAPA6dnlaYKCOSu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 10:12:33 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%3]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 10:12:33 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH 1/2] lib/igt_sysfs: update igt_sysfs_engines to run
 dynamic tests with its associated engine class.
Thread-Topic: [PATCH 1/2] lib/igt_sysfs: update igt_sysfs_engines to run
 dynamic tests with its associated engine class.
Thread-Index: AQHa7O+ygVJywEs+00OKwv5bjZrxKrIk+KfA
Date: Tue, 13 Aug 2024 10:12:33 +0000
Message-ID: <MW3PR11MB474812769CC478167BC52B27AE862@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240812194136.6352-1-sai.gowtham.ch@intel.com>
 <20240812194136.6352-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20240812194136.6352-2-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|PH8PR11MB6563:EE_
x-ms-office365-filtering-correlation-id: 6b4c6fd1-ab48-40c1-bdf8-08dcbb8072f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4l8UgCjU+sytPwIq1UFqIu6IIuhZoPY0ugKUPjvcqPcvgTA1elIc5SiKeC7C?=
 =?us-ascii?Q?bEPya9r89t4jhBGWXQO7bgZn0VVVYhVYAajjPwIRt2u/iyy9jnRPbjSGw9jo?=
 =?us-ascii?Q?6wHYQKsnYQ3GBA6WkokvL1ydBffHiauzNdGJWuUbktNpbgvVow3NSpFSy7of?=
 =?us-ascii?Q?9RhVfNo1dCo6xoTI5tnYz+GtlWVMbuNb/O4dBbGNLwlqVTLQ2Tz7imOfYZ8Q?=
 =?us-ascii?Q?L72C3CukHqkXozga/SFM5su/CZHYsmJdmlxaX+B26HPXEBhlL36MSQTwP61/?=
 =?us-ascii?Q?yQM52PB32NWnPQ24hqmUBrr21XZk/OSB+OPNjdM/O11gxCXDP1834h2CJolv?=
 =?us-ascii?Q?lk/Uwz9KhfChD2NHriqo9zIxvSEZdOyzl1zw58RRttgfwx8KPiB/kudS4Hsf?=
 =?us-ascii?Q?BxJZIr9oX4NvH1BNEcsZOBJv3xcJYnVaXvyTSq38D5UfyZqYMXTeI4VtwpMt?=
 =?us-ascii?Q?ZwuIGrhs8KMLUgkUYTDdU6Gn6fB+p5bgj3NkcrFBMa7Ncp2cmN431Q1Eh6FE?=
 =?us-ascii?Q?wgqJuiV030VK/C5wZ5wSN9UT5iFSFg22BESKMYW2zQulbNq1i6Z65edinRmr?=
 =?us-ascii?Q?1aZn+JhlDB9rvWF6Gn8osSA3Gc8dG6oTRgBk+YaNrM1naHXuY5FDudJQlJVU?=
 =?us-ascii?Q?IzdkVFL/eDlWBq84dhWgOOiCxzSII7zPb+UgsXOtp2j+a2jcoKFyeR3CbGzc?=
 =?us-ascii?Q?lAlf+ndQwVE+tVj01NyG4UQ16ZGj9SuAKgo2KUKlf1oeOfsCEgh1d/YsMBvz?=
 =?us-ascii?Q?m7hJpq7E84ftqaRnRxFsEDnxZ5ha95cX0PmdsBANHi0Mb/QCeyEGdPf1FvtM?=
 =?us-ascii?Q?w0J/7a5mjO878QNJGlocaXZyZXTsMTlJMFVMuadXo9X7mVSzZUZJu/b3+xQf?=
 =?us-ascii?Q?T7S6b9dpBHtqu2qin+O0KM8QXzNtz0Bx3NUjQbvwUqEqG+HOgQIxUVurNU5G?=
 =?us-ascii?Q?v0v/KVBBHbVf078Wj/55gwsoOHAYvivhB4+yQrsqzeevGvLfs4kyIVB8UZ/R?=
 =?us-ascii?Q?DiUU2nE8rDEJUiAxqcCJ22vYOjYKHHe+ihqBYK1VgjcqBclI/xdn24Ft8e1V?=
 =?us-ascii?Q?qnJHyxShc9KEezUNKnwvgL0CKpr6wwWroicboq86DY70jwtgJcldpkGxAHA6?=
 =?us-ascii?Q?9eKMfV0sqgq1SxQKZPTW2mNSN7JmmvmoQNvGUh6WX88p3bM0XXsW9EC69sFn?=
 =?us-ascii?Q?SBwl4Pik6KtPL+qY5DJrwS1mBQOLhJ1JxN1OudjDLVcfrjTOBls3eHojJ1nA?=
 =?us-ascii?Q?oiW15mO9vD2yz8EQWAmuUWKE6ebQ7JDseOqEqrDvRcwUO1iJCrKfD3lWtlCR?=
 =?us-ascii?Q?TY+2RnztPUG2eFWqWosPPCzMmAZqXVxg465ZM4IaZSmYmeG3ZHVsG+N292TE?=
 =?us-ascii?Q?7E/aW+/jLj5SjtL8b1jXUUESUd5P42r5iV0Yha0dTSa59l61zQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eRNToMQo4BEXJzmFCNucRxVGXJ8MM6th5WOyg/EY6p7HBAW0RZgk/izsN86l?=
 =?us-ascii?Q?T3CVN8htpTqJdlzedRPWkxYucyPQtOZRShHMr5juk0jL1kdV+0r658FrnoJt?=
 =?us-ascii?Q?wMMIBtVQsPs27SfMRKO/HiogMgLj5ZDBAggSq6i3GsOmTOhQQKk7d1YouYi4?=
 =?us-ascii?Q?DHIMsC3Gb3226CjOgIB0wMvFY+dOjKYtyvxWHuzVqtZJL24Y1cqmChXOhWV9?=
 =?us-ascii?Q?XFNXNXpskPxhbrEKuRyH19AuPo/utpftl10dyVeF2h0WL0TT9u1PbJZ5QetR?=
 =?us-ascii?Q?FyBRsKf6wx+3eJLAjzlCo2AXUS2YQyUtfcc/nh+EFiDMpUGBV/9wP+4BKjfr?=
 =?us-ascii?Q?UN5Rd4B7WWvvDb6WeXcaawuUzgEvk38XLmmJffdS/UEOWOqpulGiY57Q0+yJ?=
 =?us-ascii?Q?4H1J9XaXYjJnN2+IFtl3d+LSCSm8/vp984RnDgSWKMOxjudHz5g7MWvuF5pu?=
 =?us-ascii?Q?aHOkfYU0qbphFTBqf8KsNvufpd/NJNL9GLEKb38rA5xc6oh+QdQb8JCmAyc3?=
 =?us-ascii?Q?obqBRgPRAv3d3molgIhSOSuR4/lkVHGwvmC4WVgqJWEpM0lZl8McpTilJ3yx?=
 =?us-ascii?Q?w3yd5/DWqJZJC01JhcQlzs9wL2a0IITDPOd0pxsV4nIaTFDrE0RNdr5BfSGI?=
 =?us-ascii?Q?TNrpAQaSfjxCDahrm5vPUXURSAQSZVYAxrdb1vyuHRZM0Cts2oTkBalxT7Rm?=
 =?us-ascii?Q?JP08/2Yn8owMlXGQGWxCq2Fo7DwFU1uPwYkW1OzvH6GC28JFiO0TlCqnLavt?=
 =?us-ascii?Q?NeXDNEoVJd8avxsHrwNH367K8QqwsAH4gT9mntRDQVnzU7T2FiUNH7/KxVIi?=
 =?us-ascii?Q?wNruILfZ1Ls0Ep1qR7Zwm4MBCLr2Nhn9WVyJxEFOYXQzbmL/dBu0vH6SeDR9?=
 =?us-ascii?Q?/G4xpQDsSEdJ7ypBOTVXKH4QUVx79Tmv/y9w6+HvK4M432eTfm7/PvwLTn2A?=
 =?us-ascii?Q?JyC7GjevE5zlj/jUCM66gtS3f2EoBjPX7cTyG4D0EzBLiE9OSV2c46PJa8Ic?=
 =?us-ascii?Q?MB4kdcbqJcu14rWO8RzY+OzKBAkcdGxV7D45Xz0E4fBQeMYf9Z8FJmliiroy?=
 =?us-ascii?Q?AH/rLx5VC2Oct2FgXOF/vYX0HFU0GouOMIufXZ39/uZE8q7a1rqJ5w5SojUd?=
 =?us-ascii?Q?LoLklU0JRi2iEU+V/duq9we7BR5hAS9viuovBIICD+oixF7+AZiQH2lrNFRK?=
 =?us-ascii?Q?CP+GHMJBn5OskOme3BmPFNT0XiItl/LmjWR38hYaaBOB/cW54IOc9OoiRQs2?=
 =?us-ascii?Q?o+oYNvZN6oGFh3Ysqie7HkUbVf2si0803sreYt8Ib+5pj4Nmu52LaLvQvkmo?=
 =?us-ascii?Q?5Lsnoiwaexz3uIm1SaIIP/NRdA+nDVt0Td4IkzaMK3wVAqH7xdiwtxAyuZpz?=
 =?us-ascii?Q?dbr/7cvKeEe3vdwSFXQEjyvY/DgXK2cIDFYkLTqgzbqwhuOu9XlhtepzujY4?=
 =?us-ascii?Q?+ORcn9zaslxj67ZDGO87FRlIQ1g/+TOBdrVvtQJ1yKFXHQipZVcn2jhd1Gcv?=
 =?us-ascii?Q?HeCAHLf+LLjF/xciP+lh4i5U0YfhqdXmdds/r7XYcmRhvZsbxFap/HYyG1yH?=
 =?us-ascii?Q?exvZqX92AMl6hBfeRAT6GE/Xn+HksCGUe8gHoJX0VExSdercQ7SPU9+TXAab?=
 =?us-ascii?Q?og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4c6fd1-ab48-40c1-bdf8-08dcbb8072f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 10:12:33.8474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2x+7d7R+YjhY18vqldbKu2NSbtT+sxJTY8fN4jwF9eAtZ1txchgmi2V6Xfq7bwfHH68Q2svMvsBnVyjcTWZOKRuKmYzJUlsnXI5KZhl2RBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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

LGTM
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> sai.gowtham.ch@intel.com
> Sent: Tuesday, August 13, 2024 1:12 AM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH 1/2] lib/igt_sysfs: update igt_sysfs_engines to run dynam=
ic tests
> with its associated engine class.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Correlate updates in sysfs engines queried and the work load submitted to=
 a
> engine, enhancing igt_sysfs_engines so that each update in sysfs engine w=
ill
> corelates to it corresponding engine class.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/igt_sysfs.c | 39 ++++++++++++++++++++++++++++++++++++---
>  lib/igt_sysfs.h |  4 ++--
>  2 files changed, 38 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index 2863e22b5..aec0bb53d=
 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1210,6 +1210,32 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t
> *rw)
>  	igt_assert(!ret);
>  }
>=20
> +/**
> + * xe_get_engine_class:
> + * @name: de_d_name that we get from igt_sysfs_engine.
> + *
> + * It returns engine class corresponding to the engine dir from
> igt_sysfs_engines.
> + *
> + */
> +static uint16_t xe_get_engine_class(char *name) {
> +	uint16_t class;
> +
> +	if (strcmp(name, "rcs") =3D=3D 0) {
> +		class =3D DRM_XE_ENGINE_CLASS_RENDER;
> +	} else if (strcmp(name, "bcs") =3D=3D 0) {
> +		class =3D DRM_XE_ENGINE_CLASS_COPY;
> +	} else if (strcmp(name, "vcs") =3D=3D 0) {
> +		class =3D DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> +	} else if (strcmp(name, "vecs") =3D=3D 0) {
> +		class =3D DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	} else if (strcmp(name, "ccs") =3D=3D 0) {
> +		class =3D DRM_XE_ENGINE_CLASS_COMPUTE;
> +	}
> +
> +	return class;
> +}
> +
>  /**
>   * igt_sysfs_engines:
>   * @xe: fd of the device
> @@ -1220,11 +1246,12 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t
> *rw)
>   * It iterates over sysfs/engines and runs a dynamic engine test.
>   *
>   */
> -void igt_sysfs_engines(int xe, int engines, const char **property,
> -		       void (*test)(int, int, const char **))
> +void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char
> **property,
> +		       void (*test)(int, int, const char **, uint16_t, int))
>  {
>  	struct dirent *de;
>  	DIR *dir;
> +	uint16_t class;
>=20
>  	lseek(engines, 0, SEEK_SET);
>=20
> @@ -1251,7 +1278,13 @@ void igt_sysfs_engines(int xe, int engines, const =
char
> **property,
>  				igt_require(fstatat(engine_fd, property[2], &st,
> 0) =3D=3D 0);
>  			}
>  			errno =3D 0;
> -			test(xe, engine_fd, property);
> +
> +			if (all) {
> +				class =3D xe_get_engine_class(de->d_name);
> +				test(xe, engine_fd, property, class, gt);
> +			} else {
> +				test(xe, engine_fd, property, 0, 0);
> +			}
>  		}
>  		close(engine_fd);
>  	}
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index 27031a015..2a1e3b1bf=
 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -163,8 +163,8 @@ typedef struct igt_sysfs_rw_attr {
>=20
>  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
>=20
> -void igt_sysfs_engines(int xe, int engines, const char **property,
> -		       void (*test)(int, int, const char **));
> +void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char
> **property,
> +		       void (*test)(int, int, const char **, uint16_t, int));
>=20
>  char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen); =
 int
> xe_sysfs_gt_open(int xe_device, int gt);
> --
> 2.39.1

