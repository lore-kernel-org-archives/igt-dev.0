Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F7DCEDD84
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2229310E286;
	Wed,  9 Oct 2024 11:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxfy1hlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C190910E25E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473459; x=1760009459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8NBbsciU9C/E7zXaP8+DcskwweMFeAAzc7YuTGvPGjA=;
 b=fxfy1hlMUgf6LpyZDkzuD6dsdafSShXuO2ve2yT4TZ/zKJsqhIb37xAk
 lWSHDRvnuFtw8f/oaCAoMkjIsLRS98xGjb4zzJ5+wwzOUBJKoTlLyIxQo
 fP0gBtB/tGQ9iBAbeN3h09bR/yZ7GKsssd3ZmCkd3R27hn9ctuScFh96r
 0b/vf3sWRC+4FRnMeVNSYLL0k1aXs9xLMH347UEIPrPgAWgyyIP1uzHVB
 yCSm779L1c+NBMWQzqraWVD1Is5jorvSHSb2dcz/bk0+OvEEcTfENT+4x
 jjwp2MxFFQkhv9QI7/tdnfB2FG1houlZ26bKJnj0TcZwJgH5xsTASycLT Q==;
X-CSE-ConnectionGUID: okq2Q53rR1i+XOKG1BiCVQ==
X-CSE-MsgGUID: MRiiR4lsTQeqhKr1vaZjuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45286346"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="45286346"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:59 -0700
X-CSE-ConnectionGUID: e1/3s5PaT1CHgCRUbZfNaA==
X-CSE-MsgGUID: QrlskspNRXKbSo2+nAty0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="113700035"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.16.246])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:56 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/xe_sriov_flr: Implement clear-lmem
 subcheck
Date: Wed,  9 Oct 2024 13:30:17 +0200
Message-Id: <20241009113018.741371-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
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

Add the clear-lmem subcheck to validate the isolation and clearing of a
Virtual Function's (VF) local memory (LMEM) after a Functional Level
Reset (FLR).

The test maps the VF's LMEM, writes specific patterns to the memory,
and checks whether the content is reset for the FLRed VF or retained
for other VFs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 213 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 212 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 3bce235de..4c97c83a4 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2024 Intel Corporation. All rights reserved.
  */
 
+#include <fcntl.h>
+#include <sys/stat.h>
 #include "drmtest.h"
 #include "igt_core.h"
 #include "igt_sriov_device.h"
@@ -505,12 +507,214 @@ static void ggtt_subcheck_cleanup(struct subcheck_data *data)
 		xe_mmio_access_fini(gdata->mmio);
 }
 
+struct lmem_data {
+	struct subcheck_data base;
+	size_t *vf_lmem_size;
+};
+
+struct lmem_info {
+	/* pointer to the mapped area */
+	char *addr;
+	/* size of mapped area */
+	size_t size;
+};
+
+const size_t STEP = SZ_1M;
+
+static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t offset)
+{
+	int open_flags = ((prot & PROT_WRITE) != 0) ? O_RDWR : O_RDONLY;
+	struct stat st;
+	int sysfs, fd;
+	void *addr;
+
+	sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_num);
+	if (sysfs < 0) {
+		igt_debug("Failed to open sysfs for VF%d: %s\n", vf_num, strerror(errno));
+		return NULL;
+	}
+
+	fd = openat(sysfs, "resource2", open_flags | O_SYNC);
+	close(sysfs);
+	if (fd < 0) {
+		igt_debug("Failed to open resource2 for VF%d: %s\n", vf_num, strerror(errno));
+		return NULL;
+	}
+
+	if (fstat(fd, &st)) {
+		igt_debug("Failed to stat resource2 for VF%d: %s\n", vf_num, strerror(errno));
+		close(fd);
+		return NULL;
+	}
+
+	if (st.st_size < length) {
+		igt_debug("Mapping length (%lu) exceeds BAR2 size (%lu)\n", length, st.st_size);
+		close(fd);
+		return NULL;
+	}
+
+	addr = mmap(NULL, length, prot, MAP_SHARED, fd, offset);
+	close(fd);
+	if (addr == MAP_FAILED) {
+		igt_debug("Failed mmap resource2 for VF%d: %s\n", vf_num, strerror(errno));
+		return NULL;
+	}
+
+	return addr;
+}
+
+static uint64_t get_vf_lmem_size(int pf_fd, int vf_num)
+{
+	/* limit to first two pages */
+	return SZ_4M;
+}
+
+static void munmap_vf_lmem(struct lmem_info *lmem)
+{
+	igt_debug_on_f(munmap(lmem->addr, lmem->size),
+		       "Failed munmap %p: %s\n", lmem->addr, strerror(errno));
+}
+
+static char lmem_read(const char *addr, size_t idx)
+{
+	return READ_ONCE(*(addr + idx));
+}
+
+static char lmem_write_readback(char *addr, size_t idx, char value)
+{
+	WRITE_ONCE(*(addr + idx), value);
+	return lmem_read(addr, idx);
+}
+
+static bool lmem_write_pattern(struct lmem_info *lmem, char value, size_t start, size_t step)
+{
+	char read;
+
+	for (; start < lmem->size; start += step) {
+		read = lmem_write_readback(lmem->addr, start, value);
+		if (igt_debug_on_f(read != value, "LMEM[%lu]=%u != %u\n", start, read, value))
+			return false;
+	}
+	return true;
+}
+
+static bool lmem_contains_expected_values_(struct lmem_info *lmem,
+					   char expected, size_t start,
+					   size_t step)
+{
+	char read;
+
+	for (; start < lmem->size; start += step) {
+		read = lmem_read(lmem->addr, start);
+		if (igt_debug_on_f(read != expected,
+				   "LMEM[%lu]=%u != %u\n", start, read, expected))
+			return false;
+	}
+	return true;
+}
+
+static bool lmem_contains_expected_values(int pf_fd, int vf_num, size_t length,
+					  char expected)
+{
+	struct lmem_info lmem = { .size = length };
+	bool result;
+
+	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
+	if (igt_debug_on(!lmem.addr))
+		return false;
+
+	result = lmem_contains_expected_values_(&lmem, expected, 0, STEP);
+	munmap_vf_lmem(&lmem);
+
+	return result;
+}
+
+static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char value)
+{
+	struct lmem_info lmem;
+	bool result;
+
+	lmem.size = length;
+	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
+	if (igt_debug_on(!lmem.addr))
+		return false;
+	result = lmem_write_pattern(&lmem, value, 0, STEP);
+	munmap_vf_lmem(&lmem);
+
+	return result;
+}
+
+static void lmem_subcheck_init(struct subcheck_data *data)
+{
+	struct lmem_data *ldata = (struct lmem_data *)data;
+
+	igt_assert_fd(data->pf_fd);
+	igt_assert(data->num_vfs);
+
+	if (!xe_has_vram(data->pf_fd)) {
+		igt_assert_neq(asprintf(&data->stop_reason,
+					"%s : No LMEM", SKIP_REASON),
+			       -1);
+		return;
+	}
+
+	ldata->vf_lmem_size = calloc(data->num_vfs, sizeof(size_t));
+	igt_assert(ldata->vf_lmem_size);
+
+	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
+		ldata->vf_lmem_size[vf_id - 1] = get_vf_lmem_size(ldata->base.pf_fd, vf_id);
+}
+
+static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+{
+	struct lmem_data *ldata = (struct lmem_data *)data;
+
+	if (data->stop_reason)
+		return;
+
+	igt_assert(vf_id > 0 && vf_id <= data->num_vfs);
+
+	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
+				    ldata->vf_lmem_size[vf_id - 1], vf_id)) {
+		igt_assert_neq(asprintf(&data->stop_reason,
+					"Vram write failed on VF%u\n", vf_id),
+			       -1);
+	}
+}
+
+static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+{
+	struct lmem_data *ldata = (struct lmem_data *)data;
+	char expected = (vf_id == flr_vf_id) ? 0 : vf_id;
+
+	if (data->stop_reason)
+		return;
+
+	if (!lmem_contains_expected_values(data->pf_fd, vf_id,
+					   ldata->vf_lmem_size[vf_id - 1], expected)) {
+		igt_assert_neq(asprintf(&data->stop_reason,
+					"LMEM check after VF%u FLR failed on VF%u\n",
+					flr_vf_id, vf_id),
+			       -1);
+	}
+}
+
+static void lmem_subcheck_cleanup(struct subcheck_data *data)
+{
+	struct lmem_data *ldata = (struct lmem_data *)data;
+
+	free(ldata->vf_lmem_size);
+}
+
 static void clear_tests(int pf_fd, int num_vfs)
 {
 	struct xe_mmio xemmio = { };
 	const unsigned int num_gts = xe_number_gt(pf_fd);
 	struct ggtt_data gdata[num_gts];
-	const unsigned int num_checks = num_gts;
+	struct lmem_data ldata = {
+		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
+	};
+	const unsigned int num_checks = num_gts + 1;
 	struct subcheck checks[num_checks];
 	int i;
 
@@ -528,6 +732,13 @@ static void clear_tests(int pf_fd, int num_vfs)
 			.cleanup = ggtt_subcheck_cleanup
 		};
 	}
+	checks[i++] = (struct subcheck) {
+		.data = (struct subcheck_data *)&ldata,
+		.name = "clear-lmem",
+		.init = lmem_subcheck_init,
+		.prepare_vf = lmem_subcheck_prepare_vf,
+		.verify_vf = lmem_subcheck_verify_vf,
+		.cleanup = lmem_subcheck_cleanup };
 	igt_assert_eq(i, num_checks);
 
 	verify_flr(pf_fd, num_vfs, checks, num_checks);
-- 
2.31.1

