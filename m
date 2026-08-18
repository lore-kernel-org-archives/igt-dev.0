Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624E3C5DF70
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 10:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B2510E4B5;
	Tue, 18 Aug 2026 10:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+gvJ7Ff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE4B10E4B5
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049361; x=1818585361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/niG1TjTsVdhW6Zwn237YIiNKymzuQeXw2TOAk3LCKw=;
 b=i+gvJ7Fft/DQldZDuHkJwG8Z8mOHbLjuk0LFokmUJTpCZyXifIzzk9gW
 6DJD4clfnQqCKVkqj66kFszWn1WbzhUEBeLBPeSy4mqehOo1d53Qgg8Qg
 rI+24U9fJ1pmEJeSNQUpLIntGsnO0qOeUUgwDOxZlzFcR5EpnrAdm2/9H
 k85ahoro3l2ZUfICwRypMrAi0+xjRYohSCyqg0QPj3nXdzAdjEKRBCqnN
 DfCojYqdk39BQkru2KgdlbrxbyxqjoeKB/e+aHYJIOjQ9RApXs9h2ARGW
 MUt/ByPlXnVed+JaclPstVZduEa0qyCf+3eMN8fBZdl114fv/1iOIDP98 A==;
X-CSE-ConnectionGUID: 4cdjVn0+Tt+zYSe5n0FBiQ==
X-CSE-MsgGUID: VqdXLZMuRBCh5fZgz/9C9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75068353"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="75068353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:36:00 -0700
X-CSE-ConnectionGUID: V7cRnPkGSv6DWW6f6GIiPQ==
X-CSE-MsgGUID: wTGbWCm5S26sEIypOrvhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263458382"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:35:59 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_prefetch_fault: add L2 prefetch
 fault subtests
Date: Tue, 18 Aug 2026 16:05:45 +0530
Message-ID: <20260818103543.231667-6-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818103543.231667-4-varun.gupta@intel.com>
References: <20260818103543.231667-4-varun.gupta@intel.com>
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

Add L2 prefetch fault testing. When L1 cache policy is
set to uncached (UC), the prefetch bypasses LSC and is sourced from L2
instead.

Add a new shader gpgpu_shader__l2_prefetch_fault() that uses message
descriptor 0x49C00 (L1UC_L2C_L3UC, cache control value 4) instead of
the existing 0x99C00 (L1C_L2C_L3C, cache control value 9). Only bits
[19:16] of the descriptor differ.

Add two new subtests:
  - l2-prefetch-fault: validates L2 prefetch fault with unmapped address
    followed by hit-under-miss with mapped page
  - l2-prefetch-fault-svm: same as above but in SVM mode with HMM-backed
    CPU page table resolution

v2:
  - Include generated iga64 codes for the new shader to fix compilation
    failures (Kamil)

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_prefetch_fault.c               | 97 +++++++++++++++++++
 .../xe_prefetch_fault.c.gen.iga64_codes.c     | 17 +++-
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
index e86cd68d9..4843f56fd 100644
--- a/tests/intel/xe_prefetch_fault.c
+++ b/tests/intel/xe_prefetch_fault.c
@@ -81,6 +81,56 @@ L0:
 	)", lower_32_bits(addr), upper_32_bits(addr));
 }
 
+/**
+ * gpgpu_shader__l2_prefetch_fault:
+ * @shdr: shader to be modified
+ * @addr: ppgtt virtual address to raise L2 prefetch fault
+ *
+ * This shader can only be used when in efficient 64bit mode.
+ * For a given arbitrary ppgtt virtual address, it raises an L2 prefetch fault
+ * using load instruction with L1 uncached + L2 cached cache policy.
+ * With L1 uncached, the prefetch bypasses LSC and is sourced from L2.
+ */
+static void gpgpu_shader__l2_prefetch_fault(struct gpgpu_shader *shdr,
+					    uint64_t addr)
+{
+	igt_assert_f((addr & 0x7) == 0, "address must be aligned to QWord!\n");
+
+	emit_iga64_code(shdr, xe_l2_prefetch_fault_prefetch, R"(
+#define IGA64_FLAGS ""
+#if GFX_VER >= 4000
+#elif GFX_VER >= 3500
+L0:
+// Set base address with scalar register
+(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
+(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
+
+// A64 offset
+(W)	mov (8)		r30.0<1>:uq		0x0:uq
+
+// efficient 64bit Read with uncached L1, cached L2 and uncached L3
+// sendg ugm load - L2 prefetch (L1 bypass)
+// Message Descriptor
+//      DP_LOAD_STORE_STATELESS_DESC (HAS:2209865465)
+//      DP_CACHE_LOAD (HAS:2209865465) value 4 = L1UC_L2C_L3UC
+//      0x49C00 =>
+//      [45:44] Offset Scaling: 0 (disable)
+//      [43:22] Global Offset: 0
+//      [21] Overfetch: 0 (disable)
+//      [19:16] Cache: 4 (L1 uncached, L2 cached and L3 uncached)
+//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)
+//      [13:11] Data Size: 3 (D64)
+//      [10:10] Transpose : 1 (enable)
+//      [9:7] Vector Size: 0 (Vector length 1)
+//      [5:0] Opcode: 0 (Load)
+// Prefetch operations are implemented using a NULL destination register.
+// L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.
+(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x49C00	{A@1,$5}
+
+#endif
+	)", lower_32_bits(addr), upper_32_bits(addr));
+}
+
 static struct intel_buf *
 create_buf(int fd, int width, int height, uint32_t color)
 {
@@ -130,6 +180,17 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
 	return shader;
 }
 
+static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
+{
+	struct gpgpu_shader *shader;
+
+	shader = gpgpu_shader_create(fd);
+	gpgpu_shader__l2_prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
+	gpgpu_shader__eot(shader);
+
+	return shader;
+}
+
 /**
  * SUBTEST: prefetch-fault
  * Description: Validate L1 prefetch fault and hit-under-miss behavior with
@@ -140,6 +201,16 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
  * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
  *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
  * Run type: FULL
+ *
+ * SUBTEST: l2-prefetch-fault
+ * Description: Validate L2 prefetch fault and hit-under-miss behavior with
+ *		L1 uncached, L2 cached cache policy (fault source: L2)
+ * Run type: FULL
+ *
+ * SUBTEST: l2-prefetch-fault-svm
+ * Description: Validate L2 prefetch fault and hit-under-miss behavior in SVM
+ *		mode with L1 uncached, L2 cached cache policy (fault source: L2)
+ * Run type: FULL
  */
 static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
 				bool svm, get_shader_fn get_shader)
@@ -296,6 +367,32 @@ int igt_main()
 		}
 	}
 
+	igt_subtest_with_dynamic("l2-prefetch-fault") {
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_prefetch_fault(fd, hwe, false,
+							    get_l2_prefetch_shader);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("l2-prefetch-fault-svm") {
+		if (!svm_supported)
+			igt_skip("SVM not supported on this device, skipping.\n");
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_prefetch_fault(fd, hwe, true,
+							    get_l2_prefetch_shader);
+			}
+		}
+	}
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
index 0df7fe20e..acbfa7a75 100644
--- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
+++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
@@ -3,7 +3,22 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 153c8c0a5a3ed448d86f86bb51e8d140
+#define MD5_SUM_IGA64_ASMS 0cd443620cdd553ad899b68d685d15ef
+
+struct iga64_template const iga64_code_xe_l2_prefetch_fault_prefetch[] = {
+	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {
+		0x80000061, 0x60014220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x60114220, 0x00000000, 0xc0ded001,
+		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x80012033, 0x00000004, 0xf0041e0c, 0x9c000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
+
+	}}
+};
 
 struct iga64_template const iga64_code_xe_prefetch_fault_prefetch[] = {
 	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {
-- 
2.43.0

