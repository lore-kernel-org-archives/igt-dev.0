Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E37CAC59F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D6510E792;
	Tue, 16 Sep 2025 20:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AquhXmv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE61810E170
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758054300; x=1789590300;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VzL2MEXZ6B0mrQB67alRfxqcJFlV+gWiCFBHHL86edI=;
 b=AquhXmv2XkuBeB+4la7OBxa2tSOJm96TOCvieNnUmMSX4AkCkV0f7yjN
 0RvS2DFFPMniS+bF1CyQXcY81YQiYsxfwt1SWTBlX3A5pSE/n/X7cDlQx
 p63pByIZcH8e59/RPAfi1ORHuacTGb4jqZoC1KC/SPDWk9F8GNM8hqroD
 amvIEAn7xMKi9icwtezxfyX7szGNNwj2tdScGNlYhXZUJRlpbIYe2QA9i
 ZfDNBPqdChqTh+iZ+iZm/TK/N5CYYGtNwt8ShI6DTA6donBmAFyGV+bGn
 v4/Fb58Oh19nfHsVCi8hO4xhdolf1B+//Yv7rys2o8iaQlCekW//91uNO g==;
X-CSE-ConnectionGUID: QjkpVxDPRRev/QZDkCg7HQ==
X-CSE-MsgGUID: rbi/nrcjQIC1QcBV2k742A==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59570003"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="59570003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:24:59 -0700
X-CSE-ConnectionGUID: YHydGvtbTPW6o4IVFUBDMw==
X-CSE-MsgGUID: L1cjVCxbSA2KEqyjyLBVdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="212190532"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:24:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 3/3] tests/intel/xe_exec_reset: Long spin tests
Date: Tue, 16 Sep 2025 13:24:54 -0700
Message-Id: <20250916202454.3758884-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916202454.3758884-1-matthew.brost@intel.com>
References: <20250916202454.3758884-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Add a long spin test places multiple spinners on an engine instance to
ensure they can properly timeslice and complete successfully. This
extends the single engine instance tests to multiple threads as well.

These tests are particularly useful for verifying that VF migration
works as expected while jobs are actively running on the hardware during
the migration process.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_legacy.c          |  52 ++++++++++++-
 tests/intel/xe_exec_reset.c | 145 ++++++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 9d2da7f413..c0c0c4605c 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -12,6 +12,8 @@
 
 /* Batch buffer element count, in number of dwords(u32) */
 #define BATCH_DW_COUNT			16
+#define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
+#define LONG_SPIN			(0x1 << 8)
 #define CANCEL				(0x1 << 7)
 #define PREEMPT				(0x1 << 6)
 #define CAT_ERROR			(0x1 << 5)
@@ -58,8 +60,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		u64 pad;
 		u32 data;
 	} *data;
-	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
+	struct xe_spin_opts spin_opts = {
+		.preempt = flags & PREEMPT,
+#define THREE_SEC	(3 * 1000000000ull)
+		.ctx_ticks = flags & LONG_SPIN ?
+			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
+	};
 	int i, b;
+	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
@@ -67,7 +75,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		fd = drm_open_driver(DRIVER_XE);
 
 	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data) * n_execs;
+	bo_size = sizeof(*data) * (n_execs + extra_execs);
 	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
@@ -101,7 +109,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		u64 exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL) {
+		if (!i || flags & CANCEL ||
+		    (flags & LONG_SPIN && i < n_exec_queues)) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -152,12 +161,47 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
+	for (i = n_execs; i < n_execs + extra_execs; i++) {
+		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
+			? (addr + bo_size * 128) : addr;
+		u64 batch_offset = (char *)&data[i].batch - (char *)data;
+		u64 batch_addr = base_addr + batch_offset;
+		u64 sdi_offset = (char *)&data[i].data - (char *)data;
+		u64 sdi_addr = base_addr + sdi_offset;
+		u64 exec_addr;
+		int e = i % n_exec_queues;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		exec_addr = batch_addr;
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = exec_addr;
+
+		syncobj_reset(fd, &syncobjs[e], 1);
+		xe_exec(fd, &exec);
+	}
+
+	for (i = 0; i < n_exec_queues && extra_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
+
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
-		for (i = 1; i < n_execs; i++)
+		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
+		     i < n_execs + extra_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 88e9df6fbb..47b461e2d5 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -118,6 +118,10 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define CAT_ERROR			(0x1 << 5)
 #define PREEMPT				(0x1 << 6)
 #define CANCEL				(0x1 << 7)
+#define LONG_SPIN			(0x1 << 8)
+#define GT0				(0x1 << 9)
+#define GT1				(0x1 << 10)
+#define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
 
 /**
  * SUBTEST: %s-cat-error
@@ -642,6 +646,88 @@ gt_mocs_reset(int fd, int gt)
 	free(mocs_contents_post);
 }
 
+struct thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	int fd;
+	struct drm_xe_engine_class_instance *hwe;
+	int n_exec_queue;
+	int n_exec;
+	int flags;
+	bool *go;
+};
+
+static void *thread(void *data)
+{
+	struct thread_data *t = data;
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	xe_legacy_test_mode(t->fd, t->hwe, t->n_exec_queue, t->n_exec,
+			    t->flags, LEGACY_MODE_ADDR, false);
+
+	return NULL;
+}
+
+static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
+{
+	struct thread_data *threads_data;
+	struct drm_xe_engine_class_instance *hwe;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	int n_engines = 0, i;
+	bool go = false;
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->gt_id && (flags & GT0))
+			continue;
+		if (!hwe->gt_id && (flags & GT1))
+			continue;
+
+		++n_engines;
+	}
+
+	threads_data = calloc(n_engines, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->gt_id && (flags & GT0))
+			continue;
+		if (!hwe->gt_id && (flags & GT1))
+			continue;
+
+		threads_data[i].fd = fd;
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		threads_data[i].hwe = hwe;
+		threads_data[i].n_exec_queue = n_exec_queues;
+		threads_data[i].n_exec = n_execs;
+		threads_data[i].flags = flags;
+		threads_data[i].go = &go;
+
+		pthread_create(&threads_data[i].thread, 0, thread,
+			       &threads_data[i]);
+		++i;
+	}
+
+	pthread_mutex_lock(&mutex);
+	go = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < n_engines; ++i)
+		pthread_join(threads_data[i].thread, NULL);
+
+	free(threads_data);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -701,6 +787,65 @@ igt_main
 			break;
 		}
 
+	igt_subtest("long-spin-many-preempt")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 4, 8,
+					    LONG_SPIN | PREEMPT,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("long-spin-many-preempt-media")
+		xe_for_each_engine(fd, hwe) {
+			if (!hwe->gt_id)
+				continue;
+			xe_legacy_test_mode(fd, hwe, 4, 8,
+					    LONG_SPIN | PREEMPT,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("long-spin-reuse-many-preempt")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 4, 8,
+					    LONG_SPIN | PREEMPT |
+					    LONG_SPIN_REUSE_QUEUE,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("long-spin-reuse-many-preempt-media")
+		xe_for_each_engine(fd, hwe) {
+			if (!hwe->gt_id)
+				continue;
+			xe_legacy_test_mode(fd, hwe, 4, 8,
+					    LONG_SPIN | PREEMPT |
+					    LONG_SPIN_REUSE_QUEUE,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("long-spin-many-preempt-threads")
+		threads(fd, 2, 16, LONG_SPIN | PREEMPT);
+
+	igt_subtest("long-spin-many-preempt-gt0-threads")
+		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0);
+
+	igt_subtest("long-spin-many-preempt-gt1-threads")
+		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT1);
+
+	igt_subtest("long-spin-reuse-many-preempt-threads")
+		threads(fd, 2, 16, LONG_SPIN | PREEMPT |
+			LONG_SPIN_REUSE_QUEUE);
+
+	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
+		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
+			LONG_SPIN_REUSE_QUEUE);
+
+	igt_subtest("long-spin-reuse-many-preempt-gt1-threads")
+		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT1 |
+			LONG_SPIN_REUSE_QUEUE);
+
 	igt_subtest("gt-reset")
 		xe_for_each_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
-- 
2.34.1

