Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713AFCD4F28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 07:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D14410E0C0;
	Thu, 13 Nov 2025 07:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQXYTelW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E59010E0C0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763017521; x=1794553521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DtkycbDOBTpaMiIcxsvb5erDsS5gROwNbDy7s4u7JA8=;
 b=VQXYTelWmMrRXNgku8feTJgSF74k04pfcVr+JDStrR77Av7sUuFIrEDp
 IgXQfWn7oiGdq5KDmMCcFmA4bDeC4gR5H7CvycFUfu2Poqc/SGO1G/W/N
 NXQmStGJJHHZ4s6d4VKv8wiE87ePQtBzesH2mPkmJebgN7z9ry/oj7Ms+
 La1MqHrWOwVyCqVBq1AsxKbWYDwu3Z6yJu4fN2mLGtHEEZQ9LfQti5PwV
 NNioe0KwDRAHJj+FDxAUyl4dju2F+acE4aK8FRijz7dQZo9+no+kTiscu
 USeqv8DyMUy8Z8RNa8EjLjf9s7q12AZZhGcyUBHZo7INrdh3mc1gJRB8i Q==;
X-CSE-ConnectionGUID: /mSDxraISE+aD8oLFmQukg==
X-CSE-MsgGUID: iNts3zc0S3ibY9e8yiAO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65126807"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65126807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:05:20 -0800
X-CSE-ConnectionGUID: st+5kZzbQUWKEvKgYFO4pw==
X-CSE-MsgGUID: c65qWh+WTZeNwWT24IMioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="226722962"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by orviesa001.jf.intel.com with ESMTP; 12 Nov 2025 23:05:22 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] tests/intel/xe_pat: add helper funtion to read PAT table
Date: Thu, 13 Nov 2025 07:05:02 +0000
Message-ID: <20251113070502.2148615-1-x.wang@intel.com>
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

Added a helper function to read and parse PAT entries from the
debugfs file, including decoding of PAT fields and reserved entry
info.

Updates the pat_index_all test to utilize the parsed PAT table for
more accurate detection of hardware-reserved PAT indices on Gen20+
devices, and prints detailed PAT entry information for debugging.

CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_pat.c | 118 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b11..36d429c97 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -77,6 +77,96 @@ static void userptr_coh_none(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+#define BITS_TO(n)		(n >= sizeof(long) * 8 ? ~0 : (1UL << (n)) - 1)
+#define BITMASK(high, low)	(uint32_t)(BITS_TO(high+1) & ~BITS_TO(low))
+#define FIELD_GET(val, high, low)	(((val) & (BITMASK(high, low))) >> (low))
+#define FIELD_GET_BIT(val, n)		FIELD_GET(val, n, n)
+
+#define XE_NO_PROMOTE(val)	FIELD_GET_BIT(val, 10)
+#define XE_COMP_EN(val)		FIELD_GET_BIT(val, 9)
+#define XE_L3_CLOS(val)		FIELD_GET(val, 7, 6)
+#define XE_L3_POLICY(val)	FIELD_GET(val, 5, 4)
+#define XE_L4_POLICY(val)	FIELD_GET(val, 3, 2)
+#define XE_COH_MODE(val)	FIELD_GET(val, 1, 0)
+
+#define XE_PAT_MAX_ENTRIES 32
+
+struct xe_pat_table_entry {
+	uint32_t pat;
+	bool reserved;
+};
+
+/**
+ * xe_read_pat_table - Helper function to read PAT (Page Attribute Table) entries
+ * from a debugfs file
+ *
+ * @drm_fd: DRM device fd to use with igt_debugfs_open
+ * @debugfs_name: filename under device debugfs (e.g. "gt0/pat")
+ * @xe_pat_table: Pointer to an array where the read PAT entries will be stored
+ * @max_entries: Maximum number of PAT entries to read into the table
+ *
+ * Returns: The number of PAT entries successfully read, or a negative error
+ *          code on failure (-EINVAL if debugfs_name is NULL, -ENOENT or -errno otherwise)
+ */
+static int32_t xe_read_pat_table(int drm_fd, const char *debugfs_name,
+				 struct xe_pat_table_entry *xe_pat_table, uint8_t max_entries)
+{
+	char *line = NULL;
+	size_t len = 0;
+	ssize_t read;
+	int32_t parsed = 0;
+	int fd;
+	FILE *f = NULL;
+
+	if (!debugfs_name)
+		return -EINVAL;
+
+	fd = igt_debugfs_open(drm_fd, debugfs_name, O_RDONLY);
+	if (fd < 0)
+		return -ENOENT;
+	f = fdopen(fd, "r");
+	if (!f) {
+		close(fd);
+		return -errno;
+	}
+
+	while ((read = getline(&line, &len, f)) != -1) {
+		char *p, *s;
+		const char *patterns[] = {"]", "=", "[", ",", "]", "("};
+		bool found_all = true;
+		uint32_t hv = 0;
+
+		/* search the pattern: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
+		if (strncmp(line, "PAT[", 4) != 0)
+			continue;
+
+		s = line + 4;
+		for (int i = 0; i < ARRAY_SIZE(patterns); i++) {
+			p = strchr(s, patterns[i][0]);
+			if (!p) {
+				found_all = false;
+				break;
+			}
+			s = p;
+		}
+
+		if (!found_all)
+			continue;
+
+		if (sscanf(s, "(%x", &hv) == 1) {
+			if (xe_pat_table && parsed < max_entries) {
+				xe_pat_table[parsed].pat = hv;
+				xe_pat_table[parsed++].reserved = strchr(s, '*') != NULL;
+			}
+		}
+	}
+
+	free(line);
+	fclose(f);
+
+	return parsed;
+}
+
 /**
  * SUBTEST: pat-index-all
  * Test category: functionality test
@@ -86,6 +176,7 @@ static void pat_index_all(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 	size_t size = xe_get_default_alignment(fd);
+	struct xe_pat_table_entry xe_pat_table[XE_PAT_MAX_ENTRIES] = {0};
 	uint32_t vm, bo;
 	uint8_t pat_index;
 
@@ -114,10 +205,33 @@ static void pat_index_all(int fd)
 
 	igt_assert(intel_get_max_pat_index(fd));
 
+	if (intel_gen(dev_id) >= 20) {
+		/* Read and decode the PAT entries from debugfs */
+		int32_t pat_entries = xe_read_pat_table(fd, "gt0/pat", xe_pat_table, XE_PAT_MAX_ENTRIES);
+		igt_assert(pat_entries > 0 && pat_entries <= XE_PAT_MAX_ENTRIES);
+
+		for (int i = 0; i < pat_entries; i++) {
+			uint32_t pat = xe_pat_table[i].pat;
+			igt_debug("PAT[%2d] = [ %u, %u, %u, %u, %u, %u]  (%#8x)%s\n", i,
+				  XE_NO_PROMOTE(pat),
+				  XE_COMP_EN(pat),
+				  XE_L3_CLOS(pat),
+				  XE_L3_POLICY(pat),
+				  XE_L4_POLICY(pat),
+				  XE_COH_MODE(pat),
+				  pat,
+				  xe_pat_table[i].reserved ? " *" : "");
+		}
+		igt_assert(pat_entries == intel_get_max_pat_index(fd) + 1);
+	}
+
 	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
 	     pat_index++) {
-		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
-		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
+
+		bool hw_reserved = intel_gen(dev_id) >= 20 ?
+			      xe_pat_table[pat_index].reserved : false;
+
+		if (hw_reserved) {
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
 						   pat_index, 0),
-- 
2.43.0

