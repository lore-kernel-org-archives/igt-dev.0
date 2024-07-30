Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477ACC3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D8910E2B1;
	Tue, 30 Jul 2024 21:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvB1usCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6FF10E2B1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375347; x=1753911347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Z6+/dw29DvKUWoH5vjJYwcgukWoOCiZTA/5E7U7EGM=;
 b=NvB1usCnnMAH8iLu9AkM1M/+TQtcPRWFX15fLB+69IKgcGt1Lwr6p31I
 eetuqVL3OcNFr2U6T0ucV70oGCJCvQihtSur3d0sMhC9nYYs5aP2gDEN5
 iuqrIsishgsvYv+QGYU3NvBU9I2psW3ekdMq4mZVnbThETN7O5Jw7wXJ6
 lvibnO7JN73ctJ0PxNAJBvrPMlN5itr1NF23Tg9VS5+fDQMYcLovmkE2S
 i0vfW7wXzcJF51KulgGDXqpLFcAaR7B16AXWV83f8FE/GARh1BPb7erFS
 cEAGag/1mb0rZwhEucoNXumyMOP7ipj8qBpWfvYEtrOYNaAWFU+2wQQEm A==;
X-CSE-ConnectionGUID: 3Z23ybVHQMepwRXNS4j5cA==
X-CSE-MsgGUID: NXHNbf0kQW+2eq1d7otOUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694592"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:47 -0700
X-CSE-ConnectionGUID: ZYkVAFzsQzmSQvWuO6bSHA==
X-CSE-MsgGUID: KgfetiARQNKP9hFaSzy7dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321719"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:47 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 03/10] lib/igt_kms: add function to get max link
 rate/lane count
Date: Wed, 31 Jul 2024 02:43:34 +0530
Message-ID: <20240730211343.58703-4-kunal1.joshi@intel.com>
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

[1] allows to get max link rate/lane count for a particular
connector. add functions to retrieve data via newly
exposed interface

[1] https://patchwork.freedesktop.org/patch/594763/?series=133624&rev=3

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a21ab0bc8..6d2144483 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6838,3 +6838,59 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 
 	return lane_count;
 }
+
+/**
+ * igt_get_dp_max_link_rate:
+ * @drm_fd: A drm file descriptor
+ *
+ * Get the max link rate supported by sink.
+ *
+ * Returns: Max link rate supported by sink.
+ */
+enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int max_link_rate = DP_LINK_RATE_2000000;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_DIRECTORY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_max_link_rate",
+								  buf, sizeof(buf));
+	close(dir);
+	igt_require_f(res > 0, "Couldn't read i915_dp_max_link_rate");
+
+	igt_assert(sscanf(buf, "%d", &max_link_rate) == 1);
+
+	return max_link_rate;
+}
+
+/**
+ * igt_get_dp_max_lane_count:
+ * @drm_fd: A drm file descriptor
+ *
+ * Get the max lane count supported by sink.
+ *
+ * Returns: Max lane count supported by sink.
+ */
+enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int max_lane_count = DP_LANE_COUNT_4;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_max_lane_count",
+								  buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	igt_assert(sscanf(buf, "%d", &max_lane_count) == 1);
+
+	return max_lane_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cbec2c1ab..4ffe03bfc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1253,5 +1253,7 @@ int get_num_scalers(int drm_fd, enum pipe pipe);
 void read_link_rates(int drm_fd, uint64_t *link_rates, int *num_rates, igt_output_t *output);
 enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

