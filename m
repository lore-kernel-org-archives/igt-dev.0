Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0ACCD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 09:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F8710E268;
	Mon,  2 Sep 2024 09:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ni3r89wm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD6210E267
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725267622; x=1756803622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AH5vsLBJBUf+D8eZ3B6A8gId0+NV5UAUPoV49/mfP34=;
 b=Ni3r89wm8+kj2WotXv17MPHmBQtK6v/SqQbvEU7wFAvHCEph6vC1PysZ
 DR9KDxnF6xMVJD5MMdwdPLmLnJiEXQExYkSHpNl7qqN4JrcNWBxPJKY96
 +LAYXH9VsjDBq+RevA2WKe9EWPCbHGqpN11ZVfgLIZFS4T0q3+1CRTZkt
 yY5pfnpFrS8DcqcOaT/aglHVYnlu6qGUGp5qewIZn29T8cnxsAyvugjRV
 RqmbZd0+MZjqUCvCNXcDnieyS/bs8aJ37nfy31cCrcMDg0i8dHQn3aund
 MD5dzjWvP64JXklqILl2cyOhqnQkyCqCANs8KJvDTyUKY90DLLFr2j7lo A==;
X-CSE-ConnectionGUID: 6WI6QI3WQf2J3qnmvyYbmQ==
X-CSE-MsgGUID: +Qt+xpdVR4C6vaY4DBxc2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41316185"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41316185"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:00:21 -0700
X-CSE-ConnectionGUID: C0idUpAZScKROGwQHClJ6Q==
X-CSE-MsgGUID: IEj3/hqaQcmWwf0zwfggmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64749732"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 02:00:19 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 4/4] tests/intel/kms_pm_dc: Add polling for deep-pkgc
Date: Mon,  2 Sep 2024 14:29:43 +0530
Message-ID: <20240902085943.1496088-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
References: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
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

Include the following changes to enahance test_deep_pkgc_state():
- Add an interval variable to control the delay between checks.
- Add a wait for vblank to sync the frame time before reading
  the package C-state counter.
- Introduce a half-frame delay to ensure the flip occurs when
  the frame is active.
- Modify the loop to use igt_wait for better handling of the
  package C-state counter read.
- Remove redundant usleep call to streamline the delay handling.

v2: Address and correct review comments (Suraj, Jeevan)
v3: Update commit subject/message.  (Kamil)
v4: Update commit subject/message and added comments. (Suraj)
v5: Update commit subject/message. (Suraj)
v6: Update commit subject/message. (Suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_pm_dc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 75262c79d..07b140ce5 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -639,22 +639,25 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
+	/* Wait for the vblank to sync the frame time */
+	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
+	usleep(delay * 0.5);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
 
-		cur_val = read_pkgc_counter(data->debugfs_root_fd);
+		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
+						      (delay * 2), (5 * MSEC));
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
-		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0

