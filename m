Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693B36EA14
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 07:01:37 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Thu,  8 Apr 2021 12:41:41 +0530
Message-Id: <20210408071141.16244-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_lease : Added test description
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
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_lease.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index e9a47767..6397ef8f 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1312,21 +1312,31 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests error handling while creating invalid corner-cases for "
+		     "create-lease ioctl");
 	igt_subtest("invalid-create-leases")
 		invalid_create_leases(&data);
 
+	igt_describe("Tests that  possible_crtcs logically match between master and "
+		     "lease, and that the values are correctly renumbered on the lease side.");
 	igt_subtest("possible-crtcs-filtering")
 		possible_crtcs_filtering(&data);
 
+	igt_describe("Tests the drop/set_master interactions.");
 	igt_subtest("master-vs-lease")
 		master_vs_lease(&data);
 
+	igt_describe("Tests that the 2nd master can only create leases while being active "
+		     "master, and that leases on the first master don't prevent lease creation "
+		     "for the 2nd master.");
 	igt_subtest("multimaster-lease")
 		multimaster_lease(&data);
 
+	igt_describe("Tests the implicitly added planes.");
 	igt_subtest("implicit-plane-lease")
 		implicit_plane_lease(&data);
 
+	igt_describe("Tests all the uevent cases");
 	igt_subtest("lease-uevent")
 		lease_uevent(&data);
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
