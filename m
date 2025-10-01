Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EC2CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 18:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC6F10E0E1;
	Wed,  1 Oct 2025 18:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ahE7fihD";
	dkim-atps=neutral
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
 [209.85.160.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BF310E0E1
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 18:40:02 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-4dec9293c62so4710771cf.1
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Oct 2025 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759344002; x=1759948802;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fsYro2W9Th7X9PekCYYDMLXelifU3wBAiFvetBkV6ME=;
 b=ahE7fihD/SJz0rmNeCNX2MLUo6MzykGtOgrKr4c2p8OBeAsyiweZf2jmWFN6zsydf5
 4PpiBI0OiLAyTrfohScy4ZpP1D45nVgq341p+Q76pDJabKniSZ0qIc0jLJANWCSRw0GA
 94r3Kg1DvRdNKE8MJ9vZVH2vBOQ928V24+QYulY1lxJUn3d3Te5fwrOglsf9eoAW/Yes
 +RaNJOD5/nlSPB7iK5qmANXSx/8RS0ye7AXJGmHjtkBnhf4GYMXtPAx+g6rbq0VQIDsz
 czjGpdy48cTDeQWdn59rkx//NChDJu14hqsZ87sQQx+r2Q1kEsxWv1qz1ScX488BYNkt
 h9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759344002; x=1759948802;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fsYro2W9Th7X9PekCYYDMLXelifU3wBAiFvetBkV6ME=;
 b=QVRWEO2c6tmjf7oR7n2nBVBtpK2auXZBf4LUuD9CcxDNSe80W6HZkfpFjXEVypjVOy
 tpDvieauHipaRL1wI2UU57xPWhqL44duRpRjmdm6I9c7a41sU+MtOeiF74Ls6nLgZ4Mr
 TyuFOpEr4CgWYh5Q3BOnAZVlLLNDRfgyrrbHUW8H+YYztFZk4U2Awzh7XuujwBB+Rki/
 z1surKjCP42XbdEyxEa1yProEtcV29jRbz7pVhYVoD3PuXbu8HO6cvVmmt414+rVxkCe
 qVEl1SFhFXuceFSyd/v6BR+DeUOePO+qMXT6y8sNr1LfhbU3u4Qq6iTYTNljHfDXRPBI
 8Dvw==
X-Gm-Message-State: AOJu0Yxjqn/F4Ns5D9PVg0IqI3416ufJZOK+Wc6/A82ipIUXKfjK55/9
 vSn7K8mMEqpjjH5xYpKmzhtV5Q3wwykrASHNu5X94HNgTX6BcpcuWuKbL+aSvPKIJTQvlxtxNBT
 fB0ON2ix1LtvwvQfd2yqduKPnH4TE6covHcXPKmsJYkF0JzzwFN2pnQmaZ0vHFLns3BeJCdmkF3
 +1k8lBXiOD9RwcQO3h6A1I2UVhtKnGfVy3xx0Zyc1j38HC45VRzj3nBxwJqx9223aze0w=
X-Google-Smtp-Source: AGHT+IGjsLYKpe6GVYlMAiXiU2QMOC1i1L3Ea+PFhwcB20yNvdlJsSqiocaQ99mbNocas6fBbTASRb0IoSRE7Kkl
X-Received: from qtxi16.prod.google.com ([2002:ac8:5e50:0:b0:4cf:1eba:f313])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1a84:b0:4cc:9fa2:f3a3 with SMTP id
 d75a77b69052e-4e41eef6492mr57662931cf.60.1759344001501; 
 Wed, 01 Oct 2025 11:40:01 -0700 (PDT)
Date: Wed,  1 Oct 2025 14:39:58 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001183958.3383532-1-markyacoub@google.com>
Subject: [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before
 setting displays.
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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

[Why]
Drivers such as VKMS do not support HDCP, so the test fails on
`modeset_with_fb`:
Test assertion failure function do_display_commit, file external/igt-gpu-tools/lib/igt_kms.c:4632
errno: 34, Math result not representable

[How]
Move the HDCP check before any modesets.

Test: kms_content_protection on AVD with VKMS
Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 tests/kms_content_protection.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 51fc1d3be..effeb66dc 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -638,22 +638,20 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 
 	for_each_connected_output(display, output) {
 		for_each_pipe(display, pipe) {
-			igt_display_reset(display);
-
-			igt_output_set_pipe(output, pipe);
-			if (!intel_pipe_output_combo_valid(display))
-				continue;
-
-			modeset_with_fb(pipe, output, commit_style);
-
 			if (!output_hdcp_capable(output, content_type))
 				continue;
-
 			if (is_output_hdcp_test_exempt(output)) {
 				igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
 					  output->name);
 				continue;
 			}
+			
+			igt_display_reset(display);
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			modeset_with_fb(pipe, output, commit_style);
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_content_protection_on_output(output, pipe, commit_style, content_type);
-- 
2.51.0.618.g983fd99d29-goog

