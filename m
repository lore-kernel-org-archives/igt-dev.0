Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48750CA0FED
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 20:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D928E10E16A;
	Tue, 26 Aug 2025 20:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkDa2nHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0953A10E132
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756239512; x=1787775512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=prynr9hE4liFekAsC5S3KUdTpopNPYcRB61FjwhWp5I=;
 b=mkDa2nHgyfwOGIlKN+REfWe8pg9GavNuZtV+5mN3/mMBO2y7TXVg+97/
 urgH+9oBvX24T+a7PzZsMFMJ5tBogP8/E2M62TavB/YKbR2qydQZFSKDg
 AnCQrOHhI4mvbglTibc1P/PZKET5iY7s6rQz2SYzk1PydIycAxVOJ+kqO
 atIiaPsd7hF5NkzIpXz8jtd/96poxBrQLR/l9pYcHz+pftk/DPiuGsaIY
 zm/ATpmBWqexK92DbG0SRh1HZKz0ZjYGkn2s5XF0omwBTJa4M/AiYDqaO
 RzmBANK+ZEIjQd7ZxSsGhmiDmGysDkHw6M76XoGR8geC7g/R3NyF7g31z Q==;
X-CSE-ConnectionGUID: K2DyRqQNT623IR5WfaLG6g==
X-CSE-MsgGUID: trpZyE2CTTWzwuRTzSbAqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="46068139"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="46068139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:18:32 -0700
X-CSE-ConnectionGUID: wKNPyzdjTb2SNezdaPzJew==
X-CSE-MsgGUID: aiuKIxhcRYWM+/jezVwjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168907869"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:18:31 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 0/4] lib/xe: Add fault injection helper functions
Date: Tue, 26 Aug 2025 20:18:25 +0000
Message-ID: <20250826201829.190241-6-jonathan.cavitt@intel.com>
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

Move several functions from the xe_fault_injection test suite to their
own helper function.  Specifically, the following functions were
migrated over:

- fail_function_injection_enabled
- ignore_dmesg_errors_from_dut
- injection_list_add
- injection_list_append
- injection_list_remove
- injection_list_clear
- setup_injection_fault
- get_remaining_injection_count
- set_retval

Several functions were renamed during the migration process to unify the
namespace.  Additionally, a new function, injection_exit_handler, was
added, which performs the same functionality that the function call
'igt_install_exit_handler(cleanup_injection_fault);' performed before.

The declaration for struct fault_injection_params was also moved over,
as well as a default param setup.

Moving the functions over this way affords us the opportunity to
investigate the xe_fault_injection tests to see if they should be
implemented in different test suites.  It also additionally affords us
the opportunity to decouple the xe_vm@bind-array-conflict-error-inject
test from CONFIG_DRM_XE_DEBUG.

v2: Allow error injection into xe_pt_update_ops_prepare and
xe_pt_update_ops_run as a part of the bind-array-conflict-error-inject
test.  Additionally, update the name of the test to denote which
function is being error injected (Brost, Harrison)

Jonathan Cavitt (4):
  lib/xe: Add fault injection helper functions
  tests/intel/xe_vm: Use fault injection interface for error injection
    test
  tests/intel/xe_oa: Move oa fault tests from xe_fault_injection to
    xe_oa
  tests/intel/xe_vm: Move vm fault tests from xe_fault_injection to
    xe_vm

 lib/meson.build                  |   1 +
 lib/xe/xe_fault_injection.c      | 169 +++++++++++++
 lib/xe/xe_fault_injection.h      |  53 +++++
 tests/intel/xe_fault_injection.c | 392 +------------------------------
 tests/intel/xe_oa.c              |  71 ++++++
 tests/intel/xe_vm.c              | 184 ++++++++++++++-
 6 files changed, 476 insertions(+), 394 deletions(-)
 create mode 100644 lib/xe/xe_fault_injection.c
 create mode 100644 lib/xe/xe_fault_injection.h

-- 
2.43.0

