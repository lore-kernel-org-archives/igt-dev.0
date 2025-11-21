Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2A9CFA749
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 08:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6CC10E2ED;
	Fri, 21 Nov 2025 08:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULlxf+j6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A17810E2BA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 08:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763713075; x=1795249075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ado2u2eQwNWUVoC0do4sNF1auF+VyNC2tVWw+a1MV+E=;
 b=ULlxf+j60jmO2/4r2PICwv+lr9CSengfrxpZxndk0zbR8bs2Zsf6Cmi4
 Wg9YWOD0wOT+AaDpkMFcDdKx9m/u1SgaRmvFhCqbBr61px8wLolRO0lyG
 pEw47U43utYIXEGN+kPDXn+G9OrclIr4x4GEhTsH7qe4AoMDkKU0R724+
 CDqIovrHsc4/MCKzAuaU2HF+S1FhHymr5dgyFFHArpNBpx4jiU6LBoPoR
 NTnaKPhlxNprTpnfN6/5Jtsv7xcgW2aNloOJ0Xr29Jy0Sa7X+fFO+Xl5/
 qPsVGJoTkKuaDqtP6YCNr1f4gPs5s0+MXzTqX2vbQReRNvY04rqryAW2y A==;
X-CSE-ConnectionGUID: acVe+7eHQ8ayh3KevXDFhA==
X-CSE-MsgGUID: i5TgET26RfSThTRpjaAZWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65838363"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65838363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:17:55 -0800
X-CSE-ConnectionGUID: tUR7fzrTSDCt6hUJtTFCNQ==
X-CSE-MsgGUID: vuNsBEqPT8K5qgkU7dM8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196768012"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:17:53 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/3] lib/kms: Refactor get_num_scalers() using
 read_pipe_info()
Date: Fri, 21 Nov 2025 13:54:52 +0530
Message-Id: <20251121082454.1085001-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121082454.1085001-1-swati2.sharma@intel.com>
References: <20251121082454.1085001-1-swati2.sharma@intel.com>
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

