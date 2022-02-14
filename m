Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240E910E1BC
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:01:03 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:29:59 +0530
Message-Id: <20220214150009.26815-7-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
References: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 06/16] igt/tests: Add support for
 Tile4(TileF) format to kms_rotation_crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Adding subtest to test new tiling format.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 3f716002..50869a08 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -983,6 +983,8 @@ static const char *modifier_test_str(uint64_t modifier)
 		return "y-tiled";
 	case I915_FORMAT_MOD_Yf_TILED:
 		return "yf-tiled";
+	case I915_FORMAT_MOD_4_TILED:
+		return "4-tiled";
 	default:
 		igt_assert(0);
 	}
@@ -1041,6 +1043,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		{ I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_90 },
 		{ I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_180 },
 		{ I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_270 },
+		{ I915_FORMAT_MOD_4_TILED, IGT_ROTATION_0 },
+		{ I915_FORMAT_MOD_4_TILED, IGT_ROTATION_180 },
 		{ 0, 0 }
 	};
 
-- 
2.17.1
