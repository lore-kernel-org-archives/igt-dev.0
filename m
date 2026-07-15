Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C90DC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 19:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E453010E23B;
	Wed, 15 Jul 2026 19:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jUuwDDQj";
	dkim-atps=neutral
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D336110E218
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 19:29:52 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-92e55f0613cso726523385a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784143792; x=1784748592;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2GKopa0gCA6AtRzag+JoHuFptmDK7Oqrl4bTf/V0acE=;
 b=jUuwDDQj92BnLRLgqXFQiOTxa+ZyGt2lP0bH1N43cZq07TyaIls67XTazDBBFKb0F0
 60cQuIlFUFpNsBKp3ByTqdluKk5CV9r8yFybs/9t3HNsR298fc+iB9xadTtEG4xnF9j9
 j2cyTYXqtP+QR3pz+nPq/JXAmrASs/Reetgy+tj0OhDrWiewdVMPnXBAsMlYuP2j4tgq
 Zj4NxEdul5481FdF8MjwzRqXuMuyrRK16Em5jZQDKm4+UbT2MpcpVEF662671wbqEtpL
 2kYxOv0v4FpjRnZbYxSHbgqkZVMGSNtHHpCTQQp62gTbcsuC71co0wR5RSHZMlvyk+mi
 UgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784143792; x=1784748592;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2GKopa0gCA6AtRzag+JoHuFptmDK7Oqrl4bTf/V0acE=;
 b=WUQPs7bMMJICj2IDQd3/zVIP2m+7zSkNncQupYsYFCDG+QSH1ovJgfKei3ZRsFi2Vh
 /0/k83z3atIMQGDWxW8L4vvcqvrlT/642kHlObrMzBFv849j002KaxUmBe688ag9/Vdk
 nnYDEYuOj08S+MpRYApyuHrsORi+0PGgKRxd7XvXK6SQTQZeGm/BTtmA6wRIaoRQla6/
 0ryPErQ/IxZ5ZO54N5LiYAe98jXKCE5aXVWd1LDgZHXMPSTcjqjgY0OnW9/2G9RjPfxt
 vnIlm2NLOzvgmDF3+nq1zmGYqybfY64N93XBls9y1Fohn8pCKPRZOZbmP3Gi/L+DvXhX
 ebCg==
X-Gm-Message-State: AOJu0Yx6Ytf8dQP7wcrL7ZNsJ6QzFHciZeZCkX+vhDFs8Kh3433hccyt
 jAH+oVd+M76OYhOtciHMUUpnWemVqaeS5CCPHxPr3V1iDudjt02E11M5k/reudAF7v5sCsZgfDS
 DZF2a9LBhhN6a0IUUuSsKjQ8n8x/xi5xOPPGJUV8r/HbzEQamia+jsMo0pDI7zdQLy6TXyy1bga
 orujK5fYL5WRdhGlUQCNFOWl7bdx68gt/hgjxi1HY4ODDP2/FaUu2730CtyWyejr7QOK4=
X-Received: from qknre16.prod.google.com
 ([2002:a05:620a:8e10:b0:92e:5eb6:ace4])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:1729:b0:92e:f0a5:ac3e with SMTP id
 af79cd13be357-93086a62369mr885538585a.28.1784143791186; 
 Wed, 15 Jul 2026 12:29:51 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:29:48 -0400
In-Reply-To: <20260715192949.1984280-1-markyacoub@google.com>
Mime-Version: 1.0
References: <20260715192949.1984280-1-markyacoub@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715192949.1984280-2-markyacoub@google.com>
Subject: [PATCH 2/3] tests/unigraf: Fix DRM master and heap memory leaks in
 tests
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, Mark Yacoub <markyacoub@google.com>
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

[Why]
The unigraf_connectivity test allocates connector array buffers dynamically via
kms_wait_for_new_connectors and get_array_diff without freeing them before test
exit, leading to severe heap leaks when executed iteratively. Furthermore, neither
unigraf_connectivity nor unigraf_lt closed drm_fd upon completion, holding the
DRM Master lock open indefinitely. On platforms with a running display compositor
(such as Android's SurfaceFlinger), this leaves the DRM device locked and causes
subsequent graphics tests to fail with resource busy errors.

[How]
Explicitly call free() on already_connected, newly_connected, and diff buffers
at the end of unigraf_connectivity. Add an igt_fixture cleanup block to call
close(drm_fd) when tearing down both unigraf_connectivity and unigraf_lt.

Fixes: c66d08db9177 ("tests/unigraf: Add basic unigraf tests")
Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 tests/unigraf/unigraf_connectivity.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
index 927ef2d6f..8ae9a2593 100644
--- a/tests/unigraf/unigraf_connectivity.c
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -134,5 +134,13 @@ int igt_main()
 				     "Invalid connected connector count, expected %d found %d\n",
 				     max(i, 1), diff_len);
 		}
+
+		free(already_connected);
+		free(newly_connected);
+		free(diff);
+	}
+
+	igt_fixture() {
+		close(drm_fd);
 	}
 }
-- 
2.55.0.141.g00534a21ce-goog

