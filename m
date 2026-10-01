Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6542CA5FCE
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 10:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F47510F609;
	Thu,  1 Oct 2026 10:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPxXoJTr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4E10F612
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790850516; x=1822386516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Hp4+rPPXfgzBlmXrvHku/z7JE9m6vMxQ2yT7IcSKQg=;
 b=JPxXoJTrTOpfTvi2UypQv9rqAYv1xHoNWZqQeO/ijoLtZ9f0hBZIGqG8
 RFf0k+22RybC0+wB6KOK2liRsCCnfsg7d3pwU20Eh0NmPp6WOyQUO5+j2
 rL/Rt68VzfU9/59ETVu8IoeBe99uwhrFHcVoVn5aeFidrcRVdBXuJQZ+2
 IUnA7qUMmUXZXGX+wQsnMjkZGJ0sK8LOoEgpzYS5fbjUakxoLE7Tq8mre
 pYbIJDx5ZyoIsyb0ATtEzPRBH/ieQVarIDCo5eqjiQmfJCFuqi9oHCjW1
 PSLBS5s1++Gi4QwU/BIYAY+FdEhWdM9wSuwI1DpZGbT5I4xfVRHRuQe44 Q==;
X-CSE-ConnectionGUID: ZhxBWcpxQ96NJC/kKY+pWg==
X-CSE-MsgGUID: HXqRB0VIThKtcKbO45oI9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102176802"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102176802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:28:36 -0700
X-CSE-ConnectionGUID: 2jF5LRNFRYqFSB1JgaNFuw==
X-CSE-MsgGUID: jaqHDDQlTLaaKHGyVfJ9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="302202998"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:28:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_color_pipeline: Skip CRC check for fixed
 matrix
Date: Thu,  1 Oct 2026 16:07:48 +0530
Message-Id: <20261001103748.1161693-1-swati2.sharma@intel.com>
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

CRC mismatches are expected for fixed matrix conversions due to rounding
errors, so drop the CRC comparison for these tests.

Driver state checks continue to validate the flows. Frame-capture
comparison will be covered by kms_chamelium_color_pipeline, whose
tolerance accommodates the small differences between the software color
model and the hardware fixed-point matrix that a bit-exact pipe CRC
cannot.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 2b4e8c82a..bf4781796 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -187,7 +187,14 @@ static void _test_plane_colorops(data_t *data,
 	igt_display_commit_atomic(&data->display, 0, NULL);
 	igt_remove_fb(data->drm_fd, &fb);
 
-	igt_assert_crc_equal(crc_ref, &crc_pipe);
+	/*
+	 * YUV conversion can produce CRC mismatches due to rounding errors.
+	 * Driver state validates this flow; kms_chamelium_color_pipeline covers
+	 * frame-capture comparison with tolerance for small differences between
+	 * the software color model and the hardware fixed-point matrix.
+	 */
+	if (!is_yuv)
+		igt_assert_crc_equal(crc_ref, &crc_pipe);
 }
 
 static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
-- 
2.25.1

