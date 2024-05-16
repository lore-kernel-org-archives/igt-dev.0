Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE20C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 04:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB6E10E111;
	Thu, 16 May 2024 04:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfJ3NM3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BB310E111
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715832974; x=1747368974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UUHFDyqlkIE5JNufwYBvSnIR2uY8rOnrqJacY8J359w=;
 b=YfJ3NM3wq+nNmQtq4GT8PMxJoSmmue/fwDHg0tE89Xnjjtqe7f0oCmIZ
 LofcPFnrlX8W0ckdC4sznZLF9HW1a4vHaQFRxkCF59EoEysLzcBlsmoSn
 5ooDllJJxlqQ3AyOie5ZEnGttMza0LH35P809OJrCjE6kPnDEaueAw9TH
 c1N6YMjpVCf7LRuI/fjIQqO8V7Qj6AvlM2dxfEhITnYK41NV1VfepaZD5
 1onA4LHvJ8Eh4A9//Z2wJ082Y4TP0NdeYkqRLssz/TVrdxvYqDIkJnaOL
 1uPEIwyrlgVsidOM0E89nnnsMPaUOQD5PduYYHqh5GsnlDg08gGZcrk1R A==;
X-CSE-ConnectionGUID: gTmO1AMxSR6JI3OXxwWwQg==
X-CSE-MsgGUID: Farhg6BLTl60OfEIWRGciA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22592009"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="22592009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 21:16:14 -0700
X-CSE-ConnectionGUID: VgR7sBnASIqLQ+tyvfWpGg==
X-CSE-MsgGUID: 5KIW1fYZSDCO0F5yluQ6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="54496156"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa002.fm.intel.com with ESMTP; 15 May 2024 21:16:11 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_big_fb: Introducing this restriction to
 optimize the test execution time on simulation
Date: Thu, 16 May 2024 09:46:10 +0530
Message-Id: <20240516041610.409576-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This test executes on all the availble planes and set of 6 coordinates.
Due to this, test takes long duration to executes on simulation and
gets timeout.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_big_fb.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 1e45d8e42..a26465b67 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -443,18 +443,26 @@ static bool test_plane(data_t *data)
 	struct igt_fb *big_fb = &data->big_fb;
 	int w = data->big_fb_width - small_fb->width;
 	int h = data->big_fb_height - small_fb->height;
+	int m;
 	struct {
 		int x, y;
 	} coords[] = {
 		/* bunch of coordinates pulled out of thin air */
+		{ w, h, },
 		{ 0, 0, },
 		{ w * 4 / 7, h / 5, },
 		{ w * 3 / 7, h / 3, },
 		{ w / 2, h / 2, },
 		{ w / 3, h * 3 / 4, },
-		{ w, h, },
 	};
 
+	if (igt_run_in_simulation()) {
+		m = 1;
+		plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(plane, NULL);
+	} else
+		m = ARRAY_SIZE(coords);
+
 	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
 		return false;
 
@@ -465,7 +473,7 @@ static bool test_plane(data_t *data)
 		igt_plane_set_rotation(plane, data->rotation);
 	igt_plane_set_position(plane, 0, 0);
 
-	for (int i = 0; i < ARRAY_SIZE(coords); i++) {
+	for (int i = 0; i < m; i++) {
 		igt_crc_t small_crc, big_crc;
 		int x = coords[i].x;
 		int y = coords[i].y;
@@ -595,10 +603,14 @@ static bool test_pipe(data_t *data)
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+	if (igt_run_in_simulation())
 		ret = test_plane(data);
-		if (ret)
-			break;
+	else {
+		for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+			ret = test_plane(data);
+			if (ret)
+				break;
+		}
 	}
 
 	if (data->format == DRM_FORMAT_C8)
-- 
2.34.1

