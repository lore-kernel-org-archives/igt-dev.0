Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF046E8F3
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:50 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Wed,  3 Mar 2021 19:05:01 +0530
Message-Id: <20210303133501.29815-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_3d: update stereo mode count
 static value
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

To set 3D mode, we need atleast one supported 3d mode is
sufficient.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Sharma Swati2 <swati2.sharma@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/kms_3d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 2622b2d0a6..a88a86eea3 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -69,7 +69,7 @@ igt_simple_main
 			mode_count++;
 	}
 
-	igt_assert_eq(mode_count, 13);
+	igt_assert(mode_count);
 
 	/* set 3D modes */
 	igt_info("Testing:\n");
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
