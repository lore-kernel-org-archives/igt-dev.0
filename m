Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882016E965
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2020 07:39:56 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Fri, 27 Nov 2020 13:09:49 +0530
Message-Id: <20201127073949.18730-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20201127073949.18730-1-mohammed.khajapasha@intel.com>
References: <20201127073949.18730-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/1] tests/kms_plane_scaling: Correcting typo
 error for plane scaler test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Correcting typo error for plane scaler with clipping and clamping
test case.

Cc: petri.latvala@intel.com
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_plane_scaling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 39acad6c..89b82416 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -714,7 +714,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
 					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 		}
 	}
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
