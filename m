Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A05EF370D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 08:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973AA10E4A5;
	Mon,  9 Mar 2026 08:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLljIOOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ED910E4A5
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773045067; x=1804581067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DcEiE6P+j2sPeF7XiHq5n56MmIVVlwzI4fPGddf2xks=;
 b=DLljIOOLNXZTZSPZKS3W8fEjz4xrqasnIXIQOzDzv3z1MD8xOnYnGjIh
 ctriSxs8btUAzvW9Uwi7t+rBbLZy7zucIr8GS+1dGcuky+MRCCRvS4JHm
 KccfZZeMGcOHMyDxvWgk2ULs3bjq4HP162slkqAIHEY094HM+NLGI0OF8
 kKZ62WENNw8aasS2fNVcbJQGt/PIIsf0Qox2xHGmALCHeikYpZEs43hZn
 CqCorbRwGS2uCRFfTaWd3XRl/LqU7PvmHw2g5jaLvKvE7Jsphk02+r1GC
 /vaKUwgINrzLRUw2WN6cGleCBjdRRlNfPMmmtc/GZ5pHb1At/pqdIRXS5 A==;
X-CSE-ConnectionGUID: Yb8x/bU3Q3SpML+rTtn9RA==
X-CSE-MsgGUID: 97urL7p8Rq6PkMUGy3TQPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84696157"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84696157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 01:31:07 -0700
X-CSE-ConnectionGUID: pSyCIn/aTVqhnLIP+ZjAtg==
X-CSE-MsgGUID: Bep12hBaQxe+qxzrrXepKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="242704585"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:31:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: Use lowest mode for crc
 subtest
Date: Mon,  9 Mar 2026 13:54:50 +0530
Message-Id: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
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

Currently The CRC subtest uses mode[0] which maps to preffered high
refresh mode. On panels with multiple modes, pick the lower mode to
speed up crc test.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a42407363..8639e2299 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -825,6 +825,17 @@ static void paint_fb(data_t *data, struct igt_fb *fb,
 	}
 }
 
+static drmModeModeInfoPtr get_lower_mode_for_crc(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+
+	igt_assert(connector->count_modes > 0);
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_asc);
+
+	return &connector->modes[0];
+}
+
 static void test_crc(data_t *data)
 {
 	unsigned int frame = 0;
@@ -834,8 +845,8 @@ static void test_crc(data_t *data)
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/* make things faster by using a smallish mode */
-	mode = &data->output->config.connector->modes[0];
+	/* make things faster by using a lower bandwidth mode */
+	mode = get_lower_mode_for_crc(data->output);
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
-- 
2.34.1

