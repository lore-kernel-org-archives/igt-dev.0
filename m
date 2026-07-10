Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298F5C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 18:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1F10E21C;
	Fri, 10 Jul 2026 18:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kuhls.net header.i=@kuhls.net header.b="tIS4dJeB";
	dkim-atps=neutral
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A010E1AA
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1783709198;
 bh=SBg3Duj5lHxVgnar8iXaGtXwdRAtl/ZFwUwzT1t9nYs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=tIS4dJeBsGVkoH/6ghE4efQUG/7DBbbKqTDUmzP3wl6N1lRyIdl7e+qHkPkmVCh1l
 wffqVlR4redqxsV1RrRreti1DkJJAQkhrVbBwYfix8npXaqDRDTiJMhprK09izOLtD
 luNhYA0eHuZHVoSkRf8+HBuhoeLGaSm+jFmqoXP4mRrz+6JE/q6tIqO4wUoX9iq8Ho
 R1s4ukDC6GMR+fYh4CU6rq132xle+lyXy9vVbZsBM3rJvSZIUR0wpoDqwJoZ7TFda5
 zxljAGCZ0yCZ2B0jrS0bwpDwmlFJNXSh58vzJilT73sMGX1Lrx1+7M8NzF1d9p4cPm
 4x+c5h64HP3WQ==
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40967A4C37E5
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 20:46:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51242)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiGF2-0000000044Y-1MYD
 for igt-dev@lists.freedesktop.org; Fri, 10 Jul 2026 18:46:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/xe_madvise: Fix the type for
 sighandler_t
Date: Fri, 10 Jul 2026 20:46:19 +0200
Message-ID: <20260710184619.2347456-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710184619.2347456-1-bernd@kuhls.net>
References: <20260710184619.2347456-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: -
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

__sighandler_t is private interface in glibc so its
better to not use it, as an aside fixes build with musl

Patch was inspired by
https://lists.gnu.org/r/bug-time/2025-03/msg00000.html

Fixes build error seen with musl-based toolchains:

../tests/intel/xe_madvise.c: In function ‘test_dontneed_after_mmap’:
../tests/intel/xe_madvise.c:400:48: error: ‘__sighandler_t’ undeclared
 (first use in this function); did you mean ‘sighandler_t’?
  400 |          old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 tests/intel/xe_madvise.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 3d36be941..a33a08630 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -397,8 +397,8 @@ static void test_dontneed_after_mmap(int fd)
 		char *ptr = (char *)map;
 		int sig;
 
-		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
-		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
+		old_sigsegv = signal(SIGSEGV, (sighandler_t)sigtrap);
+		old_sigbus = signal(SIGBUS, (sighandler_t)sigtrap);
 
 		sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal mask */
 		switch (sig) {
-- 
2.47.3

