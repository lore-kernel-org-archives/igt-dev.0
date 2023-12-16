Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 15 Dec 2023 16:40:21 -0800
Subject: [PATCH i-g-t 1/4] tests/kms_atomic: Free pipe_crc object
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231215-solid-fill-v1-1-12932f9f452d@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
In-Reply-To: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20231216004021.fWf4eV-6sWrFpwcQCA2Sdbx_WeTYKUbRYjDvqaXK_n4@z>

Free dangling pipe_crc object in plane_immutable_zpos()

Fixes: 149c3d0b321c ("tests/kms_atomic: Add test to validate immutable zpos")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 96cd58571666..2b6e9a8f0383 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -560,6 +560,8 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 		igt_plane_set_fb(plane_upper, NULL);
 	}
 
+	igt_pipe_crc_free(pipe_crc);
+
 	igt_remove_fb(data->drm_fd, &fb_ref);
 	igt_remove_fb(data->drm_fd, &fb_lower);
 	igt_remove_fb(data->drm_fd, &fb_upper);

-- 
2.43.0
