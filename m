Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11F6D2E016
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 06:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4A610E367;
	Wed, 23 Oct 2024 06:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiaHm0X+";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093FF10E367
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 06:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729663677; x=1761199677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2MkZS7mFSFEobQeUv4DjuEI21ZmVd+f5O/DPaRCte2E=;
 b=aiaHm0X+emn3WegmPN/EXN90WkdGtPQ/EPJVbmzGE20hAFjMFxMjXMIm
 G0vLooPIPMIzMkppZcV50y/PNZiPKY3fkBDZntkJwvfiMRxQDLExUh0BK
 MuXEzVVZ6rVlFz3MHcPqcejpPqLT4JGOIPARIZPfj6choe49ytUwG2/1X
 OZnCRG7hkiSzB5rAuqPbEd/C4KEXU20aCQtwondGQoTMM8Glj+fBC0d1l
 i1Zv3Rx8DihFrTQBdVpRrt6jqEU0eOFnzFCd70XgaoJRRvpqa/tYX/9GZ
 QttH7wNpFO7EI1XruNZ56HzKDdgcCHmpYdTz0eAY6rBUykN5AUwnLbUZp g==;
X-CSE-ConnectionGUID: 6WA7XFqxT0qt1V9ja8wW9g==
X-CSE-MsgGUID: O5WqTFU1RQWPCyJtBw0mYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40620574"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="40620574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 23:07:56 -0700
X-CSE-ConnectionGUID: KK2fnfHKS924VeTD9AF7hg==
X-CSE-MsgGUID: uV0sMGqHTQqEPOfNljWq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80031119"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.11])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 23:07:55 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Use linear instead of x
 tiled
Date: Wed, 23 Oct 2024 09:07:40 +0300
Message-Id: <20241023060740.2573443-1-jouni.hogander@intel.com>
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

PTL doesn't support x tiled format and older platforms (display version <
9) do not have FBC support for linear. There is no specific reason to use x
tiled format in this testcase: switch to linear format except on older
platforms.

v2: use x tiled for display version < 9

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 6d134ea62..ab4819d23 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -221,7 +221,9 @@ static void set_mode_for_one_screen(struct drm_info *drm,
 
 	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
 				  DRM_FORMAT_XRGB8888,
-				  I915_FORMAT_MOD_X_TILED, &drm->fb);
+				  intel_display_ver(intel_get_drm_devid(drm->fd)) < 9 ?
+				  I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR,
+				  &drm->fb);
 	igt_draw_fill_fb(drm->fd, &drm->fb, 0xFF);
 
 	igt_info("Setting %dx%d mode for %s connector\n",
-- 
2.34.1

