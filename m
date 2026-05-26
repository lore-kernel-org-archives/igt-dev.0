Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994FACD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435DB10E4C5;
	Tue, 26 May 2026 14:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l8ZvXuzc";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEA710E4BC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JSTpumWCWqqb+tBY0kkhbBIx5Lb0C89somu7S8CDV8g=; b=l8ZvXuzcFMlqOFSENpcdWhWeDG
 UsfrBJIgVx9RM8Jo9AK0LYzuoOiZm3SiMEAJ5XgvanmgOAHBK1UFF2Sr6vq9jmHKxzfsW0xJD+VMW
 6I+YR4a+W11xiTfylGzc0C/QkSYTJbQhDSEenKh0xb/ORt16KhWjHHYQyxcwOerWaiJNpKEIbs3dH
 CUSh4OMt9HD6+9kdbzLo6SVphSPGDOs2/SVL4oR6z4SH3+mzPh65dzze2u8vNEdM64KDp79Bt7Ov0
 2jnVcrzIzNbVuXejGlCcExO6T9cKiExxopgXldMWkQAxSJrdioezLEvQsfbBnjpmCrSOPezftmP1O
 cPTWGaFg==;
Received: from [79.117.146.159] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRsSY-008Sz5-KW; Tue, 26 May 2026 16:08:42 +0200
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
Subject: [PATCH i-g-t 1/2] lib/igt_kms: clear colorop-changed flag after commit
Date: Tue, 26 May 2026 16:05:03 +0200
Message-ID: <20260526140752.503380-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526140752.503380-1-mwen@igalia.com>
References: <20260526140752.503380-1-mwen@igalia.com>
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

