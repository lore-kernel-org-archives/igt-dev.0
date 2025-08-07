Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC7C87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB3410E0D6;
	Thu,  7 Aug 2025 07:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZvtxEir+";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA6310E80C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:42 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so297177f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552801; x=1755157601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHddlexvX+IMLMaelsBHM52uIAaoJgtAClPr9qbD2vg=;
 b=ZvtxEir+WP+8KwC4b8DP83D/Nu9NbuLzZ67EzGMYZ1brimDApLKHPIRvDqIQbQax4a
 K0lbd7TBdkEyEo0efrCJLkcRzBLoXjQLI87U5FaD0hIaWt2+N3aP5rZzkt7sICxprk3d
 S5mLBWfMJPG6LQkSVAjc6oLK6XPmBZihQmN/jrnBnhZojaScKSCA/0Lo730Wuc59PVCO
 MgKnUNsSh+B7aZh8Qs8ayICdFICV7LKLMQgO0cVCgku19h9mkbBlx211M8vLVZFSNr8R
 TF/ZwAVpJuFVHsC9s0De2TvCkF5FBiCQ2pYbWUOs3612sx4/KL08iB9ykDtzed8sKKy/
 myYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552801; x=1755157601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHddlexvX+IMLMaelsBHM52uIAaoJgtAClPr9qbD2vg=;
 b=gLpMNM3Q0kYLGQJ24+roJJJYwRozGmpaC6H4GvaFqhUWiWyuiT7NdBqgz+7QOKagiP
 54rWriyMEK/aV/Dsl/w/8XjX4MnYu+wBpZ1q5dr0AMMIlTv4uEIOZ797SAmcojzqcHhg
 Y4N8bOYk0SBEA1kEGEvApjeJwWtZAV05aOwe+IxAmgfNjc2Xf0zdhk61UGrnpuqGn0SH
 uKQO7znFVrCONtYLxSdgESakjRYkH1hOA4PwpFEqlMwFlpnrZFBJ1HdkBcOBCp+gF5gG
 4Sl7goBD3+9dXOxaWbP85HajF9eK7llBRmuixaBa5P+iDAEwp9RTkSbgUrRKmK3iVeWQ
 KuYA==
X-Gm-Message-State: AOJu0YxAU5WLdIt+JlqDFzlLkpOsUiM3pG8PcKqjTt2p1vBQxzrjAmR6
 GIascrFtLYFItGvjMODZC53onhmB0OMLb8Hw2Uu1hw2yxqOSyD3DeoF6zR6A+SNd
X-Gm-Gg: ASbGnctxU3EfCi/YMM78SY2Mhd9ZjtBLSHiSLDMo0xV6ADfHGoaHKuj2jwStxBRQlXd
 ic4je1Ene4ZBtnEvuMdbIgIlCVDyFxGRzon74zgoTR5ScTv1g4TVxsq+KKowXgHQq/eFnA7dtZb
 BxQJBxBE2ZGf+ftfacCEs22X/rxabSae/jE1fkYBkuUvno+zeq/SayXdR0DfwSwBaIKlo01/n96
 ydhz2gnMLJEvpeF3dheu7P7G+hrNLDKEHhE27JfmAtan1uH41b5wEJ2I/8RHg4Xw03SVoUjyYI3
 NhwqwOqfi3fqbMd5PisLiJ0o6sPWM9h5gY7zEGaau2HOFrXd+QoMD0JinXjchI/LLVaaWvYJj4R
 WISWz6xyPQ2p1ZiGFhj4=
X-Google-Smtp-Source: AGHT+IEOcxx65KmF29vTth7fINXTbFXma7uz4gFoo2OmpskxjuC5pdnL4D4jadIgG9XJ2m036O5WBw==
X-Received: by 2002:a05:6000:4011:b0:3a4:f975:30f7 with SMTP id
 ffacd0b85a97d-3b8f49402cfmr4555486f8f.56.1754552800698; 
 Thu, 07 Aug 2025 00:46:40 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 36/41] tests/vkms_configfs: Test enabling a device
 with too many connectors
Date: Thu,  7 Aug 2025 09:45:45 +0200
Message-ID: <20250807074550.6543-37-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many connectors and test that it
fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index d9cbc24ae..466b16a62 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1441,6 +1441,57 @@ static void test_enable_no_connectors(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-connectors
+ * Description: Try to enable a VKMS device with too many connectors and test
+ *              that it fails.
+ */
+
+static void test_enable_too_many_connectors(void)
+{
+	igt_vkms_t *dev;
+	char connector_names[VKMS_MAX_PIPELINE_ITEMS][12];
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
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {},
+	};
+
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(connector_names[n], sizeof(connector_names[n]),
+			       "connector%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(connector_names[n]));
+
+		cfg.connectors[n] = (igt_vkms_connector_config_t){
+			.name = connector_names[n],
+			.possible_encoders = { "encoder0" }
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
@@ -1480,6 +1531,7 @@ igt_main
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 		{ "enable-no-connectors", test_enable_no_connectors },
+		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 	};
 
 	igt_fixture {
-- 
2.50.1

