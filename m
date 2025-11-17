Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171E1CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 13:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDC9892F2;
	Mon, 17 Nov 2025 13:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DL5U90Rq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57541892F2
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763387704; x=1794923704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=24GAAwyG3r+88uLgcGb+IiTJZ/prkx71ZZS/1iAwfz8=;
 b=DL5U90RqV9yHR5RK5tpGPYZ0X7wL/QFwsclN84Ep5p48uJn89mCCQDDv
 BFCfZQDUOngNM9mnulGTd/kzLbVCCXWbO0E/tkoWw86u2/iJVWwoixgFK
 tEuwRHe8cQEN8M1iQeznc9ccrvZyk0AnbXTt2OWfeWh0W5rQWRhyqZ7Mw
 xybHsRacaYlwzavhDTHrzR7n4H6OkgOrDRdjEAmMpFRciSUo+vCoOLVTU
 9wu27fQCokzZoy0RUVm7gGSbTD0JOOesNJTFAQ4jn9V4UNfZWY5qH92iA
 vxlABd7ES9GKlJm6VIhyd5E+V7UCJUakGCRFzepbMUuIJH8h55y0NtDcn Q==;
X-CSE-ConnectionGUID: sUJxHWJvRAqXH938k4KEag==
X-CSE-MsgGUID: BJgpEnMXSGi2bX5/tgUtZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82776202"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="82776202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 05:55:03 -0800
X-CSE-ConnectionGUID: cDAJKPD2TwG8Ep/Dbcar8Q==
X-CSE-MsgGUID: cAYtxPqYTjymVBoscOdghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="191251834"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 05:55:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 05:55:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 05:55:02 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 05:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNvqZUTYQDP4cnRQtoSiCoShQflGX3dhlI4tN7dnzhoZtxqMx44AhJ9lAE+hlwe+y8Cu2ccsZ0LUcuyxbE0bcPTnUbbMTnyctNSi47TcJAP+l6wyjCSxdrl81KEMowo1CXJp1bQ6Ps8FxZ/D8srXBxUT55/Iw1zrQJH8sA5xqrTtAH0GGGhSW8WkaWvpzSrLClj0wwmRZfBAspLXHQUBjbp3tNm/UIDZPjDXIVVgiroUhQtivkPgLwkBTmYial+MnUNmZpFJ+drBeLb7SwygUo6+ODWdjnslHJ1Wb3VOTw4Am7gRC9KbTSmpVAtfQG4eieJmDLgY6MEUhUykUwVaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu15Ecjc5jw1QU3nBI0ai7eFreu+h51ZklVcg4fq5dg=;
 b=PDQXqL4PyIL5ID0HXdgXQFWXp/D76dmLHVbQXBDAhYZqC53qu10/HS1YAytHuV2CcmZnCHckK4WGLrlHzytdI4n/rDRcNu2WM95oqGPWDGTnvvmjyLRYGXnMkugZcIxE3oGhM4GEXuS+nnzwk+H8sAa+6SQ6a73PQNeSqu8ziI/Yv43VXURAHR1Sv6sjkpuZHIYXUlmL2ju9RR7HD4J+KVN/+Me6z6wB7b0vt8v9i0uFbnn3hIg8Hvxv1F05jV8SCK3HTT6NTMXx0WRUDV4RiFMVRGDxVcsl7urwYmNDPu7NRJn9YXwYAXFdhQH0JstyTYwL1fqs18euu4vgwLbhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA1PR11MB6322.namprd11.prod.outlook.com (2603:10b6:208:38a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 17 Nov
 2025 13:55:00 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 13:54:59 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2 2/9] lib/igt_fb: Validate supported formats for
 crc calculation
Thread-Topic: [PATCH i-g-t v2 2/9] lib/igt_fb: Validate supported formats for
 crc calculation
Thread-Index: AQHcVHkx6KcJA207hEOgRrkQlaTI4rT26acQ
Date: Mon, 17 Nov 2025 13:54:59 +0000
Message-ID: <PH7PR11MB6053C5BA3FA4B91C6D1708E2E7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
 <20251113085801.3088957-3-sowmiya.s@intel.com>
In-Reply-To: <20251113085801.3088957-3-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA1PR11MB6322:EE_
x-ms-office365-filtering-correlation-id: 1dc29971-751d-4f69-103a-08de25e0e641
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8pCbSNQZR+071EBDneE1vj6Rx1R0x3e4RCi4FBlThQv3j/QGfWV77ylSz1iG?=
 =?us-ascii?Q?Z9xCfLqSI2lmyaKRDBXHsHGXYrcAo6rv/GlWhyQz6NUB1QzQAWvjvgAyTgwZ?=
 =?us-ascii?Q?b9ieZ2rKaA9ohtCcKea9xEkSS1WhbRWpN5/3gao0DwG2auKUIK2vOBIZfb29?=
 =?us-ascii?Q?CpCqtOjEoCM7E5ZzmYLBvQLfriJe9BNiGwAN0Uj0k1wPEB3ZbGK07TpLxQX2?=
 =?us-ascii?Q?3kAgrmZFRTxcJX013BqWMFi++fsZ47aQq73I/H0sqQCxOJRh/APtc5R4FGuo?=
 =?us-ascii?Q?06kiS+Gt48DYByM5/Chtf3FoWSf7V/iyKMs/vQXWc6MKELXhKcdTWlw2PYwt?=
 =?us-ascii?Q?Z3AteXQwJ1o5y8ebf90aWgZJjSXQ4kKi7ZCzi7CXZDXwTkfLtG2hIstgzbV/?=
 =?us-ascii?Q?h+wvB8uTLlrmu9rHWnC15eK5G0rJcRsuarkiwQPdksUhue1ZdAiP+lOcRzRS?=
 =?us-ascii?Q?Xnh0M58VboVNlgJmgo2fa37vPzjByTuJRFwpX6AifYxY0BgVS+hbTwRSxBbb?=
 =?us-ascii?Q?THYuqBtagC/7YhUhEp3hcHRmd2Nc7BnJuAEUVbtudbYb40YQMxxzZO/kWHd5?=
 =?us-ascii?Q?H7hDmQITNzBChgYOWfDs/cYSCton3X/1ALMOdpR/c9ZuWWKfXxDbGqQ6KeYQ?=
 =?us-ascii?Q?cFC1LfXyGSinBJs2cN1TVmQKa2dv3Y0CJhfqO+TNSOTyRX2/IKDJSgxVE3hA?=
 =?us-ascii?Q?lmK8sq3ckR+Sfpy5sFxKEecLQ4GyBKsKnc/gaWcabYIz+wUjaLCvOpoBz7wS?=
 =?us-ascii?Q?NW4g8n0Jzp62T9KrCoPNphLtNGx0h6nxzDWkvwppqHsDMjzwKdg2/xi3gHfF?=
 =?us-ascii?Q?IHZrKE2pD7a+/FArus0TQ71BsO2eItrUhdCFCB4JaQ3ySM3D9WsPWjF4d5HJ?=
 =?us-ascii?Q?cKtDylW90aaIbobuDF/Rb8GTlxsqISTKR1CgbNIUZjp08GYEcDkFFLIs3xlz?=
 =?us-ascii?Q?JDZI040MqQfr53mJcv13j/vQM1utrALSHONZlGLjKSDPkWCDRdOCDfbvac1F?=
 =?us-ascii?Q?TXDvt9xFkdF3oLNxURVpbnedx/OtnGfZ9/7NgxyDB5zpW4I/JsNzet3MMVNf?=
 =?us-ascii?Q?w4ys78H99NCx2K5M6zMbXj2ir1+GNftDnaGS0KMz03R7YiW3rx+jK7oJjucq?=
 =?us-ascii?Q?W3iGnvyhsaudWzzXmvH/MGw44qciUDBWf1ikfqF4ssPsppEpYqO4dnHxlHPM?=
 =?us-ascii?Q?2Qh3Iqr7lAAVwEOJWbdl3NwNqrRig0uQVxcb4O7dmI5Xpoy+m+EhNVbUsnPv?=
 =?us-ascii?Q?AEDiKhoANE2bc7hznNYGGbBMgC4biKBMbvMoYz3//Xj6bmr5fFfCJWztbRlS?=
 =?us-ascii?Q?IRZwK4ve8ZIzCW0PLENXZEZpZim7WF1UtVOnCHxJmONZHA5mcWm4DpOjocvZ?=
 =?us-ascii?Q?TYEq+79qf3pc0iAmPUqjZFpk6noKA9gzl4Zr8G1In48a5/etyEfz6v5Tk6+h?=
 =?us-ascii?Q?xFCYattG4DTXTBv8Vvae5jdLWKFYLnh6dnoqPSnvJMb4NooloRWs4ud57zl0?=
 =?us-ascii?Q?lLtN/EUNiwOijfFuuv6hmru1j5hV6K1BdD9O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YWTQzVx6szqx+gKmXDiU5/J2dY7ZIqxHlLah4aNp2OPd9zyosi2MU1lWvnZF?=
 =?us-ascii?Q?sa6prLKMutSRa+M7jlcRvKSOssHs21PeKwpSlhG/iWKxN/jhXX175Wr2VF/k?=
 =?us-ascii?Q?6/EjKVaFHeCuRUOP8grw27RkD70ZRYc/Lak41yKziB5pRjLYHT6vIXelFArJ?=
 =?us-ascii?Q?SitDo1/ugF3hc3u9R5ykZBvtUJ1Uee3qWyPP2ClV23BpqUi9IWyuaMibcGVQ?=
 =?us-ascii?Q?eCCoFLyaH+dLARvoAC9VTW4digPx6Pz9aKOFgStSwBo/DVYV62rQSf12AyO/?=
 =?us-ascii?Q?75qNnAOAP8arLirBigRQYUE31gapTR4/nQ4QI4n2r7HVsYFXhMJZKHSbumUh?=
 =?us-ascii?Q?/6LSrx8UqWrA4ZXcKpU+yiYijnd0uqPfrj6mmHChNogzzCWFxkg4sqCjJ/ZQ?=
 =?us-ascii?Q?l+9jMokn/AKGuua30d/v0+CLVac0c/3SN+uYlMuBHb8n7ZnHtqqUMwOO/7V/?=
 =?us-ascii?Q?1jBq0kWd1iL5NZRWrnHj2alOTrxA3VT7W0OlFrrg/6h51jirTTf/a1zmgd6T?=
 =?us-ascii?Q?etq0vcMHm9ShhpB9xw66HdOBt36FmPKqHpe5YwMJcINopM9H2RZvvlrJwAJ0?=
 =?us-ascii?Q?u+6BmALNGNOwbY670JQJmQD74UhzpO11OIkalh5EdQ8F5YShidKHlTsygtEf?=
 =?us-ascii?Q?QGG+Lt50oc1HYSCaSiuxbjUaZlUOxYEfq9Rc3AId2YjL73HrF3QtTR9ACTrh?=
 =?us-ascii?Q?TCjiwkznPnp55u5g0QmejrXxQmNri796buVIgRgkqHOVpLw4J5Zp4Q71nSh4?=
 =?us-ascii?Q?y9ZEk41vV3Xt7KveucRUJbwaiLHNVAMom1eLHCNEtJs1zP+dERyPoaOp44l2?=
 =?us-ascii?Q?sige/nPMHlXARDmxBb4WxwA+7WZC2BpM2c3xCY2wTGZ/lXwe3ugNKK3ZY2kU?=
 =?us-ascii?Q?AF6kzgqKuRPgShEPzLXuEKAKL3Uj7yRoDOYJKWUardx5GhjVj08gQf/zV7Hf?=
 =?us-ascii?Q?153PN5jVDy4h6XLqFJPCxqLKio8z65XOp1gWYMU/Jj3nOMFflavQ9SoKwYle?=
 =?us-ascii?Q?ystacHnyhhlIRAaejZDumGfYU/kOFdwgzflafCrZpgW6+gGm0545/uP7mhQB?=
 =?us-ascii?Q?cvaS052JYQu/OxqBAt8Wo1bR9qcVnkttT4esS0095PrtqFFbeC+C8Lvc1Tkm?=
 =?us-ascii?Q?Yc16duUsbD/0lOduTJGnhZCq4U8M78YPWwNhZgjswdwDO7M6MPp9yxw9G6r0?=
 =?us-ascii?Q?t5Mup4V0Yw3WYyrAiczdDdwaVxG4pxAqeV2qshDNl03nquXDsNl3YfCZus/I?=
 =?us-ascii?Q?INcejtuIh18kRQeGDxy6ozLK1BCqbPYSSjLba8bUyPgKf8C/p6jS3DkNQiDU?=
 =?us-ascii?Q?Z0gD2ZNrHuCM62osf/h27YRzIO/hA0lcmUj3FXLutJcLbZalTgQtujONxCtp?=
 =?us-ascii?Q?9zUjk/56PUVlUzcQ6TP83TjtaXlkCCSCdeEft4Sop/DqA59WsHFpGn1GcHrz?=
 =?us-ascii?Q?kCFhWfOx1CJyw3CefjWxFP3JQPs5Si/jpgzzNJFMBD2EmQaQD+pAmqJuCBh4?=
 =?us-ascii?Q?zGG87Aoug5y/aL6r0KStclP7NPf0RxJrYhnOCWZbDmgqKX5vxbVbY2OJlFUW?=
 =?us-ascii?Q?HlP5LL7S1bSp+5CYZaokWavNCzQy2HH14m+3DIHE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc29971-751d-4f69-103a-08de25e0e641
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 13:54:59.8090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 88aKU1I9lFpFnkAmrmO9uOyNVyXRlB6WTs4ti70w3l+Xm5iJmZjvhKELJHZhH8BtbMwvuYfoXcD59darrvINTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6322
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

Hi Sowmiya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Thursday, November 13, 2025 2:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2 2/9] lib/igt_fb: Validate supported formats for =
crc
> calculation
>=20
> Add logic to verify that provided formats are supported before proceeding
> with test execution for crc calculation
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
LGTM
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_fb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 60853b0af..844f13e5c 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4960,7 +4960,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc=
_t
> *crc)
>  	if (fb->num_planes !=3D 1)
>  		return -EINVAL;
>=20
> -	if (fb->drm_format !=3D DRM_FORMAT_XRGB8888 && fb->drm_format
> !=3D DRM_FORMAT_XRGB2101010)
> +	if (fb->drm_format !=3D DRM_FORMAT_XRGB8888 && fb->drm_format
> !=3D DRM_FORMAT_XRGB2101010 &&
> +	    fb->drm_format !=3D DRM_FORMAT_XBGR8888 && fb->drm_format
> !=3D
> +DRM_FORMAT_XBGR2101010)
>  		return -EINVAL;
>=20
>  	ptr =3D igt_fb_map_buffer(fb->fd, fb);
> @@ -4987,9 +4988,11 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb,
> igt_crc_t *crc)
>  		for (x =3D 0; x < fb->width; x++) {
>  			uint32_t pixel =3D le32_to_cpu(line[x]);
>=20
> -			if (fb->drm_format =3D=3D DRM_FORMAT_XRGB8888)
> +			if (fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 ||
> +			    fb->drm_format =3D=3D DRM_FORMAT_XBGR8888)
>  				pixel &=3D 0x00ffffff;
> -			else if (fb->drm_format =3D=3D
> DRM_FORMAT_XRGB2101010)
> +			else if (fb->drm_format =3D=3D
> DRM_FORMAT_XRGB2101010 ||
> +				 fb->drm_format =3D=3D
> DRM_FORMAT_XBGR2101010)
>  				pixel &=3D 0x3fffffff;
>=20
>  			hash ^=3D pixel;
> --
> 2.43.0

