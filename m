Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58E9C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F32B10E22B;
	Mon, 19 Aug 2024 09:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZ0HXyLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4580C10E22B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058871; x=1755594871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7x/66tqPfLUCjb6cVYkgfBqCXN6RPAXZQ1vm1uEIeNI=;
 b=CZ0HXyLV5kWuWAHfiFQLPcClFjblrpssEQfL4UgMp2PCrjuBaJoJkHZ1
 XJAaXLkwHC3w/b8vGu+VhnE7vPU/8G7MhFmkGUr2dq3BmblnrfQL5gMKB
 bcNo8ca34nDBwUGzeThHtstQBBRIo7iDiNjgvTkyPOwFFqbvEm2ucFXvC
 OS689X3RM0rawa4wzTmzUHQGXzC/nCx217edImXgK6/ben3r0PndK0lLs
 irb9B2UR/JnIP2auDSJ+MdZV9lu8jcJVuFhs3Lepr4TS7cDTB32bxUUCI
 gzcXjkaRJCydncvMy9LwhX/GmP5w6kq09mM71Ch9EnN6AwoyGnZADyYAp w==;
X-CSE-ConnectionGUID: oWFS7eKYSv2RuR2QiD4kDg==
X-CSE-MsgGUID: U4X1/S6hQKyECdwe4RlHVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816324"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:31 -0700
X-CSE-ConnectionGUID: i7LwRZ10SBW5VWtKnhVtrg==
X-CSE-MsgGUID: C87dKXcYR7m9cYvu4rKT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884187"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:29 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 08/12] lib/igt_kms: add helper to get pending lt failures
Date: Mon, 19 Aug 2024 14:56:11 +0530
Message-Id: <20240819092615.3669803-9-kunal1.joshi@intel.com>
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

add helper to get pending link training failure

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2948bbb7a..4a501e6bf 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7027,3 +7027,27 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 	close(debugfs_fd);
 	return ret >= 0;
 }
+
+/**
+ * igt_read_link_training_info:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @link_training_info: Link training info to be filled
+ *
+ * Returns: Sets link training info.
+ */
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
+{
+	int dir, res, ret;
+	char buf[512];
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_training_failure", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 62b1375f2..88e88a6c7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1261,5 +1261,6 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

