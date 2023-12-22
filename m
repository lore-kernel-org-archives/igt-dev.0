Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5979210E772
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 10:56:15 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 2/2] intel/xe_exec_store: Add Persistent subtest
Date: Fri, 22 Dec 2023 16:23:53 +0530
Message-Id: <20231222105353.23355-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20231222105353.23355-1-sai.gowtham.ch@intel.com>
References: <20231222105353.23355-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add persistent subtest to validate MI_PRT_BATCH_BUFFER_START.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_store.c | 86 +++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index ec875cffc..75bd65bb5 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -74,6 +74,24 @@ static void cond_batch(struct data *data, uint64_t addr, int value)
 	data->addr = batch_addr;
 }
 
+static void persistance_batch(struct data *data, uint64_t addr)
+{
+	int b;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t prt_offset = (char *)&(data->data) - (char *)data;
+	uint64_t prt_addr = addr + prt_offset;
+
+	b = 0;
+	data->batch[b++] = MI_BATCH_BUFFER_START;
+	data->batch[b++] = MI_PRT_BATCH_BUFFER_START;
+	data->batch[b++] = prt_addr;
+	data->batch[b++] = prt_addr >> 32;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+
+	data->addr = batch_addr;
+
+}
 /**
  * SUBTEST: basic-store
  * Description: Basic test to verify store dword.
@@ -246,6 +264,71 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: persistent
+ * DESCRIPTION: Validate MI_PRT_BATCH_BUFFER_START functionality
+ */
+static void persistent(int fd)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct data *sd_data;
+	struct data *prt_data;
+	struct drm_xe_engine *engine;
+	uint32_t vm, exec_queue,syncobj;
+	uint32_t sd_batch, prt_batch;
+	uint64_t addr = 0x100000;
+	int value = 0x123456;
+	size_t batch_size = 4096;
+
+	syncobj = syncobj_create(fd, 0);
+	sync.handle = syncobj;
+
+	vm = xe_vm_create(fd, 0, 0);
+	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
+					xe_get_default_alignment(fd));
+
+	engine = xe_engine(fd, 1);
+	sd_batch = xe_bo_create(fd, vm, batch_size,
+			      vram_if_possible(fd, engine->instance.gt_id),
+			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	prt_batch = xe_bo_create(fd, vm, batch_size,
+			      vram_if_possible(fd, engine->instance.gt_id),
+			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	xe_vm_bind_async(fd, vm, engine->instance.gt_id, sd_batch, 0, addr, batch_size, &sync, 1);
+	sd_data = xe_bo_map(fd, sd_batch, batch_size);
+	prt_data = xe_bo_map(fd, prt_batch, batch_size);
+
+	store_dword_batch(sd_data, addr, value);
+	persistance_batch(prt_data, addr);
+
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = prt_data->addr;
+	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(sd_data->data, value);
+
+	syncobj_destroy(fd, syncobj);
+	munmap(sd_data, batch_size);
+	munmap(prt_data, batch_size);
+	gem_close(fd, sd_batch);
+	gem_close(fd, prt_batch);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -285,6 +368,9 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			store_cachelines(fd, hwe, PAGES);
 
+	igt_subtest("persistent")
+		persistent(fd);
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.39.1
