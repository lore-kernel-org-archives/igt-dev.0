Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F4AD1BDE7
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 19:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1343C10E0CA;
	Mon,  4 Nov 2024 19:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SM+PFLwl";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D42510E0CA
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 19:40:39 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20ca388d242so45682045ad.2
 for <igt-dev@lists.freedesktop.org>; Mon, 04 Nov 2024 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730749239; x=1731354039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L2dFA1x/Tri/zTdqXBLfvdW/WSiuPTeXdLXjNu62esU=;
 b=SM+PFLwljpYKjRR8AMxkbvfbfBZ1QRQSb+31Se8gocj3GmNiSr/QEVsR1GE7DEza4+
 YjYoP4WeD7XcDddpaQLMCHSD5kb31pu2m6TJHKhQ6z05rfaxinvFcj0VNrCMXmeLheZD
 yPi88J2T/T1f7LOr8NlK8f30ZbFNC+tYcm8FnmP/2jDv3mpX4HUbnFbKZXO9dShqAER9
 Xw1kGiWodvBJq8oyO8p3ySE/Qpp5AFHRTDpB93TO+VdSBu1/7VDcNilh3eTwnrz6VaXc
 sKamm4eZGxAruuJ9FW7KfyqHICijHGuoYYOzyv4IcYH2orzVxFZekkGUOlEsPGMDsdzJ
 /TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730749239; x=1731354039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L2dFA1x/Tri/zTdqXBLfvdW/WSiuPTeXdLXjNu62esU=;
 b=PbXY7D+EN/6xlLMb5vYiRA983ZbD9Yg5du864dqZ2J0MtWoqEeiYKOAec46xuhKUmW
 jFhJTjDOPUOiRzXIIZK39JFdm4xhhXMQ+dhdAES6FZaUHzAX6n3L7HquNtFAu5hAgHB8
 O1cj05vQE9z6D+4adZwfS8XGJ/+vZtESB/6VRWnUAWHQdisyh+GECF4IblXnHKWIidAU
 nT5ZE3odNvqMXWB5B7aXMRvWOiNN7jDHuze0EHI2yTeoep9c8WQtrRCiocJq1FoyzH+S
 /2Yknc88NZQGRiKVwtnhHOERGxsILRedxi1Z9tYWkviwnvnAHXJPQpLa52+w5bJJjoiZ
 YJXg==
X-Gm-Message-State: AOJu0YxLYDiN9BEqFILli+hql/54L/kAhpc0SdDNijpRAeTZ959UXTp4
 kmf+m0xPHJkEVJaPHpho8EyEE0TnsmSls3czthxKjqKiw2Ra6fulxAVbJMfjLP8=
X-Google-Smtp-Source: AGHT+IH1Wk6mZL4srRKIjn5Zhe2mhuieYxXUX6SoJ1lIg3KhCD+3OmGsPn6tJwaeaKEFx1TAaZyhAg==
X-Received: by 2002:a17:902:d50c:b0:20b:5046:35b with SMTP id
 d9443c01a7336-2111b02286emr184754375ad.57.1730749238578; 
 Mon, 04 Nov 2024 11:40:38 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057d44c3sm65303555ad.258.2024.11.04.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 11:40:38 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_rotation_crc: move plane rotation
 requirements into helper
Date: Mon,  4 Nov 2024 21:44:14 +0200
Message-ID: <20241104194415.563277-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

move plane rotation requirement block into helper function.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 9888ac6ac..e8b6e4ff2 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -564,6 +564,22 @@ static bool test_format(data_t *data,
 	return true;
 }
 
+static bool plane_rotation_requirements(data_t *data, igt_plane_t *plane)
+{
+	if (!igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
+		return false;
+
+	if (!igt_plane_has_rotation(plane, data->rotation))
+		return false;
+
+	/* CHV can't rotate and reflect simultaneously */
+	if (!(!is_intel_device(data->gfx_fd) || !IS_CHERRYVIEW(data->devid) ||
+	    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X)))
+		return false;
+
+	return true;
+}
+
 static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
 {
 	igt_display_t *display = &data->display;
@@ -632,12 +648,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		igt_output_set_pipe(output, pipe);
 
 		plane = igt_output_get_plane_type(output, plane_type);
-		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
-		igt_require(igt_plane_has_rotation(plane, data->rotation));
-		/* CHV can't rotate and reflect simultaneously */
-		igt_require(!is_intel_device(data->gfx_fd) ||
-			    !IS_CHERRYVIEW(data->devid) ||
-			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
+		igt_require(plane_rotation_requirements(data, plane));
 
 		prepare_crtc(data, output, pipe, plane, true);
 
-- 
2.45.2

