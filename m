Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E1110E1B4
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 10:18:21 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_lease: Cache xe_device info for lease fd
Date: Tue, 12 Dec 2023 15:37:12 +0530
Message-Id: <20231212100712.3301571-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Cache xe_device struct info for lease fd before perpare crtc
with lessee's fd.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 8ac58af38..e57aea2a2 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -48,6 +48,8 @@
 
 #include <drm.h>
 #include "igt_device.h"
+#include "xe_drm.h"
+#include "xe/xe_query.h"
 
 /**
  * SUBTEST: atomic-implicit-crtc
@@ -305,6 +307,10 @@ static void simple_lease(data_t *data)
 	/* Create a valid lease */
 	igt_assert_eq(make_lease(data), 0);
 
+	/* Cache xe_device struct */
+	if (is_xe_device(data->lease.fd))
+		xe_device_get(data->lease.fd);
+
 	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* Set a mode on the leased output */
@@ -772,6 +778,10 @@ static void lease_revoke(data_t *data)
 	/* Create a valid lease */
 	igt_assert_eq(make_lease(data), 0);
 
+	/* Cache xe_device struct */
+	if (is_xe_device(data->lease.fd))
+		xe_device_get(data->lease.fd);
+
 	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* try to revoke an invalid lease */
-- 
2.25.1
