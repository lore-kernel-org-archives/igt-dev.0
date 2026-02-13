Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07E3EDF148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 10:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7726F10E7D6;
	Fri, 13 Feb 2026 10:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHlL4utr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858C10E7D0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770980350; x=1802516350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KcxTeywR3QgH5xfWuY6LwLpuX7L5oEd5nQUzIjay0UM=;
 b=GHlL4utrHGqRYfMUoNWtQ7IFiKAPDtzfxHivDuk7ptkDkkqtGyioOLuV
 UelH9Mxt5eUaYXyCULOulhI1uFWCJagLvkL+f1XsMGO/zytvV4z5lgzVv
 b/iEkk0UoAs/7AnIkYxsILg9M04c1EK9zKdOgHuI93mUq8ZfgA1OM1mHG
 /HAuS3NC1DvXHSoMaMMVdIrZ+VIw7o0LGEud3KYLn9GwwhtgDNS5+XBA7
 luOb3wMOPs+Dt/sZXy7Xgs797fxxAcX3U0sc0GiRttu4X2NZ2oWVFqaYM
 1plw6r9XRtQho+bKdjsGdS3N6oPrS8CZfmMUThm3sDdg3OKeKV6zHRWrl A==;
X-CSE-ConnectionGUID: h52e10qiSIyVBk9WgK+fQg==
X-CSE-MsgGUID: tUpJ7iGgTOet8Jm/859coQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72258564"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72258564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:10 -0800
X-CSE-ConnectionGUID: eJPNI8FhQQ6+SGbmoLJvag==
X-CSE-MsgGUID: pXhPlNVcTUaiPmz9xM7qcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="243489810"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:07 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 0/5] Improve eudebug test cleanup
Date: Fri, 13 Feb 2026 11:58:56 +0100
Message-ID: <20260213105855.3790052-7-christoph.manszewski@intel.com>
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

Christoph Manszewski (3):
  xe/xe_eudebug: Add reattach function and make plain connect private
  lib/xe/xe_eudebug: Track active debugger sessions and close when
    disabling
  lib/xe/xe_eudebug: Get drm card sysfs path

Dominik Karol Piątkowski (2):
  tests/xe/xe_eudebug: Change pthread_join to pthread_timedjoin_np
  lib/xe/xe_eudebug: Modify toggle error handling

 lib/xe/xe_eudebug.c             | 212 +++++++++++++++++++++++++-------
 lib/xe/xe_eudebug.h             |   2 +-
 tests/intel/xe_eudebug.c        |  13 +-
 tests/intel/xe_eudebug_online.c |   6 +-
 4 files changed, 179 insertions(+), 54 deletions(-)

-- 
2.47.1

