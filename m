Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02430CD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A723110E09A;
	Thu, 13 Nov 2025 08:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LW7wwFao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F5310E09A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021894; x=1794557894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=83Ghp8o4jqhs0OEVao1pkH2jmQ6DyRb29Hp59uLUrr8=;
 b=LW7wwFao4oAYo0oLxWAv83wc2+lhFcTxxrDvjlw7xyhZAYuTIhGis765
 ZwZuxdI/Agn/MiZ+jtAdZ/rnXbniksscAit40DpuP46hEEwhVrIcwAuAi
 jlFxynt8NDPdXOd23n+tZbI3WtApAE2i6XjeA2qafKq8hHQj5PVtH1+DU
 0Ej9nhMviD5krSBWu7oEpRWTQa4A7HZSblCjHcAqZC+CU8LhwvRnxIa82
 1MNCgAiC7umkZHFLxPZ++jW2Ik4EYTFv8vaCBlve52K4AoIjLV3Wa7nwz
 VFrz/ve+XGoTFf7L3IbhlBLj7vBGHrvZx4eALjo+QV3as11oBBSASg/Vd Q==;
X-CSE-ConnectionGUID: Kw2+uRpaQYC4A/jFAS44XA==
X-CSE-MsgGUID: IMONJkTkSdGzNthBhHhLiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65000516"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65000516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:14 -0800
X-CSE-ConnectionGUID: +wnQ9grET7y2wRxbQVEsLg==
X-CSE-MsgGUID: /06quBxCRFSHCJ7wRqbgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="212822314"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:13 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for
 intel-specific formats
Date: Thu, 13 Nov 2025 14:05:47 +0530
Message-ID: <20251113083555.3088873-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113083555.3088873-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251113083555.3088873-1-sowmiya.s@intel.com>
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

