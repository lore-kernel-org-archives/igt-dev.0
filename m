Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A3F364B6
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF9310E86B;
	Thu,  9 Apr 2026 20:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuNdDDZg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A28B10E052
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767024; x=1807303024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yO1gAOlmgHtX3+TZkHuB++Pig9W9udVS9tN8bcSr2Fc=;
 b=JuNdDDZgg0PLuVg8CgR8AtKWfYhVWyJH8+Xk5pQ5qONYmcay/dcsB841
 Fq+BEw+tbK4JAZyfl2PteuPr0+9Pi/Hdie0OgCYneJhmXtpPRvvjFjFc4
 mpdbXPkEe2BrNZCm6vx6xdmqZn9yj5pbBntphGAFKYTrV60soTScNFMZN
 bNiE3nw3oB22xLDbQbaOdkJiPTJnVen9r+X20vdSqROTKNw8xyMCfnGM3
 i/rW4/39pt2wP7cqtrf/MO+97zoY4QgXLqjZ5dMgZWVVqd+JhrZZDDw00
 AUkiSm8RlAfj0BPzbK4p9U7Qo+N6AduskSxvmTC3tMBOgoL1VCNdNMQ3W A==;
X-CSE-ConnectionGUID: PXUtZx3sRGCE2HvHKmlTTw==
X-CSE-MsgGUID: aTZMB+3xRCG3S4rZBVi3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87858520"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="87858520"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:04 -0700
X-CSE-ConnectionGUID: Higj99yNTky/32vt2/I3nQ==
X-CSE-MsgGUID: wsYmzxq8TieGmjoShr+NXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="232950737"
Received: from dut4344arlh.fm.intel.com ([10.105.10.107])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:04 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: niranjana.vishwanathapura@intel.com, igt-dev@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_exec_reset: Add checks for hanging
 queue wait_ufence return
Date: Thu,  9 Apr 2026 20:37:00 +0000
Message-ID: <20260409203702.4350-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203702.4350-1-stuart.summers@intel.com>
References: <20260409203702.4350-1-stuart.summers@intel.com>
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

There is a 3 second wait user fence timeout for the compute mode
variants of this test. Instead of just skipping the wait altogether,
let's make sure this does in fact return -ETIME as expected there.

Also add the i == 0 cases for legacy and compute path for the actual
data checks to stay consistent and to be a little more explicit
about what we're checking there.

This also let's us add a little more detail to the cases in some
planned changes around hanging multi queue secondary queues.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_legacy.c          |  8 ++++++--
 tests/intel/xe_exec_reset.c | 15 +++++++++++----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 6aeddc578..3371a91ac 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -230,9 +230,13 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
-		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
-		     i < n_execs + extra_execs; i++)
+		for (i = flags & LONG_SPIN ? n_exec_queues : 0;
+		     i < n_execs + extra_execs; i++) {
+			if (!i)
+				continue;
+
 			igt_assert_eq(data[i].data, 0xc0ffee);
+		}
 	}
 
 	syncobj_destroy(fd, sync[0].handle);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 95191139d..6b71d9144 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -461,17 +461,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		return;
 	}
 
-	for (i = 1; i < n_execs; i++) {
+	for (i = 0; i < n_execs; i++) {
 		int64_t timeout = 3 * NSEC_PER_SEC;
 		int err;
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[i % n_exec_queues], &timeout);
-		if (flags & GT_RESET || flags & CAT_ERROR)
+		if (!i) {
+			igt_assert(err == -ETIME || err == -EIO);
+		} else if (flags & GT_RESET || flags & CAT_ERROR) {
 			/* exec races with reset: may return -EIO or complete */
 			igt_assert(err == -EIO || !err);
-		else
+		} else {
 			igt_assert_eq(err, 0);
+		}
 	}
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
@@ -479,8 +482,12 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
 	if (!(flags & (GT_RESET | CANCEL))) {
-		for (i = 1; i < n_execs; i++)
+		for (i = 0; i < n_execs; i++) {
+			if (!i)
+				continue;
+
 			igt_assert_eq(data[i].data, 0xc0ffee);
+		}
 	}
 
 	for (i = 0; i < n_exec_queues; i++)
-- 
2.43.0

