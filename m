Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A3CD6E5D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 21:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B766510E683;
	Tue,  2 Jun 2026 21:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dtQrRlkb";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106B910E681
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gudgn8IrWh4qNvfJjswEpjshpCHCTQ7HqQOhAeetk7w=; b=dtQrRlkbXYY9nuUJEEOlFNu/Yh
 T1eEv1od3ZyYNGDRgq7HoczQdilUxcBwc9iaXqzrR1jMPRDiXtVfqeD97uy4H2yWAFHBcwJDle/cd
 mR909c0wVpVDFhjrzV4yPQ6B6KtzKruhDC0TR157T6f4Mkfnzi2haEqNGytjfxilRw9uYTG9tiLP4
 6rrJEEMuy8+8R8zvlOxNBNq2P54RyKUVUZXQIP0VmmsBbi2anSl7D2gGSw4qLGbF9JVaU5xzUpSC9
 trn9OzUKTUYNmmR66ynZGsOqFIfwUESnipC1D2bra8E/TV1deNNbXXbtlLgUM/r1qg8ddjJka1xMQ
 1DtM+F1Q==;
Received: from [79.117.146.159] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wUWS5-00BtIm-2I; Tue, 02 Jun 2026 23:15:09 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t v2 1/4] lib/igt_kms: clear colorop-changed flag after
 commit
Date: Tue,  2 Jun 2026 23:06:42 +0200
Message-ID: <20260602211259.898147-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602211259.898147-1-mwen@igalia.com>
References: <20260602211259.898147-1-mwen@igalia.com>
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

Don't request colorop updates if there is no change in the atomic
commit. It fixes atomic rejection after test skips that was caused by
incorrect attempts of changing inactive colorop properties, since
userspace can update only current active colorops or colorops that will
be activated or deactivated in the same commit. Active colorop means a
colorop that is in the chain of an active color pipeline, i.e.  the
pipeline in plane COLOR_PIPELINE property.

Assisted-by: Claude:claude-opus-4-7
Tested-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 lib/igt_kms.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e20307923..d46f15c01 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4858,6 +4858,7 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 {
 	int i;
 	igt_crtc_t *crtc;
+	igt_colorop_t *colorop;
 
 	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
@@ -4887,6 +4888,20 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 				int fd;
 				plane->changed = 0;
 
+				/* clear changed flags on every colorop in the assigned chain
+				 * so already-committed property values aren't re-emitted on
+				 * the next commit.
+				 */
+				colorop = plane->assigned_color_pipeline;
+				while (colorop) {
+					int next_val;
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

