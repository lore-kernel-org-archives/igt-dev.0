Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05C36E853
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:42:35 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:42:22 -0400
Message-Id: <20210317224222.447100-4-lyude@redhat.com>
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
References: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_color: Stop leaking fbs
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

While I was testing this out with nouveau, I noticed that this test leaks
quite a lot of framebuffers. Didn't cause any issues, but we should fix
this while we're at it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_color.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 02a1a2de..b1b91c74 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -105,6 +105,8 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(degamma_linear);
@@ -189,6 +191,8 @@ static void test_pipe_gamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(gamma_full);
@@ -292,6 +296,8 @@ static void test_pipe_legacy_gamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free(red_lut);
@@ -510,6 +516,8 @@ static bool test_pipe_ctm(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(degamma_linear);
@@ -618,6 +626,9 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		 * equal to the CRC of the CTM matrix transformation output.
 		 */
 		igt_assert_crc_equal(&crc_full, &crc_limited);
+
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(gamma_linear);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
