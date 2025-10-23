Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9488CCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 06:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA0A10E00A;
	Thu, 23 Oct 2025 06:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwB48Px3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0A910E00A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761201880; x=1792737880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oYiEp1VapC0gUqrqePjSGX7YX0qcQc9o66ko9qcCzoQ=;
 b=IwB48Px3BwFJIdEJugbgcJf34NcaQYPp2imQSB8C6uOuwZOwwXeBc86d
 Zk6WhbAD2NMQkYOLHmOMphRVmU6rbFXftvECjmMuPZBws+c248f0T2WsD
 EwURLLr1uvXDXSjcwyf2l/SEfcC8dzPKVnQbqjo0ShJ6ZKvW3dKgq3niV
 Zq2SSbqLbK5WeEls480B/MTcS0UMU40w23erF9wniKB/fBzLX72OVJT8m
 GPZq1iaBzYX0gPIlf2p/+3vqDJkRLlUHphCHYGfKgV8omHpMh9RMJN31x
 zQ+R/5q6xjjSqHuzsVQgjXiumn4BEevpykQUXwoL/sGIeZzs/hihWQhZ5 w==;
X-CSE-ConnectionGUID: 7sKLq3KVT2+JGAfVFVx61A==
X-CSE-MsgGUID: dNA1skRfRim1CgVHPQXTpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74707723"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="74707723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:44:40 -0700
X-CSE-ConnectionGUID: 2Y2/pWE6StiwXk5t2myYIQ==
X-CSE-MsgGUID: GNe6Z+t0RzuQjYgSV3WIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="207733002"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 23:44:37 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v7 0/3] lib/intel_allocator, tests/kms_concurrent,
 tests/api_intel_allocator: check for sysvipc
Date: Thu, 23 Oct 2025 12:01:10 +0530
Message-Id: <20251023063113.3485132-1-s.sebinraj@intel.com>
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

 lib/intel_allocator.c             | 39 ++++++++++++++++++++++++++++---
 lib/intel_allocator.h             |  4 ++--
 tests/intel/api_intel_allocator.c |  3 ++-
 tests/kms_concurrent.c            |  3 ++-
 4 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.43.0

