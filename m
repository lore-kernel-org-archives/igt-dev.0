Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E287FCA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 06:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826E610E054;
	Tue,  9 Sep 2025 06:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqrJk4A/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AAB10E054
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 06:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757400580; x=1788936580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0lNPSAep/fGla8EXL5HCTxspU8eo2WGd4XOGzNJdlxQ=;
 b=lqrJk4A/2cudIUkO2JryK0gQGOZS0NPpiSYxx+nRbV3aal1T5mU/H/j5
 6NvSngof7Hb3IBoWNr0DvSYiB6E8y8hpvcUQT7mFHwUxyMfTP+70gW5hI
 PYySLmc6iqoBUdeNonpBUI5Ue+v+MksWGh3rNkbbIMtSa9WboQW5FnJYD
 rV8l4HfHmrDDHALaM44LMxB4R5zVDIbb9/Zo+AoWyPevo6kVG8GRbQLU6
 bqOubiDhMMMtEgYSefOUMsZ0FPdpamniYRZlYVvtQ3QaXhTA2mfttH3IC
 QwPTc/m3xRYuJmkWJ6O7gNIghRsJmTltUQG2RROSL62MJDhKYr7/aPbLP Q==;
X-CSE-ConnectionGUID: oSuVxNSDQ0Wbqyf5rw5qzA==
X-CSE-MsgGUID: 2EnuKtoYT+G0Sv46h+ql0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59532131"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59532131"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 23:49:40 -0700
X-CSE-ConnectionGUID: gI+O/+xqTrSoPapNWmupBg==
X-CSE-MsgGUID: KKrrPfABQvWVyQwJEenFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172578349"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by orviesa009.jf.intel.com with ESMTP; 08 Sep 2025 23:49:39 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v1 0/2] Add pat-index-madvise
Date: Tue,  9 Sep 2025 12:30:37 +0530
Message-Id: <20250909070039.1099371-1-pravalika.gurram@intel.com>
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

From: Pravalika Gurram <pravalika.gurram@intel.com>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned to multiple VMAs as expected.

Nishit Sharma (1):
  DO-NOT-REVIEW: tests/intel/xe_exec_system_allocator: Add atomic_batch
    test in IGT

Pravalika Gurram (1):
  tests/intel/xe_exec_system_allocator: Add pat-index-madvise

 lib/xe/xe_ioctl.c                      |  26 +-
 lib/xe/xe_ioctl.h                      |   2 +-
 tests/intel/xe_exec_system_allocator.c | 565 ++++++++++++++++++++++---
 3 files changed, 532 insertions(+), 61 deletions(-)

-- 
2.34.1

