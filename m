Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2054.outbound.protection.outlook.com [40.107.101.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DB910E478
 for <igt-dev@lists.freedesktop.org>; Tue,  3 May 2022 21:50:36 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 3 May 2022 15:49:43 -0600
Message-ID: <20220503214943.834440-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t][RFC] tests/kms_universal_plane: move to
 i915 directory
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

kms_universal_plane test heavily depends on Intel devices so it can be
moved to i915 directory.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/{ => i915}/kms_universal_plane.c | 0
 tests/meson.build                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/{ => i915}/kms_universal_plane.c (100%)

diff --git a/tests/kms_universal_plane.c b/tests/i915/kms_universal_plane.c
similarity index 100%
rename from tests/kms_universal_plane.c
rename to tests/i915/kms_universal_plane.c
diff --git a/tests/meson.build b/tests/meson.build
index fb0f1e37..c08f876d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -58,7 +58,6 @@ test_progs = [
 	'kms_setmode',
 	'kms_sysfs_edid_timing',
 	'kms_tv_load_detect',
-	'kms_universal_plane',
 	'kms_vblank',
 	'kms_vrr',
 	'kms_writeback',
@@ -243,6 +242,7 @@ i915_progs = [
 	'kms_psr2_sf',
 	'kms_psr_stress_test',
 	'kms_pwrite_crc',
+	'kms_universal_plane',
 	'sysfs_clients',
 	'sysfs_defaults',
 	'sysfs_heartbeat_interval',
-- 
2.25.1
