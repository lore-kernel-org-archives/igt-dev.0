Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0981CFC267
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A33110E137;
	Fri, 21 Nov 2025 12:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFcNKOIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AA010E137
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763727888; x=1795263888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ado2u2eQwNWUVoC0do4sNF1auF+VyNC2tVWw+a1MV+E=;
 b=SFcNKOIYoWvugVZBYYqMp/le3Wm4GBkVMdTV46mS4G7LG6eDf3oeVRdb
 o83btPjE02rwCbYWNk36JYzTO7D6yPtH6+Ud/i1l2c0GeDQMh+r2rmwGk
 9ESzLPsccmGRe0CKazCI+V+BzawFQ5+34oeDdTblmBWbxRapCan6EDMNw
 70YTLyil/cn8c8hZhtVMg6JYV4Kss4SnR6DUWMLL9nbMRPaqifFeTYdkQ
 LRQojoiVz1iNu6CgodYar8/oB3DxBo65o2kfSuxx+//HQbY1bscQv6EKe
 0WSIQM8C4N8yzukeboXV0TH8cwLbMcU5WtL7biXXtUUCJTvg/+EzdLdxo A==;
X-CSE-ConnectionGUID: RbyGOyIARNibB3zyfkd11Q==
X-CSE-MsgGUID: 8wml/eMDR5eVrMpy0dTaeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77289588"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77289588"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:24:47 -0800
X-CSE-ConnectionGUID: in198kYBQOiiCszglYJLdg==
X-CSE-MsgGUID: Lt6B8iYHTE64NpYW3Ena7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215047357"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:24:46 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/6] lib/kms: Refactor get_num_scalers() using
 read_pipe_info()
Date: Fri, 21 Nov 2025 18:01:32 +0530
Message-Id: <20251121123134.1099006-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121123134.1099006-1-swati2.sharma@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
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

Introduce a read_pipe_info() helper to extract per-pipe sections from
i915_display_info. Update get_num_scalers() to use the new helper without
changing functionality.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8973ffdb2..a75323645 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7026,6 +7026,28 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
 	return connector_id;
 }
 
+static char *read_pipe_info(int drm_fd, enum pipe pipe,
+		            char *buf, size_t buf_size)
+{
+	int dir, res;
+	char *pipe_loc;
+	char dest[20] = ":pipe ";
+
+	strcat(dest, kmstest_pipe_name(pipe));
+
+	dir = igt_debugfs_dir(drm_fd);
+	igt_assert(dir >= 0);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info", buf, buf_size);
+	close(dir);
+	igt_require(res > 0);
+
+	pipe_loc = strstr(buf, dest);
+	igt_require(pipe_loc);
+
+	return pipe_loc;
+}
+
 /**
  * get_num_scalers:
  * @display: the display
@@ -7036,30 +7058,18 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
 int get_num_scalers(igt_display_t *display, enum pipe pipe)
 {
 	char buf[8120];
-	char *start_loc1, *start_loc2;
-	int dir, res;
-	int num_scalers = 0;
+	char *pipe_loc, *scaler_info;
 	int drm_fd = display->drm_fd;
-	char dest[20] = ":pipe ";
-
-	strcat(dest, kmstest_pipe_name(pipe));
+	int num_scalers = 0;
 
 	if (is_intel_device(drm_fd) &&
 	    intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
 
-		dir = igt_debugfs_dir(drm_fd);
-		igt_assert(dir >= 0);
-
-		res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
-		close(dir);
-		igt_require(res > 0);
+		pipe_loc = read_pipe_info(drm_fd, pipe, buf, sizeof(buf));
+		igt_assert(pipe_loc);
 
-		start_loc1 = strstr(buf, dest);
-
-		if ((start_loc1 = strstr(buf, dest))) {
-			igt_assert(start_loc2 = strstr(start_loc1, "num_scalers="));
-			igt_assert_eq(sscanf(start_loc2, "num_scalers=%d", &num_scalers), 1);
-		}
+		igt_assert(scaler_info = strstr(pipe_loc, "num_scalers="));
+		igt_assert_eq(sscanf(scaler_info, "num_scalers=%d", &num_scalers), 1);
 	} else if (is_msm_device(drm_fd)) {
 		igt_plane_t *plane;
 
-- 
2.25.1

