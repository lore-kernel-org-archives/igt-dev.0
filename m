Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0FF10E766
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 05:09:42 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Feb 2022 10:38:51 +0530
Message-Id: <20220225050853.8349-9-jeevan.b@intel.com>
In-Reply-To: <20220225050853.8349-1-jeevan.b@intel.com>
References: <20220225050853.8349-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 08/10] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_big_fb
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
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
