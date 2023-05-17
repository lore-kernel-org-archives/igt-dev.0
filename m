Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB3010E3D4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:14 +0530
Message-Id: <20230517063323.4146387-73-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 72/81] tests/kms_sequence: Document each
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_sequence.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index c8a3d6bbd..c6f5741a5 100644
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


