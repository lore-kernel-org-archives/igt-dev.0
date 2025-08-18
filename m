Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E433CA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 21:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBB410E4E2;
	Mon, 18 Aug 2025 21:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/ORr/CN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FAC10E4E2
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 21:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755553475; x=1787089475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vKZCVZ6bRZ6rXpFR7oW7r2aEWjzXdmEOafy9ObUixYw=;
 b=g/ORr/CNUaqtF/8bCc6hzMNgJ3cuACAHnSBRy8j3MN5fpd4anEOHcz8l
 3n6UfApFvi/uR3NveusyPoA+Bi3rRoN6hDRgl2lm6iEgSJWHx5gzTVpIT
 gvi3ovJUmmqWQKEwa6w7Yt34sa4JTO5bR7hwFl+gkjPfrtfM8irfbjbX3
 r1pR2wybqCR8kwbnt7yPMdRSKp06+jDPKrrIoyTGj4npYpAjZTbEH0wGx
 mtMqpDMHNX/6572rRcTKVQf/d/BoqBjJuotAX6ykou+z3m/vECQBqRBlg
 7Rr5d/7eH3FVGkS1UVXv0A6I60UYQUkw+HgJfu/dhOPym7e2bcH97qEva A==;
X-CSE-ConnectionGUID: I1HficlkQ72K6FpJTiG0Ew==
X-CSE-MsgGUID: ERnRlEdnTs664o+tfGT1MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57645319"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57645319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:44:35 -0700
X-CSE-ConnectionGUID: 8XrykP40T0ymmU5CqgUkrw==
X-CSE-MsgGUID: UwDFM8K7RjqhdAg0VxLQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="198539712"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:44:33 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_cursor_legacy: Improve timing accuracy
 in legacy cursor test
Date: Tue, 19 Aug 2025 03:14:31 +0530
Message-ID: <20250818214431.1331399-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
References: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
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

This measured time is then used to estimate the number of frames
delayed, which is factored into the validation of expected display
behavior. The adjustment accounts for timing tolerances and helps
reduce false negatives in simulation environments.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_cursor_legacy.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 9f6e644e1..7fda490ea 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -238,6 +238,7 @@
 IGT_TEST_DESCRIPTION("Stress legacy cursor ioctl");
 
 igt_pipe_crc_t *pipe_crc;
+uint32_t vblank_tolerance;
 
 static int try_commit(igt_display_t *display)
 {
@@ -1587,6 +1588,10 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	igt_crc_t crcs[3];
 	igt_output_t *output;
 	igt_plane_t *cursor;
+	struct timespec start, end;
+	double frame_time;
+	double elapsed_time_ms;
+	int delay_frames;
 
 	if (atomic)
 		igt_require(display->is_atomic);
@@ -1594,6 +1599,9 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	pipe = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
+	vblank_tolerance = get_vblank_seq_diff(display->drm_fd, pipe);
+	frame_time = (1.0 / (double)igt_output_get_mode(output)->vrefresh) * 1000;
+
 	igt_info("Using pipe %s & %s\n",
 		 kmstest_pipe_name(pipe), igt_output_name(output));
 
@@ -1628,10 +1636,18 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
 
 		igt_set_timeout(1, "Stuck page flip");
+		clock_gettime(CLOCK_MONOTONIC, &start);
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
+		clock_gettime(CLOCK_MONOTONIC, &end);
 		igt_reset_timeout();
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
+		elapsed_time_ms = ((end.tv_sec - start.tv_sec) * 1e3) +
+				   ((end.tv_nsec - start.tv_nsec) / 1e6);
+		delay_frames = (elapsed_time_ms / frame_time) - 1;
+
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0),
+			      vblank_start + (1 * vblank_tolerance) +
+			      (delay_frames * vblank_tolerance));
 
 		igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
 
-- 
2.43.0

