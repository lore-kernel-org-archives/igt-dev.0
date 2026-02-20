Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F6EC56201
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C3010E366;
	Fri, 20 Feb 2026 15:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKrBXUcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC82310E366
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599683; x=1803135683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nwDtAWJroPcTw5DOFCGANvYQwnUJatTahDKTniQC5qQ=;
 b=SKrBXUcsASFvp/0vOfux+uZ9XIekMzl94P6tJmwARDHF2qg/pHBH4af7
 P16WRcx6DE6+6n2apKBTpz7H83OTx4dGff1iuYD78mAvV0dByeK64ninZ
 EhE2Ni9NFIsq/feF73LKFqjhpe1ooEKKqvBiNnJbirCGtH0CZ0CXCU/M+
 QgHps+R+SF5sBi6Yf2kra3ULW4hmUzSD9AEGBEhc1wqp9hj9D8RfHyluN
 MNSaoS5Bme2M5kLcUQxtjjiZefCJzNo9EVyfVepn/y7OX7NGHFOJ8NOwP
 8f3gHj/g2s3FsE04IAkF+9ZdxgYmBg3Auc3E1IqYEZIVzPPQJ5yEswo1s g==;
X-CSE-ConnectionGUID: ytyEEEtnSimKjZNA0yl+8Q==
X-CSE-MsgGUID: 0tXkSVawR4m8zytmWgizdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72592288"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72592288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:23 -0800
X-CSE-ConnectionGUID: 80CVMmlqRUik6Sp/BBs6ug==
X-CSE-MsgGUID: 4XRaJ78bQG2CkO9OHGg1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219411147"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 07:01:21 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper to check for
 MST outputs
Date: Fri, 20 Feb 2026 20:52:37 +0530
Message-Id: <20260220152239.276034-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260220152239.276034-1-kunal1.joshi@intel.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
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

Add igt_display_has_mst_output() helper function to check
if a display has at least one DP MST output connected.
This is useful for tests that need to verify MST output
availability before running.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_mst_helper.c | 19 +++++++++++++++++++
 tests/intel/kms_mst_helper.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
index aef74cd31..6b986a45c 100644
--- a/tests/intel/kms_mst_helper.c
+++ b/tests/intel/kms_mst_helper.c
@@ -46,3 +46,22 @@ int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
 	}
 	return 0;
 }
+
+/*
+ * @display: pointer to #igt_display_t structure
+ *
+ * Iterates over all connected outputs and checks if any of them
+ * is a DP MST output.
+ *
+ * Returns: true if at least one MST output is found, false otherwise
+ */
+bool igt_display_has_mst_output(igt_display_t *display)
+{
+    igt_output_t *output;
+
+    for_each_connected_output(display, output) {
+        if (igt_check_output_is_dp_mst(output))
+            return true;
+    }
+    return false;
+}
diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
index 7391494ab..0e8ece0a0 100644
--- a/tests/intel/kms_mst_helper.h
+++ b/tests/intel/kms_mst_helper.h
@@ -12,4 +12,5 @@ int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
 					igt_output_t *output,
 					igt_output_t *mst_outputs[],
 					int *num_mst_outputs);
+bool igt_display_has_mst_output(igt_display_t *display);
 #endif
-- 
2.43.0

