Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F44CC6B01
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 05:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F5D10EF93;
	Thu,  2 Apr 2026 05:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEWP/PD8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D84910EF93
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 05:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775107270; x=1806643270;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B7GJiSb9+Ib+hYOJg60lPnOfhQQi8rmi4MXzneOO2ZI=;
 b=cEWP/PD8iH4Bqc9CyC2FFDEFiuu8STGBZcYSbX7mlFBCMA0+HgI1OneG
 vmEZstYc7Xxz6s+8vtPLOmXZxIoQzPriOboaU3aqHzGTs0c9euBJ1HmUz
 RW5+WB0dnlhzfjdsn5LB4Cr8qtZIAM/qZjt/XnK6WTFEFXW958mdpUE4B
 gIAkugJlqRRYANmCCn1PPGk7cDGTmP4EsAINIzGPK2jIQc7F6nMQwkZYk
 YeA6cc85WLRvKMQgbCNFTy8AjxZxxPJrzWhfg/LCxCY7se6yMwkua3xX6
 8Nb2P3z7MmR+rjDal4/n/ugP1YucwOIDOg/LpDdd9gVE2VBRgGg2aXJkC Q==;
X-CSE-ConnectionGUID: alSw5fovSbenk0NJF8mGTg==
X-CSE-MsgGUID: vXbwQSlNSyybJ39+8YECbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76347570"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76347570"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:21:09 -0700
X-CSE-ConnectionGUID: 4b5j5uBhTvaiItCZf5AZwA==
X-CSE-MsgGUID: ZZI66hGqRHOIqg/A3gtdHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="257350178"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:21:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:21:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 22:21:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:21:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJfOFbqg6JCSnzcL4HC8W3zc9Zmb77SVmvVGtbphpeKI2TgRJb5H273x9P9doPSvoLho33w5xRONMZc1OWC+7KnvL3UYx77llpBUX+srHmIrMZDMXR6aqK/Ks2q6fP9ClVwYxZm+DpaxY/CfgOoGbWPFjvkNK5i8vGkJ2/kSBUN4X6IZOhnkndzB5AddaZ/rvi6ShhHMLDOSZGw7q1EzvvA+jJpwUi0MewY47HitHrRhiYz0DIzLXG2Xu11aGBb7UDXsMhxd+23DvRGAO51Gl4eBbzY3gnSg3O0gbnqwq4PPR1AAftDU9bYXbe9ffpUh0IahE32rBpnS/iPxKUo1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZQnZxDGjvacZJKf0zGSVO+rolGZHIPad/mD68PySnk=;
 b=I/L2li7rPVF5qmqpAsFdQNGdh3cKMThFoePylNPOTjS2AibTVzMB1AWY2nEK+MnmXjRZ5FRhrDHwRxvOKC04t0wVlHS96/rCLjYwiJjB89jRfVm9P4qYNXW/msBGTqOa/7ojbu3Q146KeeQL8W2pongln6ajpyVSZ5bf/wDiLQzY/DLqJPP6ACJB3qU5gAmynGXMzJf7eVxXuwEQKxiVp85zzoBBzK4ovuumWVNt2YmzmekIGlXE8QfPss8nBot2tZ12qRbPAXpZDGP06t/O/n/kFn6coxqkLVNPSrh8ed11g2feAu6nodwTYH1i1X4sNs5EDxZ+cRJURzGgCUhkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) by IA3PR11MB9183.namprd11.prod.outlook.com
 (2603:10b6:208:57e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 05:21:01 +0000
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22]) by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22%4]) with mapi id 15.20.9769.009; Thu, 2 Apr 2026
 05:21:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 4/7] lib/igt_kms: Export get_max_pipe_hdisplay as
 intel_get_max_pipe_hdisplay
Thread-Topic: [PATCH i-g-t 4/7] lib/igt_kms: Export get_max_pipe_hdisplay as
 intel_get_max_pipe_hdisplay
Thread-Index: AQHcwe6uDDpsmjXYbUaT+hLx3vHnEbXLPOVg
Date: Thu, 2 Apr 2026 05:21:00 +0000
Message-ID: <SJ5PPF1611BC49E39BCD986B0BA29BFD1ADE351A@SJ5PPF1611BC49E.namprd11.prod.outlook.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-5-kunal1.joshi@intel.com>
In-Reply-To: <20260401160627.1338526-5-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF1611BC49E:EE_|IA3PR11MB9183:EE_
x-ms-office365-filtering-correlation-id: 3f3f1261-fbc1-4f90-8c42-08de9077a0f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: UNWLMFbq+ks2Jq7/7iVA3pG53BWhJRQUd6r+W52mphuwZwXY1WLjKRhn8H3AbnLF08O8vinGhtT8fEwwOcRBlpcFfzhjT97jXOXq7zxjO9qS/6q+tvbLvEoOufIj/4NpMn6AKJOlLrXIK3cHB4KkQc7aPnwK7umeqNR3+MvcWRg32JAqFsTKEQHfnDetTRWrQDEsbVDFZI6lgiCiMs/r7NXFWChmogbODLR+woiwb6aKFSOSLPin26qske7dju/d6Q3DAqBB8D9gAyFD5EamJbYp6T8SZ099TKMFRX0/xDLSJ3QufkkbxnR3zggoyVwyypu9WDEq2g8kMBELC7P/Iw//83w1FQcwTdZBSrm2y5HczXz4OZtOBSwig7SNJNMW8bHJ3ErAqCJuAoCBFjx8q+QTJ3V02KRsTm9hxzLS54Iow5T6dVCGG93/dtRPpfzNoLv6jCUJSMXq9kqCZM0a/kxI+Qr5tAXOpNc37Ie4dRl2ssLCN8XtezRVbK2jCZp6YQ0EhVoE6BDJDJ5MvGCYy5Uu20I18z5oKF/+FJcbhNUJAUH6a6PFXH7Rin8QsbgeNVhYUJEgPAQkgZkgqQ6bxCUyE3SPHm67xyZki0ws/9hdxphOT6KrtzF4lEz3CdcZ90XvJf4kurtxDi2dLqZkTZ7p/M3punJemrqU72Ye2jsLrxwOIK/MSvbCRJxLFnrnLTCJH3kacPP1UdUKsqB//8Mo0W9O6ybg1VdR0CVKtRgzAYHiPajp1WXDOnMmfcuMSB2bsXM5N1MHcfoLDvjoG479+sVSo2BJZe7qQIb13G8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF1611BC49E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c5Clx0jzUdZ7Etbh8ATGcilubqr23zucGKsk9LUMhKvICNlSDHLookTAskSz?=
 =?us-ascii?Q?0Hm9jde/bhFXXuavYdZqSY4HdNaCQwMZOCRptqIIGfgNOH7VN2y08cyTewNw?=
 =?us-ascii?Q?IIXxNFQ5VUWzlIISJ6Hh2n0hCFKiJ38533r76Vm8+nFhAozDlfaIPpqdrPV4?=
 =?us-ascii?Q?wt3g1hDWXWhGxbokDi4sUYSA0WrvK2RyZwKs2B/QL2jHzrd0h/IfVo0zbeJD?=
 =?us-ascii?Q?T1b65H9+VdfZcr81cs2LY9F0g9I1XL1rl/yNSaGWXwu6TPzlDr6mxbzf7q6+?=
 =?us-ascii?Q?a4hNW6EBqjA99FUrET/HwDZ61qs+dfhyuK4eAIqDyoUVH/suS/xbtzJsymDh?=
 =?us-ascii?Q?XJIE4vUjpz/nsqERA6YdQFYMjghPDMWrMisH3PVel8bJiMo7IaaM1/gZ0xH3?=
 =?us-ascii?Q?gy7wZhtYkKSBd4oEkH2G3MBq4bvSivOjHI6/Ltp1oI2AkuRdf98OfdVPPP+O?=
 =?us-ascii?Q?vowCldNmkA1gP9HqJb9pM1lr/aR6ly7ixifEp3DWerWRZn+0Hg6MfiIMiP5y?=
 =?us-ascii?Q?ujdrUeqLCn4KPEjwj5hcJYYQQ1cCCI4LgLpNbqvdIjYCWr4tcThwRLM5jH0y?=
 =?us-ascii?Q?tK7mRgIJDjpKnFf21iyYEeE643mWTdCoLpEPrNudri4GKs8D9DhUockWlLa8?=
 =?us-ascii?Q?SvZ2OIVjexVuKLh37OYnyh+sRvPCJUtSRuZIwIRXf6iLX/tvzmr5XJNxnVfU?=
 =?us-ascii?Q?DnWHuxUOjRy5/Pro9nhUwWt9ymBc7F534H5sAzozLkqAQDgJs5IEyXiT8JZO?=
 =?us-ascii?Q?IWvj69BiL+cgspu99ZaXSlIwXZbV2gEPfqaaMAWBYRgSqlSaS+DmopWeFGLG?=
 =?us-ascii?Q?EPRR+wwyTxJMAISxyTN4QVei+sxomOMkgCXntxPsHB8xvPm+15dCuYh6tJGk?=
 =?us-ascii?Q?MEPpLBucma6OA5cHVsXU7MDECDKu0SnaRyYtNTyC7ySB/vo9xwQrcrrhQd0I?=
 =?us-ascii?Q?/gyzC9r/oL3NTTQwWaDhs4o78qXArOhMTf95Lu7MAt0AmscuJjFP3HzK171h?=
 =?us-ascii?Q?LfN7ghgelbMvk7kKqXhrxgzWOOwBiAzfFFydmu9XsYjlRM35hQJIjixzv315?=
 =?us-ascii?Q?Ormsb25wHXZMnVCruSszh8XvAr/fazWSq+ZtilMLX+vuTG8aGfUU4dhp0kkB?=
 =?us-ascii?Q?OiiHj6PIsUduM+Mx81cph6n8j5i4PbHSZWwPPBu0ervYfAVmJupefBeZXNoR?=
 =?us-ascii?Q?OezmA9s97E/p6VqLf1W190z8+dKp2duhLBD7XbxN048xnN1QBqXER8Mgs8m2?=
 =?us-ascii?Q?fn29oknEuI2vlmdkbzgwA6X3Gu3Aw+66HbHQRQVduPgrNu0w08kB+apXPuM8?=
 =?us-ascii?Q?BPkh7yJo4vwqrvi2AOWTaGNYFr8dGEg3ikuxpt0GqYYqWm8/EX8Ot+CKEFot?=
 =?us-ascii?Q?n59EsHYlz5Jfn5G19bL1l7eLpaJj1Z8ANozSRRJm3W+eLvdd48oCeBYQ6qGF?=
 =?us-ascii?Q?8nyg2DqH2i6rG+EREdODQ+ydjjQBfB4HwZYuIeYPrW6WHm/2ANtozD1MhuWz?=
 =?us-ascii?Q?8qpUJS75FqMvAjVMtQF0tPH1Md2lY8UMOFk7124gZ+GHRvNggmZt/rHCL/ty?=
 =?us-ascii?Q?G5vIwq5+iLV3NLtcVlWJheBG6p2QSX2ln9P2XrET0xexM7UggLC5OPdi1X8O?=
 =?us-ascii?Q?RFsYzzO4cF3TIuMl023/JFGPM3KfZuSGyibqhoq5EHxdydp6El4uJ7LPMrqL?=
 =?us-ascii?Q?eIVMlxvFS674yV1Ds+zHpGte7DsJYOHzq4F7kZ3JVqicg5+9EGQHPevL0L6l?=
 =?us-ascii?Q?gAT5wdIRWw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ms96hCCbGjuc4ykuYteJBKo5q2NHnn/dI97yDZ5RskH0AFkNDA2wjTCk+mwVjZ1F2x6FktCy9F2Nq3JVVGqj9eJ0E6G9QJJSLs7e7ozLeQ8cIzkCFbQSLCNwunth+vFBZVm+qDe6zvFKHd5CZ+RnC8VbzCaT4plglwVNBAAmW3MJ/v9+f5NwTXmyIwbx1oon4/MHSWWH92soY2+hvn1TKuLYaNfnV2W3uxOtNRdvjoFFkRZp6L2cX/MFkMhRqbN7CeGNnEybv5+yeFlMHZpB2fUp3DX9wrFSYkSEQE3EmEai8wDt9lLX009f/pSdDn01qZmYDerFwJv+S7zmSblKOg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF1611BC49E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3f1261-fbc1-4f90-8c42-08de9077a0f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 05:21:00.9135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyHtYtG6ogYc3FN+cv7qXmHKwwqOp3WC6oRYvXhZD/+lJn4KbDk4REznSVney6IoQLexxCLuDSnFQ4TOHcQNsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9183
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

> Subject: [PATCH i-g-t 4/7] lib/igt_kms: Export get_max_pipe_hdisplay as
> intel_get_max_pipe_hdisplay
>=20
> Rename the static get_max_pipe_hdisplay() to the public

Nit : * to public

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> intel_get_max_pipe_hdisplay() and export it from the header.
>=20
> v2: Use intel_ prefix (Jani)
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 8 ++++----
>  lib/igt_kms.h | 1 +
>  2 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index dbd419a9b..323446780 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6907,12 +6907,12 @@ int igt_get_current_cdclk(int fd)  }
>=20
>  /**
> - * get_max_hdisplay:
> + * intel_get_max_pipe_hdisplay:
>   * @drm_fd: drm file descriptor
>   *
>   * Returns: The maximum hdisplay supported per pipe.
>   */
> -static int get_max_pipe_hdisplay(int drm_fd)
> +int intel_get_max_pipe_hdisplay(int drm_fd)
>  {
>  	int dev_id =3D intel_get_drm_devid(drm_fd);
>=20
> @@ -6933,7 +6933,7 @@ static int get_max_pipe_hdisplay(int drm_fd)
>   */
>  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> max_dotclock)  {
> -	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
> +	return (mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
>  		mode->clock > max_dotclock);
>  }
>=20
> @@ -7047,7 +7047,7 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd,
> enum pipe pipe)
>   */
>  bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> max_dotclock)  {
> -	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
> +	return (mode->hdisplay > 2 * intel_get_max_pipe_hdisplay(drm_fd) ||
>  		mode->clock > 2 * max_dotclock);
>  }
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index f994d91d3..a9f02a10a 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1236,6 +1236,7 @@ void
> igt_sort_connector_modes(drmModeConnector *connector,  bool
> igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>  			    igt_output_t *output, int bpc);
>  int igt_get_max_dotclock(int fd);
> +int intel_get_max_pipe_hdisplay(int drm_fd);
>  int igt_get_max_cdclk(int fd);
>  int igt_get_current_cdclk(int fd);
>  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> max_dotclock);
> --
> 2.25.1

