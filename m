Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75293CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 12:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B1710E141;
	Thu,  6 Nov 2025 12:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6YOcpmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C753910E141
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762433959; x=1793969959;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AcNgCX9Jx9jbNsl5dupNJUAjBo+CcfUsgbKv0CyrztY=;
 b=K6YOcpmHOk9aZrEb6y36g3t9QMxIH1af0I/L7qJqhXPkpVPQONlMaB9i
 DWYKE+jL3hVHMkG6NP1AkwJ0XA8G+0hKkQE6QSIZMJACdKxmgVganUf9v
 FRT4BPztnWDkTJ/uluZMt9yZbagzTHKyP4deAwE/WJv+IDKRbrXERcQiC
 wT0PohGM0EmKnwkNY5nzq1GEHRZcYpuorZSCgL3FabbCrSx8XvV0POSpg
 sdnhsuT3iKNZDqalcmrxonCeiJzO3Kpg0uWL4VrRK9uj4XaduzmckvXCI
 z2JeNHrze3uwI9vZqIVye4wHGRYD13o1V0A9T8cRi1a5d690OXzUpLfwW g==;
X-CSE-ConnectionGUID: gA4wWAWBQ++6r5CIKVDcUA==
X-CSE-MsgGUID: dyQ7uE4jShaFOFItdLupfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64603415"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64603415"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:59:19 -0800
X-CSE-ConnectionGUID: 8DKjL4dMRsKIrmi2YwZxhQ==
X-CSE-MsgGUID: TVMjO1jOSZarzUOKUKCF5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192920047"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:59:19 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 04:59:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 04:59:17 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 04:59:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXeCB26FyOSIGZX7EG6+VH3n/1ReJMplrGdvqv3aK0ZEl+DCvEtZtMwwWSD/V2MEjk4hubAKgKwQmedOKMOftYs1ebgpqaY311eGVXaigvJtHKZjZ2pVkMdx1uJf+n12d3o53aDAAv4wlzOqrmtOcf2bClY6QGIqYGi9eu9W+0B8HAa0wGxwua5LRkS0VaQ/GggqP7D3vpjXCknRcvSgSaJRR5bw6vb96uEUpPIkw6mGPQJSqHoBUrUTjEYi1KPHNuXLqOLzuCzMPZgdIiLS9EVECBJJ4bnanliaxWIUgGGUfSfxVHaboYJnlDAeIYo7I4+FbnS6vZ8tBJHakriRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnXwO/KNwpda303VcmLfTInFwq34BU4QNFrMthFd+7I=;
 b=zEFe6yqQKyGzjDYm3rfsiHQq+kgM+5NYH4q6wPF0KS2PQLQ2AbNFaGMPeW7j/qj8jBwVllCaaAXh1RWquMVhaEX53oB6nwUjRwYB7cRrImRlJKpuV8JlCsMmGPD5+DFvovCdNfJRx2DQqJBOJsh0ezza5K/PjzzxQO/xgFeljhr69/7fNNAL13hbrOe/DNx1qF9AecAZcmJ3lu/xz5zSn1/r4QhFTwRApKwQBhElI0l7m8OWfsYLw3xgFCDnTM1ppYYovV1c4PujJaGBXffgQMCuJjjzEsyfR39DdVdsMOpK8i5jpIL8f2TnwXx3DdxFmO0lsQQLvH0cfgG7eBOXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CY8PR11MB7948.namprd11.prod.outlook.com (2603:10b6:930:7f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 12:59:15 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 12:59:15 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Reduce debug log
 level in CI for scaling tests
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Reduce debug log
 level in CI for scaling tests
Thread-Index: AQHcTv7jnX8LmtZxAE2exU/muwxWTbTlnBJw
Date: Thu, 6 Nov 2025 12:59:15 +0000
Message-ID: <PH7PR11MB60537EA6A2F9AC623006C5A9E7C2A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
 <20251106092204.1505129-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20251106092204.1505129-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CY8PR11MB7948:EE_
x-ms-office365-filtering-correlation-id: 41655388-7d40-4049-d797-08de1d344a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?i06eP8gBL//UBUopNic5l1fNK++xnNtjDcRQtHj+cwgFLGmehZMfMtDcI2uZ?=
 =?us-ascii?Q?gHvn99IZ4cERYEGOdh4TePRSkh+eKhQ13pbjwf7TIPdnplkOpSLtxigzTWTU?=
 =?us-ascii?Q?BqWw28nYqShe2hfbCHTY1dEKbUHG7vQZXFvgcvU7U3OLiidCxiqH1ykLwEz8?=
 =?us-ascii?Q?V/siixfBVB3iDvgirU1fSrAT/yBxoCaa3dAyy7cZ00xl+ZD2Auf9CSkLsol4?=
 =?us-ascii?Q?QAkvsPJW3xri/xIOp8tougmExDbh2ANTsgQXltx/AsLIyk0GAIOuOtZqc7Dq?=
 =?us-ascii?Q?kESqrEwfRKOtm3NT2o9JYTKZcoylhGoojCqK7O4aCMylQuHuE/4+1QZI9v8C?=
 =?us-ascii?Q?j6Hug0VloIQUiT1wBEsIb4oajHB6yL0f2LuGh1YtHjcyoIx8C3rhE6DZRwoZ?=
 =?us-ascii?Q?fjsMb3mzEte1JyX0qrEORGGLLrj0sccpNrfafparf4NvIxZkbSco4V2k1fV/?=
 =?us-ascii?Q?QXuIKRKLTRJL8yAxEMek2clHhzsJvXtuuoVVjaxFg6c++5/bSFan4IZPRgxA?=
 =?us-ascii?Q?TAa7Vu8Cjpek0X74kyGVS53VCCa9xlNV/IdpE+XtUbdgcZ6OfQ/F5W7s7HYg?=
 =?us-ascii?Q?58PSLDOWh0Zgbrh3fBr7AsLlDaBmuAF7YPYkhLvO/0oAzU1VWkg385HY6Aiz?=
 =?us-ascii?Q?x7KOwSqqnnxan4J7xMsTx1lvumeWWgSSRuKwr5pGWksORzurH+V+u0D1SYAt?=
 =?us-ascii?Q?ODPcNPT/7USh1woWx1AkAgL8YJr6mAtlf8ywDso1hBohvFfIaQtYg71CWIGZ?=
 =?us-ascii?Q?6cPBBskOTxBQJQGUVuDxxLY9KRD4YhBsZtivutdpxrog1Dk9vH78MGNIKYI7?=
 =?us-ascii?Q?aR9CITWtgGPmOJrPUmountSJn3gMyhU2eQykdJVoTgqn5vYSWYGJP4etHnUZ?=
 =?us-ascii?Q?kPt84fcBIhXOrqJeqcHKHhb+oFlnnRRg52Vy36C2KMnOT8vzFP5P21n0C5Ug?=
 =?us-ascii?Q?5oUKW1mBuqIKjQxt7A2YBnM8wpQp8Rk/7KTMUgemjFzFnM2S20fsQbddLVcz?=
 =?us-ascii?Q?0UOAGDocwFU+62xiLQ8dW/fH/64xMi/r6OiJZawiCTiMBYoCiufxo1wp1hYd?=
 =?us-ascii?Q?qDI/NIQ7I4HhFdLX2tK+RMJfpoCzrTyYyoYbkLaVYvwCieFFULovcwmo3X+7?=
 =?us-ascii?Q?mKAbS82bEqEk75sjPBUbLKmPfbRh1vEq8y+K4yzq/gY1hWINAzLNOp0qoukm?=
 =?us-ascii?Q?ZkdJsU5+QXKhT13Gs9dDwsiNn/KLOL5uIH8H+afEWPkCYfVsy0ASzUc5WZ22?=
 =?us-ascii?Q?iGhhVi0hZthIoQotAdD1Yh/wBhyt6xfPDejKE10vBVM4SI4V5Fttr/0rEibT?=
 =?us-ascii?Q?OaQ8F3fVOv0aRRg9+bGWtv3eMDCdyv4QMxaupVSqbRZn6lu3fI5v3Wob73ud?=
 =?us-ascii?Q?nPuwn2fmiSBXKhRJhZTF2UsncglmgiHejJxwIUJ/4gWQiO3JcQmF1htgES+Q?=
 =?us-ascii?Q?Gziv+G9GQxGvhsVCE/oLsgXsHYi+PAy5mWricj0nxHKJCmcP1ZDvYp5eG+jp?=
 =?us-ascii?Q?cUl+D9/308ZCYDS0VMk9cqRNJ2lzUJVKMz6T?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d9DFgVAh2iYVnFwfiQ0HIUw/Ch/0Bj4K3vKQSnSQ9z33wMgi0NjOREFQZa8l?=
 =?us-ascii?Q?G7gHRx/JvJAP7oXROjf0wGO7beRHFJHNNowTsmylo3T6s8TQ3xmcNRDg8kLd?=
 =?us-ascii?Q?skiOKnxYMJwgfDoyUd77LKzGbsXr10Tm8OnZ3KwXu99Kc1UyfO/2+vC50M5n?=
 =?us-ascii?Q?fqT4muLIt1hmNUhDcEnJo/kCBhu6ns1YlD3odhZc+8zqq23/c0mT06Jn9BZ0?=
 =?us-ascii?Q?WWShkJJF40FSJsxZqHC03nE7CxTva1o7NkSXH6uLWSd5sI/ERlX2o1+fkMfy?=
 =?us-ascii?Q?f2XxmkRICck7adC95ILelWW9yNrPfhrPr6+DpLwjWExDcnW2JKzaAgXGqkfD?=
 =?us-ascii?Q?eAo7MMgKH2fxIt+rBosSs59EDhTUi3JFjvk6QnRQlmr3NB6GC65sgk72t4+Q?=
 =?us-ascii?Q?SJkSnn5ISlgVPB6/kK5uUrPFAZ94dISyodhg/13jscsWLb/PhO4XRFriQIJh?=
 =?us-ascii?Q?LuKxYsJPCn6OIs23DNcs9QD73LFM31RDGBmnT4jEsmLXvsTSTe7VQ4QKN3Qg?=
 =?us-ascii?Q?JX2zcrAbmF6Vwu0gSvBlGkICTZVINwSpHDTMAduYq7IiaF0JNtCcWdlqAbGD?=
 =?us-ascii?Q?DY25hiPJDOjEk668I3RQtrLi/i/EQO/hN9rMNTqa+2zTHpNzoPN05nheWh3j?=
 =?us-ascii?Q?af1cxtQJQNmfEvSTUTMd1J3coAISS82VcCqi3HZHaXpBoxOzSFmOJkGq99Kw?=
 =?us-ascii?Q?blA4AK7oa96rAwJPrxBM01D0aTMCZW6la3XLTXd+sA/Iw5ZGGND+hkJIGoBY?=
 =?us-ascii?Q?GGGabs/lua2saQg9aWRQUAIy4THGODTrXtt1i8JXp3UJK6zNI4O2jL45HP5U?=
 =?us-ascii?Q?hMnJEuh5n+3X45dfaveVRz38lQn1BkIyVAZikxNHcczipa1f4qmwQaBgtXQx?=
 =?us-ascii?Q?Gy9Y4pA5p2JU8iT6ghUhOdXKlQRatDdoU5goWXPDEYp+Y9m5ifandOEewcx9?=
 =?us-ascii?Q?nvlTd8rWgZbdGp3NG6hrJxP2XoJHzhFYHBQIWRMH8uWrOsrB2KgbUkMO6Jg7?=
 =?us-ascii?Q?KPqp6zHl5HeyQf7JOOIlqjXJJ4Qg5OmrUmwk3XezrEsY4og5KqJAlIeoKfxI?=
 =?us-ascii?Q?ViW09BHmEzYeFVQOstlAMxQj3h7IaYWqBMAP0Equ/YppdsC+i/uuPsyXyWtv?=
 =?us-ascii?Q?fxUQfBjjgkaRZJjMPleDcvGp6iOa0KbIAcNN5rScDZRs3mPJN3eaZdZlPynj?=
 =?us-ascii?Q?uwjOyGt0FJ3Lhym4x0tMNhLL1N+8DEHVIqP2Tlt/bAYHnjh1Wy+QzMg4jvgr?=
 =?us-ascii?Q?WPdLhkeLbMlla4lPpTtbUH4hfZuESzybjaKugXfbdVVwFf5hsXOjTJrlbzqn?=
 =?us-ascii?Q?lGw1vhDCOoLXqdZs8XYd6Brynd0eFDJKsCdKnMPKQY5Z/p0YPPZYpDwJNn3o?=
 =?us-ascii?Q?jUQWNGVWGbtR+jU4ooDd4JQOyp6L3fF5ANo0ouhHYIaihZzm0IBAT0UAm9FD?=
 =?us-ascii?Q?JVtEr2PgyRDOeJmlst9xxx5q2/qLvACgVfX2wZfIV2tM+AVZ7/rcd7HMo0SH?=
 =?us-ascii?Q?1rjVVdP/8lOhFqPqwH0CSCD1z0uCmgJkB0p5AjYC8APxpKzbkac3w4Unh+DV?=
 =?us-ascii?Q?ZDbPTLKjTC54KPoaFgJILW2zZvQdi+PlHcmqLeeI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41655388-7d40-4049-d797-08de1d344a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 12:59:15.2794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2j48A/62+cuCffTV/wIcMFTJYSIPVVrwZhIy3Ww4sliYkAGeKyNHSs3ETJbFM7fuaG+gmj0ARX86mFV5EArYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7948
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

Hi Rama,

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Thursday, November 6, 2025 2:52 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Reduce debug log l=
evel
> in CI for scaling tests
>=20
> Reduce excessive logging in CI environments when multiple outputs are
> connected. It prevents CI runners from exceeding disk usage limits.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> ---
>  tests/kms_plane_scaling.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> 63d35d76b..34c8f8a64 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -32,6 +32,7 @@
>=20
>  #include "igt.h"
>  #include "igt_vec.h"
> +#include "igt_sysfs.h"
>  #include <math.h>
>=20
>  /**
> @@ -1358,11 +1359,15 @@ igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		data.devid =3D is_intel_device(data.drm_fd) ?
>  			intel_get_drm_devid(data.drm_fd) : 0;
>  		igt_require(data.display.is_atomic);
> +
> 	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>  	}
>=20
>  	igt_subtest_group {
>  		igt_output_t *output;
>=20
> +		if (igt_get_connected_output_count(&data.display) > 1)
> +			update_debug_mask_if_ci(DRM_UT_DRIVER |
> DRM_UT_CORE);
> +
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
>=20
> 	igt_describe(scaler_with_pixel_format_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].na
> me) {
> --
> 2.43.0

