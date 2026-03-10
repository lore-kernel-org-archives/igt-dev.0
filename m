Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2860AEB104B
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154410E235;
	Tue, 10 Mar 2026 10:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3w88G5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12E410E235
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139136; x=1804675136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgqch1vjdprJX5jsnwEF65MXsgsXkE2vzzgqNwh0B4U=;
 b=D3w88G5WjvL06sKjLh1oAb2OpJFWrifttLwNIz1vmdXAFvSc2AKmjy3G
 4D6S1+haZR7uXC500TrunCP+oW5qg4MD02fwO3Y4iaqRfI5KalmM4vody
 AdftMVil0RyAL9wNFFtaFDqBtsqV4PM7SixZQcggUVrWxGyP1f9M0wM09
 Eddk7Z22lxt0lts1jP1DDR8kx4g9BVg93TC4u00T9xr6HfT7ZMi/rWZ0a
 IQ1vK+fhXR0KvBJdISZuq3W812DHZ7hjZ32bTB0wnMFWrf14YP2p0TlV9
 aS3GzP0FJL1az4QRjMOHdsG186k/5LI456o78tDURUxoi/WvWlfwl1P+u A==;
X-CSE-ConnectionGUID: 6yk1n9tAS4Gzri6+jVCYPQ==
X-CSE-MsgGUID: 4DKxQpZNTgmwTdvjW6zB3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74059137"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74059137"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:38:55 -0700
X-CSE-ConnectionGUID: vASQoIkBTFeHp+tvlH7VeA==
X-CSE-MsgGUID: wFSS3pQ7TIKzWk+whaPMlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219313445"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:38:53 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t v4 1/1] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Date: Tue, 10 Mar 2026 16:05:54 +0530
Message-ID: <20260310103601.3195341-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260310103601.3195341-1-mohammed.bilal@intel.com>
References: <20260310103601.3195341-1-mohammed.bilal@intel.com>
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

v4:
-Rebase

v3:
-Rebase

v2:
-Update commit message (Jeevan)
-Update commit message for LOBF/ALPM clarification (Kamil)
-Rename function to igt_is_aux_less_alpm_enabled (Sebastien)
-Add explicit null-termination (Sebastien)
-Add igt_info() log (Sowmiya)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  4 ++++
 3 files changed, 37 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72..45defa694 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6591,6 +6591,38 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
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
index 081613a4b..1fe9b23ca 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1238,6 +1238,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
+bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(igt_output_t *output);
 unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
 void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index c15ab0aba..ec0692b2f 100644
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

