Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D9C54798
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 19:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53A10ECB8;
	Fri, 23 Feb 2024 19:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9IiJlWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1760C10ECAF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708717989; x=1740253989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sUXA2pW6K8WDyW3JcfNuCicnJEkxnqu5h96vjIppVpQ=;
 b=P9IiJlWFSuBWR7iZ0mrZRNAelUBIqx8qbCoCupsLP/VlXFyMTh2JMEmJ
 x3L0vWCbKu7X4Zattx0IexA3zf1Df1a1z9ZB38JpT8lUgn4CJUmNCKE/O
 uz2qjdaEx1YsNt9zr6IAemZYRs62dFCiNG9S2AlV6w2RD7iw+4MtKeLyU
 oSmhbiGQMbVe+s+xmOr06yG4226gITKPFmZt8lMW3IbCgkhPtbr9/lPjV
 uNRa7+/dR23amYbkFhihw4EOjXcSE2gB5/nGnWAIduF87KwEjyx1Vvonh
 EDAZHjul3NFkIQ1SH2HTEhWvQCpqF1mdqXg0yhn5W53Y4DJ47t1yHbB8K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2900256"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2900256"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 11:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6490002"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 11:52:54 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Add compute-preempt-many
Date: Fri, 23 Feb 2024 20:39:19 +0100
Message-ID: <20240223193919.31331-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add compute-preempt-many which should exercise multiple
mid-thread preemption at a time for multiple contexts.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/intel_compute.c              | 24 +++++++++++++++---------
 lib/intel_compute.h              |  4 +++-
 tests/intel/xe_compute_preempt.c | 27 ++++++++++++++++++++++++---
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c5d253ebc..8853b5cd3 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1686,7 +1686,8 @@ static const struct {
 };
 
 static bool __run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		unsigned int count)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1719,12 +1720,16 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
 		return 0;
 
-	intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
-							  kernels->long_kernel_size,
-							  kernels->kernel, kernels->size,
-							  kernels->sip_kernel,
-							  kernels->sip_kernel_size,
-							  eci);
+	igt_fork(child, count) {
+		intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
+								  kernels->long_kernel_size,
+								  kernels->kernel, kernels->size,
+								  kernels->sip_kernel,
+								  kernels->sip_kernel_size,
+								  eci);
+	}
+
+	igt_waitchildren();
 
 	return true;
 }
@@ -1737,7 +1742,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
  * Returns true on success, false otherwise.
  */
 bool run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		unsigned int count)
 {
-	return __run_intel_compute_kernel_preempt(fd, eci);
+	return __run_intel_compute_kernel_preempt(fd, eci, count);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index fe9637b91..430bae562 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -37,5 +37,7 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
-bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
+bool run_intel_compute_kernel_preempt(int fd,
+				      struct drm_xe_engine_class_instance *eci,
+				      unsigned int count);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index a4e0e1454..fd245b655 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -22,11 +22,18 @@
  * Description:
  *      Exercise compute walker mid thread preemption scenario
  * Functionality: compute openCL kernel
+ *
+ * SUBTEST: compute-preempt-many
+ * GPU requirement: LNL
+ * Description:
+ *      Exercise parallel compute walker mid thread preemption scenario
+ * Functionality: compute openCL kernel
  */
 static void
-test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
+test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe,
+		     unsigned int count)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, count), "GPU not supported\n");
 }
 
 igt_main
@@ -44,7 +51,21 @@ igt_main
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
-				test_compute_preempt(xe, hwe);
+				test_compute_preempt(xe, hwe, 1);
+		}
+	}
+
+	igt_subtest_with_dynamic("compute-preempt-many") {
+		xe_for_each_engine(xe, hwe) {
+			/*
+			 * TODO: Render engine is getting timed out when count is high,
+			 * so for now only test with compute engine
+			 */
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
+				test_compute_preempt(xe, hwe, 100);
 		}
 	}
 
-- 
2.42.0

