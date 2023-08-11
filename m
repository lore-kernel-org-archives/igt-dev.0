Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137C10E6FA
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:56:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:28 +0530
Message-Id: <20230811184655.157060-55-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 54/81] tests/kms_lease: Document each subtest
 for testplan
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
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 180 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index c8ae98206..2f41ab52f 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -26,6 +26,11 @@
  * This is a test of DRM leases
  */
 
+/**
+ * TEST: kms lease
+ * Category: Display
+ * Description: Test of CreateLease.
+ */
 
 #include "igt.h"
 #include <stdlib.h>
@@ -45,6 +50,181 @@
 #include <drm.h>
 #include "igt_device.h"
 
+/**
+ * SUBTEST: atomic_implicit_crtc
+ * Description: Negative test by using a different crtc with atomic ioctl
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: cursor_implicit_plane
+ * Description: Negative test by using a non-primary plane with setcursor ioctl
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: empty_lease
+ * Description: Check that creating an empty lease works
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: implicit-plane-lease
+ * Description: Tests the implicitly added planes.
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-create-leases
+ * Description: Tests error handling while creating invalid corner-cases for
+ *              create-lease ioctl
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease-uevent
+ * Description: Tests all the uevent cases
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_again
+ * Description: Tests leasing objects more than once
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_get
+ * Description: Tests getting the required contents of a lease
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_invalid_connector
+ * Description: Tests leasing an invalid connector
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_invalid_crtc
+ * Description: Tests leasing an invalid crtc
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_invalid_plane
+ * Description: Tests leasing an invalid plane
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_revoke
+ * Description: Tests revocation of lease
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_unleased_connector
+ * Description: Negative test by trying to use an unleased connector
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lease_unleased_crtc
+ * Description: Negative test by trying to use an unleased crtc
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: lessee_list
+ * Description: Check if listed lease is same as created one
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: master-vs-lease
+ * Description: Tests the drop/set_master interactions.
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: multimaster-lease
+ * Description: Tests that the 2nd master can only create leases while being
+ *              active master, and that leases on the first master don't prevent
+ *              lease creation for the 2nd master.
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: page_flip_implicit_plane
+ * Description: Negative test by using a non-primary plane with the page flip ioctl
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: possible-crtcs-filtering
+ * Description: Tests that  possible_crtcs logically match between master and
+ *              lease, and that the values are correctly renumbered on the lease
+ *              side.
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: setcrtc_implicit_plane
+ * Description: Negative test by using a non-primary plane with the setcrtc ioctl
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: simple_lease
+ * Description: Check if create lease ioctl call works
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Test of CreateLease.");
 
 typedef struct {
-- 
2.40.0
