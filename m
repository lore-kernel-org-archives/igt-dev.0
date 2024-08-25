Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35142C5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6869810E0FD;
	Sun, 25 Aug 2024 19:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJk0qFca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7995D10E0FD
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615659; x=1756151659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v7AmZMe6obXWH/S+Onk3xZDs6hFDBHC2+PLlZknaY7E=;
 b=nJk0qFcaPuoyEn53jAOkBjB1caBF6XeysVL0Qph7OmS574EH2bpt919U
 wbp1DDQcjE15gON1J696UtJ7F6W1Fqj/+uD15MBPkAd2SYssYJRjh5Tol
 kXGhdKA40HwI/5m3QPv3Er2WkWFVdMoHfmhXqOIDMoJyPaXlne4i2CIdR
 fRfAFLF7OX+4KZZlajijNYrQ+VBoyZbIUE6rnP1Xv0W4CPWloLqXdSvlW
 w7HFDsBl+XgCdPoUzAi96XKI+W881Rv/g2EfrbrdZWyf2thVSS2uDamOq
 EGyqubSoObNr0HCkE5QMvFjp9xoxc7Lp8kEyrOS6mnETJEkDew2rS7mKq Q==;
X-CSE-ConnectionGUID: iAft4uK6TpKrDcuREDB0YA==
X-CSE-MsgGUID: T1w5sL+pR+616/khqTyRsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591450"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:19 -0700
X-CSE-ConnectionGUID: lBmegLI+SWqXFAxESk/0tg==
X-CSE-MsgGUID: AqwEazy5SZi7LzLi2ryJjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283637"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:18 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link rate/
 lane count for connector
Date: Mon, 26 Aug 2024 01:36:00 +0530
Message-Id: <20240825200612.4036178-3-kunal1.joshi@intel.com>
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

i915_dp_force_(lane_count/link_rate) debugfs files expoose
current link rate/lane count for connector.add helper to get
current link rate/ lane count for connector

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dd530dbab..4ef7f4d7f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6705,3 +6705,61 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 
 	return num_scalers;
 }
+
+/**
+ * igt_get_dp_link_rate_set_for_output:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Link rate set for the output.
+ */
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int link_rate;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_rate", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	if (strstr(buf, "[auto]"))
+		igt_assert(sscanf(strstr(buf, "*") - 6, "%d", &link_rate) == 1);
+	else
+		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &link_rate) == 1);
+
+	return link_rate;
+}
+
+/**
+ * igt_get_dp_lane_count_set_for_output:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Lane count set for the output.
+ */
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int lane_count;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_lane_count", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	if (strstr(buf, "[auto]"))
+		igt_assert(sscanf(strstr(buf, "*") - 2, "%d", &lane_count) == 1);
+	else
+		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &lane_count) == 1);
+
+	return lane_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 999921f9f..9d42a2b35 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1247,5 +1247,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

