Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D41CA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 06:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1246D10E594;
	Mon,  5 Oct 2026 06:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlKAyPEj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EF710E594
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 06:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791183398; x=1822719398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b+CrkuvQAK3ThRcOgj5jMZ9To1AnjvoIAKB/Ng3eriY=;
 b=jlKAyPEjUUYfuwT7NLJuiIBhTSZU+ZVPddFdoo1yLCEJEmA1bR2Xl3b9
 MhYHyAkf7t+ctr2zJqLMNg+cSuBKAZaTeyiaCFLsqCdVPAGWLeeckkK1o
 1s1NFoo/SW9d/+TIwpQgJVdIVrJZM4B7f69vXqnO0ssWqC7GGK47UbeOg
 5tUI+ylsnOUhWxwvhlcTEuiewJ6Pyq1s/cyfrGAoAPc75F3I2vPoxgRI1
 uYU2TxrtCG+hkS3bMrNLaIjoI8SJReqiGUh/G6+gjNu9D0zAQ4luAim+S
 zTSYmjYrI5rBLJfy44YbhoUmbnBzUzYW0afM3qZh2yOSmZ5fV+TDbl6nI w==;
X-CSE-ConnectionGUID: 0OW8rs56RTaLBgCniZ0huQ==
X-CSE-MsgGUID: cI1b8OM+RSK8FaBjwIeBig==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="79403700"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="79403700"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:56:38 -0700
X-CSE-ConnectionGUID: jvUftPwOQKGn5gpIjliMrQ==
X-CSE-MsgGUID: ImhxswHfRZaY/qEdC2WIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="823943"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:56:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:56:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:56:38 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/bB+bt2JiMKElhuWTMFjMqo8/WllsCuhlb+NYsvpKTfrJ2CiDMcHY13nz7j7uQaX+IMvsPhhl5/HY5ADbjEZltbVQCurLf53R7D4l+zcKEVsdPmINx6TksFjLDt8QbS6cUJVYrJQwc553udKbNp5PtsWTQ68SRR+Q6ifa0uatqkz5s7xaBG9C/buoux3az8H67DCbAlV3ZiMe97BGB1X3Ttzol2+c16Pcmx7LMeVGcAvj6gCBleIUk7Re0EIIsTTTiYxW7Q8MU0FDw0c/H/7yStFxhlo3gLq2ar9BckfxeHrhazNYV9oP1xGv3rCxaL908G4E3L7T0DBRgOktBtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVSUPwTLCDMGTwG3AVT+gd4Awodj1sEDbj2bernY/TA=;
 b=Eroh8JG9XRuQeXB5r08zKD3lL8mR7bZ695ttdMeM1tnDJ+FWguwPsnhPwFmKtMtvltM5XRew/ZNAmaACeQPuhG9Y3jMzKbGl+JnekPnE1MWQq2tM458Jx9XPIq72I8Lw9GqAYDcOEHSX0Uqm0uYBgHyIcNYQxqcD/sw21zt0V8b1gIxAxsAc/lWAZNtkdB7E2M6ljUok8p1KDz8e8DUlspI9GGTLk9O6fqbCZR76ZpQpoRkxzpJFM/RRL9WPyEKx9vz2D143hf7luaCXacf4x7c4PeaUhAL5Vxzg0vu5Y8cWTQHqQvTdQb7qWCutOv0j2jMaFedRejOP1dlXmVchTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS6PR11MB622039.namprd11.prod.outlook.com (2603:10b6:8:52b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 06:56:35 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 06:56:35 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 4/5] tests/intel: Add threaded random-size
 allocation stress tests
Thread-Topic: [PATCH i-g-t v5 4/5] tests/intel: Add threaded random-size
 allocation stress tests
Thread-Index: AQHdSoIvbYasOorVu02UheWCFeYr3LbulvVw
Date: Mon, 5 Oct 2026 06:56:35 +0000
Message-ID: <CH3PR11MB8434785B888540B99D8B4BCF8D962@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-5-sobin.thomas@intel.com>
In-Reply-To: <20260922110438.2402109-5-sobin.thomas@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS6PR11MB622039:EE_
x-ms-office365-filtering-correlation-id: 5c664fe6-798d-465b-5b1a-08df22adcbb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10070799003|10086099003|18002099003|22082099003|10067099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: Kp7bqgwzJZLQ83xgduqhdhOEipNOg+RX4w44ixqiBta8MFW+UhqAAqu5bH+4rDZmuFr5wJ85ucUaR4cSeA5lx1wcHZ5jirz/Jf7DwjE69BaqsA8LS2O39lfhOR6Ksc9QWut0tV219N5aGlxmNsCXo7q/3xC4H0HMtqfnAnkgVZNsKJ8x5qj76CCcR4pRtGe+NEzfn4iY4MggD1xbaOSreAzqhcp9dWH7Vffuq09Nq1AKtiSa+SV0nZaKuAxnG+rg/624q1oi2IFLqOAlun0/zx8OfZyEasFy94o01M59Wy05WzWZDWNssmUOxuIXkmDExZgcnpOSz4UGV5y3tSDsFVaB2N3BvzinK8DIYGkMmIcNOUrjHvKVoqmCyxc1GcSjMxgivfRXF9Y+88/5TNKHNoYcEtsqIlgwhf0LvN/lK+nePTGnC7o+8C69C35jZXd0uLtlFFAXWe60kMrLKEO2D8Z11ahDTPtu7JM1Vkwk5hCwcynnk/ND149dV5ckJnUPuh3vcDz5RxTFGcjznSdFSqt563FFovc+SVzCQKLBbAgiJuvEVWD6HOgA/wddAoYtKvka+UVFgDB1bLA59o1wS8qz0DyFCgonLykCRaK8qB/QD+uBCm0Ifo2ODd8WL9VGECRBEkIhavCSx6zw9tZCktCqvJ5mUf59+poBfgBUyEV29ts47cCdbeSFrZ03m1VXG6yMZde/yl/6SrFlbBE6qOFRuShSSdjnI+mOdRomwuc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10070799003)(10086099003)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hIP7EZ0weoS11oGkqNG05V2jffZArMJLI5sUOG2oLBKsrs84WqoCaL/vynKR?=
 =?us-ascii?Q?jhAk2tDciDcZiLDkrG/tePC/3XAk0Xy7Vq2CtKYAnlOrYCactlFwhJ6Y5NZ5?=
 =?us-ascii?Q?Wb+Q4f1BoK7FMeM49k+SKQ1ivja/QeE7S9xoCetDy0fuVDTvSETxR5NTm9oO?=
 =?us-ascii?Q?KKSDLeqDU7fRB1Svt57s1Mbiiv5retl6mCK6H+j615Z8hpFI4qVBzJ0SX+cf?=
 =?us-ascii?Q?5GIqcX7o17vHiZMaPSVQJROdN5VACxM0DTjMPzVe7i3fLBmAdx5YLD1Knk+W?=
 =?us-ascii?Q?cSv6G88gdoNNOi6zzVsITaIfZO3tCcYVLM8t+roVpNLmstoA94XIVce2Py0B?=
 =?us-ascii?Q?F3mD00tCrISRE7YcrmEOdWCJw3R3Com+fNRpAR8Ndu12RRtUqQqbF6YUdFvD?=
 =?us-ascii?Q?ADh/8RV64ewT4PFGRVmWRsSKG9KI3/bw6wvnFePcZIwf6VJ8CzIDXXz0hfqj?=
 =?us-ascii?Q?F1MZ4l49D74kDSPS8X9ZetMFfdZxTEMAIc7yqwimhhg3yM27pdC0IbevnuIV?=
 =?us-ascii?Q?N+E9a/1Zmog61sNyYK1yrRqW3nyi72fB8t04KWOPd2HLh54Kr+DNgYwQ2SJ7?=
 =?us-ascii?Q?w4c6iUz6w9XBctGZ9Xk0r6IT6qb4A4xUkQl7cu5hrUom3rT74V4a1qTymasv?=
 =?us-ascii?Q?Aw9uNQ5lXHZGnchaSjWKnUPJqhHW9XVCJ1uH7Pjy4ypOLeZZCaMiISOEeHor?=
 =?us-ascii?Q?1C4WqSy7LQaB64Pf5ySnqvJN3CFrfVAx+qOEFETqIoog6jDnl0nCd3y26yWb?=
 =?us-ascii?Q?L7rT9v/h1dmFe6ChdmRpUNAgl2R01BPUUPiJ6mTGkthi8i8jCWtFgE9bJUov?=
 =?us-ascii?Q?OYZWaB5E0KaFd8MuL3Ztn24WuFb62cnY/bWkDTdjgFyV/7ggprhDX5detaRm?=
 =?us-ascii?Q?iYT960/FGXOGf3fBq2L9F5FhzLU7WQbdivtY7Xyba8S+FJ1hKQT9h3f+oirV?=
 =?us-ascii?Q?AqUPFIj8NNLywKXWSPyJx/WFVRGn4gsZ14BsOURoKs0eckjc6jsMQQuR2LOq?=
 =?us-ascii?Q?eRpM/4YsAi6utKhujECBAwj7GXGWSe5mouxyZqHiY+4AZMK4atlCxx/Iukbi?=
 =?us-ascii?Q?plkY54HTwEYLEl9a7VyxMLynK3ppAGhnWtJOzAwvKLeMdBeXnN8AVUpgFAYa?=
 =?us-ascii?Q?0Bg26V4nRmy0LwkLr1KaQojg8uFFgRB0qHEiCIt48qO/TKoo9AHVm7vsF6p0?=
 =?us-ascii?Q?A6j5mpyV7wlXv/+wU5cSLMoUkmLRT9+cf+3NqLvMZ6ocbuCndp5T88AjfIvT?=
 =?us-ascii?Q?5ICToiXUH5pE8rEZmvd1q6MhIbLKsKWW1R95bYhsvSuiWKQnJ0GXVj/psrvt?=
 =?us-ascii?Q?7TeVFOZYJiEeC4tDuC1io9Z4SV5sCB2zrizg3JcGrfefrs2OuNbPE+MKw+DL?=
 =?us-ascii?Q?Tf7H3uXxmTkbcucfjHy2BHLv32UPREgfNrIGUQH76IsMfVV14Tqmytz8v6IQ?=
 =?us-ascii?Q?NQv/wYfJVCVYaMOlHqb1F+8aZHDqGW0lnF6eoOhOREqeAdVWHtsI0o79mdCO?=
 =?us-ascii?Q?qJOqsFzukXlrUBX1Mn6Uey1SmEw7/YMQpawgxKY6cEx2BhwPm3KtBVHUpLrW?=
 =?us-ascii?Q?LJauAL5GGjo2r5eCq1awAdAZXvCNBn1UgA93DruD7Msnqwlq75xEj2pQKl7S?=
 =?us-ascii?Q?YWEiK8to3Tt2euyCtmBE+UGrEftyYiyAqBAiUQeocAsYN2LcYZWgSFQ8kHN3?=
 =?us-ascii?Q?FKTjxrc1C7ihY2bAOEhOyaAbOQNDKsp9kZgpZS54U6g1OeYnB2u5ApxataNY?=
 =?us-ascii?Q?vcotEeao3rYm6t8M4lxHB/bXcpBr/KnTaNL8sddG4+p72G6Lrrx3MrkpL39o?=
x-ms-exchange-antispam-messagedata-1: b6uZeeyYLzmO6oTlSuCw1vWAyyip+u4W1uA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YRjp/GrQTOoZxS4Jq7AyQlH1O0H2O4QjxecJlo3U1bZfp9yPF8sRgvHGIi+O1Tir8MGf4lXeC8sDMZO5UuFzJTckSHtbYtrIZDsplfDLLzwP48R72YSD9d8eED5FjG+THgeE+b2hdIqWpwhyJLa6Nij0yJylxJmhLmTutbm8CkQZCJjZa3JCFVnrpQUarKjYPUSFEFcIIwme101bhHtz0X0O63iZj21zXaqaOQlsvnXll/HsBPqX/6wBD5XeMcbueqgABXxCrnCupZc9+Dz4TC84TjBNwhBUpWNzQUBQ+KnYFefT5v/vIFmvkT+lofATGFC3PNFmfClOOis+Hl/yrg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c664fe6-798d-465b-5b1a-08df22adcbb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 06:56:35.1784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rdys1oiaECHa2nLr5e6E6Jbw0QrX6N3hMvSNjhGlZ9Cwdy6JW9Q/nCVkpXy/t6SfG1FJTgHeWswD6sSS9Q3XQb0NvVHH2gh/Oqr3a3tI460=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB622039
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
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 22 September 2026 16:35
> To: igt-dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.co=
m>
> Cc: Sharma, Nishit <nishit.sharma@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t v5 4/5] tests/intel: Add threaded random-size alloc=
ation
> stress tests
>=20
> Add a new TYPE_THREAD test mode that creates a worker thread per availabl=
e
> engine and performs random-sized BO allocations concurrently.
>=20
> Each thread creates its own VM and execution queue and exercises the exis=
ting
> allocation path with both aligned and unaligned bind addresses.
> Additional variants cover leaked bindings.
>=20
> These tests provide additional stress coverage for concurrent BO allocati=
on and
> VM bind activity across multiple engines.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 149 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 148 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c index
> 343d07626..d8368087b 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -56,6 +56,26 @@
>   * Description: Test 10 batches of 10 random BO allocation sizes bound t=
ogether
> as a single
>   * array of binds, unaligned bind addresses
>   * Test category: functionality test
> + *
> + *
> + * SUBTEST: threads-rand-sizes-50
> + * Description: Test 50 random bo allocation sizes in test table with a
> + thread per engine
> + * test category: stress test
> + *
> + * SUBTEST: threads-rand-sizes-50-unaligned
> + * Description: Test 50 random bo allocation sizes in test table with a
> + thread per engine,
> + * unaligned bind addresses
> + * test category: stress test
> + *
> + * SUBTEST: threads-leak-binding-rand-sizes-50
> + * Description: Test 50 random BO allocation sizes in test table with a
> + thread per engine,
> + * leak the binding
> + * Test category: stress test
> + *
> + * SUBTEST: threads-leak-binding-rand-sizes-50-unaligned
> + * Description: Test 50 random BO allocation sizes in test table with a
> + thread per engine,
> + * leak the binding, unaligned bind addresses
> + * Test category: stress test
>   */
>=20
>  #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) @@ -82,7 +102,8 @@ sta=
tic
> uint64_t *alloc_sizes;  enum test_type {
>  	TYPE_ALL_SIZES,
>  	TYPE_RANDOM_SIZE,
> -	TYPE_ARRAY_BIND
> +	TYPE_ARRAY_BIND,
> +	TYPE_THREAD
>  };
>=20
>  struct test_case {
> @@ -129,6 +150,20 @@ struct batch_data {
>  	uint32_t data;
>  };
>=20
> +struct thread_data {
> +	uint64_t va_base;
> +	pthread_t thread;
> +	pthread_mutex_t *mutex;
> +	pthread_cond_t *cond;
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +	int count;
> +	uint32_t vm;
> +	uint32_t flags;
> +	unsigned int seed;
seed variable is not used anywhere in this commit.
> +	bool *go;
> +};
> +
>  /*
>   * Reserve a chunk of process address space to use as the VM bind addres=
s
>   * for a BO, and hand back a pointer inside it aligned either to bo_size=
 @@ -766,6
> +801,103 @@ static void alloc_random_size_bos_array_bind(int fd, struct
> drm_xe_engine_class_
>  	free(leaks);
>  }
>=20
> +static void *bo_alloc_thread_fn(void *data) {
> +	struct thread_data *t =3D data;
> +	uint32_t q;
> +	int i;
> +
> +	igt_assert(!(t->flags & LEAK_BO));
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (!*t->go)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	q =3D  xe_exec_queue_create(t->fd, t->vm, t->hwe, 0);
> +
> +	for (i =3D 0; i < t->count; ++i)
> +		test_alloc_size(t->fd, t->vm, q, t->hwe->gt_id,
> +				alloc_sizes[rand() % N_ALLOC_SIZES], here  rand_r(&t->seed) can be u=
sed instead of global rand()
> +				t->flags, t->va_base);
Same va_base is being. t->va_base is set once per thread and never advanced=
 between the 50 iterations.
threads-rand-sizes-50 is fine as it binds and unbinds+releases after each i=
teration but for leak it might collide with previous one.
> +
> +	xe_exec_queue_destroy(t->fd, q);
> +
> +	return NULL;
> +}
> +
> +static void run_threaded_bo_alloc_test(int fd, int count, uint32_t
> +flags) {
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance **engines;
> +	struct thread_data *threads_data;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	bool begin_work =3D false;
> +	int n_found =3D 0, n_threads =3D 0, i, ret;
> +
> +	xe_for_each_engine(fd, hwe)
> +		n_found++;
> +
> +	igt_assert(n_found > 0);
> +
> +	engines =3D calloc(n_found, sizeof(*engines));
> +	igt_assert(engines);
> +
> +	i =3D 0;
> +	xe_for_each_engine(fd, hwe)
> +		engines[i++] =3D hwe;
> +
> +	threads_data =3D calloc(n_found, sizeof(*threads_data));
> +	igt_assert(threads_data);
> +
> +	pthread_mutex_init(&mutex, 0);
> +	pthread_cond_init(&cond, 0);
> +
> +	for (i =3D 0; i < n_found; ++i) {
> +		threads_data[i].mutex =3D &mutex;
> +		threads_data[i].cond =3D &cond;
> +		/* reuse engine 0 if only one exists */
> +		threads_data[i].hwe =3D engines[i % n_found];
Here i%n_found is not required just i is enough as both are same.
> +		threads_data[i].fd =3D fd;
> +		threads_data[i].count =3D count;
> +		threads_data[i].vm =3D xe_vm_create(fd, 0, 0);
> +		threads_data[i].flags =3D flags;
> +		threads_data[i].go =3D &begin_work;
> +		threads_data[i].seed =3D i + 1;
> +		threads_data[i].va_base =3D BO_BIND_BASE_ADDR + (uint64_t)i *
> THREAD_VA_STRIDE;
> +		ret =3D pthread_create(&threads_data[i].thread, 0,
> bo_alloc_thread_fn,
> +				     &threads_data[i]);
> +		if (ret)
> +			break;
> +		n_threads++;
> +	}
> +
> +	ret =3D pthread_mutex_lock(&mutex);
> +	igt_assert_eq(ret, 0);
> +	begin_work =3D true;
> +	ret =3D pthread_cond_broadcast(&cond);
> +	igt_assert_eq(ret, 0);
> +	ret =3D pthread_mutex_unlock(&mutex);
> +	igt_assert_eq(ret, 0);
> +
> +	for (i =3D 0; i < n_threads; ++i) {
> +		ret =3D pthread_join(threads_data[i].thread, NULL);
> +		igt_assert_eq(ret, 0);
> +	}
> +
> +	/* vm is created for every slot up to n_found regardless of thread
> creation success */
> +	for (i =3D 0; i < n_found; ++i)
> +		xe_vm_destroy(fd, threads_data[i].vm);
> +
> +	ret =3D pthread_cond_destroy(&cond);
> +	igt_assert_eq(ret, 0);
> +	ret =3D pthread_mutex_destroy(&mutex);
> +	igt_assert_eq(ret, 0);
> +	free(threads_data);
> +	free(engines);
> +}
> +
>  static void run_gt_dynamic_subtests(int fd, const struct test_case *t)  =
{
>  	struct drm_xe_engine_class_instance *hwe; @@ -849,6 +981,11 @@
> static const struct test_case test_matrix[] =3D {
>  	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true
> },
>  	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | UNALIGNED,
> TYPE_ARRAY_BIND,
>  	  true },
> +	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
> +	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD,
> false },
> +	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING,
> TYPE_THREAD, false },
> +	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING |
> UNALIGNED,
> +	  TYPE_THREAD, false },
>  };
>=20
>  int igt_main()
> @@ -864,6 +1001,16 @@ int igt_main()
>  		const struct test_case *t =3D &test_matrix[i];
>=20
>  		switch (t->type) {
> +		case TYPE_THREAD:
> +			igt_subtest_f("%s", t->name) {
> +				if (t->requires_evict_ram) {
> +					igt_require(xe_has_vram(fd));
> +					igt_require(igt_get_avail_ram_mb() >=3D
> +						    (xe_visible_vram_size(fd, 0)
> >> 20) / 2);
> +				}
> +				run_threaded_bo_alloc_test(fd, t->count, t-
> >flags);
> +			}
> +			break;
>  		case TYPE_ALL_SIZES:
>  		case TYPE_RANDOM_SIZE:
>  		case TYPE_ARRAY_BIND:
> --
> 2.52.0

