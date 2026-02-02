Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678EEE73144
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DFD10E39F;
	Mon,  2 Feb 2026 08:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3bSeAlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF4810E39F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020663; x=1801556663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cdRxxfMcvJno7FcfvhCb6R+touIECw7oT+U5a4WZ6Z4=;
 b=b3bSeAlouRT5fFDZ3u5fYdSgVVZAToy4WO7VVH4xSnQ0NAPn2mpYEp8e
 v5tNu6hFpv6GHO5eDcHSo1P/Z/uM2C8x7CH5HrJLl904IUdm7o/VUbTtB
 tK2Bbf1ZhVSRf2mFaNhmftiByxLR6xmxnbsY1+zVVKo0IgUVtGbrE6MEb
 Pp5vzwz/yTuLiz8KfAW7h0fu0icuHOLxH818kqUhtz4ucW8MxOJV9solg
 v1jlD/REMwRUB6zpV2JBPiyR930TW0DnjRSWIFLNlkYt1XSXjCViX6bu4
 +tFC+C14aYxD37KPkpf5FCQ+qmf+J+gvzOpMHrCXqvSiZ9Tz1U5ZUCKBo g==;
X-CSE-ConnectionGUID: 3HfK8jp4QoCpPK4we/fODg==
X-CSE-MsgGUID: 05TgE3t6QXytAZDM1SRwPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58756433"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58756433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:24:23 -0800
X-CSE-ConnectionGUID: OdnWckQoTcqXh9bnzmU4zg==
X-CSE-MsgGUID: mkG1QrN4SLiIeLIDxQX66Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209455078"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:24:22 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/kms_mst_helper: Add helper to check for
 MST outputs
Date: Mon,  2 Feb 2026 14:15:34 +0530
Message-Id: <20260202084539.2524306-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202084539.2524306-1-kunal1.joshi@intel.com>
References: <20260202084539.2524306-1-kunal1.joshi@intel.com>
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

Add igt_display_has_mst_output() helper function to check if a display
has at least one DP MST output connected. This is useful for tests that
need to verify MST output availability before running.

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

