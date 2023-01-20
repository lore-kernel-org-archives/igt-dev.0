Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4EE10E136
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 17:39:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 23:11:18 +0530
Message-Id: <20230120174119.3937-5-swati2.sharma@intel.com>
In-Reply-To: <20230120174119.3937-1-swati2.sharma@intel.com>
References: <20230120174119.3937-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/i915/kms_dsc_helper: Improve
 format string
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
index 535061a7..a80f3d78 100644
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
