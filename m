Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FD0CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 12:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45A310E320;
	Wed,  8 Oct 2025 12:03:45 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F001710E320
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 12:03:44 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH i-g-t] tests/kms_flip: Suspend signal helper while creating fb
Date: Wed,  8 Oct 2025 14:03:30 +0200
Message-ID: <20251008120329.288455-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 tests/kms_flip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 0cebbecac7..09017c65eb 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1579,6 +1579,7 @@ restart:
 			igt_require(bo_size < gem_global_aperture_size(drm_fd));
 		else
 			igt_require(bo_size < (1ULL << xe_va_bits(drm_fd)));
+		igt_suspend_signal_helper();
 	}
 
 	o->fb_ids[0] = igt_create_fb(drm_fd, o->fb_width, o->fb_height,
@@ -1590,6 +1591,9 @@ restart:
 						  IGT_COLOR_YCBCR_LIMITED_RANGE,
 						  &o->fb_info[1], bo_size, 0);
 
+	if (o->flags & TEST_BO_TOOBIG)
+		igt_resume_signal_helper();
+
 	igt_assert(o->fb_ids[0]);
 	igt_assert(o->fb_ids[1]);
 
-- 
2.51.0

