Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99F4FCEE81
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 11:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F04E10E221;
	Wed, 25 Feb 2026 11:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxVdpVqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955810E221
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772017840; x=1803553840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CgZfxmZQvXeq3jkU/I3LpvHYn/nu4EYNNC1ct9oBJ2k=;
 b=VxVdpVqR1GVMNZ/xI1OVU+cjSWL/xP9LNYqQl2tOHCLmypvi+7toYUBA
 1toMY6unWizRckZ2CbAwrwjY1Quz0hfYpPC+ZGQlF9/ytciN4OhjAuTRN
 VUoenqiUPoClr9iO6rxI4dUsbMo8AL1Mg54UhUhxOtiM5Q9jpG3yReo0G
 ZsczOx+fjbovW3vKeRN+iBry5ECo72sps17r0FVapMQ4PLsvQdzvZpBQi
 /7egj5sGRycup8buelm43ejDwHACWOzFdvYyQU98TUu2jUHoGkk0DPl6w
 OEnOu7IrydA/rr1bXZLtgzjrR76kv329CnA+EeYa9jKO5JqR745U8Bfcg Q==;
X-CSE-ConnectionGUID: qbiItbGmSDmCvsmp3BaE4Q==
X-CSE-MsgGUID: pb7DLzexThu5MNGR00Gxvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="75659713"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="75659713"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:10:39 -0800
X-CSE-ConnectionGUID: kbs7gZZkT52ObIhEDkYjXg==
X-CSE-MsgGUID: igzlA4UXQdOXgLN3yH4PhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220807481"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 03:10:37 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: validate mode before
 proceeding with fb creation
Date: Wed, 25 Feb 2026 16:35:10 +0530
Message-Id: <20260225110510.1801049-1-santhosh.reddy.guddati@intel.com>
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

Validate mode before proceeding with creating frame buffers to avoid
passing invalid parameters to the ioctl.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 014b7f347..d00b36544 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -298,6 +298,12 @@ static void test_init(data_t *data)
 	igt_display_commit(&data->display);
 
 	mode = igt_output_get_mode(data->output);
+	igt_require_f(kmstest_mode_is_valid(mode),
+		      "Invalid mode on %s (%dx%d@%d)",
+		      data->output->name,
+		      mode ? mode->hdisplay : 0,
+		      mode ? mode->vdisplay : 0,
+		      mode ? mode->vrefresh : 0);
 
 	data->crtc_id = data->crtc->crtc_id;
 	data->refresh_rate = mode->vrefresh;
@@ -327,6 +333,12 @@ static void test_init_fbs(data_t *data)
 	drmModeModeInfo *mode;
 
 	mode = igt_output_get_mode(data->output);
+	igt_require_f(kmstest_mode_is_valid(mode),
+		      "Invalid mode on %s (%dx%d@%d)",
+		      data->output->name,
+		      mode ? mode->hdisplay : 0,
+		      mode ? mode->vdisplay : 0,
+		      mode ? mode->vrefresh : 0);
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
@@ -672,6 +684,12 @@ static void test_invalid(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	mode = igt_output_get_mode(data->output);
+	igt_require_f(kmstest_mode_is_valid(mode),
+		      "Invalid mode on %s (%dx%d@%d)",
+		      data->output->name,
+		      mode ? mode->hdisplay : 0,
+		      mode ? mode->vdisplay : 0,
+		      mode ? mode->vrefresh : 0);
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
-- 
2.34.1

