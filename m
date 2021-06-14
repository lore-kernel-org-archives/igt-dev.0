Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BB86E03B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:41:53 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id j184so39000547qkd.6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:41:53 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 14 Jun 2021 12:41:34 -0400
Message-Id: <20210614164135.1519746-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that can't
 import buffers.
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
Cc: petri.latvala@intel.com, Anson.Jacob@amd.com, seanpaul@chromium.org, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

Some devices such as amdgpu do not support imported buffers.
Filter out those devices.
Tested on Zork with chromeos-kernel-5_4.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_prime.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 8cb2ca2a..480c7eb4 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -249,6 +249,16 @@ static void test_crc(int exporter_fd, int importer_fd)
 	igt_display_fini(&display);
 }
 
+/* The test attempts to import the buffer object from one device to another.
+ * Filter out devices that aren't capable of doing this.
+ */
+bool does_device_support_dmabuf_import(int fd) {
+	/* AMDGPU uses VRAM. Any use of the fb will migrate it to VRAM, which is not sensible for
+	 * an imported dma-buf.
+	 */
+	return !is_amdgpu_device(fd);
+}
+
 igt_main
 {
 	igt_fixture
@@ -262,10 +272,10 @@ igt_main
 
 		/* ANY = anything that is not VGEM */
 		first_fd = __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
-		igt_require(first_fd >= 0);
+		igt_require(first_fd >= 0 && does_device_support_dmabuf_import(first_fd));
 
 		second_fd = __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
-		igt_require(second_fd >= 0);
+		igt_require(second_fd >= 0 && does_device_support_dmabuf_import(second_fd));
 
 		if (has_prime_export(first_fd) &&
 		    has_prime_import(second_fd))
-- 
2.32.0.272.g935e593368-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
