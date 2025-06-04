Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B658C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 11:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB11810E6A2;
	Wed,  4 Jun 2025 11:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMucHPUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF78D10E74D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749037846; x=1780573846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M36r4V+fPF/eOX2yUBqn2aum0e59NV+1BIHAzX5pn8U=;
 b=lMucHPUTikdrKIBORZf5BvfKECsmOtkhhsIuyC34OWFurZzb8JnSnpbe
 2GCPwiiXicT7fmt3T8XXki36pMBEt0mfez9A5JSfewmh3SJykkD7pG5J9
 0q4RcVK7/MDKn3JmGq3pYYMH1xFhSA1aZWtPOJeKSwlrItIDPnupl32XJ
 y4xDeasb8xjlG2E7q1l1e5fG7oVyVKAiogq3lpHvU4svBmL9MQ2BmTo0d
 WWDJpGd81WuRArfKqxYfwm7XbOGrT4xS19kKKwSezAfmnLt2+AY7K84uR
 TBpMgtyM3n3d5O1je9wOaqcDPkAE/sXFC6tip41bGTM8ijzxZQWAysy/f g==;
X-CSE-ConnectionGUID: syhBV9imSkimcXSBivHBRA==
X-CSE-MsgGUID: HVqgLFSEQOuM6ic9ILC+Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73645598"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="73645598"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:50:46 -0700
X-CSE-ConnectionGUID: fj0AZ6GxTBCALAg7MPQYjA==
X-CSE-MsgGUID: vt1ASgKQQD67XqftGkH6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150444497"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:50:45 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_compute_preempt: add compute preempt on
 vram bos
Date: Wed,  4 Jun 2025 13:50:27 +0200
Message-ID: <20250604115024.117036-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
References: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
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

Add 'vram' and 'vram-evict' subtests which exercise preemption
scenarios on objects allocated in vram. First subtest uses half
of vram whereas second one allocates more than available vram
causing eviction.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_compute_preempt.c | 86 ++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 3a3d7847ca..d4b6198a65 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -35,16 +35,27 @@
  *      Exercise multiple walker mid thread preemption scenario consuming
  *      whole ram only when there's swap on the machine
  *
+ * SUBTEST: compute-preempt-many-vram
+ * GPU requirement: LNL, PTL
+ * Description:
+ *      Exercise multiple walker mid thread preemption scenario on half of vram
+ *
+ * SUBTEST: compute-preempt-many-vram-evict
+ * GPU requirement: LNL, PTL
+ * Description:
+ *      Exercise multiple walker mid thread preemption scenario on 120% of vram size
+ *
  * SUBTEST: compute-threadgroup-preempt
  * GPU requirement: LNL, PTL
  * Description:
  *      Exercise compute walker threadgroup preemption scenario
  */
 static void
-test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
+test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption,
+		     enum execenv_alloc_prefs alloc_prefs)
 {
 	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption,
-						       EXECENV_PREF_SYSTEM),
+						       alloc_prefs),
 		      "GPU not supported\n");
 }
 
@@ -54,12 +65,13 @@ igt_main
 {
 	int xe;
 	struct drm_xe_engine_class_instance *hwe;
-	uint64_t ram_mb, swap_mb;
+	uint64_t ram_mb, swap_mb, vram_mb;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		ram_mb = igt_get_avail_ram_mb();
 		swap_mb = igt_get_total_swap_mb();
+		vram_mb = xe_visible_vram_size(xe, 0) >> 20;
 	}
 
 	igt_subtest_with_dynamic("compute-preempt") {
@@ -68,7 +80,7 @@ igt_main
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
-				test_compute_preempt(xe, hwe, false);
+				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 		}
 	}
 
@@ -81,7 +93,7 @@ igt_main
 				int child_count;
 
 				/*
-				 * Get half of ram / 2, then divide by
+				 * Get half of ram, then divide by
 				 * CONTEXT_MB * 2 (long and short) job
 				 */
 				child_count = ram_mb / 2 / CONTEXT_MB / 2;
@@ -89,9 +101,9 @@ igt_main
 				igt_debug("RAM: %zd, child count: %d\n",
 					  ram_mb, child_count);
 
-				test_compute_preempt(xe, hwe, false);
+				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 				igt_fork(child, child_count)
-					test_compute_preempt(xe, hwe, false);
+					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 				igt_waitchildren();
 			}
 		}
@@ -116,9 +128,63 @@ igt_main
 				igt_debug("RAM: %zd, child count: %d\n",
 					  ram_mb, child_count);
 
-				test_compute_preempt(xe, hwe, false);
+				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 				igt_fork(child, child_count)
-					test_compute_preempt(xe, hwe, false);
+					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
+				igt_waitchildren();
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("compute-preempt-many-vram") {
+		igt_require(xe_has_vram(xe));
+
+		xe_for_each_engine(xe, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
+				int child_count;
+
+				/*
+				 * Get half of vram, then divide by
+				 * CONTEXT_MB * 2 (long and short) job
+				 */
+				child_count = vram_mb / 2 / CONTEXT_MB / 2;
+
+				igt_debug("VRAM: %zd, child count: %d\n",
+					  vram_mb, child_count);
+
+				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
+				igt_fork(child, child_count)
+					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
+				igt_waitchildren();
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
+		igt_require(xe_has_vram(xe));
+
+		xe_for_each_engine(xe, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
+				int child_count;
+
+				/*
+				 * Get all vram + 20%, then divide by
+				 * CONTEXT_MB * 2 (long and short) job
+				 */
+				child_count = vram_mb * 1.2 / 2 / CONTEXT_MB;
+
+				igt_info("VRAM: %zd, child count: %d\n",
+					  vram_mb, child_count);
+
+				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
+				igt_fork(child, child_count)
+					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
 				igt_waitchildren();
 			}
 		}
@@ -130,7 +196,7 @@ igt_main
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
-			test_compute_preempt(xe, hwe, true);
+			test_compute_preempt(xe, hwe, true, EXECENV_PREF_SYSTEM);
 		}
 	}
 
-- 
2.43.0

