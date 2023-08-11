Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BDB10E6E9
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:22 +0530
Message-Id: <20230811184655.157060-49-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 48/81] tests/kms_flip_event_leak: Document each
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

V2: - Fix test description

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip_event_leak.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 423ce40df..0de2800d2 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -31,6 +31,23 @@
 #include "igt_device.h"
 #include "xe/xe_query.h"
 
+/**
+ * TEST: kms flip event leak
+ * Category: Display
+ * Description: Test to validate flip event leak
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
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
-- 
2.40.0
