Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48624C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 15:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40B910E4A0;
	Thu, 29 Feb 2024 15:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8MYrmBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5E810E4B1
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709220910; x=1740756910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4qyyyoESQo53/AG4foWlUh0XsmEt2G+ieJGwVrAly4U=;
 b=c8MYrmBnzXTpCV2got74yRPsbgjiYVOvl9Dy+gIIVqHhP/x8JQ4O2/GE
 PCq7CU7G1JUZMn0bxe5WpiFj2Kp0E8NnLYhxNMMwQrcceGmY3EpNuNqUq
 96Z2daGxQT7fZKg8z3Lr5364RdY0r/X2sI1z2qfKuqKG4qH6xOmp0kA6q
 ZuenS3uTT0aAF2XKTy17JCKaPZMy355cDvsD+ZLVaWDKrbnmaOXpUH1CV
 5mRR56QyLfsnPlGloDJ1XSNjrvt8oCB3k9ObalYQc2nMvb1Mf9GhD3PQu
 hA8HRbYlHaW+/JX77E+5eDsTRs39LOrLAsTL3orc6AhUimFvRST0pNoya Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3621234"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3621234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 07:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7766239"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:35:07 -0800
Date: Thu, 29 Feb 2024 16:35:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 2/5] Documentation refactoring part 2
Message-ID: <20240229153504.vx2yxxgeytzb57q3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240229111909.588400-1-katarzyna.piecielska@intel.com>
 <20240229111909.588400-3-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229111909.588400-3-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,

I would like to see a prefix at begin of subject:

[PATCH i-g-t 2/5] tests/intel: Documentation refactoring part 2

On 2024-02-29 at 11:19:06 +0000, Katarzyna Piecielska wrote:
>  Unify documentation for Intel i915 tests that we have by  moving
 ^^
Looks like space (or two?) at begin.

>  common parts to be available for all tests.
-^^
Same here.

> 
>  This is part 2 to make review easier.
- ^^^^^^^^^^^^^^^
Please remove it.

With that fixed:
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

See also one nit below.

Regards,
Kamil

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_ctx_create.c      |  77 ++++++----------
>  tests/intel/gem_ctx_exec.c        |  51 +++--------
>  tests/intel/gem_ctx_isolation.c   |  43 ++-------
>  tests/intel/gem_ctx_param.c       | 144 ++++++------------------------
>  tests/intel/gem_ctx_persistence.c | 117 ++----------------------
>  tests/intel/gem_ctx_shared.c      |  42 ++-------
>  tests/intel/gem_eio.c             | 133 ++-------------------------
>  tests/intel/gem_exec_balancer.c   | 139 ++--------------------------
>  8 files changed, 99 insertions(+), 647 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
> index 6d0877954..4fe383e02 100644
> --- a/tests/intel/gem_ctx_create.c
> +++ b/tests/intel/gem_ctx_create.c
> @@ -38,91 +38,64 @@
>  /**
>   * TEST: gem ctx create
>   * Description: Test the context create ioctls
> - *
> - * SUBTEST: active
> - * Description:
> - *   For each engine calculate the average performance of context creation execution and
> - *   exercise context reclaim
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context
> + * Sub-category: Context
> + * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> + * SUBTEST: active
> + * Description: For each engine calculate the average performance of context
> + *		creation execution and exercise context reclaim
> + *
>   * SUBTEST: active-all
> - * Description: Calculate the average performance of context creation and it's execution using all engines
> - * Feature: context
> - * Run type: FULL
> + * Description: Calculate the average performance of context creation and it's
> + *		execution using all engines
>   *
>   * SUBTEST: basic
> - * Category: Infrastructure
>   * Description: Test random context creation
> - * Feature: context
> - * Functionality: context management
>   * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-files
> - * Category: Infrastructure
>   * Description: Exercise implicit per-fd context creation
> - * Feature: context
> - * Functionality: context management
>   * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: ext-param
>   * Description: Verify valid and invalid context extensions
> - * Feature: context
> - * Run type: FULL
>   *
>   * SUBTEST: files
>   * Description: Exercise implicit per-fd context creation on 1 CPU for long duration
> - * Feature: context
> - * Run type: FULL
>   *
>   * SUBTEST: forked-active
> - * Description:
> - *   For each engine calculate the average performance of context creation and execution on
> - *   multiple parallel processes
> - * Feature: context
> - * Run type: FULL
> + * Description: For each engine calculate the average performance of context
> + *		creation and execution on multiple parallel processes
>   *
>   * SUBTEST: forked-active-all
> - * Description:
> - *   Calculate the average performance of context creation and it's execution using all engines
> - *   on multiple parallel processes
> - * Feature: context
> - * Run type: FULL
> + * Description: Calculate the average performance of context creation and it's
> + *		execution using all engines on multiple parallel processes
>   *
>   * SUBTEST: forked-files
> - * Description: Exercise implicit per-fd context creation on all CPUs for long duration
> - * Feature: context
> - * Run type: FULL
> + * Description: Exercise implicit per-fd context creation on all CPUs for long
> + *		duration
>   *
>   * SUBTEST: hog
> - * Description:
> - *   For each engine calculate the average performance of context creation and execution while
> - *   all other engines are hogging the resources
> - * Feature: context
> - * Run type: FULL
> + * Description: For each engine calculate the average performance of context
> + *		creation and execution while all other engines are hogging the
> + *		resources
>   *
>   * SUBTEST: iris-pipeline
>   * Description: Set, validate and execute particular context params
> - * Feature: context
> - * Run type: FULL
>   *
>   * SUBTEST: maximum-mem
> - * Description:
> - *   Create contexts upto available RAM size, calculate the average performance of their
> - *   execution on multiple parallel processes
> - * Feature: context
> - * Run type: FULL
> + * Description: Create contexts upto available RAM size, calculate the average
> + *		performance of their execution on multiple parallel processes
>   *
>   * SUBTEST: maximum-swap
> - * Description:
> - *   Create contexts upto available RAM+SWAP size, calculate the average performance of their
> - *   execution on multiple parallel processes
> - * Feature: context
> - * Run type: FULL
> + * Description: Create contexts upto available RAM+SWAP size, calculate the
> + *		average performance of their execution on multiple parallel
> + *		processes
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the context create ioctls");
> diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
> index 4376397a2..556b21651 100644
> --- a/tests/intel/gem_ctx_exec.c
> +++ b/tests/intel/gem_ctx_exec.c
> @@ -50,61 +50,38 @@
>  /**
>   * TEST: gem ctx exec
>   * Description: Test context batch buffer execution.
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: execbuf
> + * Sub-category: Context
> + * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: basic
> - * Category: Infrastructure
>   * Description: Check the basic context batch buffer execution.
> - * Feature: context
> - * Functionality: command submission
>   * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-close-race
> - * Category: Infrastructure
> - * Description: Race the execution and interrupt handlers along a context, while closing it at a random time.
> - * Feature: context
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Race the execution and interrupt handlers along a context,
> + *		while closing it at a random time.
>   *
>   * SUBTEST: basic-invalid-context
> - * Category: Infrastructure
>   * Description: Verify that execbuf with invalid context fails.
> - * Feature: context
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-nohangcheck
> - * Category: Server
> - * Description: Verify that contexts are automatically shotdown on close, if hangchecking is disabled.
> - * Feature: context
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Verify that contexts are automatically shotdown on close,
> + *		if hangchecking is disabled.
>   *
>   * SUBTEST: basic-norecovery
> - * Category: Server
> - * Description: Check the status of context after a hang by setting and unsetting the RECOVERABLE.
> - * Feature: context
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Check the status of context after a hang by setting and
> + *		unsetting the RECOVERABLE.
>   *
>   * SUBTEST: eviction
>   * Description: Check maximum number of buffers it can evict for a context.
> - * Feature: context
> - * Run type: FULL
>   *
>   * SUBTEST: reset-pin-leak
> - * Description: Check if the kernel doesn't leak the vma pin_count for the last context on reset.
> - * Feature: context
> - * Run type: FULL
> + * Description: Check if the kernel doesn't leak the vma pin_count for the last
> + *		context on reset.
>   */
>  
>  IGT_TEST_DESCRIPTION("Test context batch buffer execution.");
> diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
> index d50a90597..89c023e09 100644
> --- a/tests/intel/gem_ctx_isolation.c
> +++ b/tests/intel/gem_ctx_isolation.c
> @@ -28,62 +28,31 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem ctx isolation
> - * Run type: FULL
> - *
> - * SUBTEST: clean
>   * Category: Infrastructure
>   * Feature: context
> - * Functionality: security
> - * Sub-category: HW
> + * Functionality: priv/non-priv registers
> + * Sub-category: Security
>   * Test category: GEM_Legacy
> + * Run type: FULL
> + *
> + * SUBTEST: clean
>   *
>   * SUBTEST: dirty-create
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: security
> - * Sub-category: HW
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: dirty-switch
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: security
> - * Sub-category: HW
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: nonpriv
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: security
> - * Sub-category: HW
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: nonpriv-switch
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: security
> - * Sub-category: HW
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: preservation
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: security
> - * Sub-category: HW
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: preservation-S3
> - * Feature: context
>   *
>   * SUBTEST: preservation-S4
> - * Feature: context
>   *
>   * SUBTEST: preservation-reset
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: security
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + *
>   */
>  
>  /* MAX_REG must be greater than the maximum register address. */
> diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
> index 9b44c86a0..c6fa31875 100644
> --- a/tests/intel/gem_ctx_param.c
> +++ b/tests/intel/gem_ctx_param.c
> @@ -33,166 +33,80 @@
>  /**
>   * TEST: gem ctx param
>   * Description: Basic test for context set/get param input validation.
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: context
> + * Sub-category: uapi
> + * Test category: GEM_Legacy
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> - * Category: Infrastructure
>   * Description: Basic test for context get/set param ioctls using valid context
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-default
> - * Category: Infrastructure
>   * Description: Basic test for context get/set param ioctls using default context
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: get-priority-new-ctx
> - * Category: Infrastructure
> - * Description:
> - *   Test performed with context param set to priority.
> - *   Verify that priority is default for newly created context
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Test performed with context param set to priority. Verify that
> + *		priority is default for newly created context
>   *
>   * SUBTEST: invalid-ctx-get
> - * Category: Infrastructure
> - * Description: Verify that context get param ioctl using invalid context returns relevant error
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Verify that context get param ioctl using invalid context
> + *		returns relevant error
>   *
>   * SUBTEST: invalid-ctx-set
> - * Category: Infrastructure
> - * Description: Verify that context set param ioctl using invalid context returns relevant error
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Verify that context set param ioctl using invalid context
> + *		returns relevant error
>   *
>   * SUBTEST: invalid-get-engines
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-get-no-zeromap
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-get-ringsize
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-param-get
> - * Category: Infrastructure
> - * Description: Checks that fetching context parameters using an unused param value is erroneous
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Checks that fetching context parameters using an unused param
> + *		value is erroneous
>   *
>   * SUBTEST: invalid-param-set
> - * Category: Infrastructure
> - * Description: Checks that setting context parameters using an unused param value is erroneous
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Checks that setting context parameters using an unused param
> + *		value is erroneous
>   *
>   * SUBTEST: invalid-set-no-zeromap
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-set-ringsize
> - * Category: Infrastructure
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-size-get
> - * Category: Infrastructure
> - * Description: Verify that context get param ioctl returns valid size for valid context
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Verify that context get param ioctl returns valid size for
> + *		valid context
>   *
>   * SUBTEST: invalid-size-set
> - * Category: Infrastructure
> - * Description: Verify that context set param ioctl using invalid size returns relevant error
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Verify that context set param ioctl using invalid size returns
> + *		relevant error
>   *
>   * SUBTEST: non-root-set
> - * Category: Infrastructure
> - * Description: Verify that context set param ioctl returns relevant error in non root mode
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Verify that context set param ioctl returns relevant error in
> + *		non root mode
>   *
>   * SUBTEST: root-set
> - * Category: Infrastructure
>   * Description: Verify that context set param ioctl works fine in root mode
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: set-priority-invalid-size
> - * Category: Infrastructure
> - * Description:
> - *   Test performed with context param set to priority.
> - *   Verify that relevant error is returned on setting invalid ctx size with default priority
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Test performed with context param set to priority. Verify that
> + *		relevant error is returned on setting invalid ctx size with
> + *		default priority
>   *
>   * SUBTEST: set-priority-not-supported
> - * Description:
> - *   Verify that context set param ioctl returns relevant error if driver doesn't supports
> - *   assigning custom priorities from userspace
> - * Feature: context, no-set-priority
> + * Description: Verify that context set param ioctl returns relevant error if
> + *		driver doesn't supports assigning custom priorities from
> + *		userspace
>   *
>   * SUBTEST: set-priority-range
> - * Category: Infrastructure
> - * Description:
> - *   Test performed with context param set to priority.
> - *   Change priority range to test value overflow
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Test performed with context param set to priority. Change
> + *		priority range to test value overflow
>   *
>   * SUBTEST: vm
> - * Category: Infrastructure
>   * Description: Tests that multiple contexts can share the same VMA
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic test for context set/get param input validation.");
> diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
> index c6e2c5d77..3f10c0fa3 100644
> --- a/tests/intel/gem_ctx_persistence.c
> +++ b/tests/intel/gem_ctx_persistence.c
> @@ -48,183 +48,76 @@
>  /**
>   * TEST: gem ctx persistence
>   * Feature: context
> - * Run type: FULL
> - *
> - * SUBTEST: engines-cleanup
>   * Category: Server
> - * Functionality: security
> + * Functionality: context
>   * Sub-category: Compute
>   * Test category: GEM_Legacy
> + * Run type: FULL
> + *
> + * SUBTEST: engines-cleanup
>   *
>   * SUBTEST: engines-hang
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-hostile
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-hostile-preempt
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-mixed
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-mixed-process
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-persistence
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-queued
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: file
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: hang
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: heartbeat-close
>   *
>   * SUBTEST: heartbeat-hang
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: heartbeat-hostile
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: heartbeat-many
>   *
>   * SUBTEST: heartbeat-stop
>   *
>   * SUBTEST: hostile
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: idempotent
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-cleanup
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-hang
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-hostile
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-hostile-preempt
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-mixed
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-mixed-process
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-persistence
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-queued
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: many-contexts
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: process
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: processes
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: saturated-hostile
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: saturated-hostile-nopreempt
>   *
>   * SUBTEST: smoketest
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: userptr
> - * Category: Server
> - * Functionality: security
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> + *
>   */
>  
>  #define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
> diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
> index fd429306e..8b045e20a 100644
> --- a/tests/intel/gem_ctx_shared.c
> +++ b/tests/intel/gem_ctx_shared.c
> @@ -50,71 +50,41 @@
>  /**
>   * TEST: gem ctx shared
>   * Description: Test shared contexts.
> + * Category: Desktop client
> + * Feature: context
> + * Functionality: shared contex
> + * Sub-category: Context
> + * Test category: GEM_Legacy
>   * Run type: FULL
>   *
>   * SUBTEST: Q-in-order
> - * Feature: context
>   *
>   * SUBTEST: Q-independent
> - * Feature: context
>   *
>   * SUBTEST: Q-out-order
> - * Feature: context
>   *
>   * SUBTEST: Q-promotion
> - * Feature: context
>   *
>   * SUBTEST: Q-smoketest
> - * Feature: context
>   *
>   * SUBTEST: Q-smoketest-all
> - * Feature: context
>   *
>   * SUBTEST: create-shared-gtt
> - * Category: Desktop client
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: detached-shared-gtt
> - * Category: Desktop client
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: disjoint-timelines
> - * Category: Desktop client
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: exec-shared-gtt
> - * Category: Desktop client
> - * Feature: context
> - * Functionality: context management
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: exec-single-timeline
> - * Category: Desktop client
> - * Feature: context
> - * Functionality: context management
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: exhaust-shared-gtt
> - * Feature: context
>   *
>   * SUBTEST: exhaust-shared-gtt-lrc
> - * Feature: context
>   *
>   * SUBTEST: single-timeline
> - * Category: Desktop client
> - * Feature: context
> - * Functionality: context management
> - * Test category: GEM_Legacy
> + *
>   */
>  
>  #define LO 0
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 99891ad15..d6d12bd08 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -56,197 +56,78 @@
>  /**
>   * TEST: gem eio
>   * Description: Test that specific ioctls report a wedged GPU (EIO).
> - * Run type: FULL
> - *
> - * SUBTEST: banned
>   * Category: Infrastructure
>   * Feature: reset
>   * Functionality: reset
> - * Sub-category: i915
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
> + * Run type: FULL
> + *
> + * SUBTEST: banned
>   *
>   * SUBTEST: context-create
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: create
> - * Category: Infrastructure
>   * Description: Validate i915_gem_create_ioctl, while gpu is wedged for fb scanout.
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext
> - * Category: Infrastructure
> - * Description:
> - *   Validate i915_gem_create_ext_ioctl and checks if returns clear backing store while gpu is
> - *   wedged for fb scanout.
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Validate i915_gem_create_ext_ioctl and checks if returns clear
> + *		backing store while gpu is wedged for fb scanout.
>   *
>   * SUBTEST: execbuf
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: hibernate
>   * Description: Test that specific ioctls report a wedged GPU (EIO) during suspend
> - * Feature: hibernate, reset, suspend
> - * Test category: suspend
>   *
>   * SUBTEST: in-flight-10ms
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-1us
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-10ms
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-1us
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-immediate
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-external
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-immediate
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-10ms
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-1us
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-immediate
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-suspend
>   * Description: Test that specific ioctls report a wedged GPU (EIO) during suspend
>   * Feature: reset, suspend
> - * Test category: suspend
>   *
>   * SUBTEST: kms
>   * Feature: kms_gem_interop, reset
>   *
>   * SUBTEST: reset-stress
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend
>   * Description: Test that specific ioctls report a wedged GPU (EIO) during suspend
>   * Feature: reset, suspend
> - * Test category: suspend
>   *
>   * SUBTEST: throttle
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: unwedge-stress
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-10ms
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-1us
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-immediate
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-10ms
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-1us
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-immediate
> - * Category: Infrastructure
> - * Feature: reset
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Test that specific ioctls report a wedged GPU (EIO).");
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index 9190fc238..efa875889 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -41,219 +41,94 @@
>  /**
>   * TEST: gem exec balancer
>   * Description: Exercise in-kernel load-balancing
> + * Category: Desktop \ Server
> + * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: CMD submission
> + * Test category: Media & Compute
>   * Run type: FULL
>   *
>   * SUBTEST: bonded-chain
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: bonded-dual
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: bonded-false-hang
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: bonded-pair
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: bonded-semaphore
>   * Feature: cmd_submission, media_scalability, multictx
>   *
>   * SUBTEST: bonded-sync
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: bonded-true-hang
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: busy
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: fairslice
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: full
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability, multictx

Why this is removed here?

> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-late
> - * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-late-pulse
> - * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-pulse
> - * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: hang
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: hog
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: indices
> - * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: individual
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-balancer
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bonds
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: nohangcheck
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: noheartbeat
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: nop
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-balancer
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-bb-first
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-contexts
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-dmabuf-import-out-fence
> - * Description: Regression test to check that dmabuf imported sync file can handle fence array
> - * Feature: cmd_submission, media_scalability
> + * Description: Regression test to check that dmabuf imported sync file can
> + *		handle fence array
>   *
>   * SUBTEST: parallel-keep-in-fence
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-keep-submit-fence
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-ordering
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-out-fence
> - * Category: Desktop client
> - * Feature: cmd_submission, media_scalability
> - * Functionality: command submission
> - * Sub-category: Media
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: persistence
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: semaphore
> - * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: sequential
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: sliced
> - * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: smoke
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: waits
> - * Category: Desktop \ Server
> - * Feature: cmd_submission, media_scalability
> - * Functionality: load balancing
> - * Sub-category: Media & Compute
> - * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
> -- 
> 2.34.1
> 
