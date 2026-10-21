Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5415606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=haEcgXeo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3AA10E031;
	Wed, 21 Oct 2026 15:21:59 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D6C10E317
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=6tUHIp25u7jUN0dked7fkhZwdPpzaQlwCYN3X+HsJYU=; b=
 haEcgXeo/rnRb+7U5KepMjyEY/QsBjFq/yRhSlVGOiPXEAat68RZuQOX1u1bClrdPj8MnQu88VKHD
 AifnA5AiYiQAq0/4Jj04WZugkg1AVWMyM+eHrRF6l4HtZbYPxJBN1mSQ1tRImjpty1bG106hPrA/T
 oR4hGtxHnG26LjkzNRh366djFNd+F9jr1tMzkCPoagNJFEedS4ilk/gXLf65hmblBp5kJpIYD7KvJ
 EeRg2BHqNq60qaDPL52M9Bo3lKiuLl6CCoO1tbtk7zpxQAGWNp4XLzUDWERLxHAQG56TalYWjLuR5
 gs4+LHAm9GdXGrG6e6TjjilFZVRAnqM+bA==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6h-005l0E-GF; Wed, 21 Oct 2026 17:19:59 +0200
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
Subject: [PATCH i-g-t v6 1/8] lib/igt_kms: clear colorop-changed flag after
 commit
Date: Wed, 21 Oct 2026 17:18:25 +0200
Message-ID: <20261021151929.62529-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021151929.62529-1-mwen@igalia.com>
References: <20261021151929.62529-1-mwen@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 lib/igt_kms.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af0f7c4e5..365fb0cc3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4898,8 +4898,24 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
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

