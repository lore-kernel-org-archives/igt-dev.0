Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7093C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 11:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBB910E299;
	Wed, 19 Feb 2025 11:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaUIPC77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E069910E299
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739966021; x=1771502021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kI67m44KvhrFpdWgJwyBRoyr8NpCvjbGuQNWrAuy6N8=;
 b=TaUIPC773jdpda6O/8RpGcYvoJFen2DslBd0lw/ifdZOxh/Qa40qnDQT
 +sWFNp6k2zqeI6+W1lboTMdmtnElkVkvd51sfvl9bvmcozzo2UncR5kwc
 nX8TRcFym3dbLn4hUeiBcpIwDGnMyIeGAF/lzwBTCduQDFhyPqJUhtFz0
 tezk/5ASs18yS6YdkaGVheyBOYZf7oW8E9vKUB79yetiI0hBmklCoTzvP
 A0hSYOjhR6Uty8XVrp90hMWHRBPxguBeRHlJQF98MFWhKVS2sMMTUeFPb
 e6zb4KTykm1gfPBd7qQPY6dQXrdHAxya1SiohS7tKlqKmj6fqjMDiH0y+ A==;
X-CSE-ConnectionGUID: JNx9Y3BbR6mDjzS3D8HI1g==
X-CSE-MsgGUID: OCsuJ8BVSWukzAUhi4JaZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40556123"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40556123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:53:41 -0800
X-CSE-ConnectionGUID: wxni7R6iQqyWuTMSDVrHZQ==
X-CSE-MsgGUID: 2mcatHsaSiGt7iNXFqqWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137938458"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.136])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:53:39 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_exec_capture: Skip checks on VF devices
Date: Wed, 19 Feb 2025 12:53:14 +0100
Message-Id: <20250219115314.180382-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
References: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
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

If the device is a Virtual Function, skip certain devcoredump validation
steps that are not applicable in this context.

These changes align with kernel updates introduced in:

Link: https://patchwork.freedesktop.org/patch/msgid/20241022010116.342240-2-zhanjun.dong@intel.com

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
---
 tests/intel/xe_exec_capture.c | 36 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index 2c79c1802..fe1ae677e 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -20,6 +20,7 @@
 
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -434,6 +435,7 @@ static void test_card(int fd)
 	char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
 	char temp[MAX_TEMP_LEN];
 	char path[MAX_SYSFS_PATH_LEN];
+	const bool is_vf_device = intel_is_vf_device(fd);
 
 	igt_assert_f(single_line_buf, "Out of memory.\n");
 
@@ -466,19 +468,27 @@ static void test_card(int fd)
 		igt_assert_f((start_line = access_devcoredump(path, lines, single_line_buf)) > 0,
 			     "Devcoredump not exist, errno=%d.\n", errno);
 
-		sprintf(temp, "instance=%d", hwe->engine_instance);
-		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
-			       INDEX_ENGINE_INSTANCE, temp, false);
-		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
-			       INDEX_ENGINE_NAME, xe_engine_class_name(hwe->engine_class), true);
-
-		check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VALUE,
-			       "GuC", false);
-
-		check_item_u64(&regex, lines, "ACTHD:", addr,
-			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
-		check_item_u64(&regex, lines, "RING_BBADDR:", addr,
-			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
+		if (!is_vf_device) {
+			sprintf(temp, "instance=%d", hwe->engine_instance);
+			check_item_str(&regex, lines, "(physical),",
+				       INDEX_ENGINE_PHYSICAL,
+				       INDEX_ENGINE_INSTANCE, temp, false);
+			check_item_str(&regex, lines, "(physical),",
+				       INDEX_ENGINE_PHYSICAL, INDEX_ENGINE_NAME,
+				       xe_engine_class_name(hwe->engine_class),
+				       true);
+
+			check_item_str(&regex, lines,
+				       "Capture_source:", INDEX_KEY,
+				       INDEX_VALUE, "GuC", false);
+
+			check_item_u64(&regex, lines, "ACTHD:", addr,
+				       addr + BATCH_DW_COUNT * sizeof(u32),
+				       INDEX_KEY, INDEX_VALUE);
+			check_item_u64(&regex, lines, "RING_BBADDR:", addr,
+				       addr + BATCH_DW_COUNT * sizeof(u32),
+				       INDEX_KEY, INDEX_VALUE);
+		}
 		check_item_u64(&regex, lines, "length:", addr,
 			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
 
-- 
2.31.1

