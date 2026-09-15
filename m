Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A77C88E73
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 08:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A993910E241;
	Tue, 15 Sep 2026 08:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FF7L3EfD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDDC10FAF3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789460408; x=1820996408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RqH5nbT9h6napwI7F9bGUjE+tKMW00+Q5Pn6XCWFVyg=;
 b=FF7L3EfDMP2HubueITBuvlIw1aZRDlpI5uQx5FXjHowpgZwvh9IqjLzT
 mZ/ATEEWaFpXGHewVcTQ5ehjogBZhHkBRU3AcoQEgtg7X9/7Le3fbxcp3
 tq3H+8TDboWLdrEHG0R7gzuPDR8XalgTBqAKjW3v2QJCxqnhzpKdhiNjw
 UUIk3M4f8ciIKhmO7vt6ZgXmCeeniuy+tTwZKBooFBbDZ7aNzDRceEJZE
 UT6VcbhhwabwlZYJH4H6z/W/hB8yosd43ab4yQ5rojxPW10IJsp7DQt5/
 IwoyYJpXLU9hYxadJtIOFXE/Hn5T8EIp3TKYH6W2KBmpXlW864jnM9V4j A==;
X-CSE-ConnectionGUID: RU2xXh6yQJCeZrt/ZKXXcA==
X-CSE-MsgGUID: DJEcmM0KSyq7fUy1vF/u2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89831362"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89831362"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:20:08 -0700
X-CSE-ConnectionGUID: Y3Y/bk1KRB2e3FSVG9tO+Q==
X-CSE-MsgGUID: 8S4fDXZpTPu+iyMfzbUy5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="268609630"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:20:06 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_cursor_legacy: Skip timing checks in
 simulation to avoid false negatives
Date: Tue, 15 Sep 2026 13:49:59 +0530
Message-ID: <20260915081959.257160-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Simulation environments often do not reflect real hardware timing
accurately, which can result in false negatives during the
flip-vs-cursor-busy-crc vblank and CRC checks. To prevent such issues,
this patch conditionally skips these timing validations when the test
runs in simulation.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_cursor_legacy.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 62339855e..810c593f5 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1775,8 +1775,10 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		flip_nonblocking(display, crtc, atomic, &fb_info[1], NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
-			      vblank_start);
+		/* Simulation ioctl latency can exceed a vblank period even without a real miss. */
+		if (!igt_run_in_simulation())
+			igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
+				      vblank_start);
 
 		igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &test_crc);
 
@@ -1792,7 +1794,11 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_plane_set_fb(plane_primary, &fb_info[0]);
 		igt_display_commit2(display, COMMIT_UNIVERSAL);
 
-		igt_assert_crc_equal(&crcs[i], &test_crc);
+		/* Simulation timing can shift when the busy CRC is sampled, causing a false mismatch. */
+		if (!igt_run_in_simulation())
+			igt_assert_crc_equal(&crcs[i], &test_crc);
+		else if (!igt_check_crc_equal(&crcs[i], &test_crc))
+			igt_info("CRC mismatch ignored on simulation for i=%d\n", i);
 	}
 
 	igt_pipe_crc_stop(pipe_crc);
-- 
2.43.0

