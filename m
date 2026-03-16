Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD02EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D944210E344;
	Mon, 16 Mar 2026 08:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlgIfR9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3661A10E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649178; x=1805185178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7tRLB5BXolA8F9If5jZVlYdT/SjlqSoGCmakGMP4Nm8=;
 b=OlgIfR9xH8Ald1pu+ilORSfjBVeZrMm6REa2jh8lkO82G0CLOkI8skc1
 P4Y/WBi/i3gCxSehjIRlpACwe46KSQUaoxOj2h8Hd+DXJRu6TLbboJ3bY
 yAnwQg4gyP0mSMZiH/90Dx7ipogVnCwTc9OEn2G+1oUmLAoSF6b3SkOFR
 vCfy9INtsgjaVyTP8zKHuPoz58WFA5kzBERCn8d6tRuK5kHu6lXYAJGXq
 2NE75mJhD5IRAjbIcAyPbHAne6u/pBFi9ClkfFgJIxNjl6knQESd9ftP5
 F5DNZgWm54xT/R6wkZ7LtlTaHSzG4+a8R89vw5JN8BEzUzJpbPJepg1QZ Q==;
X-CSE-ConnectionGUID: fjXDCFsSQAKKqcIbNNG/ow==
X-CSE-MsgGUID: Rn1m1klSSEi3K7Qd5r7+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359428"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359428"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:38 -0700
X-CSE-ConnectionGUID: 8PacvB9fTHa6y0rO7RlqQg==
X-CSE-MsgGUID: MN+1/K4vRlKeC8iM8OjncQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300672"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:37 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 08/17] tests/kms_atomic: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:12 +0530
Message-ID: <20260316084021.419580-9-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
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

Replace igt_assert_crc_equal() with igt_assert_crc_equal_stop_on_fail()
to automatically stop CRC collection on mismatch.
Replace conditional stop+free blocks in error paths with
igt_pipe_crc_cleanup() in plane_immutable_zpos().

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_atomic.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index ce5b00cd3..72b399e49 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -508,10 +508,9 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 					  DRM_FORMAT_XRGB8888,
 					  DRM_FORMAT_MOD_LINEAR,
 					  0.0, 0.0, 1.0, &fb_lower);
-	if (!fb_id_lower) {
-		igt_pipe_crc_stop(pipe_crc);
-		igt_pipe_crc_free(pipe_crc);
-	}
+	if (!fb_id_lower)
+		igt_pipe_crc_cleanup(&pipe_crc);
+
 	igt_assert(fb_id_lower);
 
 	fb_id_upper = igt_create_color_fb(data->drm_fd,
@@ -519,10 +518,9 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 					  DRM_FORMAT_XRGB8888,
 					  DRM_FORMAT_MOD_LINEAR,
 					  1.0, 1.0, 0.0, &fb_upper);
-	if (!fb_id_upper) {
-		igt_pipe_crc_stop(pipe_crc);
-		igt_pipe_crc_free(pipe_crc);
-	}
+	if (!fb_id_upper)
+		igt_pipe_crc_cleanup(&pipe_crc);
+
 	igt_assert(fb_id_upper);
 
 	/*
@@ -564,7 +562,7 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &new_crc);
 
-		igt_assert_crc_equal(&ref_crc, &new_crc);
+		igt_assert_crc_equal_stop_on_fail(pipe_crc, &ref_crc, &new_crc);
 
 		igt_plane_set_fb(plane_lower, NULL);
 		igt_plane_set_fb(plane_upper, NULL);
-- 
2.43.0

