Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA91CD3427
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 19:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A4010E484;
	Tue,  5 May 2026 19:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="L9L4r8Ji";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F68A10E484
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1778010259;
 bh=qjgYh3RrotUPuI3wUk+Z+X3AsaBm5X97NidwYyIcyO0=;
 h=From:To:Cc:Subject:Date:From;
 b=L9L4r8JiuraAhh8OReRtDiy4PMMN+JHX5qzLI5cVM+hZ7bVlGLT3AOndfREc4BJpy
 WzL7uD1FDbLSru6bzTctnbDBDVwldOTxZg+aWlV5Cc7iiHIb4IFQ+jXCLPRvcoJaVy
 6mC4nKWS1xUE0eBntz0r/+zd2E9S89szCi5Dd/MgbaaYCtXEzux9zHVB6JH1HQ10Ke
 dqtE9RBSuPaB49AvaXvfcfiRjJGI1scsKliscmBRahc4qt2wVFx+rtmrpa1/F1KA1q
 T9UEx0sH89MALk3XtpUgGgc/eEMyW7MHlRMlhL0LMk0i3/9G0r1JQBvd+ipk3CZTPD
 CzJjYZLgV3PtQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the BACKGROUND_COLOR
 property.
Date: Tue,  5 May 2026 21:44:20 +0200
Message-ID: <20260505194419.500600-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

The background color is a 64-bits property that contains the ARGB values
of the background with 16 bits for each component.

Add support for the BACKGROUND_COLOR property, and set to pitch black
as the default.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99fc9fa05c..b70aefe697 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -731,6 +731,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
+	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2737,6 +2738,9 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
 		igt_crtc_set_prop_value(crtc, IGT_CRTC_SHARPNESS_STRENGTH, 0);
 
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR, 0xffff000000000000ULL);
+
 	crtc->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a58cb5cd34..71f908d4f5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
        IGT_CRTC_SHARPNESS_STRENGTH,
+       IGT_CRTC_BACKGROUND_COLOR,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.53.0

