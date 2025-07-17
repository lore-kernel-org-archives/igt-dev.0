Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED1C83F37
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 09:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78E10E13F;
	Thu, 17 Jul 2025 09:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4qXsg4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E3A10E13F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752743311; x=1784279311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4g1afDGtxWRnohmEi5ZihnKTKLoDETpczSejmcLEnmM=;
 b=E4qXsg4W6dIUcadMqKOj/6hVs1afnj33W2aCv781jqMMGMpNmAvPGytS
 hrJE2JOuxkngInAumrviLp3/XH9AOe2AMdpkzfuRGXFAdpHNZ/n9G62Go
 qqVTmtvBVMmuWW5cWYB8MiaUUqJIn1fg1Ks3wPGLIcuQ1nLs6nTAqPaDR
 CacLwvIo/+C1xgmAQW5TSrLqzOuJiC/krl9TYlbeHkTdYX474IWrvbcSO
 WO7GS+e9DYyfv/Y0d4BfkPCg47yCCEg2qgiZ3vodwxaBVlA6wX8dA/Jii
 5DnlsptUtRiccUved4AEBsW3bDAIDC3JsT5fwi8eAm4bjyq85pfoMyVOC w==;
X-CSE-ConnectionGUID: Z21bRw80QFusd4CqIzEuYA==
X-CSE-MsgGUID: wHda++6rSuGBV5XkVNx9iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55129530"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="55129530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:30 -0700
X-CSE-ConnectionGUID: JzY2bKryTcSvb0zvzxa2OQ==
X-CSE-MsgGUID: TxH0X7bxSj+TlGMZl+ItpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="158444323"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:28 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, satyanarayana.k.v.p@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t 3/4] tests/intel/xe_sriov_flr: Use VRAM access helpers
 from intel_vram library
Date: Thu, 17 Jul 2025 11:08:11 +0200
Message-Id: <20250717090812.28628-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250717090812.28628-1-lukasz.laguna@intel.com>
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
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

Replace local VRAM access helper functions with the helpers provided by
the intel_vram library.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 106 +++++++------------------------------
 1 file changed, 20 insertions(+), 86 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 0c6a0c97e..3b7001ec7 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -11,6 +11,7 @@
 #include "igt_device.h"
 #include "igt_sriov_device.h"
 #include "intel_chipset.h"
+#include "intel_vram.h"
 #include "linux_scaffold.h"
 #include "xe/xe_mmio.h"
 #include "xe/xe_query.h"
@@ -676,94 +677,28 @@ struct lmem_data {
 	size_t *vf_lmem_size;
 };
 
-struct lmem_info {
-	/* pointer to the mapped area */
-	char *addr;
-	/* size of mapped area */
-	size_t size;
-};
-
 const size_t STEP = SZ_1M;
 
-static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t offset)
-{
-	int open_flags = ((prot & PROT_WRITE) != 0) ? O_RDWR : O_RDONLY;
-	struct stat st;
-	int sysfs, fd;
-	void *addr;
-
-	sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_num);
-	if (sysfs < 0) {
-		igt_debug("Failed to open sysfs for VF%d: %s\n", vf_num, strerror(errno));
-		return NULL;
-	}
-
-	fd = openat(sysfs, "resource2", open_flags | O_SYNC);
-	close(sysfs);
-	if (fd < 0) {
-		igt_debug("Failed to open resource2 for VF%d: %s\n", vf_num, strerror(errno));
-		return NULL;
-	}
-
-	if (fstat(fd, &st)) {
-		igt_debug("Failed to stat resource2 for VF%d: %s\n", vf_num, strerror(errno));
-		close(fd);
-		return NULL;
-	}
-
-	if (st.st_size < length) {
-		igt_debug("Mapping length (%zu) exceeds BAR2 size (%" PRIu64 ")\n", length, (uint64_t)st.st_size);
-		close(fd);
-		return NULL;
-	}
-
-	addr = mmap(NULL, length, prot, MAP_SHARED, fd, offset);
-	close(fd);
-	if (addr == MAP_FAILED) {
-		igt_debug("Failed mmap resource2 for VF%d: %s\n", vf_num, strerror(errno));
-		return NULL;
-	}
-
-	return addr;
-}
-
-static void munmap_vf_lmem(struct lmem_info *lmem)
-{
-	igt_debug_on_f(munmap(lmem->addr, lmem->size),
-		       "Failed munmap %p: %s\n", lmem->addr, strerror(errno));
-}
-
-static char lmem_read(const char *addr, size_t idx)
-{
-	return READ_ONCE(*(addr + idx));
-}
-
-static char lmem_write_readback(char *addr, size_t idx, char value)
-{
-	WRITE_ONCE(*(addr + idx), value);
-	return lmem_read(addr, idx);
-}
-
-static bool lmem_write_pattern(struct lmem_info *lmem, char value, size_t start, size_t step)
+static bool lmem_write_pattern(struct vram_mapping *m, uint8_t value, size_t start, size_t step)
 {
-	char read;
+	uint8_t read;
 
-	for (; start < lmem->size; start += step) {
-		read = lmem_write_readback(lmem->addr, start, value);
+	for (; start < m->size; start += step) {
+		read = intel_vram_write_readback8(m, start, value);
 		if (igt_debug_on_f(read != value, "LMEM[%zu]=%u != %u\n", start, read, value))
 			return false;
 	}
 	return true;
 }
 
-static bool lmem_contains_expected_values_(struct lmem_info *lmem,
-					   char expected, size_t start,
+static bool lmem_contains_expected_values_(struct vram_mapping *m,
+					   uint8_t expected, size_t start,
 					   size_t step)
 {
-	char read;
+	uint8_t read;
 
-	for (; start < lmem->size; start += step) {
-		read = lmem_read(lmem->addr, start);
+	for (; start < m->size; start += step) {
+		read = intel_vram_read8(m, start);
 		if (igt_debug_on_f(read != expected,
 				   "LMEM[%zu]=%u != %u\n", start, read, expected))
 			return false;
@@ -774,30 +709,29 @@ static bool lmem_contains_expected_values_(struct lmem_info *lmem,
 static bool lmem_contains_expected_values(int pf_fd, int vf_num, size_t length,
 					  char expected)
 {
-	struct lmem_info lmem = { .size = length };
+	struct vram_mapping vram;
 	bool result;
 
-	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
-	if (igt_debug_on(!lmem.addr))
+	vram = intel_vram_mmap(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
+	if (igt_debug_on(!vram.addr))
 		return false;
 
-	result = lmem_contains_expected_values_(&lmem, expected, 0, STEP);
-	munmap_vf_lmem(&lmem);
+	result = lmem_contains_expected_values_(&vram, expected, 0, STEP);
+	intel_vram_munmap(&vram);
 
 	return result;
 }
 
 static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char value)
 {
-	struct lmem_info lmem;
+	struct vram_mapping vram;
 	bool result;
 
-	lmem.size = length;
-	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
-	if (igt_debug_on(!lmem.addr))
+	vram = intel_vram_mmap(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
+	if (igt_debug_on(!vram.addr))
 		return false;
-	result = lmem_write_pattern(&lmem, value, 0, STEP);
-	munmap_vf_lmem(&lmem);
+	result = lmem_write_pattern(&vram, value, 0, STEP);
+	intel_vram_munmap(&vram);
 
 	return result;
 }
-- 
2.40.0

