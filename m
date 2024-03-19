Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2383EC54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 11:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EA310F9AA;
	Tue, 19 Mar 2024 11:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNkHtdpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730EB10F9C2
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710846477; x=1742382477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QGvVdJ87GAKuF5gkbVEr+Xipw+oImRG9MTAkTEboigc=;
 b=eNkHtdpgERnwbE7dRsyGtWuaF4e3rs4g3ADYZiwpDQiM6300fFxITps3
 dGMKf8kMyZMdF5a1a7SZeEGS76AAdoIpZcJPCMPSWAaJLl08shUWIvtz1
 PamcKQNBYzw+tRxd3a1CStClt3XI4RfM9mOHXaLWlhGdlGRPPayIftGxO
 TMvCGpm2+FjM6LoJfD3yeHKBmV+k7MQFN6pJaRWnSdKbXjI7ez2S/+AJ7
 dlN+A9G1ywCtLzuxuv0SeaxYF2Kz5hi6rvXE8JbrkzCl9u1g9GRJQJtrg
 4IbzsRsAFFrA1wVb3qEpc8roesDO3p9LlAw0sSIzGPQqNAScE4Na1CtP5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="28183664"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="28183664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 04:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13871463"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 04:06:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 04:06:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 04:06:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 04:06:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 04:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enQJgD2S47efpNQKCC8M4UoqzFfy+mVyJpT0Zcf4i8he2nAMfS/fBQTqRqg7F1HotdXS6oF14Ftr1MKUmBEaQ/0OWksXoFfai1hAa5LvENnCAwCt2UzcXFdPTZlwyU9d2nNIhW6ns2JHed38syYGXwIWEzMmU/v5UIppiyCrzRfgQkLbPGx2x6Lkhn2kxMVPvL1y3PtoPDf35Ns9P7gjvT0X7FyoslyWHL0HJCdscJlQ8npLw7RTD2ERjWBQkFrmEbU2JSWuzVsO+JQ9omwsOyr6bd5WCWMbWloZZqJq2I2XO3AE3HZb/l0zQ77sbO7B/8mkRy6rkN0GRVKO6BXK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbeehWHOpKzLxh8mUFiDj/jze778c2QW300IY0gfpHA=;
 b=gfpgzT33S39fqYp7lNIR4mdX9KXoKKItnvoJ4TrkJ9J2VfXu90+2OaQik6CpIg0qzhfj6h2a5pGyaSar8x6NozmEosq4xjzH0xFfE9X6qZZMA/KQ01LX1Gy6l4joGRalgA3M5gFXoH2lOvzbcKHoDunNl51FgD/NGIB8/Fu1/WXMIG5ngtWYjBWDK2Wc4Uqcw+WsKEKLKeE5DMZF0llpWYxm8oAOhZF0dG21thG6e4ZoGbCrDfEYbeDytpeEnodFShJ5kGEagRrDjoGYM/wu7rnfmNR26YwE4R2IjWA+eLHYzuNersU0uI7YfVIEd1mnT1y/s/WtK/cjGMrkV+njcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Tue, 19 Mar
 2024 11:06:40 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 11:06:39 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>
Subject: RE: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Topic: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Index: AQHadhzitpnVXjpFI0ukPiNBs3xOdLE4M/AAgAa6dGA=
Date: Tue, 19 Mar 2024 11:06:39 +0000
Message-ID: <IA1PR11MB60971F2D3E05FDB5980226A4862C2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-3-katarzyna.piecielska@intel.com>
 <CH3PR11MB84347B67CC8A7AE42E1837D08D282@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB84347B67CC8A7AE42E1837D08D282@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DS0PR11MB8049:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eEjIvx7MDNsUi3JpZ6xmauTPZi/DuSwMaOoja9PTc7XgYBsimmmQMmEI9JME9QWlFbgZ46QWD1x+7LmkWnPhH4A8LBqcsTCsyGgHOn2evHf7mIHZVPCVnulibD2v2Se4iD+S6vYMGB7E4Olec1x4KWnB+8nxaf0kgGGpT/cL1hNSpqKNLLtqu3LXxn3dyU3jnv1KbAqWTxMU6gL5XRFQTj8nvdl7IsMny2k5QxFFgd0MxDwee5TGIyBzcqIOCh4hypD6iV3BiifqMARl+1ZULkYtpJdHIJCUJIjsSdHG6/ZvogdxceHmvL+jAVI8MKfYwIicTm+zhOfuwspQ5lMni/DC5PZqwA+GnPSg76XRoLz1+weAnhF/QfJNgxP/+wDKJYeJsEqZFK17YxtMPdHZAeH/uiOGt/VcfuZ+khjsaowvbrpcKvM+lGDFeeEIY7OriPyfKxp9xkRz/htoTlrkE5WEFR9yenLEn5J5wbp8bwZWxcRGQEBJyOJcmY0AY0KINZwWGt2QeasuJEPDyKi0jC8h/3Fnnqwd8YiRw+vaDOGggn5Cpeb7yPVu3G+nYaVtNWfHIzHqpnJ/DWxzCFpoPhkYYxiAAicEgNBa2vx23czaLIvIaGk7eoh2Xxk8jkY4YcBqUP3AAHzJPuy4RID8Yo7kEt9JXwKaA0TvDqG6f00=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pmgHZGpjF54WnvHFkX24ASGNTzx320fg4VQ9krIyaM7THfl9Ub8phtdCtj53?=
 =?us-ascii?Q?DTc5s+Xf2SSSF2wRY2e2z4XVjvPyLDAIMUdU81UojkQGXtX4r0jFlNyQ2Voz?=
 =?us-ascii?Q?q0Zj3QN+Ma/Qpp7efWh0kyJH5NDVkg/pydGdLFMXXdte1RTXikHrHI5rptOD?=
 =?us-ascii?Q?XOtTzZ7u+HsMATg++FPz5KFBl7ich55g/6B6ucyUB7s3i/WLpFRCbZmX2fi4?=
 =?us-ascii?Q?+UkfTW8VjfMQsddOKR8l6ElA0IrGOSNEEyeOqP5AM4Le7JPMtK5juRdiIa8W?=
 =?us-ascii?Q?5P0X1TchAWixVghyVru0vNCqHs3TGBILTbxULMEATA+ML85nOII+ApSUd8WT?=
 =?us-ascii?Q?kzoWSaTl5yokU4PZP5B0eUjmVCdREKBAxCgnIJRYsosUODNDyy9+AuD94jhD?=
 =?us-ascii?Q?bbcaWiwJgEask/zOFvdls15iuPNWqUVOHhmTV+yA6mCKiOQZIkxoDhXoysE4?=
 =?us-ascii?Q?oeSpmOBh1Qd9mM3KCSjyX+WNBMEluyYETTQQCkYxyZaMrlj2kGM2/W2q2O0z?=
 =?us-ascii?Q?Ls0K/M7BUGJL3QUNCbsRZmDSzPRknUn5vx9PE2D3FB3herJ7LNNrsGEhEtNu?=
 =?us-ascii?Q?Hg8nNmiL8gsooqwyrNun6238T+thhlXqpqBUQlheaoiuOfWqUyL8TpqmVlwi?=
 =?us-ascii?Q?Mmw+aeEyCCWhANbiqWc8G3fA+sSVh4xFH5z+IyzVGXAZODw7DreaqcGPQI5I?=
 =?us-ascii?Q?UyzoRcXEfodagmTg1DITFDr8y7cBvMePInvlybIe8L+BpSCHP8GfOzQ5oW/f?=
 =?us-ascii?Q?g9+AXaCNLZthsqJyl7ZM7T0EM4WKhq+08ZaSPH0h9dOg1O7qal9AbHfBaFuH?=
 =?us-ascii?Q?ZhjmdlweybFKHUcd41vSM3Hc/R6Dl/Jbca4ubx+L7iBioM4qYBFNBcD6VZ0k?=
 =?us-ascii?Q?Ag9IIH2qzqrzDJp+7XqPGa+eJeI9AWAr4bursuLu5QyipLyKPgbE32ZkrRDT?=
 =?us-ascii?Q?iFU0UYjPK+L4X4HuUepdK5tWnLkJ5O4YPH4Bq1v5evEM2Uu1OiTgxpgM03qc?=
 =?us-ascii?Q?OJa5jOfrSTUcGJJcgsDq0btN11YSy2/M80Vy56sxKOCzMiKOpRXLMTYTwk6n?=
 =?us-ascii?Q?1H0GX0G8xb3jYQwfhDUJ7OgXmE1MwXo13lHr+f1DuJzg1RPO1Omyo4vxqx68?=
 =?us-ascii?Q?LCSN8i9oS/bVOggRys6QEZiUi65oz63lf4HBG8nqtJyQtg5bVLASs7nBBHlo?=
 =?us-ascii?Q?kP0D35dHt/9yMXsw5AB0cmrUiyJtERXLkdF4LvnfKsrQ5xJKHuLSt9PBORjz?=
 =?us-ascii?Q?qEdd5N2y0QMEngUJmuMdOQC7wpuYsHXN1QSQHEk8KfcyFc1gFqDV/2GF0A5N?=
 =?us-ascii?Q?pWalsxG97cMxXQIq7EhTCNRYppPmysghYBRhKnj1FmZD7GOURPWQVPBlXkK+?=
 =?us-ascii?Q?qrR3WKxGAaXMqeIC3bhyyKMMhnGv/dwRX53YcLhlKMDFku+3t4huZUJh9i1Q?=
 =?us-ascii?Q?koO+XMVXV17zvEC0AEOvUOp1rYa/NgA07RW/h/P6rmG/AIRu8uy161dOvrLn?=
 =?us-ascii?Q?ITOK0mLJ1wV+kwLr/7GsYAdaPBsNhmOyKWsSxXixDzu//hGDgYxwq5jT8vX/?=
 =?us-ascii?Q?lU3zlCVsuf8PzQqktNH5HvJ4VYK7YvE5NDBszV+yO+c79bPPxkSPeMWH5nMf?=
 =?us-ascii?Q?yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b540c4ad-9342-46a4-5945-08dc4804a6e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 11:06:39.6645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGX9fg7KUdi7j6UjDvMb45V7TPEwq7FWP2EkCO/z7GIiIMBrUatFgpvM6JhHHLmpPutAss4yimCk+Po32LWRkEbhGXqap004s0L7AE1vDJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
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

>   * TEST: gem set tiling vs gtt
>   * Description: Check set_tiling vs gtt mmap coherency.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling vs gtt coherency
>   * Run type: FULL

For some tests, there is a Test category and for some it is not present is =
that expected?
For Example, see above it doesn't have the Test category. Can you please lo=
ok into it?
--Priyanka
[ Katarzyna] Test category is not a mandatory field for documentation. Curr=
ently I am not updating that. We can look at this field later.
Kasia

>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c
> b/tests/intel/gem_set_tiling_vs_pwrite.c
> index ede0c58b6..a358ddba6 100644
> --- a/tests/intel/gem_set_tiling_vs_pwrite.c
> +++ b/tests/intel/gem_set_tiling_vs_pwrite.c
> @@ -42,6 +42,9 @@
>   * TEST: gem set tiling vs pwrite
>   * Description: Check set_tiling vs pwrite coherency.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling vs pwrite coherency
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_streaming_writes.c
> b/tests/intel/gem_streaming_writes.c
> index fc2d3d89f..dd2f28331 100644
> --- a/tests/intel/gem_streaming_writes.c
> +++ b/tests/intel/gem_streaming_writes.c
> @@ -43,6 +43,9 @@
>  /**
>   * TEST: gem streaming writes
>   * Description: Test of streaming writes into active GPU sources
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: barrier
>   * Run type: FULL
>   *
>   * SUBTEST: batch-cpu
> diff --git a/tests/intel/gem_tiled_blits.c=20
> b/tests/intel/gem_tiled_blits.c index
> 27971a2b9..ec6e88477 100644
> --- a/tests/intel/gem_tiled_blits.c
> +++ b/tests/intel/gem_tiled_blits.c
> @@ -58,6 +58,9 @@
>   * TEST: gem tiled blits
>   * Description: Test doing many tiled blits, with a working set=20
> larger than the aperture size.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled blits
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_tiled_fence_blits.c
> b/tests/intel/gem_tiled_fence_blits.c
> index c536c3699..920eeb42d 100644
> --- a/tests/intel/gem_tiled_fence_blits.c
> +++ b/tests/intel/gem_tiled_fence_blits.c
> @@ -51,6 +51,9 @@
>   *   Tests fence management problems related to tiled blits by performin=
g
> many blits on tiled
>   *   buffer objects with fences enabled and with working set larger than=
 the
> aperture size.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled blits
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c
> b/tests/intel/gem_tiled_partial_pwrite_pread.c
> index d4f66d51e..c4686739e 100644
> --- a/tests/intel/gem_tiled_partial_pwrite_pread.c
> +++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
> @@ -42,6 +42,9 @@
>   * TEST: gem tiled partial pwrite pread
>   * Description: Test pwrite/pread consistency when touching partial=20
> cachelines.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: FULL
>   *
>   * SUBTEST: reads
> diff --git a/tests/intel/gem_tiled_pread_basic.c
> b/tests/intel/gem_tiled_pread_basic.c
> index a2253b51e..13181d86c 100644
> --- a/tests/intel/gem_tiled_pread_basic.c
> +++ b/tests/intel/gem_tiled_pread_basic.c
> @@ -52,6 +52,9 @@
>   * TEST: gem tiled pread basic
>   * Description: Test pread behavior on tiled objects with respect to=20
> the reported swizzling value.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: BAT
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_pread_pwrite.c
> b/tests/intel/gem_tiled_pread_pwrite.c
> index 2f0f6f547..f8bc79731 100644
> --- a/tests/intel/gem_tiled_pread_pwrite.c
> +++ b/tests/intel/gem_tiled_pread_pwrite.c
> @@ -62,6 +62,9 @@
>   * TEST: gem tiled pread pwrite
>   * Description: Test swizzling by testing pwrite does the inverse of pre=
ad.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_swapping.c
> b/tests/intel/gem_tiled_swapping.c
> index 90ce70bdb..13f9fb41f 100644
> --- a/tests/intel/gem_tiled_swapping.c
> +++ b/tests/intel/gem_tiled_swapping.c
> @@ -62,6 +62,9 @@
>   * TEST: gem tiled swapping
>   * Description: Exercise swizzle code for swapping.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: swapping
>   * Run type: FULL
>   *
>   * SUBTEST: non-threaded
> diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c=20
> index 6a8b79ecc..ee17b587d 100644
> --- a/tests/intel/gem_tiled_wb.c
> +++ b/tests/intel/gem_tiled_wb.c
> @@ -51,6 +51,9 @@
>   *   This is a test of write-combining mmap's behavior on tiled objects =
with
> respect to the reported
>   *   swizzling value.
>   * Feature: caching, gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c=20
> index
> 1994453b3..356b48829 100644
> --- a/tests/intel/gem_tiled_wc.c
> +++ b/tests/intel/gem_tiled_wc.c
> @@ -48,6 +48,9 @@
>  /**
>   * TEST: gem tiled wc
>   * Feature: caching, gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiling_max_stride.c
> b/tests/intel/gem_tiling_max_stride.c
> index 5943ed93f..93b89b00e 100644
> --- a/tests/intel/gem_tiling_max_stride.c
> +++ b/tests/intel/gem_tiling_max_stride.c
> @@ -43,6 +43,9 @@
>   * TEST: gem tiling max stride
>   * Description: Check that max fence stride works.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: fences
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_unfence_active_buffers.c
> b/tests/intel/gem_unfence_active_buffers.c
> index d3bc1cee6..aaa841f46 100644
> --- a/tests/intel/gem_unfence_active_buffers.c
> +++ b/tests/intel/gem_unfence_active_buffers.c
> @@ -56,6 +56,9 @@
>   * TEST: gem unfence active buffers
>   * Description: Check for use-after-free in the fence stealing code.
>   * Feature: synchronization
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: fences
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/i915_fb_tiling.c=20
> b/tests/intel/i915_fb_tiling.c index
> 14c17b030..e1dc54cc5 100644
> --- a/tests/intel/i915_fb_tiling.c
> +++ b/tests/intel/i915_fb_tiling.c
> @@ -27,6 +27,9 @@
>   * TEST: i915 fb tiling
>   * Description: Object tiling must be fixed after framebuffer creation.
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c index
> 90d79864f..79f5922a9 100644
> --- a/tests/intel/prime_busy.c
> +++ b/tests/intel/prime_busy.c
> @@ -33,7 +33,7 @@
>   * Feature: prime
>   * Functionality: buffer management
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: after
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c index=20
> 25b2939e9..e0735496a 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -54,9 +54,9 @@
>   * TEST: prime mmap
>   * Category: Infrastructure
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime mmap
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: test_aperture_limit
> diff --git a/tests/intel/prime_mmap_coherency.c
> b/tests/intel/prime_mmap_coherency.c
> index 01eb2002d..61bc5d312 100644
> --- a/tests/intel/prime_mmap_coherency.c
> +++ b/tests/intel/prime_mmap_coherency.c
> @@ -38,9 +38,9 @@
>   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bu=
gs
> so we know for sure where
>   *   we need the sync ioctls.
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime mmap
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: ioctl-errors
> diff --git a/tests/intel/prime_self_import.c=20
> b/tests/intel/prime_self_import.c index 2dbf4e20f..e1dcebfd8 100644
> --- a/tests/intel/prime_self_import.c
> +++ b/tests/intel/prime_self_import.c
> @@ -51,32 +51,27 @@
>   * Description: Check whether prime import/export works on the same=20
> device... but with different fds.
>   * Feature: prime
>   * Functionality: buffer management
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
> + * Run type: BAT
>   *
>   * SUBTEST: basic-llseek-bad
>   * Description: Check dmabuf llseek support with invalid values.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-llseek-size
>   * Description: Check dmabuf llseek support.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_fd_dup
>   * Description: Check prime export with duplicate fd.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo
>   * Description: Check prime import/export with one buffer object.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo_two_files
>   * Description: Check prime/flink with one buffer object.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_two_bos
>   * Description: Check prime import/export with two buffer objects.
> - * Run type: BAT
>   *
>   * SUBTEST: export-vs-gem_close-race
>   * Description: Check race of gem close against prime export.
> --
> 2.34.1

