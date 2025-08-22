Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78655CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 20:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F10F10EBB5;
	Fri, 22 Aug 2025 20:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqP7Wswo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937F210EBB2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755896230; x=1787432230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKjH01b4xIfzfaX0RLbL3ArseXYttgM1snzk+FTGRbU=;
 b=gqP7WswoY75vL2HMAAq0afZqewoC0qgeEew0Z8RIpk7PvwTSTseyKkWP
 J9sR5Pau4vcEvnjlTedssFPqf3Y1iy3cFYGtrR6gSXRbe2wVG2dtmPSLH
 AcUzyzWfUb0QYAhtz31Mu3UYPm4p1mK/MCS+oo+U7qf2/6yvEfQa6VhG0
 7Tib3WpRbpq5qwNzFEKOuuhTvW6j5LYLTMUky4FXjt6trZHjOrc+I1C4A
 /FL/GY6PqCiGHGVWKiyyBpjanFMIlkgvFGjIToESjCu5JmPrul3AtqJ1x
 nFFUwEjKOyDV7Suo+4FPRkeSs+4JpgKCh/q8F3gdWKuxmBTQbJ8iqWMdY w==;
X-CSE-ConnectionGUID: nouPFoh5Q6G4JBz9Y2gHDw==
X-CSE-MsgGUID: KP3p2muSSWCKxGKBm0uW4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58306988"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58306988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:09 -0700
X-CSE-ConnectionGUID: sLc8OH6tS6CZFm/oKd8UhQ==
X-CSE-MsgGUID: UZqbwfMQRqeIA5p70/I74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="172989854"
Received: from dut4086lnl.fm.intel.com ([10.105.10.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:08 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH 0/4] lib/xe: Add fault injection helper functions
Date: Fri, 22 Aug 2025 20:57:06 +0000
Message-ID: <20250822205706.167042-6-jonathan.cavitt@intel.com>
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
 tests/intel/xe_vm.c              | 153 +++++++++++-
 6 files changed, 452 insertions(+), 387 deletions(-)
 create mode 100644 lib/xe/xe_fault_injection.c
 create mode 100644 lib/xe/xe_fault_injection.h

-- 
2.43.0

