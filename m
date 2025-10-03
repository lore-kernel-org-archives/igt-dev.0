Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F18DCAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 05:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D444310E86C;
	Fri,  3 Oct 2025 05:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXY10s+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A3310E86C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 05:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759469216; x=1791005216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3KNjQ5sRNyc1DNoZwLaWrZesvZTR2kPsCBtzyVWNnuI=;
 b=VXY10s+cQzaxQrkOalVdM0vXOXI5DnEGfXwBP3kENd7JcRi7ZJ4WHR5c
 A09KOZyb7ydqPzQwCISLhVMPHPttd24iiRaf1DCpnDXqbV2MUD5UN1zFs
 2wRfhz8mfZHQkvHvVdvbAXuGFrZ8eEgEJ4JETTjoqOt1L3XujYjdd0HZn
 L3PDDUI221/nW6+PUvppw+SPlubsW17+qeoL27iYxWim9RkNOCPnLaeeN
 lBNv5TZO3g+WmPgUH+1R+WVnKydQ/m659v7NB60u9yi15iJthf7ujXxOD
 tgHnPkagnJjBTcCbWaQlOt3bFAmF6hJxpjxvMWBZ+PjjNRpIrEmnozlFh Q==;
X-CSE-ConnectionGUID: g0FPhzmUR7W4lbTzlNTDxA==
X-CSE-MsgGUID: RGAQ7J32TFargwscFyVo7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="49308081"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="49308081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:26:55 -0700
X-CSE-ConnectionGUID: N0k+ZvVNTmOuQbMlteS0fA==
X-CSE-MsgGUID: rB+VAq52RIGm/NmH2OlqTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="183233873"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:26:55 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v9 2/3] lib/intel/intel_compute: Add kernel lookup and
 validation for compute IP versions
Date: Fri,  3 Oct 2025 05:26:20 +0000
Message-ID: <20251003052640.56068-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003052640.56068-1-sobin.thomas@intel.com>
References: <20251003052640.56068-1-sobin.thomas@intel.com>
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

Introduce functions to locate compute square kernels based on IP version
and validate their availability for preemption scenarios.

- intel_compute_find_kernels() returns the matching kernel entry.
- validate_kernels() ensures required kernel variants are present
  for compute and preemption kernels.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c | 90 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 69 insertions(+), 21 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index ae656a4f6..ade0b44c1 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1921,23 +1921,80 @@ static const struct {
 	},
 };
 
+static const struct intel_compute_kernels
+		*intel_compute_find_kernels(const struct intel_compute_kernels *kernels,
+		unsigned int ip_ver)
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
@@ -2270,18 +2323,13 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 		return false;
 	}
 
-	while (kernels->kernel) {
-		if (ip_ver == kernels->ip_ver)
-			break;
-		kernels++;
-	}
-
 	if (!is_preemptable(batch, required_preempt))
 		return false;
 
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

