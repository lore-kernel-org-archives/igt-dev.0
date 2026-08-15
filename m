Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93353C5AD5A
	for <igt-dev@archiver.kernel.org>; Sat, 15 Aug 2026 14:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2A910E0EB;
	Sat, 15 Aug 2026 14:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YszdfBGb";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D72A10E0EB
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Aug 2026 14:22:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-482938466a7so893149f8f.1
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Aug 2026 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786803745; x=1787408545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=U4vyfapwjq/in4fK2WW1HV8yASvsMFUfBZbC5SKu6xo=;
 b=YszdfBGbnrs+Q4xQsXZMtJ8JisPdLVkUKWDcioaml9rcdoqk/gAp6g71OICQ2h9uZ9
 StjjSmy2KDi3u2hcqw7HqQz6sLyIRw2myAa1c51qT2uwPTga3VPOfDKOSBafqVKKxmod
 iLu6Fy3xSPoDmgOuyn6/xNK58Yc08Q71rG/6z0AekW035eiqSW217SEv4drbNhJT9gdx
 GwWXGhJDYPFZ1O9JKLHJJSQ9c+R8eU1XsaamtrBrDZrCx3rb4QsR5SWykQKYyJz3nh8j
 fiKtbpHULTG0q/+TL9vL9G3b8FmtMXVol+cosI0rN3hHHg46opnKgNwN1lIYJGGniiLS
 giug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786803745; x=1787408545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U4vyfapwjq/in4fK2WW1HV8yASvsMFUfBZbC5SKu6xo=;
 b=n42QlF2szFy0HKlvk3ee9H+63PXRwNxPB4hcvZoA6UYB4/1zBn6n0cl7yZVYO5LVvJ
 8RO7Lm9AqHooSiSu3IXcWzJUY07f3E7yOLyjKB/XgjdA5B22Eda1K01Y2Jwi7TiBhbAp
 FIPAbuP++CH7a9cBh+8ZGWwg6z413RrKRDbCpBi/C3vrWtu6tugK7nVpLl3/1CyYn4oq
 qc3jijGw5Q5styO2i8ShcyGCTKBSJWjnaXH7kwpjg9xU77vQ93NCvJcpywq6uZyv/54U
 DU9Hoo1mUwA4XbmX/T5bnzFKBJ7ReuiCJVWfGTdp1PsMyK6A0pGCF7eTGVLYl1XsLYG9
 CoAw==
X-Gm-Message-State: AOJu0YwqTkl4SK34fIq/avm2B2CYvEj48CDDL+v4I3/xlNQW4XQk6E5f
 0PtuXc2lalfZwax7P8nuc0F2JS612ERneNlkq6oZ0Wo3SMNBrFUCAI9gaUZCKQDk
X-Gm-Gg: AR+sD139OLhmJ0qzINBxLMvvQI1V3WRv+90UYkTvFL50InL8kkB+KN2l9Ypo5PqDc1W
 qS0KSRfRA0GlUG6tG9aa4AYoZGun/RSZnySoJO3AH4cGFmmrGJcWY0LmKiDf8VsWn4uqJx0Mho7
 FnUCRQYq2pR0PEEzhy1gb7JfotHCkyJ+oF0KsmVvpRJUhjbEQgW6qTsypULkngEHmcjVSjRWLtS
 dWHlysU8Yk1kYdZpD5IFJ3c2LiTLEK5qyP/DYeKfl54p7R8qoE0qIRC3koy43NKnd107tVHIQhb
 e9qF9HzPx8uUkOhYGDl4fbjqhyWtTyEzHXij91ZVPDELaidzKcNaMD2LpcBr8lKcrT/dQo/tmcW
 5o2+TkIbPduYdR6bcw9/JsV8mfuQ22hENpi9r6UMEJD6q4K7B2LcQWLWQAgASE3qFht9V13QxkO
 qQWfJ1IapGHnfvvaAXFMsgsTvr9s8hnamGDd7B7vlYlz6eJ/9SXYeRGCK598oeVcURIDE9WZxfq
 qB75bQvPyNfgkhxl+9fg5UKmmcokseBOaA0+CgFxUk=
X-Received: by 2002:a05:6000:46c8:b0:482:552f:ef68 with SMTP id
 ffacd0b85a97d-482552fef9bmr10193155f8f.19.1786803744504; 
 Sat, 15 Aug 2026 07:22:24 -0700 (PDT)
Received: from flumenarch.lan (83.10.193.118.ipv4.supernova.orange.pl.
 [83.10.193.118]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c1307sm17595064f8f.27.2026.08.15.07.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 07:22:23 -0700 (PDT)
From: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Luka Mamrikishvili <lmamrikishvili01@gmail.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3] tests/sw_sync: fix invalid fd test
Date: Sat, 15 Aug 2026 16:21:33 +0200
Message-ID: <20260815142146.370294-1-lmamrikishvili01@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The invalid file fd test overwrites the file descriptor returned by
mkstemp() with a DRM device file descriptor. As a result, it tests a
device fd twice instead of testing a regular file fd, and leaks both
the first device fd and temporary file fd.

Close the device fd after its test and retain the temporary file fd
for the file fd test.

Signed-off-by: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
v3:
- Use drm_close_driver() for the fd returned by drm_open_driver().
- Add Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>.

v2:
- Add the i-g-t subject tag for CI.

 tests/sw_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index 8012652d6..2df6b5601 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -334,6 +334,7 @@ static void test_sync_merge_invalid(void)
 	fence_invalid = drm_open_driver(DRIVER_ANY);
 	fence_merge = sync_fence_merge(in_fence, fence_invalid);
 	igt_assert_f(fence_merge < 0, "Verify invalid fd (device fd) handling");
+	drm_close_driver(fence_invalid);
 
 	fence_invalid = mkstemp(tmppath);
 	if (fence_invalid == -1) {
@@ -341,7 +342,6 @@ static void test_sync_merge_invalid(void)
 		goto out;
 	}
 	unlink(tmppath);
-	fence_invalid = drm_open_driver(DRIVER_ANY);
 	fence_merge = sync_fence_merge(in_fence, fence_invalid);
 	close(fence_invalid);
 	igt_assert_f(fence_merge < 0, "Verify invalid fd (file fd) handling");
-- 
2.55.0

