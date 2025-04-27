Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA146C369D5
	for <igt-dev@archiver.kernel.org>; Sun, 27 Apr 2025 17:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E39310E0A4;
	Sun, 27 Apr 2025 17:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKY1/QYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA4A10E0A4
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Apr 2025 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745774412; x=1777310412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MmMoyB8v3vj0jHkl404S+EOl2YpyV1XUaZ86/e1Ha0k=;
 b=HKY1/QYNXWTkTwrmEphqm26e/DDhzwJAdyLd2mmhZqxFDkn9kgtUAGCU
 fexJs1iD/uV4xnqJLCLVMfwaxJe6CtqD2N9WwbbT15xNf8N7hnkrRDfP0
 n63ibbrH9bZuyNn58qc0uCnDtJCrsE31NuDQxspBSM+HYRow24hJKSs2+
 nkTeKuIIt7Rq7KosMKiXtCW/tMMWMo1WgXG6yKhVL3hFgrt9trIB2rTrE
 3Lh8+OhJPMWqnnNAqgX0PiSvtK+fPrw3t6yR+99sUV/Z9307LHmZ8e1F/
 vGCeqThNYEcBY/KVpj48OqEkZIPeXH9+kA5AEbaK1zoXm6Q+Bqm0v9VtJ Q==;
X-CSE-ConnectionGUID: O3+PsEXATK+DQf0bTHzQCA==
X-CSE-MsgGUID: wMNcQTuiS1uYh9tWq2P2eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="51038225"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; d="scan'208";a="51038225"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 10:20:12 -0700
X-CSE-ConnectionGUID: axfjtxTDS+WnnsCTBIJscQ==
X-CSE-MsgGUID: 9D2tJuY2ROulUf5Gwr+SOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; d="scan'208";a="133242593"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa006.jf.intel.com with ESMTP; 27 Apr 2025 10:20:11 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel: fix error of code indent should use
 tabs where possible
Date: Sun, 27 Apr 2025 17:19:25 +0000
Message-Id: <20250427171926.1392288-2-shuicheng.lin@intel.com>
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

Fix error reported by checkpatch.pl like below for all xe_*.c under
tests/intel folder.
"
ERROR: code indent should use tabs where possible
+                        uint32_t _vm = (flags & EXTERNAL_OBJ) &&$
"

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_evict.c             |  8 ++++----
 tests/intel/xe_exec_balancer.c     |  2 +-
 tests/intel/xe_exec_compute_mode.c |  2 +-
 tests/intel/xe_exec_fault_mode.c   |  4 ++--
 tests/intel/xe_exec_reset.c        |  2 +-
 tests/intel/xe_exec_threads.c      |  2 +-
 tests/intel/xe_fault_injection.c   |  2 +-
 tests/intel/xe_module_load.c       |  2 +-
 tests/intel/xe_oa.c                | 26 +++++++++++++-------------
 tests/intel/xe_vm.c                | 28 ++++++++++++++--------------
 10 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 91533cc54..813fbfb99 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -94,8 +94,8 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 		int e = i % n_exec_queues;
 
 		if (i < n_execs / 2) {
-                        uint32_t _vm = (flags & EXTERNAL_OBJ) &&
-                                i < n_execs / 8 ? 0 : vm;
+			uint32_t _vm = (flags & EXTERNAL_OBJ) &&
+				i < n_execs / 8 ? 0 : vm;
 
 			igt_assert((e & 1) == (i & 1));
 			if (flags & MULTI_VM) {
@@ -272,8 +272,8 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 		int e = i % n_exec_queues;
 
 		if (i < n_execs / 2) {
-                        uint32_t _vm = (flags & EXTERNAL_OBJ) &&
-                                i < n_execs / 8 ? 0 : vm;
+			uint32_t _vm = (flags & EXTERNAL_OBJ) &&
+				i < n_execs / 8 ? 0 : vm;
 
 			igt_assert((e & 1) == (i & 1));
 			if (flags & MULTI_VM) {
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 1747e207c..ae189b07e 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -374,7 +374,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
-	          .timeline_value = USER_FENCE_VALUE },
+		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 8fba9daef..2368efe66 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -272,7 +272,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
 					      0x666);
 				igt_assert_eq(write(map_fd, data, bo_size),
-				              bo_size);
+					      bo_size);
 				data = mmap((void *)MAP_ADDRESS, bo_size,
 					    PROT_READ | PROT_WRITE, MAP_SHARED |
 					    MAP_FIXED, map_fd, 0);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ae40e099b..5e496e0a6 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -120,7 +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
-	          .timeline_value = USER_FENCE_VALUE },
+		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -308,7 +308,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
 					      0x666);
 				igt_assert_eq(write(map_fd, data, bo_size),
-				              bo_size);
+					      bo_size);
 				data = mmap((void *)MAP_ADDRESS, bo_size,
 					    PROT_READ | PROT_WRITE, MAP_SHARED |
 					    MAP_FIXED, map_fd, 0);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e2557f345..46fb51b3a 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -462,7 +462,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
-	          .timeline_value = USER_FENCE_VALUE },
+		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index be5549c84..a6a4d9fc0 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -245,7 +245,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
-	          .timeline_value = USER_FENCE_VALUE },
+		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9f3efdd7a..78a0e434a 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -253,7 +253,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
  * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
  */
 static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
-               struct fault_injection_params *fault_params)
+			   struct fault_injection_params *fault_params)
 {
 	int iter_start = 0, iter_end = 0, iter = 0;
 
diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 83e37430f..af5bcb1f3 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -37,7 +37,7 @@
 #define MIN_BAR_SIZE 256
 
 static void file_write(const char *ptr, size_t size, size_t nmemb,
-                       FILE *fp)
+		       FILE *fp)
 {
 	int count;
 
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 766f81a5e..9d8e5920c 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -858,8 +858,8 @@ get_40bit_a_delta(uint64_t value0, uint64_t value1)
 static void
 accumulate_uint32(size_t offset,
 		  uint32_t *report0,
-                  uint32_t *report1,
-                  uint64_t *delta)
+		  uint32_t *report1,
+		  uint64_t *delta)
 {
 	uint32_t value0 = *(uint32_t *)(((uint8_t *)report0) + offset);
 	uint32_t value1 = *(uint32_t *)(((uint8_t *)report1) + offset);
@@ -869,10 +869,10 @@ accumulate_uint32(size_t offset,
 
 static void
 accumulate_uint40(int a_index,
-                  uint32_t *report0,
-                  uint32_t *report1,
+		  uint32_t *report0,
+		  uint32_t *report1,
 		  enum intel_xe_oa_format_name format,
-                  uint64_t *delta)
+		  uint64_t *delta)
 {
 	uint64_t value0 = read_40bit_a_counter(report0, format, a_index),
 		 value1 = read_40bit_a_counter(report1, format, a_index);
@@ -1966,7 +1966,7 @@ static void test_blocking(uint64_t requested_oa_period,
 	param.properties_ptr = to_user_pointer(props);
 
 	perf_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
-        set_fd_flags(perf_fd, O_CLOEXEC);
+	set_fd_flags(perf_fd, O_CLOEXEC);
 
 	times(&start_times);
 
@@ -2428,7 +2428,7 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 
 	igt_debug("oa_period %s\n", pretty_print_oa_period(oa_period));
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
-        set_fd_flags(stream_fd, O_CLOEXEC);
+	set_fd_flags(stream_fd, O_CLOEXEC);
 
 	/* OA buffer is disabled, we do not expect any error status */
 	oa_status = get_stream_status(stream_fd);
@@ -2500,7 +2500,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		param.num_properties = param.num_properties - 1;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
-        set_fd_flags(stream_fd, O_CLOEXEC);
+	set_fd_flags(stream_fd, O_CLOEXEC);
 
 	while (total_len < buf_size &&
 	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
@@ -2729,7 +2729,7 @@ test_non_sampling_read_error(void)
 	uint8_t buf[1024];
 
 	stream_fd = __perf_open(drm_fd, &param, false);
-        set_fd_flags(stream_fd, O_CLOEXEC);
+	set_fd_flags(stream_fd, O_CLOEXEC);
 
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
@@ -2782,7 +2782,7 @@ test_disabled_read_error(void)
 
 	properties[ARRAY_SIZE(properties) - 1] = false; /* Set DISABLED to false */
 	stream_fd = __perf_open(drm_fd, &param, false);
-        set_fd_flags(stream_fd, O_CLOEXEC);
+	set_fd_flags(stream_fd, O_CLOEXEC);
 
 	read_2_oa_reports(default_test_set->perf_oa_format,
 			  oa_exponent,
@@ -2877,7 +2877,7 @@ test_mi_rpc(struct drm_xe_engine_class_instance *hwe)
 	intel_buf_unmap(buf);
 
 	stream_fd = __perf_open(drm_fd, &param, false);
-        set_fd_flags(stream_fd, O_CLOEXEC);
+	set_fd_flags(stream_fd, O_CLOEXEC);
 
 #define REPORT_ID 0xdeadbeef
 #define REPORT_OFFSET 0
@@ -3023,7 +3023,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 
 	igt_debug("opening xe oa stream\n");
 	stream_fd = __perf_open(drm_fd, &param, false);
-        set_fd_flags(stream_fd, O_CLOEXEC);
+	set_fd_flags(stream_fd, O_CLOEXEC);
 
 #define FOUR_REPORTS (4 * format.size)
 #define BO_REPORT_OFFSET(_r) (_r * format.size)
@@ -3896,7 +3896,7 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
 
 	stream_fd = __perf_open(drm_fd, &param, false);
-        set_fd_flags(stream_fd, O_CLOEXEC);
+	set_fd_flags(stream_fd, O_CLOEXEC);
 
 	buf = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(buf != NULL);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 5cbd56037..f04d7e391 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2463,20 +2463,20 @@ igt_main
 		{ NULL },
 	};
 
-        const struct vm_create_section {
-                const char *name;
-                __u32 flags;
-        } xe_vm_create_invalid_flags[] = {
-                { "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
-                { "xe_vm_create_scratch_fault",
-                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
-                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
-                { "xe_vm_create_scratch_fault_lr",
-                        ~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
-                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
-                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
-                { }
-        };
+	const struct vm_create_section {
+		const char *name;
+		__u32 flags;
+	} xe_vm_create_invalid_flags[] = {
+		{ "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+		{ "xe_vm_create_scratch_fault",
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+		{ "xe_vm_create_scratch_fault_lr",
+			~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
+		{ }
+	};
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-- 
2.25.1

