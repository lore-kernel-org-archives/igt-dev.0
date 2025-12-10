Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF5CD3B9BA
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3B410E652;
	Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaK1oGgL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7799910E641
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327185; x=1796863185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z57IQ7ENC48jQ0tA9AkBe2r0kfWf0CKRURQgML/Rpro=;
 b=DaK1oGgL3MIgWCnCywFoXcJ46Mwo7q6FXn3Tcv+7H7shkG4HADpfMUvQ
 jqtMx2EdL0QkatSFXPUsew8gDFCpJEflNDCh3ZWtHgNDp2XXXtGE3JkCv
 7blOQkKPdgt2X/bGvRWc1JDmBuWp6xWVyFOPp1DShQcpJWy47Km5weYBf
 2i+PHtAz3DNBdjortiRL6RZRo6ICmW9dfpzj3Wk/L6iLUU7UIMAFZHxXz
 Rv3gK7fUKsqzR/Vw3gyDdhSEyCjhYNRZ21jhRcEJj7QSAp36i2+DLEme3
 ohogKU/le3j921BOp7E9C1h4yBqs8rL29iV2uDX6iHmb/a+0kGJG2zUSy w==;
X-CSE-ConnectionGUID: Jr3yPFUWS9qzc11YjHwkJA==
X-CSE-MsgGUID: Ho10wl+/TrSXT5N8XU4O8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180400"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180400"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:44 -0800
X-CSE-ConnectionGUID: mvYGA/TGTx6CQOUC0EcFqw==
X-CSE-MsgGUID: 8Ff4Gq71S6GpAOKTgVFxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421612"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:44 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 06/18] tests/intel/xe_exec_multi_queue: Add close-fd tests
Date: Tue,  9 Dec 2025 16:39:41 -0800
Message-ID: <20251210003936.1613078-26-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 561c1a2c9..972e1ceec 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -27,6 +27,7 @@
 
 #define USERPTR			(0x1 << 0)
 #define PRIORITY		(0x1 << 1)
+#define CLOSE_FD		(0x1 << 2)
 
 #define MAX_INSTANCE 9
 
@@ -247,6 +248,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	} *data;
 	int i, b;
 
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
@@ -335,7 +339,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (!(flags & CLOSE_FD))
+			xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
 
 	if (bo) {
@@ -346,7 +351,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -379,6 +388,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * @basic:					basic
  * @userptr:					userptr
  * @priority:					priority
+ * @close-fd:					close fd without destroying exec queues
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -397,6 +407,7 @@ int igt_main()
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
 		{ "priority", PRIORITY },
+		{ "close-fd", CLOSE_FD },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

