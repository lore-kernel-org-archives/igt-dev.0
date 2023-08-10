Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB6610E4A8
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 03:59:56 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 03:59:46 +0000
Message-ID: <PH0PR11MB48067DF0F226619DCBC8B0C8E413A@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-56-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-56-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 55/81] tests/kms_lease: Document each
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

LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Bhanupra=
kash Modem
Sent: Thursday, June 29, 2023 8:19 PM
To: igt-dev@lists.freedesktop.org
Subject: [igt-dev] [V5 i-g-t 55/81] tests/kms_lease: Document each subtest =
for testplan

Add documentation for all kms tests which is used by IGT testplan documenta=
tion.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_lease.c | 180 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c index c8ae98206..2f41ab5=
2f 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -26,6 +26,11 @@
  * This is a test of DRM leases
  */
=20
+/**
+ * TEST: kms lease
+ * Category: Display
+ * Description: Test of CreateLease.
+ */
=20
 #include "igt.h"
 #include <stdlib.h>
@@ -45,6 +50,181 @@
 #include <drm.h>
 #include "igt_device.h"
=20
+/**
+ * SUBTEST: atomic_implicit_crtc
+ * Description: Negative test by using a different crtc with atomic=20
+ioctl
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: cursor_implicit_plane
+ * Description: Negative test by using a non-primary plane with=20
+setcursor ioctl
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
+ * Description: Tests error handling while creating invalid corner-cases f=
or
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
+ * Description: Tests that the 2nd master can only create leases while bei=
ng
+ *              active master, and that leases on the first master don't p=
revent
+ *              lease creation for the 2nd master.
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: page_flip_implicit_plane
+ * Description: Negative test by using a non-primary plane with the=20
+page flip ioctl
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: possible-crtcs-filtering
+ * Description: Tests that  possible_crtcs logically match between master =
and
+ *              lease, and that the values are correctly renumbered on the=
 lease
+ *              side.
+ * Driver requirement: any
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: setcrtc_implicit_plane
+ * Description: Negative test by using a non-primary plane with the=20
+setcrtc ioctl
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
=20
 typedef struct {
--
2.40.0
