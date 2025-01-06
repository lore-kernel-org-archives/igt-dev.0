Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427DFE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 04:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25CB10E56D;
	Mon,  6 Jan 2025 04:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BF6WO0wa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C078F10E56D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 04:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736137087; x=1767673087;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kxcTwr5yndQJ0qex8G7TXWWyvnELZ3AxQvjT9wuMzBM=;
 b=BF6WO0waf2yu4xKR/6zp7W7Xj1zd65/Mp3iFYX2wTpd/qvoxWlk+EY98
 scxhFGXMEw/Z9tAL5Yn5pmOAzit/X26kB/tkiCbGstZPqnAXULx5nE9pe
 GhpHptNQ9+SwNnifNviQap6i56MvHX1cMy/YRVotBwAre8yQeY9HyTgo1
 qkFxwyVEGHZIB/gePvI9lfPdgAuKlUvQm1zJWrdYlx4+yl8OwRAT0dxPl
 KhMB1i+753yUCWtBnmJ8w1hzeaOugVoOudAD8hMbCTI/fgW9OUbZvHBmG
 ypn/HLHphDL1qeJgYmCMDD+zgW/ar7tVgyM3ZlG9dK6XrBM6wI8UMkMs4 w==;
X-CSE-ConnectionGUID: cQeDEI10Rc6oN7ye5ZHkMQ==
X-CSE-MsgGUID: 7OgoP2xHTCixKQzy+esIsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40215621"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="40215621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 20:18:06 -0800
X-CSE-ConnectionGUID: i1kJvXMFQpCJsaNVL8ra6Q==
X-CSE-MsgGUID: En6+X15MTXKguj9zUsb+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="102817861"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2025 20:18:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 5 Jan 2025 20:18:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 5 Jan 2025 20:18:05 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 5 Jan 2025 20:17:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRUNkdB6xMzWGhmJe7oSYQVKNa7H7S6G1g5mSgoFLNvL50pYpYxtEYEv752DaCZdg5sYXnQzl6Cszpjn+HzA4D6+9J2/bwf5XYIXE15zw9cuDsY838gI7REYxEsFlWlCGXPonC2X193BSftITYRh7jHuGADXbpLBvWlNx3VWS20kFQoahVVRws6Ndin2QVRLavcE8omz0PtzzXFUd8o1AjNmdHOASX4krlr77VxLyCDg/pc9OY0Fr3Kyc+wCCBlkyFBrmpZlYiN7mwpCVnY14WY6TAZLyTaRJShgmnoJVnXIjrd4KWRIcVwN7i8mr8bYigiCu91EC40I1PEb9Kqn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q9UzUxhWz7QzpTM0ghPv/yRCR0vjhnEYgCEcxZelng=;
 b=SOibBNnEmlB3uqn3EZwlfhQj5nmK26csq8duYdirmhW+g5AInDXdSIgun9a4ZFBPGPMRU3Uvl18jeewC++iGbWzesMx4k5v0tYbJhbUGRnsiYrWWvoGIGJ9KOhnW4rr3b0Yu9cQJdvSTDtlPmSlqcSdPchgj11kYa+9/0G+XecYMvVtS6RhMCk6kbbUKWwgCqRLI+H2IWwm/+P/MJ+ls8W9xBFEx/yxgDxusb/Hwl5JHuzBd1dtxiDofU4Am1NP1YYaSaRYyL7mqcjkS7PFxawluq1tOOQegjaWykixs1PaRUbVKuF33PzSkydPq6DFoW21WjfPNY8o4VdIjLF1gXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 04:17:43 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 04:17:43 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
Thread-Topic: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
Thread-Index: AQHbX+6cpHVL0hSuGEGzq1nStjDcVLMJIxDQgAAA01A=
Date: Mon, 6 Jan 2025 04:17:43 +0000
Message-ID: <DM4PR11MB63122BF0F292EB8A69CFDFA190102@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250106035903.22776-1-pranay.samala@intel.com>
 <DM4PR11MB631214C2C60F240EC6DCEA8190102@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB631214C2C60F240EC6DCEA8190102@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB6701:EE_
x-ms-office365-filtering-correlation-id: 003269c0-6969-43ff-3a60-08dd2e091104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|7055299003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6nLglm9OMKwALKo1JoDXZ9Czfz3RxMH3FpbClu50qorDiCdQ5ueUHXBRlAaF?=
 =?us-ascii?Q?ATfJnHuTqZc9yxfyGVuHzaV2KkU1UQREbhbwuveOtuBlHSAzfbtjy7D51Lks?=
 =?us-ascii?Q?TeW3aiCMkZKe4u/2wl/A+De2jWq7frcu9S7RZmc3LhxUW0XJQILuNl7djGcO?=
 =?us-ascii?Q?0QEf4d/mQAzTLVv8mhKirwC1lUguYWDRK7pp32oHHqVP5q1M0VU6Is4zg6aD?=
 =?us-ascii?Q?cBNuZz4ieglREdVNpvQsl6SyYCiFe9QpKN3JvpsO4aQo+FV3z617EyLhDtDU?=
 =?us-ascii?Q?deYbJEnvfnwrH1OfV9Jzq5XFYgu+q2SwJkEfD5UyIVUcMHYcQTt19dvAmKKT?=
 =?us-ascii?Q?YKMl9MM8b5GraDecaY1V0VtXqoChM1qSLfJoDByjm49VYniaFX2tl/HcdYDY?=
 =?us-ascii?Q?WOADNeS2qU2IcKfKSY79mvvCI02OsyFHQiuvZRmK2UZMhq5ecx5+N4QtrQFb?=
 =?us-ascii?Q?nTyokNoux843H4ygmUMOI2lsods6QQ2VwGt/szGOa25PSHctPuB4OWe/ZQAn?=
 =?us-ascii?Q?NKloWHb5i28b7bWYXIt8Jn8WM9vgytEyJl4D4+NzTNB367sKZ4TSEg6II+rQ?=
 =?us-ascii?Q?YHZ1Sh2SHRanPaHmZmioKfflwUCRy59ZHXQplem3uOhGdbJRifjf7AgzmCbt?=
 =?us-ascii?Q?30PlEB7Ulpy839csE+53hyfMUME71Uvr4oo8XFihQCAp1kyx45jENOPfaN2L?=
 =?us-ascii?Q?ERoxlIWafKam+OD3Ko+s+/xS4BfLPIlmPAlImY09tgDEHSHdKRvOqZB0bzJ4?=
 =?us-ascii?Q?fMgDah8QNMlBcWVPnpTCe07fFQ/HJTtsHK+zvKURtNWa49z8Vgi3R0ksK5fW?=
 =?us-ascii?Q?6JNTyd2rORSGIALL9h/N/rReM2e/NzaGD48CnOtAu3HEP/St1wg2vPeadBzN?=
 =?us-ascii?Q?ggtoLhRvpVgH4AdUaLKzw/Shd/8cGtg3vsNm+m1+iYLm92sl2yiBrJuOs84R?=
 =?us-ascii?Q?6SB6D/KKkIri7XNdD2B8dk5KMkfbNqdX5eVEs9t/p+KoN/bhHElPe+YZh3SL?=
 =?us-ascii?Q?MQqGL5QtGctFdWQGVP08gQNvjbVwwRBq0ZTirNV/xWliveN9GN0+qJzAl4Ai?=
 =?us-ascii?Q?mQJuhm/q5PYSwmJxd4OjuZHtZCdSX8blerovSrstOPOwIRqU1yioUreu1fXY?=
 =?us-ascii?Q?GT3HYQcmXExO4kBBiPbicg9HxqECo69olTQQ7FthEqppxYjAHulUXAXWS/Xo?=
 =?us-ascii?Q?K/WRwFD2u+r1ylHQXcveTsY9F8PJKTpsCuPGHwcGX3ZtR1MEQhf/+fQgEe0I?=
 =?us-ascii?Q?jz1OvqNNUgAdG2hxHEU45+wKrvDb3XFqmPxH98jYmbRM6uCZtrPDyISr/Vij?=
 =?us-ascii?Q?Oxpmxc+j8jObb3eA3n9up9jmJkhYGTX54tlb4CaIRYMIDpSJiaE2vEoaSuP8?=
 =?us-ascii?Q?8uRU2cquQlpoghlKGo0lkzqAMtcsr5WalDIetVrZJzBnLttM9uxPy1bCnujr?=
 =?us-ascii?Q?UHuv7SjmQHmLy3Ul+wg3ATkMC9vWXgNBe4bk9KqggYd8LGeDoI/gBQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(7055299003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mb1/otoqIKIDxoAjN8vdYEC06CNtznw9W72/4E+Js2cYmTvmaV1kMNXdnNLx?=
 =?us-ascii?Q?Wo62ScYEwc++YVu8zpBZYHUPE/Yze8DOTthIT78c/e7yThXMX+VcfPrdmST7?=
 =?us-ascii?Q?q4EAjW05Y80Sc8xaJWrRZR4g3SmKXpDhNMVApugl2EFjQ4A9BQ1L/YgvArC2?=
 =?us-ascii?Q?DclsXmq+QW/4l6QTiLIa9BqjbQ0TOtmKrBomPTjuu0KP6VVXBslQqB1cE0xn?=
 =?us-ascii?Q?/PRliyIAyCboXlO957wgwmvFh7VRduzE0clAFRU8jLHmGjlVtt3wMTGeEzgI?=
 =?us-ascii?Q?o2JsdtW46qhAa0qXQSfzjqrx5eIRqqD6/CDBM1eSw4UWPpYKjMtpLwWql4vO?=
 =?us-ascii?Q?y40YmSbSuP5MesiRkjpKUgEoZ1k+Pvm/KDNHMP8zeRlPw3F53DQkCJqrFpJ9?=
 =?us-ascii?Q?N4Ov3hEBG0bvOV2G81GEUAEOTXADhtJDxi1Kg8+GrodIWWssHAM9+93GSKgt?=
 =?us-ascii?Q?ZKFSeUfnlr8RZpOJYQ9NjNbe2JaF2+zEz9hK4ZSMo0Ymvpc4aFRVEJwTrdr3?=
 =?us-ascii?Q?sPiMnVgqI+jqJzhXDcfWZMW6aal+DaoPx/coPhlWsyGsx62xrI5+5BYw6CSk?=
 =?us-ascii?Q?T/nOo2rMlGicyHyX0VloQaI1UAowb7B6CQadyuQ3JaIXDjabmc9BEwjPLerB?=
 =?us-ascii?Q?9IqBejSDUCufCv24u78IGvrBxCK4LBI6pcyFk0j9f2eFuA4nyX1t9erRtdne?=
 =?us-ascii?Q?heEC0DfufWTvvwOQcYGh0O2YUS5TYu03nOSgwf1BBirOUyyXBX2cTTe7OFAH?=
 =?us-ascii?Q?VdPKIoFSUE+65IvZNBMMzWBXNirHgYhRQL1216Gbk+2CGDnrobvsic/oAbyl?=
 =?us-ascii?Q?O2ch9Nk0nP2FWm3JFasggSGrFu39Mq0wJbQTVwTPy3juWwBHWQ2FjZ3GRKzd?=
 =?us-ascii?Q?qq3mc/XcCErzKXpNCIOWkIzSULkNeqIhKC+FwIsuKpLRPgbniqFLI6lp5SDQ?=
 =?us-ascii?Q?+0mJXZh3DfF3vH5MS5c+7OknBDUcJdAUJvwdIo9aNMhJCcu4xGhh/dEUTXhq?=
 =?us-ascii?Q?UXY3PUI8F2Wy3IlbI8Svp/Yud6JPh8SEP4x8ZERJWTcWqL0wX51J5MCs7YkZ?=
 =?us-ascii?Q?cbVVMhh+FOBprt5qdURqvRa4NAdngLtj9HAEABXi4vKMGrdKT729qsZtnZtf?=
 =?us-ascii?Q?ZNxNocWmFwwxIaz5DbBcfpE6kYVPL7Am3zD+nkOdUUrhlKfXFR/xakW9C3H/?=
 =?us-ascii?Q?dVaeWIW5IwWketCbWm21eTTZ4OA/BqGVWjXyY+6Frfd1Zsx/JKj0cRuNXxHP?=
 =?us-ascii?Q?RcFMFs+mH1Ny7Z7VZZ6dzq7fgDOOrKWvYeUObD9nziYwxIKiNZ6fkZDZFcuI?=
 =?us-ascii?Q?glL1Xeg1t1j0s6D2tXlar34X7j1hTULp8EgkSN01anPWgo+XSFPvxHVMNndU?=
 =?us-ascii?Q?iy1JnW5msfgSI9xRgUVxEYe8U2xCEynr0Te3QoOhSSDvdW/096Qw0UYaOD5y?=
 =?us-ascii?Q?oB/8LBY7Dq4tDSA1imOWVm1IHnywCOVGAxCJoFCXchxjwM/38OXEGYwZVfej?=
 =?us-ascii?Q?yby1x/72IDht9lXjmssbpljrrUEmYwUgNn4r1RPoo7/UFhNtmcK9pBDrjGWu?=
 =?us-ascii?Q?5CyaQPf8bvgkEJiRSio=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003269c0-6969-43ff-3a60-08dd2e091104
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 04:17:43.1243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duZOlcpMKhy4kj8qwJymjQWziG8OrPgUKaKR9/L1TkcMWkMjB1+vi3k3+P7D+4GrgY5WDNYrMs1cHofNDkMpFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
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
> From: B, Jeevan
> Sent: Monday, January 6, 2025 9:46 AM
> To: Samala, Pranay <pranay.samala@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: B S, Karthik <Karthik.B.S@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>
> Subject: RE: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
>=20
> LGTM.
>=20
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
>=20
> > -----Original Message-----
> > From: Samala, Pranay <pranay.samala@intel.com>
> > Sent: Monday, January 6, 2025 9:29 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan
> > <jeevan.b@intel.com>; Lattannavar, Sameer
> > <sameer.lattannavar@intel.com>; Samala, Pranay
> > <pranay.samala@intel.com>
> > Subject: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
> >
> > Having some logs for test failures & skips would make debugging much
> easier.
Add v2: changes before merging !!=20
> >
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > ---
> >  tests/intel/kms_dirtyfb.c | 37 ++++++++++++++++++++++++++++---------
> >  1 file changed, 28 insertions(+), 9 deletions(-)
> >
> > diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> > index
> > 35df9be3b..4cbd1a2f9 100644
> > --- a/tests/intel/kms_dirtyfb.c
> > +++ b/tests/intel/kms_dirtyfb.c
> > @@ -102,21 +102,40 @@ static bool check_support(data_t *data)
> >  	case FEATURE_NONE:
> >  		return true;
> >  	case FEATURE_FBC:
> > -		if (!intel_fbc_supported_on_chipset(data->drm_fd, data-
> > >pipe))
> > +		if (!intel_fbc_supported_on_chipset(data->drm_fd, data-
> > >pipe)) {
> > +			igt_info("FBC is not supported on this chipset\n");
> >  			return false;
> > +		}
> > +
> > +		if (!intel_fbc_plane_size_supported(data->drm_fd,
> > +						    data->mode->hdisplay,
> > +						    data->mode->vdisplay)) {
> > +			igt_info("Plane size not supported as per FBC size
> > restrictions\n");
> > +			return false;
> > +		}
> > +		return true;
> >
> > -		return intel_fbc_plane_size_supported(data->drm_fd,
> > -						      data->mode->hdisplay,
> > -						      data->mode->vdisplay);
> >  	case FEATURE_PSR:
> >  		if (data->output->config.connector->connector_type !=3D
> > -		    DRM_MODE_CONNECTOR_eDP)
> > +		    DRM_MODE_CONNECTOR_eDP) {
> > +			igt_info("Output is not an eDP\n");
> > +			return false;
> > +		}
> > +		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> > +				      PSR_MODE_1, NULL)) {
> > +			igt_info("Output doesn't support PSR\n");
> >  			return false;
> > -		return psr_sink_support(data->drm_fd, data->debugfs_fd,
> > -					PSR_MODE_1, NULL);
> > +		}
> > +		return true;
> > +
> >  	case FEATURE_DRRS:
> > -		return intel_is_drrs_supported(data->drm_fd, data->pipe) &&
> > -			intel_output_has_drrs(data->drm_fd, data->output);
> > +		if (!(intel_is_drrs_supported(data->drm_fd, data->pipe) &&
> > +		      intel_output_has_drrs(data->drm_fd, data->output))) {
> > +			igt_info("Output doesn't support DRRS\n");
> > +			return false;
> > +		}
> > +		return true;
> > +
> >  	case FEATURE_DEFAULT:
> >  		return true;
> >  	default:
> > --
> > 2.34.1

