Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77FAC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 11:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E3A10E331;
	Mon, 13 Jul 2026 11:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEhCCxEy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22E510E331
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783943554; x=1815479554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lHz7rGj14ajtoec+xZlLhYUKSh6gyGAKfnswXSH6Qrs=;
 b=PEhCCxEyPnhsr30z5qB3xLTMuQYUGJrXtkJLf3kkwtwD7F7d5N/mGg67
 9JJCGvnEHIEaSPHkjuJ5wiaPbxPaW0qFH9+o0hTqdFckTcPXz0XOkNxuS
 mftIcYJEGg6my7zA8XSnddRMIGoqFlL0+zKw7k7XiF+Ufq5vN2010ZDIh
 gTd21yWdwjNP/NaeRglzfyqQsxfY4uz9S8gdyYki+zHnc736YQcL600ZH
 7Dbp+RWsUG1ZOB7nNJjHKeSUOxWoYnrouZILh8HNNgd7GRM5PQH/oq+/B
 xAT1WfGcU8J6F2Bykq/DxROh5PSfFXH30K8ZabwrJ5QwdhkmUsjUVgCHy w==;
X-CSE-ConnectionGUID: F4rEK9PkTMe/dqSyOkv1oQ==
X-CSE-MsgGUID: 8epIkaqKSFq6w+owOLEChg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84405139"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84405139"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:52:34 -0700
X-CSE-ConnectionGUID: VCUMmqoXQwCNSPirym5Dmg==
X-CSE-MsgGUID: ce4wuhRQSIazkG6D8QAasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="293722899"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:52:32 -0700
Date: Mon, 13 Jul 2026 13:52:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH 2/2] tests/intel/gem_change_handle_race: Add edge-case
 and functional subtests
Message-ID: <20260713115229.jquy6ntinwzq6scs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20260712182457.58392-1-vitaly.prosyak@amd.com>
 <20260712182457.58392-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260712182457.58392-2-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2026-07-12 at 14:24:54 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 

Please use version info in subject, for example version 4:

git format-patch -2 -v4

will add 'v4 2/2' to your subject. This will help do find out
most recent version for review, especially when CI reply to ML
and it is not clear which one is most recent.

> Add 5 new subtests requested by Simona Vetter to cover edge cases
> and verify basic ioctl functionality:
> 
> - noop-same-handle: handle == new_handle returns success (noop)
> - invalid-new-handle-exceeds-int-max: new_handle > INT_MAX returns -EINVAL
> - invalid-handle-nonexistent: non-existent handle returns -ENOENT
> - edge-new-handle-zero: new_handle == 0 (unhandled case)
> - functional-rename-verification: after rename, GEM_CLOSE(old) fails
>   with -ENOENT and GEM_CLOSE(new) succeeds
> 
> The functional test specifically checks whether the merged version of
> the ioctl actually performs a working rename operation.
> 
> v3 changes (addressing Kamil Konieczny's review feedback):
>  - Removed reference to external documentation (RACE_CONDITIONS_EXPLAINED.md)
>  - Sanitized test descriptions and comments (security consideration)
>  - Renamed 'race-darknavy-cve' to 'race-close-before-lock'
>  - Renamed internal functions and variables for clarity
>  - No functional changes to test logic
> 
> v2 changes (addressing Kamil Konieczny's review feedback):
>  - Added header comment explaining why test is in tests/intel/ directory:
>    * All gem_* tests follow IGT convention of being in tests/intel/
>    * Uses i915/gem.h for GEM object creation infrastructure
>    * Some subtests designed by Simona Vetter (Intel) - hence Intel copyright
> 
>  - ARM compatibility fixes:
>    * Added #define _GNU_SOURCE for pthread_setaffinity_np()
>    * Made pin_to_cpu() handle failures gracefully with igt_debug()
>    * CPU pinning is best-effort optimization, not hard requirement
>    * Added comment explaining ARM-specific considerations
> 
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: I5f1f62338411070571b9dfc7685b6cef6b88f724
> ---
>  tests/intel/gem_change_handle_race.c | 293 +++++++++++++++++++++++----
>  1 file changed, 248 insertions(+), 45 deletions(-)
> 
> diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
> index 0ac8657ac..f65cc5d4e 100644
> --- a/tests/intel/gem_change_handle_race.c
> +++ b/tests/intel/gem_change_handle_race.c
> @@ -1,16 +1,30 @@
> +#define _GNU_SOURCE
>  // SPDX-License-Identifier: MIT
>  /*
>   * Copyright 2026 Advanced Micro Devices, Inc.
>   * Copyright 2026 Intel Corporation
>   *
>   * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> - * 
> + *
> + * NOTE: This test is located in tests/intel/ directory because:
> + * 1. All gem_* tests are traditionally placed in tests/intel/ regardless
> + *    of GPU vendor, following IGT convention for GEM-related tests
> + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object creation
> + *    on Intel platforms, though it works vendor-agnostically via DRM core
> + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functional-*)
> + *    were proposed by Simona Vetter (Intel), hence Intel copyright header
> + *
> + * ARM compatibility: This test uses pthread_setaffinity_np() which requires
> + * _GNU_SOURCE and may behave differently on ARM due to different CPU topology.
> + * The test gracefully handles CPU pinning failures and continues execution.
>   */
>  
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <limits.h>
>  #include <pthread.h>
> +#include <sched.h>
> +#include <semaphore.h>
>  #include <signal.h>
>  #include <string.h>
>  #include <sys/stat.h>
> @@ -29,31 +43,6 @@
>  #define HAS_AMDGPU 0
>  #endif
>  
> -/* Helper to detect if running under gdb */
> -static bool running_under_gdb(void)
> -{

Please do not add functions in patch 1 as you remove it
in patch 2. Please keep it or remove it from beginning.
If you need it for debugging, maybe add an option(s) to 
igt_main() and keep it.

> -	char buf[1024];
> -	FILE *fp;
> -	bool under_gdb = false;
> -
> -	/* Check if parent process is gdb */
> -	fp = fopen("/proc/self/status", "r");
> -	if (!fp)
> -		return false;
> -
> -	while (fgets(buf, sizeof(buf), fp)) {
> -		if (strncmp(buf, "TracerPid:", 10) == 0) {
> -			int tracer_pid = atoi(buf + 10);
> -			if (tracer_pid != 0)
> -				under_gdb = true;
> -			break;
> -		}
> -	}
> -	fclose(fp);
> -
> -	return under_gdb;
> -}
> -
>  /* Helper to check for concurrent access traces in kernel log */
>  static int check_kernel_traces(void)
>  {
> @@ -76,23 +65,34 @@ static int check_kernel_traces(void)
>  	if (fp == NULL)
>  		return 0;
>  
> -	if (fgets(line, sizeof(line), fp) != NULL) {
> +	if (fgets(line, sizeof(line), fp) != NULL)
>  		trace_count = atoi(line);
> -	}
>  	pclose(fp);
>  
>  	return trace_count;
>  }
>  
>  
> +

Even more newlines here? One should be enough.

>  static void pin_to_cpu(int cpu)
>  {
>  	cpu_set_t cpuset;
> +	int ret;
> +
>  	CPU_ZERO(&cpuset);
>  	CPU_SET(cpu, &cpuset);
> -	pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
> +	ret = pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
> +	
> +	/*
> +	 * ARM compatibility: pthread_setaffinity_np() may fail on ARM systems
> +	 * due to different CPU topology or when running in containers/VMs.
> +	 * We don't fail the test - CPU pinning is a best-effort optimization
> +	 * to increase race condition probability, not a hard requirement.
> +	 */
> +	if (ret != 0)
> +		igt_debug("Failed to pin to CPU %d (errno=%d), continuing anyway\n",
> +			  cpu, ret);
>  }
> -

Keep this empty line here.

>  /* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers */
>  #ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
>  struct drm_gem_change_handle {
> @@ -107,6 +107,9 @@ struct drm_gem_change_handle {
>   * TEST: gem change handle race
>   * Description: Multi-threaded race condition tests for GEM_CHANGE_HANDLE
>   * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: GEM handles
> + * Functionality: gem change handle
>   * Feature: gem
>   * Run type: FULL
>   *
> @@ -130,6 +133,21 @@ struct drm_gem_change_handle {
>   *
>   * SUBTEST: race-exploit-random-handles
>   * Description: Random handle probing to find free slots and trigger concurrent access
> + *
> + * SUBTEST: noop-same-handle
> + * Description: Edge case where handle equals new_handle should succeed as noop
> + *
> + * SUBTEST: invalid-new-handle-exceeds-int-max
> + * Description: new_handle exceeding INT_MAX should fail with EINVAL
> + *
> + * SUBTEST: invalid-handle-nonexistent
> + * Description: Non-existent handle should fail with ENOENT
> + *
> + * SUBTEST: edge-new-handle-zero
> + * Description: new_handle of zero exercises the unhandled zero-handle case
> + *
> + * SUBTEST: functional-rename-verification
> + * Description: After rename old handle returns EINVAL on close and new handle closes successfully
>   */
>  
>  IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE");
> @@ -138,7 +156,7 @@ IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE"
>  #define RACE_DURATION_SEC 1
>  
>  /* Verbose logging - set to false to reduce output */
> -static bool verbose_logging = false;
> +static bool verbose_logging;
>  
>  
>  /* Driver type detection */
> @@ -238,6 +256,7 @@ static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
>  	switch (ctx->driver) {
>  	case DRIVER_TYPE_I915: {
>  		struct drm_i915_gem_create create = { .size = size };
> +

Add it in patch 1, not here.

>  		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
>  		handle = create.handle;
>  		break;
> @@ -260,6 +279,7 @@ static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
>  static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
>  {
>  	struct drm_gem_close close_args = { .handle = handle };
> +

Same here, introduce this in prevoius change.

>  	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
>  }
>  
> @@ -413,9 +433,8 @@ static void test_race_change_vs_close(struct gpu_ctx *ctx)
>  	pthread_barrier_destroy(&barrier);
>  
>  	/* Clean up final handle if exists */
> -	if (data.handle) {
> +	if (data.handle)
>  		gem_close_bo(ctx, data.handle);
> -	}

Same here, make it correct in beginning. Same applies below.

Regards,
Kamil

[cut]
