Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6EBC83F1A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 04:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2509810E5DF;
	Tue, 22 Jul 2025 04:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O39EHafL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BE710E5DF
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753157068; x=1784693068;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93E4tQlcPaBYEmA6BjllrZ88bW2Q1e1RwfuKtttYa2k=;
 b=O39EHafLYqM4lOOkeU3GOD4z/b/HyMfItR5tv23YvvfzGf//cCnPfb7W
 MehTBPaR40SMRdgGJb6dVD0WSEf/FO5QCm4BrePf45McODbAQMMv198Oh
 gWgZPlr50d9+R+pJZ/PFqA0U3eU7ADfiu3sZ/D42kaNsLYLn2hKMAMIbw
 yMEs3tb/lgHJEpMfKhzkCkOU1n7CiftjmIRoZyh4Vub/3MB0KpvbVocYl
 dfNFMYLfdRuAoDZABO2/cmcNC1/8Rdrq0bWfcRvshYEUxaQ3r+/SRyoTj
 5y7NwQ9jDMfilYQtF/KZbM290VJkvS5PNRaxMGoFiQG6r5pa2FW+9DaqX g==;
X-CSE-ConnectionGUID: kzATT7BuSTWqprew9/iCSw==
X-CSE-MsgGUID: C/EnqvVcQyKVD6g1tzA8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59204282"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="59204282"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 21:04:28 -0700
X-CSE-ConnectionGUID: qpN/w1qdSMCYy4XdmmsyUg==
X-CSE-MsgGUID: rcqbYuJ2RXeClmc7vqw/2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="163258130"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 21:04:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 21:04:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 21:04:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 21:04:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPA/v5qAsszMo6yhnUZAS+8gIxw2c90pdFH3zYV9TBcH+ABtfVfyeZ1DMkjRsa2oNfM2T2U0lJ7wA+iuG78jpzcebCuAL0uso6Kc448CvzaglBvq/6zNfTs5B6OROE4XgLRyjcuo9fs9ZyzyqJ8+i9row9sn484LX0NdCeqGcnkmcY4m3/sfU6Sk365jEh6UnJB1znu7SEP5at/BL7JVtCGDYgB2o8/iWU9qEeLbihGfPZjMfMT7ShEIoQL+BKF2MGfTMGSwR+yS9AByKBtjW3s24E6iCqONXMEcMVqK1SDG4vdaq7WvVMToXFd8TehhatB8csLHrPnBVSiY90+2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5+BizhwgACjPSAc9dWMpS2HfWm0fZhxeoGheptzkSk=;
 b=Ghx8Tj+A5xiT2a+ZMzXhlAKmUE3aWwoQkWfhOr0kzg1FZSmPJIFGOERcU4Hsf26xKaRlGohKC36I9RgCsXviTJG+ij457paWh/Kj+FPHrqQhN7gEIvpM9oA8flo43SixBjH7eFbOA06yI4ts2Qe+UjOqUrbWcu4PRXAypXpI1K0ISDUGOH0EA63Eii1OJo1n3CqZTCSp+NgoCL4ryNedpAWnIFtDoQhYFOBLR4dcuJBAZeihvSesk6skfEkxEcx7z2aSA+5fecgF4rt3ctPotxp9jzRMA+IJ8nImDrgZj9x1VM7BSZG8AEcTVCN1/nlrQtYFoYemPBYdrCvXgcEP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 04:03:57 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 04:03:57 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in
 remaining affected tests
Thread-Topic: [PATCH i-g-t] tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in
 remaining affected tests
Thread-Index: AQHb+iNATnQdycIXvE6dzeDNlpb5BrQ9ht1w
Date: Tue, 22 Jul 2025 04:03:56 +0000
Message-ID: <CH3PR11MB8434E5666757E4563097B86B8D5CA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250721092716.11880-1-lukasz.laguna@intel.com>
In-Reply-To: <20250721092716.11880-1-lukasz.laguna@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CO1PR11MB5041:EE_
x-ms-office365-filtering-correlation-id: ed709773-4e47-4c01-5e0e-08ddc8d4c7fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?n/IVdJadhuyUEBeem2y1Xi0qbHEHgHgd8+XJ/kcXvSjovDxEr/NVB0xU/otZ?=
 =?us-ascii?Q?jyvl9+KIHrZtj8I/2syIy5B4enYkTTT10mNiMfSc4+T3GrbyYbz+N2EGXOvV?=
 =?us-ascii?Q?CIv0/CMUcSB+zOlZFWHWtytTKhMG30PT0Av4kR05ERi/YPK8QVtb2tCjpj9B?=
 =?us-ascii?Q?T3WnNsZFVjCkx6zsX3PY9YZkQtVhJBE0supdO+hsWPJppXMrf5Dc+9iyDtMQ?=
 =?us-ascii?Q?zx69OO/VdRrtC1CsLc9ei0i5/b475sg+Byp+aOBB29DF43lTKDWimedLKeoI?=
 =?us-ascii?Q?nqGFI5yDEDnhx4bYYGicYHlCKbjo/dsiG47xmXT3KvAUlsMqqp+IhvpiD5iM?=
 =?us-ascii?Q?ksAmlCAWstrBO3sun+wLnayyPiW78DoNSbkHUen/K89qqveOI74ZupA8uj6C?=
 =?us-ascii?Q?ZK86qR9Le6OcI1alFu4F1q0aC6uduM5pKjtCeXz60T0JKYXL2tfhHDG+T7rB?=
 =?us-ascii?Q?HHZrNxbbnBpPAM+ARx9Il79Vurv4Cmd7Vpi9lPxVWPYEAtLtF2eMoWxePWFr?=
 =?us-ascii?Q?VJOpb0olCdMh4GunEiflFvqCPM2ueAHn9kxKAftshRK1K12slJrrU2yDw1r6?=
 =?us-ascii?Q?RHSp5SeiQ3c29lbEJ67ZAymSJsr/5193kBFgQbKupm69TSmNPmA2OoE46le+?=
 =?us-ascii?Q?pTYT2LNgrnarEa2DVeqCv3Itsd76Kr2zrI4nZHzskzIBW5h+8nEASStjXAK6?=
 =?us-ascii?Q?WYfV7KA2BBut6nXHJt6UR8jSzkSZ/nDYoXGm5toD2NfPe3gpXdKDJqzbtbyz?=
 =?us-ascii?Q?aj3ft4w/Lnc9RW0QpHdTuu3KS885SpKz6UnzoeqsXRIzIQNVIEwN7f1zA55W?=
 =?us-ascii?Q?90iGodAjE7j5GEGy01y8IjoUKMadojOV2rv2jFbA3ER8VLUJNVFcAZj74m/E?=
 =?us-ascii?Q?LtGU+wNiDIPpsdZ1hpF8+3xF8pS1ap6GDKkkdjJEuwVbjhspZ8qipK8lfljJ?=
 =?us-ascii?Q?xD45RWhSeonPy1CjGdmiynoLzsE1gDe82/vfKjoJKhCCzBJ0zH0lX3RdMvS/?=
 =?us-ascii?Q?zd2yr9AkWDDSuPEMM3qgbOY/Hs6N/cemcOmYtt3ZhvYKdCuQCJMZajMo+0XE?=
 =?us-ascii?Q?h3DiWyrxRmOh1RPctaT/005mWVTyTu3ZX0LQ9yZKUN+kkXneWJgjAQrlg8YD?=
 =?us-ascii?Q?2CX/vIf4EL9OiFJZZmlux7chSyRQnpqY8VGazFbPrdDIrpN9tkJOnGvPRgb0?=
 =?us-ascii?Q?KnP54hjLD3v3p7xFouyuLPfzFCxgn96Nlu+wuzcZf31OwcZ1/utowMjzJAts?=
 =?us-ascii?Q?kJf2YqlrCB79lxOZNmwZSFvN/FNv4cp271SuJ4zL7P85Jnh2oAatTi8AmwjU?=
 =?us-ascii?Q?l6FydrwFl3SR89BncBbmVQyXG/SCWgVE8vJEv8PtNg/6Se/7UVuBXSmibFNm?=
 =?us-ascii?Q?OTh3guTCle0Fj7D1yWobHjP/ThHYt3w17Sbvl6nv2RHRWEFllFJYbPUoWCpp?=
 =?us-ascii?Q?pU0sn406ZbFYgrKBjcKSQkO2AQGYLaDbVYcBNEQwk1U4dT24zyo/Qw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3unR70n6Xf3/+HaFea6vgrDf6qbkG5Zf86ad+QjJmvnV6bl3N9hBa/5exUtN?=
 =?us-ascii?Q?nVGv4BYzMRPS0TduMKRecnPRnWdxnpPQwMNuapkwGYis7i20QyD6q5Cy7RZL?=
 =?us-ascii?Q?cDjlDww9zmX16spnTOWQwRRXWtvVn59TPuQGpeVDlDYshPi9xZf2awuCZQhE?=
 =?us-ascii?Q?njhKMQKiFe117mHmmrtmM/sM9c9QCh5yOHmjXBpRu7CkJ240N6xYql4v7ite?=
 =?us-ascii?Q?cS8N3w9A4yWFNfZ2aI7tecOp1RHb5BwPQf0PR+3/IgHZDjc57cSYKs1VSk8S?=
 =?us-ascii?Q?sniB0ecfZcrDPBC0azwEJYu3WwBQsp6/eANETiTSt15vGPSPWdXwjDIArnAZ?=
 =?us-ascii?Q?mrhTgx6pPxRbVKGdFM6Eyt8pJBOKNHJvABqXxXSY/71lZywAWsIlMvFGXfn2?=
 =?us-ascii?Q?ova2yI28AcajoiQcHbjtip86tO9EARDlIJWaq7aHqnRPo6CS9zEbYEP0jxZB?=
 =?us-ascii?Q?PGp8Wjdx0vOQyMjf7RFUzUuE9dhklYmtHNaeWfV8YcIEjS9PEuSEJgnL38kr?=
 =?us-ascii?Q?uyx+Jd8O/1puFO83TEPZwOIqq2R5qvKLst2yErySm+MCi0/n/GobqbDSjtiJ?=
 =?us-ascii?Q?GVrlv1JP1PVaU+yWFg3dkcqa/Lgb/Whw57UtJYlj56yXM+ZmoNa2BHX2tOKg?=
 =?us-ascii?Q?taJYBMr9ACcrgHTES4Gb+uE4qCtHEKqYx0DYghTa8i+JINWkJY9x7TtGX9VE?=
 =?us-ascii?Q?nLB3J1J+nZVmmaLxQ7ZUF6xJsgEDlpod16g4pr0IqboUMg9xOFIbeLWhE1fP?=
 =?us-ascii?Q?pFb88Ramad3nmk+uM3F1/xvgmn2l4VeClSaVdz7X3ZsMJes/XYlKavNTPEs2?=
 =?us-ascii?Q?3SqQQ4Mwh1uRQ7NppjCownOxstepbjYtART3vronp237uZodQ9t1q5FBs71C?=
 =?us-ascii?Q?U2BjglDsa1hExyPT/i0nhhAX6dY8fonailA4x0lJvSfZuHGPwWlEaH1Agurs?=
 =?us-ascii?Q?15L/sb0iZJhDDrT5KHKpQCVCP9HJsah3uKkTGbLHlxMpB7cuHGieQrvsJolS?=
 =?us-ascii?Q?8DDX07CpJK9olTPk8LB68ttt6y0HfBWNLu86tA2+jGaS0e49g9HDOtRzIc1V?=
 =?us-ascii?Q?Y9fGeb/Kk0A5xrJ7sTqRJ6v5iLF3A5PRkocQt38AV2GLePTa+WOBItgsQ7nR?=
 =?us-ascii?Q?VbdXcraGsRpNwJ0fw7X5O3qhMNJciaE3JDtMlkpyF7033wTlAHMyXia/IPS3?=
 =?us-ascii?Q?vBwDYRwHOKSYpJ3fBhHdHx3hwu0lN2BtIBV4Fx9yBZSiSzXniG2pdBGuvOcp?=
 =?us-ascii?Q?mC003RPQK7+U9TW0idx0GJda2JAd2sKsCvjC8AP1D2ffaCLBDoxmG0p3C4ui?=
 =?us-ascii?Q?Uj7Fry+EuoCxEVqydnbG392PVANUC7Fn5f7hRIz0VCU1dc6iJ6bRpmS//QX0?=
 =?us-ascii?Q?qhgRjTRzHg8VvomEavYz56NwKVu9hVaAVn9Nz8T5i+0dEw/ZRDq45oeMdl6g?=
 =?us-ascii?Q?jvfPI0sjBhSmbEvmbn9qpskJRbDOq0Ns+9jH4MOPBnffrvmAEz79NaMvlsqA?=
 =?us-ascii?Q?v/6MfFOLqae7taFaYwRu1VCRkXIM1262TnrAXTX4XmYsdOpVEPeZtP3hswoq?=
 =?us-ascii?Q?SCmOKgKxPwlu1Tt9SDWnkTvKuKGA8fjBpWgpB3GW7eW2eu3o83mU2g/0paTR?=
 =?us-ascii?Q?xYPwAAP78gWDSRVSgdF2RRjzL6qhhv9vUoMYWbNgb5s7gR4+GAk9Egv2Azgm?=
 =?us-ascii?Q?K6Uf3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed709773-4e47-4c01-5e0e-08ddc8d4c7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 04:03:56.9921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ll8d3VM0UkMWRj5LNXBWtK802EXp4AELC+eMuZAErcQRSiWYS6Mg69TrFq9yYAB5Mxxx9zDyniSPEVzFYxLSJqsojozmY21GoXJKU8CIHao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lukasz
> Laguna
> Sent: 21 July 2025 02:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Laguna, Lukasz
> <lukasz.laguna@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in
> remaining affected tests
>=20
> Extend the fix from commit b9a5a4d03955 ("tests/intel/xe_*: Use
> NEEDS_VISIBLE_VRAM flag where it's missing") to additional tests that wer=
e
> missed earlier.
>=20
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_drm_fdinfo.c            |  3 ++-
>  tests/intel/xe_exec_compute_mode.c     |  6 ++++--
>  tests/intel/xe_spin_batch.c            | 12 ++++++++----
>  tests/intel/xe_sysfs_preempt_timeout.c |  6 ++++--
>  tests/intel/xe_waitfence.c             |  3 ++-
>  5 files changed, 20 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c in=
dex
> 17f66f1de..264380d99 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -158,7 +158,8 @@ static void mem_active(int fd, struct drm_xe_engine
> *engine)
>  		igt_assert_f(ret !=3D 0, "failed with err:%d\n", errno);
>  		pre_size =3D info.region_mem[memregion->instance + 1].active;
>=20
> -		bo =3D xe_bo_create(fd, vm, bo_size, region, 0);
> +		bo =3D xe_bo_create(fd, vm, bo_size, region,
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data =3D xe_bo_map(fd, bo, bo_size);
>=20
>  		for (i =3D 0; i < N_EXEC_QUEUES; i++) { diff --git
> a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index f321e1d76..b904dc76b 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -367,7 +367,8 @@ static void non_block(int fd, int expect)
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
>  	engine =3D xe_engine(fd, 1);
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id), 0);
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>=20
>  	data =3D xe_bo_map(fd, bo, bo_size);
>  	memset(data, 0, bo_size);
> @@ -464,7 +465,8 @@ static void lr_mode_workload(int fd)
>  	engine =3D xe_find_engine_by_class(fd,
> DRM_XE_ENGINE_CLASS_COPY);
>  	igt_assert(engine);
>=20
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id), 0);
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	spin =3D xe_bo_map(fd, bo, bo_size);
>=20
>  	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c in=
dex
> 48a888e35..ee2d0ec3f 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -276,7 +276,8 @@ static void xe_spin_fixed_duration(int fd, int gt, in=
t
> class, int flags)
>  	exec_queue =3D xe_exec_queue_create(fd, vm, hwe, ext);
>  	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size =3D xe_bb_size(fd, sizeof(*spin));
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	spin =3D xe_bo_map(fd, bo, bo_size);
>  	spin_addr =3D intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
>=20
> 	ALLOC_STRATEGY_LOW_TO_HIGH);
> @@ -347,8 +348,10 @@ static void xe_spin_mem_copy_region(int fd, struct
> drm_xe_engine_class_instance
>  					 ALLOC_STRATEGY_LOW_TO_HIGH,
> 0);
>=20
>  	/* Create source and destination objects used for the copy */
> -	src_handle =3D xe_bo_create(fd, 0, copy_size, region, 0);
> -	dst_handle =3D xe_bo_create(fd, 0, copy_size, region, 0);
> +	src_handle =3D xe_bo_create(fd, 0, copy_size, region,
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	dst_handle =3D xe_bo_create(fd, 0, copy_size, region,
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width,
> width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> COMPRESSION_DISABLED);
>  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width,
> width, height, region, @@ -361,7 +364,8 @@ static void
> xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
>  						   mem_copy.dst->size, 0,
> mem_copy.dst->pat_index);
>=20
>  	/* Create spinner */
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	spin =3D xe_bo_map(fd, bo, bo_size);
>  	spin_addr =3D intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
>=20
> 	ALLOC_STRATEGY_LOW_TO_HIGH);
> diff --git a/tests/intel/xe_sysfs_preempt_timeout.c
> b/tests/intel/xe_sysfs_preempt_timeout.c
> index 139f68d22..ff58c4d49 100644
> --- a/tests/intel/xe_sysfs_preempt_timeout.c
> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> @@ -86,7 +86,8 @@ static uint64_t __test_timeout(int fd, int engine,
> unsigned int timeout, uint16_
>  	exec_queues[1] =3D xe_exec_queue_create(fd, vm[1], hwe,
> to_user_pointer(&ext));
>  	ahnd[0] =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size =3D xe_bb_size(fd, sizeof(*spin));
> -	bo[0] =3D xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0), 0);
> +	bo[0] =3D xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	spin[0] =3D xe_bo_map(fd, bo[0], bo_size);
>  	xe_vm_bind_async(fd, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
>  	xe_spin_init_opts(spin[0], .addr =3D addr1, @@ -98,7 +99,8 @@ static
> uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
>=20
>  	igt_nsec_elapsed(&ts);
>  	ahnd[1] =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> -	bo[1] =3D xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0), 0);
> +	bo[1] =3D xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	spin[1] =3D xe_bo_map(fd, bo[1], bo_size);
>  	xe_vm_bind_sync(fd, vm[1], bo[1], 0, addr2, bo_size);
>  	xe_spin_init_opts(spin[1], .addr =3D addr2); diff --git
> a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c index
> 48076ddeb..5fcd4fc74 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -238,7 +238,8 @@ exec_queue_reset_wait(int fd)
>  	};
>=20
>  	bb_size =3D xe_bb_size(fd, 0x40000);
> -	bo =3D xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 0), 0);
> +	bo =3D xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data =3D xe_bo_map(fd, bo, bb_size);
>=20
>  	batch_offset =3D (char *)&data[0].batch - (char *)data;
> --
LGTM
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 2.40.0

