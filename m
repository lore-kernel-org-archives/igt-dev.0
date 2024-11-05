Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB829D12693
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 11:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE0010E28C;
	Tue,  5 Nov 2024 11:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BCIh7XAg";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCE710E57C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 11:53:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20c7ee8fe6bso50025205ad.2
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Nov 2024 03:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730807605; x=1731412405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=on7drxuMpl/zLzNw/Q/x3LtZK2gi8psdoFgoDDfBcw0=;
 b=BCIh7XAgWBbEDLyRH1LwqXffM91wbnf9LP4fjTsRdDTxOForIQ83BkICjGRQYJY5jw
 VudR6dqLqyfcHTI+JIdt4brp0X2+w7DIJMcSQjzyPWjiZ3bwJYHtHQJXPB/AX3NdBqLX
 GMdvYoPtyQBo00SUguWrO9Px8i073lMmBet82+VCBEppJ5vrJb0bzCMxIVfMe2k9vNUF
 sIgm2en9CL70Qu8VOYq8pV+xJzrJyNyqt26XYxrq/jmZIg3IoLuYM952qe1E4iFYxzLH
 DVlTlhBy69ijOxGCahNgU7vBWSGcJH0QRjL3OwC3CcgITFQi2gmbDlv39gDn4yqwMdju
 qE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730807605; x=1731412405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=on7drxuMpl/zLzNw/Q/x3LtZK2gi8psdoFgoDDfBcw0=;
 b=TeMZjcLH7YI6o+E3Cz6gbV7hfflwfKxhlFF32sx//keknYUSBegS+qWYtTmKFRbBZ3
 TLDZRF5QSG3amFWSkpeQaFz+QJby4nOoOagzKTUT2zxRbtIA1+FN5zLKx7ifH5HFoF7C
 6flhPEnlFmZ5NTrxcBgb5QV5/+8CDm/YTOp+b8kATFHwU3HvWW7pD0NmoVOpG4OwH7zk
 xX0/wmInu1th1Ub9R7Qsm1tKLGsFdjqKHPmvizoh9OdnMyRpYa38MXJ9Z93m+0Kelzpy
 3s61IqtJQh5V9L8uGy6VwNrc+KeQAKT45AY38vwHm5smjOFHDnc+zlretEwJE5K0/DDP
 VOkQ==
X-Gm-Message-State: AOJu0YwZQadxO/Msh3YevkFcUfawN5fuDW2NLXdUm+CAFqwDhVKNmIZk
 bVoQmYdxNQXYv9z7qFWGF29elJz29QwecBzebccf1/Bbj5wYClJZZRBFG2FH6XYiFw==
X-Google-Smtp-Source: AGHT+IGsicu/+zOhzEZ4BefXDyCL9GOmEilHlQBeXLSpA5wZTeAAxlY1WeiHwAfNgrQB2j86UKBWUA==
X-Received: by 2002:a17:902:f60c:b0:20c:f648:e3a7 with SMTP id
 d9443c01a7336-210c6c7048cmr487646335ad.50.1730807604479; 
 Tue, 05 Nov 2024 03:53:24 -0800 (PST)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057d8d84sm75919185ad.269.2024.11.05.03.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 03:53:24 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_ccs: add suspend tests
Date: Tue,  5 Nov 2024 13:57:08 +0200
Message-ID: <20241105115708.682335-1-juhapekka.heikkila@gmail.com>
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
framebuffer did stay compressed with exception on bmg.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index a5d3ff5e6..3e9a57863 100644
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
@@ -252,6 +254,12 @@ static const struct {
 	{TEST_BAD_CCS_HANDLE, "ccs-on-another-bo", "Test CCS with different BO with given modifier"},
 	{TEST_BAD_AUX_STRIDE, "bad-aux-stride", "Test with bad AUX stride with given CCS modifier"},
 	{TEST_CRC | TEST_ALL_PLANES, "crc-sprite-planes-basic", "Test sprite plane CRC compatibility with given CCS modifier"},
+
+	/*
+	 * suspend test has to be kept last because it will decompress
+	 * framebuffers when run on BMG
+	 */
+	{TEST_CRC | TEST_SUSPEND, "crc-primary-suspend", "Test primary plane CRC with suspend on XR24 and P016 formats"},
 };
 
 /*
@@ -666,6 +674,18 @@ static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
 	return &data->fb_list[data->fb_list_length++].fb;
 }
 
+static void remove_compressed_bmg_fbs(data_t *data) {
+	/* if running on bmg ccs become uncompressed at suspend. Here marked
+	 * bmg ccs in book keeping as not there hence it will not match to
+	 * anything. Here cannot remove fb yet since it's on screen. Remove
+	 * will happen at final fixture.
+	 */
+	for (int i = 0; i < data->fb_list_length; i++) {
+		if (data->fb_list[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS)
+			data->fb_list[i].modifier = ~1;
+	}
+}
+
 static void generate_fb(data_t *data, struct igt_fb *fb,
 			int width, int height,
 			enum test_fb_flags fb_flags)
@@ -817,8 +837,22 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	ret = igt_display_try_commit2(display, data->commit);
 
-	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc)
+	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
+		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+						      SUSPEND_TEST_NONE);
+
+			/* on resume check flat ccs is still compressed */
+			if (is_xe_device(data->drm_fd) &&
+			    HAS_FLATCCS(intel_get_drm_devid(data->drm_fd))) {
+				if (IS_BATTLEMAGE(intel_get_drm_devid(data->drm_fd)))
+					remove_compressed_bmg_fbs(data);
+				else
+					access_flat_ccs_surface(&fb, true);
+			}
+		}
 		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
+	}
 
 	igt_debug_wait_for_keypress("ccs");
 
@@ -846,6 +880,11 @@ static int test_ccs(data_t *data)
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

