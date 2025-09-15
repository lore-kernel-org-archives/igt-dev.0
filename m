Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D25CCAC592
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 12:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9B10E485;
	Mon, 15 Sep 2025 12:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC/29IQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A8110E485
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757939861; x=1789475861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kSMic58QlcZ+1ah34hQvpr9FVnP35u5q7MGwcBcmRJc=;
 b=bC/29IQDelMl17MfAb4u3+nQdpHyxdN3WDuh0zG+vmcL58WwnQ+JP6Re
 bsO6fDtI4DbUDcoiNci6a12fqFEaP4dT1Fh5bHGiZVM/a76S0HjmiuoQD
 vj7LJRimhlw8mnjy1tvzTgUROgHWthf68vrA39mziDyR4geNl+nTXJ2rh
 oVirnKSPQuKQCmaIvGyPuqtrny2pwqsVDF9dc5wncfOXOHH55Ocz5+NVC
 3otNvsmidtAzZnwHYVKrUJa9qe9vhAQ+xLUDKhFqXaSUA3m06pF+tDgnE
 DZg27VI9DUBjWQCVYr7VmfCy6glisFndToCT/00POaHRsus4k/dLTGPKH g==;
X-CSE-ConnectionGUID: EtTjxXE1TBG41bTBj+5LUQ==
X-CSE-MsgGUID: v2zfPK32SG6c1vQ1/SQZsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60126790"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="60126790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:37:40 -0700
X-CSE-ConnectionGUID: aZoB9t+kRR23hLdgacUZzQ==
X-CSE-MsgGUID: ASTjisF2TlqtGJTg3Fpweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="175020151"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2025 05:37:39 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v3 0/1] tests/kms_concurrent: Check for SYSVIPC
Date: Mon, 15 Sep 2025 17:59:22 +0530
Message-Id: <20250915122923.2274820-1-s.sebinraj@intel.com>
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

 lib/igt_core.h         |  8 ++++++++
 tests/kms_concurrent.c | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.34.1

