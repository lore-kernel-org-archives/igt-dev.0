Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95F6C36005
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 03:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A1B10E0D7;
	Wed, 26 Mar 2025 03:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glhmNdHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD4610E0D7
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 03:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742959999; x=1774495999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gBl36lQ42FtgNe5/oreCxB6vgdfkEOZAJzvKjSrY+5A=;
 b=glhmNdHhLlu/OZhmhtOx2oAKojkcUxBWktNbhG7DUIRibqlX0V/QlwaG
 QpmA+JU1hCNpWCfhCioW4j7UkAz/bS9bGEYne9/IXlbJDAuppHejZ49r8
 fuZnsNLKGlpMUUpSVPWIXnCZW+0ADMyd8ibk1jUUNQI8GK2ZyC9OjP9xb
 PV1tYWFV09PBfLmiAnTOjB7Qp9+p8wl8oufRpxeRdptlMB/ZOp2nI48Mn
 e0U6XkbhiIBPjgnnG0p7w7mOBGqEgoKgtvHhoFA3RKB97squs8g78Y+tE
 2TqeE5Lpmd2OGndgv/pmrAJeM14PyeDaqgW31QwjMwP1YdBUuq/VLD9p+ w==;
X-CSE-ConnectionGUID: uT6F1vlyQOeBExcVfvPJHw==
X-CSE-MsgGUID: WLTCgsXnRiqPdjkq8itbBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44118732"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="44118732"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:33:18 -0700
X-CSE-ConnectionGUID: m0KJXuvuTR2tq0rPbq+j2Q==
X-CSE-MsgGUID: LXn9jolZToC8ih9KqBXJjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="124765464"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:33:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 20:33:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 20:33:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 20:33:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yI7wn0EVjb++sLkOmdQBPbZLCBFu/P+KZckee+C7v6/Hr4IUIi2ZsEt5OZ11s2pAGzFHsRDJpjXodLHGP6017QggcKoTfzSK0KdVNS9iWKq7lrLchNuoi/3Z88glOBNqaTI7rquGbtiBTdcFMq6G9xLtZe7m2ZsSE2L2ckAV7FfMYaIJ84LvDEFJ43En4g1vgmQtrzxsFdOWunNZEdjOX6BadosizmtMaOVO2ZfMCdahNWWony5VMd6l3RROgzeA4/gwEeGbRS6H1Bezv1IFkAZUECvAE4tUXSin0DrRmzGbZbfosyee+z9fv/F2ZOtmZ2BZBU3nRh0owO9FQE7bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iup0Vb94eftv8kOyAwW/mXSEnNQtrQaCd93pDuQd4ww=;
 b=OIGJTazBXpwBLzgJF6ZK7f/k1iBDP+4qk9fj5MTLPpKXyCHaXcedB8bpRI1fs5uOsMDeayCSyxPGiE3LV8WQwNrDpJn6Kbpq4PvR80WBZEd7PUIBbWWyyTpzJfIJ2tufWE8DgdEQspUqrHY68bfh1ps1uGKJik+cbKaGZ68qNKCQaHky0vVbltphp96vGPrL15hW7tV1ZigmgbyVfiz3s0mmCQaR0zJEiEnmwVq+BTy5ilwvlofSZNs/KvFbrNvNpqpH0T7kKCdut3ROJoruFMPwPGMuM59vZKpHC+hFATmkj0aGX3FqfhDOIHADtkBzNm9NOUIqL5HPNCOFRMQR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 03:33:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 03:33:13 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v7 1/4] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Topic: [PATCH i-g-t v7 1/4] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Index: AQHbnYCGBdFsfYIWkkeoX15tBXXukLOEw84Q
Date: Wed, 26 Mar 2025 03:33:13 +0000
Message-ID: <SJ1PR11MB6129209C6A6BDD55E34A897FB9A62@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
 <20250325121625.2718374-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250325121625.2718374-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|BL3PR11MB6410:EE_
x-ms-office365-filtering-correlation-id: 5b60a733-1e0b-4c28-0c25-08dd6c16f033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?slBlOIUAQlEgzmECLBQPPvxmnpJFW8VqDAkZ2eNExJnPZcupBXoheRmgDA5s?=
 =?us-ascii?Q?h9k+UBP/fV2uyFcO9HcAqdqMxq13sZ2xUAo+p3g8dzTbd2sXrTOKOkWBCoaS?=
 =?us-ascii?Q?DadCiwGDz+6igSFtE3MIKmXTvcVrFv18N33BnTLwpDwEvxLXHCrs/8x2dRoZ?=
 =?us-ascii?Q?U5c/8DzUh4fa138WdzV8C3FXy3rHplkwAT+XYHSBxQGmoW1xGc253GOkth+p?=
 =?us-ascii?Q?Vvs/SFgyf2badze4MJk3F644XRrC/TNxUU6V/wx28Fa0BxteZXhHiKb5tFgP?=
 =?us-ascii?Q?Q9yKHxzi9dNmBobhV4Sb1JSEOSzAQV5FN97IFX2wE17PQ9Mi2j0aQ/RHlQMI?=
 =?us-ascii?Q?89WM1VoQK1CoMnW8u4VPuMEcCj7qtySPSvrz8sHONdbRyLUNGqqmB5pReHh/?=
 =?us-ascii?Q?XYFTaKSjNY23dOad+XlkK4AU3fxSmzXUnb9t4EJdeVZIvHMklTyJVwlSNLNk?=
 =?us-ascii?Q?LlkjdjSiPROtMg1drJTHOGXiWJS/6giXyntumclF/2OsI1hrtppjo6owxwUR?=
 =?us-ascii?Q?k6BAT+37rEpZOumrMyAL+sPzTO7LNYIlTLqTDz4+x1vLwLxGiFdKZMTHcOEN?=
 =?us-ascii?Q?klNLbl4SRNHOrGY4Hh/sYvU1rQ6mnq+45CRR0U8GwXEX9Aq2//1Iq9q03pZb?=
 =?us-ascii?Q?Rdm+dPhHltmu2kh71LFbInmgoGaESFf60vdWFrd+QDRV+GIRhrfnaHOccTWM?=
 =?us-ascii?Q?R3qrgF59mOJeO7KH8D326KONsBO4OxK64kRwx2OBlpX0xQXAKNFVx9xw++PK?=
 =?us-ascii?Q?V7AFJnTu/k2F1iax1i25kMzTJFI+1mqJe9lFh2q1+MGsfK48ybYvHIUgCOh+?=
 =?us-ascii?Q?DLMEn4OzoHZONU1a3vmSGFWqC8ve8yM6EjT3PNsvdtIT2G14N26YumUfWNtQ?=
 =?us-ascii?Q?V06Yo1qkaPDjQLYgoDxjPYeCeRZpmPJcZngheqxnkEUb2Z6QVNQwidflKzYk?=
 =?us-ascii?Q?D9eBRrQBFtt/zoNyMsa/UNnWEdxMxGG3ng4Kd/DiWVRS7GNXfUU+kZDuyyTw?=
 =?us-ascii?Q?xbi3GHA8A9rnkQpw2alcUWwTeUEiayhVcBw2VpUqoIsSU82QiWcF9xQw57Hl?=
 =?us-ascii?Q?MhKOPglQqlKcRSICQeSCDZkAvLY7uvFpO50cHvE0n+Z6n6t5L0MrMSAxGdfs?=
 =?us-ascii?Q?VwECy2qhjXugY2yZtq8iKML2euKfUQUGsWPX7h53NhuEbRfsqewhXG74b6qC?=
 =?us-ascii?Q?6DhEkfiPqmns18jakGwp4gTbbGRTlLh0Ky3AUAVAYHNJCu3Jajai4ZCRTqkQ?=
 =?us-ascii?Q?oabz0Lr7vK7vR1BkycKowtBLE2eSmqWyUTsLf+cC/Pn5IU52IlSJZjX7YAW/?=
 =?us-ascii?Q?9cYHHzcGAdN+60jO/eD7xLyVWEvu3YlVIFqr+SXw8KiIt66OW17GEysA7+wg?=
 =?us-ascii?Q?xvU954KOxu3JnxnFxid3XNovpVtYyN8cHaA+LiRRD0wlzjpJ5CBtunx6PzNU?=
 =?us-ascii?Q?5x0ENp5Y1cFUeZsIt/sqCY1YZfbLKFKx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GILgrknKtVxBnjozyvgC5hTBe/CruXGKLqFmvOMyj+MiGGbZFC89O0CMM0FT?=
 =?us-ascii?Q?PoKbx5nQhFGrX7BD+tuI1jyHOmajLCM/Dfm8kDvzc2Uwh7bf6sqvbjG+ineY?=
 =?us-ascii?Q?EOR7t/+yMGKEvknwASiYWNqF52wR3VKv+HRY/gWagPTrRIRRPkvl3Bim1Z11?=
 =?us-ascii?Q?ymYmMyQxZIIEvX5HmH8N/ydEUGamnutotk8vmg+AOzdu/QCY0sv0ftWVy++W?=
 =?us-ascii?Q?UIeyob6cpw0audSpKvOTUt/ksxE+DjYn4JpIoOI4Eq04rQfpCAIdvha3/5yd?=
 =?us-ascii?Q?nwADLRavsJjc3fcOMp59YBJwtZqQqDldwd561WvKMsWebgZsmy1vRMagZscf?=
 =?us-ascii?Q?/zo0KpGXI5xb6fZuUi+BNbBMlP7iOVbC8gGjwc115O4DuMoiiQ6P45STdECn?=
 =?us-ascii?Q?i02nANWmBIj2lTP7Aa5+Kv/smPM73cAjfDTYTbkcUuDIFDpLvJK9fqzYIK/Z?=
 =?us-ascii?Q?bfb0Yj7MWbdiTTe8fQlzNJlqQKN99PyiSy2ZOORkvE2ozQK5co2SaisjdxUf?=
 =?us-ascii?Q?qzIB5lJtsD68N4ArlZjyTvwaXHlOWoZcASiVRzM4NqJAwA5UYPU+pkxGhbLN?=
 =?us-ascii?Q?LUG+A0C70kJU56/oBL8WW7uk6T54rpn/ZIH1MGlbtZ+SV/gxh9WcbtWkThvI?=
 =?us-ascii?Q?BAoBVLvg5B7w/GQzcz1cjB63A3KglS0hQwq3JRDgB8dndkr0GeCz8Lf8YtF4?=
 =?us-ascii?Q?b6JaLRa6URKi5is5mMLcOumFMLb6d7te2pnSEe5IdvEr/dmAfrpw9zImhNrC?=
 =?us-ascii?Q?+qC5YBUZbcN4GldwfhOun0GS3ydHEl6lVrdxlWn3yESBvWqFyAriSCv0x7eO?=
 =?us-ascii?Q?CdG8xH2tUUKyX1KQkFMzXQJxQvyDParnKal35hHI7gyhnKS+qlr/ZId2zDm0?=
 =?us-ascii?Q?dnbcOovuiR2tfbNjUYXdHnsEwaNs24dGzOEH7bgxZ2zfUg4lRUdxTnb2jB4s?=
 =?us-ascii?Q?mT9lD+TJhrL0vuaEas8luX5If1RT1mOb2y23k4u1JIXMsXeruoYtoJ+z2RUD?=
 =?us-ascii?Q?fcKwPqcPU2I1i1map2QQs4t7VhoNk4lpOD2/mva4vnzE2pvrPx5OF6++Z67G?=
 =?us-ascii?Q?hTMIN2Kln8LSGy6b67hO/flYQKYhldNRidkfsPUDf8IhrsInaq5MSHCrGSKg?=
 =?us-ascii?Q?8jZDgLNd2Q7Cf4y+uY1tllF9+lIBoGa7prETNeSKtKb6BELTQoxhMOJUJuop?=
 =?us-ascii?Q?kpVOn4fvJTvV2S3dICyklgc8bogSLsVu6wp6bScP89pki0jNpXIdO/LuIpPN?=
 =?us-ascii?Q?svoXOJMWCjVFYF+C1uqQYl63i/zfYP5JThqi4koHKwPnNGX89sr6F4kCPL/m?=
 =?us-ascii?Q?Rfjz/0ltjnhK3DMQzvhS6ZaZ9LSP+ZfzGv82x9UeQ/H1ip7zuSwNXOuARIIk?=
 =?us-ascii?Q?aam4+1dpTpuXkFkuclisNzm7gSILg/xLDdYPUk/9/YC6G45LE60la2i/JVyP?=
 =?us-ascii?Q?3RAgvWxeLEUYmGhHO8zWcPl8qHq7oMq8gUwiTq5v/8CDONey/9Rx6I1dY5/n?=
 =?us-ascii?Q?D4TwhiFdgqRaP+lSmJgl0cFREslQ/ORL1Zf3GXh2N+tRLbidxnR8qwf465D2?=
 =?us-ascii?Q?mGxJPvSS7+SMt3cOtTcTFSDmjfwL3fD613xiJl2FprDUL4pMFCXuUUxhclu8?=
 =?us-ascii?Q?wQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b60a733-1e0b-4c28-0c25-08dd6c16f033
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 03:33:13.1334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRH3RdVeSqteIvxhSr50Hg+brTBq/pefRoZ/Ipo8xIWX3KmkdiqShf8qtApspKfthxJWNecjbzftv/AD4zSNNWsy5r25GgIJVXGEHyWV/xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
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
> Subject: [PATCH i-g-t v7 1/4] lib/igt_kms: Add support to retrieve async
> modifiers and formats
>=20
> Parse "IN_FORMATS_ASYNC" plane property to identify supported format
> modifier pairs for async flips
>=20
> V2: Add new fields async_formats and reset idx.
>=20
> V3: Improve commit message , remove unused declaration (Chaitanya)
>     Introduce structure to hold a format modifier and its
>     associated format list.
>=20
> V4: Implement format+modifier tuples for async similar to IN_FORMATS
>     (Chaitanya).
>=20
> V5: Re use local variables for async formats and free blob after
>     usage(Chaitanya)
>=20
> V6: Initialize async_modifiers and async_formats to NULL. (Chaitanya)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  lib/igt_kms.c | 55
> +++++++++++++++++++++++++++++++++++++++++++++++++--
>  lib/igt_kms.h |  7 ++++++-
>  2 files changed, 59 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cc3bb3ae7..7e192a897 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -701,6 +701,7 @@ const char * const
> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {
>  	[IGT_PLANE_FB_DAMAGE_CLIPS] =3D "FB_DAMAGE_CLIPS",
>  	[IGT_PLANE_SCALING_FILTER] =3D "SCALING_FILTER",
>  	[IGT_PLANE_SIZE_HINTS] =3D "SIZE_HINTS",
> +	[IGT_PLANE_IN_FORMATS_ASYNC] =3D "IN_FORMATS_ASYNC",
>  };
>=20
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D { @@ -
> 5759,10 +5760,12 @@ static int igt_count_plane_format_mod(const struct
> drm_format_modifier_blob *blo  static void
> igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)  {
>  	const struct drm_format_modifier_blob *blob_data;
> +	const struct drm_format_modifier *async_modifiers =3D NULL;
>  	drmModePropertyBlobPtr blob;
>  	uint64_t blob_id;
>  	int idx =3D 0;
> -	int count;
> +	int count =3D 0;
> +	const uint32_t *async_formats =3D NULL;
>=20
>  	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>  		drmModePlanePtr p =3D plane->drm_plane; @@ -5796,8
> +5799,10 @@ static void igt_fill_plane_format_mod(igt_display_t *display,
> igt_plane_t *plane
>  	blob_data =3D (const struct drm_format_modifier_blob *) blob->data;
>=20
>  	count =3D igt_count_plane_format_mod(blob_data);
> -	if (!count)
> +	if (!count) {
> +		drmModeFreePropertyBlob(blob);
>  		return;
> +	}
>=20
>  	plane->format_mod_count =3D count;
>  	plane->formats =3D calloc(count, sizeof(plane->formats[0])); @@ -
> 5822,6 +5827,52 @@ static void igt_fill_plane_format_mod(igt_display_t
> *display, igt_plane_t *plane
>  	}
>=20
>  	igt_assert_eq(idx, plane->format_mod_count);
> +
> +	drmModeFreePropertyBlob(blob);
> +
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
> +		return;
> +
> +	blob_id =3D igt_plane_get_prop(plane,
> IGT_PLANE_IN_FORMATS_ASYNC);
> +	blob =3D drmModeGetPropertyBlob(display->drm_fd, blob_id);
> +
> +	if (!blob)
> +		return;
> +
> +	blob_data =3D (const struct drm_format_modifier_blob *)blob->data;
> +	count =3D igt_count_plane_format_mod(blob_data);
> +
> +	if (!count) {

We exit without assigning 0 to plane->async_format_mod_count.
So when the test runs you might end up with garbage.

Regards

Chaitanya

> +		drmModeFreePropertyBlob(blob);
> +		return;
> +	}
> +
> +	plane->async_format_mod_count =3D count;
> +	plane->async_modifiers =3D calloc(count, sizeof(plane-
> >async_modifiers[0]));
> +	igt_assert(plane->async_modifiers);
> +
> +	plane->async_formats =3D calloc(count, sizeof(plane-
> >async_formats[0]));
> +	igt_assert(plane->async_formats);
> +
> +	idx =3D 0;
> +	for (int i =3D 0; i < blob_data->count_modifiers; i++) {
> +		for (int j =3D 0; j < 64; j++) {
> +			async_modifiers =3D modifiers_ptr(blob_data);
> +			async_formats =3D formats_ptr(blob_data);
> +
> +			if (!(async_modifiers[i].formats & (1ULL << j)))
> +				continue;
> +
> +			plane->async_formats[idx] =3D
> async_formats[async_modifiers[i].offset + j];
> +			plane->async_modifiers[idx] =3D
> async_modifiers[i].modifier;
> +			idx++;
> +			igt_assert_lte(idx, plane->async_format_mod_count);
> +		}
> +	}
> +
> +	igt_assert_eq(idx, plane->async_format_mod_count);
> +
> +	drmModeFreePropertyBlob(blob);
>  }
>=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27b545f52..78d6a7ee4 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>         IGT_PLANE_HOTSPOT_X,
>         IGT_PLANE_HOTSPOT_Y,
>         IGT_PLANE_SIZE_HINTS,
> -       IGT_NUM_PLANE_PROPS
> +       IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_NUM_PLANE_PROPS,
>  };
>=20
>  /**
> @@ -438,6 +439,10 @@ typedef struct igt_plane {
>  	uint64_t *modifiers;
>  	uint32_t *formats;
>  	int format_mod_count;
> +
> +	uint64_t *async_modifiers;
> +	uint32_t *async_formats;
> +	int async_format_mod_count;
>  } igt_plane_t;
>=20
>  /*
> --
> 2.34.1

