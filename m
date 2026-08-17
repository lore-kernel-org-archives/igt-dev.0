Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BFBC5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763FD10E862;
	Mon, 17 Aug 2026 15:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SLKB6MZM";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505FA10E428
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=2Ce/YseCm/3mtaeVzxCJZBuxoTGq++jAuNFSAu9TQIY=; b=
 SLKB6MZMNizdzqK0OwkFF77Gp8ygbOIaIakkrXtPC3fhyJc4fyBKiRfQILctWGDr3+y5KTydFPbtq
 Kdl6m04iW3l5YQj+NHxe4/I0OI7OWKfhvNHNTVFNtWmxH8S/SSJq1IdCqToFllStwZQ3DMjqHXJFI
 4z1sZshwmELtranHl2dfG5kt1vLclwUBjNdcyF7vnuMLp+gV2PGgsDPZa6ymQtT0VoNkehxdgykiB
 Ts9Qr09c12eWDGp1MZgVYgBBH9s4fXtjpmiqN0FQ6d5Om3Uml20Sm/nQUH3M/x5HEJ042khtK0avP
 D1Kn4SfIfIGtNELbnOorrW6Qyh3OaamZgw==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wvywr-004dea-BV; Mon, 17 Aug 2026 17:08:25 +0200
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
Subject: [PATCH i-g-t v4 7/8] tests/kms_color_pipeline: skip if not an Intel
 device
Date: Mon, 17 Aug 2026 17:07:48 +0200
Message-ID: <20260817150749.66509-8-mwen@igalia.com>
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

According to its documentation, the test requires i915 or xe driver, so
make sure it only runs with Intel devices. In addition, this is a
CRC-based test, while kms_colorop uses writeback, which is better
aligned with color testing and validation. Other drivers should adapt
this test if they are looking for CRC validation.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v3:
- do intel device check earlier
---
 tests/kms_color_pipeline.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index f71416ce1..250a27d7f 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -367,6 +367,8 @@ int igt_main()
 		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
 			has_plane_color_pipeline = 1;
 
+		igt_require(is_intel_device(data.drm_fd));
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.53.0

