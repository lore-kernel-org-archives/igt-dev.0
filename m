Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F07CD1283
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 21:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1EA112899;
	Fri, 29 Mar 2024 21:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2BmT1hn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02601112899
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711746865; x=1743282865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=guY+OjH+E/9QPX/2lbgAxCFd8eW+Z0PYXweX3GeCJNc=;
 b=N2BmT1hnJiCxThiwqB8Rk+l+PQVG7BxJ/sN8VIpKTci9OZMlGby7zoZ+
 zznqXBvgC8wDhbsQ/mQqBx3FHDk4vzOMY4GttV/Gx5uMsWetmYt4IgD87
 6qrzh/wXL2E/xf4ZNF+dhpwu+qzCxtajBS057n5e8HN34n7+4Cc4JCmIM
 ZXDO2mtViX7kBK41+vFN66IuK2xF7norsgQhT3E262L1THicjfq+CJrHC
 o5tieybj0dObJTy+w4vyltBIUM8MmDrJWGTBFY6pqDyJopdo1E2FY3XaR
 WRCqgyXNfBztdKhp7MZyR/V+2w9Us5CzVVsBbJuYJgl6IeE2hK4Db9D8M Q==;
X-CSE-ConnectionGUID: 9nyAcp71RhOzH0PU1JzZpg==
X-CSE-MsgGUID: 6FmMTcEfTB+MBIuLCQ7e5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="24436870"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="24436870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 14:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17140574"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 14:14:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/xe_exec_threads: Reduce copy & paste
Date: Fri, 29 Mar 2024 14:14:49 -0700
Message-ID: <20240329211449.924460-1-lucas.demarchi@intel.com>
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

Replace copy & paste by a loop, so we avoid issues like the one fixed by
commit 27c06a4106e1 ("tests/xe_exec_threads: Fill in GT field for second
balancer thread").

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_exec_threads.c | 36 ++++++-----------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 05ea1d35a..e9588f9b9 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1030,6 +1030,7 @@ static void threads(int fd, int flags)
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
 				int num_placements = 0;
+				int *data_flags = (int[]){ VIRTUAL, PARALLEL, -1 };
 
 				xe_for_each_engine(fd, hwe) {
 					if (hwe->engine_class != class ||
@@ -1038,36 +1039,10 @@ static void threads(int fd, int flags)
 					++num_placements;
 				}
 
-				if (num_placements > 1) {
-					threads_data[i].mutex = &mutex;
-					threads_data[i].cond = &cond;
-					if (flags & SHARED_VM)
-						threads_data[i].addr = addr |
-							(i << ADDRESS_SHIFT);
-					else
-						threads_data[i].addr = addr;
-					threads_data[i].userptr = userptr |
-						(i << ADDRESS_SHIFT);
-					if (flags & FD)
-						threads_data[i].fd = 0;
-					else
-						threads_data[i].fd = fd;
-					threads_data[i].gt = gt;
-					threads_data[i].vm_legacy_mode =
-						vm_legacy_mode;
-					threads_data[i].class = class;
-					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
-					threads_data[i].n_exec = N_EXEC;
-					threads_data[i].flags = flags;
-					threads_data[i].flags &= ~BALANCER;
-					threads_data[i].flags |= VIRTUAL;
-					threads_data[i].go = &go;
-
-					++n_threads;
-					pthread_create(&threads_data[i].thread, 0,
-						       thread, &threads_data[i]);
-					++i;
+				if (num_placements <= 1)
+					continue;
 
+				while (*data_flags >= 0) {
 					threads_data[i].mutex = &mutex;
 					threads_data[i].cond = &cond;
 					if (flags & SHARED_VM)
@@ -1089,13 +1064,14 @@ static void threads(int fd, int flags)
 					threads_data[i].n_exec = N_EXEC;
 					threads_data[i].flags = flags;
 					threads_data[i].flags &= ~BALANCER;
-					threads_data[i].flags |= PARALLEL;
+					threads_data[i].flags |= *data_flags;
 					threads_data[i].go = &go;
 
 					++n_threads;
 					pthread_create(&threads_data[i].thread, 0,
 						       thread, &threads_data[i]);
 					++i;
+					data_flags++;
 				}
 			}
 	}
-- 
2.43.0

