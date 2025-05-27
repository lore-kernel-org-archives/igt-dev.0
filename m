Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56398C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 10:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6C510E46B;
	Tue, 27 May 2025 10:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbDKfjHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51F310E46B
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748340644; x=1779876644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EZBuRTK95nE1p7J9iBUJaGEz944ayFVddgQFpMvaAzo=;
 b=EbDKfjHYv4tyk+kuTrzV5Lp/7EQXxlmRZSoXSMJ5B1adj9HLoRVanxuS
 42BSnJMoeqMqIJIjRQsO/wgciG9cnuOdtwGRseLKvgcnR8BAia7JRXRxr
 J9XmJ1/TlpsPwQW8q4VLDQFxTNNOW3jth8Ki+g5fUwCbyTN/bY2yXlqbP
 qZ3uJqq92ZvO7qo99mNO/se+p9ojoZQHFK8g7NdFivmzCF+nd2rWMR56a
 QFE13kvPuoHBsvyfRg7/86qopQ2XEiniQhQZzL55WxctxQgiwoIPa+fQf
 pCCjY0vrak7jSeIuBpD/i53K/QsF9J6QnA0CQ5OEky0ojwD5039upuOYb g==;
X-CSE-ConnectionGUID: iACZ570ZRYuEug8uvn67YQ==
X-CSE-MsgGUID: gAO8c0kSRqOn40PImKMOEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67741851"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="67741851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:44 -0700
X-CSE-ConnectionGUID: Hywzte9ZQLGe75shg2LXbw==
X-CSE-MsgGUID: Wl7F4ZVESkaBp4d9R6NR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142667511"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:42 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pmu: Add tests to validate engine
 activity on render node
Date: Tue, 27 May 2025 16:04:32 +0530
Message-ID: <20250527103433.910475-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250527103433.910475-1-riana.tauro@intel.com>
References: <20250527103433.910475-1-riana.tauro@intel.com>
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

Add idle, load and trailing idle tests to validate engine activity on
render node

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 15b4b82d8..5a526004f 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -53,6 +53,15 @@
  * Description: Test to validate engine activity by running workload and trailing idle on all engines
  * 		except one
  *
+ * SUBTEST: engine-activity-render-node-idle
+ * Description: Test to validate engine activity on render node shows no load when idle
+ *
+ * SUBTEST: engine-activity-render-node-load
+ * Description: Test to validate engine activity on render node by running workload
+ *
+ * SUBTEST: engine-activity-render-node-load-idle
+ * Description: Test to validate engine activity on render node by running workload and trailing idle
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -833,6 +842,30 @@ igt_main
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
 	}
 
+	igt_subtest_group {
+		int render_fd;
+
+		igt_fixture {
+			render_fd = drm_open_driver_render(DRIVER_INTEL);
+			igt_require(render_fd);
+		}
+
+		igt_describe("Validate engine activity on render node when idle");
+		test_each_engine("engine-activity-render-node-idle", fd, eci)
+			engine_activity(fd, eci, 0);
+
+		igt_describe("Validate engine activity on render node when loaded");
+		test_each_engine("engine-activity-render-node-load", fd, eci)
+			engine_activity(fd, eci, TEST_LOAD);
+
+		igt_describe("Validate engine activity on render node with load and trailing idle");
+		test_each_engine("engine-activity-render-node-load-idle", fd, eci)
+			engine_activity(fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);
+
+		igt_fixture
+			drm_close_driver(render_fd);
+	}
+
 	igt_subtest_group {
 		unsigned int num_fns;
 
-- 
2.47.1

