Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA35FF8867
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 21:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF9B10E07E;
	Mon, 27 Apr 2026 21:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0T/W2je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED20310E027
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 21:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777324835; x=1808860835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lg0aVW/d69TeKBxCpol4RgA6KI6YLescnSYe/m+igUI=;
 b=i0T/W2jeE59RVojqlCSmsJTpnsTu+CXb/HFughNHD4XMGz0uSlZl7qhx
 Pk6boJrYBZQOJrqVvcnvnimztNUDQ9kDto9AxKw8LVYRjr0VYAErfJCDx
 fXCItf6F6CBx4mAM08ee04yagMiKEHb/mo0ybVrbN5ofrkV6QkDKAly+m
 6oP99H0eWTRrhN/4kmXZnlerATZEcGH8KTxbXTDojkOdlkyppwKFEgbLT
 yYGOlcQCdF0FfoIl81NBP6QBikTaRKueLDJGQm/4sbrb7cXwLNvM1UgeQ
 K1kwckev2fxhOA58ZI6G9B/Xmz3IwwyCtbGjCwyXzmt/re+rj7swpG2UN g==;
X-CSE-ConnectionGUID: 2MwgJzFsSr+H+0jefSUcNw==
X-CSE-MsgGUID: 2SKkBd5bSqC8khGO1DjrCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78104256"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78104256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:35 -0700
X-CSE-ConnectionGUID: WGMfigEdQv+i6oSSUrjmHg==
X-CSE-MsgGUID: 23zEqYBgRW6/XkzUyz/mUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="234034922"
Received: from dut4344arlh.fm.intel.com ([10.105.10.102])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:36 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_exec_reset: Add checks for hanging
 queue wait_ufence return
Date: Mon, 27 Apr 2026 21:20:32 +0000
Message-ID: <20260427212034.18486-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427212034.18486-1-stuart.summers@intel.com>
References: <20260427212034.18486-1-stuart.summers@intel.com>
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
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_legacy.c          |  8 ++++++--
 tests/intel/xe_exec_reset.c | 17 ++++++++++++-----
 2 files changed, 18 insertions(+), 7 deletions(-)

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
index bc1a74fa3..1c9275804 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -462,26 +462,33 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
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
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
-	if (!(flags & GT_RESET)) {
-		for (i = 1; i < n_execs; i++)
+	if (!(flags & (GT_RESET))) {
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

