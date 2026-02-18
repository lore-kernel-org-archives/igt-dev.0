Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C12EE9A03E
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 08:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C6E10E584;
	Wed, 18 Feb 2026 08:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMXYaFq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9710E589
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771402184; x=1802938184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aYscyaJTMRZApW03rkxAOS5k4HQYo9GaG7qjHzZxnO4=;
 b=IMXYaFq14vxF8wFroy4ZcjMl/8kIswQPGhMnLajFWHyi9UfNdzErhnbE
 QA6pnHhHlExNpe26oPziMFQpRGy7PEatsfrXTIBXMfz7vlnp/03HbI1pc
 fWbI7rXdk20LjfZmxbFoAnGJdTyZhjg8kTjO8gfk2eW61E9s34tIk02+i
 QXEaSlN1gAeV/PensZf9xZ5oYtYLkHxIj/N3iaCRqrFhCJfLeKcfP8Hoq
 Iz3jeXKZWKHb2t3rrBF+g6zjcjCQbbXp6yq/qdzdq/XdKSzmH15Gp/fxz
 6/NmnWpK3UYTWZgB5xnnpK8Pe+9nvea2ud1LiXIZgRzq21zJOmoGdC2wu w==;
X-CSE-ConnectionGUID: D9YqeXBaR7qMliHyhZwYWg==
X-CSE-MsgGUID: scPg7fsJS6ypvIUwRzdiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72385296"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72385296"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:09:44 -0800
X-CSE-ConnectionGUID: pH9ViWm3RWeywkgSLklCQQ==
X-CSE-MsgGUID: XuIzK13+SZeSQc9aO6gj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237129379"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:09:42 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 sebastian.brzezinka@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM is
 not enabled
Date: Wed, 18 Feb 2026 13:34:34 +0530
Message-ID: <20260218080511.2534901-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260218080511.2534901-1-mohammed.bilal@intel.com>
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
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

LOBF can operate in either Aux-less or Aux-wake ALPM modes. However,
due to uncertainty around eDP version dependency and its impact
on LOBF execution, we currently restrict the test to run only when
Aux-less ALPM is enabled to avoid unexpected failures.

Add a helper to read the Aux-less ALPM status from debugfs and
skip the LOBF subtest when Aux-less ALPM is not enabled
on the panel, ensuring proper skip behavior and preventing
false negatives on unsupported configurations.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_kms.c   | 28 ++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  6 ++++++
 3 files changed, 35 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c4879604..48684b4b3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6578,6 +6578,34 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
 	return strstr(buf, "LOBF status: enabled");
 }
 
+/**
+ * igt_get_aux_less_alpm_status
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Check if Aux-less ALPM mode is enabled by reading
+ * the i915_edp_lobf_info debugfs.
+ *
+ * Return: True if aux-less ALPM is enabled.
+ */
+bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name)
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
+	if (res <= 0)
+		return false;
+
+	return strstr(buf, "Aux-less alpm status: enabled") != NULL;
+}
+
 /**
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dedc3f880..a1f52f452 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1257,6 +1257,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
+bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 811596ec2..e46e98727 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1013,6 +1013,12 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 			return false;
 		}
 
+		if (!igt_get_aux_less_alpm_status(data->drm_fd, output->name)) {
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

