Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFDCC10F16
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 20:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1330C112D72;
	Mon, 22 Apr 2024 20:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mQWwCVrd";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17924112D6F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 20:45:07 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51b526f0fc4so1533541e87.1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713818705; x=1714423505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2N56EMrAHn88gNyvmxgIRvHnpaeUTPAY12Upim3zg1Y=;
 b=mQWwCVrdMCvflILcs4rvKSasj4oTEznv34G+mgBRg692v5IrCpbolPnH1WoMQc4z74
 KZVv8Fk6M6p6CVzvAH49XAxcQzQzHw5jOMCTlxsADXK6FnJcF6x1Vc7Dv4QsGOrv9HIA
 0xzus/Vy1e1v1BWzJUNxLLGbcjDWVSTXJopLWst4vAnFcIrkhy49zROfThRLbmZCiqbk
 XfGhPBuK2wgzKdjpECr3OJNBf4/YdvfaQRpSBdAvyRob/RUGmxCwwyaoXT+N9ZHtcIfD
 Ade10vPsggM5aoWgrDYqSIP7ygTX3rce623OKeovx+ZcFA6UJy3Lox4T40MbVHJG4bq+
 qyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713818705; x=1714423505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2N56EMrAHn88gNyvmxgIRvHnpaeUTPAY12Upim3zg1Y=;
 b=Vq2nRG+hGfeXFJgA2KEjH2JJHR8LXkhO6svjXoNiD396795gJg6dgVTIqElRBl653J
 CCLPrmd3vSyq1NX9iZ0VuTy48aO6sTHagZiTKmGELEC0HetmcQr+JBdEq0xNCAsnQO1n
 DhoGRX4fvwRYrn59RG0km1ZP+/ZFxsLUIqjchzG3nrVQ/5Svc4WoEn4KU8kdOdJWclcC
 tH5xVGzJpImiOR1Xs2rIoT9zyspC/cJcer0LjT4iqtj8yZx6qxIK1qvA/n9TmGslxXRl
 Rgd+N74rA+XxUF/t3MfNltujuHBv4CMeyK2+juBGW4B+O7QqPE4+vygSigN6cdA4baY6
 aqGw==
X-Gm-Message-State: AOJu0YxwOSxr0XdZaxUuhjmij6JeG2dGHkTmDpxNFF8kDiBc02TvJ1hS
 ydgjaV8PXi2tpQIAfEiKk0Z22TbfE3o8TgWd+hICoQiOC9+vOkNQ+NXoJGR5QVs=
X-Google-Smtp-Source: AGHT+IFV8bthRhK9RnsRUcRPwFE7BUGg2/uqE5QFd4kpdibPqFiTm6QrNGadGwTElqNjqx5JNy3GRg==
X-Received: by 2002:ac2:5f63:0:b0:516:d14a:9692 with SMTP id
 c3-20020ac25f63000000b00516d14a9692mr6014082lfc.6.1713818704753; 
 Mon, 22 Apr 2024 13:45:04 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z9-20020a19f709000000b00515cc918069sm1816413lfe.150.2024.04.22.13.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:45:04 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/6] lib/igt_fb: put intel blt cleanup into its own
 function
Date: Mon, 22 Apr 2024 23:44:40 +0300
Message-Id: <20240422204441.106197-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
References: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
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
index 50ca6b81d..fed9c7339 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2934,6 +2934,25 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
 	}
 }
 
+static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
+				  uint32_t xe_bb, uint32_t exec_queue,
+				  uint32_t vm, const intel_ctx_t *xe_ctx,
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
+		free((intel_ctx_t *)xe_ctx);
+	}
+
+	intel_ctx_destroy(fd, ictx);
+}
+
 static void blitcopy(const struct igt_fb *dst_fb,
 		     const struct igt_fb *src_fb)
 {
@@ -3074,18 +3093,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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

