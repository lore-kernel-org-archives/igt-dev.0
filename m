Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7053B6E853
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:42:34 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:42:20 -0400
Message-Id: <20210317224222.447100-2-lyude@redhat.com>
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
References: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_color: Don't opencode
 igt_check_crc_equal()
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
Cc: nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_color.c        | 2 +-
 tests/kms_color_helper.c | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index f2686f57..705c9160 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -506,7 +506,7 @@ static bool test_pipe_ctm(data_t *data,
 		/* Verify that the CRC of the software computed output is
 		 * equal to the CRC of the CTM matrix transformation output.
 		 */
-		ret &= crc_equal(&crc_software, &crc_hardware);
+		ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index ac8e8454..5f223a88 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -245,12 +245,6 @@ get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 	return drmModeGetPropertyBlob(data->drm_fd, prop_value);
 }
 
-bool crc_equal(igt_crc_t *a, igt_crc_t *b)
-{
-	return igt_skip_crc_compare ||
-		memcmp(a->crc, b->crc, sizeof(a->crc[0]) * a->n_words) == 0;
-}
-
 int
 pipe_set_property_blob_id(igt_pipe_t *pipe,
 			  enum igt_atomic_crtc_properties prop,
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
