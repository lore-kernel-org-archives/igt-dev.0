Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A63DD0BB5B
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F96A10E26C;
	Thu, 24 Oct 2024 04:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETA7cDw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538D810E26C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729743157; x=1761279157;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9+W7xCx3kJw2IQKFn9jvXJgBmvfJ5ZHZvLX0ADfoc1I=;
 b=ETA7cDw6zov3nccTYK0hRb2MrC3x4SY5LXPlfJim6OhSPg4bYmbIHQnW
 nYmkA07deKZwrTc4LEgUhXdG4Vn1DaqaZdIWWxZ6DBmcbW+F8WuRvf6WS
 z57DB9Vq9LmLOq6+9WtpZP5GFomCF9WSJX8g+T5zu9m8x38ftXyInolT/
 IOXYQJjTlW3Qynxl5Z41D4W9kLZJ+V/fvFmtrdYF46MjNu3lG6pVBB6If
 TFzoHiVJ5iwXL/iKVtWaTGVOj0fnr7+MoisOdBGcLudFLVaDBdthI4Utf
 iFn87I9z7A2iy9KxcRD0I61sMu2f2FMZro2oVDDca7QP8eTGKSPVFmVqN A==;
X-CSE-ConnectionGUID: wvN+AMuISuyxv2mfW5TgVA==
X-CSE-MsgGUID: FE66TXFuTO2mV8HMeiYHVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51898475"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51898475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:12:36 -0700
X-CSE-ConnectionGUID: c+b8OXaqTVWw9yYKBMYolg==
X-CSE-MsgGUID: UKpvia9gQ2C34gGXLukyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80882696"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 21:12:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 21:12:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 21:12:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 21:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RROqOnR+21Gbdc//S0tsojDbPWrH92nDv6+2ZuEdf2tr8R1dUVaADaWB6axgRqpsh1MVYlOcGW/63pZegLpIhDjjunamSm6yhve8oNL6EDI52KHFlKnLmfrpWwBuWqxto18jkO5v6ifTiJ5g4IlFztGZWOvoo/hrv0ZprNUkMndLl/EeyzjZAnHNyXlqEbSPwwWPhK+x3C72JV4JCThw1/axCqgWRv9tT8+scXFgWGnuoJ0Uhk9DRf65E/53HMRmRS4FsBdpQclO3/2KxRguLKjIV8IBUBan0NwRyY8zC2+qyNfuc+WTYlBN2z0lIeS2iE3VlX0W16fF5oGf61S9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq27HsfxCrfJN3++lk2fjy+4hojXoD5hNCrzj0rzEGM=;
 b=Uc8hSWrFUYgty1ti878ps5P4Xpib8Wr4S+07zD2MVPyG/eAIRLLy8dBbe2igp28nd2Nb48wO1yQ5bprl7oXgei4q7I8/x49a62/6Th2m3daYU5HCece7lHFBYZVXI4mCtME38PzCDd7ye3E4P4gnSFUs/nBwIr6IqwrwCRHfLanLwHUdrHST77UO9IcJecpZhRNDLS7dk5CxLIG4ufKSiyHyT232kdBPH2aUkLjiIq8k9kJ1Eqss442tBHlm7khccv4QcfA5YxzvkO2zu8/lwS2zZpt9znYdd7qjiSZmPMNIrtiIbtxAVRZrzVhae+JgEDcsR3jH1K4gJSQ96GIKFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5508.namprd11.prod.outlook.com (2603:10b6:610:d7::16)
 by SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Thu, 24 Oct
 2024 04:12:32 +0000
Received: from CH0PR11MB5508.namprd11.prod.outlook.com
 ([fe80::6ecc:ebf2:5d20:80bd]) by CH0PR11MB5508.namprd11.prod.outlook.com
 ([fe80::6ecc:ebf2:5d20:80bd%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 04:12:32 +0000
From: "Srikanth V, NagaVenkata" <nagavenkata.srikanth.v@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/3] lib/igt_kms: Add
 igt_kms_frame_time_from_vrefresh()
Thread-Topic: [PATCH i-g-t 1/3] lib/igt_kms: Add
 igt_kms_frame_time_from_vrefresh()
Thread-Index: AQHbJJp6koA7PmhhIEqWR0Tpc9qyDrKVTE6w
Date: Thu, 24 Oct 2024 04:12:32 +0000
Message-ID: <CH0PR11MB5508B8553929C1FA743D8797C24E2@CH0PR11MB5508.namprd11.prod.outlook.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-2-imre.deak@intel.com>
In-Reply-To: <20241022155311.2797257-2-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5508:EE_|SA1PR11MB8490:EE_
x-ms-office365-filtering-correlation-id: 30412885-c775-43e9-0e17-08dcf3e21564
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?omstsoAprKGr2vnpTfKEIW7/DrdXWR0LeU7KdDs4dkIpm1dBqC07k1EUgdh1?=
 =?us-ascii?Q?+NzmWqfUc45E2xi7ZRgT3YjRnheMH4A56dh9xau3F9VuA/pPOKILEZHYx3M3?=
 =?us-ascii?Q?dHVQundPLe3ggUw9prZoIUT4L+T4fjp0HxiwtFu9Qgyvhj7EEC5geexMhDVW?=
 =?us-ascii?Q?ZGadd0kskAOB4zw3BNlwK1Gk21TXsErHwZzMoKSEvQ7K84cDwNjBCxF+y59O?=
 =?us-ascii?Q?ov1We78k7dCFQMtZN/FFuX0uJLe4kLHvrRuxfMas8vWq5dhY1D2rnhF2HeSE?=
 =?us-ascii?Q?gb9jU0ZpziuNODuxtWOu7r0bjW7mDF7vlJ0nk1a69isLKwWWYIGcZQu6AS4g?=
 =?us-ascii?Q?yk71rYP9mbOLMgZuPszZVTHm35vjABy3EDv+scaK6H4p+CEaJI1/LfjyAnmO?=
 =?us-ascii?Q?azxuoDuPiETyXu5qFr+u4r75txCyjPbUmWudKyEpdTEj9x7PPQdo6QUag7Lg?=
 =?us-ascii?Q?t+Ec9/BHWugwZZvuJc968zJ6PXGPKEeQI9cNUyMP/8mgvMjo+DjA0qqR/Zbm?=
 =?us-ascii?Q?Q3UVXBQPoAxBv5Y2ehKK9oOf9e2lT/usGzZ27hP0eucxh1kRgbk9hH3d5ndg?=
 =?us-ascii?Q?RUZcfKhh3gSo9LPmR6vVG2eFj6l1ABDQTKj6SM+mtdT4q2ExI1Y0sL415Wja?=
 =?us-ascii?Q?LtY9xOVeNHolOSzaP3xrXSdGWQQZRgxXrHKcbjKu7fSQzGiJl7jMVbFJie6Q?=
 =?us-ascii?Q?gHo+ZbSo77/2YS0xfHVBKV+P/y9h3mVllYvb9TreSItXllgO+ZoJ/8+S/Uqi?=
 =?us-ascii?Q?tSH+leJ7/UmLtdt6r/quzDPS5vOMFVs6PIgWW3FTHuPXlKcv92twsbAMyFMu?=
 =?us-ascii?Q?nHG0nzIoEHKdNofw2yzQkH3kJ8yEkHBHjw96d6Q5b/0nLdc0ARM1n4ek249Y?=
 =?us-ascii?Q?UEdtJ3ocfn1JPC2MYTXN/6voHMbuMPrlXh3PmDAZYBhnwPujK61tZpOIPb6V?=
 =?us-ascii?Q?vzu4uwsF/ryUiEt5C2saeiuUZwa6Zw4nvk+JHljVpdQJAN1Mx9l1cAS1pKsr?=
 =?us-ascii?Q?dPPySqgaDgsSEjEvqLcgdTNyxbORN94PDcnwjiMLvb3dd9VafHF4LZ1EE6JT?=
 =?us-ascii?Q?6JVw/+U1mLlxdYwlWCf3cJ3ZMKAzAQjf5SNc04IK7nb1rzzqtWwVXAxRurJy?=
 =?us-ascii?Q?xqNDna4gS1wXqWjKFFw02Nlc9xd/ALj8O0Jzbgazk9n6iguFx1fLuruwu4LS?=
 =?us-ascii?Q?64VM+kV5ZWuC8u98uRHkpA2Z0+/CUFB2UJjXGRDyjWSy09qfqCzIN6AGopTa?=
 =?us-ascii?Q?sxGbZ1Za1nrTJ/PHpuhb4IYBkrwybN58VXjh/dcmfrWIOEIgNhHQkonyFHTL?=
 =?us-ascii?Q?tpAK4SpaTh6mmB6wdVBtv010PrvqX3S6/Z/UmErTjZLBpofD3F2bFVbk9rsj?=
 =?us-ascii?Q?bJwxDJs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ngMd/zN7d7a5wm92+CyJ/KyMmX44ffgHjj6jQqDMy7pahIK/2zHtQX2kk88d?=
 =?us-ascii?Q?ODZIqJWNTH5TwXvMRdnBD+o421+FI7Vsj5FZIKK/IPSI+WtA20o6cvJW3YIh?=
 =?us-ascii?Q?jNleGYFnQooTHKArZJbn+W+SGe82ZvzsE8psf5sixjeHu/xEcXNoYiADnn1S?=
 =?us-ascii?Q?pPwIykG2X8kASmdSRd8hjQec6RaFd7l3XylcRvYYbLX0DIhsvXFZvPUFLXpL?=
 =?us-ascii?Q?NlKFIxhDebgo1obFWdXP/9qdjhYM7jdg4Y5WKbpPxS+aTT69vxhth94r3xDo?=
 =?us-ascii?Q?DwOe56nC8FUm+zWHbeaQw2TAy/5EVe2yXKdoKfwLKcRDrFWO/zqX71A5af03?=
 =?us-ascii?Q?3R5+pIdpotC0W7DzePnh4gc2GzZ6twgwkT1t8BNrWAoJjPjUnh+3Vx9A3ych?=
 =?us-ascii?Q?AAUUD+psEUIdG5NLfyMXTcBiYfzfCi6i57hZZVVnhoFGcm1+/mP0NgBH6d7S?=
 =?us-ascii?Q?CUTwW2EQVM5xgepsD6fLPW4zXg3uaITnF0R3cVV0ue+5YVT7vlbJqoFxoXb2?=
 =?us-ascii?Q?GH2/nJP4VSZHMtX+jECh2o5fi26JBvw6OeQtULt7A+Fxsfoss6F2mJxqjsgc?=
 =?us-ascii?Q?ZtKctYV3QrN3pP7pYfseSavs1fE06W+KoAg/t6sbw/e14vbhNyEBF5QnNqgT?=
 =?us-ascii?Q?8ojOBJWC+04NPHmP9AGurJul9nQpECaH0PozXmkPIy1rHrbLPuxOfc4rzTjH?=
 =?us-ascii?Q?1Tad9bGL6eviUTvHKXbTvUcqB2xRRFWx/TXunGu/3mo2h7rO0sCQi8bK6uMT?=
 =?us-ascii?Q?Gyy1mdjh2hHWWoZNRsJsnKplNZUq/nsl4DA4Ql0CK157rzJowF7KFU+1OXu9?=
 =?us-ascii?Q?xmWOGXdnVKWrqwzlP3ulWmMrEgVOtntdCTTOLkyUHPkDdTHeBo0KoQMM4k7d?=
 =?us-ascii?Q?bjTVdp2xecJYVHey3DhkKY9ecR80yxA5/DtbzsRsreiIotRDPhGADJvXAmzW?=
 =?us-ascii?Q?2H4JJ+LVgl5SxQ9tD5U/VckW4inm2bbqrUh8AoKKYpwHymmecciWorB6ku6F?=
 =?us-ascii?Q?2fComwZm8vxfIhATvP2bL2nA/r2LSEIT4aYTOk/aFdOaIHFx08vAu9ZHb5s3?=
 =?us-ascii?Q?zSrZo/tFvV00rPyFbIsUmRUa/7DGmlpWVVNJtNUmOObBEs6XGfE5V17uNRQR?=
 =?us-ascii?Q?YswhCIg05s/JHa1TiWwg7CKV3ZTSKHWkKrCUCS39FE/PMKDgFjMY68oF/Z01?=
 =?us-ascii?Q?wLugegnJdCiwAffXX9Hnw22So1Bw9a4kT6GtmW/pHdsh/36C0lb8Mif+FH26?=
 =?us-ascii?Q?bSdX3FljhjtWrR+jO98SiReZmgTbZq9lLavn2AGnh0BqbtZKbYuAViT/Lq/y?=
 =?us-ascii?Q?6clFkNcG1pHZyFJ9SCx4Q2JZ1tSh0BKCsmpzW5XQ+8NmtnLAeXTWWQCsx0Q6?=
 =?us-ascii?Q?JqMLla2ykgcuAi5q3qwVD2JnMUPG3yw1Tgb1zc+FTbQJaVWoS84x994aQM15?=
 =?us-ascii?Q?1a8mJsM2N3sd9qAIHdMbGegZJ9pJz+ExcxzxNiFViFg0qRhXZdzwIoE7+spW?=
 =?us-ascii?Q?/I0ZtkzCx0wcpXqURMmi6EMd79jbSRM++BHKCEwQUQICN1oaAQX+wUulUUHv?=
 =?us-ascii?Q?sMj/upWzLubjNnjeYjjtD0jVxTtuGIL6OeO0yRuzN/zEuXiL0hU/D6XVvL9r?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30412885-c775-43e9-0e17-08dcf3e21564
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 04:12:32.6562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: coHsYmvUIaLhH4L/iN3yUs/9sfwVLJnPrvYHeU43N01k1RivLYJJkqEBYuonc7f8+fxNCOTWKZT+xOfiqBNH9J5b2U/Vo7XlfKU18Pgolnjbg9UIoUGJLS1s0nnmfk1Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
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

Changes looks good to me.

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Imre
> Deak
> Sent: Tuesday, October 22, 2024 9:23 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t 1/3] lib/igt_kms: Add
> igt_kms_frame_time_from_vrefresh()
>=20
> Export a helper originally added to kms_vrr.c to convert a vertical refre=
sh
> rate to frame time. Use uint32_t for the type of vrefresh matching the ty=
pe of
> drmModeModeInfo::vrefresh.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  lib/igt_kms.c   | 12 ++++++++++++
>  lib/igt_kms.h   |  2 ++
>  tests/kms_vrr.c | 37 +++++++++++++++++--------------------
>  3 files changed, 31 insertions(+), 20 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index bb35d4b82..99231d6e7 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -52,6 +52,7 @@
>  #include <i915_drm.h>
>=20
>  #include "drmtest.h"
> +#include "igt_core.h"
>  #include "igt_kms.h"
>  #include "igt_aux.h"
>  #include "igt_edid.h"
> @@ -254,6 +255,17 @@ const struct edid *igt_kms_get_alt_edid(void)
>  	return &edid;
>  }
>=20
> +/**
> + * igt_kms_frame_time_from_vrefresh:
> + * @vrefresh: vertical refresh rate in 1/s units.
> + *
> + * Returns the frame time in nanoseconds for the given vrefresh rate.
> + */
> +uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh) {
> +	return vrefresh ? (NSEC_PER_SEC / vrefresh) : 0; }
> +
>  #define AUDIO_EDID_SIZE (2 * EDID_BLOCK_SIZE)
>=20
>  static const struct edid *
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 2b26d2bbf..fc7e4cda1 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -274,6 +274,8 @@ enum joined_pipes {
>  	JOINED_PIPES_ULTRA_JOINER =3D 4
>  };
>=20
> +uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
> +
>  bool kmstest_force_connector(int fd, drmModeConnector *connector,
>  			     enum kmstest_force_connector_state state);  bool
> kmstest_force_connector_joiner(int drm_fd, drmModeConnector
> *connector, int joined_pipes); diff --git a/tests/kms_vrr.c b/tests/kms_v=
rr.c
> index 36a22eebe..12d29aa82 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -192,12 +192,6 @@ static uint64_t get_time_ns(void)
>  	return 0;
>  }
>=20
> -/* Returns the rate duration in nanoseconds for the given refresh rate. =
*/ -
> static uint64_t rate_from_refresh(uint64_t refresh) -{
> -	return refresh ? (NSECS_PER_SEC / refresh) : 0;
> -}
> -
>  /* Instead of running on default mode, loop through the connector modes
>   * and find the mode with max refresh rate to exercise full vrr range.
>   */
> @@ -340,13 +334,13 @@ static void prepare_test(data_t *data, igt_output_t
> *output, enum pipe pipe)
>=20
>  	mode =3D *igt_output_get_mode(output);
>=20
> -	data->vtest_ns.min =3D rate_from_refresh(data->range.min);
> -	data->vtest_ns.max =3D rate_from_refresh(data->range.max);
> +	data->vtest_ns.min =3D igt_kms_frame_time_from_vrefresh(data-
> >range.min);
> +	data->vtest_ns.max =3D
> +igt_kms_frame_time_from_vrefresh(data->range.max);
>=20
>  	/* If unspecified on the command line, default rate to the midpoint
> */
>  	if (data->vtest_ns.rate_ns =3D=3D 0) {
>  		range_t *range =3D &data->range;
> -		data->vtest_ns.rate_ns =3D rate_from_refresh(
> +		data->vtest_ns.rate_ns =3D
> igt_kms_frame_time_from_vrefresh(
>  						(range->min + range->max) /
> 2);
>  	}
>=20
> @@ -533,8 +527,8 @@ flip_and_measure_cmrr(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  	uint32_t total_flip =3D 0, total_pass =3D 0;
>  	bool front =3D false;
>  	drmModeModeInfoPtr mode =3D igt_output_get_mode(output);
> -	uint64_t req_rate_ns =3D rate_from_refresh(mode->vrefresh +
> VREFRESH_MODIFIER);
> -	uint64_t exp_rate_ns =3D rate_from_refresh(mode->vrefresh);
> +	uint64_t req_rate_ns =3D igt_kms_frame_time_from_vrefresh(mode-
> >vrefresh + VREFRESH_MODIFIER);
> +	uint64_t exp_rate_ns =3D
> +igt_kms_frame_time_from_vrefresh(mode->vrefresh);
>  	uint64_t threshold_ns =3D exp_rate_ns / mode->vdisplay; /* Upto 1
> scan line. */
>=20
>  	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
> @@ -633,7 +627,7 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  	 *      next Vmin.
>  	 */
>  	if (flags & TEST_FLIPLINE) {
> -		rate[0] =3D rate_from_refresh(range.max + 5);
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(range.max +
> 5);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
>  		igt_assert_f(result > 75,
>  			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n", @@ -649,7 +643,7 @@
> test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t
> flags)
>  	}
>=20
>  	if (flags & TEST_FLIPLINE) {
> -		rate[0] =3D rate_from_refresh(range.min - 10);
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(range.min -
> 10);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
>  		igt_assert_f(result < 50,
>  			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold exceeded, result was %u%%\n", @@ -660,7 +654,10 @@
> test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t
> flags)
>  		unsigned int range_min =3D
>  			/* For Intel h/w tweak the min rate, as h/w will
> terminate the vblank at Vmax. */
>  			is_intel_device(data->drm_fd) ? (range.min + 2) :
> range.min;
> -		uint64_t maxmin_rates[] =3D {vtest_ns.max,
> rate_from_refresh(range_min)};
> +		uint64_t maxmin_rates[] =3D {
> +			vtest_ns.max,
> +			igt_kms_frame_time_from_vrefresh(range_min)
> +		};
>=20
>  		result =3D flip_and_measure(data, output, pipe, maxmin_rates,
> 2, data->duration_ns);
>  		igt_assert_f(result > 75,
> @@ -752,7 +749,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum
> pipe pipe, igt_output_t *outpu
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>=20
>  	prepare_test(data, output, pipe);
> -	rate[0] =3D rate_from_refresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] =3D
> +igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefr
> +esh);
>=20
>  	/*
>  	 * Sink with DRR and VRR can be in downclock mode so @@ -784,7
> +781,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe,
> igt_output_t *outpu
>  		igt_output_override_mode(output, &virtual_mode);
>  		igt_assert(igt_display_try_commit_atomic(&data->display, 0,
> NULL) =3D=3D 0);
>=20
> -		rate[0] =3D rate_from_refresh(vrefresh);
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1,
> TEST_DURATION_NS);
>  		igt_assert_f(result > 75,
>  			     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> threshold not reached, result was %u%%\n", @@ -802,7 +799,7 @@
> test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t fl=
ags)
> {
>  	uint64_t rate[] =3D {0};
>=20
> -	rate[0] =3D rate_from_refresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] =3D
> +igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefr
> +esh);
>  	prepare_test(data, output, pipe);
>=20
>  	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-
> %u) Hz\n", @@ -811,7 +808,7 @@ test_lobf(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>  	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
>  	igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
> -	rate[0] =3D rate_from_refresh(data-
> >switch_modes[LOW_RR_MODE].vrefresh);
> +	rate[0] =3D
> +igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[LOW_RR_MODE].vrefre
> +sh);
>  	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
>  	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name),
>  		     "LOBF not enabled\n");
> @@ -857,7 +854,7 @@ test_cmrr(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  	result =3D flip_and_measure_cmrr(data, output, pipe,
> TEST_DURATION_NS * 2);
>  	igt_assert_f(result > 75,
>  		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on
> threshold not reached, result was %u%%\n",
> -		     mode.vrefresh, rate_from_refresh(mode.vrefresh),
> result);
> +		     mode.vrefresh,
> igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> +result);
>  }
>=20
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
> @@ -1006,7 +1003,7 @@ static int opt_handler(int opt, int opt_index, void
> *_data)
>  		data->duration_ns =3D atoi(optarg) * NSECS_PER_SEC;
>  		break;
>  	case 'r':
> -		data->vtest_ns.rate_ns =3D rate_from_refresh(atoi(optarg));
> +		data->vtest_ns.rate_ns =3D
> +igt_kms_frame_time_from_vrefresh(atoi(optarg));
>  		break;
>  	case 's':
>  		data->static_image =3D true;
> --
> 2.44.2

