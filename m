Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2B9C5AE59
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 06:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ED710E6FE;
	Thu, 29 May 2025 06:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgL+C8ZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0371F88130
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748500210; x=1780036210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VzdNLvZczCSCLh3+3sJqrS8h9/XwmHh0qeBMIaTIJow=;
 b=UgL+C8ZWE4ixWxTMhFSmd9bIJJQesxTb5J4assDz9qfd5+kmGZvncPkI
 aIgCLAN8ZPHY+U9P7Bt8b+k+neWfAaUM03c3vsPu6NvySqCZ9HQh0+Waw
 lUOKs+7E1kqbtWQhxOF3Uiw1/yPd5mrd+ntZs/UhPkGO5/Nz4aoImUlmq
 TfuB1vfVavu/EPzlB53c/7imFy2cLMjpm/QmeBePJHRYUwulcT/qfQOpo
 kWb8NoR28qasx/1bhoJwveU1yGFat3iQAVSVFbysmp7VN1rDLQ4YR5GrZ
 CDHqp1mtHMLuikh8u880ryVmKKqDkgXY9laQqlE74fh2RJ+ExQpOCgRX7 g==;
X-CSE-ConnectionGUID: 0CahN0zaQHqOs9gq/Brg3A==
X-CSE-MsgGUID: /bcAQaHKTlqu3VwqUOQcVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54210923"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54210923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:09 -0700
X-CSE-ConnectionGUID: mjG4GGlAT8aVwaLNPQkO3g==
X-CSE-MsgGUID: Gpv8HNBqRES9WowBySJObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="174347311"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v2 2/4] tests/intel/xe_pmu: Add tests to validate engine
 activity on render node
Date: Thu, 29 May 2025 12:23:57 +0530
Message-ID: <20250529065359.915117-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529065359.915117-1-riana.tauro@intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
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
index 15b4b82d8..198470365 100644
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
+			render_fd = __drm_open_driver_render(DRIVER_XE);
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

