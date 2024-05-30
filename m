Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93712C27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 14:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600071136D7;
	Thu, 30 May 2024 14:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ippJPPY8";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE4D113621
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 14:20:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1f62a628b4cso1865655ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717078802; x=1717683602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zVH2j0icCFsg4tF0MQepu4yAJtKGXOobJ4jgI6cfS2Q=;
 b=ippJPPY83563hMJgE8oRR7aShvhcTtxqgMe30yQxLOHP5N9cg+VbMKvi/PTGYRf148
 uXmZ0eQFaKU8N02wznr/lzaDWwzUH4fXT1Mw2/fQwmd5sq0v1ue4nHUkZcKHWHpFxm99
 PxAoMQkyQp/2mV0/oc+940JsmuWYdA7B0JR+73mXhx8OAogv53AeVgAhWrd2arMQ8ZUd
 DT4atT+0PspGQcMq6iEvcoo/BgHiYL/ARrBF7D+AyVYCyu3PyefRGEGCQ06Yi5YltL8x
 fnLWxkicE0MgS0OSI0yHUq0lduhuSD20t+5aSKtY9HSAh5nzBHqKdEqaM0Q2i+7SNFDO
 OM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078802; x=1717683602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zVH2j0icCFsg4tF0MQepu4yAJtKGXOobJ4jgI6cfS2Q=;
 b=NjNML+LVHlPdeavGo5hmN/2daqKOq53BjBhDs+oBliWAzjFUwrPhS4gUnzFjcb1Unf
 o55WBQx5IffmcyaaZYppDLgWRde07k4SZk3l/KjmgiivahQFmYQgN1TPRi9xWeKAmyA9
 qX/S2IRGa8Yz6ic94ccoEH9+S4vZMxaR1O6oh34hojKTf5vEk5lV9akTAWxZofM9Sh5n
 8kgmpBEaMlx3rKrgeqitMPXA0uDQDnVAlVkhrJW/11SkzOYJPOqAjsY53V8ZAXi2zH/N
 GmMEZ0qWM9+f3LFcFfGLZXMx0sg2FUPxeKDaLDfbXWDp2/Pm1v47IuxKxfdfYotv5Iyr
 kZsg==
X-Gm-Message-State: AOJu0YzPSzo/sVgOQPy8bwKXFGc/pgM1nmL7I5UljVEcHpPa6ojiofsS
 VtV0R+OVh/Gcy6uQT5F1vTME6HSo31ckMc789vN1gJjnJuoMen05JsncWt3x
X-Google-Smtp-Source: AGHT+IF+kzO4G1WR33P92xQ0Cn03e8+D2Sjm6iryWgtSa4J+QOKQXCwnow1F6K5PNxxs8mCvzEMZXw==
X-Received: by 2002:a17:902:e549:b0:1f4:5fe5:74c9 with SMTP id
 d9443c01a7336-1f61a4e4e8emr30253215ad.69.1717078802086; 
 Thu, 30 May 2024 07:20:02 -0700 (PDT)
Received: from localhost ([134.134.139.78]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f625716ec9sm8882235ad.187.2024.05.30.07.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:20:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 0/5] Intel blitter framebuffer copying sanitizing
Date: Thu, 30 May 2024 17:23:41 +0300
Message-ID: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
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

As is framebuffer blitter copying look messy, here tried to sort out that
mess a bit. Modifier fix patch was already merged earlier from this set.
Here fixed Zbigniew pointed issues.

Juha-Pekka Heikkila (5):
  lib/igt_fb: make blt_compression_format function more readable
  lib/igt_fb: Sanitize blt_fb_init
  lib/igt_fb: separate intel blitter context setup from blitter function
  lib/igt_fb: put intel blt cleanup into its own function
  lib/igt_fb: unify intel blitter fb block copies between xe and i915

 lib/igt_fb.c | 353 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 196 insertions(+), 157 deletions(-)

-- 
2.43.2

