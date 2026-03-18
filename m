Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6112310854DE
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122AD10E78F;
	Wed, 18 Mar 2026 09:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOCIe8Wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F67110E78F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773827153; x=1805363153;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W2oXujX7PdXoatJO+lz/1SZZ8RhcR1GpULQhjrKxEEw=;
 b=JOCIe8WkFof+KNhYdmCfyD4h2BuThZrTiAuRjSHAPyTSuQlchBToGmuK
 8IcV33/XnUY2wuOftDZvJX/av4faHNLr8fSlGLaQUq0O8JYE3WCo6cC/B
 b5fT44jdezXNWq8tj8o5HgGbze0GH0pgJZgS6XfFzmdN1iUcauL2mYSWs
 naGrATE3t1IzOYSEK4SnAS52BoVoVmOGEv1I3eEUY5H0IupFk2oL95l4i
 pL/AgdohWN85cX7/LoZzZKZB7WJFmLK9QQB1Z2MPcstd7vPLnEpy50Zfe
 +6eOZ6ogORpBa7Aw0DZZVQpmumP+4Sm3KK0ZTWIIfss7ezCEUuotZ/lZN A==;
X-CSE-ConnectionGUID: fL1yzUnJToivqawWdZjTqg==
X-CSE-MsgGUID: NCDSaaNFQE+RfZc5gX94fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85955526"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85955526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:45:53 -0700
X-CSE-ConnectionGUID: rBh1YABQSLOI7f+uKOrbIA==
X-CSE-MsgGUID: v+LoC724RJST39XOgNWJDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="222790931"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa007.jf.intel.com with ESMTP; 18 Mar 2026 02:45:49 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Subject: [PATCH v2 1/3] igt/xe: Add temporary helpers for VM_Bind neg test
Date: Wed, 18 Mar 2026 15:16:55 +0530
Message-ID: <20260318094657.761076-2-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318094657.761076-1-smitha.balasubramanyam@intel.com>
References: <20260318094657.761076-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Added helper functions and UAPI macro definition required for
VM_BIND Decomp negative tests.
These helpers and definitions duplicate functionality introduced in
VLK-79231, positive test series, which is yet to be merged.
They are included here so that the negative
tests can be developed and executed independently.

Once the positive test series lands upstream, this patch can be dropped
and the tests can reuse the shared helpers and UAPI definitions.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 include/drm-uapi/xe_drm.h |   1 +
 tests/intel/xe_ccs.c      | 105 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a68..44355f6b5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1160,6 +1160,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS		(1 << 7)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index a21922ee5..8173fe902 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -11,6 +11,8 @@
 #endif
 #include <sys/ioctl.h>
 #include <sys/time.h>
+#include <sys/mman.h>
+#include <unistd.h>
 #include <malloc.h>
 #include "drm.h"
 #include "igt.h"
@@ -104,6 +106,109 @@ struct test_config {
 	if (param.write_png) \
 		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
 
+static void print_buffer_data(const void *data, size_t size, const char *label, int max_lines)
+{
+	const u8 *bytes = (const uint8_t *)data;
+	size_t lines_to_print = min((size + 15) / 16, (size_t)max_lines);
+	size_t i, j;
+
+	igt_info("Buffer Data [%s] (showing first %zu lines, %zu bytes each):\n",
+		 label, lines_to_print, min(size, lines_to_print * 16));
+
+	for (i = 0; i < lines_to_print && i * 16 < size; i++) {
+		igt_info("%s [%04zx]: ", label, i * 16);
+
+		/* Print hex bytes */
+		for (j = 0; j < 16 && (i * 16 + j) < size; j++)
+			igt_info("%02x ", bytes[i * 16 + j]);
+
+		/* Pad if last line is incomplete */
+		for (; j < 16; j++)
+			igt_info("   ");
+
+		igt_info("\n");
+	}
+
+	if (size > lines_to_print * 16)
+		igt_info("%s [...] (%zu more bytes not shown)\n",
+			 label, size - lines_to_print * 16);
+}
+
+/**
+ * verify_test_pattern() - Verify buffer contains expected test pattern
+ * @buffer: pointer to buffer data
+ * @size: buffer size in bytes
+ * @label: label for debug output
+ * @return: true if pattern is correct, false otherwise
+ */
+static bool verify_test_pattern(const void *buffer, size_t size, const char *label)
+{
+	const u32 *buffer_u32 = (const u32 *)buffer;
+	size_t num_u32_elements = size / sizeof(uint32_t);
+	size_t errors = 0;
+	size_t max_errors_to_show = 10;
+
+	igt_info("Verifying test pattern in %s buffer (%zu elements)...\n",
+		 label, num_u32_elements);
+
+	for (size_t i = 0; i < num_u32_elements && errors < max_errors_to_show; i++) {
+		/* Calculate expected value based on sparse pattern with many zeros */
+		u32 expected;
+
+		switch (i & 0xf) {
+		case 0:
+			expected = 0xdeadbeef; break;
+		case 4:
+			expected = 0xefbed000; break;
+		case 8:
+			expected = 0x00cfe111; break;
+		case 12:
+			expected = 0x11e0f222; break;
+		default:
+			expected = 0x00000000; break;
+		}
+
+		if (buffer_u32[i] != expected) {
+			igt_info("Pattern mismatch at offset %zu: expected 0x%08X, found 0x%08X\n",
+				 i * sizeof(uint32_t), expected, buffer_u32[i]);
+			errors++;
+		}
+	}
+
+	if (errors == 0) {
+		igt_info("Pattern verification SUCCESS for %s buffer - all %zu elements correct\n",
+			 label, num_u32_elements);
+		return true;
+	}
+
+	igt_info("Pattern verification FAILED for %s buffer - %zu errors found%s\n",
+		 label, errors, errors >= max_errors_to_show ? " (truncated)" : "");
+	return false;
+}
+
+
+/* Simple helper to fill buffer with a more compressible pattern */
+static void fill_buffer_simple_pattern(void *ptr, size_t size)
+{
+	u32 *buffer = (uint32_t *)ptr;
+	size_t num_elements = size / sizeof(uint32_t);
+	size_t i;
+
+	/* Sparse pattern chosen to produce highly compressible data;
+	 * non‑zero sentinels every 16 dwords (0xDEADBEEF, ..)
+	 * ensure we aren’t relying on clear-zero CCS encoding.
+	 */
+	for (i = 0; i < num_elements; i += 16) {
+		buffer[i] = 0xdeadbeef;
+		if (i + 4 < num_elements)
+			buffer[i + 4] = 0xefbed000;
+		if (i + 8 < num_elements)
+			buffer[i + 8] = 0x00cfe111;
+		if (i + 12 < num_elements)
+			buffer[i + 12] = 0x11e0f222;
+	}
+}
+
 static void surf_copy(int xe,
 		      intel_ctx_t *ctx,
 		      uint64_t ahnd,
-- 
2.43.0

