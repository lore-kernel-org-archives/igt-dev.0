Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6449D3B7D8
	for <igt-dev@archiver.kernel.org>; Sat,  6 Dec 2025 18:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099A410E155;
	Sat,  6 Dec 2025 18:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaffYsMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AEC10E155
 for <igt-dev@lists.freedesktop.org>; Sat,  6 Dec 2025 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765046930; x=1796582930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+xJEpzWF/sUYbHxmNYilXC6SihKXvJF2UYLinZaKfqo=;
 b=EaffYsMmSGUq6CFA/oZD0yUygtxJ+gL2iIpfjIZtC8IsOVVp88bOu+Pj
 qE5FIHvuLxvJfMn7QYICJjye7IPDUg92nACN7dwmMXrbkWxDfcWB6AJCX
 Fna4QZNSKt5aJ2RCmmd1Ox2aPnV4JmNsM5sF/lTN6w9qBBZxWSWuT8Kga
 9R+bVe6Ivj0qMHWeLWpR9E2LMhIYLdZ7KAgBLDedZk9a4VrMShX/TjBLT
 cO5tlbHD7Sq4qRP2i1ciggSEcs6rGpcnV4YPzQW1ws/CwQq6WDEAodHg4
 2NQ3xrvlo4aYTjJR/fq/w+lCbTclMAoF3vk+IfQWOXr9GSFjOjg+DA/dK Q==;
X-CSE-ConnectionGUID: 1DvoiQBtQgmfPbaL84lyhA==
X-CSE-MsgGUID: jZ9iwQufQQqfwFj1cujwmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67215138"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="67215138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 10:48:49 -0800
X-CSE-ConnectionGUID: 6w1tU23+Q72fcPyJkCwyvg==
X-CSE-MsgGUID: aRR80+iwTPmhXNQBGnYGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200703846"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 10:48:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Dec 2025 10:48:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 6 Dec 2025 10:48:48 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Dec 2025 10:48:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkQX+7n59K+rkKVJgdDUc6zu2nTqBDeROspMwyzx4Qe7JNADRFe9PB2JxyVJOqiH9RtNdfSzUn7EbzXf1jOj4xUlVzHyA8cyf9cUMXnAmz2YS9j1IpGTq/R8aZ9M6Rv1hrbRYtgNKSJGF92LMZy/S877EnX1M5snFvU0S5I22mxY5y+wZhFzrDthAHbZmMhB4djwzjIzI7WFNSrPaWE15J2IYz6Y0b4XruyjRfW9AXK5FQLdhocuYgRVaknIQLLX7eQYahGXDGW92F1yKANA5hyWqOYZfOIuT872UnOtF3pHu/LK8seHnReOM5dIyy733b4C0ay7w9NmEgMfuTSY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZrZVkIlqUIxckXW5vh6c4DxE+pxOeduzm76fjj5+Hs=;
 b=kP5doLYdeHPf79l5SRCM0glhu3ylLc+Pczzgi1KV41sDYCDYIzsbRd4t2CSRG7f7jD8hpH8uHlkoJI0Sv6SwpL9AiaReKKeVgC6u7bO04YZWyF21XkkoFglFoJgc8g7OtDxUuwyT9F6syEq+73AjnaPKLvtaA3TeOkRKYyc2f6B120FBVjdb5WzrjEScqhneUoZlqCGnOfOO89LsN0CEUfkR0BoEED72ZbGyLYBhV3SJjrL50l90a1rJ6/H3CS2BM1lHKrBgIS5g1AjYYzT4J+aeBLrX6vNHJfoWdoMcXZB44AWIcDGQioT/1rUOLtFuWfpWl53eejiyDYmjyWOcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sat, 6 Dec
 2025 18:48:41 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9388.012; Sat, 6 Dec 2025
 18:48:41 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Topic: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Index: AQHcZk12v0N7tRyChUOp7uZdC3zyvrUUBwdg
Date: Sat, 6 Dec 2025 18:48:41 +0000
Message-ID: <DM4PR11MB5456EEADACFB56E39B95FB96EAA4A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251113070502.2148615-1-x.wang@intel.com>
 <20251206011241.67825-1-x.wang@intel.com>
In-Reply-To: <20251206011241.67825-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB5946:EE_
x-ms-office365-filtering-correlation-id: 258143d7-64e8-42a4-2267-08de34f81358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?aIe44XTbQS7n8iMWdy0Zd307/8RpEbOlDQZYb5OoJUfC2MUKEN7501Hq4kx3?=
 =?us-ascii?Q?zyhHAdcKLA/+jBrNB8eqsUY2qeLt0UQ3FPKHVJfNkXUWI3cVt5YTGrAw+0V4?=
 =?us-ascii?Q?Z86cjhD0KtD6I1A0yQ1Nz8nG9qpePe592i9YN0pUB4STBVm3QarhRbEyk6zV?=
 =?us-ascii?Q?cFF0IPeIPX9p2doBjhR8OerQ0KbXw/XPdAjD4+SaPiXiCWiPhoEJTNwbztZe?=
 =?us-ascii?Q?zS78haUHVVYNLCt7gHmcZ96f4KZFmvT0iJK33Oc7MQgE9MvYqLDg+c6RvOaT?=
 =?us-ascii?Q?FSnYJQ0H5ynnpX46nUag5H46M0Ppu01TXME9FoNap3AvGJS9u1TsjoLeYTFW?=
 =?us-ascii?Q?ZnXsXdvEm5/y9cZbLL5Hwzyjj5iS1gRDj80tVT/eq3R8JLk48Y2c3zaUC0y/?=
 =?us-ascii?Q?QIWb2jJYVFnAHGTA2hKnJhMAcAW+vDEgfMsnws6bf5XqC19W1e1tj9Jm0/X4?=
 =?us-ascii?Q?fzZsJTj1z/NnlfPStObCmCaOyFh5qSFox/JAs/4usoBTs15BG/ZehRuc+SOy?=
 =?us-ascii?Q?MpVn1fjZs5NBes2/ms9uaoir/VwqOangTVORUgVnlRz9wqA6gWmPlYMNImtE?=
 =?us-ascii?Q?uG468aaNVB03VjRpEuqCehQ822sTrFg+blm3ifkGfovH8MLMcJDeLzearh1q?=
 =?us-ascii?Q?mAajLp0r+5mUrhQL5UiWmcw/r0JsT/k+vEyjq4gKXhYz52dIhS1yn/lDkD48?=
 =?us-ascii?Q?omjLwhIPXWXk3dlUJMBpQ1ZvagOv02ncZafuuOGfbtginSpV5MFEOvbymytB?=
 =?us-ascii?Q?qNE4S/6phRwbARE0sMX09lwSy5jh8dItbt3+sdFPx2ZaQSCI+C+oEnBTNv30?=
 =?us-ascii?Q?52utkrUqujw3AUAc4z0mX97ZetPbKwjo4CL7ONKxz+7A+45aTWlf8IlD3GtZ?=
 =?us-ascii?Q?OcL07dc5CEjOeAVbxH3GuABwkHr4Mq68lvIxGCBgA1HO0WfbSfk5L1jhCzq5?=
 =?us-ascii?Q?45p2OJStO4FyMmPgnUMyN7cGb4J3HXgn/vdaPcLhRRnPxIsIGsyvizjkpjcE?=
 =?us-ascii?Q?23rU2WBZf8yAvXTQ1H+C8Rpl8a6jcFAJFdO/01BNoGf7SE7LEw7N5vA11yOJ?=
 =?us-ascii?Q?f1JfwBEUnPu6pwnfGOBs63mKnflDIg83gtpWh/WzDyH2dioXq8Gacm9AH43Q?=
 =?us-ascii?Q?luzdy12P9sZ0qRslPSDqz+3BQQptZqhm5i779a6v+76aY1yS2egrLLNNnBJI?=
 =?us-ascii?Q?mnwdM5m+7kkntipPS1vxE2If+j5rVEn3jbo7QvQBHN9leI3eCRRSJmupaPVx?=
 =?us-ascii?Q?6n+RBio1qTwJhyQ7GTRKCKW6DXH9sgn06D8vFi06OKOzJI0cXCB93vE/ILxS?=
 =?us-ascii?Q?7GNwNU88SSzZVXea7Qb9sOJk9ZJoih5jwZA8T4DynZ8arjJzpadeBur/YkVu?=
 =?us-ascii?Q?VpRwc1kK1JSm0EwF9xUNPBLuwF+b0yM72U6SIbJ/secu7a9pEQMpgOajQpnR?=
 =?us-ascii?Q?EM5PdKBuG0MJyMaWecsyP1L/KdDy9QcHzQx4PIOcKp98IOgZ4xt1VIqiS0kz?=
 =?us-ascii?Q?erMLkiaA3y1FXIo36sMEl/qHYuuB4NEDjTy0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5DBYKjVeukOghbrNutR3l0ahSjPjyBy8b9lk0dFzvxcg7uhZJXpkCT7P4800?=
 =?us-ascii?Q?Y9PaBRj2+pjPTcGfw+xsE8s14o9+wPb48iIKTovc25Dq/UBwkxHxcikEpI49?=
 =?us-ascii?Q?ZlQp6xv1FgseqJlb7RYsV76kAopMBrj+F/K0Y677qzPpnR0GxWEioeJYIABk?=
 =?us-ascii?Q?KEIMwLIfzkcqkGXQHYESJA0VGjwwdtcf8AsNZo6kH/UtbUFzgtm0rUvFkWsJ?=
 =?us-ascii?Q?iukdnjzCaIS4sMZFsEEC4QyOBjSvzrH+x3+PhWgB+7T+xqnpTp5ouTcdxgrN?=
 =?us-ascii?Q?mETzYjNr+MxldfyMxNq1KJn8/lxNQzGw7efxwqQnDWCeGKZvPBMq6stlMKOA?=
 =?us-ascii?Q?ZjK1JZVunAEZv1hnm54RgyJ8ONJztTdaVv4b18IGF9ybJWySWtEA8E89usvK?=
 =?us-ascii?Q?QGchsljp7LOTRF/65/so7C4wYawv1+GnTIEL0/QMHSugMeM/J91IJd1YsV45?=
 =?us-ascii?Q?V6C6+39jegVQ1xH5ZzmT0tpggLscD7cv67CmGsE9KxcXEJTLkWUPEoNRmji4?=
 =?us-ascii?Q?wnGti8JDheD7m7A4Vr0K32CeGLoNZXsJB2GBJPWmwZYi1cKtMn6bcgsFSlKn?=
 =?us-ascii?Q?pkHlm3cha0ycd1jVvdNErV8/WjO5tXT3UxGeL1+nPdd9kIuP73/Wo85MAjqd?=
 =?us-ascii?Q?8gQeTeYtJmIrzaE5kLYKgp8OjMOtgOZ2EXGoYoNtl3n6+PK3DXtL/a4O2/ef?=
 =?us-ascii?Q?WWLIyydv5xvyvXWCVU+kPrhkk8rzM9fy2I0chsu2CQbetoj0p6DFk2axYO0X?=
 =?us-ascii?Q?YBqbGodxww+kWDtixXUKk+FUvY+0crSm3a1l9Me+vcV053wWUaIYEoGC5qxJ?=
 =?us-ascii?Q?gXDEsXEF83HSF7kI9fXZTCWq6+7uKYhl7ZXYHw5awc0y91d0tjmvx1K0h49n?=
 =?us-ascii?Q?PpMFXr2Fx/TIxUucG4bRn7QU0WDA3sh/6jH1Ypw5zl0b9KtQbExKWO/R/+HP?=
 =?us-ascii?Q?2TLzi36DSF11A6lTTzVHpWzOHRyuHzfRFVU3bxeV76fZ+FyKk+Gf9t7RxXQn?=
 =?us-ascii?Q?fxAmBO6NAn6sg0CRQmSc3fDSUZAnoo1RaEM7YpDBzTMOhBcphU80an9UrucR?=
 =?us-ascii?Q?6l2FvwpTyOhSFiF5zUCcfDkuV5mYtjpDnsTrI/uTlyrKBoVnsTeXVCwX/vQn?=
 =?us-ascii?Q?2cS+wBzaq/44TTCweQldxUTT20SIRYniUjpujmaHY/gq3rWZ2iWcm066ZrAi?=
 =?us-ascii?Q?f8UYnqUQJoIPCIo5K7IvVbfKAuuRB8LsYcL6Dq2U2i8nE7i3Ru/d1rbFDBat?=
 =?us-ascii?Q?5QpTZgZVmdXH5XylEOnxpoC/T2nGkLSzn2Dl5pgbUfLb7D3KbR2sjvdeIGGb?=
 =?us-ascii?Q?nHdjQmfe+eqKx+wzJIiqg0T6vL8bUJCri4oTZjO9dPDJhBEDln+X1oLU0Lki?=
 =?us-ascii?Q?IJ1FS9gFZSYn0S8ljVId6XD0O9oFFc5Q1zkXaLBcN9QhLOZsapY+ylkLun1P?=
 =?us-ascii?Q?01XlXWpmMt8AzcyfrE32Ix4rcmNPhz3qVOOtIVye0tDa/JiUC4iDse0yrrNP?=
 =?us-ascii?Q?dS4mNGoAjpaq2sS4X/Hh5iMhSNBAhszYmlJblUnhiGW22AiJRz3qnADzW3xD?=
 =?us-ascii?Q?uvlFlmd+ckC1vJmSllK1/yQLPJyj+br9nK0uMYkn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258143d7-64e8-42a4-2267-08de34f81358
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2025 18:48:41.4245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BV8cUdhUQ+JotyKNEPY226RYtGiBXU/HQcXGtQ9vKqt12mdO4Sd47BgpbHX0nDijuolKVSDJWuTg5vobpeb7Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
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

On Fri, Dec 5, 2025 5:13 PM X Wang wrote:
> Parse the PAT software configuration from gt0/pat_sw_config instead of
> relying on hard-coded indices.

So the lib is not compatible with previous kernel that doesn't have sw conf=
ig.
Should we keep the hard-code as fall back?

>=20
> Expose xe_get_pat_entries() so tests can grab the PAT table.
>=20
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_pat.c | 126 ++++++++++++++++++++++++++++++++++++++++++-
> -----
>  lib/intel_pat.h |   9 ++++
>  2 files changed, 120 insertions(+), 15 deletions(-)
>=20
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c index e3588110a..2d204e652
> 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -6,6 +6,7 @@
>  #include "intel_pat.h"
>=20
>  #include "igt.h"
> +#include "igt_core.h"
>=20
>  struct intel_pat_cache {
>  	uint8_t uc; /* UC + COH_NONE */
> @@ -13,27 +14,112 @@ struct intel_pat_cache {
>  	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
>  	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and
> later*/
>  	uint8_t max_index;
> +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> +	uint32_t pat_mode;
> +	uint32_t pat_ats;
>  };
>=20
> +/**
> + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table)
> +software configuration
> + * from debugfs
> + *
> + * @drm_fd: DRM device fd to use with igt_debugfs_open
> + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT
> +configuration
> + *
> + * Returns: The number of PAT entries successfully read on success, or a
> negative error
> + *          code on failure (-ENOENT if debugfs is missing, -errno other=
wise)
> + */
> +static int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache
> +*xe_pat_cache) {
> +	char *line =3D NULL;
> +	size_t line_len =3D 0;
> +	ssize_t nread;
> +	int32_t parsed =3D 0;
> +	int dbgfs_fd;
> +	FILE *dbgfs_file =3D NULL;
> +
> +	dbgfs_fd =3D igt_debugfs_open(drm_fd, "gt0/pat_sw_config",
> O_RDONLY);
> +	if (dbgfs_fd < 0)
> +		return -ENOENT;
> +	dbgfs_file =3D fdopen(dbgfs_fd, "r");
> +	if (!dbgfs_file) {
> +		close(dbgfs_fd);
> +		return -errno;
> +	}
> +
> +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> +	while ((nread =3D getline(&line, &line_len, dbgfs_file)) !=3D -1) {
> +		uint32_t value =3D 0;
> +		char *p =3D NULL;
> +
> +		/* Expect patterns like: PAT[ 0] =3D [ 0, 0, 0, 0, 0 ]  (     0x0) */
> +		if (strncmp(line, "PAT[", 4) =3D=3D 0) {
> +			bool is_reserved;
> +			p =3D strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) =3D=3D 1) {
> +				if (parsed < XE_PAT_MAX_ENTRIES) {
> +					is_reserved =3D strchr(line, '*') !=3D NULL;
> +					xe_pat_cache->entries[parsed].pat =3D
> value;
> +					xe_pat_cache->entries[parsed].rsvd =3D
> is_reserved;
> +					xe_pat_cache->max_index =3D parsed;
> +					parsed++;
> +
> +					igt_debug("Parsed PAT entry %d:
> 0x%08x%s\n",
> +						  parsed - 1, value,
> +						  is_reserved ? " (reserved)" :
> "");
> +				} else {
> +					igt_warn("Too many PAT entries, line
> ignored: %s\n", line);
> +				}
> +			} else {
> +				igt_warn("Failed to parse PAT entry
> line: %s\n", line);
> +			}
> +		} else if (strncmp(line, "PAT_MODE", 8) =3D=3D 0) {
> +			p =3D strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> +				xe_pat_cache->pat_mode =3D value;
> +		} else if (strncmp(line, "PAT_ATS", 7) =3D=3D 0) {
> +			p =3D strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> +				xe_pat_cache->pat_ats =3D value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) =3D=3D 0) {
> +			p =3D strstr(line, "=3D");
> +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> +				xe_pat_cache->uc =3D value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) =3D=3D 0) {
> +			p =3D strstr(line, "=3D");
> +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> +				xe_pat_cache->wt =3D value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) =3D=3D 0) {
> +			p =3D strstr(line, "=3D");
> +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> +				xe_pat_cache->wb =3D value;
> +		} else if (strncmp(line,
> "IDX[XE_CACHE_NONE_COMPRESSION]", 28) =3D=3D 0) {
> +			p =3D strstr(line, "=3D");
> +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> +				xe_pat_cache->uc_comp =3D value;
> +		}

What will fall into the else here?

Shuicheng

> +	}
> +
> +	free(line);
> +	fclose(dbgfs_file);
> +
> +	return parsed;
> +}
> +
>  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)  {
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
>=20
> -	if (intel_graphics_ver(dev_id) =3D=3D IP_VER(35, 11)) {
> -		pat->uc =3D 3;
> -		pat->wb =3D 2;
> -		pat->max_index =3D 31;
> -	} else if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 30 ||
> -		   intel_get_device_info(dev_id)->graphics_ver =3D=3D 20) {
> -		pat->uc =3D 3;
> -		pat->wt =3D 15; /* Compressed + WB-transient */
> -		pat->wb =3D 2;
> -		pat->uc_comp =3D 12; /* Compressed + UC, XE2 and later */
> -		pat->max_index =3D 31;
> -
> -		/* Wa_16023588340: CLOS3 entries at end of table are
> unusable */
> -		if (intel_graphics_ver(dev_id) =3D=3D IP_VER(20, 1))
> -			pat->max_index -=3D 4;
> +	if (intel_gen(dev_id) >=3D 20) {
> +		/* Cache parsed PAT config per device to avoid re-reading
> debugfs on every call */
> +		static __thread struct intel_pat_cache intel_pat_cache;
> +		static __thread uint16_t cached_devid;
> +		if (cached_devid !=3D dev_id) {
> +			int ret =3D xe_get_pat_sw_config(fd, &intel_pat_cache);
> +			igt_require(ret > 0);
> +			cached_devid =3D dev_id;
> +		}
> +		*pat =3D intel_pat_cache;
>  	} else if (IS_METEORLAKE(dev_id)) {
>  		pat->uc =3D 2;
>  		pat->wt =3D 1;
> @@ -96,3 +182,13 @@ uint8_t intel_get_pat_idx_wb(int fd)
>  	intel_get_pat_idx(fd, &pat);
>  	return pat.wb;
>  }
> +
> +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry *xe_pat_table) {
> +	struct intel_pat_cache pat =3D {};
> +	intel_get_pat_idx(fd, &pat);
> +
> +	memcpy(xe_pat_table, pat.entries, (pat.max_index + 1) * sizeof(struct
> +xe_pat_entry));
> +
> +	return pat.max_index + 1;
> +}
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h index eb48cbc65..1d6c4f1ad
> 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -6,9 +6,16 @@
>  #ifndef INTEL_PAT_H
>  #define INTEL_PAT_H
>=20
> +#include <stdbool.h>
>  #include <stdint.h>
>=20
>  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or bet=
ter
> */
> +#define XE_PAT_MAX_ENTRIES 32
> +
> +struct xe_pat_entry {
> +	uint32_t pat;
> +	bool rsvd;
> +};
>=20
>  uint8_t intel_get_max_pat_index(int fd);
>=20
> @@ -18,4 +25,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
>=20
>  uint8_t intel_get_pat_idx_uc_comp(int fd);
>=20
> +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry *xe_pat_table);
> +
>  #endif /* INTEL_PAT_H */
> --
> 2.43.0

