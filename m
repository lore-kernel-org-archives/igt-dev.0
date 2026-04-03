Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA0DD730AF
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 07:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DCE10E089;
	Fri,  3 Apr 2026 07:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqHG9zxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E6A10E089
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775200406; x=1806736406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3s1lG6AiS9GapVi7GiTtfNC0GU6fDwTNY7X4uacscVU=;
 b=IqHG9zxUGy3TtrD/UQCUnAhtCWmH6XPZluUzCmrsaovzz03+xrAGPZU8
 4+VESm//Z11mnEkgWI9oycJWU/nns9RXYEBCBAVhMtVHSSYb9Ye2/J+b5
 PVyH255G4PT6dMFsNFmoVk3nHAnNcrs9hepzsRvnITnQdmmr+/KA95o7I
 mWdLOEMmN5nwP+bg2pJAHnB7e5bnFdFItOsd8jtzWp+oNhCAqPB9S+liO
 AqblX+N5DXGm/IOMXlzaI90S55NOb/dRX1uZCm2YljJQh2BEZyZIJlTcr
 k5vOTkLAESdMKI3LAzojqkGANaj+ZuBqy2OX75QR2CNK8N33s/OHegql4 A==;
X-CSE-ConnectionGUID: XCShmkArT/uOF/Br9Ye4jw==
X-CSE-MsgGUID: 7wSZjqIZSUib7MOMc5NDig==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76151708"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76151708"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 00:13:25 -0700
X-CSE-ConnectionGUID: la9KWZAxR12A37AuMzm/kw==
X-CSE-MsgGUID: uYSFtR07QZayZCGeTaCS/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="228819958"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 00:13:25 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 0/4] lib/xe: query engine class capabilities from debugfs
 info
Date: Fri,  3 Apr 2026 00:13:18 -0700
Message-ID: <20260403071322.366766-1-x.wang@intel.com>
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

The xe kernel driver recently started exposing engine class capability
bitmasks in the debugfs "info" node:

  multi_lrc_engine_classes vcs vecs
  gt0 multi_queue_engine_classes bcs ccs

These entries were introduced by the following KMD series:
  https://patchwork.freedesktop.org/series/163802/
  - drm/xe: improve readability of debugfs engine info output
  - drm/xe: expose multi-lrc engine classes in debugfs info

This series wires up IGT to consume these debugfs entries:

Patch 1 adds two bitmask fields to struct xe_device (multi_lrc_mask and
multi_queue_engine_class_mask) and populates them in xe_device_get() by
reading the debugfs "info" file line-by-line.  UINT16_MAX is used as a
sentinel meaning "not available" so that older kernels that do not expose
these entries continue to work via the existing hardcoded fallbacks.

Patch 2 implements xe_engine_class_supports_multi_lrc(fd, engine_class).
When the kernel-reported bitmask is available it is used directly; otherwise
the function falls back to returning true only for VIDEO_DECODE and
VIDEO_ENHANCE, matching the previous hardcoded behaviour.

Patch 3 refactors xe_engine_class_supports_multi_queue() in the same way,
adding an fd parameter so it can consult the kernel-reported bitmask.  All
callers (direct calls in xe_exec_threads.c and macro users in
xe_exec_multi_queue.c) are updated accordingly.  Note that
xe_for_each_multi_queue_engine_class() gains a mandatory fd parameter as
part of this change.

Patch 4 guards the balancer and multi-LRC codepaths in xe_exec_balancer,
xe_exec_reset, xe_exec_threads and xe_drm_fdinfo with
xe_engine_class_supports_multi_lrc() so that tests are skipped rather than
failing on engine classes whose hardware does not support multi-LRC
submission.  It also ensures the parallel-queue rejection check in
xe_exec_multi_queue __test_sanity() is only exercised for engine classes
that support multi-LRC.

v2:
  - Merged previous xe_exec_multi_queue expected-error fix into patch 4 two
    patches share the same logical motivation.
  - xe_exec_multi_queue: use `if (n > 1 && xe_engine_class_supports_multi_lrc())`
    instead of a ternary to select the error code (Niranjana)

Xin Wang (4):
  lib/xe: cache engine class masks from debugfs info
  lib/xe: add xe_engine_class_supports_multi_lrc()
  lib/xe: use debugfs info to implement
    xe_engine_class_supports_multi_queue()
  tests/intel: skip or adjust tests for non-multi-LRC engine classes

 lib/xe/xe_query.c                 | 156 +++++++++++++++++++++++++++---
 lib/xe/xe_query.h                 |  21 +++-
 tests/intel/xe_drm_fdinfo.c       |   2 +-
 tests/intel/xe_exec_balancer.c    |   6 +-
 tests/intel/xe_exec_multi_queue.c |   6 +-
 tests/intel/xe_exec_reset.c       |   2 +-
 tests/intel/xe_exec_threads.c     |   5 +-
 7 files changed, 168 insertions(+), 30 deletions(-)

-- 
2.43.0

