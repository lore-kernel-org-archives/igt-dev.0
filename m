Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDA7C5DF66
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C07A10E428;
	Mon, 17 Aug 2026 15:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Mdwox621";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8604610E832
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=/6uGXciTrRBMPeISRx/YhX1LXjKyOdkWHO5lNW2TEc4=; b=
 Mdwox621vcP0MvbXnZlDrjIDxrovuzd0rumyX5IJtG+ICUp8RP0BnJJIRZwetopBbloI/tii1SFgE
 q8zaBSZ1UNtFLh4FSvTnwvdzLmrTwnESz5PdOXNEWFGkXBg5uITMN9mKbr1IH60Y6cPmNu/VyJ4Bw
 iegp4pvNkTmOxRV1M6EG8nJRVM4QIEAFTxUl9IwscV3q2XpYH10EHEgUd82jmMWJElM4hJ24bE5Hi
 tyuvIpOmDKvKOXhaKQ9h8uiNP9GdGypJ7dxwTgF4tXsEPAQ8XD+xI5PJWXC203bdFRp2BkS9Pogd9
 dk1hIExuPqI5sm1uTiEZGknySTEz3sv32w==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wvywo-004dea-AG; Mon, 17 Aug 2026 17:08:22 +0200
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
Subject: [PATCH i-g-t v4 3/8] tests/kms_properties: don't check colorop if no
 plane color pipeline prop
Date: Mon, 17 Aug 2026 17:07:44 +0200
Message-ID: <20260817150749.66509-4-mwen@igalia.com>
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

Don't check the colorop properties on planes that do not support them
(for example, on AMD driver cursor planes). If the COLOR_PIPELINE
property of the plane is not available, the plane does not support
colorop pipelines and there is no point in checking the colorop
properties in this case.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v2:
- detach different changes from a single commit (Chaitanya)
v3:
- grammar fixes (Alex H.)
---
 tests/kms_properties.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 93bf1ea26..2b4cb152b 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -247,6 +247,10 @@ static void run_colorop_property_tests(igt_display_t *display,
 		     &fb);
 
 	for_each_plane_on_crtc(crtc, plane) {
+		/* skip planes that don't support color pipelines */
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
-- 
2.53.0

