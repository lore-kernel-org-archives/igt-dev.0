Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D02D10EAD2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 09:24:41 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Sep 2022 14:56:25 +0530
Message-Id: <20220915092625.2481132-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_color_chamelium: Fix port_idx
 check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

chamelium has a port with id 0, so return -1 instead.

Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_color_chamelium.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
index 678931aa..05a06155 100644
--- a/tests/chamelium/kms_color_chamelium.c
+++ b/tests/chamelium/kms_color_chamelium.c
@@ -443,7 +443,7 @@ static int test_setup(data_t *data, enum pipe p)
 		}
 	}
 
-	return 0;
+	return -1;
 }
 
 static void
@@ -452,7 +452,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 {
 	int port_idx = test_setup(data, p);
 
-	igt_require(port_idx);
+	igt_require(port_idx >= 0);
 
 	data->color_depth = 8;
 	data->drm_format = DRM_FORMAT_XRGB8888;
-- 
2.25.1
