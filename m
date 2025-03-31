Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E151DC3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 14:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6688E10E413;
	Mon, 31 Mar 2025 14:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAxbivTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA010E413
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743432178; x=1774968178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j7wQNYQcFXrz8zE8+MUike+VOfktWnDi49G1eTnsrXU=;
 b=EAxbivTLzUKtwf5WZ0vh93CD87ELR8vXk35mCFlw735Uv61RDPta5JT9
 3OGtuSVlxiNV/NmI7V/nuOSwHCWpEnZtpuo/wsKSLF9ahDr2pzrWP9OUh
 H75NM5dxeC9vihkQ4yU2XP4z71sXQVG75oD+uAL2E52sM8OhzjUcZeJ9u
 xxE2wrWO1UujasxwWZX5CvHQT0VydieXchRwyHR/qUGTRPVYpSKq12s3z
 WejyeVg5fjbJXwpc2ZiXgpofIAkvE9KCAlBt08qsIOF7GUqOOi2oBSn/5
 PhmAEUsMIfobcsaut+SaaVpWVNbiFCFFNzfsxK1P7EeXiFNLBEd0R5UR2 Q==;
X-CSE-ConnectionGUID: 8nWf3bL1T+258sN8ujUxew==
X-CSE-MsgGUID: HBRv0fYDTU+4/XlX3Ye++Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44632026"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44632026"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:42:07 -0700
X-CSE-ConnectionGUID: D2/cuftGQjqpLlERmN9p/g==
X-CSE-MsgGUID: CjcRpyNVRfaCWtglOAU0EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="127009833"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa008.jf.intel.com with ESMTP; 31 Mar 2025 07:42:04 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	dominik.karol.piatkowski@intel.com
Subject: [PATCH v2 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Date: Mon, 31 Mar 2025 14:27:48 +0000
Message-Id: <20250331142749.1821941-1-sobin.thomas@intel.com>
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

From: Sobin Thomas <sobin.thomas@intel.com>

This test validates that invalid string inputs are correctly rejected
by engine sysfs write. It ensures that the property values remain
unchanged when invalid inputs are provided.

v2: Added error check for return values for igt_sysfs_scanf and
igt_sysfs_printf. Removed the changes for fault injection in
tests/intel/xe_fault_injection.c

v1: Initial changes for checking error string.


Sobin Thomas (1):
  tests/intel/xe_sysfs_scheduler: Add invalid string test for engine
    sysfs properties

 tests/intel/xe_sysfs_scheduler.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
-- 
2.34.1

