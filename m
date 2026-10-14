Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D27CC6B24
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 06:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2D010E3F5;
	Wed, 14 Oct 2026 06:13:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534B710E3F5
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 06:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791958348; x=1823494348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PIT72RwWk1Inv5ArZSFlrddjl3Tlf1o6JnmRq5Q5Jj4=;
 b=bjb8aQ7IUW/5aftBTKWeAzQph5kLB0MDiuM1EeuEp3W8ba6lhuo5H3FQ
 WYz2ZUNSyfq2wWnz3KuhC+TU5cNPyhFFjDKBJcSsKuBGdo4cazfdiFeir
 7a8Q4uJifWNhCduBlpS8tY5X6exV6hCaXCSzKUfKyV/88oCD6UYSgicaj
 kOprZf9/YLw05KdED2HwAxvirQDYbh/9ntpBTeY32v5mPZCozvHZhbbXn
 FbomI13ALU/4zoLZhcDdQ4n1H664sBxUNcFy1jqxPFpl3D2cObKSvQBZu
 mgCIYKGB4whVwDGrAKrPgEGQkkodwLCEIeApJ/xIizspuBfJL9Omz07D9 w==;
X-CSE-ConnectionGUID: iMYnfIRVQ/K+KLjRldq/jQ==
X-CSE-MsgGUID: wuA9Ib6QQxuDduSVMBv+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="591984"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="591984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 23:12:28 -0700
X-CSE-ConnectionGUID: AGW30OoeQIW8Rj7r68GiJA==
X-CSE-MsgGUID: agqL4+MkQFGFLTWr1Iyu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1280430"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 23:12:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t] tests/intel/xe_sync_file: Fix driver_name expectation in
 sync_file_race
Date: Wed, 14 Oct 2026 11:41:39 +0530
Message-ID: <20261014061138.1748313-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

sync_file_get_status() is checked right after confirming the exported
sync file's status is already signaled (status == 1). At that point,
dma_fence_driver_name() has already taken its signaled-fence path and
will unconditionally return "detached-driver" - it never calls back
into the driver's own get_driver_name() once a fence is observed
signaled.

Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_sync_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_sync_file.c b/tests/intel/xe_sync_file.c
index 842c3856a..578b2b1ea 100644
--- a/tests/intel/xe_sync_file.c
+++ b/tests/intel/xe_sync_file.c
@@ -100,7 +100,7 @@ static void test_race(int xe, struct drm_xe_engine_class_instance *eci)
 	driver_name = NULL;
 	igt_assert_eq(sync_file_get_status(sync_fence, &driver_name), 1);
 	igt_assert(driver_name);
-	igt_assert(!strcmp(driver_name, "drm_sched"));
+	igt_assert(!strcmp(driver_name, "detached-driver"));
 	free(driver_name);
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-- 
2.52.0

