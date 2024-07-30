Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE38C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D9C10E574;
	Tue, 30 Jul 2024 21:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXgASAXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D8210E300
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375352; x=1753911352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOJ5OQSvlMKvO82AIaV5tDM50L9+qYUHoop8kVkOm6s=;
 b=AXgASAXGtITWUe8qClF6kmEMfBu+l5ibGdocQ1xL8Yoy94S7bPshbbBd
 0MCOgzFOuN7qVZSX4SsaoMnP10U3q41qYQOp1KI5csBltH1SPYcbc/tho
 zpmlO/tvbvhGs2HDgw23ZX/PJnjIIwi1YbYDsmHmOM6M+9Iw4ebsjBCBw
 Xkl3z9hrs81CLHKJ32SQTxiAXpRGbhaHteWcWW85+DkvXTGPyt4IgEp20
 eb2avXUKCJ9SocHc7DdzuzEEqdqy/kgPFm5B9ceqV20cNlMCvR4BF8ocP
 28m2DcJHJhTwXQhgDJzx1louLvZMRz4b7CBphQUADZdR5Bn9ABH9RC3dj g==;
X-CSE-ConnectionGUID: FrFrA5tFROSrySWlYoePgg==
X-CSE-MsgGUID: pkWA+O06R+ay1uNQA4CKwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694597"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694597"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:52 -0700
X-CSE-ConnectionGUID: Lgp8o7IPQkyrjmJTAqjDPQ==
X-CSE-MsgGUID: HZKiUfxrQCmFUXGm8LDgJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321729"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:52 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 06/10] lib/igt_kms: add function to check if retrain
 disabled
Date: Wed, 31 Jul 2024 02:43:37 +0530
Message-ID: <20240730211343.58703-7-kunal1.joshi@intel.com>
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

add helper to check if link retraining is disabled.
link retraining will be disabled when we are at the
lower (link rate, lane count)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a5bc0adff..1440ab227 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6982,3 +6982,25 @@ enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output)
 
 	return max_lane_count;
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
+	res = igt_debugfs_simple_read(dir, "i915_dp_link_retrain_disabled", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+	return strstr(buf, "yes");
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 310b835f6..7540670df 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1259,5 +1259,6 @@ enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

