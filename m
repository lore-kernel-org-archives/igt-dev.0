Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8955ECD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE47010E2A7;
	Thu, 11 Apr 2024 11:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKpPFR+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF4210F041
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712836049; x=1744372049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JPHPq69GOXNbMBZed7j7saD5Hn7upO/I9R5uNPlnbSY=;
 b=RKpPFR+RWziZiGU76K6CXl9Dk2fZpvWJc+jGSBtxhDuGkunJcdZJ2Cm8
 dMbV5fQoYNz04QlI+t+q07X7CU0IPwGYhNofbOWAAjsLADPNMak6uUA0q
 D9Eo+fR/t1VrL7IFIKTZqx2zqCwfsBsVTn6Xz7spIVO38DFeneJtjt8uh
 VqJp6GcUhgwGvVAL6Hq4O398wQgnmL7bCdS/0B8VPTLfxXc+WfUU/NdtX
 CDjcgSFTczkq+jwW9tQvEVB0OQMOWvWHeeCmV1WH2t66J3mSFjoQdMgOf
 cBs/pRkUnn6Y32bEczSRl5AWB65cGlwFEMxQDfhxElMzjHIS9HaruSVHL w==;
X-CSE-ConnectionGUID: vwpduAdkRzi9xgfDPdWpBA==
X-CSE-MsgGUID: er120ra3TjOFpBovRZViOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12018167"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12018167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:47:28 -0700
X-CSE-ConnectionGUID: WI1WijPKRaGNss6iqyINzg==
X-CSE-MsgGUID: 7tsVe7qTTiK9Vt2R5DDUoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20922571"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:47:27 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_async_flips: Reuse the already mmapped
 buffer
Date: Thu, 11 Apr 2024 17:18:04 +0530
Message-ID: <20240411114804.21206-3-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240411114804.21206-1-vandita.kulkarni@intel.com>
References: <20240411114804.21206-1-vandita.kulkarni@intel.com>
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

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/kms_async_flips.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2895168f7..05f1f72cf 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -221,12 +221,19 @@ static void test_init_fbs(data_t *data)
 		prev_modifier = data->modifier;
 
 		if (data->bufs[0].fb_id) {
-			for (i = 0; i < NUM_FBS; i++)
+			for (i = 0; i < NUM_FBS; i++) {
+				if (is_intel_device(data->drm_fd))
+					igt_fb_unmap_buffer(&data->bufs[i], data->bufs[i].driver_priv);
 				igt_remove_fb(data->drm_fd, &data->bufs[i]);
+			}
 		}
 
-		for (i = 0; i < NUM_FBS; i++)
+		for (i = 0; i < NUM_FBS; i++) {
 			make_fb(data, &data->bufs[i], width, height, i);
+			if (is_intel_device(data->drm_fd))
+				data->bufs[i].driver_priv = igt_fb_map_buffer(data->drm_fd,
+									      &data->bufs[i]);
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
+				igt_fb_unmap_buffer(&data.bufs[i], data.bufs[i].driver_priv);
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
+		}
 
 		if (is_intel_device(data.drm_fd))
 			buf_ops_destroy(data.bops);
-- 
2.43.2

