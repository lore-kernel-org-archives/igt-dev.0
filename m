Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C3D31A14
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596A210E362;
	Wed, 14 Jan 2026 06:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVC5230Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A1D10E362
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373969; x=1799909969;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hbPI4Jw8vo7ELR2KcCr5v5BgBNj6uUubGdYRe/mAjNc=;
 b=UVC5230YPjko91L1+Uo6MjrV5DU2RGqBXMpYXQVQUFWO3fJWuXYqp5Mo
 UjHcetHPW+cdTGe0fvNh6NMV1+zeNcX3YDk+xx3Ff+lHfAonKz2+9j7GG
 OSeVxeuvvnSQ1FgkUiXFlGlndggcRpsU5FEXYAf0ZCHz0cSrRCGJYxNs+
 ZUi4ijJR7d4oB1gGifPXEubeOLJl23kDeTsdwI6SHzD0ljwq2ZIl6DqWv
 lVukyv88A+UxrHDhGVOKRlbWAUA4yVIeRJTTwOeHC3vYaAMI4mxh8rTop
 u0SOMAgNUXb0VvAC8o6FEbXjw9v2LNa9H27xfXBgKLaNfGegZF3Le+vDu g==;
X-CSE-ConnectionGUID: mB4IwEbbRuSdgaXWNIZDqg==
X-CSE-MsgGUID: HlW5u+sSQHK4ckuU38kbvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647887"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647887"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:28 -0800
X-CSE-ConnectionGUID: 1tElzMbgSiOd0rjiEeA+Aw==
X-CSE-MsgGUID: pqFhjoXtRPelQ+uFcoNqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159885"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:26 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 0/9] Extend multi queue feature validation support
Date: Wed, 14 Jan 2026 12:29:16 +0530
Message-ID: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add multi queue validation support to other tests.

xe_exec_fault_mode
xe_exec_reset
xe_evict
xe_exec_threads

v2:
1. Remove documentation changes in this series to avoid confusion
and will be added in a separate patch.
2. Rename emailid's who are no longer valid.
3. Rename multiq in the starting of the patch for the test xe_evict.c.
4. Add cm multi queue tests for xe_exec_threads.
5. Include a patch in this series for new 2 subtests engine-reset and cm-engine-reset
as it's lib changes are dependent for multi-queue-engine-reset test
cases.
6. Separate out lib changes related to cat-error as those are also for cat-error
test cases but include in this series as multi queue cat error test
cases are also dependent on it.
7. Remove lib change related to sync object in legacy mode lib as that
change doesn't add any difference.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (9):
  tests/intel/xe_exec_fault_mode: Add multi-queue test support
  tests/intel/xe_evict: Add basic multi-queue test
  tests/intel/xe_evict: Add multi-queue priority test
  tests/intel/xe_evict: Enhance testing of multi-queue functionality
  tests/intel/xe_exec_threads: Add multi-queue basic test
  tests/intel/xe_exec_threads: Add multi queue for compute mode
  tests/intel/xe_exec_reset: Add tests for engine-reset
  tests/intel/xe_exec_reset: Resolve failures in cat-error tests
  tests/intel/xe_exec_reset: Add multi-queue subtests

 lib/xe/xe_legacy.c               |  35 ++++-
 tests/intel/xe_evict.c           | 104 +++++++++++--
 tests/intel/xe_exec_fault_mode.c | 111 ++++++++++++--
 tests/intel/xe_exec_reset.c      | 184 +++++++++++++++++++++-
 tests/intel/xe_exec_threads.c    | 253 ++++++++++++++++++++++++++++++-
 5 files changed, 644 insertions(+), 43 deletions(-)

-- 
2.43.0

