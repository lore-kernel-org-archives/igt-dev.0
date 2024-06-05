Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8111AC27C52
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 18:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FB610E305;
	Wed,  5 Jun 2024 18:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBXtjfGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740E210E314
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611249; x=1749147249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u5o70X2MczOXRsKfUXW41TLesmfFBsEBWX+RsUQTQt0=;
 b=XBXtjfGNubc/SFmF9w1q6FTNsVG0CRrWEGCo+OG2CUXXhRRDEHF7ijo3
 f2P6ZkxB2MvmRGosS+7rcr95J1oQyuW9Uw5VsJMGlFWSunS4GrA78jVH7
 XBqIm+MTanVuF0WOpaCyP+S5GM0iYk1eazvUJJNXRsyRXGbXA1LfJUFe8
 5KBnyHHZr8tlYWxg+V+bU6ILZHrivcjugro7PxUnxSNS9E5rEjJjpSQiJ
 wfH/sde6kRpk+vtIDVel+q1VV2LDyP/GIb94sgNF/iJR3civj1GFVWpzy
 rlc1QuzZVZgs0E3g+SSaCKccZWsapraasGrHbekazMa8o0I/bgXuBp+95 w==;
X-CSE-ConnectionGUID: Pjbe2FG2TDmZCJaOIXA35A==
X-CSE-MsgGUID: 4oKqWav+TICXT6UP25iNKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14084381"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14084381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:59 -0700
X-CSE-ConnectionGUID: gCsyheiaRt60U0IuENYBng==
X-CSE-MsgGUID: QncmiSELQsebtaBa5F+0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37659532"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:58 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v4 0/2] lib/xe: Use synchronous gt resets when needed
Date: Wed,  5 Jun 2024 10:58:41 -0700
Message-Id: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add a new xe_force_gt_reset function, xe_force_gt_reset_sync, renaming
the original xe_force_gt_reset to xe_force_gt_reset_async.  This allows
the user to decide whether or not they want to initiate a synchronous or
asynchronous gt reset.  The asynchronous reset function was otherwise
unchanged, but the synchronous reset function operates by calling a new
debugfs function.

Tests will use the asynchronous gt reset function by default, but the
test xe_exec_reset@cm-gt-reset will want to use the synchronous version
because it lacks a blocking mechanism on the reset and may race with
itself otherwise.

v2:
- Create a new function for synchronous gt reset instead of using a tag
  to denote between the two modes (Matthew Brost)

v3:
- Fix compile issue

v4:
- Use helper function for xe_force_gt_reset_[sync|async] functions to
  reduce code duplication (Matthew Brost)
- Add missing revision notes

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
Test-with: 20240605150828.2736396-1-jonathan.cavitt@intel.com
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

Jonathan Cavitt (2):
  lib/xe: Add sync and async xe_force_gt_reset options
  test/intel/xe_exec_reset: Synchronize cm-gt-reset gt resets

 lib/xe/xe_gt.c              |  2 +-
 lib/xe/xe_ioctl.c           | 16 +++++++++++++---
 lib/xe/xe_ioctl.h           |  3 ++-
 tests/intel/xe_exec_reset.c |  8 ++++----
 tests/intel/xe_gt_freq.c    |  2 +-
 tests/intel/xe_wedged.c     |  2 +-
 6 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.25.1

