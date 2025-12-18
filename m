Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A07D6ACD5
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 09:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083D10E946;
	Thu, 18 Dec 2025 09:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W8V5DJM+";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B2610E946
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 09:13:50 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a099233e8dso3766755ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 01:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766049230; x=1766654030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2dEeI3DOwzwXZevZyuUqnWqk2MT2oHGKx+XjTrif/1s=;
 b=W8V5DJM+Yjb+a3FX89zq66kRJi8vGkaU6UjwERcpt9eLG05g2YUO9wOZ+K3TGOBePU
 gcZ8NMIgmwYUfpcWkoDwW/5rMq00pTLK+QyU6tSDyXeTffdn9eOh0mJ8TG91wknYAi8F
 tunA8E3tNiZK20JaokG3XmDgJsYBuEF1dV9SWKHGstrkIWPthK23g55ZdTYkSRkVsvEi
 jceI4m32OAAdxgZy7ebICtRFi5Iu3T35b8xh+LF7aubKy+OwLmySBUmUo5iI9lDkhSzp
 Ye05NhQ4sB3wNXgDeZTS6Pilg9cCyuxM0OiUgO51hUD/Iq9V54voy/L7OBNo+w2ryWqf
 gzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766049230; x=1766654030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dEeI3DOwzwXZevZyuUqnWqk2MT2oHGKx+XjTrif/1s=;
 b=hQR6q1b5pJmwGgeuUX9hCJbUvKYeFAOad+dmGzVeT5pGabtUib3pht7sD8Yfb/oQ8v
 afIwSYSQEQIzCxFjnM5QI8DEjJilUavdnqY+fKriqqFd9a3UnbvV2YScLxh7Ufp2BhR4
 7EntIExQ6NcdE1bFShIThULoBpPPNEVENbPQBbWxW2W39o9YcEyy09IEi09BhENniem2
 vjokmQ58GPzTHxIYlsqKguTUtm//N0foS3FG3PMxTpGyzxHuEuezxT1p+AfSKt8dd270
 QsFKdkzD5It7acKf0Drue1yRvhfT5OL2LxiCd0akczLAIijDspnWmRJH+Lh92+tM5FK/
 xMog==
X-Gm-Message-State: AOJu0YyVpwwKbxPgRS6JVrESV818VvJGTrs5ZoyBh40URsYWIpLAL0DX
 /m9uLR/+DPMf3tGY/zyP+MLNTS6JuY1i7Hjne0kEz9CSVLp3/kiRO6b6IFqPiBaj
X-Gm-Gg: AY/fxX5ATC1VUGkhRy2CGLzz7RJhe2M6sEOnD5Z14f7sDs6nto/NUxr1iL1XEtMP1r0
 +J//p71p7cYPbjxpOYJsimkr9kfcutpwBP+jr2qBZ9n2rcOrZVOvI7eLycY8CCd04fWWg9woOla
 /lYhWlYlaNRQy5eBdLwfAK06nX6I+MlX9fQ0O11E18rsVCksiApHn7u/w//15xfVXr3ariJcVyi
 dc5S+7HsssMNWHnVKS/yby9bN3MpugFzjUPUbFkk8Lo8TwuPPdABukbxSrlS4HOfq/MpnqBYwSp
 wspIrubgrviX4iFk6kIpUaluteTgIFfh8sf+kjeSJGNj4VgQ2AgC8A4e9y4bmwoNovb/epQ/fCC
 R2rWFJZ1nM1p1cfSzwGhLbb0hLQ5XrISje/sOPahkVBf5VmM1iE9WMSZhDrBm2DlpNhY1T54Yks
 Z9KRCjfWidZ2Rsh85rss4iTRd4J4ilJ0U1crEidhiGCVH1LtQ=
X-Google-Smtp-Source: AGHT+IHP+dvDMvMfm2hA9vEhpx+RNVdDtqGUcidPcCUaib0rpQoRNV+ElgXS4/wZ64mvsJQHepngLw==
X-Received: by 2002:a05:7023:a85:b0:11b:99a2:9082 with SMTP id
 a92af1059eb24-11f349c1eabmr15089887c88.15.1766049229549; 
 Thu, 18 Dec 2025 01:13:49 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061f5412esm6372417c88.6.2025.12.18.01.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 01:13:49 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] lig/igt_fb: fix x-tiled framebuffers on intel xe driver
Date: Thu, 18 Dec 2025 11:13:26 +0200
Message-ID: <20251218091326.341270-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
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

On igfx x-tile was not utilizing blitter on Intel Xe driver
causing crc mismatches. Here fixed that.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0a8299d26..28b1db921 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2643,7 +2643,7 @@ static bool use_blitter(const struct igt_fb *fb)
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
-	       (is_xe_device(fb->fd) && xe_has_vram(fb->fd));
+	       is_xe_device(fb->fd);
 }
 
 static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
-- 
2.43.0

