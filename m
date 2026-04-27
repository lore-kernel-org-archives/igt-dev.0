Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169A1FF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 11:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED3310E6B1;
	Mon, 27 Apr 2026 11:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZchrfsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1B510E09F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777287648; x=1808823648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N4/Lqpkq8SX/004JnyE1QOegVmN9IRHJVezq+FaKtD8=;
 b=SZchrfsG024dPDRd4IWCiCyjAsNyK/94FGXQz26GVxJF+17XOkMzkMI4
 LVjaJDGGNvpNMUiu9amgG84yKOfyVMCa4lRx+s9k+rJvD3ZgWotlK19V/
 Qm7DT+mqG8EWdUWPhUsnad4K4yqgfIQQcam1RCuyZiMoxic3tHjUuVZ35
 D1TTO5UcptrKSTRKQdeX6Wmkx6on1Mla6UUY1meDi58Q+iS5UjYiArfM0
 HQhzf994IjQEfOhOwjvutQK1rFcbUfmv/7MtTj499YPCE2HEnyAoVEGdm
 vjmoUKnxY+tzykfmdrUTotv+7FXW5/2gkwNeVUlKezRjCw6taLA7CEWdg A==;
X-CSE-ConnectionGUID: 0f6hMMORQ8qoBKVgu3PiVg==
X-CSE-MsgGUID: bjWw2FgJTiC6PFm34wboEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="100829096"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="100829096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 04:00:47 -0700
X-CSE-ConnectionGUID: AlXcE4ARR5WLNBugDg34bA==
X-CSE-MsgGUID: WwuUjJbRQxybLkGPukZiig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="232728481"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 04:00:45 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdmi_inject: Retry ELD check to avoid
 transient audio races
Date: Mon, 27 Apr 2026 16:28:56 +0530
Message-ID: <20260427105856.133153-1-jeevan.b@intel.com>
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

ELD population can lag HDMI audio enable on some platforms.
Retry once to avoid spurious test failures.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_hdmi_inject.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 00eb5e4a4..f388a84c3 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -200,7 +200,13 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	 * Test if we have /proc/asound/HDMI/eld#0.0 and is its contents are
 	 * valid.
 	 */
-	igt_assert(eld_has_igt());
+	if (!eld_has_igt()) {
+		igt_info("HDMI audio enabled but ELD not visible yet; retrying\n");
+		usleep(200 * 1000);
+
+		igt_assert_f(eld_has_igt(),
+			     "HDMI ELD missing after retry\n");
+	}
 
 	igt_remove_fb(drm_fd, &fb);
 
-- 
2.43.0

