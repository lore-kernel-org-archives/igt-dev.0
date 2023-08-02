Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F207910E54A
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 10:28:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 15:50:54 +0530
Message-Id: <20230802102059.3650360-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
References: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 12/17] tests/i915/kms_flip_tiling: Add tiling
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

Fixes: 77e9c217f (tests/i915/kms_flip_tiling: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_flip_tiling.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 02a5fe8e3..af42af05c 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -217,12 +217,6 @@ igt_main
 					if (plane->formats[j] != data.testformat)
 						continue;
 
-					/* No tiling support in XE. */
-					if (is_xe_device(data.drm_fd) &&
-					    (plane->modifiers[i] != DRM_FORMAT_MOD_LINEAR ||
-					     plane->modifiers[j] != DRM_FORMAT_MOD_LINEAR))
-						continue;
-
 					igt_dynamic_f("%s-pipe-%s-%s-to-%s",
 						      igt_output_name(output),
 						      kmstest_pipe_name(pipe),
-- 
2.40.0
