Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832B4CD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 04:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A2710E2EA;
	Wed, 13 May 2026 04:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HR8fqbxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382B10E5A9
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 04:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778647000; x=1810183000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Abj5D9a9Fzf4ekUd+MGOsGn6Gaua5ELHWXyUVdyOTUE=;
 b=HR8fqbxWhjp9bUztI4XK5oVLqLO64qnSa+eOXW1oc49ZikrelwEGQZG5
 lhLW8bHrL9a9KC5KMk1RZ64cRKx6DG8Pz8LTEE3KJ79JwK2dZtCtwDN+2
 H5WDlothjNhQR0bbIB0F4Sn+yb/Eab+GYKwHLyOBNctTQlDjGxdoVSmWc
 mmEwMRojJ/gx2uw/9m9mKzhcXo1cdfZykWOn41EVVRmTyrlZOPQ2zTGEC
 TeX6AdruUhl4/9JaIBTTHd56mdR6jP8NuS2iI3NXh1SzrHHAPJRLVKDSI
 Sgq5MR1knjdkVj7Sb6zDDrEuEkr3VhG7LsEnhe/FBSJLxIV6tpsk6UonY Q==;
X-CSE-ConnectionGUID: cLpKrR+0Qo2RXBSA+qSoog==
X-CSE-MsgGUID: zxvbtyE6RI23cson0jgPzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83180144"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="83180144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 21:36:39 -0700
X-CSE-ConnectionGUID: 733xqi9YQM6P3nkbFsua/w==
X-CSE-MsgGUID: y2YOZjlVQrOIsD5mAoJjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="235301076"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 21:36:38 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v1 0/1] Fix assert vs error in lib/intel_wa
Date: Wed, 13 May 2026 10:06:26 +0530
Message-ID: <20260513043629.1533907-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

igt_has_intel_wa() currently returns -1 on error, 0 if the workaround
is not present, and 1 if it is. There is no point in distinguishing
between the error and no-workaround cases for callers. If the debugfs
directory cannot be opened, that is an unexpected test environment
failure and should be caught immediately with an assert.

Simplify debugfs_file_has_wa() by removing the igt_debugfs_exists()
check — igt_sysfs_get() returns NULL for missing files, so the helper
naturally returns 0 without it. Guard the device-level workarounds
check in igt_has_intel_wa() with igt_debugfs_exists() since that file
may not exist on kernels without device OOB workaround support.

v1: Initial set of changes.

Shekhar Chauhan (1):
  lib/intel_wa: Assert on error instead of returning -1

 lib/intel_wa.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

-- 
2.53.0

