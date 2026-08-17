Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D498AC5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513E10E428;
	Mon, 17 Aug 2026 15:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mHatc1OT";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A98310E839
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=hGcoKet7XZJrBzYeGh4SI5fnL9h5nIqw9Q18e/86HIs=; b=
 mHatc1OTXn9oQdGY8EYnwGbpdkJTXj73rkurNFH3CWyhEnKmgeE1yb2JP1m1I6Xqd2YtJ0YOdqdBn
 HlOLjG1w3dWg3Dhr7R6qWH3OMisOdHrBhkFp4oaT8+Lte8Cu7SnOn0GNcSkK12S2z/VgiUQ5DHBUL
 j1NT3+x9OYSfSQdNrEXtTyM6KFU/UMZSawnBMhX+pwKO6s931ht+FoTSSUUuCoq8q6nJccviv/Baj
 pcP15JjuRmBY1Qryfyy7NXOzBNIXTi2rzPLLplgHagZlMx+SLaGrMZwjdAYNaXxFCjSDZR10nPrhM
 p5+66CqCz02XpQwWBx3ty2eltjLn0yqUOw==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wvywm-004dea-Oj; Mon, 17 Aug 2026 17:08:20 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH i-g-t v4 1/8] lib/igt_kms: clear colorop-changed flag after
 commit
Date: Mon, 17 Aug 2026 17:07:42 +0200
Message-ID: <20260817150749.66509-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817150749.66509-1-mwen@igalia.com>
References: <20260817150749.66509-1-mwen@igalia.com>
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

The userspace can update only currently active colorops or colorops that
will be activated or deactivated in the same commit. Active colorop
means a colorop that is in the chain of an active color pipeline, i.e.
the pipeline in plane COLOR_PIPELINE property.

Don't request colorop updates if there is no change in the atomic
commit. This fixes atomic commit rejections after test skips, caused by
incorrect attempts to change properties of inactive colorops.

Assisted-by: Claude:claude-opus-4-7
Tested-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v3:
- use uint32_t variable for igt_find_colorop (Alex H).
---
 lib/igt_kms.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 42cc7c3bd..4b8f1c2a0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4862,6 +4862,7 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 {
 	int i;
 	igt_crtc_t *crtc;
+	igt_colorop_t *colorop;
 
 	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
@@ -4891,6 +4892,20 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 				int fd;
 				plane->changed = 0;
 
+				/* clear changed flags on every colorop in the assigned chain
+				 * so already-committed property values aren't re-emitted on
+				 * the next commit.
+				 */
+				colorop = plane->assigned_color_pipeline;
+				while (colorop) {
+					uint32_t next_val;
+
+					colorop->changed = 0;
+					next_val = igt_colorop_get_prop(display, colorop,
+									IGT_COLOROP_NEXT);
+					colorop = igt_find_colorop(display, next_val);
+				}
+
 				fd = plane->values[IGT_PLANE_IN_FENCE_FD];
 				if (fd != -1)
 					close(fd);
-- 
2.53.0

