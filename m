Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE61AC5B572
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 14:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665C610EC50;
	Tue, 11 Aug 2026 14:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HVnQ4kkY";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3ED10EC50
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=OLes4s2zyuF1i7ABkmR9Qa4pQAThBnWfe6LsAIyJvu4=; b=
 HVnQ4kkYznbO9tQNpsaQCHuyPatnyrViwGqC3GJf4bWaHMEN99bKoMjUmZKcacRGT7HAknQh75P4G
 PmwgWZob4Ls++JU6DDpEmLKtUsMDkm4Pr9K7KJAZtwIL0WY2SGhX0Q/1L/YiUuc4QfMhpnCl95ZV2
 OhJTi471uy1pUT7645iC4lNLawcUKdar3IuJ2snXorKyfat+VwNX6tAj5JZE43oFlWR0rBik9BUJD
 2tb1GF0xq+IRBKDf8DhLafkLFr+mdY1p8cVmNkUtVogE2CILqHORp3qjRHSEycP31i6+w2npNH9J8
 SosUm0lCewUSxqmRvnnFkaok2osM0xZ6bw==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill.Home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wtnbu-00HCVy-Ud; Tue, 11 Aug 2026 16:37:47 +0200
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
Subject: [PATCH i-g-t v3 3/6] tests/kms_properties: don't check colorop if no
 plane color pipeline prop
Date: Tue, 11 Aug 2026 16:23:03 +0200
Message-ID: <20260811143558.141813-4-mwen@igalia.com>
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

If plane COLOR_PIPELINE property is not avaliable, the plane doesn't
support colorop pipeline and there is no meaning in check colorop
properties here too. Don't check colorop properties in planes that
doesn't support it (for example, in cursor planes of AMD driver).

Signed-off-by: Melissa Wen <mwen@igalia.com>

---

v2:
- detach different changes from a single commit (Chaitanya)
---
 tests/kms_properties.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 93bf1ea26..292a04a2a 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -247,6 +247,10 @@ static void run_colorop_property_tests(igt_display_t *display,
 		     &fb);
 
 	for_each_plane_on_crtc(crtc, plane) {
+		/* don't check colorop in planes without support to color pipeline */
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
-- 
2.53.0

