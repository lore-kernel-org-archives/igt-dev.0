Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1065EFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 06:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0B710E06A;
	Tue, 28 Apr 2026 06:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaA/diE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1965310E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777359277; x=1808895277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kivQoRKDdW4ALHKW+jena/+JNcUPyQV9JQIKK8kznIg=;
 b=jaA/diE2dlcDPDXomzxBoe8Cu3l1V8R/44M8MwjT0+xh6j08kZtgvurP
 L5LBNlinM/eVl2KYoWqEt7r9Zu92GX15zhDjqY8uvopePIu1j1nrAPUli
 8obNt6KV0u5+7nDn01sPUZRsaxjaMr6OUe/L+b5alP/gyOAWNYguUn0uJ
 SwPiIpAJMNBy15Iu6vQPInhdwRl+1jtixIby3ZUpDbRb1sRBPWapA+zAY
 gAngMqJSV633J1iaZaRhAPJmmbaJG+dkHBa++AGh4pvFyL6fxh8ac0rFM
 Ik/f4Pb3Mbwu9EXE+ni9Kjif8nHa9wYUtqIIa3nL2kjKtz9Gj3D5X212V w==;
X-CSE-ConnectionGUID: MTTvN8CXROqE3Xwq3cz8rg==
X-CSE-MsgGUID: 8nNzjcXCRn2t5K9+K5z9PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78137877"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78137877"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:37 -0700
X-CSE-ConnectionGUID: oCF3fbO8QqORJF3OwsRxrQ==
X-CSE-MsgGUID: 3tMna0UoRpORG5FuechvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="232863013"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.161])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 5/6] tests/xe_cgroups: add dmem cgroup eviction test
Date: Tue, 28 Apr 2026 08:54:10 +0200
Message-ID: <20260428065411.4222-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
References: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add xe_cgroups, a test exercising the dmem cgroup controller on xe
devices.

The write_eviction subtest:
 - Skips if the dmem cgroup controller is not available.
 - Skips if no VRAM region is registered with the dmem controller.
 - Creates a sub-cgroup and moves the test process into it.
 - Sets a dmem.max limit on the first VRAM region (up to 4 GiB, or
   the full capacity if smaller).
 - Creates an LR VM and fills VRAM by repeatedly creating BOs with
   DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING and binding them via
   __xe_vm_bind_lr_sync() until -ENOMEM or -ENOSPC is returned.
 - Verifies that cgroup current usage is within the expected range when
   the limit is hit.
 - Lowers dmem.max in 256 MiB steps, waiting for usage to follow each
   reduction.

The write_eviction_interruptible subtest runs the same test with
SIGCONT signals injected via igt_fork_signal_helper() and reports the
number of signals received.  When a signal interrupts kernel-side
eviction, a small BO allocation is used to re-trigger it.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_cgroups.c | 276 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 tests/intel/xe_cgroups.c

diff --git a/tests/intel/xe_cgroups.c b/tests/intel/xe_cgroups.c
new file mode 100644
index 000000000..8b0f4381f
--- /dev/null
+++ b/tests/intel/xe_cgroups.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: xe_cgroups
+ * DESCRIPTION: Tests exercising the dmem cgroup controller on xe devices.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: cgroup
+ * FUNCTIONALITY: cgroup dmem controller
+ * SUBSETS: xe
+ */
+
+#include <errno.h>
+#include <signal.h>
+#include <stdatomic.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_aux.h"
+#include "igt_cgroup.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define BO_SIZE			SZ_128M
+#define MAX_LIMIT		((uint64_t)4 * SZ_1G)
+#define EVICT_STEP		SZ_256M
+#define BIND_BASE		0x100000000ULL	/* 4 GiB VA base */
+
+#define TEST_INTERRUPTIBLE	(1 << 0)
+
+/**
+ * SUBTEST: write_eviction
+ * DESCRIPTION:
+ *   Create a dmem cgroup, move the current process into it and set the max
+ *   device memory limit for the first VRAM region to 4 GiB.  Then fill VRAM
+ *   by creating BOs with %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING (so that the
+ *   physical allocation is deferred until VM_BIND) and binding them into an
+ *   LR VM until the cgroup limit is hit.  Verify that the reported cgroup
+ *   current usage is within the expected range when the error occurs.
+ *   Finally lower the max limit in 256 MiB steps and verify that the cgroup
+ *   usage follows.
+ * REQUIREMENTS: must run as root; xe device with at least one VRAM region
+ */
+
+/**
+ * SUBTEST: write_eviction_interruptible
+ * DESCRIPTION:
+ *   Same as write_eviction but with SIGCONT signals injected throughout via
+ *   igt_fork_signal_helper() to verify that the dmem.max write path handles
+ *   signal interruption correctly.  A signal handler counts received signals
+ *   and the count is reported as debug output at the end of the test.
+ *   A signal interrupts the set-time eviction, and further eviction can be
+ *   triggered by an explicit allocation.
+ * REQUIREMENTS: must run as root; xe device with at least one VRAM region
+ */
+
+static atomic_int signal_count;
+static struct sigaction sigcont_oldact;
+
+static void sigcont_handler(int sig)
+{
+	atomic_fetch_add(&signal_count, 1);
+
+	/* Chain to the previous handler (IGT's dummy sig_handler) */
+	if (sigcont_oldact.sa_handler &&
+	    sigcont_oldact.sa_handler != SIG_IGN &&
+	    sigcont_oldact.sa_handler != SIG_DFL)
+		sigcont_oldact.sa_handler(sig);
+}
+
+static void install_sigcont_counter(void)
+{
+	struct sigaction sa;
+
+	atomic_store(&signal_count, 0);
+	igt_fork_signal_helper();
+	/*
+	 * Install the counter after igt_fork_signal_helper() so our handler
+	 * is not overwritten.  Save the old handler so we can chain to it.
+	 */
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = sigcont_handler;
+	sigemptyset(&sa.sa_mask);
+	sigaction(SIGCONT, &sa, &sigcont_oldact);
+}
+
+static int fill_vram(int fd, uint32_t vm, uint64_t vram_region,
+		     uint32_t *handles, int max_bo)
+{
+	uint32_t handle;
+	uint64_t addr = BIND_BASE;
+	int n_bo, err = 0;
+
+	for (n_bo = 0; n_bo < max_bo; n_bo++) {
+		err = __xe_bo_create(fd, 0, BO_SIZE, vram_region,
+				     DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING,
+				     NULL, &handle);
+		if (err)
+			break;
+
+		handles[n_bo] = handle;
+
+		err = __xe_vm_bind_lr_sync(fd, vm, handle, 0, addr, BO_SIZE, 0);
+		if (err)
+			break;
+
+		addr += BO_SIZE;
+	}
+
+	igt_assert_f(err == -ENOMEM || err == -ENOSPC,
+		     "Expected -ENOMEM or -ENOSPC, got %d (%s)\n",
+		     err, strerror(-err));
+
+	return n_bo;
+}
+
+static void unfill_vram(int fd, uint32_t vm, uint32_t *handles, int n_bo)
+{
+	uint64_t addr = BIND_BASE;
+	int i;
+
+	for (i = 0; i < n_bo; i++) {
+		if (handles[i]) {
+			xe_vm_unbind_lr_sync(fd, vm, 0, addr, BO_SIZE);
+			gem_close(fd, handles[i]);
+		}
+		addr += BO_SIZE;
+	}
+	free(handles);
+}
+
+static void test_write_eviction(int fd, unsigned int flags)
+{
+	struct igt_cgroup *cg;
+	char *cg_region;
+	uint32_t vm;
+	uint64_t vram_region = 0;
+	uint64_t region;
+	uint32_t *handles = NULL;
+	int n_bo = 0, max_bo;
+	uint64_t current, capacity, cg_max, limit, after;
+
+	/* Check dmem cgroup controller is available before doing anything else */
+	igt_require_f(igt_cgroup_dmem_available(),
+		      "dmem cgroup controller not available (no cgroup v2 or no registered regions)\n");
+
+	/* Find first VRAM region */
+	xe_for_each_mem_region(fd, all_memory_regions(fd), region) {
+		if (xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_VRAM) {
+			vram_region = region;
+			break;
+		}
+	}
+	igt_require_f(vram_region, "No VRAM region found on this device\n");
+
+	cg_region = xe_cgroup_region_name(fd, vram_region);
+	igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
+
+	igt_cgroup_dmem_get_capacity(cg_region, &capacity);
+	igt_require_f(capacity >= 4 * BO_SIZE,
+		      "VRAM capacity (%"PRIu64" MiB) too small to test\n",
+		      capacity / SZ_1M);
+
+	/*
+	 * Use up to 4 GiB, or the full capacity if the device has less.
+	 * Leave one BO_SIZE worth of headroom so the device isn't completely
+	 * exhausted before the cgroup limit is hit.
+	 */
+	cg_max = min(MAX_LIMIT, capacity - BO_SIZE);
+	cg_max = ALIGN_DOWN(cg_max, EVICT_STEP);
+
+	if (flags & TEST_INTERRUPTIBLE)
+		install_sigcont_counter();
+
+	/* Create cgroup and move into it */
+	cg = igt_cgroup_new("xe_cgroups_test");
+	igt_cgroup_move_current(cg);
+	igt_cgroup_dmem_set_max(cg, cg_region, cg_max, false);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+
+	max_bo = (cg_max / BO_SIZE) + 8; /* headroom for overcommit */
+	handles = calloc(max_bo, sizeof(*handles));
+	igt_assert(handles);
+
+	n_bo = fill_vram(fd, vm, vram_region, handles, max_bo);
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After fill: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+
+	igt_assert_f(current <= cg_max,
+		     "Usage %"PRIu64" MiB exceeds max %"PRIu64" MiB + slack\n",
+		     current / SZ_1M, cg_max / SZ_1M);
+
+	/* Phase 2: lower max in 256 MiB steps, verify usage follows */
+	limit = cg_max;
+	while (limit >= EVICT_STEP) {
+
+		limit -= EVICT_STEP;
+		igt_cgroup_dmem_set_max(cg, cg_region, limit, false);
+
+		igt_cgroup_dmem_get_current(cg, cg_region, &after);
+		igt_debug("Lowered max to %"PRIu64" MiB: usage = %"PRIu64" MiB\n",
+			  limit / SZ_1M, after / SZ_1M);
+
+		if (limit > EVICT_STEP) {
+			if ((flags & TEST_INTERRUPTIBLE) && after > limit) {
+				uint32_t handle;
+
+				/* Let a new bo creation trigger eviction. */
+				handle = xe_bo_create(fd, 0, BO_SIZE / 8, vram_region, 0);
+				gem_close(fd, handle);
+
+				igt_cgroup_dmem_get_current(cg, cg_region, &after);
+				igt_debug("Forced eviction max is %"PRIu64
+					  " MiB: usage = %"PRIu64" MiB\n",
+					  limit / SZ_1M, after / SZ_1M);
+			}
+
+			igt_assert_f(after <= limit,
+				     "Usage %"PRIu64" MiB did not follow max %"PRIu64" MiB\n",
+				     after / SZ_1M, limit / SZ_1M);
+		}
+	}
+
+	if (flags & TEST_INTERRUPTIBLE) {
+		igt_stop_signal_helper();
+		igt_info("Signals received during test: %d\n",
+			 atomic_load(&signal_count));
+	}
+
+	/* Cleanup */
+	igt_cgroup_dmem_set_max(cg, cg_region, IGT_CGROUP_DMEM_MAX, false);
+	unfill_vram(fd, vm, handles, n_bo);
+	handles = NULL;
+	xe_vm_destroy(fd, vm);
+	free(cg_region);
+	igt_cgroup_free(cg);
+}
+
+static const struct {
+	const char *name;
+	unsigned int flags;
+} subtests[] = {
+	{ "write_eviction",		0 },
+	{ "write_eviction_interruptible",	TEST_INTERRUPTIBLE },
+	{ }
+};
+
+int igt_main()
+{
+	int fd = -1;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require_f(getuid() == 0, "Test requires root\n");
+	}
+
+	for (int i = 0; subtests[i].name; i++)
+		igt_subtest(subtests[i].name)
+			test_write_eviction(fd, subtests[i].flags);
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 02fbb8c4e..eb1158510 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
 	'xe_eu_stall',
+	'xe_cgroups',
 	'xe_evict',
 	'xe_evict_ccs',
 	'xe_exec_atomic',
-- 
2.53.0

