Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941BEC28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 03:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B11810E2AD;
	Wed, 26 Mar 2025 03:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h05orGNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6810E2AD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 03:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742961316; x=1774497316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QnjbOjgWkhl9pilKVzYk27tfzZmGJQ1qh8BwRSZOcBk=;
 b=h05orGNyCfC7rkMzAZrt7S27TeKEF3wr4gNXpcrlv5GVnUWxpWtsLT3C
 qCvSZ+6PVLxbPHhxo/70pPSSMGde+0F8sJus78R+Yx9+OAO3hWBSecUso
 USo6x3/M2TgkOOrHD80PcFf8g4bgEKSFfD45BKwmo3t33qjSsRM6eFOFX
 5LWLM4LcuspG1LtPsGKYsFx+UFCCv8A5BOTjd8DFqDCzGgiiYsOPzWIOa
 FeMglwLZT8WafUt4byuYRqmGQm8EFJBi2Q5tmQ1PQnQdJRnnygcqx4p2r
 /427nTZwZySQxEozR+CtpUbuCi41FYZvNnD3MoiGX0+TJkTe1uZdCl+pI Q==;
X-CSE-ConnectionGUID: VEH9S+r0R3yTs5m0fJyyKg==
X-CSE-MsgGUID: rnaQGg02RzKKcvC6q94qqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54435415"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="54435415"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:55:16 -0700
X-CSE-ConnectionGUID: vPLBBNRESZ+yMeWTMKmCfA==
X-CSE-MsgGUID: TAzS8ZtJRLCrJYMs+/UgQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="129642732"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 20:55:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 20:55:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 20:55:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 20:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxXgXNG+3nLk8CQ8coEAYJhg9BNacOQuHj7jwWYjPZ8V0R0Azu80Whn0JilV6gt02OqtQGJL5gW97RCfJbN6zszXsSiPlfxJ7HO+VkjKaRUpTu5SxMM0uW4cHTvt82uKJDtfOOgwvhZ4WdPhKoEowU4PSpIXrLq8BI2yUzeEy+B4bpujBaX+IRwuRuIfle/ltQfscA53heMDPlBkAlVqlnKZ/GWXur7AG+H3LKbFz/wdGkenR6uBEXaFFlBdwoEUi1UvmB4BC3YYy7O8dDUw1FhYnlLj9/MLcFG+2wjhDZ/wZs927HQnjgpsxVTrjvGSlMOhdfsWnVy7uYxHMDmJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfIG2W6JFNCkCafZaN7KtZxJ1kjKR4iU8jptWi+LlZE=;
 b=h3F3yIFfnBegPV0cDhdVQhlas7AD40hSuBWhI6wMyHkgPTUm/u3mIFdW6L0Ru18SNL2LhXe9bUREfrEoJGUiheLE1NdW5lCMJNFUfYA7G721ppgoOf+hdn5HAZtsefLa4AV3ncFset1zZLlo8W9olVxHuRSH88oZKWd8jW5PwMj+yIioAXPR8fkqDnoPbaqLYtHPTR39Q0Zaj4KL5O0TXOfv5BZs+HXcLMbmOSMASoxKpO0rNYd1b1OajaYYh2DdgmXH64yzYhQreGuRUHU4LfMRuY1vwLkn1qcvtdwHj9OFvCzB3Fvogfx9eLLqibGCcbaxvc0HxQxnurl2MpcbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 03:54:50 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 03:54:50 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v7 4/4] tests/kms_async_flips: Remove allow_fail
 flag from async flip tests
Thread-Topic: [PATCH i-g-t v7 4/4] tests/kms_async_flips: Remove allow_fail
 flag from async flip tests
Thread-Index: AQHbnYCME+H+DwKXCku41wgnIBZjZ7OEymkA
Date: Wed, 26 Mar 2025 03:54:50 +0000
Message-ID: <SJ1PR11MB6129E539A06D503E9BEC4144B9A62@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
 <20250325121625.2718374-5-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250325121625.2718374-5-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB8151:EE_
x-ms-office365-filtering-correlation-id: 1f9bf2dc-51d4-44ec-4142-08dd6c19f58c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O9k4G8pVz7qYjV4YHlVPt7nX2Y49a2sWMQHCy+4xEQR4zMDah4c41ooD6M0v?=
 =?us-ascii?Q?bd9fEP1Dtz20gZBUr3xuduRIHfW/7P9kdXpm/op6CmDt2da0XQWOI3fYyp6f?=
 =?us-ascii?Q?xXi3AJsLJ2SacYbJhWyn13i/eyHRAxLNQ0iNSpdZ69xBQxn/Dl/ZEGq+a0yu?=
 =?us-ascii?Q?aseQVMAskEz8AmJ1v0ZIP6yBVe8JD2gC/c7HSLf9wgFCnaRpFLSlgSPqHX3p?=
 =?us-ascii?Q?NqPpAwpMjRnV9upB9xO8CvN6dJYYLnKZGjlGe8SPEitUvzuZWGTcVAxfriFl?=
 =?us-ascii?Q?/jG8YLunssSJ3LkjXeIYAmyVf/C616kUxwkhLRuQsp5pakzYi0oPF5etpCAJ?=
 =?us-ascii?Q?gZSAHv5vtvv27oGye8Q4jCNDkAT0l93ZATbHwRzvOIpXG+M+Ye9gfc7TFyXB?=
 =?us-ascii?Q?QJZwrMxdqMaJiphQ/D1OgUSZ9plrVsteWf2FEtKGVOvgNW+ObYAj2zNrhH6g?=
 =?us-ascii?Q?vIpl+v8gci055BhxpVDWDyRAgMorehdDPJxsUVMkDEtp4geqGWzXsJlr+EJZ?=
 =?us-ascii?Q?wZaERxMKLyosk0vEseA1hVMt1JsEb3OoEh/B0r4uWLKybMLKIN6kprdyBfm9?=
 =?us-ascii?Q?5yWEPY46XKrZAeLedJh6HhCB7JAgx8dtm2XyppQVPn2VMNkr7pqPl1gYf1CD?=
 =?us-ascii?Q?nb3vbYFqFiSjDw4uNokzAaCGF0PQohDud2BD4z7oaTh0JTTBj4ZDFDSufubm?=
 =?us-ascii?Q?ngBuRAgBw43rCkvoesXLKNs3AZsVk+HrwqJp+KgCPEEuejJxJ63amNZBWVkK?=
 =?us-ascii?Q?Fn3T75UVpVuqYKc1x6v79caDXgKMQIy3So+OThpyZlv7eAL43V2xRevmc9ld?=
 =?us-ascii?Q?IjKm04vedjsfOcjVp4/kieWjTkeC+OexL/I7Nne3LOo+9TAQsfihWFlnigte?=
 =?us-ascii?Q?He/6LClsomYHKIzyvMuXcZrm4mjCJf2EeYffUCzWqulp7eTnQXzQMPkyHw/8?=
 =?us-ascii?Q?R2oETdw/1hrsnMJaqVezE0NklwDFWz5CLqPhDmkLN/txgLkj/jBMmXmxj4xw?=
 =?us-ascii?Q?V2C2lDeV+MahtlJ7Q+dHeKMqCMhzyhm1CV0Y9+SE4KHiMgrtOEIUw1dnLEgl?=
 =?us-ascii?Q?ttRYTj7Kt276++Kbv7PF3X4Q07V9SxMMVXbx+ErR5xynBDL1MWQLgHmWYUed?=
 =?us-ascii?Q?sVeCpW687O4B8e33IJQlBgYLg7nCr6iUhnHwjrk8KQBnv8VN6bzuFNyq3XoB?=
 =?us-ascii?Q?DvuXRqX6cCV7vNSV/2DZTAasW1VE7Dmhnhel7k/S1VGt4JTcZ1go6ID/KqIF?=
 =?us-ascii?Q?WOHxVLAGKb5vhuFz34zDElFTU++fdYEzzzeekQfNtxy7/3xhbHwo7UtG+5HU?=
 =?us-ascii?Q?ghkP6ECkgMEf33UjNiQcUkuLEp7GvRPY+gqbeBpWDrVSxJee8rYtm746gNv+?=
 =?us-ascii?Q?5te/v0+vsL7Sh/HiWi7Y7EjbKX0Ga7fL8kv2vSC2ESgH7Hc8loCGgQ52bGJy?=
 =?us-ascii?Q?5RVuwFszq+KPl435+2PD1//Hn4qF9+VQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tn2ZFrCQKLJ7y9vNxEC93gsmedGsLer8IJsWWWTOXx2Ezv4nzn4R9tCB7BqA?=
 =?us-ascii?Q?294tP0Nw34UDGLed639FpwkmScxAHt+XtuQtMGKu/MRGEnTms5k3INLR+WNy?=
 =?us-ascii?Q?mP0kO6jqntZuiwwkTQk80QXVrDF90GR5z4bCULKb1f7sQehFN6SZ6365IaOH?=
 =?us-ascii?Q?WGDlGqSs80tjq16ZdruEDWH0YzKeTFI7CjNKdsSPXpHbN3UFbSMegESWLk1f?=
 =?us-ascii?Q?lmLtyJ8WUNbJCuv5MvFDnH6RwLRfkZU9PTiZdDnzAbV0OtQiwHapejUK507z?=
 =?us-ascii?Q?Dkmu/NgBScPGSh4U8KzR8rg1dkoLTqWvAvij+8iiYDSnJ/JdE/poGqQA0dA/?=
 =?us-ascii?Q?y8zlFLtNSHswM1zqZFMcAoruuggmVpn/Of8Rr+SLShb+HvS2SL3qA9Tt04b2?=
 =?us-ascii?Q?5a2Q5tezckye8AnSK6rVwtTcNn32RGNceTXt9JoOVJ7OQHgZGnlLcKNuDvMM?=
 =?us-ascii?Q?myvVWqB0+DojyvF7MKZLCLu1jLPSbEH4dBqJoLqVCZDV+Byov7JSPk0Ph63c?=
 =?us-ascii?Q?af+ADJQcQ4ha0kbr+7YbCn4d98lsLfOBobfr+jn4yKfDAgIDAw/+kLSy9hod?=
 =?us-ascii?Q?9A48kveRF4b0XVvC3harPG8ickXjPk78DbF5f4yd9TELngYfYz8S5g2L84zV?=
 =?us-ascii?Q?E0OFjTlWQxbyuitYi8qrxpaIrbJWvyVyIFcpWHZQOEJP/fqqimo8ChPZdmMN?=
 =?us-ascii?Q?6qiCVdm8yfTFD2jjL9is6C6LruId9sMuN+2cH1lhNyzHXivTflehoymVpFet?=
 =?us-ascii?Q?45MTOUhVDWS8ekCXPUstECh1xPKGEwNdBsNhn0pNIidjIOQBNa+P5sHv4KQb?=
 =?us-ascii?Q?doZO827McBbsEMxlvGmP0042JCbXiJKf1TqP5MgPD6ZjIJ+E3WUQiLKhIdFI?=
 =?us-ascii?Q?OEYu5s/I4oGu4EUI9Ks8Tf1Y//M4iBWY6ExtmAkbx++7p9UyGD81Z0ActFOV?=
 =?us-ascii?Q?wVG6p/OtvYJ/EaeiSKJtUIqXR4GM7AEbQ0lwxn338pVr5ineaEignGL7wZmI?=
 =?us-ascii?Q?qGuTiUnVLO21wDbDGC4KNojsZQXougRilk3KqLY14bJkCbUEhZVfRM3VOwgQ?=
 =?us-ascii?Q?3w8e82BHwNCU2jcKG56f/BhHOkf/8nZs5KP2ftdO5QgB9MQowi5+723yN/Ud?=
 =?us-ascii?Q?5GLHpFykTuFAN74VJEK/982Io/YZY2lcLYvLHHuuGTukPUOz4nacS7Yycnms?=
 =?us-ascii?Q?KyMuMVAGgKsbXuyKj6ml3PjfjPBhsqp31jEoGfJcH0q9zjO50ORefFYS4w3Y?=
 =?us-ascii?Q?0rYIv2PUgyqdFIVMHcSLw9Kiq3WLbQZcdxxChIiNRxqgocA03NdwiJQkmgx9?=
 =?us-ascii?Q?kiaihdtHwRDb3HftuDRmDl2KYs4kT4xnSGdqk47z+EkGRVYPyZfL1EsOCFuI?=
 =?us-ascii?Q?IvOHLSd+2YlHFaLzpKy06dD8ZnpnCIe6um1zB+PuDWRgcVSqaQNnVt3Hwrdt?=
 =?us-ascii?Q?CoTiQT5QdyZxULmgAE/Sy0eBCvCX+rJtHx2NGS2touxVAGQJb9HtEIbx1bBw?=
 =?us-ascii?Q?g6xxR+xCK/AvEIzwvdWo9kJpjSljBXx9+imqr27NFV5Opq6J3MtHuzVno/Hb?=
 =?us-ascii?Q?S5FzoIlxkItzBikuSDqLR+HtYX4KvxU1esgsUcNRvXzsj7LXSwkmvdhHhuWT?=
 =?us-ascii?Q?1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9bf2dc-51d4-44ec-4142-08dd6c19f58c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 03:54:50.5941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDHrAXhdQirP0SMtcDiuqwjDVKKxEYICxQJ21XumaY+du1IdfZbDhGVA6vsbxmKiSyA7zytibQf00Z9NRVIfVg5FcJGalNeVvVAa9W8P+8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
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
> Sent: Tuesday, March 25, 2025 5:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v7 4/4] tests/kms_async_flips: Remove allow_fail fl=
ag
> from async flip tests
>=20
> Remove allow_fail flag as the async supported format modifiers are now
> known to the user space. The test now executes for all supported format
> modifiers.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 1fdd13b99..0f2ad8acf 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -123,7 +123,6 @@ typedef struct {
>  	enum pipe pipe;
>  	bool alternate_sync_async;
>  	bool suspend_resume;
> -	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
>  	unsigned int plane_format;
> @@ -338,7 +337,7 @@ static void test_async_flip(data_t *data)
>=20
>  		ret =3D perform_flip(data, frame, flags);
>=20
> -		if (frame =3D=3D 1 && data->allow_fail)
> +		if (frame =3D=3D 1)
>  			igt_skip_on(ret =3D=3D -EINVAL);

We can forgo with this whole block, right? Since we will not flip with an i=
nvalid modifier.

Regards

Chaitanya

>  		else
>  			igt_assert_eq(ret, 0);
> @@ -715,7 +714,6 @@ static void run_test(data_t *data, void (*test)(data_=
t
> *))
>  			continue;
>=20
>  		test_init(data);
> -		data->allow_fail =3D false;
>  		data->modifier =3D default_modifier(data);
>  		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data-
> >pipe), data->output->name) {
>  			/*
> --
> 2.34.1

