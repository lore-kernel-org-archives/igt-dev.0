Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A21C10F1A
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 14:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B8911340A;
	Tue, 23 Apr 2024 14:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WJxCp9Ey";
	dkim-atps=neutral
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ECC113405
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 14:33:04 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5196c755e82so8082931e87.0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713882782; x=1714487582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9Wy1Dr2+9SI2cs0vSqCEVyJN8aZN8Ovjh4Tm70OXzw=;
 b=WJxCp9EyCYVsoqciNpsB+PP0gUrIzA7Vf9Cz2HcNtqBjXD4HTAmPgyMcVJprkVUyra
 vLvw5/3zA/Xx0Reh1oA08Q2dLTaPSUR2r6FJ8gKI71KI0L3Dm0+dhD80UddIfA6UjgbG
 +6qQfTHiWu4nfi6niMpzTI1dQtAbPc3FABOv80XfvoZBAbkYAQykyFQytiHmMob37LaK
 ttns8AAOCHi+iIM1hNNN1xhBPKYn4AGNVBZC3e7ToOM7W9vRmH7I4T9OsvgEIAKjfc57
 M35smRoSI7eDdS9WaD49mW0GYnbIxyHNnKGBkR7K10mLgzBBdv1bXefEZFOUaY/2XKG0
 NbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713882782; x=1714487582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9Wy1Dr2+9SI2cs0vSqCEVyJN8aZN8Ovjh4Tm70OXzw=;
 b=vPKaI4E74jT0VIBukNwRU/hf0p8LrPr7zkgdlI1F9bgyF++s5qqTpp/wzt3DjCqigg
 IUdknC+iFtmIKpC7OC53vtc7WqKikcHzT+M3juoVfobTILWxWTTozWjujTwGj7k83NSx
 m6S0mjg6dAPj+oGDGpzyMUrUod+WaypciHTzT/8MaTsDn+9UNUIhhABHKeX/Qd+mcQok
 DI4eDRDLeAdtT/ZF9eg3LFLeppu7/bEbckT1r2N/7znqb3U2llDmo6JMVuPdGDSzsN6r
 8yN8hH8YNbYU15uN55BeSXLH44Gvpvj+CfFojQqU30gUCi53xSi/csJDkhN9gYjGSbKh
 mAMg==
X-Gm-Message-State: AOJu0YyJSAhfBZAUpieyNX5WZXyhIv8poa6rpLM1ouHQ98HrexGQ8KeR
 Ccl1MCClVWKZBoZthi7ugz4yS8YySpSo9Kqo2yX+y6iXP57es1+SnMD3Ailfsjc=
X-Google-Smtp-Source: AGHT+IFqilT8kad5S3msQEQ2UHWsVQA7+ITPwe+oTMImmaIQtSzKULv70sZkba9JRcbXK77nimoulw==
X-Received: by 2002:a05:6512:2805:b0:51b:afbe:74b5 with SMTP id
 cf5-20020a056512280500b0051bafbe74b5mr1301043lfb.34.1713882781927; 
 Tue, 23 Apr 2024 07:33:01 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm988781lfa.11.2024.04.23.07.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:33:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 5/6] lib/igt_fb: put intel blt cleanup into its own
 function
Date: Tue, 23 Apr 2024 17:32:45 +0300
Message-Id: <20240423143246.130884-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
References: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
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
index 0dec6ce42..7aaeffeee 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2937,6 +2937,25 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
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
@@ -3077,18 +3096,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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

