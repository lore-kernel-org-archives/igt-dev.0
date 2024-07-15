Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F25C3DA56
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 04:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F2510E23D;
	Mon, 15 Jul 2024 04:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0tga1lF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7B10E23D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 04:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721017396; x=1752553396;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nu3R0DQ7PEWT1CHTyI6URQSJXPnf9397Hh6UVqEIar8=;
 b=J0tga1lFR4nAm+WSV2h+OVasBHJmPT4WGfc+8XjSJtfJ9w7UnKLyCnDA
 YDWfZ2MsCt3MeAHV+SIBjZRC3HsSWSVK6Rccln3i+GXLNS2eYjyqe+tlo
 fz7ZY/VcODWMN5hv0SyvMqKo5euYdSIbx4nzQEp0qfnShZmcLr3roD8Mg
 ZwO1CNDh0oJBehNIDzLI54glgI0poPKsA7NXZSYKDlSWZ8HSYXsyWu0Ed
 RpwvJRISfqxgerNm6ECTa5aAR0KpfUCqmpVSL/IN7HM7BcHyalvkoaWbP
 xYLWBHkmlCfRiQKj4x3k3WBg1TCvqw/D5FNa4NhVG6sV+XykRE/7fLaNq Q==;
X-CSE-ConnectionGUID: kKd5wZiKRQa/WcQe2THKNA==
X-CSE-MsgGUID: OxZ1bWWwTF+7C0l62KVb5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="43789146"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="43789146"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2024 21:23:16 -0700
X-CSE-ConnectionGUID: bEdM6k4NSZ6q4UAu6lX5xw==
X-CSE-MsgGUID: bPmR2IpgREK8QTT3K9Fdhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="80173487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jul 2024 21:23:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:23:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:23:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 21:23:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 21:23:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdHQxavH+S3cjS0us9tl/IYDspNn9bT+j35YE9It4Rp8avT/K0XXVHQVgZR8pRkc+6PP9DieFDEkb9Jc7t8wda3Bs227CoBQDnT811aAtwBdF/7kV3eB4FySEfgc93U88vExrvhRBkuaR8Mg1F95uNwdFTsF3YfCz01fmYniY74EtCU4Jc/N+oVqNRW1tlOuxUnDoUdMKhWXV/Wds+DRAvXSE59O8zk0k3WAMVOP+1zaZt50juiFsWhu1oYiWaAi3c76tFfp0pT5hicHIOC52umIeLAioQ/Tnnq+pY537ydRIpDZ/mwK+cSJDSRkcwodx/g7ckWH0wdsdQSpU2bKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+79OETptlz93sD93+70AgHpOgbZ2QVfMWIKJOxDgmI=;
 b=lUn8Ij6v+blG+ajDKC+Sk1aBmPmu0q0CQKb9zcYIT3RXipIOizj4OiC6A29fNIBVJzgq6gdt7P6Xsu+yO3Yk6qn4/2y0y35kajDhUmQXkUR9/x3ZDzVBcyxJqMQ7l88hB59yrC9YuKGx8PxTjdCRs3ThuUSvLWooIO9s4TSWxpOPX4ojvLvBdyra1d6k0rGP9PKPrrU1VKKVT9wipMFQc2TqwO6gZCfRLF+l0Azci99gUoent21qEmkhQ/69zxs48Tq1UYNMUSPyUvvGB+mf+bFJ1z4vp8AWhgmnocYsnoxpxBvm/AdTplrvmXWkayNxOtiS3k36BKxuSax+HM6BIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Mon, 15 Jul
 2024 04:23:08 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.7762.024; Mon, 15 Jul 2024
 04:23:08 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Thread-Index: AQHa1PV39edj5hsR5U6ySbjqa86DiLH3LunQ
Date: Mon, 15 Jul 2024 04:23:08 +0000
Message-ID: <SN7PR11MB6750CC783C4A055653E2BAA8E3A12@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
 <20240713072646.551590-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20240713072646.551590-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW6PR11MB8409:EE_
x-ms-office365-filtering-correlation-id: ad01fbfe-c110-432b-1139-08dca485d48e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TL5hGNo1L1/5bBiYR46meAHth+e/Za1P9p5VkYTN4HyNeFcnHGh1ACdpR9x5?=
 =?us-ascii?Q?uv3ZYvqRCgqWInlBxja6x3+IcyUmtt4Hjf8owzXQ7z4BSQNQz/aEJuNMBEzx?=
 =?us-ascii?Q?kHqompwKoHFz0Ooe4Ckw4juWuZ+izJwWmBbluhy+1ythTpz7eKG0dMbnedOX?=
 =?us-ascii?Q?RqRBBMjH4DFal4e8AX+97bBcTtpA7q95SwHX9KwGpvCqOA5iW2rN3KEvhB2u?=
 =?us-ascii?Q?EXtJ4eg3Muim9RAnduI6668QQeAzf8xTg1ptzwUUhalO8VXPQ45x7BryUwDn?=
 =?us-ascii?Q?TyfmQvhYGzJImd/8eI399ev7P9bsbdRcBD3Kg0kxaX+e9hoCIEDcbz8m+IVW?=
 =?us-ascii?Q?JCQYl/FyrBb4gpnYrSelf3o2Q14784RDqwbpHu0gnw105874QorIGBmfueof?=
 =?us-ascii?Q?jPcJmdPU+QYqG9M1oZ7LZc/Hu3qq7h3T41v2E9cUegBpJhLvp0kGeGDpFL0X?=
 =?us-ascii?Q?q3z8GE+aU8+CW1STfw4cMoRXUAkYvY3iiYDXrkVWm9GZmCJAFNORaGD0QfEq?=
 =?us-ascii?Q?IzMVXDeVOIpf3H2UfFslilbn7KG9jM0Id0vAdf2pgcYfwmQpxmcQJnjnYF99?=
 =?us-ascii?Q?rKKBib5tiov+S32mqV22a0zRaTouBJXUvghIIaeXgnmqUvIdqSUUtQHk1fvR?=
 =?us-ascii?Q?hfKilYBuggS62HYM6Aq1ldymrmAYHBVNlwF9Y4fe9beJGITlFS40jTHqYLMS?=
 =?us-ascii?Q?3RrqXpoai5xLQhYAkCzr9TvR7UhuT0JX1Bv4nYBQOGkBAbxctKd2/wCa6bu7?=
 =?us-ascii?Q?+eBFBeuH+hrORXojgXQZAyLpBn86+7b7Ga5dE0oPVN4zDoZJUdgp0OMogKX2?=
 =?us-ascii?Q?D4Uf4MHejfVzb4oprrRpMNGwvjl2+y4v2qz6/1LN4hSl31OMlK5l/aXkDS6I?=
 =?us-ascii?Q?0X33ufs2vDeAu/yvl/19picfQ63mFa6saGmcS9+OrA81ivC6mCPpKwGr6HYQ?=
 =?us-ascii?Q?FirbKGm3CXp047djrQ6sFscSIdQZHwKG2wJzNW6O0jQgITorJIOv6Ups8gDq?=
 =?us-ascii?Q?hymDVEv9DofPAVE50Xy0/D1yvW82axhCkHcHdIP7BGYoBKLeL2YU1ZPQdOhm?=
 =?us-ascii?Q?6AEuFnbFj3D6NYa4+JdyLJbkiWeRauwZDj1kSfMAmwQVpHUrFYExKLyOr3Vr?=
 =?us-ascii?Q?gQQrHVQZAb/SakzKvl3mus2nCV0vLmPzXSeGgyfxJtR5OtbEpYUs+tCLLTyh?=
 =?us-ascii?Q?kB26SguYjZWS/5kkSeyM/0Qv3m+GxC9qlD5aNsVKBHwSKKwOz1mm2CgRRw4w?=
 =?us-ascii?Q?TmjjzjVu/sSrpah9N7vtu6/tJ3k10nSoHMr5UlsBPIhwPf+asYnnRp+S0RE2?=
 =?us-ascii?Q?JjG95NnDR+NW6nyBgepx5dbA+K4tfvKMv1I2kLJwmxhu4hqSOsCUZAJEWL3W?=
 =?us-ascii?Q?mNclsjdN6hZ/50Ksb5wYKMD9TQinWEs3xzeIMXX+VLipdFFKxw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nTtIj+IytpP3C5xEpVZ4mNgrdoiWGg5JQqjwR+tO/VWEDLEgdRj3mUAjlXB5?=
 =?us-ascii?Q?Fx+pAdOAUQSx7Ax54VEeQMWv9Bhr5yVE7ApUUypMacnFooJA43YTVGhTGAK7?=
 =?us-ascii?Q?U/VBsUV98mjX7zDEOGHQL7Ix1amPaoPFIZ1CzC1N0tPuiFnlbpK86pHsJ/vM?=
 =?us-ascii?Q?Bso7azcvg/fTVSrL3WToKW9IAKr37Y2cuKSFyZZXky4RFvZg9i/BGvj2udY4?=
 =?us-ascii?Q?jiZGlNxnB9vP+hWdmAH+8Dru1SYfyRxT66j1Eq33EAaeSzzZdnCyci6a9XAb?=
 =?us-ascii?Q?4w/XcW7I4aluDuyKB6zoy8n5hkILc3PrEpPtFKmAjxbIEI7uIgXEnLAq5zBz?=
 =?us-ascii?Q?TeZIh6jvOpS+9dIubQ/zY52dOXjv7M1vL28hvfXQr3SOifWpZ/UO5tV6y5jr?=
 =?us-ascii?Q?+og7xv7nYmc2KmXjcKoSre8NJaxdweP/wq6zQ77qBlBtIxlzzdtxHx2ulA38?=
 =?us-ascii?Q?Y0NitWp+xGzRo81kHmZT4Q9HL8eLh/vj2HBvDMRSHaN06kmx0OSh95KHHoqa?=
 =?us-ascii?Q?YQVhUyVFAgx/y012/c4WZJcujrtS+BGmvZETi9zTuSNbREgmx9RJms2c4fOO?=
 =?us-ascii?Q?sa6LLoqRcNHGoKMD4ruB3nca5vSbBg6ZOhR1F9oC+FRrqOXl7NU/EqlvKqMT?=
 =?us-ascii?Q?UdNj2GZgyt55bg43HQWe6n7SdhKs5ea4PAo4alOk7Gaoq+cKrGg/yKuET5MK?=
 =?us-ascii?Q?bS4IxEHcIk0jlJbWna2kx8jCWpSgSorDCAQaoLGKZJbVLB2GjgzVbslKA+Th?=
 =?us-ascii?Q?WBAKcUxOXmjkiXFziMAWaZxL/c95epY8hSnXf2lpGud597Dm5LozqUjAA5fi?=
 =?us-ascii?Q?Ja1aHjnZvAOS9mBxHpHaSpw/6yzzU7MdK8yVXyRLMZXIOg708UnnMth8Z12y?=
 =?us-ascii?Q?k7YZn6M1Ni4Nl9vjit3+nVZoMtTV8sKsGmo2qBgAqj4IVUKPSnCOJg8QI8SH?=
 =?us-ascii?Q?gZuPRH27AH/9N9ZdmML+kWpQhue9xozUT2z30DyAnjN1eoYQj2kZVfEnvriq?=
 =?us-ascii?Q?qgxzvszzifqL5EM3SbJ5tD7vBNy2tWtH3KVPiOsN/TCa94QdVmYWv113/nFr?=
 =?us-ascii?Q?NU/caKghrpujbvmQ9ANajAQARVzbOiBql9m5Oj9cEyXhBgj+q30snhUUCQGP?=
 =?us-ascii?Q?ENZXZteTHQAk/zqRmhw7GBQaNTeHL14VAnbyUcppqnIsK697H94dVdF0Wf+V?=
 =?us-ascii?Q?nagOC+xJUKueciEwfQ9VnGnbfLKyRdzNnI7WZmFm1uTNlw9GNJIm+i6AHKSa?=
 =?us-ascii?Q?OPJsI+c4J/OgZpWqnsq2PNifhnPQcYKjZUL+5l0Rfm/0eVGLWEEHObyTIv8i?=
 =?us-ascii?Q?YCZJB3FGDbYeoYDGjZ/jOmPUd/i2QS7jsg7GJvh1XRNjgnn7Su1U9SutbOsd?=
 =?us-ascii?Q?HIbY2AXAM4laFx8eqi6UVHJKtKbn4yNlN4IrZ1JrVZ/r0O6hA6Smo/OmIVvP?=
 =?us-ascii?Q?pdHsw5TmgoZyjSdAXbYfvCqUzcpnRxXe5yYze6rN4OfKUI9kjAhI5hxPMW11?=
 =?us-ascii?Q?vnCvAQAEa5ispvQpMnEUfK7bh6vAVuitddlhCLgg3Yh1NwHxPMWZ02luCn8l?=
 =?us-ascii?Q?2dTU4OOx2PY9BYPYuCR8+OTkB7aYW9lNpC5tMb7v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad01fbfe-c110-432b-1139-08dca485d48e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 04:23:08.3148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tv1GgIZ7L26XAtBmhcCDbIkDTU4+Op8PUkSDs/i/act6yIZLmGWayKEv5ozYghetj3sBzLxVnVHldWgOHx+wPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Saturday, July 13, 2024 12:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.c=
om>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
>=20
> Add tuned delays to check deep-pkgc pkgc10 counters
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> bca5bfa58..2155b4625 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int
> debugfs_root_fd)  static void test_deep_pkgc_state(data_t *data)  {
>  	unsigned int pre_val =3D 0, cur_val =3D 0;
> -	time_t start =3D time(NULL), duration =3D 2, vb_delay, delay;
> +	time_t start =3D time(NULL), duration =3D 4, vb_delay, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
>  	bool flip =3D true;
> @@ -618,6 +618,7 @@ static void test_deep_pkgc_state(data_t *data)
>  			igt_assert(igt_display_try_commit_atomic(display,
>=20
> 	DRM_MODE_ATOMIC_ALLOW_MODESET,
>  						NULL) =3D=3D 0);
> +			break;
>  		}
>  	}
>=20
> @@ -638,23 +639,26 @@ static void test_deep_pkgc_state(data_t *data)
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> -	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> -	delay =3D 1 * (MSECS / (data->mode->vrefresh - 10));
> -
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> +	/* Waiting for the vblank to sync the frame time */
> +	igt_wait_for_vblank_count(data->drm_fd, data-
> >display.pipes[pipe].crtc_offset, 1);
> +	/* measure delay for half frame */


 Start with capital letter here why is this inconsistent also you are not m=
easuring the delay here more
like sleeping for half the vblank

> +	delay =3D vb_delay*0.5;

Spaces needed between the * operator

> +	usleep(delay);
> +	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
>=20
>  	while (time(NULL) - start < duration) {
>  		flip =3D !flip;
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>  		igt_display_commit(&data->display);
> -
> -		cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +		/* For every 1ms polling for pkgc10 counter change till 1 frame
> time */
> +		igt_wait((cur_val =3D read_pkgc_counter(data->debugfs_root_fd))
> > pre_val,
> +				vb_delay*2, 5);

What is it that you are trying to do here the comment does not clearly stat=
e it.
Also spaces between * operator=20

Regards,
Suraj Kandpal
>  		if (cur_val > pre_val) {
>  			pkgc_flag =3D true;
>  			break;
>  		}
> -		usleep(delay);
>  	}
>=20
>  	cleanup_dc3co_fbs(data);
> --
> 2.43.0

