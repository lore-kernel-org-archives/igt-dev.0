Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8DCFF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 09:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976DE10E117;
	Tue,  5 May 2026 09:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eljOYgrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB3410E117
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777974488; x=1809510488;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qdJgRixP9f5tQ7nzKVJfE9+UXsLD3y5b5ufyTYDPECw=;
 b=eljOYgrQEKaJmDVXBKoGeFOF15gV8U8uvcWtPKgjPs3mbtX+ebIOjsuz
 DejXRwKc1vfYpu/O6I/DX64oGk8vKmY5pMcv6e235gYKn4zHdrkfrdV6i
 W4Fnp3IOM+JpaknNqGOe6uZJ3ZMECMaJS7HfL1QRG9wPCBQ8BR196ST+Y
 +uAABf4vtgJDfdQBTg9ayLs7GFk7NBeUBss+kNp6ELrEMQZ8+MPSVGpUl
 i3+QpKkgUSPg5qFtbYNaY3UVfgkaogOJc4GZZATKjMLIY+WBhZc5z9qpM
 QcQ7JbK0jtXvmTxribLNYGo8P+Tl2E3kdS1tO6YmOu64BVU3Ic9ZrdMS7 Q==;
X-CSE-ConnectionGUID: 3/IRRCEtS+KKeO8uiK6h1g==
X-CSE-MsgGUID: TjTlYaz7SseF4qoLZu9Ptg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89432885"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="89432885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:48:08 -0700
X-CSE-ConnectionGUID: a3MmLtyLT3ey5lrGHajINw==
X-CSE-MsgGUID: BqlIA521RWSR8qMojTgJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="259442865"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.65])
 ([10.245.244.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:48:06 -0700
Message-ID: <78230e8d-8c03-4a48-82a9-b79b8f0e9f9f@intel.com>
Date: Tue, 5 May 2026 10:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/xe_userptr_pressure: Add
 rebind-under-compaction test
To: Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com
References: <20260304221203.4053291-1-jan.maslak@intel.com>
 <20260304221203.4053291-2-jan.maslak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260304221203.4053291-2-jan.maslak@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 04/03/2026 22:12, Jan Maslak wrote:
> Adds a stress test that fills ~70% of available RAM with userptr-backed
> buffers and repeatedly rebinds one of them while background threads
> continuously compact and fragment physical memory.  The sustained pressure
> forces the kernel to migrate userptr pages during compaction, exercising
> the lock ordering between the userptr rebind path and the compaction path.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Tried this locally without the deadlock fix and machine instantly got a 
hard hang, so seems to work quite well :)

> ---
>   tests/intel/xe_userptr_pressure.c | 372 ++++++++++++++++++++++++++++++
>   tests/meson.build                 |   1 +
>   2 files changed, 373 insertions(+)
>   create mode 100644 tests/intel/xe_userptr_pressure.c
> 
> diff --git a/tests/intel/xe_userptr_pressure.c b/tests/intel/xe_userptr_pressure.c
> new file mode 100644
> index 000000000..f525c2c62
> --- /dev/null
> +++ b/tests/intel/xe_userptr_pressure.c
> @@ -0,0 +1,372 @@
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
> +
> +static pthread_barrier_t barrier;
> +static _Atomic(bool) stop_threads;
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
> + * set_thp_defrag - Set the THP defragmentation mode
> + * @mode: Mode string to write (e.g. "always", "madvise", "never")
> + *
> + * Returns a newly-allocated string containing the previous active mode that
> + * the caller must free(), or NULL if the file could not be opened or parsed.
> + */
> +static char *set_thp_defrag(const char *mode)
> +{
> +	char buf[128] = {};
> +	char *old = NULL;
> +	char *start, *end;
> +	ssize_t n;
> +	int fd;
> +
> +	/*
> +	 * Read the current mode.  The sysfs file lists all options with the
> +	 * active one enclosed in square brackets, e.g.:
> +	 *   always defer defer+madvise [madvise] never
> +	 */
> +	fd = open("/sys/kernel/mm/transparent_hugepage/defrag", O_RDONLY);
> +	if (fd >= 0) {
> +		n = read(fd, buf, sizeof(buf) - 1);
> +		close(fd);
> +		if (n > 0) {
> +			start = strchr(buf, '[');
> +			end = strchr(buf, ']');
> +			if (start && end && end > start + 1) {
> +				*end = '\0';
> +				old = strdup(start + 1);
> +			}
> +		}
> +	}
> +
> +	/* Write new mode on a fresh fd so file position starts at 0 */
> +	fd = open("/sys/kernel/mm/transparent_hugepage/defrag", O_WRONLY);
> +	if (fd >= 0) {
> +		igt_ignore_warn(write(fd, mode, strlen(mode)));
> +		close(fd);
> +	}
> +
> +	return old;
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
> +	char *saved_thp_defrag;
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
> +	/*
> +	 * Set THP defrag to "always" so compaction is maximally aggressive.
> +	 * The original value is restored on exit.
> +	 */
> +	saved_thp_defrag = set_thp_defrag("always");

Should this type of global thing not go in the fixture? Or does this get 
properly cleaned up if we trigger an assert below?

Otherwise, test works as advertised, it catches the bug, and therefore 
adds the test coverage we were missing so,

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

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
> +	/* Restore THP defrag mode */
> +	if (saved_thp_defrag) {
> +		free(set_thp_defrag(saved_thp_defrag));
> +		free(saved_thp_defrag);
> +	}
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
> +	igt_subtest("rebind-under-compaction") {
> +		igt_require(getuid() == 0);
> +		igt_require(igt_get_avail_ram_mb() >= 1024);
> +		test_rebind_under_compaction(fd);
> +	}
> +
> +	igt_fixture() {
> +		xe_device_put(fd);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f356de9b..277eef6a3 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_query',
>   	'xe_render_copy',
>   	'xe_vm',
> +	'xe_userptr_pressure',
>   	'xe_waitfence',
>   	'xe_spin_batch',
>   	'xe_sriov_admin',

