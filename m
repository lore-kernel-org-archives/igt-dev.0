Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5666210E231
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 11:30:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/xe_intel_bb: Use Tile4 instead Y on render
 subtest
Date: Mon,  8 Jan 2024 12:30:12 +0100
Message-Id: <20240108113012.382557-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
References: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Discrete and beyond (Xe2) replaced Y tiling with 4Tile. Reflect
this in render subtest as it is used only on those platforms on Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/xe_intel_bb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index d3d7a4fb69..161f766a05 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -1052,7 +1052,7 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	} tests[] = {
 		{ I915_TILING_NONE, "none" },
 		{ I915_TILING_X, "x" },
-		{ I915_TILING_Y, "y" },
+		{ I915_TILING_4, "4" },
 	};
 
 	igt_fixture {
-- 
2.34.1
