Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F27C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539931132D1;
	Tue, 23 Apr 2024 10:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YoEh0zDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C801132D1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869490; x=1745405490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z5vkdaK9LZMmBgG09dCWkD7+99aJ1Jn3i8hVdG1Ojwk=;
 b=YoEh0zDxJtBZnmJQAIIAg++qg8y57kcXwiRkOP8DjZEqsc/z5aB01q5Y
 LV9Jd5N+gNkw8OdWcJjXFuwkxZOrLbZMoa3wsPiMml/7O1zrUMDyfX1m5
 Mcs/XyJvoB2bZcVJcC4/6zrA3jG2OPj7xqT8KWoO+oI84JCy6VcXeo/hC
 2VjNbmtNlHUc2UWb2OMF3zU9//rN3/m/P4hwdUhT7QsHYQ2WVvQEmseJo
 95lXqndGViTmVD0NKn9TbIhW/VCCkn8Jz/+qMtvregK7/l/OzLf0JQZvp
 rzWjWZRnD/oOUMIkH+d98JeEm5zfG+WRFqZKfdnqNLTVmkrQKzkxQatpH w==;
X-CSE-ConnectionGUID: g4LDqCugSGK8egtpRraFAA==
X-CSE-MsgGUID: a8MwX6/ITMiVtO1IN6rT+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20864828"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20864828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:30 -0700
X-CSE-ConnectionGUID: esg+A47sSZCEKD/FhBkbGw==
X-CSE-MsgGUID: h/O00FCBSE6cUevNdk+0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="47614761"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:28 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 13/16] tests/intel: Add GPGPU tests to Compute Mega
 feature
Date: Tue, 23 Apr 2024 10:49:10 +0000
Message-Id: <20240423104913.3559587-14-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
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

