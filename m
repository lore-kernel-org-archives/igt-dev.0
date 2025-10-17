Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B7FCCD184
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 04:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D84510E141;
	Fri, 17 Oct 2025 04:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRK8Wgv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD8610E141
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Oct 2025 04:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760676841; x=1792212841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6sUy4B88vmFv3yXCGDWmjABFgazG0tO5cYwCzzZRW1M=;
 b=XRK8Wgv6RtG/IPUcT6VB25C3Kq1i8xI8Nmfz7xeXXIhcZc6Fla7HtfjH
 NcNiLwwk7IIOTB3zqB83InEyh6G31agclaszg+gykoz+2zxwZZT756X5E
 znKZ5yWQ8vU1G6UPcHDISKz9VoMsplwgGhBrdeH4n2fLtMQfdPyrz/IRX
 HZPK2UblWqoFe1dyTUCGslEIJeSLscSr1fb3fdkXvYQFnJ7EPOGp4ZU3q
 95r6bcqMxx7yU8h7Rl4tr4KxKlMrv21nkW56vWoCevKvrpmAreO6JfHBf
 koO0y5gUPWHnL3EczDpnIdNY7nfd0zHh5PlX5fpft6TpbtQ3/jREi85V3 w==;
X-CSE-ConnectionGUID: 494nYoTcT0mk0F5PTvQcvw==
X-CSE-MsgGUID: eKrAYPQQSXKvthBOn4imPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62928104"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62928104"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 21:53:51 -0700
X-CSE-ConnectionGUID: IGEkht5KTkK0jbU92beuJA==
X-CSE-MsgGUID: 1ivU7dMNTWazB6aj1TFA7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187035897"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 21:53:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 21:53:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 21:53:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 21:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7SsIv6dIzX0ME0kRewMt6H83QerQUjtA+SYMmGc2lo3FomPlcq2vdal32zCh8O8PNIAcwlQSLxv4MeSb/6TnnBZTrf0UmeeDRDFKxz1UObxmzG1GNK+0w3QdTzbZ5aJPsPjmdeESLGtdwzBkdR58R3Eu/U4Ydy/R6bZrgLdk9R11/j3vZcKUuObDIgs2ZetWr+wckeSHs2HrzokG+NSnFABWfrLOO+/8qc7rK7IOY1NBd6P97DdJx5VzwF84WE15uepUbM1LQY5JAmwkh4uz/Y3/IZv5TlLNbSNUfGqudC8DDVYQgZJ5U7EiMtyIL4MovjfHISpyLZzvIWfDR3UPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvLOaG2wo1JXbRn3twFdSW7lyt+cHV7pcEpiSKE94Og=;
 b=Hz5Bxuw2facfxO29I6y4Q54XXwN7x5y2qRLYK9OUb5V4E1x+9fmXFwBlqBjBD7hRaeZazeg0Lha4j7xt/7d4fXb/roK7KoDA/FaxL+OcSPo2sq3cPaAqnADKdXysNAmynbpzhYeALU0OQLphcb3ooOhR5SuhN8bU4AHT93L6bDbg6n42fah9/3ivZ233X4WlIVinPVGXsMecb+j8MNDB8kOmS22SOsQlSTIHiGvBPJF3VPSoSSAAX0A9kjlXE22bf8a8zlgGmpbJA/LQmrmI4F2GwVhzDZZ1+bWXSI1VtoRuYdVtS0CoKtJ3da6Ky9mVbSSLbut9AfvOcOXfn2N9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 04:53:46 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 04:53:45 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v7 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Topic: [PATCH v7 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Index: AQHcPZk6GCc3lD1UOUi0hKa2jVht6rTFW1KAgABk+YA=
Date: Fri, 17 Oct 2025 04:53:45 +0000
Message-ID: <SA3PR11MB8046551730D0CE03BC0E019C86F6A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251015060144.6410-1-x.wang@intel.com>
 <20251015060144.6410-3-x.wang@intel.com>
 <20251016222147.GP5409@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251016222147.GP5409@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH7PR11MB6548:EE_
x-ms-office365-filtering-correlation-id: 14cd8912-510b-484d-0501-08de0d392772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CAT0tvBodh5i2hO1MqiHP/JbflTbMg5VYe/FjtDB6W+EnOGh3WX8kV6O/PIy?=
 =?us-ascii?Q?ZZIR9tDng3Ze3Wi7LAYMeGnK4/7MWMxtwX5VsMncmv7cbVjhETxmxe2w9R1A?=
 =?us-ascii?Q?CL8vcbIsykAYX3sDJM/7qPxpnwXrw3pjeZyXcXQ9sh+Fx+tvrzoo55TiK8/g?=
 =?us-ascii?Q?ARktHlmzp6gS6d8Pd1NR3auDpkITVd2oBCwIqwXi2jGIc4pU574eLnkm3dM/?=
 =?us-ascii?Q?WfKCU+RrhLNRq4tA7dXcJBsOePeGxemTFA5fJCgdzXrEbl+zy43c+6IkVHzU?=
 =?us-ascii?Q?ALJB8w8fDWpCjdtYi19JeV9kzFJjAQRLdIQa9ZJtRdkOmDoAXGY8uIuBa4NY?=
 =?us-ascii?Q?iRfpYR2PnFszSnRFabWCk3EB0hVrHSdbyFWHeMPX7OSAk48nVQ/kbOne0Q4J?=
 =?us-ascii?Q?tEK4TgLFWDBpU/4F8+ZLv25hmuiwsgIV7WsWWib3hj0yn4XeQJ0thfJS609z?=
 =?us-ascii?Q?/SILhWFeZz2aHMjN/ND9us4vrxV19YWjiW//FLQ1Gbpd/aGmjZNrHoDEon8L?=
 =?us-ascii?Q?NqWQO3fWlMzhHU5ZfI+PMGf9W6Z9pV+AsH7lgWo1SRnAfgp0sUjmAKGAU2ZR?=
 =?us-ascii?Q?0WMqUqP9wRnKKavzjQwtclqJTkXQOcwBYmCT/nCAT4GVbT7XEpEbgI5ctG91?=
 =?us-ascii?Q?MWw0QhJCr3OqvdTn9oGf/zsug+pRP6xp01G6SyUL2UCLdktCRP+sBei6WpZk?=
 =?us-ascii?Q?pNeDMJBurpVDVvoDYx7HAdIw75iS2OxP+YwCYECDZU++51V5TN8anG6+EPBa?=
 =?us-ascii?Q?JN6XrO/V5y+ECXvPK1q6uGAp6nP9ncUJTrMLXfsxcdM4Tsox+IZl6+FhWX6s?=
 =?us-ascii?Q?CN4D0YLJ3gdAbSBmZSTdZN82hIfBPI/3YAgosWua1BVf/yRLNckzMjbCcoA4?=
 =?us-ascii?Q?hY09IDWdvM/FNK6vX+xMInCD6EU5MtMqr/3/oVRvxZ6ZOYImwlM++wq/vwla?=
 =?us-ascii?Q?tEWBqHNFjY2s59MBnJGDYUHfpDd+IgkIkjaBgEWNN65iB2w4+nMt2R8g0U+B?=
 =?us-ascii?Q?kU/1rfvO16mB8YccBF03EK5RdqHO/27IzRoByCh9qxKcdUElfByop6XDWKYk?=
 =?us-ascii?Q?E8NbuYWUtVh0UWXIoOdb6sim7Wx4yCQVU3m0ryuWyYZVhRNmcpxS6qcZ4JXN?=
 =?us-ascii?Q?fyq2oCEonyk+aaKGK8naDRUwgLVZyyZu4ShwH5kuSgCXr9obKFP7H/iO49R5?=
 =?us-ascii?Q?RcE3HvKCTaiEU6CvVJqc1599Qbgfy1Ax9ID/0t3S66weTCZ7a254OZ4l2yHv?=
 =?us-ascii?Q?QjfcgvtjAThtEYb2T3BSul6EJQiOKHYncaLjBFpByfc/Or/2uIVrhvYjsvqm?=
 =?us-ascii?Q?/rkrfF/jZyvVWp24zxN3yko0Iw84MWjmiZWB2X3jIZPJ0sDzLHcgb+TLLObz?=
 =?us-ascii?Q?UP/ypMM8URlVGTHAEcJilyx/OvfK0LhEgNNZd8Gn7JSHuerqOJWKUvAXisIM?=
 =?us-ascii?Q?f9z+/IF3UzqfvPBsFwHiax3hwxMCAy4Jnomxj7J3u0Ymwrr3dCMYwtai624L?=
 =?us-ascii?Q?r8khBWKZ6TEum+CyvGPYLeFDph7+0PvSON8B?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e1+RX9s03S00v/ktE34X7pyJSixpSO+KpNoEtXBSA5Smv68cz65bwATB7R71?=
 =?us-ascii?Q?B27r3XrumJe/gOkLpYO9PHIlgE6QblcEQqavUEtqf0cCV1BY1rg2OM5Mk2qN?=
 =?us-ascii?Q?edogzlzVOMyfqa9UewdZryDZhrZVAPJ8deI8K+KNOa6s9va4c5qQhmI49CL5?=
 =?us-ascii?Q?OIoaBmBMQhqinorTn2l8QgrzTXI/beUyGl2dTLhjdnrQanwyf76Mo//dltZp?=
 =?us-ascii?Q?juHHdmcCsqQrOqQkgg4WwIkgo3+Ib02QxsUZGjAoFvAHbDGnrBIoNq65DSt9?=
 =?us-ascii?Q?+ZGSqcN1ji9zIT55QSNyWv05b8E1HBckmdlrvKrCoV5He4wYVKlz9oLC5heg?=
 =?us-ascii?Q?s+QexOvs+HAxAWnW29rzHSUZ6TSrwrcfTYpDaaYY6lqCHMftk9DGItMLe+xn?=
 =?us-ascii?Q?WACbPC5GXY63CNlWwN5Anh0BfPKGqWvZ60wnCsJMP3+aqR8vGMIsF7H4cav5?=
 =?us-ascii?Q?v2A8E6QLVFbY8wZigQJegLg+5gmMn1RVwmxfxxO7Z1jr4h/KUZT2nTtrErb3?=
 =?us-ascii?Q?/Dd6knLSYaYQ6D+fjDjOVwSsUs9C4asJy8a3NGPHQk+RJKV9OfVQ6k5qiwbx?=
 =?us-ascii?Q?SJ9pcJTNK7hS/YKP5ooZZ2Vdfj91oGawN7cjCaNadjZzY2diQkxVHYKYl+yv?=
 =?us-ascii?Q?MlpWlh8DQeagBIk6bM0kUgMQd1zjs+P7fZUZmlgx7+Ca6tPzkwIDByiMJeHt?=
 =?us-ascii?Q?CITWDX0vR7nouCNFNS4zKHQYOTvIivtukQGk+/N3Bn3W9kxhkpgVfQfvABaw?=
 =?us-ascii?Q?lbD4toTBLzUKk1u+BY2PK9G5pNVjJv+4xUtI8POHO7zav1MYNlfgIFlVEs6M?=
 =?us-ascii?Q?lwCxR3YZ5m5rMGZP0lKEIYjvaAYzH2Z7fhGlgtoiALz4b24Ah8lkAMLQrnpo?=
 =?us-ascii?Q?mhqD92KAGitU4uHh3MiKZwUThpa1FQHuP/NzIlO/ewIeiOKonZhw6M4Pt0xr?=
 =?us-ascii?Q?LM2fE341t/NJtPUEMhacFCxIJOUi/TI4pKtPE44ieFGwEjlZYMCLG8+p+E0Z?=
 =?us-ascii?Q?NNA4hPQNJJzi1htJbBeYrrgbpJOMB3B0SXGeTFHAetjbWuP5qZSAMbQbtpUw?=
 =?us-ascii?Q?uEJO0o6lkEdS7sRyZ47znX8zsSmnRe16GFTN8sE/4yUFn2r10yTq9Klqa1mA?=
 =?us-ascii?Q?2JgOqi2Tq0OrDXf1J0alHLk3tLaX73Q4giuFRctdQa5GFVvPGrUw3Y0Af92l?=
 =?us-ascii?Q?j1sHGd+Ut8cuGD8ICY1DWm+oOX/1iplcaqYCtiLNo7WcEiUm2lqGGnObw57y?=
 =?us-ascii?Q?zFS1IKIsMskJJXssOOMfXxz6z8jR8SQuGTxCNNexOVUXWLHKDxYVbNJsQ8HW?=
 =?us-ascii?Q?81O4M5HRhHGmJB9QykxS7E1zPvTlU2SY4QfylHu0/E4BClqhvLIY9ugXmatK?=
 =?us-ascii?Q?NVCRPdhVDj9SGHoqt0cI/KFkU2co9omZfVAuf8960ycM3F3uSZUWLQwAy36W?=
 =?us-ascii?Q?nHK66RzSte/JuGsCXQXqEayaiZmyA2TEAPEunnScWV3kZtEXrN3wvOSJAW0S?=
 =?us-ascii?Q?dT0iVUEFw/ZgSEaQJXwFcOQH0j+ZObl8uI+wm95P95KyuulsBBWMCXywZpfO?=
 =?us-ascii?Q?e43DNPdRrc1zqJx2YoQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cd8912-510b-484d-0501-08de0d392772
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 04:53:45.9237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNds4I+PZGLA+nirqNfovvkySTdNLacQaXsTkkFhNE/dyzax2UZz9WRhddQm7sgdx7U/PpzfQSFXRviuRg+DcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Thursday, October 16, 2025 15:22
> To: Wang, X <x.wang@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH v7 2/2] lib/intel_device_info: Query runtime xe devic=
e
> graphics versions
>=20
> On Wed, Oct 15, 2025 at 06:01:44AM +0000, Xin Wang wrote:
> > For platforms with graphics_ver >=3D 20, query the runtime xe device ve=
r
> > instead of relying solely on hardcoded values from the PCI device table=
.
> > This enables accurate IP minor version (graphics_rel) detection for
> > platforms like Xe2 where different steppings have different IP versions=
.
> >
> > Implementation details:
> > - Use weak symbol linkage for xe_device_get_info() to handle static
> >   library compilation (libigt_chipset.a, libigt_device_scan.a) without
> >   xe_query.c dependencies which are used for i915 tools (i915_perf and
> >   intel_gpu_top)
> > - Provide a weak stub that returns NULL when xe_query is not linked
> > - For Gen20+ platforms, prefer runtime xe device versions over static
> > data
> > - Fall back to PCI table if xe device info is unavailable
> > - Reset cache on query failure to allow retry
> >
> > Remove hardcoded graphics_rel from static table entries for xe devices
> > as they will be populated at runtime from GMD_ID.
> >
> > This unifies device info handling between i915 and xe drivers, enabling=
:
> > - Platform-specific workarounds based on accurate IP versions
> > - Consistent device info API across both drivers
> >
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  lib/intel_device_info.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c index
> > a853f9ab4..ba4611aff 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -3,6 +3,16 @@
> >  #include "i915_pciids_local.h"
> >
> >  #include <strings.h> /* ffs() */
> > +#include <stddef.h>
> > +#include <string.h>
> > +
> > +/* Weak symbol stub - will be overridden if xe_query.c is linked */
> > +struct intel_device_info *xe_device_get_info(uint32_t devid)
> > +__attribute__((weak));
> > +
> > +struct intel_device_info *xe_device_get_info(uint32_t devid) {
> > +	return NULL;
> > +}
> >
> >  static const struct intel_device_info intel_generic_info =3D {
> >  	.graphics_ver =3D 0,
> > @@ -505,7 +515,6 @@ static const struct intel_device_info
> > intel_pontevecchio_info =3D {
> >
> >  static const struct intel_device_info intel_lunarlake_info =3D {
> >  	.graphics_ver =3D 20,
> > -	.graphics_rel =3D 4,
>=20
> We need to be removing the major numbers (20, 30, etc.) from these
> structures as well.  We need to be able to handle a case like a new SKU o=
f LNL
> showing up and suddenly having a graphics version of 21 or 30 or somethin=
g.

The major version should be always the same for any devid in one of the int=
el_xxxx_info structure.=20
I want to keep it since some of the tools will only use the intel_gen() and=
 will not do the xe device
open, the current code will make that kind of tools still working.=20
We can remove it after we do the whole codebase refactor.=20

=20

>=20
> >  	.display_ver =3D 20,
> >  	.has_4tile =3D true,
> >  	.has_flatccs =3D true,
> > @@ -517,7 +526,6 @@ static const struct intel_device_info
> > intel_lunarlake_info =3D {
> >
> >  static const struct intel_device_info intel_battlemage_info =3D {
> >  	.graphics_ver =3D 20,
> > -	.graphics_rel =3D 1,
> >  	.display_ver =3D 14,
> >  	.has_4tile =3D true,
> >  	.has_flatccs =3D true,
> > @@ -529,7 +537,6 @@ static const struct intel_device_info
> > intel_battlemage_info =3D {
> >
> >  static const struct intel_device_info intel_pantherlake_info =3D {
> >  	.graphics_ver =3D 30,
> > -	.graphics_rel =3D 0,
> >  	.display_ver =3D 30,
> >  	.has_4tile =3D true,
> >  	.has_flatccs =3D true,
> > @@ -675,6 +682,8 @@ const struct intel_device_info
> > *intel_get_device_info(uint16_t devid)  {
> >  	static __thread const struct intel_device_info *cache =3D
> &intel_generic_info;
> >  	static __thread uint16_t cached_devid;
> > +	static __thread struct intel_device_info xe_dev_info;
> > +	struct intel_device_info *info;
> >  	int i;
> >
> >  	if (cached_devid =3D=3D devid)
> > @@ -689,6 +698,16 @@ const struct intel_device_info
> *intel_get_device_info(uint16_t devid)
> >  	cached_devid =3D devid;
> >  	cache =3D (void *)intel_device_match[i].match_data;
> >
> > +	if (cache->graphics_ver >=3D 20) {
>=20
> Once we address the comment above, then when we get to this point we're
> not going to know what the major version number is; cache->graphics_ver
> will still be 0 and we won't have any idea of what it actually is until w=
e do an
> ioctl lookup.
>=20
> Also, even with the current code it looks like we have a race condition i=
f
> another thread comes in and looks up the same device ID while we're sitti=
ng

The multi-thread should be started after the xe device opened. Is that righ=
t?=20

Xin

> here (i.e., while cache is still pointing at one of the const structures =
that lacks
> the full version and hasn't been redirected to point at xe_dev_info yet. =
 So we
> probably need some locking as well.
>=20
>=20
> Matt
>=20
> > +		info =3D xe_device_get_info(devid);
> > +		if (info && info->graphics_ver =3D=3D cache->graphics_ver) {
> > +			memcpy(&xe_dev_info, cache, sizeof(struct
> intel_device_info));
> > +			xe_dev_info.graphics_rel =3D info->graphics_rel;
> > +			cache =3D &xe_dev_info;
> > +		} else {
> > +			cached_devid =3D 0;
> > +		}
> > +	}
> >  out:
> >  	return cache;
> >  }
> > --
> > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
