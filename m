Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C610CE8E8A
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 15:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF3610E969;
	Thu, 24 Oct 2024 15:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4i5rizk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4C10E969
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729783841; x=1761319841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A3Yq1wCHSi5qdCPakHWYOKic/TFSPS2C7ve+OBxSalo=;
 b=j4i5rizkpOfmjSLHVczZu/YV5PhcenKO/qjiUbwPCLWgpZolElifHxWn
 aAanZfhHUhnPZFogwUOw1H/mXPrCTCjcLsNVY3lBgnwtu9ZlmS8drv1U8
 NLT4RRiB8xbP3WY353o76N5zjoIR0UbF4oMZ9heSiq/EudnhXmP+7QTwv
 7g1bwv6T+5GqqoEX7ygQXpgtMRgB8FGXkrutrq2dfxBtoCjivXyLjPaBp
 klTInZJsBMGNZx5RJC3xbCSF+8dFLDL3YhoDW0KWTdJgaoiH7etiB80Ko
 bDIApuftjWkaeQ890HFqccdy5Tnc5ZxeAEbKXZ8964cQL1UPYFBSreJAw A==;
X-CSE-ConnectionGUID: SjgxFueDT8mDrHaLRdC8ew==
X-CSE-MsgGUID: BA8VXorYRQSmsCdMiiR8dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29351702"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29351702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 08:30:41 -0700
X-CSE-ConnectionGUID: ldFRxqe2SnW2A1LQBkjLMA==
X-CSE-MsgGUID: lGOjDGeLTdevb9VwDmbogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80731255"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:30:40 -0700
Date: Thu, 24 Oct 2024 17:30:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] tests/xe_exec_reset: Add readout of devcoredump
Message-ID: <20241024153024.pprxm3ahltzh5kok@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20241018173817.8513-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018173817.8513-1-maarten.lankhorst@linux.intel.com>
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

Hi Maarten,
On 2024-10-18 at 19:38:17 +0200, Maarten Lankhorst wrote:

in subject add '/intel/' prefix, so instead of:

[PATCH] tests/xe_exec_reset: Add readout of devcoredump

better:

[PATCH] tests/intel/xe_exec_reset: Add readout of devcoredump

> We're mostly testing if we can read the devcoredump, clear the
> devcoredump at the start of each subtest, and read it out at the end
> of the test.

Code looks good, I have few nits, see below.

> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 134 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 129 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 43ef1e334..96e0a85d3 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -12,7 +12,12 @@
>   * Test category: functionality test
>   */
>  
> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +
>  #include "igt.h"
> +#include "lib/igt_io.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> @@ -25,6 +30,74 @@
>  
>  #define SYNC_OBJ_SIGNALED	(0x1 << 0)
>  
> +static int sysfd = -1;
> +
> +static u64 dummy_size;
> +static void *dummy;
> +
> +/* Clear any previous devcoredump */
> +static void tryclear_hang(void)
> +{
> +	int fd;
> +	char buf[256];

Could it be a little larger?

> +
> +	if (sysfd < 0)
> +		return;
> +
> +	fd = openat(sysfd, "devcoredump/data", O_RDWR);
> +	if (fd < 0)
> +		return;
> +
> +	/* Read is optional, but see comment below why we do it */

This would be ok if called from test named 'read-devcoredump'
or at least add here an igt_info() about clearing a dump.

> +	while (read(fd, buf, sizeof(buf)) > 0)
> +		{ }
> +	write(fd, "1", 1);
> +	close(fd);
> +}
> +
> +/*
> + * Helper to read and clear devcore.  We want to read it completely to ensure
> + * we catch any kernel side regressions like:
> + * https://gitlab.freedesktop.org/drm/msm/-/issues/20
> + */
> +static void
> +read_and_clear_hang(void)
> +{
> +	char buf[0x1000];
> +	int fd;
> +
> +	if (sysfd < 0)
> +		return;
> +
> +	fd = openat(sysfd, "devcoredump/data", O_RDWR);

Please don't repeat code, make it a separate function, like:
	fd = open_devcoredump();

> +	igt_assert(fd >= 0);

Why assert here? If any, use igt_assert_f() and explain what
failed here.  For eaxmple, such info is not very helpfull:

(xe_exec_reset:14850) CRITICAL: Failed assertion: fd >= 0
(xe_exec_reset:14850) CRITICAL: Last errno: 2, No such file or directory

btw please respond to CI report, one test is failing:

sudo build/tests/xe_exec_reset --r spin

> +
> +	/*
> +	 * We want to read the entire file but we can throw away the
> +	 * contents.. we just want to make sure that we exercise the
> +	 * kernel side codepaths hit when reading the devcore from
> +	 * sysfs
> +	 */
> +	igt_debug("---- begin coredump ----\n");
> +	while (1) {
> +		ssize_t ret;
> +
> +		ret = igt_readn(fd, buf, sizeof(buf) - 1);
> +		igt_assert(ret >= 0);
> +		if (ret == 0)
> +			break;
> +		buf[ret] = '\0';
> +		igt_debug("%s", buf);
> +	}
> +
> +	igt_debug("---- end coredump ----\n");

Could you also print with igt_info how big is it?

> +
> +	/* Clear the devcore: */
> +	igt_writen(fd, "1", 1);
> +
> +	close(fd);
> +}
> +
>  /**
>   * SUBTEST: spin
>   * Description: test spin
> @@ -68,7 +141,11 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  				 DRM_SYNCOBJ_CREATE_SIGNALED : 0);
>  
>  	sync[0].handle = syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
> +			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
> +
> +	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
> +				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
>  
>  #define N_TIMES 4
>  	for (i = 0; i < N_TIMES; ++i) {
> @@ -103,6 +180,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  	munmap(spin, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> +
> +	read_and_clear_hang();
>  }
>  
>  #define MAX_N_EXECQUEUES	16
> @@ -112,6 +191,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  #define VIRTUAL				(0x1 << 3)
>  #define PARALLEL			(0x1 << 4)
>  #define CAT_ERROR			(0x1 << 5)
> +#define CAPTURE				(0x1 << 6)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -172,6 +252,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		fd = drm_open_driver(DRIVER_XE);
>  
>  	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> +	tryclear_hang();
> +
>  	if (num_placements < 2)
>  		return;
>  
> @@ -193,7 +275,11 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
>  
>  	sync[0].handle = syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
> +			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
> +
> +	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
> +				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
>  
>  	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & GT_RESET))
>  		bad_batches = num_placements;
> @@ -285,6 +371,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> +
> +	read_and_clear_hang();
>  }
>  
>  /**
> @@ -337,6 +425,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
>  
> +	tryclear_hang();
> +
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
> @@ -352,7 +442,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  
>  	sync[0].handle = syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
> +			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
> +
> +	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
> +				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint64_t base_addr = flags & CAT_ERROR && !i ?
> @@ -432,6 +526,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> +
> +	read_and_clear_hang();
>  }
>  
>  /**
> @@ -486,6 +582,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
>  
> +	tryclear_hang();
> +
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
> @@ -501,7 +599,12 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
> +			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
> +
> +	/* Capture BO as userptr too */
> +	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
> +				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
>  
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
>  	data[0].vm_sync = 0;
> @@ -583,6 +686,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> +
> +	read_and_clear_hang();
>  }
>  
>  struct gt_thread_data {
> @@ -603,6 +708,8 @@ static void do_resets(struct gt_thread_data *t)
>  		usleep(250000);	/* 250 ms */
>  		(*t->num_reset)++;
>  		xe_force_gt_reset_async(t->fd, t->gt);
> +
> +		tryclear_hang();
>  	}
>  }
>  
> @@ -713,6 +820,8 @@ gt_reset(int fd, int n_threads, int n_sec)
>  	igt_info("number of resets %d\n", num_reset);
>  
>  	free(threads);
> +
> +	tryclear_hang();
>  }
>  
>  igt_main
> @@ -730,9 +839,24 @@ igt_main
>  	int class;
>  	int fd;
>  
> -	igt_fixture
> +	igt_fixture {
> +		struct stat stat;
> +		char str[256];
> +
>  		fd = drm_open_driver(DRIVER_XE);
>  
> +		igt_assert_eq(fstat(fd, &stat), 0);
> +		sprintf(str, "/sys/dev/char/%ld:%ld/device", stat.st_rdev >> 8, stat.st_rdev & 0xff);
> +		sysfd = open(str, O_DIRECTORY);
> +
> +		tryclear_hang();

imho it would be better if that function wouldn't try to read all
devcoredump, as you wrote there was a bug in some driver in past
but imho if it should be checked, it is better to do in a separate
subtest.

Regards,
Kamil

> +
> +		dummy_size = sysconf(_SC_PAGESIZE);
> +		if (dummy_size < SZ_64K)
> +			dummy_size = SZ_64K;
> +		dummy = aligned_alloc(dummy_size, dummy_size);
> +	}
> +
>  	igt_subtest("spin")
>  		xe_for_each_engine(fd, hwe)
>  			test_spin(fd, hwe, 0);
> -- 
> 2.45.2
> 
