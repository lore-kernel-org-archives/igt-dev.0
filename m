Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD0AC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 07:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637E610F0D7;
	Thu, 25 Jan 2024 07:43:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2576110F0D7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706168620; x=1737704620;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fW+XAEMzVdUK9sLIKd3H9LZufVVdWsXKtWouw2BjjIg=;
 b=V/nfu/3tcDA3TGY/P2IiVFEzo0/0HqB5wsX0CVcMmU7TJACFLWcn6UXW
 /GwUOJoacDFfKJZ5D0g78PMIF5UbTXQjkhqHwJJ3FdZVd7KfJuSAJkpQ5
 BLwRQvB5KU3r+NK35KzGcobQQMqpmFkXDVEvVyMlRi3DQixptpCFkwgfI
 UR6DiH2HgRjCDCiwmXzvhN2/IO2psYZztV0sbMergsEy0V+EDnflTIJH6
 ACLb+hc0rr5YHE4JrYW8c3j0EQJOTU358G7vyfkZGdAHjX+qn2mJp9BDR
 QRY1xgLspvl6FHTvOEN5Js3219V773WqQMP5f6zBxC731ICfE7jecyH/X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401738402"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401738402"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876971102"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="876971102"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 23:43:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 23:43:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 23:43:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 23:43:37 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 23:43:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZnbLTE5bokku8WiS9xXxIVNeBO1jcS30qVjWEicJSlZ7XTjgaxyGiWtUgSmdL96Brr8YFrGgEd1WSl1KWl5dbb5rLu5n7vif8Nr+5ihx0jnSb3YDpqDv6qACvMmy1xJN3+GTzfloOESEyG5Kl3FQlD7ZMRSTqM5gBOS8eTC2ldHEeEXuLrBDKjUGOvsZVQQ41vBIN7aAflDz7HeVpHoZ/PxRyuXSqLrqjPenmSfifMzqETjdU3Qk9a9/empCNDSIynwDz4YtJC6OLC9EGG/6ZVwyF0ilFdxHXw2sgtagwnPUcSV3gqXAlIUcNnqSk94YYBIWgKgIVWAOJJxbzP4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/QnZF9F1TEYGmdM+14yLQHUQ/ZnW9aIRvDQlvlDGuo=;
 b=A7CZ05KQZMKXVOC0gijoYEm0sGFZJcTlSoDgidaHp/yjS7rfxyuEf0fbCe0ziFeEhl0gIQrBNcg3zv2dBia7Hfa9VFHx/WlTldTBt05kKHSGE9AXF+ExDQIb/Eu6K4I8ZdbZ8wjdKtMmHfwpCnUFs7ItxIINwyivNeuAZuk7n8k/AeqsezldLnFm+vmZLMqtn8eAf87ny4Kdmn/FH7Uxhj1+SE3MfQiBQIByOL5QGtHiknH5MTZrS2Qk4V+ZrSEjM/MYs47Zvr9EZXy/xpZdFrujs8qXY5R8KPU2IgMXd/lF+jngrW9bUklCqevIl/zPInKt5SGRs+HaBe3Hjh+gMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 BL1PR11MB5495.namprd11.prod.outlook.com (2603:10b6:208:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 07:43:35 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 07:43:35 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 6/8] lib/intel_multigpu: Add
 xe_multi_fork_foreach_gpu
Thread-Topic: [PATCH i-g-t v2 6/8] lib/intel_multigpu: Add
 xe_multi_fork_foreach_gpu
Thread-Index: AQHaTwXey3qspVfqMkmJeCq4PWaiM7DqHuAw
Date: Thu, 25 Jan 2024 07:43:35 +0000
Message-ID: <DS0PR11MB7264ABE771F3BB080E0A3595D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-7-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240124204134.71451-7-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|BL1PR11MB5495:EE_
x-ms-office365-filtering-correlation-id: ac5d3b82-3e6f-4e9d-31d5-08dc1d795654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: weSaYqxqdtK1H57LVfGGX/iAQ7TDg57rLWWsAndhofwyFnvlh8SvbIQUWCdQqO6thnyQOt2JIzx0UtMJONoT4CyTb1qgPniiAjvX40aeFYOjOX+vP+h4I3IxXg7qE7yKtAmszy4EKViee7rOJiqM3vUxwOHBxNIFucZMKj1bOolQaVKZ4mkQd8gKq72nOf5MQr5e8gEMCRHyc9dVx5w2FcKC6RwRZsoQ9u55SVwPx/Yj+mhkAxZ5nuOxbcQFa7r+pKvD5vg/GWhiKBDFvrWFBcbvcSf10YXy/WK5KIvhnvZ6Qo+6j8zzstrVttgMwCByURGwdIvH6DORGAc9qcl0NaP9CtbQyDiP0tt5szjQDUUFvy4Dz28GSrGqsPZ/MAm6JSJL79h0XhdYjIPALJIU6zftQSz7zkMpuFeLLqXoemi3MTraEBeOnJ10CTgh3tqDtpCzxgvEZoRCUQY7Hh/8XYE+4JQBgJ+MXv7djTSXDPnZ3NH1tFzgZk3WTbUcfF1clMWl8SyF6K3FPsiBFSEyMclgTZcFosrz2h94DEIsz8DXQCQ/xFI2qutzSF7julDLqoEgAesinCB6Bx4iaWsWr9v3KkX7vBSAHxuiy6GqY7DXvAVG7OPc/o7H2DXYTSky
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(33656002)(83380400001)(2906002)(52536014)(122000001)(82960400001)(5660300002)(38070700009)(41300700001)(38100700002)(55016003)(478600001)(71200400001)(26005)(86362001)(76116006)(66946007)(110136005)(66556008)(66476007)(64756008)(66446008)(316002)(8936002)(8676002)(9686003)(53546011)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NYNRZ3MEmkMgT2dZquSLm/yImTvSmLsQ12CpxZz+ZYgoA8jmk24XgVmVvHWh?=
 =?us-ascii?Q?0LQDbrrxcZz1IYJyPGyeBFsiaoct/7w8TxPdQ84uXyyJoEroSG/1AK2TJOpW?=
 =?us-ascii?Q?hV/sjJysNUPKz+wdxZ8qTh4BFEWE7PKKQNAOL878fTmwOV5llXPybIxfSQ2h?=
 =?us-ascii?Q?++3taIKMZJUygkpdQk2mzsWxQizjAQJzXRNZm35jfX48ucWwFi5yBfexYWrN?=
 =?us-ascii?Q?U3u4gPSKQZR7TDLTDN32XgAaZEvJE4ALlJ1J7I4/E89wIcqscXB/9iV+QiS2?=
 =?us-ascii?Q?YFCU/BqSdBweVs282Uz3+p5DWLnYemhIupfgOAT1DxkoxvHHTKBNGCxzP81m?=
 =?us-ascii?Q?0kLlCs8RsxpB7fUV8d8FtfvZ18iV70fwfFIhJOumOLRZuD+Ebes68ItogGdA?=
 =?us-ascii?Q?erZaTYdVA5MwhN0R9VULoIw+4hK/WQqxLYBneKpO9/85g+RzJq+PRvid4Apg?=
 =?us-ascii?Q?5KMW3O185ISRbmvo9iZnMvt/P1P5BLwW4f+PnNGCKZFlSDwyTKaSZ6nGeniS?=
 =?us-ascii?Q?f2XLAbiOSJkr4t8LmrdvoXsQEht83385GjpPeGuBSSD2dtGCLCWW49F+e/no?=
 =?us-ascii?Q?F3IQb+p3XnZ0foSuv87u01e+DX74DCPk5IyMYZL3asPXdTuh2UiPPIvmj5ta?=
 =?us-ascii?Q?Mr2oLZS/kxKyeivE+w3BrRuj8qQA0+IfLESK+y5o5+I/q1r+5BcyuBD+NOK3?=
 =?us-ascii?Q?GUQYGJ4kSzJRKywJ9zNivVRalYikZHwYouxtYf/4WDRF+pVnd8YNlNGvOqum?=
 =?us-ascii?Q?SQcY9UIKCl0p5Bd5HJlo00rzdmeNA/rvARjWMhjo/Vn9HrjfCQ4GUCxrqssi?=
 =?us-ascii?Q?Z2xwIlcv924Gt9cJS64UULypfpPF1aQ0gZueWwsSvDIVE3Zv8D88D5eUVpJa?=
 =?us-ascii?Q?NrcQmNxMsRI8j6sbdiR/GsQOdIP2bWP6Ak+d23rU8BaXdSoEgs5248VUpeaV?=
 =?us-ascii?Q?bQNDdCXoATthpbrTRHushkFAA4q/seQeQCr6qg83/RnK2Wz/KYPl3Up69t4v?=
 =?us-ascii?Q?RNjlH3Gq73mPe+T+0H6uXcdRGpU/6FhHlu65s1sYi474DYf1+lgmo6Hcx/ey?=
 =?us-ascii?Q?wFjpN41qwn1Jx2jZtED3M+cFHe3tuVRJWJajPm69J30DhzLFWUyMj+r+6V6F?=
 =?us-ascii?Q?N6Dz4WQbV9GHx8zgMysPcTJFPNgzi3Tyy7UZm1sNuyRMYjbQDGu4JT7bwOAx?=
 =?us-ascii?Q?Qbjktyxr5YEO4lB6nGqt7Vxcifq8FeaKF2p/QG9puGYmgzlxEf1ry4xbEuQA?=
 =?us-ascii?Q?73NrtLBz1PJysBvdbLOsC7zAhJsnqVUOBMtg+CPgzy6ZQs42Kx2okNL1O6fe?=
 =?us-ascii?Q?t/hi3Sk+5j+hdmdn7M3Mkf3F8+FT4wS+1R3UToTIJdMtr7aXQyNVoRizttcB?=
 =?us-ascii?Q?oMlmfzxJS8aZiaZSmNPZnOYYSwP9x0MXZxQza3IEx2NCNo87/E905EyOAJP5?=
 =?us-ascii?Q?EZ/YYlBGneFlpeb7qCvP1wy4MfC0/6qdjHNq2AZE0hntAnloD/08klGGszdy?=
 =?us-ascii?Q?NpXWok927ZOtIQGjYC/Tgjj/dwH0kNzEI63Uc+gFyQkPiWCmf2YX5E6Cy/Xk?=
 =?us-ascii?Q?QxNcI4jonOF3NTTlU03bqnwDOm7qS2gq92vE2A16eC7HagXeUftFhO1K1pZg?=
 =?us-ascii?Q?rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5d3b82-3e6f-4e9d-31d5-08dc1d795654
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 07:43:35.6066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlkd8eDuO05MWsBol9dcON5XK/WqsScuL7QuvvgG4SAYxZ8jI05rUr7f/sRK/NqIs9+qd4y/PL+oIWW+WcDg+m31B0z5zvyzrZ1fyfKV9qrVmG5ZDi47MhCs4oHDOyVX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5495
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
> Sent: Wednesday, January 24, 2024 9:42 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t v2 6/8] lib/intel_multigpu: Add
> xe_multi_fork_foreach_gpu
>=20
> Create macro for testing Xe driver in multigpu scenarios with the help of=
 few
> new multigpu functions. Also while at this, add documentation for public
> functions and use new helper in existing multi-gpu macro.
>=20
> v2: corrected description (Kamil), rebased on corrected patches after Dom=
inik
> review
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_multigpu.c | 94
> ++++++++++++++++++++++++++++++++++++++++++--
>  lib/intel_multigpu.h | 12 +++++-
>  2 files changed, 101 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c index
> 0e76d8aa3..e631ab0ed 100644
> --- a/lib/intel_multigpu.c
> +++ b/lib/intel_multigpu.c
> @@ -4,10 +4,18 @@
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
> + * Returns: number of GPUs cards found
> + */
>  int gem_multigpu_count_class(int class)  {
>  	int count =3D 0;
> @@ -18,7 +26,7 @@ int gem_multigpu_count_class(int class)
>  	return count;
>  }
>=20
> -void gem_require_multigpu(int count)
> +static void skip_on_sigle_gpu(int count)

Nitpick: typo
I guess it should be named "skip_on_single_gpu".

>  {
>  	struct igt_devices_print_format fmt =3D {
>  		.type =3D IGT_PRINT_SIMPLE,
> @@ -26,9 +34,6 @@ void gem_require_multigpu(int count)
>  	};
>  	int devices;
>=20
> -	if (igt_device_filter_count() >=3D count)
> -		return;
> -

As this conditional return was moved to gem_require_multigpu(), that functi=
on will work correctly. Although, calling skip_on_single_gpu() directly wil=
l always cause a skip due to always reachable igt_skip. I suggest changing =
igt_skip to igt_skip_on to avoid unexpected behavior in the future.

Additionally, skip_on_single_gpu can be refactored to not take any argument=
s, as we already get the number of gpus present in the system, and taking r=
equired count of gpus is not needed (it is always >1). The idea is to use i=
gt_skip_on when devices < 2.

>  	igt_info("PCI devices available in the system:\n");
>=20
>  	igt_devices_scan(true);
> @@ -37,3 +42,84 @@ void gem_require_multigpu(int count)
>=20
>  	igt_skip("Test requires at least %d GPUs, %d available.\n", count,
> devices);  }
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
> +	if (igt_device_filter_count() >=3D count)
> +		return;
> +
> +	skip_on_sigle_gpu(count);
> +}
> +
> +/**
> + * multigpu_aquire_view:
> + * @gpus_wanted: minimum number of GPUs required
> + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function prepares filtered view for GPU cards with given chipset.
> + * On error skips and prints available GPUs found on PCI bus.
> + * Returns: number of GPUs found
> + */
> +int multigpu_aquire_view(int gpus_wanted, unsigned int chipset) {

Nitpick: typo
I guess it should be named "multigpu_acquire_view" (in function name and do=
cumentation).

Dominik Karol

> +	int gpu_count =3D drm_prepare_filtered_multigpu(chipset);
> +
> +	igt_assert(gpus_wanted > 1);
> +	if (gpu_count < gpus_wanted)
> +		skip_on_sigle_gpu(gpus_wanted);
> +
> +	return gpu_count;
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
> + * Returns: opened fd for @idx card
> + */
> +int multigpu_open_another(int idx, unsigned int chipset) {
> +	int fd;
> +
> +	igt_assert(idx >=3D 0);
> +	fd =3D drm_open_driver_another(idx, chipset);
> +
> +	igt_require(fd !=3D -1);
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
> + * Returns: opened fd for @idx card
> + */
> +int multigpu_open_filtered_card(int idx, unsigned int chipset) {
> +	int fd =3D drm_open_filtered_card(idx);
> +
> +	igt_require(fd !=3D -1);
> +	if (chipset =3D=3D DRIVER_XE)
> +		igt_require_xe(fd);
> +	else if (chipset =3D=3D DRIVER_INTEL)
> +		igt_require_gem(fd);
> +
> +	return fd;
> +}
> diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h index
> 0ebc73e4a..0032a619e 100644
> --- a/lib/intel_multigpu.h
> +++ b/lib/intel_multigpu.h
> @@ -12,6 +12,10 @@
>  void gem_require_multigpu(int count);
>  int gem_multigpu_count_class(int class);
>=20
> +int multigpu_aquire_view(int min_gpus_wanted, unsigned int chipset);
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
> +		for (int __fd =3D multigpu_open_filtered_card(__gpu_index,
> DRIVER_XE); \
> +			__fd >=3D 0; \
> +			drm_close_driver(__fd), __fd =3D -1) \
> +
>  #endif /* __INTEL_MULTIGPU_H */
> --
> 2.42.0

