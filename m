Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD81606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=gpVmBPKy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F1210E031;
	Wed, 21 Oct 2026 15:24:19 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103A10FD6E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=fgASsy6JPiYYfAGkF8gQ/h8HneCHx8J4CPf14dYStx8=; b=
 gpVmBPKy+0xwBYcmLXDP5Suij9sWERJptOb/3fBNidts4NDq8UCAw5LFMi8jLsexUt6kNIMStSoEM
 horyc+nmWNztOTC2RzvC+y75150iU6KrJs1PYLzljGKEZssahh082KE/mPr0tkbyj6daMBUK/XJBi
 bd3+S5VZflie5oj56A9+99Gf7VbreTvTEvI85uii7eKl5IdGbjU4ERz12Bk/ri9i7xxSh2/R7/pF6
 draQ9QWTVvtS6EkhmIVbp9xklEQ5Y4rQ3d0Mf3u5i/8IruVkVK/R/0X9ANmH77zYg/K3tFzSqRUqv
 txD+FSgXmYUf1HcDrq4GDAx/vEOyEKhQ0w==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6s-005l0E-4K; Wed, 21 Oct 2026 17:20:10 +0200
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
Subject: [PATCH i-g-t v6 6/8] tests/kms_properties: check colorop properties
 on active color pipelines
Date: Wed, 21 Oct 2026 17:18:30 +0200
Message-ID: <20261021151929.62529-7-mwen@igalia.com>
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

A colorop property can only be changed if its color pipeline is active,
i.e. the colorop is in the chain of the color pipeline set in the plane
COLOR_PIPELINE property. Set each color pipeline active before checking
the properties of its colorops, and restore Bypass afterwards.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_properties.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 07594f669..649b20e6b 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -272,6 +272,9 @@ static void run_colorop_property_tests(igt_display_t *display,
 		for (i = 0; i < plane->num_color_pipelines; ++i) {
 			/* iterate over all colorops in pipeline*/
 			colorop = plane->color_pipelines[i];
+			igt_plane_set_color_pipeline(plane, colorop);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+
 			while (colorop) {
 				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
 					  igt_crtc_name(crtc), plane->index,
@@ -286,6 +289,8 @@ static void run_colorop_property_tests(igt_display_t *display,
 			}
 		}
 
+		igt_plane_set_color_pipeline(plane, NULL);
+
 		/* only the fb created above needs to go away here */
 		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
 			igt_plane_set_fb(plane, NULL);
-- 
2.53.0

