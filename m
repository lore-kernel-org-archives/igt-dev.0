Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE1FD2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A76810E070;
	Tue, 20 Jan 2026 03:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvKiziA3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCCF10E070
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768881220; x=1800417220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xl7nFW2ukdr1N0kmqnEPz/szq4DT8Girjv/fNZ2BW4U=;
 b=AvKiziA39NQD7aN5cAq8BOJelpC4zSwy0Wk/5LscaYJNCad5Dbytl+em
 G+wMqTuJG620g4Oa2JZSOlpZPQUTzsx7eAWgVtfjWoikW+5FNOv986i0Z
 5GaQoFmk1v6tKgtQsDhjAxMnZ8mZj5IbPS2QsaGvSxa6mDMz4zhBrYZdj
 bZXYYYEiLqXfYSCI0XXKrYVdiRarCSwX6/8FuaH47SJF3KJRLZIwVYmp0
 nSAyvMh2Qwm8ofZo1Uqk1Bta8y4E4Sklm4+rcoKxSmXAQpEQm18qWmcOA
 ixWOktwtxTcxC5CFXlZJFHhJdrq8PWGAjTulyE2O9JGpfmE+3EDcvBwZh w==;
X-CSE-ConnectionGUID: 0Gy0IfvqTEymwx1HbRJscw==
X-CSE-MsgGUID: j60viD2xSpOD84BpGCvPmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70055578"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="70055578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:53:39 -0800
X-CSE-ConnectionGUID: p60FyTRUSMa9p91uaIVEYQ==
X-CSE-MsgGUID: IpKKmmqCSnqzTd9+C5d5Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="205907893"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:53:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:53:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:53:38 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:53:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHLXfdhz5Hi0VjHcITAXw6CkDH5rlh4vtwLxQouelB55ev6VHy7Z6H3tqBGBxzrdmGQfM86ZmVU/YamtfCZSzUcsAa8b7CnfIo96Yl97RPvF1YweYTd4fhOxCXDyG4K+F4Y+4awJcHsmeczv773wuHcy77d34WxBlUZFUqDSfsnNUYt1e4oeu6vAfKeWTcFB92EeUz0Ns9Zl8khA5s/NfhHI1ujG+PhUoTGLYRHuiDKMOC5rCdetWe3yuuZoeqpyWhsHnxcqUINH4OR/try+85+8EHlxEkQUQXqraWYAB+Xd9uqvratgJ5LTA6HyB6J9WvWAbm8EDeV2esYlWBVNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD/MjNlgCLc18EHiOZ7X3PnRszzUUpDT7vR1SFL14lo=;
 b=EVcRpDeGUzdmUDuOqrEVln6BdCcqKiDrnku2yA16mf2f4Az9ODUZx1Hk/qh51+5OfXMyA5EXfgBETSV/Tv462fWoYglzVlB2GYwPcqaKtcxgq+lSOfHf+5HNioc5ks92/6/cVe34FaN3WIHIWTOYslsgiIuuCsjLMwxHxBpHnie88ce422JnplS/6GORmakBE3x4elpM1qz0JdQs7EMGSkBITIWo3hv41033o/0URkse0g+xs6AVq1j0DrMM8jS/IGzsVo2pKR9S/F6pXtQe7062Tc9B7/RaZseFSvlCOjnOGVvGNDkqQMmI37knUBlJNB9WiVTddEUbvMhtx6bZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6348.namprd11.prod.outlook.com
 (2603:10b6:208:3af::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:53:35 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:53:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 08/10] tools/intel_hdcp: Add video playback loop
 with thread
Thread-Topic: [PATCH i-g-t v6 08/10] tools/intel_hdcp: Add video playback loop
 with thread
Thread-Index: AQHciUAeJTG8RsSxUkizeRNB/7IQtLVabVKA
Date: Tue, 20 Jan 2026 03:53:35 +0000
Message-ID: <DM3PPF208195D8D2A3171A3C883571EC37FE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-9-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-9-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6348:EE_
x-ms-office365-filtering-correlation-id: 80e5ceec-a42d-4575-6bf8-08de57d77c85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?T7zrhPL0BEHlGKl61yJYLXt8M+E5XuNy1Sa5RSrgJjU4UvMBAXXUFcuykbKM?=
 =?us-ascii?Q?1QDWJb+aEw4sdIWIeEg45/s4hwTj0Jt0IcMi6kk4GGtx3BaCIcCVRSAmEXAx?=
 =?us-ascii?Q?hF86Z5bNdip9232bnuLH8msiWTvRVN7UVuO1PvtaEBol2aDAVan+YiVFY+K5?=
 =?us-ascii?Q?Z4Tjj30m+lttXnklFa2YCrpBQuIfb5UVC4LvcUwPAtwl0N3DRICZE6ykwzVN?=
 =?us-ascii?Q?dfiEPCqFKTD4ZnHVs/N97cnNvLQYy37DitGiGrHOQkVr/OU/roTrEodRciFg?=
 =?us-ascii?Q?+CtpZB4epBNzJf/2LTNuWEFABYHuV/eUTgZgPF+Pq/7XfyUUUqkz5pAPjxRg?=
 =?us-ascii?Q?wZLy3mx2QPko67xlwKtE15u4Lm44SlFOFEud6w59Tqt92jBhQJPzp4Mv4Ryj?=
 =?us-ascii?Q?XSg2sADkE6+B4tc9xpdAOoOtfORGSJWt9cMj9A7zeybTv5aST7gEAh6GSyM4?=
 =?us-ascii?Q?4zoG9Hjj+BxMqCNxH3vk8IsIifyxtKYhnR9Tn/FtfsxWU9/l56wVa7pz4ZqN?=
 =?us-ascii?Q?TNjLKPqHC5M3EAUSjEk+2z9VNsrlzY8rWloI8RWIfpj2xE7w+Tv6G+j8q+fP?=
 =?us-ascii?Q?H9C3708CgzNRcVaR0RIiiUCcWPMTItD6lgaVJahNWB+bDp+4DoPI1gjNXVSl?=
 =?us-ascii?Q?pcuCE6NtZISp954i9zg3t11G03ehe+Z8jeVzs4EoTIN5WWRgedvQsquVQIOY?=
 =?us-ascii?Q?R3bbrCIbitvNJpyGawowlGDdrA064cVXLDsqEgoXXqNqwPuMZmsNNWoBhxJW?=
 =?us-ascii?Q?LidRlUIi+xiJF3Sm3OqhkE9AaIhhKK1i069JPkWK2FUbfctWzDPtMHCEpeW4?=
 =?us-ascii?Q?6kGKyefRga9t5eoEJE6pd0e56ZkcPAiOe9ztLdcA0ix/sqiCFCt4gJkaHRYu?=
 =?us-ascii?Q?L8jv9On0VFlpab2AOAA/099RkZgmDjj+Mi/1hKK2UtbMHhbJStBHSX2I4Zl3?=
 =?us-ascii?Q?xlVkZW+kKmi1aC4SLgGd2tiPFevzwYEIcfejJNSEZvOOOnkS7eNghKGf826S?=
 =?us-ascii?Q?Wcpi1IhGlTikQhsXDwoPXs4gRFuKHrYIiBEXcRAQULvkfTX22RkItYfsTAOl?=
 =?us-ascii?Q?PVaYmnbv5hZX6Jq0izAmF1ZCrBbqqjdH5PCzmIcrqrGwUqrZj0Zwk9V+Hxv4?=
 =?us-ascii?Q?eek/hoQJYDzsGlcubfnwauQr/o62+3N0LnRFRBCFqGcbnZxrUV0s8zcMKtCR?=
 =?us-ascii?Q?0IhEmw60q3rr2cJdOnT/OYRPnRWTOzNh537DvzYW12jF/YOknQxoO+arJ3g8?=
 =?us-ascii?Q?4StXMQQ7tW2gYwfCSdnCqt+fNiKvw/Sd3c/jv5NqF2VOXJHDnrCoBN406olj?=
 =?us-ascii?Q?wNydAyXHSkOk7CzgFh9YKmcgzJM1ZpZfKC/aNFMTYDCubzK+ofNpXf/MwQAx?=
 =?us-ascii?Q?tKXsbfs6bLS6EUON5zbeXZ42KT7WqEs3ztXavPINHMgc79CDau3O06DfGxSf?=
 =?us-ascii?Q?pF88Ary2hV6WMgaFvLgLMdSsuERuLM1xhQexOFgSa1cTO4V10coiI9OqQmRb?=
 =?us-ascii?Q?jNZdkqPNplO46Gx1aGCK0PV1JQo91410mCrcwCj+lLeZIe6hThstKnWsICs5?=
 =?us-ascii?Q?4XrkR1mlTiyyvZ4wUsWYMHBpIxUKMPdSyodxV1f6h8O+6CJBTlJJP9gvTKlu?=
 =?us-ascii?Q?LBqMe7qu/B6kU7OG5opMLSQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/q8heMEGMlIXdEqFZTMl2goz6DbZApUmgcx6PESybHANPiQSXs16AR0AIq6l?=
 =?us-ascii?Q?KwmSXrJB15kfBEsdL/83rdCNbKvlQSmZvJq2mMuP3DGSPPOYOAwA9m8qOVsQ?=
 =?us-ascii?Q?q0W6vy14kkWEtQSPkTLLyXRkJJtBu02uJJZlMlOPsyJFQ5K90OjZRn/xaxbR?=
 =?us-ascii?Q?e1Ln99Hzf4hsB2lglwl+/o/CCxXJMmk111eQw/zazK4I/KuWed4Pfw8hnMBK?=
 =?us-ascii?Q?2FXOKA0XDAzSAx1B4hMPAjflK6u3IRq19kHGRGHt/K+66MlhpSS5rZNSN160?=
 =?us-ascii?Q?6w0Fbovn4a8qquPASMlKCVjhpjE83ixWDx4JDeifNfpyUK+Ig57N2/xCcsJo?=
 =?us-ascii?Q?N/SmvhZxEzbZ5IW/8YH9II5IS8mEZrd8TQzfCdKiCskCTGGbLkN9s+9hyq9K?=
 =?us-ascii?Q?74tuZuIbOB+dao6H119b/Z8gWj5Ji7EHTjacb/Xib/3CRhu851nI7gNy7y00?=
 =?us-ascii?Q?hZFTdhk27GZMUEU9X7DmBr3DI2zDxOa8wSZaFc5+vmddwZ9klzJwS59DaJB1?=
 =?us-ascii?Q?ETwRqw65lZvk8NmqbQuq1f/SjxXrIMuEZg6uy0i9frphBOl0rFM3EGAtxrGB?=
 =?us-ascii?Q?XTHOpvF05aGD5ldHKwj2KeAIwpfLW+mrpn0Ios7HeZZRDpEEYNf0+Oq/k43p?=
 =?us-ascii?Q?hyS5p6AljzVR1zKmThjMuA/LUyuWcVzAuK032jURVRunzEDY0tumPQxPevvN?=
 =?us-ascii?Q?7WSMNqN8UvGENLt1K2kcSv5/q3VhidGRJo/NZpboeBGXep3OSBaMK/ZUqLlE?=
 =?us-ascii?Q?wudQqqknv1NRqYcSad9KpRY9+F+hSjyP2hoQ/o+K2PZrFGBeTwUUfpwQ2kVH?=
 =?us-ascii?Q?sGH3TSn20c6VMJM5y/9YtPwc+mWzEShOCLOgLPkHD2ak3RizRNISNLpmUNf2?=
 =?us-ascii?Q?8PomRQhT/WDE3axDSBCtE7ghQiD3XEoB7QUXuB25pVub9b+0rKk1YTZykgL4?=
 =?us-ascii?Q?xFpaQhWEnRnlBlOpu+OwUw86xlfTIUKI27BjgjhRuBcTxFWuRmVniLeaaIW1?=
 =?us-ascii?Q?KFTfWswDf3CXmAcCy0H3z/2ZGPSnB9wYT3hMTcmx5EP1GWdcTAt2t3KENPN9?=
 =?us-ascii?Q?m6lcFC5NxfvIIcuML6FGH4MgqSz0cfcnoObzUftRV9sup57wCf1tnhszK9mI?=
 =?us-ascii?Q?spxMdhSTJUcHGC/AbD1hqknpFGwb9TXCU7OvPOm5Xex6mFAQZndqQn4vN5Jw?=
 =?us-ascii?Q?VgwGdfEboI43PdL8i9qkxobvqpe9ktahgynBPBNzHKjU+wOvzsDZb8ix8xZf?=
 =?us-ascii?Q?xqcEb6IbwjNM4pL48XbWHWMQfS/nFISCzLhHB4Lqp1kU6Jxq190rTbu/F+OI?=
 =?us-ascii?Q?duE8OK7Iogkt3DzUTlMJOqZjSyJh38t7FpP1rAXruLTnUyzsV0cqc9tY+VUU?=
 =?us-ascii?Q?X0hlsgENTZuK0FYATFkrYVIivM4qgaAqPECUqutDfzKh9UB+i7HiKI7X2uXX?=
 =?us-ascii?Q?hAaimDQWR+Y5ccv59cs6tjb7djx/PRw4uGxaP9Xe48AGsbyPa5Okm5P/GxoY?=
 =?us-ascii?Q?PcDcbXSoMOLuij2lm/F9M8akC1ZNZW8aco2N9lNc70q4hw28FjW0uzEXeJfN?=
 =?us-ascii?Q?wDwT8DB7q2s3HlVYJR7yYrUDhRSI+x0hgg6/ofvEbUvV4Hh6GM0+xDavmbG6?=
 =?us-ascii?Q?x3z0cLgic9GXZYzbb6PbdbdH1Fpyraatk78TZhqBt5X2JeqDqEQBvlJ12SCn?=
 =?us-ascii?Q?CiItJwjTJZdm9zuMtmwlhVrcJbsnbPNGD6Of8z+usJeKpSOpdAVZTWe6J/wU?=
 =?us-ascii?Q?w1xzzqicig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e5ceec-a42d-4575-6bf8-08de57d77c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:53:35.1592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ZnlBFuS0QYyEsMr+kAbzPVJcscUig8A+Hc7iPmJMlL57oFKM/rQNTE1/11LCnmutY4G+/JyLuqtbVzQ7m5tpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
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

> Subject: [PATCH i-g-t v6 08/10] tools/intel_hdcp: Add video playback loop=
 with
> thread
>=20
> The thread dynamically updates the framebuffer with HDCP status visual (e=
.g.,
> HDCP1.4, HDCP2.2 Type 0/1) using color-coded backgrounds and text.
> Use start_video_player() and stop_video_player() functions to manage the
> thread lifecycle.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 96
> ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> bc0485caa..fdaa7d931 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -35,6 +35,7 @@ typedef struct data {
>  	pthread_mutex_t lock;
>  	pthread_t video_tid;
>  	int selected_connector;
> +	bool video_running;
>  } data_t;
>=20
>  static const char * const menu_lines[] =3D { @@ -425,6 +426,101 @@ stati=
c
> void *keypress_thread(void *arg)
>  	return NULL;
>  }
>=20
> +static void *video_player_thread(void *arg) {
> +	double font_size, x, y;
> +	struct igt_fb fb;
> +	cairo_t *cr;
> +	igt_plane_t *primary;
> +	const char *hdcp_str;
> +	double bg_r =3D 0.0, bg_g =3D 0.0, bg_b =3D 0.0;
> +	cairo_text_extents_t ext;
> +
> +	data_t *data =3D (data_t *)arg;
> +	enum hdcp_type cur_type =3D data->hdcp_type;


No random declarations all declarations should be on top you can reassign i=
t here later.

With that fixed LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> +
> +	igt_create_color_fb(data->fd, data->width, data->height,
> DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &fb);
> +
> +	while (data->video_running) {
> +		pthread_mutex_lock(&data->lock);
> +
> +		cur_type =3D data->hdcp_type;
> +
> +		switch (cur_type) {
> +		case HDCP_TYPE_1_4:
> +			bg_r =3D 0.0; bg_g =3D 0.7; bg_b =3D 0.0;
> +			hdcp_str =3D "HDCP1.4";
> +			break;
> +		case HDCP_TYPE_2_2_TYPE_0:
> +			bg_r =3D 0.0; bg_g =3D 0.45; bg_b =3D 0.45;
> +			hdcp_str =3D "HDCP2.2 TYPE 0";
> +			break;
> +		case HDCP_TYPE_2_2_TYPE_1:
> +			bg_r =3D 0.45; bg_g =3D 0.15; bg_b =3D 0.6;
> +			hdcp_str =3D "HDCP2.2 TYPE 1";
> +			break;
> +		default:
> +			bg_r =3D 0.0; bg_g =3D 0.0; bg_b =3D 0.0;
> +			hdcp_str =3D "NO HDCP";
> +			break;
> +		}
> +
> +		cr =3D igt_get_cairo_ctx(data->fd, &fb);
> +
> +		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
> +		cairo_paint(cr);
> +
> +		cairo_select_font_face(cr, "Helvetica",
> CAIRO_FONT_SLANT_NORMAL,
> +				       CAIRO_FONT_WEIGHT_BOLD);
> +		font_size =3D data->height / 12.0;
> +		cairo_set_font_size(cr, font_size);
> +
> +		cairo_text_extents(cr, hdcp_str, &ext);
> +		x =3D (data->width - ext.width) / 2.0 - ext.x_bearing;
> +		y =3D (data->height - ext.height) / 2.0 - ext.y_bearing;
> +
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +		cairo_move_to(cr, x, y + ext.height);
> +		cairo_show_text(cr, hdcp_str);
> +		cairo_destroy(cr);
> +
> +		primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		pthread_mutex_unlock(&data->lock);
> +
> +		usleep(100 * 1000);
> +	}
> +
> +	igt_remove_fb(data->fd, &fb);
> +
> +	return NULL;
> +}
> +
> +static void start_video_player(data_t *data) {
> +	if (data->video_running)
> +		return;
> +
> +	data->video_running =3D true;
> +	if (pthread_create(&data->video_tid, NULL, video_player_thread,
> data) !=3D 0) {
> +		fprintf(stderr, "Failed to create video player thread\n");
> +		data->video_running =3D false;
> +	}
> +}
> +
> +static void stop_video_player(data_t *data) {
> +	if (!data->video_running)
> +		return;
> +
> +	data->video_running =3D false;
> +	pthread_join(data->video_tid, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC); }
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> --
> 2.34.1

