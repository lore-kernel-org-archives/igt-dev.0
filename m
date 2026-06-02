Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC45ACD5BD1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 21:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586510E6A0;
	Tue,  2 Jun 2026 21:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RAvbuwxV";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1C210E681
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HbXIS7r06OaJxvmHeaXN6/Ik2Y0kIQuoAMsQcPDAVm0=; b=RAvbuwxVMpHz6RusFz7zdoIwkp
 A3gUIA7e23SJry1jIRnUDUFZvgbt+NU1sbHx7hbD1JuHo0i+FdX5dTzNiVrVIVS+3oDSQNkVs4/H/
 +DZYrzE1yrlHieFeTNWARg9+YQFU7KWwJynS6t2cvwEMNUjXFF7WpGCkABUOL30vgteoVWTGBZ0kX
 ax7w9auHNzSuWNro7jQxrjuF6ycNRzN2kDYU8/gKhuvgPQXwYIwFvrCwX6BiLZmtjLnFGavy6pd4Y
 J8fPwmnKNuu4un1FLovr8JNwkWQFwG4seRkBf1GS68UYptOjVAkZd1bSkaBinI+Wu5vK1J+7rIVI9
 3vlXRe5w==;
Received: from [79.117.146.159] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wUWS8-00BtIm-Es; Tue, 02 Jun 2026 23:15:12 +0200
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
Subject: [PATCH i-g-t v2 4/4] tests/kms_color_pipeline: skip if not an intel
 device
Date: Tue,  2 Jun 2026 23:06:45 +0200
Message-ID: <20260602211259.898147-5-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602211259.898147-1-mwen@igalia.com>
References: <20260602211259.898147-1-mwen@igalia.com>
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

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_color_pipeline.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 6119a830f..4ec483038 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -367,6 +367,7 @@ int igt_main()
 
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
+		igt_require(is_intel_device(data.drm_fd));
 	}
 
 	igt_subtest_group()
-- 
2.53.0

