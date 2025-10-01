Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B0ECAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FD910E6B6;
	Wed,  1 Oct 2025 11:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzdQaV0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B967010E6B6
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319707; x=1790855707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XKLAf1ITRCVTDi4EWsZ5KheoNsPQcDCCMWjmTs0VxHw=;
 b=LzdQaV0qrVZwV3kZNP+LUwfXWLziHRgwHaBZpyEK6HgnOJKN+zMMv9aP
 yRIelg4CrgjXLqNn+Ru3KiVEMBPuZlRQ4KC/JLBFdiFZlmu5+HoQpaZom
 6U8VHZBX3EcbwK6vACYi1nUco9Qxx9E3oMIvug3MtgoAObrFcIhgAJX7J
 GARImXzdjY4XmioXDHvEmp6c0wBxU1Tx1EQZ2uatvRtNkjtCadPjuM0Pt
 7bI1m7W46vqKgvaKXZFZg71gn67N4P4G2SDXxKQw2VwkfYcHchxR4tCVe
 RwYnUgGS2sJfVghyMo8zZQvYzE9DvKbw+S2lLVjUKGUwFYnJ1LqdWVXwi A==;
X-CSE-ConnectionGUID: eAyUcW7CT+iZ5/HxIFIPsQ==
X-CSE-MsgGUID: Fs2RgMJbSUeTLrb7c9Q5rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014955"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:07 -0700
X-CSE-ConnectionGUID: nm+jRMZgSO+l7ZSX0hIh+Q==
X-CSE-MsgGUID: 5KSqYvhVSr+ZOxmnz479Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496182"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:05 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 00/10] Fix
 xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Wed,  1 Oct 2025 13:54:37 +0200
Message-Id: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
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

 lib/xe/xe_eudebug.c             | 89 +++++++++++++++++++++++++++++----
 lib/xe/xe_eudebug.h             |  7 +++
 tests/intel/xe_eudebug_online.c | 16 +++++-
 3 files changed, 100 insertions(+), 12 deletions(-)

-- 
2.34.1

