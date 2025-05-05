Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498C2C3ABB9
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 21:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD80310E013;
	Mon,  5 May 2025 21:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxhrqrCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAE210E013
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746481320; x=1778017320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c2zB+GD70QvqK3bhiLjcKkIMPcXT00IpC+PR9tXPmCM=;
 b=CxhrqrCvJTI6P7dFccq2KMWphgPglrITMhwLmD/Sc6hCupbyTfmu3/95
 Hu7uBzKeVEp+ihGMXkJwaVO20z6BQyg9srSOVtwa0tcv5zRYxwyPQtDmV
 XUWw0aU+FiFHftIZWySQw3xck6wkNTeggTKwxGbvwL1u13kpaQZOsKd/5
 bRhWEiX4CzMY12mIhbH+kqn6WJiBCh8qEjsDxMUlidKFpPlFYA0wOamSt
 avCjyHWQEcNSOImkJOgGCYOsvIq4347cHuUf16WuRgJDoAW3d9d/gdnYj
 lgsOvSYzStGpYwk0zq/fdBsgPhoSxh2rDemq9Dq2B2pi+UFxpFfxmfj/e w==;
X-CSE-ConnectionGUID: 9KD5wXmoQ8Kb83zGsNRXlw==
X-CSE-MsgGUID: nOZsqBACTgG5m9lvAvTH1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59101952"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="59101952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 14:41:54 -0700
X-CSE-ConnectionGUID: lxMvWoA+RbCdBzQ2xP7Drw==
X-CSE-MsgGUID: cAlRuSJSQE28iO4bBDty0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="135347277"
Received: from dut4036ptlh.fm.intel.com ([10.105.8.54])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 14:41:53 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, matthew.brost@intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Check huge pages free
 in thp tests
Date: Mon,  5 May 2025 21:41:52 +0000
Message-ID: <20250505214152.315363-1-jonathan.cavitt@intel.com>
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

In a previous patch, various subtests in xe_exec_system_allocator that
rely on the MAP_HUGETLB flag for mmap were skipped in the event that no
huge pages were reserved by the kernel.  These tests should also be
skipped if all the huge pages are currently in use, which is indicated
by HugePages_Free being 0 in /proc/meminfo.

Fixes: df3036da ("tests/intel/xe_exec_system_allocator: Check for huge pages before thp tests")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index c2daf37121..9528c94495 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -971,6 +971,8 @@ static void igt_require_hugepages(void)
 {
 	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
 		      "Huge pages not reserved by the kernel!\n");
+	igt_skip_on_f(!igt_get_meminfo("HugePages_Free"),
+		      "No huge pages available!\n");
 }
 
 static void
-- 
2.43.0

