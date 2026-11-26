Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C78606A321
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilfdbzYe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A85D1125A7;
	Thu, 26 Nov 2026 16:26:45 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C6710E74C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 16:24:38 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3b40d23e1adso4811865a91.0
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795710278; x=1796315078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eFWnt9+7misg+5ffZ2eK09BRERg5Wm6K0djtylo8pk4=;
 b=ilfdbzYeEgdGtzgv/dIprrWzv7dHH6CuIxG4XOUj4Jc+9tZlxgXlDAmyfDEkYlObJl
 ZlCmzq1Jjord4mVv+k7X/DRDOdRyWxqqIRCaxAXdRSE3RXCjoK9992DfpuW2kLaZBS8j
 Qu6bhGQtsgWdCHK7V2kN4Tjvlx/jk6UoQkSb0topuT7zq7eTg/witQrBFE1L8gXkwk4Q
 WWGbtH2Pk+IySMsmALPKaY6Wn4nJcNURgwlb4DSrSFZ2SHCIsq951Z2f2Q3r2LJ2mPRZ
 WGrIMs2uyBohn006CGsjcAxN22Sxh8LWxNiPxjZaGMGoQffNbJE2vOAKeDnFRvtfF+yA
 3ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795710278; x=1796315078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eFWnt9+7misg+5ffZ2eK09BRERg5Wm6K0djtylo8pk4=;
 b=Ld6vtemLpbgqU/1lC/lrfnmnw6VGbqrfyY4M12YbRHU2w2+dQgX4NDcS18WznFtOvr
 qqJieKLCXMbWgMOupiief8VK8JPQKxh3AEhRCiCYx/54MY1je+/c9nQxM65TY6eDKIUs
 PQ3PGNeJfjRDFjvyMaU1NMQaLicZ7ZnsJba/sBCOGOy48EHncHbEs/Vp+Sz/Y9mUqWxT
 WrWdxb3dCkfoH4C3E7wxUjxmvI9x1wHIQpK21cW2721+Aa6SuoFj87l1YjjD7SX4bVpD
 7c7qFlGYDYVct8WmWaDFYPTXoguiLWXhFMvYHrN8DEjHvUleGziZeUm5bTzFbJB/OWst
 cPiA==
X-Gm-Message-State: APuU4Z+LcYE44X1Lg+s9m7N+RwIzeqDD/Y6qdVxqm+GrlTmSp8O3c+CS
 BkYZs1rdJVCG9L8a7lELsiPuFd6H8X/pXt7/UP+UlY6Gi+bKIEdO8To1Lr7wh1yD
X-Gm-Gg: AZFdTZe7iNvEmaMwo/KMVJ8ivdQAVKbhrTF1gG5CVbVtI3d1ZnnyaDHQSaZ0IRUihOn
 C04gTWsNSfYfsdoaN1j3VzL0tJTPDeQ20X7HoOXs2hqckEo6McVJBmrVepgj30UO7qFCf8tJwFv
 NcikUkIy4H73iENF5shbFr7qS7l/KGuaPXot9AP+n7jzGzWh36Ns+8h7pUXusRbBC8SANDCi72j
 Ey/U9JULtW995GNJGIgIO02pwUY98u+KA/vYvwPmG8SknoKPVbxKLz74zywcu4VT1m2CgnB/vSq
 IPrp824jPWRrwDbhkIwKy5HKbekYSEaDdZ8CKrePGWXZfn4GIXuvGCJ5iloItBgf0aLVeZJVodt
 7ydbSdyh85nM486ILCJWqbXOUhvgg60T0UtZyraWn4f2Sd+sF5bfboeLb4ZU2uD3wCb7ktz3V8r
 UV71Zf0fEz/izYgNNLN+SVZ1jzDgYWun8fevdJv1+zwWdU7FJ0zgks3NX4szDU3pShIOoy2T7Oe
 9h6ryPb3sGbx6GPTOYCeB3wRwnCZdPvl8CrIb/nzKVaaVB4yRKCbEVFCIseSC6J3MqM4s2454WC
 W/vbnRhZUUZPfNAfAYKxaUsJEd5prudbpid/dlI1gQgMXh3Zqb949S7xor0y+YzZTSixQjV71jJ
 HZkZ1y8oS6Q==
X-Received: by 2002:a17:90b:2c84:b0:3b4:a90:7f2e with SMTP id
 98e67ed59e1d1-3b41c7c4e5cmr21659912a91.5.1795710278115; 
 Thu, 26 Nov 2026 08:24:38 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net.
 [36.226.201.204]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b41adcafe0sm36037391a91.16.2026.11.26.08.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 08:24:37 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Roy <rongh7426@gmail.com>
Subject: [PATCH i-g-t 2/2] tests/kms_bw: Skip when pipe CRCs aren't supported
Date: Fri, 27 Nov 2026 00:24:33 +0800
Message-ID: <20261126162433.665660-2-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20261126162433.665660-1-rongh7426@gmail.com>
References: <20261126162433.665660-1-rongh7426@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every subtest collects pipe CRCs, but the test never checks that the
driver supports them. On a driver without CRC support each subtest that
gets past the mode checks fails in pipe_crc_new() instead of skipping.
On a Raspberry Pi 5 (vc4) that is 32 failures:

  (kms_bw) igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->ctl_fd != -1
  (kms_bw) igt_pipe_crc-CRITICAL: Last errno: 2, No such file or directory
  Subtest linear-tiling-1-displays-target-1920x1080p: FAIL

Add igt_require_pipe_crc() to the fixture, as other CRC-based tests do.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39): 32 fail and
96 skip before, all 128 subtests skip after with "crtc-0/crc/control"
missing.

This change and its description were written with the help of an AI
coding assistant (Claude); the test runs above were done on real
hardware.

Signed-off-by: Roy <rongh7426@gmail.com>
---
 tests/kms_bw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 10bb520..a56b4ee 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -336,6 +336,7 @@ int igt_main()
 		igt_display_require(&data.display, data.fd);
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
+		igt_require_pipe_crc(data.fd);
 
 	}
 
-- 
2.51.1.windows.1

