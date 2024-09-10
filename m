Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3793EECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 10:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C0010E760;
	Tue, 10 Sep 2024 10:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qmex+iiy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED51910E760
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962422; x=1757498422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7acKLnD9AGNNIpNtdwcKiF+2hUFM+/WT646bSOSgKjw=;
 b=Qmex+iiy4CCXIyNyn+FgOxfsLY/+7I8tzHRBOuJopUWgNobCQsDOoSjn
 A7n8CbwzteDuwjikai+ub4zqrBO3vtXff6wGsX80GkG8twpI5xwyUcZ6I
 moCGI3cA4PTpRUjkyyAJQHnzwcJz55biQYucljFH1mqeKHwTB3JOGWPsY
 Y/fo1Uqn+CGtvRGGV7ycg98w1hPOWRR+/p3W1GFzUGwxbL0+bxk5OBiCE
 eNyFAm0L4I+IJ3BVhtOrs/Ngh0kyiVfgcdRk6aaMCQK4BFk8342BnoO6O
 GHp11Wj9Vq+Xn3pYwiv6cdHHaVypccN2P/7MtZqbiQ6yFKWn/RPrUwHsI Q==;
X-CSE-ConnectionGUID: agSuP8sPTiy5jsptlQUIdA==
X-CSE-MsgGUID: qR+pz4UnT+aVXMHeacxEFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42172762"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="42172762"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:00:22 -0700
X-CSE-ConnectionGUID: fSMxFPsyRp2X02WrdMHKNA==
X-CSE-MsgGUID: lz4ndbz3TdK4PJOu5pHPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67730405"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 03:00:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 03:00:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 03:00:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 03:00:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 03:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYmy63Mqkx/UwSjdZtoymdLTNRyg/xtt2IcRa0Q3FsAEY1VMUfT3kBpiqnPxxwv3992ZEoiSawUECt8geTehVP9Nt+1XKLVkHmn0oDaRvRpxsxyRaXqm8i2/wpgTJmot/yv2ccnSWAjAwcXxnIL2+99iqCZBAeTiXSTpbmivW4jTCv63qawLw6jfpIpPxuTsYTtx9XR8EC84JRILIJxT7i01yA6Hf3hzKAh6I/a5tx9dX1GHPthAsTTHAH0jSd9AmeBf2wLmDRimHvErGSCVtMvxzXmGNTlAPGoLpdQfuV7X4WbEnBAk6r7g/DQdTNeg4krnhLznGk6A3/Gu/hFp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNu9GsVaTfEM035SvhTbVy9v8653c7oe/vlUS5+ZB0E=;
 b=pxkNNFkp+mtYnDlOR1cUvlY2hFotZtmk6D0YY2L/SKReZ/ZGeupq4ANSJSo1r/7Upxoe9uEi8nMHpdd29PmbPGbH/qOw/g61GjDcmBydPH1ij3+3bkmDne6avkGM6EExKIGzWPxW3TZBuHm9pLlhiawIh1mcKj963RcxkYV/OWx9pu8CUpLxKcgiWfDuzKh545d7CfQjTFkfjekcD1pVcM+yh5AbmXFad3ltpVF/PqFWWi8EkWytJPTs4caNJOvajGvlGbYZkjdDuj9v1yQbN70lr4zw1VVbGPuQ+UWfCk6p9KFXoRlrRNBoavmJVN1pQpJBw45Fc9VWorcxbC74Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 10:00:19 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 10:00:19 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 3/3] test/kms_content_protection: Move test lic mst
 code.
Thread-Topic: [PATCH i-g-t 3/3] test/kms_content_protection: Move test lic mst
 code.
Thread-Index: AQHbA2aMudK6NOEYjUi4PlXoKYGXG7JQyaVQ
Date: Tue, 10 Sep 2024 10:00:18 +0000
Message-ID: <DM4PR11MB6312ACB6BE943D462D4732B0909A2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240910094529.545064-1-suraj.kandpal@intel.com>
 <20240910094529.545064-4-suraj.kandpal@intel.com>
In-Reply-To: <20240910094529.545064-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB8371:EE_
x-ms-office365-filtering-correlation-id: 68629278-a0dc-461e-2084-08dcd17f607e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HxJSH7iDlGseuGtjoRf+Fcqt1EVBK7Se1UmuDwniBEWWWJ69rPGaHxbMcnxn?=
 =?us-ascii?Q?6icdOQk5KkjAZFgHVy/zRlHpCdjJjzBj/xUQM48JFw90//DY3H1X+AWsbQ62?=
 =?us-ascii?Q?yo0iFkzd4JkXKMM//WCtHhA9kdlxU/gXYoh0Q2o/zxUYWcDabVImgYd+EbBh?=
 =?us-ascii?Q?c+Ad3x1MOXtar0GnMUmdJZGRP87rKUgSHvcELtdTmRE3oK2KUyq2J6iHoxyF?=
 =?us-ascii?Q?qjwd6RCMLWkyYyMdZ1iFux0M6I8/26aidCOcGbAlAailMOrjOmoyGiQAdvCy?=
 =?us-ascii?Q?5FwwLJfE8iaY9HIthFjW1IgeZTj91PkA4yWocDhJCnEB7ECS/Qg/GU4iKV39?=
 =?us-ascii?Q?lbLZMd0sbv0Or3P2WSLTPC7tinuG5eSE6bVwvwYcxs0ZaNXAtMLoBQpiSqkX?=
 =?us-ascii?Q?zrhxnww6G0gcLjEbdx2PNPLOGNzw2FrdC20dfXXsWa87n6d+FleuGnGoIfD+?=
 =?us-ascii?Q?7Zcx41pbgjadqkSna2KkOIA7dcQ9nTjQ14XVRhk9GaYeqNH/V9Z5Y4wdpPTZ?=
 =?us-ascii?Q?MH1HENg3IS+aWYQSqxCVsbK2EXXbXG1eqJIWMZsdcpPMagvS2L7oKn4mRaI0?=
 =?us-ascii?Q?/lPxDFN2Gt+TzXaF7mJHjDAvaU/tZi/a4DnvInhXVco5gc22uCOyaNSUBtSL?=
 =?us-ascii?Q?fuLrYKceIWB1NU+H4ArAIe/Lrn9egWQqIvv37aBNJ6gVUBIWlbbUyeGP3gdG?=
 =?us-ascii?Q?Vb7yVvpy1OK9I1EkdJ8keL/WFznrOpjVJEGCOmXwkWPJZvnAUOJmXow+h14F?=
 =?us-ascii?Q?2LUSfzc1iGg5DYGRIjPjO8WnCeO1OsmkGWfGexbJxjeo36WtQg18W/Q/dHUe?=
 =?us-ascii?Q?fwL+DASM9uLFZHGpiYCGZyUVqAKWfLz4eGqCWgfQiUJpFoRF1p4r6KiDmwIi?=
 =?us-ascii?Q?L8j3kEUz30vNojzuOHJ+HGnyENipDkF3TNeCJuGvuZGga/FBjCiDE0C/jXhr?=
 =?us-ascii?Q?T3rt1DiO59F4YXkeCIRxgHGAiyatlLsSkRDMFPT1zw7plRww6RlbgSKjt+vC?=
 =?us-ascii?Q?m/XS4z5ksF4QWeM+ktd1mGTGUHetZkL5eDWNCzXantG933EeDoJ6rYR6BlF0?=
 =?us-ascii?Q?AnIbOd664uVTej6l7tkIXWYTJpLQj+IWPBhc0RxX1J/fx7PWzTNmehZs6XLE?=
 =?us-ascii?Q?F/tv/T43HnipR3J57ILb94gT5nKr5CVeL/430/buXvvKUKebfvEIg+3QkCFU?=
 =?us-ascii?Q?U/yxHZOH57VL0HTk/ZNZy75ln47IgVM7SCi7CF0NeCJwUrCkMuieAbxNH2Eu?=
 =?us-ascii?Q?KS9Cr4pDcKxgvZ844QHg/2X0hDRzJhCN0EP/GQr+Li97hbYamveg74XncXfm?=
 =?us-ascii?Q?D5idZOR8k7/oimAMgQn5npvXMxQR/GgvsqdneAmVrJ4p8eBQMt0ucGzthRJo?=
 =?us-ascii?Q?p2FTePU4OaNgeQmc8AyGVgnJl2QNpzZz3dA/i1xs6Eielst2kg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5PSxRJ3IAWyz6R4HKURTJiDaqzZLrVG6O0++wZKeHoPYE5qQykq87mqET8xl?=
 =?us-ascii?Q?dr1nPcfBSXFTlbrc1QObkxBSqoL/ff5yXGm934stdjHpj8Y3hCUF/GSgCfyg?=
 =?us-ascii?Q?z8JNYFrBDSiKB5vwSjSLJAJ/1bqp2fwttUDL5Rpy75lLOTHXYVIdLJZDHu1X?=
 =?us-ascii?Q?9aSxdYeKmj/4Mq/9/u80rCxoLzkiyzIQK71oMoV7Ni0hI+KEDAJbz++TXg2a?=
 =?us-ascii?Q?NFKzDI7JIsxrdqjHDsm/lbIg8YqQsvN7HpvJXmt9YP+AlWWtmCa/+A2WmjRP?=
 =?us-ascii?Q?JvHQDprPNwxZc4t1AhC/XGmC1qwf5l7Huir8jufedx9ixVp64KPErFhXeEpk?=
 =?us-ascii?Q?CAWOxDQlo4JXIxMixQuQPlhbe9C8or+eG90uklJzGwzP7jbayLYnU+eoxb75?=
 =?us-ascii?Q?eEEbXpICWb/4x6JP86H0eMJHYBU3xIDJcZ5P9A3v6o3GKl6vo/DRSoH7QbdB?=
 =?us-ascii?Q?GY95A5jLqtQ+qorrY4WwX9ujm2s01FWwBRkA+r4qALzrxnefj6t6drOrbhH4?=
 =?us-ascii?Q?WvkmYdqu4XjdhWZQ00zzM+rnEB7SYgOK9QFZuQkGSnuVyAqDrUIVsP7GWLtz?=
 =?us-ascii?Q?t5cRHzQs28SyY5NBB0bTa1F/GeMc3zHW5f71BGUX9P5jDwnM5d521J7lr5MF?=
 =?us-ascii?Q?YjtO+n2AB250dU0ON0kiv5SdHrc0G1/npjewk6EHT6gvbIrel1ShVGDd+IfG?=
 =?us-ascii?Q?bxYNhJDAM0ZOGjTwOxaSlK40wdnZ9YwjJlSCL/PX7rp20fzxtjKVYvalpOpv?=
 =?us-ascii?Q?7E+JfZnM/pzfxZduZdaDBp0p0EPx6KVRMGCXdgaJbScPgmZgb+vGuewkK6Yz?=
 =?us-ascii?Q?Ao/gaMjwPEt3ILWHpfAHO16pFcjfwcIq1BTS9AfM9zDUPovjdUh+OvSgJe2F?=
 =?us-ascii?Q?7JJf/TuVIrx7GXg3U0UP8/S2g11rxBOjJveYuHNBHybzQvb0qgr+8U/kzs6E?=
 =?us-ascii?Q?OMe0bYwOZNTEYwdhVoH0Kxlem2aOvWjYWyT4RLC6lv01N/6s/bjtdP0g5MRl?=
 =?us-ascii?Q?zRTG5nmPa6BZZYtygR5vmM7vCFadWYAbAfKjAc1K/6d5sLEt6T0F23rKlyb8?=
 =?us-ascii?Q?/rlcR9nwk5sg2s8GriMQcrQQCO7qqDTSTRXDlMJgz2NZ9LzYpLP1hQG8O1br?=
 =?us-ascii?Q?/wOPesvHACTm5GfvjfwNL+pm97uVZ5TqnFNwt9W4AOATgy8LTrCJ8h2n9FkF?=
 =?us-ascii?Q?pjDiug3H9c/+hce/d++4a+sS15j9e3M9UvQ/AzECmc5zpvFe10yVUIcjxLmh?=
 =?us-ascii?Q?WM0QoF/NcJ+C0FadcRgP5iAMzP2DXPHa43JxtCoqdKYMviA6AV961/pRmLlt?=
 =?us-ascii?Q?oLDhS80cEzLU7V5J5OBRG5ofO0n6EYmcuyEQVLNOwByaZgKxEvG9x+xRtoNx?=
 =?us-ascii?Q?GOkhEst1qb8nsEUXykv1edPK2dz5ORvaLN74qqwV1tHM5STUkc9V15606165?=
 =?us-ascii?Q?pNYArxiE5DKFOZIcTO0cf28y7CDx2wKyMfvsCyYQkEw+8BUqVeM0buZt4gGn?=
 =?us-ascii?Q?MxqLopTsM6hdU9jbt8XEMnUscM+uDm+gqAe/uaEMgYU2QNTQeoT0t4+gkomY?=
 =?us-ascii?Q?NESuHPlj1WFk+YEJz7g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68629278-a0dc-461e-2084-08dcd17f607e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 10:00:18.9240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLCI27wEpKjWSkYan4FQbzJfuOQ18RjVwd0GY1fXaIEoLMFE8kfkN2I0azerIbpPNgmnZEhe63fxH2E/EwxS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, September 10, 2024 3:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 3/3] test/kms_content_protection: Move test lic mst
> code.
>=20
> Move mst lic code before screen color change to avoid upsetting lic test =
as it
> ends up failing due to the commit that's done without seeting CP property=
.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_content_protection.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c
> b/tests/kms_content_protection.c index c3771fad8..cb4d825cd 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -760,6 +760,9 @@ test_content_protection_mst(int content_type)
>=20
>  	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output,
> valid_outputs, 2, content_type);
>=20
> +	if (data.cp_tests & CP_LIC)
> +		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> +
>  	if (ret) {
>  		for (i =3D 0; i < valid_outputs; i++)
>=20
> 	prepare_modeset_on_mst_output(hdcp_mst_output[i], true); @@ -
> 767,9 +770,6 @@ test_content_protection_mst(int content_type)
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  	}
>=20
> -	if (data.cp_tests & CP_LIC)
> -		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> -
>  	/*
>  	 * Verify if CP is still enabled on other outputs by disabling CP on th=
e
> first output.
>  	 */
> --
> 2.43.2

