Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4BECCF9F8
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2612410E309;
	Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0BH4xcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D41C10E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=56GLQ+2rGSACiBanGYX5Y2FkM25Wu9d+bVTSkDIPiag=;
 b=B0BH4xcEBELSDoGCi5lUqSXZhEj/9tGWjNiaky79tNMzobr32qNIN05W
 4+wFFBSlfVK4/RQznzvl5cuUIsj3mM7AU8YeuYbenFZ01amvaf7BCJ9k2
 LOkVI2mtgULbmwdpGop/Xa5QLlquBGZrvprRGXxlqhw2sGMpiUNPyRl79
 OMaBhxr3Fk+02G2F8Ou1wibfFfXU0VywlFVU36zglb/qpjJ2/V44q7D9A
 CtK2pOH2Bkbjb8j2sGxeVEeFBnX8roAMpw6p7S0Li2iC9bYEC1sFMrxGs
 SgBzHMhixwgnixQPxyeG8JZTWIk7NFl8EtefodbB+RL46PZ9/Zpt0yu02 w==;
X-CSE-ConnectionGUID: mLZSHzdnRt6lscM8Byu8gQ==
X-CSE-MsgGUID: BN7QzniEQ6O/HzfEpS8ZtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144727"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144727"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: F9ATRl05Qvy4zJ6HA5+AcQ==
X-CSE-MsgGUID: C7R612ekSsmoZp9Lr+t/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650021"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 06/18] tests/xe_exec_multi_queue: Add close-fd tests
Date: Fri, 31 Oct 2025 11:35:43 -0700
Message-ID: <20251031183555.1882721-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Validate closing the file handle without destroying exec queues.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 6c5ff54ec..c9ff25ffc 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -25,6 +25,7 @@
 
 #define USERPTR			(0x1 << 0)
 #define PRIORITY		(0x1 << 1)
+#define CLOSE_FD		(0x1 << 2)
 
 #define MAX_INSTANCE 9
 
@@ -229,6 +230,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	} *data;
 	int i, b;
 
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
@@ -317,7 +321,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (!(flags & CLOSE_FD))
+			xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
 
 	if (bo) {
@@ -328,7 +333,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	}
 
 	syncobj_destroy(fd, bind_syncobj);
-	xe_vm_destroy(fd, vm);
+
+	if (!(flags & CLOSE_FD))
+		xe_vm_destroy(fd, vm);
+	else
+		drm_close_driver(fd);
 }
 
 /**
@@ -361,6 +370,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * @basic:					basic
  * @userptr:					userptr
  * @priority:					priority
+ * @close-fd:					close fd without destroying exec queues
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -379,6 +389,7 @@ igt_main
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
 		{ "priority", PRIORITY },
+		{ "close-fd", CLOSE_FD },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

