Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B586E848
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2020 00:49:22 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 17 Mar 2020 20:49:13 -0400
Message-Id: <20200318004914.236815-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_pipe_crc_basic: Use
 igt_display_require_output_on_pipe()
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
Cc: nouveau@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 tests/kms_pipe_crc_basic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d169b7bd..f121e27e 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -65,15 +65,14 @@ static void test_bad_source(data_t *data)
 static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
+	igt_output_t *output;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t *crcs = NULL;
 	int c, j;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
-	igt_require_f(output, "No connector found for pipe %s\n",
-		      kmstest_pipe_name(pipe));
+	igt_display_require_output_on_pipe(display, pipe);
+	output = igt_get_single_output_for_pipe(display, pipe);
 
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
