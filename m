Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD7AC5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B9A10E110;
	Sun, 25 Aug 2024 19:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qxd0lFOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BA810E109
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615666; x=1756151666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPTinnc7IB2LUzS+4QQflFbGDwRdfcdpSYdeqf0ONS8=;
 b=Qxd0lFOBKcXB0I1pDQEEYczzk72vcrPjOjVR/3SNQi3rN82UuqWC87Fr
 Z3+uJUPP+wN+eWExP3TSXQNRGpQRjSQTivw3OqOajNX2FoXYnuDL6ONWK
 ithlt0lMsgJ9BUTEntS796q1hDsO0eTPbl6tBJ3xwasZJZvL5iEia+tEj
 zi9SDIT+AJwMhcZwC7xo0pW97+IUydaYUIGaaqPagrZaKZXIDG/MJWx7j
 eGLfhs3hhLdtN5mGXkljMCSr38GfVnYKmL56EHXbaky1PEsjGWaV4LUh7
 s+BR5YfraxfXdun+b9dUbrsxAmd71B7VuE5lCK7cYoXZ7K3n3lg9XhKAB A==;
X-CSE-ConnectionGUID: ADgLrYDoQOejiZl+qpsTSg==
X-CSE-MsgGUID: +RWcs2h6TRal6c1i8w+sxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591475"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591475"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:25 -0700
X-CSE-ConnectionGUID: x5SOu+8QQDiKIUdSYlCF2Q==
X-CSE-MsgGUID: pq+1MVj1Tt6atHXkQOb4Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283669"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:24 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 06/14] lib/igt_kms: add function to check if retrain
 disabled
Date: Mon, 26 Aug 2024 01:36:04 +0530
Message-Id: <20240825200612.4036178-7-kunal1.joshi@intel.com>
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

add helper to check if retraining is disabled,
retraining will be disable if we are at the lowest
link parameters or the lowest mode supported on a panel

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 683989e84..2720095d4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6869,3 +6869,27 @@ void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
 			     value, sizeof(value));
 	close(dir);
 }
+
+/**
+ * igt_get_dp_link_retrain_disabled:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: True if link retrain disabled, false otherwise
+ */
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
+{
+	int dir, res;
+	char buf[512];
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	res = igt_debugfs_simple_read(dir,
+				      "i915_dp_link_retrain_disabled",
+				      buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+	return strstr(buf, "yes");
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 57829416a..2d69d794a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1253,5 +1253,6 @@ enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

