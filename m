Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7A10EE41
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jan 2022 13:02:14 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Fri, 28 Jan 2022 14:02:03 +0100
Message-Id: <20220128130203.14790-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220128130203.14790-1-kamil.konieczny@linux.intel.com>
References: <20220128130203.14790-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] lib/intel_batchbuffer: add tracking and
 reset for allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

After subtest ends, due to normal flow or after fail by
igt_assert, igt_core inits intel_allocator before next subtest,
and this makes allocator handle keeped in intel_batchbuffer
invalid. Moreover any call to intel_allocator can result in
fail as there are no allocators until first allocator_open.

Add tracking intel_butchbuffer if it is using allocator and
recreate its allocator handle and offsets from igt_core before
next subtest.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_core.c          |  2 ++
 lib/intel_batchbuffer.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  6 ++++++
 3 files changed, 46 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 7c906675..ab27a24d 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -59,6 +59,7 @@
 
 #include "drmtest.h"
 #include "intel_allocator.h"
+#include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "intel_io.h"
 #include "igt_debugfs.h"
@@ -1426,6 +1427,7 @@ __noreturn static void exit_subtest(const char *result)
 	 * remnants from previous allocator run (if any).
 	 */
 	intel_allocator_init();
+	intel_bb_reinit_allocator();
 
 	if (!in_dynamic_subtest)
 		_igt_dynamic_tests_executed = -1;
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 10d8a6e0..58b414f3 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -80,6 +80,9 @@
  * library as a dependency.
  */
 
+static IGT_LIST_HEAD(intel_bb_list);
+static pthread_mutex_t intel_bb_list_lock = PTHREAD_MUTEX_INITIALIZER;
+
 /**
  * intel_batchbuffer_align:
  * @batch: batchbuffer object
@@ -1359,6 +1362,9 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
 								  strategy);
 	ibb->allocator_type = allocator_type;
 	ibb->allocator_strategy = strategy;
+	ibb->allocator_start = start;
+	ibb->allocator_end = end;
+
 	ibb->i915 = i915;
 	ibb->enforce_relocs = do_relocs;
 	ibb->handle = gem_create(i915, size);
@@ -1384,6 +1390,12 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
 
 	ibb->refcount = 1;
 
+	if (ibb->allocator_type != INTEL_ALLOCATOR_NONE) {
+		pthread_mutex_lock(&intel_bb_list_lock);
+		igt_list_add(&ibb->link, &intel_bb_list);
+		pthread_mutex_unlock(&intel_bb_list_lock);
+	}
+
 	return ibb;
 }
 
@@ -1600,6 +1612,10 @@ void intel_bb_destroy(struct intel_bb *ibb)
 	__intel_bb_destroy_cache(ibb);
 
 	if (ibb->allocator_type != INTEL_ALLOCATOR_NONE) {
+		pthread_mutex_lock(&intel_bb_list_lock);
+		igt_list_del(&ibb->link);
+		pthread_mutex_unlock(&intel_bb_list_lock);
+
 		intel_allocator_free(ibb->allocator_handle, ibb->handle);
 		intel_allocator_close(ibb->allocator_handle);
 	}
@@ -2959,3 +2975,25 @@ igt_huc_copyfunc_t igt_get_huc_copyfunc(int devid)
 
 	return copy;
 }
+
+void __intel_bb_reinit_alloc(struct intel_bb *ibb)
+{
+	if (ibb->allocator_type == INTEL_ALLOCATOR_NONE)
+		return;
+
+	ibb->allocator_handle = intel_allocator_open_full(ibb->i915, ibb->ctx,
+							  ibb->allocator_start, ibb->allocator_end,
+							  ibb->allocator_type,
+							  ibb->allocator_strategy);
+	intel_bb_reset(ibb, true);
+}
+
+void intel_bb_reinit_allocator(void)
+{
+	struct intel_bb *iter;
+
+	pthread_mutex_lock(&intel_bb_list_lock);
+	igt_list_for_each_entry(iter, &intel_bb_list, link)
+		__intel_bb_reinit_alloc(iter);
+	pthread_mutex_unlock(&intel_bb_list_lock);
+}
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index e7606307..2265de8a 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -456,7 +456,10 @@ struct igt_pxp {
  * Batchbuffer without libdrm dependency
  */
 struct intel_bb {
+	struct igt_list_head link;
+
 	uint64_t allocator_handle;
+	uint64_t allocator_start, allocator_end;
 	uint8_t allocator_type;
 	enum allocator_strategy allocator_strategy;
 
@@ -524,6 +527,9 @@ struct intel_bb *
 intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size);
 void intel_bb_destroy(struct intel_bb *ibb);
 
+// make it safe to use intel_allocator after failed test
+void intel_bb_reinit_allocator(void);
+
 static inline void intel_bb_ref(struct intel_bb *ibb)
 {
 	ibb->refcount++;
-- 
2.32.0
