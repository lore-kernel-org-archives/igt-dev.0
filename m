Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC3C83F1B
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 18:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A81C10E3B9;
	Fri, 11 Jul 2025 18:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cg/fENxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DC710E3B9
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752257258; x=1783793258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uE+0qq/x7jtY6ZVR5G2AtR0FYasZvGLAlRYtjWGWp0w=;
 b=Cg/fENxk8g45r4Qxe62gJQQb7KAQF+UzCfvF+vE9Qly7DNS9vrQfswYg
 +mhgMZS+wogL9OjxyzCSt5qeprg65pR+Jog+BiKCCTz4kmhmTFsHvhn/7
 4Znyg8LuiEHBWShQ4PberWS/dLGZn1BHbE9aJIAOg/aD3oFggcD9nsjPZ
 MorAilOn3GySwgugh4Ho0HAN5Mw/loX6AQQjKmotzHtYylvMXgZMbm1J6
 mJdIVVMK1eycz5EX6DL+ApGZv/B0w/PUjK1OmgVyIKMuxWPoqWeDgmWVE
 tPDIhWSKiupHAIpi2Ey+MEe5zXVMHqJQSyngDmZ1Xxm9oDOZ08nqS391K g==;
X-CSE-ConnectionGUID: HXxgOmblTeKYN88hH6TJGQ==
X-CSE-MsgGUID: rMdMtIBkR5WoZumUcZVJTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57176437"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="57176437"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 11:07:37 -0700
X-CSE-ConnectionGUID: QWm2rNVLRRmJI8eSHVSagA==
X-CSE-MsgGUID: Myl1dNQwScKPh9VjRtx4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160980048"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 11:07:35 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vblank: Skip timing check in simulation to
 avoid false negatives
Date: Fri, 11 Jul 2025 23:37:40 +0530
Message-ID: <20250711180740.145938-1-ramanaidu.naladala@intel.com>
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
accurately, which can result in false negatives during vblank
sequence testing. To prevent such issues, this patch conditionally
skips the timing  validation when the test run in simulation.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vblank.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index b8044ad42..75cf9448f 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -460,8 +460,17 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 
 	igt_assert_f(seq2 - seq1 >= 0, "elapsed %f(%d vblanks) unexpected vblank seq %u, should be > %u\n", time_elapsed,
 			estimated_vblanks, seq2, seq1);
-	igt_assert_f(seq2 - seq1 <= estimated_vblanks + VBLANK_ERR, "elapsed %f(%d vblanks) unexpected vblank seq %u, should be <= %u\n", time_elapsed,
-			estimated_vblanks, seq2, seq1 + estimated_vblanks);
+	/*
+	 * Timing behavior in simulation environments often differs from real hardware,
+	 * which can lead to false negatives during testing. To mitigate this, disable
+	 * timestamp and sequence validations when the INTEL_SIMULATION environment
+	 * variable is active.
+	 */
+	if (!igt_run_in_simulation())
+		igt_assert_f(seq2 - seq1 <= estimated_vblanks + VBLANK_ERR,
+			     "elapsed %f(%d vblanks) unexpected vblank seq %u, should be <= %u\n",
+			     time_elapsed, estimated_vblanks,
+			     seq2, seq1 + estimated_vblanks);
 }
 
 static void run_subtests(data_t *data)
-- 
2.43.0

