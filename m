Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC454C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 15:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46293112B2F;
	Mon, 11 Mar 2024 15:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djghxSqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198AD112B28
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710172193; x=1741708193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bMxkLvCAwqz90Pj1fvlbc3FohUkDbppa7yde/nVzchs=;
 b=djghxSqq85++nkl0LK4LzHKeuBIDIj1eDLFYCeUg7esvY1TxygGhp2P/
 qg3BQktT1ACmdTivbS2HA6fcVq+8T6unNXhtzCsulr+sliF/1tgCqxBap
 gheCo+uEnLd1VA/TfAvabKPJJidCThaYz5Ubad5x+If12oJMVwFWGvnC6
 +QU2GojvKT1nXrM6OhMioxGYnoVNCpKE/d0ASM+LqEn9V0Xed9r8D0HO+
 NeJ8Asvv9QraUq7dCDBv6xcXCGhvSdEUr/PSpsk6vIWjCoO70cLQAq1Mj
 cGn1UdPVqF4WhsRyDS7G1Q7paS2mbumQ4jbFXUdddbNeyhHpYnYI79owk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4768870"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4768870"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42186410"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:49:50 -0700
Date: Mon, 11 Mar 2024 16:49:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v11 3/6] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Message-ID: <20240311154947.cqmhesbersqmxgag@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
 <20240306133158.45187-4-kamil.konieczny@linux.intel.com>
 <14877581.O6BkTfRZtg@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14877581.O6BkTfRZtg@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,
On 2024-03-06 at 20:03:03 +0100, Janusz Krzysztofik wrote:
> Hi Kamil,
> 
> On Wednesday, 6 March 2024 14:31:55 CET Kamil Konieczny wrote:
> > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > 
> > Implemented gem_require_multigpu in order to replace
> > igt_require(gpu_count > 1), as well as printing available
> > PCI devices if requirement fails.
> > 
> > Introduced gem_multigpu_count_class function that returns an actual
> > number of GPUs present in system, which allows for writing multi-GPU
> > test scenarios that does not require filter
> > --device pci:vendor=intel,device=discrete,card=all
> > to run as intended. Based on patch by Chris Wilson.
> > 
> > Introduced igt_multi_fork_foreach_gpu macro that helps with
> > writing multi-GPU test scenarios in idiomatic form:
> > 
> > igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
> > 	test_function(i915);
> > igt_waitchildren();
> > 
> > v10: squashed two commits which introduce multigpu functions (Zbigniew)
> >   renamed __id and id__ into __chipset/chipset__ (Zbigniew)
> >   used __drm_close_driver() instead of close() in first macro (Kamil)
> > v11: added functions descriptions (Janusz)
> > 
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
> > [Kamil: fixed whitespace and tabs, moved to lib/intel_multigpu.*]
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_multigpu.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
> >  lib/intel_multigpu.h | 26 +++++++++++++++++++
> 
> Are the new functions introduced with this patch really Intel specific?  I 
> think they're not.  Why don't we call this source file igt_multigpu.c (or 
> drm_multigpu.c)?
> 

Good point, I can chane it to igt_multigpu.c

> >  lib/meson.build      |  1 +
> >  3 files changed, 89 insertions(+)
> >  create mode 100644 lib/intel_multigpu.c
> >  create mode 100644 lib/intel_multigpu.h
> > 
> > diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
> > new file mode 100644
> > index 000000000..c4e7cf542
> > --- /dev/null
> > +++ b/lib/intel_multigpu.c
> > @@ -0,0 +1,62 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include "drmtest.h"
> > +#include "igt_core.h"
> > +#include "igt_device_scan.h"
> > +#include "intel_multigpu.h"
> > +
> > +/**
> > + * gem_multigpu_count_class:
> > + * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function counts number of GPU cards with the help of opening all of them.
> > + *
> > + * Returns: number of GPUs cards found
> > + */
> > +int gem_multigpu_count_class(int class)
> 
> Also, these functions don't look gem specific, couldn't we use more generic 
> names like igt_* (or drm_*) for them?  After all, below you use igt_ prefix in 
> names of related macros.
> 

Yes, I will change them to have prefix igt_

> > +{
> > +	int count = 0;
> > +
> > +	igt_foreach_gpu(fd, class)
> > +		count++;
> > +
> > +	return count;
> > +}
> > +
> > +static void print_gpus(int count, int gpu_num)
> > +{
> > +	struct igt_devices_print_format fmt = {
> > +		.type = IGT_PRINT_SIMPLE,
> > +		.option = IGT_PRINT_PCI,
> > +	};
> > +	int devices;
> > +
> > +	igt_info("PCI devices available in the system:\n");
> > +
> > +	igt_devices_scan(true);
> > +	devices = igt_device_filter_pci();
> > +	igt_devices_print(&fmt);
> > +
> > +	igt_info("Test requires at least %d GPUs, got %d, available %d\n", count, gpu_num, devices);
> > +}
> > +
> > +/**
> > + * gem_require_multigpu:
> > + * @count: minimum number of GPUs required found with filters
> > + *
> > + * Function checks number of filtered GPU cards.
> > + * On error prints available GPUs found on PCI bus and skips.
> > + */
> > +void gem_require_multigpu(int gpus_wanted)
> > +{
> > +	int gpu_filters = igt_device_filter_count();
> > +
> > +	if (gpu_filters >= gpus_wanted)
> > +		return;
> > +
> > +	print_gpus(gpus_wanted, gpu_filters);
> > +	igt_skip_on(gpu_filters < gpus_wanted);
> 
> How about moving the trailing igt_info() message out of print_gpus() and 
> printing it here as igt_skip_on_f() message?  Do we really want that 
> information printed even when not skipping?
> 

You are right, I will move it here where skip happens.

> > +}
> > diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
> > new file mode 100644
> > index 000000000..5acfcd5f6
> > --- /dev/null
> > +++ b/lib/intel_multigpu.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef __INTEL_MULTIGPU_H
> > +#define __INTEL_MULTIGPU_H
> > +
> > +#include "drmtest.h"
> > +#include "igt_core.h"
> > +
> > +void gem_require_multigpu(int count);
> > +int gem_multigpu_count_class(int chipset);
> > +
> > +#define igt_foreach_gpu(fd__, chipset__) \
> > +	for (int igt_unique(i) = 0, fd__; \
> > +		(fd__ = __drm_open_driver_another(igt_unique(i)++, chipset__)) >= 0; \
> > +		__drm_close_driver(fd__))
> > +
> > +#define igt_multi_fork_foreach_gpu(__fd, __chipset) \
> > +	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__chipset)) \
> > +		for (int __fd = drm_open_driver_another(igt_unique(__i), __chipset); \
> 
> Since igt_multi_fork() documentation says it expects no skips and 
> drm_open_driver_another() may skip, you must use __drm_open_driver_another(), 
> I believe.

This one was handled by function gem_multigpu_count_class() which
will skip before igt_multi_fork() will fork, after it forks all
should work without any skip.

> 
> Besides, that igt_multi_fork_foreach_gpu() looks to me like a special case of 
> multi_fork_foreach_gpu_chip() provided by your next patch, couldn't the former 
> be implemented as a wrapper around the latter?
> 

Former uses old drmtest functions, latter uses filters and views.

> > +			__fd >= 0; \
> > +			drm_close_driver(__fd), __fd = -1) \
> 
> Please note the trailing backslash, is it intended?

Good catch, it was not inteded, I will fixt it.

Regards,
Kamil

> 
> Thanks,
> Janusz
> 
> 
> > +
> > +#endif /* __INTEL_MULTIGPU_H */
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 6122861d8..8251695e1 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -65,6 +65,7 @@ lib_sources = [
> >  	'intel_device_info.c',
> >  	'intel_mmio.c',
> >  	'intel_mocs.c',
> > +	'intel_multigpu.c',
> >  	'intel_pat.c',
> >  	'ioctl_wrappers.c',
> >  	'media_spin.c',
> > 
> 
> 
> 
> 
