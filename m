Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61012C8303A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 13:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC7B10E5B5;
	Tue,  1 Jul 2025 13:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7pJ8RG1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F1B10E26C
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751377999; x=1782913999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9IruyMIiGs/I8FXVvSFjGKxBgiX2UW9EfPvJAM5nSmk=;
 b=l7pJ8RG1moJJjq0Rqh0mbLlSienrcdcaELwWlr3Sv/biX2xLnS9Uo09O
 4z9HUZXwo1t2mBuheQkgU5EElMk9Iz6XWZtkzFW4UNcsdz6IrgrNliexf
 w9SStC7HtHFocD/WeAvJFVakK5pMfjIVWUREIHP3KA+fDp28K+wx3eneK
 7U8o79fD75KPT51A4psstm8Dmp9L1NdVXXLMoAwaAXIrvsVheDLtyRbl1
 nL67n1m5wQdd0mGQpm6GrQ93nWaXnaMjUB6whh/ZKsQKyAppsrI2flN2r
 N3mtjlnvZCkAVta1rYL0uxC2Zhux53dZzc79FpRvBl9EiYab/d1au7KBi A==;
X-CSE-ConnectionGUID: oIcArqpMRoGGaAjVYy7Quw==
X-CSE-MsgGUID: yq0lv7ngTuaf6X7vBqr4hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57421129"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57421129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:19 -0700
X-CSE-ConnectionGUID: /aOx27JeSQia18IyE8MWpw==
X-CSE-MsgGUID: xFYh2KMPTxuyiLNmjwzghw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154504146"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:18 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/3] lib/gpu_cmds: expose num_threads_in_tg parameter for tests
Date: Tue,  1 Jul 2025 13:53:05 +0000
Message-Id: <20250701135307.68147-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135307.68147-1-jan.maslak@intel.com>
References: <20250701135307.68147-1-jan.maslak@intel.com>
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

Expose parameter num_threads_in_tg in (gen8|xehp)_fill_interface_descriptor
functions, so that it can be set from the tests.
Also update rest of the code to accommodate this change, passing in
the default value - 1.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/gpgpu_fill.c                  |  6 +++---
 lib/gpgpu_shader.c                | 16 ++++++++++------
 lib/gpgpu_shader.h                |  1 +
 lib/gpu_cmds.c                    |  8 +++++---
 lib/gpu_cmds.h                    |  4 +++-
 lib/media_fill.c                  |  4 ++--
 lib/media_spin.c                  |  4 ++--
 tests/intel/xe_eudebug_online.c   |  2 +-
 tests/intel/xe_exec_sip.c         |  2 +-
 tests/intel/xe_exec_sip_eudebug.c |  2 +-
 tests/intel/xe_exec_store.c       |  2 +-
 11 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index f83eee5f2..09408112c 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -203,7 +203,7 @@ gen8_gpgpu_fillfunc(int i915,
 	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
 
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
-				gen8_gpgpu_kernel, sizeof(gen8_gpgpu_kernel));
+				gen8_gpgpu_kernel, sizeof(gen8_gpgpu_kernel), 1);
 
 	intel_bb_ptr_set(ibb, 0);
 
@@ -254,7 +254,7 @@ __gen9_gpgpu_fillfunc(int i915,
 
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
 							      kernel,
-							      kernel_size);
+							      kernel_size, 1);
 
 	intel_bb_ptr_set(ibb, 0);
 
@@ -350,7 +350,7 @@ void xehp_gpgpu_fillfunc(int i915,
 
 	kernel = __xehp_gpgpu_kernel(i915);
 	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
-				       kernel->size * 4, &idd);
+				       kernel->size * 4, 1, &idd);
 	gpgpu_shader_destroy(kernel);
 
 	intel_bb_ptr_set(ibb, 0);
diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index a63af0d23..b83e645e3 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -99,6 +99,7 @@ static void
 __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 		      struct intel_buf *target,
 		      unsigned int x_dim, unsigned int y_dim,
+		      uint32_t num_threads_in_tg,
 		      struct gpgpu_shader *shdr,
 		      struct gpgpu_shader *sip,
 		      uint64_t ring, bool explicit_engine)
@@ -113,7 +114,8 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, target,
 							      shdr->instr,
-							      4 * shdr->size);
+							      4 * shdr->size,
+							      num_threads_in_tg);
 	idd = intel_bb_ptr_get(ibb, interface_descriptor);
 	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
 
@@ -162,6 +164,7 @@ static void
 __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 		      struct intel_buf *target,
 		      unsigned int x_dim, unsigned int y_dim,
+		      uint32_t num_threads_in_tg,
 		      struct gpgpu_shader *shdr,
 		      struct gpgpu_shader *sip,
 		      uint64_t ring, bool explicit_engine)
@@ -176,7 +179,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
 
 	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
-				       4 * shdr->size, &idd);
+				       4 * shdr->size, num_threads_in_tg, &idd);
 	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
 
 	if (shdr->vrt != VRT_DISABLED)
@@ -241,6 +244,7 @@ static void gpgpu_alloc_gpu_addr(struct intel_bb *ibb, struct intel_buf *target)
 void gpgpu_shader_exec(struct intel_bb *ibb,
 		       struct intel_buf *target,
 		       unsigned int x_dim, unsigned int y_dim,
+		       uint32_t num_threads_in_tg,
 		       struct gpgpu_shader *shdr,
 		       struct gpgpu_shader *sip,
 		       uint64_t ring, bool explicit_engine)
@@ -253,11 +257,11 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
 		gpgpu_alloc_gpu_addr(ibb, target);
 
 	if (shdr->gen_ver >= 1250)
-		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
-				      ring, explicit_engine);
+		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, num_threads_in_tg,
+				      shdr, sip, ring, explicit_engine);
 	else
-		__xelp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
-				      ring, explicit_engine);
+		__xelp_gpgpu_execfunc(ibb, target, x_dim, y_dim, num_threads_in_tg,
+				      shdr, sip, ring, explicit_engine);
 }
 
 /**
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index ca996d574..411ad6292 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -60,6 +60,7 @@ void gpgpu_shader_dump(struct gpgpu_shader *shdr);
 void gpgpu_shader_exec(struct intel_bb *ibb,
 		       struct intel_buf *target,
 		       unsigned int x_dim, unsigned int y_dim,
+		       uint32_t num_threads_in_tg,
 		       struct gpgpu_shader *shdr,
 		       struct gpgpu_shader *sip,
 		       uint64_t ring, bool explicit_engine);
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index a6a9247dc..5c6a6e632 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -424,7 +424,8 @@ uint32_t
 gen8_fill_interface_descriptor(struct intel_bb *ibb,
 			       struct intel_buf *buf,
 			       const uint32_t kernel[][4],
-			       size_t size)
+			       size_t size,
+			       uint32_t num_threads_in_tg)
 {
 	struct gen8_interface_descriptor_data *idd;
 	uint32_t offset;
@@ -451,7 +452,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
 	idd->desc5.constant_urb_entry_read_offset = 0;
 	idd->desc5.constant_urb_entry_read_length = 1; /* grf 1 */
 
-	idd->desc6.num_threads_in_tg = 1;
+	idd->desc6.num_threads_in_tg = num_threads_in_tg;
 
 	intel_bb_ptr_add(ibb, sizeof(*idd));
 
@@ -912,6 +913,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 			       struct intel_buf *dst,
 			       const uint32_t kernel[][4],
 			       size_t size,
+			       uint32_t num_threads_in_tg,
 			       struct xehp_interface_descriptor_data *idd)
 {
 	uint32_t binding_table_offset, kernel_offset;
@@ -931,7 +933,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 	idd->desc4.binding_table_entry_count = 0;
 	idd->desc4.binding_table_pointer = (binding_table_offset >> 5);
 
-	idd->desc5.num_threads_in_tg = 1;
+	idd->desc5.num_threads_in_tg = num_threads_in_tg;
 }
 
 static uint32_t
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index 846d2122a..20e35f9bf 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -55,7 +55,8 @@ uint32_t
 gen8_fill_interface_descriptor(struct intel_bb *ibb,
 			       struct intel_buf *buf,
 			       const uint32_t kernel[][4],
-			       size_t size);
+			       size_t size,
+			       uint32_t num_threads_in_tg);
 
 uint32_t
 gen11_fill_interface_descriptor(struct intel_bb *ibb,
@@ -121,6 +122,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 			       struct intel_buf *dst,
 			       const uint32_t kernel[][4],
 			       size_t size,
+			       uint32_t num_threads_in_tg,
 			       struct xehp_interface_descriptor_data *idd);
 
 void
diff --git a/lib/media_fill.c b/lib/media_fill.c
index 88d83061a..a2f2e8666 100644
--- a/lib/media_fill.c
+++ b/lib/media_fill.c
@@ -205,7 +205,7 @@ gen8_media_fillfunc(int i915,
 	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
 					gen8_media_kernel,
-					sizeof(gen8_media_kernel));
+					sizeof(gen8_media_kernel), 1);
 	intel_bb_ptr_set(ibb, 0);
 
 	/* media pipeline */
@@ -250,7 +250,7 @@ __gen9_media_fillfunc(int i915,
 	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
 							      kernel,
-							      kernel_size);
+							      kernel_size, 1);
 	intel_bb_ptr_set(ibb, 0);
 
 	/* media pipeline */
diff --git a/lib/media_spin.c b/lib/media_spin.c
index d2345d153..2b81e99d1 100644
--- a/lib/media_spin.c
+++ b/lib/media_spin.c
@@ -109,7 +109,7 @@ gen8_media_spinfunc(int i915, struct intel_buf *buf, uint32_t spins)
 
 	curbe_buffer = gen8_spin_curbe_buffer_data(ibb, spins);
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
-					      spin_kernel, sizeof(spin_kernel));
+					      spin_kernel, sizeof(spin_kernel), 1);
 
 	intel_bb_ptr_set(ibb, 0);
 
@@ -149,7 +149,7 @@ gen9_media_spinfunc(int i915, struct intel_buf *buf, uint32_t spins)
 
 	curbe_buffer = gen8_spin_curbe_buffer_data(ibb, spins);
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
-					      spin_kernel, sizeof(spin_kernel));
+					      spin_kernel, sizeof(spin_kernel), 1);
 
 	intel_bb_ptr_set(ibb, 0);
 
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 535f00818..0498be80a 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1116,7 +1116,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	sip = get_sip(fd, c->flags);
 
 	igt_nsec_elapsed(&ts);
-	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, sip, 0, 0);
+	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, 1, shader, sip, 0, 0);
 
 	gpgpu_shader_destroy(sip);
 	gpgpu_shader_destroy(shader);
diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 310526531..62fe48303 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -146,7 +146,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
 	struct gpgpu_shader *sip = get_sip(fd, sip_type, height / 2);
 	struct gpgpu_shader *shader = get_shader(fd, shader_type);
 
-	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
+	gpgpu_shader_exec(ibb, buf, 1, threads, 1, shader, sip, 0, 0);
 
 	if (sip)
 		gpgpu_shader_destroy(sip);
diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index e5b8ba418..b723b0b58 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -138,7 +138,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
 	struct gpgpu_shader *sip = get_sip(fd, sip_type, shader_type, height / 2);
 	struct gpgpu_shader *shader = get_shader(fd, shader_type);
 
-	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
+	gpgpu_shader_exec(ibb, buf, 1, threads, 1, shader, sip, 0, 0);
 
 	if (sip)
 		gpgpu_shader_destroy(sip);
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index bf22c3475..364169fdc 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -390,7 +390,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
 	gpgpu_shader__nop(shader);
 	gpgpu_shader__eot(shader);
 
-	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, shader, NULL, 0, 0);
+	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, 1, shader, NULL, 0, 0);
 	intel_bb_sync(ibb);
 
 	ptr = xe_bo_map(fd, ibb->handle, ibb->size);
-- 
2.34.1

