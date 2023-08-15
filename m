Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F6310E273
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:58 +0530
Message-Id: <20230815164815.320904-65-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 64/81] tests/kms_prime: Document each subtest
 for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Driver requirement: s/any/i915, xe/
    - Add "hybrid" to the functionality

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index dedbf6233..a14006147 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -30,6 +30,41 @@
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <time.h>
+/**
+ * TEST: kms prime
+ * Category: Display
+ * Description: Prime tests, focusing on KMS side
+ *
+ * SUBTEST: D3hot
+ * Description: Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU
+ * Driver requirement: i915, xe
+ * Functionality: hybrid, kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-modeset-hybrid
+ * Description: Basic modeset on the one device when the other device is active
+ * Driver requirement: i915, xe
+ * Functionality: hybrid, kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-crc-%s
+ * Description: Make a dumb color buffer, export to another device and compare
+ *              the CRCs with a buffer native to that device
+ * Driver requirement: i915, xe
+ * Functionality: crc, hybrid, kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @hybrid:
+ * @vgem:
+ */
 
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define KMS_POLL_DISABLE 0
-- 
2.40.0
