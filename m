Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCF0CA5FFC
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 07:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C54D10E115;
	Mon,  5 Oct 2026 07:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvNPNlFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790510E115
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791186448; x=1822722448;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tGlKEaG66YOZR1SdbtXsb/13KsiNMsA5WGv2p+ujR5I=;
 b=PvNPNlFHHHCvLq4KOUzQq3idUz1quH4688OJGOCZEeXSr5BFwahgDMM5
 Fza1ABvVOjdJh3IDy+rlGhh2uUomclD+1a6T7SV0RLrk46WCpSYh9/kUq
 wp6h7mc7tnsggBv6urUbqR+NxE/DVIRloDZKO62g5qqQI50uY0b2bOFsb
 rhI0nfRe/Nf29nC5owOXiTTe8A/0Djsia2jSqdeowHxlG5ibun6X6f+CP
 mTR1/RpREH03a+Kat4/WnZf+IOhQBJhE5311JaBPDkuummAR9WIwC+ORX
 xGMVWBQsgpz1wP+aZ9qk2ocQZ1qjKE5ICji/PB/G/S7fzxzAfw7H5FI4j Q==;
X-CSE-ConnectionGUID: 6sbVoN+0SFO91bbnfDAvyQ==
X-CSE-MsgGUID: PIqjATWYSw6H5BJVirgbnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="108229242"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="108229242"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:47:28 -0700
X-CSE-ConnectionGUID: aMr0Kc3HQ4G5TmZEKrLNcA==
X-CSE-MsgGUID: w8d6/SpESi6mIxXpEIZUyw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:47:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:47:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 00:47:27 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka7Rrf18cPXlA0CJx+oe41+LoO9qT6nuyxIoYEmuw6EULs1Gvs/fSZImCO3Ne+J+6DF+dftS7PL2iE0d9hzySrzeLoQlc8BNmkgOTiXV1vdcyi+zG/w9hyuQhVx0FDRVMY52q+4rxT9PYFh3QtXyyafRNfn61F6bnOuD8gUals5iwKmIaIYftGVXAslhd274O15SlE5fuo8ZptTr1ENemkK6xm24OQkIbDuYZ1icc92jpFonWWd3I8MPVGX/iBsATox+wku0vZuhqW4p/E1T3IlhEV8Dt/utpD7vt9L+0pqAxdUrKNKSYWRitEZW1xAMmYUbgmoUu06WgBD0zsU86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5umcyq08wQn+FKQmJ4sqESDsZJe+f6oOUOQSU3QCZJg=;
 b=mRz1wUXKWZQOR07Szix6wUcMiUrBbJ/pm+859poFd6KyAIAy3xdd1oEnSPUJh1DPv0O3iz2q/o3mWU0z+kqSdq8Y0PQjMz8Uz9AbvHwus/1H29UkLFqYptsWPwszx/VOImuAVipHzUveuKY6qNAkDWCCy5s5XmAbJl6BBbB6XlYwSB9v/DGSUZguZ9rZ22xYjWV9JSqL5MGT9E5faBAq7RV48AfbN6AwJo0xP7pRNNbw21JVs/mStmty5XJGfn6oz193b/ZY3cmOdaiCqA+cod4ja9DGKUfe8/U4J5dmtPi54T0TzaojlIHFiSSr9dF2C1/pNH9DgcRQP7Fn6rZk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by DS6PR11MB689623.namprd11.prod.outlook.com (2603:10b6:8:46a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Mon, 5 Oct 2026
 07:47:25 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0%5]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 07:47:25 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_tlb: Wait for the rebind before the second
 exec
Thread-Topic: [PATCH] tests/intel/xe_tlb: Wait for the rebind before the
 second exec
Thread-Index: AQHdTUfn2l/1LEgMGE2b9wOqBevFdLbuoMqQ
Date: Mon, 5 Oct 2026 07:47:25 +0000
Message-ID: <SA1PR11MB8428699482D08A4C9E4F403E8D962@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20260925234448.936777-1-shuicheng.lin@intel.com>
In-Reply-To: <20260925234448.936777-1-shuicheng.lin@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|DS6PR11MB689623:EE_
x-ms-office365-filtering-correlation-id: e8b4384a-9cde-43de-527c-08df22b4e5f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|22082099003|11063799006|18002099003|10067099003|5023799004|38070700021;
x-microsoft-antispam-message-info: vlQx61hTCvXyDI61klqmyRih5aOX2YKg8aW7/YIefzPtbCjycv78scZbATrdY877hoPg7SfoSbCMoY477DRf3BmpjAboBQqwkOLR3/e3pb6ZmY48jrWM1r5I2ZZkL18pLHw6VLFkNEcdS4GPzXciSkc7XOqzo4oRNtb5/5PhPwx4yUx3SvMP4sltobYPmD0Kq/UnKJgSiCQKhm8taPRnWalcSWGjDLAe7VYmY70RV41+MrjyqvcPxYi9TPTFVqR+TCqJB4b/PacTJbGwJk7LKhsAviKQdAYSuz7z/Qb/gx9dvJ4M5qYB/DVCxFWvMaFyGN2EXyf5p56K7HjKtuanE4dtpS/mLQPyEZqY5dbrM1EQ/YU+tMvRLAY4TWK/bGOb5ixGLfUG1GeKOViblmg7ahXptvvlSS/5HQNV9rsJKuELIEEl+K5J6kkEeebP/W94qceauzlEIA2ZzBfLx+Wn5OZgmwgwpjaFxACzmwXbm9gPpRx4d2jtzYfpzM4vaIIqQEISWp+RZIoWQ6nuexzdPlP9JkQxsiDkbCi44PoFOPnlr/r3SOL0dpisQMjP4vsO3h5O6HRs+UFBr9Zyq4ZIpeDYGJEvqrrfPvG+q8leZAI0SVDVdiLhM7F2N/tpnr53pT2bLdp/C+QfIHYOUQWOL+lK4XrepyC0zf5WYB6LTwo7pNL3Gn413CY3yBnhyujobVEUi1Mm/pYI5W9E9F5a7avSyT3bq8ATwFJUEcwaXRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(22082099003)(11063799006)(18002099003)(10067099003)(5023799004)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2q2X0D+iSLkXO/Q9aEgkZV7kfSmQp1E2F4O0BAn4MdjyJDDhFgux/eFgr9+O?=
 =?us-ascii?Q?H14gqiTutri5CoU7VoIWzub90cKh+n9jWT0s6skR6fa6MMpe/tsn63LBQycp?=
 =?us-ascii?Q?iVEMXnna25G2RIvGvI1bmq266kKQtaEl6u//1HQJjxZ/I+e5nUALg56+3Mkp?=
 =?us-ascii?Q?/2Q6/ernsSK4AQB5FCq2hfC6IUom5EJzeciCZhj3fad39tG/UQhyA+9JEfYO?=
 =?us-ascii?Q?Rp26ylshsYGXUbmIeWF5rPLfQOz9xYwME1qeJbyQkO+ZJzSQLhZqfUPXWeWJ?=
 =?us-ascii?Q?/Y7jSWixEKLDKg9A4MFWeTKWIK3MSNLUeqnc9knQ9DVke/hoZ3XoM929S5gE?=
 =?us-ascii?Q?pFZVMpoQ8cl3OeZOD8ERpaKmGb3Yb0Ep2TSdb7j0Mhh4V34rDGG6H+6EV7il?=
 =?us-ascii?Q?sCLZpqI3OPeEO2HKcdxmj3AOAS+4N+HWLFH2xnEAAFmCIXsaLZoLp/LMEJeR?=
 =?us-ascii?Q?8yKWmwKa6RamwXukfFRb9t9nRYuevK1hHAYQqebDEO2hi+jEf6Z/PuQBu3xl?=
 =?us-ascii?Q?ElT1X3vMGrPQKziJcXq/XqF3j2itgRFGmVdfqLHlvaCRRa/HhIO2l5+nF+uG?=
 =?us-ascii?Q?CnkDoJJWz90YGy+RGJZ1K3u/BSCYpDScPFtcQoH7HzAx6iGjhugvAinYfxsP?=
 =?us-ascii?Q?PKkJDJm+SiroF9u0XYcVdJ+0QnSApaTdEsUaevxww8yq+MdTE6iB4foC/9xk?=
 =?us-ascii?Q?sNGz2yVwgN1EWiSkOxCsOuH90lm5ZWoRD47Dm7IcenUsO2bJnVBkHCHwhEeF?=
 =?us-ascii?Q?4S9E0esMO59So3nyHt+7Lmq51BVexULoZwpGSJT+PmT9fxZOw7Y4g0iFT78B?=
 =?us-ascii?Q?zqYFVy5A/wCDYIZhev7jzOhvQoqNcZNKL+rdCWN8ILvIE6e+Je5WyJo9Min3?=
 =?us-ascii?Q?uy5HtJgs81LcesgiKhMPCuAwxgs5P8jcyuPUA4b2t9z9NnPFte6QN2MwgmdE?=
 =?us-ascii?Q?2QzVzhOC9fkz4bxs2j+dUzqI7RAJMu4epKReHX1JT3zNLV4hnuwd7MbqzN7p?=
 =?us-ascii?Q?Bi7Knm/sBgY5nXQ5d2EE1Mbloor5F0fIXOyFOJ4jBzBOX6QgZWogXLc+E7U+?=
 =?us-ascii?Q?79SAcbKpbWXGvCj4kjFJIZw/FP8IfgjsAYIr54AlBFNJ2KUpzv2YHT89geMT?=
 =?us-ascii?Q?DDB9moLaHuXaxzrOFNd4YpWxpMwRFmtRATwVtB9+UtL8ChbrRMvcqzSLF3ci?=
 =?us-ascii?Q?b9IE3k/62tDeHWCmBTE5NvT/h2syJGPFFmpKH2bIXHSTjyRVTqQgK0NSQM0V?=
 =?us-ascii?Q?z4/cniDBhmzrs1NIPAh4boxnokeblco4MRluzgG7wX1XkuISyOgDjfp8M2Zq?=
 =?us-ascii?Q?pIfb9a6ih/ZYf0bYyt6tz3tozgX2/Ko12QjIw2NfC3tPkH87B06Sb1NI0h3n?=
 =?us-ascii?Q?E3b5AqzI026BGu4g9kWETC57QvKzJZFsFmMCAPwbP56SnkuyLwGiWuIQbsMg?=
 =?us-ascii?Q?OJ4aOHsTitJ8yxXBF0Gnga4YKyE1E1QVMeRmmCKBMxmSL5BeGskOjNnAP8vs?=
 =?us-ascii?Q?RRvmRJsNq01Ub2DwJ78w4z1MeNcmxoBKYNbI6APf49gO0wo4PHn5ibgkxd7M?=
 =?us-ascii?Q?xlOdIlNO1zx0+yTYhuV1vC6RLlKiiqXbMAT0YRwZ/0fNQxK9EX/p0xXTEIAW?=
 =?us-ascii?Q?3qcTRhF1zP0o/d0CAuy20WCYon+zsDHs6UG2DxfToLVi9PhXs7Ev+XV5RgX2?=
 =?us-ascii?Q?c/BMw13mKI09bth/dINxQb/3bPDbkrhP2OC90M6JbzlUxZ0Kt3N+Gv3feTwR?=
 =?us-ascii?Q?LmwdbR4owQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Thsa1FRD98BwyNjFBN1WjXTQu9MG8H0W55RzTCteaCwup3/R6BXEE1IiW7Kfdag4ECKSOIuEXFBCqEvs3vhIlTmIGZ9NFrkLLdYmV6bg3bYNtZfBwx5PA+KiKc0qboYufCyvxLEB+fvMsu1agP2C49/w8qnDR81RF1vMhuAC7I1SwhKKY7vmNDuO7iKThDYQlX8NOjYslpSQfVdIkgQs4u+hIH+9K6AbFRT7G8Tuup5WUwAki/rK2wigtOBTcePiMG+w2tHJynPxveXH3vsBMNBGPhzml7AHRUkA8OO4Ku8pHaKzR8jw9dUmR2GdLS+bgLIFTyoWJeiXOjiO37HnNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b4384a-9cde-43de-527c-08df22b4e5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 07:47:25.7246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxZCGnhc9N2aTEtW2/nCiDvxgIlfIJ0YpNpyS8CTsUx1l05IVTnFX/0UypP7o2yNQv7SjLJsg/d90qOvAyTC1uomzZ4I946hZi2VtlK3NFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB689623
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
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: 26 September 2026 05:15
> To: igt-dev@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH] tests/intel/xe_tlb: Wait for the rebind before the secon=
d exec
>=20
> The bo2 bind reuses sync[0] after its SIGNAL flag was cleared for the fir=
st exec, so
> it signals nothing and the second exec waits on the stale fence from the =
first bind.
> Without this dependency, the second exec may run before the rebind's TLB
> invalidation completes and hit the stale translation to bo1.
>=20
> Reset sync[0] and set DRM_XE_SYNC_FLAG_SIGNAL before the bo2 bind so the
> second exec waits for the rebind.
>=20
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_tlb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c index
> 6c88631ac0..b322096d5c 100644
> --- a/tests/intel/xe_tlb.c
> +++ b/tests/intel/xe_tlb.c
> @@ -102,6 +102,10 @@ static void tlb_invalidation(int fd, struct
> drm_xe_engine_class_instance *eci)
>  	sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>  	xe_exec(fd, &exec);
>  	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	/* Signal sync[0] on the rebind so the next exec waits for it */
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +	sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	xe_vm_bind_async(fd, vm, bind_engine, bo2, 0, addr, bo_size, sync, 1);
>  	data2 =3D xe_bo_map(fd, bo2, bo_size);
>=20
> --
> 2.43.0

