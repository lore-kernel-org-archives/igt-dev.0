Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F60CD6E79
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 20:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDBF10F9A9;
	Mon,  8 Jun 2026 20:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuTECHYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD4810F9A9
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780950020; x=1812486020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M8hdft2/1pY9nyPMsdWMdN5NwXaj3cDbB2TzY2VarOA=;
 b=GuTECHYmHWEinNQ2g7jVTrKZUud7GAx7ACJF4O0hLz6JIG5zIA89qzlQ
 PUDyN7FIGOgOdDUo4aKHvKsqvuEi0LCl+GZWp7CQg+ioHx62Yw3GaJKvx
 p0LZq1D6KEMhUeVZb18CRY6WSt1S9s9GRohve6mvzGrD1KXQ7cVrdnkwn
 b9lE1MxzYNAqnqAxmFm6ZViZAqlnL/YzVDwwSPGjCld9XMq+2CnPOs9J6
 +Q/A3IVHTxVqOtlZ4lza+tPAZVnHl74bgs6bCPLRGlUKm6OoAwCzJsxqj
 UnAeOT9hr2ksob4/SoBOkQ2LmdL5q1VsiMHNkysZ05aR7z2pKYtmfWlP8 g==;
X-CSE-ConnectionGUID: ta2ZGOWGR2GqBjLqif4ehw==
X-CSE-MsgGUID: nrknRhy1QVqFlussBiWPsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80722828"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="80722828"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 13:20:20 -0700
X-CSE-ConnectionGUID: HhC0dJucTSKDwyuT49AeHQ==
X-CSE-MsgGUID: 58X06jOKRSaemHI7mw7D1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="247515462"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 13:20:19 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Fix stale pending_crtc causing
 false bigjoiner skips
Date: Tue,  9 Jun 2026 01:58:05 +0530
Message-Id: <20260608202805.2617965-1-swati2.sharma@intel.com>
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

When a dynamic subtest SKIPs via longjmp, pending_crtc remains set
from the combo validation. Subsequent iterations then incorrectly
see the pipe as occupied, causing valid combos to be skipped.

Fix by using a wrapper that clears pending_crtc before returning.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 070fba400..2c5949ff2 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -327,6 +327,22 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
+static bool
+crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+			igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_crtc(output, crtc);
+	if (!intel_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_crtc(output, NULL);
+
+	return ret;
+}
+
 static void run_cdclk_test(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -334,12 +350,8 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	igt_crtc_t *crtc;
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
-		igt_output_set_crtc(output,
-				    crtc);
-		if (!intel_pipe_output_combo_valid(display)) {
-			igt_output_set_crtc(output, NULL);
+		if (!crtc_output_combo_valid(display, crtc, output))
 			continue;
-		}
 
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name) {
 			if (flags & TEST_PLANESCALING)
-- 
2.25.1

