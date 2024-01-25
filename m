Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15865C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 13:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24B410E24A;
	Thu, 25 Jan 2024 13:57:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F21C10E24A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 13:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706191065; x=1737727065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vyfw3ztkWyTogtiJFCMRh0NA5F3GCgVw+dBpHXKKp1c=;
 b=JhRKWJw8+fbc+3frQXP6zvTX7ke1zVvjzKI8N1PBo1aEh6/5/WO2iGzz
 7jpAEvdNpA84zpfzdZi29qD/WRWSVZoPP1HQ+bHLSCEumNUTa0d/NV8gc
 x3rvz8FHnM2z1mcKDmVOe9fdf6FQyEtTs1vrqmrEnGI3BiB6w/Ip0yoeA
 hIDlLi9LFoC1iZOnYJuRtyoCUGq2R4B9fisDuZ0bZHcqMWa4Rp+MMmaAi
 Xk/NHGBgL06GUq1xI0u4LKNSDda4Sa1j2XXJH8HPGx1GFRX8YyByh0XFA
 rlDDYrs+5mgap1xUGT8GhYZUj5tkiJ2A+EB1G2v5iji9uAWJ5FELWuNA3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="2007438"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2007438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 05:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2250063"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 05:57:43 -0800
Date: Thu, 25 Jan 2024 14:57:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t v2 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Message-ID: <20240125135740.me3nm3btlqbhg5ml@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-6-kamil.konieczny@linux.intel.com>
 <DS0PR11MB72649E19DAD72439CB755B89D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB72649E19DAD72439CB755B89D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Dominik,
On 2024-01-25 at 07:14:47 +0000, Piatkowski, Dominik Karol wrote:
> Hi Kamil,
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Wednesday, January 24, 2024 9:42 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>; Chris
> > Wilson <chris.p.wilson@linux.intel.com>; Kamil Konieczny
> > <kamil.konieczny@linux.intel.com>
> > Subject: [PATCH i-g-t v2 5/8] lib/intel_multigpu: Introduced
> > gem_multigpu_count_class and igt_multi_fork_foreach_gpu
> > 
> > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > 
> > Introduced gem_multigpu_count_class function that returns an actual
> > number of GPUs present in system, which allows for writing multi-GPU test
> > scenarios that does not require --device
> > pci:vendor=intel,device=discrete,card=all
> > to run as intended. Based on patch by Chris Wilson.
> > 
> > Introduced igt_multi_fork_foreach_gpu macro that helps with writing multi-
> > GPU test scenarios in idiomatic form:
> > 
> > igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
> > 	test_function(i915);
> > igt_waitchildren();
> > 
> > Signed-off-by: Dominik Karol Piątkowski
> > <dominik.karol.piatkowski@intel.com>
> > Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_multigpu.c | 13 ++++++++++++-  lib/intel_multigpu.h | 15
> > +++++++++++++++
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c index
> > 988c20033..0e76d8aa3 100644
> > --- a/lib/intel_multigpu.c
> > +++ b/lib/intel_multigpu.c
> > @@ -3,9 +3,20 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> > 
> > -#include "intel_multigpu.h"
> > +#include "drmtest.h"
> >  #include "igt_core.h"
> >  #include "igt_device_scan.h"
> > +#include "intel_multigpu.h"
> 
> A very small nitpick: in 4/8 #include "intel_multigpu.h" is added
> a line before igt_core.h. In here (5/8), it is moved down to
> maintain alphabetical order. Maybe that's a good idea to put it
> there in 4/8 and don't "fix" it in 5/8?
> Otherwise, 1/8, 2/8, 4/8 and 5/8 LGTM, but I think I can't review them,
> as they are originally my patches. Please correct me if I'm wrong.
> 
> Dominik Karol
> 

Thank you for spotting this, I will fix it. You are right,
someone else should do a review,

Regards,
Kamil

> > +
> > +int gem_multigpu_count_class(int class) {
> > +	int count = 0;
> > +
> > +	igt_foreach_gpu(fd, class)
> > +		count++;
> > +
> > +	return count;
> > +}
> > 
> >  void gem_require_multigpu(int count)
> >  {
> > diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h index
> > 98dc5a4ce..0ebc73e4a 100644
> > --- a/lib/intel_multigpu.h
> > +++ b/lib/intel_multigpu.h
> > @@ -6,6 +6,21 @@
> >  #ifndef __INTEL_MULTIGPU_H
> >  #define __INTEL_MULTIGPU_H
> > 
> > +#include "drmtest.h"
> > +#include "igt_core.h"
> > +
> >  void gem_require_multigpu(int count);
> > +int gem_multigpu_count_class(int class);
> > +
> > +#define igt_foreach_gpu(fd__, id__) \
> > +	for (int igt_unique(i) = 0, fd__; \
> > +		(fd__ = __drm_open_driver_another(igt_unique(i)++, id__)) >=
> > 0; \
> > +		close(fd__))
> > +
> > +#define igt_multi_fork_foreach_gpu(__fd, __id) \
> > +	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__id)) \
> > +		for (int __fd = drm_open_driver_another(igt_unique(__i),
> > __id); \
> > +			__fd >= 0; \
> > +			close(__fd), __fd = -1) \
> > 
> >  #endif /* __INTEL_MULTIGPU_H */
> > --
> > 2.42.0
> 
