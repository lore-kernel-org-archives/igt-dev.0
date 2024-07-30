Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D597C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100C110E587;
	Tue, 30 Jul 2024 21:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpXzn7fb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922DE10E574
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375354; x=1753911354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKcq1UqUfHRNDIf7hkyRq+OJ2oZCZGO8rUfyz0BVBSQ=;
 b=dpXzn7fbFG6sHsU5eCWx1O0UCOKxiHC3nB1NwnhXboLVprx9cvfnC6Yn
 5T1mi4saa79FvwTJ7GhqQFTRsb/UiIpq1PgQEecE4hc4UADmVQ9eVzio5
 3bQv+eZYmJqUsBS3LuyO4qqi3HXmhY/MxuwZQyoY/tgAtt2u64lidqL5T
 RM1erjaznnw8SshCJ6dSz6rTF1XC+8WtiKh31kLtNWijU6gOF3oSYU7FK
 4PQ3lnsvEllzhgVh5JEkz4vi9sAal8s16fEuovqBIBrfxeWWldM70ncb9
 iwZ9jpB8XQPM70op9TZIFcev1VopAb1XBNBFjW97Dh5F2HbHc0y/KZ6Lq Q==;
X-CSE-ConnectionGUID: 49C52hoRQyKsuTR6EeNIEg==
X-CSE-MsgGUID: RIkzTklXQUKepZngReswjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694598"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694598"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:54 -0700
X-CSE-ConnectionGUID: kkmYC4MVSUucejTtz3wYCw==
X-CSE-MsgGUID: YkGxDiRcTnauKxmOsl4KMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321732"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:52 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 07/10] lib/igt_kms: add function to check force link
 training failure support
Date: Wed, 31 Jul 2024 02:43:38 +0530
Message-ID: <20240730211343.58703-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730211343.58703-1-kunal1.joshi@intel.com>
References: <20240730211343.58703-1-kunal1.joshi@intel.com>
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

add helper to check if platform supports forcing
link training failures

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1440ab227..581028b74 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7004,3 +7004,26 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
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
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_dp_force_link_training_failure", buf, sizeof(buf));
+	close(debugfs_fd);
+	return ret >= 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7540670df..4f0847385 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1260,5 +1260,6 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

