Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E152AC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF8010E2BE;
	Wed, 28 Feb 2024 14:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OhuT6FeN";
	dkim-atps=neutral
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97A410E2BE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:39:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-512bde3d197so5193703e87.0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 06:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709131150; x=1709735950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2VJz9sTTVg5ARwte2L7ARJZilhv43kLsUzNL0wQGdA=;
 b=OhuT6FeNILYOwXUoFK+5T4SMWE01kxYfgCB63HTEfyZQe5IWdhzVZan/YItqaDklIJ
 0OYRpdFN3UJlUSFF1/nd+CPDsv/1lgB+ji0ypjC4ihxR49zg1sHcsxvZmBEvIRhzgJyS
 l0ZTNXQ6HKwnd/wrCx+pZEISpxQ9RunGBz7OGJoiLrzUq6D0kNy9gXmhrVdUc2REcIGh
 pKk1rk2kn/MapgkLjzED2oJZb2nc2uKItFxpSvbC/K79UYnG9727LMz3FHRrI6RbDuJA
 Lflxy0ngkEhO93Zus8NLu1++eZVW7T+IPjy6VaRbuNf0YoilPuo/tBbvmP4XbaoFaJaF
 90jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709131150; x=1709735950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q2VJz9sTTVg5ARwte2L7ARJZilhv43kLsUzNL0wQGdA=;
 b=pFwrLOFDdOzdtwuTwtxCtimpBPTRbhetOuulzEMffxFdXTOB+m6T5nPnw4kyBwgudZ
 cEvrHA176QPbFIZuZDyU4AbwjhCfavxOwlkUgUk4DWHZ6kCRsM+7iyXlU4cUQFYn3kUc
 FV2xjHOIKR9LIcLWa6t3IH4f7RKkYMQTV2v0tyULEsaFNqWBNZaBKWCAmB4pzib7gqUI
 5CWV20/OZaRD/TwRE181GPG0Yj5zrYpgYkG3XdqjE1f08wvozI1cwTHRY/E9AwUxeJv7
 JOLjq7MD+QvO9EzwG030dwVEM0kVNWdpyphwVQFjRfp1JPsAQh22UgDFn7M8hQpmaciW
 oX/g==
X-Gm-Message-State: AOJu0YxNGPUm+GiTkE7lxQ/K+FKIFUV8DqpB7vxSmrAQWYZXqIvFXZUW
 qEUksgbLBxmhVZA0sx35GjSYbec4lW7sEQEzPN2mUm3oflTr99IqZisOU20bGxpaQw==
X-Google-Smtp-Source: AGHT+IG+I0VaRKQ7HDAit2gw3lcY3ikoaZcxNyBInhiCsdStWKrGr1ggaN8/pfTZLw/EkbQ80519yw==
X-Received: by 2002:ac2:4c2b:0:b0:512:b437:4b06 with SMTP id
 u11-20020ac24c2b000000b00512b4374b06mr7553148lfq.67.1709131149657; 
 Wed, 28 Feb 2024 06:39:09 -0800 (PST)
Received: from jheikkil-mobl1.. ([2001:998:22:0:f002:e367:ff56:e1bd])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a056512052e00b00512e3b51bffsm1558320lfc.35.2024.02.28.06.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 06:39:09 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] lib/igt_fb: on Xe device don't apply legacy blitter
 rules
Date: Wed, 28 Feb 2024 16:39:04 +0200
Message-Id: <20240228143904.859714-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
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

On Xe device legacy blitter size rules don't need to be applied

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 65e0638c2..0ac2a76b0 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2513,6 +2513,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	     is_gen12_mc_ccs_modifier(fb->modifier))
 		return false;
 
+	if (is_xe_device(fb->fd))
+		return true;
+
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
 
-- 
2.25.1

