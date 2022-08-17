Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7342210E9F2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 05:36:20 +0000 (UTC)
Message-ID: <467c27d9-2340-83ad-c0bb-e66ef81cb545@intel.com>
Date: Wed, 17 Aug 2022 11:06:07 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_cursor: Convert tests to
 dynamic
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

On 8/10/2022 5:50 PM, Bhanuprakash Modem wrote:
> Convert the existing subtests to dynamic subtests at pipe/output
> level. And create an array of structures to populate subtests to
> avoid code duplication.
>
> This patch will also do some clenup to have a single function for
> all subtests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_plane_cursor.c | 159 ++++++++++++++-------------------------
>   1 file changed, 56 insertions(+), 103 deletions(-)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 73085cc8..247d6715 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -30,6 +30,12 @@
>    * - DRM index indicates z-ordering, higher index = higher z-order
>    */
>   
> +enum {
> +	TEST_PRIMARY = 0,
> +	TEST_OVERLAY = 1 << 0,
> +	TEST_VIEWPORT = 1 << 1,
> +};
> +
>   typedef struct {
>   	int x;
>   	int y;
> @@ -58,18 +64,16 @@ typedef struct data {
>   } data_t;
>   
>   /* Common test setup. */
> -static void test_init(data_t *data, enum pipe pipe_id)
> +static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
>   {
>   	igt_display_t *display = &data->display;
>   
>   	data->pipe_id = pipe_id;
>   	data->pipe = &data->display.pipes[data->pipe_id];
> +	data->output = output;
>   
>   	igt_display_reset(display);
>   
> -	data->output = igt_get_single_output_for_pipe(&data->display, pipe_id);
> -	igt_require(data->output);
> -
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> @@ -202,92 +206,25 @@ static void test_cursor_spots(data_t *data, igt_fb_t *pfb, igt_fb_t *ofb,
>   	}
>   }
>   
> -/*
> - * Tests atomic cursor positioning on a primary and overlay plane.
> - * Assumes the cursor can be placed on top of the overlay.
> - */
> -static void test_cursor_overlay(data_t *data, int size, enum pipe pipe_id)
> -{
> -	igt_fb_t pfb, ofb, cfb;
> -	int sw, sh;
> -
> -	test_init(data, pipe_id);
> -	igt_require(data->overlay);
> -
> -	sw = data->mode->hdisplay;
> -	sh = data->mode->vdisplay;
> -
> -	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888, 0,
> -			    1.0, 1.0, 1.0, &pfb);
> -
> -	igt_create_color_fb(data->drm_fd, data->or.w, data->or.h,
> -			    DRM_FORMAT_XRGB8888, 0, 0.5, 0.5, 0.5, &ofb);
> -
> -	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888, 0,
> -			    1.0, 0.0, 1.0, &cfb);
> -
> -	igt_plane_set_fb(data->primary, &pfb);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> -	test_cursor_spots(data, &pfb, &ofb, &cfb, &data->or, size);
> -
> -	test_fini(data);
> -
> -	igt_remove_fb(data->drm_fd, &cfb);
> -	igt_remove_fb(data->drm_fd, &ofb);
> -	igt_remove_fb(data->drm_fd, &pfb);
> -}
> -
> -/* Tests atomic cursor positioning on a primary plane. */
> -static void test_cursor_primary(data_t *data, int size, enum pipe pipe_id)
> -{
> -	igt_fb_t pfb, cfb;
> -	int sw, sh;
> -
> -	test_init(data, pipe_id);
> -
> -	sw = data->mode->hdisplay;
> -	sh = data->mode->vdisplay;
> -
> -	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888, 0,
> -			    1.0, 1.0, 1.0, &pfb);
> -
> -	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888, 0,
> -			    1.0, 0.0, 1.0, &cfb);
> -
> -	igt_plane_set_fb(data->primary, &pfb);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> -	test_cursor_spots(data, &pfb, NULL, &cfb, &data->or, size);
> -
> -	test_fini(data);
> -
> -	igt_remove_fb(data->drm_fd, &cfb);
> -	igt_remove_fb(data->drm_fd, &pfb);
> -}
> -
> -/*
> - * Tests atomic cursor positioning on a primary and overlay plane.
> - * The overlay's buffer is larger than the viewport actually used
> - * for display.
> - */
> -static void test_cursor_viewport(data_t *data, int size, enum pipe pipe_id)
> +static void test_cursor(data_t *data, int size, unsigned int flags)
>   {
>   	igt_fb_t pfb, ofb, cfb;
>   	int sw, sh;
>   	int pad = 128;
>   
> -	test_init(data, pipe_id);
> -	igt_require(data->overlay);
> -
>   	sw = data->mode->hdisplay;
>   	sh = data->mode->vdisplay;
>   
>   	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888, 0,
>   			    1.0, 1.0, 1.0, &pfb);
>   
> -	igt_create_color_fb(data->drm_fd, data->or.w + pad, data->or.h + pad,
> -			    DRM_FORMAT_XRGB8888, 0, 0.5, 0.5, 0.5, &ofb);
> +	if (flags & TEST_OVERLAY) {
> +		int width = (flags & TEST_VIEWPORT) ? data->or.w + pad : data->or.w;
> +		int height = (flags & TEST_VIEWPORT) ? data->or.h + pad : data->or.h;
> +
> +		igt_create_color_fb(data->drm_fd, width, height,
> +				    DRM_FORMAT_XRGB8888, 0, 0.5, 0.5, 0.5, &ofb);
> +	}
>   
>   	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888, 0,
>   			    1.0, 0.0, 1.0, &cfb);
> @@ -295,12 +232,11 @@ static void test_cursor_viewport(data_t *data, int size, enum pipe pipe_id)
>   	igt_plane_set_fb(data->primary, &pfb);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	test_cursor_spots(data, &pfb, &ofb, &cfb, &data->or, size);
> -
> -	test_fini(data);
> +	test_cursor_spots(data, &pfb, (flags & TEST_OVERLAY)? &ofb : NULL, &cfb, &data->or, size);
>   
>   	igt_remove_fb(data->drm_fd, &cfb);
> -	igt_remove_fb(data->drm_fd, &ofb);
> +	if (flags & TEST_OVERLAY)
> +		igt_remove_fb(data->drm_fd, &ofb);

Hi,

Could you please move the fb cleanup part also to test_fini as we've 
multiple checks before this where test could fail and if test fails then 
we will miss the fb cleanup.

>   	igt_remove_fb(data->drm_fd, &pfb);
>   }
>   
> @@ -309,7 +245,21 @@ igt_main
>   	static const int cursor_sizes[] = { 64, 128, 256 };
>   	data_t data = {};
>   	enum pipe pipe;
> -	int i;
> +	igt_output_t *output;
> +	int i, j;
> +	struct {
> +		const char *name;
> +		unsigned int flags;
> +		const char *desc;
> +	} tests[] = {
> +		{ "primary", TEST_PRIMARY,
> +		  "Tests atomic cursor positioning on primary plane" },
> +		{ "overlay", TEST_PRIMARY | TEST_OVERLAY,
> +		  "Tests atomic cursor positioning on primary plane and overlay plane" },
> +		{ "viewport", TEST_PRIMARY | TEST_OVERLAY | TEST_VIEWPORT,
> +		  "Tests atomic cursor positioning on primary plane and overlay plane "
> +		  "with buffer larger than viewport used for display" },
> +	};
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -321,26 +271,29 @@ igt_main
>   		igt_display_require_output(&data.display);
>   	}
>   
> -	for_each_pipe_static(pipe)
> -		for (i = 0; i < ARRAY_SIZE(cursor_sizes); ++i) {
> -			int size = cursor_sizes[i];
> -
> -			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane");
> -			igt_subtest_f("pipe-%s-overlay-size-%d",
> -				      kmstest_pipe_name(pipe), size)
> -				test_cursor_overlay(&data, size, pipe);
> -
> -			igt_describe("Tests atomic cursor positioning on primary plane");
> -			igt_subtest_f("pipe-%s-primary-size-%d",
> -				      kmstest_pipe_name(pipe), size)
> -				test_cursor_primary(&data, size, pipe);
> -
> -			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane"
> -				"with buffer larger than viewport used for display");
> -			igt_subtest_f("pipe-%s-viewport-size-%d",
> -				      kmstest_pipe_name(pipe), size)
> -				test_cursor_viewport(&data, size, pipe);
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe_f("%s", tests[i].desc);
> +		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> +			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				test_init(&data, pipe, output);
> +
> +				if ((tests[i].flags & TEST_OVERLAY) && !data.overlay)
> +					goto cleanup;

Is it possible to populate data.overlay outside test_init? So that we 
can completely avoid initializing other things in test_init and also 
inturn avoid calling test_fini?

Thanks,
Karthik.B.S
> +
> +				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
> +					int size = cursor_sizes[j];
> +
> +					igt_dynamic_f("pipe-%s-%s-size-%d",
> +						      kmstest_pipe_name(pipe),
> +						      igt_output_name(output),
> +						      size)
> +						test_cursor(&data, size, tests[i].flags);
> +				}
> +cleanup:
> +				test_fini(&data);
> +			}
>   		}
> +	}
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);

