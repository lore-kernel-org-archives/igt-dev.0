Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBBAC00A94
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 12:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9273A10F5E1;
	Fri, 12 Apr 2024 12:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOsdCX56";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD46310F5DC
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712924425; x=1744460425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JwWTdZzVj4vpb0+ykKcaV+LYL3rwEUCDEbZeCiAjhNo=;
 b=aOsdCX56vzLRe0HWYAVmLDgcvewk6To7dcG2Fvf2Jzx1DoODWoFqnMXL
 +b1Ps36jAMxZVOemvsErXv3BT5emTq8J1KjlVOEQLMvMNJEZecOE8SI6t
 kHBT+ificvUgqL2OKwi0A1MJ2lkPVHutjqvYTtpQQVZDthGzcHPmipp34
 IRD+3jZ/Xzf4CixjVdNLzfbvdPaTAr2AyS3JRXsHaTWkrT/ypwwijIC4q
 iHSEQpgWAzcgNmCYa0iWVqgCY99ajPcUl9hB3AMJH0n3wJGob2qa0UH4k
 S/lEPwDzGZl1AJIJKHF8nDcAJgnrqbZvbXt25ISt5bkD3cEOiPWvDHLZ8 w==;
X-CSE-ConnectionGUID: o9QOFEEATeWGgfWiqaYKaQ==
X-CSE-MsgGUID: sbR/qZ8dR9OZBNNj7kXgGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12159760"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="12159760"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 05:20:25 -0700
X-CSE-ConnectionGUID: lYjogl1zRYW4WKJYUBapLg==
X-CSE-MsgGUID: b3OagmB4RHGzvaDJ9CjbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="26024745"
Received: from unknown (HELO localhost) ([10.245.246.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 05:20:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Fix sigaction write to uninitialized
 memory
Date: Fri, 12 Apr 2024 14:20:14 +0200
Message-Id: <20240412122014.341267-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I've noticed on running kunit subtest:

./xe_live_ktest --r xe_bo

IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.8.0-xeint+ x86_64)
Using IGT_SRANDOM=1712922311 for randomisation
Starting subtest: xe_bo
Received signal SIGSEGV.
Stack trace:
 #0 [fatal_sig_handler+0xda]
 #1 [__sigaction+0x50]
 #2 [__libc_sigaction+0x10f]
 #3 [kunit_get_tests+0x417]
 #4 [igt_kunit+0x35f]
 #5 [__igt_unique____real_main41+0x44]
 #6 [main+0x48]
 #7 [__libc_init_first+0x90]
 #8 [__libc_start_main+0x80]
 #9 [_start+0x25]
Subtest xe_bo: CRASH (0.005s)

Looks this is related to sigaction() write to memory referenced
by uninitialized pointer located on the stack. Lets fix it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: missed cmdline (due to # character)
---
 lib/igt_kmod.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 1ec9c8a602..6659c27eba 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -963,7 +963,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
 				 int fd, struct igt_ktap_results *ktap)
 {
 	struct sigaction sigchld = { .sa_handler = kunit_sigchld_handler, },
-			 *saved;
+			 saved;
 	char record[BUF_LEN + 1], *buf;
 	unsigned long taints;
 	int ret;
@@ -975,7 +975,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
 			return -ENOTRECOVERABLE;
 
 		if (modprobe) {
-			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, saved));
+			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, &saved));
 			if (err == -1)
 				return -errno;
 			else if (unlikely(err))
@@ -988,7 +988,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
 				igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
 				__attribute__ ((fallthrough));
 			case ENOTRECOVERABLE:
-				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
+				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
 				if (igt_debug_on(modprobe->err))
 					return modprobe->err;
 				break;
@@ -996,7 +996,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
 				break;
 			default:
 				igt_debug("pthread_mutex_lock() error: %d\n", err);
-				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
+				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
 				return -err;
 			}
 		}
@@ -1005,7 +1005,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
 
 		if (modprobe && !err) {	/* pthread_mutex_lock() succeeded */
 			igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
-			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
+			igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
 		}
 
 		if (igt_debug_on(!ret))
@@ -1236,7 +1236,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 			    struct igt_ktap_results **ktap)
 {
 	struct sigaction sigalrm = { .sa_handler = kunit_get_tests_timeout, },
-			 *saved;
+			 saved;
 	struct igt_ktap_result *r, *rn;
 	unsigned long taints;
 	int flags, err;
@@ -1263,13 +1263,13 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	igt_skip_on(modprobe(tst->kmod, opts));
 	igt_skip_on(igt_kernel_tainted(&taints));
 
-	igt_skip_on(sigaction(SIGALRM, &sigalrm, saved));
+	igt_skip_on(sigaction(SIGALRM, &sigalrm, &saved));
 	alarm(10);
 
 	err = kunit_get_results(tests, tst->kmsg, ktap);
 
 	alarm(0);
-	igt_debug_on(sigaction(SIGALRM, saved, NULL));
+	igt_debug_on(sigaction(SIGALRM, &saved, NULL));
 
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
-- 
2.34.1

