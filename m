Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0DA1061206
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 11:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF5110E0C6;
	Wed, 11 Mar 2026 11:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOoyhqVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6534E10E0C6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773227213; x=1804763213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S0pfJnhZAFl58duuGxMyUwMgfQPEBkRJsxByAQYImbg=;
 b=WOoyhqVfBp11NWYO5J952zCTfLZXH0UU5qPLQfUqKp3+4e+vTAZ1VUYb
 dAGG81oyxPsgKkeZ+CudrX0OnL+2wYRE63Fhf3PQKu7E26hguAyW5Lx48
 aJIgVdBTEKNJOyaeTnp+rIUrgA8B7vMa6sIaUnjXKASoYc2HSB+Tnq/ti
 6EPNLCJtJm2X8p2AxOhx/lurFM1LR2/XjfOyOu/UimwGA0x7isDAbXCNe
 RRoDJG8OdDpbYo0k8STgPHxRTr1bl1cPa3nIEvmQjmjWRoeTSG2u7xGnL
 FHMm+J7ipUqtfaP0nIXE1ttL2JEwE3TlreS8ep5skaQh/SDTzlzqW92aS w==;
X-CSE-ConnectionGUID: vr618Ya5QiCtKbnVxL02xg==
X-CSE-MsgGUID: dqHh9oQdTeq+5+foVfyRtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85378225"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85378225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:06:52 -0700
X-CSE-ConnectionGUID: XV4VQ680RIyCAsV08gRo7Q==
X-CSE-MsgGUID: qBWFow8LSQWKWEFZm8kIRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="258344643"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:06:50 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v5 0/5] Improve eudebug test cleanup
Date: Wed, 11 Mar 2026 12:06:37 +0100
Message-ID: <20260311110636.798120-7-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

When there is a debugger fd open and an assert fails, there is a problem
with environment cleanup. If enable_eudebug toggle was previously off,
it is impossible to turn it off in case there is _any_ open debugger fd.

Keep track of all opened debugger fds in lib/xe_eudebug and close any
leftover ones before attempting to restore enable_eudebug state.

Change pthread_join to pthread_timedjoin_np in discovery-race* and
discoery-empty* tests to avoid hang before reaching cleanup.

Add retry mechanism in xe_eudebug_enable to allow the postclose handler
to finish. Abort on unsuccessful cleanup to not leave the environment
in potentially dirty state.

v2:
- Preserve skip behavior in xe_eudebug_enable

v3:
- Improve xe_eudebug_enable logging
- Move session tracking to lib/xe_eudebug
- Use timedjoin in discovery-empty*

v4:
- fix commit msg typo (Dominik)
- remove wrong 'debugger reconnected' log that was printed also for
  initial connection and change code reuse/organization for
  attach/reattach functions (Dominik)

v5:
- move assertion and list entry creation out of critical section (Piotr)

Christoph Manszewski (3):
  xe/xe_eudebug: Add reattach function and make plain connect private
  lib/xe/xe_eudebug: Track active debugger sessions and close when
    disabling
  lib/xe/xe_eudebug: Get drm card sysfs path

Dominik Karol Piątkowski (2):
  tests/xe/xe_eudebug: Change pthread_join to pthread_timedjoin_np
  lib/xe/xe_eudebug: Modify toggle error handling

 lib/xe/xe_eudebug.c             | 214 +++++++++++++++++++++++++-------
 lib/xe/xe_eudebug.h             |   2 +-
 tests/intel/xe_eudebug.c        |  13 +-
 tests/intel/xe_eudebug_online.c |   6 +-
 4 files changed, 181 insertions(+), 54 deletions(-)

-- 
2.47.1

