Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA408C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8941610E22A;
	Mon, 19 Aug 2024 09:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eb2sJMbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EAB10E22A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058870; x=1755594870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kNuOgYvXfZ3COruipeKIITkF+P+eK7q2uJteyjsrBpM=;
 b=Eb2sJMbXEv0FBg6kn8xqLas4BU+WzIyQe1RWlgipIdklldkkSVABTqgq
 bIHma7GC2RUv0IKXcKfw+9ReHewtzAKyfQuYbMXj4I/MZnhjsjhjzeWas
 ryk8ZwhmuEVE1lqbuQrX7UW9jeFem6EUd+lnW1sPu4FwibtsrfquaopfI
 2ch3HlIlZXxZ9KgX6ym5E3hR2x1N6qcUT215HT/XxGphTRojAbP9b28/r
 MBNXrgtw3KKcLASN70KbQa9t6fCJAV+MhXobmJpq0ojiwbBrpSTf+R16X
 bmP+ToEkQ+FL70u4Z1jX5O8Y9zFzvAGfqZN4Tx2JiqYo4HbTDO6oN7BWk Q==;
X-CSE-ConnectionGUID: ZffS3z8tQUmiQ5TrRXM0/Q==
X-CSE-MsgGUID: EK4BrV6cQza2AwnzfjU6og==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816320"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:30 -0700
X-CSE-ConnectionGUID: daxuK9tUSKqucNzb0hOZoA==
X-CSE-MsgGUID: Oof6WnZETIOzYeCo8kDhmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884181"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:28 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 07/12] lib/igt_kms: add function to check force link
 training failure support
Date: Mon, 19 Aug 2024 14:56:10 +0530
Message-Id: <20240819092615.3669803-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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

add helper to check if platform support forcing
link training failures

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 25 +++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1caf9df6e..2948bbb7a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7002,3 +7002,28 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
 	igt_require(res > 0);
 	return strstr(buf, "yes");
 }
+
+/**
+ * Checks if the force link training failure debugfs
+ * is available for a specific output.
+ *
+ * @drmfd: file descriptor of the DRM device.
+ * @output: output to check.
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
+{
+	int debugfs_fd, ret;
+	char buf[512];
+
+	igt_assert_f(output->name, "Invalid output\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
+	if (debugfs_fd < 0)
+		return false;
+	ret = igt_debugfs_simple_read(debugfs_fd,
+				      "i915_dp_force_link_training_failure",
+				      buf, sizeof(buf));
+	close(debugfs_fd);
+	return ret >= 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 39396ba40..62b1375f2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1260,5 +1260,6 @@ enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

