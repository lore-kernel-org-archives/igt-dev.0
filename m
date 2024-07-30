Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82814C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB2010E588;
	Tue, 30 Jul 2024 21:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkUGe2vk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8F110E588
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375356; x=1753911356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YOZSs4zPW+0NtJCjfFQb+PWWZ/gaISAucvWeKW+8bxk=;
 b=fkUGe2vk8+VXPh0nx8uI2URhu0DL4hDi/DIfNX27QDudgPDieivkzPAp
 crZztyEFTFx8w+LVth1788vDP/6IlIGGQj2+mVMjgbSlCIUl5V2e+PoA6
 ZzJGfz9pDJzIXO1L1VVyPSSZ+DtSW5Q5T74SvUzqACSPmHeQ5GOrdoS0S
 10iPvVlzI9s/g2J7K6kJiFAtONTaSOeGhoYsanSFB1oDPkP5YPC5WRGFT
 9398eH3rsRuL8aXPqpVRdFYcyuZcVZSWJUt0SlfXnOtyrNHUhqeqVgF7J
 kgRpapDofOklPtDiHbgaYqdPdYY52Ya3dC7LTPa8i88xy7jacuPgMJmGZ g==;
X-CSE-ConnectionGUID: Dv2LaxLLQfGYjJJef1scAg==
X-CSE-MsgGUID: /W6SrVCfRT2+Q6IIxI5g3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694599"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694599"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:56 -0700
X-CSE-ConnectionGUID: W/n6wVRuSMSlF06Yg4Ft9g==
X-CSE-MsgGUID: 5RDhgeD1SsCB9qasY+Khag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321735"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:54 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 08/10] lib/igt_kms: add helper to get pending lt failures
Date: Wed, 31 Jul 2024 02:43:39 +0530
Message-ID: <20240730211343.58703-9-kunal1.joshi@intel.com>
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

link params are reduce on two consecutive lt failures,
add helper to get lt failures pending.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 581028b74..611f80ef0 100644
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
index 4f0847385..58dda6b45 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1261,5 +1261,6 @@ enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

