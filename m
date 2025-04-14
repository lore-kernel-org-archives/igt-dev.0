Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D792DC369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 14:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5A10E605;
	Mon, 14 Apr 2025 14:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgm1Z+96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150DB10E609
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744642728; x=1776178728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XaaPeuvEAqeCs7N5LwqLKajXozKUpdmMeNkjIk4bXKA=;
 b=kgm1Z+965HWV/pKuKc+KdNxu1ty30tXlrwo2yJ3IvS1wyfcg4eFsaSLO
 c9qVutswHpE1pmCK88+b78Ij6rtWgz8JAayDjKK7JwQWpO0RGP0/Mqy8q
 DyaGRoK/RQ5Ik7ft4mKx/ynGWGGCuxyBdqIzkOr8tntIKhE2BaapBmjyb
 a/4sChYiVaojue1tc1o8ouAvXJ10T1uxlF1C71W/nhfDxOzlkd4Bxf8qj
 yorg3FRkiARFLLR01RnD0DxAuVM07QlfdKtXu1sE7ha8ucnRNedaEg2bL
 +trvQmQMDgbfoWpP6Ryd5aDHpTqFtXi8F/hbCdgZWEXid3Lugrwxyhwgt Q==;
X-CSE-ConnectionGUID: EAe4rT7HRai3wUSxZIgA3Q==
X-CSE-MsgGUID: 2EUy7dRjStCaaD6l2vF1VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46248145"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="46248145"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:58:46 -0700
X-CSE-ConnectionGUID: koynVwCXSPCETWlVvKO/Rg==
X-CSE-MsgGUID: jtK0PPWdRbuZ4IYNsi4bdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130397575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:58:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 07:58:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 07:58:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 07:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmozgCUqWJO3nN7tB0F0zP9oOM805FldFpYplNFtV7Svuv/cE+tI61C32U/L/Lw5rEMajvGaFppnx11zM2HJgl+E7xvaFQMlIurD6s1rxBeVY+G2Mp17Kl0VhzyXdC/1LOpbJelK/TT/cRT1oiNp6Mbrz4CEy8JSyx/5xRIes4e15+Bh1e/p+iwpIxAekGTgjuaGLIcolCkLe10B7DIKf4SEMp4MPu1qTuh9oFPr42/m5xvRSrwRUUgyQa0//Qzxg5fOlEHHWwjnXdcQSRB6x1DVYpwqbCtxUg0Iuq9UD/OPlmQGTrRetZo59LQmadznBnF2ISaOBM5DjFs5nhTlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rtYDhPJ2pBVDmfubLgEzeH1MsJr9ZEjBAYbNvjgxzs=;
 b=cVaWCczfhuMWG/a1I6KaW/wrKdh6z8DOi6GbAlYNpuhGdxYADtSwSyY0h74kpcr7qGJH9yb5Hb11pyTpv6znVa4oXyTO0lMBis1st4m4NDYMwLkgNJ+hO19EuzH7UIp3yX/ucU0vm9ku+wPjh/X+PRXI3Hxw/77gKwBn8jYMDTlSN3f9puT64y4RFUJlf1Ns2eZ65oZOnIkLDxWzf2F5NqdgSsuW+nd+Ez5CKHAm/z9Ul6hQl+PH7nIv8+kFwqxuXlDjd5MEVP10CORiKIUjBH5FdYnMUJkbJF8rPxxDfOx/G6HkhlLq8Yy9fZ6U4MAaVJ+le64riqHVoEC73IyKfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 14:58:43 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 14:58:43 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Topic: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Index: AQHbrUizkAYbYIWZsEC8o9rD+WZXVbOjPkEAgAAA+oA=
Date: Mon, 14 Apr 2025 14:58:42 +0000
Message-ID: <LV3PR11MB869518FEEBDC832D2A4544E1F9B32@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250414143842.14981-1-satyanarayana.k.v.p@intel.com>
 <20250414143842.14981-3-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB54442A3E0DB6AB16D3B4952FE5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54442A3E0DB6AB16D3B4952FE5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DS7PR11MB7907:EE_
x-ms-office365-filtering-correlation-id: 2177dcb1-69ef-4151-9b11-08dd7b64d949
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?wjGgW54zruL2KB0JmqKYZDkBq/IMw+SdH+lcxnfLq3JXIGcE3thGblUxxK?=
 =?iso-8859-2?Q?8eFvHBPSTr1Z+DPJW7A4S1tHIj7vmcRm9/32B2dYh8TwXlsQRhWoudNQba?=
 =?iso-8859-2?Q?DrnlOtV+dcmCVfli5VT+dY5k278A4bpEvjFyt0+FyuJiWcHBCf/q0qwUWu?=
 =?iso-8859-2?Q?c/uNgsQ2omoSsisufHn98zfRBgncVyaWn2sUmAO44gbxaUM6+05br8s2KX?=
 =?iso-8859-2?Q?LVfoUlz06TvruJZ64RdJE0lKgWs+MPc+QlPg+7/OFVw0zCBqpCvXmWslIY?=
 =?iso-8859-2?Q?6DR3hX7Pr+HcbSGFBtYEGigQ0aY8S6L+kXN4YvTrqJx893wABp3cnpHHuW?=
 =?iso-8859-2?Q?dfn55arryAfO7a7XKdyy9JPVs2y+c06VZg8DJzQ+qKlP54il+YIALBFXTJ?=
 =?iso-8859-2?Q?U/rxjdql38yHRy3I4IWsCtsyfcZUX9f6oPlIf0zAbbA0z6BMXohOZQvD2k?=
 =?iso-8859-2?Q?q+0XGOoHR0wW7/vZflQ5+6aJKNzV3DqWfoBCuysUgtMUMabchnDU+7yxaa?=
 =?iso-8859-2?Q?fstsguLS/5fynU7959A8ZhJYNzZbSOOVKHF2VaYCw8MLyZqPdv5YE5iTR/?=
 =?iso-8859-2?Q?yKLlB+ugt8m7uzvmd8FWMRZsUGfizUFyJDPQg+o7QWNNAKAQh9h0LyTzPX?=
 =?iso-8859-2?Q?m92m84laSB9hfCVwwH0uq+07+0Q2juigO6MjHAO96kVyNK5uSwxkispliH?=
 =?iso-8859-2?Q?gffk3Qviw6wr0IeOEdbR5UhXYWKN0frggMeSDuqxqCmtwY4lf1r9QmO87e?=
 =?iso-8859-2?Q?uyTotg23urM5sOm01AmJaVP7yj9daVTC3RrDl5/aKU1/YfG4yQJPdmEypm?=
 =?iso-8859-2?Q?153+JPJDBb5dOYe0M46dFxkRR1fFysSVYb6MzjjFmp3imix1ZcpjgeXNxf?=
 =?iso-8859-2?Q?pqT9pBiwDFWn+LXGNC8RypPgqhfCJtZH1uHePTBXCIA3RcvKMJs1hIUJty?=
 =?iso-8859-2?Q?FV2okm0b8vOccnc1UpxVEt0NRnSCUitN+mNRPOBVLfyanbfraSvuSwt0B8?=
 =?iso-8859-2?Q?9rCU6SBmRGibaYouX616FOVx6ejPLNdUBmmOezT5iIpgh+2Sq4Wm9C/1cX?=
 =?iso-8859-2?Q?lUGnUN5EBTOBay7eK0vSUpQiebo7XuZlYvf7ghVhKNLoKVl0oxZBBDDDgI?=
 =?iso-8859-2?Q?bXq+DMqSvgdAdv+Au5j0qsWFRtvopPu14TkTvjaWLC3Qs+AGjAbFGrmRek?=
 =?iso-8859-2?Q?ZAOiR1mFq1MWrkTZcLcXVdwj2qiFhlZCzdKeJc4IvFguX5VPh+Qu27ZXjb?=
 =?iso-8859-2?Q?0rxstkpiT98+nuTdbOYtYolacRSGBHEkLi4VzhFDJhs8dnxerAiR0VXoea?=
 =?iso-8859-2?Q?h9g70lHtjlbBqdySFK4ljjK4ScAF93B/vFTlX+wR/2yzQsf77Ags2MB44C?=
 =?iso-8859-2?Q?Z8ocawQS8MUsmHvGyMxet+MvjUeMKSxPw4BMB2O71srvVdcG23KECdLNJ7?=
 =?iso-8859-2?Q?1HZ7ZCoTQu9p7/ILYlkci3sbjVdmcuqV1hQ1AinPcJdyUDfYDrgdLia8PI?=
 =?iso-8859-2?Q?7OwaDpYQXmytVMiIuQhoQR/xkzyUKwN5ocrcZdbU2ZeHxcddxGDda/x5n4?=
 =?iso-8859-2?Q?wz2n0es=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?NC0bH0qN9Osj5e340ORuHsVSyj+ElJtytI3dPwAcNe0SzSJbv8+pADE2W9?=
 =?iso-8859-2?Q?0syFUfP9keT5f06p3YfYANi/hXqL0JIyI4aplSGp68BNJIS80a/LOEVoZR?=
 =?iso-8859-2?Q?gEHR4CrZ9A+q5Kld5ibLGviwGhRi4iG5xpDnp19KF5mHQh6xg64l4TVjRq?=
 =?iso-8859-2?Q?mYcw30Nu15jEYuODRMJrXb6382sGxUSTBd4AWx4DYL2QZ+TQdLLcrFBNK2?=
 =?iso-8859-2?Q?ODE4hgceB6AZg32FjdfqdQ3ieNR4O4aS/w2dNGh3MBfDsfYebakg5RiFD+?=
 =?iso-8859-2?Q?h/Od4kAOCbU8RkL+eN3BLWkVDcg8SBqbLm8MJy8ndu3z4/OvlbB5zA/CI+?=
 =?iso-8859-2?Q?ia6z3eHQobE7amwacKvYXqRZm+ik3qHYR4pc4AYr/m3kCZ/0GyWsqXeSp+?=
 =?iso-8859-2?Q?5UuEPNRgUWeBDB3IJtzGX0CDNNpBiRcZl4chVmlQZfYGwB9WFT9D9MBgFG?=
 =?iso-8859-2?Q?sOmJcsR8lJ4YYeFbcWkrhtNZTg2x6o7S/Pq9fzUN3HJt5GbsjhEfv0vyjf?=
 =?iso-8859-2?Q?YUXSj9SnVXMe0ebhoClDtGsTkKZeqqd2FYNaexoTWaVoKvmu8ecXQ689w4?=
 =?iso-8859-2?Q?hep08G4qQeuWHCSp4z3cPLLS5ND3rtgCjD4hk3f68LqBXEuqBLDJdixSlU?=
 =?iso-8859-2?Q?jP+MxW/jZN0pX0AabOv15ymYW3v+QgIqytt3C5i93M1nL8EQhad6pVbDeF?=
 =?iso-8859-2?Q?w6FMEqz5SLtCcvXzUlwDl1JZKrUdG2TmNGzSLjxVL6qu9KrSdnClwdOTGp?=
 =?iso-8859-2?Q?OV1g1fSo9QqjmXbBOWReO6pWU8QICrXWK6bC/l+N7tgS5NxvjRPqju1Dz6?=
 =?iso-8859-2?Q?WTSFh2/6ufkrXXMUQL9QePyZVzz3jf88NJ+taWR7HAA063soK8NUI3ji7M?=
 =?iso-8859-2?Q?Nv51MeWTwpvkaK/vSbwK02YWL7IoPNm/C566D1ZzTOoCMvde9HfrQeGqXY?=
 =?iso-8859-2?Q?QXKQ/hGEua7nGYp2MmBtYyslpnbw2JETvspqA1KGLk2zbW4rU1Sqmj/kLF?=
 =?iso-8859-2?Q?7khUut5QfKmwTK4fK/oUYQ+QTWfFH4dezXsOQegVEe0sRXCBTs/wclVpbK?=
 =?iso-8859-2?Q?/ARfxJSAFOe3CevaVhZx0QcAA3UASJmugz0unSTXX/lJjkbdjL1i8ilkWE?=
 =?iso-8859-2?Q?mZx9KwJpGntVI5LnwdXtAkffDzICRbWsH/MJQBG3rxPP9OQTihXF3w/E/A?=
 =?iso-8859-2?Q?4vvF8JLdIArZaNBxsM7/nyCNGtvxZlcUfv5/r9hCCE4FApZ7cCpmwT/wbk?=
 =?iso-8859-2?Q?i8ZNfPwPnSurKv2n4TKXdGsRnmYbsAaQwxbXHEDLyBIK26Uw1CrsTMmVWd?=
 =?iso-8859-2?Q?RHYXzK5INr7fzF8NvXpug3oS7+Btdk2EwYVUmvVjyT7S97iNwVAEDSLhhu?=
 =?iso-8859-2?Q?aabQTBQl+3uT9hVjWSF2jCOebLTrUaRoYDt/IWs3Zx3s7OVeipkS4eNB3D?=
 =?iso-8859-2?Q?jgNEncwol61dUHQ7B3BjOC7QWjUA4RjbX1q9+c9/rXrlRlpH970vkilYZ+?=
 =?iso-8859-2?Q?gMm0VRKnEHlvVWPwZwBrsB/IuddZcB34Pr6DemoJT04z1oK6kjbKeJDlhn?=
 =?iso-8859-2?Q?02abqxx2Olxc85/NwPqjb9qTA9DeDy+TJf9F/OhEO2o+cfFCteQQ38aVuh?=
 =?iso-8859-2?Q?Cj9KFEPZEX8CSxMugRrTL2WgldI/VgwF14l58bRrShKmyKOq/9nA1vfw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2177dcb1-69ef-4151-9b11-08dd7b64d949
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 14:58:42.8605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BYNsUTb4p6y67ycqT/KuV+SsSZ045qtvBtXunHfGonSo81JO28UkgaQdT4fp+6g/9LagnX/JC62o3uvPDbPggcZUnf8P+rRJeaN0OiVHzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7907
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

Hi
> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Monday, April 14, 2025 8:19 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; De
> Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject =
errors in
> xe_guc_* calls
>=20
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Satyanarayana K V P
> Sent: Monday, April 14, 2025 7:39 AM
> To: igt-dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; De
> Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject erro=
rs in
> xe_guc_* calls
> >
> > Use the kernel fault injection infrastructure to test error handling
> > of xe during driver probe when executing xe_guc_ct_send_recv() /
> > xe_guc_mmio_send_recv() so that more code paths are tested, such as
> > error handling and unwinding.
> >
> > All xe_init() kind of functions are called just once during driver prob=
e,
> > so it is sufficient to fail first/all calls to them. Driver communicate=
s
> > with the GuC multiple times, and the real failure can happen at differe=
nt
> > call, hence the need to inject failure in GuC communication functions,
> > like guc_mmio_send() or guc_ct_send(), but it can't be just first call =
or
> > all calls, but we need to be able to select specific iteration to fail.
> >
> > To address this problem, an optional input argument is introduced. If t=
he
> > argument is not set, an error will be injected in every possible functi=
on
> > call starting from first up to the max number of iteration defined by
> > INJECT_ITERATIONS, currently hardcoded as 100. If the input argument is
> > set, an error can be injected at specific function call.
> >
> > Error can be injected using:
> > igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> > igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
> >
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Micha=B3 Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 75
> +++++++++++++++++++++++++++++++-
> >  1 file changed, 74 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_in=
jection.c
> > index 44c42e83a..adcab2e4d 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -26,7 +26,9 @@
> >  #define INJECT_ERRNO	-ENOMEM
> >  #define BO_ADDR		0x1a0000
> >  #define BO_SIZE		(1024*1024)
> > +#define INJECT_ITERATIONS	100
> >
> > +int32_t inject_iters_raw;
> >  struct fault_injection_params {
> >  	/* @probability: Likelihood of failure injection, in percent. */
> >  	uint32_t probability;
> > @@ -233,6 +235,38 @@ inject_fault_probe(int fd, char pci_slot[], const
> char function_name[])
> >  	injection_list_remove(function_name);
> >  }
> >
> > +/**
> > + * SUBTEST: probe-fail-guc-%s
> > + * Description: inject an error in the injectable function %arg[1] the=
n
> reprobe driver
> > + * Functionality: fault
> > + *
> > + * arg[1]:
> > + * @xe_guc_mmio_send_recv:     Inject an error when calling
> xe_guc_mmio_send_recv
> > + * @xe_guc_ct_send_recv:       Inject an error when calling
> xe_guc_ct_send_recv
> > + */
> > +static void probe_fail_guc(int fd, char pci_slot[], const char
> function_name[],
> > +               struct fault_injection_params *fault_params)
> > +{
> > +	int iter_start =3D 0, iter_end =3D 0, iter =3D 0;
> > +
> > +	igt_assert(fault_params);
> > +
> > +	/* inject_iters_raw will have zero if unset / set to <=3D0 or malform=
ed.
> > +	   When set to > 0 it will have iteration number and will run single =
n-th
> > +	   iteration only.
> > +	*/
> > +	iter =3D inject_iters_raw;
> > +	iter_start =3D iter ? : 0;
> > +	iter_end =3D iter ? iter + 1 : INJECT_ITERATIONS;
> > +	igt_debug("Injecting error for %d - %d iterations\n", iter_start,
> iter_end);
> > +	for (int i =3D iter_start; i < iter_end; i++) {
> > +		fault_params->space =3D i;
>=20
> Is "space" the correct parameter to set here?  From a cursory glance, I'd=
 expect
> you'd want to set the "interval" parameter instead.
>=20
From the Linux kernel documentation,=20
Interval --> specifies the interval between failures
Space --> specifies an initial resource "budget", decremented by "size" on =
each call to should_fail(,size). Failure injection is suppressed until "spa=
ce" reaches zero.
We want to inject error at specific call and not with an interval. So, chos=
en space here.
> > +		setup_injection_fault(fault_params);
> > +		inject_fault_probe(fd, pci_slot, function_name);
> > +		igt_kmod_unbind("xe", pci_slot);
> > +	}
> > +}
> > +
> >  /**
> >   * SUBTEST: exec-queue-create-fail-%s
> >   * Description: inject an error in function %arg[1] used in exec queue=
 create
> IOCTL to make it fail
> > @@ -407,10 +441,36 @@ oa_add_config_fail(int fd, int sysfs, int devid,
> const char function_name[])
> >  	igt_assert_eq(intel_xe_perf_ioctl(fd,
> DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> >  }
> >
> > -igt_main
> > +static int opt_handler(int opt, int opt_index, void *data)
> > +{
> > +	int in_param;
> > +	switch (opt) {
> > +	case 'I':
> > +		/* Update to 0 if not exported / -ve value */
> > +		in_param =3D atoi(optarg);
>=20
> I'm assuming that the below igt_main_args is a wrapper that calls getopt,
> because otherwise
> I don't think optarg will be set here.
The opt_handler() is called as part of igt_main_args().
>=20
> > +		if (!in_param || in_param <=3D 0 || in_param >
> INJECT_ITERATIONS)
> > +			inject_iters_raw =3D 0;
> > +		else
> > +			inject_iters_raw =3D in_param;
> > +		break;
> > +	default:
> > +		return IGT_OPT_HANDLER_ERROR;
> > +	}
> > +
> > +	return IGT_OPT_HANDLER_SUCCESS;
> > +}
> > +
> > +const char *help_str =3D
> > +	"  -I\tIf set, an error will be injected at specific function call.\n=
\
> > +	If not set, an error will be injected in every possible function call=
\
> > +	starting from first up to 100."
> > +	;
>=20
> NIT:
> Semicolon after string should be placed in line with the quotation mark, =
not on
> a newline:
Some tests are using this approach (eg: xe_create.c). So, followed the same=
. Will update in next version.
> """
> const char *help_str =3D
> 	"  -I\tIf set, an error will be injected at specific function call.\n\
> 	If not set, an error will be injected in every possible function call\
> 	starting from first up to 100.";
> """
> -Jonathan Cavitt
>=20
> > +
> > +igt_main_args("I:", NULL, help_str, opt_handler, NULL)
> >  {
> >  	int fd, sysfs;
> >  	struct drm_xe_engine_class_instance *hwe;
> > +	struct fault_injection_params fault_params;
> >  	static uint32_t devid;
> >  	char pci_slot[NAME_MAX];
> >  	const struct section {
> > @@ -469,6 +529,12 @@ igt_main
> >  		{ }
> >  	};
> >
> > +	const struct section guc_fail_functions[] =3D {
> > +		{ "xe_guc_mmio_send_recv" },
> > +		{ "xe_guc_ct_send_recv" },
> > +		{ }
> > +	};
> > +
> >  	igt_fixture {
> >  		igt_require(fail_function_injection_enabled());
> >  		fd =3D drm_open_driver(DRIVER_XE);
> > @@ -511,6 +577,13 @@ igt_main
> >  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> >  			inject_fault_probe(fd, pci_slot, s->name);
> >
> > +	for (const struct section *s =3D guc_fail_functions; s->name; s++)
> > +		igt_subtest_f("probe-fail-guc-%s", s->name) {
> > +			memcpy(&fault_params, &default_fault_params,
> > +					sizeof(struct fault_injection_params));
> > +			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> > +		}
> > +
> >  	igt_fixture {
> >  		close(sysfs);
> >  		drm_close_driver(fd);
> > --
> > 2.43.0
> >
> >
