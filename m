Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C4BCCD18E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C5510E44E;
	Mon, 13 Oct 2025 13:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMxlC4eb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E96810E44E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362544; x=1791898544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDvmFRQ7WW/WjwCQ0LwU7KbgaBNmkdN6jfg23ZCvJYI=;
 b=BMxlC4ebVDjk9d5SvHGeKKI9kLgVCodc+lPC6dUMbP5L+uq3Vd1NL0fQ
 DgpBrk+GVwMGYt3bYJT2SjwCrrHtHENBgZGnbUsvXvWiaIzbD6rU1f8yg
 j8hV6KiIxDr49QvZecH4IezdjV7RFA7xmA/8xBZhjzBdQHTkCIfvC9aMW
 GxZ4MT9zcbtK1w6dPHn6GwS2IN1dlB/V3YEP+VzrX8nl3QHxLbYNtyC9Q
 ECCreVIXGMyDuNcqtbq+cP3T0iLz0zXEQWD906DfZzksXn6ko08LnVsC7
 m3P7EF//3MNZL9LKOcnU7S9gEeGiuuR7uwa3uTAV8P1QhOprqCPL+cVZz A==;
X-CSE-ConnectionGUID: oiHQeT/NQHmR2DzC0OBMyg==
X-CSE-MsgGUID: Zs44AjIUROOW7E433dvWVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73106025"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73106025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:44 -0700
X-CSE-ConnectionGUID: RPM42xlZQhqtNrEh1mJIIw==
X-CSE-MsgGUID: Q7xVkgdDRBWPZnwHzsA/wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180844528"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:44 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v10 2/3] lib/intel/intel_compute: Add kernel validation
 for compute IP versions
Date: Mon, 13 Oct 2025 13:34:34 +0000
Message-ID: <20251013133439.543393-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013133439.543393-1-sobin.thomas@intel.com>
References: <20251013133439.543393-1-sobin.thomas@intel.com>
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

Currently, there are no comprehensive checks for the availability of all
the required kernel types in compute kernel. This patch introduces
helper functions to perform kernel lookup and validation based on the
provided IP version.

The validation function ensures that the necessary kernels (square,
SIP, loop, long) are available depending on the preemption type.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 92 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 22 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9a4bcc047..4f0e86fd4 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1921,23 +1921,80 @@ static const struct {
 	},
 };
 
+static const struct intel_compute_kernels
+		*intel_compute_find_kernels(const struct intel_compute_kernels *kernels,
+					    unsigned int ip_ver)
+{
+	if (!kernels) {
+		igt_debug("%s: kernel_list is NULL\n", __func__);
+		return NULL;
+	}
+
+	while (kernels->kernel) {
+		if (ip_ver == kernels->ip_ver)
+			return kernels;
+		kernels++;
+	}
+
+	return NULL;
+}
+
+static bool validate_kernels(const struct intel_compute_kernels *kernels,
+			     bool check_preemption, bool threadgroup_preemption,
+			     unsigned int ip_ver)
+{
+	if (!kernels) {
+		igt_warn("No kernel entry found for IP version 0x%x\n", ip_ver);
+		return false;
+	}
+
+	if (!kernels->kernel) {
+		igt_warn("Missing compute square kernel for IP version 0x%x\n", ip_ver);
+		return false;
+	}
+
+	if (!check_preemption)
+		return true;
+
+	/* The following checks are only performed if preemption check is enabled. */
+	if (threadgroup_preemption && !kernels->long_kernel) {
+		igt_warn("Missing Long kernel for IP version 0x%x\n", ip_ver);
+		return false;
+	} else if (!threadgroup_preemption) {
+		if (!kernels->sip_kernel) {
+			igt_warn("Missing SIP kernel for IP version 0x%x\n", ip_ver);
+			return false;
+		}
+		if (!kernels->loop_kernel) {
+			igt_warn("Missing Loop kernel for IP version 0x%x\n", ip_ver);
+			return false;
+		}
+	}
+	return true;
+}
+
+static int find_compute_batch(unsigned int ip_ver)
+{
+	for (int batch_idx = 0; batch_idx < ARRAY_SIZE(intel_compute_batches); batch_idx++)
+		if (ip_ver == intel_compute_batches[batch_idx].ip_ver)
+			return batch_idx;
+	return -1;
+}
+
 static bool __run_intel_compute_kernel(int fd,
 				       struct drm_xe_engine_class_instance *eci,
 				       struct user_execenv *user,
 				       enum execenv_alloc_prefs alloc_prefs)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
-	unsigned int batch;
-	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
+	int batch;
+	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
 	const unsigned char *kernel;
 	unsigned int kernel_size;
 
-	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
-		if (ip_ver == intel_compute_batches[batch].ip_ver)
-			break;
-	}
-	if (batch == ARRAY_SIZE(intel_compute_batches)) {
+	batch = find_compute_batch(ip_ver);
+	if (batch < 0) {
 		igt_debug("GPU version 0x%x not supported\n", ip_ver);
 		return false;
 	}
@@ -1954,12 +2011,8 @@ static bool __run_intel_compute_kernel(int fd,
 		kernel = user->kernel;
 		kernel_size = user->kernel_size;
 	} else {
-		while (kernels->kernel) {
-			if (ip_ver == kernels->ip_ver)
-				break;
-			kernels++;
-		}
-		if (!kernels->kernel)
+		kernels = intel_compute_find_kernels(kernel_entries, ip_ver);
+		if (!validate_kernels(kernels, false, false, ip_ver))
 			return false;
 		kernel = kernels->kernel;
 		kernel_size = kernels->size;
@@ -2250,7 +2303,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	int batch;
-	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
+	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
 	enum xe_compute_preempt_type required_preempt =
 		threadgroup_preemption ? PREEMPT_TGP : PREEMPT_WMTP;
@@ -2268,21 +2321,16 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 		return false;
 	}
 
-	while (kernels->kernel) {
-		if (ip_ver == kernels->ip_ver)
-			break;
-		kernels++;
-	}
-
 	if (!is_preemptable(batch, required_preempt)) {
 		igt_debug("Preemption type %s not supported on GPU version 0x%x\n",
 			  xe_preempt_type_to_str(required_preempt), ip_ver);
 		return false;
 	}
 
-	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
-		return 0;
+	kernels = intel_compute_find_kernels(kernel_entries, ip_ver);
 
+	if (!validate_kernels(kernels, true, threadgroup_preemption, ip_ver))
+		return false;
 	intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
 							  kernels->long_kernel_size,
 							  kernels->kernel, kernels->size,
-- 
2.51.0

