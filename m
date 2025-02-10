Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B417C0219B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6D310E5EF;
	Mon, 10 Feb 2025 18:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/74f0xY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B863310E5EF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212832; x=1770748832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wHoYw0X3RBQlr8lmGtCdAdkBGgswsjGJ+jq4CUGJ+3U=;
 b=O/74f0xYIRlsnr5tRB+d/W+t2Ev1Wbd5svCNlPk7ry5v+SLAxvi64t7O
 tMuiJ22EDt/BveKUTnI5lqjKO5JpqCgpf+dtOiP6Vq9GjmXEGGtM5LevC
 ZJK07CKIwH4ppbJQe/8IDpqs2i6VVAVoIGthd1yk7IDxxTOZ5sH/Nc1jb
 PlLrhcuSeNXcBXN+6F7HS5gwb38OgKitxQrluBKjNusUKlXtbk+lXyvrQ
 zV+A3OnHrr4+vPnIhuQ3ZAukgyLKMIZOhtg95Ie6A6xFdT2Br5fJR8cfl
 MwDSJbz7AvkrbLX3wzIMnL2DfFW56+0fvw1j4QbLYTWWEXi8jQWFTsDNx g==;
X-CSE-ConnectionGUID: Gwp654ycSrChn98hN6wHUA==
X-CSE-MsgGUID: P63PpLYOQWa/s+l92+XtDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39497479"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39497479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:40:31 -0800
X-CSE-ConnectionGUID: X8L0pll+Sr6ylshL1q6W8g==
X-CSE-MsgGUID: oPRSst05ShmOVxk8I0ZzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112229430"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:40:30 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/kms_dp_linktrain_fallback: reuse from
 mst helper lib
Date: Tue, 11 Feb 2025 00:26:02 +0530
Message-Id: <20250210185606.1327892-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210185606.1327892-1-kunal1.joshi@intel.com>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
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

Start using igt_find_all_mst_output_in_topology from the helper
instead.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 28 ++++---------------------
 tests/meson.build                       |  1 +
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 415005774..95aa7eee4 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -16,6 +16,7 @@
 #include <sys/types.h>
 #include "igt_sysfs.h"
 #include "igt.h"
+#include "kms_mst_helper.h"
 
 /**
  * SUBTEST: dp-fallback
@@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
 
 IGT_TEST_DESCRIPTION("Test link training fallback");
 
-static void find_mst_outputs(int drm_fd, data_t *data,
-			     igt_output_t *output,
-			     igt_output_t *mst_outputs[],
-			     int *num_mst_outputs)
-{
-	int output_root_id, root_id;
-	igt_output_t *connector_output;
-
-	output_root_id = igt_get_dp_mst_connector_id(output);
-	/*
-	 * If output is MST check all other connected output which shares
-	 * same path and fill mst_outputs and num_mst_outputs
-	 */
-	for_each_connected_output(&data->display, connector_output) {
-		if (!igt_check_output_is_dp_mst(connector_output))
-			continue;
-		root_id = igt_get_dp_mst_connector_id(connector_output);
-		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
-			mst_outputs[(*num_mst_outputs)++] = connector_output;
-	}
-}
-
 static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 			      int *output_count)
 {
@@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
 			return false;
 
-	find_mst_outputs(data->drm_fd, data, data->output,
-			 mst_output, output_count);
+       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display, data->output,
+							mst_output, output_count) == 0,
+							"Unable to find mst outputs\n");
 
 	for (i = 0; i < *output_count; i++) {
 		output = mst_output[i];
diff --git a/tests/meson.build b/tests/meson.build
index 33dffad31..a6f6ad560 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -366,6 +366,7 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
-- 
2.25.1

