Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16850C56206
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB50510E806;
	Fri, 20 Feb 2026 15:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQ7oaTWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5666310E806
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771601896; x=1803137896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=axo0zhhEPioPKK3ZyGDpB9EfbUc7edL6fNbHjsjklgU=;
 b=eQ7oaTWhGLDRAlRw7hGeRBppLiKdTN6TT8Tqz+qDE07SeP9Hl0nPecfX
 1N7OcZnZY7/CzJEQ9ILdqP8+bPurBBKySAMe7Z51IMLNSG+Nki8HaaTaN
 lBWvOfmoYhMCGcFCFBRmRBvM+AHB1ijpM/tGWsUKgbyBQRxvNoEu9eWP3
 0PjUxE7fui85puY409fKypsYqMcOUIXAEUjzGdRdBrD6D4/TqvZTqqmiG
 CTkj1OKMien5Pd7HcuhJfqmTHOj+M3HXAh43XYfI7jB+OkJxC9rlXuyJs
 O360LJTHyRAZbsySv09GNx58PUCe7glMMV6xluEHUuDCGttXShMceygBQ g==;
X-CSE-ConnectionGUID: BIj6gNf2T3SS+W2vXmjNbA==
X-CSE-MsgGUID: Sn53w/ZPSYS1PueckwgKkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90105372"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="90105372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:15 -0800
X-CSE-ConnectionGUID: sTJuBRuDRdmZsPlsStX45A==
X-CSE-MsgGUID: mIM/ZnMwS6uZa3e4xCZ2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="215007656"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:13 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v4 0/5] Improve eudebug test cleanup
Date: Fri, 20 Feb 2026 16:37:49 +0100
Message-ID: <20260220153748.210381-7-christoph.manszewski@intel.com>
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

Open:
The last commit changes the sysfs path logging from:
'/sys/dev/char/<X>:<Y>' to '/sys/class/drm/card<N>' aligning it closer
to the device identification employed by IGT, but involves some
hand-rolling over using builtin helpers. Please share whether it can be
improved or even is worth including.

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

Christoph Manszewski (3):
  xe/xe_eudebug: Add reattach function and make plain connect private
  lib/xe/xe_eudebug: Track active debugger sessions and close when
    disabling
  lib/xe/xe_eudebug: Get drm card sysfs path

Dominik Karol Piątkowski (2):
  tests/xe/xe_eudebug: Change pthread_join to pthread_timedjoin_np
  lib/xe/xe_eudebug: Modify toggle error handling

 lib/xe/xe_eudebug.c             | 215 +++++++++++++++++++++++++-------
 lib/xe/xe_eudebug.h             |   2 +-
 tests/intel/xe_eudebug.c        |  13 +-
 tests/intel/xe_eudebug_online.c |   6 +-
 4 files changed, 182 insertions(+), 54 deletions(-)

-- 
2.47.1

