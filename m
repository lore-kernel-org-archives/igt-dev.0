Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23E0C5B572
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 14:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7BE10EC50;
	Tue, 11 Aug 2026 14:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YBUinRuK";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205A010EC57
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=4pE7ZiDqtHeX2eVpvl7JemRxkA2V+xgXC97CKxt/X7I=; b=
 YBUinRuKiTJBmPKTuKlrCYNznLOI/faX/+RbnPFdu1r7DKFmJkC8f/I55pbVlro8lcIFoO7qMooSW
 k3f43ffIEHCVLjzAIMYPUrlTwzgTy4Oh9jbCm8UMf/xixl+SbgA5sOei9yjO6bSdFZhVl2FLwqcrd
 im2KqTK69GmmFdh3ksK42cTDQSPzxXaTF+hWQ+RBgoXpnW/KgwyFyJTN0Ax8tQGPRfNv0cyi4rxvG
 eF65qFfI8wBb6/VolSunhJWiJ8Q5MzV9Y6117OIDvhhK8guCm7admQ2WBEdyPL7FeksvxxTxu8qMH
 AnOeldVV0VRWW6EqA+sAOnAvjxu0NeVvMg==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill.Home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wtncT-00HCVy-5t; Tue, 11 Aug 2026 16:38:21 +0200
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
Subject: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an intel
 device
Date: Tue, 11 Aug 2026 16:23:06 +0200
Message-ID: <20260811143558.141813-7-mwen@igalia.com>
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

From documentation, the test requires i915 or xe driver, so make sure it
only runs with intel devices. In addition, it's a CRC-based test, making
kms_colorop with writeback more aligned with color testing and
validation. Other drivers should work on adapting this test to their
needs if they are looking for CRC validation.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_color_pipeline.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 78860a845..3978745a5 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -372,6 +372,7 @@ int igt_main()
 		igt_display_require(&data.display, data.drm_fd);
 		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
 		igt_require(data.display.is_atomic);
+		igt_require(is_intel_device(data.drm_fd));
 	}
 
 	igt_subtest_group()
-- 
2.53.0

