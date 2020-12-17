Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5546E1EC
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Dec 2020 09:37:51 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 17 Dec 2020 15:08:57 +0530
Message-Id: <20201217093857.3283640-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_color_chamelium fix update success
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Made a silly mistake and didn't update bool success to true
fixing that with this patch.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_color_chamelium.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 43bbe1f2..af2bf994 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -611,8 +611,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[2].b =
 				0.25 + delta * (i - 2);
 			if(test_pipe_ctm(data, primary, red_green_blue,
-					 expected_colors, ctm))
+					 expected_colors, ctm)) {
+				success = true;
 				break;
+			}
 		}
 		igt_assert(success);
 	}
@@ -633,8 +635,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[2].b =
 				0.5 + delta * (i - 2);
 			if(test_pipe_ctm(data, primary, red_green_blue,
-					 expected_colors, ctm))
+					 expected_colors, ctm)) {
+				success = true;
 				break;
+			}
 		}
 		igt_assert(success);
 	}
@@ -655,8 +659,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[2].b =
 				0.75 + delta * (i - 3);
 			if(test_pipe_ctm(data, primary, red_green_blue,
-					 expected_colors, ctm))
+					 expected_colors, ctm)) {
+				success = true;
 				break;
+			}
 		}
 		igt_assert(success);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
