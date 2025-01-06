Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F5FE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 22:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B52510E0E8;
	Mon,  6 Jan 2025 22:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8uRoHwV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEEC10E0E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736204350; x=1767740350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WkjfarHuEiRn0r6DTGQBgdkRtNOurHHFnNb4CQTWRe0=;
 b=E8uRoHwVkcAsNWjnrNiQxLz7Juh5W5vYTXnO1SUMfKz1/ldXF8CT7WmG
 51rlC9L2ZsZOyfDrZgFzg0apiXX/HKPAFfHAl0LUzEjJfpSQ8S38fDP3z
 YLjybVfMmx66jdfHCFKcvf+xv2x3897lWj6u1LpoDiS0OKydEaE2YPslZ
 haUFl7JIzMLYOUiq5IfkMkuHgxBsEMEfrlmhlH6GxzaCseb/9YSh6md0P
 u3SfPB2FSPJsiSOA82aG0WPmVnBGrVzMyBfbqWvg/rvIJbKrhiJbFEk3V
 akp6LjKeLThh+8fZv9bv9tQkekJluBPF6ozalgEqLtKU5C5JvMgHyiUT1 g==;
X-CSE-ConnectionGUID: eF/ym6ZiQvSmu2fbyde9yA==
X-CSE-MsgGUID: yJT80kVQRz2yoAvBwVE5MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36383179"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36383179"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 14:58:45 -0800
X-CSE-ConnectionGUID: Sj8j1CEaQpewuJlSwtBQqQ==
X-CSE-MsgGUID: sdaw8cdCTF+yLYraYC83Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107535788"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 14:58:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 14:58:43 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcL/fK0Tf5eMP8X2cPKC7lOlq3P8W+O2aabwzOfbao6HViFM2I665iTkNH9ePNyZu59VdcuuwzSQO/1WgnCfsgiH5WnrncdtqYeL1NXky9gbr0h5J5OT8q3Qyv1SB0oZY+tfo6zrzB7E2nSKmNychwCGs3wtDGGOk0rQoJDxs5lMUn2hMF1sGtojXZWcwbB8zYYS7NY5zgqSmi+2Nti/0cSUHUOr1CdkpW9zDft7HfetaNcI5VECoxmRFGjvpQl15SS755ReuPV3M6K9VLqWrqo5FVOOHkTw323UP653msMZCaD2jxjZiG1s83hzm4laks3qPnmBpjec3HElA02EfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV0XPp5nGt8Hr5u/mIrg/DkxqjT9nP+Ww2Ju1TvUhqc=;
 b=IFDIXOs4prUtr1RBKKgpPfeTwrayXE7NoY+zTdh4OOw9aTZRTTlhqWwGUZZFpIAp3TH1+7/8S1u9FqqSniOIRgwnEVfSRa2r50wtlTq/h3wQXup7sVx6BCkakBVjEz8luYcwQNNGMdOYk624q1zcuvoezwbuaJRcQFEuLkjMvn1LP6lQpk6RW05bvybPmqV9bmRwzK1ZRkYnjR54UXeTvMkqXYuhjkRpemjfyOtAnUaW/tmQp6kODBhfLZP4PpIHu62EffHchpY7gpLFtsv3FiQTNrzCL5gUqYvt3Vr+EdLeC5S21PksKw+7YnPED1rMpSI5yTKmNFmJgqVVLz/tnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 22:58:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 22:58:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 8/8] tests/intel/xe_drm_fdinfo: Stop asserting on
 usage percentage
Thread-Topic: [PATCH i-g-t 8/8] tests/intel/xe_drm_fdinfo: Stop asserting on
 usage percentage
Thread-Index: AQHbXnllwQdOlzoXN0mzgOp8aaFBirMKWVDA
Date: Mon, 6 Jan 2025 22:58:34 +0000
Message-ID: <CH0PR11MB54446EFE4FE2FA4E88C65025E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-8-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-8-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: 7122dd14-9429-4657-bd20-08dd2ea5a5f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8MYDWRnckytyDIwJDRANOdSS2lZkY+ya38rQOo8Itamh7kJGWCf7InpCmZ8A?=
 =?us-ascii?Q?KMrR4PoiCOIW8vvs8XH7vgzDagK7w9R5NUNf0TvC2iiqgjpfx0+fgABhSMxd?=
 =?us-ascii?Q?f9zHXntyI/xHcKWO6XypbBVaGNJ+TnSgpiV15/fccw3aLR3IyljsWOillZry?=
 =?us-ascii?Q?pKGD3VGgWi4vAVX8ifVryzz2iJXRTIFX+9laP09K8zarVvGz0UG3M28NrHIb?=
 =?us-ascii?Q?NnetwB8Y+MSoWG8NBldsQ1GmeIsDR+2IFrjBkM8U0Twi+7XFFXHJrpBogz11?=
 =?us-ascii?Q?ffROBP34Fy6NS1TDo2T5rPqjmG5irAavrUdp/Bl2N51OOvFkBeBljpTISCAh?=
 =?us-ascii?Q?DT/9sLB+tQj/WlkMCgf/72SQ2P+H5Vz6h6nod1RgEMols9lTKFDZ3ApLQ3mT?=
 =?us-ascii?Q?scFJ7PFbOuDU3LL3YE6Pgcg44JGK03y0IPa9M+tGsSUUVhaV3Zt5wnz+YuEv?=
 =?us-ascii?Q?6Yb9n+59hUaNjK0S9oF2ciTqFN23ksz269QxkTy/aq+ZlSFPG2ARkDRWtI9U?=
 =?us-ascii?Q?6u+8uPFLaN1flPqkORn8xnwapQmiqBiDPkl1xFUqZ0Mu2imIVh6EQ7IGPpcl?=
 =?us-ascii?Q?Mt7wpq2Y0Q/1m6SuFtSiYsUA/4sO2If73VHUmgJqmgFIHInE/0nAv27UXEus?=
 =?us-ascii?Q?TJr/NnaJuZl72Vn//Bbn3+Z0WzgCkdz69X9awfmBqZKRq0jeISJtaWPUyY+R?=
 =?us-ascii?Q?p0ML2fDcQ3gBBvE0CXNnSn4qxcQcD1bd8xeg23b1U72k/O+aqX33R66/5MOu?=
 =?us-ascii?Q?25UIpZhOP3u4saFl9EEWaKk1j5K8pPdAxL/+5Bo5MAFUectJxguPQUxGf5NL?=
 =?us-ascii?Q?GmgxVuAcKtpXlpfGB74rKbxurU+Z5Z1CBwlblZAaeuAkI6IjjG/sID5ys6He?=
 =?us-ascii?Q?ouKCLkim078hkG+yQFZa6SzO06/eLBgbnKCJTZ5peVN6WJWFaW1wgvVB0jIc?=
 =?us-ascii?Q?U1Y6Q09+385A3plS7nK4WROjlN6ALYCY5zf2HNOCfW/0B0IhLzXDemZPn8XL?=
 =?us-ascii?Q?mCZbNlMl0JlebOU/FLslT1CPmcr3P9lJXy/POQCfbNyFBUZRgvaO1nB/y4Ou?=
 =?us-ascii?Q?yAivxV3lD6xsBZCxtPDJq5WYvkfjOWgmThoLBddlgwMD8x9vYIjndZEbIWzc?=
 =?us-ascii?Q?sP1XKvVe9RLn+PejdcowtU7xUvpdfAAKKYKfhdZMq5EsgIyI4pbREpdNpkwE?=
 =?us-ascii?Q?5+rBnHU1V9yAx0yriFTN9uLyUjzd/h0BgggV60iowKU1swDKcJaVraMO0BxC?=
 =?us-ascii?Q?YQAtki5amRbUXTSLig0l5FPWZ5t71BqLC2u1EvMFLrC7IaHAYrD3yXdhhyTO?=
 =?us-ascii?Q?sZC/RC2cH8qHgV5c7OwXCUuP+JsHVYGC5II9xyu8n0n53ZCHWBxJSk+y2uta?=
 =?us-ascii?Q?G2BenPSvAcpMPTrf20sp3z4Hv7xp8CKFH5m6tDCJ3mVfD+d5A9KlCtjWEItj?=
 =?us-ascii?Q?1sC4Lt6erj7T5o0zpHwVhIMlw+D1Uv4V?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?21jAzT/CNvB8VXpFxYU5x+7iSXFx05jI2h1GsSrbtzciiLw6xfrZJR5RRde7?=
 =?us-ascii?Q?gsv/vWk1QuvuM52tjEsVlaF77M4xS1MlrpCUAQY8OKn8+hyDIK6o16g48/JC?=
 =?us-ascii?Q?0v7DXEHhbcZW7apZ57PTgB9lCB33wdZK89v6wKesbkH26v3pwEyFJujVFvKt?=
 =?us-ascii?Q?QHG/TKTbadASx+KQeGqgs6LYJN02Zxb/jR61KA4bFbNm48tocc8U/uL3QAbt?=
 =?us-ascii?Q?k43w/b4LC3dyIIVD/8Z3yhLQg7B5ax+uK19Ao2Zxkm2+8vt72FVdwYqLKxDK?=
 =?us-ascii?Q?2vBgM2nvwxhG9mgmBN+zZBAIyIdPBPtoSJoJjPXMQWkZT4FJw2jioVDc5Tem?=
 =?us-ascii?Q?rX0Bn0o60cB+Fe2MBlwceJcDVS0hh0cyDQo4o/dLItV2ECm/c7u8jeK4FgZc?=
 =?us-ascii?Q?Pbxu+a6k33T4QE8X++IXK0MeivD+wlftbCBu+IaDFKFilzMHp5QQM4sy/irj?=
 =?us-ascii?Q?Nn3KhC8PBFnWy13QF1nfDFuG+8nW2BGlb/jHdnpGzTCXa8vDGD656vFQ75yT?=
 =?us-ascii?Q?EZRQEBiSMQsKAnZfE39f/nKj3On7XPZxy0E8qKDBJrUuglNmk9tP2SG/q4GH?=
 =?us-ascii?Q?+jOyos6yxnQWtw5KmSuNQfSITSd1TLtXUdmOa+yBcQaVrNXbzFdqNlUimlSL?=
 =?us-ascii?Q?kATwdIysJ3fqQ3QC7cJ8batuTO/xMXia/JHj52K/4pSrEXLF8RhGd8mGZ6+2?=
 =?us-ascii?Q?iActZjrfNTKSi6CfGrNS9jvr7eV0N856yAEEY23AQoEcsszQwgBMVZHmuGI+?=
 =?us-ascii?Q?zQKvqdk+F/7As7bXLTQOtCf1us1WuGTXH+lVsJU723ps6qH1U0e5hogN4ryH?=
 =?us-ascii?Q?kZzkN3SjWHty+Et7PcUf7xr+rTDz9G9r+nJcaceSTTDqnLsBP6Cbn4/jboyB?=
 =?us-ascii?Q?MEX7wdgvhPEjYKjhy7+xLdw2znwbmdCDWVYXRT8i0WoceiCe9SG6q0spB+mT?=
 =?us-ascii?Q?+c/HyjxqOWZwtWcQlkGY7YC3GRtS87kBqXz3ISGeuLplwYaOOdF6t8GyHpgV?=
 =?us-ascii?Q?z1QSljVm5XO+DuQGHsjObUjzr0RpzOXMRz36+bsfrXy4mtb998qDs+T92iIX?=
 =?us-ascii?Q?Ji28U9yq6UTvAodxFvKFLGCkZzSXn/ZaIKH4b94aGPjO2loMHpr3iOGCs7T1?=
 =?us-ascii?Q?j54WXYc3AFWRV8pp6LqZFcSHrIY1nNY4BDBjhxJ+NSWwKyufbj6JvR5++83k?=
 =?us-ascii?Q?UUDCFu4BKkIzBgVavlS4OHymdw9SEuST1BSEpdgzDPCEw9h06BmJ5fKmYpNt?=
 =?us-ascii?Q?gItGDvyxnws6dLhZDemRc9lHfRtL8ViU4l/5Twm/uwE1fYocvjNpxmQKStu9?=
 =?us-ascii?Q?pXbJ1vTPFsg/tYxl6r+TacTTykz1PwYkUNPkgqhiCa/irI6A5dfobB8jWp2W?=
 =?us-ascii?Q?4GSHWBKh512IdeHR4L345QvFVW5JeNj0QwEnlkR1pQrO+Z2i5BGpd+03iQWS?=
 =?us-ascii?Q?KNm4deQWwqnuLfvjvj3J2+4l7AxqQm7fhBsc35YNMmHAeIijM6pWDGWnQFi/?=
 =?us-ascii?Q?/rRyL5Lvpf1C6FqwVBjYeHfarQZfiBdlf3410TB28KKDKu0vJWBd1+OLOwFB?=
 =?us-ascii?Q?Neh26M3pr2ldI+7N4drLiE4QojGTaEeNKetXedmY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7122dd14-9429-4657-bd20-08dd2ea5a5f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 22:58:34.5074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mr6mW3QUimdhCffrUjHfWh8nkqQZQ36cmSF/rRvCzoME9cj5TDl4MR8TSaMF85/z4ix36J08HtuRe1FNDjDXGAQRbKu7HkP8GQ61W8DhegE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Friday, January 3, 2025 11:16 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Nerlige Ramappa, Umesh <um=
esh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 8/8] tests/intel/xe_drm_fdinfo: Stop asserting on usa=
ge percentage
>=20
> It's unreliable to assert on the usage percentage considering 2 data
> points as it still depends on the CPU scheduling not preempting tasks in
> the wrong moment. On a normal use case of a top-like application, the
> value not accounted for would simply show up in the next sample without
> much issue. For a test assertion, it's better to check that the value
> reported via fdinfo is reasonably close to the one saved by the GPU in
> the spin. It's still allowed some error because there are a few GPU
> ticks of difference due to the **GPU** scheduling the contexts.
>=20
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

There's a few nits/questions below, but I trust that everything is in
order, so nothing below is particularly blocking.  If I did manage to
catch something that needs fixing, then of course that should be
fixed, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  tests/intel/xe_drm_fdinfo.c | 49 +++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 18 deletions(-)
>=20
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 1089e5119..120436fbe 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2023 Intel Corporation
>   */
> =20
> +#include <math.h>
> +
>  #include "igt.h"
>  #include "igt_core.h"
>  #include "igt_device.h"
> @@ -371,7 +373,8 @@ static void basic_engine_utilization(int xe)
> =20
>  static void
>  check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
> -	      int class, int width, enum expected_load expected_load)
> +	      int class, int width, uint32_t spin_stamp,
> +	      enum expected_load expected_load)
>  {
>  	double percent;
>  	u64 den, num;
> @@ -383,12 +386,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cy=
cles *s2,
> =20
>  	num =3D s2[class].cycles - s1[class].cycles;
>  	den =3D s2[class].total_cycles - s1[class].total_cycles;
> -	percent =3D (num * 100.0) / (den + 1);
> -
> -	/* for parallel submission scale the busyness with width */
> -	percent /=3D width;
> =20
> -	igt_debug("%s: percent: %f\n", engine_map[class], percent);
> +	percent =3D (num * 100.0) / (den + 1) / width;

Nit:
There's probably an argument to be made that we didn't need to modify
the calculation here because the end result is still the same and it loses
a (presumably) helpful comment, but I won't block on it.

Also, is this percentage correct given the test modifications?
Maybe we should be dividing by spin_stamp + 1 instead, since that's what
we're using to calculate the percentage later?

> +	igt_debug("%s: percent: %.2f%%\n", engine_map[class], percent);
> =20
>  	switch (expected_load) {
>  	case EXPECTED_LOAD_IDLE:
> @@ -396,11 +396,12 @@ check_results(struct pceu_cycles *s1, struct pceu_c=
ycles *s2,
>  		break;
>  	case EXPECTED_LOAD_FULL:
>  		/*
> -		 * We are still relying on CPU sleep time and there could be
> -		 * some imprecision when calculating the load. Use a 5% margin.
> +		 * percentage error between value saved by gpu in xe_spin and what
> +		 * is reported via fdinfo

Nit:
s/percentage/Percentage

>  		 */
> -		igt_assert_lt_double(95.0, percent);
> -		igt_assert_lt_double(percent, 105.0);
> +		percent =3D fabs((num - spin_stamp) * 100.0) / (spin_stamp + 1);

Nit:
Shouldn't we also be dividing by width here?  I'm just asking because that'=
s
what we were doing before, and it looks like spin_stamp is being used here
as a stand-in for the "den" variable in the earlier percent calculation.

> +		igt_debug("%s: error: %.2f%%\n", engine_map[class], percent);
> +		igt_assert_lt_double(percent, 5.0);
>  		break;
>  	}
>  }
> @@ -438,14 +439,17 @@ utilization_single(int fd, struct drm_xe_engine_cla=
ss_instance *hwe, unsigned in
> =20
>  	expected_load =3D flags & TEST_BUSY ?
>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
> -	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1, expected_load);
> +
> +	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1,
> +		      cork ? cork->spin->timestamp : 0, expected_load);
> =20
>  	if (flags & TEST_ISOLATION) {
>  		/*
>  		 * Load from one client shouldn't spill on another,
>  		 * so check for idle
>  		 */
> -		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, EXPECTED_LOAD_=
IDLE);
> +		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, 0,
> +			      EXPECTED_LOAD_IDLE);
>  		close(new_fd);
>  	}
> =20
> @@ -461,6 +465,7 @@ utilization_single_destroy_queue(int fd, struct drm_x=
e_engine_class_instance *hw
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct xe_cork *cork;
> +	uint32_t timestamp;
>  	uint32_t vm;
> =20
>  	vm =3D xe_vm_create(fd, 0, 0);
> @@ -472,13 +477,15 @@ utilization_single_destroy_queue(int fd, struct drm=
_xe_engine_class_instance *hw
> =20
>  	/* destroy queue before sampling again */
>  	xe_cork_sync_end(fd, cork);
> +	timestamp =3D cork->spin->timestamp;
>  	xe_cork_destroy(fd, cork);
> =20
>  	read_engine_cycles(fd, pceu2);
> =20
>  	xe_vm_destroy(fd, vm);
> =20
> -	check_results(pceu1, pceu2, hwe->engine_class, 1, EXPECTED_LOAD_FULL);
> +	check_results(pceu1, pceu2, hwe->engine_class, 1, timestamp,
> +		      EXPECTED_LOAD_FULL);
>  }
> =20
>  static void
> @@ -503,7 +510,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_=
class_instance *hwe)
>  		enum expected_load expected_load =3D hwe->engine_class !=3D class ?
>  			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
> =20
> -		check_results(pceu1, pceu2, class, 1, expected_load);
> +		check_results(pceu1, pceu2, class, 1, cork->spin->timestamp,
> +			      expected_load);
>  	}
> =20
>  	xe_cork_destroy(fd, cork);
> @@ -547,7 +555,8 @@ utilization_others_full_load(int fd, struct drm_xe_en=
gine_class_instance *hwe)
>  		if (!cork[class])
>  			continue;
> =20
> -		check_results(pceu1, pceu2, class, 1, expected_load);
> +		check_results(pceu1, pceu2, class, 1, cork[class]->spin->timestamp,
> +			      expected_load);
>  		xe_cork_destroy(fd, cork[class]);
>  	}
> =20
> @@ -585,7 +594,9 @@ utilization_all_full_load(int fd)
>  		if (!cork[class])
>  			continue;
> =20
> -		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
> +		check_results(pceu1, pceu2, class, 1,
> +			      cork[class]->spin->timestamp,
> +			      EXPECTED_LOAD_FULL);
>  		xe_cork_destroy(fd, cork[class]);
>  	}
> =20
> @@ -657,14 +668,16 @@ utilization_multi(int fd, int gt, int class, unsign=
ed int flags)
> =20
>  	expected_load =3D flags & TEST_BUSY ?
>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
> -	check_results(pceu[0], pceu[1], class, width, expected_load);
> +
> +	check_results(pceu[0], pceu[1], class, width,
> +		      cork ? cork->spin->timestamp : 0, expected_load);
> =20
>  	if (flags & TEST_ISOLATION) {
>  		/*
>  		 * Load from one client shouldn't spill on another,
>  		 * so check for idle
>  		 */
> -		check_results(pceu_spill[0], pceu_spill[1], class, width,
> +		check_results(pceu_spill[0], pceu_spill[1], class, width, 0,
>  			      EXPECTED_LOAD_IDLE);
>  		close(fd_spill);
>  	}
> --=20
> 2.47.0
>=20
>=20
