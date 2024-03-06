Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E28C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 09:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D164F10F5F8;
	Wed,  6 Mar 2024 09:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4SKlCDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3C510F5F8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709718331; x=1741254331;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V0yoPgQgJiKMyl+BQCC8mVn86XEbbik64+GGkCLsdcU=;
 b=F4SKlCDWq4sIxxeX4zlUL9Z/3e3bcARVkUyvPR8DaOHeNc7knhhtUAow
 sYsJb1Yqc8gimTPx52LhqL1OUrbK1WhklVppZtP2B0lObHVoqfiSeiGND
 ocHHt1mKaSdYALYXMEbGgiPKSY87qIbohY+qTd1YsagLMKkoy79V8QrGg
 TC9E5p0ECRUE0lRNC1tok/AqlXFaWD9APe7+qskki27AXV1SRngYZ/5Cu
 yABS54PQDKuOnZu44ygnM9TthckTBhUf/2pwoEUKe0SpBejhijOyULwY5
 dqsoyp6dghVTyOXwQvMAytbLgXMQlcciCAjUYKmpz262GWGkPheO5TH3J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="14898663"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="14898663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:45:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="14259001"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 01:45:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 01:45:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 01:45:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 01:45:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXmvb51gNa0HAx9lqSGNHD7UO0SsIqY7PXHWwnKlNoyMIXrEGE6f4bWTHubJxYWXG1ECEor4bXoowy4i4ColeGh+rDaPyuwnEFTb6fTBtwD7WuLL2wYkkBPzzQWrcmzKkyZnwshToYJkgzrIxeuA1Gh3+PGzKvouDdzfHsVXcr+3ARjL9u85Z0i1mxFLHsfB0ZDMQr0SHc513JSHKLr1VZhpiTx6LgItXVrGbM+UtSwPGOqa9cyuWv+ZtsJhP8AUzY4o7FRhhW8vSB6p3N59ARp5IwKi2H/G/LeD7znhNDrO9rUoO3k5Lrp9e5JfQtyJxwV4YSs9RyY3S1fqhvxjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzF6UMyUgpjpGEKzju2AFkFXAOL/ZPy8kXE66oPtlOo=;
 b=Ap6TZvfW/ioPxsqDbCocy72F88cXzRHiyiboDKabp2afiE8s2VnBJAELfHxkVN+q3+xvwVH8dobEkIw7Hly2OwFjE+hn/DyyImu85qANKv6niM10+0CgYdazazND5kASgKSHX2+1d4b3aTAOeWsZ77vIbuXWu9rAh4Cauakzb8dYBZ5U7scy4gnyAGJMI6sRs9+Y6RT4OOrN9NXGPKLJZJGAb5Ady1+D04IBbFE1KX+DcPs+17Bsmag36Kls6TK89o4lvhlRhS7K1q3d10HVNu5Gty8HT/EvrSZqfDO02gvbM1ZU1ED7zZhZ2WBaQOWNHExc3qhEhhD2u9VBvKLJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 09:45:27 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 09:45:27 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 01/24] tests: Introduce uapi subcategory
Thread-Topic: [PATCH i-g-t 01/24] tests: Introduce uapi subcategory
Thread-Index: AQHabiV2sCjxnOSJ40CalMq5gQ5IEbEnrD8AgALNNOA=
Date: Wed, 6 Mar 2024 09:45:26 +0000
Message-ID: <IA1PR11MB609736DF0C330BCC0652716086212@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-2-katarzyna.piecielska@intel.com>
 <20240304155726.6c9c4233@maurocar-mobl2>
In-Reply-To: <20240304155726.6c9c4233@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|LV3PR11MB8743:EE_
x-ms-office365-filtering-correlation-id: 286fac4a-640a-47fd-b83f-08dc3dc22735
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wVBwKEeBcFotZO/8n8j8nDd3dqKumgB0nrXgpXrUtHJluRWN5vngULE/acGmmcRGWBqvhWbGTB08B7/R68MijStGeemTER5LB2ilece/+34RMD9Na60UTWf/LN3Zgl3DGbDU3JSpPMQVe3lu97tuQbiSYW/CqQks6oZa8GrfTHINOjb1EFGKUCkDWhjPItNneNgaPHVtxnxv3HAdtFcR0I5fYtlXBYgvOb/k5weYTyFLiWyBz450K37gSQdllcgx+YbgS+f+hCpwWjoDMnMSogOVFk9NgiLu7IZUpWk3ftNgn7GBP7wHUA0tC9rlwfZ7pkF0tN6UIcRvYVKfOecC7BgsXVims8LB+O4qDzBv72XEftP5mdL/FIvoVy4UpVi39Y15VTubWCb4Q9Gk7TjZtGl2TGmUyydfYkEeEBt99kvX5cOgYieb5Yx/7Pa237aSNrxFpuBJLfYrgfrcalTsUmRAJieZeKc+Q+8Iv5Dps4G35rD1w4cHsPOjJssGRB1X1gcRZ2a9mW8PxPnEtta6KpVrPg8EeLC6wW3PuWeCK2mOxBwloNpEoDBAIlXoTo6S8H6z1Fc1blM1F2zEYqhfq+6HfwkqY2LbmXImNMURvwUAyeUqDVoWRwH1ctb4hi+BHaP3c2fPTQuwzp96l7InxdMcCDzzQFu/P/4C8xwcskhsgQjWIbP4C5OZ2jocOBhFwApWQBgNMYqnhKFwUZxPoTA+bjrz6rBRZT8uBCD3DP4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ba1iG1kGvl6Iq+SG/00uMOdvPFdaJcQ0W64QFM4NG5jvvjyX44sYUL4P1U3o?=
 =?us-ascii?Q?ObXsI+9YWznGzSOf09zF66XRbv0oSB+QMOVVP2rYxBje96g1IXCiRitt/Dil?=
 =?us-ascii?Q?VR2U4Vct89m6ePapeCeGr8xQHPW4oxBizh0PdfcR0vglwdaAzw2vr3jOH1Xs?=
 =?us-ascii?Q?R2Z5QkOPKbWYhTi1cNn3995Y5GDFPYVHlOwdoCm3cWD5fPHi0Mt0rWYyfaCf?=
 =?us-ascii?Q?DqjrHeCV0TooIARxALhxB4xMd7w1QEP2/frRx9Z6I331C/LDrK7F2kV+/g0V?=
 =?us-ascii?Q?CxVUSzb5JNnLj3tuvBBcqwW5a8i1ssZ+CoAhnUmbMDiSQaLSGnVnUnqbbftl?=
 =?us-ascii?Q?TzgTvhDrdY7bp7/wlytSX7myaTNx6uR5lHbYAow2aEXPSChK290cXW825ush?=
 =?us-ascii?Q?qefImnh+mxuDDd/LP9SZTmW++Hyn6bAwA2L6r1DOcF/2q5mu9LODL3aY5KgR?=
 =?us-ascii?Q?puIdas40CXD6lrNdjd81sEpc8wb2rutipamUY6+/uB6OiJCJ5AZIeVm+49eA?=
 =?us-ascii?Q?WfC2BdEUlLhefbuDJvrIODiKBoeep8CayeMG7tSmeCPWwRfansCKludOz+5+?=
 =?us-ascii?Q?J9D1xFhz4Hs+QuEmRd2Fqf85q/VE3eAIaMFogyD6hx9E37zL/ha4G6z0LsOM?=
 =?us-ascii?Q?aNvS5VVSQf3D+dxzot8DbUNn6jhKunO/mJaFlnwKDfF3iK385jk9RQW3kZJc?=
 =?us-ascii?Q?EmAboQjxCbTsrmDomWpbbu2BP+HbZIIAjkLIPqZoAe6Qq5csTg0nQndITnRQ?=
 =?us-ascii?Q?KSrmIZF96B3Hp/ZPxvhNjy71Xfl+Wjj+UBVDAD1AiJ/4yKSfAKL89A0rD8rR?=
 =?us-ascii?Q?xT3M8Fdaw8hq4hENS8WkgDNFiCE/sxOWTR1iGdo4Swsn9fo/D27U8rFyKemP?=
 =?us-ascii?Q?6evJomvCjfZiCAVVGwipMKoV3mTvkqtMaEpDzliNRxktrSxdYxVRQb+uNrwN?=
 =?us-ascii?Q?Ywr06w+/R/uTDwIt43dYRdnH0/pJXx1Dyteh6xXAcfaLFnhaI8BPe5Lwiret?=
 =?us-ascii?Q?k7yEzQXdDgf7BP9pWjfcWD6Xsr3Q9oza7OUL15UBQ8VxIBsvb9qnN6oV0ZK8?=
 =?us-ascii?Q?THYavF2jywFoW7nE+cvwexnyedp6SFp6raNVIZ2IXL5rVCXOAqrC5IgKpyDW?=
 =?us-ascii?Q?6tqb2A0InqU6FwMBu2ACqrbYk9opaRm2kIO1+yVi8aya8lvs733mLGLZw0tY?=
 =?us-ascii?Q?gwBZJ9SmNeni2isS4k949++9qDemA9MbQoJIxhDVMpR+tQLmBnQP5kGOyApd?=
 =?us-ascii?Q?eEcRLhZ3KwmNXimdECqrGQgx/zwB+oGWeAE2TM3cSI6MSfQky/76YM6J1HN4?=
 =?us-ascii?Q?mQuQSnjmxJxWVI7UwET8DyRgt8uDG2ohYfHAyu2sbbt1Z3LTCl71SLstUQSz?=
 =?us-ascii?Q?L08/hnuQU2DC/Yv6URy/+wwd4ejO7jQytjNMdlmEMdD6y4pEMI+M9f8xR9NH?=
 =?us-ascii?Q?Y0aRT/DBiVRaYZWn1jVfvrGEdiuymrR1Jn1PqoWPV5TxKAmEByTfFX/hTg7e?=
 =?us-ascii?Q?7S5073q9TqzlbFK9IBveKblFFBCfGSd3jLCJtv0+MgKnENXzDEYTF7D9R+0J?=
 =?us-ascii?Q?Hn1l4beKbyt0D3jkURtacUXS+0mnjL61aV46w6/OGzOz4XGyf2ArRA+gLqL1?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286fac4a-640a-47fd-b83f-08dc3dc22735
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 09:45:26.9957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMkoj/iri9Pw70lvrOkVuFLnIK6o/dZ7+cl46is/BJgRfodYmsSL0tbmDleBvUppzSCk/CUXbY6xm+VDrzoWyL2oweZWQ+qbf/zqa0bUWg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
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

> +/**
> + * TEST: drm read
> + * Description: boundary testing of read(drm_fd)
> + * Category: Infrastructure
> + * Functionality: DRM memory managemnt
> + * Sub-category: uapi
> + * Run type: FULL
> + *
> + * SUBTEST: invalid-buffer
> + * SUBTEST: fault-buffer
> + * SUBTEST: empty-block
> + * SUBTEST: empty-nonblock
> + * SUBTEST: short-buffer-block
> + * SUBTEST: short-buffer-nonblock
> + * SUBTEST: short-buffer-wakeup

For this series, it sounds ok to keep the description empty, but the better=
 would be to add descriptions for each subtest later on.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

[ Katarzyna] I've looked at that and it is not copy-paste case. Let's updat=
e missing descriptions in next step.
Kasia

> + */
> +
>  static void sighandler(int sig, siginfo_t * info, void *context)  { =20
> } diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c index=20
> 9db857f9f..d76f0c70f 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -54,10 +54,10 @@
>   * Category: Desktop client
>   * Description: This is a test for the generic dumb buffer interface.
>   * Feature: prime
> - * Functionality: IOCTL check for buffer management
> + * Functionality: ioctl
>   * Run type: FULL
> - * Sub-category: Compositor
> - * Test category: GEM_Legacy
> + * Sub-category: uapi
> + * Test category: Compositor
>   *
>   * SUBTEST: create-clear
>   *
> diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c index=20
> 77ffceda4..ae9575089 100644
> --- a/tests/intel/gem_create.c
> +++ b/tests/intel/gem_create.c
> @@ -98,6 +98,9 @@
>   * SUBTEST: create-ext-placement-sanity-check
>   * Description: Exercise create_ext placements extension.
>   *
> + * SUBTEST: create-ext-set-pat
> + * Description:  Create GEM object with specific PAT index
> + *
>   * SUBTEST: create-invalid-size
>   * Description: Try to create a gem object of invalid size 0 and check i=
f
>   *		ioctl returns error.
> @@ -594,18 +597,6 @@ static void create_ext_placement_each(int fd)
>  	free(regions);
>  }
> =20
> -/**
> -  * TEST: GEM create uAPI
> -  * Category: Infrastructure
> -  * Description: Tests the DRM_IOCTL_I915_GEM_CREATE_EXT ioctl.
> -  * Feature: core
> -  * Functionality: Create GEM object with specific PAT index
> -  * Run type: BAT
> -  * Sub-category: i915
> -  * Test category: GEM_Legacy
> -  *
> -  * SUBTEST: create-ext-set-pat
> -  */
>  static void create_ext_set_pat(int fd)  {
>  	struct drm_i915_gem_create_ext_set_pat setparam_pat =3D { diff --git=20
> a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c index=20
> 3a01944e4..a9d400c2d 100644
> --- a/tests/intel/gem_ctx_sseu.c
> +++ b/tests/intel/gem_ctx_sseu.c
> @@ -48,6 +48,9 @@
>   * TEST: gem ctx sseu
>   * Description: Test context render powergating programming.
>   * Feature: pm_sseu
> + * Sub-category: uapi
> + * Category: Desktop client
> + * Functionality: sseu
>   * Run type: FULL
>   *
>   * SUBTEST: engines
> diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c=20
> index de6788abe..03b12551d 100644
> --- a/tests/intel/gem_reg_read.c
> +++ b/tests/intel/gem_reg_read.c
> @@ -35,6 +35,9 @@
>  /**
>   * TEST: gem reg read
>   * Feature: gem_core
> + * Sub-category: uapi
> + * Category: Desktop client
> + * Functionality: ioctl
>   * Run type: FULL
>   *
>   * SUBTEST: bad-register
> diff --git a/tests/intel/gem_reset_stats.c=20
> b/tests/intel/gem_reset_stats.c index 5dfc1fc67..a62c4061a 100644
> --- a/tests/intel/gem_reset_stats.c
> +++ b/tests/intel/gem_reset_stats.c
> @@ -49,6 +49,9 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem reset stats
> + * Sub-category: uapi
> + * Category: Desktop client
> + * Functionality: reset
>   * Run type: FULL
>   *
>   * SUBTEST: ban-blt
> diff --git a/tests/intel/i915_getparams_basic.c=20
> b/tests/intel/i915_getparams_basic.c
> index b22ab5d93..971c35e55 100644
> --- a/tests/intel/i915_getparams_basic.c
> +++ b/tests/intel/i915_getparams_basic.c
> @@ -37,7 +37,7 @@
>   * Feature: gem_core
>   * Functionality: device topology
>   * Run type: BAT
> - * Sub-category: i915
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-eu-total
> diff --git a/tests/intel/i915_pm_freq_api.c=20
> b/tests/intel/i915_pm_freq_api.c index 6018692a2..aa2de74c9 100644
> --- a/tests/intel/i915_pm_freq_api.c
> +++ b/tests/intel/i915_pm_freq_api.c
> @@ -11,6 +11,9 @@
>  /**
>   * TEST: i915 pm freq api
>   * Description: Test SLPC freq API
> + * Category: Infrastructure
> + * Sub-category: uapi
> + * Functionality: slpc
>   * Run type: FULL
>   *
>   * SUBTEST: freq-basic-api
> diff --git a/tests/intel/sysfs_defaults.c=20
> b/tests/intel/sysfs_defaults.c index b686c19fc..a80f7126c 100644
> --- a/tests/intel/sysfs_defaults.c
> +++ b/tests/intel/sysfs_defaults.c
> @@ -37,10 +37,10 @@
>   * TEST: sysfs defaults
>   * Category: Infrastructure
>   * Feature: gem_core
> - * Functionality: driver handler
> - * Run type: FULL
> - * Sub-category: i915
> + * Functionality: sysfs
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: readonly
>   */
