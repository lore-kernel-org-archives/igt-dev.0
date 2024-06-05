Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F394C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 16:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D913D10E033;
	Wed,  5 Jun 2024 16:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oim9pzJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457F210E0F9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717606140; x=1749142140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DcE/jyFlsfz87SaLU9IxyvkDuzIF18jgPu6jUKUNuLI=;
 b=Oim9pzJAEdQ/OM6abgBX6P96Y3JTE1znox1yk7s0Y+Irz1ddWBUgY1zd
 rVxxrWfVpLbqeB7L/t9m/IYNs02PpaPb6D6M79gcUml6w1lyfciiWoXzq
 6mjXrtqcDVKJBmjs2pEZX8mr+EAdK0WYkW/ai3MzVWcYvnaStPJRYWB3E
 8zrOYOdZIjQTkZprxcdgoD5LL27gpEH9YElK7clfk6ZcLgXCPGN4A3rxm
 X2/Su6iaUPa5RgMxijbgXlFAhUXo6yUAmZdfBOE3R+3xiJJlAhKgCWByO
 KVsy9pYRjaUIgAYd1s7/e6BTwnOFYKdoeCvwRo+4UmRd4ZQe+TKKNA6n3 w==;
X-CSE-ConnectionGUID: pfgni0ppRXa3xBTwbeMq7A==
X-CSE-MsgGUID: G1+i3mf8SZS8gMvV8536fQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14072472"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14072472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:49:00 -0700
X-CSE-ConnectionGUID: NJzS9wdoT06NYXcwAi12QQ==
X-CSE-MsgGUID: cFKtSfu/SRO7XpzgngYQYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37666103"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:48:59 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v2 0/2] lib/xe: Use synchronous gt resets when needed
Date: Wed,  5 Jun 2024 09:33:42 -0700
Message-Id: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
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

