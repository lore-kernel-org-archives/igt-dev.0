Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96396CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 10:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452FC10E7AD;
	Thu,  2 Oct 2025 10:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDO8u6Wx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E0410E7AD
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759401898; x=1790937898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vrPnsVZ/MBzLXnP69d2s0IzcFcANXXmHOUFAX5Wglco=;
 b=oDO8u6WxK2EfZxjNwTorumC/a6yeQ04rQbuVR50vpzMtC0Wd9ijCrHVK
 97+dqiYMYSO5A5Lf6aur0/6RPzB7FOadzv0ZVwQjTPi5TeSJKTJqTTZlO
 +YokciVI4LZGamU8f1Dx3AO3uMy3xgO9y0hJmgOWgWaHFSGNouVfJKi7D
 SiTZqja1XSANUoE6QWKXritM+RD1HsW+BkO9jgaUjjIDtZfDWns+UIvJF
 SXdCtmPLkq2HG5WrNKqnTw2iWXEIFCrrImoYRQ86Bs1/7SMUPyxjCSQjc
 Bq3ZLFKtMp9aG4qaz057Mc5RXwqVBsH8zzcxDu6L7fXRcd+zRmr2G5NDM A==;
X-CSE-ConnectionGUID: odFywzKbTPuMAFH7KLabvA==
X-CSE-MsgGUID: pG8zZlL4S0+ZERYMDPU76w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60895234"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60895234"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:44:58 -0700
X-CSE-ConnectionGUID: Ai0nhbekQ9+upqYb1+uoxg==
X-CSE-MsgGUID: uhdV6cLMTLuvB50LQSkeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184213180"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:44:56 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v10 i-g-t 00/10] Fix
 xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Thu,  2 Oct 2025 12:44:33 +0200
Message-Id: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
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

Dominik Karol Piątkowski (10):
  lib/xe_eudebug: Fix safe_pipe_read
  lib/xe_eudebug: Don't fail in __wait_token if pipe was broken
  tests/xe_eudebug_online: Allow dead client in
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Introduce xe_eudebug_debugger_kill
  tests/xe_eudebug_online: Improve issuing SIGINT in
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Repeat poll in debugger_worker_loop if interrupted
  lib/xe_eudebug: Improve SIGINT handling
  tests/xe_eudebug_online: Introduce proper sync for closing debugger fd
    in set-breakpoint-sigint-debugger
  lib/xe_eudebug: Introduce SIGTERM handling
  tests/xe_eudebug_online: Issue SIGTERM in
    set-breakpoint-sigint-debugger

 lib/xe/xe_eudebug.c             | 91 +++++++++++++++++++++++++++++----
 lib/xe/xe_eudebug.h             |  7 +++
 tests/intel/xe_eudebug_online.c | 16 +++++-
 3 files changed, 102 insertions(+), 12 deletions(-)

-- 
2.34.1

