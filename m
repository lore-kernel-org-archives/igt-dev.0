Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90173888D9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2020 19:35:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB6781F020
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2020 19:35:40 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 18 Aug 2020 15:35:27 -0400
Message-Id: <20200818193528.986926-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_pipe_crc_basic: Use
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

v2: Rebase

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 tests/kms_pipe_crc_basic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index bb66bc6c..53d76df1 100644
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
 
-	igt_require_pipe(display, pipe);
-	igt_require_f(output, "No connector found for pipe %s\n",
-		      kmstest_pipe_name(pipe));
+	igt_display_require_output_on_pipe(display, pipe);
+	output = igt_get_single_output_for_pipe(display, pipe);
 
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
