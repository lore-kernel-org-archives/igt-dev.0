Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5F4C10F16
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 16:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C2B112C8A;
	Tue, 30 Apr 2024 16:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ImZzWNlr";
	dkim-atps=neutral
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC104112BCE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 16:29:49 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2dd6c160eaaso72141711fa.1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714494588; x=1715099388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhMfjRvaYRQm7IT0Q7ZD7Ws80RB8wj8JBcUKnHnjGWw=;
 b=ImZzWNlrKxV50+DMct9c0TCo67TZIcWWAvfB+BEHWTPcfhxtD7Aux54D3H+8m+9N8t
 GbDgsGB0+JDtBDKjFo8imYQGVLZQ15Q+N9zYuJatyiR81gIAYPlg9q872dX9N1b5LZkN
 8/0bFIRN02WvZWQe+vVAjm4ApZyzyvtrmLBfU0tqiJoLQgF6tjMNaf9zKPyLro0UjnM5
 JyRBmZPKm+OlRNtSuLZ/2XX9ZA/l+124l/svY0lb1SE8/vaSTVND5QK6eWGJUc/Sx3V6
 35AswDPP0sUyZPnaTo0lMInXgnG21bO710zXDJd7nPg3PbJB/8M5WMS1gdP8UBUJSjxf
 YZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714494588; x=1715099388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhMfjRvaYRQm7IT0Q7ZD7Ws80RB8wj8JBcUKnHnjGWw=;
 b=uaXb7lP91NatCg274TAtvQ04VvIr3qH4Jhetp8GhcZiSq6zgJJqtjDhpZ/ICLdMYDC
 /9g13xA2v/TWZ8Ezngt3JzocJXnQ6FyOjrc8lwRc9D/CpHTwIWvxrmHWqigs/xRZpXhy
 ku/YuCAEPv5Tkl/g8wP9JTWrwk9U33KSbHZEErWMGm6MzlXi9ZLahNo1eSTeIhtL+z0F
 XSUHCifeK/9y3yEmZErLwbgV4J8HKXcpj5BTtpXx6kBFfKFTsL06Z2oPBcao6CLKCrAp
 VMWE4pVRvDv+PSo+9sJ1zSRzwU3prYrOE0CxW/W5Rx+q3AQhLj9wzSHePP/D68AFj3Dw
 7MYA==
X-Gm-Message-State: AOJu0Yy5yd4PXMwgqoTh8T/84X1dMIWqgWB0HA4ClIwpt1R8ArC/5ena
 2D1XiMmdmh91TuidUk2nEdsmiHnB8ckcaroBkmb5NWHZTD/Dc5iA7xMYdwXYSb4=
X-Google-Smtp-Source: AGHT+IEVw0qcUR/tWNTk4Luqxd2GFfvhuePJ6Ta7Px8oraI1k0UMuo91Fvxedffr+cGPcczrTfcXgQ==
X-Received: by 2002:a2e:720c:0:b0:2e0:e7a5:7209 with SMTP id
 n12-20020a2e720c000000b002e0e7a57209mr181559ljc.26.1714494587347; 
 Tue, 30 Apr 2024 09:29:47 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a2e9b93000000b002e0e410ad06sm302814lji.138.2024.04.30.09.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:29:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 5/6] lib/igt_fb: put intel blt cleanup into its own
 function
Date: Tue, 30 Apr 2024 19:29:38 +0300
Message-Id: <20240430162939.272990-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
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

make blitcopy function bit easier to handle

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 1730f6394..5b4670e8d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2938,6 +2938,25 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
 	}
 }
 
+static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
+				  uint32_t xe_bb, uint32_t exec_queue,
+				  uint32_t vm, intel_ctx_t *xe_ctx,
+				  int fd, const intel_ctx_t *ictx)
+{
+	if (ctx)
+		gem_context_destroy(fd, ctx);
+	put_ahnd(ahnd);
+
+	if(is_xe) {
+		gem_close(fd, xe_bb);
+		xe_exec_queue_destroy(fd, exec_queue);
+		xe_vm_destroy(fd, vm);
+		free(xe_ctx);
+	}
+
+	intel_ctx_destroy(fd, ictx);
+}
+
 static void blitcopy(const struct igt_fb *dst_fb,
 		     const struct igt_fb *src_fb)
 {
@@ -3078,18 +3097,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		}
 	}
 
-	if (ctx)
-		gem_context_destroy(dst_fb->fd, ctx);
-	put_ahnd(ahnd);
-
-	if(is_xe) {
-		gem_close(dst_fb->fd, xe_bb);
-		xe_exec_queue_destroy(dst_fb->fd, exec_queue);
-		xe_vm_destroy(dst_fb->fd, vm);
-		free(xe_ctx);
-	}
-
-	intel_ctx_destroy(src_fb->fd, ictx);
+	cleanup_blt_resources(ctx, ahnd, is_xe, bb, exec_queue, vm, xe_ctx,
+			      src_fb->fd, ictx);
 }
 
 static void free_linear_mapping(struct fb_blit_upload *blit)
-- 
2.25.1

