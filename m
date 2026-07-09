Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD85C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 05:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B403310E002;
	Thu,  9 Jul 2026 05:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ck4Tb3/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841B710E002
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 05:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783574870; x=1815110870;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s76IsLj6mCv3RdJ4+x+Uv6WR0j5ifQ0BjxLG8XWVoyM=;
 b=Ck4Tb3/dCtRpdiIEWcY2HndgWdQ01HV9f34PBF8/Y/uw9gd5WZHa3HA7
 P9PG/1MVqrgePJyhCPrOWHXgs96k0fLAMOz6ShdKjcLRxuxCQeBhdffvz
 U9IYlGH/jZqpDipKFG0GWVwlTZp9D66NHi/Uih+vExPmyk9SXOUDV/ppm
 4W5PbjgM28VEFuRdkrDlHONqdIF5qR32fgSKF4zgtCXjfHIE2ZbWD0oNF
 0gOZvxUx5KYfKltXf1YhCyGdC0k5Kaga13VTRBGSShzW2/eKT7mgV4ktk
 voHuU6tmEGczTln9xcwJHleaBcX1vtq0w6DnEUgssBAq9X2UZf7DCxsdm w==;
X-CSE-ConnectionGUID: twSMuBClQti7DeVyd7nFdQ==
X-CSE-MsgGUID: oHpTlZEhSqO6guSpDiNydg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109794323"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109794323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 22:27:49 -0700
X-CSE-ConnectionGUID: AgG2K+3oRI227BoMe5t0Vg==
X-CSE-MsgGUID: r3y2EpT9SQO4ZIY66vWb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256401341"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 08 Jul 2026 22:27:47 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_cw_post_sync: Rename test and relax
 platform
Date: Thu,  9 Jul 2026 10:57:47 +0530
Message-ID: <20260709052746.2073312-2-priyanka.dandamudi@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Rename test to xe_cw_post_sync as it works for both msix and non
msix.
Also rename the subtest and internal shader helper functions.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 .../{xe_non_msix.c => xe_cw_post_sync.c}      | 19 +++++++++----------
 tests/meson.build                             |  2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename tests/intel/{xe_non_msix.c => xe_cw_post_sync.c} (92%)

diff --git a/tests/intel/xe_non_msix.c b/tests/intel/xe_cw_post_sync.c
similarity index 92%
rename from tests/intel/xe_non_msix.c
rename to tests/intel/xe_cw_post_sync.c
index 9515dc487a..1aa2f13139 100644
--- a/tests/intel/xe_non_msix.c
+++ b/tests/intel/xe_cw_post_sync.c
@@ -4,11 +4,11 @@
  */
 
 /**
- * TEST: Tests for Compute walker interrupt on non msix mode.
+ * TEST: Tests for Compute walker post sync interrupt
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: Compute walker interrupt
- * Functionality: Compute walker interrupt on non msix mode
+ * Functionality: Compute walker post sync interrupt notification
  * Test category: functionality test
  */
 #include "gpgpu_shader.h"
@@ -86,7 +86,7 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
 	return ibb;
 }
 
-static struct gpgpu_shader *get_non_msix_shader(int fd, const uint64_t flags)
+static struct gpgpu_shader *get_cw_post_sync_shader(int fd, const uint64_t flags)
 {
 	static struct gpgpu_shader *shader;
 
@@ -137,8 +137,8 @@ static void *thread1_fn(void *arg)
 	intel_bb_add_intel_buf(ibb, t_data->post_sync, true);
 	intel_bb_add_intel_buf(ibb, poll_buf, true);
 
-	shader1 = get_non_msix_shader(t_data->fd, SHADER_SIMPLE_DWORD);
-	shader2 = get_non_msix_shader(t_data->fd, SHADER_LOOP);
+	shader1 = get_cw_post_sync_shader(t_data->fd, SHADER_SIMPLE_DWORD);
+	shader2 = get_cw_post_sync_shader(t_data->fd, SHADER_LOOP);
 
 	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
 
@@ -236,8 +236,8 @@ static void *thread2_fn(void *arg)
 }
 
 /**
- * SUBTEST: walker-interrupt-notification-non-msix
- * Description: Validate walker interrupt notification in non msix mode.
+ * SUBTEST: walker-post-sync
+ * Description: Validate walker post sync interrupt notification.
  * Run type: FULL
  */
 static void test_walker_notification(int fd, struct drm_xe_engine_class_instance *hwe)
@@ -281,16 +281,15 @@ int igt_main()
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) == IP_VER(35, 11));
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 11));
 	}
 
-	igt_subtest_with_dynamic("walker-interrupt-notification-non-msix") {
+	igt_subtest_with_dynamic("walker-post-sync") {
 		xe_for_each_engine(fd, hwe) {
 			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
 				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
 					      hwe->engine_instance)
 					test_walker_notification(fd, hwe);
-				break;
 			}
 		}
 	}
diff --git a/tests/meson.build b/tests/meson.build
index 6d90627b93..895d3c50d8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -321,7 +321,7 @@ intel_xe_progs = [
         'xe_module_load',
         'xe_multigpu_svm',
 	'xe_noexec_ping_pong',
-        'xe_non_msix',
+	'xe_cw_post_sync',
 	'xe_oa',
 	'xe_page_reclaim',
 	'xe_pat',
-- 
2.43.0

