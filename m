Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2DECAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678CC10E9E5;
	Fri, 26 Sep 2025 07:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIlPohRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABAA10E9E9
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872897; x=1790408897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ggahsWnCtJr96UyJ4VwG/3M5ubTBNlAO+HQCvW7d1ng=;
 b=SIlPohRG2wEj29jlqh/YvWDq4KxgYJvI++s2g6Fr3svn87djFBg4+s2Z
 AwqrZ6VBdZ9RpZn/HjrLRfe9IHvxxwEMN+CwqCFV9CiyxRe7qGlJjczuv
 1a+MCjEvPE/qpwWeKt28n1DIcCZOoUKmV/XyxdpKTpd0z0K0UgTkYIYEL
 u6Tj9EmcCS7WFa9DsW8Y/CGcQ32slgQG/q3MovnLKJ3z2ZeSHEVztivnu
 OQTMWGUQOysd4P4mgrTXVWPOTMsCfVyL8Ws7einJd6JVDRXk3Z8nQOggD
 XqC02aMUt8B3ZP3mlRLUiyAxGfxtlPYK2nBHOXrBX49FIMKL1BJaJ+Hrs w==;
X-CSE-ConnectionGUID: 3covSmZYR2edxkt0JQIHiw==
X-CSE-MsgGUID: 1UlDn0pWQEaOlKGRBxHpRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372364"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372364"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:17 -0700
X-CSE-ConnectionGUID: W1pmEQA+ScWPxMwBIxuAug==
X-CSE-MsgGUID: yReLgcdoTz2jjrHNMDkQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474197"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:15 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 0/9] Fix
 xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Fri, 26 Sep 2025 09:47:52 +0200
Message-Id: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
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

The thought behind xe_eudebug_online@set-breakpoint-sigint-debugger test
is to check if SIGINT during EUdebug ioctls will not break the kernel.
It is done by looping set-breakpoint test equivalent for a minute while
sending SIGINT to debugger thread with random timing, hoping to hit the
ioctl given enough repetitions.

Sporadically, the test deadlocks - it is caused by random timing of
pthread_exit calls that can land in a critical section, leaving held
resources; next entry attempt into that critical section will cause
deadlock.

Rewrite SIGINT signal handler to toggle a variable instead of calling
pthread_exit instantly and exit in main debugger loop if said variable
is set. To utilize the new SIGINT handler, use pthread_sigqueue instead
of pthread_kill in order to be able to pass debugger to signal handler.
Put the pthread_sigqueue call into library function helper. Rename
terminate_debugger to debugger_signal_handler to describe its new
function better. Add SIGTERM to signals that are handled by
debugger_signal_handler. Don't kill debugger thread on SIGTERM signal.

Harden xe_eudebug library code and xe_eudebug_online test code in the
set-breakpoint-sigint-debugger path that can produce unwanted igt_assert
fails due to unfortunate timing. Issue some SIGTERM signals in quick
succession before SIGINT to raise the odds of hitting the ioctl.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (9):
  lib/xe_eudebug: Fix safe_pipe_read
  lib/xe_eudebug: Don't fail in __wait_token if pipe was broken
  tests/xe_eudebug_online: Allow dead client in
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Introduce xe_eudebug_debugger_kill
  tests/xe_eudebug_online: Improve issuing SIGINT in
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Improve SIGINT handling
  tests/xe_eudebug_online: Introduce proper sync for closing debugger fd
    in set-breakpoint-sigint-debugger
  lib/xe_eudebug: Introduce SIGTERM handling
  tests/xe_eudebug_online: Issue SIGTERM in
    set-breakpoint-sigint-debugger

 lib/xe/xe_eudebug.c             | 87 ++++++++++++++++++++++++++++-----
 lib/xe/xe_eudebug.h             |  7 +++
 tests/intel/xe_eudebug_online.c | 16 +++++-
 3 files changed, 98 insertions(+), 12 deletions(-)

-- 
2.34.1

