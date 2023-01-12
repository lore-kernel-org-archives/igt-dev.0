Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EF310E890
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 07:33:44 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 Jan 2023 13:05:37 +0530
Message-Id: <20230112073537.27890-9-swati2.sharma@intel.com>
In-Reply-To: <20230112073537.27890-1-swati2.sharma@intel.com>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 8/8] tests/i915/kms_dsc: Add test summary
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

Add test summary giving overall view of what all is being validated
in the test.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index fda96b5c2..4c0fd1e2b 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -34,6 +34,17 @@
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
+/*
+ * i915 driver supports DSC1.1 from gen11+. To validate DSC, we have
+ * different scenarios
+ * (i) basic modeset (ii) input bpc (iii) formats (iv) fractional bpp
+ * These tests will check for basic DSC support by the connector and
+ * few other gen specific constraints. Fractional bpp got introduced
+ * with DSC1.2 from MTL. By default, tests will get executed on RGB444
+ * output format. However, if sink and platform supports YCBCR420, all the
+ * tests will get executed with this format too.
+ */
+
 enum dsc_test_type {
 	TEST_DSC_BASIC,
 	TEST_DSC_BPC,
-- 
2.25.1
