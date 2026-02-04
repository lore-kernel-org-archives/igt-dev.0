Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21757E95377
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F8910E1C3;
	Wed,  4 Feb 2026 10:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBGRCLlE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D71C10E1C3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770202677; x=1801738677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tPFnGBjoGEjHg2UPuCIkSYCUiOT9Ltj1gsxA8CeWaOY=;
 b=GBGRCLlExmeO/k3fFYyEE/5Ld91Rta+4chicT7EsCXI0prO7K358mWV+
 i4JM1OTDuuHnSf4WWe2QqAN4JiDxjvWLx7dkghmReprNim0TIEjCsTcw2
 LuuwWg9ODGLau8paSoR8VMCY5F4xQa22WQdBl8uJqWB9C5PAKxiq/Ulvm
 kLN1JCkggPT5ehUj6rSoyFZTqQzf7geHSxea6+/d4Ox6bSPmEI2BYAOc+
 ceC3XZ6STv1eYxNAbqgxH3PjCFdi/WSKvfehrp0WbENRO8TqRaJYvwLgd
 LzYV86QN88U1hcZ1eONLrnqPNAnu62qQSl6MvoTJbPFIv0atWOpR2qeoW w==;
X-CSE-ConnectionGUID: c0lKI/YuS9O3AyDr7dYtzw==
X-CSE-MsgGUID: qC9BF7DhSQiONCuCYuKAwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75007227"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75007227"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:57:56 -0800
X-CSE-ConnectionGUID: X8NfJEpPSYicsjDLFc5gWw==
X-CSE-MsgGUID: SXM/w4D8SsSpQvIefsxMuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="215110655"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:57:56 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/3] Improve eudebug test cleanup
Date: Wed,  4 Feb 2026 11:57:39 +0100
Message-Id: <20260204105742.13871-1-dominik.karol.piatkowski@intel.com>
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

When there is a debugger fd open and an assert fails, there is a problem
with environment cleanup. If enable_eudebug toggle was previously off,
it is impossible to turn it off in case there is _any_ open debugger fd.

Keep track of all opened debugger fds in igt_main and close any leftover
ones before attempting to restore enable_eudebug state.

Change pthread_join to pthread_timedjoin_np in discovery-race* tests to
avoid hang before reaching cleanup.

Add retry mechanism in xe_eudebug_enable to make sure the cleanup will
not fail due to race conditions. Abort on unsuccessful cleanup to not
leave the environment in potentially dirty state.

v2: Preserve skip behavior in xe_eudebug_enable

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (3):
  lib/xe_eudebug: Add retry mechanism in xe_eudebug_enable
  tests/xe_eudebug: Improve cleanup on test fail
  tests/xe_eudebug_online: Improve cleanup on test fail

 lib/xe/xe_eudebug.c             |  24 +-
 tests/intel/xe_eudebug.c        | 297 ++++++++++--------
 tests/intel/xe_eudebug_online.c | 529 +++++++++++++++++---------------
 3 files changed, 469 insertions(+), 381 deletions(-)

-- 
2.34.1

