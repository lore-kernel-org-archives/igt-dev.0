Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6A3CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2910E614;
	Tue,  4 Nov 2025 14:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUNwtPi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ED910E614
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762267536; x=1793803536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUXYu82oUNcRpCKyZw+2Kwzs6VbkFmMnlt3H1Ys9S5E=;
 b=TUNwtPi+3kZHVe0OE7+Y+mUhSTnBWnZA61BpGjBG974sFnP7GP2xrjnV
 vefoi6zNTM3rnHKzqMtRYVzYz0m3uFWd6SpP7M97T7G1jFQX/wAW/nSz0
 qcvvzHyezqZR++/QcLtpCuA+600yNdsyD7K7sB7bWUnSGFyNaeuD4wa2q
 CnfYP+5yLgTwyIP2A5Pm5L7UugaSVlZT4D5GNuWAHPLj/lmNlGwKiREKM
 +TZhK2bicAO52xaufX7v1oYzY/uopPQwTM8d8cMpNQ2aBTOsR0HFwJsd0
 sVOn/R/h3u/2GOSZfPJx8FQWzFImVnfpSDf6/CJ/Rmeg0MBRr7Qc5GXmz g==;
X-CSE-ConnectionGUID: GYVkYKUWTRiBRCqIfHEnEw==
X-CSE-MsgGUID: 2bdaWfUrQPCrBn0ZhJhiTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63373046"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="63373046"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:45:35 -0800
X-CSE-ConnectionGUID: tfI4uFwvTWWJUzLM0BsB6w==
X-CSE-MsgGUID: Xyh9M4cZRrSZroj6itxKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186415304"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:45:34 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Fix potential NULL dereference in
 test_cleanup
Date: Tue,  4 Nov 2025 20:15:12 +0530
Message-ID: <20251104144512.1484094-1-ramanaidu.naladala@intel.com>
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

Add a safeguard to prevent a possible crash during the cleanup
phase of the VRR test.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index bcb756202..a403de473 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -961,7 +961,9 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
 
-	igt_plane_set_fb(data->primary, NULL);
+	if (data->primary)
+		igt_plane_set_fb(data->primary, NULL);
+
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_output_override_mode(output, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.43.0

