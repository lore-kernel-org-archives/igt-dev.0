Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BDDCD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5BC10E6BB;
	Tue, 26 May 2026 14:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dBXiLCPJ";
	dkim-atps=neutral
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC6410E012
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:36 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2f00a567cfaso6178533eec.0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806675; x=1780411475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JmWRmhCe2/omQF1GVOpN06z/wqZMRxu4zWJY6F/P/ns=;
 b=dBXiLCPJH8g/5kR2gPG3Nj2hIsrJbj49GaNSmG2YFvBMtf/HVCjqc/o1TzMen5bSJw
 E6rIpnO/AAgAni71aiDNfMrcfKbz7ETVbC6V0Ot98RbP9Ioq5gGidowB70CW3s/yRQv+
 RnLaRNPN59tkKRcbxiub/2nyKdueEFsFuhZ2D23bLsqwYe1oXW/0+sD5QQhpOgPAGlC7
 WgJ6dmrZBSHKIyb3ek2A58xEB7l20snUTMXdQWL4os1ZAul0gDqC5kofam0UIBi9gclj
 /JKdFzxxNe597b1H78cMTHk3OaiQHwlksY2gvzhZd5w0jXCB3e/AkVfqoFlxo4k5NUDI
 IJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806675; x=1780411475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JmWRmhCe2/omQF1GVOpN06z/wqZMRxu4zWJY6F/P/ns=;
 b=Z8s0UykVg/CrUj05ipV6EDhi29yivLTAUYWfShADHWpUI2Tq434zFLtvhLBbfPogPB
 k76vu+9XZCmFkgKiExe1+9OBTySEDmvVxJr7g8PwY36V9zTrDHZIiYNm4Re6Ef/ig8Kt
 hGJIdZagBlR7ypceNqTa8v8HzqXja0OQ/DXawUv6gbc3YmHocYAaDpnjxUu/y5AHi1//
 Z32x5NTXr33+UUUsLoFiMXSakyallxQVE3lHyV3Eot42fLrsbB/vU0eGPnkpKcTPGBpl
 XV61m46MlnDlq0cqro/Ak/uEYUXLtmAfQzupe1qAjuzMnk3dVP1k5LoaobEbRM4+byXG
 gamg==
X-Gm-Message-State: AOJu0YwOXYE57U6O0eh/YU42O2b8MecLopA2KMtz7/Wi7+cAU9Sm9H3N
 AebJWf3j4QZUXQlI/UVsj8CjnqmCD3ApNLAW9LYvTRa5oml2u6zDBl0rBIa2qnhD
X-Gm-Gg: Acq92OFLT9E5OPx/K6BrRb2SDenhk5F3wIts1RFG1SY4cTUGaJAdnDrA8f31YAnz295
 chWP+MNYbJRPHezYw4sUXrwfBbfNnlh+zsvKrLDW9owJU8l0i3Y8OjKVfRNGLxcTyCo3sV3sjK8
 v1v85EPL2HrZeI9s99Cf1h0CLW5trc8gZUGMTEES9U+UYoPzJbBUIh6g6O2LTUo/1tY843HsVh5
 cXTQlGMOg299T0t6223Jv9yssQvso19+mnUNVx/UgoIm8hYrlHj3R8GSsT8r0/UisqZ0vRLYVOH
 PaaZ45oTHSTCAw27jl0j6mcEsIEbGY1aZBSOz8ruHtZ9uwPohr7Lpw8s96/3YLf1n9P9xEfiZBl
 scLn2r3okBbnL0ihiISHdov6miVDcaUd2WeAj39rwLkGg0yyqNA3UIORefFRHGHqaGtq+FRSsi+
 IaOzN2ktoPKEny1beJNkcd4ax0TfZY57NnJlA7CEzi/Y4TOnZVJRtrR/6267s=
X-Received: by 2002:a05:7301:388a:b0:304:81b6:fd51 with SMTP id
 5a478bee46e88-30481b6fe6dmr3241582eec.6.1779806675258; 
 Tue, 26 May 2026 07:44:35 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30452230f1bsm10300327eec.14.2026.05.26.07.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 9/9] tests/intel/kms_flip_scaled_crc: add 4tiled p010 to
 4tiled p016 test
Date: Tue, 26 May 2026 17:43:43 +0300
Message-ID: <20260526144343.2531299-10-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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

add test for flipping between p0xx formats, this is targeted
to utilize vebox engine while also doing flipping test.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_flip_scaled_crc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 944dfeede..a25781fb2 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -135,6 +135,9 @@
  *
  * SUBTEST: flip-P016-linear-to-P016-linear-reflect-x
  * Description: Flip from P016 non scaled fb to P016 non scaled x mirrored fb
+ *
+ * SUBTEST: flip-P010-4tile-to-P016-4tile
+ * Description: Flip from P010 non scaled fb to P016 non scaled
  */
 
 IGT_TEST_DESCRIPTION("Test flipping between scaled/nonscaled framebuffers");
@@ -664,6 +667,16 @@ const struct {
 		IGT_ROTATION_0,
 		IGT_ROTATION_0 | IGT_REFLECT_X,
 	},
+	{
+		"flip-P010-4tile-to-P016-4tile",
+		"Flip from P010 non scaled fb to P016 non scaled",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_P010,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_P016,
+		1.0,
+		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
+	},
 };
 
 static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
-- 
2.43.0

