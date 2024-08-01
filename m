Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781F5C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354EB10E92A;
	Thu,  1 Aug 2024 11:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cr8LV5Mz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3C210E92A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722513238; x=1754049238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=azzANjaox5jQPTHCRL+5m6eHnyD4yhZaGu+Gd2YayX0=;
 b=Cr8LV5MzDCcwYF9IPEckQHk4rCCQIzKL0KHFS3WWEYd0jMEgXsOTB/hO
 wgXzGaPzbeebs+d9RCQcZF5H0lqgyB8p4knYfInQs7lQ1lpukzPG2kXm6
 PRSdOjMKcaxvKIWbc8fZn8sYTeFv7aXKdQGhk6TEuopz7/uq3x5zBtErt
 hXEuiuMxXUs91hAdicKH6EbFHQRnt4hMLriHp89f/jPEVOvwD4IJstf0X
 0X0qTZMmYkTWi86qZJVMgJ8UavZNfkqGCgqDshQUd7Jwybk1hOuzHIuJd
 nJipRWtejFJSLHMsatgxorR9V6vI6zsEJRMCLsadPRd9XPf7prN51B7vm w==;
X-CSE-ConnectionGUID: NdBAk87DTq+zORebYdqhTQ==
X-CSE-MsgGUID: 04rvxuIaSpeU9j57wz66Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31111944"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31111944"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:53:57 -0700
X-CSE-ConnectionGUID: IgsnHTP3T4unSviNIU0/qA==
X-CSE-MsgGUID: YHdPrxxPRKyZ39OUM3Ph0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55791998"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 04:53:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:53:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 04:53:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 04:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aggHSWCNnENYgat1cMypBQhtUcZwRBTp8eMnLyyyVNpFOoLj3zZNbdK72MCick4w2l766lMh8WksHiOJXqWpt/0j6SUtQGueycj+N2t3sRwaMQW0I0k4MjHStxyZjXglxIw2x524A9hp1vvOnsR6nDltGXh3xL30RuRNzo9UtcFJ3hWr60Ajt8xOoATb+5Z2xCjEbfO7kUyy/yjWkOSAWFf7mtHrdKeW/6/E4M0ydd+67wk9JDqTTm+Jtk/xQL3+FXNGqswTNL9UM8aRhugpA82RoQYSJS/FCznAh8nOnzl0+YDgJDLVh6SwGkvVVLSUrBfHNigd1+Y00w/MR795nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=583kqT/+zEytMkYwx72ACMi1wF8ZqZfE4cVJlznYFos=;
 b=yx3mbfk7N0dzBaGGUjztBgkPDen4IGORFuIScUGcCuWOgK7cJXhkiBXMPxfrkMLvVMjZh3pbLrtb03rQAzooWX88ZLKLN00c/J49Kld5M/YnKs29BMpHeJhEp68hkijp3zNw4jFRdrKBr8Y7zsI6jLea0M1MvIHwspSafrjTQLc+3G+mWVNWpAP1TrWnGGgfmy6y1XoUi9x9YDNnpIqUVDS/TrYvoZgvKXiuxtf6ix/jZ8nD+76LeHHHSJwRd7VnNT1A1lurUEqvzcvzu63U5PTqlN6zkBEhtjz7epxYC9r+u+yIS3rBOvdozUsKMyGiHI2xyjoLGqmF97BRhgB/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 11:53:50 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 11:53:50 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 12/66] tests/xe_eudebug: Test open close events
Thread-Topic: [PATCH i-g-t v2 12/66] tests/xe_eudebug: Test open close events
Thread-Index: AQHa4nZB9bNLGW/PvU+ZlV3kAMO3PbISTc+Q
Date: Thu, 1 Aug 2024 11:53:50 +0000
Message-ID: <DS0PR11MB7264040EB2062919DC628886D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-13-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-13-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA0PR11MB7305:EE_
x-ms-office365-filtering-correlation-id: 2f6d74c9-69d9-4880-b3a3-08dcb2209bce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?8W6r5MfxF71i9KQEKBA2+qopmci2nPrPeSvwo62IdENAE5WkM+y5ZCN3yg?=
 =?iso-8859-2?Q?Rw2DYWW/ACgtTzklZjHXu/KgQbfgf03APTQcRS2IJ65OMHrRwlZe9aJ89O?=
 =?iso-8859-2?Q?lNQrlKx9IVOeM3Wc/64FgYZHgMdXddgiBI4SFzfiIxXdlm0zXC+M0WB2aI?=
 =?iso-8859-2?Q?Zz40AuNbuyoHXigJ8SMHklX9kWxrQZhD90cJiC7cdTv3FADlNr9gsyBrfM?=
 =?iso-8859-2?Q?0/qM9PfB4MDZrJ2d4kyKcEeJ6P+PaY7Wo0X6Yk3VwiVkFW+Usy1/+YleNB?=
 =?iso-8859-2?Q?a5LM0biHbFv/howS0OxtaxZ6wUGJmQn7sKPccuwTHtkSlcFKaJhkE+t7WU?=
 =?iso-8859-2?Q?YOEkdIYttcqqtcBNIkz4ngLLxQHxdhiAEXK5MihYsvtkVwI/kQNR679Vnr?=
 =?iso-8859-2?Q?j7jCxhK+E4/VePbaywLnhRrlNLCwqa16HjDVqOs4dyeYrsONqv+wkXT+Dy?=
 =?iso-8859-2?Q?KTNJ+TWrWR74l+2AoFks3CTqVISpm2A1DObSVD3rIm3qUnnuaQBSp2hrir?=
 =?iso-8859-2?Q?LrFM77vJeV8HlpEJZSjan3JhB6UeQG0UF468vq7oQvpP9IG9+BRUBKXCwy?=
 =?iso-8859-2?Q?TjGq72t1HVxHlMj82g0x4OqJtqlZeXppavewHqKZQaH5K/Kqjs+YoFlEkG?=
 =?iso-8859-2?Q?eb9B2Fgxu9JMtzSOF3odpDk7tcP2QVPjs1ibcuX5K3htVssHbaodfbRRc3?=
 =?iso-8859-2?Q?/IjRRfY91/elZIyF8EBlD6BTOV8c5W4Nkm3lV84bqkJO0/qTNkhxix9XYB?=
 =?iso-8859-2?Q?WrMJ0edv/1bLBOafeYu5ORVEbMxhKKCe4rHL7WHJ52RxzcoNnI5rLhTBIN?=
 =?iso-8859-2?Q?HchzoPrjhFR0NRNgOsEcJATiJ478gRTpnUeqhwPuXZzOV/UmbDKsU280L8?=
 =?iso-8859-2?Q?euzpi/vKFonxcgnwai6K28etrJNl/J1lrmrvA43PVQQ/ufiW6yzTO1wHcR?=
 =?iso-8859-2?Q?SaHc2tdild6a2d+iEc1XIEkl8bKJiKVfiqqCYbjqX1vwhyiJjrpPWhwCne?=
 =?iso-8859-2?Q?diiBP8hmMPlZnUzbwCkEP47+5JhhQah53JR8kPj2DT+0pSxZcgTUFlUYFK?=
 =?iso-8859-2?Q?6FkGGi/QoFu6zVJXgT5N1MP+Zoaamf49QW6J0tKqshScMGheuwvk6Qt3/X?=
 =?iso-8859-2?Q?/8jPPSG7IcFA/h+mAHFRVUr2shlZ1ew8ykkAwxpppGce/Xw8KD+u+NHID0?=
 =?iso-8859-2?Q?hVOqf3d3+UoPSNkHO85NRRxpooqPsACuI5u8Zvn/Ss6UwJstdxu3P7yNSK?=
 =?iso-8859-2?Q?4k3xHVSTlwKu8LGLUJeJdJq7oBe3DrT1R2P9HcXJ2nCqRPQnzDt+2uY/DN?=
 =?iso-8859-2?Q?V77gb/XtzNgKrsr3mtC8BsIJBM/bU8cSDeI/cDCicLQ2+6VIrKKDGrhNMt?=
 =?iso-8859-2?Q?Sf/nTxAKZbFlFC80zKqJgjp1yrSxp+1boYbuDOyasaBh2heBm1Fi5kN1sw?=
 =?iso-8859-2?Q?NSliW6+vZRvIiFOI10v29EUlFXACmr6Gcb3miQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?oucRqun2vdWbtO1mKDQawkFWgMV2v40qBHEzXQktW9qbhAiy4Z4EQuJ3nU?=
 =?iso-8859-2?Q?UP1poSnw0wzZVVeapHCi0E3u7VzVcgChkQxcoOTrkG97rscOnjN0DjJsOi?=
 =?iso-8859-2?Q?oeekiVBZKxdKkYlMEXgMxumQ2RhR9Vs3UhWPTszpkXeT7ddOUEr8Meb3WF?=
 =?iso-8859-2?Q?ENO3eKNTIKo+3qMfGtyKyEP0VA0CRmVOXiJpc45zspHYSlkOAVKNmG4yQC?=
 =?iso-8859-2?Q?I0yEGUD8sAanojrIXRpOk1jGgdy2MLaW1ZVH/+nleirTw3MTjj9a8zingW?=
 =?iso-8859-2?Q?AMSMVB2Cpw0SThwAWdUyCDJ5HX3WMlkRfadcXhA05AXmCi1zBZTiDsdIb2?=
 =?iso-8859-2?Q?D2s/WB4hdRy63jpfJm/RDjPMpe7IQ29cjbJLv145AwYjA3eHP1lRLgUL0g?=
 =?iso-8859-2?Q?5ASV+UACkaKsawbsZ8/fyCRWStdFXaLeBlxbNvXPw2BkSko5CRDnuWdGoq?=
 =?iso-8859-2?Q?ShZ2QaFYJrrMjmkxPH693HeFm2Ya/sTpDb+Sgb9y9CtUXNA98kauiO2P7F?=
 =?iso-8859-2?Q?Zck3itNpHkkvVf64zSl8Koims1eeVge98cl1o9dk2f1HZkfgX1RMkYMDIW?=
 =?iso-8859-2?Q?00bNs3pe3c2521pgmdtPKGCV9QJcZQhxhEbm9gAGtXKbI3MF3t3VTsCkGU?=
 =?iso-8859-2?Q?7Jq2WduO0ULzFQpBPNefkyOW3MYmEJ2r76cqwEP6Hs846JmI8w+KHIk+O1?=
 =?iso-8859-2?Q?ZNMHuScQ3s7d9whe+eReOSH0d6yrqu8LDJ6VEW3SP2j6KmAebz0kPsa7H6?=
 =?iso-8859-2?Q?L02W6FVQE8wyUjk4gIcFPYGKNntOY3wMIZdSP+3R8GIZSgKCZlKYNtKdiD?=
 =?iso-8859-2?Q?C014DtsjXGa7zxTl4p1GgE75jhI0i8twutBv2VyltHg7JFqlarfIsCT/Ib?=
 =?iso-8859-2?Q?7N1e9chcV6K/6rg2aimQ4wjs/HA/UHpwsPRQE997yN45JTPwHLf+/mdts2?=
 =?iso-8859-2?Q?tTFprlAexq+Qlb81inCLe2nzMHrt/tIBLkN3Yl7GQDUg1WRliU3Yj7ysaI?=
 =?iso-8859-2?Q?+yrryG8LD9px97B3k74AtUtnCiUqJrVcjr4J9OviQZYsKMRvh8ptGwc17o?=
 =?iso-8859-2?Q?HKrKVLQblGaWgojeGmZe2bd4b267ura4+SqlFT8XH9q7+Ye3HGZDpC2OUz?=
 =?iso-8859-2?Q?ogbgyuk4FT0i6or921s/HFwgVacEdMM8UIpWHTcj4moXKY0AZ0zCM6sLvo?=
 =?iso-8859-2?Q?HtOa/18Yz8L5GJSieBmEH262W4tT9pjIQpT5HiT1nf+kqMh+QkBXboHSSr?=
 =?iso-8859-2?Q?r7wnLHpPLhhnp+WbL10rLzG0KBIpoy8xA1Y9mvh9I8HOC1OXfxDOecIry5?=
 =?iso-8859-2?Q?gqB+jw7CAwuXAjyTIL8bysR+BafTrrNcRoHA7M1kC29Ur8gx8F2d43WIFU?=
 =?iso-8859-2?Q?fV/tkBy2Ni/I+gzy2qnmMEI+HiR2cJaFzYtblQQ02SAe6qxsE6w0IPK4+w?=
 =?iso-8859-2?Q?vr5+P+tv8M+vszXEZg/itXM1aHzqHA0AeWLpbsiQ2on/vr3Try4HHkzoUv?=
 =?iso-8859-2?Q?JLrbzS5q2tjqCbiOfUZ0M3QHE23iwUOGDAihHa9qVQ086DsqWP7+xoBW81?=
 =?iso-8859-2?Q?fV7CfAPAGvfU9Oi8O43dmyQ6jzygdUK6pBAUVz3ofuzs/oHkqluhCBBfuP?=
 =?iso-8859-2?Q?mGZTJKLYWTofsjcIsl5t/xoi2Yppkm4xmFwN6SH3HVySAE+Pz9hNxs+Adw?=
 =?iso-8859-2?Q?4w9JOcVBq+DJO3ko9vI=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6d74c9-69d9-4880-b3a3-08dcb2209bce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 11:53:50.2338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7YQIA2qqenPV2u7x2Kb6ycIYe0f6Rb9gT5yNLakbUL1EjxZaL+LIBO+OxYb4r2W70pQE8dvzUsGgokUIsfw+cuXMCOEcB9miFscnXm/PsrM2ktrwOCOdNjnh6OMpyMf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 12/66] tests/xe_eudebug: Test open close events
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Introduce basic tests which validate client create/destroy events sent on=
 xe
> drm client open/close.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 49
> +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 44a491319..7ca0138a2 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -12,8 +12,16 @@
>   * Test category: functionality test
>   */
>=20
> -#include <xe_drm.h>
>  #include "igt.h"
> +#include "xe/xe_eudebug.h"
> +
> +static void run_basic_client(struct xe_eudebug_client *c) {
> +	int fd;
> +
> +	fd =3D xe_eudebug_client_open_driver(c);
> +	xe_eudebug_client_close_driver(c, fd); }
>=20
>  static int __debug_connect(int fd, int *debugfd, struct
> drm_xe_eudebug_connect *param)  { @@ -116,6 +124,39 @@ static void
> test_close(int fd)
>  	close(debug_fd1);
>  }
>=20
> +/**
> + * SUBTEST: basic-client
> + * Description:
> + *	Attach the debugger to process which opens and closes xe drm client.
> + *
> + * SUBTEST: multiple-sessions
> + * Description:
> + *	Simultaneously attach many debuggers to many processes.
> + *	Each process opens and closes xe drm client.
> + */
> +
> +static void test_basic_sessions(int fd, unsigned int flags, int count)
> +{
> +	struct xe_eudebug_session **s;
> +	int i;
> +
> +	s =3D calloc(count, sizeof(*s));
> +
> +	igt_assert(s);
> +
> +	for (i =3D 0; i < count; i++)
> +		s[i] =3D xe_eudebug_session_create(fd, run_basic_client, flags,
> NULL);
> +
> +	for (i =3D 0; i < count; i++)
> +		xe_eudebug_session_run(s[i]);
> +
> +	for (i =3D 0; i < count; i++)
> +		xe_eudebug_session_check(s[i], true, 0);
> +
> +	for (i =3D 0; i < count; i++)
> +		xe_eudebug_session_destroy(s[i]);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -130,6 +171,12 @@ igt_main
>  	igt_subtest("basic-close")
>  		test_close(fd);
>=20
> +	igt_subtest("basic-client")
> +		test_basic_sessions(fd, 0, 1);
> +
> +	igt_subtest("multiple-sessions")
> +		test_basic_sessions(fd, 0, 4);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> --
> 2.34.1

