Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10F9CD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 10:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F4910EFEB;
	Thu, 28 May 2026 10:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbjsjRbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7163810F004
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779965371; x=1811501371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ti/n3BGkQlh0JgrCmKJ/ILyI9ov4oUdA5w3r3988s/0=;
 b=dbjsjRbgxAxmUd4F2L+W7T94JRJLwdBWjh6AU2cOvrwmVGrZZ4gl/oNf
 Fk3zRdHh18hsPUkB/YveQwWkolHgdNceyZtyhZoFJ3N7XNpjLnwypoZ2b
 AbQG/9LgKKqf3Oj94gF6tRH5o/Lx7G42oAxtBLssKC6P+0NcrK3EOCd4u
 VOfve5fxed5VqwlZsGIPUh3pg3pQhM8ODsSVJ8yy32WFTkXKQyHqMUwBH
 Ll+PXgdDc7qeraQuLL+cdFOSFvRH+e3nsXt1tYjnuEgiraXN/LbXkkYXs
 R0rwuMnx4eV8uKLbTVCRCR18/v4q161FZrG6nJNBtZZWMenwAAdsHoq3Q w==;
X-CSE-ConnectionGUID: Gz19unHTTriofyD/zM6upA==
X-CSE-MsgGUID: EZZJh7z2Qd+3ujNIcAaiUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91376636"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91376636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:49:30 -0700
X-CSE-ConnectionGUID: rNvFbVBuR1aX29csROcBOA==
X-CSE-MsgGUID: 7ov5zUaMTHyyB9A8WU9j5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="242366485"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:49:29 -0700
Date: Thu, 28 May 2026 12:49:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Subject: Re: [PATCH 1/1] tests/xe_userptr_pressure: Add
 rebind-under-compaction test
Message-ID: <20260528104926.vej4qqcs5xnhy6su@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 matthew.auld@intel.com
References: <20260527150355.1671044-1-jan.maslak@intel.com>
 <20260527150355.1671044-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527150355.1671044-2-jan.maslak@intel.com>
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

Hi Jan,
On 2026-05-27 at 17:03:46 +0200, Jan Maslak wrote:

please use 'i-g-t' after 'PATCH' in subject, also wrote version
tag there, here 'v2', and use 'tests/intel/' so it should be
like:

[PATCH i-g-t v2 1/1] tests/intel/xe_userptr_pressure: Add rebind-under-compaction test

No need for resend, this could be fixed at merge time.

Please respond to fail from CI with cc to CI bug-filing,
when replying please cut message after 'Known failures'
(or not, depending if you want to comment something there).

Regards,
Kamil

> Adds a stress test that fills ~70% of available RAM with userptr-backed
> buffers and repeatedly rebinds one of them while background threads
> continuously compact and fragment physical memory.  The sustained pressure
> forces the kernel to migrate userptr pages during compaction, exercising
> the lock ordering between the userptr rebind path and the compaction path.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/intel/xe_userptr_pressure.c | 416 ++++++++++++++++++++++++++++++
>  tests/meson.build                 |   1 +
>  2 files changed, 417 insertions(+)
>  create mode 100644 tests/intel/xe_userptr_pressure.c
> 
> diff --git a/tests/intel/xe_userptr_pressure.c b/tests/intel/xe_userptr_pressure.c
> new file mode 100644
> index 0000000000..ee2fa75d14
> --- /dev/null
> +++ b/tests/intel/xe_userptr_pressure.c
> @@ -0,0 +1,416 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: Exercise userptr operations under memory pressure
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Memory management tests
> + * Functionality: userptr memory pressure
> + * Description: Stress-test userptr bind/rebind paths while the system is
> + *              under sustained memory compaction and fragmentation pressure.
> + */
> +
> +#include <fcntl.h>
> +#include <pthread.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/* Test configuration */
> +#define EXEC_ITERATIONS		1024
> +#define FRAG_ALLOC_COUNT	256
> +#define FRAG_ALLOC_SIZE		(2 << 20)	/* 2MB each - huge page sized */
> +#define MAX_USERPTR_BUFFERS	32
> +#define USERPTR_BUFFER_SIZE	(256 << 20)	/* 256MB per buffer */
> +#define TARGET_RAM_FILL_PCT	70		/* Fill ~70% of available RAM */
> +#define PRESSURE_WARMUP_SECS	2		/* Let compaction threads settle before rebinding */
> +#define LOG_INTERVAL		64		/* Print progress every N iterations */
> +#define THP_DEFRAG_PATH		"/sys/kernel/mm/transparent_hugepage/defrag"
> +
> +static pthread_barrier_t barrier;
> +static _Atomic(bool) stop_threads;
> +static char saved_thp_defrag[128];
> +static size_t saved_thp_defrag_len;
> +static bool have_saved_thp_defrag;
> +
> +/**
> + * trigger_compaction - Trigger kernel memory compaction via /proc
> + *
> + * Requires root privileges.
> + */
> +static void trigger_compaction(void)
> +{
> +	int fd;
> +
> +	fd = open("/proc/sys/vm/compact_memory", O_WRONLY);
> +	if (fd >= 0) {
> +		igt_ignore_warn(write(fd, "1", 1));
> +		close(fd);
> +	}
> +}
> +
> +/**
> + * save_thp_defrag - Save the current THP defragmentation mode
> + *
> + * Returns true if the active mode could be parsed and saved for restoration.
> + */
> +static bool save_thp_defrag(void)
> +{
> +	char buf[128] = {};
> +	char *start, *end;
> +	ssize_t n;
> +	int fd;
> +
> +	/*
> +	 * Read the current mode.  The sysfs file lists all options with the
> +	 * active one enclosed in square brackets, e.g.:
> +	 *   always defer defer+madvise [madvise] never
> +	 */
> +	have_saved_thp_defrag = false;
> +	saved_thp_defrag_len = 0;
> +	saved_thp_defrag[0] = '\0';
> +
> +	fd = open(THP_DEFRAG_PATH, O_RDONLY);
> +	if (fd >= 0) {
> +		n = read(fd, buf, sizeof(buf) - 1);
> +		close(fd);
> +		if (n > 0) {
> +			start = strchr(buf, '[');
> +			end = strchr(buf, ']');
> +			if (start && end && end > start + 1) {
> +				saved_thp_defrag_len = end - start - 1;
> +				if (saved_thp_defrag_len < sizeof(saved_thp_defrag)) {
> +					memcpy(saved_thp_defrag, start + 1,
> +					       saved_thp_defrag_len);
> +					saved_thp_defrag[saved_thp_defrag_len] = '\0';
> +					have_saved_thp_defrag = true;
> +				}
> +			}
> +		}
> +	}
> +
> +	return have_saved_thp_defrag;
> +}
> +
> +/**
> + * write_thp_defrag - Write a THP defragmentation mode string
> + * @mode: Mode string to write
> + * @len: Length of @mode
> + */
> +static void write_thp_defrag(const char *mode, size_t len)
> +{
> +	int fd;
> +
> +	fd = open(THP_DEFRAG_PATH, O_WRONLY);
> +	if (fd >= 0) {
> +		igt_ignore_warn(write(fd, mode, len));
> +		close(fd);
> +	}
> +}
> +
> +/**
> + * restore_thp_defrag - Restore the saved THP defragmentation mode
> + */
> +static void restore_thp_defrag(void)
> +{
> +	if (!have_saved_thp_defrag)
> +		return;
> +
> +	write_thp_defrag(saved_thp_defrag, saved_thp_defrag_len);
> +	have_saved_thp_defrag = false;
> +	saved_thp_defrag_len = 0;
> +	saved_thp_defrag[0] = '\0';
> +}
> +
> +/**
> + * thp_defrag_exit_handler - Restore THP defrag on process exit or signal
> + * @sig: Signal that triggered the exit handler, or 0 for normal exit
> + */
> +static void thp_defrag_exit_handler(int sig)
> +{
> +	(void)sig;
> +	restore_thp_defrag();
> +}
> +
> +/**
> + * drop_caches - Drop page caches to free up memory
> + */
> +static void drop_caches(void)
> +{
> +	int fd;
> +
> +	fd = open("/proc/sys/vm/drop_caches", O_WRONLY);
> +	if (fd >= 0) {
> +		igt_ignore_warn(write(fd, "3", 1));
> +		close(fd);
> +	}
> +}
> +
> +/**
> + * compaction_thread - Continuously trigger memory compaction
> + */
> +static void *compaction_thread(void *arg)
> +{
> +	(void)arg;
> +	pthread_barrier_wait(&barrier);
> +
> +	while (!stop_threads) {
> +		trigger_compaction();
> +		usleep(50);
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * fragmentation_thread - Create memory fragmentation to force kcompactd activity
> + *
> + * Allocates huge-page-sized blocks and frees every other one, creating the
> + * fragmentation pattern that causes kcompactd to migrate pages.
> + */
> +static void *fragmentation_thread(void *arg)
> +{
> +	void *allocs[FRAG_ALLOC_COUNT];
> +	int i, round = 0;
> +
> +	(void)arg;
> +
> +	memset(allocs, 0, sizeof(allocs));
> +	pthread_barrier_wait(&barrier);
> +
> +	while (!stop_threads) {
> +		/* Allocate and touch blocks to get them into physical memory */
> +		for (i = 0; i < FRAG_ALLOC_COUNT && !stop_threads; i++) {
> +			allocs[i] = mmap(NULL, FRAG_ALLOC_SIZE, PROT_READ | PROT_WRITE,
> +					 MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
> +			if (allocs[i] != MAP_FAILED) {
> +				/* Touch to ensure allocation */
> +				memset(allocs[i], round & 0xff, FRAG_ALLOC_SIZE);
> +				/* Try madvise HUGEPAGE to encourage THP and compaction */
> +				madvise(allocs[i], FRAG_ALLOC_SIZE, MADV_HUGEPAGE);
> +			}
> +		}
> +
> +		/* Free every other block to fragment physical memory */
> +		for (i = 0; i < FRAG_ALLOC_COUNT; i += 2) {
> +			if (allocs[i] && allocs[i] != MAP_FAILED) {
> +				munmap(allocs[i], FRAG_ALLOC_SIZE);
> +				allocs[i] = NULL;
> +			}
> +		}
> +
> +		/* Trigger compaction while fragmented - this migrates pages */
> +		trigger_compaction();
> +		usleep(1000);
> +
> +		/* Free the remainder */
> +		for (i = 1; i < FRAG_ALLOC_COUNT; i += 2) {
> +			if (allocs[i] && allocs[i] != MAP_FAILED) {
> +				munmap(allocs[i], FRAG_ALLOC_SIZE);
> +				allocs[i] = NULL;
> +			}
> +		}
> +
> +		round++;
> +	}
> +
> +	/* Cleanup any remaining */
> +	for (i = 0; i < FRAG_ALLOC_COUNT; i++) {
> +		if (allocs[i] && allocs[i] != MAP_FAILED)
> +			munmap(allocs[i], FRAG_ALLOC_SIZE);
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * test_rebind_under_compaction - Rebind userptr while physical memory is under compaction pressure
> + * @fd: DRM file descriptor
> + *
> + * Allocates userptr buffers totaling ~TARGET_RAM_FILL_PCT% of available RAM,
> + * then repeatedly rebinds one buffer while background threads continuously
> + * compact and fragment physical memory.  When userptr dominates physical
> + * memory the kernel is forced to migrate userptr pages during compaction,
> + * creating a window where the rebind path and the compaction path compete
> + * for the same locks.
> + */
> +static void
> +test_rebind_under_compaction(int fd)
> +{
> +	uint64_t base_addr = 0x100000000;	/* Start at 4GB VA */
> +	void *userptr_buffers[MAX_USERPTR_BUFFERS];
> +	int num_buffers;
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	uint32_t vm;
> +	pthread_t compaction_tid, frag_tid;
> +	uint64_t avail_ram_mb;
> +	int i, iter;
> +
> +	/*
> +	 * Drop caches before measuring available RAM so the buffer count
> +	 * reflects genuinely free memory rather than whatever the system
> +	 * happens to have cached at test start.
> +	 */
> +	drop_caches();
> +	avail_ram_mb = igt_get_avail_ram_mb();
> +
> +	/*
> +	 * Fill ~TARGET_RAM_FILL_PCT% of RAM with userptr buffers.
> +	 * USERPTR_BUFFER_SIZE per buffer keeps individual allocations
> +	 * manageable while still dominating physical memory.
> +	 */
> +	num_buffers = (avail_ram_mb * TARGET_RAM_FILL_PCT / 100) /
> +		      (USERPTR_BUFFER_SIZE >> 20);
> +	if (num_buffers > MAX_USERPTR_BUFFERS)
> +		num_buffers = MAX_USERPTR_BUFFERS;
> +	if (num_buffers < 4)
> +		num_buffers = 4;
> +
> +	igt_info("Allocating %d userptr buffers of %zu MB each (total: %zu MB)\n",
> +		 num_buffers, (size_t)(USERPTR_BUFFER_SIZE >> 20),
> +		 (size_t)num_buffers * (USERPTR_BUFFER_SIZE >> 20));
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	sync.handle = syncobj_create(fd, 0);
> +
> +	/* Allocate, touch, and bind all buffers */
> +	for (i = 0; i < num_buffers; i++) {
> +		uint64_t addr = base_addr + (uint64_t)i * USERPTR_BUFFER_SIZE * 2;
> +
> +		userptr_buffers[i] = mmap(NULL, USERPTR_BUFFER_SIZE, PROT_READ | PROT_WRITE,
> +					  MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +		igt_assert(userptr_buffers[i] != MAP_FAILED);
> +
> +		/* Fault in all pages so they occupy physical memory */
> +		memset(userptr_buffers[i], 0xff, USERPTR_BUFFER_SIZE);
> +
> +		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +		xe_vm_bind_userptr_async(fd, vm, 0,
> +					 to_user_pointer(userptr_buffers[i]),
> +					 addr, USERPTR_BUFFER_SIZE, &sync, 1);
> +		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_reset(fd, &sync.handle, 1);
> +	}
> +
> +	/* Start compaction and fragmentation threads */
> +	stop_threads = false;
> +	igt_assert_eq(pthread_barrier_init(&barrier, NULL, 3), 0);	/* main + 2 threads */
> +	igt_assert_eq(pthread_create(&compaction_tid, NULL, compaction_thread, NULL), 0);
> +	igt_assert_eq(pthread_create(&frag_tid, NULL, fragmentation_thread, NULL), 0);
> +	pthread_barrier_wait(&barrier);
> +
> +	/* Let threads create pressure before rebinding starts */
> +	sleep(PRESSURE_WARMUP_SECS);
> +
> +	/*
> +	 * Rebind buffer[0] in a tight loop.  With userptr dominating RAM,
> +	 * the kernel is forced to migrate userptr pages during compaction,
> +	 * which creates a window where the rebind path and the compaction
> +	 * path compete for the same locks.
> +	 */
> +	for (iter = 0; iter < EXEC_ITERATIONS; iter++) {
> +		uint64_t addr = base_addr;
> +
> +		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +		xe_vm_unbind_async(fd, vm, 0, 0, addr, USERPTR_BUFFER_SIZE, &sync, 1);
> +		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_reset(fd, &sync.handle, 1);
> +
> +		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +		xe_vm_bind_userptr_async(fd, vm, 0,
> +					 to_user_pointer(userptr_buffers[0]),
> +					 addr, USERPTR_BUFFER_SIZE, &sync, 1);
> +		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_reset(fd, &sync.handle, 1);
> +
> +		if (iter % LOG_INTERVAL == 0)
> +			igt_debug("  Iteration %d/%d\n", iter, EXEC_ITERATIONS);
> +	}
> +
> +	stop_threads = true;
> +	igt_assert_eq(pthread_join(compaction_tid, NULL), 0);
> +	igt_assert_eq(pthread_join(frag_tid, NULL), 0);
> +	pthread_barrier_destroy(&barrier);
> +
> +	/* Unbind and free all buffers */
> +	for (i = 0; i < num_buffers; i++) {
> +		uint64_t addr = base_addr + (uint64_t)i * USERPTR_BUFFER_SIZE * 2;
> +
> +		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +		xe_vm_unbind_async(fd, vm, 0, 0, addr, USERPTR_BUFFER_SIZE, &sync, 1);
> +		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_reset(fd, &sync.handle, 1);
> +
> +		munmap(userptr_buffers[i], USERPTR_BUFFER_SIZE);
> +	}
> +
> +	syncobj_destroy(fd, sync.handle);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: rebind-under-compaction
> + * Description: Fills ~70% of available RAM with userptr-backed buffers, then
> + *              starts background threads that continuously compact and fragment
> + *              physical memory.  While that pressure runs, one buffer is
> + *              repeatedly unbound and rebound.  When userptr dominates physical
> + *              memory the kernel is forced to migrate userptr pages during
> + *              compaction, which creates a window where the userptr rebind path
> + *              and the compaction path compete for the same locks.  A correct
> + *              kernel completes this within a bounded time; a kernel with a
> + *              lock-ordering bug will stall indefinitely.
> + *              Written to catch regressions like the one fixed in
> + *              "drm/xe/userptr: fix notifier vs folio deadlock".
> + *              See: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4765
> + * Functionality: userptr lock ordering under memory pressure
> + * Test category: stress test
> + */
> +
> +int igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +	}
> +
> +	igt_subtest_group() {
> +		igt_fixture() {
> +			igt_require(getuid() == 0);
> +			igt_require(igt_get_avail_ram_mb() >= 1024);
> +
> +			/* Restore THP defrag both in normal teardown and on process exit. */
> +			if (save_thp_defrag())
> +				igt_install_exit_handler(thp_defrag_exit_handler);
> +			write_thp_defrag("always", sizeof("always") - 1);
> +		}
> +
> +		igt_subtest("rebind-under-compaction") {
> +			test_rebind_under_compaction(fd);
> +		}
> +
> +		igt_fixture() {
> +			restore_thp_defrag();
> +		}
> +	}
> +
> +	igt_fixture() {
> +		xe_device_put(fd);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index fe08181186..811a367483 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -334,6 +334,7 @@ intel_xe_progs = [
>  	'xe_query',
>  	'xe_render_copy',
>  	'xe_vm',
> +	'xe_userptr_pressure',
>  	'xe_waitfence',
>  	'xe_spin_batch',
>  	'xe_sriov_admin',
> -- 
> 2.43.0
> 
