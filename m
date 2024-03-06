Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F344AC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 19:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A15711347B;
	Wed,  6 Mar 2024 19:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LE1HmQJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5AA11347B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709751798; x=1741287798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7ZRjWCWDuyJvQcZk85KpziS+VZ+0IoEzjsqW+zG9Xw=;
 b=LE1HmQJ63VL8JaG3Rdv71aXtVeiVNo8mzgXxnb2AWKCifMNOOIBuaJcw
 /z5e+FIZb4cfNFVWoTCA+fNUWmatOf7ByvEkmB3rf0YK/DEKfdj4GrhHr
 qn/ganfACUw2RrXdlFX04S2UaLeHbhSr/VGIc+zvTqFykTBeK54nDHDhC
 txTURO2WWleSCiqYXoRg2Ayp/2+Mv5nZdM4NpBav4gWbRHuK/CJCpHsFv
 aRQ72dDcLfv/L9wK9vK6XkvBuD0UG0m8altDBy+13KgVLbPcScw6vY4UO
 KCzh9hamuUGPOM7OX972nJAo7x0U6dizS6yepDGetTrdgazZP1uvdpVen w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4231769"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4231769"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9994863"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.25.43])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:03:14 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v11 4/6] lib/intel_multigpu: Add
 multi_fork_foreach_gpu_chip
Date: Wed, 06 Mar 2024 20:03:11 +0100
Message-ID: <2754559.9PvXe5no7K@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240306133158.45187-5-kamil.konieczny@linux.intel.com>
References: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
 <20240306133158.45187-5-kamil.konieczny@linux.intel.com>
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

On Wednesday, 6 March 2024 14:31:56 CET Kamil Konieczny wrote:
> Create macro for testing drm driver in multigpu scenarios with
> the help of few new multigpu functions. Also while at this,
> add documentation for public functions and use new helper in
> existing multi-gpu macro.

Is that correct?  I can't see any existing macro modified.

>=20
> v2: corrected description (Kamil), rebased on corrected patches
>   after Dominik review
> v3: corrected descriptions, renamed function to print_gpus
>   and did small refactoring (Kamil)
>   fixed typo in function name (Dominik)
> v4: fixed typos (Dominik)
> v10: rename new macro into multi_fork_foreach_gpu_chip (Zbigniew)
>=20
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Reviewed-by: "Dominik Karol Pi=C4=85tkowski" <dominik.karol.piatkowski@in=
tel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_multigpu.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/intel_multigpu.h | 10 ++++++
>  2 files changed, 82 insertions(+)
>=20
> diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
> index c4e7cf542..8b7d6f3fc 100644
> --- a/lib/intel_multigpu.c
> +++ b/lib/intel_multigpu.c
> @@ -4,6 +4,7 @@
>   */
> =20
>  #include "drmtest.h"
> +#include "i915/gem.h"
>  #include "igt_core.h"
>  #include "igt_device_scan.h"
>  #include "intel_multigpu.h"
> @@ -60,3 +61,74 @@ void gem_require_multigpu(int gpus_wanted)
>  	print_gpus(gpus_wanted, gpu_filters);
>  	igt_skip_on(gpu_filters < gpus_wanted);
>  }
> +
> +/**
> + * multigpu_acquire_view:
> + * @gpus_wanted: minimum number of GPUs required

That's what I think makes a non-iterating function multigpu specific -- an=
=20
argument for passing a minimum number of user required GPUs.  But still not=
=20
Intel specific, I believe, then I'm not happy with the source file name.

> + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function prepares filtered view for GPU cards with given chipset.
> + * On error skips and prints available GPUs found on PCI bus.
> + * Returns: number of GPUs found
> + */
> +int multigpu_acquire_view(int gpus_wanted, unsigned int chipset)
> +{
> +	int gpu_count =3D drm_prepare_filtered_multigpu(chipset);
> +
> +	igt_assert(gpus_wanted > 1);

Why?  Can't we imagine a test that uses the same code for exercising any=20
number of GPUs, including 1 as a special case?  I would call such test=20
"multigpu ready".
=20
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
> + * Function opens GPU card with drm_open_driver_another(). For i915 it=20
checks
> + * if opened card is functional. Skips on errors.
> + *
> + * Returns: opened fd for @idx card
> + */
> +int multigpu_open_another(int idx, unsigned int chipset)
> +{
> +	int fd;
> +
> +	igt_assert(idx >=3D 0);

I think the above check belongs to drm_open_driver_another().

> +	fd =3D drm_open_driver_another(idx, chipset);
> +
> +	if (chipset =3D=3D DRIVER_INTEL)
> +		igt_require_gem(fd);
> +
> +	return fd;

This function doesn't look like multigpu specific, nor even Intel specific,=
 as=20
other vendors may easily add their own chipset specific requirements.  Do w=
e=20
really want to give it a name multigpu_* and place it in an intel_* library?

Besides, we may not need it (see below).

> +}
> +
> +/**
> + * multigpu_open_filtered_card:
> + * @idx: index of GPU card, starting from 0
> + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> + *
> + * Function opens GPU card prepared with filtered view. It also checks if
> + * opened card agrees with desired chipset or checks if opened card is
> + * functional. Skips on errors.
> + *
> + * Returns: opened fd for @idx card
> + */
> +int multigpu_open_filtered_card(int idx, unsigned int chipset)
> +{
> +	int fd;
> +
> +	igt_assert(idx >=3D 0);
> +	fd =3D drm_open_filtered_card(idx);
> +	if (chipset =3D=3D DRIVER_XE)
> +		igt_require_xe(fd);
> +	else if (chipset =3D=3D DRIVER_INTEL)
> +		igt_require_gem(fd);

The same here (we may not need it if we call drm_open_filtered_card() after=
=20
multigpu_acquire_view() (or drm_prepare_filtered_multigpu()) -- see below).

> +
> +	return fd;
> +}
> diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
> index 5acfcd5f6..a99e7a85e 100644
> --- a/lib/intel_multigpu.h
> +++ b/lib/intel_multigpu.h
> @@ -12,6 +12,10 @@
>  void gem_require_multigpu(int count);
>  int gem_multigpu_count_class(int chipset);
> =20
> +int multigpu_acquire_view(int min_gpus_wanted, unsigned int chipset);
> +int multigpu_open_another(int idx, unsigned int chipset);
> +int multigpu_open_filtered_card(int idx, unsigned int chipset);
> +
>  #define igt_foreach_gpu(fd__, chipset__) \
>  	for (int igt_unique(i) =3D 0, fd__; \
>  		(fd__ =3D __drm_open_driver_another(igt_unique(i)++,=20
chipset__)) >=3D 0; \
> @@ -23,4 +27,10 @@ int gem_multigpu_count_class(int chipset);
>  			__fd >=3D 0; \
>  			drm_close_driver(__fd), __fd =3D -1) \
> =20
> +#define multi_fork_foreach_gpu_chip(__fd, __gpu_index, __chipset) \
> +	igt_multi_fork(__gpu_index, multigpu_acquire_view(2, __chipset)) \

Instead of hardcoding the minimum number of 2 GPUs, maybe let this macro=20
accept a gpus_wanted parameter, and wrap another macro around it that passe=
s 2=20
as gpus_wanted.

> +		for (int __fd =3D multigpu_open_filtered_card(__gpu_index,=20
__chipset); \

Again, your multigpu_open_filtered_card() may skip, while igt_multi_fork()=
=20
documentation says it expects no skips.

We could avoid skips inside the body of igt_multi_fork() if we moved requir=
ed=20
checks to a variant of multigpu_acquire_view() that sets up filters for GPU=
s=20
that not only match the selected chipset but also satisfy those checks.  Si=
nce=20
devices are now iterated inside drm_prepare_filtered_multigpu(), we  could=
=20
implement a new variant of this function that either performs some predefin=
ed=20
chipset based checks, like you proposed for multigpu_open_another() and=20
multigpu_open_filtered_card(), or accepts an argument that points to an=20
arbitrary user provided function, either boolean that returns OK/not OK for=
 a=20
GPU file descriptor, or void that skips if not OK.  That way, potential ski=
ps=20
would occur outside of igt_multi_fork() body, and you could drop those=20
multigpu_open_*() helpers which seem of limited use -- test functions=20
themselves should detect potential device issues.

> +			__fd >=3D 0; \
> +			drm_close_driver(__fd), __fd =3D -1) \

Another trailing backslash, not necessarily intended.

Thanks,
Janusz

> +
>  #endif /* __INTEL_MULTIGPU_H */
>=20




