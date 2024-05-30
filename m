Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A63C41513
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 14:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C957B113735;
	Thu, 30 May 2024 14:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kCV6/SI+";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD04113662
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 14:20:17 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70232305fecso684839b3a.2
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717078816; x=1717683616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X9hXW+9bsYTDQUAODkqxhIu5NVFlZeDpRCoOena8N+s=;
 b=kCV6/SI+eX0vkv0Bhcakc9cQpyX6tdAIEO74CM6De54RmZHxxfiy75WPaqgOXFP8ZG
 8G6HpMvU3dzcp2ZFJOA4tgIY6aIRmn0wcyGX3Jk2XTf+hic+lWZdDq9YMugqyUdR5K/W
 BvG6mlnI6iRS8c6Fs15aar/oCvwIh5C5NfgQcqhVykPSBD1GQpqtiYqzobHJoMwPSssB
 AYs8bCDgj3CpraU1yp1VZgQYQx4zHcpU4tv2sx06qBm3K/LVRatwpkKl1yMhaO1HUOwL
 /I1WBvSq3arfeBSwQyxL4jcLCgsAxFAcAWbMqAqvxZlcjddC1gmvjBy6XpFQIU6QRo55
 oHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078816; x=1717683616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X9hXW+9bsYTDQUAODkqxhIu5NVFlZeDpRCoOena8N+s=;
 b=rRnyvz7QRRAbgPXMvnK9cZpG3zq2cWyFrow/buGvtQzBwFopjwDBeUpLO662AQQ6w5
 m5Hwk2Zf4giuvp/qMN0WYmI3nWWwmKEZEdMqWHMY2n5XVHOznKikpq+0EwCJeMqVsphV
 pWItjQRvQsLqtJtm/Xio/sumk2TwdURu4MgpzD4jfIViq/u6TjE2PJ4KxeA6P8PYgeik
 7Mt3V0+Tu8RrjoWjF3jfd6xMBQ7rOq7dU97AluqEol+9QCp9hkEItTR58fM6B3Gy2wnz
 tu/uo4YG3HNa7vQlM/dwxG8umvDb/WfWw3IcKqFJkm2C5jwDshg8jvod6JSANsjsJIpZ
 yaVA==
X-Gm-Message-State: AOJu0YytuSccsUlyare3CHzg/uU3ZKcb/FGjNDvjVQLoJGrKoXj0G/da
 jKeybYaNNrMJoiQsjk68pkO/vDCDGsm7rRSETGMQtbaOlKnSf/7XNl+zSciK
X-Google-Smtp-Source: AGHT+IGDY2AOocaP8E6XY+ZE4Rj4DPQEDi4qQVLRL1vRM92NEXfBcYK6ADi4MPzb+4rqEuQYa34q9Q==
X-Received: by 2002:a05:6a21:6d8d:b0:1b0:58e:1b93 with SMTP id
 adf61e73a8af0-1b26452ee5amr2758411637.1.1717078816476; 
 Thu, 30 May 2024 07:20:16 -0700 (PDT)
Received: from localhost ([134.134.139.78]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-701b7cacca4sm4692565b3a.37.2024.05.30.07.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:20:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 4/5] lib/igt_fb: put intel blt cleanup into its own
 function
Date: Thu, 30 May 2024 17:23:45 +0300
Message-ID: <20240530142346.1511811-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
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

make blitcopy function bit easier to handle

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e225b9090..d8608ef08 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2939,6 +2939,25 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
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
@@ -3079,18 +3098,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
2.43.2

