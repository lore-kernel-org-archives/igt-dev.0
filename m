Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15FEC48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 20:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8165C10E097;
	Tue, 20 Feb 2024 20:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N33xyHMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8973B10E097
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708460313; x=1739996313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K7EC23cXdomUl1r+FYVnBY7uBno4tcV8Dv04T8y4THs=;
 b=N33xyHMZWNnTMxuZ0X8J/mbpNWV5hYL5Aj+aZ0BjSh2rYm4G3pQCv84M
 vqBfjKV+J0vdOkWLh1hPvxlqbZGzFMn/Wnee8CKqTzmbdItFvMRKpe8MX
 B53Vj5nBtILRl7CFnn81wYjOKRl9h/P4Bh7K6hlJUxeTTxamut1vWserc
 kh4AQDER7Wuwsk22EIKKP8+EPMsiiOGhxYERXPTAa+H6WxGE7y/HmC7Rp
 ZoeL5QT4CqIMMnQK4q+MEgdBiB1MGUQmJ7ZT3DALFJf6sosy9OKLaYeu6
 pfhNHiyvBS/JG/D6U3Ws0oxyybNs98pGzZeLg/oJ/fX2UfK925YUEIB9V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2453275"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2453275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 12:18:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5118772"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 12:18:31 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Extend it for more
 engines
Date: Tue, 20 Feb 2024 21:04:55 +0100
Message-ID: <20240220200455.31217-1-nirmoy.das@intel.com>
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

Extend the test to run on all eligible engines.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/intel_compute.c              | 21 +++++++++++++--------
 lib/intel_compute.h              |  2 +-
 tests/intel/xe_compute_preempt.c | 17 +++++++++++++----
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index eab407a0d..c5d253ebc 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1526,7 +1526,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					const unsigned char *short_kernel,
 					unsigned int short_kernel_size,
 					const unsigned char *sip_kernel,
-					unsigned int sip_kernel_size)
+					unsigned int sip_kernel_size,
+					struct drm_xe_engine_class_instance *eci)
 {
 #define XE2_BO_PREEMPT_DICT_ENTRIES 11
 	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
@@ -1578,8 +1579,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
 
-	bo_execenv_create(fd, &execenv_short, NULL);
-	bo_execenv_create(fd, &execenv_long, NULL);
+	bo_execenv_create(fd, &execenv_short, eci);
+	bo_execenv_create(fd, &execenv_long, eci);
 
 	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
 	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
@@ -1673,7 +1674,8 @@ static const struct {
 			     const unsigned char *short_kernel,
 			     unsigned int short_kernel_size,
 			     const unsigned char *sip_kernel,
-			     unsigned int sip_kernel_size);
+			     unsigned int sip_kernel_size,
+			     struct drm_xe_engine_class_instance *eci);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
 	{
@@ -1683,7 +1685,8 @@ static const struct {
 	},
 };
 
-static bool __run_intel_compute_kernel_preempt(int fd)
+static bool __run_intel_compute_kernel_preempt(int fd,
+		struct drm_xe_engine_class_instance *eci)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1720,7 +1723,8 @@ static bool __run_intel_compute_kernel_preempt(int fd)
 							  kernels->long_kernel_size,
 							  kernels->kernel, kernels->size,
 							  kernels->sip_kernel,
-							  kernels->sip_kernel_size);
+							  kernels->sip_kernel_size,
+							  eci);
 
 	return true;
 }
@@ -1732,7 +1736,8 @@ static bool __run_intel_compute_kernel_preempt(int fd)
  *
  * Returns true on success, false otherwise.
  */
-bool run_intel_compute_kernel_preempt(int fd)
+bool run_intel_compute_kernel_preempt(int fd,
+		struct drm_xe_engine_class_instance *eci)
 {
-	return __run_intel_compute_kernel_preempt(fd);
+	return __run_intel_compute_kernel_preempt(fd, eci);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index a02688ad4..fe9637b91 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -37,5 +37,5 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
-bool run_intel_compute_kernel_preempt(int fd);
+bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 31703638e..a4e0e1454 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -24,20 +24,29 @@
  * Functionality: compute openCL kernel
  */
 static void
-test_compute_preempt(int fd)
+test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), "GPU not supported\n");
 }
 
 igt_main
 {
 	int xe;
+	struct drm_xe_engine_class_instance *hwe;
 
 	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
 
-	igt_subtest("compute-preempt")
-		test_compute_preempt(xe);
+	igt_subtest_with_dynamic("compute-preempt") {
+		xe_for_each_engine(xe, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
+			    hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER)
+				continue;
+
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
+				test_compute_preempt(xe, hwe);
+		}
+	}
 
 	igt_fixture
 		drm_close_driver(xe);
-- 
2.42.0

