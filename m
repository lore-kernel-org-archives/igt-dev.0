Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C209C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 18:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37FA10E16C;
	Mon, 24 Jun 2024 18:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I68w/zm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B3910E16C
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719252944; x=1750788944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9PBcpZpjsiQolGIReq6YDgE4jUi1YRwHJfHrllDYn+4=;
 b=I68w/zm8x1KsYABR9yIy4PhwF4b9QVYucmlJRTu8f9HyLCcFJKHd3W7a
 U8Whtr9HQHa5XIceV2lJZrcGuJzrTcU9Xk7GWT/chhOrwe/s9Tl0vjlmB
 9gidDeLm4Y8m2TiTbYEwbUHvL1PVpY5YKMNv58G2dG5PvnDKERmYh1XR4
 qPB0+mOYSNs5+AfFQWx9yabX1PrKzUIonlUEAkr6jU3E//VhQPD6iV5rd
 jFFlpPe+0KjZpa45JepKjET5u1iZNzGfZLq9YibIV6RTE7tCzOS5OLZEo
 8HWSLjsC+115gkQmAkDqKj6XGQulsmq4utgBkFEc5qIfhIvUlgehxKm87 A==;
X-CSE-ConnectionGUID: u9BYO+7pRTeXh8mFekwa+A==
X-CSE-MsgGUID: hTaIyXBDRS6kAKRcUgTxbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="38753844"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="38753844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:15:40 -0700
X-CSE-ConnectionGUID: Cg7TvLdRT/2IZF8VmsrApA==
X-CSE-MsgGUID: nH5vldSoQryB0SEh1duUtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43193963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 11:15:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 11:15:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 11:15:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 11:15:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lx/SumI/iWCCqyczoMLZKnXNsb+FLJbifDZCaItMAU26vDpUHybTF+/4G3q3FmIpXW+2dIdbk1lc1baaj2o6F8/zIPdc1Mv6zC6uz2KyvpAKyWltGoTLryd/wrvms8urqZONBK1lRBubwkE4xUm9wPEDmEMCw2nGwgbHlBFuIhP6D2Aum79kx/Mi0efrOq7cC8dLMrp9dKxUysrkGiBq88ZHLtShru/BYbARPttz8QFxCsc4Q/jOcMXfB0iuahaxA24oi86WZNN8ikfGQf7se/2EvD95AIfNFxj/cnGp6pGvS8D9MbKQk1xcD2VTNJZlFeIL1yuc7oQtpoC/NrxpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bYvu7lxHUGAGU80x/m56rMDjEQ7yxGf8YGKu0Mac1g=;
 b=F6azHk28sBAXAGMCQpCpLobUe50s/TLuN6y/5IlveC/8RAZsa6adX+XdXRUXmxuTLmSnBNO/qkPSPAueolk0PbdrSVsAHbuGqR+swSx0dJqViSyZ8XOETqzIfT02SuYq7BHRKumrbpo5Q5v1N/a6ndmrOE0atOP+d05vKvgs91ONiYq5KkiE0Y8hfhodNshC8EsJO8dzvFwAM4yhyZ/Pc+WL6ZMLyWuXTXZiZ6QRN8zDl3DtoN2V8klhuzFC8m6xl/NzBP+/s7ZCWQH56IIhWSL2Tj3BAS5StESd0uvsRxaxEpzl6Jv/ymu9cM447XnggX0zqpxZMHS+cjboZ6zGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 18:15:33 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 18:15:33 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [i-g-t V6 1/8] lib/igt_kms: Split the bigjoiner check into
 multiple
Thread-Topic: [i-g-t V6 1/8] lib/igt_kms: Split the bigjoiner check into
 multiple
Thread-Index: AQHawVno8kAIqwS+NUW3oj3EivUfbbHXQfdQ
Date: Mon, 24 Jun 2024 18:15:32 +0000
Message-ID: <DM4PR11MB63120D1BF959A66484AEFF8390D42@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618082248.4070611-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB6864:EE_
x-ms-office365-filtering-correlation-id: b85e0272-829a-4003-dd25-08dc9479a33f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?czKVcebulZXDFh/WDXiS4T/V1bNsNXJwIYMcCym06/fyAIPabSBaS9deqD1Y?=
 =?us-ascii?Q?XUXNGP8G6QZ0pBYBBBcpjp4qOc+rnMUXrElRWlt8j3b1GOxfzrgxvPZGfpVU?=
 =?us-ascii?Q?cyh/oPzHm01dxLi+o6WOAOqlNJhH5qx7FQtvr7KgD24oIyvEeO3TMXAKKU/d?=
 =?us-ascii?Q?WgC/E53HzonWqPVDH67pz9bCmFt0sedDzHC0qJc7oUoFiK1uU/ewyL4UHJRy?=
 =?us-ascii?Q?9UAFjLXqdXQGKD0SU1+nNCQsyE5XndB0+DehPVqrTRIGydQ8+ArwWGl6fCqR?=
 =?us-ascii?Q?r5wG1tzd2JvkKXwwooYJpviLcfVnJJxpayMiy6Hmd7C55Hw/Ku1GJQa3u3Jm?=
 =?us-ascii?Q?RFxwqqoNA3d+erQXGm644aL1JTqrBHzCPlPOSiRO8nCeNO7CFTq6uJi6rqhk?=
 =?us-ascii?Q?lMbeUFbbfaoy23L+SSYI4WvO2p2fUy8nUYUvpSbbStJht6x3O3TVAdZFpPaV?=
 =?us-ascii?Q?0bMEOLiNBZUSfe1TxA3eYZ8gCqzcgkbRwMGMJ8Nb532lZhbuhNirKCRDHyNJ?=
 =?us-ascii?Q?QcbUKlheIUgWsKBVTjZ4BbhhMhRCquvlEhsYA15YGVrQIFhZXMQY5PlJYXTf?=
 =?us-ascii?Q?Xv2YQ7YY8fYdehffFgAXHeul/eHy4fT6VXKfRdHb5vx01+c5dOyXvHwYfq3J?=
 =?us-ascii?Q?IQEupiZ5aEqmJqoHHP3om8RDxEzxpbVg7Wct8vMePuB+yv4EW9qFr0elFHYU?=
 =?us-ascii?Q?RJ1YmKRGOzcc3CuvbxeMHilBRucYjZOXSqxM8d095TGE2VOkOlGGvkR2XUHL?=
 =?us-ascii?Q?Bk8qqgm55X0iYFLwYe4hPpl81lJsAUei9XH8AK0hn9HLoR7JYAPGIrwPM7cr?=
 =?us-ascii?Q?QnsJfStjx8dI+XQuWHJC/NaMA17r0swdydNtATEDNq/FsuB8hcUOU1S6P7AL?=
 =?us-ascii?Q?IsQDYk8ABvIuKKdSyu7AnVCshN8oSpUlYmGXGDvoiGKyPP+gm8DjvECBBw0A?=
 =?us-ascii?Q?YOi7MM2AV2TYYvsqj0J1clVK6jG0BTNBCQzqtiYVsTcqdiXccBX8Mmx3rAj5?=
 =?us-ascii?Q?4NR5tAwOGvt+SGfXaUZR28vDGQUf7dtY7Wf0QNKus0BmA1IXwZfq2PHOa4fj?=
 =?us-ascii?Q?6BI57M3C882hpoxT3DIkK5ezeEjKTWwV+WrQIyaevYRy9QcR9ZRu7JrjD/tW?=
 =?us-ascii?Q?PMhYkVO0CfRicdWhmdN6HWTVHomk220vYORNYpt8GRn7CBsBPk9v0y5Mfjfb?=
 =?us-ascii?Q?qe6+03DSC1rrN7m1pZsKxzZAbjglD7T5W0rMK0YsdU8UOuX8LqOcMIm/ryZB?=
 =?us-ascii?Q?nkgBIonvwzPfjCuYZyCjWc9KfH2rVD/qOzeQW4JdB8vSqsCnB2ANJxxFMteP?=
 =?us-ascii?Q?U/pMDCV5drF+c98iaZZoVgVSQWWS2B/gVvLhb/Lhg2+scIHfkhYDvXE1KdMt?=
 =?us-ascii?Q?Mn4OZPY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UWjlFb0bldHA4VJawX/beGfgTNPs7ZE4xQ7wPPYRSf2mHKj8HvDtqMXLKc/4?=
 =?us-ascii?Q?Aj69SII6L/M5osVhzL0GOnSoXPXPK9SLgLCXGX/RpMPp40WVM8Mt9ethlejs?=
 =?us-ascii?Q?zNrC6hI2q28P0/hVrxLkolP6wVkfrZ0OpvscGCzE8V1r1HNBLbdwL0b/RskU?=
 =?us-ascii?Q?TBUn+mI1GHGOxvUpl4GydpnLwVet+ijif8OizCFm6VOvDyn3aZFFaifZCWKj?=
 =?us-ascii?Q?ZFwle2TBarHmgJVIwlkBtAEzQlCU47mtot7O2vZzFYiheodrSRbNDMSxs7RV?=
 =?us-ascii?Q?uvmhlTIjPoMqgE1F3EIvDAyllh/CyD77vJfvq1kk9wI30RF4WxD1NkZLdp4c?=
 =?us-ascii?Q?IVWN3WCmqHntDKOFSVWkCUWJFVzdO413jCm19pth5NMjsz8F0jAw/ETaLe1k?=
 =?us-ascii?Q?fsIi9C+fVGZuGf/DiGeBqlUhb5eUIU6D4Zyr4SDNa4mwFoMr2duGxYn46tep?=
 =?us-ascii?Q?+cWtuCkpC5NTsOxlac7HFxvf6QNWjuoWKVB8jRUH4Tj+chMzObqF/7iZF90m?=
 =?us-ascii?Q?ZJ1oC0ifcHSPM5DlidapIQiPzsEToKAqtl06vPm2zmR+zUGFllegP8Y8GsXW?=
 =?us-ascii?Q?1RYqFgbuB0tdmC0o20EUqgxiVrasYv/jZwXvd6ywgtKpJ9P1N4kg8lOtlxbB?=
 =?us-ascii?Q?1QNnUcc2+gB15s6L70qq6Y6vQ6czDCAGFRmbyLVdkQEnuTJ9qLYHSWjNYsnC?=
 =?us-ascii?Q?6uHDOJTUCs/j5HLVwQwFrARqdaIaLHypAv/9bgNcRsjPCjKeer5XzwaIqeRn?=
 =?us-ascii?Q?zURXolnwn2mAnz1SYEkTPM/YvReghCG+hvUTGb13xleN9nFFLaJ6fq0E/1lf?=
 =?us-ascii?Q?dVlN0EaLDQHnmxHm2mxJ5nruva5KZENCfuGw+gcMDGWX/wPkeDSkBaTh/ZGA?=
 =?us-ascii?Q?CSKqcznjPHrMhyEEHxBzBEoAm9dXTxgelx0OiVVjvIKKzG6A5iXx/qK6lyTa?=
 =?us-ascii?Q?bR424jIYBWP/SNViU9VCoCbbCJaNLg0+0GTTC39zDdguPyruvOheeuyg+gOd?=
 =?us-ascii?Q?RsrAEO63i5ivaecoHAwsxGqDxS6sA3tCGJoRDIVZC6X7oCBNnumiYiwG+TC0?=
 =?us-ascii?Q?Uf6YkqgPTf5kZPY7LgcQ724uWI77BiVuzqTwQ34V3tC22NJNL8F+A4kfaaVI?=
 =?us-ascii?Q?kQUFnRSzr+I7KkzSwDExtfCvf3qXFpIvi75JxJwcb59j+ScjFAODljoAtZk6?=
 =?us-ascii?Q?XaNNfr2TmK4XBKV43aOvoiRW9hSi7BNCnTAkGrHKrAIpJ2zUENfHxpSH7ATr?=
 =?us-ascii?Q?tcJJrDww/dTbiMPVHwPjXg5FCay3R5uh+331meDYNu6EJhP2oeQdbn1sX+Sj?=
 =?us-ascii?Q?muqlzBE+i7pQx8xEOot38dMb84G9e3fzKdCWWNGePrTL6B6tjeeaiKuNDbI/?=
 =?us-ascii?Q?hFY2AKL/BS0FGc6rswOPpykf6jlSYxkH3riit2NEra2VK/HMlC7EipnmMscv?=
 =?us-ascii?Q?LZZxY0XS5lcv0SKzlo7WQ2s54sE8LBuBvImv8n14nR8rDBQopSC+dCBBwZP+?=
 =?us-ascii?Q?WqfM8oWYnZ+YPMI4mj3xGIOPVPILPVoc0PDovz91RZXZh9BRAtJ1jt1jB7Yl?=
 =?us-ascii?Q?9OYisSXN8bE0sBXPowE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85e0272-829a-4003-dd25-08dc9479a33f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 18:15:33.0011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9oHsc+BZKAQoMtu2Z/apijJFpW1D0iGoj4BgoepY9jirzdO4HWFCMviWyQxTjUVjQ8gXUo9SD8AAt+j94h9yoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 1:53 PM
> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Nikula, Jani <jani.nikula@intel.com>
> Subject: [i-g-t V6 1/8] lib/igt_kms: Split the bigjoiner check into multi=
ple
>=20
> To increase the readabilty, split the bigjoiner check into multiple small=
 ones. So
> that it would be easy to extend/fix the logic further.
>=20
> V2: - Use Primary/Seconary instead of Master/Slave (Jani)
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 57 ++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 47 insertions(+), 10 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index af63d13b1..5a1e47183 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6376,6 +6376,7 @@ bool igt_check_bigjoiner_support(igt_display_t
> *display)
>  	struct {
>  		enum pipe idx;
>  		drmModeModeInfo *mode;
> +		igt_output_t *output;
>  	} pipes[IGT_MAX_PIPES];
>  	int max_dotclock;
>=20
> @@ -6393,11 +6394,12 @@ bool igt_check_bigjoiner_support(igt_display_t
> *display)
>=20
>  		pipes[pipes_in_use].idx =3D output->pending_pipe;
>  		pipes[pipes_in_use].mode =3D igt_output_get_mode(output);
> +		pipes[pipes_in_use].output =3D output;
>  		pipes_in_use++;
>  	}
>=20
>  	if (!pipes_in_use) {
> -		igt_debug("We must set at least one output to pipe.\n");
> +		igt_info("We must set at least one output to pipe.\n");
>  		return true;
>  	}
>=20
> @@ -6414,16 +6416,51 @@ bool igt_check_bigjoiner_support(igt_display_t
> *display)
>  	 *  - current & previous crtcs are consecutive
>  	 */
>  	for (i =3D 0; i < pipes_in_use; i++) {
> -		if ((igt_bigjoiner_possible(pipes[i].mode, max_dotclock) &&
> -		     ((pipes[i].idx >=3D (total_pipes - 1)) ||
> -		      (!display->pipes[pipes[i].idx + 1].enabled) ||
> -		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].id=
x)
> <=3D 1)))) ||
> -		    ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode,
> max_dotclock) &&
> -		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
> -		      (abs(pipes[i].idx - pipes[i - 1].idx) <=3D 1)))) {
> -			igt_debug("Pipe/Output combo is not possible with
> selected mode(s).\n");
> +		if (igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> +			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
> +				 kmstest_pipe_name(pipes[i].idx),
> +				 igt_output_name(pipes[i].output),
> +				 max_dotclock);
> +			kmstest_dump_mode(pipes[i].mode);
> +
> +			if (pipes[i].idx >=3D (total_pipes - 1)) {
> +				igt_info("pipe-%s: Last pipe couldn't be used as
> a Bigjoiner Primary.\n",
> +					 kmstest_pipe_name(pipes[i].idx));
> +				return false;
> +			}
>=20
> -			return false;
> +			if (!display->pipes[pipes[i].idx + 1].enabled) {
> +				igt_info("Consecutive pipe-%s: Fused-off,
> couldn't be used as a Bigjoiner Secondary.\n",
> +					 kmstest_pipe_name(display-
> >pipes[pipes[i].idx + 1].pipe));
> +				return false;
> +			}
> +
> +			if ((i < (pipes_in_use - 1)) &&
> +			    (abs(pipes[i + 1].idx - pipes[i].idx) <=3D 1)) {
> +				igt_info("Consecutive pipe-%s: Not free to use it
> as a Bigjoiner Secondary.\n",
> +					 kmstest_pipe_name(pipes[i + 1].idx));
> +				return false;
> +			}
> +		}
> +
> +		if ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode,
> max_dotclock)) {
> +			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
> +				 kmstest_pipe_name(pipes[i - 1].idx),
> +				 igt_output_name(pipes[i - 1].output),
> +				 max_dotclock);
> +			kmstest_dump_mode(pipes[i - 1].mode);
> +
> +			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
> +				igt_info("Consecutive pipe-%s: Fused-off,
> couldn't be used as a Bigjoiner Secondary.\n",
> +					 kmstest_pipe_name(display-
> >pipes[pipes[i - 1].idx + 1].pipe));
> +				return false;
> +			}
> +
> +			if (abs(pipes[i].idx - pipes[i - 1].idx) <=3D 1) {
> +				igt_info("Consecutive pipe-%s: Not free to use it
> as a Bigjoiner Secondary.\n",
> +					 kmstest_pipe_name(pipes[i].idx));
> +				return false;
> +			}
>  		}
>  	}
>=20
> --
> 2.43.2

