Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534ADC47258
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 00:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3A710F8F0;
	Thu,  1 Feb 2024 00:45:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FC510F8F0
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 00:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748303; x=1738284303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JqnQCaHc47BaaUhXpE5SIBHT/cR+lrruT/yGImAzjLs=;
 b=BdgYrhKhBmnyhdwOEtVJ4LSHFwCWn0DMJQnkCozUGvRdL2HLrwjf6s01
 6KAMcuNu3H+6d/EwtCyAan0tjXxKbKufDi3mL3EZ36T80Z9sW6QJADyr9
 NQsLmi6J9Tp4+dZ0irfr3sGJ0J6AsiRmejtUlvyi6LGeaHXlbyVFmKGl+
 tuEP/YjfL9M+vJeUn48jno6dSbPTRw6P/Gf+Y3tfV3FZ168GHurTu6EJM
 RgaDkOMk5Z1LsZi3v7elpoDwIYszOc0BgzqwpZ6TmL00ruxKSJWzMBCkW
 h9DofxfXdiLq/YoYNuPhN931HMZb0ieXFTOZOGhbX82npZ3DckZ9O/Vxm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10406402"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="10406402"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:44:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="4254943"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:44:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] tests/kms_rmfb: Fix subtest description
Date: Wed, 31 Jan 2024 16:44:48 -0800
Message-ID: <20240201004448.351926-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Kernel driver is responsible to do those actions. kms_rmfb is then
checking if that was true in 2 cases: a) DRM_IOCTL_MODE_RMFB was called
or b) the file descriptor was closed.

v2: Fix swapped description (Swati)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/kms_rmfb.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 39e8bbd55..0ea689d60 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -24,7 +24,7 @@
 /**
  * TEST: kms rmfb
  * Category: Display
- * Description: This tests rmfb and close-fd behavior. In these casesthe
+ * Description: This tests rmfb and close-fd behavior. In these cases the
  *              framebuffers should be removed from the crtc.
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
@@ -42,12 +42,13 @@
 
 /**
  * SUBTEST: close-fd
- * Description: RMFB is supposed to free the framebuffers from any and all planes
- *              so test this and make sure it works with fd close and reopen.
+ * Description: Kernel driver is supposed to free the framebuffers from any and all planes
+ *		when the fd is closed. Ensure that is the case by closing and re-opening
+ *		it.
  *
  * SUBTEST: rmfb-ioctl
- * Description: RMFB is supposed to free the framebuffers from any and all planes
- *              so test this and make sure it works.
+ * Description: Kernel driver is supposed to free the framebuffers from any and all planes
+ *              when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case.
  */
 
 #ifndef DRM_CAP_CURSOR_WIDTH
@@ -57,7 +58,7 @@
 #define DRM_CAP_CURSOR_HEIGHT 0x9
 #endif
 
-IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases"
+IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases "
 		     "the framebuffers should be removed from the crtc.");
 
 struct rmfb_data {
@@ -198,11 +199,11 @@ igt_main
 		const char *name;
 		const char *description;
 	} tests[] = {
-		{ false, "rmfb-ioctl", "RMFB is supposed to free the framebuffers from any and all "
-				       "planes so test this and make sure it works."},
-		{ true, "close-fd", "RMFB is supposed to free the framebuffers from any and all "
-				    "planes so test this and make sure it works with fd close "
-				    "and reopen."},
+		{ false, "rmfb-ioctl", "Kernel driver is supposed to free the framebuffers from any and all planes "
+				       "when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case." },
+		{ true, "close-fd", "Kernel driver is supposed to free the framebuffers from any and all planes "
+				    "when the fd is closed. Ensure that is the case by closing and re-opening "
+				    "it" },
 	};
 	struct rmfb_data data = {};
 	int i;
-- 
2.43.0

