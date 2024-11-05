Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B663CD36138
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 20:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C60910E60E;
	Tue,  5 Nov 2024 20:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0c2SKlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E718C10E60E
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 20:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730838610; x=1762374610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WGNBphNyHQk6/b5/FUvK/0ZMlQjVgiOScbhM6Zb2hEg=;
 b=J0c2SKlAS/LTebdpJ2jYX9QWGrafAMSYHDUjPV0ODIQvJ3rtImx2SAp+
 iQHVm5cWlkfMHojJWsQnjKkbRHF/Adhu6A4Ss9U6VjZ+0QaKJ4oJV7Zmf
 Y2X6+Qi2dTyFSoVNNfj11mFdfGeyrOuld6KvhDgFCjRIq+lAnZrv0jB4Z
 252cNB+Om9nv/hvBgu9K4W0OeP+vnMLH52kyUn6LoB1Ob8eaJxN4ZpP+S
 9kJdB27R486FdwW0pz4+n7ky8gsod3PmrZ8KdmYNJlnt/teBTDyyHSn0y
 AcojmFJyc1XuA1K6YzC+JvieHHsZOVdlteoZ/6Tx1Gt7dYFli2eUGy6YS w==;
X-CSE-ConnectionGUID: 9XfM1mlOSI+xZJ2A7Z6W1A==
X-CSE-MsgGUID: u1ccRHdCSROMGMYDrLwbhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34304778"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34304778"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:30:09 -0800
X-CSE-ConnectionGUID: Den2Nx8hRDOp/Xrg3d8i5Q==
X-CSE-MsgGUID: 6Wi2uBGMRWyV6VO9XSmBYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="84267657"
Received: from dut1162dg2frd.igk.intel.com ([10.211.177.11])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:30:07 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 alex.zuo@intel.com, kamil.konieczny@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] [i-g-t,
 v2] tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs
Date: Tue,  5 Nov 2024 20:29:54 +0000
Message-Id: <fb348c83c291f4257f525077660b9b67630d25a5.1730838535.git.jagmeet.randhawa@intel.com>
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

The bind-array-enobufs test in xe_vm.c is intended to trigger
an -ENOBUFS error by submitting an oversized bind array.
After encountering and handling the error, the test reduces
n_execs by half and retries the operation. On some environments
with stricter resource limits (e.g. simulator), halving
n_execs isn't sufficient to prevent the ENOBUFS error on the retry.
Reducing n_execs further to n_execs / 4 allows the test to pass
successfully.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7a8740b69..e78ddd0e5 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -957,7 +957,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		xe_cork_end(&cork);
 		xe_cork_wait_done(&cork);
 		xe_cork_fini(&cork);
-		n_execs = n_execs / 2;
+		n_execs = n_execs / 4;
 	}
 
 	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
-- 
2.34.1

