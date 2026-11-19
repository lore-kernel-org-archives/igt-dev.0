Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEBD606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gsliexx+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7CD10E7E9;
	Thu, 19 Nov 2026 00:52:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D611120F3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795049421; x=1826585421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L6ddGVcbKbxMAmzA93Zkxi5s2nAbXFNvgEik4uzP5z8=;
 b=Gsliexx+my/E8rthxCkY2GOFaCm8HTpcKX53X7ft/OkbTRk1aFRyO821
 MK2TmzI+gZlx5up3jqYKR0I+zXnSzDxKwrdq5tYl8H5XPvZsBx7NmCciS
 9ljdFaLt9n05qH0uPOFtwRTA/a2rNA7r2ZaJBjOx++mcKRYpOyLrQZJ6q
 o+QWVGXg2kyW4TX1GrUSrplSdqz8IgFxo5S0sOTBOTe7fh47F/2ZLBFGz
 Qk4hidpq+3lt564JgBIPx4FPJY12DvTerNqm1Z/H9rx+xKgq752eD1Nb1
 o2DSgLwwhaqa4EQ869t7n3MVFEnshe3X1QLmAWdeIBTcT2iGvxkcY1Q67 Q==;
X-CSE-ConnectionGUID: N6yvx/IjRouvSBPpKOO0ig==
X-CSE-MsgGUID: 6H0RIOL9RZ+E/UiE35K9FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3771129"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3771129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:50:16 -0800
X-CSE-ConnectionGUID: i+wOc9+GSAK1KHiCZIHlMQ==
X-CSE-MsgGUID: 0o0Dn18FTB+VnJvgHkLv4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10679604"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 16:50:17 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, shuicheng.lin@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 2/3] tests/intel/xe_pm_residency: Wait for stable C6 before
 measuring
Date: Wed, 18 Nov 2026 16:50:08 -0800
Message-ID: <20261119005009.364632-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119005009.364632-1-zongyao.bai@intel.com>
References: <20261119005009.364632-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

test_idle_residency() (idle-residency and gt-c6-freeze) waited only once
for xe_gt_is_in_c6() and then immediately started the 3s measurement. If
the GT had just visited C6 while deferred cleanup work from the previously
executed test was still running (observed after xe_pat@pat-index-auto,
which leaves ~1s of GT activity at fd close), the measurement window
included that activity and the test failed with residency well below 90%.

Wait for 500ms of uninterrupted C6 (with the residency counter following)
before opening the measurement window, using xe_gt_wait_c6_stable(). This
also removes the dependency on test execution order.

In toggle-gt-c6 do the same only once, before sampling the C6 power; the
other repetitions only check the C0/C6 transitions and keep the quick
single-shot wait.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pm_residency.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index c5240378a..3f97e882d 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -28,6 +28,8 @@
 
 #define NUM_REPS 16 /* No of Repetitions */
 #define SLEEP_DURATION 3 /* in seconds */
+#define C6_STABLE_MS 500 /* GT must stay in C6 this long before measuring */
+#define C6_STABLE_TIMEOUT_MS 5000
 
 const double tolerance = 0.1;
 int fw_handle = -1;
@@ -217,9 +219,14 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	unsigned long elapsed_ms, residency_start, residency_end;
 	struct timespec ts_start, ts_end;
 
-	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
+	/*
+	 * A single visit to C6 is not enough: deferred work of previous
+	 * tests may still wake the GT up after it, which would be accounted
+	 * in the measurement below. Wait for a stable C6 window first.
+	 */
+	igt_assert_f(xe_gt_wait_c6_stable(fd, gt, C6_STABLE_MS, C6_STABLE_TIMEOUT_MS) ||
 		     xe_gt_dump_debug_info(fd, gt),
-		     "GT %d not in C6\n", gt);
+		     "GT %d not in stable C6\n", gt);
 
 	if (flag == TEST_S2IDLE) {
 		clock_gettime(CLOCK_BOOTTIME, &ts_start);
@@ -332,8 +339,16 @@ static void toggle_gt_c6(int fd, int n)
 				     xe_gt_dump_debug_info(fd, gt),
 				     "Forcewake released, GT %d should be in C6\n", gt);
 
-		if (n == NUM_REPS)
+		if (n == NUM_REPS) {
+			/* Only the power sample needs the GT to be really idle */
+			xe_for_each_gt(fd, gt)
+				igt_assert_f(xe_gt_wait_c6_stable(fd, gt, C6_STABLE_MS,
+								  C6_STABLE_TIMEOUT_MS) ||
+					     xe_gt_dump_debug_info(fd, gt),
+					     "Forcewake released, GT %d should be in stable C6\n", gt);
+
 			measure_power(&gpu, &gt_c6_power);
+		}
 	} while (--n);
 
 	igt_power_close(&gpu);
-- 
2.43.0

