Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A8ECAC58E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 12:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9CB10EB00;
	Thu, 11 Sep 2025 12:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbjL0uT4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6989F10EAFD
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757593877; x=1789129877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6tb5Qn4VqNdTi9Gi66mfgNIsnONVL6IQpBSdgBmeFTM=;
 b=MbjL0uT4gZOBXT7kn9jKXoGaMu/pTrqZ+8u/DxwqKBSS8609faKKQJaP
 FLx2DYxuMyjnqZAIINh11cg+zKlw1RXFdsRH08BCkJhml9rJsRGDt63Cl
 4aZ7TmqQRtw1HU39l69XBObZ/7QFASoPLQcbo2KRQ6sKkFPHXaUqYqbyQ
 IVerts4Dhfijt7dpz75cxlgCIQ+dQbZkc4beioaNBigLeEP0aeAIMtXQS
 Ya3h/q08wvoZ025xWCnxNpcJJXMFLZq7wtYJxR7JbCprBjhgLCMyfpqec
 FLdIPVKgHO95tuSIZMB2o5kxp1nHyfB8uLQ+K5P9lrBx1AXBkhVfPUIta Q==;
X-CSE-ConnectionGUID: 5ktiQzNbSp6QjW5mBJ+1dA==
X-CSE-MsgGUID: 7WkYqjDDQ+iJCK3atedw+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63752175"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="63752175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 05:31:17 -0700
X-CSE-ConnectionGUID: PcxuFz3SQzKdSqGsdVT2ig==
X-CSE-MsgGUID: KYmLeAbZTzuAFdiv3YDx1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="174475347"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2025 05:31:12 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v3 0/2] Add pat-index-madvise
Date: Thu, 11 Sep 2025 18:12:06 +0530
Message-Id: <20250911124208.1159281-1-pravalika.gurram@intel.com>
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
verifies that different PAT values can be assigned
to multiple VMAs as expected.

Nishit Sharma (1):
  DO-NOT-REVIEW: tests/intel/xe_exec_system_allocator: Add atomic_batch
    test in IGT

Pravalika Gurram (1):
  tests/intel/xe_exec_system_allocator: Add pat-index-madvise

 lib/xe/xe_ioctl.c                      |  29 +-
 lib/xe/xe_ioctl.h                      |   4 +-
 tests/intel/xe_exec_system_allocator.c | 561 ++++++++++++++++++++++---
 3 files changed, 532 insertions(+), 62 deletions(-)

-- 
2.34.1

