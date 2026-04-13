Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CEBF531D6
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 21:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9479310E16E;
	Mon, 13 Apr 2026 21:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/u6YA90";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0AC10E51E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 21:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776115179; x=1807651179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZI4v71dBYMaRZRfRintLX5WNqCpFz2V1E97jMwniH84=;
 b=d/u6YA90xic5vNHKFetkMwFk+sQczrTFgHIP01U2z+NNA5/5KIliMbpe
 1ZrCIwaWWnGAZR6IN3jGRPaVhN+AW+yOKrMiR3OzMhEG1ROpEGCDc/vDU
 t9HsQB1t41h3kVdHJIOG8GNODV/tnNpW0InrSQ1BLWW5YVu16A5YoiBSB
 d4mmWbbd9eVXAzbQhjFlX0plDydo96O/AvhvOlbKGNJjytET2d4MWbF+P
 +oRF5dITtntV2/jRKf3bvwe/E939YesknoL/nF1xKmG+DR8/CX8C70xMJ
 0UvPefWfRbzvZ/GnvUf0B0xN6LrjhEnV+sS96e1GjYczlw93mi7U5R1us w==;
X-CSE-ConnectionGUID: ueN/wa0hTIWtFTrgcS8How==
X-CSE-MsgGUID: 3d0oxQl6RwWKKiAjMGVI8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87362603"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="87362603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:19:31 -0700
X-CSE-ConnectionGUID: oyT27y85Tym3scElqbOyFw==
X-CSE-MsgGUID: W16sguQaQXC5FvhdYFu0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253283238"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4407ARLH.fm.intel.com) ([10.105.10.107])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:19:30 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: apoorva.singh@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, daniel.charles@intel.com,
 fei.yang@intel.com, katarzyna.piecielska@intel.com,
 priyanka.dandamudi@intel.com, kamil.konieczny@linux.intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel/xe_exec_reset: Add checks for
 hanging queue wait_ufence return
Date: Mon, 13 Apr 2026 21:19:26 +0000
Message-ID: <20260413211928.54789-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413211928.54789-1-stuart.summers@intel.com>
References: <20260413211928.54789-1-stuart.summers@intel.com>
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
index 66580ea44..8139af25a 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -462,17 +462,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -480,8 +483,12 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
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

