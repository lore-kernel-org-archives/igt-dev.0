Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BB710E686
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 10:27:11 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Aug 2023 16:02:16 +0530
Message-Id: <20230811103217.415744-2-riana.tauro@intel.com>
In-Reply-To: <20230811103217.415744-1-riana.tauro@intel.com>
References: <20230811103217.415744-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] RFC tests/xe: Add a test that validates
 idle residency on exec
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a test what runs a background load that is
active approximately 1% of the time. Verify that we do enter
GT-C6 the rest of the time and validate idle residency is within
tolerance.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/xe/xe_pm_residency.c | 135 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index 4936de166..abf07c696 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -11,13 +11,18 @@
  * Test category: functionality test
  */
 
+#include <time.h>
+
 #include "igt.h"
 #include "igt_sysfs.h"
 
+#include "lib/igt_syncobj.h"
+
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
-#define SLEEP_DURATION 3000 /* in milliseconds */
+#define SLEEP_DURATION 3 /* in seconds */
 
 const double tolerance = 0.1;
 
@@ -38,9 +43,98 @@ const double tolerance = 0.1;
  * Description: basic residency test to validate idle residency
  *		measured over a time interval is within the tolerance
  * Run type: FULL
+ *
+ * SUBTEST: idle-residency-on-exec
+ * Description: Validate idle residency measured when a background
+ *		is only active for ~1% of the time
+ * Run type: FULL
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
+static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned long *done)
+{
+	uint32_t bo = 0;
+	uint32_t exec_queue, syncobj, vm;
+	uint64_t addr = 0x1a0000;
+	uint64_t batch_addr, batch_offset, data_addr, data_offset;
+	size_t bo_size;
+	int b;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	bo_size = xe_get_default_alignment(fd);
+
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, hwe->gt_id));
+	data = xe_bo_map(fd, bo, bo_size);
+	syncobj = syncobj_create(fd, 0);
+
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+
+	batch_offset = (char *)&data->batch - (char *)data;
+	batch_addr = addr + batch_offset;
+	data_offset = (char *)&data->data - (char *)data;
+	data_addr = addr + data_offset;
+
+	do {
+		uint64_t submit, elapsed;
+		struct timespec tv = {};
+
+		b = 0;
+		done[1]++;
+		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data->batch[b++] = data_addr;
+		data->batch[b++] = data_addr >> 32;
+		data->batch[b++] = done[1];
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data->batch));
+
+		exec.exec_queue_id = exec_queue;
+		exec.address = batch_addr;
+		sync.handle = syncobj;
+
+		igt_nsec_elapsed(&tv);
+		xe_exec(fd, &exec);
+		submit = igt_nsec_elapsed(&tv);
+
+		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+		elapsed = igt_nsec_elapsed(&tv);
+		igt_assert_eq(data->data, done[1]);
+
+		igt_debug("Execution took %.3fms (submit %.1fus, wait %.1fus)\n",
+			  1e-6 * elapsed,
+			  1e-3 * submit,
+			  1e-3 * (elapsed - submit));
+
+		syncobj_reset(fd, &syncobj, 1);
+
+		/* Aim for ~1% busy */
+		usleep(elapsed / 10);
+	} while (!READ_ONCE(*done));
+
+	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
+	syncobj_destroy(fd, syncobj);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 static unsigned int measured_usleep(unsigned int usec)
 {
 	struct timespec ts = { };
@@ -76,7 +170,7 @@ static void test_idle_residency(int fd, int gt)
 	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
 
 	residency_start = read_idle_residency(fd, gt);
-	elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) / 1000;
+	elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
 	residency_end = read_idle_residency(fd, gt);
 
 	igt_info("Measured %lums of idle residency in %lums\n",
@@ -85,9 +179,41 @@ static void test_idle_residency(int fd, int gt)
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
+static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	const int tol = 20;
+	unsigned long *done;
+	unsigned long cycles, elapsed_ms, residency;
+
+	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(done != MAP_FAILED);
+	memset(done, 0, 4096);
+
+	igt_fork(child, 1)
+		exec_load(fd, hwe, done);
+
+	cycles -= READ_ONCE(done[1]);
+	residency -= read_idle_residency(fd, hwe->gt_id);
+	elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
+	residency += read_idle_residency(fd, hwe->gt_id);
+	cycles += READ_ONCE(done[1]);
+	*done = 1;
+
+	igt_waitchildren();
+
+	/* At least one wakeup/s needed for a reasonable test */
+	igt_assert(cycles >= SLEEP_DURATION);
+
+	/* While very nearly busy, expect full GT C6 */
+	assert_within_epsilon(residency, elapsed_ms, tol);
+
+	munmap(done, 4096);
+}
+
 igt_main
 {
 	int fd, gt;
+	struct drm_xe_engine_class_instance *hwe;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -104,6 +230,11 @@ igt_main
 		xe_for_each_gt(fd, gt)
 			test_idle_residency(fd, gt);
 
+	igt_describe("Validate idle residency on exec");
+	igt_subtest("idle-residency-on-exec")
+		xe_for_each_hw_engine(fd, hwe)
+			idle_residency_on_exec(fd, hwe);
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.40.0
