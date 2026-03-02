Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E133AEA4E20
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 15:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED5610E141;
	Mon,  2 Mar 2026 15:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Du+ltIcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A396910E521
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772464701; x=1804000701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LjpVqpC3JxuKxPxrmt3qfrlYlG+wnIrpualx7EMrvEE=;
 b=Du+ltIcnvbQAuFPc07t35yyPgbVbrMr1iP+6tfCJ741jqxEXM3GCRC/F
 3xr4RIfpmgcnkdu+ykWqG0lENxHtgI3mPCE73+WNfIaMmF0zPoEmLOGZ0
 x/nJPwoTZLkVo46rCeTsIek5NJKg9vif278wxw9CXmmsXHbHj5ewGOSnD
 a7XtK633poirlriWmha2kAZ7qvskUUWiKq/IPYU0G7/RFZKAooZzgr1Yl
 w8rWGPu7uGXjwc/mmav5bmHkKWGOGMq562wtNbzKR/TVsoctK0JnlyXcl
 nmqmRU0hL/Zu7ZUaC09fawUMKShVBewftAxtEg9zAlpa15FHiL8YUv6d7 w==;
X-CSE-ConnectionGUID: zYQBKVMoSyib5ufD6Pl4IQ==
X-CSE-MsgGUID: X8tTeTTPR/6UGDtpWvkfaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77337551"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77337551"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 07:18:21 -0800
X-CSE-ConnectionGUID: ICPb3xLSSsylFf66xarYCA==
X-CSE-MsgGUID: QEKx9RZvTTK4nnhF9sqQqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="217699905"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 07:18:20 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Date: Mon,  2 Mar 2026 20:45:41 +0530
Message-ID: <20260302151547.3041214-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302151547.3041214-1-mohammed.bilal@intel.com>
References: <20260302151547.3041214-1-mohammed.bilal@intel.com>
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

LOBF (Link Off Between Frames) is a feature introduced in eDP 1.5+
that can operate in both Aux-less ALPM (Advanced Link Power Management)
and AUX-Wake ALPM modes.Currently, the test relies on Aux-less
ALPM support to validate LOBF functionality.

Add a helper to read the Aux-less ALPM status from debugfs and
skip the LOBF subtest when Aux-less ALPM is not enabled on the
panel, avoiding false failures on systems that may only support
AUX-Wake ALPM or lack ALPM support entirely.

v3:
-Rebase

v2:
-Update commit message (Jeevan)
-Update commit message for LOBF/ALPM clarification (Kamil)
-Rename function to igt_is_aux_less_alpm_enabled (Sebastien)
-Add explicit null-termination (Sebastien)
-Add igt_info() log (Sowmiya)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  4 ++++
 3 files changed, 37 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6087de365..1bef7c124 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6575,6 +6575,38 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
 	return strstr(buf, "LOBF status: enabled");
 }
 
+/**
+ * igt_is_aux_less_alpm_enabled
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Check if Aux-less ALPM (Advanced Link Power Management) mode is enabled by reading
+ * the i915_edp_lobf_info debugfs.
+ *
+ * Return: True if aux-less ALPM is enabled.
+ */
+bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
+{
+	char buf[256];
+	int fd, res;
+
+	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	if (fd < 0)
+		return false;
+
+	res = igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(buf));
+	close(fd);
+
+	if (res <= 0) {
+		igt_info("Failed to read i915_edp_lobf_info for %s\n", connector_name);
+		return false;
+	}
+
+	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
+
+	return strstr(buf, "Aux-less alpm status: enabled") != NULL;
+}
+
 /**
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e1f3ead5..5c3e55e2d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1233,6 +1233,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
+bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 569000fee..3dc64dfdb 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -908,6 +908,10 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 			igt_skip("i915_edp_lobf_status not present for %s\n",
 				 igt_output_name(output));
 
+		if (!igt_is_aux_less_alpm_enabled(data->drm_fd, output->name))
+			igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
+				 igt_output_name(output));
+
 		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
 			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
-- 
2.48.1

