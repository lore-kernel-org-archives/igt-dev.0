Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560EEC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 10:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0242B10EEE5;
	Wed,  7 Feb 2024 10:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boCP9W3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C7410EC57
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707302857; x=1738838857;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pp0SpC5FJbmiM9BLtYBZwYFbRMc5ULJknoYOxzedqLU=;
 b=boCP9W3QE2C9c4use9Z7ZnzAremrQB1pzA7YmgVj2eGyYK2JlYookaNs
 QAaUkOMlsPyal7QLlvVkgiCeczzxn8bhRIOeULUOxu/BSAr89/LrHbcQj
 qC9rci5783y6uhCu7QWkut0EVJv4aSlTeUf7Jqs4O4AwT77f1kRn8kOLX
 AOzuT4zdsCHn9uufvIxev4eS5oIJQfbXeXlZ9ixJxr1ZbfoHNM5A84/YN
 SVZlx8W8idDNtf9SV7drBu3+Ez3Ij5NvF+YZS/71CDYtZxh8fYhxx8k7C
 v0BMGrswaET2OJ+hl4u/dcBprqU4aDmjSDXHT1vtWiM+/LoFZ2xoS7P/n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4827519"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="4827519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1531070"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.145.169.80])
 by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2024 02:47:35 -0800
From: himanshu.girotra@intel.com
To: matthew.auld@intel.com, ramadevi.gandi@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel-ci: Add xe_vm large subtest to BAT
Date: Wed,  7 Feb 2024 16:17:33 +0530
Message-Id: <20240207104733.16012-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Girotra Himanshu <himanshu.girotra@intel.com>

Add xe_vm large subtest to fast feedback to enhance our premerge testing

Signed-off-by: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f297fe965..23c2e185d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -151,6 +151,7 @@ igt@xe_vm@munmap-style-unbind-userptr-end
 igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe_vm@large-split-binds-268435456
 igt@xe_pat@userptr-coh-none
 igt@xe_pat@prime-self-import-coh
 igt@xe_pat@prime-external-import-coh
-- 
2.40.0

