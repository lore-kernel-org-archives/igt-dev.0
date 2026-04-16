Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4D0F8D75F
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F61B10E8DB;
	Thu, 16 Apr 2026 15:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Raj5QbWK";
	dkim-atps=neutral
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BCC10E8DB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:55:05 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2d96243c91fso1781337eec.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776354904; x=1776959704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCl237S1nQOBfRADIO0VB7hqzxghC+4O6VX37Ly3ryk=;
 b=Raj5QbWKnqNTPKvDP66Q3gLwim6A9K9zsabhLvt6EaXOcV7p1ZVCfogjt8U1LyAsH7
 +fY095zxVmIDpd5mJYuwa0yUdlYLF05TeC76BNagFVFj9cwM2VaVuWfPTNG4wWkPeXWc
 y4scpmj0YJLDV57rt/OH900Dl46W9n4kCqfdhklMSsB2gj0s0+fPwCSwNRp+THsws0Lp
 uX4RpLArSxdDD1RRNvyXzhtT3f5z5ND7HSwKhWNnIbMKkLjzBSsWd2TR+Hg2zKaMdDTm
 MYttVqHZbM/jxiM8tzs39Hry62Udn6VdtFHwKYjJ6THXDy9nROGHAi/LthROCsX9zL+G
 MXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776354904; x=1776959704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MCl237S1nQOBfRADIO0VB7hqzxghC+4O6VX37Ly3ryk=;
 b=MzzFNY8TxgaBLgAdk2I20SDQnWd0gY41uPs/y33BSJf5XXrEgRynDOE2PN4Qxe9d/x
 RipZgxD+BmNJ+giCDOeQR0os2M9avossWj68gGYpjJzUXOoRkayJVF25eMK/NvWmjkxx
 NM1BpKfZF4enI5fGGZ711wl0ZUAb50CRrT6k3rCvKVt+MtzC1uwySSaHdD56gJ+fG8RP
 Q0hYFZrTCAKqwToGTZ1sJs50Yd4D0PKExG5rGgVYcW+xLmjusog4NnAeGG63mFIGbITD
 W+vvXamej2jt2iRqFXpLCYzDYVH4s4uAAlHL5SOSnf94IljsjZ5xH4aeZjcb+SmxlAOp
 Tdzg==
X-Gm-Message-State: AOJu0YzL8Ot4m0tF0UB5WECNfP8sS97gTgscnWVnIuwQBH8AhrAnziJW
 X5ZZE9/nGi0EbpqmNBaGUpqWEJGJbZUH16rJuzzEAOqFSEDP25hYVQvsoCJ5SDCDS+M=
X-Gm-Gg: AeBDietjjMNkSYPaXVfgU1PomTpqwtAO/T4RWlQqrrpWAloPpyW7uHrJXeE43z1kQ28
 0rL732UAisrl7LEAQBlJxyETNWIqdP1svG6ZxJg3XRccfy3iLnnkp8NTR5PE/d5ZvYXFUtFlylp
 V0DwX9P7BJ4f0VenRTHdU4SCG44IAubG5PMUCDNUKEyC5eBV1KVLr/ogz22ATttcu09GQTs6qVE
 Ju8mqXD7ITdJnSnU7BZykbtsoacP2m6VpPRB47yB3nSY5uzl71hc8a3QSn6XmfWfifAjYcTYXEX
 oBohhUI+BiyUmu5tv3uWEdYD0TJVXXIzBlcADSAgP05FLaENlvKyOta8NLdTrXOdiCB8bk1q6Ej
 OgRjTQnUn4IZqk5ziwCCNqQSq5IyAN2+qxKwKlnk6UxHHiQ1f/LE0gDwJ/7DQSquIlKrjur4u96
 gmzgg08lNGGcmQrU/MnWwrgpLh1BCriXr0CW8tVink1ARPn0cDx+uxsxSVhSIxlB7W3KlcBbs=
X-Received: by 2002:a05:7301:1003:b0:2c5:50fe:c795 with SMTP id
 5a478bee46e88-2d58a788298mr16968159eec.29.1776354904223; 
 Thu, 16 Apr 2026 08:55:04 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2de8eb848b8sm7866357eec.16.2026.04.16.08.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 08:55:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 4/4] tests/intel/kms_sharpness_filter: Find mode with
 lowest bw requirement for test
Date: Thu, 16 Apr 2026 18:54:21 +0300
Message-ID: <20260416155421.2000-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
References: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
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
 tests/intel/kms_sharpness_filter.c | 35 +++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 98eb671d1..cf5b0d2c7 100644
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
@@ -647,7 +665,22 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
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
+							 igt_output_name(data->output));
+						continue;
+					}
+
+					igt_info("Executing on lowest mode %dx%d@%d@%s\n",
+						 data->mode->hdisplay,
+						 data->mode->vdisplay,
+						 data->mode->vrefresh,
+						 data->output->name);
+				}
 			}
 
 			if (!has_sharpness_filter(data->crtc)) {
-- 
2.43.0

