Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703DDC021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 18:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6BF10E48F;
	Mon, 24 Feb 2025 18:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHCCQu3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C80010E48F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740421074; x=1771957074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=81pKhm07tNubCvinoCuO6VjCLF2kb68jqywmDFMDaIc=;
 b=HHCCQu3oIEiPhLzbCgcAQEmymOg4qNBjzYW3HlvMSQsKZTbo/HL5AUr6
 ZTkMi40JVoa7NN7n1c+ygJDsu4ez6Qzg4AuwGTMyCZ9rSY9NTSd8J9yCL
 H7kYZB9zcxJ7bcDX9k5rZg7RU3OR71itvTmdBi5AarGGU0MTGcCLn7Fl+
 CgMUjRFWav4mZE/f6lZVHRu1+Pf2lfVBrIczfyBLoM3eruD7JbFscBW4r
 OvNJaGoldHDsS51L6Fgfix3LhL2uV3IlJuqx0n9dNhg4srB78PLXvWMuk
 OW61+c47iuBIwhExuW+MtLyCARK2smAzmbb+Vh+j54N162mhodd6esW9U Q==;
X-CSE-ConnectionGUID: 2VJGlfvETk6Q13is0sL2rg==
X-CSE-MsgGUID: nBlmHqZHR5eHlz4HYbAtkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40380884"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="40380884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 10:17:54 -0800
X-CSE-ConnectionGUID: zkbCDmzTTYeD7aDZUCG4wA==
X-CSE-MsgGUID: DojZftIyQ6mgRMSO0Qznag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116632753"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 10:17:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 10:17:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 10:17:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 10:17:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSV4Q98VMPCmILUGGEf9fVw3gPEpk0kDluNxUBCAOlIXidEsDlFdbHiB8uQ4dBAhe0eyE10qntALjzJ965ZpWrv8wLIqKmENdIRu3mAw/u59P+DiKAovIF9IZx1bI0Uq+uVGe/t/IMIX8S4jReSdd7jbxQPg3qCnRuc2aTSDeuQ8AhlOau7YDn0DWlvvpv/mnNNQTU929U0xLX8LbNBFNIMfTLK+5e/xamfuq8mDbKzBul+FZTpfQMTWGMG5oRA1hSNvlP5xrAVWnv8vjuc9mS0MltT4uvIr8Twl0Mm9wucldNqmLZwPbm8Rr3abk3Q5obzzHxZ0dzBtkhu3/NYJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY/UIEVilv8d+j9voXQZXUMivuF9m29ZgRijwVxgLjA=;
 b=qrjsBkAcjlyOElq0JPYryXa94EVE+fUFFrOWNONnesbdKI+cpDi2ENXw3o2lSozZUmWPNlA5ruzwtQa2/cPfvYJ1MmdFZfT4CdVWaHq9Edk2OnG0yoSJ3+LDaFz0mdEKd2S7qCRfdvInxG5SoAwsHsSdw5tLDg8cETQju8LNJ2mqD1UWTXwPjRuan3KI/SsujdHnO5FhBF9L4KSR1u4Ibygxoprcx6AySH3kY4mJ7YpIGxbCqNmkYejEYmkr1reGPf7IQYRME1AYSkg5UE5PjAQIT32KNt2DVQSgzuo7U3ZCcR3oCbmGELK1GRk/jor0iThZfQqtJxHcRfOTac22qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 18:17:47 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:17:47 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_plane: Add test to validate odd
 panning
Thread-Topic: [PATCH i-g-t] tests/intel/kms_plane: Add test to validate odd
 panning
Thread-Index: AQHbhsov5KPBvLYoTUSYsiq9/6LvorNWuelw
Date: Mon, 24 Feb 2025 18:17:46 +0000
Message-ID: <PH7PR11MB60531DA3E79BD2C8C4401375E7C02@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250224143707.2594265-1-nemesa.garg@intel.com>
In-Reply-To: <20250224143707.2594265-1-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB8232:EE_
x-ms-office365-filtering-correlation-id: 04ef3abe-c654-423b-4686-08dd54ff8a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BqloELtz3wsGfbbe98c/PLJ/YPLelh6xR/MC7lwXKv97qglvtRWG6AsuRWte?=
 =?us-ascii?Q?F4pZA9hQheMaEZ03c+YaBnCGrGNVm9qHWotT2F6Jw/nS74gfPSxVQH8soYDV?=
 =?us-ascii?Q?W8sL0q9bxnhbRLfXEd405ghU7UCTJ5q4erxljlgLupVoNh7COztCEg8Ky54e?=
 =?us-ascii?Q?IZhWAP2/CXhbeUllEjf1rvgHefxbsUOA5nH/T9U0k+ZjfN3f8Bgf9R9YA6VG?=
 =?us-ascii?Q?Ix39cQRI0y8E0+R40uK1ipO1M2NSH5k31TvlHlYLZ27SNs5cB72/EjgQiCXB?=
 =?us-ascii?Q?W8b4hdk5yNqLo9xJaUuiT5uGhEIq4PC70PRuz85HJoxZpnQXSqbBgk9ZVvOD?=
 =?us-ascii?Q?YrS2gSnKh6kA+dN4tVv17SV0ZuyyzAjCrYkk+kX90URr0yja373e6dRj7RcC?=
 =?us-ascii?Q?wJ96sboUMn6S5iwCySe55lWiB9qYPCavuNzqOluJ2gkuPCvzvngnQso5YViF?=
 =?us-ascii?Q?9W3CR8sIhrng/Mj3uiNvoJvGwN9duJZqjLly0FTGNeVB4fRV0YgkbnKsNn4C?=
 =?us-ascii?Q?nXZUhF2JBJzqQ57A8L1WTzJalBUeu0VeOZiuFMupXMkZxuPRm5alTPlwFhWs?=
 =?us-ascii?Q?TQaCOpeCR+wGJrTuaLLdxYzASV/GLy6ccxNDrg1HcTSY9kiIwBZTqgtYG+QB?=
 =?us-ascii?Q?CCLmg+bseLU4hIOl24IAerxfqVeWMZrJ8QHhraPdOBwNNwxSScQ7BX0XylmS?=
 =?us-ascii?Q?meqJ4hSKywI8H2Cyh9zHYBekagnt3nXWLzYcqEndNq6wA7FpcKO9hfXyBAGl?=
 =?us-ascii?Q?TOwohwsW1UNjsHlQc4KUl2zp33QIRPvWIwzmwSuAiHEW1uN1b6ApN6ODdoAH?=
 =?us-ascii?Q?/pWNhXXUW12EMfcV454+XGaYscy56UPoe0In1Sec2UdNbWOU8huQOE/mQYhA?=
 =?us-ascii?Q?ie2OhM3+CAVVD5qyAqd5x8K02dqaYazy5rHSL+3bhE4Bs/6lWESTJP2qR6ST?=
 =?us-ascii?Q?Hz81QNtGtwCmQOQ4uOjPNBdJNP/1WYV+D7ZmqMT61SyCjBaVqY9uoMaYHlGi?=
 =?us-ascii?Q?kTY6fQdwA1J7KBI7hmc3xvGieMEY7Nzk7/+eo2iqBsuSsnkgRIxiJS1WK+p0?=
 =?us-ascii?Q?QYjxORrvMSWhUXJkazqGe7rCrwPPJW4/z5NVOQaRYN6B2QrZNORMLNRI7eTO?=
 =?us-ascii?Q?HABdV3KH6pqqFCVzlHIPCnIFn8lSlOf5rg23iqiTTUoN2Mlue4HmVvrxWKuD?=
 =?us-ascii?Q?4F+6O7I5NF8dExqjpkPjiAKyei8Ux/2Zxn4YcZbX0jNrlnbNoz6MD6mEcKHQ?=
 =?us-ascii?Q?xRzHPRx1Brk/58o78cFls4qxtqaIugkIBvOxMGIj1bl9/HB1n+7nuJm2fqaF?=
 =?us-ascii?Q?DQIzISPqAVViw+m67HyoppI6vpFEgnoDemcDXI2zpSfQ/jPk/RdIsvOM1DBc?=
 =?us-ascii?Q?w4ng6Q8laRs09FbfxORJNEh8ek3dhBVoKOYOj+5FA4Dr0vU/N1goibWZKOLu?=
 =?us-ascii?Q?0h3IIx0LJHDohT/nKJ8eOT9hA+4vshTB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5dDHOml1+pQMsmmF6HiVLP9n+JrqjAxc3OmgBp7IZ/HOUYGYMnEZYMKjq4cK?=
 =?us-ascii?Q?ti0DFe/NwzwpTR66h2/yIZbUVBPZctf7hZpk6xMgSUD6Uc1KKrhkuPqL/myy?=
 =?us-ascii?Q?P6gemyEsdMyTWd61yHcer9Wk3Y08w5C+XwlC1PxMIHgCDLlXttUsKJH0O+W7?=
 =?us-ascii?Q?LhTRCzuJeM2YFe0cjiaQvycZAgPQp19cvg44YeZ6n4blkjc9k1bfFId3qFtx?=
 =?us-ascii?Q?+UK/Bzi/QBJVSrIjFLG2p2PsVilSurvHAbTHuYSFX4vuPVKnahnLgh2+IJtl?=
 =?us-ascii?Q?e/4re20c5Xz+OgxNzJoADRAQ9qlQwo2AiLUeTvpf5Mlz0+B+D2Vp73ScSdHp?=
 =?us-ascii?Q?CQNnRS45uWwYTs6S+psjm11oNeJkE1IUWzKttZXeM+c3U2Lr7bxm0BlFV9EE?=
 =?us-ascii?Q?2eNOz6raibm5h7PM5SUAfYgYIRAHhAaZwYtuolfFvl5FKF4I2O6Q/LcjCkgK?=
 =?us-ascii?Q?7aIJV8RmCztcEr3EyIbJjc46LXYRUirydvz8IzkhW2p3HMRJYKBtTaLgixA1?=
 =?us-ascii?Q?xIoZAL/F8kjhPgXR8l87Xl9hg2wTwNeim0e/i2SksSMyLFUOJi0AvHylfPcu?=
 =?us-ascii?Q?H3Xn8mDKvCMq0+DLZ5KMHmA6v2SCSykzse6sfNqwbGdhzOpzgGXXrXCL0DEN?=
 =?us-ascii?Q?1zP/jXHMuqhm53ZNh3kZoaXRvx/WdOPHGcd9gDUE41ypqP40nwj+HcLd/8dI?=
 =?us-ascii?Q?tZO/Sh6WNMJOlZax/wDUdlPa6GbRqKdxUF4fPIR2Sj3RkGJZI4Ld+kiIC2jD?=
 =?us-ascii?Q?sklaqkJE1lBiDTzjsXxASHSzaf2RYVW9RRLWk8EgHesFfUYxh5Xwy4MYPHOk?=
 =?us-ascii?Q?HX+pDXk7Bj2cl0Vwdkl2kyciEpGOpRhA0LdSrK2Jb/ihYJM/Npo4GKby/xJa?=
 =?us-ascii?Q?C+k8RR45TwBCx7Pj64yvYUqhM+vTuTzGb5/Zm0i72JxMdc7lxrvmgEx0HdeC?=
 =?us-ascii?Q?VxIC81trM7/Kc2IUCtq1Jnba3D/e9Ifm8lrLy4kptSNefKPGZ17mAeKSWm8p?=
 =?us-ascii?Q?wo6CxN47ETjYRCkqDkQ0ip95IwXabKJePUX/xzpuXvIZTJVMpWBQUdUQZDCA?=
 =?us-ascii?Q?XlzeN+LlsONGpF/G2oKP6BKLpWKXiWUit4slXE90STUUp2vHRSSg6yCKe9qF?=
 =?us-ascii?Q?j5Pqk6tCzDs3BE4hF1jOSBJxiSR/0f1LcDLBaws5a2bmp1b8ny9hvfgTIWwN?=
 =?us-ascii?Q?tI4Ho17j/fYQh8OoyMv5R4fcqVkBlvFCWFTbQcT6Ap//EyJnHeH0UG3wPHXY?=
 =?us-ascii?Q?peRVRbyy4tgHDBaCZ/LD8EYk8PnMxLPJ1aGefMvKGYhptYHxui9WvcPsZthY?=
 =?us-ascii?Q?2kw/rdLKFD94AychTHmzb8lkVNdXRo8qbxXws3/MwtLfrzw0uCmN/kBC9cBR?=
 =?us-ascii?Q?OveJEPRhm2ckV2+BlcB1/gNnKAd8PoEObMb4CXmC84coW86jeEybO7aCIjzp?=
 =?us-ascii?Q?Wfdt1Vuj99iM7VmvoU6RIvVqNbERmFWCxrPo4P6Yk+TQsu0OkToj9ckDIMLL?=
 =?us-ascii?Q?9fo/qhDOUZm6ePKZdNqNiSMlekZCtf5v1v/I+YLaHBJn0YRzt4sfuHUAh2eF?=
 =?us-ascii?Q?/PIDVj7Wq2YD+ZBA3KAaA2iyVurj1EH8xah26thF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ef3abe-c654-423b-4686-08dd54ff8a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 18:17:46.8783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cV83VcccZFRBTSyJhfJopk3mFzjENV/8eRDD4r7YuPwLvyUrKNOP3hirUSqLg+4xe8egLgSNuvrr9RAiyD83Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
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

Hi Nemesa,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nemesa
> Garg
> Sent: Monday, February 24, 2025 8:07 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_plane: Add test to validate odd pa=
nning
There is no kms_plane test in tests/intel/ dir.
Change subject to tests/kms_plane: and continue it.
>=20
> This feature creates a NV12 plane having two framebuffers and moving it t=
o odd
> position and then do continous flip along with the change in the width of
> framebuffer.
> This is to check whether panning at odd position is supported or not.
>=20
> v2: Add test in kms_plane.[Swati]
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  tests/kms_plane.c | 103
> ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index b9bf025bd..8490c=
fabc
> 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -88,6 +88,15 @@
>   * @format-source-clamping:          with source clamping
>   */
>=20
> +/**
> + * SUBTEST: odd-panning
> + * Description: Verify that odd panning in horizontal direction for
> +planar format
> + * Driver requirement: i915, xe
> + * Functionality: kms_odd_pan
I think plane_odd_pan will work. No need of kms
Correct me if I am wrong.

> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
>  /*
>   * Throw away enough lsbs in pixel formats tests
>   * to get a match despite some differences between @@ -100,6 +109,9 @@
>  #define CRTC_RESTRICT_CNT	2
>  #define SIM_CRTC_RESTRICT_CNT	1
>=20
> +#define PLANE_WIDTH 810
> +#define PLANE_HEIGHT 590
> +
>  typedef struct {
>  	float red;
>  	float green;
> @@ -121,6 +133,8 @@ typedef struct {
>  	uint32_t crop;
>  	bool extended;
>  	unsigned int flags;
> +	igt_plane_t **plane;
> +	struct igt_fb *fb;
I think you are not using these anywhere in code.
Remove it if not planning to use further.

>  } data_t;
>=20
>  static bool all_pipes;
> @@ -1330,6 +1344,91 @@ static bool is_pipe_limit_reached(int count)
>  		return count >=3D CRTC_RESTRICT_CNT && !all_pipes;  }
>=20
> +static void
> +prepare_planes(igt_display_t *display, const enum pipe pipe_id,
> +	       igt_output_t *output)
> +{
> +	igt_plane_t *primary;
> +	struct igt_fb primary_fb_1, primary_fb_2;
> +	unsigned int fb_id_1, fb_id_2;
> +	int j =3D 0, ret;
> +
> +	igt_output_set_pipe(output, pipe_id);
> +
> +	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +
> +	fb_id_1 =3D igt_create_pattern_fb(display->drm_fd,
> +					800, 590,
> +					DRM_FORMAT_NV12,
> +					DRM_FORMAT_MOD_LINEAR,
> +					&primary_fb_1);
> +
> +	fb_id_2 =3D igt_create_pattern_fb(display->drm_fd,
> +					800, 590,
> +					DRM_FORMAT_NV12,
> +					DRM_FORMAT_MOD_LINEAR,
> +					&primary_fb_2);
> +
> +	igt_assert(fb_id_1);
> +	igt_assert(fb_id_2);
> +
> +	igt_plane_set_fb(primary, &primary_fb_1);
> +
> +	igt_plane_set_size(primary, PLANE_WIDTH, PLANE_HEIGHT);
> +	igt_plane_set_position(primary, -501, 200);
> +
> +	ret =3D igt_display_try_commit_atomic(display,
> +DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	do {
> +		if (j % 2 =3D=3D 0) {
> +			igt_plane_set_fb(primary, &primary_fb_1);
> +			igt_plane_set_size(primary, PLANE_WIDTH - j,
> PLANE_HEIGHT);
> +			ret =3D igt_display_try_commit_atomic(display, 0, NULL);
> +		} else {
> +			igt_plane_set_fb(primary, &primary_fb_2);
> +			igt_plane_set_size(primary, PLANE_WIDTH - j,
> PLANE_HEIGHT);
> +			ret =3D igt_display_try_commit_atomic(display, 0, NULL);
> +		}
> +		j++;
> +	} while (j < 20);
> +
> +	igt_assert_eq(ret, -22);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_remove_fb(display->drm_fd, &primary_fb_1);
> +	igt_remove_fb(display->drm_fd, &primary_fb_2); }
> +
> +static void run_test_pan(igt_display_t *display, const enum pipe pipe_id=
,
> +			 igt_output_t *output)
> +{
> +	prepare_planes(display, pipe_id, output); }
Why are we calling this prepare_planes function in run_test_pan function?
Just to ensure pipe_id remain constant?

Regards,
Pranay.
> +
> +static void run_test_odd_pan(data_t *data) {
> +	igt_display_t *display =3D &data->display;
> +	enum pipe pipe;
> +	igt_output_t *output;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, pipe);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> igt_output_name(output))
> +			run_test_pan(display, pipe, output);
> +
> +		if (pipe =3D=3D 0)
> +			break;
> +	}
> +}
> +
>  static void run_test(data_t *data, void (*test)(data_t *, enum pipe))  {
>  	enum pipe pipe;
> @@ -1408,6 +1507,10 @@ run_tests_for_pipe_plane(data_t *data)
>  		run_test(data, dynamic_test_handler);
>  	}
>=20
> +	igt_describe("verify whether odd panning is supported or not");
> +	igt_subtest_with_dynamic("odd-panning")
> +		run_test_odd_pan(data);
> +
>  	igt_describe("verify planar settings for pixel format are accepted or
> rejected correctly");
>  	igt_subtest_f("planar-pixel-format-settings")
>  		test_planar_settings(data);
> --
> 2.25.1

