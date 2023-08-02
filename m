Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EE610E53B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 10:28:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 15:50:49 +0530
Message-Id: <20230802102059.3650360-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
References: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 07/17] tests/kms_plane_scaling: Add tiling
 support for XE
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

Remove the tiling restrictions in Xe specific tests

Fixes: 28bc56a8b (tests/kms_plane_scaling: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_scaling.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 920290e4d..2fcd10faf 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -545,10 +545,6 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 			uint64_t modifier = modifiers[i];
 
-			if (is_xe_device(d->drm_fd) &&
-			    modifier != DRM_FORMAT_MOD_LINEAR)
-				continue;
-
 			if (igt_plane_has_format_mod(plane, format, modifier))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
-- 
2.40.0
