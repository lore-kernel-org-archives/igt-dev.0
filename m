Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3264010E32F
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 11:25:40 +0000 (UTC)
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_content_protection: Add LIC Type 1 scenario
Date: Tue, 16 Jan 2024 16:53:35 +0530
Message-Id: <20240116112335.353869-1-suraj.kandpal@intel.com>
In-Reply-To: <20240112103330.169688-1-suraj.kandpal@intel.com>
References: <20240112103330.169688-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently LIC is done only for type0 content this patch
adds LIC for type1 content too.

--v2
-Use arg[1] [Swati]
-Mention Functionality [Swati]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_content_protection.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6d472ee02..7368cb982 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -43,8 +43,14 @@
 #include "igt_kmod.h"
 
 /**
- * SUBTEST: lic
- * Description: Test for the integrity of link.
+ * SUBTEST: lic-%s
+ * Description: Test for the integrity of link for %arg[1] content.
+ * Functionality: hdcp1.4, hdcp2.2
+ *
+ * arg[1]:
+ *
+ * @type-0:	Type 0 with LIC
+ * @type-1:	Type 1 with LIC
  *
  * SUBTEST: content-type-change
  * Description: Test the content type change when the content protection already
@@ -783,11 +789,16 @@ static const struct {
 	  .cp_tests = CP_DPMS,
 	  .content_type = HDCP_CONTENT_TYPE_0
 	},
-	{ .desc = "Test for the integrity of link.",
-	  .name = "lic",
+	{ .desc = "Test for the integrity of link with type 0 content.",
+	  .name = "lic-type-0",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	},
+	{ .desc = "Test for the integrity of link with type 1 content",
+	  .name = "lic-type-1",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
 	{ .desc = "Test content protection with content type 1 "
 		  "that can be handled only through HDCP2.2.",
 	  .name = "type1",
-- 
2.25.1
