Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5F1CA6004
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 21:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667FC10E50D;
	Wed,  7 Oct 2026 21:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EslKN2vr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EB910F7E9
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 21:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407172; x=1822943172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vT6TCv+s96nsh5Yn8hAL9DMr6i4riILSoF2LKWJRmsI=;
 b=EslKN2vraq93pWEGcaWwXZ5wMiKw/pzJVjLVcYqY9fWnP14K+CqeDyus
 D11F2XoZ8NAjzl8wNiilvJ4Az1Y62ovC4Q37pvVC4fx0NtuQOJErdIjH9
 lzsdm3otyj+yPlgRRZwDoPkIYjSuGUtcnTyj/TPvnx7KoN9NILeZ8jgEG
 Dy6Zjb63MKEtViQuHhwIr58LSDgkoCm32ILTNA/vUKSgcGGcftWADT3uf
 iIY7TdxdKM8zSshQbYY3fGsNdY4mT9VFSjj0kG73OfwTlh9WY+q+Whi+m
 kbZw/n628eOGYfXc48FFBsLJwJ2jks60i06rhgSK/xnsxzzrSjS4jOqbX Q==;
X-CSE-ConnectionGUID: DlVgQHq1S7+HkDWHGVoL9A==
X-CSE-MsgGUID: mvEWR650RpWC/9oG5ej6JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="190224"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="190224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:06:12 -0700
X-CSE-ConnectionGUID: xwfsIRRlRzW1viH7b3bfLg==
X-CSE-MsgGUID: pelDOoLgRBm4NVFtEhcIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="280839817"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 14:06:10 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/4] Fix dmesg ignore regexes with backslash escapes
Date: Wed,  7 Oct 2026 21:05:59 +0000
Message-Id: <20261007210603.1350158-1-shuicheng.lin@intel.com>
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

Patches 1-3 fix the affected tests by using bracket expressions instead
of backslash escapes, so they work with the current igt_runner:
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
for xe_exec_reset@gt-reset-fault-injection and
xe_wedged@{basic-wedged,wedged-at-any-timeout}, and
the new igt_runner also ignores them with the unfixed xe_exec_reset.

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
 tests/intel/xe_exec_reset.c                   | 11 +++--
 tests/intel/xe_fault_injection.c              |  2 +-
 tests/intel/xe_wedged.c                       |  6 ++-
 7 files changed, 52 insertions(+), 23 deletions(-)

-- 
2.43.0

