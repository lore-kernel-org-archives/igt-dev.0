Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70047CA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 00:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4D010E188;
	Fri,  9 Oct 2026 00:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUkPPaNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E6F10E188
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 00:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791505763; x=1823041763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6LUYRj9QEH3Wly7wP53KLJQ2vcIYlWbhTbMFbOIIHr4=;
 b=AUkPPaNhfcrNdHm8jKwcAh6Cbda/rF1xdqBahrC5V2dR08eoyydx75q3
 PpjxjRndFN86153AVchAW+za8as+bBMsEUyf3K520KNUDFYKRInXt7Tr8
 q55OwBue7Y5FUw4JYEIR8laG6mJMaEUEIYGz7d/TPbwpBTP//mSAiGQ/z
 wWskL05PR0ig9uVOC0vH2WO3XSus+LQQ/8EaFjxvgTjEMoEjzDin2u0TQ
 YkdQoO6tFa0wFSXg+OLxEmXOEhVVKbcYaXUL6MsASGH9Rw3swWsybSgRr
 6oIcC0y60kmX//fw3vrbaoNUYnDwJPf0UyIOnw6LzkKW3OTd6lXOfTbP5 w==;
X-CSE-ConnectionGUID: wruMHSRhTEebt1MtSrBR1A==
X-CSE-MsgGUID: o9/Nk70bTRC8YvMsLs9T/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="306329"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="306329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 17:29:22 -0700
X-CSE-ConnectionGUID: gDKJktAvTuawrsLFN4aXQA==
X-CSE-MsgGUID: pYsQ1wCdTK6w5vr8NABspQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="263899"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2026 17:29:19 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 0/4] Fix dmesg ignore regexes with backslash escapes
Date: Fri,  9 Oct 2026 00:29:08 +0000
Message-Id: <20261009002912.1391610-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

igt_emit_ignore_dmesg_regex() passes the regex to igt_runner through
/dev/kmsg, and the kernel escapes '\' as "\x5c" in kmsg records. Since
resultgen compiles the ignore regex from the escaped record, any regex
using a backslash escape, such as "\(-ECANCELED\)", silently never
matches. As a result, the expected errors in
xe_exec_reset@gt-reset-fault-injection are reported as dmesg-warn.

Patches 1-3 fix the affected tests by avoiding backslash escapes, so
they work with the current igt_runner:
 - xe_exec_reset: "\(" never matches, the expected GT reset failure and
   wedge errors leak.
 - xe_wedged: besides the CAT error escapes (and a missing space), the
   patterns no longer match the SIGID-based messages that newer kernels
   use for the GT reset failure and wedge.
 - xe_fault_injection: "\*ERROR\*" only matches by accident, as it
   degrades to "ERROR" with optional backslashes around it.

Patch 4 fixes igt_runner itself by decoding the kmsg escapes before
compiling the ignore regex, so future regexes can use backslash escapes
as written.

Tested on BMG with drm-tip: the expected errors are no longer reported
for xe_exec_reset@gt-reset-fault-injection,
xe_wedged@{basic-wedged,wedged-at-any-timeout} and
xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init, and
the new igt_runner also ignores them with the unfixed xe_exec_reset.

v2:
 - Patch 1: Drop the parentheses instead of using bracket expressions
   and drop the comment (Kamil)
 - Patch 2: Simplify the SIGID patterns, match only the start of the
   CAT error and add example lines (Kamil)
 - Patch 3: Add example dmesg lines to the comment (Kamil)
 - Patch 4: No change
 - Add Reviewed-by tags (Jonathan, Kamil)

Shuicheng Lin (4):
  tests/intel/xe_exec_reset: Fix gt reset fault dmesg ignore regex
  tests/intel/xe_wedged: Fix wedged dmesg ignore regex
  tests/intel/xe_fault_injection: Avoid backslash escapes in dmesg
    ignore regex
  runner/resultgen: Decode kmsg escapes in ignored dmesg regex

 .../json_tests_data/dmesg-escapes/0/dmesg.txt |  2 +
 .../json_tests_data/dmesg-escapes/README.txt  |  4 ++
 .../dmesg-escapes/reference.json              |  2 +-
 runner/resultgen.c                            | 48 ++++++++++++-------
 tests/intel/xe_exec_reset.c                   |  6 +--
 tests/intel/xe_fault_injection.c              |  7 ++-
 tests/intel/xe_wedged.c                       |  7 ++-
 7 files changed, 51 insertions(+), 25 deletions(-)

-- 
2.43.0

