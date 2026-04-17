Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A64F8DFEA
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416B510E992;
	Fri, 17 Apr 2026 08:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKp8utyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E532710E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415429; x=1807951429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lNmJiP/5kPFf1+AcUFe+vBbXqaI50+ubOOyzTGz+fbE=;
 b=OKp8utyfo6bDzpIJHSvidxKlfT2oB7gBA8tBQfJrNnIlResSdNi72xQN
 wxPeLCFxAZ3/IyAd8av2n5nY9ykzBC6XRxOeXBPB25NnCnGn77HtOpmtN
 yJKifdhel5Ubm3guu/m6YdCXkgLp5h/5FbNoBwh35HM2FYICcZk1ADhQ7
 wdt4WbB9jhC6+tTlyGLM7VfpDdH4hhuZ/MhGBhn92b0mwamqG9p+rsc4L
 Ix4XeEcjsHRkdeql0i+/2UFtXvXwDmeTj0/oFZlF46EoPjhuuMriYKi1h
 iykB0gQb2S/7oBaA4sMXLq4tvi5anOii5qpzlK4nyzNxGjwcWkJ0HkjTK g==;
X-CSE-ConnectionGUID: I1xLzui3Tpy5Xg5FLRKnoQ==
X-CSE-MsgGUID: aXDrMRb5RD6WRHJActfjQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308437"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308437"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:49 -0700
X-CSE-ConnectionGUID: od2bXgvQSrKsQzfvNcB+LA==
X-CSE-MsgGUID: 33LNdTKrSzKC/GDyHqgvzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361728"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:48 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 2/7] Revert "tests/intel/kms_pm_dc: Add polling for
 deep-pkgc"
Date: Fri, 17 Apr 2026 14:05:01 +0530
Message-ID: <20260417083506.33404-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

This reverts commit 0e443bec0ccfb56c2754437b465fc197ee4fd481.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index da74a21ce..bb5f2ffc5 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -586,26 +586,22 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-	/* Wait for the vblank to sync the frame time */
-	igt_wait_for_vblank_count(crtc, 1);
-	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
-	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
-	usleep(delay * 0.5);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
 
-		igt_wait((cur_val = igt_read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
-			 (delay * 2), (5 * MSEC));
-
+		cur_val = read_pkgc_counter(data->debugfs_root_fd);
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
+		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0

