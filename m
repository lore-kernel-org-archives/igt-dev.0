Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64068C48291
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 15:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10FD10E800;
	Fri,  2 Feb 2024 15:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="easq5Suf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0E510EC79
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706888150; x=1738424150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zwWJ9PF2h9xIB56kjAQiEPcTgkDf3Spi7zVBy/007YI=;
 b=easq5Suf+J4G9nOcuEmuq4d4BQKC2dyfZLt1/bztmBr/O8RHbU6HJboE
 olKjKVOPZ7T0SMxhDu3scfhwlKTfolUtN+LIQvOGSt7Omctg4NWzeyqGd
 eDhwFp3/2ipWBBjQqtSo+x/gGoLuns5JSO4j0DpOqiBnCPnXG0B5BaNac
 lzyvSqPWRiZe41vszwo5encREgDtfXNQewsP6PeAGmcU06Q5fMPIapd4B
 nJCSAlBFX2aWtwIaO53juVOowHeRFTUCiw1/TCwRLURtipPRJVug/UP0b
 4U+0SJpKkM+4XsJAm70VrYXw5cY+GQ2G0Vh59Y2+rgvZREDOSslwnm91L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10783786"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10783786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4846356"
Received: from unknown (HELO localhost) ([10.246.4.105])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:35:49 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t v7 6/8] lib/intel_multigpu: Add xe_multi_fork_foreach_gpu
Date: Fri,  2 Feb 2024 16:35:15 +0100
Message-ID: <20240202153517.58281-7-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202153517.58281-1-kamil.konieczny@linux.intel.com>
References: <20240202153517.58281-1-kamil.konieczny@linux.intel.com>
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

Create macro for testing Xe driver in multigpu scenarios with
the help of few new multigpu functions. Also while at this,
add documentation for public functions and use new helper in
existing multi-gpu macro.

v2: corrected description (Kamil), rebased on corrected patches
  after Dominik review
v3: corrected descriptions, renamed function to print_gpus
  and did small refactoring (Kamil)
  fixed typo in function name (Dominik)
v4: fixed typos (Dominik)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/intel_multigpu.c | 106 +++++++++++++++++++++++++++++++++++++++++--
 lib/intel_multigpu.h |  12 ++++-
 2 files changed, 112 insertions(+), 6 deletions(-)

diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
index 0e76d8aa3..689c4f10c 100644
--- a/lib/intel_multigpu.c
+++ b/lib/intel_multigpu.c
@@ -4,10 +4,19 @@
  */
 
 #include "drmtest.h"
+#include "i915/gem.h"
 #include "igt_core.h"
 #include "igt_device_scan.h"
 #include "intel_multigpu.h"
 
+/**
+ * gem_multigpu_count_class:
+ * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
+ *
+ * Function counts number of GPU cards with the help of opening all of them.
+ *
+ * Returns: number of GPUs cards found
+ */
 int gem_multigpu_count_class(int class)
 {
 	int count = 0;
@@ -18,7 +27,7 @@ int gem_multigpu_count_class(int class)
 	return count;
 }
 
-void gem_require_multigpu(int count)
+static void print_gpus(int count, int gpu_num)
 {
 	struct igt_devices_print_format fmt = {
 		.type = IGT_PRINT_SIMPLE,
@@ -26,14 +35,101 @@ void gem_require_multigpu(int count)
 	};
 	int devices;
 
-	if (igt_device_filter_count() >= count)
-		return;
-
 	igt_info("PCI devices available in the system:\n");
 
 	igt_devices_scan(true);
 	devices = igt_device_filter_pci();
 	igt_devices_print(&fmt);
 
-	igt_skip("Test requires at least %d GPUs, %d available.\n", count, devices);
+	igt_info("Test requires at least %d GPUs, got %d, available %d\n", count, gpu_num, devices);
+}
+
+/**
+ * gem_require_multigpu:
+ * @count: minimum number of GPUs required
+ *
+ * Function checks number of filtered GPU cards.
+ * On error skips and prints available GPUs found on PCI bus.
+ */
+void gem_require_multigpu(int count)
+{
+	int gpu_count = igt_device_filter_count();
+
+	if (gpu_count >= count)
+		return;
+
+	print_gpus(count, gpu_count);
+	igt_skip_on(gpu_count < count);
+}
+
+/**
+ * multigpu_acquire_view:
+ * @gpus_wanted: minimum number of GPUs required
+ * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
+ *
+ * Function prepares filtered view for GPU cards with given chipset.
+ * On error skips and prints available GPUs found on PCI bus.
+ * Returns: number of GPUs found
+ */
+int multigpu_acquire_view(int gpus_wanted, unsigned int chipset)
+{
+	int gpu_count = drm_prepare_filtered_multigpu(chipset);
+
+	igt_assert(gpus_wanted > 1);
+	if (gpu_count >= gpus_wanted)
+		return gpu_count;
+
+	print_gpus(gpus_wanted, gpu_count);
+	igt_skip_on(gpu_count < gpus_wanted);
+
+	return gpu_count; /* non-reachable */
+}
+
+/**
+ * multigpu_open_another:
+ * @idx: index of GPU card, starting from 0
+ * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
+ *
+ * Function opens GPU card with drm_open_driver_another(). For i915 it checks
+ * if opened card is functional. Skips on errors.
+ *
+ * Returns: opened fd for @idx card
+ */
+int multigpu_open_another(int idx, unsigned int chipset)
+{
+	int fd;
+
+	igt_assert(idx >= 0);
+	fd = drm_open_driver_another(idx, chipset);
+
+	if (chipset == DRIVER_INTEL)
+		igt_require_gem(fd);
+
+	return fd;
+}
+
+/**
+ * multigpu_open_filtered_card:
+ * @idx: index of GPU card, starting from 0
+ * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
+ *
+ * Function opens GPU card prepared with filtered view. It also checks if
+ * opened card agrees with desired chipset or checks if opened card is
+ * functional. Skips on errors.
+ *
+ * Returns: opened fd for @idx card
+ */
+int multigpu_open_filtered_card(int idx, unsigned int chipset)
+{
+	int fd;
+
+	igt_assert(idx >= 0);
+	fd = drm_open_filtered_card(idx);
+	igt_require(fd != -1);
+	if (chipset == DRIVER_XE)
+		igt_require_xe(fd);
+	else if (chipset == DRIVER_INTEL)
+		igt_require_gem(fd);
+
+	return fd;
 }
diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
index 0ebc73e4a..3fbf83e21 100644
--- a/lib/intel_multigpu.h
+++ b/lib/intel_multigpu.h
@@ -12,6 +12,10 @@
 void gem_require_multigpu(int count);
 int gem_multigpu_count_class(int class);
 
+int multigpu_acquire_view(int min_gpus_wanted, unsigned int chipset);
+int multigpu_open_another(int idx, unsigned int chipset);
+int multigpu_open_filtered_card(int idx, unsigned int chipset);
+
 #define igt_foreach_gpu(fd__, id__) \
 	for (int igt_unique(i) = 0, fd__; \
 		(fd__ = __drm_open_driver_another(igt_unique(i)++, id__)) >= 0; \
@@ -19,8 +23,14 @@ int gem_multigpu_count_class(int class);
 
 #define igt_multi_fork_foreach_gpu(__fd, __id) \
 	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__id)) \
-		for (int __fd = drm_open_driver_another(igt_unique(__i), __id); \
+		for (int __fd = multigpu_open_another(igt_unique(__i), __id); \
 			__fd >= 0; \
 			close(__fd), __fd = -1) \
 
+#define xe_multi_fork_foreach_gpu(__fd, __gpu_index) \
+	igt_multi_fork(__gpu_index, multigpu_acquire_view(2, DRIVER_XE)) \
+		for (int __fd = multigpu_open_filtered_card(__gpu_index, DRIVER_XE); \
+			__fd >= 0; \
+			drm_close_driver(__fd), __fd = -1) \
+
 #endif /* __INTEL_MULTIGPU_H */
-- 
2.42.0

