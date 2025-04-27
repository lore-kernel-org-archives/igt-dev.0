Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA2C369D1
	for <igt-dev@archiver.kernel.org>; Sun, 27 Apr 2025 17:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111A310E02B;
	Sun, 27 Apr 2025 17:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFMKBqpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E020210E02B
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Apr 2025 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745774404; x=1777310404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/50pkaQYjdl45zgMTsBH2ccixcdCtFs8xcEiqS/5DPw=;
 b=dFMKBqpBalVAuHeuvlF4jOTNXUpZTtcfNS7Db612cI5K+CfVftwHfOxY
 7vlzpd5ZXm+j1YnAc1PKZorJ0rMxCGHG/wHpFmTRiLnSdhAInuWIFu40+
 DCWxSxYaORgSQCHlAhmDmqWKTEOCgmw0k4yhaQWrxaqnA6/0xVRGp69xe
 9s/Ehuvp5yopESGEiSAqpd9NcW/VoZspcfnhauhrTy7RhIyls1OX/soyd
 HIPfaz5TW8kbS9VrxdsZhp3iLauPNOguBTb5B4Yi3ZAqXtlS6Zma7+eop
 xE6p7KpFdhXadk/1zbZJCf3Cy16TqixeKW5fQLO5t3zWGMW8NRiWbuADo A==;
X-CSE-ConnectionGUID: 0VpFF+iVQkeczQc06BfXdQ==
X-CSE-MsgGUID: 5TlwyefnRm2by22dDsNO4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="51038209"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; d="scan'208";a="51038209"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 10:20:02 -0700
X-CSE-ConnectionGUID: jv8c8S+cT5aF8FD4yu0EWQ==
X-CSE-MsgGUID: Ws29J7QcRNKvgv6W0HkJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; d="scan'208";a="133242535"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa006.jf.intel.com with ESMTP; 27 Apr 2025 10:20:01 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t 0/2] fix error reported by checkpatch.pl
Date: Sun, 27 Apr 2025 17:19:24 +0000
Message-Id: <20250427171926.1392288-1-shuicheng.lin@intel.com>
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

Fix error reported by checkpatch.pl like below for all xe_*.c under
tests/intel folder.
There are still some errors remain, will fix them later.

Shuicheng Lin (2):
  tests/intel: fix error of code indent should use tabs where possible
  tests/intel: fix error reported by checkpatch.pl

 tests/intel/xe_dma_buf_sync.c        |  2 +-
 tests/intel/xe_eudebug.c             |  6 +--
 tests/intel/xe_evict.c               | 10 ++---
 tests/intel/xe_exec_balancer.c       |  2 +-
 tests/intel/xe_exec_basic.c          |  2 +-
 tests/intel/xe_exec_compute_mode.c   |  2 +-
 tests/intel/xe_exec_fault_mode.c     |  4 +-
 tests/intel/xe_exec_mix_modes.c      |  3 +-
 tests/intel/xe_exec_queue_property.c |  2 +-
 tests/intel/xe_exec_reset.c          |  2 +-
 tests/intel/xe_exec_store.c          |  3 +-
 tests/intel/xe_exec_threads.c        |  2 +-
 tests/intel/xe_fault_injection.c     |  2 +-
 tests/intel/xe_huc_copy.c            | 18 +++++----
 tests/intel/xe_module_load.c         |  2 +-
 tests/intel/xe_oa.c                  | 57 ++++++++++++++--------------
 tests/intel/xe_pat.c                 |  2 +-
 tests/intel/xe_pm.c                  |  2 +-
 tests/intel/xe_query.c               | 16 ++++----
 tests/intel/xe_vm.c                  | 28 +++++++-------
 tests/intel/xe_waitfence.c           |  2 +-
 21 files changed, 85 insertions(+), 84 deletions(-)

-- 
2.25.1

