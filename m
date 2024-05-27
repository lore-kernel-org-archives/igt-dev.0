Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3220C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 13:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A496110E2EB;
	Mon, 27 May 2024 13:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBJyr7/q";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200AA10E76C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 13:14:23 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6f6bddf57f6so6471643b3a.0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 06:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716815662; x=1717420462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rUEbh0enqgceii+sCqMguW/A9gEvamd2JoC9cl642vA=;
 b=DBJyr7/q9BFO+AbJrKv7Y5noeYRcmNhSL0SkoN8m0k+VHyai8tuMX6lz+es30cdudI
 t9KTnTg5E0Y7jIZdBDjdUt9P+tsjAOXRcBoQjtQhs3w2vLJILReU4rfghT+aU2dVl3+J
 6B1jnaaxIghFpugfpCMpmfmWIpN1syrxWxFn+Q1ijf1ttGiiXjBsq4ObZk+5i1HrZIcN
 ORnYDaMA/NAckOK0Qwfk8EQ0loPNI/DCjwV24dgYl8fnjjLgblJ+n8XlnMcs2WvuxEel
 dn3mPPmISmgzXogUxYP/LHsRDNmSstWN6K3jTToUhsoLpX1FjhGbsqDAE/qTNkm/y/6t
 oMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716815662; x=1717420462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUEbh0enqgceii+sCqMguW/A9gEvamd2JoC9cl642vA=;
 b=iOGoWn+5am2TNu06y5NxHK15+50eW050yFa0phcoeBMyBf0bO2brf6CR9rqG6sO6Xa
 vm07ZgFYFiqmI2EPdYdHhlUiZNZK71aWrOQ6/F1ixSqrFbLjpBTOZuEe4x+8RkzgG+/P
 VJex6KYQfQ8mNITneM/zGq2ZGdnrxiC0rqgIfmACfcYRFXlpqXRy33oLViwnQHQeQbNc
 Jawe1Cb584SXKHSXMrxWVXJZg++6t0GmkIh+maSpFPu0kRBUU/4era8Wnp90pN97Z7a1
 h4kVhtLgilrsNOAYcs434EirihZaXXtnqoqLWSh1d6UVe+YM0DOr9dyUsJ+//jY1ju62
 WI4g==
X-Gm-Message-State: AOJu0YxAJ9ABbM6LTH5MjguYlmc49/Sx5eMEmeWsQ02vXDuwSsoiNlNm
 eqUOEOYWmtnEdzs3W8UmFIypq6UA+2utKiAFNYgkCT4ZjM0rmEThEm8Pju42h40=
X-Google-Smtp-Source: AGHT+IFXCh7hK/U3/E3vQJs6G0fRjIb7V475zZvo1X6u9o1jez2uV6iPvg2CJkqnZuTAHGTzMYTHhw==
X-Received: by 2002:a17:902:d2cd:b0:1f4:5685:b146 with SMTP id
 d9443c01a7336-1f45685b4c7mr101748485ad.37.1716815662353; 
 Mon, 27 May 2024 06:14:22 -0700 (PDT)
Received: from localhost ([134.134.139.85]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f49932961csm20031735ad.79.2024.05.27.06.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 06:14:22 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] lib/igt_fb: Mark Xe framebuffers as slow access
Date: Mon, 27 May 2024 16:17:47 +0300
Message-ID: <20240527131747.1340992-1-juhapekka.heikkila@gmail.com>
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

Reading from Xe device framebuffers is slow hence mark is as such.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 5df5cb08f..26d6957f8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4401,7 +4401,8 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
 		setup_linear_mapping(&blit->base);
 
 		/* speed things up by working from a copy in system memory */
-		cvt.src.slow_reads = is_i915_device(fd) && !gem_has_mappable_ggtt(fd);
+		cvt.src.slow_reads = (is_i915_device(fd) && !gem_has_mappable_ggtt(fd)) ||
+			is_xe_device(fd);
 	} else {
 		blit->base.linear.fb = *fb;
 		blit->base.linear.fb.gem_handle = 0;
@@ -4409,7 +4410,7 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
 		igt_assert(blit->base.linear.map);
 
 		/* reading via gtt mmap is slow */
-		cvt.src.slow_reads = is_i915_device(fd);
+		cvt.src.slow_reads = is_intel_device(fd);
 	}
 
 	cvt.dst.ptr = blit->shadow_ptr;
-- 
2.43.2

