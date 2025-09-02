Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C3DCA0FFE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515A210E6B5;
	Tue,  2 Sep 2025 12:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjWuUY1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7499E10E6AA
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816349; x=1788352349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OeX8+Tozh4sGJ3rTOQIq6rI54Kzl8HzAyHxgG53mH+4=;
 b=DjWuUY1Yg8CEiM+2A0W8cy7yH2DZxr0BYsx80Dxb8BMwOJbpbxaE7QD3
 QqhLoWEb2ACigcAspBNN6+HDN7WonSmebjpJydi9ZFe44LgmufE1RUPc8
 zxwgmyVMQdmmTyG23bpQG+NLFvmftuwqV6enqzgUWtyb/TrE3OjjjwaCo
 5B6jZh7vVmlv8PCQYdry2kquAs9h5nGVCNZzvNSDF7RHwmUj/+Kwu1Yf+
 5+/TLQlxUPxA+1KT0ru4pZWQzkXi5p7lhsFpCAsCoiXCiMLJJZRDhPHVr
 cVKTW/mR9Ik5lhUOwnfjhww/syRW2WlZwenn+WILDlbIgDbEdTZJYqFg/ g==;
X-CSE-ConnectionGUID: VB7jSMmHSzGAWSJH2fftMA==
X-CSE-MsgGUID: qpkEuRX2ROu0pz3fRyiSvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517404"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:29 -0700
X-CSE-ConnectionGUID: qvob7vNjQ3GleHkKCkl7gw==
X-CSE-MsgGUID: shZNlHoUTLGsFRkXyi9hOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153261"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:27 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/7] Fix xe_eudebug_online@set-breakpoint-sigint-debugger
Date: Tue,  2 Sep 2025 14:31:56 +0200
Message-Id: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
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
SIGINTable section is unsafe. Hardening igt_vlog would require major
igt_core adjustments, making this approach a last-resort. A simpler way,
guaranteed to not break any other tests, is to remove _all_ igt_vlog
calls from the SIGINTable section.

While the test could be rewritten to gracefully exit from the main
debugger loop, it will lose all of its value - all of the ioctls that
are to be hit with SIGINT are inside triggers, that are called from the
debugger loop. With this approach, the test will merely validate IGT
implementation of debugger loop instead of actually testing kernel, as
we will never SIGINT during ioctl this way.

This series addresses the issue of deadlocks by removing all igt_vlog
calls from SIGINTable section of set-breakpoint-sigint-debugger test.
While at it, harden xe_eudebug library code and xe_eudebug_online test
code in the set-breakpoint-sigint-debugger path that can produce
unwanted igt_assert fails due to unfortunate timing.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (7):
  lib/intel_allocator_simple: Introduce alloc_debug and alloc_info
  lib/xe_eudebug: Harden xe_eudebug_client_stop for SIGINT
  tests/xe_eudebug_online: Add startup delay for
    set-breakpoint-sigint-debugger
  tests/xe_eudebug_online: Remove unneeded logs from
    set-breakpoint-sigint-debugger
  lib/xe_eudebug: Introduce __xe_eudebug_ack_ufence
  tests/xe_eudebug_online: Introduce SIGINT_DURING_TEST flag
  tests/xe_eudebug_online: Introduce flags to eu_ctl functions

 lib/intel_allocator_simple.c    | 15 ++++++--
 lib/xe/xe_eudebug.c             | 21 ++++++++--
 lib/xe/xe_eudebug.h             |  3 ++
 tests/intel/xe_eudebug_online.c | 68 ++++++++++++++++++---------------
 4 files changed, 69 insertions(+), 38 deletions(-)

-- 
2.34.1

