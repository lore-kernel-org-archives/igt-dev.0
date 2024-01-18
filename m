Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A400AC4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 10:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499A010E772;
	Thu, 18 Jan 2024 10:36:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F63410E761
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705574208; x=1737110208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=shVgBNqTPEqE4W0EmTutHV6yRUXK8l/cwoB0WrkJDvQ=;
 b=CIs0Zt0Biq8DiuzjIXzo1kw8g64ZxmIHbirUgLN0X5TlNMClCbcWc6s4
 ukN0Pnxq5EejUw7xqW8whdf0sYW+YdgB4l8nJumH1YX5o0TOdV1t8BP1W
 Z+kuy+nSXmMRa4tI+CKPA+fHszDo60KD8ACBFFH36P+COndtndW8H4pfz
 3Z0HYlWECoYn229eiGZhlhm1mC7Nb66FFVKQmypAWJp9cebrqzSaKcx8j
 tjzt75caj6LmOTSIS7DZrQbebo783s0aWB0CeOpLUT1J52CY+j4RtrGQa
 3I169uszjr8fNpi1BGXu2C1El80DgksWD2lDCJ74uUM6nivBbN7Tlpbhp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13760996"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="13760996"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 02:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="369797"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 02:36:46 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_kms: move bigjoiner_mode_found to lib.
Date: Thu, 18 Jan 2024 16:16:15 +0530
Message-Id: <20240118104616.988247-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118104616.988247-1-kunal1.joshi@intel.com>
References: <20240118104616.988247-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

move bigjoiner_mode_found to lib/igt_kms with some modification

v2: combine both big joiner checks (Bhanu)

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c                | 22 ++++++++++++++++++++++
 lib/igt_kms.h                |  2 ++
 tests/intel/kms_big_joiner.c | 14 +-------------
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b4d0d761..7a07e62f8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6142,6 +6142,28 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
 		mode->clock > max_dotclock);
 }
 
+/**
+ * bigjoiner_mode_found:
+ * @connector: libdrm connector
+ * @sort_method: comparator method
+ * @mode: libdrm mode
+ *
+ * Returns: True if big joiner found in connector modes
+ */
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock)
+{
+	bool found = false;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
+	if (!found) {
+		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
+	}
+	return found;
+}
+
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b..488637d4b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1212,6 +1212,8 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+                          int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index aba2adfbe..28678b958 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -199,16 +199,6 @@ static void test_dual_display(data_t *data)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
-static bool bigjoiner_mode_found(drmModeConnector *connector,
-				 int (*sort_method)(const void *, const void*),
-				 drmModeModeInfo *mode)
-{
-	igt_sort_connector_modes(connector, sort_method);
-	*mode = connector->modes[0];
-
-	return igt_bigjoiner_possible(mode, max_dotclock);
-}
-
 igt_main
 {
 	data_t data;
@@ -235,9 +225,7 @@ igt_main
 			 * Bigjoiner will come in to the picture when the
 			 * resolution > 5K or clock > max-dot-clock.
 			 */
-			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, &mode) ||
-				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, &mode)) ?
-					true : false;
+			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
 
 			if (found) {
 				data.output[count].output_id = output->id;
-- 
2.25.1

