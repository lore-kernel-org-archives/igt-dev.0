Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A399CD6E4D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 13:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70310E056;
	Thu, 13 Nov 2025 13:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At5mNnMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B859010E056
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763038817; x=1794574817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pFHAbx6cXlVgiAVDgb+60PPnhqcGNS6rDM9hA7cCX9g=;
 b=At5mNnMJhmnncGKevCjguS0jYjfOHRGmbXTOqGwnR4b3IIqXDj3JIEwc
 ySbEi0PoC11DpaFvJZrVUhhVioZpr28KWBzIlm+2nEmUHJhb/rJ8EG1vu
 aPCaGleqzt5PmpQ6lRss2VNblyeFgraFu7jlBhgLbm0LRDlcra2DtYuKK
 I2i0s6QrAq3MK+w4cYJCE+XnqaxkPmkVV7w6+m31r/uHcNrHRiUZvIaNS
 UDSL9lCa+a98OH8/qwqOBcKrJnKh1ojvGvEwCgefptzfLtFXJGnWEjzRD
 bk2fH2js7lZ3W2ZxY/DicXot5sxOjzHecNutkhxRMe1M4G9AssdYT4WZz A==;
X-CSE-ConnectionGUID: FyIK7LPCSXqhNj9Zb+JgUA==
X-CSE-MsgGUID: 34BKYV6zROqKG65AWceSQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64124125"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64124125"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:17 -0800
X-CSE-ConnectionGUID: E/82K6hyRNunVsMPw9H9Iw==
X-CSE-MsgGUID: vKLN6BFOQSKVsKaGe13d2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194493175"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:14 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v1 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
Date: Thu, 13 Nov 2025 18:19:36 +0530
Message-Id: <20251113124936.3878794-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113124936.3878794-1-soham.purkait@intel.com>
References: <20251113124936.3878794-1-soham.purkait@intel.com>
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

Instead of creating a new spinner during each pass, it's more efficient to
instantiate the spinner once and reuse it by properly ending and resetting
it between iterations.
This approach reduces the overhead associated with repeated spinner creation,
saving time across multiple passes. By eliminating the cumulative time spent
on spinner initialization (i.e., creation time * number of passes),
the spinner's active duration more accurately reflects the actual engine busyness.
This leads to more precise measurements of the percentage of engine busyness in
terms of spinner running time.

With this change engine-activity-accuracy test result clearly shows the difference:

Before spinner reuse :

Starting subtest: engine-activity-accuracy-90
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.90% (81.03% vs 83.93%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.598s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.81% (83.06% vs 85.87%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.684s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.04% (83.83% vs 85.87%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.667s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.15% (83.99% vs 86.14%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS (1.647s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.00% (83.59% vs 85.60%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS (1.664s)
Subtest engine-activity-accuracy-90: SUCCESS (8.264s)

After spinner reuse:

Starting subtest: engine-activity-accuracy-90
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.03% (89.45% vs 89.42%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.560s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.02% (89.56% vs 89.54%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.559s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.02% (89.42% vs 89.40%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.571s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.01% (89.28% vs 89.27%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS (1.581s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.01% (89.37% vs 89.36%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS (1.583s)
Subtest engine-activity-accuracy-90: SUCCESS (7.859s)

v1:
 - Add how this patch improves the engine activity accuracy test. (Lucas)
 - Show the numbers with the said improvement. (Lucas)

Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate engine activity accuracy")
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba..af0c2dfe4 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -534,6 +534,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 		intel_allocator_init();
 		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 
+		spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+		xe_spin_end(spin->xe_spin);
+		xe_spin_sync_wait(fd, spin);
+
 		for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
 			unsigned int target_idle_us = idle_us;
 			struct timespec start = { };
@@ -552,10 +556,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 				igt_measured_usleep(target_idle_us);
 
 				/* start spinner */
-				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+				xe_spin_reset(fd, spin);
 				loop_idle_ns = igt_nsec_elapsed(&start);
 				igt_measured_usleep(active_us);
-				igt_spin_free(fd, spin);
+				xe_spin_end(spin->xe_spin);
 
 				now = igt_nsec_elapsed(&start);
 				loop_active_ns = now - loop_idle_ns;
@@ -590,6 +594,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 				      sizeof(expected));
 		}
 
+		igt_spin_free(fd, spin);
 		xe_vm_destroy(fd, vm);
 		put_ahnd(ahnd);
 	}
@@ -622,7 +627,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
 		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
 
-	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
+	assert_within(100.0 * engine_activity, 100.0 * expected, 2);
 }
 
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
-- 
2.34.1

