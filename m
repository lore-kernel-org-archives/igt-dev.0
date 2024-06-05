Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7BBC25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 17:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E6E10E2ED;
	Wed,  5 Jun 2024 17:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aobJLFLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22AD10E2ED
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717608370; x=1749144370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XHYat2v59OpudNUWCe9WTmzy3Fs9kOyciAXHQo42CHQ=;
 b=aobJLFLegfO8Aaba0g9u+rxhZrAYPuXXfd65rmVtJ1u44MD3Ggvm06gz
 9KRkxkwIRDpO+CPw82iGcs4rp/LPHDMYRyr2r2IAq/4eQxqciPuXx9iFY
 jTALqPIrKxBBKL1JM4Q5e7Dfs4lib+xN7T/kn/AEicsvkFXRlNB6BA30o
 6sTHiOtTVHIQfo9Z0WXjnoyv1Ex7SL6f2Sn9kd/jGl7NwW8R5H/nlPfVT
 Dr9oQDbls1m2DK+osp6q9xxMlR6tVKkJA4cg92Zwr+JLyOhACo9n7KpSE
 i6IGmd4EvwWsKVbvBiUY07cYAn/kqLJ47zDkGuNe5ERXkX98N1iqzHVso A==;
X-CSE-ConnectionGUID: 3Hm3j+NsTNK+QlIAeNvWzg==
X-CSE-MsgGUID: ZymsLNxeRdiouLtIiSTmFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14118276"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14118276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:26:10 -0700
X-CSE-ConnectionGUID: 9apxZBEUSxGqX/yJpmTsNg==
X-CSE-MsgGUID: OHj5IHuVQf2s+XC/Msvy+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42242617"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:26:10 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v3 0/2] lib/xe: Use synchronous gt resets when needed
Date: Wed,  5 Jun 2024 10:10:53 -0700
Message-Id: <20240605171055.2772175-1-jonathan.cavitt@intel.com>
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
  to denote between the two modes

v3:
- Fix compile issue

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
 lib/xe/xe_ioctl.c           | 15 ++++++++++++++-
 lib/xe/xe_ioctl.h           |  3 ++-
 tests/intel/xe_exec_reset.c |  8 ++++----
 tests/intel/xe_gt_freq.c    |  2 +-
 tests/intel/xe_wedged.c     |  2 +-
 6 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.25.1

