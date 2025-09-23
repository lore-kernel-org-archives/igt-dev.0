Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89B9CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 13:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6618F10E126;
	Tue, 23 Sep 2025 13:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1ughWVE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6636710E126
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758633017; x=1790169017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1TxcVjCGW++nMUxNE+Bc5u/dh6z2fPuFnr1jYyhA4F0=;
 b=g1ughWVEW4ZGrNNOKChyz4e3cocBREnU078g5KhntB/rqgtIjvap6kMe
 1Z5kWc6hH/11IenNfw/LwYz5508lJ59Jlm+H5UQIRYcufOqhG2+grF6b9
 Me3iyJonxFrT3IWJ8McbHLBt5jaoKDgB+iLMJDHt1Og/B8/X8uvfpQttf
 QMVzYen3MNL0vruyhLdnODuenM+4GUEp2CQplHO3s7t9gI7nrryeQSoUF
 ZUVWNFFWtx2puWTfxA9NrFHVbYxrkubQUkzA/oYMEWHc67OVfwEHXcIfk
 n2srKw6pu69QJYcN77Pvi91c8LGN5hLd+w1Li+ojRObnNZdBwSLHdRukE w==;
X-CSE-ConnectionGUID: WR87Zo8TRNuuSsJ8DLE56g==
X-CSE-MsgGUID: WEz4O5HGTBmjcF88aVx78g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61026854"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="61026854"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:16 -0700
X-CSE-ConnectionGUID: Z7kufK0ORRiLjfx4cnZAmQ==
X-CSE-MsgGUID: GJMBFLAMTvumlE//4nPhCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200461869"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.237])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:15 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 0/6] Fix
 xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Tue, 23 Sep 2025 15:09:56 +0200
Message-Id: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
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
debugger_signal_handler. Don't kill debugger thread on non-SIGINT
signals.

Harden xe_eudebug library code and xe_eudebug_online test code in the
set-breakpoint-sigint-debugger path that can produce unwanted igt_assert
fails due to unfortunate timing. Issue some SIGTERM signals in quick
succession before SIGINT to raise the odds of hitting the ioctl.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (6):
  lib/xe_eudebug: Fix safe_pipe_read
  lib/xe_eudebug: Don't fail in __wait_token if pipe was broken
  tests/xe_eudebug_online: Allow dead client in
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Improve SIGINT handling
  lib/xe_eudebug: Introduce xe_eudebug_debugger_kill
  tests/xe_eudebug_online: Improve issuing SIGINT in
    set-breakpoint-sigint-debugger

 lib/xe/xe_eudebug.c             | 66 ++++++++++++++++++++++++++++++---
 lib/xe/xe_eudebug.h             |  7 ++++
 tests/intel/xe_eudebug_online.c | 10 ++++-
 3 files changed, 76 insertions(+), 7 deletions(-)

-- 
2.34.1

