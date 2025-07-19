Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A87C83F27
	for <igt-dev@archiver.kernel.org>; Sat, 19 Jul 2025 17:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E4910E055;
	Sat, 19 Jul 2025 17:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIloQ4e3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE3510E055
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Jul 2025 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752944456; x=1784480456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tfJDGdS6dc1mANaVprqNfPwPEnpdKNbEPHMh0khy930=;
 b=oIloQ4e3TWjOWxcPf2Vv7LkHapaZR7ye+iZy4/qk17D8P8NOMbnchblW
 SCII1VDb4zAHUDar/5o0fG3aaotak+75JafdVnzgpfRSBCYv8uJrOxujM
 uD3dAraTIidEwDuM9z74CLBZDcomQHM7hGe9uMaHW3zZjX8Cf55ETAPtz
 aEdXnbn7PsuoEtmWznIMGZ4GaxchXuNqmQ4AukXkjRloL/zB2oJdMBQ9r
 RkRL4Q0OBbp7sWO29x2Na0eHE7QRqntp+OmksIaRDMml4V1yTpJYUTE1P
 PMmdCorWecw4TIII0PYBBUEE0/1VlD7smIPNiW/wvPhVxOSShmpcir7x0 Q==;
X-CSE-ConnectionGUID: 2apdSXz/SGSys6NxiN4+jw==
X-CSE-MsgGUID: gy+Se5qyR5yaVfXRLqDLGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55152887"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="55152887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 10:00:55 -0700
X-CSE-ConnectionGUID: ANCoNZGWSUqkCqS809Cupg==
X-CSE-MsgGUID: XywqMEdkTwmF03UzkiMgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="158574213"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa007.jf.intel.com with ESMTP; 19 Jul 2025 10:00:54 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test complexity for
 simulation
Date: Sat, 19 Jul 2025 22:38:38 +0530
Message-Id: <20250719170838.1340070-1-pranay.samala@intel.com>
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

Reduce the number of plane alpha value iterations, and limit execution
to a single plane for each pipe to enable this test on simulation.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane_alpha_blend.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 047cc57b4..696bb1e5e 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -79,6 +79,8 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 } data_t;
 
+static bool in_simulation;
+
 static void __draw_gradient(struct igt_fb *fb, int w, int h, double a, cairo_t *cr)
 {
 	cairo_pattern_t *pat;
@@ -289,7 +291,7 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, crc;
-	int i;
+	int i, max_alpha_value;
 
 	/* Testcase 1: alpha = 0.0, plane should be transparent. */
 	igt_display_commit2(display, COMMIT_ATOMIC);
@@ -298,8 +300,10 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
 
 	igt_plane_set_fb(plane, &data->argb_fb_0);
 
+	max_alpha_value = in_simulation ? 160 : 256;
+
 	/* transparent fb should be transparent, no matter what.. */
-	for (i = 7; i < 256; i += 8) {
+	for (i = 7; i < max_alpha_value; i += 8) {
 		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, i | (i << 8));
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
@@ -564,6 +568,9 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 		igt_info("Testing plane %u\n", plane->index);
 		test(data, pipe, plane);
 		igt_plane_set_fb(plane, NULL);
+
+		if (in_simulation)
+			break;
 	}
 
 	igt_output_set_pipe(output, PIPE_NONE);
@@ -743,6 +750,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_pipe(&data.display, pipe)
 			active_pipes[last_pipe++] = pipe;
 		last_pipe--;
+
+		in_simulation = igt_run_in_simulation();
 	}
 
 	run_subtests(&data);
-- 
2.34.1

