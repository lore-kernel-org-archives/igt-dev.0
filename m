Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FB9C6FD1F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 16:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8785A10E9B5;
	Mon, 25 Mar 2024 16:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tv2xQ0/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FAD10E9B1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711384850; x=1742920850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YQDlUFsdeCJPcNp8dnyY40lbqSaT4UuIiEXzyItHJK0=;
 b=Tv2xQ0/cyBVaLHxIzkR5DlQXbtxDv6FpliOwfE3j/hw7Sl0tIo9xQOfw
 Wc+B4qKvoqEZkslJOxyuFslvMERJfmP2DaHUe9qwtuQatH7Sb6b3KQCY1
 V/bMv16FCYFG8vv8KGSyvgUkT7iNndToyjXtVcLkXnM4kZm/5vwYW80wZ
 skf1jC34J+KhsBH6NPxN/jPskpai2drGlO9m1on4jUeoWzmPPbrur9ALB
 yNMHDckNNgQIhWvVSSqHBOVHcyDTHm8S8ID00D7a0TaUuL+V5RcNlY972
 saHA2kfk44NNUgN1AUQQXNamUvSPiTW/Cba9LINobnSrmeglCP8TBAdWF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17132543"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17132543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="38784665"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 09:40:48 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_kms: move bigjoiner_mode_found to lib
Date: Mon, 25 Mar 2024 22:21:33 +0530
Message-Id: <20240325165136.1265895-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240325165136.1265895-1-kunal1.joshi@intel.com>
References: <20240325165136.1265895-1-kunal1.joshi@intel.com>
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

move bigjoiner_mode_found to lib

v2: correct documentation (Ankit)
	fix usage of mode (Ankit)
v3: state mode is filled in doc (Ankit)

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c                | 28 ++++++++++++++++++++++++++++
 lib/igt_kms.h                |  2 ++
 tests/intel/kms_big_joiner.c | 14 +-------------
 3 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e18f6fe59..548c9d1f3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6143,6 +6143,34 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
 		mode->clock > max_dotclock);
 }
 
+/**
+ * bigjoiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Bigjoiner will come in to the picture when the
+ * resolution > 5K or clock > max-dot-clock.
+ *
+ * Returns: True if big joiner found in connector modes
+ */
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode)
+{
+	bool found = false;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
+	if (!found) {
+		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
+	}
+	if (found)
+		*mode = connector->modes[0];
+	return found;
+}
+
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b..0fa7a2ea1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1212,6 +1212,8 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index aba2adfbe..99b1b898d 100644
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
+			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 
 			if (found) {
 				data.output[count].output_id = output->id;
-- 
2.34.1

