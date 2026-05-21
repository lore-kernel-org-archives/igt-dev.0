Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F9CD5BAC
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 09:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7C10F527;
	Fri, 22 May 2026 09:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MdzvKmaF";
	dkim-atps=neutral
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B6F10E4BD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 17:22:12 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-48544e7ba58so258499b6e.0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 10:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779384132; cv=none;
 d=google.com; s=arc-20240605;
 b=EhoT0CMSLMLujYk686dCENlVbID/yYKYZ1j1p7EGOre00/v2vg8mhyu4PuJNw3Gy2V
 IUtCgQiUBdJZCi3Fckg9N98Rncjt7yMS6ilM6ih7CGeih6IaQTuAB3sQYz66kYYUXHiF
 hLcerVCFd1IdjJDDBz6liFum7Std4CcAoWmLRz+AkqyxpW8hDv6i+fUpsR6x201AG3eg
 I6ZmJ2PYSuIb5MX/QPriaxa+r1Ch9HhEV//B3h7w1XVqD+LBiBVh3c6jO0j8MjTZ7CNf
 j0uLKIBgkJll/Z4P3+gXMYr7Mjxl3E+clm7FTw68aqYvBpgsj4SUawXBLWHH6ui3/uEa
 3dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=fCX1nC0I0I7++fQXFCj3PuEALaeoARy6bybTxSM6+EI=;
 fh=EX0PTiD1xokl/cAGDPMTEx05jGXdhO5EftfjRYYG43A=;
 b=cK9IUlnsai2r2vx7sPdEiM0vO+3Efxa7PUOSyMgHU7FZNaANqg0jr9qOSsPTDrDSXf
 EKEGIItYxzK2/ugOgGULwM9zI3WLjR1x3ni8DySqAIgY6BOEe82vWSS+MhKStaW5BrBH
 S06s+mMbBhboN/9baDjGDc7UGSHrTakYcsZL6LgHNDx/EPpXuPWFCvTM1CTSemaZY+6G
 Gz3/UTA3f4+XPhyjn1ufCyFbMnzPEfSsl4R9YarUm2yuR0WISRw7E3RmW9jdWW+KX9hv
 obgwaeoJZwr9gsWErkqLWdu1BNlZRCQ5xOFRUM32QsjOToe8X+uht6+PgxM+b7RmpJBa
 iyAg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1779384132; x=1779988932;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fCX1nC0I0I7++fQXFCj3PuEALaeoARy6bybTxSM6+EI=;
 b=MdzvKmaFAv1O17qaL6dMcO0QjN3WbOFaZ+eIlwy6gYtj1zpzQVcF2QwO6SORIP/3BQ
 m1Yx5vviuyPkVJbXqUKgfkEKB0b6F9SgX5taSxvlxicoyRTlJsYEIV0Q/p7LAspsMvcZ
 cz6ArFSDJ8Q6xOStIUDKXa3FIvZuk8FRZ9x+NAP28SkjrlFzMuY20YWVni5vlJVxkcS1
 zs0FxMXK6K5LmRt2+y5QxQ3CZRevJcqN6EbMIBCNaqVOY5cbUoCMK4PtWkdYN3m0A753
 o+kzgulnqDVTgWonk469vZhH31Yx6XJLDyI2+dONNizC7gak+iQYYGaEjEXjgb3d5DwS
 KwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779384132; x=1779988932;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fCX1nC0I0I7++fQXFCj3PuEALaeoARy6bybTxSM6+EI=;
 b=R7w9Ag82YbPtNO9UVJvRcAuxukMSDwNfqCvhDpcWE6vCnIBM/OMV5OgKnIDt3HuODt
 h9QTvNqvDMzRuP1ysFrZlmFL4iqoPN3s7oCN8NSY1ZXoXlNLdgWhFslhAtk1CPvCj2Sb
 jTCZ8dqQXgTK+zo+GzrxZHIS0kAYCoRGKy1o7ZSWAwTEe//GhTehTXqTir06cIC79g9j
 FQ9wSCHn9Q6xOd8lR67Mq8264O9dI2+4Nh8MabIQ6O13G189fvMyEBPMe62TL3w784Oj
 VmWqt5yvacHDl1pyoB/oFSHQDXHC7BVR4JDsaxLyEseMtffeNxm+6Th1XiNY8obltL7v
 w2vA==
X-Gm-Message-State: AOJu0YxuYwMs52wT6z59UOwrqQiYoMCemeE4BVIXhrDngAkPfqZ3/kJo
 i0ibmbr5ldgJMZcmhiNaH9Vc6Oe0Zu57CibGNNlYKVBCgdCoj3VsUf+o7LN1iuyKfxYXuk6fhpC
 prfaNMOHNJPE9ltO1UeRme8kM613J3+fXpvYYOcqGEqgIEHXOUBBjZQRKPrg=
X-Gm-Gg: Acq92OFUPa+K1PDMGR3MwYYfDE6UkKzMAw5TzQhRfmQZdUXWEc8SiYrKIJL9WQALROY
 wssTeeHHK2J41D0/08ir3j1HMSXIAXYrK6uT7vUJGMB3pOz2JLTbEta96XJrLxmu034XEKhBqnn
 3Wb3jPEKXr1NaZ1b2J0Y3cNYWrLcWycAqdF3V8U7hPTsvx7DcmQLLIXcCQmm6EbE2f3gv7s39XU
 oR4at5w4wtFstEeEvkdUoqsIJ+dR0iyMvEIecCiBQNTtMRmGvtSIxMzxhh98FLrq0LV3Pz5xXUS
 /2MvFSxB6v76Y2a6G/9ULw327g==
X-Received: by 2002:a05:6808:50a0:b0:479:e7c7:dc76 with SMTP id
 5614622812f47-4852ecf294amr2715262b6e.26.1779384131503; Thu, 21 May 2026
 10:22:11 -0700 (PDT)
MIME-Version: 1.0
From: enh <enh@google.com>
Date: Thu, 21 May 2026 13:21:59 -0400
X-Gm-Features: AVHnY4IwcGgNEdsi5IlNHSF7SC-iD5sz6ypBMKO1rnIisCG7SRYhnmC8pQmGemc
Message-ID: <CAJgzZorTqga=4+CnZ=1awR4A9YvV5Kq-Yw8QOS5PSvGoOkZBXw@mail.gmail.com>
Subject: [PATCH] fix android/riscv64 build with linux 7.0 uapi headers
To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 22 May 2026 09:33:23 +0000
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

linux 7.0 adds a #include <linux/const.h> to the uapi header
include/uapi/header asm-riscv/asm/ptrace.h that breaks the
igt-gpu-tools build for android (which uses the upstream uapi headers
directly).

the obvious fix is to just remove the #error (and the already-dead
duplicate #ifndef below it).

this fixes the build, so it's all the change _i_ need, but i will note
two things:

1. your backup _AC() differs from the kernel one in that the kernel
one in that the kernel uses the double-expansion trick so that if
_AC() is _applied_ to a macro, that macro is expanded first. this
doesn't matter for your current use case, but is potentially a sharp
edge if further uses are added in future.

2. you don't seem to _need_ the _AC() macro at all? unless i'm missing
something, it's only used later in this same file by the _UL() and
_ULL() macros, which are themselves only used later in this same file.
so you could drop _all_ the macros and just explicitly write 0UL or
whatever.

so there's potentially more cleanup you could do here, if you're interested.

(i don't have a gitlab account, so i'm assuming you also take patches
via the mailing list.)

--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -22,16 +22,12 @@ static inline s64 sign_extend64(u64 value, int index)
        return (s64)(value << shift) >> shift;
 }

+/* May already be defined by <linux/const.h> */
 #ifndef _AC
 #  define _AC(X, Y)      X##Y
-#else
-#  error "_AC macro already defined"
 #endif

 /* Make IGT build with Kernels < 4.17 */
-#ifndef _AC
-#  define _AC(X, Y)    __AC(X, Y)
-#endif
 #ifndef _UL
 #  define  _UL(x)              (_AC(x, UL))
 #endif
