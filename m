Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1E2C25B7A
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD9A10EE91;
	Fri, 17 May 2024 11:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZ0K4lAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D59210EE90
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946407; x=1747482407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e280owojJI0BgbXEeJieCvlWffnRXrroPVMCzKeBPME=;
 b=fZ0K4lAOqUto5xqgRvNnerk3vRKZ2DALzr1FQBt4xa0TgmtU0mOTSoAG
 Uxt/P4EbBefaf4S0A2WwpNCv4EySmbXphpefchcdsXvJowrIsLZiW/9KB
 rkBIJ4cQYQcLshZPH9z77M/aWgPbXjw+2eu2+NfQyyE0PixEOAw/joSYz
 artWA7i5+J6USoSYM7p/IKJkx+VtvNAReVsYUEb13brN4NHm8LSKrA4O2
 gMYotRIUxW8QpP72JeHng22Wza4yhrZwTsm5N0BOelFu9mdj1wLk4S7HX
 TfcJwJnDGWqwgHXBqwAoMLI4ivEfuMTgv+w/BpQrfn0SknH8BpB6HGG8C Q==;
X-CSE-ConnectionGUID: TVCFFVO8TFCaeNNOMJSxyQ==
X-CSE-MsgGUID: G2SRemBLQ4yf4HwI6NZW4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29620004"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29620004"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:47 -0700
X-CSE-ConnectionGUID: 5GUvRml4T7mbshlqdyNKug==
X-CSE-MsgGUID: AGIfBDPwTnC9WGjSMOY81w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977362"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:45 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 09/10] tests/intel/xe_svm: Add svm-mprotect test to
 verify SVM functionality with read-only memory access
Date: Fri, 17 May 2024 17:16:57 +0530
Message-Id: <20240517114658.810283-10-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
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

svm-mprotect test ensures that the driver correctly handles invalid
GPU write attempts to read-only memory regions in the context of SVM scenarios.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 072a602b1..86c9e86b8 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -42,6 +42,9 @@
  *
  * SUBTEST: svm-benchmark
  * Description: Verify SVM performance with a simple benchmark test.
+ *
+ * SUBTEST: svm-mprotect
+ * Description: verify SVM functionality while accessing read only memory
  */
 
 #include <fcntl.h>
@@ -345,6 +348,38 @@ static void svm_benchmark(int fd, uint32_t vm, struct drm_xe_engine_class_instan
 	igt_info("engine class %d, engine id %d memset E2E bandwidth(include sync overhead) %.3f MiB/s\n", eci->engine_class, eci->engine_instance, bandwidth);
 }
 
+/**
+ * Use mprotect to mark a chunk of memory to be read only and submit
+ * GPU command to write to this read only memory. GPU write should
+ * fail and driver should detect an invalid access error.
+ */
+static void svm_mprotect(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t *dst;
+	uint32_t size = 65536;
+
+	struct xe_buffer cmd_buf = {
+			.fd = fd,
+			.gpu_addr = (void *)(uintptr_t)gpu_va,
+			.vm = vm,
+			.size = bo_size,
+			.placement = vram_if_possible(fd, eci->gt_id),
+			.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	dst = aligned_alloc(size, size);
+	mprotect(dst, size, PROT_READ);
+
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
+
+	igt_assert_eq(__xe_submit_cmd(&cmd_buf), -EIO);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -389,6 +424,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_benchmark(fd, vm, hwe);
 
+	igt_subtest_f("svm-mprotect")
+		xe_for_each_engine(fd, hwe)
+			svm_mprotect(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

