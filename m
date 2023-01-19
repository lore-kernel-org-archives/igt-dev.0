Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8384710E8F9
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 09:23:29 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Jan 2023 14:55:30 +0530
Message-Id: <20230119092530.3780-5-swati2.sharma@intel.com>
In-Reply-To: <20230119092530.3780-1-swati2.sharma@intel.com>
References: <20230119092530.3780-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 4/4] tests/i915/kms_dsc_helper: Improve format string
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

Make format string more specific.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index 535061a74..a80f3d787 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -14,7 +14,7 @@ void force_dsc_enable(int drmfd, igt_output_t *output)
 
 	igt_debug("Forcing DSC enable on %s\n", output->name);
 	ret = igt_force_dsc_enable(drmfd, output->name);
-	igt_assert_f(ret > 0, "debugfs_write failed");
+	igt_assert_f(ret > 0, "forcing dsc enable debugfs_write failed\n");
 }
 
 void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
@@ -24,7 +24,7 @@ void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
 	igt_debug("Forcing input DSC BPC to %d on %s\n",
 		  input_bpc, output->name);
 	ret = igt_force_dsc_enable_bpc(drmfd, output->name, input_bpc);
-	igt_assert_f(ret > 0, "debugfs_write failed");
+	igt_assert_f(ret > 0, "forcing input dsc bpc debugfs_write failed\n");
 }
 
 void save_force_dsc_en(int drmfd, igt_output_t *output)
-- 
2.25.1
