Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BB2C5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B6010E10F;
	Sun, 25 Aug 2024 19:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mqp1lOso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A425C10E10E
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615668; x=1756151668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=seQQjq5LY1cS4AGt1phLS0PpFqWn3V9xKifqka4qvaA=;
 b=Mqp1lOso1RLDzSUYUktNCQUJThKYr5G7u2ZZzLuRUsQ+et/c9LU9KRsP
 NjKm4XvSfGI2uxSb3Sk4/edhBQFwXQdQYaX6bZPRfveO87lLrYM/RfC4j
 a0M8TVsiOdh4XfPYXcn4hIj4PYEhUXjJh+IYMEDNjob+VOgc+ZSuHVjxf
 HKZ/sKNN1pb9ZHPHseVdb64cBGxkYCUaBW8UfC3HbXq6cz/KFSKHU/Xzl
 0g/UcyRCvOT4Uqnm4jhExiCvae7fsuJEWedJlKqjHknW7a/3C+wPfvRUZ
 cmZHN3DkJDUtQF65SivizZYBaXCUl+vVi2FZyPR7Vz9JFQo/SrMlARYgL A==;
X-CSE-ConnectionGUID: vWTRHCltQAyOIBT8ouj5sw==
X-CSE-MsgGUID: UVHfXQ8ZQ7inNw5OeJsDSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591486"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591486"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:27 -0700
X-CSE-ConnectionGUID: SNZ7I7awQ/iInuHi9sIRqg==
X-CSE-MsgGUID: lcxqbVGoRnymK1dxma9HLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283683"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:26 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 08/14] lib/igt_kms: add helper to get pending lt failures
Date: Mon, 26 Aug 2024 01:36:06 +0530
Message-Id: <20240825200612.4036178-9-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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

i915_dp_force_link_training_failure can be written to
written to trigger link trainig failures on retrain.
add helper to get pending link training failure count.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4ab47e2e9..727fa83f1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6918,3 +6918,26 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 	close(debugfs_fd);
 	return ret >= 0;
 }
+
+/**
+ * igt_get_dp_pending_lt_failures:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Number of pending link training failures.
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
index 5ae324f6f..07dbcb263 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1255,5 +1255,6 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

