Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6D9CA5FEB
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726310E33D;
	Mon,  9 Feb 2026 08:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOg8Qti9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F59010E33A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770625382; x=1802161382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/eOK5jAyCF+uIi4QYoW7iv99jhx1DPyB5KP9CNgU7MQ=;
 b=XOg8Qti9c3vgs7OLO9nJuXATFS9ZKIVJMV77eGKa5spGJIEGS9WclL1t
 VSmiyE1TFibYYdsMw/65axH5oejfbTebuX1ogVpADV/8tpphgsC5Weozy
 yTohC8DaaDvpKIpmKQdYqkBb0Citf0xbG2ZWHVC6pKux+1fLKRBqLCEcv
 vN90dBjQmZlse8AOHrJWpn/yJciCe1yt8XeZRcsD/G9gzKJCkem3enzDi
 0ZrYzloxzGMaQscQJV3bCG5PW5tU+8xLiKjFdf82APU5PHquiPmMJBVVE
 T5poAwK0uQcHOgfI0JYpts29MbXCWpdq2niA7tQuBQ2fCwPSmeZmFg0Mo g==;
X-CSE-ConnectionGUID: 3AXxFXlCS66taNj4JGn2pg==
X-CSE-MsgGUID: vDrt7JL+SteZWxw6EQ/+yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71718753"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71718753"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:23:02 -0800
X-CSE-ConnectionGUID: ZCFcIKwRQwWnktp99pbllg==
X-CSE-MsgGUID: 8O1iqRcCSxCfli1IBiioEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211577199"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 00:23:00 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 1/2] tests/kms_plane: Skip cursor plane for source
 clamping
Date: Mon,  9 Feb 2026 14:03:30 +0530
Message-Id: <20260209083331.1088550-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209083331.1088550-1-pranay.samala@intel.com>
References: <20260209083331.1088550-1-pranay.samala@intel.com>
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

Avoid running source clamping tests on cursor plane,
which do not support clamping.

v4: Add a short comment (Jeevan)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2be10f032..22c45ae5e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1090,12 +1090,6 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 	bool result = true;
 	bool found = false;
 
-	/*
-	 * No clamping test for cursor plane
-	 */
-	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
-		igt_skip("Clamping is invalid for the cursor plane.\n");
-
 	for (int i = 0; i < plane->format_mod_count; i++) {
 		if (data->mod == plane->modifiers[i]) {
 			found = true;
@@ -1288,6 +1282,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
+		/* Cursor planes do not support cropping, skip generating subtest on cursor plane */
+		if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
 			test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
-- 
2.34.1

