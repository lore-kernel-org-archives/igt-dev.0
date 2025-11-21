Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C5ECFA477
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 06:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E512010E7E8;
	Fri, 21 Nov 2025 06:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5nYhkTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01910E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 06:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763706722; x=1795242722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3OzqnXGQAk1qnpCiBj9hivUelb5DMjRYGnGgZiRVFF8=;
 b=N5nYhkTW6Iu9VOz88toqU4q4BSB9N49yFEVktq43jvqtHiFCVXvAyXoa
 eu2Qeq3+XZ9sYNL6lcGblkuD5yuZA5+XDxepz2bpNiC0t2bXccmi1A3Vi
 bNVE9TCwkyoIxqqkdeapH9Y4mqINZctR0e9kMyDm04zL6tYle3naUBIAf
 J+nU0UO0qJSHg+gXZ/P8kyM30OraWNAOQj764+h4EH0zWQCTc3y4JZ4F5
 tK73U93dM5PxeHRwBZewfK0W7Iq1gzl1da3gh/QgGXohHJGq2UQ11TYqq
 V2qrxMGtdZbYBEw0taIXLnTFvavscnNsZSmV9XPryiWaJwEn7dgCtRDoJ w==;
X-CSE-ConnectionGUID: k0ff2BmHRAi69JkM3oxBdw==
X-CSE-MsgGUID: 8PZki12wTu2bgORiOZ4sPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65686712"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65686712"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:32:01 -0800
X-CSE-ConnectionGUID: EPodShPNRDeQX6RNZQLWAw==
X-CSE-MsgGUID: DijHGAe4QMOW8/084lfG6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="190825664"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:32:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:32:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:32:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:32:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1FOegUmIROrruJnv2J93uPLd40Ny06PlqjyF6a9GVYSh3ugSBmYWvI1aH2R+4h4+WIQTBEWqn5RAF64p74faX5mqk1EUks9JFCoGzEfZLkc90ZIy6rT185A0v8DOBanT5Me0fNIaYq5dDxFoMX0NL3AACMfEiKXGKUbJ6bRvpeMoy6n/yHNNEtez/Qj+frkwn8o0MfWi+pxKonUDTo+HqpRbb3waXcIDOvTBOZjJ9UOKE+KSFIr2rKLUN0R4SsZlhGHWq776SCnnO5tYpGzzhdplVBt7FGtIMPVvBR3LXbJscoE4lbXWflqVY0GLG6sXpk8jF9PX0U9cHT8DSRdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUq1RGAvKE/gyUGK8ZUwCZYTSBBTE0Ixm6TbWql16EU=;
 b=XCJaw/5Yr2d1Zj4t9gmhBhJb3T84M9Yp2HCFxJ/RNLLzXsuByjsOo7mhU187bjWxcguhTzVgnC+3KtCMx2VFGhpRiX85uwgghilAZfzcUNaEE/CsQXVyoBkSQfSQTnsPmHhY9mAr/Ae0BP9AUu7m2pFH4p65/BSBRZxSqHGsfEUM+vY8/KuiTr/YTDN2p8wVzylUwSfi/LGpnyVFNF7SEqiFAppUp5etr11Eg8Io9rgi/lGegTTJsPHicLLw0cPxgdpvWF1IIeJhFiohB226qP9VhmIhZey3JDpXe+UM/l3+wmuvEsRVOtxVZT2dxXdwevjgacKH61QdwVfcnF6Lqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:31:58 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 06:31:57 +0000
From: "Wang, X" <x.wang@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sebinraj, S" <s.sebinraj@intel.com>
Subject: RE: [PATCH i-g-t v1 0/2] intel_gpu_frequency: Allow printing
 frequencies by regular user
Thread-Topic: [PATCH i-g-t v1 0/2] intel_gpu_frequency: Allow printing
 frequencies by regular user
Thread-Index: AQHcWgkXRk3yHusYfkqCuCH1AqcFZLT8qnyA
Date: Fri, 21 Nov 2025 06:31:57 +0000
Message-ID: <SA3PR11MB80463F19B48B6655D0DD0DF486D5A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|MW3PR11MB4522:EE_
x-ms-office365-filtering-correlation-id: 732366ca-d5ce-4c01-0862-08de28c7ab6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|42112799006|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Nib13R5VvTJamGuWMdWNmd2oTlF3zkCBvPNrFlJzumM1ymTzwhysMTWwhYph?=
 =?us-ascii?Q?5CRlivg94lwady77mCjJ1NMORE1GAfAN8Bv9pAFmU3DrH+XQ2MVUTboQYpwn?=
 =?us-ascii?Q?+Duq6ZwVM0hGlrgahWEGZ7M9GbsvGad62Jj4kR6fbXp/+VwcSxFR7s0uLsRZ?=
 =?us-ascii?Q?Cz8GpdHwT484FOEiHvxI8scJZ2dZh5iXBs7VcWEb/Fhjp8RfYMbgJRhJvDia?=
 =?us-ascii?Q?dLf+ZAxo+YJH0o9W5vI3NPntlkhom4vsMdvjV+QAYgzxAcctass5hOkDUVJ+?=
 =?us-ascii?Q?RDQGmJ6F/D9ZuiTYqXbx/Wnli0RcIDx4Lo+73AEmkviVv4lrPBCIIe76e/dR?=
 =?us-ascii?Q?3xrwqsi7oYok7jwn8FdPdkB2XbaQlBXnsmKkF0UYj4kxqZa27MaMARSul+HD?=
 =?us-ascii?Q?wkAVguL7ehHsRhwVlLv7M9I/Xx+X4+99OZSmlMklPD53knXOLcLOGLO+bu2u?=
 =?us-ascii?Q?WEz1FPhypPApziqNtxDd9uJbNxp7VuTqDXDa+HM6Ruf2aRdBVCy0lVmBTWVq?=
 =?us-ascii?Q?fH7ngi3SEKYnqcO1dzP1dwbfWkc2hmmfFKjJK2LtOv74Fk1JROySfAyYcMhN?=
 =?us-ascii?Q?w9xeY9oBN1DBJkjBJCq061b1MogxtfxkQpNP4Njt8TgB7ag8PFD09NA8eQXU?=
 =?us-ascii?Q?2ryoGDg/QRFmvtXup/xjw9ShXr2EwALVDzbk6BVA6xKEPi1WdcaOasc7g+zQ?=
 =?us-ascii?Q?kqoK8VCeotc+UL/iF8Th7U+lORiSY3qAnNsvlQOiaeEyIUm+1Mli+Jo3tEPw?=
 =?us-ascii?Q?RgbPim38APbhs1ppgK1im+veAj8FH8DDJ5Fm9661kZhBiT8VYQEyZTSMC0JG?=
 =?us-ascii?Q?2SM2btuR9XxaVxw8Z+O3uVp5Gnxp/80ET/kDXQbNDXvwxjafdOmi1js0sk06?=
 =?us-ascii?Q?kx4NituDNxWVXvu5BqsPihR2+tKDsBC8AvjD9FpAWNn8Oexg4915i94x5aBh?=
 =?us-ascii?Q?hrqkWOg9mYXbdEDkJ03EOKujKLJ98oKdbbrvKj6Hkaw5aA8H8UrdC63bAf6v?=
 =?us-ascii?Q?1vzDzvPzPc7rDYl5UTI0lRsOEf4Rcl7QHlib1UaS32aK/7xMld7aGuo1K4Qv?=
 =?us-ascii?Q?3g5ouhOeeNJJMdoQOaDgaGT4mokhxL6BX6kuukD2il2zUMsu7OKEMc0dzVhY?=
 =?us-ascii?Q?w6PJGqvv9xJdF5uBpulG4CkwG8HoH3MM8I1u73ZR/Okbc3SBuNV1I9tonj0p?=
 =?us-ascii?Q?kEn/a24LIA1NsXCsm5bkdPBP+uPZTQGX+ObAakLs7mzxKqEQ2UccRMYajGPk?=
 =?us-ascii?Q?WgLJck96XGucNq9eMys65Fk+qQ8q0AEY5sWLJYM9Atiux+yx99vytY9FUqCk?=
 =?us-ascii?Q?TxpBjMBOX+1KRJAkmsOZyBu2MmdRjtEbqi7k3VO5+uOZQWVV/tzQMViXO+Pn?=
 =?us-ascii?Q?uRtZGob60VJu8ZXqvcHIdEa5Sw5AX9BxeBYjo+y+giZOpZT1zEFB+3KT20Sh?=
 =?us-ascii?Q?6i+c8tFawqk6PyVWQ3fBaaXuGtj5Yf6b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wMQmt6b9C+BAmjAeLtVRetsmDi+QMa3RmrAXPoRCYMj2DrsVP9PezIPkQQ4q?=
 =?us-ascii?Q?M/RcJBPKUDwuKRdgPno3fmTcrS7KKdimVpT00ucvm67WhQeQge+N9omqBR0k?=
 =?us-ascii?Q?AE6mUQnCaqSUYtcstFG4ZYBTQh+xNhHUdqEuayo97n4g6JRRthB0lqU4eYxg?=
 =?us-ascii?Q?a9W28QkS+Wqc+5WLNBhbiBuPUXOEVBKSkFryiAwV/t6HCoxOgLGZYPCJlnBL?=
 =?us-ascii?Q?4fYaM33fdHddWlXzZgiXZ7DzUoBQX0sOCvvn/YM6PP2JgTPPrSrF6Pl73pk0?=
 =?us-ascii?Q?TMdqDWXXYBhRFyOEhwBNRl+5kHbsZKx47GMi5x6vRPAVbKgvDoI6tU2EW0vk?=
 =?us-ascii?Q?IvH2U8fimx5tBV/UdV0cMCkh2w5dIdVgI0fQE79UVcHF4ZKCKmPLUtwjywdS?=
 =?us-ascii?Q?XrSnZDN1Zw2rbe2KmJp91cHpNJ6/M75aw5+9rdIiaQTdTdLL4X1z2n3zN1da?=
 =?us-ascii?Q?tV+0uASp8/NNKhJ7qPzKday3fYANKpZGsq+wYjnyLyM/9tBV9TUZGkg02Cp/?=
 =?us-ascii?Q?QI0j3uM4cXIS0Z4LEFyID1+KZQ1opw5Smq1JIDNB0bE8jmetqshUQNuKXnXw?=
 =?us-ascii?Q?5yT6OX3C4IhduVgpgDAPxIqx3KonPz6SN53J83YGne1GDVL6N1cPOIXf+8HJ?=
 =?us-ascii?Q?6QFgY1XvL3xSr71xbrahb8/4/aHUKAM4X+xtHnxmG9n49uCyewQ3gv8MKIMb?=
 =?us-ascii?Q?RtuTqks0Io2gxDmMdC9jPx0S5Ol2EYNQFrZk9sxpVsjLV1J3Ud2FNPD1kZlR?=
 =?us-ascii?Q?mfTu+Wtf/69O0RO8mPXfZSffclR72geWEJc51k2gGxjp7N85L+WJMsHi6+iu?=
 =?us-ascii?Q?PM1RQTDoVYySK6nyGr2c+5vbHCLolkuX+opquEQMZ0GoOh+/JSSfpWJWv4ez?=
 =?us-ascii?Q?b+XnQunHNMl/UpCKDpPSKq5O/JC8HvsVwe8GI3hAxusgzntBH5oXTdIsl++4?=
 =?us-ascii?Q?bi9GmpdcnV3AAIBSWd44oBjhba7iF7fxZ4CJDeEa+qWtoK8HydnFOXI7ms/f?=
 =?us-ascii?Q?UE2ngVnFFYROXZ0bXvkQMNqhGlnasvk2wp+NyP5vs8m/ZrjjYG1tAx0FfIrq?=
 =?us-ascii?Q?oP1DllCDAISxDGHg8tCrLl/i/82JajwgIH5JcVjD8nOUjlfoYTTlt7dkyEx+?=
 =?us-ascii?Q?5r4WKecl5OWQ0mro9BESLfVx0hM9YwRILySa5EG6FPyuVsJrc6bMZRX7G1xf?=
 =?us-ascii?Q?y+jcWk6B8IvrNS5jyzw1wS5cawyrZ1Kl0Jwrl0bChBacRvPtxuhRF0CGqeXZ?=
 =?us-ascii?Q?ibS9x4o2WrK/wNdOHKLukGgQB6mBFI1dDReWHlZgSUit3e826FMCeT6txVvg?=
 =?us-ascii?Q?62g3oSnbfBEwSkb8RSQeWJu71jXrDfAajQ5x3L7d9io37Wyr4zzrWDHYV9ey?=
 =?us-ascii?Q?qqp3MH0yYbofSUD/e+V3hyhA3e+vzIy+l3xc8KZhxOdwP5pscOrb0gpI0tCg?=
 =?us-ascii?Q?eteVzhZQ7TbpCjtpu9OlFETLg03P0gOY/fJLaFLzVGN7GAtWyZZ12catEyEB?=
 =?us-ascii?Q?CN8RfsuazLjTxLS1tdTu/5younxvIF8nbfxD81zS1yMQ7GLH7bA4Mhz/iZUB?=
 =?us-ascii?Q?RrRGdRkoOkf/0zDsQA0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732366ca-d5ce-4c01-0862-08de28c7ab6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 06:31:57.2242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+tKMzz67tBjwjPapLo+NrF8CbLWu6ETn88FqBEyL4uJthVzwA6ayt8egeo88cSQKBobq1hVZ87mT+64NII6PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

Hi Kamil & Sebinraj

https://patchwork.freedesktop.org/patch/689709/?series=3D156767&rev=3D5

[i-g-t,v5] tools/intel_gpu_frequency: Allow regular users to use get operat=
ion

seems to address a similar goal. Do you think it makes sense to combine the=
se two series into one?

Thanks
Xin

> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Sent: Thursday, November 20, 2025 02:32
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Sebinraj, S
> <s.sebinraj@intel.com>; Wang, X <x.wang@intel.com>
> Subject: [PATCH i-g-t v1 0/2] intel_gpu_frequency: Allow printing frequen=
cies
> by regular user
>=20
> Currently printing current frequencies with this tool without sudo nor ro=
ot
> rights ends with an assert and a FAIL, like in any igt test:
>=20
> $ build/tools/intel_gpu_frequency
> (intel_gpu_frequency:3142) intel_chipset-CRITICAL: Test assertion failure
> function intel_get_drm_devid, file ../lib/intel_chipset.c:145:
> (intel_gpu_frequency:3142) intel_chipset-CRITICAL: Failed assertion:
> is_intel_device(fd)
> (intel_gpu_frequency:3142) intel_chipset-CRITICAL: Last errno: 9, Bad fil=
e
> descriptor Stack trace:
>   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
>   #1 ../lib/intel_chipset.c:155 intel_get_drm_devid()
>   #2 ../tools/intel_gpu_frequency.c:312 main()
>   #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>   #5 [_start+0x25]
> Test (null) failed.
> **** DEBUG ****
> [cut]
> (intel_gpu_frequency:3142) igt_core-INFO:   #5 [_start+0x25]
> ****  END  ****
> FAIL (-1.000s)
>=20
> This is a tool, not a test, so change it and allow a normal user printing=
 current
> Intel GPU frequencies. While at it, fix also printing program name and pr=
int
> only program name, without a full path.
>=20
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
>=20
> Kamil Konieczny (2):
>   tools/intel_gpu_frequency: print short program name
>   tools/intel_gpu_frequency: Allow printing by regular user
>=20
>  tools/intel_gpu_frequency.c | 141 +++++++++++++++++++++++++++++++++---
>  1 file changed, 129 insertions(+), 12 deletions(-)
>=20
> --
> 2.52.0

