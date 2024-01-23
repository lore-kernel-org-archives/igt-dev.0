Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4CCC47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 04:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE3510E110;
	Tue, 23 Jan 2024 04:37:27 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jan 2024 04:37:26 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ABA10E110
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 04:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705984646; x=1737520646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h5owflL28KvsDZsdCNzzs1Pjq8Fym0Bs299dJiF+UqE=;
 b=hAN4b4WwjoisRo8kR+bOD3ohFdXxBVFRmYybE8G0CEVYSIBPyztgdeNZ
 zekw2LLO1rpAenJhcS5yaaSZocQBzgmIm4aFibsahXXDv4BKN0Jn90BZc
 h/48fCS8Qy35LlQqwnTJHRps7V526aoE7RQ+BFG+VLGKU7/DaZMf2qaeV
 03jfd7veucboxB9cM54QhWim+ScorzdXSs1qEFAtasOKeFHwGvZlCkDgQ
 nAIQvqz2hKg+BmCb7OxrLimhD1TXDhJK1cDLcKN8XnGNAcIdp6J/ubDJ+
 yBowVetrNOdMS4qDqUHc9lg8oRSEyU+zvgsoq0pSMRSciNQTb22cjzFu5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="307061"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="307061"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 20:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="876210552"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="876210552"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.48])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2024 20:30:17 -0800
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_vrr: Reset to High refresh rate before begin
 drrs test
Date: Tue, 23 Jan 2024 09:44:03 +0530
Message-Id: <20240123041403.31259-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.33.0
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

Patch ensures a prepare state of moving panel to high RR
by waiting on FLIP event with high RR. This is more of a
prepare condition for drrs test.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_vrr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 44bc3480d..07b50cb4c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -522,6 +522,10 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 
 	if (vrr)
 		set_vrr_on_pipe(data, pipe, false, true);
+	else {
+		igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+	}
 
 	rate = vtest_ns.max;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-- 
2.33.0

