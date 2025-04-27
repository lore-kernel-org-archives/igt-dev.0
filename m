Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D36AC369D1
	for <igt-dev@archiver.kernel.org>; Sun, 27 Apr 2025 17:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280EA10E0F7;
	Sun, 27 Apr 2025 17:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRCsMU4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9451510E0F7
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Apr 2025 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745774416; x=1777310416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=88/L3Hb0Wg1bX+T9noUZWsxyXcirX9bpaOZ5FCPUQsc=;
 b=SRCsMU4nFTzJIqbxn+4wX6+c+Fv4KWLL4hQyQKQvAezICIKCty7FfEIm
 JgrHERCiYZ90xfqGEGE5QpovGnyE/rhWYoQ+O/5Ra46dTMNo+RYAJasPM
 lE3ktq7N41LJmn1e8TdSpDYHZ0xP3k88vJjCjxJwNdJZdVEH0+4OXJWav
 WAGHjxCbG9T0qagyE7DAfxHw0pDIqyRvHq4ZAKyFTyEBHqBnZNaIgUEYK
 tsGn5P6gUztTHDujmL0AWaVjOEwRjGUs2YRXoOtRiousQi/F2Ad3fzqiy
 xy9FgndMzfiWoO/kWE0fAtjnecWlVK8+y2/ST94CYtX13e7SKazOhy4oI g==;
X-CSE-ConnectionGUID: g4kt8mL/QriQV3HsQSAJHg==
X-CSE-MsgGUID: FHoAZ/eYQn62kE+Eyr+1Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="51038230"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; d="scan'208";a="51038230"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 10:20:16 -0700
X-CSE-ConnectionGUID: sYKokMvRSjSnkXxd/3pK2g==
X-CSE-MsgGUID: 8jJTSl8KTHyELyC5WodVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; d="scan'208";a="133242600"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa006.jf.intel.com with ESMTP; 27 Apr 2025 10:20:15 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel: fix error reported by checkpatch.pl
Date: Sun, 27 Apr 2025 17:19:26 +0000
Message-Id: <20250427171926.1392288-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427171926.1392288-1-shuicheng.lin@intel.com>
References: <20250427171926.1392288-1-shuicheng.lin@intel.com>
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

Here is some of the error message reported by checkpatch.pl be fixed for
xe_*.c files under tests/intel folder.
"
ERROR: space prohibited before open square bracket '['
ERROR: trailing statements should be on next line
ERROR: space prohibited before that ',' (ctx:WxE)
ERROR: need consistent spacing around '+' (ctx:VxW)
ERROR: that open brace { should be on the previous line
ERROR: space prohibited before that close parenthesis ')'
ERROR: open brace '{' following function definitions go on the next line
ERROR: space required before the open parenthesis '('
ERROR: "(foo*)" should be "(foo *)"
ERROR: switch and case should be at the same indent
ERROR: do not initialise statics to false
ERROR: "foo* bar" should be "foo *bar"
ERROR: spaces required around that ':' (ctx:ExV)
ERROR: spaces required around that '=' (ctx:VxV)
ERROR: spaces required around that '<' (ctx:VxW)
ERROR: do not initialise globals to 0
"
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_dma_buf_sync.c        |  2 +-
 tests/intel/xe_eudebug.c             |  6 +++---
 tests/intel/xe_evict.c               |  2 +-
 tests/intel/xe_exec_basic.c          |  2 +-
 tests/intel/xe_exec_mix_modes.c      |  3 +--
 tests/intel/xe_exec_queue_property.c |  2 +-
 tests/intel/xe_exec_store.c          |  3 +--
 tests/intel/xe_huc_copy.c            | 18 +++++++++-------
 tests/intel/xe_oa.c                  | 31 ++++++++++++++--------------
 tests/intel/xe_pat.c                 |  2 +-
 tests/intel/xe_pm.c                  |  2 +-
 tests/intel/xe_query.c               | 16 +++++++-------
 tests/intel/xe_waitfence.c           |  2 +-
 13 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 3e8d89e95..ee92b0c54 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -84,7 +84,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		uint32_t batch[16];
 		uint64_t pad;
 		uint32_t data;
-	} *data [MAX_N_BO];
+	} *data[MAX_N_BO];
 	int i;
 
 	igt_assert_lte(n_bo, MAX_N_BO);
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 60700a8bb..dabe7caf6 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1143,13 +1143,13 @@ static void *discovery_race_thread(void *data)
 				 * Thread can starve for more than one second. Make
 				 * sure we get at least one event before stopping.
 				 */
-				do
+				do {
 					if (s->client->flags & DISCOVERY_SIGINT)
 						usleep(100000);
 					else
 						sleep(1);
-				while (!READ_ONCE(s->debugger->event_count) &&
-				       --max_worker_waits);
+				} while (!READ_ONCE(s->debugger->event_count)
+					 && --max_worker_waits);
 
 			igt_assert(READ_ONCE(s->debugger->event_count));
 			}
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 813fbfb99..8935d70b2 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -78,7 +78,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 
 	for (i = 0; i < n_exec_queues; i++) {
 		if (flags & MULTI_VM)
-			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
+			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm,
 						      eci, 0);
 		else
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index f652ab6b2..610cbf254 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -202,7 +202,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t batch_addr = __addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = (flags & SPARSE ? sparse_addr[i % n_vm] :
-				     __addr)+ sdi_offset;
+				     __addr) + sdi_offset;
 		int e = i % n_exec_queues;
 
 		b = 0;
diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 59887d2aa..037b92162 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -155,8 +155,7 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	if (allow_recursion) {
 		igt_gettime(&tv);
-		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
-		{
+		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++) {
 			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE, false);
 			/**
 			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4dfcf09e2..f7846d0de 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -189,7 +189,7 @@ static void invalid_property(int xe)
 
 	/* This will fail as soon as a new property is introduced. It is
 	 * expected and the test will have to be updated. */
-	for (int i = 3; i < 16; i++ ) {
+	for (int i = 3; i < 16; i++) {
 		ext.property = i;
 		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index bf22c3475..fa3b0ed74 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -157,8 +157,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 		/* A random value where it stops at the below value. */
 		value = 20 + random() % 10;
 		cond_batch(data, addr, value, dev_id);
-	}
-	else
+	} else
 		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
 
 	exec.exec_queue_id = exec_queue;
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index c8b5efc7b..8faca8f24 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -52,7 +52,8 @@ static void
 gen12_emit_huc_virtual_addr_state(uint64_t src_addr,
 	uint64_t dst_addr,
 	uint32_t *batch,
-	int *i) {
+	int *i)
+{
 	batch[(*i)++] = HUC_VIRTUAL_ADDR_STATE;
 
 	for (int j = 0; j < HUC_VIRTUAL_ADDR_REGION_NUM; j++) {
@@ -71,7 +72,8 @@ gen12_emit_huc_virtual_addr_state(uint64_t src_addr,
 static void
 gen12_create_batch_huc_copy(uint32_t *batch,
 	uint64_t src_addr,
-	uint64_t dst_addr) {
+	uint64_t dst_addr)
+{
 	int i = 0;
 
 	batch[i++] = HUC_IMEM_STATE;
@@ -123,7 +125,7 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 	sync.handle = syncobj_create(fd, 0);
 
-	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
+	for (int i = 0; i < BO_DICT_ENTRIES; i++) {
 		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
 		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
 		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
@@ -131,17 +133,17 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 	}
 	dinput = (char *)bo_dict[0].data;
 	srand(time(NULL));
-	for(int i=0; i < SIZE_DATA; i++) {
-		((char*) dinput)[i] = rand()/256;
+	for (int i = 0; i < SIZE_DATA; i++) {
+		((char *) dinput)[i] = rand() / 256;
 	}
 	gen12_create_batch_huc_copy(bo_dict[2].data, bo_dict[0].addr, bo_dict[1].addr);
 
 	xe_exec_wait(fd, exec_queue, ADDR_BATCH);
-	for(int i = 0; i < SIZE_DATA; i++) {
-		igt_assert(((char*) bo_dict[1].data)[i] == ((char*) bo_dict[0].data)[i]);
+	for (int i = 0; i < SIZE_DATA; i++) {
+		igt_assert(((char *) bo_dict[1].data)[i] == ((char *) bo_dict[0].data)[i]);
 	}
 
-	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
+	for (int i = 0; i < BO_DICT_ENTRIES; i++) {
 		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
 		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
 		free(bo_dict[i].data);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9d8e5920c..5491d5a34 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -390,7 +390,8 @@ static u32 get_stream_status(int fd)
 }
 
 static void
-dump_report(const uint32_t *report, uint32_t size, const char *message) {
+dump_report(const uint32_t *report, uint32_t size, const char *message)
+{
 	uint32_t i;
 	igt_debug("%s\n", message);
 	for (i = 0; i < size; i += 4) {
@@ -1821,7 +1822,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 				  delta, expected_report_timing_delta(delta,
 								      expected_timestamp_delta) ? "" : "******");
 
-			matches += expected_report_timing_delta(delta,expected_timestamp_delta);
+			matches += expected_report_timing_delta(delta, expected_timestamp_delta);
 
 			this += format_size;
 			prev += format_size;
@@ -4619,19 +4620,19 @@ exit:
 static const char *xe_engine_class_name(uint32_t engine_class)
 {
 	switch (engine_class) {
-		case DRM_XE_ENGINE_CLASS_RENDER:
-			return "rcs";
-		case DRM_XE_ENGINE_CLASS_COPY:
-			return "bcs";
-		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
-			return "vcs";
-		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
-			return "vecs";
-		case DRM_XE_ENGINE_CLASS_COMPUTE:
-			return "ccs";
-		default:
-			igt_warn("Engine class 0x%x unknown\n", engine_class);
-			return "unknown";
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "rcs";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "bcs";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "vcs";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "vecs";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "ccs";
+	default:
+		igt_warn("Engine class 0x%x unknown\n", engine_class);
+		return "unknown";
 	}
 }
 
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 88d8de9dd..adf48e0fa 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -338,7 +338,7 @@ static void pat_index_blt(struct xe_pat_param *p)
 			igt_assert_eq(p->r2_map[size/4 - 1], CLEAR_1);
 		} else {
 			igt_assert_eq(p->r2_map[0], 0);
-			igt_assert_eq(p->r2_map[size/4 - 1], size/4 -1);
+			igt_assert_eq(p->r2_map[size/4 - 1], size/4 - 1);
 		}
 
 		for (i = 0; i < 128; i++) {
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6eb21d5ec..99b0b51b2 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -58,7 +58,7 @@ static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
 static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
-static bool child_ready = false;
+static bool child_ready;
 
 typedef struct {
 	device_t device;
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9c7bf1d6f..6c82bd551 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -29,7 +29,7 @@ void process_hwconfig(void *data, uint32_t len);
 
 void dump_hex(void *buffer, int len)
 {
-	unsigned char *data = (unsigned char*)buffer;
+	unsigned char *data = (unsigned char *)buffer;
 	int k = 0;
 	for (int i = 0; i < len; i++) {
 		igt_info(" %02x", data[i]);
@@ -54,9 +54,9 @@ void dump_hex_debug(void *buffer, int len)
 static_assert(INTEL_HWCONFIG_NUM_XECU + 1 == __INTEL_HWCONFIG_KEY_LIMIT, "");
 
 #define CASE_STRINGIFY(A) case INTEL_HWCONFIG_##A: return #A;
-const char* get_hwconfig_name(int param)
+const char *get_hwconfig_name(int param)
 {
-	switch(param) {
+	switch (param) {
 	CASE_STRINGIFY(MAX_SLICES_SUPPORTED);
 	CASE_STRINGIFY(MAX_DUAL_SUBSLICES_SUPPORTED);
 	CASE_STRINGIFY(MAX_NUM_EU_PER_DSS);
@@ -149,7 +149,7 @@ const char* get_hwconfig_name(int param)
 void process_hwconfig(void *data, uint32_t len)
 {
 
-	uint32_t *d = (uint32_t*)data;
+	uint32_t *d = (uint32_t *)data;
 	uint32_t l = len / 4;
 	uint32_t pos = 0;
 	while (pos + 2 < l) {
@@ -168,7 +168,7 @@ void process_hwconfig(void *data, uint32_t len)
 
 const char *get_topo_name(int value)
 {
-	switch(value) {
+	switch (value) {
 	case DRM_XE_TOPO_DSS_GEOMETRY: return "DSS_GEOMETRY";
 	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
 	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
@@ -240,7 +240,7 @@ test_query_mem_regions(int fd)
 		igt_info("mem region %d: %s\t%#llx / %#llx\n", i,
 			mem_regions->mem_regions[i].mem_class ==
 			DRM_XE_MEM_REGION_CLASS_SYSMEM ? "SYSMEM"
-			:mem_regions->mem_regions[i].mem_class ==
+			: mem_regions->mem_regions[i].mem_class ==
 			DRM_XE_MEM_REGION_CLASS_VRAM ? "VRAM" : "?",
 			mem_regions->mem_regions[i].used,
 			mem_regions->mem_regions[i].total_size
@@ -381,13 +381,13 @@ test_query_gt_topology(int fd)
 	dump_hex_debug(topology, query.size);
 
 	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
+		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
 		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
 
 		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
 			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
 
-		for (int j=0; j< topo->num_bytes; j++)
+		for (int j = 0; j < topo->num_bytes; j++)
 			igt_info(" %02x", topo->mask[j]);
 
 		topo_types = 1 << topo->type;
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 48076ddeb..0d3af067d 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -23,7 +23,7 @@
  * Test category: functionality test
  */
 
-uint64_t wait_fence = 0;
+uint64_t wait_fence;
 
 static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		    uint64_t addr, uint64_t size, uint64_t val)
-- 
2.25.1

