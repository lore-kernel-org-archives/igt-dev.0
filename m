Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648C010E671
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 14:19:51 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Oct 2023 19:57:16 +0530
Message-Id: <20231025142716.1019749-8-kunal1.joshi@intel.com>
In-Reply-To: <20231025142716.1019749-1-kunal1.joshi@intel.com>
References: <20231025142716.1019749-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] HAX PATCH DO NOT MERGE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hax patch to test, please do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 65 +++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c252e2cf0..678d42f94 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,71 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+# Hax patch for testing do not merge
+igt@kms_psr@psr_basic
+igt@kms_psr@psr_no_drrs
+igt@kms_psr@psr_primary_page_flip
+igt@kms_psr@psr_primary_mmap_gtt
+igt@kms_psr@psr_primary_mmap_cpu
+igt@kms_psr@psr_primary_blt
+igt@kms_psr@psr_primary_render
+igt@kms_psr@psr_sprite_mmap_gtt
+igt@kms_psr@psr_cursor_mmap_gtt
+igt@kms_psr@psr_sprite_mmap_cpu
+igt@kms_psr@psr_cursor_mmap_cpu
+igt@kms_psr@psr_sprite_blt
+igt@kms_psr@psr_cursor_blt
+igt@kms_psr@psr_sprite_render
+igt@kms_psr@psr_cursor_render
+igt@kms_psr@psr_sprite_plane_move
+igt@kms_psr@psr_cursor_plane_move
+igt@kms_psr@psr_sprite_plane_onoff
+igt@kms_psr@psr_cursor_plane_onoff
+igt@kms_psr@psr_dpms
+igt@kms_psr@psr_suspend
+igt@kms_psr@psr2_basic
+igt@kms_psr@psr2_no_drrs
+igt@kms_psr@psr2_primary_page_flip
+igt@kms_psr@psr2_primary_mmap_gtt
+igt@kms_psr@psr2_primary_mmap_cpu
+igt@kms_psr@psr2_primary_blt
+igt@kms_psr@psr2_primary_render
+igt@kms_psr@psr2_sprite_mmap_gtt
+igt@kms_psr@psr2_cursor_mmap_gtt
+igt@kms_psr@psr2_sprite_mmap_cpu
+igt@kms_psr@psr2_cursor_mmap_cpu
+igt@kms_psr@psr2_sprite_blt
+igt@kms_psr@psr2_cursor_blt
+igt@kms_psr@psr2_sprite_render
+igt@kms_psr@psr2_cursor_render
+igt@kms_psr@psr2_sprite_plane_move
+igt@kms_psr@psr2_cursor_plane_move
+igt@kms_psr@psr2_sprite_plane_onoff
+igt@kms_psr@psr2_cursor_plane_onoff
+igt@kms_psr@psr2_dpms
+igt@kms_psr@psr2_suspend
+igt@kms_psr@pr_basic
+igt@kms_psr@pr_no_drrs
+igt@kms_psr@pr_primary_page_flip
+igt@kms_psr@pr_primary_mmap_gtt
+igt@kms_psr@pr_primary_mmap_cpu
+igt@kms_psr@pr_primary_blt
+igt@kms_psr@pr_primary_render
+igt@kms_psr@pr_sprite_mmap_gtt
+igt@kms_psr@pr_cursor_mmap_gtt
+igt@kms_psr@pr_sprite_mmap_cpu
+igt@kms_psr@pr_cursor_mmap_cpu
+igt@kms_psr@pr_sprite_blt
+igt@kms_psr@pr_cursor_blt
+igt@kms_psr@pr_sprite_render
+igt@kms_psr@pr_cursor_render
+igt@kms_psr@pr_sprite_plane_move
+igt@kms_psr@pr_cursor_plane_move
+igt@kms_psr@pr_sprite_plane_onoff
+igt@kms_psr@pr_cursor_plane_onoff
+igt@kms_psr@pr_dpms
+igt@kms_psr@pr_suspend
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1
