Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA7D66BAD
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 06:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46B610E254;
	Thu, 28 Nov 2024 06:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dg0UUnWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D485F10E254
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732775701; x=1764311701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=txrhLRIk/KC1drj9pqh3nfMME53Or3TFDEvhM1SjtL0=;
 b=dg0UUnWbWnS8s4ehfLEe7pm4G0qD6c4arRr5mOcqddg5SJ4202Q48Vob
 kD7ggak4bMEupjPcKss7+qXHuIrxVwL9rcgio9HZJ3wNYIEHPQDDyZcpc
 SgjGqFDBjqBcQr+IdDAbB3sYkhoRsJx3701xauS4xPHKPInseMU1BNQsq
 v3fSWbNebYyaVTJbOAk6EMhZUj9QUu8xclN/j/hywJePuHAxpGOnX8uMS
 ERBICKQhQNySeZIVZ3PSXRVchB7vuFIFwwxJXXaKWvfuefZjkc4jrKaDP
 zgnMiz6WSIYa6/oFBXLH3wMRjsskw8KfIr7vppQdNfz7GEO9UgdpXqhs+ A==;
X-CSE-ConnectionGUID: m3YDb9bYSqaqz5LQXlZQXg==
X-CSE-MsgGUID: CV92kgt6SBeNfM2uzjGpkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32932275"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="32932275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 22:35:01 -0800
X-CSE-ConnectionGUID: ykZ7tl17TEGBry0Ua1ycMw==
X-CSE-MsgGUID: n5G4KWW5QK+UWdI8IeAdLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="91757513"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2024 22:34:59 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/kms_plane:Add more logs to skips/failure
Date: Thu, 28 Nov 2024 12:05:39 +0530
Message-Id: <20241128063539.1984668-1-pranay.samala@intel.com>
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

Having some logs for test failures and skips would
make debugging much easier.

v2: Remove the extra logging statements (Jeevan)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 77a669dc5..b9bf025bd 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -293,8 +293,11 @@ test_plane_position_with_output(data_t *data,
 	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
 	igt_plane_set_fb(primary, &primary_fb);
 
-	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR))
+	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR)) {
+		igt_info("plane-%d does not supports XRGB format and Linear modifier\n",
+			 sprite->index);
 		return;
+	}
 
 	igt_create_color_fb(data->drm_fd,
 			    64, 64, /* width, height */
@@ -493,7 +496,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
 		mode_found = true;
 		break;
 	}
-	igt_require(mode_found);
+	igt_require_f(mode_found, "All connector modes are skipped due to low memory\n");
 
 	if (data->flags & TEST_PANNING_TOP_LEFT)
 		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
@@ -1263,7 +1266,7 @@ static void test_planar_settings(data_t *data)
 	 * If here is added non-intel tests below require will need to be
 	 * changed to if(..)
 	 */
-	igt_require(data->display.is_atomic);
+	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
 	igt_require_intel(data->drm_fd);
 	devid = intel_get_drm_devid(data->drm_fd);
 	igt_require(intel_display_ver(devid) >= 9);
-- 
2.34.1

