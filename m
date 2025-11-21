Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FD8CFA46C
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193A710E7F8;
	Fri, 21 Nov 2025 03:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lj/EoLFX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA54910E7F7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697447; x=1795233447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ralfG7j8DNeJR8chwXgcrVLk7HmtEz6jxvglZA8R+f0=;
 b=Lj/EoLFXPs6HjzBXXum9mY6F1bPCvdeGyzQFKvQjLdZyoQHdBuFTvG2g
 uO49eDqgD9olI3EQHUBfLRc2gzbKNWLRtCx+xr44ArJlf4r0PkLb2vgDz
 7pYWsSiwKl6A9kJzUh7qZXvRSpGEiw/oyuXR8/1LIEybEwFO8/17FmuFm
 +7wWkEwn7NaPHwhd9sJ3MfYYFf1ObZS74cbYQ4yUEXaPc5KBF5wYonCTv
 rc1kbhUu3pPQTXpv8236aMTrEHElpYKEqF6WzR6EnmRlJJegxxVbAlfFI
 ZIOADYn+HWOLfBG9R7ZTZh+Bkiczz46AVj+HIiE9T/iKEROvirI+jTHvl A==;
X-CSE-ConnectionGUID: /SgrutgzT9GUOkVc+8FqHw==
X-CSE-MsgGUID: BH+N/Ws1R5a0/V31qLHhfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484668"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:26 -0800
X-CSE-ConnectionGUID: nisj1XgiQkmUi4P/B0/WyQ==
X-CSE-MsgGUID: EV6be23qQCWbWMwOiWvCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433479"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 06/19] tests/intel/xe_exec_multi_queue: Add close-fd tests
Date: Thu, 20 Nov 2025 19:57:18 -0800
Message-ID: <20251121035715.767226-27-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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
index 3bbcf7975..df60835d6 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -27,6 +27,7 @@
 
 #define USERPTR			(0x1 << 0)
 #define PRIORITY		(0x1 << 1)
+#define CLOSE_FD		(0x1 << 2)
 
 #define MAX_INSTANCE 9
 
@@ -233,6 +234,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	} *data;
 	int i, b;
 
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
@@ -321,7 +325,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (!(flags & CLOSE_FD))
+			xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
 
 	if (bo) {
@@ -332,7 +337,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -365,6 +374,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * @basic:					basic
  * @userptr:					userptr
  * @priority:					priority
+ * @close-fd:					close fd without destroying exec queues
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -383,6 +393,7 @@ igt_main
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
 		{ "priority", PRIORITY },
+		{ "close-fd", CLOSE_FD },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

