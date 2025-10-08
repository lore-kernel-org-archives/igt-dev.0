Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9C2CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 05:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA2D10E1E2;
	Wed,  8 Oct 2025 05:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csZEueDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BBA10E1E2
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 05:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759903176; x=1791439176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u0LEl2TJbGWRbGUvJ/egUN4C3XxYTVPnusxEOiZz7rM=;
 b=csZEueDD+Ztj47DcegDvoXTin+g8t7tWyDnfYamsuy+5rxF5yJIC8H4D
 HBEvGAnH0qcG/J3v3CnF2lOmAxLQYTJhYR206QGnQtZh8B05Pl9U7hzdO
 ilwFBrGPbei5e6NH3CTgXXE+tj2t9xPXbID6hWuXcZh7PWHzC7i6zILpX
 mXktoefaMhtBrajlGYlYNU6VvuaTqXHsqdEGigzvuSRQ0uEiSXt8XaWU/
 ZVVRJgjYLCQpwGvO9RRVx1h/n1mC6EB+L+xang+zs7gFXOOF9WTeRbKrV
 Zcj5wTDoVr+s/pA1+0VsVhvP6cU/Mwu18quCToM89fBZW0pCYtZtHpnL5 g==;
X-CSE-ConnectionGUID: B4mPgwbhRD6IZRFnP6AHfw==
X-CSE-MsgGUID: Muuh/N5ARA2xHP3T7tYz8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73193750"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="73193750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 22:59:36 -0700
X-CSE-ConnectionGUID: 66nGZKDqRUuj0pJ5tStGOw==
X-CSE-MsgGUID: 2E62SjTiQQ2zyN5FC0Hhow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="180299002"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa006.fm.intel.com with ESMTP; 07 Oct 2025 22:59:34 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v4 0/1] tests/kms_concurrent: Check for SYSVIPC
Date: Wed,  8 Oct 2025 11:18:11 +0530
Message-Id: <20251008054812.545177-1-s.sebinraj@intel.com>
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

Check for System V IPC support in kms_concurrent test to handle
targets that don't have it enabled in their kernel.

Without this the test fails in systems that run Android or the
ones which doesn't have SYSVIPC support.

Snapshot of the error when tested with Intel Xe GPU, Target (PTL):
CRITICAL: Test assertion failure function msgqueue_init,
          file external/igt-gpu-tools/lib/intel_allocator_msgchannel.c:66:
CRITICAL: Failed assertion: msgctl(queue, IPC_STAT, &qstat) == 0
CRITICAL: Last errno: 38, Function not implemented

S Sebinraj (1):
  tests/kms_concurrent: Add SYSVIPC support check

 lib/intel_allocator.c  | 25 ++++++++++++++++++++++++-
 lib/intel_allocator.h  | 10 +++++++++-
 tests/kms_concurrent.c |  4 +++-
 3 files changed, 36 insertions(+), 3 deletions(-)

-- 
2.43.0

