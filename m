Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA783D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A9910E0A8;
	Tue, 20 Jan 2026 03:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVvkvXaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DDD10E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768879597; x=1800415597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UuweDn828vfZZS4kp5MK3dWVpKmlleLP5pAV+hDsUu8=;
 b=KVvkvXawGpCJy/yibTuQdL1krjS45dntARXVb+cQKYLuTdycjVxVaABk
 UdI2swRV5KfExPHg974XfVFY5sL+qU3uLRlrSWvhivbIOafaOY8X2Nn99
 qOV4HptAy17PuXycSvMPWLhZBV/bRYUAujIvkeL+eznsNYOnF/cls+SIW
 5NMdPEZZGyNF0nV0UPYVIw0Ws1ktOxiYIwBPmfXJZkwTSco58DPa+WXDE
 a4jh8PlfZocahZnwN6hM54pYwnOumkGnEXinOTY995Vssq28TB+yeI2TH
 982SopAyCCwXJnY3AgBqCkn4f3QNSS8WW8igzuDWa/txuzJSc6n5wWUtN g==;
X-CSE-ConnectionGUID: KO3xHVzORTqM8hjJzsApew==
X-CSE-MsgGUID: ppDH6R86TVWHETkJVVljeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69283478"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69283478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:26:37 -0800
X-CSE-ConnectionGUID: kyR4MC97QdWRhkEfB4//EA==
X-CSE-MsgGUID: 5cBbKSXDT6CBgYX/kdHBcw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:26:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:26:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:26:35 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:26:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYSK6GhbqCXN3qOJh9s2aradYyP1muLhKJPV9MZWBKynJmEgHVjyfwxW90uuhRpOsQK2w9SX17WeH6eg3d5iZbgVQ+l4Q6NJEyTPhKNKBBHbwyI0q2SYPG8qKSw0892kpcNFZfUB4jGC9an/D4jdfyX1Ork0EYWc0UMl5Hn5pDCMax6JMM/oOovgOslUSUr4brCHmL00nYpxHNcfo5EFtCpi/wazQnGQnvQIJ0i1ACczv0974jWoU9QkMjkn5LAS/iuqCWENKHOuqRfhkcy9LO1nCsuJiadmWhfD6Xyyjy4cyFMdSP8Jc3EiwSZmG/Iw2fRs+8nqAnmppFPAWG8sYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FgtsTzJ6WfsnEM08vztgki0E3gejW0U62yhjukJTwY=;
 b=xMROU7PeRHI0R+uKVfaIjxvj4rQL3fjNbcSdOZsIlyPPdoMrI9hAwzvn8M0SxhyDK9xSX9CUYvx+IcoDm1P3HydP8wQMRTi9UC4ZH+o5Qj2bTXR7NEcMpBkpCzVNk0KYgQ45wToHl1pUgSXyxkCXlcN2JDISaMlR4LP0+60+JDyMowpl6mjjGfMsAaHYHVRoYFfS4bvgbwHLyO4AuPqFg5anRva4H12LD9CVxmsIZtCNler7/XxLdceNnUiCKwwJMjfnJ2Dh5Nh3TKCFTSecw8cx9knTMAxkDEi58T/vIiBF7WFxx22dVwNrJ/bEvy1L86QQpoM5t90ShMWLr2uQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB7087.namprd11.prod.outlook.com
 (2603:10b6:806:2b5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:26:33 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:26:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
 content type
Thread-Topic: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
 content type
Thread-Index: AQHciUAWo2QcU/IRY0y/vvSP59JGB7VaZQdg
Date: Tue, 20 Jan 2026 03:26:33 +0000
Message-ID: <DM3PPF208195D8D8901FF03F167C1317340E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB7087:EE_
x-ms-office365-filtering-correlation-id: d9118158-c442-458d-8b75-08de57d3b5d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?mquJ2XxsrNz/nypCWnDbP6P+dGdOgf+dQLwTxP41Nhxx2Q8SsAzdIQb9QjEP?=
 =?us-ascii?Q?jD0RbZihOo75A5CSBlTkSQ1Dem9IbFB82oUsWPRW7lyUnWhW8cm72+BpXbTd?=
 =?us-ascii?Q?Q/JPhzRgLsDWZRuxmKQ9oK7x+HGPCK+XR6Uy4S1pdTQVLwi3prRFPpwHk9pG?=
 =?us-ascii?Q?GXu93PwfK6gcPifctMCdOPl4R8BdER9Wc06EsOryafeKAhywSsotWWbmnvSA?=
 =?us-ascii?Q?C4YdZkdV7YVIOXbIwwlUSAWMTkLXS1QaGmhbqeNPIr/OXivZnkV6P6SwNP/Q?=
 =?us-ascii?Q?NgVHURbgE3bZzZTpY1d42yEsRnNhQQMCbN/HYctc4xm7lAYhroZMllF1rAtv?=
 =?us-ascii?Q?FrAA8EvMeP1Oo0W1D8OQvLjEAz2EzEh3DchQpuij9/bLtDkIMNCAYt3Znm3P?=
 =?us-ascii?Q?7Mmq3u+Y3NF7/JkynN1JdxYAgUL7iTD0FYnMlcxhAZFET4wY4lCwcsOdGPxC?=
 =?us-ascii?Q?fsrx8IHGJWR2bY3Km1kW6PKkAFXArSyGdI2Sm7l925C37Nah6Lrmjh/zh86n?=
 =?us-ascii?Q?u8u1GFUFPy6SV9KcHU8Ika2g05aS0KNxUzQ3XYXj9/jDYR1eBEFqr3LXBZjy?=
 =?us-ascii?Q?Who4lCIRbgyzY6P7/7epTKG8NZztdpXTvmGVt4/ZOAc/LguchldkAkiyJDVq?=
 =?us-ascii?Q?0h6yQ2fKXbhWkcXexApyxgt7rTrbA12CGIDE+X3kH0L4J7uQxEornksiJpEt?=
 =?us-ascii?Q?oFCOBGzGcVrV/ts3ZkSJTrvxHhQ7iUagcrG62wl4d+WsCnFc+kk3rQAzB2vf?=
 =?us-ascii?Q?+Vlof1C59S/TN3nQblENRZ4YHWELXGdsNmvY0Icb8Mgy6nNv+wKP6RGYzY9e?=
 =?us-ascii?Q?xvr47AgQMwK3wIJ2JD9+ScQ3fQekSuNJOi0oPFxTo60kuFD5qahj+bqA+Mf3?=
 =?us-ascii?Q?OK6dh2mcph5s+cs9bHVAWHuWLzdpMx7VfpPIQ6flZnyxnJwpv9a0FMnMrbMN?=
 =?us-ascii?Q?7nz8NzyR9s5V5ZYMxLYlatthByQo5BC7rlOh2BuPh6/7NtKb0mb2nL/8gavg?=
 =?us-ascii?Q?arqhJuY/k0ncVcEr7h1QPu4ekwumv9AfnJyL15MRPyICjMZv/tp7ju20wsN9?=
 =?us-ascii?Q?fLmsBFKns9GIJhCsf4Rc4CovN0+GDUNZPEkCyEFXvdEkD0C6lydCD7HGHpSG?=
 =?us-ascii?Q?c1AVM8k2F5BnPrb3rmRVNwgTzKWf1s5LygWMXFnzBndqV7GtFNXeoy0B0AAJ?=
 =?us-ascii?Q?svI3vH8NRigTL88vk1ChJRXDQuGYiIOAZLV2zZUvKhx9/8nQtf3xkSqoflJU?=
 =?us-ascii?Q?EZmKLD4ghSu1BZ8+mppwDdXh8iYQ5UBC9GYp1KCSz4GREzZpCaedRjHTMLlT?=
 =?us-ascii?Q?kT3JUnIp/ExZ+0JaX6LllXA1zuczFyaQDlUAQf9b1CJMQSZiU58KcqQ+4mJi?=
 =?us-ascii?Q?T4tiW6KJxu4a2t8pzeRprmaJuL7fgNGmEyUPv4jy2kYPvEyAZOg0yZashQFx?=
 =?us-ascii?Q?70Kleive/louzf9erdYRkUvfrydgMmWEVN0SzIwDk3el+ylJIIiT8PenxrxC?=
 =?us-ascii?Q?UWStT4viA1Rcl4v6fX03Fdv9LKV+GmzRp8UNJyjIER6jRV9zefA5RmaipJsp?=
 =?us-ascii?Q?8dL5pJmhcwp70ejzaiRdUq0vagldkJj9lCD3OIQtrnJz07f4jUAoAqAgqA+y?=
 =?us-ascii?Q?mSrS8kZ652EAObOws+Ea8ME=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DvczVChLJE50DeGlkNENfwRLTLWcOaPFF2iewi3Pwsh8OenzkBeSg8sRpDPf?=
 =?us-ascii?Q?TlRk78UjHhSkTxT/O73gm8Rnuu8el2HplwIAW3RYJ+bWB5esqkH2fCIlh0XS?=
 =?us-ascii?Q?p2lF9hhvb/ZaDF27t1vD0Z7MiE0joITMuvax7E4HqEVIlqCyO+PYXgOFwm4k?=
 =?us-ascii?Q?fySn+x5wHQDaIOz8dpsMB8AkyI0jWghZZE7gCN7PmTQ0LR+hExTfL5D1B1n8?=
 =?us-ascii?Q?7S/raa5/X6kKptkoS1PiALp8mR25j28NFoSngwOITMnSnWC50h6eHanW1hHm?=
 =?us-ascii?Q?WzZMThHfD3XUu7aN5+KVtNAUML7x8yF2xlDUe+N75xj1lyUyU0ZbQ86Vmi1B?=
 =?us-ascii?Q?zWxyFdhL5BO+bzKQGaCBFZs7TAgjsjW649CR2iV32gLMyt/5VUV8A1kUR/yK?=
 =?us-ascii?Q?7qF1j5H4Rs+p0ZEIuO4FBttX4DCIdmHDxkLwuRdSmyFie+rsKUuGwN3INXeq?=
 =?us-ascii?Q?6NDUaPchj05gIFJ9dsE3puQb3fFXTOMB2s6PFkLPANl8w7wq/KW6HXU8n6lk?=
 =?us-ascii?Q?hfArxivcWoWNLZ1hghInpDj+dUPgGfUXBI68wFBbKt7a/DLrmdGvWrT1PMU4?=
 =?us-ascii?Q?20C8cQz+mcdvo6JDLVDP9iudIc7zq0Z+JuuCtj55AMo7qDtrwuddHoIAcNhK?=
 =?us-ascii?Q?lXrVPKk+u3eWP+Fzoa/7bLP1SvyzgAW/8c61lFNQ93PXpVcN7NfPKTAcHXEN?=
 =?us-ascii?Q?3ney6VHtESam8mFlnSVMLybylgbiaX233myomKK2FjWD5HDKkOXxqmWOcY00?=
 =?us-ascii?Q?ks5wjzX8ezTrdSv20hChlNdkR3MvME+WAVH1dktgupe06jJwYoLSFV3ZgBKl?=
 =?us-ascii?Q?a2yUz+F3LaavnYAUc59yoGJvNM5xrjQdU+j28//QhsEMjDQdDdRGtGKhVN2M?=
 =?us-ascii?Q?1K9IqR/VcYXLcXHvORE0nXrwV7lsZ8iLivuGpvcxhRzIDoX2RIVZCFQQI4uW?=
 =?us-ascii?Q?3FzqROO4u9WlzzAp94E8ZESoNNpLFmmpVssgTAtbHrC4AG3Y45CgB1Nhxkd+?=
 =?us-ascii?Q?ZpaFpas+gOxHdKZn3VK8D4woy82Rr1gK54W5neHx44lNJry0LyMZknBOap2l?=
 =?us-ascii?Q?F6g6xKUnAnoqk2ex86G3cS7fuXeEfByk8dKHw5HUmYGY4QZjlY3aekL55soL?=
 =?us-ascii?Q?K7fimVJgEmJMLaUqublmOV6d999+7J1Z5l1as7NWpJQCbgJxGncb9An2ct4Q?=
 =?us-ascii?Q?nsNVIV846viBLQ89qS/sxgpLE+klU2rzeVhlFBrbiu9ANoLbOFXFzJU9pegD?=
 =?us-ascii?Q?7e204CqEu2QBJQTHaX68U0/FeGn0LpCRj2Jng7lKaqM2eTY0qEeyZYlTW3Ix?=
 =?us-ascii?Q?buzf4WCQn9ki9JLEYFodAmi/XRnPRnjyPJXPPJvbIXvfFNjN8WJz/UuKtYwq?=
 =?us-ascii?Q?HyUmCNkJD5R+j5vDpNIgfEise8G2jLwz/4ZwZ2Y0YesPk7YXXOewOWNF5UjH?=
 =?us-ascii?Q?bIkvWmuFUCjUphCs26cdZYnv7kHN/95Syx4UVRSSvM5EitwMCf9D/oI+v7Ga?=
 =?us-ascii?Q?JodIxFm4yA01H5L6hQy5FdLr4xUjNJOnIW8ZaFvB7ikKFglRaBFcp4Pq5Bsd?=
 =?us-ascii?Q?+luosefedsVZ9CbfdMxkkInKx0zj+bNuLwQaydI5u/qlVJautkyCV1EwVj8X?=
 =?us-ascii?Q?FWwUuhIXbDNiYSKyjIjbeMZaQCbgGNSzWYMCJZEGU81ys2v5i7HZDyzy76HA?=
 =?us-ascii?Q?oEOy8n71gOMxcRLsa3IOXjdTsqmY/g30hnX6wJAHMD5OaJJU8kKy6ZDFOmKJ?=
 =?us-ascii?Q?i65cHYnQzA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9118158-c442-458d-8b75-08de57d3b5d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:26:33.3444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wReZQZOk+0lTn7QNztPuOpN8UCJ2kpbv7duC2ZSspok27k2UxPCfmHx9Be00TEMtij+eTyHFwDyJ9SxUfc1HKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
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

> Subject: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
> content type
>=20
> Add get_hdcp_content_type() to read current content type property This
> displays Type 0 or Type 1 or N/A status for connector.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> fcb746b6e..dbedc60c8 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -79,6 +79,44 @@ static void set_hdcp_prop(data_t *data, int property,
> int type, int connector_id
>  	drmModeFreeConnector(drm_connector);
>  }
>=20
> +static const char *get_hdcp_content_type(data_t *data, uint32_t
> +connector_id) {
> +	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);

Rename to connector=20

> +	igt_output_t *output;
> +	uint64_t status, content_type;
> +
> +	if (!drm_connector)
> +		return "N/A";
> +
> +	output =3D igt_output_from_connector(&data->display, drm_connector);
> +	if (!output) {
> +		drmModeFreeConnector(drm_connector);
> +		return "Unknown";
> +	}
> +
> +	/* Only show content type for connected connectors */
> +	if (drm_connector->connection !=3D DRM_MODE_CONNECTED ||
> drm_connector->encoder_id =3D=3D 0) {
> +		drmModeFreeConnector(drm_connector);
> +		return "N/A";
> +	}
> +
> +	drmModeFreeConnector(drm_connector);
> +
> +	status =3D igt_output_get_prop(output,
> IGT_CONNECTOR_CONTENT_PROTECTION);

I see potential for unifying the previous and this function to the same one=
 since code above this comment basically remain same for both.
I am thinking of maybe renaming previous function to get_hdcp_data with two=
 additional bool variables status and content type.
And you can add if (status) the retrieve the status and if content  type th=
e retrieve content type and if there are use cases where you want both
The I suggest we pass two more string pointer status and content type which=
 can be filled.
So the previous patch will mostly remain the same except you renaming it to=
 get_hdcp_data
And this patch you add the remaining mechanism.

Regards,
Suraj Kandpal
=20
> +	if (status !=3D CP_ENABLED)
> +		return "N/A";
> +
> +	content_type =3D igt_output_get_prop(output,
> IGT_CONNECTOR_HDCP_CONTENT_TYPE);
> +	switch (content_type) {
> +	case 0:
> +		return "Type 0";
> +	case 1:
> +		return "Type 1";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>  static const char *get_hdcp_status(data_t *data, uint32_t connector_id) =
 {
>  	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);
> --
> 2.34.1

