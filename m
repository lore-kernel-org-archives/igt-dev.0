Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA34C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 19:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AAE10FF21;
	Wed, 20 Mar 2024 19:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U479n2sP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AB710FF21
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 19:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710964188; x=1742500188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wtw7p9Xt7nTzTZpPf9/aVJsm8/sN5dYztosXtOIKJMc=;
 b=U479n2sP3ZJC7LRIoRAyFMEVZtDNQ8ZW3fqulo6EwWpKTQhdokZ2JneB
 hlhvPFgczGGmfpRZN9Zh6NjbXR9NE0urqQ/GFcZAkgIkAKmQkjr7oaYl5
 vpXt81Ry/3S5Rdr1drTIRhQwjXF7BkRP8Odv/cbIJi31VYPWBHzFffQOC
 AUKaD6WPx7J+hMaycuAkuEuOglXvE+GxlzjdgFJ9bZDn2fBm/BIF0eVho
 4UXjpYhIG5QBvI7QyWynXP2mAQZZzUr+ItF2dbdV4heqB37hVhgNfzXgQ
 MMpRnAMUkNt3gEzUpbIqXG7QtHO511ruW8ZHs10eIdcs+85DYKwSsMe+d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5801152"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5801152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18740996"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.7.80])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:49:38 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v14 3/5] lib/igt_multigpu: Introduce library for
 multi-GPU scenarios
Date: Wed, 20 Mar 2024 20:49:35 +0100
Message-ID: <2357176.ZkOooBPedc@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240320155659.33518-4-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <20240320155659.33518-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Wednesday, 20 March 2024 16:56:57 CET Kamil Konieczny wrote:
> From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>=20
> Implemented igt_require_multigpu in order to replace
> igt_require(gpu_count > 1), as well as printing available
> PCI devices if requirement fails.
>=20
> Introduced igt_multigpu_count_class function that returns an actual
> number of GPUs present in system, which allows for writing multi-GPU
> test scenarios that does not require filter
> --device pci:vendor=3Dintel,device=3Ddiscrete,card=3Dall
> to run as intended. Based on patch by Chris Wilson.
>=20
> Introduced igt_multi_fork_foreach_gpu macro that helps with
> writing multi-GPU test scenarios in idiomatic form:
>=20
> igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
> 	test_function(i915);
> igt_waitchildren();
>=20
> This is multi-GPU ready as it will run also on single GPU
> board. For running tests on two or more GPUs there is new
> igt_multi_fork_foreach_multigpu macro.
>=20
> v10: squashed two commits which introduce multigpu functions (Zbigniew)
>   renamed __id and id__ into __chipset/chipset__ (Zbigniew)
>   used __drm_close_driver() instead of close() in first macro (Kamil)
> v11: added functions descriptions (Janusz)
> v12: moved to igt_multigpu.c/h (Janusz)
>  changed names from gem_ to igt_, removed '\' from end of macro (Janusz)
> v13: added new macro igt_multi_fork_foreach_multigpu which will require
>  two or more GPUs, changing old igt_multi_fork_foreach_gpu to work with
>  one or more GPUs, so tests using _gpu will be multi-GPU ready (Janusz)
> v14: dropped multigpu_open_another and replace it with
>  drm_open_driver_another, extending description (Janusz)
>=20
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: "Dominik Karol Pi=C4=85tkowski" <dominik.karol.piatkowski@=
intel.com>
> [Kamil: fixed whitespace and tabs, moved to lib/igt_multigpu.*]
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_multigpu.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_multigpu.h | 36 +++++++++++++++++++
>  lib/meson.build    |  1 +
>  3 files changed, 125 insertions(+)
>  create mode 100644 lib/igt_multigpu.c
>  create mode 100644 lib/igt_multigpu.h
>=20
> diff --git a/lib/igt_multigpu.c b/lib/igt_multigpu.c
> new file mode 100644
> index 000000000..be0c11332
> --- /dev/null
> +++ b/lib/igt_multigpu.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include "drmtest.h"
> +#include "i915/gem.h"
> +#include "igt_core.h"
> +#include "igt_device_scan.h"
> +#include "igt_multigpu.h"
> +
> +/**
> + * igt_multigpu_count_class:
> + * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function counts number of GPU cards with the help of opening all of t=
hem.
> + *
> + * Returns: number of GPUs cards found
> + */
> +int igt_multigpu_count_class(int class)
> +{
> +	int count =3D 0;
> +
> +	igt_foreach_gpu(fd, class)
> +		count++;
> +
> +	return count;
> +}
> +
> +static int print_gpus(int count, int gpu_num)
> +{
> +	struct igt_devices_print_format fmt =3D {
> +		.type =3D IGT_PRINT_SIMPLE,
> +		.option =3D IGT_PRINT_PCI,
> +	};
> +	int devices;
> +
> +	igt_info("PCI devices available in the system:\n");
> +
> +	igt_devices_scan(true);
> +	devices =3D igt_device_filter_pci();
> +	igt_devices_print(&fmt);
> +
> +	return devices;
> +}
> +
> +/**
> + * igt_require_filtered_multigpu:
> + * @count: minimum number of GPUs required found with filters
> + *
> + * Function checks number of filtered GPU cards.
> + * On error prints available GPUs found on PCI bus and skips.
> + */
> +int igt_require_filtered_multigpu(int gpus_wanted)

NIT: Not used by any other function withing this series, then probably belo=
ngs=20
to another set of patches.

Anyway,
Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> +{
> +	int gpu_count =3D igt_device_filter_count();
> +	int num;
> +
> +	if (gpu_count >=3D gpus_wanted)
> +		return gpu_count;
> +
> +	num =3D print_gpus(gpus_wanted, gpu_count);
> +	igt_skip_on_f(gpu_count < gpus_wanted, "Test requires at least %d GPUs,=
 got %d, available: %d\n", gpus_wanted, gpu_count, num);
> +
> +	return 0; /* unreachable */
> +}
> +
> +/**
> + * igt_require_multigpu:
> + * @count: minimum number of GPUs required
> + * @chipset: for example DRIVER_XE or DRIVER_INTEL
> + *
> + * Function checks number of GPU cards with __drm_open_driver_another()
> + * On error prints available GPUs found on PCI bus and skips.
> + */
> +int igt_require_multigpu(int gpus_wanted, unsigned int chipset)
> +{
> +	int gpu_filters =3D igt_multigpu_count_class(chipset);
> +	int num;
> +
> +	if (gpu_filters >=3D gpus_wanted)
> +		return gpu_filters;
> +
> +	num =3D print_gpus(gpus_wanted, gpu_filters);
> +	igt_skip_on_f(gpu_filters < gpus_wanted, "Test requires at least %d GPU=
s, got %d, available: %d\n", gpus_wanted, gpu_filters, num);
> +
> +	return 0; /* unreachable */
> +}
> diff --git a/lib/igt_multigpu.h b/lib/igt_multigpu.h
> new file mode 100644
> index 000000000..b002f98e0
> --- /dev/null
> +++ b/lib/igt_multigpu.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_MULTIGPU_H
> +#define __INTEL_MULTIGPU_H
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +
> +int igt_multigpu_count_class(int chipset);
> +int igt_require_filtered_multigpu(int count);
> +int igt_require_multigpu(int count, unsigned int chipset);
> +
> +#define igt_foreach_gpu(fd__, chipset__) \
> +	for (int igt_unique(i) =3D 0, fd__; \
> +		(fd__ =3D __drm_open_driver_another(igt_unique(i)++, (chipset__))) >=
=3D 0; \
> +		__drm_close_driver(fd__))
> +
> +#define igt_multi_fork_foreach_gpu_num(__fd, __gpu_idx, __chipset, __wan=
ted) \
> +	for (int igt_unique(__j) =3D igt_require_multigpu((__wanted), (__chipse=
t)); \
> +	     igt_unique(__j) !=3D -1; \
> +	     igt_unique(__j) =3D -1) \
> +		igt_multi_fork(__gpu_idx, igt_unique(__j)) \
> +			for (int __fd =3D drm_open_driver_another(__gpu_idx, (__chipset)); \
> +			     __fd >=3D 0; \
> +			     drm_close_driver(__fd), __fd =3D -1)
> +
> +#define igt_multi_fork_foreach_gpu(__fd, __gpu_idx, __chipset) \
> +		igt_multi_fork_foreach_gpu_num(__fd, __gpu_idx, (__chipset), 1)
> +
> +#define igt_multi_fork_foreach_multigpu(__fd, __gpu_idx, __chipset) \
> +		igt_multi_fork_foreach_gpu_num(__fd, __gpu_idx, (__chipset), 2)
> +
> +#endif /* __INTEL_MULTIGPU_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 934bac5c6..a5651571b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -66,6 +66,7 @@ lib_sources =3D [
>  	'intel_device_info.c',
>  	'intel_mmio.c',
>  	'intel_mocs.c',
> +	'igt_multigpu.c',
>  	'intel_pat.c',
>  	'ioctl_wrappers.c',
>  	'media_spin.c',
>=20




