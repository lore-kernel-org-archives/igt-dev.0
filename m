Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A0BC30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 18:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0121310E324;
	Wed,  3 Jul 2024 18:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwjXi0Mu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FFC10E9B4
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720031142; x=1751567142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=py8fuG2dWAZowN9suz6WJKoJqXf6S6wPXHdP9dysGJQ=;
 b=gwjXi0Mugb5cjtlBOpOUDMBOrgtu2cWgoS/tyZ2DoV0JkzqpDGcmm3RI
 jAg63glzSVw9MYOVeTFFSMhZVwYh4rThllTIRpgxSdhcOizCTtSdjr3va
 XMWG0jz5YWTETYM5GyBuTZXhzrMws1LXUrbsOseE2h2FRFPk+NXL5Ic3h
 hyULed2QihkTW4lpiaPxLKC/uUNZB133vsscYvfTMFF0mg8aQ+gRbnh/2
 gDYriYk2z6xihTufnQ9vHj7UncL4nJquLhPfSu6c1v/fEpam/Uarhs1k6
 DreZG/zUCClRg0VntC77MsQIpznpYrbiPZY+OyudqJZiYjOBEmAefMdxu w==;
X-CSE-ConnectionGUID: mEerlMxpSaOFHhe79OvWkA==
X-CSE-MsgGUID: K3zwRkqVQASz5Dvn0JKXBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="21043791"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="21043791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 11:25:41 -0700
X-CSE-ConnectionGUID: /6RxASR8RqKOFlwXEypB1A==
X-CSE-MsgGUID: RAr3mLoTTYajR16DAdSd6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46417182"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 11:25:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 11:25:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 11:25:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 11:25:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ju2TL5CTxKtk+e/tDSMlOLyuKus9UpnumjNmNa0DPkyo5x1dBoAbRK01JCM+pPYEbJX4/2jg6Pg7yWF8HQon8t5RTiKZGlJ/kfp8I0fWK/gc+4ZpB2sRCdyJzVe6kcAzTiPXyRqnRc/mXKjyaPaOHlBNTWBS4iLEKC3oHjx6BlvyyMuPjMCXyDliSI+pMvpbb1R8vcsOf5jhIxAh5UpUlrre2U6UHlNHrK3DyIP6+WPWC8qokFsHTC383RPnYSaPoPp6DiosufvdoD4PAB25eB3R9PaD81z8KBble+86YU6cjnKXDfDlTyhtR1uB0iurswvd+xZa60FP/5xvaAMreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmElYSuCR1rrygRvp8dtDi9SZc8AgaWEazrY9zXKtbo=;
 b=K0yNhW95++NB02lLStwL1c3HJwqEoCEFIZLHUaUtPYXB7Xp4F+3ls567Kz3jfzB2sYntN0H+D62zO8qXxKnFbGu6qFaEHiXMdP1Pn+K1zI3rt2Jc/LDrgCyu7rC9awG7yzC+SngS5tFTtVL6D5IeMQX3xutuMjhCdQKMD7xOk5Xo02yysrOF99Uqx4+JvD9DXkcA4mIwAu8xlz2GQLGW/SlRp5icetQwJ/ez0o9581JhXGZ+vDSClb/GZDddbLa1FPjFP1XPHphiQAzo8FuIhq4hjp8IUm6fb15hjMckKfSZ/doyJqlE/V5au162xJnEc4rJmqebVNfegJwVQxxo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Wed, 3 Jul
 2024 18:25:37 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 18:25:37 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Senna Tschudin,
 Peter" <peter.senna.tschudin@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] Revert "lib/igt_kmod: unload mei_gsc_proxy for
 Intel drivers"
Thread-Topic: [PATCH i-g-t] Revert "lib/igt_kmod: unload mei_gsc_proxy for
 Intel drivers"
Thread-Index: AQHazXGOZFZD+rIvokaYJGWO6EUZ6bHlSRzA
Date: Wed, 3 Jul 2024 18:25:37 +0000
Message-ID: <SJ0PR11MB6696BF6A8D84848B2F64525CACDD2@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20240703175037.53008-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240703175037.53008-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|DS0PR11MB8049:EE_
x-ms-office365-filtering-correlation-id: c0c77c25-7bd4-464e-c044-08dc9b8d8978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jX7pk/j3Y/0Sc0g5HIDxi1iBFv1QyN7Pr6Ybdh4MhpA44HAPPS9OECeRB6C3?=
 =?us-ascii?Q?Bh5p8GAaeFv7rbpp5Mp6aQpkZDYPwIC4C9G1daAFmRY1R2QVnUvG7sBlgXvD?=
 =?us-ascii?Q?Y0Memq/ghHDLNq2pJ8lRhjcP7+ebcw/J2baN5W0FecjAehclxZrScZY+M/xP?=
 =?us-ascii?Q?kN9CDbzzlcHIyzF4pOXmfvAU4+fPGQzlGJpDQH9Saf9hNDY6qg7kZU5z3j83?=
 =?us-ascii?Q?oaA19N6vGZ5kMnMcpi0ifEn8mWDqQSwPCvYm0NRhMGUvedcIImKUrvAQikCV?=
 =?us-ascii?Q?F0YtZ71ZRmAludzxzQp7BxVNgguy6hocosD8RQxZ0y28r8a8iGq/IgIhUzvZ?=
 =?us-ascii?Q?0JzMBrWwgdEwXtZ7/xs1HKszrQwpNYQSsLFTDyzwnU7o2sRJjAfisTlXGaPo?=
 =?us-ascii?Q?x4Qpx/l1gm35vnZ7L+SLsd6P09Tm+PjVodH0i9MI+4YE9ngKgJXEaN24EO1X?=
 =?us-ascii?Q?P/TpMG8IV/1BPaTQWjiopfAr0ke3lKH5GUUc/jIzZhnC1MfqQwE3BCFGOyFx?=
 =?us-ascii?Q?p/0YAwkldXmAs5A4tJIha1AleuPwH5Kay1F8etLOrqtB8GKLueoT3HTqg9db?=
 =?us-ascii?Q?oBwH3rewdl+Z48OXwkj6ASP6vQWUiKXv77U20Ibv459nEMOvmzwQARvY5cJY?=
 =?us-ascii?Q?vw4Kq9E5pW9+l97Gdt2HNvxUpGDx8rfvAkC4FTtXfo3ezyAJrtRX8yYgmfo0?=
 =?us-ascii?Q?3vTdRNR7NuzwA8I/CONh2xH6FHgR9LEQk3YjbP1vdjGTJQa+iOCl/CXkjWZ/?=
 =?us-ascii?Q?x/VvtVEJvsnjb8Pd/jpmUVawOtPpBvKsKEH+ci7KlvGaAjPJ9de4yMawPbRy?=
 =?us-ascii?Q?JucBTQwSLFv5csP92MfH0+oEhS4amfMZfuMNRuyj7To0S3x+72PZ+NpTpXWT?=
 =?us-ascii?Q?KZaK4EPhiea0T0TRpUHGmj49KgiurvHMyGZW62J8e7uXBjrLXazw7ITEVLTY?=
 =?us-ascii?Q?H86rtF3sUnOtJXWEdLkvUFnqzalN+uQBsZebzmgZF43ZC05nxzJa8LBXcJEY?=
 =?us-ascii?Q?P3H21hfDHG2U5uT/+OSTIcdKKBCVoli/qVOw666ExvQ7EDuGZWXs6TJp0zXt?=
 =?us-ascii?Q?Sd7bSZY8740hX5ZjZ0mcE+W32TablfpbC6dydPatw5e2tcjY2APzUCOPKGtR?=
 =?us-ascii?Q?dWAoJ+EU10xWppnkxw92HgPQhoSYyvT2P/hs94WT2wTmrENKh+QNGuWY2AUD?=
 =?us-ascii?Q?q20LWGUXCN1UZe5xi24Gs59F8NXViUAwc4BhoAW3J0N47zPzX8qWHmoPIDaV?=
 =?us-ascii?Q?WEV/pcRo3YqZ/bWHLsNmL0oWQ2VlpfjBYmmZjrnv8UrYWs8h9BKNk4aj0CLV?=
 =?us-ascii?Q?iXHHih2JA0kbDwfmujrOVxdv52fHXCLaYBKYpPQ9XGutDqS195C3R++GFBBw?=
 =?us-ascii?Q?nY4vlWaYQk735EO4Nu6tYaorbnmKOi79EKdvGVucO2BzgBopow=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HI866xXzvuMM9IxpRcRqa3/jKelU1hiXYDPZ0Ht/Nzhst2auorhWfMPaVriX?=
 =?us-ascii?Q?uBdFSTp/QYGWK+RO/ds6rwsO8ZtM6dQLx29m/XL3Pu4taKyd0ijaLP5lm0rq?=
 =?us-ascii?Q?OKo+H6Rid98duAY98V2EKf9S15Ty94vs4fYNsuee+XKvV5nNAtPQ4NPC4D2U?=
 =?us-ascii?Q?5iP8E5aQW0G5gQxTxs0k7J0cWroZH47tiFlFiFXlvcGsDRSHXxyT3aGWIVAn?=
 =?us-ascii?Q?/LyW/57jH1OdQ5ea1KSGjatod+WukkPJjqAYn0SEg8WlcUa6CDsgpBwk9s4q?=
 =?us-ascii?Q?fgc0FqM4CneE7lSsuj2MTe0iWyIkmYl6qKzCPgjs7CjDZlE7CCBefnd+bcSZ?=
 =?us-ascii?Q?jM3GThXN1tYzvhV2cN9IfOflZfkc24yHgeD5DuNKQjBLt7U2xvw7kRh1O+fo?=
 =?us-ascii?Q?Jm5j9A19eEBqyh5BgSDeHdjp3rl5B7wZUez/XbbtgcpL5J3qigb4hqP5YpjZ?=
 =?us-ascii?Q?Vht36g2pdhh+Nj5uFTFg1VyuLCjtm1yPZo9Wcgk+kQ+gyfRNkJfS2rymKZLp?=
 =?us-ascii?Q?9mgI2txwEcFg7eWW6Omw/sA+Bsa+td6M+giHLg2/wFg3nrtCQ08kp93MuB15?=
 =?us-ascii?Q?aI1l7kWQy56TN47KTmHahEpde77MyKmSvTEuHAYtzOTcK2mGbxQ7MrPZU/42?=
 =?us-ascii?Q?Se1od/Bmfgb+TA0jivWyK4myOj24fHvlrPGHfuzqdvdsRj40Q1r5WYxepxtP?=
 =?us-ascii?Q?W09CL6miJx+baq39F73H47e5oU8GvIW7xfOVU5P3JDi9Sh9RlACotm/8o5FR?=
 =?us-ascii?Q?uIYOMnXFQag/tRbi8RDk8MS4Dh795fdEviqVVGToD8vMaRZrHNx31bf3/Vwb?=
 =?us-ascii?Q?/CaAvjwjqyZQePhh+UXJDBe9f3L9Bqv3viqnbpxTChWEkOUO2KLDGmAQiJFr?=
 =?us-ascii?Q?y200kjNhsvuFEOiyc4Yp35YidY9uZIYrdI7RThDj7NPmHli2DM7YOrmGxyYf?=
 =?us-ascii?Q?m8+k5HRYrRUFfjwisAMCukKmeCdj6k4G9dgFbqoZSwxbuF8jLAU45BgusTDk?=
 =?us-ascii?Q?WUFGuJV5WssvWTYyIIPgn4yuql31FSiL2/ELKnAzPpIj+e+RJDXqPbhdDDFN?=
 =?us-ascii?Q?ww3boltLn6r/PnuX6xbhEjoFjOq8R/dXasMMlPlhO9R8JlB5CU4XS6RAOmO9?=
 =?us-ascii?Q?S/NYPiUR1n+L8gI/YA4i5iZqL9KN/8HuHKbpHoin25/Sau/cuAof4RIlGfJT?=
 =?us-ascii?Q?ul8sc4ciO/eoSB2d0O9LPs8c4elQYYDu3vaG6LEEMWchkEDSomhWR345Lx/B?=
 =?us-ascii?Q?OM5Z53aYIjwB63+uaO97n43+Fo50DMH6iniTmdHG+iXikE+kR6IPqB2FjN2u?=
 =?us-ascii?Q?+eknlSFdBsOMwS2pAyv2/wCfhSEAG4ZrxZpHkjIR+vKwcdBgFzn0rrlfUBeF?=
 =?us-ascii?Q?bJ1DTfWmNEaRiaSwpb0THuaOPJwfIicDctCKjxfDmZkizNebc9sFP6SM0yAo?=
 =?us-ascii?Q?oJK6pNarRWGtNo6JOOqzE+4MeGv1eQj7uSuB8YaQVHrSmuQ/8mXB1z/O1o/8?=
 =?us-ascii?Q?8e+HTEGXaygXLjtBASYkwI+paBCs1p9uNFvSPYJ/koKm4N7ViI7LyzU+fih+?=
 =?us-ascii?Q?KKdxFgb4FwmtfZvypyTzmE2z1tNUfWAQZBnAZ4GtELwUnFcykHEdceRexVN2?=
 =?us-ascii?Q?TaT5hH6RrqbfGRmdRB8pp1nafhVW62tPo6X2vGJpiIZvx3GZdywbtLDXjrWF?=
 =?us-ascii?Q?8sODSg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c77c25-7bd4-464e-c044-08dc9b8d8978
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 18:25:37.8815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2saPMGQ8JMr1gxk+NeKqT4n9b9ITQqCxvMkg0lUIUYgirIbME/q347QF/28Gl91IewgEh8aKSY7Ogdf7H02LcTbzUtwnus5NHfE4wE/26s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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

Hi Kamil,

> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> =

> Sent: Wednesday, July 3, 2024 7:51 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Usyskin, Alexander=
 <alexander.usyskin@intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@intel=
.com>; Senna Tschudin, Peter ><peter.senna.tschudin@intel.com>
> Subject: [PATCH i-g-t] Revert "lib/igt_kmod: unload mei_gsc_proxy for Int=
el drivers"
>
> This reverts commit c7650224f5d2af27c3500732a98ead3c3fab61f3.
>
> Unloading this module breaks runs for i915 on integrated GPU starting fro=
m MeteorLake, it should be applied only od discrete.
>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna.tschudin@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_kmod.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c index ca14186a8..33f059199 1=
00644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -623,8 +623,6 @@ int __igt_intel_driver_unload(char **who, const char =
*driver)
> 		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
> 		"mei_pxp",
> 		"mei_hdcp",
> -		/* mei_gsc_proxy should be unloaded before mei_gsc */
> -		"mei_gsc_proxy",
> 		"mei_gsc",
> 		NULL,
> 	};
> --
> 2.43.0

LGTM,
Acked-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

