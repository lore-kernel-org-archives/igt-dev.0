Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771A0FF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 10:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419210E6A9;
	Mon, 27 Apr 2026 10:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daqIDtJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FEF10E6A9
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777287484; x=1808823484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MtURXHkmDq7ADwlYhxwQgdDXTlGpYTCTw0ugBOUPuVI=;
 b=daqIDtJbNvCghqrYdILP36ndVGBNyEzw0SeP+sFahsLCNTMDyPNr7Jxm
 qw7MABPE9XyTEOCtJB7QeQgcTjKu7uf9xl8n7cYLCAFlZVT1zgtZpy+ho
 rjjo5lfLtu8ohcGVtr74vHa9dDuQIs1obAtOsaulhFGQp9eLN7W1qiWxO
 weHJ2tesATmVe94vMpbyO/xkno7d5U55/0sxAY2PHJuha1j2LH+gCKDDD
 q1sH6EdE3jBiS98bcdE0Yqio0xBPpQoW7ys9kW5Czy75rmjzrK5T+MBon
 zfNtqEHiqGNzKVViFHtixqew1ZDr3btXrcz/hjLK/oh1UBoRPyBmYMmum g==;
X-CSE-ConnectionGUID: sIa4BS2aRpKPSzRoPJyN7Q==
X-CSE-MsgGUID: WeePJdPSQHKg7c6eCfLzpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77329693"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="77329693"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:58:04 -0700
X-CSE-ConnectionGUID: bdr7lmn2QHShcNwgc94dGA==
X-CSE-MsgGUID: TERY929XSVCrlTx2mEfudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="257128981"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:58:02 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdmi_inject: Retry ELD check to avoid
 transient audio races
Date: Mon, 27 Apr 2026 16:26:13 +0530
Message-ID: <20260427105613.133108-1-jeevan.b@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/14867
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

