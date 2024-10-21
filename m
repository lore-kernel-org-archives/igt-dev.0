Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BDDD0E6EA
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 10:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5EA10E2D8;
	Mon, 21 Oct 2024 10:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Us2n+pdV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1758310E2D8
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 10:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729506829; x=1761042829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aCsDcBQB35BplomV407i9AW/yYUInmXMOcau+eHSyC8=;
 b=Us2n+pdVk/tDQo9D99tGxxgb1aestotYGLIs8qN75XIIVzbB5YnnuqlG
 aIQrYj5SGp6xGrHLF/Vx72LA21aG76M4B3gUXErzTMock5xJ/7KJrNH5U
 NIux/d4/r8iiyAz1pvaBzeIhZowysDZ+r66wB/Eu54iToWI6sqvxs0pBT
 uBwptWG7dNcpk4gcjD69E5kAWNiEAyDQtELf9gYlea/IAtWdP+5xlF8wj
 voFHavasXnF89Z4wAG5QHky1eIpa0TlVVNbdXbA/L/27O/c+jX5vl80Ix
 mxkjRDuL5DqRAwSKDHMDkRru2OwgdtoI14CYrAIH7dLK+Bnz/EGtZFdxw g==;
X-CSE-ConnectionGUID: TB74dk43STKt1VAYdku9LQ==
X-CSE-MsgGUID: bvnsnmQxRY6D/xWYelEoqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28437820"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="28437820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:33:48 -0700
X-CSE-ConnectionGUID: MoonCc/jTJWzgmp8bZ7oNg==
X-CSE-MsgGUID: YB92NmLmSUCwUl6JjHdK/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79439841"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.142])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:33:48 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Use linear instead of x tiled
Date: Mon, 21 Oct 2024 13:33:26 +0300
Message-Id: <20241021103326.1355746-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

PTL doesn't support x tiled format. There is no specific reason to use x
tiled format in this testcase: switch to linear format.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 6d134ea62..724988cd8 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -221,7 +221,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
 
 	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
 				  DRM_FORMAT_XRGB8888,
-				  I915_FORMAT_MOD_X_TILED, &drm->fb);
+				  DRM_FORMAT_MOD_LINEAR, &drm->fb);
 	igt_draw_fill_fb(drm->fd, &drm->fb, 0xFF);
 
 	igt_info("Setting %dx%d mode for %s connector\n",
-- 
2.34.1

