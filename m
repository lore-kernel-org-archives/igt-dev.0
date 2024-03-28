Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA1CD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 18:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C31112536;
	Thu, 28 Mar 2024 18:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkiD+nhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659A112536
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711649832; x=1743185832;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AiYdqVJ2S9TU0ta9Nw7ANh1HyTSG1pQbxhtKewjBWt0=;
 b=LkiD+nhE5e4YsgBB+COKtePBijEUB2Z4Q6cLh6G5avaKWcQtRXpqsiPc
 IsrHn505E3SqQi5Y2VwGsAJXDt3v0saX1iur4aZw5j3x3+hcwVkICgdyG
 phsQBT9KW8AWi7gytBR+kujefSsRLAJFABnNAnF4gRt4PxtK2nHh199hC
 qwo7OenXEX1NdVUEv8OAPBq9rZkGCMbZB2afJhrJ2W6BCYk1IhrPulint
 rXTsStCXZUrNv0VoAriCduU7DWMIf4EUn62/m8b/Dp/8WouqpGruaeb5v
 GYG1kdNeFRV7fNrhyZIKj290XcSwR1Wb9WlEx26EgqoJv5yHN0l3SpMox A==;
X-CSE-ConnectionGUID: kDv1tXnlSKyzVrO87+s0eg==
X-CSE-MsgGUID: eaG5dbo2RVGrOhpomK878g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17376950"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17376950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47918276"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 11:17:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 11:17:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 11:17:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 11:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECzYDCy9nkc2EjroZ1VlzMD0uBFJUZXnl2qFfqsYlHnvlGWPEK2Cj3MX3yuPA+AKlROmZi/3TdWNaeDcLTGNc+ZEIb+zt3/4+mCSNXn6T1FAJpD4ttkDu2Hjn5Oqal/Hlohja2IzTvpaqCVj5GdXXiIUXrgdBtVRhkhlhOrEubzXg8yU87py3vJDjjp5GrAeKaZmX3aPce6ZR9VnSwxLAff0ju4i2KcCFxdhWmrHAh9uQxtGZDci74l4eHyn2+6O+2PMsfx/ebBb3DdXJvXtrSGFNlKxfzw75bEImTM+gVXcidrCXPzw3P3ygP9xqgR99GdmoIzEqPSE7//LePCIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m65DobryJ4D1r+WuC5mb+DSe2Wm7Q1b30rar2xIrdkc=;
 b=byp5BsHJcla679wDTEVrU6zuMjQ6UdhuBEEaFTO67lOWmW17XjcJbyGOPITBjXVotr9Yz0pOfl8LVe25sT76gVPETViF5blLnGcw8QZPco4OdEWqVM04jN693IAY0nhIyD00N2Q4gaam4Px370GRO4LgLdx83Sar+PEIWhT8iwhOlHmWLxfoPg+5EelSkps9ASwO0fSR4caevYGNnbeqENjntvcxV9FJrcFFykdNt/GoHnIaGGpeaMr/NElWDzGyZCSrevUtglRIk5T/wKz3TGE75PYxYm8oLYnfMW5C7eK2vmuEOedAglKs3aHR3+HlD5FScYqmZWcCs21ZCDPFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 18:17:08 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::d48a:df79:97ac:9630]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::d48a:df79:97ac:9630%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 18:17:08 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/xe: Update __xe_exec_queue_create()
Thread-Topic: [PATCH i-g-t] lib/xe: Update __xe_exec_queue_create()
Thread-Index: AQHagL2EfjlDuwMsv0iQEYdXbM6vB7FNdnTA
Date: Thu, 28 Mar 2024 18:17:08 +0000
Message-ID: <PH0PR11MB5782C42462A6C5583DA88EB5823B2@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20240328031021.8356-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240328031021.8356-1-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|BY1PR11MB8078:EE_
x-ms-office365-filtering-correlation-id: e45d3576-adc6-49e1-8c64-08dc4f534789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KcGidUoxzMX55SQiBf2fb7FRQX2jry93kzVlePKGQ1Obf7skBZIkfSnYGJxvSECgSd7T0SSfJzV2EVepOtGgWdCbg7u0sOR/IlQvxbu0qsu+8UcsSNXUTHJXxsaHSmFjvaWCSHxWt3ivJkH2/FDLDfpPEIbqsHNsJMU0QwJ9UNw4BgtLygnKv5Qqy9kvuHHEj5M0XYeichuXKK8aB7IWhL/5u+W4XY8BJPYXTNh+B6sX6VGSmHrcH/pDSSaNUWbtRYuO8tLUUxuAT806JaGfjTQ7PsiHIsWej58iWnYOPWdWqQWDOVgIlW1RkbzL5ERjIHko+fWpegfs1RT6ZKXtZu7u+mdvSqTMRMbrHTFwJ45Tyco0X7W0B8dXVtZgei7knFC96vcqLK4lqkKWLZtL67+8sr3vIelatc/fw9F3ylE8r/T0jsm5bL7rU7NJNrtlxn3pbPgsNpXw9EZMPPGtYGQs3X6Enim8hIXCq2epcpmPwY3P1BcDT7CIU8gVZailx5A0pOE6r1oAMnYdcTn7Pzde1CrUI0sO8Glw1yaAg6fJNUCts2I/hzDWkMM+MN3SZl926H2XzmSsL4UiXRmBkB45qih+05zC+EsfZ1YqgjymCuzzJft4lx2NEwRrzOg4HkNT/Q1Y06ZAJKFZ1sVqK2H+GtfWK7SjtCu2BHCFyudmLvw2l8Ib1Nabdtw58nHiPCRO9oJi8QNtC3DVQHbY1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nCgmF3oG+IhdZx1XIEw04EGbtOzuaomQHSupKwX5gOfac40tdqx7YduJ9LaM?=
 =?us-ascii?Q?/RWTJm84/N7+Regb3ioAkMJeoh4kvENZXsj0EPlnKvgaLkbAe1br64E0YYJ1?=
 =?us-ascii?Q?/bOOzqk8Lus5HdmdNLpRCPdrl4CVSAob42d0xYpVk9NglsYwxCIsWvHwoWuT?=
 =?us-ascii?Q?Cs16JCE3KfQfXkJaYYlxACQ9xv+y2wgNucsv4sARdVCA2LJVc84W92sEt3wo?=
 =?us-ascii?Q?rbOqPAP2ZbF15S9zab70tU2gafjQsiZXAwoO5DgBfIKkAvPHvmX0Q0DoALR8?=
 =?us-ascii?Q?Nvvebjar3mVQtNxNRy4FJz2KOJHnEodV75pB/nbweL+q2tJH4xcrDPA7d06J?=
 =?us-ascii?Q?2ymmip/h0u77HRvs+IhxZk/tdQkFMJuvp8p+0GZla38FKXA/TiXlr3QTLAFh?=
 =?us-ascii?Q?uAHsTnZclZebtqdbr/vVYJZBJUK9o7GJmQrHWtKDRVZrU89pq1xZ6X+8uc29?=
 =?us-ascii?Q?5Ppy5O4tEoceA0U/OqDamuvYQl/u4I33E3GCdoXE4EE3Iw4eGQS47bSLWGpb?=
 =?us-ascii?Q?zRI64MFgT5JFE+EK80/X9F/WfiEy6r5CdfPYdJ850DcBLBgmTwM8350gmu4e?=
 =?us-ascii?Q?e+lS59MD5kUJxy+0xPeSGK0E0OY/GXLf8p5cl/de2DPkhEFqyW7ggxUKtxfG?=
 =?us-ascii?Q?zJXj1guDEqDcqjH+ReNZi1elRKksNLyXsUEAY1BOhmTTcFlgrvuWOsryLovL?=
 =?us-ascii?Q?AvKJlP7mYkDp+kGkBC4B55jMeY1iZ9CoyT9hzOAfRiH1dfMynP9OVpRxRxJg?=
 =?us-ascii?Q?Q09/d/bqxKIlCNIAcoZ2cLJX1X42SMFaUU6xxjmrGNI2iAEB1JqM+pWkXfha?=
 =?us-ascii?Q?xqM0tggV/dgibNfs25/PEIWyAJjfLeLpQvXz2XEcpWbSfFFbKpNEUK/2Rhdf?=
 =?us-ascii?Q?cja5WI/I8ASlDGTykezr3mY1WzqTJ6Mn9SK6VGxvJtV4AAQtKm776FTlrwcv?=
 =?us-ascii?Q?JFQFVlWVeq90JfwfcknoiSo7yW+LEe+CE+0XXumullfgPOlLGjVXYAQIJunZ?=
 =?us-ascii?Q?DlbA+yLM0ESsK6e6l+0gYSqmtVWIVJJNz/8O7RXWpSe2lkRA0P4JiErR46E3?=
 =?us-ascii?Q?kRPI54oJM6Jx49S7AIUHzor5LyNZhRsvDQ9O0J0W50gcFpaENYyY1xP0SaJM?=
 =?us-ascii?Q?XOq2yrXyVHTp5EiaAroYzcAE25afoLf5I7Jowc9iZkah7Eo2o7GajWBc2wl+?=
 =?us-ascii?Q?bKp6F/WyRMXx1trgvwfBbigRE5L+EnqPAjfv68i61PfiloPpZdup/4z04QNd?=
 =?us-ascii?Q?SBDszbnetrjDNXfSPTk+Bs1aE9oNYa8nK86ZgCXZlYZ2/LfyB1kutDLQpaa/?=
 =?us-ascii?Q?ylO9DDW//6TXtog3uHSOu+PrCp/lQWJu8wEPfkyhYrYhl6YvY17+vwiKhWeD?=
 =?us-ascii?Q?qW9VFPa9E0uMyFQ0adYU/BBGuwnWO73SL80zT58oFJuP/NFPU/R7T0vb676X?=
 =?us-ascii?Q?jcIlViBZwhZqMgWXCK3yXBbql5vTlXQCLIhWAN0EFw2toM4fC32CfHExeSbW?=
 =?us-ascii?Q?2BRrYiz9k0BIG09ERTa2GkXNebM3SSQUM+jsFcgQBmmCOIccEQARYuTI5IPq?=
 =?us-ascii?Q?399ReHzo2wMX6t2qDLMMrtswMNrfaKRThHLgBffM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45d3576-adc6-49e1-8c64-08dc4f534789
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 18:17:08.0788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9bt6iIRX7fL0ir1Pf2HQrIo6YEsQIlVOIp8lXFa2FjPgGs7xH1MH/aBMjqOHoPiorLapFA25RHQBVJzjkMW66zUD2mR/U+TY4F7DMwKZG08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: Wednesday, March 27, 2024 8:10 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] lib/xe: Update __xe_exec_queue_create()
>=20
> Add ability to specify width and num_placement in
> __xe_exec_queue_create() call. Use __xe_exec_queue_create() instead of
> ioctl calls in the tests.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> ---
>  lib/xe/xe_ioctl.c                    |  8 ++---
>  lib/xe/xe_ioctl.h                    |  2 +-
>  tests/intel/xe_compute.c             |  2 +-
>  tests/intel/xe_create.c              |  4 +--
>  tests/intel/xe_exec_balancer.c       | 45 ++++++++--------------------
>  tests/intel/xe_exec_queue_property.c | 35 +++++++---------------
>  tests/intel/xe_exec_reset.c          | 25 ++++------------
>  tests/intel/xe_exec_threads.c        | 14 +++------
>  tests/intel/xe_spin_batch.c          | 12 ++------
>  9 files changed, 43 insertions(+), 104 deletions(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index da2a7af51..934c8=
77eb
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -332,15 +332,15 @@ uint32_t xe_bind_exec_queue_create(int fd,
> uint32_t vm, uint64_t ext)
>  	return create.exec_queue_id;
>  }
>=20
> -int __xe_exec_queue_create(int fd, uint32_t vm,
> +int __xe_exec_queue_create(int fd, uint32_t vm, uint16_t width,
> +uint16_t num_placements,
>  			   struct drm_xe_engine_class_instance *instance,
>  			   uint64_t ext, uint32_t *exec_queue_id)  {
>  	struct drm_xe_exec_queue_create create =3D {
>  		.extensions =3D ext,
>  		.vm_id =3D vm,
> -		.width =3D 1,
> -		.num_placements =3D 1,
> +		.width =3D width,
> +		.num_placements =3D num_placements,
>  		.instances =3D to_user_pointer(instance),
>  	};
>  	int err;
> @@ -363,7 +363,7 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,  {
>  	uint32_t exec_queue_id;
>=20
> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, instance, ext,
> &exec_queue_id), 0);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext,
> +&exec_queue_id), 0);
>=20
>  	return exec_queue_id;
>  }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index 2b30f1d98..4d084=
02e0
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -70,7 +70,7 @@ uint32_t __xe_bo_create_caching(int fd, uint32_t vm,
> uint64_t size, uint32_t pla  uint32_t xe_bo_create_caching(int fd, uint32=
_t vm,
> uint64_t size, uint32_t placement,
>  			      uint32_t flags, uint16_t cpu_caching);  uint16_t
> __xe_default_cpu_caching(int fd, uint32_t placement, uint32_t flags); -in=
t
> __xe_exec_queue_create(int fd, uint32_t vm,
> +int __xe_exec_queue_create(int fd, uint32_t vm, uint16_t width,
> +uint16_t num_placements,
>  			   struct drm_xe_engine_class_instance *instance,
>  			   uint64_t ext, uint32_t *exec_queue_id);  uint32_t
> xe_exec_queue_create(int fd, uint32_t vm, diff --git
> a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c index
> e773e798a..75378595e 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -86,7 +86,7 @@ test_ccs_mode(int num_gt)
>  			hwe->gt_id =3D gt;
>  			hwe->engine_class =3D
> DRM_XE_ENGINE_CLASS_COMPUTE;
>  			hwe->engine_instance =3D m;
> -			igt_assert_neq(__xe_exec_queue_create(fd, vm, hwe,
> 0, &q), 0);
> +			igt_assert_neq(__xe_exec_queue_create(fd, vm, 1, 1,
> hwe, 0, &q), 0);
>=20
>  			xe_vm_destroy(fd, vm);
>  			drm_close_driver(fd);
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> fd5d71d8a..6ea5ad38b 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -206,7 +206,7 @@ static void create_execqueues(int fd, enum
> exec_queue_destroy ed,
>  		for (i =3D 0; i < exec_queues_per_process; i++) {
>  			idx =3D rand() % num_engines;
>  			engine =3D xe_engine(fd, idx);
> -			err =3D __xe_exec_queue_create(fd, vm, &engine-
> >instance,
> +			err =3D __xe_exec_queue_create(fd, vm, 1, 1, &engine-
> >instance,
>  						     0, &exec_queue);
>  			igt_debug("[%2d] Create exec_queue: err=3D%d,
> exec_queue=3D%u [idx =3D %d]\n",
>  				  n, err, exec_queue, i);
> @@ -349,7 +349,7 @@ static void create_contexts(int fd)
>  	xe_vm_bind_sync(fd, vm, bo, 0, bo_addr, bo_size);
>=20
>  	for (i =3D 0; i < n; i++) {
> -		int err =3D __xe_exec_queue_create(fd, vm, &xe_engine(fd, 0)-
> >instance, 0,
> +		int err =3D __xe_exec_queue_create(fd, vm, 1, 1, &xe_engine(fd,
> +0)->instance, 0,
>  						 &exec_queues[i]);
>  		igt_assert_f(!err, "Failed to create exec queue (%d), iteration:
> %d\n", err,
>  			     i + 1);
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balance=
r.c
> index 6e467e34a..8ce8cbf7f 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -75,16 +75,8 @@ static void test_all_active(int fd, int gt, int class)
>  	data =3D xe_bo_map(fd, bo, bo_size);
>=20
>  	for (i =3D 0; i < num_placements; i++) {
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D 1,
> -			.num_placements =3D num_placements,
> -			.instances =3D to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd,
> DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] =3D create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
> num_placements,
> +						     eci, 0, &exec_queues[i]),
> 0);
>  		syncobjs[i] =3D syncobj_create(fd, 0);
>  	};
>=20
> @@ -231,16 +223,10 @@ test_exec(int fd, int gt, int class, int n_exec_que=
ues,
> int n_execs,
>  	}
>=20
>  	for (i =3D 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D flags & PARALLEL ? num_placements : 1,
> -			.num_placements =3D flags & PARALLEL ? 1 :
> num_placements,
> -			.instances =3D to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd,
> DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] =3D create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ?
> num_placements : 1,
> +						     flags & PARALLEL ? 1 :
> num_placements,
> +						     eci, 0, &exec_queues[i]),
> 0);
>  		syncobjs[i] =3D syncobj_create(fd, 0);
>  	};
>  	exec.num_batch_buffer =3D flags & PARALLEL ? num_placements : 1;
> @@ -458,19 +444,12 @@ test_cm(int fd, int gt, int class, int n_exec_queue=
s,
> int n_execs,
>  	}
>  	memset(data, 0, bo_size);
>=20
> -	for (i =3D 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D flags & PARALLEL ? num_placements : 1,
> -			.num_placements =3D flags & PARALLEL ? 1 :
> num_placements,
> -			.instances =3D to_user_pointer(eci),
> -			.extensions =3D 0,
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd,
> DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] =3D create.exec_queue_id;
> -	}
> +	for (i =3D 0; i < n_exec_queues; i++)
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ?
> num_placements : 1,
> +						     flags & PARALLEL ? 1 :
> num_placements,
> +						     eci, 0, &exec_queues[i]),
> 0);
> +
>  	exec.num_batch_buffer =3D flags & PARALLEL ? num_placements : 1;
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> diff --git a/tests/intel/xe_exec_queue_property.c
> b/tests/intel/xe_exec_queue_property.c
> index 51ecd725d..57baae305 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -56,21 +56,11 @@ static void test_set_property(int xe, int
> property_name,
>  		.property =3D property_name,
>  		.value =3D property_value,
>  	};
> +	uint32_t exec_queue_id;
>=20
> -	struct drm_xe_exec_queue_create create =3D {
> -		.extensions =3D to_user_pointer(&ext),
> -		.width =3D 1,
> -		.num_placements =3D 1,
> -		.instances =3D to_user_pointer(&instance),
> -		.vm_id =3D xe_vm_create(xe, 0, 0),
> -	};
> -	int ret =3D 0;
> -
> -	if (igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
> -		ret =3D -errno;
> -		errno =3D 0;
> -	}
> -	igt_assert_eq(ret, err_val);
> +	igt_assert_eq(__xe_exec_queue_create(xe, xe_vm_create(xe, 0, 0), 1,
> 1,
> +					     &instance, to_user_pointer(&ext),
> +					     &exec_queue_id), err_val);
>  }
>=20
>  static void test_property_min_max(int xe, int engine, const char **prope=
rty)
> @@ -183,27 +173,24 @@ static void invalid_property(int xe)
>  		.property =3D valid_property,
>  		.value =3D 1,
>  	};
> +	uint32_t exec_queue_id, vm =3D xe_vm_create(xe, 0, 0);
>=20
> -	struct drm_xe_exec_queue_create create =3D {
> -		.extensions =3D to_user_pointer(&ext),
> -		.width =3D 1,
> -		.num_placements =3D 1,
> -		.instances =3D to_user_pointer(&instance),
> -		.vm_id =3D xe_vm_create(xe, 0, 0),
> -	};
>  	/* Correct value should pass */
> -	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> &create), 0);
> +	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +					     to_user_pointer(&ext),
> &exec_queue_id), 0);
>=20
>  	/* This will fail as soon as a new property is introduced. It is
>  	 * expected and the test will have to be updated. */
>  	for (int i =3D 2; i < 16; i++ ) {
>  		ext.property =3D i;
> -		do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> &create, EINVAL);
> +		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1,
> &instance,
> +						     to_user_pointer(&ext),
> &exec_queue_id), -EINVAL);
>  	}
>=20
>  	/* Correct value should still pass */
>  	ext.property =3D valid_property;
> -	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> &create), 0);
> +	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +					     to_user_pointer(&ext),
> &exec_queue_id), 0);
>  }
>=20
>  igt_main
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> cc10900d9..8d731e689 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -177,16 +177,10 @@ test_balancer(int fd, int gt, int class, int
> n_exec_queues, int n_execs,
>  	data =3D xe_bo_map(fd, bo, bo_size);
>=20
>  	for (i =3D 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D flags & PARALLEL ? num_placements : 1,
> -			.num_placements =3D flags & PARALLEL ? 1 :
> num_placements,
> -			.instances =3D to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd,
> DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] =3D create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ?
> num_placements : 1,
> +						     flags & PARALLEL ? 1 :
> num_placements,
> +						     eci, 0, &exec_queues[i]),
> 0);
>  		syncobjs[i] =3D syncobj_create(fd, 0);
>  	};
>  	exec.num_batch_buffer =3D flags & PARALLEL ? num_placements : 1;
> @@ -621,25 +615,18 @@ static void submit_jobs(struct gt_thread_data *t)
>  			.engine_instance =3D 0,
>  			.gt_id =3D 0,
>  		};
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D 1,
> -			.num_placements =3D 1,
> -			.instances =3D to_user_pointer(&instance),
> -		};
>  		struct drm_xe_exec exec;
>  		int ret;
>=20
>  		/* GuC IDs can get exhausted */
> -		ret =3D igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> &create);
> +		ret =3D __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0,
> +&exec.exec_queue_id);
>  		if (ret)
>  			continue;
>=20
> -		exec.exec_queue_id =3D create.exec_queue_id;
>  		exec.address =3D addr;
>  		exec.num_batch_buffer =3D 1;
>  		xe_exec(fd, &exec);
> -		xe_exec_queue_destroy(fd, create.exec_queue_id);
> +		xe_exec_queue_destroy(fd, exec.exec_queue_id);
>  	}
>=20
>  	munmap(data, bo_size);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c index
> 05ea1d35a..d6d39814e 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -114,16 +114,10 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t
> addr, uint64_t userptr,
>=20
>  	memset(sync_all, 0, sizeof(sync_all));
>  	for (i =3D 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D flags & PARALLEL ? num_placements : 1,
> -			.num_placements =3D flags & PARALLEL ? 1 :
> num_placements,
> -			.instances =3D to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd,
> DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] =3D create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ?
> num_placements : 1,
> +						     flags & PARALLEL ? 1 :
> num_placements,
> +						     eci, 0, &exec_queues[i]),
> 0);
>  		syncobjs[i] =3D syncobj_create(fd, 0);
>  		sync_all[i].type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
>  		sync_all[i].handle =3D syncobjs[i];
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c in=
dex
> da8fd0a30..68cbd1bd1 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -114,16 +114,8 @@ static void spin_all(int fd, int gt, int class)
>  	vm =3D xe_vm_create(fd, 0, 0);
>=20
>  	for (i =3D 0; i < num_placements; i++) {
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D 1,
> -			.num_placements =3D num_placements,
> -			.instances =3D to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd,
> DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] =3D create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
> num_placements,
> +						     eci, 0, &exec_queues[i]),
> 0);
>  		spin[i] =3D igt_spin_new(fd, .ahnd =3D ahnd, .engine =3D
> exec_queues[i], .vm =3D vm);
>  	}
>=20
> --
> 2.43.0

