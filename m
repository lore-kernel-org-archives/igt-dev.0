Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7D8CAC585
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 17:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648F310E584;
	Mon,  8 Sep 2025 17:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acgW0LBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988F10E583
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757351671; x=1788887671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qDJdpexZENs/1jZkv+TxKj24FITOuRt1GFppekmLQp8=;
 b=acgW0LBAK/NmiFdlE/1iBKHh2zqM3X3/5huWXK4cc1xVBTc9Hy6Pug+5
 ELb5txksOK8CPot80Jqppoh2sNuFvkTwg/2Xkn0dNq0TXMkGPP4K2Wz6h
 IEj1FXBnZtLwdYHlBNVMR4mz8wKA6ifueUycxFaMGASCC3ex2mdgsWXdY
 wUEq5il+dRO4FIhxvUqWyvXo8QyfoWyCf4+ojFEkeIDjwMT+hGuMkrzWg
 2lL0VmSEMNcdkSamyUvyejXmkxDEUyQfZSoFOzl4pJd6RqJZImJBRijLw
 7JpPBu5sgFjvL7kPxKi1n1gax27+oxHtVIftDpnESx40L4741JwSY0fgN w==;
X-CSE-ConnectionGUID: WXa4qg1wSgmwFL7kQ/vKYQ==
X-CSE-MsgGUID: EdTdfG2qQiOI5ClFeEl5Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59543992"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59543992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:14:31 -0700
X-CSE-ConnectionGUID: nJsOde/QSrC97hyF0CIWgQ==
X-CSE-MsgGUID: 3w582VPdTjuJPwJslfRiNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="178057346"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:14:31 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v2 i-g-t 1/1] tests/intel/xe_compute_preempt: GPU
 Compatibility check
Date: Mon,  8 Sep 2025 17:14:21 +0000
Message-Id: <20250908171421.1787165-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908171421.1787165-1-sobin.thomas@intel.com>
References: <20250908171421.1787165-1-sobin.thomas@intel.com>
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

On platforms that do not support walker mid-thread preemption, running
tests in forked threads can lead to inconsistent states due to
igt_skip being called mid-execution. This patch introduces a GPU
compatibility check at the beginning of the xe_compute_preempt test.
If the GPU version does not support the required features, the
entire test is skipped gracefully, ensuring consistent behavior across
platforms.

v2: Fixed review comments to move the compatibility check
    into the igt_fixture.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c              | 45 +++++++++++++++++++-------------
 lib/intel_compute.h              |  2 ++
 tests/intel/xe_compute_preempt.c |  1 +
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..2bb70824e 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2219,24 +2219,6 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
 	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
-	enum intel_driver driver = get_intel_driver(fd);
-
-	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
-		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
-			break;
-
-
-	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
-		igt_debug("GPU version 0x%x not supported\n", ip_ver);
-		return false;
-	}
-
-	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_preempt_batches[batch].compat)) {
-		igt_debug("Driver is not supported: flags %x & %x\n",
-			  COMPAT_DRIVER_FLAG(driver),
-			  intel_compute_preempt_batches[batch].compat);
-		return false;
-	}
 
 	while (kernels->kernel) {
 		if (ip_ver == kernels->ip_ver)
@@ -2260,6 +2242,31 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 
 	return true;
 }
+
+bool check_gpu_compatibility_kernel_preempt(int fd)
+{
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int batch;
+	enum intel_driver driver = get_intel_driver(fd);
+
+	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
+		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
+			break;
+
+	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
+		igt_debug("GPU version 0x%x not supported\n", ip_ver);
+		return false;
+	}
+
+	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_preempt_batches[batch].compat)) {
+		igt_debug("Driver is not supported: flags %x & %x\n",
+			COMPAT_DRIVER_FLAG(driver),
+			intel_compute_preempt_batches[batch].compat);
+		return false;
+	}
+	return true;
+}
+
 /**
  * run_intel_compute_kernel_preempt - runs compute kernels to
  * exercise preemption scenario.
@@ -2275,6 +2282,8 @@ bool run_intel_compute_kernel_preempt(int fd,
 		bool threadgroup_preemption,
 		enum execenv_alloc_prefs alloc_prefs)
 {
+	if (!check_gpu_compatibility_kernel_preempt(fd))
+		return false;
 	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption,
 						  alloc_prefs);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 412791d07..0998fd661 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -73,6 +73,8 @@ enum execenv_alloc_prefs {
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
+bool check_gpu_compatibility_kernel_preempt(int fd);
+
 bool run_intel_compute_kernel(int fd, struct user_execenv *user,
 			      enum execenv_alloc_prefs alloc_prefs);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci,
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index c9b194869..5722ef3d4 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -73,6 +73,7 @@ igt_main
 		ram_mb = igt_get_avail_ram_mb();
 		swap_mb = igt_get_total_swap_mb();
 		vram_mb = xe_visible_vram_size(xe, 0) >> 20;
+		igt_require_f(check_gpu_compatibility_kernel_preempt(xe), "GPU not supported\n");
 	}
 
 	igt_subtest_with_dynamic("compute-preempt") {
-- 
2.34.1

