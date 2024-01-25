Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DBEC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 13:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DB110EBAD;
	Thu, 25 Jan 2024 13:54:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C6E10EBAD
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706190893; x=1737726893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IgZpi6AN88QEovev/TATMQ0YL2iVvX/81kECnXt5vNQ=;
 b=lwkd3RCcZ0MyQxpTErm5GXEU5cuvPMtCWWo9IqJBwIWhvDunY04i0p+s
 2e6TfbM2xkJIzh3e999p+evi+XwvaTuM7eQnBtDfRUgCOVml17HEprh0N
 AL5uj0lKM62r/Lcu7a81a/N7PigYtbkyx1UcC0oz+U2s1QGdpiBFAmZKG
 M201dzwJA6rpnFcH/oaMkqFdeP2HrYYIaq+g13kmUYq/UhijN9UvS0kdO
 DZkt4s/P9maF9V94SeewZWZitVVJMk4htGn1/orZOaG+9r0zJijLZB9mO
 WRoeQ9e4DTST351W96cnIIoTSkXX45YMRVfCv1zH7bFZIrsX6AZNvBjD+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399328944"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="399328944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 05:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2366130"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 05:54:52 -0800
Date: Thu, 25 Jan 2024 14:54:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 6/8] lib/intel_multigpu: Add
 xe_multi_fork_foreach_gpu
Message-ID: <20240125135449.kjqwdarmd6eumkx3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-7-kamil.konieczny@linux.intel.com>
 <DS0PR11MB7264ABE771F3BB080E0A3595D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DS0PR11MB7264ABE771F3BB080E0A3595D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
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

Hi Dominik,

On 2024-01-25 at 07:43:35 +0000, Piatkowski, Dominik Karol wrote:
> Hi Kamil,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> > Konieczny
> > Sent: Wednesday, January 24, 2024 9:42 PM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [PATCH i-g-t v2 6/8] lib/intel_multigpu: Add
> > xe_multi_fork_foreach_gpu
> > 
> > Create macro for testing Xe driver in multigpu scenarios with the help of few
> > new multigpu functions. Also while at this, add documentation for public
> > functions and use new helper in existing multi-gpu macro.
> > 
> > v2: corrected description (Kamil), rebased on corrected patches after Dominik
> > review
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_multigpu.c | 94
> > ++++++++++++++++++++++++++++++++++++++++++--
> >  lib/intel_multigpu.h | 12 +++++-
> >  2 files changed, 101 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c index
> > 0e76d8aa3..e631ab0ed 100644
> > --- a/lib/intel_multigpu.c
> > +++ b/lib/intel_multigpu.c
> > @@ -4,10 +4,18 @@
> >   */
> > 
> >  #include "drmtest.h"
> > +#include "i915/gem.h"
> >  #include "igt_core.h"
> >  #include "igt_device_scan.h"
> >  #include "intel_multigpu.h"
> > 
> > +/**
> > + * gem_multigpu_count_class:
> > + * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function counts number of GPU cards with the help of opening all of them.
> > + * Returns: number of GPUs cards found
> > + */
> >  int gem_multigpu_count_class(int class)  {
> >  	int count = 0;
> > @@ -18,7 +26,7 @@ int gem_multigpu_count_class(int class)
> >  	return count;
> >  }
> > 
> > -void gem_require_multigpu(int count)
> > +static void skip_on_sigle_gpu(int count)
> 
> Nitpick: typo
> I guess it should be named "skip_on_single_gpu".
> 

Good point, I missed that, will fix.

> >  {
> >  	struct igt_devices_print_format fmt = {
> >  		.type = IGT_PRINT_SIMPLE,
> > @@ -26,9 +34,6 @@ void gem_require_multigpu(int count)
> >  	};
> >  	int devices;
> > 
> > -	if (igt_device_filter_count() >= count)
> > -		return;
> > -
> 
> As this conditional return was moved to gem_require_multigpu(),
> that function will work correctly. Although, calling skip_on_single_gpu()
> directly will always cause a skip due to always reachable igt_skip.
> I suggest changing igt_skip to igt_skip_on to avoid unexpected behavior
> in the future.

What about changing this into print-only function and moving
skips directly in both functions?

> 
> Additionally, skip_on_single_gpu can be refactored to not take any
> arguments, as we already get the number of gpus present in the system, 
> and taking required count of gpus is not needed (it is always >1).
> The idea is to use igt_skip_on when devices < 2.
> 

It was an optimization, I was thinking about other direction, adding
one more parameter to it and printing:

number of GPUs wanted
what number of GPUs program got
number of GPUs after PCI bus scan

What do you think?

> >  	igt_info("PCI devices available in the system:\n");
> > 
> >  	igt_devices_scan(true);
> > @@ -37,3 +42,84 @@ void gem_require_multigpu(int count)
> > 
> >  	igt_skip("Test requires at least %d GPUs, %d available.\n", count,
> > devices);  }
> > +
> > +/**
> > + * gem_require_multigpu:
> > + * @count: minimum number of GPUs required
> > + *
> > + * Function checks number of filtered GPU cards.
> > + * On error skips and prints available GPUs found on PCI bus.
> > + */
> > +void gem_require_multigpu(int count)
> > +{
> > +	if (igt_device_filter_count() >= count)
> > +		return;
> > +
> > +	skip_on_sigle_gpu(count);
> > +}
> > +
> > +/**
> > + * multigpu_aquire_view:
> > + * @gpus_wanted: minimum number of GPUs required
> > + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function prepares filtered view for GPU cards with given chipset.
> > + * On error skips and prints available GPUs found on PCI bus.
> > + * Returns: number of GPUs found
> > + */
> > +int multigpu_aquire_view(int gpus_wanted, unsigned int chipset) {
> 
> Nitpick: typo
> I guess it should be named "multigpu_acquire_view" (in function name and documentation).
> 

I will fix this,

Regards,
Kamil

> Dominik Karol
> 
> > +	int gpu_count = drm_prepare_filtered_multigpu(chipset);
> > +
> > +	igt_assert(gpus_wanted > 1);
> > +	if (gpu_count < gpus_wanted)
> > +		skip_on_sigle_gpu(gpus_wanted);
> > +
> > +	return gpu_count;
> > +}
> > +
> > +/**
> > + * multigpu_open_another:
> > + * @idx: index of GPU card, starting from 0
> > + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function opens GPU card with drm_open_driver_another(). For i915 it
> > +checks
> > + * if opened card is functional. Skips on errors.
> > + * Returns: opened fd for @idx card
> > + */
> > +int multigpu_open_another(int idx, unsigned int chipset) {
> > +	int fd;
> > +
> > +	igt_assert(idx >= 0);
> > +	fd = drm_open_driver_another(idx, chipset);
> > +
> > +	igt_require(fd != -1);
> > +	if (chipset == DRIVER_INTEL)
> > +		igt_require_gem(fd);
> > +
> > +	return fd;
> > +}
> > +
> > +/**
> > + * multigpu_open_filtered_card:
> > + * @idx: index of GPU card, starting from 0
> > + * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
> > + *
> > + * Function opens GPU card prepared with filtered view. It also checks
> > +if
> > + * opened card agrees with desired chipset or checks if opened card is
> > + * functional. Skips on errors.
> > + * Returns: opened fd for @idx card
> > + */
> > +int multigpu_open_filtered_card(int idx, unsigned int chipset) {
> > +	int fd = drm_open_filtered_card(idx);
> > +
> > +	igt_require(fd != -1);
> > +	if (chipset == DRIVER_XE)
> > +		igt_require_xe(fd);
> > +	else if (chipset == DRIVER_INTEL)
> > +		igt_require_gem(fd);
> > +
> > +	return fd;
> > +}
> > diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h index
> > 0ebc73e4a..0032a619e 100644
> > --- a/lib/intel_multigpu.h
> > +++ b/lib/intel_multigpu.h
> > @@ -12,6 +12,10 @@
> >  void gem_require_multigpu(int count);
> >  int gem_multigpu_count_class(int class);
> > 
> > +int multigpu_aquire_view(int min_gpus_wanted, unsigned int chipset);
> > +int multigpu_open_another(int idx, unsigned int chipset); int
> > +multigpu_open_filtered_card(int idx, unsigned int chipset);
> > +
> >  #define igt_foreach_gpu(fd__, id__) \
> >  	for (int igt_unique(i) = 0, fd__; \
> >  		(fd__ = __drm_open_driver_another(igt_unique(i)++, id__)) >=
> > 0; \ @@ -19,8 +23,14 @@ int gem_multigpu_count_class(int class);
> > 
> >  #define igt_multi_fork_foreach_gpu(__fd, __id) \
> >  	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__id)) \
> > -		for (int __fd = drm_open_driver_another(igt_unique(__i),
> > __id); \
> > +		for (int __fd = multigpu_open_another(igt_unique(__i), __id);
> > \
> >  			__fd >= 0; \
> >  			close(__fd), __fd = -1) \
> > 
> > +#define xe_multi_fork_foreach_gpu(__fd, __gpu_index) \
> > +	igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
> > +		for (int __fd = multigpu_open_filtered_card(__gpu_index,
> > DRIVER_XE); \
> > +			__fd >= 0; \
> > +			drm_close_driver(__fd), __fd = -1) \
> > +
> >  #endif /* __INTEL_MULTIGPU_H */
> > --
> > 2.42.0
> 
