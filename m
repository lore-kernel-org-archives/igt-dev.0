Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1690E6E59D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 04:39:07 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 10:19:09 +0530
Message-Id: <20210406044909.20915-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection : Added
 subtest description
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

Added subtest description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_content_protection.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 0fdbacdd..5a75b871 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -735,46 +735,58 @@ igt_main
 		create_fbs();
 	}
 
+	igt_describe("Test content protection with legacy style commit.");
 	igt_subtest("legacy") {
 		data.cp_tests = 0;
 		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test content protection with atomic modesetting");
 	igt_subtest("atomic") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = 0;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test content protection with DPMS ON/OFF during atomic modesetting.");
 	igt_subtest("atomic-dpms") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_DPMS;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test for the integrity of link.");
 	igt_subtest("LIC") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_LIC;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test content protection with content type 1 that "
+		     "can be handled only through HDCP2.2.");
 	igt_subtest("type1") {
 		igt_require(data.display.is_atomic);
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
 	}
 
+	igt_describe("Test the teardown and rebuild of the interface between "
+		     "I915 and mei hdcp.");
 	igt_subtest("mei_interface") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_MEI_RELOAD;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
 	}
 
+	igt_describe("Test the content type change when the content protection already "
+		     "enabled.");
 	igt_subtest("content_type_change") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_TYPE_CHANGE;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
 	}
 
+	igt_describe("Test to detect the HDCP status change when we are reading the uevent "
+		     "sent with the corresponding connector id and property id.");
 	igt_subtest("uevent") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_UEVENT;
@@ -792,6 +804,8 @@ igt_main
 	 *  either of these options, we test SRM writing from userspace and
 	 *  validation of the same at kernel. Something is better than nothing.
 	 */
+	igt_describe("This test writes the facsimile SRM into the /lib/firmware/ "
+		     "and check the kernel parsing of it by invoking the hdcp authentication.");
 	igt_subtest("srm") {
 		bool ret;
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
