Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7507BCAC5BB
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 07:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A9D10EB41;
	Fri, 10 Oct 2025 07:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bb2HHwhp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B39C10EB41
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760082110; x=1791618110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GuxXL2D7Iw63ch4FQs4a60GysgDDPopEfmbydpq831M=;
 b=bb2HHwhp8dsbGcYUJRRqUhCY85XvnGqb1T9GcRZzeMx52rToX8wboESA
 fjRdazCTT9KxetMfIpDkR4Xsx5m9d6mG+HB9TAC0JNGiPA9LfANUHfRJF
 Ruop6ihaiAPh98a1cwaNucJwAA2MNfgsAfvdsBJDPeXbvKLKSU4HlaJr2
 OgSeb6uMyFr8QQJvFY0D7XHwPXPKsK+CgGGof4FtEHL8pOHHaMeKICRrb
 xEew9CnREdMdI+pdZe2ONbS5udHHTRa8v/vDm7kFAcq9RO/1xyX5BJLmp
 VC9nxMtoaYBOgPes0NIyufbLYsI1mmfqExGJ6dMg14tTiyppkMZB2K0S7 g==;
X-CSE-ConnectionGUID: Ss7UovCtRaei5lrk3+LWoQ==
X-CSE-MsgGUID: Fl0PxRmAQWm7z6j7i2md0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62327508"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62327508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 00:41:50 -0700
X-CSE-ConnectionGUID: js//yBjgSDWJzHNPikRaEg==
X-CSE-MsgGUID: rduaagQXRVa3D/TkW1+D8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="181687329"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2025 00:41:48 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v5 0/2] lib/intel_allocator,
 tests/kms_concurrent: Check for SYSVIPC
Date: Fri, 10 Oct 2025 13:00:07 +0530
Message-Id: <20251010073009.821335-1-s.sebinraj@intel.com>
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

