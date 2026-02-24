Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF95EFB806
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 05:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1249A10E4AF;
	Tue, 24 Feb 2026 05:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSXW3TkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8062310E4AF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 05:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771912100; x=1803448100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wCGDbi1X8wFo8VcFzLzPYo8vfeq7m6JpkFH+m1R4Ozw=;
 b=WSXW3TkUS3KD9W9aSiDRQxTSbNOgqMiNttRN1j540INivH7Cc5GR68+y
 PjH+wZxLJ69FfcR3+GPxsW/i2+jKBRaSQ6HTLlAPsKqQoJ7r/MWeGxLA3
 fNZBx58VvmBq9iui9a8UklYzWEnziN2gFzbO0+dWzrY/+7vm30mYZCu3d
 AwFBfogvAXRqPKVaRPbsSZN5iXTDmlf5eawCL8sLcysSu7yyqacKFcSSm
 Wl1akrduk1gchSub5ZNqCo8WK4JCnQrOAUycXHa0mjbEvaxekRxA2Sdoz
 HTJCeFpzj9Yqj4iaE7NYW8Tuma59/WxYyVqfu0sDcfDb5wt7QGAaLaxM4 A==;
X-CSE-ConnectionGUID: nC+bYHn2SZqVZVZbPrrzNA==
X-CSE-MsgGUID: rFkJbplqRt6Q02YaZu1/ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95535459"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="95535459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:48:20 -0800
X-CSE-ConnectionGUID: 83q36zeiTGelpTk0HOpkAg==
X-CSE-MsgGUID: ODhGZ2MvQxC/EOABaBaCVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219900921"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:48:18 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 kamil.konieczny@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 1/1] tests/kms_vrr: Skip LOBF test when aux-less ALPM is
 not enabled
Date: Tue, 24 Feb 2026 11:15:11 +0530
Message-ID: <20260224054530.2946765-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260224054530.2946765-1-mohammed.bilal@intel.com>
References: <20260224054530.2946765-1-mohammed.bilal@intel.com>
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

-v2:

-Update commit message (Jeevan)
-Update commit message for LOBF/ALPM clarification (Kamil)
-Rename function to igt_is_aux_less_alpm_enabled (Sebastien)
-Add explicit null-termination (Sebastien)
-Add igt_info() log (Sowmiya)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  6 ++++++
 3 files changed, 39 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c4879604..5f7def664 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6578,6 +6578,38 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
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
index dedc3f880..c2fc53953 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1257,6 +1257,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
+bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 811596ec2..c1f69ac54 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1013,6 +1013,12 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 			return false;
 		}
 
+		if (!igt_is_aux_less_alpm_enabled(data->drm_fd, output->name)) {
+			igt_info("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
+				 igt_output_name(output));
+			return false;
+		}
+
 		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
 			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
-- 
2.48.1

