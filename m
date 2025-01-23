Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1482CC0218B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 07:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44E410E777;
	Thu, 23 Jan 2025 07:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S98C3enu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D494D10E777
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737616886; x=1769152886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gxZP1Co67n4KEtcP1bsF6pBvllFGrnzSduGAlom9fWw=;
 b=S98C3enuqJ+dRRCHEBGQLY1ebW+rexu0Y5jFK/QY+36+QyrEYBk2FpBN
 TlCpPbGkGN8wS7DtE2EHjFV4a9gjVZVV+T4pso/eybxA7Nc7E/BWU/2vt
 zGNS+9KC75HFZfY90IAfckNkOJFcAr5R3p5I5imXkeu9eZqGNbprHMBZ0
 Nt2rcPAXXOfj+YEhmmT86vQp5XTRKpv8NE5ZLmCpM++Lml2vVrI2vW0ct
 MItMIpJM8ShELeY6vnqmnt7wacyuJP/VeAeDUaK5gJ6/jmScYIJwN3Ikl
 2CkiIqZCu5ohIrV1ffoxe4sth+exj3q8l6KpLdel0Bk5msQTg/WC6MyyC A==;
X-CSE-ConnectionGUID: nSrkUa96Rw+28fuWYgM3QA==
X-CSE-MsgGUID: djXIqpdUT/m3mNyjGdc/eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37984907"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37984907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:21:26 -0800
X-CSE-ConnectionGUID: RzF8QVurQ+SCOVrng1aMRA==
X-CSE-MsgGUID: j7sTWkr0TVu310sJkj1zuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111392557"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:21:25 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
Date: Thu, 23 Jan 2025 13:06:59 +0530
Message-Id: <20250123073701.3113428-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123073701.3113428-1-kunal1.joshi@intel.com>
References: <20250123073701.3113428-1-kunal1.joshi@intel.com>
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

This patch introduces kms_mst_helper.c and kms_mst_helper.h
to centralize commonly used MST-related logic.
The new function igt_find_all_mst_output_in_topology()
enumerates MST outputs that share the same root connector,
simplifying code reuse across tests needing outputs on
same MST topology. The existing MST-related code in
kms_dp_linktrain_fallback.c is updated to use the new helper,
removing duplication. Additionally, meson.build is modified
to include kms_mst_helper.c in the build process.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 28 ++++---------------------
 tests/meson.build                       |  1 +
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index a05e2015f..b10946781 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -16,6 +16,7 @@
 #include <sys/types.h>
 
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
+							mst_output, output_count),
+		    "Unable to find mst outputs\n");
 
 	for (i = 0; i < *output_count; i++) {
 		output = mst_output[i];
diff --git a/tests/meson.build b/tests/meson.build
index 33dffad31..2cbd21c2a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -367,6 +367,7 @@ extra_sources = {
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
+	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.25.1

