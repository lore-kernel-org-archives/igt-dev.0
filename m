Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEAFC624D3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8025510F304;
	Wed,  2 Sep 2026 18:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Bm9Uc73X";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C7610F301
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=srVZ6PkQzms9fntDPNrBfKonixwSh4D3gbrv1aZlFoY=; b=
 Bm9Uc73XzPqkzOvBsqdPYKY3PgSCQP1NuEsCDgjejlsiO19c3tEH0mWC1b4t6vDoVcElwtpv/VkNS
 5qny9zO+7/qLlNIjzEPf9pR2bXnRuvRvS0PSZsrLjmzWtC8aBt4X+gJNURpPu6Ba9YRuI5P6OtXUQ
 Nu27rwoHisMMvDqLjf4r+f0juMfb95E+YsOrDuxAK1Q7Y2Rhg0iq9TESUMgAKwZExDEGUqH8lnchb
 BDLrK0DckBSoPwv/Zq8nUIrLID6VJjqMhaeWSHHeNReU6lNQAQsHzZO5MjYse0ysTzM+0zm8zq8xS
 HHtUwxKq0wrIJx/20AfNP1Na+C0/zXWrMw==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGJ-00DxQx-HC; Wed, 02 Sep 2026 20:00:39 +0200
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
Subject: [PATCH i-g-t v5 6/8] tests/kms_properties: check colorop properties
 on active color pipelines
Date: Wed,  2 Sep 2026 19:58:06 +0200
Message-ID: <20260902180016.303482-7-mwen@igalia.com>
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

A colorop property can only be changed if its color pipeline is active,
i.e. the colorop is in the chain of the color pipeline set in the plane
COLOR_PIPELINE property. Set each color pipeline active before checking
the properties of its colorops, and restore Bypass afterwards.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v2:
- detach different changes from a single commit (Chaitanya)
v3:
- move hunk to the previous commit (Chaitanya)
v5:
- add missing commit of bypass color pipeline
---
 tests/kms_properties.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index c55a271da..76aadd162 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -271,6 +271,9 @@ static void run_colorop_property_tests(igt_display_t *display,
 		for (i = 0; i < plane->num_color_pipelines; ++i) {
 			/* iterate over all colorops in pipeline*/
 			colorop = plane->color_pipelines[i];
+			igt_plane_set_color_pipeline(plane, colorop);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+
 			while (colorop) {
 				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
 					  igt_crtc_name(crtc), plane->index,
@@ -285,6 +288,9 @@ static void run_colorop_property_tests(igt_display_t *display,
 			}
 		}
 
+		igt_plane_set_color_pipeline(plane, NULL);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
 		/* only the fb created above needs to go away here */
 		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
 			igt_plane_set_fb(plane, NULL);
-- 
2.53.0

