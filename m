Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37529C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 07:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66A910E6E2;
	Tue, 30 Apr 2024 07:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW0h9kCI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18A410E144
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714463570; x=1745999570;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l2pkgbZyEW5WnzqDH0M6QA+LpgqCGKXqhhscahJPujM=;
 b=iW0h9kCIXXVeYjJFEXeMO82mrn9C+wNd2PpFL4EHNlA6V/f9enDXzdL9
 Cei05wZnpyUhUTsHLZWb3KL2MIsLjf3JiHGb/3OZiT+O62ZhZFHow/+2a
 j2cBu9m+dobNaL7rAPG4SIhU6anfT2MTKDOnuF6TGFeEbDohAKqmYLKcv
 SEheAyFherP5SClGnwIe8OS1z6AB0YwzqYvdQDOGMMi05O74SuTtzt6da
 gf/DJ8apiFLBS13HgYeO7QJ1t14z0gmgP3/GImeECbsQZcUCT2mVPIbo5
 Y/4L2KYiAaz2fT35Yv/7bt1Lr1yI0Q8t6H5nOKchLAJ77dYZXU6RXHP2y A==;
X-CSE-ConnectionGUID: uRYmIVlER9q1r+HRGb3zJA==
X-CSE-MsgGUID: JlUMFMMxTHmv89RE1Pn9Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10030952"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10030952"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 00:52:49 -0700
X-CSE-ConnectionGUID: 47t9yTPeTx2lzyph3lJhaQ==
X-CSE-MsgGUID: Cv6i9SGQQfid2cTztFitbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="30856669"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2024 00:52:47 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Check skip condition
 from parent process
Date: Tue, 30 Apr 2024 13:23:10 +0530
Message-Id: <20240430075310.1676863-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Check test is supported on a platform or not from parent process
and run test once from parent process before creating child processes as
skip check is not allowed from child processes

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_compute_preempt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 78b19158d..3817b5a30 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -63,6 +63,7 @@ igt_main
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
+				test_compute_preempt(xe, hwe, false);
 				igt_fork(child, 100)
 					test_compute_preempt(xe, hwe, false);
 				igt_waitchildren();
-- 
2.34.1

