Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586310E1D0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 09:53:30 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 11:53:24 +0200
Message-Id: <20230619095324.3931861-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_spin_batch: fix test
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: aditya.chauhan@intel.com, Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The test documentation is wrong:
- it should have just one TEST: tag with the contents of the
  test file;
- it is missing Category, Sub-category, Functionality and
  Test category fields. Those are needed for proper grafana
  functionality mapping.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_spin_batch.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
index bc13bddddf73..29a837251058 100644
--- a/tests/xe/xe_spin_batch.c
+++ b/tests/xe/xe_spin_batch.c
@@ -4,15 +4,20 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+/**
+ * TEST: Tests for spin batch submissons.
+ * Category: Software building block
+ * Sub-category: spin
+ * Functionality: intel-bb
+ * Test category: functionality test
+ */
+
 #define MAX_INSTANCE 9
 
 /**
- * TEST: Basic test for spin batch submissons.
- *
  * SUBTEST: spin-basic
  * Description: Basic test to submit spin batch submissons on copy engine.
  * Run type: FULL
- *
  */
 
 static void spin_basic(int fd)
@@ -28,12 +33,9 @@ static void spin_basic(int fd)
 }
 
 /**
- * TEST:Test for spin batch submissons.
- *
  * SUBTEST: spin-batch
  * Description: Create vm and engine of hwe class and run the spinner on it.
  * Run type: FULL
- *
  */
 
 static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
@@ -57,12 +59,9 @@ static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
 }
 
 /**
- * TEST: Basic test for spin batch submission on all hwe.
- *
  * SUBTEST: spin-basic-all
  * Description: Basic test which validates the functionality of spinner on all hwe.
  * Run type: FULL
- *
  */
 static void spin_basic_all(int fd)
 {
@@ -91,11 +90,9 @@ static void spin_basic_all(int fd)
 }
 
 /**
- * TEST: Test for spin batch submissions.
  * SUBTEST: spin-all
  * Description: Spinner test to run on all the engines!
  * Run type: FULL
- *
  */
 
 static void spin_all(int fd, int gt, int class)
-- 
2.40.1
