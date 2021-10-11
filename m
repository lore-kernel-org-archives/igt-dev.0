Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0A06E5B0
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 23:43:29 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id n201so7545761vkn.12
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 16:43:29 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
Date: Mon, 11 Oct 2021 20:43:20 -0300
Message-Id: <20211011234320.152735-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_writeback.c: Prevents test failure by
 the XR48/AR48 format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Igor Torrente <igormtorrente@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

The test fails if the driver exposes the XR48/AR48 (XRGB16161616/ARGB16161616)
formats, altough it doesn't test any format beyond XR24(XRGB88888).

This failure happens because the format validation doesn't contain the
number '8' in the list of valid char.

This patch adds it to the list.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 tests/kms_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 03edb7af..21d62faa 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -386,7 +386,7 @@ igt_main
 	igt_describe("Check the writeback format");
 	igt_subtest("writeback-pixel-formats") {
 		drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
-		const char *valid_chars = "0123456 ABCGNRUVXY";
+		const char *valid_chars = "01234568 ABCGNRUVXY";
 		unsigned int i;
 		char *c;
 
-- 
2.30.2
