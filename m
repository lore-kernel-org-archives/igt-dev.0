Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF6C369A6
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA6D10E727;
	Tue,  8 Apr 2025 18:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJSp9rRS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E3310E727
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744138281; x=1775674281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xHduxgKR3FWLGYH2b8rxe9ULgLDGYEK2iDffw3y9GWI=;
 b=lJSp9rRSqV9qubjvNcExhu9gPax2uLLtN8cBUwdgNkE/ruvFR3h5VHwQ
 Aq689yrwaTcWa5d0hXt+X6FAhOWV4ZjSKt5TmBvbdvLUBu9dyfnYogGbf
 lDk08pfGhL9Kppz8T1j5LS0YtepZ/z4LicDmA/E+2VZpHjU5mJv93a2Vk
 Lk/gLWox28XsUrvyhoe/Oo5pdXLxNOk2h4kco/Wimc0LYECTqo8Kjzmql
 zJed2tbegD2yXzuIRb2ICcl3NK/k/OgObF/S5RDJn7GXfBVTVIK8j4tTA
 2r1ZggFN2XnmbF++tqqaS44b7jsTAGaZLJn6b3UaJUAjrfaL+2iVH7zR0 w==;
X-CSE-ConnectionGUID: 0S6/8SlVRaGF+fA2omeQGg==
X-CSE-MsgGUID: l+UkNxaQTcyK2fS3XyRFuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48297157"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="48297157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:51:21 -0700
X-CSE-ConnectionGUID: qnfCrBS3TM6roYT4xrLn4w==
X-CSE-MsgGUID: wxchXX57RMCuQczQ2rjNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="165588459"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:51:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v3 5/5] tests/xe_compute_preempt: consume all ram for
 wmtp
Date: Tue,  8 Apr 2025 20:50:45 +0200
Message-Id: <20250408185045.272673-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
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

When swap exists on the platform lets try to consume whole ram
triggering wmtp and eviction.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_compute_preempt.c | 36 +++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index f07e87d4c4..43ffb8dba3 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -29,6 +29,12 @@
  * Description:
  *      Exercise multiple walker mid thread preemption scenario
  *
+ * SUBTEST: compute-preempt-many-all-ram
+ * GPU requirement: LNL, PTL
+ * Description:
+ *      Exercise multiple walker mid thread preemption scenario consuming
+ *      whole ram only when there's swap on the machine
+ *
  * SUBTEST: compute-threadgroup-preempt
  * GPU requirement: LNL, PTL
  * Description:
@@ -46,11 +52,12 @@ igt_main
 {
 	int xe;
 	struct drm_xe_engine_class_instance *hwe;
-	uint64_t ram_mb;
+	uint64_t ram_mb, swap_mb;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		ram_mb = igt_get_avail_ram_mb();
+		swap_mb = igt_get_total_swap_mb();
 	}
 
 	igt_subtest_with_dynamic("compute-preempt") {
@@ -88,6 +95,33 @@ igt_main
 		}
 	}
 
+	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
+		igt_require(swap_mb > CONTEXT_MB * 10);
+
+		xe_for_each_engine(xe, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
+				int child_count;
+
+				/*
+				 * Get whole ram, then divide by
+				 * CONTEXT_MB * 2 (long and short) job
+				 */
+				child_count = ram_mb / CONTEXT_MB / 2;
+
+				igt_debug("RAM: %zd, child count: %d\n",
+					  ram_mb, child_count);
+
+				test_compute_preempt(xe, hwe, false);
+				igt_fork(child, child_count)
+					test_compute_preempt(xe, hwe, false);
+				igt_waitchildren();
+			}
+		}
+	}
+
 	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
-- 
2.34.1

