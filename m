Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33979C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 14:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A939810E4A7;
	Wed, 20 Mar 2024 14:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhBzRRzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A20010E4A7
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710946576; x=1742482576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oO6pZfhzNtTsMtRrNbwzplNMYkgTh9fv9aitOHQhQHk=;
 b=bhBzRRzEbZ4Xbh5sMhpPaVGzlxBTPDZLb0qBHuE+7czsx1cGdipRlHuP
 o0xF2UPwidtf+nhGBMmbUYYrgj50zWSp285d3BzgK5n/ISz55svzcm2Sh
 BtAP04PAgOCDNJK2FAC0J12/Smml8XWO650SOIqkZOlFK5oPhTkamLbzw
 ShxFsq29179l87IM9hqMJrwmmNxKVw7datGEvIv/2fixIjsxJ0dPbPrtK
 JzGMaUONv6EBvZbyqRpocf3N2gbBW2jD0xyySHsds99pAHxAA3RdENI1D
 HNb/UYIGJnqrUkwPZqkK4p7ve+6llNJ9JyyEQhW4rKm+Kp5edefpzTjpY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="8821409"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="8821409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 07:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14244376"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 07:56:05 -0700
Date: Wed, 20 Mar 2024 15:55:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v13 5/5] tests/intel/gem_exec_gttfill: simplify
 multiGPU subtest
Message-ID: <20240320145544.cvrnvke6745gvder@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
 <20240318132624.110746-6-kamil.konieczny@linux.intel.com>
 <2212029.vXnMlVU4IS@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2212029.vXnMlVU4IS@jkrzyszt-mobl2.ger.corp.intel.com>
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

On 2024-03-19 at 10:36:49 +0100, Janusz Krzysztofik wrote:
> Hi Kamil,
> 
> The series now looks good to me, however, I still have one doubt.
> 
> On Monday, 18 March 2024 14:26:23 CET Kamil Konieczny wrote:
> > Simplify multi-GPU subtest with the help of new multigpu library.
> > 
> > v10: remove igt_require_multigpu() as it checks filters but we
> >   want to use legacy opens (Kamil), correct Cc name (Zbigniew)
> > 
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Cc: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel/gem_exec_gttfill.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
> > index b1063437b..1eb7325bb 100644
> > --- a/tests/intel/gem_exec_gttfill.c
> > +++ b/tests/intel/gem_exec_gttfill.c
> > @@ -24,8 +24,8 @@
> >  #include "i915/gem.h"
> >  #include "i915/gem_create.h"
> >  #include "igt.h"
> > -#include "igt_device_scan.h"
> >  #include "igt_rand.h"
> > +#include "igt_multigpu.h"
> >  /**
> >   * TEST: gem exec gttfill
> >   * Description: Fill the GTT with batches.
> > @@ -251,7 +251,7 @@ igt_main
> >  {
> >  	const struct intel_execution_engine2 *e;
> >  	const intel_ctx_t *ctx;
> > -	int i915 = -1, gpu_count;
> > +	int i915 = -1;
> >  
> >  	igt_fixture {
> >  		i915 = drm_open_driver(DRIVER_INTEL);
> > @@ -285,17 +285,11 @@ igt_main
> >  	igt_fixture {
> >  		igt_stop_hang_detector();
> >  		intel_ctx_destroy(i915, ctx);
> > -		// prepare multigpu tests
> > -		gpu_count = igt_device_filter_count();
> >  	}
> >  
> >  	igt_subtest("multigpu-basic") { /* run on two or more discrete cards */
> > -		igt_require(gpu_count > 1);
> > -		igt_multi_fork(child, gpu_count) {
> > -			int g_fd;
> > +		igt_multi_fork_foreach_gpu(g_fd, gpu_idx, DRIVER_INTEL) {
> >  			// prepare
> > -			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
> > -			igt_assert(g_fd >= 0);
> 
> Since igt_multi_fork_foreach_gpu() now calls multigpu_open_another() which 
> introduces igt_require_gem() into the processing path, you are effectively 
> changing prerequisites before calling intel_ctx_create_all_physical().  Two 
> questions arise:
> 1) Was that missing requirement for GEM on Intel intentional here, or was that 
>    a bug which you are now fixing while being at it?

Looks like a bug in multigpu subtest, there is igt_require_gem() in fixture
in beginning of igt_main().

> 2) Do we expect all future users of igt_multi_fork_foreach_gpu() to always 
>    require GEM on Intel?  If you think so then can you please explain why?

igt_require_gem() is a way to idle GPU and reset it to defaults on i915.

> 
> Wouldn't igt_multi_fork_foreach_gpu() be more versatile if it called 
> drm_open_driver_another() instead, without that skip on no GEM?  Wouldn't it 
> be more clear if tests were explicitly taking care as needed of such scenario 
> specific prerequisites?
> 

You are right, it will be better, I will drop multigpu_open_another(),
that way igt_require_gem() should be used at places where test would need it.

Regards,
Kamil

> If you still see benefits from using multigpu_open_another() here then could 
> we please plan for introducing two variants of igt_multi_fork_foreach_gpu(), 
> one that doesn't skip and the other that skips on no GEM, unless you are sure 
> we don't need the former?  Maybe the latter could be implemented as a wrapper 
> around the former, while the opposite seems not doable.
> 
> Thanks,
> Janusz
> 
> >  			ctx = intel_ctx_create_all_physical(g_fd);
> >  			igt_fork_hang_detector(g_fd);
> >  			// subtest
> > @@ -303,7 +297,6 @@ igt_main
> >  			// release resources
> >  			igt_stop_hang_detector();
> >  			intel_ctx_destroy(g_fd, ctx);
> > -			drm_close_driver(g_fd);
> >  		}
> >  
> >  		igt_waitchildren();
> > 
> 
> 
> 
> 
