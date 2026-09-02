Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0782C61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C08F10F304;
	Wed,  2 Sep 2026 18:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UVkoLNOY";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D2810F304
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=2k99tRW+SFli07knSdF8F7EzxqdiYOT+XocEqKFzgww=; b=
 UVkoLNOYjW/v6RBe7BNOgmXtEH9svzVl/Tok1P0wwUO66f550JV3bv4G0LeNu8ufoP9mkV+AKear1
 fprxxHPDNr2MU/XsU2iqt3vj8o38JcILvUs2dnoSwtIKDjF3yNl16lu3TVCW28L9Jom/a44QO/yRQ
 YJXVi9dJ6NPVRluHJKRLB3TWWujrHOLQv6d+yNfPmvuZ9jggHIHguiXt1oVBbyS7ozVUhCXpWApUm
 hDnBif3lG9mX8raL5L8Pblg00wB1sX3k3nhKvt4S1JwPVY0gdizOlHKrjtx2KdOSlGnIqW+7qjknD
 nL5rY05C9Amj7yLGhy4MjRPFS58KcymG2g==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGF-00DxQx-IZ; Wed, 02 Sep 2026 20:00:35 +0200
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
Subject: [PATCH i-g-t v5 1/8] lib/igt_kms: clear colorop-changed flag after
 commit
Date: Wed,  2 Sep 2026 19:58:01 +0200
Message-ID: <20260902180016.303482-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902180016.303482-1-mwen@igalia.com>
References: <20260902180016.303482-1-mwen@igalia.com>
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
commit. This fixes incorrect re-submission of property changes in
inactive colorops after a successful atomic commit.

Assisted-by: Claude:claude-opus-4-7
Tested-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v3:
- use uint32_t variable for igt_find_colorop (Alex H)
---
 lib/igt_kms.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d78e3bee..cd0a42840 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4890,8 +4890,24 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 				       plane) {
 			if (s == COMMIT_ATOMIC) {
 				int fd;
+				igt_colorop_t *colorop;
+
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

