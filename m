Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CE8C5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 08:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1B410EAC0;
	Tue, 11 Aug 2026 08:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lSz3zl5D";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84110E9C0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 20:02:26 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so1330185f8f.1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786392145; x=1786996945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l7b9fFXQc2UYogN2ntuI66V0vcJ+WadNWvdyAw9GyHU=;
 b=lSz3zl5DJdeDC2Py5S0Ss1djVFMlgURCXN4XWXHAYj4akRkJDlAn36FRLLAeABt4ym
 qQwe7Ijz/8uh+V1RNUnKMe4O5xoj6mfhHQwM3eyr6f0YFJtUi5NmbtEuk+dE2fdStx4s
 9cuCmBY6hkzUpoJOUuIcsSzZtKF7q7isjIr9GCo6Vm9PodugtmvJZ0Hb7v2MM1jdCO9O
 17wAlp2qq6URQyrT6oyAU4XNcR/oUho7H+UsXZexpcg0pckeZuZBZgnuSTMBn479paTm
 xFmgORRSv4jyn/idZ2FpmwaVUqynATKzg8oAAbGXoifYG3bi0dvTIG9VyCBalzks0jjf
 jIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786392145; x=1786996945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l7b9fFXQc2UYogN2ntuI66V0vcJ+WadNWvdyAw9GyHU=;
 b=UZGCaLnMgpk4XzLPelF9/nxHhR71TSn+M3UIiQYJgkAROn+Usbznht5qRnM7QlGjel
 KQ7hyNWeNSPy6Pm13CgCkucbuMrF2xS/YnBw9tARLVsgl5f0EwK253PFxA/cgpe52zDx
 kjoHGW4efQCcrDoNzeCCi9iA4lcCJLJiN2aoyvSU3MdXpouwz9gwa7EXsffECSL7yyPP
 kKVABmRGSZilxzEFDVp3a5i57ncwMqJ11nbIsKXupxE7NqSKeRRB0AOiXTHsIa8UheuH
 ymGzStxyQt4b2PT0kGAOsh+ndkxx+9cYrwFbhkXGIc9zdIAzuCFyrhmpjtYkB4Y3tRZx
 +GmA==
X-Gm-Message-State: AOJu0YyMd1i6MGoWb15HDav2j+w4bItnPmjSykzRkmra7Lfvv8sLIcgy
 eR21OWvkCO2Bfj7bWtSQTofGjjaQgmp9ULc1zw3LjwwScRVC8UjkfjVD1dBcyv4A
X-Gm-Gg: AR+sD111Afuymvntvt20bqlsZG8AO2gbAU80ehdwAU2AU4Rug4Fu17OLcgdc5LqvAVk
 V0AIN4lz35v0G+c4c8cyT6df+RhJYtGh5uYQB/f4VzICENhCZrvJiGOmP+lxOpWvilV5D2kBNAa
 6WuEVpqC44Gepam8chjl7+KSXkACUCjQnYrigdQVokxNz736/Jn8F1rJDV2Bm7b32HFYzwJAp62
 Bvs1D4eOhL9TIuIfeg7O/0BHLE/OjiSAYBojh6mfwwR2Q3W1XYn6lpzFdIKVNzu4ELshe1IIEQB
 Xp9yFaFuifWRn7BSqgvS1bKwUCTkdgA9dqjcSIzxEf/z2HqxPq/gcv8ASLXGUiCKrPAi2sdSNxp
 6fz4mNuo9/tPQgOy/W3Up5OxBlgZIgINalyt9qmKUpCI9pUZjaQuszZV9jJ08k2qzL9gJeDWHjx
 oj/E4bH389yn0Rsyb0fqCM2HUyyvBsoKZ2jS9EMp5eBYDRBMNuDKIuPLPupMt0ziM8Imp8pmlxK
 81WTE5xfCvUM8TLxSiPXn4QgI57D6bYLu7iqBxTVqo=
X-Received: by 2002:a05:6000:4613:b0:474:530:9d with SMTP id
 ffacd0b85a97d-481455f33fdmr6946402f8f.13.1786392145146; 
 Mon, 10 Aug 2026 13:02:25 -0700 (PDT)
Received: from flumenarch.lan (83.10.193.118.ipv4.supernova.orange.pl.
 [83.10.193.118]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021e7b3fsm40394186f8f.20.2026.08.10.13.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 13:02:23 -0700 (PDT)
From: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
Subject: [PATCH i-g-t v2] tests/sw_sync: fix invalid fd test
Date: Mon, 10 Aug 2026 22:02:13 +0200
Message-ID: <20260810200213.10438-1-lmamrikishvili01@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Aug 2026 08:02:24 +0000
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

v2:
- Add the i-g-t subject tag for CI.

---
 tests/sw_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index 8012652d6..a75ec044b 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -334,6 +334,7 @@ static void test_sync_merge_invalid(void)
 	fence_invalid = drm_open_driver(DRIVER_ANY);
 	fence_merge = sync_fence_merge(in_fence, fence_invalid);
 	igt_assert_f(fence_merge < 0, "Verify invalid fd (device fd) handling");
+	close(fence_invalid);
 
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

