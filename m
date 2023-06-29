Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C719F10E409
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:19:01 +0530
Message-Id: <20230629144910.3055377-73-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 72/81] tests/kms_sequence: Document each
 subtest for testplan
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_sequence.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 1b96f0017..12c3396f5 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -27,6 +27,11 @@
  * This is a test of drmCrtcGetSequence and drmCrtcQueueSequence
  */
 
+/**
+ * TEST: kms sequence
+ * Category: Display
+ * Description: Test CrtcGetSequence and CrtcQueueSequence.
+ */
 #include "igt.h"
 #include <stdlib.h>
 #include <stdio.h>
@@ -136,6 +141,37 @@ static int crtc_queue_sequence(int fd, struct drm_crtc_queue_sequence *cqs)
 	return err;
 }
 
+/**
+ * SUBTEST: get-%s
+ * Description: This is a test of drmCrtcGetSequence and drmCrtcQueueSequence
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @busy:
+ * @forked:
+ * @forked-busy:
+ * @idle:
+ */
+
+/**
+ * SUBTEST: queue-%s
+ * Description: This is a test of drmCrtcGetSequence and drmCrtcQueueSequence
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @busy:
+ * @idle:
+ */
 static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 {
 	int nchildren =
-- 
2.40.0
