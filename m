Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45554D148A0
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 05:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA15710E27B;
	Thu,  8 Jan 2026 05:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrg8U64r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3AF10E27B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 05:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767850274; x=1799386274;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EwooP/07VIexAZ0Hf313nN7b9dwwuOPlnBMdBVHWOWQ=;
 b=mrg8U64rba6MQSAjdUXtS94HW1VXDQOaU46I0zWtPkzWhU8EIbOt1nQe
 UOnDr+GQYMP0sMcqUmPQnL6zrS31m1HijIBYUc3kXswlP+5grrXDVX8aC
 TSPzhENRhUsMCMogO/h1Uq4GipaeiFadn7PSOW/56VIl1wrASjlUm8l8Q
 p7xRC9BhcajYcSqN00iyRYUqi7togws2zGEGHCFjG1Mf4x71AI11qU4h/
 dkD5S7biHv6/AiCz4MZDqWRTe7XtiFvrxSUPwuKDDFRjtC0D4Kzvqnaml
 CVZyBcmFVyUfV0KVWoNIBwklK+2ZjgJq6YPiEdeLxoAI9VQPk+TqGsFaN g==;
X-CSE-ConnectionGUID: tJFhd1FiS0SZPxXJbYyHVw==
X-CSE-MsgGUID: HUhiZCgBSUqxnQwgAfd4WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,5688"; a="79864805"
X-IronPort-AV: E=Sophos;i="6.16,1,1744095600"; 
   d="scan'208";a="79864805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:31:14 -0800
X-CSE-ConnectionGUID: LHXjzQLfR32dCGsbu8lmlA==
X-CSE-MsgGUID: euzy0ZruQjGLxoqDWMkFHw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:31:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:31:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 21:31:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:31:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2WetQ4gP4vc+JEGbZvfJCwibJPcODJ3XgAHKV2JWKyrTSXeCMwp/x1MlyrgpF91c3467KVefmzTGwsk3TruCKIHGH6BIYpeUL+nisAWPi3ljgLAneW4L+pVP04v/PPKtD8fzencelAkD0ys7rGMBzFIToQsTmk9tVhxQ/v4v//sNwcL0GL6tcyh50UvLNUe09wgBxM82iqmHa4UaH9UpdWSrZT32C68Wy5LllEhzXaqiVnjkzjR1ThHvoJO3NCUjBLK4Anz5pLm2ACmDUwtwGrrlsnFHzHSUQNQL22gRSIskL5fdCTS0GyWvsthlU6oWCBM5TXFaxaQ+AtAg8Ju+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44/mpf9nMtLUGlj0Z38fF1zNqLa/4+IZH3TMFUpxiQs=;
 b=Lxr0NyHRJPV+1il4Zhw5eIheyqfZSslTe+4UZYEtxRZGAHB6mEym6+McwWdIa5wUlcVGeXjLQJKVRSpqYoCtMsEADAkzdcone7zNjwBV0k+rBhWLfjFZvAU3JpFFhDhB4oPK9FxGxbFtlrxiylER10L8Biqf/UE+QPHTyokNkkLNmG/zA+K/BilflGy7HDmWPF8Sa/Lv12kxRgJXY3Pavp18dQmX7EFgBgzVT16lJ3MpmmgNN9YShplfnIS7RR52f03jk4bAWMGsvccKbRqAYGMR4F6cTZlrRkmL9OIvHdSUTyT9/xQu4o+NlIeIew92da2MKjDhp+B5n5j0+7vqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS0PR11MB7682.namprd11.prod.outlook.com
 (2603:10b6:8:dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:31:06 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:31:05 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 6/6] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Topic: [PATCH i-g-t v4 6/6] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Index: AQHcZDa9CnWkeVQA4Euhi+mw87/DhrVH9n1w
Date: Thu, 8 Jan 2026 05:31:05 +0000
Message-ID: <DM3PPF208195D8D3F564D514C1DA780D223E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-7-sowmiya.s@intel.com>
In-Reply-To: <20251203094307.3187669-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS0PR11MB7682:EE_
x-ms-office365-filtering-correlation-id: 3b06ca45-8d1b-4e63-8b8c-08de4e771ecb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?yOLsBtCu6GGnc/k6RAIh2lEQsXgH7jxzUsRahtqoVUmaewDajUdEQVeC2HHx?=
 =?us-ascii?Q?JjpoAt+RNRkf5m/g6ECkHRjhn7AMaUpWqr53WL3NIGkxD8CrK4KrYEvlVaDO?=
 =?us-ascii?Q?xzxrVvD5g7z58DNI3sZPbYsT87kGi/u84Uk9n95w/jUk7HRg6tqJrFBCyh9L?=
 =?us-ascii?Q?BY/HLhHkKAEh78yHQcDQcqbJI07xEhQOWuvGh3LYZlMUjlCXee7bqFHeTjPM?=
 =?us-ascii?Q?nQFrZSEYtiHUXmXGp0KICB/DFpY9gaVxtVHgkqQms8UoBOQOdLolH7k/xRV8?=
 =?us-ascii?Q?5pIg5Vkro2TxgvElatkwAsYWJ66p78ilZ0Ew3q51sl+nzKLCsfO+/1JTJKNL?=
 =?us-ascii?Q?2GxjywPLEXzE3Agjr2eP9ft96oy9LN8BpKJHdZP8MujHOxKzDBB+GylfO5ao?=
 =?us-ascii?Q?WqaVcpZKMyse9ONB13gwr0oe+ZS+8kxu1HRhBfIcFZeAV+oe68pY9GzGa9MZ?=
 =?us-ascii?Q?cF9d0BDK5uRbMdvubmoiOYmphWYvE/V4pVcJrVc2hqxfay42dR18o2wVtyup?=
 =?us-ascii?Q?Q183eGyA8v5DQuo92NFt7STDeYoH+MM0WqF5Tx9rwZQI4jyfz/n7odp7sAoa?=
 =?us-ascii?Q?XSX2KzBoGA7Ij7x2BMbZUcHjL7OIOWo3x9yhgt1scQMhExZfwxXPXYZDQpTN?=
 =?us-ascii?Q?tgi87Qnsf6O5zJuncCqFArwvPq+0X4c1G7jb32tYuNzUec/bHfjpScF2A6S2?=
 =?us-ascii?Q?DN2q2OaTMebFW09FnYV7Qqpl/ZLNU00zzlCcMGNYtiz26T2xgdMt5mDjanFX?=
 =?us-ascii?Q?qdDzOzUHEChV22ozPphqaJn2AgFTjIVbjJGKOfm2oi72zAJAssxc5ytmxQXA?=
 =?us-ascii?Q?eCbYMeY1zs+UnuMh5vtZ78fKFm1Buf5hJUpOf6wjCIwjA1Jl/S/m4V17wam2?=
 =?us-ascii?Q?vdDweNl99CzX74aUjgH/24uOEr6R3D4QGrU8Ui/YOycdvGoAq6ee0tj6WGDl?=
 =?us-ascii?Q?iYayghkNNeIPmHtqWUQMNzRaBkN3NlTkBv5yKEbX9Gk44SBzUnL/uTHHmcMg?=
 =?us-ascii?Q?QnMnlJ8aglucEmzrfedIP6YyNG0ayFV+24dOvsQUOBSW6fAplVMY9t9SWROZ?=
 =?us-ascii?Q?SJo8Y2YWYEpV/tyz8gakCfqLaY+gxYDPQ1VX0lt0IQ7P2JFhu3hhlKAKEk+m?=
 =?us-ascii?Q?PmyJk3NX/HZxc5ZELqosQVpxexUlp8GnmkybmFqk1Zf6IMa6uyuleIOSe1lJ?=
 =?us-ascii?Q?8sEdqY6EsIMjzkZDU2YxQzCSLEIsRoq4kkE/ml7SdRKVl9h5sjVaWJNFrLn4?=
 =?us-ascii?Q?CQIhhyOcCxYMpIkkQLgOMSB9USEbOFTlMzKagAlB0HhuWxeHxRYAL0II3k9X?=
 =?us-ascii?Q?WkuUiyD8CW2m/p1vVxh3HO6IOKLWQP8Jg2np/cDk8rozf1qjwvlLDNLClIxd?=
 =?us-ascii?Q?2HxfHiSNCCvsym15ydNK+R8YmK6SlRbpVwaZVOMzHc3FhaoWbE2qKdkCnSLF?=
 =?us-ascii?Q?kREWpXl4Ri4FozBtCnbQRHDGKTicGY23sNml7spThEPxc2gvUDxQTGgH+gQQ?=
 =?us-ascii?Q?x1hqnFasuoSG+yDNtm3kD+P0wAU5v1dhI6H+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qj8vpY9aLS3yS+rfveRGJuHAeSfpt6fgVGOtPpazyWKzEqq65pIUGB3MCy5h?=
 =?us-ascii?Q?eaLrdwIrezPAGtEPwXnXTQEOTrCw8LpaP5cO0vF9aYTu6o43Eh88MgYByfQ+?=
 =?us-ascii?Q?NSoqUJZDyTTViSeylAluCgzjEKucOVqhWaQtcNzB9cK64D8O3DHLWQ9dRI+3?=
 =?us-ascii?Q?qBVX0Is3YIKH7ZxAruYGaABBfvXq/TtgOtf9LzU6cE4Am4bdv3TL5N6PYeXl?=
 =?us-ascii?Q?YTbZtLV5Q3qaZQxQoUDl0Qlyv/LKikyB68CqtGGs7EDJ4k9H6Va1v538YGZH?=
 =?us-ascii?Q?qt2In4TOOQosTcftZNaEHQG2UBDKswGl7EvWLmJtlkagvpyBpWoIKY/p5k/X?=
 =?us-ascii?Q?6PMrgOhBExtVrBcYQqvfv0ggHU8nMt374nBYdrJ/GoSLOG9tZDxuh9r4zevF?=
 =?us-ascii?Q?+lQbP26wm9hvhd2JhUF8/6LOFmsJvgl4mwCZ66w1kGnheZqcB4KDC2gR4WgH?=
 =?us-ascii?Q?lwgJYdLlftEwXCHaxhq3LtJIDKjvVVC7n972SiNmD/au/WKdqXpN2GvdgiZY?=
 =?us-ascii?Q?zvlWe+/cm/MB9BlnsqWK0/2sv7zNkd8OqfyJ4iqH1OoVkJahJKdgXiurEoJz?=
 =?us-ascii?Q?cT0ZUd+eb4GiCWZL3eTihLbCfTI/TivdTqIZ7xWMxijacot80e+uTC5eZB4m?=
 =?us-ascii?Q?+O21wQR42ZPbSKrEgTcj6wlMnRqMRCiNQN+4zm2hFOtJTVqQ/oNyStu5siqI?=
 =?us-ascii?Q?2bDIG6UapVky1/xeqwo8ThhJxxCinybeXGYQAELEnKDPncdqBWbqlhHTq/0k?=
 =?us-ascii?Q?2MQUrk9nQzMdv+IOuMUel2/XDg2DmriZVAYQUnjhamLPzJJAob5rqRTKt6Qp?=
 =?us-ascii?Q?vVQbUpLDn5AxzrTS9VPIf+cBnwIYqPQF06HdexdPpdXsJLZUKC4pIrRYK1Wx?=
 =?us-ascii?Q?Fr7ZOUgKpD2G/rUUbBYzvx1EbyuJUTtJFGl8v7K44VK8Og/Kli7F+AmrFSef?=
 =?us-ascii?Q?y7G78ATQmh8XoisH2ZFGGW9nSE2nIyR8wdW8AWUTEwvOBVdMM5umjREKq2rx?=
 =?us-ascii?Q?/BuZiK/tl2UeJyGULGJOyJ9+W2doAPxiGtSz6RoW/UM8oZXc7yy+dC8S48t4?=
 =?us-ascii?Q?b6Gf0ZlaT+E4TxYSpdNGctmI9oAyKPyGr1YUBben9onBwjYbZ2jXu9csHf7p?=
 =?us-ascii?Q?g82zA1EA9ZFJcyEhLQgo+T8cPykrYZeotGW9ZtUJStNDlU5M8HPZzN2x3uzg?=
 =?us-ascii?Q?8UUHy24yKPe7H+dYn5fr7+AE0vAc5LCr0yNxrJPlJbXokMRtnLWX62hsPtO1?=
 =?us-ascii?Q?DagbJkyBsXZ9ytPAcHWnEO5+312HU5DzKGakYjNqTJAHJrENiCqMHrratxEA?=
 =?us-ascii?Q?ci5zabznZsFLhD6s8FCB5FAP8moqTZTwf+QQA5B57bIjeE+9/SoY5AcWUZcB?=
 =?us-ascii?Q?E1yj212dxuEdP6k68gFkZLB/4x3Q9/R9/sCMhDvDf6pyO5oKk8QArP1E8W2U?=
 =?us-ascii?Q?3uhjdSrCsedkwPp1o+k9S8MsikO/w+T6LqzMLFMY25jCZOk2karJsKSW8d4P?=
 =?us-ascii?Q?z1USzi3Mmt+Vco6W9M+gN2o7z1Ay0ytG+xhYa+bG6aWlBcfHDh3vu0NMSyT7?=
 =?us-ascii?Q?2aIeR0+nWOeqmyu116EBNXgmLnQgZVbzgsAFop71PqmgoXBTN4s/uZj1zTY0?=
 =?us-ascii?Q?c0dWSdgVi3qDWIuSrPR/9GfWCIAUuUR4U9sp98RLayjCrYuI2DzhtrANWcGh?=
 =?us-ascii?Q?PFadJQHwG4HZu4nva51V7ttXLmhRqOBGQI/uLdmr8xKgvHwL+3lyYPQ6Sv0b?=
 =?us-ascii?Q?P0V9SAcwOg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b06ca45-8d1b-4e63-8b8c-08de4e771ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 05:31:05.7630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7bIvNgTlhwdSh7bTbmiEBikoSCzZz3e7iVqvCNDHFHdycPgDp2uJte2TwCtbUVTqbzo6erWWDqYx0N/CLSPB/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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

> Subject: [PATCH i-g-t v4 6/6] tests/kms_writeback: Refactor writeback-che=
ck-
> output subtest
>=20
> Remove individual tests for each format for the test writeback-check-outp=
ut
> and introduce dynamic subtest generation based on the formats
> supported.Framebuffer creation was now part of the subtest level based on
> the format and removed from fixture.
>=20
> v4: create testcase for BGR8888 format only for intel
>     platforms.

Also I see the version info only for v4 what changes took place in v1, v2, =
v3

Regards,
Suraj Kandpal

> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 69 +++++++++++++------------------------------
>  1 file changed, 21 insertions(+), 48 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> d54d649b2..cc5a8ac32 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -45,9 +45,6 @@
>  #include "sw_sync.h"
>=20
>  /**
> - * SUBTEST: writeback-check-output-XRGB2101010
> - * Description: Check XRGB2101010 writeback output with CRC validation
> - *
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *

Fix the documentation

> @@ -595,7 +592,7 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	igt_display_t display;
>  	igt_output_t *output;
>  	igt_plane_t *plane;
> -	igt_fb_t input_fb, input_fb_10bit;
> +	igt_fb_t input_fb, in_fb;
>  	drmModeModeInfo mode;
>  	unsigned int fb_id;
>  	int ret;
> @@ -636,15 +633,6 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  				      &input_fb);
>  		igt_assert(fb_id >=3D 0);
>=20
> -		if (data.supported_colors & XRGB2101010) {
> -			fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> -					      mode.vdisplay,
> -					      DRM_FORMAT_XRGB2101010,
> -					      DRM_FORMAT_MOD_LINEAR,
> -					      &input_fb_10bit);
> -			igt_assert(fb_id >=3D 0);
> -		}
> -
>  		igt_plane_set_fb(plane, &input_fb);
>=20
>  		if (data.list_modes)
> @@ -709,7 +697,6 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  				if (!strstr(igt_format_str(test_format), "BGR"))
>  					continue;
>  			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> -				igt_fb_t in_fb;
>  				igt_fb_t output_fb;
>=20
>  				igt_skip_on(data.dump_check ||
> data.list_modes); @@ -718,53 +705,39 @@ igt_main_args("b:c:f:dl",
> long_options, help_str, opt_handler, NULL)
>  					      igt_format_str(test_format));
>  				create_fbs(&display, &in_fb, &output_fb,
> test_format, &mode);
>  				writeback_fb_id(output, &in_fb, &output_fb);
> -				igt_remove_fb(display.drm_fd, &in_fb);
>  				igt_remove_fb(display.drm_fd, &output_fb);
>  			}
>  		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> -	igt_subtest("writeback-check-output") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_check_output(output, plane, &input_fb,
> &output_fb, DRM_FORMAT_XRGB8888);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Check XRGB2101010 writeback output with CRC
> validation");
> -	igt_subtest("writeback-check-output-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> +	igt_subtest_with_dynamic_f("writeback-check-output") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
>=20
> -		writeback_check_output(output, plane, &input_fb_10bit,
> &output_fb, DRM_FORMAT_XRGB2101010);
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format),
> "BGR8888"))
> +					continue;
> +			igt_dynamic_f("writeback-check-output-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				create_fbs(&display, &in_fb, &output_fb,
> test_format, &mode);
> +				igt_plane_set_fb(plane, &in_fb);
> +				writeback_check_output(output, plane,
> &in_fb,
> +						       &output_fb, test_format);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_fixture {
>  		cleanup_writeback(&display, output);
>  		igt_remove_fb(display.drm_fd, &input_fb);
> -
> -		if (data.supported_colors & XRGB2101010)
> -			igt_remove_fb(display.drm_fd, &input_fb_10bit);
> -
> +		igt_remove_fb(display.drm_fd, &in_fb);
>  		igt_display_fini(&display);
>  		drm_close_driver(display.drm_fd);
>  	}
> --
> 2.43.0

