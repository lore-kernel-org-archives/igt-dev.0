Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB116CCD1BF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 15:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3EB10E10A;
	Fri, 24 Oct 2025 15:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IduzAOKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A73210E10A
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761318470; x=1792854470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fKYF4bSYX2PYWwtNWZXY7kipP6UwUAMvC6SWqPq/WDI=;
 b=IduzAOKEpHzcNRiorS+cb3DcTxqb8HJvyQJU1izcbUSO7VQOZdfkGie2
 2WzdRsvIJbuWUn848GZ7oWrZDZfq5pxdzCVsk/IuLabhJ5e6/K5viVz9B
 ecEIIESerPtbR6TyA0zLwDM04e1NbrKCHoMARmD4aVKlbRd7f4rbGjNdv
 WB3srdj08560UlriNNoxLpDGDeeTJ2lAro2DBT9sk7HlU+3LqSJ0zCCVE
 d8HXiBbq1Ohh0HLBKp8qlcb1JgVmDYXYbxYEfBP6Fdvj0XZkppRE20l7v
 e5RjGH93TAaKQ7N9YF6K70JSrxSciggxfzwgJhZKRNyD43ryoCO+Sp/Te Q==;
X-CSE-ConnectionGUID: IIdOsGicTPS0X5N7KLpndw==
X-CSE-MsgGUID: zW3OGeAtQuiHBn0kF8DmFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88970166"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="88970166"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:07:47 -0700
X-CSE-ConnectionGUID: 8Y3O6Do0TTakN6gRQpoNpQ==
X-CSE-MsgGUID: K6zY8ZDKRaKO1MMGc+qGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="183674299"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa010.jf.intel.com with ESMTP; 24 Oct 2025 08:07:45 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v8 0/3] lib/intel_allocator, tests/kms_concurrent,
 tests/api_intel_allocator: check for sysvipc
Date: Fri, 24 Oct 2025 20:24:08 +0530
Message-Id: <20251024145411.3500452-1-s.sebinraj@intel.com>
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

S Sebinraj (3):
  lib/intel_allocator: Add SYSVIPC support check
  tests/kms_concurrent: Fix for msg_queue failure
  tests/api_intel_allocator: Check if multiprocess is supported

 lib/intel_allocator.c             | 37 ++++++++++++++++++++++++++++---
 lib/intel_allocator.h             |  4 ++--
 tests/intel/api_intel_allocator.c |  3 ++-
 tests/kms_concurrent.c            |  3 ++-
 4 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0

