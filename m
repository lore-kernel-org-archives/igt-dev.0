Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE36B606A324
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jt9p9VaI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757BD10E10C;
	Mon, 26 Oct 2026 16:54:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692B910E10C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793033611; x=1824569611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HILi4vVu/FyD8J9r4ETdHIxto0uUHxxsfg3/6xgYxJ4=;
 b=Jt9p9VaIzAtyCMeOHYUQ6Apoi0tJ5VydxMRKIQMHU9pB4xBjKFSijqN7
 bNDNZKw6kqsEo0OAgVd78cyN4w9tguCZ3y+EfSu+h0RttckVGu5zUvu9R
 2GV2gnQ/eENYCyBZCMucPm+ZqHzqhXrHi4jWxauGMfUyP2Joz62IyN0Hf
 GJhIf6OOteK6DfoXrAimxvrgrsTo1cG++7nV4ao8IWEPDd69y4m1gU/7Y
 6BVfsgdR/wPFB13bDAMXivyw9mVNFUhvOzRk3B3TyPZAaJGgzdTDTJ4vG
 2/gfqTlfumiFVPMcdBzmsb2RGB66nwxvM80yXsOuoqUZh6Ucexc7/MdgK g==;
X-CSE-ConnectionGUID: VIqWKGRFSA2nYQfLWO0BrQ==
X-CSE-MsgGUID: 4gv2X3H4QIKjHVQeTDCeFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1700486"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1700486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:53:31 -0700
X-CSE-ConnectionGUID: Pb63qbLBSYSBY+CuCZ2E8Q==
X-CSE-MsgGUID: Mgs5alNZRK6Q79/hqg/VtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4384325"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:53:30 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] tests/kms_plane_cursor: reduce CI debug output
Date: Mon, 26 Oct 2026 22:23:42 +0530
Message-ID: <20261026165342.1424981-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use DRM_UT_CORE in CI to reduce KMS log volume while retaining CORE
diagnostics. This applies to all subtests, including overlay, which
reported truncated dmesg output.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16960
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_cursor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..9c6aa7bf5 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -29,6 +29,7 @@
  */
 
 #include "igt.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: overlay
@@ -322,6 +323,9 @@ int igt_main()
 		igt_assert(ret == 0 || errno == EINVAL);
 
 		kmstest_set_vt_graphics_mode();
+
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		update_debug_mask_if_ci(DRM_UT_CORE);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
-- 
2.43.0

