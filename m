Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EFB10F824
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 16:45:10 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jun 2022 22:11:56 +0530
Message-Id: <20220627164156.15646-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220627164156.15646-1-mohammed.thasleem@intel.com>
References: <20220627164156.15646-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/2] tests/i915/kms_legacy_colorkey: Test
 Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_legacy_colorkey.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
index 92be2567..71b1bbb9 100644
--- a/tests/i915/kms_legacy_colorkey.c
+++ b/tests/i915/kms_legacy_colorkey.c
@@ -51,6 +51,9 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, drm_fd);
+		igt_display_require_output(&display);
+		igt_display_reset(&display);
+		igt_display_commit(&display);
 		for_each_pipe(&display, p) {
 			for_each_plane_on_pipe(&display, p, plane) {
 				max_id = max(max_id, plane->drm_plane->plane_id);
@@ -86,5 +89,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&display);
+		close(drm_fd);
 	}
 }
-- 
2.25.1
