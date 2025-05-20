Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03488C3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 09:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28010E09E;
	Tue, 20 May 2025 09:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BM2hc30B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647A910E3A3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747734830; x=1779270830;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ITj876xH9zlfvvHVg76Ps0Uz36CRMtnEGk9hrP/wyjw=;
 b=BM2hc30BDMcaNckxsbH/tQcxr715vbP/BrS2hPFpgNFCUibbLn5sAId+
 a49m2C9DbaP549S4AlmNGxyo0jHZnRnBw+qdeWQCmDQPOuAermBeHgT6/
 7GJvR/DuZe6q9bVwdkHsel29MZSNjKzwNh+SG0X+p/JTArOQ9/d7v/GMW
 aSmA3ARUBQ9hYvCofLhyKOLbvgRmRNOQJCCDOaWcqNuKz71WwX9S7a2Ng
 vO2rEE7eIRMDRx01xlhkvz+jb/aGJL+5CY/Dmbe6+CxPzzwVbk4c83v1/
 b6lwalj+dqyCBc0UEDdUw+yOj/QLe8tZ4pFNUq5TLDn5GKmFZuESoNK+s w==;
X-CSE-ConnectionGUID: UCX1gRrORTW5ZdqBtL77zA==
X-CSE-MsgGUID: uNP59p1PTL22mLlT4B4E7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61052945"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="61052945"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:53:50 -0700
X-CSE-ConnectionGUID: KlMnYCC4RHipYqW1tv3D9g==
X-CSE-MsgGUID: 0ukUBt8XQYGRkbvoG46FYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139485547"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:53:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 02:53:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 02:53:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 02:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hjg9hEfOpx9knU99roSVpz0dJp2T2Qe2/XBfc/pNW7HZtPHVhEohGwlI7fsyjbNDg0IgdDGw0MO3dfkjI5hDBDpdOAje0sBa9fOPtdr+gzPca3iIxz8wTU0xZgJs47HegMQ0+j6ugLvWH5+58au8GAWreFMCpl9njZbb1eR2pHCPgotW9xl8Cmy1OD+d/+DbWeHxHomXQD+TkA3lk43P+oN2e8KRAAsO22dsBLyI6EgbqKAaOdbMr/H+ICUaKAJI+aWZk4s224Y4+RIeaV9o2BfhyCpYYkwtOzSEdXPww+8cz9eXsh241E4w0yValhe9DwiuZsq7HguL/x8rVqHLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2iyfaHDBf+1do9SymaOKZ85wh5guSpnBB2bT0CTqYU=;
 b=uN+pn14P33zaH7vnxUy2EmyuNwwIKfssE1pxY1i78uh6gAIUWEzcGW5OPoslDooSVfHgAmBSbgblUAAzQia0A6ABgIQt7F19iEL7C/kxNHZbeWXuj959H18lIeB6SMgCz3p8vbuLfTdZspYJViqIfOfiLKmUXl2YKtDsZvEFa8mi48Wqf5NCs4bSTvCDZXnINf07DU8osXYcrLNrryE3Ib8stAseuN3YVkeHwiSItBPQqI854uZUpMLORxU+9k5GE97OqyNNf/DHnTUFJRYdrQ9ql9mPeFq41kXu75kKH5c2wtnqp9OVF0Rw87w4R9wg7CaDazPFczYzZ1sN2Tn46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 09:53:40 +0000
Received: from PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::1c5d:e556:f779:e861]) by PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::1c5d:e556:f779:e861%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 09:53:40 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for
 Eudebug
Thread-Topic: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for
 Eudebug
Thread-Index: AQHbyWxngw3KXNymR0m3Vm6gyIznv7PbRyMg
Date: Tue, 20 May 2025 09:53:40 +0000
Message-ID: <PH0PR11MB5949CC1E6226B3FEF8959798859FA@PH0PR11MB5949.namprd11.prod.outlook.com>
References: <20250520094839.1164-1-himanshu.girotra@intel.com>
In-Reply-To: <20250520094839.1164-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5949:EE_|SJ0PR11MB8269:EE_
x-ms-office365-filtering-correlation-id: 95fdfa93-65ab-4822-d074-08dd97843314
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CaL8SmcORU2CCOAcWNxe3w9xVTNLzTybnKE8gnabaCmB3YxQFWZyzR5vZr/4?=
 =?us-ascii?Q?Xgws84Ms20c59kOfgfFMvyHKv/uq64sr0Fo3VWLxCxzM4GR7m47CHsxB0TM4?=
 =?us-ascii?Q?Kp53o79aSbQOh5f3+4HOQoIL1EjSqGaymmBW/vPfGr1gvGFi/snO3cvijH6c?=
 =?us-ascii?Q?3nMvvzvhR/bRphPxHcgbBUTxxHmm8np2fKBwMJKyc3yfW0R9inoCNPjYSoCQ?=
 =?us-ascii?Q?W+HJjf1KZTGEOia9Fh3qsq3/3d5ce01IlNCNPVsBs53PnRviGjO4Jl558naA?=
 =?us-ascii?Q?PFVYhS6q9EbobX1tUVr4AtNhh/v40cNI6FTpBbDHTJUdx7hGUq75fcm5wScJ?=
 =?us-ascii?Q?0p2nuDocQGol6AYHp+bPeC0iCYRIuHV1TUie8a2hi6TVnQvyGttnNfMZxr5i?=
 =?us-ascii?Q?0T5FPNFMzRMvZS7UU/FUKEJ/zM6QvkD76BTOCec98A52Dm6wGLh8BJIJRFU8?=
 =?us-ascii?Q?+EJy1Xs9QyJB1dpJhyVXZ1/gGByhVavUsRIsK+Qzg1R9NbDasF3jzYvzI9Nu?=
 =?us-ascii?Q?tm3fU4Fj6JlAfk8ACs9R27/heoLjrXa4bIc6Q1ypULpknN2ZM9yrSEz86E8X?=
 =?us-ascii?Q?0ex7J9StUEskZ3mJc+jFEex6x8v8E2c3JyzBPF1/8gPj9h2QjfeGYnqOGllA?=
 =?us-ascii?Q?mFz3ARdW+S5vrQTX5E1/JeSpbam5j5YydIyqb+w3NTBavwnbAmxgwKM/8IuV?=
 =?us-ascii?Q?JzdR8AV6o09HD9On3oe3y3ca4lz3fA9ApwdOOawP/Xu6LInXFZ1/00jBpIkT?=
 =?us-ascii?Q?sQEZCZZHWGxLD2FS1vV0poCee7oxx53sqWDSi8ueGMKq6S4Apy7mGFpmztPu?=
 =?us-ascii?Q?v0ANjnTVU0fYPoq8fVBB/dblIxvOBEsgPQg0fXbeyeVSaEZUGMk2fKnJzc7V?=
 =?us-ascii?Q?dEyvFJ+tfH2xq2BYu3zCU0gR7YF8+tMQzF2AAnuQZxNByp1YgafiEnGGQcGp?=
 =?us-ascii?Q?Dj0zSRpaTOW4F0/b1BXB/puR8cLwmNhtrjYcGqRIDBv/nD+hkCBoa54vWZsg?=
 =?us-ascii?Q?+Vtsg7fc8f2Fw1SGLw9rG2yhx7N7K/QBUqti6TKnNBH1MLwaGQh+p69uwLQ9?=
 =?us-ascii?Q?nU7LA4iCtzD2GsiiDPcmOziuAQZB1iBdEI4ZZIOpXw9BbmwSPW/wC4p3Fxyt?=
 =?us-ascii?Q?wxv/oyubj5KkIohINfX7xfUlUepwBpugMl6I/p2UJa9S4qgY2tAE5A26IJyc?=
 =?us-ascii?Q?U/h94JJVhFNWsOaDQYCjYdZM42/4NS24cfxmEd60yF3CKeTvbCkngYYa6ZGY?=
 =?us-ascii?Q?1DhKlMMKwWWValiP9LBjY9tHD7UEBM9RwYkqw+tLtxcFh321AK6TEHijffQb?=
 =?us-ascii?Q?IiFcLh/AwGObd1iV1ES5N0xG7EAmgQH9b+qx4Pcg1Z5uP4SvAH0ew7UYit69?=
 =?us-ascii?Q?cyGU7U3YmW+wLTQ32zDxIKFYTjOpyn+7Z4x+usOYmrsplp7SfAYVqJrcTJCH?=
 =?us-ascii?Q?+B7PE5lvZPQSRu2yxJMeTAPpWBV8ZQTqyPVX8TT7IUzvqbSkPjZqwk+XpiFm?=
 =?us-ascii?Q?BDl9LlIsxvwxTPE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5949.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zzOyeVsgNCIWBmYGFV2RvjYHZKqL5zJS9z8K2jjN7GgANko/nxJXGxO9te4V?=
 =?us-ascii?Q?IJJIUGDjUtPGK1RLy8g0yvRc/BaSD4XheijYKvxRWcknFBDqoBPdDEl2ZJ6v?=
 =?us-ascii?Q?7BJJ8LOdjVDMZcsH3E4YGquCgvjEAmzGfd5HPu8sdbja0NPMHK1NqpDLOgKF?=
 =?us-ascii?Q?4Wsr7GT4wJh/yqhQUX9059zsuNnpb85ERLlGH+FVnQgBoWkZA3O58/e3Vf6X?=
 =?us-ascii?Q?OCaG//CONmLBViY38cyRw9aqA304koWaTnVhVueKE4NcBYiSojGHhmPMR6iy?=
 =?us-ascii?Q?D+J2EfZyO9GQr+SPcL3BFKauXTbXZ6hCzTH7GfrQ7V97xNjN45saX/96bEp7?=
 =?us-ascii?Q?XSP7CYP3+H+xPwBIGqb08cwFcv4p1yEbvRc6XkbjAIa82DSYUXWIgP79XbAj?=
 =?us-ascii?Q?3NJ19YH6y30zNQCktZnEYnQJpnQnljXJZfoT87ImhuujVix17MdmVcd88VHI?=
 =?us-ascii?Q?8taw/Hdua041P09GV4ghhL9RrWQ5SjkP/VmpHKMeeSY+fMRxIOILG6gpkh2l?=
 =?us-ascii?Q?smPAyGNQnLgbkH7VlOLsENsQz3men0qlih+0jTLTN4LxxHNu571TUaqXIN2y?=
 =?us-ascii?Q?NRcw2jteahyWJedeNrJVlV29KihwaJ/oO1GGMtpVCKK5haR38BK0e0ZE/6Nm?=
 =?us-ascii?Q?xLP75WZGT1v2/p+iXHZAOny6af/Dc9WakTggFOxqYIksbKuSKxYRyvk4vheT?=
 =?us-ascii?Q?YtYMLKfmVbKP/Fd/P0wIyUUV0NEq2gd9Y2B6HyQORmiCEA9oihOKNms6Vxpq?=
 =?us-ascii?Q?3k9k8+06NqEgHH2Qb6OeU1I1MBK0BHoie3h3iw0nM5esu2e99iFa7MHIQiGF?=
 =?us-ascii?Q?ESalG270hs40S2UKIJLTD0DdRK9aENz4mGL1EtgETiu6GfK2nio0MHSv1zQx?=
 =?us-ascii?Q?sGpyyIBqvSfdjRrXdlzkab7Gpho4eBNx1/255VlxuZG8r2AcUQDi0FcdpSzj?=
 =?us-ascii?Q?rhmTjUC5viu2qhSwSdyAhtGbvmiFEVgBusLiWnj7v5nqoof7CYAoY++aNOih?=
 =?us-ascii?Q?bNZGmF8EhlZovaCYYX3I23FlpnqLqw1YTfEpEupao6ZfLCeAl2VUrguR5ryG?=
 =?us-ascii?Q?uEt7tjK1GavE/VpVm2Mlrw8OPiZnKaTZrCy3WHnn8JthLmzu7Ll+sGegCTa/?=
 =?us-ascii?Q?ot21hEz6TUVKZz4zHUnQyo3sRIkS7lm8HElEkba6pNzCQzSZpWoj6lwozvEM?=
 =?us-ascii?Q?dAI/YX/yQp7x1gKiM2symzjee5XTA8lp+NBWbN9bzukiqv5pBqJZbSFfeLlu?=
 =?us-ascii?Q?cZh4bu12NVSD1A07PXjdDIIkPRBXAMNNze3FtXdLX6/x9MePMHAJ/TtsJnhD?=
 =?us-ascii?Q?lAqL38kcpZ/TzlsFlYNDSh58c4ZIqf06lmv9CilQhO/8mzyLl/SJNz1Lf702?=
 =?us-ascii?Q?0p9J++j5v4WP58Lk9JPO2ViT31uVdkfjkxlgvPT9I9Od1T4akoFJDugjIgo+?=
 =?us-ascii?Q?E3orgLUFPf0WNWBTMSL7b5WCWw/BRJoKuMzJsN+3JGQ+mlEZkP+Xmp5l5/RV?=
 =?us-ascii?Q?zlnxwm3TvG+IWmULkeLCWgAoNDZky6MgaYMgiggsINLhjj5P7CjbjG4GJ8TK?=
 =?us-ascii?Q?iwO+9BbfiUx4cKTN57vOq2boNCu23iG5p/hx1i3/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5949.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fdfa93-65ab-4822-d074-08dd97843314
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 09:53:40.4906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K//fu326yMGEvORiMoxRLkVxfJuY5Ml4XNLIJQ3xihc8bPgO4sRAPEI6wpD/HvVZPLoNVj6C/LaQx0WwkRPpNmyLgDZCGby3SF+QroFCgmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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

Add to meson file.

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Tuesday, May 20, 2025 3:19 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Piecielska, Katarzyna
> <katarzyna.piecielska@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH v2 i-g-t] tests/intel-ci: Add platform Blocklist for Eude=
bug
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Add blocklist file for LNL/BMG and core blocklist for debugger functional=
ity
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
> ---
>  tests/intel-ci/xe.bmg.eudebug.blocklist.txt | 5 +++++
>  tests/intel-ci/xe.eudebug.blocklist.txt     | 4 ++++
>  tests/intel-ci/xe.lnl.eudebug.blocklist.txt | 6 ++++++
>  3 files changed, 15 insertions(+)
>  create mode 100644 tests/intel-ci/xe.bmg.eudebug.blocklist.txt
>  create mode 100644 tests/intel-ci/xe.eudebug.blocklist.txt
>  create mode 100644 tests/intel-ci/xe.lnl.eudebug.blocklist.txt
>=20
> diff --git a/tests/intel-ci/xe.bmg.eudebug.blocklist.txt b/tests/intel-
> ci/xe.bmg.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..661e3122a
> --- /dev/null
> +++ b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
> @@ -0,0 +1,5 @@
> +#####################################################
> +# BMG specific blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@.*@.*tiles
> +igt@.*@*multigpu.*
> diff --git a/tests/intel-ci/xe.eudebug.blocklist.txt b/tests/intel-
> ci/xe.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..e13a5cc2b
> --- /dev/null
> +++ b/tests/intel-ci/xe.eudebug.blocklist.txt
> @@ -0,0 +1,4 @@
> +#####################################################
> +# Core Blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@(?!.*xe.*eudebug.*|xe_exec_sip.*).*
> diff --git a/tests/intel-ci/xe.lnl.eudebug.blocklist.txt b/tests/intel-
> ci/xe.lnl.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..cabac8858
> --- /dev/null
> +++ b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> @@ -0,0 +1,6 @@
> +#####################################################
> +# LNL specific blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@.*@.*tiles
> +igt@.*@*multigpu.*
> +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> --
> 2.40.0

