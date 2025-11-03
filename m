Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5685CCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9564010E3AB;
	Mon,  3 Nov 2025 10:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWXnMM25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B0110E3A9
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165254; x=1793701254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=83Ghp8o4jqhs0OEVao1pkH2jmQ6DyRb29Hp59uLUrr8=;
 b=fWXnMM25MfnEilZ0t3CuwNLAkJPhlQVIF7HH5H7TFPW13xeOVCV029Ws
 hGhhEeac5nZ263xmjK5avciaLQ4/FnLrbEsUNX7w4trY4+2DtMj2urwHM
 5f1A2PxYzZqrwS0m4PbGe7ZeVc1ae6TxidT0Wi2f26ZeiSkWEXtgqToWm
 d1PKaVT1Qmo7E22vdCTtE/UudW69GEaSCJRKjNIvTjuaZVZ3RhaAIE+Hb
 +atw/76DBA0DlnjISg+H5JmrOANR+eooRvKNb8SAjSux9d/FExZMDpO/k
 hxfO6pWSmVPO7Dc9XuAF9vuXfBGaGs33NC11S1HCsngP8sI/IxcDtWcEV w==;
X-CSE-ConnectionGUID: x1AFvMwUSNCjfbX8qmAbjw==
X-CSE-MsgGUID: eFy1VoUkQfKBNxHgsaGn6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68074863"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68074863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:54 -0800
X-CSE-ConnectionGUID: FyVY5I+2RzOLCfOoTXDypw==
X-CSE-MsgGUID: Bgq9ppvlQDSGYaWaT6l0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186120119"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:52 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/8] tests/kms_writeback: Add support for
 intel-specific formats
Date: Mon,  3 Nov 2025 16:08:35 +0530
Message-ID: <20251103103842.3025204-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103103842.3025204-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
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

Integrated BGR formats supported by the intel
into the supported format list

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 1b81088d7..de0f67a58 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -90,6 +90,15 @@ static data_t data;
 enum {
 	XRGB8888 = 1 << 0,
 	XRGB2101010 = 1 << 1,
+	XBGR8888 = 1 << 2,
+	XBGR2101010 = 1 << 3,
+};
+
+const uint32_t fourcc[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XBGR2101010,
 };
 
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
@@ -101,11 +110,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	int width, height, ret;
 	uint16_t i;
 
-	const uint32_t fourcc[] = {
-		DRM_FORMAT_XRGB8888,
-		DRM_FORMAT_XRGB2101010,
-	};
-
 	igt_output_override_mode(output, &override_mode);
 
 	width = override_mode.hdisplay;
-- 
2.43.0

