Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C764910E7DA
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 05:25:31 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, janga.rahul.kumar@intel.com,
 sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org
Date: Thu,  7 Dec 2023 10:50:27 +0530
Message-Id: <20231207052027.2256633-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel/xe_exec_store: Test to
 check CONDITIONAL_BATCH_BUFFER_END
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added a basic test to check MI_CONDITIONAL_BATCH_BUFFER_END instruction.

v2: Remove BATCH_BUFFER_END instruction. (Rahul)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_store.c | 44 ++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index dec8546a3..87178b0a2 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -21,6 +21,8 @@
  */
 
 #define MAX_INSTANCE 9
+#define STORE 0
+#define COND_BATCH 1
 
 struct data {
 	uint32_t batch[16];
@@ -48,11 +50,37 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 	data->addr = batch_addr;
 }
 
+static void cond_batch(struct data *data, uint64_t addr, int value)
+{
+	int b;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
+	data->batch[b++] = value;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = MI_BATCH_BUFFER_START | 1;
+	data->batch[b++] = lower_32_bits(batch_addr);
+	data->batch[b++] = upper_32_bits(batch_addr);
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	data->addr = batch_addr;
+}
+
 /**
  * SUBTEST: basic-store
  * Description: Basic test to verify store dword.
+ * SUBTEST: basic-cond-batch
+ * Description: Basic test to verify cond batch end instruction.
  */
-static void store(int fd)
+static void basic_inst(int fd, int inst_type)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
@@ -88,7 +116,14 @@ static void store(int fd)
 
 	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
-	store_dword_batch(data, addr, value);
+
+	if (inst_type == STORE)
+		store_dword_batch(data, addr, value);
+	else {
+		/* A random value where it stops at the below value. */
+		value = 20;
+		cond_batch(data, addr, value);
+	}
 
 	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	exec.exec_queue_id = exec_queue;
@@ -306,7 +341,10 @@ igt_main
 	}
 
 	igt_subtest("basic-store")
-		store(fd);
+		basic_inst(fd, STORE);
+
+	igt_subtest("basic-cond-batch")
+		basic_inst(fd, COND_BATCH);
 
 	igt_subtest("basic-all") {
 		xe_for_each_gt(fd, gt)
-- 
2.25.1
