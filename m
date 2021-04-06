Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488166E062
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 03:08:05 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 08:48:07 +0530
Message-Id: <20210406031807.19732-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_prop_blob : Added test description
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
 tests/kms_prop_blob.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 0a2004c3..819936d6 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -262,6 +262,8 @@ static void prop_tests(int fd)
 	get_props.count_props = 1;
 	get_props.obj_id = blob_id;
 
+	igt_describe("Tests error handling when invalid properties are fetched with "
+		     "object of any type.");
 	igt_subtest("invalid-get-prop-any") {
 		get_props.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
 
@@ -269,6 +271,8 @@ static void prop_tests(int fd)
 				    &get_props) == -1 && errno == EINVAL);
 	}
 
+	igt_describe("Tests error handling when invalid properties are fetched with blob "
+		     "object type.");
 	igt_subtest("invalid-get-prop") {
 		get_props.obj_type = DRM_MODE_OBJECT_BLOB;
 
@@ -280,6 +284,8 @@ static void prop_tests(int fd)
 	set_prop.prop_id = 1;
 	set_prop.obj_id = blob_id;
 
+	igt_describe("Tests error handling when invalid properties are set with object "
+		     "of any type.");
 	igt_subtest("invalid-set-prop-any") {
 		set_prop.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
 
@@ -287,6 +293,7 @@ static void prop_tests(int fd)
 				    &set_prop) == -1 && errno == EINVAL);
 	}
 
+	igt_describe("Tests error handling when invalid properties are set with blob object type.");
 	igt_subtest("invalid-set-prop") {
 		set_prop.obj_type = DRM_MODE_OBJECT_BLOB;
 
@@ -308,18 +315,23 @@ igt_main
 		igt_require_propblob(fd);
 	}
 
+	igt_describe("Test to ensure property support exists.");
 	igt_subtest("basic")
 		test_basic(fd);
 
+	igt_describe("Tests error handling when invalid property IDs are passed.");
 	igt_subtest("blob-prop-core")
 		test_core(fd);
 
+	igt_describe("Tests error handling when incorrect bolb size is passed.");
 	igt_subtest("blob-prop-validate")
 		test_validate(fd);
 
+	igt_describe("Tests validates the lifetime of the properties created.");
 	igt_subtest("blob-prop-lifetime")
 		test_lifetime(fd);
 
+	igt_describe("Test validates destroying multiple properties explicitly works as needed.");
 	igt_subtest("blob-multiple")
 		test_multiple(fd);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
