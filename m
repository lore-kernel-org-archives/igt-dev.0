Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60D6C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 15:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F26B10EA73;
	Wed, 19 Aug 2026 15:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RS7oqrUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F23310EA73
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787153821; x=1818689821;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hGcdod2gPCf0UMyZn2TVIFXzIcNfZvuc9ca2/TUAnsA=;
 b=RS7oqrUREcrCwXWilKh9Q+7jwlO+XM8yjXcQZxgLcNN0yfKHbMFfcy77
 uy/mRef9OCaS6pxBz4Q2jpfn5MeEE01PoJtpbDEyfuNC8E0hpTnANrcQC
 N0+NvabpJ4Xx1Xx94NBymd7m1kXgX0hsT8k8Coa4qa7w9T/7JE3+6U7n7
 f3aDh+xzu1o0+3Tp0jvmEG0QTNqVPdP4bNvIYeDHjqdS5oEox7tozKU00
 ugWpuFfIozIjo3aKRf2LzwHzkgA0+RnjdpX+kbt4g1K/TQFUzPs+MZM88
 D9MKpW+2PKFzP+HnjYI60z3zig4L3Vt0b5RjiVR3H1u3tZw0Su3dVcI/q Q==;
X-CSE-ConnectionGUID: om1ugQPeSceru7/DQkveew==
X-CSE-MsgGUID: ZO1FmDIFRzitOg/9qus7zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86793153"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86793153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 08:37:01 -0700
X-CSE-ConnectionGUID: RVMesH9sRSe5olFDgS26NQ==
X-CSE-MsgGUID: MCgKEY0ETy2Ne6dVbqWIqQ==
X-ExtLoop1: 1
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 08:36:59 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	varun.gupta@intel.com
Subject: [PATCH] Revert "tests/intel/xe_prefetch_fault: add L2 prefetch fault
 subtests"
Date: Wed, 19 Aug 2026 15:36:58 +0000
Message-ID: <20260819153658.18373-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

This reverts commit aa452bd41aaa95d4090a34b1d6705c646778ee57.
Commited wrong patch revision. Reverting this and will merge correct
version
---
 tests/intel/xe_prefetch_fault.c | 97 ---------------------------------
 1 file changed, 97 deletions(-)

diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
index 4843f56fd..e86cd68d9 100644
--- a/tests/intel/xe_prefetch_fault.c
+++ b/tests/intel/xe_prefetch_fault.c
@@ -81,56 +81,6 @@ L0:
 	)", lower_32_bits(addr), upper_32_bits(addr));
 }
 
-/**
- * gpgpu_shader__l2_prefetch_fault:
- * @shdr: shader to be modified
- * @addr: ppgtt virtual address to raise L2 prefetch fault
- *
- * This shader can only be used when in efficient 64bit mode.
- * For a given arbitrary ppgtt virtual address, it raises an L2 prefetch fault
- * using load instruction with L1 uncached + L2 cached cache policy.
- * With L1 uncached, the prefetch bypasses LSC and is sourced from L2.
- */
-static void gpgpu_shader__l2_prefetch_fault(struct gpgpu_shader *shdr,
-					    uint64_t addr)
-{
-	igt_assert_f((addr & 0x7) == 0, "address must be aligned to QWord!\n");
-
-	emit_iga64_code(shdr, xe_l2_prefetch_fault_prefetch, R"(
-#define IGA64_FLAGS ""
-#if GFX_VER >= 4000
-#elif GFX_VER >= 3500
-L0:
-// Set base address with scalar register
-(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
-(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
-
-// A64 offset
-(W)	mov (8)		r30.0<1>:uq		0x0:uq
-
-// efficient 64bit Read with uncached L1, cached L2 and uncached L3
-// sendg ugm load - L2 prefetch (L1 bypass)
-// Message Descriptor
-//      DP_LOAD_STORE_STATELESS_DESC (HAS:2209865465)
-//      DP_CACHE_LOAD (HAS:2209865465) value 4 = L1UC_L2C_L3UC
-//      0x49C00 =>
-//      [45:44] Offset Scaling: 0 (disable)
-//      [43:22] Global Offset: 0
-//      [21] Overfetch: 0 (disable)
-//      [19:16] Cache: 4 (L1 uncached, L2 cached and L3 uncached)
-//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)
-//      [13:11] Data Size: 3 (D64)
-//      [10:10] Transpose : 1 (enable)
-//      [9:7] Vector Size: 0 (Vector length 1)
-//      [5:0] Opcode: 0 (Load)
-// Prefetch operations are implemented using a NULL destination register.
-// L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.
-(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x49C00	{A@1,$5}
-
-#endif
-	)", lower_32_bits(addr), upper_32_bits(addr));
-}
-
 static struct intel_buf *
 create_buf(int fd, int width, int height, uint32_t color)
 {
@@ -180,17 +130,6 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
 	return shader;
 }
 
-static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
-{
-	struct gpgpu_shader *shader;
-
-	shader = gpgpu_shader_create(fd);
-	gpgpu_shader__l2_prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
-	gpgpu_shader__eot(shader);
-
-	return shader;
-}
-
 /**
  * SUBTEST: prefetch-fault
  * Description: Validate L1 prefetch fault and hit-under-miss behavior with
@@ -201,16 +140,6 @@ static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
  * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
  *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
  * Run type: FULL
- *
- * SUBTEST: l2-prefetch-fault
- * Description: Validate L2 prefetch fault and hit-under-miss behavior with
- *		L1 uncached, L2 cached cache policy (fault source: L2)
- * Run type: FULL
- *
- * SUBTEST: l2-prefetch-fault-svm
- * Description: Validate L2 prefetch fault and hit-under-miss behavior in SVM
- *		mode with L1 uncached, L2 cached cache policy (fault source: L2)
- * Run type: FULL
  */
 static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
 				bool svm, get_shader_fn get_shader)
@@ -367,32 +296,6 @@ int igt_main()
 		}
 	}
 
-	igt_subtest_with_dynamic("l2-prefetch-fault") {
-		xe_for_each_engine(fd, hwe) {
-			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
-				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_prefetch_fault(fd, hwe, false,
-							    get_l2_prefetch_shader);
-			}
-		}
-	}
-
-	igt_subtest_with_dynamic("l2-prefetch-fault-svm") {
-		if (!svm_supported)
-			igt_skip("SVM not supported on this device, skipping.\n");
-		xe_for_each_engine(fd, hwe) {
-			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
-				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_prefetch_fault(fd, hwe, true,
-							    get_l2_prefetch_shader);
-			}
-		}
-	}
-
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.43.0

