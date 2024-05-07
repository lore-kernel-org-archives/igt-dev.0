Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1E4C19F4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 20:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ACC10F066;
	Tue,  7 May 2024 20:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cakF8Dfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFC810F066
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715112098; x=1746648098;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6U1luepxc7dEK/DslmgnZsI1mo755EHd9U/uZyvKydE=;
 b=cakF8DflWtT5zCgzLuQrd5/AU4u86oPNPJ3T6c4z8xjKNyDGF87neWck
 DxLrJDsYHufGUepnVWtcn1Mrn8wFhUZVaUsev9w9rejS+gmkSg5+RLEmN
 wGBDIgmWKiO4bS5M96pVJt2OsYg9282xb5oJJ29AgDnpkZIVQz9uCcf7W
 u3Jm4G3RnWFzuAGp9sIfqjTjELZb5RuS8phhJFQFCVWRNTlMfi+WAqfp7
 Ji2HxFEYazRMTm0qhkPWMPZvoalGzkChlaeCPS2aa/RgYxr2AzXaeuD7f
 p5VWnx3cJjf+As0e3p/XqZ1fpEH6qmR1wbzxHePC0jjThFWeVX2CSkW79 A==;
X-CSE-ConnectionGUID: fAxD2G1ETjuNB2KkQmI1bg==
X-CSE-MsgGUID: 2k7XIzoqQcCHv7negUXoCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11063465"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11063465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 13:01:38 -0700
X-CSE-ConnectionGUID: OqI6vvOFSru0hXPSwa8hpA==
X-CSE-MsgGUID: yrKsiqbaQUqKo3i2MO6eNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33330745"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 13:01:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 13:01:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 13:01:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 13:01:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 13:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaoEzurz1jHIaIw/acELBTk6Uorvt+gLzLvMygs15RrxG1KMFgBjAG6MUDenIxaiFh+eUO0/sOyrq0WHFFlRD48MlkQcD8kMmVwg+eGgzkRPt/2/llGRYNQXTMBMHb3eOOk7gN6/woeS6pVsF2PTYUxbGf8pb0j4i1aQqAhVMMPp+EsRpVW2pkbpLqlI6b9pnXt0EVVaAHDIES4bW6Kf66hr7xqQVR9wo6Ix4VtHzWBhRMvphyZxcXKZdHrRHx+p2PLWKCK6vM7X+nv2Hoofpt7ha+UqpcFGs50WVFprtWxMHehQVQ1/wr7cqw3AZi3eEz8K5yADhVRcrncS+nlvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dK70uG/03U37X9RIMtysPa8UE5jRHPM7rfjMBQwqu+o=;
 b=IFNYLLOl/5HvQg+/IbBk4ZYZuZWikO2YpkfLeenVuQnX1RsBC8+vRsCHXq7yf8a3igaxET0mksyU02oceCgjPCMKKita2IEbLshTqZXN+HSwJa3y6YIPE0PX87CYHF5ARmm9fiFphda/Ar4Ypef41e/itcGGkVpu2alL6ungndJaNkQvOp6WhvqccNM5u3yFaWpFuh3Ib7OpdR/IcKkHr5x2BTKeUwUeqEKXxvcc6uz4FusXuYltvCV9rTmqw1+9aVJO1SYTX23s28+UCe69tefgqCfgKEFcFTrwYElRZOV3GWeTfepibhVb5I0OV6YMeExbs9o52zw4KT7bH6Yvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 20:01:35 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 20:01:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
Thread-Topic: [PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
Thread-Index: AQHaoLQKdwsKwVEIzUCDykENkOfcKbGMMQnA
Date: Tue, 7 May 2024 20:01:34 +0000
Message-ID: <CH0PR11MB5444AF23D878D3F2668E9863E5E42@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <509c80865fe3460ba32ac25b49bb6ed1c40a6b33.1715109028.git.jagmeet.randhawa@intel.com>
In-Reply-To: <509c80865fe3460ba32ac25b49bb6ed1c40a6b33.1715109028.git.jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB5989:EE_
x-ms-office365-filtering-correlation-id: b592fc29-de2a-450d-8019-08dc6ed07f58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?HeRRKGRF43UWcZwo8Q/VKZP5tz38XmC1b+Lb/5CsTpN0e6tZyChy3d0M7Rop?=
 =?us-ascii?Q?vY+XWzMWmOG2pqSGJZGL7ZQwrcHj4Mpvg53k6oB0W+lNO/JnKVtifj+vEnb1?=
 =?us-ascii?Q?OEs9GgnKusUWJrg8TMQVZH5R9gKRl3xXmmKZKrcGSr+BPWSOYILVil7boxET?=
 =?us-ascii?Q?IeLVLiTqRQsTv6fD/aPEktmuzQyexjRek/8uO/ZARuSGC/NqX7Vqv9LJCu+S?=
 =?us-ascii?Q?WVsH8TcbC2CXFJVkNU+fzRDX54vx+f7D8RKbhltvY83vIT156qKrZFJXuCDg?=
 =?us-ascii?Q?0TYdjxo92j85LY1dkUiTO9B2lNLJ5IB6ZWaRovzp9XqqJ02npp2659kF3CED?=
 =?us-ascii?Q?8H1BZdsX4qZSaPdJhu32lXgMBVbVRI7LMKQrb9r/hGNQh4XABwbxHZRZPsAR?=
 =?us-ascii?Q?7ZGsoUCKrYtBHSIbZdeI16Y5iCJemNfF1yf5Nrw8oQo6K4JCnp3nGvJhaMxJ?=
 =?us-ascii?Q?moWm6uQcjT2DFCSalZHX/Q8cyr/8RQB5hJ7D8KitMBootY5qUsrHskxfgPjj?=
 =?us-ascii?Q?WS98BtzMbkihAGlkb8aLiUmmnYdY5Apij3R8CitHGJVVu2q4AU1e+rgCmGIR?=
 =?us-ascii?Q?P8jSo8NLFJRcU2lH8a2OYPm5B2TlnRSGrWXV0htebfpZkJBmaWM6V6Auhi8K?=
 =?us-ascii?Q?e1kxxANtK1qOuVe7UK+SC+VuJFprWTVxAlWmL4Q2LjAAJTbC9vdR6rG+hsVu?=
 =?us-ascii?Q?5RhMgp9KIpKPF4iBg6nLp/K3iBUfkyk10xbCYa32ParxVCyA3wKx9rKdX/TN?=
 =?us-ascii?Q?8RJCWoEzwM+jyiJjaQmBXQjoEPMUDHsTPTaW8u8KHdwLnAyGNN0gVmh5L6u9?=
 =?us-ascii?Q?TizNrtW3ieJhyqO9tD6jTrSnMAuglbKCdIoP7g7zy75a488UitwcPNlF14/B?=
 =?us-ascii?Q?aL7dxPSEgGfUPeA5qtAMEXjftlRS5+/5Q5VaTfUJu+/z0/ocyQLbWa1zwXQV?=
 =?us-ascii?Q?nAfNfZDroYi3BmQCK9GnMXv3zOXe1Xxe55Now1qKdhCKDXG+EEdf1nH1xxvV?=
 =?us-ascii?Q?aXw1RZm9n+w1EqrDdtSScO6X6B5GZY5pOXpcBwNogsuZCCGa5Paf33ttqda+?=
 =?us-ascii?Q?hBPZQMyl/G16tZW7OYTBsweHdTU4pIdhT8yJk5X7FlGRW4B+lr1bLnDUSrgm?=
 =?us-ascii?Q?QWs3UC6rBI5TBOPD7Qa8pN+FVLPqa3Mhl5wiFPIXw1JbaYNCAnDogVLr8Q68?=
 =?us-ascii?Q?uRtYbCr9A8rSfqwngDfC+pDLCOSCZ1c8QpSiqO5RjKjKRwOTZwSShKcAAHPP?=
 =?us-ascii?Q?9C4n1e5hrRlUXa2j21ILtOc/ZckdXF0a8JhstYtrJ6wbCs6jtkhNz+WNupxj?=
 =?us-ascii?Q?MkHchZ11YdbaNsa1FaMnYbFx44MZ3gycZGBGwt75zhxvqw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RxP88amTOBt2hN/Lwssl6QSwHM/D+PqZ7G+6YHDsknP/Koohkpi3MVwkvuIm?=
 =?us-ascii?Q?85Q8zhsUP4YmCkBgXppsbMLEFLLIKRgCMu7X7m8n5uchyI5RtwlGs9/zfooJ?=
 =?us-ascii?Q?CzRdDAqeBxkueDqKZnVHSeR39kjWldcXjDQIJVs6KkaNHLuwy80cm3n/Avbg?=
 =?us-ascii?Q?L1CCQGsdsiC9fUGonwTbONJFIuqw8K42WakLepoFwwgTCF1hNWyTTiPZKr8B?=
 =?us-ascii?Q?d0MrPZLdZxyVCMJ6GZs/dKyt7LAd3EKYdHVwnmOfwfmcxC3O3hoPiKSUzsGZ?=
 =?us-ascii?Q?CdAVu2Zo0A3LGVAaZz7O9Tq0U4ZmbnKv8ZG2nTJneYtqkYd3Aa0cfk94e6wc?=
 =?us-ascii?Q?JS/J58JTlZDAOzhWxV65POPy74RoLyXKd9rDCOUJpqy4iQ94E+eWSoSqUItW?=
 =?us-ascii?Q?fkT+p8/hw2FsNx0erQqNnLm4obZTXi7oWNz9E4v5g6Skv7LJLX8UGeBdZF8v?=
 =?us-ascii?Q?gWAhvl9grH3jSynl9/uIV98xlc6ZK7MkFBUJFNRSYCztZgCh+vYIm0ZuWqAA?=
 =?us-ascii?Q?WY7gqgkU60Q76zCPFJlM0goDDlBFMG8odKIWGyMO6n1imdYbDMeaSiEyphN3?=
 =?us-ascii?Q?+ErNQ65oTEFYsKvwVnmte1m19pT6bimIpmBM7NJWvgWye7rfGyAgkH4uO13z?=
 =?us-ascii?Q?zUvAmQQpvrV6+VGZPDTFli8H6l0nNyNoF76ghThVOcf9mf4mg8cgY5IbfWBG?=
 =?us-ascii?Q?QHkiziSacuh+kmejpUf9tQZfgBYj4BbgBnh2hNei/G9rRDwuHIFjHaU0eV2Y?=
 =?us-ascii?Q?f2Hf3XbE7DOtSMztxaQfZH0upcle/Q8ti659iM+MHW24z2oiXuU6W+LzakhG?=
 =?us-ascii?Q?tCPjjS66pB0UuNoLOugg7I8un6mEXqNVmSMg547s8HcSa+F2nngpm5UH5EZX?=
 =?us-ascii?Q?9HyG4XtsNpyGNm3vWtA0TSFTtStn2Q/VVPfVLlXkYKCYgvOJxFBnjWVR00MW?=
 =?us-ascii?Q?0Ssa0bqk2Y5n92oh5zZ1Ocqx40cqlcPYN3FHpfnPb/a/wv+6O0I+NiYoloG4?=
 =?us-ascii?Q?U9LXE3kSYHdI8HZfZkNAYJMb6qNq/6rZ8ew2+OZYvcfudW6Cd08VNvtqccOn?=
 =?us-ascii?Q?m35uzkkyvOFsUBfNOWsHNCs//iIiOE1+/OtcYMZmcnBXeI9Jss7sKwqzXrpq?=
 =?us-ascii?Q?0oyoQOWHci8x20l6/0QPaHiTZP6SHtOs+WlBrFN2f1LLwxliZCMPwdfiNwR/?=
 =?us-ascii?Q?34JBEHQSwBxTS2aB3whl27AVqLAC+PSRYuhuvtDf8rR860SYIYq75OF8J1eF?=
 =?us-ascii?Q?Ak/pa2rPqj5Z76UYzEyYRrg/vms/6fr6GkVUF9+hC0mvsJaUz8M9Yf71E9+u?=
 =?us-ascii?Q?4hTIKblqYa/IDd3xrT0bZ7npcN7Zu3TZh6rpXJFuAYzpNWx/m4aQasuaA25s?=
 =?us-ascii?Q?ZKPSQ//NA9ttK7dn7M13ExDLjYy4Qhv0xTqipXiP3w6tWDVICSkKEZZh1ms4?=
 =?us-ascii?Q?KJNUUBdeP/Pm+LduuIA+PRuMXdHOed9kJTLpm2A8jBYXJWqrdxe9O7k7x8Ut?=
 =?us-ascii?Q?tDaA0IInKbkagaS582nDR6f0EMdPxqwtXBMV5o/vtEYIfvByW0OLGVbJUfJ2?=
 =?us-ascii?Q?VkmB08oxwStcwIWA/gxf2XxAkO0v/VStGh/NVc9R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b592fc29-de2a-450d-8019-08dc6ed07f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 20:01:34.8134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1zOAWIjbfyxBeB+kT3tFLWj13Ck7DUW8ez25iYwLbu8gOwgbMp//1X7tjjnnL9ASiMGPaqqRniyqnEP0WFasTWZYyqmJGZQ1i4YLRzpHZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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
From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>=20
Sent: Tuesday, May 7, 2024 12:23 PM
Cc: igt-dev@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.=
com>; Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
>=20
> Fix typos to follow proper format.
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/xe/xe_spin.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 381e5e950..2dbd51199 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -162,7 +162,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spi=
n_opts *opts)
>   * xe_spin_started:
>   * @spin: pointer to spinner mapped bo
>   *
> - * Returns: true if spinner is running, othwerwise false.
> + * Returns: true if spinner is running, otherwise false.
>   */
>  bool xe_spin_started(struct xe_spin *spin)
>  {
> @@ -262,8 +262,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>   * xe_spin_free:
>   * @spin: spin state from igt_spin_new()
>   *
> - * Wrapper to free spinner whhich is triggered by xe_spin_create.
> - * which distroys vm, exec_queue and unbinds the vm which is binded to
> + * Wrapper to free spinner which is triggered by xe_spin_create.
> + * which destroys vm, exec_queue and unbinds the vm which is binded to
>   * the exec_queue and bo.
>   *
>   */
> --=20
> 2.25.1
>=20
>=20
