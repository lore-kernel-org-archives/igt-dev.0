Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C3ACD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 08:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC8C10E522;
	Wed,  6 May 2026 08:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQhKPy0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F3B10E18D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778057615; x=1809593615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gh/3lKeqFCG0T7PYq0bh/Kw/xsKfRy/QkpDSyYdUF9I=;
 b=QQhKPy0ZIIrtPdOCanh661AxEA0ZYl+7OyFSoEsoqMAxF0PLogcRH3iX
 yHZMfl7sC5FbPTi1OH+GrSkkm6ZROLLADrTSN4xpElt29cDSwKFiz/pBQ
 VULnGo2jQmiJ6UecBl9IO2PB0NvwgKi8dzDksHMzBWvOBN+Qdk7V22U8+
 9zSJMD9y24OmALi90eeqSIs+ZoFu90hgk+H1N6n9r9fDRHb1K5xV23GV4
 fVQ1C1AnrRHl6d2gdjtTylYfYPsC6QsjMZjGarV45Dhiz6l8j7vV40v7f
 fWXfc/WJnjXLkIxoNxWhW4hiC1pTj4FUL+xWM3HEU5bRRpLwWfEtyXAV2 w==;
X-CSE-ConnectionGUID: U4dzvgb+S2WGl+/IoZ1l9g==
X-CSE-MsgGUID: h8x/vE7uTVyRJ/Im9gMxDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82586330"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="82586330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:53:34 -0700
X-CSE-ConnectionGUID: fHwTSE0pTH6y9hw89GlH+A==
X-CSE-MsgGUID: ROKm3KUmT7mGfmJqhhOydA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="259511283"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa002.fm.intel.com with ESMTP; 06 May 2026 01:53:32 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Add newline to assert
 message
Date: Wed,  6 May 2026 14:34:26 +0530
Message-Id: <20260506090426.62298-1-pranay.samala@intel.com>
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

Add missing trailing newline to igt_assert_f() error message.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 431508a83..58cadc560 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -439,7 +439,7 @@ static void setup_parms(data_t *data, igt_crtc_t *crtc,
 		if (cursor_width == sprite_width &&
 		    cursor_height == sprite_height) {
 			igt_plane_t *removed_plane = NULL;
-			igt_assert_f(n_planes >= 3, "No planes left to proceed with!");
+			igt_assert_f(n_planes >= 3, "No planes left to proceed with!\n");
 			if (n_overlays > 0) {
 				uint32_t plane_to_remove = hars_petruska_f54_1_random_unsafe_max(n_overlays);
 				removed_plane = &crtc->planes[overlays[plane_to_remove]];
-- 
2.34.1

