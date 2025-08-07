Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A78CA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91710E809;
	Thu,  7 Aug 2025 07:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WIpefk/Q";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDEA10E809
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b8de193b60so292238f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552796; x=1755157596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zV2BZ2yJr9TqihZP3HfIDLEA+3cYE2Dkon9sHmp6nIc=;
 b=WIpefk/QA6yDgiEBHXomYG5AJ/OQFkMlYCD99a3vT7kv2tJQh6TTGTqFHwjrrpUR1t
 SMmdZRsUIvXsB27/QPDlzyylqKOeOpaoYiQQgKTPawXfBNBwm+l5X9TYWryW6Oyci+xT
 kercs1XQurxeKa131U3hf8CX+TpiwwWjs2sduwd60JLgnazdPNcm7yVcbm7dnVeYloeo
 nCJzzqN/zKKnca9NycHcrJqzwMwNuv84InVlFcyTKMevLBNgbQl0LDZtwUkzAdK6nl6A
 TxwOCISVqGnGnc7mlCjB9Qm9CE9DkB2+Ovxa4djCYpI75q0HX3qSsk9NHKJI7htrT4UC
 ZekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552796; x=1755157596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zV2BZ2yJr9TqihZP3HfIDLEA+3cYE2Dkon9sHmp6nIc=;
 b=rtjt9jAXBBLIzn4q0psr+wRLBf8Nh4f5fp/IkQmjJiDXxDdNg5TLCaGu524TFlVcb/
 cPQk7My1HScT1y3+57Zd3j2+DUow5LSvXsy/GM+eIAUkGAIxarpXweo1M/daOjZffKIy
 r59dbBbS2dNRWXinbbG6To3OmzxOx4jl7IdLfh9kXB/jhWORBEjFOi/UK90MKX38mlLS
 3M1oiq3jPodSl7MDlldGapqsCoY16marv+c5BNJk3YqyU+6e0XJnyz5RR7WKXOMJ+jUG
 25gmYrS4kGre62KzW9ySNWjQz6DQExHl74/neJhHLK5BJ+kkDotUKtlgCtOizG9Ve7RL
 DblQ==
X-Gm-Message-State: AOJu0YyiDdgzPEZ2DfAObyApNGVvc2Op37DMvzq48NyeP/W3lXIK/TX4
 MIUXHyAnCJzKj7Qq8xk0a7AMtJiPoH/WoZkIJPNPyk4FO+i/51W9CxEc4QdRfTHY
X-Gm-Gg: ASbGncsukPYrf6mUGG+ZmvGYC5LQ8IB4dvW2na5/71AhBSueYkaoUhrlcLegpFkg0Hi
 yZij83mToQwYK4scDnFS6V9J74Toyr+GKAeMwwVeWBkr9SFDDz/uP0g11dt/DCXltk46W01/T/X
 gNzcwwSmZigoGWuetSBPv8PkwR+M4jUYYfyaCcHpRDW+SLA7XbcoIVvnbKrDuJI0uvP1gqEmTrS
 cMoLvoUjggTQSSMY2PK9eUWTJw/bCuI/VDXdenthm6zF8Jyf56NndCv6CcnKyvZDyiGaDOkKlq8
 qaJgm2a9sh1o3A3TP0vPKIEjcTjEhXUQ0kvDzgvLMloBkmE/KVbJudcxgIF4L5rUeSpJqncxRJ0
 QgAineWFituvS/bKLbG9DviwvuvIRgQ==
X-Google-Smtp-Source: AGHT+IF5PFwXVMlPHYmBpTU0iD0dEFW966gibLkHV1imPDXR2Fr/1QM6J/tZSZAfh1AccsjENMhglw==
X-Received: by 2002:a05:6000:188f:b0:3b8:d16a:a4b1 with SMTP id
 ffacd0b85a97d-3b8f420ee27mr4094637f8f.58.1754552795764; 
 Thu, 07 Aug 2025 00:46:35 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 30/41] tests/vkms_configfs: Test enabling a device
 with too many CRTCs
Date: Thu,  7 Aug 2025 09:45:39 +0200
Message-ID: <20250807074550.6543-31-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074550.6543-1-jose.exposito89@gmail.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Try to enable a VKMS device with too many CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 54 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 919570e71..89b0c8f5e 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1162,6 +1162,59 @@ static void test_enable_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-crtcs
+ * Description: Try to enable a VKMS device with too many CRTCs and test that it
+ *              fails.
+ */
+
+static void test_enable_too_many_crtcs(void)
+{
+	igt_vkms_t *dev;
+	char crtc_names[VKMS_MAX_PIPELINE_ITEMS][7];
+	int ret;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+		},
+		.crtcs = {},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(crtc_names[n], sizeof(crtc_names[n]),
+			       "crtc%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(crtc_names[n]));
+
+		cfg.crtcs[n] = (igt_vkms_crtc_config_t){
+			.name = crtc_names[n],
+		};
+	}
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1195,6 +1248,7 @@ igt_main
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
+		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 	};
 
 	igt_fixture {
-- 
2.50.1

