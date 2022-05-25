Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E512610E4AB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 19:18:12 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id r1so2370426qvz.8
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 12:18:12 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 May 2022 15:18:01 -0400
Message-Id: <20220525191801.2746592-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] kms_prop_blob: Add new subtest for write-only
 blobs
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

[Why]
Some blobs support secret data injected into the kernel that should be
retrieved back to user space (like HDCP key provisioned from a server
and injected to the kernel)

[How]
Create a blob using the write only flag and validate that the data it
holds can't be read again by the user space.
Compare this behavior against a blob created without the flag.

TEST=blob-write-only
TESTED-ON=Trogdor

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 include/drm-uapi/drm_mode.h |  6 ++++++
 tests/kms_prop_blob.c       | 39 +++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index e4a2570a..38d6c1f0 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -1075,6 +1075,9 @@ struct drm_format_modifier {
 	__u64 modifier;
 };
 
+#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
+       (1 << 0) /* data of the blob can't be read by user space */
+
 /**
  * struct drm_mode_create_blob - Create New blob property
  *
@@ -1088,6 +1091,9 @@ struct drm_mode_create_blob {
 	__u32 length;
 	/** @blob_id: Return: new property ID. */
 	__u32 blob_id;
+	/** Flags for special handling. */
+       __u32 flags;
+       __u32 pad;
 };
 
 /**
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 96aa6d8d..c130a432 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -75,6 +75,7 @@ validate_prop(int fd, uint32_t prop_id)
 {
 	struct drm_mode_get_blob get;
 	struct drm_mode_modeinfo ret_mode;
+	ret_mode.clock = 0;
 
 	get.blob_id = prop_id;
 	get.length = 0;
@@ -94,12 +95,13 @@ validate_prop(int fd, uint32_t prop_id)
 }
 
 static uint32_t
-create_prop(int fd)
+create_prop_with_flags(int fd, uint32_t flags)
 {
 	struct drm_mode_create_blob create;
 
 	create.length = sizeof(test_mode_valid);
-	create.data = (uintptr_t) &test_mode_valid;
+	create.data = (uintptr_t)&test_mode_valid;
+	create.flags = flags;
 
 	do_ioctl(fd, DRM_IOCTL_MODE_CREATEPROPBLOB, &create);
 	igt_assert_neq_u32(create.blob_id, 0);
@@ -107,6 +109,12 @@ create_prop(int fd)
 	return create.blob_id;
 }
 
+static uint32_t
+create_prop(int fd)
+{
+	return create_prop_with_flags(fd, 0);
+}
+
 static int
 destroy_prop(int fd, uint32_t prop_id)
 {
@@ -223,6 +231,29 @@ test_multiple(int fd)
 		igt_assert_eq(validate_prop(fd, prop_ids[i]), ENOENT);
 }
 
+/* Create 2 blobs, a write-only and a read-write blob.
+   The only difference is the flag.
+   Check that we can't read the value of the blob with the write-only flag.
+*/
+static void
+test_write_only(int fd) {
+	uint32_t rw_blob_id, wo_blob_id;
+	int wo_ret = 0;
+
+	rw_blob_id = create_prop_with_flags(fd, 0);
+	wo_blob_id = create_prop_with_flags(fd, DRM_MODE_CREATE_BLOB_WRITE_ONLY);
+
+	igt_assert_eq(validate_prop(fd, rw_blob_id), 0);
+
+	wo_ret = validate_prop(fd, wo_blob_id);
+	/* The correct length should be copied to the length field. */
+	igt_assert_neq(wo_ret, ENOMEM);
+	igt_assert_eq(wo_ret, EINVAL);
+
+	igt_assert_eq(destroy_prop(fd, rw_blob_id), 0);
+	igt_assert_eq(destroy_prop(fd, wo_blob_id), 0);
+}
+
 static void
 test_core(int fd)
 {
@@ -335,6 +366,10 @@ igt_main
 	igt_subtest("blob-multiple")
 		test_multiple(fd);
 
+	igt_describe("Test validates Write-only blobs can't be read back by user space.");
+	igt_subtest("blob-write-only")
+		test_write_only(fd);
+
 	prop_tests(fd);
 
 	igt_fixture
-- 
2.36.1.124.g0e6072fb45-goog
