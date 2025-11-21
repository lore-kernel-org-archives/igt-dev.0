Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA945CFA476
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 06:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6FD10E110;
	Fri, 21 Nov 2025 06:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2k/hQse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F9410E110
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 06:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763704965; x=1795240965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wkvx3lNaerG5MsXR1oKL8QRdVq+Ccy5lS3gZOodZZ/w=;
 b=l2k/hQseUiPzVsHWm5YuUYiMMmS5QLAklXTrl2HxCu6gF+P5cUrj7bnp
 IYdEecOvGKTRKLJVJbjESBwJcjsUcAiyeIUEnwjMwFbGIYP1S8YVGcwY7
 pDFmXIvPHNtWWpiH1OLNSXoBmIn36ITQhbxtfxfUK9wNU4UlHx0xWkfmk
 9nNNdjp+qODwsZ2Mv3NRakA/rInU0K6dyVoA8tBJrOhdoNUyBUiUGqJ/o
 w+ZW5uXL0hPM0Kv4T8hnBDmnwlqulV+PJnOThNDJEywW/NoZljniaVWrI
 SI0TPZYnLXrUeAHCdHFWPrvlQJrnVpUPy9Rtrqh3CbFmU94M0l1zQ1cfl w==;
X-CSE-ConnectionGUID: vUk7JVD6ReeSGicJfSK3nw==
X-CSE-MsgGUID: MPqjhzvJQxq53ED3wQfuYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="91273794"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="91273794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:02:44 -0800
X-CSE-ConnectionGUID: ANRV0duIR5S6FbzssaNsTw==
X-CSE-MsgGUID: Ae3D2/lOREqowBoUaFmt5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191633600"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:02:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:02:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:02:42 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:02:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmxGf8CqDGUpSZmO+arpdl2dr0PScFZoswzOkjj/UhGtmy7AN7hFkbmg2EOtDdz5qEGxKEHBa7OLhkQ6NM5IAWOOtLX+V9/U7SR45IAJjBinsoIeTX+ow2L8afIhRs6jEf4uq39/sfSnqd9ZmJA9MQFasQUPxRSMOQre3UEenIHXetdYom+OoceD1dMH2Hu8dMHZ94AMpSepgMk/FsKTsYUv9uZP0ZC57EmuHczkZpPgfPjJQA/S0IEKjyfbNjUoM1tZQBbc9AP6vFPfkl503/IqVX+lAoqUGJbmYDOjr/UIPx3m59r52done5E4lgFtR9XaM75HBzttrx+2hubPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzEO8gx9J52YzgQXHnkzRgJ3NZUWkm68KHtEJCyr4K8=;
 b=veehOUlR5Sj3SXL05/QWeX5Iv4AP4JSs5XbnuvCssvUjyrf9cZCsSs+nLZ4Uh5G0PQmum07DufrPnT5zj+UcOY0KpJmlZuWSnm20N0vrH1JXj7XlKjnix5JpRgBl3aUP6/KfKmZFlGelzKJdLWmlrW3/JAfF1lFfc9aS3+YulR4wuHogyNxZAdQLfD22tJLe2wdLkyaVMyF4TikajOiFpWwWJngWqSYiEY6QLJ+ijCC14p7M5RcueQXE++g2KPyRyU8vtZwyoiYc6W0bH3ZtwiqBlJRVJmOICOXg9fFSdYWlYJ84zD38qm3IFyDeZs+lfxBO+Mtp006cMr++qxIIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN2PR11MB4536.namprd11.prod.outlook.com
 (2603:10b6:208:26a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:02:40 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 06:02:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 01/12] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Topic: [PATCH i-g-t v3 01/12] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Index: AQHcWqlrijAY6ymvBke1/a9EoFRDT7T8o0cw
Date: Fri, 21 Nov 2025 06:02:40 +0000
Message-ID: <DM3PPF208195D8D67256ACEA71E47114F73E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-2-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN2PR11MB4536:EE_
x-ms-office365-filtering-correlation-id: c6c3c84b-33b2-47b1-9967-08de28c39474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?g2TqStcb9nUMzWq0m4Ay8OPxFExq1zb0IihQivhufWY/WVg+CSzqBu5qZoun?=
 =?us-ascii?Q?dUAqow02bWyqIs+kqRJt69z9hlmWuV5tGzHNVcQc/04Yqvsq0GMsEyi6is0K?=
 =?us-ascii?Q?X4VdLNTRE/Nsu05GqS74Y6oaG/qvOpBHPdWbpczqTeP+8CijAV4E+ptRpk9o?=
 =?us-ascii?Q?UI0/vV0yylvWnIiJXr1/jrNmGziDAMIZ102Crifa1eExeh6alE/kR7YWxGiT?=
 =?us-ascii?Q?DKQkd1CVDnxWlz4ixtFVJSW4X4U0mFuR375Ykx6UwD3IVrfFQA9PXhEWJPPC?=
 =?us-ascii?Q?b8TfVjRx0bpK0tPHszDZePf4vy1+ZdfkPhqoxWOs8VD845PorDWLTI+wa5BC?=
 =?us-ascii?Q?W5lm1fDzl+q2LQJpcLegWHcP2RPCv+jWqjqtxWEBn/Yl73HcbZKkQP2SAHEb?=
 =?us-ascii?Q?krwHjJ/m9U6+J13YZktLCrZSoFO7f1sbr+otFWXZiNeJ7NaaKQ6rQtCYn6NF?=
 =?us-ascii?Q?0mdSr/LCwx2z8GUy8LTkZhPdUd16EDntJIQgMGNweSi0XvplKK6hSFkyIDP+?=
 =?us-ascii?Q?z/LZeZoX+uWu1vd7IRaoeNSRXMErQ7N6zJQCKEqzkYysjf6VYC7AS5Zz83Hk?=
 =?us-ascii?Q?kLLMDinsKWbz2WBiWcLF9qrrbgwTm+BYZFasl+ZCg66XB7pmJy5r2i5i3umz?=
 =?us-ascii?Q?sJ+EjMwArHGaJFdNFMBR/fL67MuYuzIZmK1MFNDO7idhObB0c07goo/RBJCm?=
 =?us-ascii?Q?zuNtmCf9gt53Xc8Qe1MkXksYLVL7v+HcUqYPL/YMtNmUNGAfBCxBhySqd7O9?=
 =?us-ascii?Q?nesQlcOBQ4M3odobUnDk6Vi8SolHB7iCVeEtneUYE5z5umtWG28vcmGUDcLz?=
 =?us-ascii?Q?3pOlq9anP/0t2QYABkzAHb83Fv6RXOyklEDTm+FLvc3cn06imHF0WTo2+yt4?=
 =?us-ascii?Q?1T8dN+ASKnCTQy3MgFltQDyx1lHEynRpeYLV5+FA/zUz+NAsqVPYWmqYaqmv?=
 =?us-ascii?Q?myn0QvbJQfEXWE87/fZg3PZuW6b4LmZMUDgXX/X7Klcb3iVvFjbftqF2sItT?=
 =?us-ascii?Q?z8gaXWY3D+CFYUNQfTaoksfbb6wgBViu8s7maLsXcMxc1EpB7oAW4e0w4QvA?=
 =?us-ascii?Q?puZZxO7Ny0IiBkERM7PVRCDl2E+kXXWaN+IpMoXFHh/8dS0/x05Gt0v9OiZl?=
 =?us-ascii?Q?ClPmUQrlm1Rgzo3uHRkGyQ6y6kiARIlD8y9AMcp/5n4v8mvdlK6Z6K7vHMXC?=
 =?us-ascii?Q?L9iPd54abwNoaoROi1h1vHTfLuST5sDwrpNJIpVQwS8gfVEDOGkRFVHRgBjk?=
 =?us-ascii?Q?JNmwvbgOMpIo3JjaQw7INQsoHVOZSIAKo0tW6boL1GloNKSynPtAvVysznwj?=
 =?us-ascii?Q?aKkN0eXymPuauzsU5n5KtLBttoIUr5SsCgok3IvnWlsajrmpDa/4AcDwarqz?=
 =?us-ascii?Q?DCM4a58QLjqSsSpnMcylDINOojQ1AxsQQMFLxLCJo2LzZ59VWEC17UQR0QKS?=
 =?us-ascii?Q?NyvkocEEl1oOZtlgjeJjpm+1+5palxn3fKtN+R72ZgPZyxTch5oCpzkJFO3N?=
 =?us-ascii?Q?c8yvyP8OIUGs4LtvsvQFCQIziUwc95K9cn7Q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KnKCAZvQeLQFlVW8QRxCAcQ1xIK2wZyqebYu2vhNXRhtQYhHrDdEXWbXSj3R?=
 =?us-ascii?Q?9YzaKO+UD1s0REfowHrFVfmkQi4IMoXAYQ9bF8QBV1hvuh2BXssiZIktexpX?=
 =?us-ascii?Q?rmXDoW0lD03BjcHpyNkBhgNU0sKjW6YvBu6NCWQlIJSfpfb6LGcD4Tej//II?=
 =?us-ascii?Q?/IBNky6Cf6EHOK36ZPYzTIfPFIxIGjXNjGINgc1zJ7HwBb5fIL/nLp2ApXlV?=
 =?us-ascii?Q?1A2D3dR9ZUwTi/rRBi/5CcS4qSg0+EMaEYzxAauHtjr1ji1hko+Usu+2xruR?=
 =?us-ascii?Q?kOpKXjxbrjq7vBrNkJzFSEnlJoKgC7vdVP/Qf9Vj5nXIw38T2nc1BxDnG7xj?=
 =?us-ascii?Q?ys5XrQm3o38pzQv+3s5gUSOC/X1jFNXHEY36Von1L+e6HIlcyFZSTx8Qh2kH?=
 =?us-ascii?Q?bOiwrjyXFwh757BXoXW7gPlA+gdJt+QvT9sD3lDcb4FIFu28uelXtnUfvmLC?=
 =?us-ascii?Q?R58e+Z2ffv/Bj/czOvytpt1y4J9rre83uzdD/JVGgENPYKCC0bIJ07yNkRee?=
 =?us-ascii?Q?AVox8HQEoY9nFfONms7Gd+iwp+vhPxNF3KfKywAKalF9JpHeJgd+rPTs361J?=
 =?us-ascii?Q?yWDWpV6R2jqnU6N3VV+cn8g4y3ZZLHxTqLDWaRPdiTg5KD0D+ZbcWDvcF5Lv?=
 =?us-ascii?Q?IGzVHsLfiwV4ZHWaRUrbNkAPdNl5iN6sVpMmQEz7yhzzC5aiVb/CSlfbImyX?=
 =?us-ascii?Q?i2Lx/ZV08wKNGRSgJebW16T7IP0vJWl3EgqlAXXeNqiyS4NN54BqAuzmwAd1?=
 =?us-ascii?Q?sWe7XMGjK/iysFSKwZNnmoExsOLoQJ9e/Tw0B5YlcRd6TA6kv8i0ml8oq3eW?=
 =?us-ascii?Q?aDq/S300uzn6tZEE5F+lgAKYngUci9j3CVLtDb21iAxsOgrIudOR+Ynjvcq/?=
 =?us-ascii?Q?tlaVwYahzPQKrepxrVd7g9YhiOmrlzLNXLRUVZ0NHTYd2HOyB8yGrgIYbDwM?=
 =?us-ascii?Q?7LocfXzZv1kDZLLQ/LS6Vl8h/1WVSwV7OePxFbGV2YcDGVoQCfeuWHQOATmb?=
 =?us-ascii?Q?pEeOF5IK5o/Jhvwhf/lWATpn7P1xnTQWA0tUf4z/4eZzHhJ/wApDTnAmqcMo?=
 =?us-ascii?Q?WYn5tg7W+RCaMhA3wMxP6vgnv/Dt4JYb2V9y8EaUrHsI21aUK1zQtmfdzWV3?=
 =?us-ascii?Q?mWyfQ/bXSjOIa0sIr9rWsq86eqhsGa47UzLV+HugTJMWuY3jU3DWtbfyeqnz?=
 =?us-ascii?Q?jUQdboCEqyRoUZaPF4fcJhZV1dQsRh7OXAz4AtboSK2tAl8ZzzTq3G55rxd+?=
 =?us-ascii?Q?4/X7ch/b8IKOqdDB9lGFwzixFb1BtEGhV1B48iIzKm+E2Ds2l0+pnF7gJupM?=
 =?us-ascii?Q?ujISIMNT+e1Atta6U0ebLVhpzJoVx1k282bp/eNfoZ6S3XgkQxF5EML6d2CR?=
 =?us-ascii?Q?JzRZ1LVgmEgmyQBJuBackMpQsbkEEpMNVAiZHr36WBWFxPHq3/VQBIDWHogX?=
 =?us-ascii?Q?10Lv/0T114EI1Sn1syCrnNerCo8XB2YzIdj4RtaFBoQHM1L2h9nY9tSl/9je?=
 =?us-ascii?Q?CWIbGhHncAe8W8tSjXJhyl1dLE2LLAWKYIDQSGc5NK9Hx6pW2gKaUQncomlr?=
 =?us-ascii?Q?PO23DfXmY27hr3wekvZr1icsTEhHC3Dv1wRMa8ES?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c3c84b-33b2-47b1-9967-08de28c39474
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 06:02:40.7442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQxA0XaokeXzxArthjL7L/QAkKFIMN1RR5uB5C1hqXdF0ayxs4w+bt22UGWDovHhB+SATk/GiEmbx3dK0+WuoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

> Subject: [PATCH i-g-t v3 01/12] tests/kms_writeback: Add support for inte=
l-
> specific formats
>=20
> Integrated BGR formats supported by the intel into the supported format l=
ist

Should be "Integrate BGR formats supported by Intel..."

Regards,
Suraj Kandpal

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 1b81088d7..de0f67a58 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -90,6 +90,15 @@ static data_t data;
>  enum {
>  	XRGB8888 =3D 1 << 0,
>  	XRGB2101010 =3D 1 << 1,
> +	XBGR8888 =3D 1 << 2,
> +	XBGR2101010 =3D 1 << 3,
> +};
> +
> +const uint32_t fourcc[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XBGR2101010,
>  };
>=20
>  static bool check_writeback_config(igt_display_t *display, igt_output_t
> *output, @@ -101,11 +110,6 @@ static bool
> check_writeback_config(igt_display_t *display, igt_output_t *output,
>  	int width, height, ret;
>  	uint16_t i;
>=20
> -	const uint32_t fourcc[] =3D {
> -		DRM_FORMAT_XRGB8888,
> -		DRM_FORMAT_XRGB2101010,
> -	};
> -
>  	igt_output_override_mode(output, &override_mode);
>=20
>  	width =3D override_mode.hdisplay;
> --
> 2.43.0

