Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC7EC25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E5D10E645;
	Mon, 13 May 2024 10:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXQCd8NF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03F310E650
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597465; x=1747133465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z5vkdaK9LZMmBgG09dCWkD7+99aJ1Jn3i8hVdG1Ojwk=;
 b=RXQCd8NFvgFNZrJiHN1raDUJp/uLAf1FccfaPVbs+E4RZePXiYtVzoI5
 N8OhDpKo42F4jrDSiVcUs8TI69Mwy2qNeKNOVhUCRHx1kKbwIdSX42/XR
 LWcFqvtdkBGkQUT2sWJ9qgZglhZ6PYSgPc6OZJLKxCsPB8LbKaDzjh/E1
 5k2ZeAnPJhfuT0zEP7LpIfmKEX3DPZdqIeoSxW4iIkN9B1CocAUg+K+uL
 nShy4wXwxFevO5OczOzH/mnGo4VbpC3WiSWvAJ1e18lkYLak2zpMEeJXP
 Z6AZL7JwIMfYv4YZ90EpnJWUvjvcBZx4rWjQ539aUJJQvCvzNbhneDasr A==;
X-CSE-ConnectionGUID: caK4HMyeRZ2/1RDygNFGrg==
X-CSE-MsgGUID: 7b1T5V5zRxuSWBB3GAZoXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22125186"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22125186"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:04 -0700
X-CSE-ConnectionGUID: Bj+REsC3Q1mCPAU9JP7f4A==
X-CSE-MsgGUID: saRHMR/+TieYBmXnf3V7Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34719929"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:02 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 13/16] tests/intel: Add GPGPU tests to Compute Mega
 feature
Date: Mon, 13 May 2024 10:48:43 +0000
Message-Id: <20240513104846.362332-14-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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

Add GPGPU tests to Compute mega feature.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 3 ++-
 tests/intel/xe_gpgpu_fill.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index 14811abce..3c03c7e70 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -51,8 +51,9 @@
 /**
  * TEST: gem gpgpu fill
  * Category: Server
+ * Mega feature: Compute
+ * Sub-category: GPGPU tests
  * Functionality: gpgpu_fill
- * Sub-category: GPGPU
  * Test category: GEM_Legacy
  * Feature: compute
  *
diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index a359f9f55..1d2aafbf2 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Basic tests for gpgpu functionality
  * Category: Software building block
- * Sub-category: GPGPU
+ * Mega feature: Compute
+ * Sub-category: GPGPU tests
  * Functionality: gpgpu_fill
  * Test category: functionality test
  */
-- 
2.34.1

