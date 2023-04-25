Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833D710E6B8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 06:55:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:19:42 +0530
Message-Id: <20230425064953.2121947-30-bhanuprakash.modem@intel.com>
In-Reply-To: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
References: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 29/40] tests/kms_flip_event_leak: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip_event_leak.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index bc26597de..b79cd5030 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -29,6 +29,7 @@
 #include <string.h>
 
 #include "igt_device.h"
+#include "xe/xe_query.h"
 
 typedef struct {
 	int drm_fd;
@@ -64,6 +65,8 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_device_drop_master(data->drm_fd);
 
 	igt_device_set_master(fd);
+	if (is_xe_device(fd))
+		xe_device_get(fd);
 
 	igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888,
@@ -74,6 +77,8 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 			      data);
 	igt_assert_eq(ret, 0);
 
+	if (is_xe_device(fd))
+		xe_device_put(fd);
 	ret = close(fd);
 	igt_assert_eq(ret, 0);
 
-- 
2.40.0
