Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3A7C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 13:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C510010EC51;
	Fri, 28 Jun 2024 13:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KF9eeLeO";
	dkim-atps=neutral
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF05410EC51
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 13:10:46 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-652fd0bb5e6so374438a12.0
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719580246; x=1720185046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dq02EhA+az5s8mvjoT/XdmKviWGsz+nHX0th/MfjdKg=;
 b=KF9eeLeOZOaabk1KNdnetIR7fpqDaikNQ2yQhniuCHBVgItWCJzxmWWXXxBppe9in/
 sGb9elqlrz1JjzWEwlUmfHP2OjMLz+MZUdQv0Z56mxuyoBO2CaZ6t+PMr78pF1HOcQZl
 COhgVjq33n89s11R+dVzcpipRBAGZDYt28FXzMlqzJJiXCcx7xWVFBmN33OTG3fN4Q0Q
 ENvLE08NR6e82Al/Cz3gcHAnzliqvSCGJWVyKZwRbRhcwFx1zntUS65VG+ycSQXeiwGQ
 zTGBbKkSiDSSr+WICUl5lw36+ud4FFqB9X1KWH+lCNE6i52wgIFNEpQmFCesu0OzlBmh
 Dw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719580246; x=1720185046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dq02EhA+az5s8mvjoT/XdmKviWGsz+nHX0th/MfjdKg=;
 b=KKO1KUkYupcDaTG6eP36OIF/TMDjlcQpcPrHYhy4tlLWAk++DF2WDPrB5R0irnoV9H
 O5QpPejJqNHQABuSMBDxQLGR9Xf1/pWPcC5PNnsx+ssyrXUPz8x3f0kOnd1BQdwR70eW
 XL61D/oQ8jtsTLYCUPyqFUJFmB5W0QoyCK8EkBRGQ+zzQhwvGBY45geX/+Hjl/1TGft4
 pxqpL149/h3vLBAVdi3iTRj85M5Yz707DVUOqlTmr9xCZk26n+cjdETRWv5pyDi5pK8k
 PWZMwemM3Id0MW/YZw0Zi/HS9+NX6q0LQ5Aqm6yRhiSyk4FJThqcl501ZFuifZaHL2AZ
 Gpyg==
X-Gm-Message-State: AOJu0Yx6qeo5ol5cL2efKqHtAkTxsDP8Sl//751M8fQiUuzPHAguCEMH
 mSt/rkApSaXQQ0nZ4f/2NkQUziQaodYQLorg1brIWlSx7UA3ZOXVEyUwQHz9y0s=
X-Google-Smtp-Source: AGHT+IFd4HHmlSA50GCtG9A3SbGzohpGx3cU/BZP6j1sLCtUVbAZR6zHX9wQaSf3ieJJic37Kz5QOg==
X-Received: by 2002:a05:6a20:8b97:b0:1be:c258:ce4 with SMTP id
 adf61e73a8af0-1bec2580d35mr7021373637.38.1719580245925; 
 Fri, 28 Jun 2024 06:10:45 -0700 (PDT)
Received: from localhost ([134.134.137.78]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70802664dafsm1531092b3a.84.2024.06.28.06.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 06:10:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] lib/igt_fb: Align tile4 stride on Xe2 as if it was
 always compressed
Date: Fri, 28 Jun 2024 16:14:05 +0300
Message-ID: <20240628131405.2653544-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
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

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab162a5b7..c81cabded 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -827,7 +827,10 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[plane],
 				     &tile_width, &tile_height);
 
-		if (is_gen12_ccs_modifier(fb->modifier))
+		if (is_gen12_ccs_modifier(fb->modifier) ||
+		    (is_xe_device(fb->fd) &&
+		    intel_graphics_ver(intel_get_drm_devid(fb->fd)) >= IP_VER(20, 0) &&
+		    fb->modifier == I915_FORMAT_MOD_4_TILED))
 			tile_align = 4;
 
 		return ALIGN(min_stride, tile_width * tile_align);
-- 
2.43.2

