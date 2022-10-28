Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FF310E8E2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 21:31:00 +0000 (UTC)
Message-ID: <770577e1-66d5-b62b-5ea3-c980dedc21fb@igalia.com>
Date: Fri, 28 Oct 2022 18:30:41 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20220824145832.426397-1-contact@emersion.fr>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220824145832.426397-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [RFC PATCH] tests/kms_async_flips: add atomic test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Simon,

On 8/24/22 11:58, Simon Ser wrote:
> This adds a simple test for DRM_MODE_PAGE_FLIP_ASYNC with the
> atomic uAPI.
> 

I extended your test as required by Ville. Feel free to concatenated it 
and to add my SoB tag.

--- >8 ---

 From d990d57468458a7ffccf90bee664ffa0dc69140e Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Date: Fri, 28 Oct 2022 18:18:02 -0300
Subject: [PATCH] tests/kms_async_flips: Add test for invalid changes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DRM atomic API should reject any changes during an async flip, so test
if the kernel properly rejects it.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
  tests/kms_async_flips.c | 40 ++++++++++++++++++++++++++++++++++++++++
  1 file changed, 40 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 7173ca65..cfca2674 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -287,6 +287,38 @@ static void test_async_flip_atomic(data_t *data)
  		     "FPS should be significantly higher than the refresh rate\n");
  }

+static void test_invalid_atomic(data_t *data)
+{
+	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+	drmModeConnector *connector = output->config.connector;
+	igt_output_t *output = data->output;
+	int ret;
+
+	test_init(data);
+
+	/* Trying to change plane position  */
+	igt_plane_set_position(data->plane, 15, 15);
+	igt_plane_set_fb(data->plane, &data->bufs[1]);
+	ret = igt_display_try_commit_atomic(&data->display, flags, data);
+	igt_assert(ret == -EINVAL);
+	igt_plane_set_position(data->plane, 0, 0);
+
+	/* Trying to change plane rotation  */
+	igt_plane_set_rotation(data->plane, IGT_ROTATION_180);
+	igt_plane_set_fb(data->plane, &data->bufs[1]);
+	ret = igt_display_try_commit_atomic(&data->display, flags, data);
+	igt_assert(ret == -EINVAL);
+	igt_plane_set_rotation(data->plane, IGT_ROTATION_0);
+
+	/* Trying to change mode */
+	for_each_connector_mode(output) {
+		igt_output_override_mode(output, &connector->modes[j__]);
+		ret = igt_display_try_commit_atomic(&data->display, flags, data);
+		igt_assert(ret == -EINVAL);
+	}
+	igt_output_override_mode(output, NULL);
+}
+
  static void wait_for_vblank(data_t *data, unsigned long *vbl_time, 
unsigned int *seq)
  {
  	drmVBlank wait_vbl;
@@ -680,6 +712,14 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
  		run_test(&data, test_async_flip_atomic);
  	}

+	igt_describe("Negative case to verify if any atomic changes are 
rejected from kernel as expected");
+	igt_subtest_with_dynamic("invalid-atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, 
DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_invalid_atomic);
+	}
+
  	igt_fixture {
  		for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.37.3
