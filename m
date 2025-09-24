Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CEACAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BD310E724;
	Wed, 24 Sep 2025 12:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDgtix5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEC510E728
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717703; x=1790253703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rSODfIa4WqPwjq2DOwFo56eyFYe2vVQksSD7HPmk+VE=;
 b=lDgtix5BzrEWbpZFf3JEIGkN2hlKNU5R9X07lVYzRkr1xM8DokqCzIfv
 tfd9Xe3RpTde5yZc4TdL1VUqzAZf4gDRvO0cpldS+viHoselYxkN2k9DA
 hO3inwPLAmDTBeY0OTxzVEIDPe5Mcii+9FaJo68Ew/2HogXxsDBUrjiUM
 bhQridrIXKLp17ddMWChQU6HxgahuVmLNO3bG1Zws2Q9Wz+8urJ/YW5u1
 NCKL2TQA93wFTP18+wEftlCqOpraKqdBBgWZ/5b/OUZO84DVQzIGqYxYf
 YC8OXR2Wbk1m9uhObJbGLPTtQZ/8dSD6Bv0pQ0BzmnZOOtRssGuA9SBeG Q==;
X-CSE-ConnectionGUID: I0TuzUy+QQaQ6A8oppZbrQ==
X-CSE-MsgGUID: trSgpGUIRrO8gvcUzDFfdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61182086"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61182086"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:43 -0700
X-CSE-ConnectionGUID: n9wNPQn/QiCU5hueC5mzEg==
X-CSE-MsgGUID: 65uA5hxAQaSm2FfEnqxiuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177459873"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:40 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 0/6] Fix
 xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Wed, 24 Sep 2025 14:41:17 +0200
Message-Id: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
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

Dominik Karol Piątkowski (6):
  lib/xe_eudebug: Fix safe_pipe_read
  lib/xe_eudebug: Don't fail in __wait_token if pipe was broken
  tests/xe_eudebug_online: Allow dead client in
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Improve SIGINT handling
  lib/xe_eudebug: Introduce xe_eudebug_debugger_kill
  tests/xe_eudebug_online: Improve issuing SIGINT in
    set-breakpoint-sigint-debugger

 lib/xe/xe_eudebug.c             | 85 ++++++++++++++++++++++++++++-----
 lib/xe/xe_eudebug.h             |  7 +++
 tests/intel/xe_eudebug_online.c | 16 ++++++-
 3 files changed, 95 insertions(+), 13 deletions(-)

-- 
2.34.1

