Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA83CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 14:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667810E843;
	Wed, 27 Aug 2025 14:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgIhGZUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749E310E843
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756306176; x=1787842176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxoPOmvnvkTEpU8LEF8gxBrcX6CoXQBa6oW6YnT/Jkw=;
 b=QgIhGZUMH2uRZMATwyl62biXpANkROlCOjyZi4UMHG0KjBbRmoEQtU7F
 24ldij/QMpXssNP7pEVo31fXohz8XRW9joSdwCULu0yEFACy7tOaATvpD
 rwiKdxlu9DI3khQcues10kCCh+T6pBh4f7FzsaS4PceFC2v9iJE9tOw0R
 Unktsjkn3wKi36dc9edF1ETlHfb7pIWhP0rztooaDH+FOkEADDeCD2ezR
 QaJRpeRL5C9qkxL3ud6FZtjbxKU/8sGP5CjMSKyqw10QkIo7KewaznePM
 BTnTKelqlpmrdKbwkwMh5dN3bANgWwAtEBIEvUd+8ec2suLAu7mujuyFG g==;
X-CSE-ConnectionGUID: E7GIILMMRYirOncLJ+zvVA==
X-CSE-MsgGUID: Dn+05InVTHSEu+uXIxYJKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61191670"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61191670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:49:36 -0700
X-CSE-ConnectionGUID: 8f0fvsf8SMyAc96j3C+otQ==
X-CSE-MsgGUID: msVelpgyTSOA5PX0FGV3KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174246235"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:49:35 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v2 3/4] tests/intel/xe_sriov_flr: Use VRAM access
 helpers from intel_vram library
Date: Wed, 27 Aug 2025 16:49:15 +0200
Message-Id: <20250827144916.18558-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250827144916.18558-1-lukasz.laguna@intel.com>
References: <20250827144916.18558-1-lukasz.laguna@intel.com>
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
v2:
- adjust the patch for lib changes
---
 tests/intel/xe_sriov_flr.c | 104 +++++++------------------------------
 1 file changed, 18 insertions(+), 86 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index fc08703c0..1a04c6891 100644
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
@@ -774,30 +709,27 @@ static bool lmem_contains_expected_values_(struct lmem_info *lmem,
 static bool lmem_contains_expected_values(int pf_fd, int vf_num, size_t length,
 					  char expected)
 {
-	struct lmem_info lmem = { .size = length };
+	struct vram_mapping vram;
 	bool result;
 
-	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
-	if (igt_debug_on(!lmem.addr))
+	if (igt_debug_on(intel_vram_mmap(pf_fd, vf_num, 0, length, PROT_READ | PROT_WRITE, &vram)))
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
+	if (igt_debug_on(intel_vram_mmap(pf_fd, vf_num, 0, length, PROT_READ | PROT_WRITE, &vram)))
 		return false;
-	result = lmem_write_pattern(&lmem, value, 0, STEP);
-	munmap_vf_lmem(&lmem);
+	result = lmem_write_pattern(&vram, value, 0, STEP);
+	intel_vram_munmap(&vram);
 
 	return result;
 }
-- 
2.40.0

