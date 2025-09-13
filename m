Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23940CA101F
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC76C10ECF4;
	Sat, 13 Sep 2025 00:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ldrsAlsd";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E135A10ECF4
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721846;
 bh=ZQnj7/7Qmq9oFn0Wp8LYT7oP1XuhZO1QTnP1WyORaLk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ldrsAlsdWdPWCXJ2SzRWsag7TP9Jj0Y0l8E5ap5shVPTN6beKkzmi+23hkQn+Csf6
 cX0sq/bJ6gNkK0b3rH3fyVFwYMBrYaCO4wMYw+p1Sg/fbPb34Y7+DvMTEEbyiZ7V6G
 yShxgYANF0i2Ci1wx7dSktCp+7XyZpUXp4WRMZlkjnryBAivWsD2iExwBa2pxI5DVH
 WeN8SZj25GOiq/wLatIE/EaBEXmbyK9XfJ02ygMFno43VDVDun2NC4tp6LPbI38RBz
 o6rc9F17sv/ort2MsCZMlxNyyRDxjvXyQpy7epMF7ZmDV1wb/g/XmwwQJykLoQQBjq
 6ScEX/6D6YfUw==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8150717E129D;
 Sat, 13 Sep 2025 02:04:05 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:03:00 -0400
Subject: [PATCH 8/9] tests/kms_properties: Ignore color properties in CRTC
 based on pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-8-83fc62420cba@collabora.com>
References: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
In-Reply-To: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
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

Ignore color-related properties - the new COLOR_PIPELINE and now legacy
gamma and ctm properties - in the CRTC based on the status of the color
pipeline client cap.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tests/kms_properties.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 084f7cdc04fcace28d9cab317a2679bf23bd9c31..e005ee6b35436a9305dbc3fa7de8460234091601 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -122,6 +122,20 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 		if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING"))
 			return true;
 
+		break;
+	case DRM_MODE_OBJECT_CRTC:
+		if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "GAMMA_LUT"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "DEGAMMA_LUT"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "CTM"))
+			return true;
+
 		break;
 	default:
 		break;
@@ -289,7 +303,7 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
 
 	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic, false);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic, display->has_post_blend_color_pipeline);
 
 	cleanup_pipe(display, pipe, output, &fb);
 }

-- 
2.50.1

