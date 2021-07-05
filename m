Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5749089B66
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 05:09:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon,  5 Jul 2021 18:26:16 +0530
Message-Id: <20210705125617.4631-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
References: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_flip: Restrict the hang tests
 execution to two pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

To save the CI execution time, instead of running on all pipes
restrict the hang tests execution to two pipes (first & last).

If we want to execute on all pipes, we need to pass an extra
argument "-e" indicates extended.

Example: ./build/tests/kms_flip -e --r flip-vs-modeset-vs-hang

v2, v3:
* Fix the typo in args handler (Petri)
v4:
* Refactor to run on first & last pipes.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 8f736652be..631eba9876 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -85,6 +85,8 @@
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
 
+static bool all_pipes = false;
+
 drmModeRes *resources;
 int drm_fd;
 static struct buf_ops *bops;
@@ -1450,6 +1452,11 @@ static int run_test(int duration, int flags)
 	/* Count output configurations to scale test runtime. */
 	for (i = 0; i < resources->count_connectors; i++) {
 		for (n = 0; n < resources->count_crtcs; n++) {
+			/* Limit the execution to 2 CRTCs (first & last) for hang tests */
+			if ((flags & TEST_HANG) && !all_pipes &&
+			    n != 0 && n != (resources->count_crtcs - 1))
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1474,6 +1481,11 @@ static int run_test(int duration, int flags)
 		for (n = 0; n < resources->count_crtcs; n++) {
 			int crtc_idx;
 
+			/* Limit the execution to 2 CRTCs (first & last) for hang tests */
+			if ((flags & TEST_HANG) && !all_pipes &&
+			    n != 0 && n != (resources->count_crtcs - 1))
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1604,7 +1616,23 @@ static void test_nonblocking_read(int in)
 	close(fd);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+		case 'e':
+			all_pipes = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
