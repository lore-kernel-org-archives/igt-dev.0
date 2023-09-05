Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2093910E2B1
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 16:50:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 22:12:28 +0530
Message-Id: <20230905164230.1679263-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
References: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 3/5] tests/kms_flip: Fix testplan documentation
 for hang tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update testplan documentation for hang tests (Add "hang" to
the Functionality).

V2: - Update commit message

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_flip.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 23c71cee2..10617d520 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -109,6 +109,29 @@
  * Test category: functionality test
  */
 
+/**
+ * SUBTEST: %s
+ * Description: Basic test to validate %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: hang, vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: 2x-%s
+ * Description: Test to validate %arg[1] on a pair of connected displays
+ * Driver requirement: i915, xe
+ * Functionality: hang, vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @flip-vs-modeset-vs-hang:      pageflip and modeset by hang injection
+ * @flip-vs-panning-vs-hang:      pageflip with panning by hang injection
+ */
+
 /**
  * SUBTEST: %s
  * Description: Basic test to validate %arg[1]
@@ -140,8 +163,6 @@
  * @flip-vs-expired-vblank:       pageflip by checking the vbalnk sequence
  * @flip-vs-absolute-wf_vblank:   pageflip and wait for the absolute vblank
  * @flip-vs-blocking-wf-vblank:   pageflip and wait for the absolute vblank synchronous
- * @flip-vs-modeset-vs-hang:      pageflip and modeset by hang injection
- * @flip-vs-panning-vs-hang:      pageflip with panning by hang injection
  * @nonexisting-fb:               expired framebuffer
  * @modeset-vs-vblank-race:       modeset and check for vblank
  */
-- 
2.40.0
