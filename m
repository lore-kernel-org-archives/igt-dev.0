Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F56CCAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 12:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2343C10E20F;
	Mon,  8 Sep 2025 12:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oi2YkyV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C68910E20F
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757336102; x=1788872102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWuqB4x+/HBL8r2U3i8H/oFvKZayFrV93EKxIWTYcsA=;
 b=Oi2YkyV9PhngsgLpidQIeG3Svr/BCAntOTfHKaez6SXwrwaZ/pYX6oL4
 M+6aQ26Tz01+mS0/x9k/eCw9pLSJIVVYGS3iyE/NjxVQg1JxCRXbBVa3k
 yMpahJDJK1YUauABbacLKP+PMgQW079AN2UAwV04zGAFt39Av8Ygp8E4W
 +CURlOCrX8rZzuBCYWd4Ugb1r7t45FQE6PWBLl9bOE4KvUjpPDH0qXg28
 vMHPwWnO4NW3LWNbSM0Kf4oyYAWUoS+mrhGta1E78fLCP1okyyFAnZP8G
 eeb0HAUdD7x8bwqnPgbcwR7dMBb2VXVnMp1Zr7dhODDrhRfkdbf31Q54d A==;
X-CSE-ConnectionGUID: hWXE6zGPQ5KmG6fEe50rpA==
X-CSE-MsgGUID: 3qW121ZrRSG3OD7GlV8hdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70688722"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70688722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:02 -0700
X-CSE-ConnectionGUID: e3/7uIFpQayg8sIFNxzC5g==
X-CSE-MsgGUID: 5tRy9vR4QLyTB3quLf5deA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177101495"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.208])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:01 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/4] Fix
 xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Mon,  8 Sep 2025 14:54:44 +0200
Message-Id: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
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

Sporadically, the test deadlocks. It turns out, in a test scenario like
that, every call to igt_vlog (that is, igt_info, igt_debug, etc.) inside
SIGINTable section is unsafe.

While the test could be rewritten to gracefully exit from the main
debugger loop, it will lose all of its value - all of the ioctls that
are to be hit with SIGINT are inside triggers, that are called from the
debugger loop. With this approach, the test will merely validate IGT
implementation of debugger loop instead of actually testing kernel, as
we will never SIGINT during ioctl this way.

This series addresses the issue of deadlocks by blocking SIGINT during
igt_vlog. While at it, harden xe_eudebug library code and
xe_eudebug_online test code in the set-breakpoint-sigint-debugger path
that can produce unwanted igt_assert fails due to unfortunate timing.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (4):
  tests/xe_eudebug_online: Add startup delay for
    set-breakpoint-sigint-debugger
  lib/igt_core: Block SIGINT during igt_vlog
  lib/xe_eudebug: Fix safe_pipe_read
  lib/xe_eudebug: Don't fail in __wait_token if pipe was broken

 lib/igt_core.c                  |  6 ++++++
 lib/xe/xe_eudebug.c             | 10 ++++++++++
 tests/intel/xe_eudebug_online.c |  3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.34.1

