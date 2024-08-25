Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF7DC5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7769E10E107;
	Sun, 25 Aug 2024 19:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N21jSPYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7210E103
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615662; x=1756151662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6v1HdbFTzYoaZhVK0xDaycpTO4x226QRF2QvSwXxmnw=;
 b=N21jSPYj9pExeS46lwJQZ0abub8+ZfdeL5EKNMLVkZ10lnC+UFqTYX9o
 Cs6EJOTzNYLMK0ty57+uJKmG+lFruIPpoEGnw1mn1Rve2thl4FV1BQFiT
 rNJMXCoFVEegmyh0zq2q0fApDurktf7+mlgBXkuLLP1GbQsS7llmOwgBQ
 e26U7iq8ipUqYtrQsWTbE66SyVsfbllfKbY5Kv0HC4mWGigWGVwhBEBUN
 M+qM9JD/ABz+58Ok8fyFGMhrF0UWjb1SxXpyfoccNnFg0KeE+lorjgcNf
 Hf8juXwRUWoqgyvwD3+aT3X3HOPDREmwmYsI4Ulm8GsCV0o3r5iZkddqe g==;
X-CSE-ConnectionGUID: IbWKM6U4R+yg0LPMQMsZUg==
X-CSE-MsgGUID: +OasguNCQ1uL40b2u0JtAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591459"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591459"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:22 -0700
X-CSE-ConnectionGUID: heMvL7jwSj+K82YfyJy8Ig==
X-CSE-MsgGUID: dRLcKYlDQfWs/UqtAYWwPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283652"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:21 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 04/14] lib/igt_kms: add function to force link retrain
Date: Mon, 26 Aug 2024 01:36:02 +0530
Message-Id: <20240825200612.4036178-5-kunal1.joshi@intel.com>
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

i915_dp_force_link_retrain debugfs allow forcing retraing
on the connector. add a helper to write given retraining count
to the same.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 21ea8550c..553a08f2f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6821,3 +6821,25 @@ enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output)
 
 	return max_lane_count;
 }
+
+/**
+ * igt_force_link_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @retrain_count: number of retraining required
+ *
+ * Force link retrain on the output.
+ */
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
+{
+	int dir;
+	char value[2];
+
+	snprintf(value, sizeof(value), "%d", retrain_count);
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	igt_sysfs_write(dir, "i915_dp_force_link_retrain", value, sizeof(value));
+	close(dir);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1d3226c5c..9ba8c6394 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1251,5 +1251,6 @@ enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

