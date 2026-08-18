Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE3EC5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 10:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C6910E4B5;
	Tue, 18 Aug 2026 10:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wpm8KN4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5310E4A6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049357; x=1818585357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eIN4vf+X9tXL4QbAsPvrREIvp75tFIp0VXNMFlqHVeM=;
 b=Wpm8KN4lmt8ukleYLIj087krNV8Abzr3h8CIFWFkhq8BJrp57v++VVMq
 nHYlD66xl3u8GM79oZq/GpX0Rk7AYnCo2/mbOUGZ/SR0feSXWHaU2ulo5
 xUHWaZWv936HsMhhIloBjC43ZXFf+nbjSjqZ5sfJF1hhGNNJrJxQlgtCU
 vXJosOV4yG9pi+6rlj7t6lblMJwUFaoBCw3nKCBbocUgxXSyLogj0x75z
 a2S4igWBFWPKn/zOmty5YuNTVwhlZeGyu53T2ZJq0rLm9QDGuVOGQZAco
 M9xONC0V4jYE1w+jWfqQjl8x0C2Ni3TS5M5bHLiX7Dl7pZXFEFy56/3Zm Q==;
X-CSE-ConnectionGUID: zm/AvfWUQJi/UDGnL0825g==
X-CSE-MsgGUID: 8A0WR5dMSLmxJj7Imtl0dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75068342"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="75068342"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:35:55 -0700
X-CSE-ConnectionGUID: orT8HkSqRU+otfotm54lcw==
X-CSE-MsgGUID: wDSEGLW/Q/CFgOKfwyC1HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263458354"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:35:53 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v2 0/2] tests/intel/xe_prefetch_fault: Add L2 prefetch
 fault tests
Date: Tue, 18 Aug 2026 16:05:43 +0530
Message-ID: <20260818103543.231667-4-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add coverage for L2 prefetch faults in the xe_prefetch_fault test.

The existing test framework is first refactored to support different
prefetch shader configurations. The second patch then adds coverage for
L2 prefetch faults in both regular and SVM modes.

v2:
  - Include generated iga64 codes for the new shader to fix compilation 
    failures (Kamil)

Varun Gupta (2):
  tests/intel/xe_prefetch_fault: refactor test to accept shader function
    pointer
  tests/intel/xe_prefetch_fault: add L2 prefetch fault subtests

 tests/intel/xe_prefetch_fault.c               | 120 ++++++++++++++++--
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |  17 ++-
 2 files changed, 128 insertions(+), 9 deletions(-)

-- 
2.43.0

