Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1894C47422
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 08:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A184910F045;
	Fri, 26 Jan 2024 08:02:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF26010F045
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706256126; x=1737792126;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BYUWKS2/CtaR/oUKYswfINeJNfE5myGwiHQwO9ct3CI=;
 b=HG6XpdqD0vqNdlWNuweFh4YwOgrByOfpvM9AmMbMbYmQHkr/RcgH6Yud
 qZ3KDjorQPsONI+IDGchuLiB6jOLIwxPgPscokS7or2I1ijkh4Qr9bTvM
 PJ9MK1JcS6Z4+RLCOFkTXph7ENo8OPojSGqp4OLu3ykyOem/kTMyR2fcT
 8juvq3YT7O5ws3NjW9IG10M6nSDdah7limax0eJSPWwad9U7UR4NmVNy1
 ZdnOsLVGZ18WtaJAc6T3uItlWsyV38D4/O+1AFBlKHANypkOFZjCeF8j3
 CxjABnfs9fSCW46s/ETzsaHQIBtY1KFLbsKVwSUlGm2nJBVhN7REvQiNB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466690286"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="466690286"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 00:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906243527"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="906243527"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 00:02:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 00:02:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 00:02:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 00:02:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 00:02:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJoLvVHkRETct+t0hWk7xhSLjMw8waBRS8Y6j8X0FnkmVGiPy6PjjsCrvjbfdNaKCtxXx57y+sfAg2JD4OXg4zhm5Va3rstMLwe+SiSFq9WvvwJ0ajuKACSXwNKH7RMe3H23lNAxAZJ6aIuzkwNezjg+TP9xugrHDxN0G1KMS2oH+lHcY2loFTcEdQS8+W90B+dgvuWV6/KtKvfUIh5r6MNxRU5rOhj9xJTLS/RfaOf3KK4G8JDLgG0QUbiIOGHvbZXHJ4kHixCFT968fyYeLyTwHNB7rkHQhv1PXI53aeh/MPsxCQbPf6WQ49PhyAVWHY7jkcXfXLa0IotsNx4jNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHTLa3YOxgPlDyGcBqQkbiLgxVbObjlUOd0P9L8kEUU=;
 b=E1u5qpqG0Ysj+ITkcFjk785q+UJG7FGAELh6CE7WciuuGaqqm++hSJRNQkWTlN763quCwbN1IBYKdblNFrUALaGlpn0Jofrin6TMomac1486ZjVCqYeQHmYxW1cnO73ERsIllapIqRv+qz5XEq6EaN/7lkHvg3pFVDi+AMLSqhudO5jaTcQB7mPpOGQ0vq1oBrBTb5aN0Psjn8/Wz6wh1AvYFafkRC7ZbAATRnJkR87l4sR6duNz/3QNWU2+za3eqaa8ZmF4WD7NNH+Zpi1IdexBtrZtPYiSkCl1ZFFG2cC8B9FKCLDxCgDnErcFqr/xwZNvjKfXuLvJvsa8mfFVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Fri, 26 Jan
 2024 08:02:02 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 08:02:02 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3 6/8] lib/intel_multigpu: Add
 xe_multi_fork_foreach_gpu
Thread-Topic: [PATCH i-g-t v3 6/8] lib/intel_multigpu: Add
 xe_multi_fork_foreach_gpu
Thread-Index: AQHaT72RQyhIjth5A02pLJKhdQFmb7Drurow
Date: Fri, 26 Jan 2024 08:02:02 +0000
Message-ID: <DS0PR11MB72645D88F73EC29CDA1A4B68D9792@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
 <20240125183632.50422-7-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240125183632.50422-7-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CH0PR11MB8168:EE_
x-ms-office365-filtering-correlation-id: 13b3fc05-d2e6-4af9-cc9e-08dc1e45144e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7c/iaMs4zlWifnmZHNWK8pHlbvB3AoEFt3GVuoAAkDNEOj+nID3CD8dJKD0S0IgKa6f64/Up9vbQZrN3HKCFDmxBKfSK5Gbxt5Ej7kV8xJizIS4uX6omIG/lc6vguOKxftJ4H+jb0UMpcBjYKlY6VYc91mLzRw/Q7U2UvQCZ4qVZ0te0yY6wKHDd4dqMXn0uSwlLTfEdGWuzwWqVsRrgsdhuajrZhJqk0ZxX5Q802FItPGovF7AaXDOpzJ/C/ZL17X8/af88TswLqHUf62l7b9ZXbaaBzD66hOfAsBxi3M2ZALOLbbmfNwcFaLEJihGZSsglPFxoHjLVpG56rS8BbJ7MwF4EBzoD5Mexlnk806K+Qu8alAd6CjkeY9rayenus/KjkX9Ixg6zrcdD8trkDBTNF8+JWoHJgH3EI2e4J/LF40l/xZlSeLVF6hT1HEl8/EWDHwCbb1Xs8LyLE1mOqBnJFJGfSYQVRDxGxC1SadE2kHHxZaLySOl1Nbb9bw4Vze1gWyFZiPda5BR1jTjy876LEhOVoA6jbrNwlahi+Cg4G6TKtYQaimuEXC7sqGCjjSb8LeGIYyS0Re9Q9dMj5PDSeHmsc2JwXMc8KzgHauhiy0i7HKk4JFx8rGAW+SFy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(7696005)(53546011)(122000001)(86362001)(76116006)(41300700001)(83380400001)(316002)(64756008)(33656002)(26005)(110136005)(66946007)(478600001)(71200400001)(66476007)(66446008)(66556008)(38070700009)(5660300002)(38100700002)(8936002)(2906002)(66574015)(82960400001)(8676002)(52536014)(6506007)(55016003)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?IR/3f8SJTK53h4RnyoVuJL9O0EIovrUhJQtuExZLwvRn3SkhxSZloQdlhJ?=
 =?iso-8859-2?Q?a+mSwi0qfzhImiGoXgg1UGKhlAR3TZf86u1M2KRAZpXyrI7FTtoSxTJp+K?=
 =?iso-8859-2?Q?uy3ZXdPSIFbmanjfghZx3a1zt7G0Ybh0CkGDAsOxTr2Xpxr3B7b7+su60Y?=
 =?iso-8859-2?Q?SFFUO+qKFuG+IQqqMer60r2ExpHM1stHKdmZ4iLzHZcCAbsxsIsHlf3H9l?=
 =?iso-8859-2?Q?LqzX1ImET6IkuyEJgAimkzGw6hAG04xoSEZBthXP7rfwLZD+fMFA8MCH7s?=
 =?iso-8859-2?Q?303vQkEnhzqoTUu4CDT4gAUmX512hT9SbhYWAHWaXfmvwoD1ubATvqimvR?=
 =?iso-8859-2?Q?1wlABvIQjrHUJ5CVKfh27l/AKaqKAi0bMurn/9gWDlGmV6jsuDt9cxWPcZ?=
 =?iso-8859-2?Q?jKRjsd9d9f9ovpXkd/txN4Pu4jsE0u04w+JfrNFtICHl2de3pJL84QLfeU?=
 =?iso-8859-2?Q?elO/zMRJYaAt9eBMr+2v8kUYTr930+xdsTxsJgl7lcOkcKla6alOd/AMfU?=
 =?iso-8859-2?Q?Hs9K4Ahc6N0m/QP8Sj0f3YZDl4xFKMc40hwd8cC04CYsL4Piw3q7ok47iO?=
 =?iso-8859-2?Q?ikJcTMHXn6/kkQd1nkWROspxdQ9M+ncRyPUzG3btHXZy0WmIVtta7FN8zM?=
 =?iso-8859-2?Q?AfnJDyuAw4KfPsoUUUFYdgwGtDM08fR+DxYT8c8nTEqMCK2SHVLds46h85?=
 =?iso-8859-2?Q?pgt+YCdCA8AP56wosncJA3ey7cTdG4p8N5UwcYAIpyJwhgd9F0Cn8LjRJL?=
 =?iso-8859-2?Q?TmrzTzKo0i0S3epuXfELRH5A8KDFzVzhgUdZufD4oMwnrKuiyAYhdURQNA?=
 =?iso-8859-2?Q?AH27q5pDsrlIFJe5/Q3Zr8Suc8lhiCHICHh113Sy1An9zdRcwegRma3PSU?=
 =?iso-8859-2?Q?p7o0czT1y2w4eWyRn5PM4WRbUcz1ONekDJdOYa0TNNLKudJvboQfRJQtG4?=
 =?iso-8859-2?Q?SCh8HsujITIFDfNJ1L3yk8YMmjruf7YKgjL6y3ui1ZqLkCYq8rdrV/q9CR?=
 =?iso-8859-2?Q?fLgiGvnatHGW+xLfA4NlsbyLewMnAGA5lV/IvIpp5TFMHnxmosh022+Cwb?=
 =?iso-8859-2?Q?EkaQQVq4FXAchmvCJzIMHpmtQd7Vy0YeGcJRKyWyz/MGv7URThZKzRhukS?=
 =?iso-8859-2?Q?3voM0K2dc8kH9JVoWH4tiftXwyYIriMb1x5sRaC6ZXOpKSwamAQFZvs0tC?=
 =?iso-8859-2?Q?6vd3BAGmKkZrLUKl6mAjd04lm+8a86b9uUDdMtWCRGRbqHxlFe/ath5bE9?=
 =?iso-8859-2?Q?9MxoyjlOMvAOZuxdVtrgP54N65cLDlS0PvmQBu7rlEjv3rEVTpuUJtHoqF?=
 =?iso-8859-2?Q?SITVAo45+95Fq5FUIlH53Yedxget5gwHvZDewnZvuUU9OrPgvmUdbAkjJP?=
 =?iso-8859-2?Q?Uem9aStFE0PbmuLfp4BjJxPRut5up4Y2QMyBptD2nOBitzwNg5LrRTwcrw?=
 =?iso-8859-2?Q?48DBv2B2OZAsVD2yMoy0Lex0r3uj2Aljiq8rAo9iPz7MgXv82msHMVirWz?=
 =?iso-8859-2?Q?0c9OqUj9QX1ptYYXpoQl9RcZkOGQxE8W8HvPK+GOVYsCKlsWq2zIDQcbyC?=
 =?iso-8859-2?Q?6QNqFCYd+FdRibWLLeYY62GumeSEPahQkPbIXuIZIZtNAMr0ZH26XPwStQ?=
 =?iso-8859-2?Q?k7OXL2eXiu8akSvhEE/85vV8t7r/agfmVkGPUg5Kq5/CQ7jglJl0NFqQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b3fc05-d2e6-4af9-cc9e-08dc1e45144e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 08:02:02.1685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kT07zcAX352UCdEKmRMBocZ0YxEfhLi2XzLUYmlUkwPVupoMCmXlMcI+3cNlbaGevSVmaM+74jvgAkldwAEQQCHcGOCBO3lCj5Yegxhf5Lmyvs9eUGfWqU0vLE7d7fbl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
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

Hi Kamil,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Thursday, January 25, 2024 7:36 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t v3 6/8] lib/intel_multigpu: Add
> xe_multi_fork_foreach_gpu
>=20
> Create macro for testing Xe driver in multigpu scenarios with the help of=
 few
> new multigpu functions. Also while at this, add documentation for public
> functions and use new helper in existing multi-gpu macro.
>=20
> v2: corrected description (Kamil), rebased on corrected patches
>   after Dominik review
> v3: corrected descritions, renamed function to print_gpus

Nitpick: typo in "descriptions"

>   and did small refactoring (Kamil)
>   fixed typo in function name (Dominik)
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_multigpu.c | 106
> +++++++++++++++++++++++++++++++++++++++++--
>  lib/intel_multigpu.h |  12 ++++-
>  2 files changed, 112 insertions(+), 6 deletions(-)
>=20
> diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c index
> 0e76d8aa3..689c4f10c 100644
> --- a/lib/intel_multigpu.c
> +++ b/lib/intel_multigpu.c
> @@ -4,10 +4,19 @@
>   */
>=20
>  #include "drmtest.h"
> +#include "i915/gem.h"
>  #include "igt_core.h"
>  #include "igt_device_scan.h"
>  #include "intel_multigpu.h"
>=20
> +/**
> + * gem_multigpu_count_class:
> + * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function counts number of GPU cards with the help of opening all of t=
hem.
> + *
> + * Returns: number of GPUs cards found
> + */
>  int gem_multigpu_count_class(int class)  {
>  	int count =3D 0;
> @@ -18,7 +27,7 @@ int gem_multigpu_count_class(int class)
>  	return count;
>  }
>=20
> -void gem_require_multigpu(int count)
> +static void print_gpus(int count, int gpu_num)
>  {
>  	struct igt_devices_print_format fmt =3D {
>  		.type =3D IGT_PRINT_SIMPLE,
> @@ -26,14 +35,101 @@ void gem_require_multigpu(int count)
>  	};
>  	int devices;
>=20
> -	if (igt_device_filter_count() >=3D count)
> -		return;
> -
>  	igt_info("PCI devices available in the system:\n");
>=20
>  	igt_devices_scan(true);
>  	devices =3D igt_device_filter_pci();
>  	igt_devices_print(&fmt);
>=20
> -	igt_skip("Test requires at least %d GPUs, %d available.\n", count,
> devices);
> +	igt_info("Test requires at least %d GPUs, got %d, available %d\n",
> +count, gpu_num, devices); }
> +
> +/**
> + * gem_require_multigpu:
> + * @count: minimum number of GPUs required
> + *
> + * Function checks number of filtered GPU cards.
> + * On error skips and prints available GPUs found on PCI bus.
> + */
> +void gem_require_multigpu(int count)
> +{
> +	int gpu_count =3D igt_device_filter_count();
> +
> +	if (gpu_count >=3D count)
> +		return;
> +
> +	print_gpus(count, gpu_count);
> +	igt_skip_on(gpu_count < count);
> +}
> +
> +/**
> + * multigpu_acquire_view:
> + * @gpus_wanted: minimum number of GPUs required
> + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function prepares filtered view for GPU cards with given chipset.
> + * On error skips and prints available GPUs found on PCI bus.
> + * Returns: number of GPUs found
> + */
> +int multigpu_acquire_view(int gpus_wanted, unsigned int chipset) {
> +	int gpu_count =3D drm_prepare_filtered_multigpu(chipset);
> +
> +	igt_assert(gpus_wanted > 1);
> +	if (gpu_count >=3D gpus_wanted)
> +		return gpu_count;
> +
> +	print_gpus(gpus_wanted, gpu_count);
> +	igt_skip_on(gpu_count < gpus_wanted);
> +
> +	return gpu_count; /* non-reachable */
> +}
> +
> +/**
> + * multigpu_open_another:
> + * @idx: index of GPU card, starting from 0
> + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function opens GPU card with drm_open_driver_another(). For i915 it
> +checks
> + * if opened card is functional. Skips on errors.
> + *
> + * Returns: opened fd for @idx card
> + */
> +int multigpu_open_another(int idx, unsigned int chipset) {
> +	int fd;
> +
> +	igt_assert(idx >=3D 0);
> +	fd =3D drm_open_driver_another(idx, chipset);
> +
> +	if (chipset =3D=3D DRIVER_INTEL)
> +		igt_require_gem(fd);
> +
> +	return fd;
> +}
> +
> +/**
> + * multigpu_open_filtered_card:
> + * @idx: index of GPU card, starting from 0
> + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function opens GPU card prepared with filtered view. It also checks
> +if
> + * opened card agrees with desired chipset or checks if opened card is
> + * functional. Skips on errors.
> + *
> + * Returns: opened fd for @idx card
> + */
> +int multigpu_open_filtered_card(int idx, unsigned int chipset) {
> +	int fd;
> +
> +	igt_assert(idx >=3D 0);
> +	fd =3D drm_open_filtered_card(idx);
> +	igt_require(fd !=3D -1);
> +	if (chipset =3D=3D DRIVER_XE)
> +		igt_require_xe(fd);
> +	else if (chipset =3D=3D DRIVER_INTEL)
> +		igt_require_gem(fd);
> +
> +	return fd;
>  }
> diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h index
> 0ebc73e4a..97c9b1dd8 100644
> --- a/lib/intel_multigpu.h
> +++ b/lib/intel_multigpu.h
> @@ -12,6 +12,10 @@
>  void gem_require_multigpu(int count);
>  int gem_multigpu_count_class(int class);
>=20
> +int multigpu_acquire_view(int min_gpus_wanted, unsigned int chipset);
> +int multigpu_open_another(int idx, unsigned int chipset); int
> +multigpu_open_filtered_card(int idx, unsigned int chipset);
> +
>  #define igt_foreach_gpu(fd__, id__) \
>  	for (int igt_unique(i) =3D 0, fd__; \
>  		(fd__ =3D __drm_open_driver_another(igt_unique(i)++, id__)) >=3D
> 0; \ @@ -19,8 +23,14 @@ int gem_multigpu_count_class(int class);
>=20
>  #define igt_multi_fork_foreach_gpu(__fd, __id) \
>  	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__id)) \
> -		for (int __fd =3D drm_open_driver_another(igt_unique(__i),
> __id); \
> +		for (int __fd =3D multigpu_open_another(igt_unique(__i), __id);
> \
>  			__fd >=3D 0; \
>  			close(__fd), __fd =3D -1) \
>=20
> +#define xe_multi_fork_foreach_gpu(__fd, __gpu_index) \
> +	igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \

Missed typo fix. Otherwise, LGTM.
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +		for (int __fd =3D multigpu_open_filtered_card(__gpu_index,
> DRIVER_XE); \
> +			__fd >=3D 0; \
> +			drm_close_driver(__fd), __fd =3D -1) \
> +
>  #endif /* __INTEL_MULTIGPU_H */
> --
> 2.42.0

