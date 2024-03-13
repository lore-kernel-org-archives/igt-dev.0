Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4D0C54E60
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 19:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E5610F856;
	Wed, 13 Mar 2024 19:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDG3LR4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E490510F856
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710358209; x=1741894209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hg/Apf6GywGY1k5uzozXc4ALmIgji1itl3Be5SX5zg0=;
 b=lDG3LR4hwjj4dl6QNdlIaIIKfBcyNg1NsLuQ1/nGJQBDf3hfQ8yBbqlq
 pLiBEGXx8dkWFk/IWCScEVAdTXIZo0M9d7tx3tvmC8H05wsacnQy295Yn
 o0LQUse+2HCsnY1uHe/3Wn5ne5xrBIqqPGUoUMpTJ0A5ik0a89Wb2wRWg
 uBIYxLx16nKh6u3QbiYOgv/Q2BolN9W6g/4AdhwZ9vM/aEGOkW0Aa45Gt
 y3YHZWrC0fa9fqKe0Jc30HPuTZtZwpOfOt7JnuUajYvyyuFhBV4jEGue4
 Ky18NfFmvkmmd3017znEKSobgyLn727fzr3jvqCJCHynp7e95bD/EaPtF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5002799"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5002799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12445934"
Received: from unknown (HELO localhost) ([10.245.244.227])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:30:06 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t v12 4/6] lib/igt_multigpu: Add igt_foreach_gpu_chip
Date: Wed, 13 Mar 2024 20:29:43 +0100
Message-ID: <20240313192945.171395-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240313192945.171395-1-kamil.konieczny@linux.intel.com>
References: <20240313192945.171395-1-kamil.konieczny@linux.intel.com>
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

Create two macros for testing drm driver in multigpu scenarios,
first igt_foreach_gpu_chip which will work with one or more GPUs
and second igt_foreach_multigpu_chip which will require two or
more GPUs.

v2: corrected description (Kamil), rebased on corrected patches
  after Dominik review
v3: corrected descriptions, renamed function to print_gpus
  and did small refactoring (Kamil)
  fixed typo in function name (Dominik)
v4: fixed typos (Dominik)
v10: rename new macro into multi_fork_foreach_gpu_chip (Zbigniew)
v12: correct description, remove non-needed '/', moved skip to
 place where it is done, removed assert which prohibits macro to
 work for only one GPU, shorten macro name and create two
 variants of it (Janusz)

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_multigpu.c | 51 +++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_multigpu.h | 15 ++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/lib/igt_multigpu.c b/lib/igt_multigpu.c
index 9750ffda4..19f1cc7f8 100644
--- a/lib/igt_multigpu.c
+++ b/lib/igt_multigpu.c
@@ -78,9 +78,58 @@ int multigpu_open_another(int idx, unsigned int chipset)
 	int fd;
 
 	fd = drm_open_driver_another(idx, chipset);
-
 	if (chipset == DRIVER_INTEL)
 		igt_require_gem(fd);
 
 	return fd;
 }
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
+	int num;
+
+	igt_assert(gpus_wanted > 0);
+	if (gpu_count >= gpus_wanted)
+		return gpu_count;
+
+	num = print_gpus(gpus_wanted, gpu_count);
+	igt_skip_on_f(gpu_count < gpus_wanted, "Test requires at least %d GPUs, got %d, available: %d\n", gpus_wanted, gpu_count, num);
+
+	return gpu_count; /* non-reachable */
+}
+
+/**
+ * multigpu_open_filtered_card:
+ * @idx: index of GPU card, starting from 0
+ * @chipset: chipset, e.g. DRIVER_XE or DRIVER_INTEL
+ *
+ * Function opens GPU card prepared with filtered view. It also checks if
+ * opened card agrees with desired chipset or checks if opened card is
+ * functional. It do not use drm_open_* nor __drm_open_* functions.
+ * Skips on errors.
+ *
+ * Returns: opened fd for @idx card
+ */
+int multigpu_open_filtered_card(int idx, unsigned int chipset)
+{
+	int fd;
+
+	fd = drm_open_filtered_card(idx);
+	igt_assert(fd >= 0);
+	if (chipset == DRIVER_XE)
+		igt_require_xe(fd);
+	else if (chipset == DRIVER_INTEL)
+		igt_require_gem(fd);
+
+	return fd;
+}
diff --git a/lib/igt_multigpu.h b/lib/igt_multigpu.h
index 874b020c2..292208685 100644
--- a/lib/igt_multigpu.h
+++ b/lib/igt_multigpu.h
@@ -14,6 +14,9 @@ int igt_multigpu_count_class(int chipset);
 
 int multigpu_open_another(int idx, unsigned int chipset);
 
+int multigpu_acquire_view(int min_gpus_wanted, unsigned int chipset);
+int multigpu_open_filtered_card(int idx, unsigned int chipset);
+
 #define igt_foreach_gpu(fd__, chipset__) \
 	for (int igt_unique(i) = 0, fd__; \
 		(fd__ = __drm_open_driver_another(igt_unique(i)++, chipset__)) >= 0; \
@@ -25,4 +28,16 @@ int multigpu_open_another(int idx, unsigned int chipset);
 			__fd >= 0; \
 			drm_close_driver(__fd), __fd = -1)
 
+#define __igt_foreach_num_gpu_chip(__gpu_wanted, __fd, __gpu_index, __chipset) \
+	igt_multi_fork(__gpu_index, multigpu_acquire_view(__gpu_wanted, __chipset)) \
+		for (int __fd = multigpu_open_filtered_card(__gpu_index, __chipset); \
+			__fd >= 0; \
+			drm_close_driver(__fd), __fd = -1)
+
+#define igt_foreach_gpu_chip(__fd, __gpu_index, __chipset) \
+		__igt_foreach_num_gpu_chip(1, __fd, __gpu_index, __chipset)
+
+#define igt_foreach_multigpu_chip(__fd, __gpu_index, __chipset) \
+		__igt_foreach_num_gpu_chip(2, __fd, __gpu_index, __chipset)
+
 #endif /* __INTEL_MULTIGPU_H */
-- 
2.42.0

