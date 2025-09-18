Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB6CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDB610E74D;
	Thu, 18 Sep 2025 12:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwwjZMd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E6210E755
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758198853; x=1789734853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0q0Glmd+aO/1hSqoxXVacglq13oIYOjq/0ufh2ewo/Q=;
 b=OwwjZMd//7eCQNB0wXvXQ5MZnFS6GJDN9dsk5YlR8xUKirIBkCll/C+W
 OEpWDMgTmY1CsLf+5oUS0AaAK0f34uA3lqwNyAmaKZgfH0NIJmrau4CHn
 FFlDK2Itx4N6LDq3xH/EfGvtARFUt2m2J8sDwiEwL0IBSIH1wCMwFXkWO
 JT/krIVCu9Mm8xPFA0jP7F3mD795bIEme4wVoT+Ah9IHUj/FCJSdfLwQC
 VdO4AitrnJ2JEuzKMxX9TpkzepmpQiH5yxOaKMnAtAl7nl956Bw4cPgYo
 fdrEnVmfli+NcuU0Cm4LXnCfJ0tbOvMY9LDXWBnLm9kdzF5amf7XGNjfM Q==;
X-CSE-ConnectionGUID: 06ned6ooR/yb0hR25apS6A==
X-CSE-MsgGUID: u3dMN3WpRJi2nFbTgoznXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85966196"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="85966196"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:13 -0700
X-CSE-ConnectionGUID: rssWljoASJa4r7xxU80udA==
X-CSE-MsgGUID: O7HVhIgmQGahb3rZlhr+jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="176328129"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.244.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:11 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 0/5] Fix
 xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Thu, 18 Sep 2025 14:33:56 +0200
Message-Id: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
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

Harden xe_eudebug library code and xe_eudebug_online test code in the
set-breakpoint-sigint-debugger path that can produce unwanted igt_assert
fails due to unfortunate timing.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (5):
  lib/xe_eudebug: Fix safe_pipe_read
  lib/xe_eudebug: Don't fail in __wait_token if pipe was broken
  tests/xe_eudebug_online: Allow dead client in
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Improve SIGINT handling
  tests/xe_eudebug_online: Improve issuing SIGINT in
    set-breakpoint-sigint-debugger

 lib/xe/xe_eudebug.c             | 42 +++++++++++++++++++++++++++++----
 lib/xe/xe_eudebug.h             |  5 ++++
 tests/intel/xe_eudebug_online.c |  7 +++++-
 3 files changed, 48 insertions(+), 6 deletions(-)

-- 
2.34.1

