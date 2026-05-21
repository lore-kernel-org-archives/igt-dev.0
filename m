Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35BDCD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 16:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D6F10E4B6;
	Thu, 21 May 2026 16:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ecq8hjwb";
	dkim-atps=neutral
Received: from mail-yx1-f74.google.com (mail-yx1-f74.google.com
 [74.125.224.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FB210E4B6
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 16:44:07 +0000 (UTC)
Received: by mail-yx1-f74.google.com with SMTP id
 956f58d0204a3-651cc9f2261so12346579d50.3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1779381846; x=1779986646;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Kw0q0F9VIZZUaXbeT8QS+CMbzXPUjPtdAApXiP8Jb9o=;
 b=ecq8hjwbWTzsJRr/VPvq4mtT1ksO0IeBnNUgUnNAe7prtQ3FVVfkR+lY0MJTSVU9Qx
 yV3tD74gSZOXSgwrCyLq3DFmUPIRwAuRNCxSyPJ2QXKzqBDCa3BiVYLS7ghTTVJiTBlI
 efwE6SYdKSgrYT5Z3pjafJhJpBgDYML0CM9boC4qgVNQvxJID7nrq5ffSCIs+wyGUJsk
 18HacWZNocRIJbmwPLj8cEAmdaRi2jwiwcge1+jadZTCDfFoMZvFycuZWybg5jWEMjC8
 8Pd8fMauX0zmCfqDqCg/Utr6yPOEcrJm22n47+7fE5O8glErr/8BT7rUyzX3WH2O++K8
 n9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779381846; x=1779986646;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kw0q0F9VIZZUaXbeT8QS+CMbzXPUjPtdAApXiP8Jb9o=;
 b=aLfGyMUfvcebhHKAYLcWLr7DBN9C998kiGsF3wS2ueVN9x0qU1T+Y7RZ4sn0kYPo5Z
 pDrLUvs3Rr+DV4D57UwpNIiqxH0vb8bRNAiySXh4ieU9pEvlf3XmMX29xg9xj3Fnsjxs
 z39iFvyII0Gn4HXLk6WeEAg6VG+853VWHvSRLXvVRVOnmYuKMAc6ExffmRST+3XmJaUj
 RmQI77aVd/ePaa+9/3+oJy9YfYS6E5K18NpCbssq6SQJllVWzt5MJLJ2+zvILZlb8dZQ
 uEGiXViCvZhW0+Lo393A6jvjqereRWE2JNg2eqe1d8nDoXLTyFTxKbOcA+ly08hoa+A0
 uyAw==
X-Gm-Message-State: AOJu0YyLf0yJLFrh+BOi0gp3i0AvjL4ZNlp866wNpLynj6sX8oDBKv9X
 Yenq2GIqrBXRbRpHx4dZzv1nIH7UN1NHEm6Fld0zAynxeP4kIUI0C9AwzmGGapg8UT7xM8W7TDn
 142Xeau+4BbIWl+hv06uuFn/5qPS5/o3oxjRTSx/t3OKb0/Vk9VunKYRkUp/BzW30pu12EX32T6
 Yomylacs/uH82elhUYEI/selvB7tDadd1i6gF8ojMvluQjhKx4+KyY6FnNe0uEKLQepNk=
X-Received: from yxbbq11.prod.google.com
 ([2002:a05:690e:21cb:b0:65c:6d11:c459])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690e:124e:b0:652:ddea:1679 with SMTP id
 956f58d0204a3-65eae024bf1mr2962087d50.16.1779381845723; 
 Thu, 21 May 2026 09:44:05 -0700 (PDT)
Date: Thu, 21 May 2026 12:43:53 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521164353.1111422-1-markyacoub@google.com>
Subject: [PATCH i-g-t] include/android: Add g_key_file_get_double stub
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
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

Add a stub for g_key_file_get_double to include/android/glib.h to
fix build failures in the Android environment where glib is not
available.

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 include/android/glib.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/android/glib.h b/include/android/glib.h
index 660386ca4..0b6658287 100644
--- a/include/android/glib.h
+++ b/include/android/glib.h
@@ -51,6 +51,8 @@ static inline int g_key_file_get_integer(GKeyFile *key_file,
 	const char *group_name, const char *key, GError **error) { return 0; }
 static inline char *g_key_file_get_string(GKeyFile *key_file,
 	const char *group_name, const char *key, GError **error) { return NULL; }
+static inline double g_key_file_get_double(GKeyFile *key_file,
+	const char *group_name, const char *key, GError **error) { return 0.0; }
 static inline bool g_key_file_load_from_file(GKeyFile *key_file,
 	const char *file, int flags, GError **error) { return false; }
 
-- 
2.54.0.746.g67dd491aae-goog

