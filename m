Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FACC2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 12:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A3D113274;
	Wed, 21 May 2025 12:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnHhbMLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E774113272
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747829726; x=1779365726;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kwTzy4ABD4N1BdObzH8RCY97LF5r+pIOh9gxd6PLmXg=;
 b=nnHhbMLf3/ZhWSvsotNCtwtThCSHuGwOamOdRFI5e9euQlLt1xTbNcBp
 m7Dt2JLZhJcGZ+94HzDE+p8Wpt3PSnlWzkDF1CFeTqZQCBNh9ioZSeY4f
 WmPnx9Wvc8KJPs2iPNw20CGQPVupltSZkbsZu21y0BziFpfSASnxALUOz
 /MUGdnXC/eFVJczlp8dXnDER8RpVceLJzBudDMPXIcyAoFeVxoQPtzlKf
 z151zuhZJY+eyN2XR3dsEMidOaRn2nVgSeInlrMeLoLIy+GQ7ieyQTa/M
 h2FgdULYSemEdFuQhIHVGNdExgtFDmbBQllhNzeJHElOAaL6kUnlNQDik A==;
X-CSE-ConnectionGUID: 1aFitMwkSv+FDo8an8qx8g==
X-CSE-MsgGUID: nfVH39+SRrOG/pjEGS2sxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49679169"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49679169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:15:26 -0700
X-CSE-ConnectionGUID: R36ymku4QaKqAuCD0Yz02A==
X-CSE-MsgGUID: fbEnFNf+TCegK6SL/+ytuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140559302"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:15:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:15:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:15:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omtuHvlA+cTzwRXDIDKqw/+HRlCtxlQvU1r/Jzjn8KTfwsK9jMsdH0NKX7Yo86yLQidgO+nVlgXBTygv2oMSJgUN6DXJLsIZqQojldKEmtK7RNP+CyLBRysYO6+V0KrE67731phGzQgYbpLPXpfFeYHh0N7wmiAnXcNwA/V5LO0FDcDzwlTmc/InoXqy4IsniSgEWySory+30v3tIr3n3HGdo2d9PRRu/V7l4y5uXI0Cd74qe5WTctGhP11np9Iux9+V1de2RylVYknbfZP3/P7fOjGMnbbqy8W3edjPaqKj7JkdgIO3dvVkDwnSOwZEZ50l2Ezw+vgTamYk8VFoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5ipvn9rBV6dIbRj9xk2mNYoUQfu0GMEpjS+a1EghdQ=;
 b=VsaocY2CfGu4DsayPG2xLn4s4NsBGZvOECcLjs7H6Uv90geOHHjd3pY1WGGdeNuejFmUe2zAp4gNYKY0tvmMZUHVnjK+O+8NqybzKS8K/oMxD5hQ0ElnAG0vuTLX6FzwjpJBBVXcLehJhrGhjRJECy6WxdBHTbWQFqDGXh+ubAyU74ki+z5K6Xzk1bl6W/Zkh7Lg902tOnkeds/OnkkM7jvlQo2Tch1RmYMHCt6sQm7BQ+BaU1e+vv9xDgk81xvIz7LldTu9j+3NQ6u6R0Cs7fF4DTptYn2P+qBmlsU+7YAR7BtOOdFS6vEfwEmO4cDbsdzCpoBkEWVhFegoy321wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 21 May
 2025 12:15:17 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:15:17 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Topic: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Index: AQHbyj/pVung7s8oE0ic1iO8VMVdgLPc/0XQ
Date: Wed, 21 May 2025 12:15:17 +0000
Message-ID: <SJ1PR11MB612965E12B4493B74F63F0D7B99EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250521105308.4179637-1-santhosh.reddy.guddati@intel.com>
 <20250521105308.4179637-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250521105308.4179637-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB5790:EE_
x-ms-office365-filtering-correlation-id: 83bd862c-c3c9-4067-a82d-08dd9861260c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?i9d0yB7WdqXVK5UkX1G1wo5QmxkLNHmZhVo20lLyxvQwNbhNZyhGi10aFcCN?=
 =?us-ascii?Q?kPlyzxPX3/AQyhqoypygGuyIvA9+lmzw85YwcHd6TUjdObjKXSTf+XqMssWG?=
 =?us-ascii?Q?Wm/8RautpThu3ZFOw8P4M4k8WvElCQvcPyfuaV8jiT+AqId54OTfUvYFcwy+?=
 =?us-ascii?Q?ZLCcUkNcY5GjUECdMlkUmrZw5ZLA2AgWF4fSCrApNnf6FgG9cgac7dlqE90z?=
 =?us-ascii?Q?awpNtSvejbSTIefrX3x8FWKryDMvGegKmvC7cPbYkvyLLP/qeN+6CBDOHHii?=
 =?us-ascii?Q?M14AiQqgfcHbESBdN2yRZvrXNXCctGZC+XoEMDmpYHnobFLbrFdKeZGBfxW5?=
 =?us-ascii?Q?6v18NZzwPAj+9YNe+9MIp5nMVa9JyWB5pvICm8ZHkQfxRQ6ixEjta/y1ywr2?=
 =?us-ascii?Q?xuPQLam2p/4OCp1u4YJeEB07BErXV4h1qhnT2n4S4jYKtDXG6iKDyMrDWaCl?=
 =?us-ascii?Q?aHaSlHVouBiQ83jlQzV/UGq2k7EMUO2bh7PfyB1ZSafpK9tYH+9Syj/J6F4A?=
 =?us-ascii?Q?DeO0Dp2d+5Ac9TrE3AnBKBwfh1jR0lRUm7eEq3E1uxmfHUy2iFXqhiTPBSml?=
 =?us-ascii?Q?vyWjRMEWoJ3tMt7oetQvjO2ELjmgk2SqFv9WxN/8nYOZWWSi9ZCjgZk5NIwp?=
 =?us-ascii?Q?FxLQbMlYodVZIM5JysfwJeTuIshp11GQ61MiHcdwNX/DdkO0x0nGhVv0qUGb?=
 =?us-ascii?Q?lR/XvqGd1gZB5pcamFCmxNYhg3lWQ1cMUgk02C0pEV89jlcxpNR7s9atixiG?=
 =?us-ascii?Q?qqXV+em/JZ8Udr1iei5KgqdV2zmawcxsQJXsIcQXjCO4aOVDz0XzveDoyLIg?=
 =?us-ascii?Q?I/3pRcxLEv919nN1p/S8TvvoLH2QDmRMpcZfnRn8b+cRlAMZHUdvMWVg4A2X?=
 =?us-ascii?Q?OizfPHLfb7kbho86l7DPxOfmIqDaSHDBnttAk/HI273J0OXyQ8MZvvWUPtzM?=
 =?us-ascii?Q?8KETWhiXH6r/O0mdVFHeMTZ8j9OWtVVejEIHQXljj58VslRotwmEypkEhKea?=
 =?us-ascii?Q?y67se0pGK1TO9Mzd7r+9mxdxQk9yiuGj4WwdEdJpe6JG4zqorUXp69En7q0s?=
 =?us-ascii?Q?jUuQ2EkSpMEPD5eQGAAiz9z8Yzg4Q7Mt6zdXBF/HhdMxrBsdI5I3aNpys3Rn?=
 =?us-ascii?Q?mQQcTsfJogE4PghlzfX4qX/+2IFY8tGAB6tBB/1qsjGtcNZlpGeNkQm0q7M5?=
 =?us-ascii?Q?eMUufv/9/vG2bJVsLGMBK97a2m8SgFheazTUkdrkJftRvZxla1MekuAS4WGo?=
 =?us-ascii?Q?ackFa9SAg/Kj+WB3tNwYzU89x4yL9QyrJNxV91OF5b6MAJyRhrJ8YTXVuetU?=
 =?us-ascii?Q?uHRdKjPXzyCYvMjteg1n/ddYvM7XQILLihCwz8LVXMbHvRBpTvBDXO/OptDI?=
 =?us-ascii?Q?+adXTBm3CkgL0eB1Auw1jC1tgS8jHR2qQJvNPdHg+Q/syF3nIcE9FJWBrYiw?=
 =?us-ascii?Q?66VuHHsdX3uodxu3tZmZ8GPD7dGj15NYJPCs2qtQDcEEt3DctELtcMZ9rPug?=
 =?us-ascii?Q?3JnVnMbFVPJ4iE8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XDGcWpTlIpKLrDV47mKnwI/Ew2WQXOxwl7QPniRKvFjAQSuvBYhTTKcTd5xU?=
 =?us-ascii?Q?qhq5w3AAS50UvQTyka011xUGcL0/s1NwmaJdc5Lt0ZSM3LBLtboR0a2n0T/g?=
 =?us-ascii?Q?I/stB6dNKKlqihztztLudp9h1OI/ULRSVg87IRrQkwrSzng2JooJohO1W2q/?=
 =?us-ascii?Q?3f0ugFjZcDg4TkgHfWOfiOxlCczsxfc71Xrj8IXcdVu+edyVwzDjAALKYhMM?=
 =?us-ascii?Q?MDIeZ4epzpJm06gQDOBMmMwLUen/Z8P9DHZ8aVrvEnl/hyCHX+MRLC796ulC?=
 =?us-ascii?Q?IKSxV2k7w+CGND8De0NouTntinaPnu/UqP03J26yk6I7Z7u2MxA+bZNi+Y1Y?=
 =?us-ascii?Q?fnxjcf3M4HdNLF/wkavyV6f14KasRSn6pGZtS0jNdv5Z2XMK+Qu1qWlLAfpU?=
 =?us-ascii?Q?uJWuNEH5CrBcWSuXB5pnktyjs5k+7VKZgZ+kv3zNNaa9yjNBJYn8WE8sIDP2?=
 =?us-ascii?Q?hydJG/7iTRuzqfQ3+Bsz1m+/i48pT//XDXsn4tUWAcnoP25hz+QALu/m44uN?=
 =?us-ascii?Q?fzc90K0cx2Nwqk0Gj2wOwLZHdR7wSwvLxkIzMKhPYLpzf3LrlaDCRtXtV/XA?=
 =?us-ascii?Q?SlXoGfhpAZ/gr3vxqknSp2jCkCIvAVgaoO8SwaVmtziCnxl7NH/s1Y+FkrJA?=
 =?us-ascii?Q?VaEKql82OTYzfolR3ngEvh61zLF9FM28BroWxdld3hXlDi4BjE4GtCOQaaJ6?=
 =?us-ascii?Q?8vW6vRhLWt8N1iTd41Mdr8xjWJA4DN1XLGv5ek4Pb00z9YHmeFpyJQvLAX2C?=
 =?us-ascii?Q?mQqc8fI3t9+CHORaLOLvw6GrkabCxsrpUdWCDapTqW52q+Uj1iw8cSIE+iF3?=
 =?us-ascii?Q?l+7u4XBEOtir6Xkk4G76zHmMB/LDC3/VscCiKofYlF1lFreCdoGWU6Z37k6a?=
 =?us-ascii?Q?mkFXdU1TjJN1Z7rGsa1lzlKp+Mwph1dh9Z3+mK0WS5EtW3bU3K8dRUoCOZrW?=
 =?us-ascii?Q?KskKp6vePE98LP7PR/EKhOP07ydrNERvLnJtOB38WaBs1+EfrB7kcyawj5vv?=
 =?us-ascii?Q?A71Ho+KF0Ysv7DvcZy4wvYSKdg2v0bOJgdVlBZBSy4yXWJQ9sJKlwIK4TBH9?=
 =?us-ascii?Q?YOlLZztRO2+UsDxcuielwGANduyDjyvxR84nfN8BE6Ssdeki8TfRqMg8YvcL?=
 =?us-ascii?Q?OgpW4B3VIwH161fusGjeTrsbxhus+Jmf87NF6ynly3LYFYwaNvLkPjPI3XEj?=
 =?us-ascii?Q?G0PxdUY0FD0b0kJvHc7dGNl8Hl1bV6UJYXs3Ua0j1PE5t3FUlnLAd3dygxyk?=
 =?us-ascii?Q?h0j8OxPG9JpRj77PhObPw89tA2uBgrHfaRGvh35RKyy71RXJHqmGso1+2Ibo?=
 =?us-ascii?Q?0FVIwtdZ7I3EiVC0dRHqTeB8K7dsTM62xiRvD001aBlnd7TsLea1hMLFq0yE?=
 =?us-ascii?Q?MLGWgsOdCoMV1Wb+5yQsHfpygqKB+gwI96Y9juFmQWyVTY0SczD2iRe9nJ9y?=
 =?us-ascii?Q?cDyBr/Lh/xHRFSPWdvzlrlLz90MIanUhPKvhJrUV/bwLWCTxPjTsdXnY+5d0?=
 =?us-ascii?Q?D6ZzLkPuUush8qEG4d4kFjkMl4FF6pyN2nLgvm31cYV9p2z5E8/vCv2UshRT?=
 =?us-ascii?Q?Pyge/ymtWaTLIXnsgGkHNn5n4TwGQ3fv6eQnaWvBFvFBHbHQntBsEKSt4n2X?=
 =?us-ascii?Q?QQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bd862c-c3c9-4067-a82d-08dd9861260c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:15:17.3916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6HOrQT0xWaX1MmcaAUu68qS5fjQCCZQMlkt6TjZMB2paOHqr9YdJUTIBQwKq1ZAcGFZO0B+MEGd+KJVVIOTojX2nvFtWX+LkClHBqVrEk6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
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
> Sent: Wednesday, May 21, 2025 4:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips wi=
th
> Linear Modifier
>=20
> Skip linear modifier async flip subtests on intel platforms with display =
version
> less than 12.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> f824f60f9..66dbbd5ab 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -988,6 +988,9 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive
> asynchronous "
>  			     "flips with linear modifiers");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
> linear") {
> +			if (is_intel_device(data.drm_fd) &&
> +
> intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 12)
> +				igt_skip("Async Flips with linear is not
> supported");
>  			test_init_ops(&data);
>  			data.linear_modifier =3D true;
>  			run_test(&data, test_async_flip);
> @@ -996,6 +999,9 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive
> asynchronous "
>  			     "flips using atomic path with linear modifiers");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
> linear-atomic") {
> +			if (is_intel_device(data.drm_fd) &&
> +
> intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 12)
> +				igt_skip("Async Flips with linear is not
> supported");

Can't we use IN_FORMATS_ASYNC for this. Having this platform check defeats =
the purpose of the uapi.

Regards

Chaitanya

>  			test_init_ops(&data);
>  			data.linear_modifier =3D true;
>  			run_test(&data, test_async_flip);
> --
> 2.34.1

