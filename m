Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F34910E1C5
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 09:04:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 14:27:59 +0530
Message-Id: <20230619085800.1994271-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619085800.1994271-1-bhanuprakash.modem@intel.com>
References: <20230619085800.1994271-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/kms_cursor_legacy: Add Spin support for
 XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To support the SPIN tests for XE, just need to fix the allocator
handle, since the same spin apis works for both i915 & XE.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index f7a6202cf..1f0f3b7e6 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -595,7 +595,10 @@ static void basic_flip_cursor(igt_display_t *display,
 	if (flags & BASIC_BUSY)
 	{
 		igt_require_intel(display->drm_fd);
-		ahnd = get_reloc_ahnd(display->drm_fd, 0);
+
+		ahnd = is_i915_device(display->drm_fd) ?
+			get_reloc_ahnd(display->drm_fd, 0) :
+			intel_allocator_open(display->drm_fd, 0, INTEL_ALLOCATOR_RELOC);
 	}
 
 	if (mode >= flip_test_atomic)
@@ -1505,7 +1508,9 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_plane_t *cursor;
 
-	ahnd = get_reloc_ahnd(display->drm_fd, 0);
+	ahnd = is_i915_device(display->drm_fd) ?
+		get_reloc_ahnd(display->drm_fd, 0) :
+		intel_allocator_open(display->drm_fd, 0, INTEL_ALLOCATOR_RELOC);
 
 	if (atomic)
 		igt_require(display->is_atomic);
-- 
2.40.0
