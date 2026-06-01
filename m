Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CFFCD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 05:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8D1112DA1;
	Mon,  1 Jun 2026 05:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D96aOiDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E21112DA1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 05:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780292066; x=1811828066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SprdSWFHMBVAowaATeKdLKoRMrnngWYa9j7psJLQfxo=;
 b=D96aOiDAT2/DUlGhAyndhIDKUfi/UFE8o7mcZilqaSiHDv1DfbXVq5RO
 6m/7ehC3ZiahRhMwSYlDlCrzRV+lLsHiDrwomHnKPV5m3entSkl02ZDBn
 Vl332x2KixeWDfc4eJlShRtlvDsUgqv85iB8PTCqpetl3H1nyIeOE/UBz
 35mymnN/bxgzXp7kULMPRMrXJGt8NpgRik9HMceHxbujjKGMekK9Sj+q7
 I7cwu2b0MM6xOfJP6Uaz4ctZ5m93BQW+3qm1CTMicrxg1qy3k+StffzMM
 fKfnEehnLXvHkVuwJMooTkoamx0/T5CFtMVfKWSq9M00qGda2cYXu4/Fv g==;
X-CSE-ConnectionGUID: jLhon2OwQ3GB/lyWs1flYA==
X-CSE-MsgGUID: ikJlxIvcSzqYDTUuiGMpkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103712760"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="103712760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:34:26 -0700
X-CSE-ConnectionGUID: ihGDdv6bQNm4YQpqm+Q8DQ==
X-CSE-MsgGUID: 2t+BvzZdR56dNeK0bhOdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243310140"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:34:24 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_kms: Rename max_non_joiner_mode_found to
 intel_boundary_non_joiner_mode_found
Date: Mon,  1 Jun 2026 11:25:42 +0530
Message-Id: <20260601055545.1982351-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601055545.1982351-1-kunal1.joshi@intel.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
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

The function checks if a connector supports a mode at the platform's
maximum single-pipe hdisplay boundary. Rename to clarify intent with
intel_ prefix to indicate Intel-specific semantics.

Update all call sites in tests to use the new name.

Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit")
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c            | 12 ++++++------
 lib/igt_kms.h            |  4 ++--
 tests/intel/kms_joiner.c | 10 +++++-----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0f1ce03a9..ef2d92812 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6979,20 +6979,20 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 }
 
 /**
- * max_non_joiner_mode_found:
+ * intel_boundary_non_joiner_mode_found:
  * @drm_fd: drm file descriptor
  * @connector: libdrm connector
  * @max_dot_clock: max dot clock frequency
  * @mode: libdrm mode to be filled
  *
- * Finds the highest possible display mode that does
- * not require a big joiner.
+ * Check if connector supports a mode at the platform's maximum single-pipe
+ * hdisplay boundary.
  *
- * Returns: True if a valid non-joiner mode is found,
+ * Returns: True if a valid non-joiner mode at the boundary is found,
  * false otherwise.
  */
-bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
-			   int max_dotclock, drmModeModeInfo *mode)
+bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+					  int max_dotclock, drmModeModeInfo *mode)
 {
 	int max_hdisplay = get_max_pipe_hdisplay(drm_fd);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2a3099de..01a7b0d4a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1268,8 +1268,8 @@ int igt_get_current_cdclk(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
-bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
-			       int max_dotclock, drmModeModeInfo *mode);
+bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+					   int max_dotclock, drmModeModeInfo *mode);
 bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
 bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 86226a3ba..58ebfdd5e 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -594,9 +594,9 @@ static void test_basic_max_non_joiner(data_t *data)
 				igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 				igt_output_set_crtc(output, crtc);
-				igt_require(max_non_joiner_mode_found(data->drm_fd,
-								      output->config.connector,
-								      max_dotclock, &mode));
+				igt_require(intel_boundary_non_joiner_mode_found(data->drm_fd,
+									          output->config.connector,
+									          max_dotclock, &mode));
 				igt_output_override_mode(output, &mode);
 				igt_info("Appplying mode = %dx%d@%d\n", mode.hdisplay,
 					 mode.vdisplay, mode.vrefresh);
@@ -662,8 +662,8 @@ int igt_main()
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
-			non_joiner_found = max_non_joiner_mode_found(data.drm_fd, connector,
-								     max_dotclock, &mode);
+			non_joiner_found = intel_boundary_non_joiner_mode_found(data.drm_fd, connector,
+									         max_dotclock, &mode);
 
 			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
 				force_joiner_supported = true;
-- 
2.25.1

