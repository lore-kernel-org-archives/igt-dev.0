Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B832FC5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 16:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BB610F436;
	Thu, 13 Aug 2026 16:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="otfzbGJV";
	dkim-atps=neutral
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC8E10E4E5
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 16:45:05 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52cd0374265so2508961cf.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786639504; x=1787244304;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qKVAQM8i+r7Te7OGkNxsU95dvmopD9wjMeNQ8YLS+q0=;
 b=otfzbGJVzTiHOrNmFvlaAWNZeqHzMRYdwNRVmaPBxvAYFgR0K8zBXMOAyVN3rrPwny
 dFEM4i07A2JskHejZSI8ElEWolERRav3vNtX9ZPGki8s4ThzoW/YI4qyBniZ/ro6kRgs
 dDn0ww1MuDmILiiE3lZImFy/AUjiLk/PG2GhsfKC2f7sWxtv7QKw07pWQ4TygwzNrpxH
 UzEtaGc2k7qMro+KyZMYyrM/zypExG+ko8s10QUFnWpWZYJS+4WrrMoVR5gkDmqnRH7z
 wDwhXucmy413THrUryzmKDkCfrQvfo4tAn3jTGgAO+HTZjw552GRMsF0un9/QRQJ7Krk
 oI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786639504; x=1787244304;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qKVAQM8i+r7Te7OGkNxsU95dvmopD9wjMeNQ8YLS+q0=;
 b=OcYYp4Br1oQnpf/t8z+eNJaSQ3EFE90Mj5IxadQOA6u9Z/JHzMukaLdWWkvziyNUqA
 iterdzyHysia1fQi6ifLH0rZn14f/SvluApXUFTAWzxgrLt5DVkMkKLJNyIZafwex+Y8
 d3jZch20fnCVm0ylDyCth81DnkwPQ0z8Y4dfEG5PdDA0VzP6N9N/IDepaNiwiNwSkn+Z
 R43R2u/yMdiKU5yJp5jg0M0Vr8DU7jE5LbbxlDgTkW4ICAOhZvL762vt/nCInGymBiYm
 68vDNKUKTmGzgNPhBKr0AMZKL6n0DWT54ynrWVozm28PEO2q/i2Z7xZbjELkIstCzfH1
 GOkA==
X-Gm-Message-State: AOJu0Yy+3hIld6Yi6rJNEkx1pW/Vph8ONpg9wNrrcqeiOorJ+eXWhlLF
 pvR8S1wRw9Pg3DgQ4pyk2tu1IStWBNZmkLJzrnna3K9IrIxFgdz5OruQsUTVpJXmOl/TcnTE9qU
 NL/3ewqQXsXq6S1wgZSSXpdMItgYRK3T95Z7yGFKc7GbLLk2Sd0oWo4wyhrkVTvtGHC9NQ8nvjH
 pUVuOyo3zvm8Ifm1T772pZlibBYCJPqsd7rCyN+52vXmVMEQ/h74HIK7q8X6ZU4uI7erY=
X-Received: from qtbox6.prod.google.com ([2002:ac8:6106:0:b0:51c:c44b:a9a4])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id
 d75a77b69052e-52d73df0ab2mr85935471cf.42.1786639503506; 
 Thu, 13 Aug 2026 09:45:03 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:45:00 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813164500.2287576-1-markyacoub@google.com>
Subject: [PATCH] unigraf: Use proper hardware API for HPD pulsing
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

With the latest Unigraf firmware, hardware HPD pulsing works reliably.
Switch to using the `unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, ...)` API
directly rather than circumventing it with manual assert/deassert
time-based toggles.

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 lib/vendor/unigraf/unigraf.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 30ee3c72b..627ec65b1 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -612,13 +612,7 @@ void unigraf_hpd_assert(void)
  */
 void unigraf_hpd_pulse(int duration)
 {
-	/* In theory this should work:
-	 * unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
-	 * But this seems to be broken and this works:
-	 */
-	unigraf_hpd_deassert();
-	usleep(duration);
-	unigraf_hpd_assert();
+	unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
 }
 
 /**
-- 
2.55.0.691.gc56d675ccc-goog

