Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D78BF4180E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 16:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4CF10E55F;
	Mon,  9 Mar 2026 16:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JK14x1V1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E210710E55F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773074279; x=1804610279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jdHnN644LeXL4WVXPZ1rZTID5n1rwKusyQ/pQuo41LM=;
 b=JK14x1V1GuB2MVkR48bu4PhcmkB5BKz+2Y21Ii+yyCnyZx3aAX5Imjpd
 HKoegcHHccXPC/crTQc5jwbylOXwPUGQ04Z0b74b3F/KaeLoBNPizb8yI
 zSbgK85Xs6qB1Hrq+h8p3Mbr3Vo0e8m723cExGfSFVjFqIrzAdfElNyo/
 bMGrkKb1DYLZhU17kn8v5Yy1WzAFTXC1v9qBj7iBPvyNMzM2FwIz8aCpk
 Ka1JBZ0mszJ2Sbr0zqKmfGZHZ+ShQIgGb8xO/iDpKLidr11Xa9FidR8mK
 i3T1bM3l4httgAW0UyfHgt4hneiZJKQ/XYN5uqGkXKNGCKXxqslbG70PY w==;
X-CSE-ConnectionGUID: fxruLj1+SruNbeJEtl1Y/g==
X-CSE-MsgGUID: qwix8x9/QjaJfqM0SazrVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84813304"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84813304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 09:37:49 -0700
X-CSE-ConnectionGUID: FN3a4eF5TtSoUsCT743uAg==
X-CSE-MsgGUID: TP68EBMpTFWVD7DPJJILuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224256791"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.163])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 09:37:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t,
 v1] tests/intel/xe_exec_system_allocator: Comment compute output
 buffer
Date: Mon,  9 Mar 2026 17:37:36 +0100
Message-ID: <20260309163736.1299062-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a comment why the output buffer allocation differs from the input
one so that it is not changed by accident in the future.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index bf3330002..c645f6491 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2292,6 +2292,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 	read_gt_stats_snapshot(fd, eci, &stats_before);
 
 	for (int i = 0; i < loops; i++) {
+		/*
+		 * What is done below for the input buffer could also be done for the output
+		 * buffer, that is system allocation with aligned_alloc() then setting it into
+		 * user_execenv. However the current focus of this test is to provide fine
+		 * control on triggering GPU page faults from the context of a compute kernel
+		 * (execution units) unlike test_exec(), so using SVM for the input buffer only
+		 * is sufficient and simpler.
+		 */
 		compute_input = aligned_alloc(size, size);
 		igt_assert(compute_input);
 		env.input_addr = to_user_pointer(compute_input);
-- 
2.43.0

