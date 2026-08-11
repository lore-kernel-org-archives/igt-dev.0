Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE002C5B56A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 14:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2710EC55;
	Tue, 11 Aug 2026 14:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RK2jdlyP";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A61110EC5A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=d8GkZk00f9Dmd7daqbhbyshvnop+OJWJbXhvFvEmp/w=; b=
 RK2jdlyPlxRuaytrD13YD1eK2VOtMf6toRChVKJ/ZbaHc+2h9h8VtDT2a6toSk9GJmYK7U+hRX8Tn
 ucyY5utfuJF86UOpaLmfYcw+kK1JxqihEfo1b9Wr2zResxbvrFp2SNgiLvvKJ91hWaSqqNrBz4B7V
 m8SO5ktHSsZ6XlQP/l+fou42gyaoUnZYnyWH+rc7ms/YivTxY1duWzmhv5Y+pAdPPin0x36UtqGV0
 5eogxjiioD0vCu8bh0KM+wbXq8EPd7B2H4Hti3KuG58+sEiwIbRfUJUpdvZm0W1fWAlSi/MrhOwT+
 Pzd3KSYSEhT0q4hlkUmfa9nV5DIjwNTAbA==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill.Home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wtncC-00HCVy-Ki; Tue, 11 Aug 2026 16:38:05 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t v3 4/6] tests/kms_properties: keep primary plane enabled
 for each CRTC
Date: Tue, 11 Aug 2026 16:23:04 +0200
Message-ID: <20260811143558.141813-5-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811143558.141813-1-mwen@igalia.com>
References: <20260811143558.141813-1-mwen@igalia.com>
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

For AMD, a primary plane must be active to keep CRTC active. So stop
reusing primary plane fb for overlays, give the latter its own fb.

Signed-off-by: Melissa Wen <mwen@igalia.com>

---

v2:
- detach different changes from a single commit (Chaitanya)
---
 tests/kms_properties.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 292a04a2a..87614346a 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -237,7 +237,7 @@ static void run_colorop_property_tests(igt_display_t *display,
 				       igt_crtc_t *crtc, igt_output_t *output,
 				       bool atomic)
 {
-	struct igt_fb fb;
+	struct igt_fb fb, afb;
 	igt_plane_t *plane;
 	igt_colorop_t *colorop;
 	int i;
@@ -255,6 +255,16 @@ static void run_colorop_property_tests(igt_display_t *display,
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
 
+		/* AMD requires primary plane enabled to keep CRTC enabled */
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			drmModeModeInfo *mode = igt_output_get_mode(output);
+
+			igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+					      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &afb);
+
+			igt_plane_set_fb(plane, &afb);
+		}
+
 		/* iterate over all color pipelines on plane */
 		for (i = 0; i < plane->num_color_pipelines; ++i) {
 			/* iterate over all colorops in pipeline*/
-- 
2.53.0

