Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F810F92EF
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 19:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6EA10EA91;
	Tue, 31 Mar 2026 19:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QdPMsgSQ";
	dkim-atps=neutral
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0489210EA6E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 19:04:54 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-12713e56abdso169920c88.1
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774983893; x=1775588693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VVy+DKodFEDWMukOqWzpa/88K6AA0OTZjxDJZEG32U=;
 b=QdPMsgSQk0+aYa5WpBwR57teBOu7JEsaZHDRyND5ou4tpD5WIV+ZcIWNeZ1F12dxDE
 IZG7KklDxUefCDK4U2T0xzhWAnz8I4smMnWJFAZzX3MYMiOIrf9vOny/05uSFRkLtw0H
 iOyGzlKNcxAiTSpxm8qoV11qoj67CPCKZVT4FaRMPCrsjF5lSW6llfO+R8/RetWQkokD
 tSyHZy7d3REc7NAKKI9KrY/FEBEzZ7hmE6O8YlBarzZJvrhkG0o89TpVW+taDGdiO2v6
 kk7yt1laZxZogHvEtRKrN3oByDV5TN1YFwkMy1dbH1XrN5hhMYHO1ZEy2raGVC98E+OE
 6JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774983893; x=1775588693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6VVy+DKodFEDWMukOqWzpa/88K6AA0OTZjxDJZEG32U=;
 b=biECqLbp51aOgd5QBfxcSkvVVpAOfH1B5iAqd9ApOoTAI4lbvNBUxApIvb+Ixl+/S3
 DENlKOvmNq+PhAHugGSC1DYZWgHkmoC/OThIZq8sTHIPXfZAk/yXQmHIwM0PHefx0Jiy
 6hS4QuYFLcHl8TgJ1eOV+4BRMcwSvKzux8lpDAgqOofKNUbVnTMXgt49RxBNvAuBOTiN
 vohe5gUMH14Vnm8Uw+1EpXJgz8T2BrakEol0yIpAVi2W424dOxLdSGmtje5R0OS9Dm7A
 dpQ2wJoSAjYMx1pB/0HUpFHQXkiUE9blAXXs7KHUR3rjdv9hiqaEt9zAJQwfmmkKjb47
 zAzA==
X-Gm-Message-State: AOJu0YxTVvqtpIf70IrEGxqLOj+ujfpEl+ZO0mdHLCVeJjDrRt0NSlaq
 Xab+xRzUUab6jwZ2DouwSLo2CYAF7kH1pMAfZQFBIxf2jk3v76pXhCQ4hQplzZk0
X-Gm-Gg: ATEYQzxsWn0wBaLFN4Q6fF9oeF+Mxal9vvA+mg3jfuEWQpuiaVkuY7PN43KLLi9kLgo
 8Mf8+PhLjYv4hN0XqtTxA2L+l3IM1co7F/HJKfgkaLBYkFDRBaScdTwbjB5xu2/+S1TfGBD0LXZ
 SHbyiN281TU6j164oM9sNRtq23NBjB7/GUEUS+cBshF0+dtMUS2k1d+/MB8mD9y2xN7b/PbftIb
 zzgTKuwBDypdk38p3hWkvps4SO9bdGuxYy9yGndJWFOuzGmszJ7iMa9eN0l3Va4wFWOuUiPMmlL
 2+y31gfAIB3uk2se/jSHqoarkTm2q1p8DjxqXXjBCLjOYfnGIyqQb2MKJW5NciPgjyhl3fXQ6FC
 AmURzcpxUZRSX1JcQ1MvX78yOtpJUrY8i+pu/OiSsL5ySWWbNXlRdNVjsQAbI1cZ4P9P8E/sLKM
 EalL8EGyA3akzryV78ZPq3VrU+++DhuNHF5pxGLxckk2qXfiOfe3wRECxZ29Y=
X-Received: by 2002:a05:7022:684:b0:11c:883d:1ef0 with SMTP id
 a92af1059eb24-12bddedccdfmr2300418c88.15.1774983892945; 
 Tue, 31 Mar 2026 12:04:52 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12ac4a0fa8dsm8025112c88.15.2026.03.31.12.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:52 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_sharpness_filter: Find mode with
 lowest bw requirement for test
Date: Tue, 31 Mar 2026 22:04:12 +0300
Message-ID: <20260331190412.1907571-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
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

choose mode from connector with lowest bandwidth requirement
for tests to try to fit tests into bandwidth limitations

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_sharpness_filter.c | 34 +++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index f08d33d7a..10061b5d9 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -609,6 +609,24 @@ static void build_test_suffix(data_t *data, enum test_type type,
 	}
 }
 
+static drmModeModeInfo *find_lowest_mode(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *low = NULL;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+		int pixels = mode->hdisplay * mode->vdisplay;
+		int low_pixels = low ? low->hdisplay * low->vdisplay : INT_MAX;
+
+		if (pixels < low_pixels ||
+		    (pixels == low_pixels && mode->vrefresh < low->vrefresh))
+			low = mode;
+	}
+
+	return low;
+}
+
 static void
 run_sharpness_filter_test(data_t *data, enum test_type type)
 {
@@ -645,7 +663,21 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 					 data->mode->vdisplay,
 					 data->mode->vrefresh);
 			} else {
-				data->mode = igt_output_get_mode(data->output);
+				if (is_invalid_test(type)) {
+					data->mode = igt_output_get_mode(data->output);
+				} else {
+					data->mode = find_lowest_mode(data->output);
+					if (!data->mode) {
+						igt_info("No mode found on output %s\n",
+							igt_output_name(data->output));
+						continue;
+					}
+
+					igt_info("Executing on lowest mode %dx%d@%d\n",
+						data->mode->hdisplay,
+						data->mode->vdisplay,
+						data->mode->vrefresh);
+				}
 			}
 
 			igt_output_override_mode(data->output, data->mode);
-- 
2.43.0

