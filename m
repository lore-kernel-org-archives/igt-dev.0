Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801A4CAC5A8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 09:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135EE10E320;
	Thu, 18 Sep 2025 09:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvbKfwOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5F10E12A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758186073; x=1789722073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OTbjr+jgZNfKxrKZlPXCVeRJa10p+N0u2mkzM0JBsgM=;
 b=MvbKfwOSrYfODn6GjsZk8tsqUoqjrjMqnW0i+KUyyiQiNGUReAeAt4Q0
 y7enQl3Pt+bnz2dc0oPsaO2WNdjNPTU/I+UK+HAU1Fsbe6Og/R/0Hn5GS
 ujMrYp7kyIjFUoSb1s2DMjb/VLFpJuPBf47Y26DkCQ9bmbwZSeb6koriC
 QWy8VmzrDhFb+Uk9xIr2zxtF6qYhIHe124KXj4qDPjadHyqnTnRiBRJ5Y
 EUeF+zHpxfJaoj68uzBC+f+eORo7K8RXOnjyJVhFx/eQCAIn/1IiENsi7
 VgYfqOSI6/k4D917scka6WwJDezyaASY0udW6XmT5cqP9aNL3Z6qa42a1 A==;
X-CSE-ConnectionGUID: pKhwx1h/RH+HgIWd2jMZZQ==
X-CSE-MsgGUID: 0ajbv3jeTzC4Lp1HxK2N+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64313248"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64313248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:01:13 -0700
X-CSE-ConnectionGUID: Jv9ZtWBTTaqW5NdBAoLa/w==
X-CSE-MsgGUID: fgqEPTKLTNGHEU6AbYVGVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206281473"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:01:11 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of lobf
 debugfs
Date: Thu, 18 Sep 2025 14:47:00 +0530
Message-Id: <20250918091702.2339227-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918091702.2339227-1-kunal1.joshi@intel.com>
References: <20250918091702.2339227-1-kunal1.joshi@intel.com>
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

Added helper to check if i915_edp_lobf_info debugfs
exists for given output.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 20 ++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index df4a96a17..699562810 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6210,6 +6210,26 @@ void igt_dump_crtcs_fd(int drmfd)
 	drmModeFreeResources(mode_resources);
 }
 
+/**
+ * Checks if the lobf debugfs
+ * is available for a specific output.
+ *
+ * @drmfd: file descriptor of the DRM device.
+ * @output: output to check.
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
+{
+        char buf[512];
+        int res;
+
+        res = igt_debugfs_read_connector_file(drmfd, output->name,
+                                              "i915_edp_lobf_info",
+                                              buf, sizeof(buf));
+        return res == 0;
+}
+
 /**
  * igt_get_i915_edp_lobf_status
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6ef6871d5..7121ab985 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1232,6 +1232,7 @@ void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_fit_modes_in_bw(igt_display_t *display);
+bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
-- 
2.25.1

