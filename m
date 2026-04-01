Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D6110F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F4310EE12;
	Wed,  1 Apr 2026 15:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YI78SZet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F3610E5BD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058311; x=1806594311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Xo0axRG6q5AassBkV6dG0g6jVW3gPjxN2V9QMQ2fGs=;
 b=YI78SZetvg7r9Y2P0b4xmxkUtaCKRUHck9pcyWJpuvBTR+6DZWoGSN6S
 rfDHTcTK7MSoKivhevuiAFxPT7VURCrK+awlBfHaOaTu+N6+TEVSPMtr7
 wryjv4we3QaSKkjqyKlgP2p/PXvi2j4rRebLtOWn/G6/eaDS5dRwO5jYX
 p/csHxaKVR7ocdfBayT6r8kZ4WFoXSOzxomj7AKASBK0wrVDVpmwS5NgD
 KYRkwqEG5kUDqTFKhbKAgYwxMOb7uo6RO0slAyI1zAjLkujd5u9HXL7TW
 ADwe0Bt+UNaEgvHyzRmcuhEYF9uwJjSXRIUe3tMEbDTwChaJ5n3okoAFA g==;
X-CSE-ConnectionGUID: Y+lTnHZjSfGbPxBr+vXAbg==
X-CSE-MsgGUID: bTviinlNSPm1ElLQtRhDEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988967"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988967"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:11 -0700
X-CSE-ConnectionGUID: AYJMp39gSkK0zBoDl9Obdw==
X-CSE-MsgGUID: p00qB/c5RrGUhBru1bAJBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960075"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:09 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 2/7] tests/intel/kms_mst_helper: Add helper to check for
 MST outputs
Date: Wed,  1 Apr 2026 21:36:22 +0530
Message-Id: <20260401160627.1338526-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401160627.1338526-1-kunal1.joshi@intel.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
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

Add igt_display_has_mst_output() to check
if a display has at least one DP MST output
connected. This is useful for tests that need
to verify MST output availability before running.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_mst_helper.c | 19 +++++++++++++++++++
 tests/intel/kms_mst_helper.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
index 38859cffc..1918c8d10 100644
--- a/tests/intel/kms_mst_helper.c
+++ b/tests/intel/kms_mst_helper.c
@@ -47,3 +47,22 @@ int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
 	}
 	return 0;
 }
+
+/**
+ * igt_display_has_mst_output:
+ * @display: pointer to #igt_display_t structure
+ *
+ * Check if a display has at least one DP MST output connected.
+ *
+ * Returns: true if MST output is found, false otherwise
+ */
+bool igt_display_has_mst_output(igt_display_t *display)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(display, output) {
+		if (igt_check_output_is_dp_mst(output))
+			return true;
+	}
+	return false;
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
2.25.1

