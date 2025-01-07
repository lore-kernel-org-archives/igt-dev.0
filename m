Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B87E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 07:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961C10E1A9;
	Tue,  7 Jan 2025 07:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8eq0us1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3166510E1A9
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736236425; x=1767772425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oJS+Qg0a830ctw4BbhYFCcYywXIQnH4Rg4UMfKM7GxY=;
 b=j8eq0us1N7rk6qLTFC5VqThMuiV3bqgUR1Bb6+zz1Hr3KyhkMbj+C6zg
 XZp051BDpDqP7MUZGbE9w0xcVAnQnB4V8ZtPLEWYo17z2mFfI/cHm6piD
 tUP6cq89iJeKiCQTfqc/46M/rywq2sSCbBJcPe8oMScKauCurKy0pG7cN
 nRcwortsAfU/DMK3d9WqSreitWBQyckLEkyO2+/q+lQnyzaNKt5x81pUH
 aNMnw/k6bA1iWy9wDPOxW5YZx4rO+tcLwTfYaVwzAz68Sz/nz0idns2cU
 GDMY71yKwzSePx2XhzHNFA5AZGIXc3KSuBQuTT9or2jksUTqbDCKta5c1 A==;
X-CSE-ConnectionGUID: CXDVUZnjQ9W5e/zO1msrtQ==
X-CSE-MsgGUID: rrx0Z5ohRq2ecpLEqPUNRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="39226934"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; d="scan'208";a="39226934"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 23:53:44 -0800
X-CSE-ConnectionGUID: XXEwEbxrTXWhlVret9Ay3A==
X-CSE-MsgGUID: OLQY6chVQXCRQz+T2AIhBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; d="scan'208";a="107662459"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 23:53:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 23:53:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 23:53:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 23:53:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t67xHKegYZoZXqmIRbXosDGs9c/hxAQiN4jhWbTyfTYKqs0Vvnoj6F6TLWTmOILb4X/tDYkfxdDT+/GZmIjlWCYSNzgH77HSK7Q9+7RlAx9Jcz/y8bXDCxXV03EPPX8CmzF6+hw+vyAtA2uulKx9HfXukOeeX3PPwPYgbhWHxJ2O0efVrEJwuPPaVLHg+ZW1tK8bukHR8iWc10U2JQAGTGvlk3OqImhvfMbrdhgHxw+E3GLrmfImmpnqsPlyE2ZuFoqhie13+Me9AVUtL2VWFb4JAMK52htjkz5fKkNzm/UM3UPViwJpe0oCQgEVQok22b7MnzkfX1iGdvga2VauwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUf6dm7M4TzUQqIHJur4giWZbFL2b3Hb9c3BEmmreVk=;
 b=xLxy1nyzegMPUaRnfiAYiB1XLqFW8+wAakaO+vADPC9+a0kV0CUs3n22HMXYi1sqULN9s132I4AEdDW41fDSoVKTYQhecyc5tKLDjisnC3u697+P2SX3JX03+xlXSBhwzitanSkhMik5SufiUl+iWfyrvS27sXzAFXT4UT1y3mBEAGT+8rQ5bmvJ1B1CZyTqxg2ePIG56v8AiwKkcMQzh/+DHoCnloVHHSx4Tn0KtQHJlsFx63vsIAGY0k6u4mQ6U5nMUsTDR/Qx7fUmPXuWHkZgBiLZmP6LTHFGQTkTSxfeAwD1vMoCnaeRsoawPdgsQVocxMShApI7vsA600sikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 07:53:33 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 07:53:33 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Garg, Nemesa"
 <nemesa.garg@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Thread-Topic: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Thread-Index: AQHbYCCzyMeg8ydQ00+JuBg3mT45drMJ/EgAgAAhnIA=
Date: Tue, 7 Jan 2025 07:53:33 +0000
Message-ID: <PH0PR11MB48060B2DCFDCA769A5DAC186E4112@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250106095154.243459-1-mohammed.thasleem@intel.com>
 <svjcmyxrz4bc4n3evwcgqh3tfom75qykr6ficl2npsha42mcib@op5fdovzjkss>
In-Reply-To: <svjcmyxrz4bc4n3evwcgqh3tfom75qykr6ficl2npsha42mcib@op5fdovzjkss>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: lucas.demarchi@intel.com, nemesa.garg@intel.com,
 arun.r.murthy@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|IA0PR11MB7838:EE_
x-ms-office365-filtering-correlation-id: 1fa1223b-a693-4135-9344-08dd2ef06272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O5nB5GEHWeOpF6CObKHdg4AkSorWSt+tjdOAq9XuXA6/1/O/YNehjjnC9h8J?=
 =?us-ascii?Q?iRbwZ+IlqqLtrj2NV2dVtGjd6/cuVBDgV4s9HHT9RJ1bDueksoJOBI0qJzZ3?=
 =?us-ascii?Q?cQUFdpWA2YxJ4butxnHlvfAf7WQlWvI4xB2YcigT/2sZhNo6zaAEpeLKa79G?=
 =?us-ascii?Q?89OHaHORvkDP4zU6N4MsW6/y4zKtZSfN54zMPBHwAvde/pHQwz9HvbAS/tXj?=
 =?us-ascii?Q?pwRTSl580OkozcJHFIDLWju66xLhX1tA3CCVJ7Cejp+krrPlLFf50gWqSHl7?=
 =?us-ascii?Q?Q7qvzhtw3Fu34Mc4c18vkrxATNYENDzYruTtaDLDedlAOcd/zCRagDSdjp4M?=
 =?us-ascii?Q?Nhmp8J7wz8eZuja929A8u142VLiYvPQCmDGiF3SRAZTr2KlqzI8EcR+aBx1M?=
 =?us-ascii?Q?lzZHIQBP9GggqUqBFwS50B8lNg+TPoGUhLxaU7ENo3nB/yb5rYHerpdpz0U2?=
 =?us-ascii?Q?J7Cvh3Ym4gdNH30nCp2daWyYKFsTb7iNJ05+nL6yvIiww7nNjQepuLUuFPGF?=
 =?us-ascii?Q?z+3gQz2tz/4KtnDsifJuDWPvHd6PxT205RM59+g0wuAraJvxVGfDAUxOgH7M?=
 =?us-ascii?Q?rPuMuzW8rLBKfewpTqoIoJ4Pe/2vMfrC9BzZTqZZDHv1TMeGGpoNdCt4G/Xb?=
 =?us-ascii?Q?lXx/p1eg6Zn6PQZACFutWTvdYBB0BDfIRgtnXPXbO3i+arNWXS6aoeTCqUBd?=
 =?us-ascii?Q?30SZW/slKyZsnky4feAmRHSCC1YH/2aH8RleAYT2HeVony/pkZNhlADE6z1T?=
 =?us-ascii?Q?QAmshB0gCnE2JMiXD93qTdFQ11IMPuv/VN5O54NvgzVYbHvok4LO/2MSET7p?=
 =?us-ascii?Q?yRO/9xSEPhZDi0GGwTGAzQwQ+tJBfS/jeBoNsjTC+t0qW1wB2e/AtrB0Ml8l?=
 =?us-ascii?Q?VRweojpg6dmNsuoi7OW+zrHcKswWqYuMuQskepLeFpHE9y/wWvKAST1y9dIP?=
 =?us-ascii?Q?kTphic0jpYg86bOIlZcFN9zy/IRj7edhr25GLjhvGFEgOX4a5EBvt8hDbhso?=
 =?us-ascii?Q?dD1FVvoTrM2VN1odEpnmzO6sLfhI7dIBjYnH+EqD/psuRZlUOKLY5VkwGVEL?=
 =?us-ascii?Q?ocJmjXlRpPpjUtT6NA98w6Yt+KGFRYs9J+QzRkgfBvzwPUFqECNMYE2XW3/3?=
 =?us-ascii?Q?aWqodpTHtp53ggDuZa4gXjU6dQwrwYcwUXrtl71mqjbaaEeHCHrz3OGkL+zC?=
 =?us-ascii?Q?w0QJV6JhoS29/s7RfEtfI4WCqeGU5yje3tKCg3J5m7KT2l1GKm7YPG+B5q4i?=
 =?us-ascii?Q?3hvU4hr30PUp3l8N9Nmln6xMfLMFbk4KDQCotNt2Sh8QtWF8FODgVpsWET27?=
 =?us-ascii?Q?RhEK7ufEioFhXHzIjMtdemlOmSIMzfA2I/tUo+Um/6fHOdbMySyPY5BNY8on?=
 =?us-ascii?Q?QfQdxCvQU5TfW7PCLrUGUNnQHaP9VauCyfWEOIGLKDqrZZlegQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zALo8jJ05OwYlPOP9BnOpguZ+ivBj/VTM1wFEjshVj4RKNA7qf/a98tvqZi4?=
 =?us-ascii?Q?A4LXPuX+yoIz+hC796R78SrLrUNSh/OZIKOq9WnAo2JqKnrq2EJHQ3WDiQoJ?=
 =?us-ascii?Q?rAmKxiulOW/H2EKhTO/SHljWZ5ClrrDYUqTyEJju0fCRE4JLwuTsOR+XRvN0?=
 =?us-ascii?Q?4FtdEqXxLSXbM/S6m+1A6Xy+5wiV1y7vq6yNHf6fa6ekpfgNHnJL8mosz8R9?=
 =?us-ascii?Q?EIzxMfmbrnViWKLCpRhYtKiqARflloNNpeN/s25mRYWGvEeLSZNz4GbNn9uv?=
 =?us-ascii?Q?NtjFa9aZn+5Hr17ci17AHeeGKRMKglVLUE6Q/q3yQwKdpakwRK9luNfojuW2?=
 =?us-ascii?Q?u751E5YOk062eXY5beH6Ny1CquM8IRIIFE4qsUKV3t0A0+TtCEOtIuH5409X?=
 =?us-ascii?Q?IuFTHXI7IiJnUgTJ433no5j+pK+wUWWCGiViyzm9YqlhtJk0KRCojstJt0+b?=
 =?us-ascii?Q?AjpboKUpRimvckd84odYIt0bWI3jY1a+vZDm+DNYCm6yQbxx3NCnzyPavfFA?=
 =?us-ascii?Q?mpgIOf/yuVDugBvt4Xiihl96wltf04vjejNdpn5lye3uRt/qM93kKTikadBG?=
 =?us-ascii?Q?+ypLdsnU1wMnLQr56IsKkRahQMEEdbl/NV5B4EQoGJE8OIWi0x1uQMLfQDDk?=
 =?us-ascii?Q?XPwOyonC647VgUXK83arKb2SAinPB4W5P5B9VpaFpIRM41t2IdawOPPb7M8W?=
 =?us-ascii?Q?zFH6Xs59OShzN3U33siwCmrtPyNEwAE31npzCcGSxas3jV5NeyiCZCdG91op?=
 =?us-ascii?Q?f0siOgx1er89Zlvb1xyRIagXSYwoHT6KPoiYDde0f4ELNp+KW8KlLfGm8vLN?=
 =?us-ascii?Q?pvPxucEATs6/24q+u5W98I23X2OLLzJxcuZaRv/cfxvmAbD9NKV4lq7DmLiD?=
 =?us-ascii?Q?khR2eqpUVZiXkOq+XjcrsUgLxOYElJw6BNxkDdPcbDc/WoII5I232v/pH6k5?=
 =?us-ascii?Q?2MsZ7AvLxHCQra3zwyWDSx5FJM5MGzuG8OvIQiKeRYxrNzvOYRJSuMS49z6j?=
 =?us-ascii?Q?RdZwbJt/v0cXzBjKoq6Zj58d3IXX/lOcjw5YvHFdyG6P3oFByi0Dq6I4q8l3?=
 =?us-ascii?Q?oQ3MjHeLKnmLJlpqorY4DNjTuNaAHX1kLMK/n4dkY6Kj+Pr3Qw7qayX55iXs?=
 =?us-ascii?Q?jvwzu9egfwblMe9bSu7IuGraDdb+kWQHmTyvBtutzjVZzoljNlzjtp4nY28y?=
 =?us-ascii?Q?gKMKly3Q2qjw4XsJV7axSyyoIrgcgmpbPxJ1Ue2FotSzD56TSAEl8URvqRUm?=
 =?us-ascii?Q?Tle0nknudTZkUhkEh+iU/MHiaJVSOqcb24xlb97s/98vRslIBCHS/V1Cucz2?=
 =?us-ascii?Q?iJIJ7C6y0Qf7ktd542MHihk8Yl4RsJV9xLRLoKXPu9+bKG5FHaUTUaGw0FeI?=
 =?us-ascii?Q?zO34Ec/qUrE5mJJ9yux0VJXTdao0eepDlotHHCNnRuTXgAHHbraydzH63JwX?=
 =?us-ascii?Q?LrTJZo7yYZkyENiyFrB7KB3wkpD3kKabByEh6171nmVNqSwuijLjyPNEbwkd?=
 =?us-ascii?Q?IFBC567JrJzxyo0/3x6PLSA2UsRB/WicQN67GcpoHsTWdVl2k3ubEwjccO5Q?=
 =?us-ascii?Q?cgBrDEYYw7IRWUvfdWubaksvwp6e5CEABoyrsBGaCVw5EuDAajz491f6qMyd?=
 =?us-ascii?Q?aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa1223b-a693-4135-9344-08dd2ef06272
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 07:53:33.4613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VT6LKAty0sBE+NftekRlvcb080cbNdgfubkbGOUNhet+BbtftGGEp+HhlpGKhxuGa9wlnzn25uwziTIlHRMIKZsNVPxq+f4XZyTYtYmRZUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

@De Marchi, Lucas, As per the internal discussion we have updated the api n=
ame in IGT and accordingly we have merged.

@Garg, Nemesa , What is ETA to do the same changes in GHE lib?

FYI @Murthy, Arun R


-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Monday, January 6, 2025 10:43 PM
To: Thasleem, Mohammed <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org; Murthy, Arun R <arun.r.murthy@intel.com>=
; Garg, Nemesa <nemesa.garg@intel.com>; Kamil Konieczny <kamil.konieczny@li=
nux.intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call

On Mon, Jan 06, 2025 at 03:21:54PM +0530, Mohammed Thasleem wrote:
>Check ghe algo for the function called by ghe igt while compiling.
>
>Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>---
> meson.build | 13 ++++++++++++-
> 1 file changed, 12 insertions(+), 1 deletion(-)
>
>diff --git a/meson.build b/meson.build
>index 8b2a2a64a..96f010fe2 100644
>--- a/meson.build
>+++ b/meson.build
>@@ -198,8 +198,19 @@ else
> endif
>
> libghe =3D dependency('libghe', required : false)
>+
> if libghe.found()
>-      config.set('HAVE_LIBGHE', 1)
>+
>+	cc =3D meson.get_compiler('c')
>+
>+	if cc.has_function('histogram_compute_generate_data_bin', dependencies: =
libghe)
>+		message('libghe provides the required function')
>+		config.set('HAVE_LIBGHE', 1)
>+	else
>+	warning('libghe does not provide the required function')
>+	endif

what's the a proper libghe that provide histogram_compute_generate_data_bin=
()
and how were things tested? If there is libghe available, build is just bro=
ken.

Ideally we'd have something like is done for other libraries.

	libghe =3D dependency('libghe', version : '>=3D0.2', required : false)

However, looking at https://github.com/intel/ghe, there's no such function,=
 which leads me to think this call is actually a typo to something else lik=
e set_histogram_data_bin()?

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Nemesa Garg <nemesa.garg@intel.com>

>+else
>+	warning('libghe not found')

no warning should be added here, like it's not added for the multiple other=
 libraries.

Lucas De Marchi

> endif
>
> build_info +=3D 'Build Chamelium test: @0@'.format(chamelium.found())
>--
>2.25.1
>
