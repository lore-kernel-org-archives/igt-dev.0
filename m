Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCCB10E23B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:01:10 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:30:02 +0530
Message-Id: <20220214150009.26815-10-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
References: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 09/16] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_big_fb
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

Extending the test to support new Tiling format.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_big_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 9ebf6155..8724d606 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -784,6 +784,7 @@ static const struct {
 	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
 	{ I915_FORMAT_MOD_Y_TILED, "y-tiled", },
 	{ I915_FORMAT_MOD_Yf_TILED, "yf-tiled", },
+	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
 };
 
 static const struct {
-- 
2.17.1
