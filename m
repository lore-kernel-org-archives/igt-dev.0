Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56D9C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 11:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E17610E2B7;
	Wed,  4 Jun 2025 11:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eo/z2N7n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F3310E2B7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749037841; x=1780573841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X0VNxfvHl4K98jz2d4Qfd6JBPwnyZUEX6vEqIqVeoME=;
 b=Eo/z2N7nlNkUJ0DO6knJ58urjVJH5MPJvdgS9+sPBMcg6pzNTe2a6F3E
 1JjKX1ywwMjep2NNgrK1A+w9lZHrKFJVmQTW+xix14ekss0MnyDf/MVst
 9iVnMf5NJlqMVJymr6sehB2FiB6XJDcia3K4V6Mq9zgyp8ccl8MW9BsXj
 hXqw+2qRzedEMJQe3FE+S64xc//ggz62Y76+0ZVIYsBa7X27EizIcZblC
 Y2QjNNLRgcJQmx6Po1fN8n2l1czDuffxx1plg/2ph0mvI5aAXKjJ5ACMD
 n73XQZVS4QZ/iJ1jfj01VatntOikzYNa7i8lmTIZWo6Rb4uZ/FxtHcnaQ g==;
X-CSE-ConnectionGUID: dzlLyvYlQ0WXUYM+JqS2SQ==
X-CSE-MsgGUID: 5t4dhVC+TwifCvLRBHKXDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73645594"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="73645594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:50:41 -0700
X-CSE-ConnectionGUID: Peh5vvC/RxC/Bs4Cy5k52w==
X-CSE-MsgGUID: NGAyUKezSK2nJ55JvJhbwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150444492"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:50:40 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] lib/intel_compute: add alloc preference for objects
 used in compute
Date: Wed,  4 Jun 2025 13:50:26 +0200
Message-ID: <20250604115024.117036-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
References: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
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

Compute preemption tests executed on LNL and BMG behaves different
as objects were allocated with 'vram_if_possible' strategy.
This caused LNL creates objects in system memory whereas BMG
in vram. Setting memory limits should be then adopted to appropriate
memory type.

Introduce memory allocation preference allowing tests to control
how much and what type of memory it wants to take.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c              | 91 ++++++++++++++++++++++----------
 lib/intel_compute.h              | 15 ++++--
 tests/intel/gem_compute.c        |  3 +-
 tests/intel/xe_compute.c         |  5 +-
 tests/intel/xe_compute_preempt.c |  4 +-
 5 files changed, 82 insertions(+), 36 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 06f831f68c..bfb9024ba8 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -207,6 +207,7 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
 }
 
 static void bo_execenv_bind(struct bo_execenv *execenv,
+			    enum execenv_alloc_prefs alloc_prefs,
 			    struct bo_dict_entry *bo_dict, int entries)
 {
 	int fd = execenv->fd;
@@ -230,10 +231,26 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 		sync.addr = to_user_pointer(&bo_sync->sync);
 
 		for (int i = 0; i < entries; i++) {
+			uint32_t placement, flags = 0;
+
 			bo_sync->sync = 0;
+
+			switch (alloc_prefs) {
+			case EXECENV_PREF_SYSTEM:
+				placement = system_memory(fd);
+				break;
+			case EXECENV_PREF_VRAM:
+				placement = vram_memory(fd, 0);
+				flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+				break;
+			case EXECENV_PREF_VRAM_IF_POSSIBLE:
+				placement = vram_if_possible(fd, 0);
+				flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+				break;
+			}
+
 			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
-							 vram_if_possible(fd, 0),
-							 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+							 placement, flags);
 			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
 			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
 					 bo_dict[i].size, &sync, 1);
@@ -253,6 +270,7 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
 		struct drm_i915_gem_exec_object2 *obj;
 
+		igt_assert_eq(alloc_prefs, EXECENV_PREF_SYSTEM);
 		obj = calloc(entries, sizeof(*obj));
 		execenv->obj = obj;
 
@@ -795,7 +813,8 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 static void compute_exec(int fd, const unsigned char *kernel,
 			 unsigned int size,
 			 struct drm_xe_engine_class_instance *eci,
-			 struct user_execenv *user)
+			 struct user_execenv *user,
+			 enum execenv_alloc_prefs alloc_prefs)
 {
 	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
@@ -831,7 +850,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, entries);
+	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
@@ -1078,7 +1097,8 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 static void xehp_compute_exec(int fd, const unsigned char *kernel,
 			      unsigned int size,
 			      struct drm_xe_engine_class_instance *eci,
-			      struct user_execenv *user)
+			      struct user_execenv *user,
+			      enum execenv_alloc_prefs alloc_prefs)
 {
 	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
@@ -1118,7 +1138,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, entries);
+	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
@@ -1303,7 +1323,8 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 			       unsigned int size,
 			       struct drm_xe_engine_class_instance *eci,
-			       struct user_execenv *user)
+			       struct user_execenv *user,
+			       enum execenv_alloc_prefs alloc_prefs)
 {
 	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
@@ -1334,7 +1355,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[2].size = size_input(execenv.array_size);
 	bo_dict[3].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, entries);
+	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
@@ -1682,9 +1703,10 @@ static void xe2_create_indirect_data_inc_kernel(uint32_t *addr_bo_buffer_batch,
  * @user: user-provided execution environment
  */
 static void xelpg_compute_exec(int fd, const unsigned char *kernel,
-				unsigned int size,
+			       unsigned int size,
 			       struct drm_xe_engine_class_instance *eci,
-			       struct user_execenv *user)
+			       struct user_execenv *user,
+			       enum execenv_alloc_prefs alloc_prefs)
 {
 	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
@@ -1726,7 +1748,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, entries);
+	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 
@@ -1777,7 +1799,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				unsigned int size,
 				struct drm_xe_engine_class_instance *eci,
-				struct user_execenv *user)
+				struct user_execenv *user,
+				enum execenv_alloc_prefs alloc_prefs)
 {
 	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
@@ -1822,7 +1845,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, entries);
+	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
@@ -1879,7 +1902,8 @@ static const struct {
 	void (*compute_exec)(int fd, const unsigned char *kernel,
 			     unsigned int size,
 			     struct drm_xe_engine_class_instance *eci,
-			     struct user_execenv *user);
+			     struct user_execenv *user,
+			     enum execenv_alloc_prefs alloc_prefs);
 	uint32_t compat;
 } intel_compute_batches[] = {
 	{
@@ -1926,7 +1950,8 @@ static const struct {
 
 static bool __run_intel_compute_kernel(int fd,
 				       struct drm_xe_engine_class_instance *eci,
-				       struct user_execenv *user)
+				       struct user_execenv *user,
+				       enum execenv_alloc_prefs alloc_prefs)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1967,15 +1992,16 @@ static bool __run_intel_compute_kernel(int fd,
 		kernel_size = kernels->size;
 	}
 
-	intel_compute_batches[batch].compute_exec(fd, kernel,
-						  kernel_size, eci, user);
+	intel_compute_batches[batch].compute_exec(fd, kernel, kernel_size,
+						  eci, user, alloc_prefs);
 
 	return true;
 }
 
-bool run_intel_compute_kernel(int fd, struct user_execenv *user)
+bool run_intel_compute_kernel(int fd, struct user_execenv *user,
+			      enum execenv_alloc_prefs alloc_prefs)
 {
-	return __run_intel_compute_kernel(fd, NULL, user);
+	return __run_intel_compute_kernel(fd, NULL, user, alloc_prefs);
 }
 
 /**
@@ -1990,7 +2016,8 @@ bool run_intel_compute_kernel(int fd, struct user_execenv *user)
  */
 bool xe_run_intel_compute_kernel_on_engine(int fd,
 					   struct drm_xe_engine_class_instance *eci,
-					   struct user_execenv *user)
+					   struct user_execenv *user,
+					   enum execenv_alloc_prefs alloc_prefs)
 {
 	if (!is_xe_device(fd)) {
 		igt_debug("Xe device expected\n");
@@ -2009,7 +2036,7 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
 		return false;
 	}
 
-	return __run_intel_compute_kernel(fd, eci, user);
+	return __run_intel_compute_kernel(fd, eci, user, alloc_prefs);
 }
 
 /**
@@ -2035,7 +2062,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					const unsigned char *loop_kernel,
 					unsigned int loop_kernel_size,
 					struct drm_xe_engine_class_instance *eci,
-					bool threadgroup_preemption)
+					bool threadgroup_preemption,
+					enum execenv_alloc_prefs alloc_prefs)
 {
 	struct bo_dict_entry bo_dict_long[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
@@ -2095,8 +2123,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
 	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
 
-	bo_execenv_bind(&execenv_long, bo_dict_long, entries);
-	bo_execenv_bind(&execenv_short, bo_dict_short, entries);
+	bo_execenv_bind(&execenv_long, alloc_prefs, bo_dict_long, entries);
+	bo_execenv_bind(&execenv_short, alloc_prefs, bo_dict_short, entries);
 
 	if (use_loop_kernel)
 		memcpy(bo_dict_long[0].data, loop_kernel, loop_kernel_size);
@@ -2175,7 +2203,8 @@ static const struct {
 			     const unsigned char *loop_kernel,
 			     unsigned int loop_kernel_size,
 			     struct drm_xe_engine_class_instance *eci,
-			     bool threadgroup_preemption);
+			     bool threadgroup_preemption,
+			     enum execenv_alloc_prefs alloc_prefs);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
 	{
@@ -2197,7 +2226,8 @@ static const struct {
 
 static bool __run_intel_compute_kernel_preempt(int fd,
 		struct drm_xe_engine_class_instance *eci,
-		bool threadgroup_preemption)
+		bool threadgroup_preemption,
+		enum execenv_alloc_prefs alloc_prefs)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -2238,7 +2268,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 							  kernels->loop_kernel,
 							  kernels->loop_kernel_size,
 							  eci,
-							  threadgroup_preemption);
+							  threadgroup_preemption,
+							  alloc_prefs);
 
 	return true;
 }
@@ -2254,7 +2285,9 @@ static bool __run_intel_compute_kernel_preempt(int fd,
  */
 bool run_intel_compute_kernel_preempt(int fd,
 		struct drm_xe_engine_class_instance *eci,
-		bool threadgroup_preemption)
+		bool threadgroup_preemption,
+		enum execenv_alloc_prefs alloc_prefs)
 {
-	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption);
+	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption,
+						  alloc_prefs);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index f0d1750ccb..412791d074 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -65,11 +65,20 @@ struct user_execenv {
 	uint64_t output_addr;
 };
 
+enum execenv_alloc_prefs {
+	EXECENV_PREF_SYSTEM,
+	EXECENV_PREF_VRAM,
+	EXECENV_PREF_VRAM_IF_POSSIBLE,
+};
+
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
-bool run_intel_compute_kernel(int fd, struct user_execenv *user);
+bool run_intel_compute_kernel(int fd, struct user_execenv *user,
+			      enum execenv_alloc_prefs alloc_prefs);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci,
-					   struct user_execenv *user);
+					   struct user_execenv *user,
+					   enum execenv_alloc_prefs alloc_prefs);
 bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
-				      bool threadgroup_preemption);
+				      bool threadgroup_preemption,
+				      enum execenv_alloc_prefs alloc_prefs);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index ce41cd386b..b8e7dec59c 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -27,7 +27,8 @@
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_intel_compute_kernel(fd, NULL), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel(fd, NULL, EXECENV_PREF_SYSTEM),
+		      "GPU not supported\n");
 }
 
 igt_main
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 65e32ce9dc..955edf082b 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -146,7 +146,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 
 				igt_info("GT-%d: Running compute kernel with ccs_mode %d on ccs engine %d\n",
 					 gt, m, hwe->engine_instance);
-				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL),
+				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, EXECENV_PREF_SYSTEM),
 					     "Unable to run compute kernel successfully\n");
 			}
 			drm_close_driver(fd);
@@ -174,7 +174,8 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_intel_compute_kernel(fd, NULL), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel(fd, NULL, EXECENV_PREF_SYSTEM),
+		      "GPU not supported\n");
 }
 
 igt_main
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 43ffb8dba3..3a3d7847ca 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -43,7 +43,9 @@
 static void
 test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption,
+						       EXECENV_PREF_SYSTEM),
+		      "GPU not supported\n");
 }
 
 #define CONTEXT_MB 100
-- 
2.43.0

