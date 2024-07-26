Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F2AC49EA1
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 10:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A8010E95C;
	Fri, 26 Jul 2024 10:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCfdyz9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B27010E95C
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721988238; x=1753524238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Enzo8mHqhHmA4sG8/sXJuZk5dvlDJ8SRvkgDMk3fJnM=;
 b=RCfdyz9fLYX1t2rgQ1PW+PpfP/Y8EBxmA6/TMMZjK+MLQQzbSqZ7Mqlv
 OdxRATnmHpsBlTGhc2YHNWOBbhpZlpnr7FOyRG9Oox/Rq1N3RzYCJGGtn
 O1VV57d8A2Nq2ruPMxGryJx9sl0s33G8bxZyzMC/+q3linIhBhY6CwjrK
 Oe+DazRXAxxQ4xocW0o4JTegHCNjeW3OKjdCQJNKaz05LBY6UWwT+/fQ2
 ORqzQXjteKsgIvaI5FVwFKv5ll+zja1uUF+hGpktCLgWb1ynBc1OpIC67
 9+8NpYEdCggDhIkZve1mGjJJJPFZvIAEHji5By0VJjSG/G0Pma/OYxR+Q w==;
X-CSE-ConnectionGUID: vgw3nFIuTW27KB/e4QFH7Q==
X-CSE-MsgGUID: NSudq5nkR9COw+BiQQtZmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22689752"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="22689752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 03:03:58 -0700
X-CSE-ConnectionGUID: MuD+hcZdQOu1DhbDYCJ2pA==
X-CSE-MsgGUID: aHGsTa1+RfmS2m82s3uB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58008679"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 03:03:55 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com, kamil.konieczny@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 3/4] tests/intel/kms_pm_dc: Add polling for deep-pkgc
Date: Fri, 26 Jul 2024 15:37:50 +0530
Message-ID: <20240726100751.918038-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
References: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
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

Added vblank wait to synchronize with frame time. Replaced
read_pkgc_counter function with igt_wait function to poll for
PKGC10 every 5ms until 2 frame times are reached.

v2: Address and correct review comments (Suraj, Jeevan)
v3: Update commit subject/message.  (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 09d362694..92c146d6c 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -635,23 +635,24 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
-
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
+	/* Waiting for the vblank to sync the frame time */
+	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+	usleep(delay * 0.5);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
+		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
+			 delay * 2, 5);
 
-		cur_val = read_pkgc_counter(data->debugfs_root_fd);
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
-		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0

