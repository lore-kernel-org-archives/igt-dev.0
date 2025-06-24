Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D30C77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 05:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4F10E13B;
	Tue, 24 Jun 2025 05:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HP4bNA1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03F310E13B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 05:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750741548; x=1782277548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LoqOBuoi/uWsa/rCC1h1+Xog1UQRPhiDt3VWGfDu5u0=;
 b=HP4bNA1Psx1sBKmiWtUhEx+HkMknk/MUH4EwF81vD74Lr8duMZA8KzXE
 kB7FKz5trrjENAPujPwtpx90xq+Mkuayt0XgpHrIQbjkkHy/pDbBICQXd
 eCjbBjQiT2bKSUqOrhTxXwdWqj3XdRJ0QCMT2dOfl+Uhw6XrJDxzaLeYS
 jf+A0JWKjQFmJr0a5vANxkT9WU5Tx8ZsioqqJ/S+JB3HGgyef7iGFDZ2n
 TDPq3jHz80rmP3qRHzLZwMujixjJQnotWt4RlNdamGYWF+qz7hzuAuMNh
 Y4k2aJmWDFfdRyUUYDN+H0qY+CRP5lxAhtB3Lcsr7d/5UB8nBxM11AZZT g==;
X-CSE-ConnectionGUID: Zup/dTwtTqyt8AdU4iHMyQ==
X-CSE-MsgGUID: ThCr7JDGSYmpOYMfv4nVvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53104535"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="53104535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:05:42 -0700
X-CSE-ConnectionGUID: IUJstbyJSHWJ5s76UXbv8w==
X-CSE-MsgGUID: KOMcQ9IYRpOCOoxFbKqvGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="151389821"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:05:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:05:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 22:05:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.89) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:05:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa1NUwD6toJ/2udpzEsOqfvHBV2lgzzxYGzGyp33T7NrqeEfuG98sowixkQ/eO8qkV4YIvQZGRU6i/5BWvHov5U8gpzEdVexE/DrbpPR9rCkv7LQJxoRryXOp9pfABv1EDJHsP27DedBO6Pce8Pf0i+xTB1Fy6FKIZTy1flw8MYp/7oaZGRlj2VcrXmINxDugZfXlFgMwsJu6s8AJv3Q9qFs4T2HS7z8A/2Uo1MCOrLVgla9pEEhloZ+tdeJX0qAPVVkdFNM02eTuLprNCq9z2u6bmePGvGPb2FVVr/d/OKLhtRQwKz5PQRM8uYD/SUPMEz5DAFakgZrNEUJxPn1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMyv1+MLONJPu7wJqds599IQNJRLDXNNzTVzg1+O7Xk=;
 b=JSPuXz6pmlvuXndk+RNOfmLyxd6U1ZYqzAgfB7mnTDuE2fLHIVyEfXQX7QvEdCmRjlbv09NYplwgrRxRgeQSs4muLou4qhFFJwEd5cN6uq8a/GVZ1jy6djR5Uzlh7LMttTArKbmP4Gvocdj+VmbQk3GOGRY3VsP+koa5Apv2whhnC/fTHLXQIt/l8U+AqxjbyBOx6giKcxxtfZYXdZf3PoLzSGbUSyfBX6snqtPoZh9NX1eVSE/XOOKVWiBH0jf1rknrZuDMmJzUpak0zloCAIxUGoS80JXKLS45pn4aML5dHStqOpm11AJwirh4OuZvZBbD9yp3bmfeOHsN+V1VmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 05:05:33 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:05:33 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/kms_async_flips: Fix suspend-resume
 subtest
Thread-Topic: [PATCH i-g-t 1/3] tests/kms_async_flips: Fix suspend-resume
 subtest
Thread-Index: AQHb4QylhCvT2tahN0uERKgxKZwDd7QRyKIA
Date: Tue, 24 Jun 2025 05:05:33 +0000
Message-ID: <DM4PR11MB63120579DBD114F8C7AF860D9078A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
In-Reply-To: <20250619112334.744213-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB6494:EE_
x-ms-office365-filtering-correlation-id: 62b33b5d-e78c-4ad3-c0c4-08ddb2dcbfb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yf6NY2Oh+RGPX2jMX2oq9u1wCWZjoxDB2+mi/SsDpncR5J6YbZWSK3zFQD4z?=
 =?us-ascii?Q?nQoYN0Q1Q/DK1kIyRXD3Gz6CNNsFcC9cGD89gmg7xcwHmcNvTOAkWvDJFnP0?=
 =?us-ascii?Q?+NIMEo+v7tT7mnsWuoNsLA54Tb0DvEgMiZh13xqI38uihCARMuvHk7xo3un7?=
 =?us-ascii?Q?AL7O8pweX0dDjyXkipUWPEIQnYMubK4t4SvX0XdPb7dPj3APycgl3Ih9ruTQ?=
 =?us-ascii?Q?XN5krJzF7TFR2Z3+P9Zq2kPAeB9EO3ZyeSPtU7jdlBGto0BFMbAH7Ex0kE4W?=
 =?us-ascii?Q?iDHz9PxjEq6Mv5/OB0Z6/2idM1fd8lX+CgHYShENZsUJ342HTSYOwxv3oED2?=
 =?us-ascii?Q?LqHCpq0MNYvu/d73zP4eT/GjaXQXHAKULTsI6wDW9V7pu6xyL8+bmGB01XtR?=
 =?us-ascii?Q?LAidbRyh+fcnrcju0KQ4b8BRykqz6uE9TDclF/cAtFxkOAXmWHU8tUqMDrSu?=
 =?us-ascii?Q?rGeuOH14CVmU7xut0b0fPhQh9fsrs9WNzFcktB4UKf2IZlkNAs0ZeGCCWpQJ?=
 =?us-ascii?Q?K7GtiMFZ2OZhDo6u1AMpMAQZijCi+ex8jd8Mthp52tbNr6kUaHM3i7oW0IPF?=
 =?us-ascii?Q?sTeg3dDgSEziaEqTpFTgEMr6x4p3SigFzJX2ZZppghT27x3bdK7J14+H7mAX?=
 =?us-ascii?Q?w3vvT4ENDA1ggmfXiS5yHK9MYOMepU9Dk2gKC4SP+HaoBet53ujccBD1aEHK?=
 =?us-ascii?Q?ty7MSEmuTKowYgNAHCyFEh8N9U2rOdxkI9h9jhmsjgzhY7dHMR9hW3A/9Frc?=
 =?us-ascii?Q?fqTt3yYsz5S0HqrrfA4vfehtOOSUNrDiKLaeSpkkZMzIz0vWISQTGQGZ4of4?=
 =?us-ascii?Q?1rXiK1MhogYnw/7wr5v9k2nbIFRmUEOHY8Nf3U16MRWkduuOgP8BezozB4u4?=
 =?us-ascii?Q?gLUa385hYQDMKJ/lHJrlNNBQRKKFws/ftPuaoEzJrhu7PQPljZHQTIOkn5E3?=
 =?us-ascii?Q?9H1so4E4m+FamZBq1U1SuSeQ2AsSF/loBs5JFi0V+VBNkOR7+KaCb9YZEPxB?=
 =?us-ascii?Q?7wstIr27CFMgSgihUv6kKyw1yrY1uBvWuQfHCACvazuugVGAyv7cEmzalh42?=
 =?us-ascii?Q?l3pPyi92URyQ6qHh/mZx3FuBxcmSr7EfX83JtCELODlZuTwaptjXcYIa3bZ5?=
 =?us-ascii?Q?7CAV0ae4fNvOzFZWUeX3a0hTS9WOlbNGhNM30+m8hKKOJGAvOFJam7b1u0fE?=
 =?us-ascii?Q?2DKRniMNOAWJabh9wleLir/TmuvGd+wyARI8rQxV7bF5tsUI5K6cpKhhG5rl?=
 =?us-ascii?Q?ZKhafhMHixF738h7bO0eQA+OL4cqay8JljWJ5tk0I21WknmBT3eSOa5Dn1n+?=
 =?us-ascii?Q?QPH6asIBGoc6d54SHsyGsKQvkGRhu8MthYn88v7ZMYG9bJFzzxBvHsTpnK52?=
 =?us-ascii?Q?yeAIRfsp7VZKhKSEFWjhHg8nbMOlCJpQmZYCuzxnyWtS/iN56PZo2cF0szUO?=
 =?us-ascii?Q?GRX6p68L99ObMwHgop5L663sx9+xWicq+FVPLJDjE+lfAuXNYv3l4yJTuVDl?=
 =?us-ascii?Q?cdVMzUqKD3MzUUo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h2qdgUFbwTesxReb0A2bK7/FU7q2hZM9u5FzoFwJ/3uiTRDnhYf+IYk84mNA?=
 =?us-ascii?Q?JPpo+PJe8zzJGez0+ZZMLazfBp0U+ptkRf81fe/iI8M3f9wkg0z8mqMm6kiX?=
 =?us-ascii?Q?0HVFmQ9bSiGbiUb2BzsT2bFebpbA3+vf9S5nTS2fzMWbVmEKulj4WSoPTJyK?=
 =?us-ascii?Q?Q8HgQu7o4O2ctTNYX6YlS4RkQHD2FWORJTTrys75buHCSThwaBruAVI3KRj8?=
 =?us-ascii?Q?YQD420D384x9GflvaPd3HPEKzIwKqXOwsIlT6ELtT8F+cfcUzA/icDCA2dUj?=
 =?us-ascii?Q?KBLBjb3evQtmSgD/Gl8iC3m8qNLMqTA84P2lpWdZ8LLuQRzlE1Lgy85Wxfi8?=
 =?us-ascii?Q?G5gd2rITwhV5747oYJoIa1+pC1XgU4wCZzUSQdKBQOHjIqnGrb10QcdhabYn?=
 =?us-ascii?Q?Yz18yDiRbBPQX4W1l1QRuLdUp70zlr2zhlQ6KvDadyYxystC8s/zpFNBjILv?=
 =?us-ascii?Q?DdD7mcEOAnljQQatCulcRi/8474/ks9Swe68+zpYxbqaMWOuS88eU4NAHNjC?=
 =?us-ascii?Q?e7e6Nm+9/Qe878U8a/3Hm0ekSH1KS54c0RxpkJuEdZLX0lDN2K8DMaSkA6P1?=
 =?us-ascii?Q?9xFYBcDs7l/LVKavigg5kUOoN7GUKN/eWMZL7R3y7fy1+r89FNi7OmrJd1Da?=
 =?us-ascii?Q?0uCPMTf7KwecWNnsHB6WYarB5VKrmafjQZJejDTnaTr1/QbsNI7hHDdXxLdP?=
 =?us-ascii?Q?kJFnrcHJkkPb+UNRmqyso8ge3obDIVe6ztSRi8vfDYNTODQBh+fwWpfmpY68?=
 =?us-ascii?Q?dAn7TLQ9PYa2zeTKoEy3iOdYq+LImMmTp4xNfTwc08O5gUUfSZu+Ndhwbcoe?=
 =?us-ascii?Q?UhxIuQGVjOC6plCCjuwENqBU7ZDDJB40TGvR6b6VHbqjgqp6zYfu/uzyFSvJ?=
 =?us-ascii?Q?34pOK7POxuGpveE+OsuWX5/apc+erQB7G76R91CRxbrUlMVAgMY6X983Oxm9?=
 =?us-ascii?Q?2OjZfEh3PKnGVsbJC44CRY9dXD8DFyt68lQmEjz8MZ4RU7mQcsA8r2GORI8Q?=
 =?us-ascii?Q?Cf6FofAawe2GKReqgb9SBYEBcrOPjQ2ej+jPhsqS5nLO8vafGSQOWaHmFXjB?=
 =?us-ascii?Q?wyb6XJZk0EU1p8qYtoymLi4BEtfaPNmFTNGyTEuHMDXXZJMBFLHOTzO8gueQ?=
 =?us-ascii?Q?T2J0vEgisK4pSrYCRCO6YmNeVWYX622hGwNkpjUCDJvfOOUvPkU6YX5RcrqG?=
 =?us-ascii?Q?9vbPLtk3/gX1ggJ4gsXIwSgg7bjjKBkH6o+AGm3oBmaRdUoFGhmaQiNvec+P?=
 =?us-ascii?Q?gDCGOywqiUFx7oOPaNsHwsznO22N6K07eC8fySfCuqgEJxf5pgKpyiqtSYzu?=
 =?us-ascii?Q?nwK6dNpim1d86/DKABQDExfs+oecVHrwBR0Er4RjXOyoz6MZBvDivwQw8cRj?=
 =?us-ascii?Q?kiUpO1ipN8N6CQR0/gZUNM/q179IwrlMmvnjfEGXdUmgZu1MMTD6TcyAbg+9?=
 =?us-ascii?Q?SRQXlsczFdnJwGH4xwDLIA/WF0kB3cxwxHoQBzzTFwx0DW9/H4OnAx9zMAS2?=
 =?us-ascii?Q?6yMbqgQQNe4IVf6mjL8FI94v7IzDQSWGZw+Scb04LPhTtrOLJezy8YBmka29?=
 =?us-ascii?Q?ek9QB6q2NNxXxVqGTOhAcTuHytE62R7jmjcNuiel?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b33b5d-e78c-4ad3-c0c4-08ddb2dcbfb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 05:05:33.4985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdanOfMkbQdLC8cuB5KMXVgeDi2un7rPt+wgkzgi3q0R6Phi+MEsdNx4GG1be3yLEpa91+s3eXrg9Fw+39Hc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Thursday, June 19, 2025 4:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy,
> Arun R <arun.r.murthy@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 1/3] tests/kms_async_flips: Fix suspend-resume subt=
est
>=20
> Currently suspend-resume subtest is only running on the first pipe as the
> variable is set to false in the first iteration.
>=20
> Add a temp variable to avoid this and actually run the test on all the pi=
pes as
> intended.
Can we add Fixes tag. If there is any issue around this ??=20
With this change looks good to me.=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_async_flips.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 065ac9c49..0f2d932e4 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -377,6 +377,7 @@ static void test_async_flip(data_t *data)
>  	long long int fps;
>  	struct timeval start, end, diff;
>  	int suspend_time =3D RUN_TIME / 2;
> +	bool temp =3D data->suspend_resume;
>=20
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>=20
> @@ -432,8 +433,8 @@ static void test_async_flip(data_t *data)
>  				     data->flip_interval, data->refresh_rate,
> MIN_FLIPS_PER_FRAME);
>  		}
>=20
> -		if (data->suspend_resume && diff.tv_sec =3D=3D suspend_time) {
> -			data->suspend_resume =3D false;
> +		if (data->suspend_resume && diff.tv_sec =3D=3D suspend_time &&
> temp) {
> +			temp =3D false;
>=20
> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
>  		}
>  		frame++;
> @@ -1028,6 +1029,7 @@ igt_main
>  		test_init_ops(&data);
>  		data.suspend_resume =3D true;
>  		run_test(&data, test_async_flip);
> +		data.suspend_resume =3D false;
>  	}
>=20
>  	igt_fixture {
> --
> 2.43.0

