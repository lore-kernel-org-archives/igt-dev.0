Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16B0606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 03:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TtNtL4nQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0A910E00C;
	Mon,  2 Nov 2026 03:53:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0CB10E00C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793591541; x=1825127541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C4GYkZYkpoYoUwcTKI0FRO4EEArQ//m7El/mey9ItE8=;
 b=TtNtL4nQYjPxZ3X4PnPXR9UV8DGnCRaUsCvzy1OgJyptQ812bRutXJbu
 uy0Hkx9TUK8AqlO3/d2eBbYdrYfwR9FV52BjXCC9yjPmoV3ZnVspIYQzS
 xlntKqCCLFEPgZTHts77Vpl0HewMhHkCy4iKkpY/P5V1lOtpgrSESMv+j
 wixd9sxk1R/KBMNgNIOobBTZyyNy0TZDjP/996vU0C088+9OBLChGMY/3
 CYuMoA+Ok8mywBobUMRlYWmmalRsgBML8VVZnF+VqVqnrylL7SyOYILGd
 JAB2O0N+bEJBOzJ4JiR6ShCr9CbxRmwMkv8JVEzpbIP0kzHnU+pZpE8PT A==;
X-CSE-ConnectionGUID: w94EYYkkRC+U0fthIfBCew==
X-CSE-MsgGUID: AvVj4s6mRJGCn3esRNnnzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2278404"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2278404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 19:52:21 -0800
X-CSE-ConnectionGUID: QFKHjjljQU+7MkSibzIzXA==
X-CSE-MsgGUID: 7/KoBLQLQx2z3c4WKAissA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5839836"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa007.jf.intel.com with ESMTP; 01 Nov 2026 19:52:19 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, gustavo.sousa@intel.com,
 arvind.yadav@intel.com
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Skip reserved PAT
 madvise indices
Date: Mon,  2 Nov 2026 03:52:18 +0000
Message-ID: <20261102035218.1579371-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

With Wa_14026539277 active, KMD marks the 2-way-coherent PAT entries as
reserved in the debugfs pat_sw_config dump and they must not be used.
Skip the PAT-index madvise subtests when the selected PAT index is
reserved instead of decoding the coherency bits of the PAT entry.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 45ec62813..2a0b89f7a 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -26,6 +26,7 @@
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_wa.h"
 #include <string.h>
 
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -1216,6 +1217,16 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
 }
 
+static bool pat_idx_is_reserved(const struct intel_pat_cache *pat_sw_config,
+				int32_t num_pat_entries,
+				uint8_t pat_idx)
+{
+	if (pat_idx >= num_pat_entries)
+		return false;
+
+	return pat_sw_config->entries[pat_idx].rsvd;
+}
+
 static void
 xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 			  int mem_attr)
@@ -2647,6 +2658,8 @@ int igt_main()
 
 	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
 	uint16_t dev_id;
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t num_pat_entries = 0;
 
 	igt_fixture() {
 		struct xe_device *xe;
@@ -2658,6 +2671,11 @@ int igt_main()
 		va_bits = xe->va_bits;
 		open_sync_file();
 		dev_id = intel_get_drm_devid(fd);
+		if (xe_wa(fd, "14026539277")) {
+			num_pat_entries = xe_get_pat_sw_config(fd, &pat_sw_config, 0);
+			igt_assert_f(num_pat_entries > 0,
+				     "Couldn't get Xe PAT software configuration\n");
+		}
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -2887,6 +2905,10 @@ int igt_main()
 			if (IS_PONTEVECCHIO(dev_id) &&
 			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
 				igt_skip("Skipping compression-related PAT index on PVC\n");
+
+			igt_skip_on_f(pat_idx_is_reserved(&pat_sw_config, num_pat_entries,
+							  s->fn(fd)),
+				      "PAT index reserved by Wa_14026539277\n");
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

