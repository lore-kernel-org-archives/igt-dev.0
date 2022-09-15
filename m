Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFACD10E165
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 09:39:24 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Sep 2022 15:10:49 +0530
Message-Id: <20220915094049.2481670-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_color_chamelium: Fix port_idx
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
 tests/chamelium/kms_color_chamelium.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
index 678931aa..401f78c8 100644
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
@@ -476,7 +476,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	};
 	int port_idx = test_setup(data, p);
 
-	igt_require(port_idx);
+	igt_require(port_idx >= 0);
 	/*
 	 * CherryView generates values on 10bits that we
 	 * produce with an 8 bits per color framebuffer.
@@ -531,7 +531,7 @@ run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
 {
 	int port_idx = test_setup(data, p);
 
-	igt_require(port_idx);
+	igt_require(port_idx >= 0);
 	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
 
 	data->color_depth = 8;
-- 
2.25.1
