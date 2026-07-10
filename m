Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC55C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 18:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A64810E1AA;
	Fri, 10 Jul 2026 18:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kuhls.net header.i=@kuhls.net header.b="mjVM8yf7";
	dkim-atps=neutral
X-Greylist: delayed 523 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jul 2026 18:55:13 UTC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07A310E1AA
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1783709188;
 bh=/2ukfUGCEAn6ZwvwjfuvjT+VhdtBcvOMZ8Tt9CDIQFI=;
 h=From:To:Subject:Date:From;
 b=mjVM8yf79mjT+6kLl8DQQqTDEgn/TSKOsMrV49aQ/yyGLCSIAeiga38+MvmLE3gn3
 ScO3xcznAOJ7LpQeUvpTqcM7do3e/9QrFIna2ZTbCJeuTC9N/oIinlaSr1Q7n9Q97p
 L+kw6dOsIkdgMEmYinF5yaOPAo6w4i+wnFSax8/GakxJks07bvGxuW1FZsyrXh0qms
 qwe0rIOEOHxEKVQw4HWzu0TaHqW4rlgGXsxiVU0mVSSCjDf0S8SNjJK4QQRpR8c77T
 n1CZmvaUPXJBj/gCsjpmp+mwk/lB+p05hnixKkUCs1FTHh5VbDEw1BPbSoMeEeZiTL
 g438DuTpWHRZA==
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 966A3A4C30F6
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 20:46:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51242)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiGEt-0000000044Y-20SJ
 for igt-dev@lists.freedesktop.org; Fri, 10 Jul 2026 18:46:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tools/intel_gpu_frequency: include limits.h to fix
 musl build
Date: Fri, 10 Jul 2026 20:46:18 +0200
Message-ID: <20260710184619.2347456-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ---
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

Fixes build error seen with musl-based toolchains:

../tools/intel_gpu_frequency.c:90:19: error:
 ‘PATH_MAX’ undeclared (first use in this function)
   90 |         char path[PATH_MAX];

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 tools/intel_gpu_frequency.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 6316c2e58..7df7f331d 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -25,6 +25,7 @@
 #include <dirent.h>
 #include <fcntl.h>
 #include <getopt.h>
+#include <limits.h>
 #include <stdio.h>
 #include <time.h>
 #include <unistd.h>
-- 
2.47.3

