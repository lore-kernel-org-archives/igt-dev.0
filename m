Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69640E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 21:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033E710E2AB;
	Thu, 19 Dec 2024 21:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqDcnTRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2D310E2AB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734642260; x=1766178260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xxb1ojjGWRvPI5nImKQBvqnE4E3K/EEmAt/0m9NfCBw=;
 b=YqDcnTRQvqtr/mYJJHQ2qzxXuC4+VP7tph76VZWEcvKJmZRSdczRAtPk
 NEaXw9CRXGVxobWGOp9k5VIg3sonaDUvSrL82af3x4s2+HRI8MXO/1Wsg
 rgRt00+ZRsU64dB8vylo/szHmdCam/ZOe4i/j3oOHON+b3qIigikNjh53
 sIJSbiEAIktEJOR9lvr8/lP4kuMjE4Cd6BwVI6py15zODkORiTBFB73Yc
 XQ2v9HjkoHu6NjoZ5wrA6+d31hcFBFsOEktrF4ADB9hk5Q3vwb4txzKbq
 LCpzu2oJJQTNGjo+bhG1LZM26Ka+dS7nKN3y5OULopshpDadtTMbN30qf Q==;
X-CSE-ConnectionGUID: /LvWuPB9QPWZpQAX/bNlmw==
X-CSE-MsgGUID: lrsMZV3RTLS8HI28YhVnXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52586997"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52586997"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:04:16 -0800
X-CSE-ConnectionGUID: YswYCaukRqCukc8biNsM8Q==
X-CSE-MsgGUID: 6htX/N9yQXSr8fy/gN6wMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98709085"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 13:04:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 13:04:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 13:04:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 13:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKer/1Ps3NMcCs3CZzP4eMyDhLmJDjNkl6h1vleTtS6A0ouVFA5/IQ9y+LsakC0jDRn6RV/FSAJMp+ERSgC2uJnKhYjohSnfWw6SgAIkH8YCfI5kkbu1r9tuLUtnFAwOlG5IKaxqvKR5YHKfxfHBuH9beNvRGejqaTtxrQrVg1EVaM69IH92VGYgrlsiDiICjsIJwrRafggSTeusNRd/cK1AG0HuNtjQ9qERvhExBybh3PKwB9bMvKVguAN++h/tjI2OjHf4wBPHFOFjhCc+2vxjptrDTyeCV4nw7Bd2H0AyztfrkobhhSGQwUzIsbvwMMOSQhOkPZ/5UOUmsWAQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw6/33OYrSAD04T1AzoDqZbzVOAKopARLXRb4vn5iGA=;
 b=RhZFuPdhF3gkBH3G/2T9SQhwkCeGToLd92xEFFurRIS+osv4XEnm3upB4ggcnH798VEmjE8jSwZm6qQC9xnQSfQBSVuuQnHye/voWQ0PzkpkoXiLGbc4BVS6hDVT6KELC6mLyaZXspv9iFSJAkntts/tVvNmvM/mbYVnhQBDZ+znGe6dOs/XFVK5chgeEVDfgichlmOWQzdcX6X+kAAKdLjGRPnxeBwLlKVdwDjcsTXBzVonTUYxGjBa7hpDE39Awc0fY55r59KOoJJ/CNAvHnUBgdyOB+QZm7CT+zDTTmPaKIiQovQG6qx+xQAUBV/TAdL3vhNCBTcZVk4kenEpjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 21:03:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 21:03:29 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
Thread-Topic: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
Thread-Index: AQHbUX+8gI4vJ4ztUUOu1n91pqgqE7LsdIuAgAGTjACAAAIEcA==
Date: Thu, 19 Dec 2024 21:03:29 +0000
Message-ID: <CH0PR11MB544477AFD76E8330DDA16227E5062@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
 <20241218190418.126565-3-kamil.konieczny@linux.intel.com>
 <CH0PR11MB544413277C824C3B1CAF3DC6E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20241219203530.7ctzgjggmf7ykrrx@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241219203530.7ctzgjggmf7ykrrx@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4819:EE_
x-ms-office365-filtering-correlation-id: 9e5237c4-83fc-4417-7941-08dd207096f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sRfLUxHzKElfXVtwQ4Y5DKrsddBMah0UAOXzn9kiHoG/ShBGiaSGNBtQ/UKN?=
 =?us-ascii?Q?G3pzitivSMScMBuZJbSOkD4fpL8efoCCIA52R4kqqtM0tPHsmc8+Yuo4V+37?=
 =?us-ascii?Q?OBVsj8RrUCZ1Y3xzQpXcCitQjFDSmxUzBYhGsWHdrK5GRChl1I4M/uPdoeby?=
 =?us-ascii?Q?pFc9u5O56QA5Fy/s71RUPMgV1a5YRbFUHBBigVGx+VZTEprzp5ncFkgYR7Pn?=
 =?us-ascii?Q?SsOXTR4x6Fg8D5tgpHLIVm+iPrvnpbrM2wnDnCDZo9mJOzaew4HahHFpX8Jh?=
 =?us-ascii?Q?ZwhymK5oenhc7Pnv4hS+bu9xYOJRRwpmEnjKS33mQ63x/wQvqy80Y9xApb8T?=
 =?us-ascii?Q?OcskMt4oVSQON7ICBRf8jmJqtHxo/rlT8epkfPjonG6lX71FxDdibuO9hqtG?=
 =?us-ascii?Q?WpLBOpgYN7HOF9LTRIrAG2/vpfp6jxeugP9nI+cjMVd7/Bng7Ov3owxSjRZW?=
 =?us-ascii?Q?GGS4b2gxh/bxmP8IK/cxzOkrZ4HAB67sn2LositRZuOgQ5dq08lbx+F73trv?=
 =?us-ascii?Q?CnUMyoG0Sf/7j5Uravt5/8O0nK38fvxS+T2RpCwbdzg0S0yj0M6g6CiIzMzw?=
 =?us-ascii?Q?CvvoVCmItTTtX/rgK/ayB/llYHpb2j/zLSyw8Memx0AyXRoc2rcmvEDcrspj?=
 =?us-ascii?Q?lNQjmqbfpMY2qeluX35+px+Ts37iFMbIe94hsbmZrt2NtB7I/UGIv7nU2dQE?=
 =?us-ascii?Q?6sEktyuVdE6A/X59QLerge6kfVbo246e6raRggZrRZjrd4pZodAFGRukrTco?=
 =?us-ascii?Q?/VHVIbThkEYSRA9fQfOlZr5vBijBWaP1jXAaNCElAP9Q3HZS7EkxEjyjlH55?=
 =?us-ascii?Q?K7N1+x1jeKigd2yBYVCSfisGe/lmzzmVhmHaSH+MEVweDs/0BUNtvnp8pn/a?=
 =?us-ascii?Q?7Ie4Nx5r7TtNmIGCaguTaL3SOvspReDClAyNLaT9SwPr7wVV5kIrqwHNg5QX?=
 =?us-ascii?Q?bySvfssG/XuPYvkdPA52S1V4+p8fKt4RbV2qxAhNWT+jzJOZyHc/1FNts7WU?=
 =?us-ascii?Q?NAsl86/D6ZfQ4RnNKvfaXNbC79tSN1ltc5nnhMdTu5cASlBuWmz+IiG0TVMF?=
 =?us-ascii?Q?+kA9rZ55InDk42yDW5NedUHZajcs35FtD+/rK45QO4s7szpMyF4Vsxrv3oOV?=
 =?us-ascii?Q?AvIgZWhEnn2VXcWQ/aE+cDFFNbP+qNgF9eB5BkfhinMJcr6xmkU06t5CHcHe?=
 =?us-ascii?Q?2fSRk6dtPElpVC/oRXIVAR1BIdlp6TzOZrGpMh/ikPgwsfkkLbljKd5KglB4?=
 =?us-ascii?Q?HsSdlHYEflvpNKuqkNh2rk5WsqIjNI+lBVstMk/qTk9CkTlEnE2qpRpvh5AK?=
 =?us-ascii?Q?ehthN56nWUqy+jn6+GuDaldXBeGsfqZ/8jz+rf86M+zuxXyqM+IWToijLy1a?=
 =?us-ascii?Q?ZHJune/vwbfq+Z7H39R37MB6wwkvk8kaNABb32t/Vh1wuUlF+uVMJqDbR703?=
 =?us-ascii?Q?LDZWPKo7wDR19hjRc8UXjYqzB/Yq2kYk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hnQ888KlsOsjlzAxSuOd1zn5ricHtJokCl4qud2C9wWLjEDLZOoUXvgG0aFD?=
 =?us-ascii?Q?/dmyyKShjVJRukuzB9w1uF39svwiOPqtCxOGQbj+HWLQobpmtTESg5oV+dzt?=
 =?us-ascii?Q?KKaYXw9We2V7LE2LwuoP9Ss2ZXtTxOakquY0proLiW5Du7wkDJvJJ+atHSYG?=
 =?us-ascii?Q?rUUoHbtO12UmnBWhQonRrgnA4jtFTc5rv2X7pztM34mU+MFLQfUPP4/Y/3sA?=
 =?us-ascii?Q?G9j8f0170qczMxRWq/cMFczcBUSRGIhlmsVCrA3/gedvau91xFaUNY39I7XF?=
 =?us-ascii?Q?9kVS6+OcjzJ6D0g/dkXfZR6NcnZSW+AwSYM0pcFbadDxRIvmBwKSeV1VhHAJ?=
 =?us-ascii?Q?KoQ6ulER08qVwMTRcXhkgQwWFj5LsANlAUTrtC8XNSaYpNnfjJH+w6TbHPFR?=
 =?us-ascii?Q?ljePDwcADurh3e2+OClEak75mcgAtAV6/1bUhPJiQ3YkihQA5Hai3IL6nt60?=
 =?us-ascii?Q?RIUi/B6i/GnQ1atnbubniLWCgjqC+3XbD+aLvjyTtwLTuE+AeThF0qdtlfc6?=
 =?us-ascii?Q?hVr//WoWuJEUKKDnRBj+UUTPP25RUMsMgkYBj9JARNQeYbKm8IoTmqy6jc10?=
 =?us-ascii?Q?InVr2zgtGa/nt4gBhPYWbCcQHu0FPWZoQg2oW5fcDn/PEOGl4RDXZzjCGifz?=
 =?us-ascii?Q?mNncN1LS820F3eMzaAP/PDZf5BPsqXqV4DhNZbZDpmlp+NvYER2zE7i8dfqn?=
 =?us-ascii?Q?xu+vAPhTcVUgX+WGzg2mDw2HiudxYA9CRGEzT08W75RPV72dtsASHsNN3qqd?=
 =?us-ascii?Q?V4ByhJaF18pc0lUbOwP20If+VhEs2pOIl+RGEc+ADaUJ2D7OxFqa8aQ+OWWM?=
 =?us-ascii?Q?vrfy4Y1a530Oz5avpTvO0Ye4oWffmS0OZbnXqCX9VI0SukKMmBK/fY/qSlj/?=
 =?us-ascii?Q?E2aZqrlNAcy5oS9EVmvZKqVOMekHyLcHgTzZi0J2YJhVb07utzXTjo+kdYzv?=
 =?us-ascii?Q?ZFUcf2QaOjnmo5fuLFO9WKfr54kcBeV6cCKw8U6yXnglc/qyk3PUB3Xb+kyt?=
 =?us-ascii?Q?rk01Pf2Wh6UsiI9OfiGIZvY1+AGEQ+NHmTRThYYJ0RDCwxZWXkLD3GcZlVLp?=
 =?us-ascii?Q?x7ujYFwpBe9/Yu6bw/CICbdSMlHG7Odx9wJR9VuaKaC9wyCAGMCc0AedYzAh?=
 =?us-ascii?Q?waLzPCZaAbKCURcQMG9APiMnGn7+XaRuacNs6m8ESPN5vT57POGCzz8w1nN2?=
 =?us-ascii?Q?7MlHru3/mOkBH+YdquZ2sDpk3Pw5TpSozzATX8RhR2PIx6uIB48aVv2o6ATn?=
 =?us-ascii?Q?Ibq0ZjgssiIwGtvgZaZdXhpMYvfQaLSRmcSS0XHO6kRSFc8W1FE9WSuf7U4U?=
 =?us-ascii?Q?2rDAX6cT0CaVA6Ip32YrvxK960u2DQvxKas5AhUZE08QrdkkDAyoHAOG8+Vg?=
 =?us-ascii?Q?qtmFaGUvh85Fxk9GfQkjKe2twMk9RTdR8+S43W6JF66bEeEo542jZcfzWNS6?=
 =?us-ascii?Q?rOnNXZJevE+KiOxU5yqaS12Y9wu4ZndUCzSfRGORebukp/oYn7sYKgPW1FCp?=
 =?us-ascii?Q?dna95WwYDW27KFQKRXttCfIfIzwCuryCQzQ+1le6GVpjjwjTvb7OMWMD1snq?=
 =?us-ascii?Q?VAAnXkMbKSFmQhbtg3GTXkV3TI3gWesGS8nphlpM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5237c4-83fc-4417-7941-08dd207096f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 21:03:29.7441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: muWQDfVOTBV72oNL31lKz1kN+/bUi40TiPSHrY7zyeRa1kdfzEfjaUa6KbHkAb9EYlNDYJthuRyck5zMzNm+m+oWl6ufPra1YwRKV5e2SoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
Sent: Thursday, December 19, 2024 12:36 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subte=
st
>=20
> Hi Jonathan,
> On 2024-12-18 at 20:37:06 +0000, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kami=
l Konieczny
> > Sent: Wednesday, December 18, 2024 11:04 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Subject: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subte=
st
> > >=20
> > > Created new subtest raw-card for checking all cards without
> > > loading any driver, so it could show what is loaded on a system
> > > after booting.
> > >=20
> > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >=20
> > Minor nits below, but nothing blocking:
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >=20
> > > ---
> > >  tests/core_getversion.c | 39 ++++++++++++++++++++++++++++++++-------
> > >  1 file changed, 32 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> > > index 0842b7db6..989ed2aba 100644
> > > --- a/tests/core_getversion.c
> > > +++ b/tests/core_getversion.c
> > > @@ -25,6 +25,7 @@
> > >   *
> > >   */
> > > =20
> > > +#include <fcntl.h>
> > >  #include <string.h>
> > >  #include <sys/ioctl.h>
> > > =20
> > > @@ -45,6 +46,9 @@
> > >   *
> > >   * SUBTEST: all-cards
> > >   * Description: Tests GET_VERSION ioctl for all drm devices.
> > > + *
> > > + * SUBTEST: raw-cards
> > > + * Description: Test GET_VERSION ioctl for all present drm devices w=
ithout loading any driver.
> > >   */
> > > =20
> > >  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libd=
rm's "
> > > @@ -83,26 +87,47 @@ static void check_all_drm(void)
> > >  	}
> > >  }
> > > =20
> > > -igt_main
> > > +static void check_raw_drm_cards(void)
> > >  {
> > > +	char fname[32];
> > >  	char info[256];
> > > -	int fd;
> > > +	int fd2, count;
> > > =20
> > > -	igt_fixture {
> > > -		fd =3D __drm_open_driver(DRIVER_ANY);
> > > -		igt_assert_fd(fd);
> > > +	count =3D 0;
> > > +	for (int i =3D 0; i < 128; i++) {
> >=20
> > Nit:
> > 128 seems a bit arbitrary.  Is there a max card count macro we could be=
 referencing?
> > Or perhaps we can create that macro locally as a part of this new test?
> >=20
>=20
> It is Linux kernel and/or DRM constant (as for now),
> look into lib/drmtest.c
>=20
> I could make it into a lib function like:
>=20
> bool __drm_get_dri_card_path(path, size, idx);
> bool __drm_get_dri_render_path(path, size, idx);
>=20
> /* fill in system specific path to card, return false
>  * in case of path too small or idx out of bound
>  */

That sounds good, though we'd probably want some way to pass
back the opened file descriptor.  I guess the prototype for the
dri card path function might look like:

"""
bool __drm_get_dri_card_path(int id, int *fd)
{
	char fname[32];

	snprintf(fname, ARRAY_SIZE(fname), "/dev/dri/card%d", id);
	*fd =3D open(fname, O_RDWR);
	return *fd !=3D -1;
}
"""
And, of course, there'd be a mirror for __drm_get_render_card_path.

>=20
> > > +		snprintf(fname, ARRAY_SIZE(fname), "/dev/dri/card%d", i);
> > > +		fd2 =3D open(fname, O_RDWR);
> > > +		if (fd2 =3D=3D -1)
> > > +			continue;
> > > +
> > > +		++count;
> > > +		check(fd2, info, sizeof(info));
> > > +		igt_info("%d: %s\n", i, info);
> > > +		close(fd2);
> > >  	}
> > > =20
> > > +	igt_info("Tested %d drm devices\n", count);
> > > +}
> > > +
> > > +igt_main
> > > +{
> > > +	char info[256];
> > > +	int fd;
> > > +
> > >  	igt_describe("Check GET_VERSION ioctl of the first drm device.");
> > >  	igt_subtest("basic") {
> > > +		fd =3D __drm_open_driver(DRIVER_ANY);
> > > +		igt_assert_fd(fd);
> > >  		check(fd, info, sizeof(info));
> > >  		igt_info("0: %s\n", info);
> > > +		__drm_close_driver(fd);
> >=20
> > Nit:
> > I see we're moving the drm open and close calls out of the fixtures and
> > into the basic subtest.  Perhaps it would be better to do this as a par=
t of
> > the previous patch, rather than here.
> > -Jonathan Cavitt
> >=20
>=20
> Hmm, right, I will respin new version.

Understood.  Thanks much!
-Jonathan Cavitt

>=20
> Regards,
> Kamil
>=20
> > >  	}
> > > =20
> > >  	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> > >  	igt_subtest("all-cards")
> > >  		check_all_drm();
> > > =20
> > > -	igt_fixture
> > > -		__drm_close_driver(fd);
> > > +	igt_describe("Check GET_VERSION ioctl for all present drm devices w=
ithout loading any driver.");
> > > +	igt_subtest("raw-cards")
> > > +		check_raw_drm_cards();
> > >  }
> > > --=20
> > > 2.47.1
> > >=20
> > >=20
>=20
