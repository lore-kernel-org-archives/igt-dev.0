Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2381310E276
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 11:21:46 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 16:52:16 +0530
Message-Id: <20230918112216.260019-3-swati2.sharma@intel.com>
In-Reply-To: <20230918112216.260019-1-swati2.sharma@intel.com>
References: <20230918112216.260019-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_lease: rename subtests
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

Use '-' instead of '_' while naming subtests.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_lease.c | 62 +++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 1a91b3eb4..343cdb812 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -46,21 +46,21 @@
 #include "igt_device.h"
 
 /**
- * SUBTEST: atomic_implicit_crtc
+ * SUBTEST: atomic-implicit-crtc
  * Description: Negative test by using a different crtc with atomic ioctl
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: cursor_implicit_plane
+ * SUBTEST: cursor-implicit-plane
  * Description: Negative test by using a non-primary plane with setcursor ioctl
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: empty_lease
+ * SUBTEST: empty-lease
  * Description: Check that creating an empty lease works
  * Driver requirement: i915, xe
  * Functionality: lease
@@ -89,63 +89,63 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_again
+ * SUBTEST: lease-again
  * Description: Tests leasing objects more than once
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_get
+ * SUBTEST: lease-get
  * Description: Tests getting the required contents of a lease
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_invalid_connector
+ * SUBTEST: lease-invalid-connector
  * Description: Tests leasing an invalid connector
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_invalid_crtc
+ * SUBTEST: lease-invalid-crtc
  * Description: Tests leasing an invalid crtc
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_invalid_plane
+ * SUBTEST: lease-invalid-plane
  * Description: Tests leasing an invalid plane
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_revoke
+ * SUBTEST: lease-revoke
  * Description: Tests revocation of lease
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_unleased_connector
+ * SUBTEST: lease-unleased-connector
  * Description: Negative test by trying to use an unleased connector
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lease_unleased_crtc
+ * SUBTEST: lease-unleased-crtc
  * Description: Negative test by trying to use an unleased crtc
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: lessee_list
+ * SUBTEST: lessee-list
  * Description: Check if listed lease is same as created one
  * Driver requirement: i915, xe
  * Functionality: lease
@@ -168,7 +168,7 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: page_flip_implicit_plane
+ * SUBTEST: page-flip-implicit-plane
  * Description: Negative test by using a non-primary plane with the page flip ioctl
  * Driver requirement: i915, xe
  * Functionality: lease
@@ -184,14 +184,14 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: setcrtc_implicit_plane
+ * SUBTEST: setcrtc-implicit-plane
  * Description: Negative test by using a non-primary plane with the setcrtc ioctl
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: simple_lease
+ * SUBTEST: simple-lease
  * Description: Check if create lease ioctl call works
  * Driver requirement: i915, xe
  * Functionality: lease
@@ -381,7 +381,7 @@ static void simple_lease(data_t *data)
 	igt_assert_eq(0, prepare_crtc(&lease, data));
 
 	/* Paint something attractive */
-	paint_fb(lease.fd, &lease.primary_fb, "simple_lease",
+	paint_fb(lease.fd, &lease.primary_fb, "simple-lease",
 		 lease.mode->name, igt_output_name(lease.output), kmstest_pipe_name(pipe));
 	igt_debug_wait_for_keypress("lease");
 	cleanup_crtc(&lease,
@@ -1347,25 +1347,25 @@ igt_main
 			void (*func)(data_t *);
 			const char *desc;
 		} funcs[] = {
-			{ "simple_lease", simple_lease, "Check if create lease ioctl call works" },
-			{ "empty_lease", empty_lease, "Check that creating an empty lease works" },
-			{ "lessee_list", lessee_list, "Check if listed lease is same as created one" },
-			{ "lease_get", lease_get, "Tests getting the required contents of a lease" },
-			{ "lease_unleased_connector", lease_unleased_connector, "Negative test by trying to"
+			{ "simple-lease", simple_lease, "Check if create lease ioctl call works" },
+			{ "empty-lease", empty_lease, "Check that creating an empty lease works" },
+			{ "lessee-list", lessee_list, "Check if listed lease is same as created one" },
+			{ "lease-get", lease_get, "Tests getting the required contents of a lease" },
+			{ "lease-unleased-connector", lease_unleased_connector, "Negative test by trying to"
 				" use an unleased connector " },
-			{ "lease_unleased_crtc", lease_unleased_crtc, "Negative test by trying to use an unleased crtc" },
-			{ "lease_revoke", lease_revoke, "Tests revocation of lease" },
-			{ "lease_again", lease_again, "Tests leasing objects more than once" },
-			{ "lease_invalid_connector", lease_invalid_connector, "Tests leasing an invalid connector" },
-			{ "lease_invalid_crtc", lease_invalid_crtc, "Tests leasing an invalid crtc" },
-			{ "lease_invalid_plane", lease_invalid_plane, "Tests leasing an invalid plane" },
-			{ "page_flip_implicit_plane", page_flip_implicit_plane, "Negative test by using a "
+			{ "lease-unleased-crtc", lease_unleased_crtc, "Negative test by trying to use an unleased crtc" },
+			{ "lease-revoke", lease_revoke, "Tests revocation of lease" },
+			{ "lease-again", lease_again, "Tests leasing objects more than once" },
+			{ "lease-invalid-connector", lease_invalid_connector, "Tests leasing an invalid connector" },
+			{ "lease-invalid-crtc", lease_invalid_crtc, "Tests leasing an invalid crtc" },
+			{ "lease-invalid-plane", lease_invalid_plane, "Tests leasing an invalid plane" },
+			{ "page-flip-implicit-plane", page_flip_implicit_plane, "Negative test by using a "
 				"non-primary plane with the page flip ioctl" },
-			{ "setcrtc_implicit_plane", setcrtc_implicit_plane, "Negative test by using a "
+			{ "setcrtc-implicit-plane", setcrtc_implicit_plane, "Negative test by using a "
 				"non-primary plane with the setcrtc ioctl" },
-			{ "cursor_implicit_plane", cursor_implicit_plane, "Negative test by using a non-primary"
+			{ "cursor-implicit-plane", cursor_implicit_plane, "Negative test by using a non-primary"
 				" plane with setcursor ioctl" },
-			{ "atomic_implicit_crtc", atomic_implicit_crtc, "Negative test by using a different"
+			{ "atomic-implicit-crtc", atomic_implicit_crtc, "Negative test by using a different"
 				" crtc with atomic ioctl" },
 			{ }
 		}, *f;
-- 
2.25.1
