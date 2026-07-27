Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72FCC531FC
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 14:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C6D10E407;
	Mon, 27 Jul 2026 14:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="N+MdpoTl";
	dkim-atps=neutral
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CE910E407
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 14:22:25 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-522de3c645dso57244461cf.3
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1785162144; x=1785766944;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5AOaiXt64kIRdQ+Fpsmt3WEX/NI9li2UT8pItgyD/Cg=;
 b=N+MdpoTlOIQH3dVXvaE+gi0SUgWCsXwtPSxol3dn1761dFDKH2X+wDCjslYtVsUMng
 1Z9kVb6p0KYTRKqLTy/QUH9R91Xdj8PsytjToRm1VDOa+dI7Y1Z49Rs6wnt0t7t0hczY
 2XzcMAJLN4BfYjLu3/btWVc7TR+X0zmj6wczL90As7Hyn1VFgtHbvsM3m+dhH/XgDoNs
 5fhOmKvLyud14mpwfFRiZf0auDviPZJx42Ck0bUmCKQaDkaLLi30s4fqSjGhi/9OiLoG
 /1o3edPIKFETFSONkFLS9/2dXTaGUGX8sKlsIauhC+FD+qPQVCvKt6S/jfv9YxpCP9vX
 B1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785162144; x=1785766944;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5AOaiXt64kIRdQ+Fpsmt3WEX/NI9li2UT8pItgyD/Cg=;
 b=r7pGSTNtzPE1gpvILMr3Z5WBo+pSyRaGzK0/ju+/IR5z1/8CYd1I2ZGzGLwA29eG9n
 eFn+hNxwIy5qjcHRS4j2tAuaVggsdgvOu3q46jyjNIVF9cHgpNoipFfxjBYPQndhrcQ2
 GsGJxinewOeW4ykClG0h9yNekpHklB5/7yUMFGv1O/G7k4tltQMcx9mQWnG5AmOtjV51
 kHoK7EGsu/YzZZvGODvaI/aBkrcmfvfZbrX82C51JEW2e+u5Ws/vfI9OvT0xPl3xuIdP
 zYqHr63k+v74HtJbmgwyL5cjPVdgQwDGRT3grL1qZfsctvU+/gY8eotRWNzsNY9SasP2
 Qq4w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUcBCJisQ0YNRpGqJ8uoezoujPFeq9rjn6xJQ3G47O9KYCLAVbX9w+8Rb5MENUcuSpade8jGsb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznguUZ1jKkwytM9CTOG2lis3MirIn9lCYpmNq8Ki5Rpz9Fs3Ao
 HZDF4q6yqXquyyTAsLvo0YvZwcFQYKKSitslTg0RaUJYRNYpbF1JrAfT1Mu0hAroSHGPVQ6llBz
 uAfDZht+FRsAcQNdDDhNTSg==
X-Received: from qtbne19.prod.google.com
 ([2002:a05:622a:8313:b0:521:9803:e17c])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:11cc:b0:527:2b06:2bd4 with SMTP id
 d75a77b69052e-529a8895150mr90419111cf.85.1785162143317; 
 Mon, 27 Jul 2026 07:22:23 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:22:00 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260727142200.3042096-1-markyacoub@google.com>
Subject: [PATCH] android: glib: add g_key_file_get_boolean stub
From: Mark Yacoub <markyacoub@google.com>
To: louis.chauvet@bootlin.com, igt-dev@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>
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

This stub function is necessary to allow IGT Unigraf dependencies to successfully compile on the Android platform.

Suggested-by: Mark Yacoub <markyacoub@google.com>
---
 include/android/glib.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/android/glib.h b/include/android/glib.h
index 0b6658287..aacfcf138 100644
--- a/include/android/glib.h
+++ b/include/android/glib.h
@@ -55,6 +55,9 @@ static inline double g_key_file_get_double(GKeyFile *key_file,
 	const char *group_name, const char *key, GError **error) { return 0.0; }
 static inline bool g_key_file_load_from_file(GKeyFile *key_file,
 	const char *file, int flags, GError **error) { return false; }
+static inline bool g_key_file_get_boolean(GKeyFile *key_file,
+	const char *group_name, const char *key, GError **error) { return false; }
+
 
 static inline GRegex *g_regex_new(const char *pattern, int compile_options,
 	int match_options, GError **error) { return NULL; }
-- 
2.55.0.229.g6434b31f56-goog

