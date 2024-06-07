Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DD0C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E756F10E121;
	Fri,  7 Jun 2024 20:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn0Wisdy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1461210ED14
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717791711; x=1749327711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RUb8yBvQErRIAcVqxm0WSCfSajdgNLttNMvGv34nXRI=;
 b=Qn0Wisdyr3IEdKpdaO1nJ95Te5Y2UEfqx0G52giP+Uz1Unx05qgwp+fy
 KPjdf0VJlqW29CXJm62/uPagEZhn5/SQ73xHXGSTijig7/QsE3sknpd4n
 KALuOy87IXbM/CAPw+Fu0XxD8f2v3oaX1OzHtvpBq1yJ898awdnD9RUwf
 GeM4Ntz56iPTLNolyL0j7YpOKMt67zF2YKi/jipzloOUjlt8dJGPHb4Qy
 V4lmIfJwSl/bL0hn5V0JzQ9qZQkn5OtDF/O1Ytopdkvt007s+bIIQrZnT
 uCJRuGDscYTstFTRKqpuwdKnZ0HOacs3RDLmORqjgHcHe0f4S7n8VSlIS w==;
X-CSE-ConnectionGUID: SkmO/1CoQuOvBwDBPJ+8Bg==
X-CSE-MsgGUID: R50CpBPOSFCxq7ge3Oc3Uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14649041"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14649041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:21:50 -0700
X-CSE-ConnectionGUID: RdrjBq7tQseLeHRmMgtVYg==
X-CSE-MsgGUID: P+l2Do8PSrW0+i5S15MeMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="61617334"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 13:21:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:21:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:21:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 13:21:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 13:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUL3JkWpoCzLyzK3sCbrffnFM3l56OPIYAFdhOyU5g2771K+zgo/Cxi+GCX7FFcSQH+liwf7dhNXb16rjWDXMkjanAizGdMWU5Je0R4lzgOI1xTaOxyqVBqfT0pgMJxbNjk5dvgZ9OOQyJEMX5ZwXB1x48Pim2aKcepHB+Kl5wyrmeUMkfms/Qa7NwGlSnLtyfL7uS4FBe38GKyNbbHqXj99EwRZB5Eu8rjZr4MJtxnqMa7AipNub9bRLXLFEd2anc+rr2ucxV3252Yt7P+dIFbCl2dtrpHSBnHi5iSKBACH4dU6rWOC/WzhkbNYkaxH3Ec50UBXN4xNTIJdRJRV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJBAi9zfdioDe3+prrbtIGqnDZkda1E5Zm+jo5J1kxw=;
 b=hECvCouQ6uqR0tHKlfydlzuqg5ZN8jyrJpR7GX/Ye6SgyL4Nqz+pkGCh8Lb4Nmy09ruBmHvUzvB1r51viZ6cSUVG+H5VjgiE7CpdWzFCgsR1mYAnetRWzaDNJvNTXNTqjVqBMPO3IIMEw/Or5/icYjIi0eq3yhtxPwdyrUQR/9UIQp32JAJFSIWekdm8CniSqIFV7L9k5PegtJAO+jdRmh0gEVETpyPzC5IgLjnnq8sJfOWv2leEXB1VBkyV71cfl6tDhGuh4vYyG3XB4X37/uCBG/aSs+iFGBPGKh5a0BKc6C1Ek3mIIp1+3SsKEOy9fihla2uFayE0/+fbm4xGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.35; Fri, 7 Jun 2024 20:21:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 20:21:37 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/4] lib/i915/fbc: print current fbc status if
 cannot be enabled
Thread-Topic: [PATCH i-g-t 1/4] lib/i915/fbc: print current fbc status if
 cannot be enabled
Thread-Index: AQHauOscsl/L0Jjof0CqxaKE0isLV7G8vmYQ
Date: Fri, 7 Jun 2024 20:21:37 +0000
Message-ID: <CH0PR11MB54442A078F6D2421F8001314E5FB2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
 <20240607145732.285557-2-vinod.govindapillai@intel.com>
In-Reply-To: <20240607145732.285557-2-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7781:EE_
x-ms-office365-filtering-correlation-id: d4a24471-42f8-420c-bbef-08dc872f6ed2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?oAnrHGj+NDwkFSyhkmxIr57VPwxwmOjPzPARRKxFRdpL8SwXunSKTt6k+wUd?=
 =?us-ascii?Q?TpiS/y+0O1MeStCpBg9UWpIKKT0mEzGqt8TjbUGDHnK3wFDlqWhmRgnPXdiC?=
 =?us-ascii?Q?782GELgSvMwLOsmRULSybxgDESKTs3JZSHMJEWakFjbWkWfq5SJ5uVVPmaLA?=
 =?us-ascii?Q?YOW6EmWpcJieYo8+zpm5uGfY7b9nDWBNs5SeI+F+mMHUemBrjmf8tAyJX9N0?=
 =?us-ascii?Q?EzJQcths5wJaNQbKbTvrbzqBCiQoPshiuxwOAakeAekUuYi+uI9AKqF+WoXA?=
 =?us-ascii?Q?nLiWT30YClN3aKyT1YM5xF7aegQZeCvW28I9LWph8d8KgzN+6A6OizAVKjiH?=
 =?us-ascii?Q?IyAkBMbr1BmSARGeljvHX24bMwHFCoAyOf0MLswsrLfESZ/BRDo2hDiIMSI7?=
 =?us-ascii?Q?JWmsQ1HsbAL1FM4rY9HCm3gBQ5NDrNjH681M1wNl95oQliinH5SsVyLDXyNN?=
 =?us-ascii?Q?kPt7J5rJ5ZF4RAqi9tfa0+WRWEsss2hAE6TuMNfLMrIgJwuUj1ycrEYsWTYF?=
 =?us-ascii?Q?sX+3zL4Ly35CyQfajjHHNZSAEUpXtbJ06Yi+hMcFifr4/OUDLCX6KpiVNbm7?=
 =?us-ascii?Q?3ndao/nURfZMgQ2nFnn4pIcoMY2aBx/M+Vi4pLqGGl5FJI/Nq7jAe7BjpO4z?=
 =?us-ascii?Q?Gkj3Oy6Sff7oCsoJ8AabYd6JUN+e8dXHDwHPb3Vi99v3hbh7I6gqVJnwskk9?=
 =?us-ascii?Q?a0Z5eb4F3AiZXHJUtmJDP9sxR0kxwn/ly9z+OKvUqqxtajAGIjGU5KRUsMC7?=
 =?us-ascii?Q?JuwLBj72Dpj0Qe9Iu9TDZzM5Nkpr7FRGCQJm+iykM+cYJYHRgOxKj5igvG8Z?=
 =?us-ascii?Q?IWVinK5ntgOZGGIiPg3Cqzlai4HtbFrIxUGRqdlfYDS5OG35xAwW3w/zl+h1?=
 =?us-ascii?Q?VInOtjAx0NSclqrZ1uXMjq62RFrNV6vbrH/E4mpub6E0frKN0VCiLVp/FaEa?=
 =?us-ascii?Q?OIdBzGGKhr+OiZOThPOyC0O0Nt/wEok1RXQe1BuC2k3YHK4mi3oDqRY/dVQ1?=
 =?us-ascii?Q?iTpjqFTRS0v0RBNXlVRTWssHczC9AzAwEZ1aHPfL4XM7jppVGn2+BBjgU3LL?=
 =?us-ascii?Q?CYdDV1qrN1t2znA8qcMuLCHyr9dwlUcBkrMB9xzI77KYnSBcVSXk6+CKD6Qt?=
 =?us-ascii?Q?dGwJkd7e6YpcjpiAGQGtRjnrek83FzJKt/eSFO82FWwyPD/iLUTXD8ZsqNmT?=
 =?us-ascii?Q?5mQIumP04cAFo4gAVr+zHeVr8rHakHDg3A2ed/HvzPBKU3ODvPCIj6EI0tf7?=
 =?us-ascii?Q?qPZD5YdIddX+J2VG3Q7eBzAy9us/iJtyxhMtiTazcHugrCutNtnz1KrgCPky?=
 =?us-ascii?Q?AjrgufT17Gq5rBQ/wo9xrgAOJfWZxw+rUZPPRob/vb2bZFDsHqKnb9pkDJ4L?=
 =?us-ascii?Q?Nwu3SuA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5JwJTBm+tfb0+DQDwg+0Yj0+zxZz7A+QOSI+KApCLFz1ePGbibylOlgqCE2P?=
 =?us-ascii?Q?o3Mo8++OaANN/FElvZGj/n8qA+CZfaXmNXnaxhQHo9yI56qAM0NMs0e3/c3H?=
 =?us-ascii?Q?zTUuSYvua6F922ZvwUiMgcCU0U1XRKLDl4xlnZsjE0rIZ0+vEWSSJviqIck3?=
 =?us-ascii?Q?WBHoVQxeKKIHSNb65oxqD5XKDp6/MIPcWbybtI2maDNXl39V6gkZK590ZRyi?=
 =?us-ascii?Q?h8zrIKYhZkf0ynTtMvmqLGryuFzhaFynMsDPaLdlK2BsKzIPsUH4AosZnQyd?=
 =?us-ascii?Q?HxxmEXeN4sjcdCXuAV2zv7GfFIIgRWn/JgnPK2MoX2hGsOQ9yaeUSCyEr+GX?=
 =?us-ascii?Q?nbAhmt0+cKmdW1L1xB8hjlKnXGcmYh7Bd6DvxgDHi+tUDGkj8ttg1QFNreKZ?=
 =?us-ascii?Q?5RBlk3q1OWPRRrS/wBMHRyMql4kdBBfxkhNcPXX5XQ7dkU49UhGjupdqGst1?=
 =?us-ascii?Q?nIx48iV7n8CFs5a7OG2CwHpxgAG8bO/QwmI4DTt2cpVtRRx2NXJp9ktr086C?=
 =?us-ascii?Q?57KwQodhvsl20MJHqYKlHg5B9rsa9XoyGdinZjmMIlX3123zdeQrCLmeetT/?=
 =?us-ascii?Q?d95T7nLioa8gXbdjO5uOFbZFbCsCDv8/RSkL7fq7bsupadYDBPGhbODhv5xb?=
 =?us-ascii?Q?xRSjcyMdfaXSt61kqF/28NGVDjuRNiQ7/GDZl6VFsh3z597+p4RwkmLcOnWA?=
 =?us-ascii?Q?huAj1Qv88qXJbI4ymN6ukNi9cGqVYHBElM0pSkPSPrVxSFy/R39bhYmtlz5Z?=
 =?us-ascii?Q?JJ4hqhVQ6h+S2tGicHOEdFec2/wM6oLcL463uvdo5FffCNp1XVS/dBmnuuDw?=
 =?us-ascii?Q?lWshWx6yP6xjfBHAGp7KLyhgbtoAkKAhqKfCQ4hsaujHjTl0Tplnv0tTfZOu?=
 =?us-ascii?Q?iqptW7mdDW0BVOsseoKxexXg7Hv8EeCgKfweOdTBHjl9/oL9G9vMAp+i8CcT?=
 =?us-ascii?Q?SOTqFOrxWmRTjC3g/O9MbmcXz5FwB8tsbpf6T8C8OWkvrdmgfn5Bt5LQ5iBt?=
 =?us-ascii?Q?6S9mcF0X+maYanBigdpcfcxttAhBdqBRWWrec/z6PwLa2zq2y4cNGuZ0xlBw?=
 =?us-ascii?Q?Jxjr+BotMLgKql7tvQDTHsfAIcrmDLgmysijip51Xim+hsLW1RvbUjva1TIU?=
 =?us-ascii?Q?7+Oj0xcPilCcAkQ8ciRlmMqAO/W90o2rDfxr/IxQpdA5pwqtOR0dMdgArE6K?=
 =?us-ascii?Q?BuS1q7BHSkd9i5gO42xr8ew0Y51YQs1SDZDgu8QcVcUhjoxizE9/MQ8CHxqJ?=
 =?us-ascii?Q?8GL2PbCbVKTjS4E8DNNiTVUMJAkG9pSQto/3B3e1UXfBsCpmXWBdZAVOARdD?=
 =?us-ascii?Q?v1RBjWJzfkHloDC4EIMDwb/OLwqyUYzsKkxVjTTR1pNIORq5pk/+on+UPTFD?=
 =?us-ascii?Q?OPosENIAALEfk55oBl3PppHVKlQePsSkUm2tp7UeNGDSsa+O/ga0LjXE29I0?=
 =?us-ascii?Q?CDzS4ggbG1WfYumu06TDg/gmDoaH2XWHFE/WMxb7Nx8qr3utskz1H/8hct/F?=
 =?us-ascii?Q?eQ6s0MXg8Af5Bz9mZf5sMVjtIKlsoPu++Ti9y05jDY3opWT+McfTZZZGryOQ?=
 =?us-ascii?Q?oNPo9hNlO4RDu31m9tAxYpOKfjqewPg65VGtsCY0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a24471-42f8-420c-bbef-08dc872f6ed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 20:21:37.1814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/GJlTbKhGHQutHA8B+NYdzOKN3RTLGbU+5+nsAnM2Z54ZRCci/FLQKIEQcc7QbR7lfcbrlKWLvqOveQM7BkMg+V7mdqGKYhxBE0b6djT90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vinod Go=
vindapillai
Sent: Friday, June 7, 2024 7:57 AM
To: igt-dev@lists.freedesktop.org
Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Heikkila, Juha-pe=
kka <juha-pekka.heikkila@intel.com>; Hogander, Jouni <jouni.hogander@intel.=
com>
Subject: [PATCH i-g-t 1/4] lib/i915/fbc: print current fbc status if cannot=
 be enabled
>=20
> Print the current fbc status if the fbc is not enabled after
> the timeout.
>=20
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Seems like a good debug step.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/i915/intel_fbc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 3fac60087..07ed7f469 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -92,6 +92,10 @@ bool intel_fbc_is_enabled(int device, enum pipe pipe, =
int log_level)
>  bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
>  {
>  	char last_fbc_buf[FBC_STATUS_BUF_LEN] =3D {'\0'};
> +	bool enabled =3D igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_D=
EBUG, last_fbc_buf), 2000, 1);
> =20
> -	return igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last=
_fbc_buf), 2000, 1);
> +	if (!enabled)
> +		igt_info("FBC is not enabled: \n%s\n", last_fbc_buf);
> +
> +	return enabled;
>  }
> --=20
> 2.34.1
>=20
>=20
