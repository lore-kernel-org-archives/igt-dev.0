Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685C1FCEE91
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 11:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E51E10E744;
	Wed, 25 Feb 2026 11:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdA4a7f7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAA710E746
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772020123; x=1803556123;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aqMyCoMd520H373HBl6bT75+uypTd1ONaiXVQolc98k=;
 b=FdA4a7f7HZ1Jy8gXyuyXjMSz2rCQDTWNgdRGP3X+hRSxwOJGb4XT95tC
 EonZ4bl6pWFAbodqQAJIbWJGdFx8Iip4uf5newjP1ESa546uA7WgtXJzb
 xBABCDAescrPhjiwWyPRN9gthh0nfNicU6e7IaFkcZomrZbNiOUTe0PUI
 W7rhkL4DMUIodPxTf5cCHyi8CInRBT2a99oGXFyUPrLrXCf4qXyxw1xWT
 +aNKqGXnokg+QNLD9bHjmscm0teGXw9IsmckbMUixrza3R4WpiJKSD240
 HzfPkjc/0RrR5HYLxQfEdwJ4mcqxHOH+1HKuTXlCRurO2zQcNqhBthv1g A==;
X-CSE-ConnectionGUID: a3B8lz3iTO+go+nIJK0KJA==
X-CSE-MsgGUID: 4810v/4lQrqS/QDfclOKjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="60628211"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="60628211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:48:43 -0800
X-CSE-ConnectionGUID: t6jTgPNQSgmiAED81qcNfg==
X-CSE-MsgGUID: 3EADPl5fSbyeI8QZXJlowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220816362"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 03:48:42 -0800
Date: Wed, 25 Feb 2026 12:48:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] xe_exec_balancer: Report skip when test is unable
 to run
Message-ID: <20260225114839.wj2lu5nt5aucxrdf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260224211612.2944788-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224211612.2944788-2-matthew.d.roper@intel.com>
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

Hi Matt,
On 2026-02-24 at 13:16:13 -0800, Matt Roper wrote:

please use prefix in subject:

[PATCH i-g-t] tests/intel/xe_exec_balancer: Report skip when test is unable to run

This could be done at merge as it is LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. please also reply to Xe FULL fail with one skip from this.

> The xe_exec_balancer tests require two engines of the same class to be
> able to execute.  Many Intel platforms today do not have two engines of
> any class so the test bails out and does not do anything, however it
> returns a 'pass' result in this case which is misleading since the test
> was unable to exercise the relevant kernel/hardware functionality.
> Adjust the subtests to track whether they found engines capable of
> performing the testing; if not, return a 'skip' result that more
> accurately reflects that nothing was tested.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  tests/intel/xe_exec_balancer.c | 178 +++++++++++++++++++++++----------
>  1 file changed, 124 insertions(+), 54 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 98e09961e..9cd641b4e 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -32,7 +32,7 @@
>   *	of a class simultaneously
>   * Test category: functionality test
>   */
> -static void test_all_active(int fd, int gt, int class)
> +static bool test_all_active(int fd, int gt, int class)
>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> @@ -58,7 +58,7 @@ static void test_all_active(int fd, int gt, int class)
>  
>  	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	if (num_placements < 2)
> -		return;
> +		return false;
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * num_placements;
> @@ -110,6 +110,8 @@ static void test_all_active(int fd, int gt, int class)
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> +
> +	return true;
>  }
>  
>  #define MAX_N_EXEC_QUEUES	16
> @@ -156,7 +158,7 @@ static void test_all_active(int fd, int gt, int class)
>   * @parallel-userptr-invalidate:	parallel userptr invalidate
>   * @parallel-userptr-invalidate-race:	parallel userptr invalidate racy
>   */
> -static void
> +static bool
>  test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	  unsigned int flags)
>  {
> @@ -186,7 +188,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  
>  	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	if (num_placements < 2)
> -		return;
> +		return false;
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
> @@ -326,6 +328,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		free(data);
>  	}
>  	xe_vm_destroy(fd, vm);
> +
> +	return true;
>  }
>  
>  /**
> @@ -365,7 +369,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   * @parallel-userptr-invalidate-race:	parallel userptr invalidate racy
>   */
>  
> -static void
> +static bool
>  test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	unsigned int flags)
>  {
> @@ -399,7 +403,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  
>  	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	if (num_placements < 2)
> -		return;
> +		return false;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
> @@ -557,6 +561,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		free(data);
>  	}
>  	xe_vm_destroy(fd, vm);
> +
> +	return true;
>  }
>  
>  
> @@ -591,76 +597,140 @@ int igt_main()
>  	igt_fixture()
>  		fd = drm_open_driver(DRIVER_XE);
>  
> -	igt_subtest("virtual-all-active")
> -		xe_for_each_gt(fd, gt)
> +	igt_subtest("virtual-all-active") {
> +		bool has_necessary_engines = false;
> +
> +		xe_for_each_gt(fd, gt) {
>  			xe_for_each_engine_class(class)
> -				test_all_active(fd, gt, class);
> +				has_necessary_engines |=
> +					test_all_active(fd, gt, class);
> +		}
> +		igt_require(has_necessary_engines);
> +	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -		igt_subtest_f("once-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +		igt_subtest_f("once-%s", s->name) {
> +			bool has_necessary_engines = false;
> +
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_exec(fd, gt, class, 1, 1,
> -						  s->flags);
> +					has_necessary_engines |=
> +						test_exec(fd, gt, class, 1, 1, s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
> +
> +		igt_subtest_f("twice-%s", s->name) {
> +			bool has_necessary_engines = false;
>  
> -		igt_subtest_f("twice-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_exec(fd, gt, class, 1, 2,
> -						  s->flags);
> +					has_necessary_engines |=
> +						test_exec(fd, gt, class, 1, 2, s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
> +
> +		igt_subtest_f("many-%s", s->name) {
> +			bool has_necessary_engines = false;
>  
> -		igt_subtest_f("many-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_exec(fd, gt, class, 1,
> -						  s->flags & (REBIND | INVALIDATE) ?
> -						  64 : 1024,
> -						  s->flags);
> +					has_necessary_engines |=
> +						test_exec(fd, gt, class, 1,
> +							  s->flags & (REBIND | INVALIDATE) ?
> +							  64 : 1024,
> +							  s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
>  
> -		igt_subtest_f("many-execqueues-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +		igt_subtest_f("many-execqueues-%s", s->name) {
> +			bool has_necessary_engines = false;
> +
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_exec(fd, gt, class, 16,
> -						  s->flags & (REBIND | INVALIDATE) ?
> -						  64 : 1024,
> -						  s->flags);
> +					has_necessary_engines |=
> +						test_exec(fd, gt, class, 16,
> +							  s->flags & (REBIND | INVALIDATE) ?
> +							  64 : 1024,
> +							  s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
> +
> +		igt_subtest_f("no-exec-%s", s->name) {
> +			bool has_necessary_engines = false;
>  
> -		igt_subtest_f("no-exec-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_exec(fd, gt, class, 1, 0,
> -						  s->flags);
> +					has_necessary_engines |=
> +						test_exec(fd, gt, class, 1, 0,
> +							  s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
>  
> -		igt_subtest_f("once-cm-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +		igt_subtest_f("once-cm-%s", s->name) {
> +			bool has_necessary_engines = false;
> +
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_cm(fd, gt, class, 1, 1, s->flags);
> +					has_necessary_engines |=
> +						test_cm(fd, gt, class, 1, 1, s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
> +
> +		igt_subtest_f("twice-cm-%s", s->name) {
> +			bool has_necessary_engines = false;
>  
> -		igt_subtest_f("twice-cm-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_cm(fd, gt, class, 1, 2, s->flags);
> +					has_necessary_engines |=
> +						test_cm(fd, gt, class, 1, 2, s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
> +
> +		igt_subtest_f("many-cm-%s", s->name) {
> +			bool has_necessary_engines = false;
>  
> -		igt_subtest_f("many-cm-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_cm(fd, gt, class, 1,
> -						s->flags & (REBIND | INVALIDATE) ?
> -						64 : 1024,
> -						s->flags);
> +					has_necessary_engines |=
> +						test_cm(fd, gt, class, 1,
> +							s->flags & (REBIND | INVALIDATE) ?
> +							64 : 1024,
> +							s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
>  
> -		igt_subtest_f("many-execqueues-cm-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +		igt_subtest_f("many-execqueues-cm-%s", s->name) {
> +			bool has_necessary_engines = false;
> +
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_cm(fd, gt, class, 16,
> -						s->flags & (REBIND | INVALIDATE) ?
> -						64 : 1024,
> -						s->flags);
> +					has_necessary_engines |=
> +						test_cm(fd, gt, class, 16,
> +							s->flags & (REBIND | INVALIDATE) ?
> +							64 : 1024,
> +							s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
> +
> +		igt_subtest_f("no-exec-cm-%s", s->name) {
> +			bool has_necessary_engines = false;
>  
> -		igt_subtest_f("no-exec-cm-%s", s->name)
> -			xe_for_each_gt(fd, gt)
> +			xe_for_each_gt(fd, gt) {
>  				xe_for_each_engine_class(class)
> -					test_cm(fd, gt, class, 1, 0, s->flags);
> +					has_necessary_engines |=
> +						test_cm(fd, gt, class, 1, 0, s->flags);
> +			}
> +			igt_require(has_necessary_engines);
> +		}
>  	}
>  
>  	igt_fixture()
> -- 
> 2.53.0
> 
