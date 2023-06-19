Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7A310E1FC
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:21 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:53 +0530
Message-Id: <20230619115858.2013195-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 13/18] tests/i915/kms_flip_tiling: Add tiling
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
index a22f12382..9c3d149c4 100644
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
