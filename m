Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958CDC5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 19:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB7611347C;
	Wed,  6 Mar 2024 19:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFQc2gp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2D211347C
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709751789; x=1741287789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N1BrbrfkOlboU3pdgt9sa9Mj+QvCuRYekX0YToBK2ls=;
 b=kFQc2gp00mOOTrHULc/46iTCAiIRo9v85kyYfiswQNWbqeRiMLGIh158
 jmojpYipqdkwotwKYOmcoH77QqQJygYJH9kgxg/Ap0P+06ntB35RtQldu
 BKHbEGWwsUzTzDifmDjFDDlz4IeYsuPkWSIemxP8QCVsEFcr3bV7tVznI
 dS3AEHN+vUATUOE/EeSAe/TvJW0fNTZpJ2vt6xxVo/932Gi3ZX5rued0h
 R0HrafEIfIeJLzaK2yxjMfGW3IdF0NHgk3+uncX3BCoBr5eOms55zNL7v
 sP6TTr5lFiA3llTO/i9Jrk6FoVQJFeapTUmVAv7ZmcXCfKx7NWg3JpJsh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4231754"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4231754"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9994765"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.25.43])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:03:07 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v11 3/6] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Date: Wed, 06 Mar 2024 20:03:03 +0100
Message-ID: <14877581.O6BkTfRZtg@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240306133158.45187-4-kamil.konieczny@linux.intel.com>
References: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
 <20240306133158.45187-4-kamil.konieczny@linux.intel.com>
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

On Wednesday, 6 March 2024 14:31:55 CET Kamil Konieczny wrote:
> From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>=20
> Implemented gem_require_multigpu in order to replace
> igt_require(gpu_count > 1), as well as printing available
> PCI devices if requirement fails.
>=20
> Introduced gem_multigpu_count_class function that returns an actual
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
> v10: squashed two commits which introduce multigpu functions (Zbigniew)
>   renamed __id and id__ into __chipset/chipset__ (Zbigniew)
>   used __drm_close_driver() instead of close() in first macro (Kamil)
> v11: added functions descriptions (Janusz)
>=20
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: "Dominik Karol Pi=C4=85tkowski" <dominik.karol.piatkowski@=
intel.com>
> [Kamil: fixed whitespace and tabs, moved to lib/intel_multigpu.*]
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_multigpu.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/intel_multigpu.h | 26 +++++++++++++++++++

Are the new functions introduced with this patch really Intel specific?  I=
=20
think they're not.  Why don't we call this source file igt_multigpu.c (or=20
drm_multigpu.c)?

>  lib/meson.build      |  1 +
>  3 files changed, 89 insertions(+)
>  create mode 100644 lib/intel_multigpu.c
>  create mode 100644 lib/intel_multigpu.h
>=20
> diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
> new file mode 100644
> index 000000000..c4e7cf542
> --- /dev/null
> +++ b/lib/intel_multigpu.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_device_scan.h"
> +#include "intel_multigpu.h"
> +
> +/**
> + * gem_multigpu_count_class:
> + * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function counts number of GPU cards with the help of opening all of t=
hem.
> + *
> + * Returns: number of GPUs cards found
> + */
> +int gem_multigpu_count_class(int class)

Also, these functions don't look gem specific, couldn't we use more generic=
=20
names like igt_* (or drm_*) for them?  After all, below you use igt_ prefix=
 in=20
names of related macros.

> +{
> +	int count =3D 0;
> +
> +	igt_foreach_gpu(fd, class)
> +		count++;
> +
> +	return count;
> +}
> +
> +static void print_gpus(int count, int gpu_num)
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
> +	igt_info("Test requires at least %d GPUs, got %d, available %d\n", coun=
t, gpu_num, devices);
> +}
> +
> +/**
> + * gem_require_multigpu:
> + * @count: minimum number of GPUs required found with filters
> + *
> + * Function checks number of filtered GPU cards.
> + * On error prints available GPUs found on PCI bus and skips.
> + */
> +void gem_require_multigpu(int gpus_wanted)
> +{
> +	int gpu_filters =3D igt_device_filter_count();
> +
> +	if (gpu_filters >=3D gpus_wanted)
> +		return;
> +
> +	print_gpus(gpus_wanted, gpu_filters);
> +	igt_skip_on(gpu_filters < gpus_wanted);

How about moving the trailing igt_info() message out of print_gpus() and=20
printing it here as igt_skip_on_f() message?  Do we really want that=20
information printed even when not skipping?

> +}
> diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
> new file mode 100644
> index 000000000..5acfcd5f6
> --- /dev/null
> +++ b/lib/intel_multigpu.h
> @@ -0,0 +1,26 @@
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
> +void gem_require_multigpu(int count);
> +int gem_multigpu_count_class(int chipset);
> +
> +#define igt_foreach_gpu(fd__, chipset__) \
> +	for (int igt_unique(i) =3D 0, fd__; \
> +		(fd__ =3D __drm_open_driver_another(igt_unique(i)++, chipset__)) >=3D =
0; \
> +		__drm_close_driver(fd__))
> +
> +#define igt_multi_fork_foreach_gpu(__fd, __chipset) \
> +	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__chipset)) \
> +		for (int __fd =3D drm_open_driver_another(igt_unique(__i), __chipset);=
 \

Since igt_multi_fork() documentation says it expects no skips and=20
drm_open_driver_another() may skip, you must use __drm_open_driver_another(=
),=20
I believe.

Besides, that igt_multi_fork_foreach_gpu() looks to me like a special case =
of=20
multi_fork_foreach_gpu_chip() provided by your next patch, couldn't the for=
mer=20
be implemented as a wrapper around the latter?

> +			__fd >=3D 0; \
> +			drm_close_driver(__fd), __fd =3D -1) \

Please note the trailing backslash, is it intended?

Thanks,
Janusz


> +
> +#endif /* __INTEL_MULTIGPU_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 6122861d8..8251695e1 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -65,6 +65,7 @@ lib_sources =3D [
>  	'intel_device_info.c',
>  	'intel_mmio.c',
>  	'intel_mocs.c',
> +	'intel_multigpu.c',
>  	'intel_pat.c',
>  	'ioctl_wrappers.c',
>  	'media_spin.c',
>=20




