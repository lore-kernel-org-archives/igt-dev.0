Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441DBD73619
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 09:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36ED10E9B9;
	Tue,  3 Dec 2024 09:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SO/hoVwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85410E9B9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 09:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733218899; x=1764754899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VxWzjuYmVZC3UOkYzcaWyLzWRNiBglSFgPAfgW8MfSM=;
 b=SO/hoVwIKlqqFbxsZjOJO6i2xR5YHcW7abFtAFh8YnTep7DXAQAvnsng
 h7oSeuF6IpWNg8uDZw5c/JHeBufydIGSPxY4Fn1t2EKc6EMgkp7isoixH
 1yIL79xK/3+COyMMJhVfX4e3nOml8zRg7/1kAZXkrKD9aYWK9Z4zqfR53
 O6fSTiOtAuq1EKBZiz402wOawt9xAWy6+2l5nqtla61dhREYGYcj884G+
 CinEl2rDVN/ZFkLv8BWKYnkr7Eg6zQqaE0vYPfiKXTq5l4ETa/cHeJnsJ
 I2vcPjh3o+mC1ad7YH8bFTQWdUxmvrQ4Rz/N0tMKCQROKpnhgS5A/ySS6 A==;
X-CSE-ConnectionGUID: abcOtztuSlKJLNk4qFjlGw==
X-CSE-MsgGUID: aBjKm8P7TJawtPTFQ8ASYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37356819"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37356819"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 01:41:39 -0800
X-CSE-ConnectionGUID: xCCvis+YRi6eNYegDlIHGQ==
X-CSE-MsgGUID: pSveFPgjR+uzhyD+AkqUMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93580888"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 01:41:39 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 01:41:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 01:41:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 01:41:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeWXmSB3AEdGEEJaCj2eCDoyMYwfp/DBxGK5k7xZsf6h1I40e/dsC6nrBi/l5w4lfzeQ/QgWXc+YpPjyIBK4FLZA//EIdHfAjxOdCgMSCduwxsL2QHmc/INZUkVJG9UeDQ8KAyoujBz/UmfKKNNCXFKa19+8l6Cd9J+hv1hpgEID82mAyWttvJ65e76Um+g1c1moYFcjFgrGptLb+1Mf/8u81zsZ2Df/deGORUPfR7LGveUesC7UQShKCfkRKVHuma3j3v80I4XgFupPhWOfah6MT7a9h8bOx4RTmWMZqf0NWSiUeWXwHXcGrrFlg44YsYph7DxjYJmiSvr8tR4Lmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCAoGmDb8HkxSSy3/t7NScQpiFTQbFbsjvBMHvoQgDY=;
 b=OPZgpFCC1BWQ2YUST8oeybe6JQVDYAT56R4Pe11sGvoUXR1q8WXI8BoPNidqSQkyrZE5wyL7wmhzx6l+enAkaOw0DYRbOj/LywrHjtxUob4pIeLLlXpbkilGWkAcJjj+dzmFo1jqJwJFSFO2H192J42YYQVmLwoVMFpM+m145fIuqdrk/MIDThIJYy6bgMhoBLK3p6txEEg6fwR/dQEIyJaAFoU/Ot+K+bxAreRmPPAFRafCpei7ZWxA0WKQXn72eCbbdpav6wrV23vUH7gmCCO3KLvtPTJVMnll9RFLTLDs6WUQ+SwpMslS3KErBmLoRyl44Utj693O83kbUrCaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Tue, 3 Dec
 2024 09:41:21 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:41:20 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner
 support to adjust_mode_clock_too_high
Thread-Topic: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner
 support to adjust_mode_clock_too_high
Thread-Index: AQHbRU+AIs0JJWejiU2ZoP5wG5w/ALLUQ27A
Date: Tue, 3 Dec 2024 09:41:20 +0000
Message-ID: <PH7PR11MB605347E445B878169AF58BA7E7362@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241203064401.366661-1-santhosh.reddy.guddati@intel.com>
 <20241203064401.366661-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241203064401.366661-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ0PR11MB5896:EE_
x-ms-office365-filtering-correlation-id: a138c6c8-9514-4a09-2fcc-08dd137ea4cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AsgPhrprnJMpLT0B64uFHwnrbKTG5UHHd/GP035hcQbvxtN92MPvYioz4csN?=
 =?us-ascii?Q?U/C8/U+djbtKalqXiTyl0579OexsLs1Rh9yMmRYvdZdpvSlXjgHwzvDfJpiU?=
 =?us-ascii?Q?OFfQ9BFGNWU0t8vpYYyZtnwuahjRoPwVCu0AwcUp9oECCXjChv/GaCuEPF3g?=
 =?us-ascii?Q?njcTz6zt4VS047TLLXnU0dOJiXN+RkXf9knOzGwtt8EG7rGXv5rTrJJDRAwO?=
 =?us-ascii?Q?fWlmPUBG8z8pTLtn6Y+Uye4Wners4u+YaNxtGI7F7cXgs3XyPKK8R+n0C0ol?=
 =?us-ascii?Q?hmWzWPrn/5MGYMoM4jJNDIsX37tnz3Q3phvWc4rwUwaQBfFE7OS71njhlWgC?=
 =?us-ascii?Q?3hv/N4t6GxGAVn5vtb0ieQjVLdC18su3EjgeZGmBHZF5HECbtt3mRZ3i0TlZ?=
 =?us-ascii?Q?u3Pp/gKK47eDosfqgXo7clAlczYwz5SiKU2p4XlQQu/VBuFiYv39UBaSG2Nq?=
 =?us-ascii?Q?TcBGEB8k67wndc+v+6mGrIKXhTLy4tVsdOI+nFuWtXxXL3jrPXhEk1k+Qi1d?=
 =?us-ascii?Q?0OyiEFYyKCcLwYNmb6+X98RI1cZ63C/cieJxemj/bFAc0AyEG8FjpnFhIdRE?=
 =?us-ascii?Q?Z2Y1dpywRyajvd25ER8fMG2irUnoMTUaMGYTMiL2NLB6hqBUS8m/3dbZA/W2?=
 =?us-ascii?Q?sSd8SVCyYaMBFcx4mnD5BcXkdkrF8Bcd0gj39zuyq4WeEX0PzaH4uPHhs5jQ?=
 =?us-ascii?Q?Q6TpCNdnVAcE4wdAURo1/kFJSsUgGmWzsySDZvR2F40On9+o9VWxasfzdP5F?=
 =?us-ascii?Q?HnYa1/1p8LJqcj6yWLGPBHIcgnofR/HZkqlZs4JTr5b3gZUFQQsCQlHrC9Ym?=
 =?us-ascii?Q?0TtGX1MHXkzy1XLBAPqf65wa1iaH5hHQBR9fuljaEJR1luEBjFNERE5ZkGsf?=
 =?us-ascii?Q?8LO6qZFNoI8+dam0RHPXMZzEnVndA+L8RZU9xnLKHwKu7TNSbVto5UxylG45?=
 =?us-ascii?Q?A7VOSYdNZpycg7c9L5HV9z9qXwXcr7dB7K56mWJN1i3Y4QMBCbIpGgqshR98?=
 =?us-ascii?Q?5Pj4rY9TCr7RL/o8g7Ci9G8Eyq5aUEBDPbbU+GJl2y8fTujaLHiNuDWjGW3w?=
 =?us-ascii?Q?HgwB1ykCuFmAFoH4Ls5vigOEq0+dOg5qPPCS8XwI96t18hIL8Rs8dmDLbAsy?=
 =?us-ascii?Q?gY1S+jIqQtvWgmrWG7z1/EU7rRgme7KAQbBCZu1yvIYdH///etAkcb8ozi8e?=
 =?us-ascii?Q?nTGQfERrciWmCN3p9DFg2EM3HyOwE1HRAGg/bxaS7lDVRkbAHPAkUkj9+vgk?=
 =?us-ascii?Q?YGnbFeTOr1EKgrExvtiwP3ypeCmhNDnavMgvOmlrtPRtzy4VvHUc19CG2nue?=
 =?us-ascii?Q?Dlv0FQhIXmSh7o/zc7kVz90Jv7gJp7CQ2D6CRXZohPtbyUkk9Au5kQG/R4D5?=
 =?us-ascii?Q?nphMTnHNPmqNn/xTe7JmnxkKArbsxt/vdqjiiyUyPXsHNfdG+Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4jhQ0xRrfVYPg5TVO7QDiwGODg31xpHrQTznFRf9FJs7BBi5Xk+OTA7IWO8/?=
 =?us-ascii?Q?vX/2JQpC7P5bU4DqSTZBJ7yuDsax0Nvac/LfWHJpSoeW+J0KC766qC86314u?=
 =?us-ascii?Q?2FVHzTnlpGOJyVtrpfKNvoFsC6ZvoKRM30OmeBJ6BcaHPm65orGXZTUJEHUu?=
 =?us-ascii?Q?j08YL/r5rkvbKQx6sbYefr1HGnG8qM2tIq2SUr1+xgcSXs4eHOEveeP3/S7W?=
 =?us-ascii?Q?rWZk+76Ns3waWph9Jnx9BVldhzLp3mZ0gWtNv7uzzuxhNxSivfbf06yhSs1m?=
 =?us-ascii?Q?wFK9udKnEL1RXGV3pBXouA943bnNeWuqBejO7KErkHTJcIggQauF6b56pP/Y?=
 =?us-ascii?Q?A/Atm8W05K1/ODCMvFGos0/Vk1aCe76uDXVdsXP91fYxXXO4jKdzRgpSYfkE?=
 =?us-ascii?Q?KY6+I8uh3oidsibbnxu6z43ryOk6TVe40zvETsW4EKLX9fZn24JTJEq2mMZh?=
 =?us-ascii?Q?lEkE7w2FzriZ07YWWviUvtL5n36Gwsg+BvKdgfLqn9d8VD5i/0euMyaWRqRv?=
 =?us-ascii?Q?uru05GGJI7qNq3pdzomFidtaAIz2+P4afuavv1b9XiHG4Y9gQQODBwkS16AA?=
 =?us-ascii?Q?NU3lZATZ3wJL6v6gzNjJqz/hNd8DxHp01bLxgPJY6fh39303dQLvPyJbHy5U?=
 =?us-ascii?Q?3sluQYRnLrylwHcxXh+Lz2kWQ4ymSpUA1EXXMTHKVGtFC7H0WSDGQbbCbKK+?=
 =?us-ascii?Q?r+2hE6L7Ga9juS2nZ53mMAKoUD/0zHD2MZ2/vEaerLpphdpbdK6QzWC12sH1?=
 =?us-ascii?Q?j+es1yL65OUhOHKl9ztMCMCxJTz4wQhhmwjJaHcXYz7JDl443uc22Zr5ZM3q?=
 =?us-ascii?Q?pe95K8Z6K5KbuADg1QC/xlTIWEM0LyJdIowRgy1rz8Hh2kjQAvI1SSoch+vA?=
 =?us-ascii?Q?bAJ0qD4zCn3mGa9ZO3BESBdq/qhLHaXbpHIjumzyMaUeFFOkXKI3wTQeEGxe?=
 =?us-ascii?Q?mYFNZ/5M0vULN6k2u2BlgNACN3Dr1dlENSxIZGOfwlX7D1w80D+KdYwaeVr5?=
 =?us-ascii?Q?P0e00ihHY8Z2+kGhPlxbn/xJI9ib6gQGY1w5iMPeUxVQBl9yq+ghiISowSsQ?=
 =?us-ascii?Q?0zsUzhpxYOfUs/thZTkyuHrfY1PJe4L5H9LfeYAo/Eq8pbJGVqFul94A6hW+?=
 =?us-ascii?Q?7khS1dc9UUBiXZeXYdZN4nXAHtFKeQ5suy2H5H82FLnvvXaTwuuZ1IZlr7Qg?=
 =?us-ascii?Q?wU6Z+mI4wg6UpXJOu/DQdDo1NkHZPGgRJD13xPkqcrcY5vXxn2bD2l2gdI6N?=
 =?us-ascii?Q?pyqUnsjvgwT2EBPXa2IVdvr3sf5/mY1DXAqH8PIF7/hKNZ62sDo24coCv8o3?=
 =?us-ascii?Q?VBMSVYwDr8WXcJoPSIXVO8Zj7kSeXKidtoNW39H+SJlmpgvNe0kTnQSQoBC3?=
 =?us-ascii?Q?hK3c032AA619XN8FJckLLwGTNWUc71TqAlFxIyDDmTQq6uSB/diTR+HLUYEV?=
 =?us-ascii?Q?65gyeIhKbFv2zTsZYluz8aNU7Z3AZgj3PRZwLWD7VHnYeNhzpHFUABYxygj1?=
 =?us-ascii?Q?yg1z7eVA4U/iDNxDpxCtwUyauybIPstofmghzYjhQyRc+spXYFZg/9hSLn7R?=
 =?us-ascii?Q?Pu2NeZoUGPCogwinlDmdXJlMHz+BvNS/wQHjWU9T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a138c6c8-9514-4a09-2fcc-08dd137ea4cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:41:20.7749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q69rwA/y0o9Vy2gc5aW0C7l6qHQZ6BjpXJq2wEmogTmWiUikoij+fgLQezK5hSBgEfKaApuz/h/sj36ZQGIt6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
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

Hi Santosh,

No need of cover-letter for one patch series

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Tuesday, December 3, 2024 12:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner sup=
port to
> adjust_mode_clock_too_high
>=20
> Check ultrajoiner support on the output and adjust `max_dotclock` accordi=
ngly.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> 4fd644594..5f13efddb 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -34,6 +34,7 @@
>   */
>=20
>  #include "igt.h"
> +#include "xe/xe_query.h"
>  #include <limits.h>
>  #include <stdbool.h>
>=20
> @@ -99,6 +100,28 @@ can_bigjoiner(data_t *data)
>  	return false;
>  }
>=20
> +static bool
> +can_ultrajoiner(data_t *data)
> +{
> +	bool ultra_joiner_supported =3D false;
> +	bool is_dgfx;
> +	int display_ver;
> +
> +	is_dgfx =3D is_xe_device(data->drm_fd) ? xe_has_vram(data->drm_fd) :
> +					       gem_has_lmem(data->drm_fd);
> +	display_ver =3D intel_display_ver(intel_get_drm_devid(data->drm_fd));
> +
> +	if ((is_dgfx && display_ver =3D=3D 14) || (display_ver > 14))

No need of parentheses around 'display_ver > 14'
> +		ultra_joiner_supported =3D true;
> +
> +	if (ultra_joiner_supported) {
> +		igt_debug("Platform supports ultrajoiner\n");
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static bool
>  adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)  { @@
> -128,6 +151,12 @@ adjust_mode_clock_too_high(data_t *data,
> drmModeModeInfoPtr mode)
>  		max_dotclock *=3D 2;
>  	}
>=20
> +	if (can_ultrajoiner(data)) {
> +		igt_info("Platform supports ultrajoiner with %s\n",
> +				 data->output->name);

Alignment should match open parenthesis

Regards,
Pranay Samala
> +		max_dotclock *=3D 4;
> +	}
> +
>  	mode->clock =3D max_dotclock + 1;
>=20
>  	return true;
> --
> 2.34.1

