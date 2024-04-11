Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F1C04FF0
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 17:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A597310F253;
	Thu, 11 Apr 2024 17:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2COC7k3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC62D10F254
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712854955; x=1744390955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lxy7oFvr9ovlPfxdLrnHPVf+gaqEgOXEqUTqljoRXQ=;
 b=I2COC7k3IFZ2pbmWZdZFG6hLckp/g7QPp7/a+zAI64X0uYXQ5JWhF1mk
 G4kg8HE1X98SwEVUS46H59nbebC9HQhyGeNclMCkDvc/VoIOii9CSNlFd
 4tHPSy9ixWBWgYLH6/NGKMBVky4TOiCrZ0AvsahmkioA17Kl7YQAAdFth
 J56LWN1NHuAoXMSonm/oq7e7rH2EFRvsK51ohi9BINUfnEaNXDHH80iFX
 Wm+Hli12zGMUgd9rvwOnhzSYH4UAb7j0YZ069UeZ0y2sx+AETCOQRGv+w
 Y6x/DxuwjtUa+GJt7M6ZWUW059qLFz5kVtiT2fBTG/ScrdA3+7mABBdFr w==;
X-CSE-ConnectionGUID: I3j7i8ohTta4H4XIk+kJ8Q==
X-CSE-MsgGUID: nfPrjm2nSp69VaZArTrAZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19673811"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19673811"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:02:34 -0700
X-CSE-ConnectionGUID: TPGVnLcpSGukojZ76lpqAA==
X-CSE-MsgGUID: ro8MGxxGQ9yysZ1as/CZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20874186"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:02:34 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Reuse the already mmapped
 buffer
Date: Thu, 11 Apr 2024 22:33:12 +0530
Message-ID: <20240411170312.5615-3-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240411170312.5615-1-vandita.kulkarni@intel.com>
References: <20240411170312.5615-1-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In crc test case where we are trying to update the fb
dont mmap it agian. On some platforms it was found that
updating a newly mmapped buffer takes longer time.

v2: Use fb->fb_map instead of fb->driver_priv

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/kms_async_flips.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2895168f7..2440b0977 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -221,12 +221,19 @@ static void test_init_fbs(data_t *data)
 		prev_modifier = data->modifier;
 
 		if (data->bufs[0].fb_id) {
-			for (i = 0; i < NUM_FBS; i++)
+			for (i = 0; i < NUM_FBS; i++) {
+				if (is_intel_device(data->drm_fd))
+					igt_fb_unmap_buffer(&data->bufs[i], data->bufs[i].fb_map);
 				igt_remove_fb(data->drm_fd, &data->bufs[i]);
+			}
 		}
 
-		for (i = 0; i < NUM_FBS; i++)
+		for (i = 0; i < NUM_FBS; i++) {
 			make_fb(data, &data->bufs[i], width, height, i);
+			if (is_intel_device(data->drm_fd))
+				data->bufs[i].fb_map = igt_fb_map_buffer(data->drm_fd,
+									 &data->bufs[i]);
+		}
 	}
 
 	igt_plane_set_fb(data->plane, &data->bufs[0]);
@@ -538,8 +545,7 @@ static void paint_fb(data_t *data, struct igt_fb *fb,
 {
 	if (is_intel_device(data->drm_fd)) {
 		igt_draw_rect_fb(data->drm_fd, data->bops, 0, fb,
-				 igt_draw_supports_method(data->drm_fd, IGT_DRAW_MMAP_GTT) ?
-				 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
+				 IGT_DRAW_MMAP_PTR,
 				 0, 0, width, height, color);
 	} else {
 		cairo_t *cr;
@@ -730,8 +736,11 @@ igt_main
 	}
 
 	igt_fixture {
-		for (i = 0; i < NUM_FBS; i++)
+		for (i = 0; i < NUM_FBS; i++) {
+			if (is_intel_device(data.drm_fd))
+				igt_fb_unmap_buffer(&data.bufs[i], data.bufs[i].fb_map);
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
+		}
 
 		if (is_intel_device(data.drm_fd))
 			buf_ops_destroy(data.bops);
-- 
2.43.2

