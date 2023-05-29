Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5030710E205
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:35:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 10:58:03 +0530
Message-Id: <20230529052835.860047-51-bhanuprakash.modem@intel.com>
In-Reply-To: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 50/82] tests/kms_flip_event_leak: Document each
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
 tests/kms_flip_event_leak.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index b79cd5030..398c58259 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -30,6 +30,25 @@
 
 #include "igt_device.h"
 #include "xe/xe_query.h"
+/**
+ * TEST: kms flip event leak
+ * Category: Display
+ * Description: This test tries to provoke the kernel into leaking a pending
+ *              page flip event when the fd is closed before the flip has
+ *              completed. The test itself won't fail even if the kernel leaks
+ *              the event, but the resulting dmesg WARN will indicate a failure.
+ *
+ * SUBTEST: basic
+ * Description: This test tries to provoke the kernel into leaking a pending
+ *              page flip event when the fd is closed before the flip has
+ *              completed. The test itself won't fail even if the kernel leaks
+ *              the event, but the resulting dmesg WARN will indicate a failure.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 typedef struct {
 	int drm_fd;
-- 
2.40.0
