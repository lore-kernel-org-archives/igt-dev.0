Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2168C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 10:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6CB10E8BD;
	Wed, 26 Feb 2025 10:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkCJ3Sa/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B18110E8BD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740566700; x=1772102700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6equ1fhe7y9gD6aAwOWU3y4FQv/O/UiGRdvn8NZrk5I=;
 b=SkCJ3Sa/C4IbAiG61P0zdvaBsvIvhEigSDPHO+c9C+RgUB6WnvRFTqqB
 942UD4GDVq9YEtGHGVi+QUL0aNU5n4ifLTZA/kpiqPXOcBZnVuh5A7b9n
 HL4C06E4bC20m2to9alNFidSbatPLYkyxFx/QrzCTtogeDV1OHwG3DGGD
 3w6abbSg3sAjvbmVuy3J+FAdZ+7fM0j2vy+hdLEZTKX3IqaMpW5af7S+R
 ZlzyKzoa3QaM5/rt49muHU0rjryGXdz4Jkj/puhHKwh15MmkETAC49XY9
 Lk4U6c8KaxLhUex62l0Ffb4fFVazZdxpNU8ugfZEHRPLbr+fWk2M55Jlq Q==;
X-CSE-ConnectionGUID: 5YZyS0EWTHWNBYee5rtXSQ==
X-CSE-MsgGUID: dTr+JvQ/RGG7SRhgbTUY7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63870840"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="63870840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 02:45:00 -0800
X-CSE-ConnectionGUID: 7hcDhPZ2Q5GLjVIh62SOtA==
X-CSE-MsgGUID: C9hGT7AnRy6vGVZise1xLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117160369"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.30])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 02:44:58 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/2] lib: Add variable registers per thread (VRT) setup
Date: Wed, 26 Feb 2025 11:44:35 +0100
Message-Id: <20250226104436.257298-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

For eu debug testing purposes we need utilize all possible threads per
eu. This is possible only if we limit number of GRFs per single thread.
Add gpgpu_shader interface which allow us to setup that during pipeline
creation. For now define only only mode with 96 grfs.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpgpu_fill.c            |  2 +-
 lib/gpgpu_shader.c          | 30 +++++++++++++++++++++++++++---
 lib/gpgpu_shader.h          |  8 ++++++++
 lib/gpu_cmds.c              |  4 ++--
 lib/gpu_cmds.h              |  2 +-
 lib/iga64_generated_codes.c | 27 ++++++++++++++++++++++++++-
 lib/xehp_media.h            |  4 +++-
 7 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index fe0b8b35d..f83eee5f2 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -359,7 +359,7 @@ void xehp_gpgpu_fillfunc(int i915,
 	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
 		  PIPELINE_SELECT_GPGPU);
 	xehp_emit_state_base_address(ibb);
-	xehp_emit_state_compute_mode(ibb);
+	xehp_emit_state_compute_mode(ibb, false);
 	xehp_emit_state_binding_table_pool_alloc(ibb);
 	xehp_emit_cfe_state(ibb, THREADS);
 	xehp_emit_compute_walk(ibb, x, y, width, height, &idd, color);
diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index c591eb119..a63af0d23 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -179,6 +179,9 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 				       4 * shdr->size, &idd);
 	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
 
+	if (shdr->vrt != VRT_DISABLED)
+		idd.desc2.registers_per_thread = shdr->vrt;
+
 	if (sip && sip->size)
 		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
 	else
@@ -190,7 +193,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
 		     PIPELINE_SELECT_GPGPU);
 	xehp_emit_state_base_address(ibb);
-	xehp_emit_state_compute_mode(ibb);
+	xehp_emit_state_compute_mode(ibb, shdr->vrt != VRT_DISABLED);
 	xehp_emit_state_binding_table_pool_alloc(ibb);
 	xehp_emit_cfe_state(ibb, THREADS);
 
@@ -276,7 +279,9 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
 	shdr->max_size = 16 * 4;
 	shdr->code = malloc(4 * shdr->max_size);
 	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
+	shdr->vrt = VRT_DISABLED;
 	igt_assert(shdr->code);
+
 	return shdr;
 }
 
@@ -312,6 +317,19 @@ void gpgpu_shader_dump(struct gpgpu_shader *shdr)
 			 shdr->instr[i][2], shdr->instr[i][3]);
 }
 
+/**
+ * gpgpu_shader_set_vrt:
+ * @shdr: shader to be modified
+ * @vrt: one of accepted VRT modes
+ *
+ * Sets variable register per thread mode for given shader.
+ */
+void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes vrt)
+{
+	igt_assert(vrt == VRT_DISABLED || shdr->gen_ver >= 3000);
+	shdr->vrt = vrt;
+}
+
 /**
  * gpgpu_shader__breakpoint_on:
  * @shdr: shader to create breakpoint in
@@ -371,14 +389,20 @@ void gpgpu_shader__nop(struct gpgpu_shader *shdr)
  */
 void gpgpu_shader__eot(struct gpgpu_shader *shdr)
 {
-	emit_iga64_code(shdr, eot, "						\n\
+	if (shdr->vrt == VRT_96)
+		emit_iga64_code(shdr, eot_vrt, "				\n\
+(W)	mov (8|M0)               r80.0<1>:ud  r0.0<8;8,1>:ud			\n\
+(W)	send.gtwy (8|M0)         null r80 src1_null     0 0x02000000 {EOT}	\n\
+		");
+	else
+		emit_iga64_code(shdr, eot, "					\n\
 (W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud			\n\
 #if GEN_VER < 1250								\n\
 (W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}	\n\
 #else										\n\
 (W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}	\n\
 #endif										\n\
-	");
+		");
 }
 
 /**
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index 2ad6a7010..ca996d574 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -13,6 +13,11 @@
 struct intel_bb;
 struct intel_buf;
 
+enum gpgpu_shader_vrt_modes {
+	VRT_96 = 0x2,
+	VRT_DISABLED,
+};
+
 struct gpgpu_shader {
 	uint32_t gen_ver;
 	uint32_t size;
@@ -23,6 +28,7 @@ struct gpgpu_shader {
 	};
 	struct igt_map *labels;
 	bool illegal_opcode_exception_enable;
+	enum gpgpu_shader_vrt_modes vrt;
 };
 
 struct iga64_template {
@@ -63,6 +69,8 @@ static inline uint32_t gpgpu_shader_last_instr(struct gpgpu_shader *shdr)
 	return shdr->size / 4 - 1;
 }
 
+void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes vrt);
+
 void gpgpu_shader__wait(struct gpgpu_shader *shdr);
 void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no);
 void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr);
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index f6a9bd09f..a6a9247dc 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -1008,13 +1008,13 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
 }
 
 void
-xehp_emit_state_compute_mode(struct intel_bb *ibb)
+xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt)
 {
 
 	uint32_t dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0);
 
 	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE | dword_length);
-	intel_bb_out(ibb, 0);
+	intel_bb_out(ibb, vrt ? (0x10001) << 10 : 0); /* Enable variable number of threads */
 
 	if (dword_length)
 		intel_bb_out(ibb, 0);
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index 1b9156a80..846d2122a 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -124,7 +124,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 			       struct xehp_interface_descriptor_data *idd);
 
 void
-xehp_emit_state_compute_mode(struct intel_bb *ibb);
+xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt);
 
 void
 xehp_emit_state_binding_table_pool_alloc(struct intel_bb *ibb);
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index e1f68c968..a74a8864e 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS f0c9d803408104207f0427e387a8050c
+#define MD5_SUM_IGA64_ASMS 80bb609ce27131259d19629dc74e349f
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -747,6 +747,31 @@ struct iga64_template const iga64_code_eot[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_eot_vrt[] = {
+	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
+		0x800c0061, 0x50050220, 0x00460005, 0x00000000,
+		0x800f2031, 0x00000004, 0x3000500c, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 12, .code = (const uint32_t []) {
+		0x80030061, 0x50050220, 0x00460005, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x80034031, 0x00000004, 0x3000500c, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
+		0x800c0061, 0x50050220, 0x00460005, 0x00000000,
+		0x800f2031, 0x00000004, 0x3000500c, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 12, .code = (const uint32_t []) {
+		0x80030061, 0x50050220, 0x00460005, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x80034031, 0x00000004, 0x3000500c, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
+		0x80030061, 0x50050220, 0x00460005, 0x00000000,
+		0x80039031, 0x00000004, 0x3000500c, 0x00000000,
+	}}
+};
+
 struct iga64_template const iga64_code_nop[] = {
 	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
 		0x00000060, 0x00000000, 0x00000000, 0x00000000,
diff --git a/lib/xehp_media.h b/lib/xehp_media.h
index c08288b46..fb65b8f20 100644
--- a/lib/xehp_media.h
+++ b/lib/xehp_media.h
@@ -45,7 +45,9 @@ struct xehp_interface_descriptor_data {
 		uint32_t single_program_flow: BITRANGE(18, 18);
 		uint32_t denorm_mode: BITRANGE(19, 19);
 		uint32_t thread_preemption_disable: BITRANGE(20, 20);
-		uint32_t pad5: BITRANGE(21, 31);
+		uint32_t pad5: BITRANGE(21, 25);
+		uint32_t registers_per_thread: BITRANGE(26, 30);
+		uint32_t pad6: BITRANGE(31, 31);
 	} desc2;
 
 	struct {
-- 
2.34.1

