Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6C8F5580B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6CB10E4E4;
	Mon, 20 Apr 2026 11:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="stjSByCi";
	dkim-atps=neutral
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EF710E4E4
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:06:23 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-12c726ef332so3349776c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776683182; x=1777287982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s50j5YCUpcmJp/z6ctS88mnIBvVNj2ZBmwyXLR1IUjA=;
 b=stjSByCiSRDVgtiosQ7Vy4Q0lR1YIEfenDqkEVmqIvIpt00FFNDLM1R7a8Y7G6STP/
 eTqxtH43UITeOusdZ9pZCAXvyIn36ZblAg7O4w8jzknPiHjKWJjIfWull8fqUiePFRve
 QkkKI2wR3Vtcbnz/1/CkKAsPbuWo28HYbPcZGvb0HqGG0daCdL/2wKUIrZrnretDB2a0
 wL060vmzKusa5Ia9o95dEr4buw1NxNfGLDO9Ah+N2leXcHzFlwBA7mzI55WhwKr44s4k
 CX278Lm8IQ2k/ZMENaA0T806jWp8ydheDlmdkvCqNxocJIj12glm1+yWe+PCvS7G+JQS
 a1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776683182; x=1777287982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s50j5YCUpcmJp/z6ctS88mnIBvVNj2ZBmwyXLR1IUjA=;
 b=qXagtukWSRRtjYsDx+jXJQVOeOl2rihSvFpOwWj3wnY2i1zNRgUyzXVnRMT54fhdh0
 R+H/QM6bVnNlF/KSiJytCr0vqXbdpWZxiTcTaYYsQxsWgu0nj3rWV0bsfqCPvvp4ocNp
 +JJh/Atlh2EZLDJ0/nJJEyoy+V7dYw33bSito5Zbzl0j+hlMIjmzkxkZchmedXjvTHGG
 DuomYKh6QJcba6X4vEnhm6fQ1sLQvUpkWwB0Tmryn+hrLY5VhnZXVSYEveFrQSZSConW
 p9JmvGjvn4XV8oVtypO4/n69yKIB4eo5XR6rR5cAdHFTKsQe8Ock/QP8cQzqAuOuaJfY
 8NCQ==
X-Gm-Message-State: AOJu0YzP5BW/OVN5r5iFFb6xLDe2aYgUfMs0Mz/xV5zsZnKGadVrZma3
 0A1BpLv99sb/styNOTSnOS3DB3r4GFwKPWwy9o55ag7PEFhiECc63OTZNoE7bdrS
X-Gm-Gg: AeBDieu/3N41AiIxZmzwOTMlzAhfW6uJ4kSKPNQgN4+BxbaWH5fnt6BFeft0F1OCDUg
 BnyxThdoMeKJ27IXwPNDYKDw84wv/l4fJf6iEtzE/M5PytuVE5sWdWKHOcgOhoZn68rzcidyzma
 ORz+oDeHYztx7jkWquONQ/OlDjIQvfoWUvx0LFdIUWHveRSiTIzyswv/+O/RU3Mgqt/W4MNt6Tt
 YAfFVGNGsSgB2NcgnZr/yYiolHpAdKD4hjgkM1pjaaFOYOB8CARoOYkHl3fvFAko8KYzabJZxH4
 wi0n11b3jaTYKCyJw/8TjQFZBj53UskHs2A7GHPHLNPeM2WXAUdRcjAVB5o0I4NZFKxcZZPusOd
 5LDzyxtjCGs0ERmRp8U8Q5uVfApEL1rF8d4fZQEDjF//SlZrg9cPIxy2R9udtVYrqLV/JplMMdD
 y+ESeyBMbejAMiwVPpREAkC8mIuVLrCc6b9UpUm/QKbI7iltO7naKw/YDteUVv55KTNMGeCw==
X-Received: by 2002:a05:7301:4586:b0:2e2:27bb:a4a2 with SMTP id
 5a478bee46e88-2e47873a866mr6777058eec.13.1776683181964; 
 Mon, 20 Apr 2026 04:06:21 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2e539fa5c38sm13483058eec.5.2026.04.20.04.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 04:06:21 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 4/4] tests/intel/kms_sharpness_filter: Find mode with
 lowest bw requirement for test
Date: Mon, 20 Apr 2026 14:05:53 +0300
Message-ID: <20260420110553.478287-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
References: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
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
 tests/intel/kms_sharpness_filter.c | 33 +++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 98eb671d1..ff2efb154 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -609,6 +609,22 @@ static void build_test_suffix(data_t *data, enum test_type type,
 	}
 }
 
+static drmModeModeInfo *find_lowest_mode(igt_output_t *output)
+{
+	drmModeModeInfo *low = NULL, *mode;
+
+	for_each_connector_mode(output, mode) {
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
@@ -647,7 +663,22 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
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

