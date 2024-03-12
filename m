Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B128C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 13:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753810EF6B;
	Tue, 12 Mar 2024 13:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGsIFMqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746D10EF6B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710249549; x=1741785549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZUNUqXhdvvgfgr7WyJVKia9cz0QIH6fAhZmbQC79pQI=;
 b=iGsIFMqak6UAIvMxRRIeGCu7dWikgNQe6WNMprf7UGqng9Hbvf2VNPa/
 xxIsmIDtT/+e8vKTmdi2Qaf9kmPgHBEnMJh8itOTs+KeGQEvmQ9f106Le
 R6FI7T70C34kiglrgyKsfEQj58b30+Izw1qOB8MCi2TlqVqNZmNeonCe3
 3l2eZsOSgVm5mnrNqxv1KLIEqtLd0an0ICMYqevdeeR2QVCNA3SYN7YL8
 HOe6V4ivSzFmF06f/PlRF47wsqlsLtpeVrjt/NMwZ2sursvY9rwoAlZcz
 tpiMOxi6nzym9Edb2zIG/MRQ0z8DyA0xW0gwsoW+86nYSygQZSZ/C6Z3H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16096900"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16096900"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 06:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="42464794"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 06:19:06 -0700
Date: Tue, 12 Mar 2024 14:18:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t v11 4/6] lib/intel_multigpu: Add
 multi_fork_foreach_gpu_chip
Message-ID: <20240312131815.jg3gwzjwwqu2yk3d@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
References: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
 <20240306133158.45187-5-kamil.konieczny@linux.intel.com>
 <2754559.9PvXe5no7K@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2754559.9PvXe5no7K@jkrzyszt-mobl2.ger.corp.intel.com>
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
On 2024-03-06 at 20:03:11 +0100, Janusz Krzysztofik wrote:
> Hi Kamil,
> 
> On Wednesday, 6 March 2024 14:31:56 CET Kamil Konieczny wrote:
> > Create macro for testing drm driver in multigpu scenarios with
> > the help of few new multigpu functions. Also while at this,
> > add documentation for public functions and use new helper in
> > existing multi-gpu macro.
> 
> Is that correct?  I can't see any existing macro modified.
> 

Good point, I moved doc to patch where it belongs, I will
correct description here.

> > 
> > v2: corrected description (Kamil), rebased on corrected patches
> >   after Dominik review
> > v3: corrected descriptions, renamed function to print_gpus
> >   and did small refactoring (Kamil)
> >   fixed typo in function name (Dominik)
> > v4: fixed typos (Dominik)
> > v10: rename new macro into multi_fork_foreach_gpu_chip (Zbigniew)
> > 
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Reviewed-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_multigpu.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
> >  lib/intel_multigpu.h | 10 ++++++
> >  2 files changed, 82 insertions(+)
> > 
> > diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
> > index c4e7cf542..8b7d6f3fc 100644
> > --- a/lib/intel_multigpu.c
> > +++ b/lib/intel_multigpu.c
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include "drmtest.h"
> > +#include "i915/gem.h"
> >  #include "igt_core.h"
> >  #include "igt_device_scan.h"
> >  #include "intel_multigpu.h"
> > @@ -60,3 +61,74 @@ void gem_require_multigpu(int gpus_wanted)
> >  	print_gpus(gpus_wanted, gpu_filters);
> >  	igt_skip_on(gpu_filters < gpus_wanted);
> >  }
> > +
> > +/**
> > + * multigpu_acquire_view:
> > + * @gpus_wanted: minimum number of GPUs required
> 
> That's what I think makes a non-iterating function multigpu specific -- an 
> argument for passing a minimum number of user required GPUs.  But still not 
> Intel specific, I believe, then I'm not happy with the source file name.
> 

Yes, I renemed it to igt_multigpu.*

> > + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function prepares filtered view for GPU cards with given chipset.
> > + * On error skips and prints available GPUs found on PCI bus.
> > + * Returns: number of GPUs found
> > + */
> > +int multigpu_acquire_view(int gpus_wanted, unsigned int chipset)
> > +{
> > +	int gpu_count = drm_prepare_filtered_multigpu(chipset);
> > +
> > +	igt_assert(gpus_wanted > 1);
> 
> Why?  Can't we imagine a test that uses the same code for exercising any 
> number of GPUs, including 1 as a special case?  I would call such test 
> "multigpu ready".
>  

Should I warn/info about it being 1 here?
What about:

	igt_assert(gpus_wanted > 0);
	if(gpus_wanted == 1)
            igt_info("requested only one GPU for multi-gpu test\n");

Or maybe not here but just before return, when gpu_count == 1?

> > +	if (gpu_count >= gpus_wanted)
> > +		return gpu_count;
> > +
> > +	print_gpus(gpus_wanted, gpu_count);
> > +	igt_skip_on(gpu_count < gpus_wanted);
> > +
> > +	return gpu_count; /* non-reachable */
> > +}
> > +
> > +/**
> > + * multigpu_open_another:
> > + * @idx: index of GPU card, starting from 0
> > + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function opens GPU card with drm_open_driver_another(). For i915 it 
> checks
> > + * if opened card is functional. Skips on errors.
> > + *
> > + * Returns: opened fd for @idx card
> > + */
> > +int multigpu_open_another(int idx, unsigned int chipset)
> > +{
> > +	int fd;
> > +
> > +	igt_assert(idx >= 0);
> 
> I think the above check belongs to drm_open_driver_another().
> 

Right, I will remove it.

> > +	fd = drm_open_driver_another(idx, chipset);
> > +
> > +	if (chipset == DRIVER_INTEL)
> > +		igt_require_gem(fd);
> > +
> > +	return fd;
> 
> This function doesn't look like multigpu specific, nor even Intel specific, as 
> other vendors may easily add their own chipset specific requirements.  Do we 
> really want to give it a name multigpu_* and place it in an intel_* library?
> 
> Besides, we may not need it (see below).
> 

Note that it do some extra work - it checks for has_gem(fd)
but I think that it should also check DRIVER_ANY and is_i915()

> > +}
> > +
> > +/**
> > + * multigpu_open_filtered_card:
> > + * @idx: index of GPU card, starting from 0
> > + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function opens GPU card prepared with filtered view. It also checks if
> > + * opened card agrees with desired chipset or checks if opened card is
> > + * functional. Skips on errors.
> > + *
> > + * Returns: opened fd for @idx card
> > + */
> > +int multigpu_open_filtered_card(int idx, unsigned int chipset)
> > +{
> > +	int fd;
> > +
> > +	igt_assert(idx >= 0);
> > +	fd = drm_open_filtered_card(idx);
> > +	if (chipset == DRIVER_XE)
> > +		igt_require_xe(fd);
> > +	else if (chipset == DRIVER_INTEL)
> > +		igt_require_gem(fd);
> 
> The same here (we may not need it if we call drm_open_filtered_card() after 
> multigpu_acquire_view() (or drm_prepare_filtered_multigpu()) -- see below).
> 

Same here - it do some more extra work.

> > +
> > +	return fd;
> > +}
> > diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
> > index 5acfcd5f6..a99e7a85e 100644
> > --- a/lib/intel_multigpu.h
> > +++ b/lib/intel_multigpu.h
> > @@ -12,6 +12,10 @@
> >  void gem_require_multigpu(int count);
> >  int gem_multigpu_count_class(int chipset);
> >  
> > +int multigpu_acquire_view(int min_gpus_wanted, unsigned int chipset);
> > +int multigpu_open_another(int idx, unsigned int chipset);
> > +int multigpu_open_filtered_card(int idx, unsigned int chipset);
> > +
> >  #define igt_foreach_gpu(fd__, chipset__) \
> >  	for (int igt_unique(i) = 0, fd__; \
> >  		(fd__ = __drm_open_driver_another(igt_unique(i)++, 
> chipset__)) >= 0; \
> > @@ -23,4 +27,10 @@ int gem_multigpu_count_class(int chipset);
> >  			__fd >= 0; \
> >  			drm_close_driver(__fd), __fd = -1) \
> >  
> > +#define multi_fork_foreach_gpu_chip(__fd, __gpu_index, __chipset) \
> > +	igt_multi_fork(__gpu_index, multigpu_acquire_view(2, __chipset)) \
> 
> Instead of hardcoding the minimum number of 2 GPUs, maybe let this macro 
> accept a gpus_wanted parameter, and wrap another macro around it that passes 2 
> as gpus_wanted.
> 
> > +		for (int __fd = multigpu_open_filtered_card(__gpu_index, 
> __chipset); \
> 
> Again, your multigpu_open_filtered_card() may skip, while igt_multi_fork() 
> documentation says it expects no skips.
> 

It is because it treats such skips as failures, not as a skips.

> We could avoid skips inside the body of igt_multi_fork() if we moved required 
> checks to a variant of multigpu_acquire_view() that sets up filters for GPUs 
> that not only match the selected chipset but also satisfy those checks.  Since 
> devices are now iterated inside drm_prepare_filtered_multigpu(), we  could 
> implement a new variant of this function that either performs some predefined 
> chipset based checks, like you proposed for multigpu_open_another() and 
> multigpu_open_filtered_card(), or accepts an argument that points to an 
> arbitrary user provided function, either boolean that returns OK/not OK for a 
> GPU file descriptor, or void that skips if not OK.  That way, potential skips 
> would occur outside of igt_multi_fork() body, and you could drop those 
> multigpu_open_*() helpers which seem of limited use -- test functions 
> themselves should detect potential device issues.
> 

It is, first line of this macro:
  igt_multi_fork(__gpu_index, multigpu_acquire_view(2, __chipset)) \

has multigpu_acuire_view() and it should do exactly what you wrote,
it should make checks that all opens later should end in success.
They can still fail later (for example - has_gem() for i915).

> > +			__fd >= 0; \
> > +			drm_close_driver(__fd), __fd = -1) \
> 
> Another trailing backslash, not necessarily intended.

Right, I will fix it.

> 
> Thanks,
> Janusz
> 

Thank you for your comments,

Regards,
Kamil

> > +
> >  #endif /* __INTEL_MULTIGPU_H */
> > 
> 
> 
> 
> 
