Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9878EC5B559
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 09:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198310EA30;
	Fri,  6 Jun 2025 09:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="achyetvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17D210EA30
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749203174; x=1780739174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B2pNa77TIZ8cXqxJJbPE4tyyDXmrJiYYFOf+8yBA64Y=;
 b=achyetvim2N/5bAjGLEzMU756MY1D+mu8VxuW+wQrxnrakNSUcVkmA15
 xDuoQOc58U9qT07a50lsY9MjInHUM2QApEtGeONvlhM29+v1lKGY4rb8o
 LLc84tIgxSyxnSgy3BO8ummrcpOVbecAI6dsKHI3QJk7qaFgeiyNZ8oIe
 RVezSh5gq6qjGx/tyZMUjz+tHBOKepzSXs10EcWpe/n5opgAirL+UTa/H
 2FPCdymsKRVZXodf4k8x4Xqg7lBQ52LaejS1kK8xhWFazQg0oEFyJ4IZm
 99jAxg1TKFVeNgGlr0GpAoL3rjUb9yd2NNjG4uWDrl9IRuGs7TiTyEq5d Q==;
X-CSE-ConnectionGUID: CNpUxbV/SZGTsWkJFLCtag==
X-CSE-MsgGUID: LtJkIrQMRXmPrKHU0Mr5WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62745037"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="62745037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:14 -0700
X-CSE-ConnectionGUID: yu0SH4oRShyGW/07OxQ8Lw==
X-CSE-MsgGUID: ByfCUMerQqSs/upq3iqbsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="182974813"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v3 3/5] tests/intel/xe_pmu: Add tests to validate engine
 activity on render node
Date: Fri,  6 Jun 2025 15:40:06 +0530
Message-ID: <20250606101008.1949955-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250606101008.1949955-1-riana.tauro@intel.com>
References: <20250606101008.1949955-1-riana.tauro@intel.com>
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

v2: fix render fd (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index e6afca9c4..00c2b88b7 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -56,6 +56,15 @@
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
@@ -857,6 +866,30 @@ igt_main
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
 	}
 
+	igt_subtest_group {
+		int render_fd;
+
+		igt_fixture {
+			render_fd = __drm_open_driver_render(DRIVER_XE);
+			igt_require(render_fd);
+		}
+
+		igt_describe("Validate engine activity on render node when idle");
+		test_each_engine("engine-activity-render-node-idle", render_fd, eci)
+			engine_activity(render_fd, eci, 0);
+
+		igt_describe("Validate engine activity on render node when loaded");
+		test_each_engine("engine-activity-render-node-load", render_fd, eci)
+			engine_activity(render_fd, eci, TEST_LOAD);
+
+		igt_describe("Validate engine activity on render node with load and trailing idle");
+		test_each_engine("engine-activity-render-node-load-idle", render_fd, eci)
+			engine_activity(render_fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);
+
+		igt_fixture
+			drm_close_driver(render_fd);
+	}
+
 	igt_subtest_group {
 		unsigned int num_fns;
 
-- 
2.47.1

