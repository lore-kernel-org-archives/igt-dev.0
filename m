Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82640C36002
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 03:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E88210E2F2;
	Tue, 25 Mar 2025 03:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCSMD2JX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69A610E2F2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 03:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742873074; x=1774409074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NdEblHECBvpBvhnjbgfyS0c4J0Zfe9fTgQDBET9Jh0U=;
 b=iCSMD2JX1l6ScNk2fx7F9bFiCoJdwO6PZX3LX6evi/4mhlvHkstyDObD
 WmDsO5pbMIReGqmzjMYehfGPDpbHe9MEVbvRmgHOHeDC3K1rZ3icobXK+
 QsKIo/OKkEFrb3wAZBOL/3RZ0LGGRE7UlpriUENT18h6qSCyzvv+HV6bi
 cs4PF6706F9oG9hxZJj8HsC9NkcdluTi06ANx5LiCzu9ngpsHNaO2iVWG
 l7lx90xvTtpATwH99RnroDXgHbAKTbDNpfHqFm2DzVGdDJUUpoiXvk1Ux
 n+GD32vnQJDSjHbRUrn0qaz5sT7vpMczsAV0CwR8LMdG8fzRrx3FZQ5hC A==;
X-CSE-ConnectionGUID: aOlL2vrmQUqfzAtYeAgTjg==
X-CSE-MsgGUID: X0GrE/0BQ56wHq/cZb5Stg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43259915"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43259915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 20:24:34 -0700
X-CSE-ConnectionGUID: ifeTeY4kSmywYCBfP0EfTA==
X-CSE-MsgGUID: GqaogaH1ThytFCKuf4lo+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129429150"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 20:24:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 20:24:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 20:24:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 20:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfDQvtK+ENqz/zi0RjMcMBJ+bWAewCEBZAxzTv+otGNFTY/oiVuiPkTw4/pWrWU2GPY9MNqbxMzMw75F5H46KpFQMHaZjgvWbHg2n+X0GVnhV6mcc75KPLWxbgpeSEPvg258PURZvhg8IYov2+fpOeM8fP4hBebR7IVhftGE6svWHKH2Ouep/+8bxEny2yMWIe6cDKH2TujhNTNeGpmwNYZvoBDnHPczaV4LQOOgbmq87TjXq04/mwXkDiR8oULMkG1HJgRstb8ToGHlbUoWJYABCfY2lzsjkFkEGIW/PSuAteuHwgtgprVrceRFRqxDbei+lX2J4z0ZBntdCRkSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWJNb4adPBL2fStywy41WYhY7hUYyfpFOswl6+DZsZk=;
 b=mihq+feyyci4eFNhfNyufpLW17+CHZr6OXKRDZB0QIFm7oTF9fCJV8GTvHqrjRZILpIl/OUfxepA7ztm5kU02tYBFMglSloP9xCdyTzPYnP91bAn1jib2uAUelFPNiergHQfQJf/jweXWliRtoV54+0rOqv39+KUcDju+e/Yfb60Zv6dd/bzGyoFfOS9lS48g+tPx2iLsEUx0auFUe9EnJW+N51YgsoFDqz46B6Ikz8TLF4IfmB0xJFm0/4jtXOdzHKS5uVkvfgGFPLdQe+EvB6iq0l14ADVp4BfW5UT2PGzUezlp3mTLtWMQ0r9GK/Kp+ECTrBsxqfifetkDtaJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 03:23:51 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 03:23:51 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
Thread-Topic: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip
 subtest
Thread-Index: AQHbnNiEn8+RGKR7U0+tHfcMGrcK3rODLvbA
Date: Tue, 25 Mar 2025 03:23:51 +0000
Message-ID: <PH7PR11MB60532D4CA3CB05146508C5DAE7A72@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH0PR11MB5173:EE_
x-ms-office365-filtering-correlation-id: 05163eda-4d53-455f-ae3b-08dd6b4c76e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aHIITxqo8j8ttrBvDBbXLs37810D7p97N3QZb1eL3BGTNxi9zVlHt1IGWaBS?=
 =?us-ascii?Q?C7tzE+U7RYmnU1zUdXDeprj+hCqugQxyFD5q0zGfadBDHEJfCi3s6tkc8HsH?=
 =?us-ascii?Q?70VOYhvB8p97IUrap18Xt5h/exPikunDKfc4d6DAh5kCZjiYejOZhCwrfw92?=
 =?us-ascii?Q?r3Y65o76reVZL8wIfFiagObtYVvIaWjYFmVqekwDhpdm23Q2+Uiw1Xz8OBwH?=
 =?us-ascii?Q?yoz2/vG42DbHT/8X8bvjamEmYO9/6I/+2RAl2Ha8620NQrzTHeJBlxA8FfnR?=
 =?us-ascii?Q?mR75YItY0WzO1dTvT9O70oIew7RjEMzlBBVTcHXZ6993F8VMCmdz3dgdQVRm?=
 =?us-ascii?Q?lXQAGxmuL2dRHd5dd0Z7DXJSjjzP+J8sEENiRjFZ0cfSiFbOz7HRzB1kOBH4?=
 =?us-ascii?Q?kAstcvk15by/HFvAabjTpTeE2oWIjQcbgFWmbDAmh16x4DtBd38T5K1ajV8e?=
 =?us-ascii?Q?EBMXmehH8HDiZ4dJMb3XvoiRvnDj6X0x+Lheas08vIb1Kx6cqigV9xttLorZ?=
 =?us-ascii?Q?VXrAkCaokrW45VEcasS9WM+qZeam1KnPt6YpFbkU42GKDITui04POpECQuuZ?=
 =?us-ascii?Q?BgqspO5Yq2wC9BJ/wABNdX5ol13TLQzY23uVFn4lb154+UTZyukNe09WTrBT?=
 =?us-ascii?Q?gljRA9hdeyuVETU5ti3nrJ4XFGLR9teZqelnAXfynPnA02wMtilE4ntqB09J?=
 =?us-ascii?Q?lsprpcsr/IRkZKd2WBjTy/nSpXQE0DwlHYLXepBH3gA1ZMbuCPQ8DlLy8Ovm?=
 =?us-ascii?Q?epJG5lqL5q/YcD5tpRbxCZ5mfCrqBGJuTwz3RDzt8wa21YeRtz5ffvvCzEKW?=
 =?us-ascii?Q?wsHaIUhtsEhyvJGFZgjQZL5o65Sq/fA0GnOEQ313oJK9kOaE3MD5zMTdDICS?=
 =?us-ascii?Q?9SBTUueYaBN3n3CG1asoD65oRW4u309aqVCn/aEhzEAo1mtNTjwtn53hIDKt?=
 =?us-ascii?Q?ZHDyezUW/wuVY/tb/xc0pa3NILwZ8B/0O0BnEuXbchMfIsrZmSQo7eFby7Vd?=
 =?us-ascii?Q?44H7qGNRdmoccwvt1Rm3tuS1RJ97ehOdlPK3K6QpjU0qMzQf37uDJ6PC4sq1?=
 =?us-ascii?Q?oHvn9mWz1viI5wvK8jAJzbLDzaYb0/u8kRN0SWuqes4+kucXhLjMswcq4F3S?=
 =?us-ascii?Q?6HsUGveUrCyOk4aKkGjAabIv1LKvqnfZaaOyVmhgzxPxnQ6cFFva0I4QYpTR?=
 =?us-ascii?Q?jtYic1wAXHZG0RiWtEWnlg15YeFZUj64RAKRb9OTrPQ4YKsBgDdhF9U41GmJ?=
 =?us-ascii?Q?k9D6GC+ppiHFV4wNk9dN/ttjAA6VTWpbdToGxkDDh5jWpg8VOaqKXeeAQ+PO?=
 =?us-ascii?Q?ZUudKXtknVid5e7SPNKx3n7fiIixyY5ozNp8fu+gDuNqKgwB7KQOATabp5qz?=
 =?us-ascii?Q?sK38nx4w1TcevquCZ5IIDahhbtCCPcKE3AoItffEUFeGUN3nqlUgCey+DU+T?=
 =?us-ascii?Q?3J2KZuUlvvyU/y6l+C3PpViTjzbGbqqD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DcQClOOhphNFOXUmZbq3qrysKRZx03M/XkNWP3EVZeXOIDdv7zK4IAUeBJFu?=
 =?us-ascii?Q?7NC4IXh+jfRUvec0zfMZMfx9e1zLhBc/6Y9JNoYE//ZRKzSbYNacufLEj4De?=
 =?us-ascii?Q?6Swkg5MLqryjKkOnoTSlhjGrDoC+FTZi/FQEPsRDd7uc8Cwjbq6pbKJaZcv7?=
 =?us-ascii?Q?Mj4LSdKtOksD7oJ7kUYSwOkY2CNsgWm7Az9zk1UggRmFeEUlFbY1MStjEJPg?=
 =?us-ascii?Q?VHi/BwVZwDKpIS8oh1wzFqBNiMfcg2PAJeWx5tSh67cEqxzVMq1oi2vqYf9F?=
 =?us-ascii?Q?xpwrtpIuZYOabfgWFLzvny4h5pLBsSHa5gaOVPlfiHqAU6i+EMsm6H/gMLtG?=
 =?us-ascii?Q?L71DEIB4x6fJDxUjqWP3r5Uqvb77qeVdGo/Vj0MES3oBP8dciBHgqfT1Q0MO?=
 =?us-ascii?Q?pzzggzAGptRe6lRK6T7+0BZVxOrEAsvY9pAd2a0yqSCkhw6O7QxVPAbD31gL?=
 =?us-ascii?Q?0cVRf6qL+tV6xKWEl1Wsm7AexSe/D3WxA/DLT10s96mapun9H1y4A2xxlQce?=
 =?us-ascii?Q?fEBLtmCCGW9wWqz6q5rsdhDzVkNsrtyiyUCZmp5KfkvPNs7/qRTOaO/1GfJZ?=
 =?us-ascii?Q?xKa11sXCQmsAu7e6ZbiQl9rsHFfxlpkxMvQOI2ya4LpE319umt7l7o6LYFZX?=
 =?us-ascii?Q?0sle1aMrhMHN/ETnDk7iwho291UGwRFvFuE51CMKnjEFcfnjIe//FIC81FJ+?=
 =?us-ascii?Q?jyIFRVzPtJDuMa4cU0WZLJoJD0WmRByYKWgVMNwQwyCl5gZgkCBbWpHfqduw?=
 =?us-ascii?Q?r23vxRSmMUiVV1bFedMYYA579tP9WUzI73LQyWsOw/SJbHsEM6VZbdD9LzFR?=
 =?us-ascii?Q?6pO1IS+2ydrPMOtYM8Av85Y9hUsA4dyzlkz24GkYJnlJAIp+15cobO8+VXof?=
 =?us-ascii?Q?2flm/wi7UeOmbuUIcASvmimAfTPU3Ij/nrIGEwbt/yaBfW8iIGOb4TebR8FH?=
 =?us-ascii?Q?6YLwj2AGnM2efbK9mFPr1ako4mr8R2Kx3A5Q+zWPBsCgb+S1wGmlrf2RiEIX?=
 =?us-ascii?Q?w/ch31ienJvwXA3wmRaZQXhk3ID1MRE5NwmDfJ1tRGSjLgiIvE2TihK+NHew?=
 =?us-ascii?Q?eKiXfSU+iCbl69RJzBJXFeGfnKJog9h552A9T7R/K0I0J57b4ljjwV5dVd6Z?=
 =?us-ascii?Q?Z8KgTLvnLzwkh3HWYYYI1hCsuuSU6sysnNr+VRs7ohr+qKdW1tiS0IzzMPPB?=
 =?us-ascii?Q?AuwNYEjkktXVKxKKq37Cu2yrpsGjRJRJpxLaYEBWksTawRdCRN8nGP6nSe03?=
 =?us-ascii?Q?QZDafKP9MKy9u8uGFTlRhIVi0VibU2GqIlv4fuq87w9sF/VrzaTayN063v7W?=
 =?us-ascii?Q?rBSkkgIZreY9wgGR50UR3GfbpoAhRCS/khxa2DjAItwe3TNADc55Kfldhw5a?=
 =?us-ascii?Q?QXo8c3D6fO1cSqIQjeFwl+iCZN4hw1Nql4vF/su1KYggbPgOcKNDBLQIeuMs?=
 =?us-ascii?Q?B2IRLXPIbcZLyGvJFsk3VKieddxM8cXxO6qrSZ0GdFSGwuMpdC2MvIyhRc1I?=
 =?us-ascii?Q?InxFsPiamoQHWNKCT+60110AZJ5ELAj+xnXAgRdHbxbAciL9PeUPiFrM6Qgp?=
 =?us-ascii?Q?SiSTIrYU059CnfmWvQ30GAR3LsDeykT93ZWGMdIC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05163eda-4d53-455f-ae3b-08dd6b4c76e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 03:23:51.2346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELpID/5iJKWyfy2WlUf2ymUclZmMags2Exz+bD+h7hZ5Eot/ZbhjYMKOPYYFWBl5zgpXUwmnE3AqEIVQR/9Vjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
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

Hi Santhosh,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Monday, March 24, 2025 9:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subte=
st
>=20
> Add a new subtest to verify async flips does not cause PSR exit.
> Enable PSR and execute async flips to verify system remains in PSR mode a=
fter
> async flips.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> da426f753..cf6b63b3e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -85,6 +85,9 @@
>   *
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and res=
ume cycle
> + *
> + * SUBTEST: psr-async-flip
> + * Description: Verify that async flips do not cause PSR exit
>   */
>=20
>  #define CURSOR_POS 128
> @@ -102,6 +105,7 @@ IGT_TEST_DESCRIPTION("Test asynchronous page
> flips.");
>=20
>  typedef struct {
>  	int drm_fd;
> +	int debugfs_fd;
>  	uint32_t crtc_id;
>  	uint32_t refresh_rate;
>  	struct igt_fb bufs[NUM_FBS];
> @@ -740,6 +744,33 @@ static void run_test_with_modifiers(data_t *data, vo=
id
> (*test)(data_t *))
>  	}
>  }
>=20
> +static bool psr_wait_entry_if_enabled(data_t *data) {
> +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, PSR_MODE_1),
> +		      "enable_psr modparam doesn't allow PSR mode 1\n");
> +
> +	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data->output); }
> +
> +static void test_psr_async_flip(data_t *data) {
> +	if (!psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> data->output))
> +		igt_skip("PSR mode 1 is not supported on this output\n");
> +
> +	psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
> +	igt_display_commit(&data->display);
> +
> +	/* Confirm PSR entry before starting async flips */
> +	igt_assert_f(psr_wait_entry_if_enabled(data),
> +			 "PSR is not enabled before async flip test\n");
Alignment should match open parenthesis.

> +
> +	test_async_flip(data);
> +
> +	/* Confirm PSR is still active after async flips */
> +	igt_assert_f(psr_wait_entry_if_enabled(data),
> +			 "PSR is not enabled after async flip test\n"); }
Alignment should match open parenthesis.
> +

Disable the PSR after verifying that async flips doesn't cause PSR exit.

Regards,
Pranay

>  static data_t data;
>=20
>  igt_main
> @@ -748,6 +779,7 @@ igt_main
>=20
>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
> @@ -896,6 +928,12 @@ igt_main
>  		run_test(&data, test_async_flip);
>  	}
>=20
> +	igt_describe("Verify that async flips do not cause PSR exit");
> +	igt_subtest_with_dynamic("psr-async-flip") {
> +		data.atomic_path =3D false;
> +		run_test(&data, test_psr_async_flip);
> +	}
> +
>  	igt_fixture {
>  		for (i =3D 0; i < NUM_FBS; i++)
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> --
> 2.34.1

