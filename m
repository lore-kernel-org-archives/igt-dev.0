Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A51CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 15:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EDD10E0A3;
	Wed, 27 May 2026 15:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OyJ9inMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC5810E814
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 15:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779894252; x=1811430252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gygwp0uVS517a4aidF2HoIDFqQvCEFDAhhoeCDtW7Vg=;
 b=OyJ9inMBJLiFXZfjR4wuAmQh5smLzpmmxd8USpomgAySeei7v5qvO8vI
 SCyJNMV0RxZzHojOM2QwZqD1U6v9N2igZs0LPV0V4IuqfnDDyytDKp64P
 qeHh+eN1jwJB8EL4OB7Sn8m5f5UdyRS7BAnmlAR6kJ4qix0vQDQEF8fP0
 KAPRjtm5mCcZC3mqAb+cIgUNE/97EbOPqll+ocSy6O/9n2HAXtEHj35gW
 08Fjepx9ovHDh3OopSL+jmsc0jXzq3BqRLOTIqAVSodA6x7qlm1GjOE1w
 9mcTBZgOmjQXlDNO6BrrhK7r/3ZJ76N9rReguHNoIw0SFW+jhtKwg1GID A==;
X-CSE-ConnectionGUID: C/9U6aMoToCGrXWh/0zkCA==
X-CSE-MsgGUID: ASLCHQyLTYKYfLcxnG5DGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80836568"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80836568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:04:12 -0700
X-CSE-ConnectionGUID: tavm4U3RSGWKiPPmmhmRDw==
X-CSE-MsgGUID: /aF06xGlQwuJIN4n7GelnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="246292517"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:04:05 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] tests/xe_userptr_pressure: Add rebind-under-compaction
 test
Date: Wed, 27 May 2026 17:03:45 +0200
Message-ID: <20260527150355.1671044-1-jan.maslak@intel.com>
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

This series adds xe_userptr_pressure, a new IGT test file targeting the
userptr bind/rebind paths under sustained memory pressure.  The goal is
to provide a reproducible regression signal for bugs that only surface
when the kernel's compaction machinery is actively migrating userptr-backed
pages concurrently with GPU VM operations.

Written to catch regressions like the one fixed in
"drm/xe/userptr: fix notifier vs folio deadlock".
See: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4765

v2:
 - Restore THP defrag via fixture teardown instead of subtest-local cleanup
 - Add an exit handler so THP defrag is restored on early exit or Ctrl-C

Jan Maslak (1):
  tests/xe_userptr_pressure: Add rebind-under-compaction test

 tests/intel/xe_userptr_pressure.c | 416 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 2 files changed, 417 insertions(+)
 create mode 100644 tests/intel/xe_userptr_pressure.c

-- 
2.43.0

