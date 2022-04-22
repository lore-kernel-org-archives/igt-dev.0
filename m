Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE3D10E2A9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jan 2024 12:33:44 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/2] tests/kms_lease: Cache xe_device info for lease fd
Date: Fri, 22 Apr 2022 07:34:58 +0530
Message-Id: <20220422020458.2877-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220422020458.2877-1-mohammed.thasleem@intel.com>
References: <20220422020458.2877-1-mohammed.thasleem@intel.com>
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

In case of xe device for lessor fd, the xe_device struct gets
created and cached during drm_open. But for the lessee fd,
the xe_device info struct is not created and cached.

This causes problem in prepare_crtc() for lessee with xe, which
needs the xe_device info struct. So, create and cache the xe_device
struct info for lease fd, when we make lease and remove it from
cache while terminating the lease.

v2: -Update description and move logic to make_lease call. (Ankit)
    -Add xe_device_put, while terminating the lease. (Ankit)
v3: -Move xe_device check to failed tests.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 8ac58af38..20f28600c 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -48,6 +48,8 @@
 
 #include <drm.h>
 #include "igt_device.h"
+#include "xe_drm.h"
+#include "xe/xe_query.h"
 
 /**
  * SUBTEST: atomic-implicit-crtc
@@ -273,6 +275,10 @@ static int make_lease(data_t *data)
 
 static void terminate_lease(int lease_fd)
 {
+	/* Remove xe_device from cache. */
+	if (is_xe_device(lease_fd))
+		xe_device_put(lease_fd);
+
 	close(lease_fd);
 }
 
@@ -305,6 +311,10 @@ static void simple_lease(data_t *data)
 	/* Create a valid lease */
 	igt_assert_eq(make_lease(data), 0);
 
+	/* Cache xe_device struct */
+	if (is_xe_device(data->lease.fd))
+		xe_device_get(data->lease.fd);
+
 	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* Set a mode on the leased output */
@@ -772,6 +782,10 @@ static void lease_revoke(data_t *data)
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
