Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCF6C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 12:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6C410E227;
	Tue,  8 Apr 2025 12:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmqPa6yw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF3D10E227
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744117089; x=1775653089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Xh1u2r6lSJ2oe3s0YnxNLxlLHeQTItmoGAWDn/LsMQ=;
 b=bmqPa6ywCH/mQkMRtZles69ut0ahZR6YMGdMxipmhblv2CBUx+M6jh8F
 neWtB9wXyUAbJCZ2Hze/uyTelUmJ362gOu2guj24MpLmytS/2nVa3RcQ1
 8uV46YlVsUUinp41ZkZtwFrInH9Ra5H07aUW2PfYtQxcrM9LV23GaMBv/
 Wa2m8tyODW8yqWtWHRI5VyGX6oETtp3lZSxzlEIQPPj6/2ptQk6FHLwb2
 h9ezFBkOVjt42zeZ4DsgPB1Q88Tk4JBCAsJVcsi6kRcv+beaRrTe2Gg8r
 fp523mq4OuYNHK2yEqvvAdnVqMc0d19YNQ2HS8p/Qny6TQndJQYgLPPr7 Q==;
X-CSE-ConnectionGUID: 7ZBiOeTjQEub9vNMgJl8sQ==
X-CSE-MsgGUID: 2a3RlHwURMyaIy6H7+a0iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56528310"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56528310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 05:58:09 -0700
X-CSE-ConnectionGUID: Sop0n6uPQBqbV46pZGrnDQ==
X-CSE-MsgGUID: IYH61il+ThGz9iVMbFf42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="129113770"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 08 Apr 2025 05:58:07 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_universal_plane: Fix fb count mismatch
Date: Tue,  8 Apr 2025 18:23:27 +0530
Message-Id: <20250408125327.1054433-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

There is a mismatch in the count of fb before
start and end of the test. This is because cursor
fbs still not removed and we are counting the fbs.
Add a 2 vblank wait before counting the fbs so that
all cursors fbs gets removed.
Since unpinning of cursor fb occurs during vblank in xe,
we need to wait atleast 1 vblank for driver to remove
cursor fb. We need 1 additional vblank because vblank
event is scheduled before unpinning.

v2: Use is_xe_device[Chaitanya]
v3: Add closes tag[Swati]

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4415
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_universal_plane.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 8e0b4dda0..2d9716575 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -703,6 +703,16 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
+	/* Since unpinning of cursor fb occurs during vblank in xe, we need
+	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
+	 * 1 additional vblank because vblank event is scheduled before
+	 * unpinning. Therefore add 2 vblank wait to ensure that all
+	 * cursor-related framebuffers can be removed before counting the
+	 * framebuffer.
+	 */
+	if (is_xe_device(data->drm_fd))
+		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 2);
+
 	/* We should be back to the same framebuffer count as when we started */
 	count2 = intel_gem_fb_count(data);
 
-- 
2.25.1

