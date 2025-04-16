Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D35C369BA
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 16:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EC110E296;
	Wed, 16 Apr 2025 16:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cP+G8Gm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E1A10E296
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744821090; x=1776357090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6LTMQ47vf7esfinRxvWz4Cb5uY9NoNY8SaOqCo/RGL8=;
 b=cP+G8Gm0DBUe2k5YTp0q4/WH2CbNmg7N2aLbfZIY2DTzwV/uUvtNbExX
 4yaHfhEB0jCEaUbL70uFSNS591+FgZy6Rhg0+lzS4BeaQoB03cIxjMgNx
 7qJ7euecEhP5zsjEmlBnTrA27mHyPtW3L/fTKPexq5QuakssvwdxM3Ywy
 b0H/9YYZ72+SvQWp3HkdxcU/9pyC/ETHb/XaWdHYpHnuBC5I3U1+Jk//h
 hKh5DbPj7gL8UBmg1sGAV85vbsoVVYkvllaox6/Grz4mLnjZ8lHPb9Tmj
 h6/AiN3Jp+r569nyXSC705qAWuTCz+aAg7ofO67OdzSGjjq7UeInjvU1k w==;
X-CSE-ConnectionGUID: Sf8EVnQmQkGnt7CXoJSADw==
X-CSE-MsgGUID: LwMKigtcRteBfNX6hvOZIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45515087"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="45515087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:31:30 -0700
X-CSE-ConnectionGUID: BAyKfjF3TMiNLYdiskIryQ==
X-CSE-MsgGUID: NWzMYO44SBGUYC5YJwO61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130380156"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 09:31:29 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t 0/3] replace div64_u64_round_up() with DIV_ROUND_UP
Date: Wed, 16 Apr 2025 16:30:50 +0000
Message-Id: <20250416163053.117425-1-shuicheng.lin@intel.com>
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

DIV_ROUND_UP is defined in igt_aux.h with the same function as
div64_u64_round_up().

Shuicheng Lin (3):
  tests/intel: replace div64_u64_round_up() with DIV_ROUND_UP
  lib/xe: replace div64_u64_round_up() with DIV_ROUND_UP
  benchmarks/gem_wsim: replace div64_u64_round_up() with DIV_ROUND_UP

 benchmarks/gem_wsim.c           |  7 +------
 lib/xe/xe_util.c                | 10 +---------
 tests/intel/gem_exec_balancer.c |  9 ++-------
 tests/intel/gem_exec_fair.c     | 11 +++--------
 tests/intel/gem_exec_schedule.c |  9 ++-------
 tests/intel/gem_watchdog.c      |  9 ++-------
 6 files changed, 11 insertions(+), 44 deletions(-)

-- 
2.25.1

