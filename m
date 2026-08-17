Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E9BC5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D566A10E428;
	Mon, 17 Aug 2026 15:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Aq02I5zT";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049BF10E835
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=DxAWDPUstq6bWhYs34HVYlITP+CMSnvDZOukcUlmp0Y=; b=
 Aq02I5zTowRxWfABlO4aRkEo3iaCGqhcoEvAGAicBn4vNzHPXGizmrvQMzD9LnwYwe13ZHb22mrrH
 SRqwXbY4H6F5HGpXo+otvrA3n4p6qz8CvP+sM1LYsejijgTvLQFXEtTNnMoUd32HIrqCxUi8q1IR4
 j3YRkgNCnHo6w5+h45Hxf/xXwvbROKk1/zbxi/mU0zdqT75nIaE/nrf/ONxuReBBIL8Fy9qUKYIar
 /jmevB514WcHkGlbKH3TB5TukMnS6I5DCg4Pnx9t3dX1abFokVNHt5XeF0GdEWgj8Y3VoOf2xa64H
 sN0KhnlVXF77pYC3syLTcA01NMHewEX7lg==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wvywq-004dea-Ix; Mon, 17 Aug 2026 17:08:24 +0200
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
Subject: [PATCH i-g-t v4 6/8] tests/kms_properties: check colorop properties
 on active color pipelines
Date: Mon, 17 Aug 2026 17:07:47 +0200
Message-ID: <20260817150749.66509-7-mwen@igalia.com>
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

A colorop property can only be changed if its color pipeline is active,
i.e. the colorop is in the chain of the color pipeline set in the plane
COLOR_PIPELINE property and the plane is active. Set each color pipeline
active before checking the properties of its colorops, and restore
Bypass afterwards.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v2:
- detach different changes from a single commit (Chaitanya)
v3:
- move hunk to the previous commit (Chaitanya)
---
 tests/kms_properties.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index c55a271da..764c77963 100644
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
@@ -285,6 +288,8 @@ static void run_colorop_property_tests(igt_display_t *display,
 			}
 		}
 
+		igt_plane_set_color_pipeline(plane, NULL);
+
 		/* only the fb created above needs to go away here */
 		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
 			igt_plane_set_fb(plane, NULL);
-- 
2.53.0

