Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158A6C36001
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 05:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE4C10E10F;
	Mon, 24 Mar 2025 05:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJxm8PoW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BC510E10F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 05:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742795025; x=1774331025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y50FOR+XjWZElaYj/FmeICMfec7NuEvupI57D6SvVvk=;
 b=JJxm8PoW/iN4U3nzXID0PCirlaaao1yqmOkXgGntn8IPirGkWXYdHuyO
 vbJAilf/919sCoBlXsaMycpqid/fNs+2S3pcpwrp5xE8yDN45oMfeqEg9
 6sz5+7kRZnfVebzDu/om3HYU/PjsU2kOhj0PEiKq3/joLBwyS8UzyDKjP
 KrtLgvIU11d17FECC7PqWlew3exY5jhhvwCju3Z0Ae+AKNabfunLgJ4KF
 KUYqF4PCmXmVfR6O1RLG5w4YzFTpMTpmQGxP9A+3Z6IkVxZJT0hdr9J2/
 BJMm7YhN7U0Yp7FRrvA8qKV3dwx5qy9BdJlJfq6NFzvQKHgrdaM0H7vkW w==;
X-CSE-ConnectionGUID: Yhkl/4d0SPOZl8Z2OnBPSw==
X-CSE-MsgGUID: KzsafzmeSCWjoTWtK4MOZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44102542"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="44102542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 22:43:42 -0700
X-CSE-ConnectionGUID: xs1W9FNJTAuJJWVu4nKwYw==
X-CSE-MsgGUID: 0QAvFmZuRD22eHJTS+C2UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="128757187"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Mar 2025 22:43:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Mar 2025 22:43:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Mar 2025 22:43:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Mar 2025 22:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY3OBHxDW01wnrpipTuq/IDrnx7FdI/9X/2n1M4DlGUxoCmPQdhThYvXMsTwzQ3PpPtvqN0xS24rfwcZXlUi1ggpvtT07RyldIz9lxbxG5d3oCIIZdz2pq/iRj0Fzad9InpvaYS7MSnAvCcR30TwCNG9/lB6e7U2M1NJZZoZHe8FCdcWefpnVsc/Lh6rYEVshVLY4ap6AEE1gpLn1smX+YHSst2tTJTUDnNHKcFZF25H9wIz2iUECTQ3Tz+PRin0pMDV/HouVP8rs9s62zoeK3uowVBlGyMoZwEa7MivGciw13KdAEk/fRWEDbrSKTDzNcUZta/xYOSfNw2xTUpuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BAlnnDxLCNKkT5wtDGrTSNrXLDhuPWbBaj5JR1+JAc=;
 b=BExlGprUVbL1NOevyqFpl1WGkw+o5l6FdgjNOi0oGTt1jU2F1YEsEmLdnXELEhrKXC9or4uCU4Jyf4tOxRakfsLXuScmV032aC7uJfVro8YbJrK97gdcLIOwJadmWxDOx8qNV9kPZB4NmjuKXaNWM4rhT9Z5QbF+OkZRvqtZVqRLGuVvNslF25M8OshAFeovLHq5P+GQg3SkPfSmQG3P0MImGXWhTtDliyKn+CQDgL2uhomaLZ6XDUX6xx4zegpl/KA7a0+43jTsTLeYHmnXKQbrk69KOC2rMfEf31EI45zlBhuIm1Jjow50+0Sxs5n+iWt4bAj6c6wTHYZtcGPHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 05:43:25 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 05:43:25 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, 
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity test
 for all functions
Thread-Topic: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity
 test for all functions
Thread-Index: AQHbmk7QZUi1fJTJnkOrRd9xQMqdYLOByaZQ
Date: Mon, 24 Mar 2025 05:43:24 +0000
Message-ID: <LV3PR11MB8695E570869113A1FFB0B3FCF9A42@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-3-riana.tauro@intel.com>
In-Reply-To: <20250321110958.3557106-3-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CO1PR11MB4801:EE_
x-ms-office365-filtering-correlation-id: dfda769c-93bd-4d76-6ef1-08dd6a96cb9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Y1dAIZeRewe5hf1Kv+Ax8jdB8xL0XsLqSibw7MZ2spbtRNsadZ+kWWXo1Lat?=
 =?us-ascii?Q?JAVj+usd9QLk1DF+hif00TdR8BKMCFRcXr9zWDPX12KBxoItXtsW8kDdGVaB?=
 =?us-ascii?Q?74xk1l8M4V9VUDdLR/UNtvsCXZqyYZGcx7htvzZZ0TB+W5K17Tl+iD6UdATM?=
 =?us-ascii?Q?kTRBkDUaaaY7VAPdhnZxUvqKgRYb5K3P8rFgIs/ZcFtLel9Cnd4CYLPlMizg?=
 =?us-ascii?Q?7b+jC+dtqG3ExMHRPpJQo5ES/zYFxuUSytclXQHV9QR0fZU/a7Uj/rOLAS/K?=
 =?us-ascii?Q?PlcnCK0eTbG5Edr8DKuUGYRtL4JlxVzgMuaqmejFaxQuKSYF2693G5nD6z8W?=
 =?us-ascii?Q?qsOXsJWpYcQOJNdp2XyIUOnXYH5yuG8S5MM6gJ9Nu9EozUdi4yBlA/iGe2E7?=
 =?us-ascii?Q?6rhN/uMQi4GdT9lmJgYAx86ek8Hr+Rt5XBNcmpEBPdqXF33WZDbmC4YnvtkF?=
 =?us-ascii?Q?oVr+a79gZZKj64IQVY8BzBhFiXJd6m5HGm5DTyxzwUnAVh2O9J7IdphXHeqj?=
 =?us-ascii?Q?Gmbra0AodpWhyekHz3Ofi2YNsbtMa9nq8quok2GM9Gli49yyvDC5f+Vhrt/i?=
 =?us-ascii?Q?qD3vklIyG1Izn/sIHl8FkGGdZ5xrPHSzT6oZns7IAweBN5wJbDrQ2SWnxgvN?=
 =?us-ascii?Q?Ewd/Lr2bP2+UPIfqiSnJ3BDQKLzxDn4/Pj3Ofj5KljVdlGHi4PU45I0ogXpJ?=
 =?us-ascii?Q?WFHXurIxxGImUHcOWFlEjrioGbV5SeUfjEp9xq1xO0i1bFcGcwqoocTWkUE+?=
 =?us-ascii?Q?WyD8jsiFBcZgv8s8X3xajYpV1n8YdRks4iQGJ8o/dfUsJwsSsJ/gBwvQqak7?=
 =?us-ascii?Q?a0EifxbPlQlacH+Z210w9rTex8Y8uja1ixg+vHrROWa2o7ZQMrSW2byoSJPz?=
 =?us-ascii?Q?wTzDunswmPjwkFkAsKuEqxWRn1+Cq4RZnonkKAIlVouiGstqKsn8FnEgZmvp?=
 =?us-ascii?Q?OqFWO1EHiLaY6EOyMKqYqBwENjD+B25V8O95KAyn9okG78XYPh/2YNkM7Tpn?=
 =?us-ascii?Q?w/rssUBYea5SM8tl9IlQ5I7aO+PdtX3hcgo1NAR6kpXmGRB3HjFpUrwbF5OA?=
 =?us-ascii?Q?vUhafc4IOul9nj8TYjgrdZXvtFY9y13W9yIEkvtY42eUNE8i5ABvYrGxnPyN?=
 =?us-ascii?Q?xuNcqrHQZOzERlV/UM+BF1+X4CBHbXUfEmlm0HuikEp+nIVwJL9ZQV+krG4m?=
 =?us-ascii?Q?GzBRdEIA/ANtI+UaIZac8WWknqHd+mfIqSICzC0qWoOv/SN6RtBKljouVkPs?=
 =?us-ascii?Q?i1P1cWI3BbQKhdyzhBPJVhQ4Q0d927S8lj0yA/0tMtjDBdRuwilgaNDeuVbG?=
 =?us-ascii?Q?X54l8fi95eAgeKl2wz6W42F6V+7MQEYNjwQ/Syf8Ka6ZyUzJ4ZKc4QMVL78t?=
 =?us-ascii?Q?LGa/So/nuo8K82nsuoo2H91kE5MJFvhWxNqYiWBb99DP8dq/KUrXZm7OwIc5?=
 =?us-ascii?Q?yYaFNuNB9mMXMj07QZh6gGNjsyQZO6Fo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uL2uRdWKiY160rObuTSNP93cnuy9EPSR1MAyPCxlf0NDWzFeB/fbddL3wH9o?=
 =?us-ascii?Q?t7X2F8q4xoVo4yakniQhJk6fnOFCGaeBWe4fPkos8bnY111qZxHMwAce52L8?=
 =?us-ascii?Q?z0qI3VayHyYzk/CY+4rFl1U6g8s6kuD15KOX2VjuTEyheO321GDJjA0jABj0?=
 =?us-ascii?Q?BDX+AOE3faL1JmFDq9ihRd34DXzUhEITVLWuBDGKh10/3z8Lt8PCQcygrIph?=
 =?us-ascii?Q?GWEuidUftC8z1B6g5ET2hmu28Fhpk9qfJcTfc5l91GVkgWCze8hbhNWF75yS?=
 =?us-ascii?Q?4t0lgGFQzC6eMSSoYxuIPLtiJciBTemM5byhgDD8waqdlzxYEJPQ4yjV5LPW?=
 =?us-ascii?Q?/dq2qCxy3pRmWWLA20q2Vyw1JyxrNrLdEj/ALL7dM4oT6b3VZozR2J9mdryd?=
 =?us-ascii?Q?F/TKzmyUt8IY+0BwDbudm+xSPNh98lKL/OiCp5KLxW3HUetBBu8lvwBQBnXr?=
 =?us-ascii?Q?OfKK5/BjkRjMp2OhGxHJxLkxiDaazjz0j7EdKJlRNFIiPSFZBP4GhgGMhErx?=
 =?us-ascii?Q?E0MUjbxx5mZa4t+H3HxbCa3sx4AQiUTvQGgrkHbJ/1QAHPwLvrCA55bm882s?=
 =?us-ascii?Q?fHbwadIZjSTSi9RO7CseGJxN2ZyBgOmHiLxf9tsb7TRy5rponXVAl/VPGLBL?=
 =?us-ascii?Q?Kq8b34Rnq3xI9P9Rgktn9wU2VLTeXnKIWVGniNmyWBAzWv6ffCPcDyHmB7me?=
 =?us-ascii?Q?L4iR/kMls0ZHO9idJJ2kCzTZKKLsOipUQpB+eMKWBiCUXnmosBcfntEhTBJb?=
 =?us-ascii?Q?fXh9/x4CtiDSOFokCpRFyT6nihFOAf+6+Ht2XxByYygOjNOO2rNTvrtvbLnp?=
 =?us-ascii?Q?6A3D9HJTAwpKUZps09e+qWdws95Kp3WSsd6caqO54ygWGIgHtubtsAhGBC3R?=
 =?us-ascii?Q?RV9aFVE6ldBJs08HMILiFfUAOUNOQwgfmOx0/zEMRYrCj6SFMa/ywnSYq8Hd?=
 =?us-ascii?Q?zOJpW8ytXqfMCgRQ5KHMyakfjo5nDgxKLfOh8v4iLLAGFTJJuXtzfvSD4KL0?=
 =?us-ascii?Q?NfElm05p/gLOWc4xeVxzAFoTywN6CtiwhuatUsHPdkdLNyBW/becYxx9ARzJ?=
 =?us-ascii?Q?TYQGt2WAp9R9VYjayybd4cYu5TtvWyii+AuhfeCOfNYvLYcGbob056kRuSY9?=
 =?us-ascii?Q?s+iHERDwvmTBouNxfpuNjQCGOatBEXn7kLBXZO9Tlkk9MLBhTfiNb/UH6hkp?=
 =?us-ascii?Q?xMctAlMOUBlOwiAitOlGIKDI4ahKJpFAZx0LUB5ubbyLmXCmO3hHA8aWftR6?=
 =?us-ascii?Q?koBjCAd+D6BlAiPiI7u6HiQ7AeA6sDFfRnsJM1mP1wFHGt/SicfX6+zKIhSB?=
 =?us-ascii?Q?sBV9Y0HVq2QQPNnMUmXH6Zx0hDhZMvhWwK4+Me12WXuyBarEq5LSMFt+0JKP?=
 =?us-ascii?Q?96aMG2e7fNqjPbc73nhkFDBKqRErRzscFcg4bcq+nFBkv9CzkSLs+YmX4Twb?=
 =?us-ascii?Q?xccy/tDO7dY0KX4YSvxoKkEc1g9qrX0fEUQmmp3ZTDIQMPvbdwwBs+wCRub6?=
 =?us-ascii?Q?0UCUFWWqZxi5/y2ZVeDjZ8OnXjjpsyuvRCsbWuPr5UE52ty31Zmb+fM4EdhN?=
 =?us-ascii?Q?q5gQ+fugzXTmFj4jf7LIpzG/HJaZOevyl3g+FNEzPkHgELcPsAVmuHYYT2gv?=
 =?us-ascii?Q?1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfda769c-93bd-4d76-6ef1-08dd6a96cb9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 05:43:24.9628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0LohdhzVlPB1uLyFxgX644gNiR0UbI4wi9lRM13M2B/J345bFZ8z1yD0qMJ81NQTmV0V3EWy2ID71i13wWK0x+UhfoeFUOzTUij9VtQYnys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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

> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, March 21, 2025 4:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nerlige Ramappa, Umesh
> <umesh.nerlige.ramappa@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity tes=
t for
> all functions
>=20
> Provision and enable 2 VFs with execution quantum and scheduling policy
> set. Add a test that runs workload on all functions simultaneously and
> validates that all engines are equally and fully loaded for the
> entire execution quantum of the function
>=20
> v2: add a different function for function config
>     add function details to log
>     move pmu_fd to struct
>     enable and provision VF's (Umesh)
>=20
> v3: split patches
>     move exec_quantum to variables
>     skip test if vfs are already provisioned
>     fix assert (Umesh)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_pmu.c | 129
> +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 129 insertions(+)
>=20
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index f0959abe2..9a1f9b39e 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -14,11 +14,13 @@
>=20
>  #include "igt.h"
>  #include "igt_perf.h"
> +#include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
>=20
>  #include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_sriov_provisioning.h"
>=20
>  #define SLEEP_DURATION 2 /* in seconds */
>  /* flag masks */
> @@ -124,6 +126,12 @@ static uint64_t get_event_config(unsigned int gt,
> struct drm_xe_engine_class_ins
>  	return pmu_config;
>  }
>=20
> +static uint64_t get_event_config_fn(unsigned int gt, int function,
> +				    struct drm_xe_engine_class_instance *eci,
> const char *event)
> +{
> +	return get_event_config(gt, eci, event) |
> add_format_config("function", function);
> +}
> +
>  /**
>   * SUBTEST: engine-activity-idle
>   * Description: Test to validate engine activity shows no load when idle
> @@ -187,6 +195,73 @@ static void engine_activity(int fd, struct
> drm_xe_engine_class_instance *eci, un
>  		igt_assert(!engine_active_ticks);
>  }
>=20
> +/**
> + * SUBTEST: all-fn-engine-activity-load
> + * Description: Test to validate engine activity by running load on all =
functions
> simultaneously
> + */
> +static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_in=
stance
> *eci, int num_fns)
> +{
> +	uint64_t config, engine_active_ticks, engine_total_ticks;
> +	uint64_t after[2 * num_fns], before[2 * num_fns];
> +	struct pmu_function {
> +		struct xe_cork *cork;
> +		uint32_t vm;
> +		uint64_t pmu_fd[2];
> +		int fd;
> +	} fn[num_fns];
> +	int i;
> +
> +	fn[0].pmu_fd[0] =3D -1;
> +	for (i =3D 0; i < num_fns; i++) {
> +		config =3D get_event_config_fn(eci->gt_id, i, eci, "engine-active-
> ticks");
> +		fn[i].pmu_fd[0] =3D open_group(fd, config, fn[0].pmu_fd[0]);
> +
> +		config =3D get_event_config_fn(eci->gt_id, i, eci, "engine-total-
> ticks");
> +		fn[i].pmu_fd[1] =3D open_group(fd, config, fn[0].pmu_fd[0]);
> +
> +		if (i > 0)
> +			fn[i].fd =3D igt_sriov_open_vf_drm_device(fd, i);
> +		else
> +			fn[i].fd =3D fd;
> +
> +		igt_assert_fd(fn[i].fd);
> +
> +		fn[i].vm =3D xe_vm_create(fn[i].fd, 0, 0);
> +		fn[i].cork =3D xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
> +		xe_cork_sync_start(fn[i].fd, fn[i].cork);
> +	}
> +
> +	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
> +	usleep(SLEEP_DURATION * USEC_PER_SEC);
> +	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
> +
> +	for (i =3D 0; i < num_fns; i++) {
> +		int idx =3D i * 2;
> +
> +		xe_cork_sync_end(fn[i].fd, fn[i].cork);
> +		engine_active_ticks =3D after[idx] - before[idx];
> +		engine_total_ticks =3D after[idx + 1] - before[idx + 1];
> +
> +		igt_debug("[%d] Engine active ticks: after %ld, before %ld
> delta %ld\n", i,
> +			  after[idx], before[idx], engine_active_ticks);
> +		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta
> %ld\n", i,
> +			  after[idx + 1], before[idx + 1], engine_total_ticks);
> +
> +		if (fn[i].cork)
> +			xe_cork_destroy(fn[i].fd, fn[i].cork);
> +
> +		xe_vm_destroy(fn[i].fd, fn[i].vm);
> +
> +		close(fn[i].pmu_fd[0]);
> +		close(fn[i].pmu_fd[1]);
> +
> +		if (i > 0)
> +			close(fn[i].fd);
> +
> +		assert_within_epsilon(engine_active_ticks, engine_total_ticks,
> tolerance);
> +	}
> +}
> +
>  /**
>   * SUBTEST: gt-c6-idle
>   * Description: Basic residency test to validate idle residency
> @@ -225,6 +300,33 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>  	close(pmu_fd);
>  }
>=20
> +static unsigned int enable_and_provision_vfs(int fd)
> +{
> +	unsigned int gt, num_vfs;
> +	int pf_exec_quantum =3D 64, vf_exec_quantum =3D 32, vf;
> +
> +	/* Enable VF's */
> +	igt_sriov_disable_driver_autoprobe(fd);
> +	igt_sriov_enable_vfs(fd, 2);
> +	num_vfs =3D igt_sriov_get_enabled_vfs(fd);
> +	igt_require(num_vfs =3D=3D 2);
> +
> +	/* Set 32ms for VF execution quantum and 64ms for PF execution
> quantum */
> +	xe_for_each_gt(fd, gt) {
> +		xe_sriov_set_sched_if_idle(fd, gt, 0);
> +		for (int fn =3D 0; fn <=3D num_vfs; fn++)
> +			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ?
> vf_exec_quantum :
> +						     pf_exec_quantum);
> +	}
> +
> +	/* probe VFs */
> +	igt_sriov_enable_driver_autoprobe(fd);
> +	for (vf =3D 1; vf <=3D num_vfs; vf++)
> +		igt_sriov_bind_vf_drm_driver(fd, vf);
> +
> +	return num_vfs;
> +}
> +
>  igt_main
>  {
>  	int fd, gt;
> @@ -254,6 +356,33 @@ igt_main
>  	test_each_engine("engine-activity-load", fd, eci)
>  		engine_activity(fd, eci, TEST_LOAD);
>=20
> +	igt_subtest_group {
> +		bool autoprobe;
> +		unsigned int num_fns;
> +
> +		igt_fixture {
> +			igt_require(igt_sriov_is_pf(fd));
> +			igt_require(igt_sriov_get_enabled_vfs(fd) =3D=3D 0);
> +			autoprobe =3D
> igt_sriov_is_driver_autoprobe_enabled(fd);
> +			num_fns =3D enable_and_provision_vfs(fd) + 1;
> +		}
> +
> +		igt_describe("Validate engine activity on all functions");
> +		test_each_engine("all-fn-engine-activity-load", fd, eci)
> +			engine_activity_all_fn(fd, eci, num_fns);
> +
> +		igt_fixture {
> +			igt_sriov_disable_vfs(fd);
> +			/* abort to avoid execution of next tests with enabled
> VFs */
> +			igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
> +				       "Failed to disable VF(s)");
> +			autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
> +				    igt_sriov_disable_driver_autoprobe(fd);
> +			igt_abort_on_f(autoprobe !=3D
> igt_sriov_is_driver_autoprobe_enabled(fd),
> +				       "Failed to restore sriov_drivers_autoprobe
> value\n");
> +		}
> +	}
> +
>  	igt_fixture {
>  		close(fd);
>  	}
> --
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 2.47.1

