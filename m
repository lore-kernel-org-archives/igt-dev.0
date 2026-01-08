Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A636AD1489F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 05:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B44F10E68F;
	Thu,  8 Jan 2026 05:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ohd4sHFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D07410E68F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 05:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767849236; x=1799385236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RIt/mGdMPMaBb2Vq7IWZkO4G0f2lm8GQSAGPUtloVKk=;
 b=Ohd4sHFIgaHsMgJ+mmVMegXgLalMGuk7mly515BxEKd9Vi97j3vXV5KL
 /7jrysLx88dHo4oJLtOZOkAND6ltony3prEn7l0cLQlxhKmRwunTPM5BN
 0GpMsUMBPLNPTwsEcfRuxJCqlv7MwFQ142+ypFDlPl/i30FXor0wCWPQB
 FRBAZOgb4FuEByNCienkSyP45mW84LaZdHa98LxUeUae8NWR5HJzF3uym
 BoeyJm/Q9L4xeN1CGt98MPbJKt2kz8cLZXF1hjwAwxhQ80qPs5gzn639A
 b77sds3ngKv7MPMffCxv/mD70bHarBfuBKRVnnwnmH3Ch2fEaM+z5yhBn A==;
X-CSE-ConnectionGUID: n31xl0MLQ7GW/wi9+OD8Cw==
X-CSE-MsgGUID: tXvxP4WVS6q4bAUi0/DtQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56782517"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="56782517"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:13:56 -0800
X-CSE-ConnectionGUID: +eYNUL9TQDe5HVckn6gz2A==
X-CSE-MsgGUID: 1Vjtp9R3T1GTNfpSst1Htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203387544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:13:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:13:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 21:13:55 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA+nKP8R1K6x7otxW9PmpEmku7bWRfPxPKlABLtBB6uyM14hCa+c3HaQ1nkXy2z/0P4U9hh32yiLnHqfS5LZ4WH1A/Nv6a9wzd2SWqbU/8/0fZcrhLtg0274rgqy2xWpMxH5Wb1V4BstfUHAKg+dnEmqDbAKdsUnRKD9T2ACEdn1rgTk9qyRO2Wo57aCv3MBYOKeo2ohQfKcAS147JmTRTGs/tguDqngibUQ79g2oJexE4lf/oAPZdRRDAKeHMsiWR/bbVPgrGRd4KUQ66XInV7A2lSGrn0qlZ3gnFNl7WHKkF8i9CuKrYrXV6gzMtArvhGZQJxaPURlGDOsNRtgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7ItaukBn69vDruZ8GmrgmLR1Tqo4rFKxmHn56Or3RI=;
 b=Zyws1/iuagQOMeXwuyIX9JZPx392j6sv7OfmDi9GxjgtdkgPa1UgJjHjeJ4UaOb3l35edlix6zuAJ0njyQZZHqQBY3dw7jVX1UUE+FHZBf0Wi5SiyGzeUM6W5V1x4/upDKuHXqsgNBoTZQ2/gG+fWvsEA5Rp00QYyf8xfg6G6NJ+wRlE9j/rqXlv7aZ0ixox0N2zJwjsWJYFuaDn6y1PeB7K1ESd3s5ohzxFN0Moh9i8HxspXwECrVOyzQwRDwSdM5fleInIuQSecn1kABcDCQGXLCOLKciFTB10JKrpZERy10jZES/YaMiGEmxBWiBLeQHzkozXlyx/Na8yhUEnRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB6856.namprd11.prod.outlook.com
 (2603:10b6:510:22b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 05:13:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:13:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Topic: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Index: AQHcZDa3Mg1/PagPH0yCwvijkObKP7VH8iaQ
Date: Thu, 8 Jan 2026 05:13:48 +0000
Message-ID: <DM3PPF208195D8D1343790F2DC5D6E2E430E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-5-sowmiya.s@intel.com>
In-Reply-To: <20251203094307.3187669-5-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB6856:EE_
x-ms-office365-filtering-correlation-id: 0dad7e28-7ed6-43ce-db54-08de4e74b44a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6bfjGRmTEQUKyaH6hxjHhwlv+88Xl5T6lfnp+nnbro7Cr51NyXbgw0HmfKyy?=
 =?us-ascii?Q?Qq65Q2eucKdLmCovzuwwflSmFetZtucmu6KkjI7Uxa4U4G254ra+aIaKjnEv?=
 =?us-ascii?Q?NikW599GCiBeM+cJwHEynzH7dLR3EMWPk2MLJYIX0H6/K1B3VbZg4tGjnGcL?=
 =?us-ascii?Q?wNGivKjzNZV5O0cXGuxaowPRe+csKF/WgHMBqta7aLPRWNPeMITNogFc7dDw?=
 =?us-ascii?Q?sY2rK4YpiT33YIgPffkN7GdZXpoK9vxW/g+rPDJ1C7wjMIMKAjVDUpyLJs+V?=
 =?us-ascii?Q?d1RLSyduGPd64Pc0hJR6dh6n1+0VPq1XqkAC3XzXf5POXZBW/erULyVI/DyF?=
 =?us-ascii?Q?qWNvj1yUnSly2qjm+7tuy2oLj6c0LBeQhOb4mAUHSi5ffHgylGbIVua+ANnC?=
 =?us-ascii?Q?FJcYEdHa4gJMPHhSrEViANqGTMzWsx3oT1Ct6dbGcBQqKt+cWLLPAmcp7FLz?=
 =?us-ascii?Q?c5De5DhQtbl1n+LXFnWBPyLRyD5B3qXLvOQLGMTzbGmJHkwijmzKDeiQGDgr?=
 =?us-ascii?Q?Fxl4TgRyx9AXYKki9/HdY74c3JRLZr1RTGg7WC3OfiMH+fkL0ZsbMK0ri+rG?=
 =?us-ascii?Q?WMnZbhYb7wNv+SjVqBWPHQH0w83GsTxWlgbd1O8P4ua+9LpueTtkMpafm3Fi?=
 =?us-ascii?Q?ExlW5y6GVsgl0AJiboRpzqJzxvNwru5JKWjWlgwopUe44IODS5J15DATjjdq?=
 =?us-ascii?Q?BjEpMqgP0170FeCKDRtBr6VUlWIOXlHVnRfOKKS90AoHik+APunl1PFBh0hR?=
 =?us-ascii?Q?peD9yzCpa94CFFYF2FlFsJgtSrp3p9uwei49oNxsE1IicxuWMUZwf2D7a5ma?=
 =?us-ascii?Q?MCg+jagObsRjM4l9S4FCOXE2+yeE5NQhO9alPAgkPvIttB8WlyNEx3mVVO+Z?=
 =?us-ascii?Q?08Jrm1RhvBIUxSt7JboMlAJHiqwV5DL5acEV0xXESFg/hwfUmHGt6AObEcA/?=
 =?us-ascii?Q?t2+EGcicAEYfyK+AMqBwWL4UtdDrzwlsnYktzcYF5sk2ZWDGgE+38nt/WF9k?=
 =?us-ascii?Q?+1Yo3bL1AULZVNyROJgo6kaS/AwRhCQI7SjxEHxjX6rQ7vZe37ViGeBApg7E?=
 =?us-ascii?Q?ALRYnSUAzSa0Ai6m6R2FExm3K2i8dnTJn5ps3MTHK3fDL/w1NyiHdVJzVvmA?=
 =?us-ascii?Q?QFcHVK9vjqpi9vKl3l3FHNjZGJUf2Il6DoKqfHBIJXwuC1aNfxHrgvRdofWY?=
 =?us-ascii?Q?R1HF/O8a5fJvMFFxMCGpfKKPXXjClwRsXuFFYA8jaIIWqsMfc87G/7A+lze3?=
 =?us-ascii?Q?7N+ehre5hEMLXjFxfXMYzrmjNzL8/2/VZMpWxBRVtHJVn3unGMyIDErlXWU9?=
 =?us-ascii?Q?Ql6xWlNeLcy6rBBDAu44yW65gVYaKEmzIoxWqH2+/qMdnPL5RkYjmyKyKTOB?=
 =?us-ascii?Q?ID5LIqeRAaEsziagDk12L2ob0bE8ox4OMHL+c7kUmpl1akQ+EeRyTvtxzxnt?=
 =?us-ascii?Q?0uRTVssvrzTugc7pnZPmWsFar+mcs+Hg14wf6dNRitJguh9PMk2ihJJqOZJP?=
 =?us-ascii?Q?bsEeMn6b5V94sLpCha9JMM9Hjp0nDf6wwvsG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a22LRCOMOJ+zId5gz1+zbwIzn83VP5NGotAE2AB1CwwEbPI43X+iKCpTGN5r?=
 =?us-ascii?Q?qomNC8rdGIuTytDwCgfzuCYy6FSYFvciQb0oBPsmIsr8hxLh0U3AWodfm3v/?=
 =?us-ascii?Q?wc0uS1UgySoLm7Euan7SZeQ5KeseS+GKWXnKavVjGN0v70u+8ylV5kzMuNwM?=
 =?us-ascii?Q?aU7AWgTX5BwPMJivADHlxFgn/wEy+u5NO0vJ56EL09qe9gviFCeRg9QyWCc4?=
 =?us-ascii?Q?8Rc7lYQsEqlVTbu29xNJi2t17j40KJCvtRwD7N/ZE91dUEVQ7nJH3mAirDTO?=
 =?us-ascii?Q?aBasWsqpnPyFJXIlQyU7WSrV7voLzZ0IOudzOkLOoaSzargjKzmXG2aZupPq?=
 =?us-ascii?Q?ys1bWwh7N4OZokkE7Fxv+0sRFEFLESRtSv0g6P4SrtNSXJyMvcdyMk7ffize?=
 =?us-ascii?Q?hrfZU72kVHNCwqoV93pjYhqTUH9vfhWUUeNGr76tdMN1gQnCkR1p2nxEvMQA?=
 =?us-ascii?Q?Dus7woZQEBhHcL1ltgJLp2hSLPjUY/6w7bfDU/FFdBzuPsrg+bGMc0Vc9Kht?=
 =?us-ascii?Q?3Uh4WRqwShKy4xB90JSFeF3bpLAUGROMybDR4Sjbtjr9T4IJSZROCJrZ+jAF?=
 =?us-ascii?Q?isIQ4yt9qK63pBaEdDHzlQnoUrnWXKTWhJUVi3gaHT0CaIp5TA70jcWkgqxS?=
 =?us-ascii?Q?/FnMHtNNXumk7vSDJ++moMvNEQ49/Mjh3T8grP0c6Fy1VD9ybQSkaLcp9uND?=
 =?us-ascii?Q?71XYODiftsdBi7ENbTo5XkUvfsN3bzIiuuVL3O8vAD5jDaRQupkTkIgcfeJ7?=
 =?us-ascii?Q?TxBP28+fAmxDeNENx5vdsFcnGE/4LHkmXv75gG8N1VZnpE34Q0H/J0iDXFkO?=
 =?us-ascii?Q?koF4XEqxtYPCWPKELOcqHZXaOuWY2BNWH5D2BGL4hIgSB+GohR+TbNipeHpB?=
 =?us-ascii?Q?pTku784FEHkJUNnmUhqcfBF9WnTsSScEGwdoTTQVAGrwN9nn8XXJBggMj1K5?=
 =?us-ascii?Q?2Nl6Me1ftMzwSKt1JK0gTahU1mO56vqQpH2tZwhMJ/BS97sMrI5gV+yP8LnY?=
 =?us-ascii?Q?LoykPf2H7JXmfmkprTs4YjjLxAQSDzfdio5ahW48629MEGHsJ6JY3Z1yBhQc?=
 =?us-ascii?Q?RCxsJter053xgNXoTwwtJpLxn5hEH7ucBh1acvthaiSQrqLdrfVAVVANwGT4?=
 =?us-ascii?Q?nw0S7qD2B53znT12k+hl7d3lYQAVPhyeIpPQrNYqhc35p9xQqyLbu/wcSzu0?=
 =?us-ascii?Q?c46jnR/OIGnZk+wp4n5JBV48kcfLG8M/Q6DVaxIhmvYIx8/jI/Ms2SfMUyQW?=
 =?us-ascii?Q?CV/ose+YygEy9iun3e61nw82OYKZp2pFgvu4WDj+q3Ho/Wg1Y+m5yFTiv93+?=
 =?us-ascii?Q?zbo31MJSMlfUe4aRLFnRhzxMoqJI/8fOBsORaHqQ47z4A5KGsZPnHCSNHfN0?=
 =?us-ascii?Q?Y+bl760tzmJ3l4EnAi6IPEIgKMH+JzhZk9v+LvJ56V5O5XQ6k7H0V93bbuNd?=
 =?us-ascii?Q?MR/ijtQTXxGcW4K/pKiTLDrTe0tI9TgXpvenofx+sOU0e6UGBH2v56IVj+XJ?=
 =?us-ascii?Q?oTy5tZyCvKSavSYFiUAe5OuIDxgob8j4NtYnCVf2m61UzCk1AgZ8WIEF20UY?=
 =?us-ascii?Q?gzkroc/Ct+X+NCf8spvXioggUl1hcXR+vNDNDvNArSit9ZvTGyh5VqlLajxc?=
 =?us-ascii?Q?Pl0xS94C/waP7SjovKed5VgdaDHU5BR50pxRIqiMYvstoMhG3S8u6UU3k4qU?=
 =?us-ascii?Q?apTFctOqZpxwODEQZBT6Umbj6QctPGpLIFiyzS32/AlbvsVZ+yYaa4CujLJP?=
 =?us-ascii?Q?cMDznbnRdA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dad7e28-7ed6-43ce-db54-08de4e74b44a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 05:13:48.0647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNVTwWWiLLEPpmEz5xpKgQiE5uyZ70NhKFX++x2SRqt8y0Le8FcQ7+MnJOH+NOxHaZ3u57OL8IftLBDNXLSUbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
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
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Wednesday, December 3, 2025 3:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format handli=
ng
> in commit_and_dump_fb
>=20
> Modify commit_and_dump_fb to select supported formats if provided; Apply
> default format based on the platform when none are specified.
>=20
> v4: Add get_format to assign format based on platforms
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 473f6c58c..6725f5ea3 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -101,6 +101,13 @@ const uint32_t fourcc[] =3D {
>  	DRM_FORMAT_XBGR2101010,
>  };
>=20
> +static uint32_t get_format(igt_display_t *display) {

Get format for what? Function name should be clear and definitive rename.

> +	if (is_intel_device(display->drm_fd))
> +		return DRM_FORMAT_XBGR8888;
> +	return DRM_FORMAT_XRGB8888;
> +}
> +
>  static bool check_writeback_config(igt_display_t *display, igt_output_t
> *output,
>  				    drmModeModeInfo override_mode)
>  {
> @@ -446,7 +453,7 @@ static void do_single_commit(igt_output_t *output,
> igt_plane_t *plane, igt_fb_t  }
>=20
>  static void commit_and_dump_fb(igt_display_t *display, igt_output_t
> *output, igt_plane_t *plane,
> -			        igt_fb_t *input_fb, drmModeModeInfo *mode)
> +				igt_fb_t *input_fb, drmModeModeInfo
> *mode)
>  {
>  	cairo_surface_t *fb_surface_out;
>  	char filepath_out[PATH_MAX];
> @@ -455,12 +462,37 @@ static void commit_and_dump_fb(igt_display_t
> *display, igt_output_t *output, igt
>  	char *file_name;
>  	unsigned int fb_id;
>  	igt_fb_t output_fb;
> +	uint32_t format;
>=20
>  	path_name =3D getenv("IGT_FRAME_DUMP_PATH");
>  	file_name =3D getenv("FRAME_PNG_FILE_NAME");
>=20
> +	if (!data.wb_fmt) {
> +		format =3D get_format(display);
> +	} else {
> +		drmModePropertyBlobRes *formats_blob;
> +
> +		formats_blob =3D igt_get_writeback_formats_blob(output);
> +		igt_assert_f(formats_blob, "No writeback pixel formats\n");
> +		igt_assert(!(formats_blob->length % 4));
> +		for (int i =3D 0; i < formats_blob->length; i++) {
> +			format =3D ((uint32_t *)formats_blob->data)[i];
> +			// Skip zero or unknown formats
> +			if (format =3D=3D 0 || strcmp(igt_format_str(format),
> "invalid") =3D=3D 0) {
> +				format =3D 0;
> +				continue;
> +			}
> +			igt_debug("Supported writeback format: %s\n",
> igt_format_str(format));
> +			if (format =3D=3D data.format)
> +				break;
> +			format =3D 0;
> +		}
> +		drmModeFreePropertyBlob(formats_blob);
> +	}
> +	igt_assert_f(format, "Given format not supported\n");
> +
>  	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> >vdisplay,
> -			      data.wb_fmt ? data.format :
> DRM_FORMAT_XRGB8888,
> +			      format,
>  			      igt_fb_mod_to_tiling(0), &output_fb);
>  	igt_require(fb_id > 0);
>=20
> @@ -583,7 +615,7 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>=20
>  		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
>  				      mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      get_format(&display),
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &input_fb);
>  		igt_assert(fb_id >=3D 0);
> --
> 2.43.0

