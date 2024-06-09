Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40666C27C5E
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042810E2B9;
	Sun,  9 Jun 2024 21:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5cdi2DZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE210E2C0
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967625; x=1749503625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZr1m2uSMaBYNfGeadVujtVBGPtGd7cjr1CH7CoMxwA=;
 b=N5cdi2DZxizC2ZeiADbR9rs4e/IlXFO7crplv/gfO1GPOcyE6DHhGiNX
 t2vbZ+6+oWMeO4ZW9s+l6v8mshLqVUpy0KU/Ae4uTJOkaGW0bpZMxOw8k
 VQkmD2hV1ADb4C1dYoJF2iz+Iz2dANIU8ZLwLaEKn035qCsmA9KuxOeeF
 W9V/wflgwA+1tLG4rok2d3q6MeLWjCrh4cEhqvDgMdMSFWDBYBiW1AmSC
 40eZZvN4R2l+adEpUtVLcncHfVyLUaXN2OciLH5zaNdzvaeM0WIj9t4Pw
 /3BiSnA87PTjq31z2iQ1mZPPJGjxDRIq9ZXM06ruHwD9dJQIfVU47KRSC A==;
X-CSE-ConnectionGUID: myeEPPz+Rt2SXS9p4LG/Sw==
X-CSE-MsgGUID: KIxgbuXqQOuSnlbKqYuFrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037480"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:45 -0700
X-CSE-ConnectionGUID: +AMCrFtnT9Gmr3HuzKu2wg==
X-CSE-MsgGUID: NkNbDWerRfifeOxbPtXE2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991018"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:43 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/9] lib/igt_kms: add function to get max link rate/lane
 count
Date: Mon, 10 Jun 2024 02:55:29 +0530
Message-Id: <20240609212535.868832-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240609212535.868832-1-kunal1.joshi@intel.com>
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
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
index 54e982c81..922982ef0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6757,3 +6757,59 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 
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
index 43bc238ae..794059e3d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1260,5 +1260,7 @@ int get_num_scalers(int drm_fd, enum pipe pipe);
 void read_link_rates(int drm_fd, uint64_t *link_rates, int *num_rates, igt_output_t *output);
 enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

