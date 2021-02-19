Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598476E8AE
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 09:41:24 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id a24so3049243plm.11
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 01:41:24 -0800 (PST)
Date: Fri, 19 Feb 2021 15:11:20 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Message-ID: <20210219094120.xfhmp3njssigqkh2@adolin>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vblank.c: Skip vblank tests for
 virtual_hw mode
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
Cc: daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

Currently, while running the VKMS module in virtual harware
(vblank-less) mode, majority of tests fail due to vblank tests
failing, making it difficult to test other parts like crc and
writeback for the VKMS module.

Skip all vblank tests in kms_vblank.c when vblank does not exist
as a feature.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 tests/kms_vblank.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e561e41d..636f13b7 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -515,12 +515,19 @@ igt_main
 {
 	int fd;
 	data_t data;
+	drmVBlank dummy_vbl;
+	int ret;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, fd);
 		igt_display_require_output(&data.display);
+
+		memset(&dummy_vbl, 0, sizeof(drmVBlank));
+		dummy_vbl.request.type = DRM_VBLANK_RELATIVE;
+		ret = drmWaitVBlank(fd, &dummy_vbl);
+		igt_skip_on(ret != 0 && errno == EOPNOTSUPP);
 	}
 
 	igt_describe("Negative test for vblank request");
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
