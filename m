Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A925BC54FD2
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 09:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC9C10EE69;
	Thu, 30 Jul 2026 09:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpsEORSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3EA10EE34
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785404325; x=1816940325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PSlZ+oD5F4usWSGwKAUU/Cqtmf6L8KGRaV5vwzF/ReE=;
 b=TpsEORSrka8ezPAr3HLDhaI34E+ZqPUevqTep8yTFCL5XST7S6o4CgDq
 /TYmBfduAHEmYRHl6hA/VH10Ya25au376iLAhItSvntDN6jMUe+hJJpoM
 KDz5+jZHxAWbJO/rJVlhTOrEfZdIAMnzo+GJ9R8DizsanIEYsWR+n/yGy
 gBQX2PIj1AzVqAmwQeb1qfQNaxBROiG44Z4LTFhNz7Uv6g7GYbfWrR3fw
 eIdhNxUuCB9zJMNEFvCs59VkpG/HVnrwcIgZ8PwXVslHPXhwElvfeR0B8
 TE9GYjMXT2in8euER7gzmlFcMvQhbTn1PP7PkhgvEw9CeTlt9rq5sEaYI Q==;
X-CSE-ConnectionGUID: kA3c3PBNSTGmXgjr29Ky/g==
X-CSE-MsgGUID: ORtwskW8SFqVqTMMFmFLdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85892997"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85892997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:38:45 -0700
X-CSE-ConnectionGUID: Bg8ymZXfRNepHZJFETlLRQ==
X-CSE-MsgGUID: eER3J8ocS1OzVVeeerndyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="283605855"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:38:44 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH 1/2] lib/xe/xe_ggtt: Extract generic GGTT code into library
Date: Thu, 30 Jul 2026 11:38:06 +0200
Message-ID: <20260730093807.926456-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730093807.926456-1-lukasz.laguna@intel.com>
References: <20260730093807.926456-1-lukasz.laguna@intel.com>
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

Add a shared xe_ggtt library with a common GGTT definitions, including
bitfields, bitmasks and helpers.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/meson.build            |  1 +
 lib/xe/xe_ggtt.c           | 22 ++++++++++++++++++++++
 lib/xe/xe_ggtt.h           | 21 +++++++++++++++++++++
 lib/xe/xe_mmio.h           |  3 +--
 tests/intel/xe_sriov_flr.c | 31 ++++++++++++++++---------------
 5 files changed, 61 insertions(+), 17 deletions(-)
 create mode 100644 lib/xe/xe_ggtt.c
 create mode 100644 lib/xe/xe_ggtt.h

diff --git a/lib/meson.build b/lib/meson.build
index 12d78de20..3001b473e 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -126,6 +126,7 @@ lib_sources = [
 	'igt_msm.c',
 	'igt_dsc.c',
 	'igt_hook.c',
+	'xe/xe_ggtt.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
 	'xe/xe_legacy.c',
diff --git a/lib/xe/xe_ggtt.c b/lib/xe/xe_ggtt.c
new file mode 100644
index 000000000..96b189b7a
--- /dev/null
+++ b/lib/xe/xe_ggtt.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include "igt.h"
+#include "xe/xe_ggtt.h"
+
+xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd)
+{
+	if (IS_TIGERLAKE(intel_get_drm_devid(pf_fd)))
+		return TGL_GGTT_PTE_ADDR_MASK;
+
+	return GGTT_PTE_ADDR_MASK;
+}
+
+uint64_t xe_ggtt_pte_get_gpa(int pf_fd, xe_ggtt_pte_t pte)
+{
+	xe_ggtt_pte_mask_t mask = xe_ggtt_get_gpa_mask(pf_fd);
+
+	return (uint64_t)((pte & mask) >> GGTT_PTE_ADDR_SHIFT);
+}
diff --git a/lib/xe/xe_ggtt.h b/lib/xe/xe_ggtt.h
new file mode 100644
index 000000000..5e4038591
--- /dev/null
+++ b/lib/xe/xe_ggtt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_GGTT_H__
+#define __XE_GGTT_H__
+
+#include <stdint.h>
+
+#define GGTT_PTE_ADDR_MASK		GENMASK_ULL(45, 12)
+#define TGL_GGTT_PTE_ADDR_MASK		GENMASK_ULL(38, 12)
+#define   GGTT_PTE_ADDR_SHIFT		12
+
+typedef uint64_t xe_ggtt_pte_t;
+typedef uint64_t xe_ggtt_pte_mask_t;
+
+xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd);
+uint64_t xe_ggtt_pte_get_gpa(int pf_fd, xe_ggtt_pte_t pte);
+
+#endif /* __XE_GGTT_H__ */
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
index 030c50a2e..65aea65ea 100644
--- a/lib/xe/xe_mmio.h
+++ b/lib/xe/xe_mmio.h
@@ -5,6 +5,7 @@
 
 #include "lib/intel_io.h"
 #include "lib/igt_sizes.h"
+#include "lib/xe/xe_ggtt.h"
 
 #ifndef XE_MMIO_H
 #define XE_MMIO_H
@@ -12,8 +13,6 @@
 #define TILE_MMIO_SIZE		SZ_16M
 #define GGTT_OFFSET_IN_TILE	SZ_8M
 
-typedef uint64_t xe_ggtt_pte_t;
-
 struct xe_mmio {
 	int fd;
 	bool init;
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index bb702d354..556979d7b 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -16,6 +16,7 @@
 #include "intel_chipset.h"
 #include "intel_vram.h"
 #include "linux_scaffold.h"
+#include "xe/xe_ggtt.h"
 #include "xe/xe_mmio.h"
 #include "xe/xe_query.h"
 #include "xe/xe_sriov_provisioning.h"
@@ -646,8 +647,6 @@ static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
 }
 
 #define GEN12_VF_CAP_REG			0x1901f8
-#define GGTT_PTE_TEST_FIELD_MASK		GENMASK_ULL(19, 12)
-#define GGTT_PTE_ADDR_SHIFT			12
 
 struct ggtt_ops {
 	void (*set_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
@@ -693,26 +692,21 @@ static void intel_mtl_set_pte(struct xe_mmio *mmio, uint8_t tile,
 static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
 			uint32_t pte_offset, uint8_t gpa, xe_ggtt_pte_t *out)
 {
+	xe_ggtt_pte_mask_t mask = xe_ggtt_get_gpa_mask(mmio->fd);
 	xe_ggtt_pte_t pte;
 
 	pte = ggtt->get_pte(mmio, tile, pte_offset);
-	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
-	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
+	pte &= ~mask;
+	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & mask;
 	ggtt->set_pte(mmio, tile, pte_offset, pte);
 	*out = ggtt->get_pte(mmio, tile, pte_offset);
 
 	return *out == pte;
 }
 
-static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
-			  uint32_t pte_offset, uint8_t expected_gpa, xe_ggtt_pte_t *out)
+static bool check_pte_gpa(int pf_fd, xe_ggtt_pte_t pte, uint8_t expected)
 {
-	uint8_t val;
-
-	*out = ggtt->get_pte(mmio, tile, pte_offset);
-	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
-
-	return val == expected_gpa;
+	return (xe_ggtt_pte_get_gpa(pf_fd, pte) == expected);
 }
 
 static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
@@ -817,17 +811,24 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
-	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
 	struct xe_mmio *mmio = xe_mmio_for_vf(0);
+	int pf_fd = gdata->base.pf_fd;
 	xe_ggtt_pte_t pte;
 	uint32_t pte_offset;
+	bool failed = false;
 
 	if (data->stop_reason)
 		return;
 
 	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
-		if (!check_pte_gpa(&gdata->ggtt, mmio, data->tile, pte_offset,
-				   expected, &pte)) {
+		pte = gdata->ggtt.get_pte(mmio, data->tile, pte_offset);
+
+		if (!check_pte_gpa(pf_fd, pte, (vf_id == flr_vf_id) ? 0 : vf_id)) {
+			igt_debug("Wrong GGTT GPA on VF%u after VF%u FLR\n", vf_id, flr_vf_id);
+			failed = true;
+		}
+
+		if (failed) {
 			set_fail_reason(data,
 					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
 					flr_vf_id, vf_id, pte, pte_offset);
-- 
2.43.0

