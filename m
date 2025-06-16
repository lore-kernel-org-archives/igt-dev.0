Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B70C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 07:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD2E10E2C4;
	Mon, 16 Jun 2025 07:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1KkFiH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2233510E2C4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 07:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750057507; x=1781593507;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hkK+qsgPzeamdt6jND+90g5tU/qvkg8epqSABt87LTg=;
 b=C1KkFiH4xjE0B7um2g8BTYPsmg9y7P1oCo1XBBCJ2Kv3oW4WjFKkX+kX
 OvE5Rj5i889yvEUo4GfukL6bFvotzncgkF+yfbObiXHnAqCqyBXZtnrzi
 V7q6cBqSeigncUfx60u7jSXvnxykVnhr0GzOClSHfZMgG2ns1oJqtr1Ry
 u5mSu0yXutLjXjbwgaH4IBZvASBIpVp9RLpvZmPct5z92fiJovXlgBIhp
 HKk2pD0gegoPJ0xLET5X+PUjQsZcm1Q+fWlfJ/86VASDr7kxsmvk1GGV0
 wMylQzNHFhBVqZd8ghfGcQpctJbd67CroxOBDGPKEJ7k7G19SVLS+u9lU Q==;
X-CSE-ConnectionGUID: PrCqu0BKSNGUpzJc5WQ1ag==
X-CSE-MsgGUID: ypF4zyiOSGqL6dzOGRR2Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51301401"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="51301401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:05:06 -0700
X-CSE-ConnectionGUID: aKK4PSxrSQ+C0N6lGpg0og==
X-CSE-MsgGUID: aYpXD91iQouPz+++q+wyJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148852429"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] tests/intel/xe_exec_system_allocator: Add section to
 trigger 64k fault
Date: Mon, 16 Jun 2025 00:06:39 -0700
Message-Id: <20250616070640.2061642-1-matthew.brost@intel.com>
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

64K is the fault size in Xe. Add sections to explicitly trigger these
faults, as they are interesting and having dedicated sections helps with
profiling the KMD.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 2a99bd435a..65d281c784 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -806,6 +806,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * Description: Run %arg[1] system allocator test many times with large allocations
  * Test category: stress test
  *
+ * SUBTEST: many-64k-%s
+ * Description: Run %arg[1] system allocator test many times with large allocations
+ * Test category: stress test
+ *
  * SUBTEST: many-large-execqueues-%s
  * Description: Run %arg[1] system allocator test on many exec_queues with large allocations
  *
@@ -1741,6 +1745,11 @@ igt_main
 				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
 					  NULL, s->flags);
 
+		igt_subtest_f("many-64k-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
+					  NULL, s->flags);
+
 		igt_subtest_f("many-large-execqueues-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
-- 
2.34.1

