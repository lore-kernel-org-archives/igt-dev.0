Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4024D767D8
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 15:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644CA10E8BD;
	Thu, 31 Oct 2024 15:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PuV1kOhN";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334F810E8BD
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 15:05:18 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-210e5369b7dso10222895ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730387117; x=1730991917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rdulfMtJpuEnHM5yzZnRzlp1Z6g1sD56m0XpbQi0+3w=;
 b=PuV1kOhNunHCAjphRcj0U6od4hCgZyzjAOX9iE682dACsERgoVpHl5ukWI+0yaiRhO
 lf5bcsiZMl4/kz7nTOTv9t0faN72jMd94ggGnyf9v94rWDSsLUklwZXTjOiL3b35wPU4
 uw+f8gLW+8W8HOw7L6o1T3F4N1sqQrhFy2hP+A+1xDV5p0rL/e01SE8FZzFK7IYkJxAs
 szoADpb+6JvHStSH10Ft9OYjlDheSaDrQYa7qYF1Nj9/2g6oFc2j1lE9sujTSdtFEJhw
 y1isgkpWkNWHAMkMrdNfJ/KlLCev+ueVZCaQHsK4Vpy+nOBWTC99DdhodtdDAlgUJtm2
 KGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730387117; x=1730991917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rdulfMtJpuEnHM5yzZnRzlp1Z6g1sD56m0XpbQi0+3w=;
 b=DhD6rxnI5SskkuOR4QxVguZZINGtaXSDfWIu33uSeJKjh017UQlXl9y2szQM+zNXTA
 +aHGdvKVJOnoMDJK7tIgAyfcevXsIEsCJRkI9vm2IRwgbZuvnALeh49dJJKBbhgBmEXV
 7dg5LFalFP2bmJdf45uTnHGko2V1VDd0uZ0LHNgEAi0EcaY6CfpLeEbpiKK4qlXqoVpx
 7d+dCJLRWismfNrFhzrFROyXbOAizgNLoxI2K5DyvbjDoCZn7krdhPd0+XyH7fb6jmsO
 EwthBK9XKhyoL91Ki44jrm/+jeEvPh+qiFITg/cB30k4Ph2cSwxFZqo7Hkwdz5E3kxMI
 KXGg==
X-Gm-Message-State: AOJu0Yzn2/tcutXNzP7DkFmhdfjz9Rb6I7r1Kqu9pHwG7DrjtLOusmzt
 fqGw9gZRoJFPK6K0CzZGEUD/C8J4xDGli4rrLKLaGMD2DA0469EOaybBYIQAxmw=
X-Google-Smtp-Source: AGHT+IHhptYLIn0o6x5qyTN7WUjiJy/ab+FYze1C3Xpjj2eGK9EnLT13dJy75RYZRrOvwAMGFQQt0Q==
X-Received: by 2002:a17:903:124b:b0:20c:ab33:f8b8 with SMTP id
 d9443c01a7336-210c68d4a96mr220499525ad.15.1730387116482; 
 Thu, 31 Oct 2024 08:05:16 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057c9afasm9637325ad.235.2024.10.31.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 08:05:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_ccs: add suspend tests
Date: Thu, 31 Oct 2024 17:09:01 +0200
Message-ID: <20241031150901.325042-1-juhapekka.heikkila@gmail.com>
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

Add crc testing for suspend/resume while compressed framebuffer is on screen.
Test use only XR24 and P016 formats for testing. After resume is checked
framebuffer did stay compressed.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index a5d3ff5e6..13103d4d5 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -96,6 +96,7 @@
  * arg[1]:
  *
  * @crc-primary-basic:           Primary plane CRC compatibility
+ * @crc-primary-suspend:         Primary plane CRC after suspend
  * @crc-sprite-planes-basic:     Sprite plane CRC compatability
  * @random-ccs-data:             Random CCS data
  *
@@ -159,6 +160,7 @@ enum test_flags {
 	TEST_BAD_AUX_STRIDE		= 1 << 7,
 	TEST_RANDOM			= 1 << 8,
 	TEST_ALL_PLANES			= 1 << 9,
+	TEST_SUSPEND			= 1 << 10,
 };
 
 #define TEST_BAD_CCS_PLANE	(TEST_NO_AUX_BUFFER | TEST_BAD_CCS_HANDLE | \
@@ -252,6 +254,7 @@ static const struct {
 	{TEST_BAD_CCS_HANDLE, "ccs-on-another-bo", "Test CCS with different BO with given modifier"},
 	{TEST_BAD_AUX_STRIDE, "bad-aux-stride", "Test with bad AUX stride with given CCS modifier"},
 	{TEST_CRC | TEST_ALL_PLANES, "crc-sprite-planes-basic", "Test sprite plane CRC compatibility with given CCS modifier"},
+	{TEST_CRC | TEST_SUSPEND, "crc-primary-suspend", "Test primary plane CRC with suspend on XR24 and P016 formats"},
 };
 
 /*
@@ -817,8 +820,18 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	ret = igt_display_try_commit2(display, data->commit);
 
-	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc)
+	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
+		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+						      SUSPEND_TEST_NONE);
+
+			/* on resume check flat ccs is still compressed */
+			if (is_xe_device(data->drm_fd) &&
+			    HAS_FLATCCS(intel_get_drm_devid(data->drm_fd)))
+				access_flat_ccs_surface(&fb, true);
+		}
 		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
+	}
 
 	igt_debug_wait_for_keypress("ccs");
 
@@ -846,6 +859,11 @@ static int test_ccs(data_t *data)
 	igt_crc_t crc, ref_crc;
 	enum test_fb_flags fb_flags = 0;
 
+	if (data->flags & TEST_SUSPEND &&
+	    !(data->format == DRM_FORMAT_XRGB8888 ||
+	      data->format == DRM_FORMAT_P016))
+	      return 0;
+
 	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT "\n",
 		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
 
-- 
2.45.2

