Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D1FC5472C
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D5710E103;
	Sun, 25 Aug 2024 19:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3yQ2CIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F3F10E103
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615663; x=1756151663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4UNSQlZqCSmZ7cQ2dmmHkoZnxPucvtvrMpJy5fPYBOE=;
 b=K3yQ2CIPArKDZB+5nVJtLCf9c8ekHD7L3Ulgl7QbpaQeVJInjXZbpm9Y
 zZwsIP4Ot2CbEKPjI71wSEtwbHH1OCycKSIFKSqxe+JqbMDkx4MyVbPie
 TWw09lx4cZFfL3u8JM9yA3SvUHnbtj6KdWuAgY3sD0FrwRf5FawJTzdED
 a01U0WEMh7uWMbiIaCLk4k6rSOWJKELavH+GyAA3lkMFrOvCaDHZDoa9K
 P6dy9J/N/i0qYrbu5sQtHr3+/QzYnsHWBUQp1nBaWtsa1PSWXZXXf5f/8
 WSt5bHtgPyinJAsXauSHt5y4KjCa2xi6rL4WhQxzqxA+VIi/N7U6mTFwF g==;
X-CSE-ConnectionGUID: rBg4dt2cTGO92Dhut4Hl9A==
X-CSE-MsgGUID: +ZxRRv7CR9SLGdLCGEog8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591466"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591466"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:23 -0700
X-CSE-ConnectionGUID: Y6zlgS0yRYqGog9awSOqBg==
X-CSE-MsgGUID: z2C6arB+RoiKVzVwrIrvEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283663"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:22 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 05/14] lib/igt_kms: add function to force link training
 failure
Date: Mon, 26 Aug 2024 01:36:03 +0530
Message-Id: <20240825200612.4036178-6-kunal1.joshi@intel.com>
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

i915_dp_force_link_training_failure debugfs
file is used to force link training failure.
add a function to force link training failure.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 553a08f2f..683989e84 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6843,3 +6843,29 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 	igt_sysfs_write(dir, "i915_dp_force_link_retrain", value, sizeof(value));
 	close(dir);
 }
+
+/**
+ * igt_force_lt_failure:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @failure_count: 1 for same link param and
+ *                2 for reduced link params
+ *
+ * Force link training failure on the output.
+ * @failure_count: 1 for retraining with same link params
+ * 				   2 for retraining with reduced link params
+ */
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
+{
+	int dir;
+	char value[2];
+
+	snprintf(value, sizeof(value), "%d", failure_count);
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	igt_sysfs_write(dir, "i915_dp_force_link_training_failure",
+			     value, sizeof(value));
+	close(dir);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9ba8c6394..57829416a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1252,5 +1252,6 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

