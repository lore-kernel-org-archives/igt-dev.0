Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C17CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5C210E9C5;
	Thu, 16 Oct 2025 11:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAxEm39y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E964710E9C4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760615447; x=1792151447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GuxXL2D7Iw63ch4FQs4a60GysgDDPopEfmbydpq831M=;
 b=aAxEm39y/mi2ObY1vgIO8R0MfSlokQekBBOXFYvfK2PCCFTTRw51TEsJ
 rIbYojOD5TSAqVqTx18/0UI+I/IPmpS6Aq/4366+91WaU7qJcwc3PwLxA
 yHL/7aXIR+b0CTfznz1Hm96swjSaBxvwX+J0LHttEGMTeFLF7n5RIX+lg
 /TbdxfIFjvzUbkE7mGg2FUITDxJBOKZh9ILpHmZHwRehmrRBzd8NQZc25
 NOefpKKbtYDRByDbe140Yg5/v8wXxgAtVOs9t4IdRzPi8RW8/SWbKmh4u
 4FMJDfGBPR9eq9c67SPw2aow9Ayeck47bZfFhXmbvnhInQwfhQUwodL7h w==;
X-CSE-ConnectionGUID: RWhXuZ8wTq+uM+EGeHWcbg==
X-CSE-MsgGUID: nUut1yVDTl6KkrrbL+g9Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66635791"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66635791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:50:47 -0700
X-CSE-ConnectionGUID: 2EqLm3mZSjmRlTtdiJge5A==
X-CSE-MsgGUID: IKKLsLiOQQiwDE8MkxtPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181565977"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 16 Oct 2025 04:50:45 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v6 0/2] lib/intel_allocator,
 tests/kms_concurrent: Check for SYSVIPC
Date: Thu, 16 Oct 2025 17:08:14 +0530
Message-Id: <20251016113816.3343875-1-s.sebinraj@intel.com>
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

S Sebinraj (2):
  lib/intel_allocator: Add SYSVIPC support check
  tests/kms_concurrent: Fix for msg_queue failure

 lib/intel_allocator.c  | 23 ++++++++++++++++++++++-
 lib/intel_allocator.h  |  2 +-
 tests/kms_concurrent.c |  3 ++-
 3 files changed, 25 insertions(+), 3 deletions(-)

-- 
2.43.0

