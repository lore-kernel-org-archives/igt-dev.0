Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF82C52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 11:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB37710E069;
	Fri, 23 Aug 2024 11:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCkLJu0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32C10E069
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724410957; x=1755946957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mq1QPW4tUWQ6Zj5ZlnnhrWPcEoOCyu3d9h2XJQjdd04=;
 b=GCkLJu0qyr7YghpQUZZHRjEVaRnG2rt5Z7DIOsgbRdRz5jDkmYya7iiO
 RA+oG6/+pKQksGAgO7S3pfwywpWFV8/ywjGAHbG2z2sf2Nxt9B71tFIPl
 36g/OsGzv46DoLgb1sQY5Kp6IYJSXkHeunI4xyY9s0YAc+wFZr15iX2N6
 UmFDaJEGG8I14LpsbGFI4fIvJwnQFm3NCnZUShhwzRtePBecKmPs9k+61
 gFB5LWp5/jNsAf445kR0mE61T0WDsqtphz0KhmeYqKcHG9neVwCSAQUNW
 BUAi8NE5oScS5rkqB+dy8fMS71M6nK+sCZod0nSIZG8yMxAV5XT/SQra0 g==;
X-CSE-ConnectionGUID: vhTY7IwxQbuZCLpY0ceQtw==
X-CSE-MsgGUID: 8rH2amExTSCXxGVIKZUUDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25768344"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="25768344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:02:37 -0700
X-CSE-ConnectionGUID: pIiCvhxHRxONO1jA8clTkA==
X-CSE-MsgGUID: kculFdhvSxi56S5ZS8McAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66464650"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:02:36 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH] tests/intel/xe_vm: initialize bind_ops.extensions field
Date: Fri, 23 Aug 2024 13:02:21 +0200
Message-Id: <20240823110221.68234-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Zeroing structure on allocation ensures all fields are initialized
and allows to drop 0-initialzations.

Fixes: 2e5b3647f428 ("tests/intel/xe_vm: Add bind array -ENOBUFS section")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_vm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index c3960fedeec7..7a8740b69627 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -917,7 +917,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	} *data;
 	int i, b;
 
-	bind_ops = malloc(sizeof(*bind_ops) * n_execs);
+	bind_ops = calloc(n_execs, sizeof(*bind_ops));
 	igt_assert(bind_ops);
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -935,15 +935,10 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	for (i = 0; i < n_execs; ++i) {
 		bind_ops[i].obj = bo;
-		bind_ops[i].obj_offset = 0;
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
-		bind_ops[i].flags = 0;
-		bind_ops[i].prefetch_mem_region_instance = 0;
 		bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
-		bind_ops[i].reserved[0] = 0;
-		bind_ops[i].reserved[1] = 0;
 
 		addr += bo_size;
 	}
-- 
2.34.1

