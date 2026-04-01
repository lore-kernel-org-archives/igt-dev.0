Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADBBD35176
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9410ED66;
	Wed,  1 Apr 2026 11:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSRE64C+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CE010ECE4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043342; x=1806579342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9oK/rcF4iZBL2CBGOnmrKrOw5OfQPdyFJvNJXuc5ho0=;
 b=OSRE64C+YG2plTomj2G8vlb53dhdZCyMTBorr9VNe5m1ODJGCjPbTpd+
 Tj0PVIKXiU81xPWxZGjAjlO0oWYa1p2Z9WElpV3vMY/XlV5tvkEyIScdz
 00Cttb/c8TTzNX5SsjcN6Boptw4b2JUb7w5DZsbu3k+MUWcT98QOIafpy
 jvlc/WrF5CJV11os37BkGaGRDDUGobqxRulZyhAWNKuZyIh0WGyhAWrRd
 ALSdgtVeJp2GUCiYB6mYZ+dzhz/YIsUIU52jmkjpo2TngyymwNK2Ne5xu
 7Sk4FJ63ZBscAYh/vhM/753L30UXdWsDJEgCHVenVzq2k+yCMeHZ7hh54 Q==;
X-CSE-ConnectionGUID: cvIQjxjoRba1fGzTegIW7Q==
X-CSE-MsgGUID: Vti8KzCnTbaJqnMp/QP3aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78669797"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78669797"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:35:42 -0700
X-CSE-ConnectionGUID: gx8a2jvtTOCPeEIMuzGkUw==
X-CSE-MsgGUID: SYB5/vEDTeq0FPLXmo9UEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228263470"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:34:24 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/kms_mst_helper: Add helper to check for
 MST outputs
Date: Wed,  1 Apr 2026 17:25:38 +0530
Message-Id: <20260401115542.1074290-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401115542.1074290-1-kunal1.joshi@intel.com>
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
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
2.48.1

