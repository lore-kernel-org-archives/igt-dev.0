Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2610E2F7
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 20:24:14 +0000 (UTC)
Message-ID: <9212eb43-3204-79f1-c507-01c1824cebe9@amd.com>
Date: Fri, 17 Feb 2023 15:24:10 -0500
Content-Language: en-US
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 igt-dev@lists.freedesktop.org, rodrigo.siqueira@amd.com,
 harry.wentland@amd.com, nicholas.kazlauskas@amd.com
References: <20230213181651.863367-1-Bhawanpreet.Lakha@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20230213181651.863367-1-Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] amdgpu/amd_plane: Add multi MPO XRGB8888
 test
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




On 2/13/23 13:16, Bhawanpreet Lakha wrote:
> [Why]
> Some of our ASICs  support multiple overlay planes, so create
> a test to test them
> 
> [How]
> Create a plane with two holes and fill them up with 2 overlay planes
> 
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Change-Id: If527d67ead59f64906a97c340845ac423d93a0aa
> ---
>   tests/amdgpu/amd_plane.c | 128 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 127 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index b9eec677..d34cd1d9 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -42,6 +42,7 @@ typedef struct data {
>           igt_plane_t *primary[MAX_PIPES];
>           igt_plane_t *cursor[MAX_PIPES];
>   	igt_plane_t *overlay[MAX_PIPES];
> +	igt_plane_t *overlay2[MAX_PIPES];
>           igt_output_t *output[MAX_PIPES];
>           igt_pipe_t *pipe[MAX_PIPES];
>           igt_pipe_crc_t *pipe_crc[MAX_PIPES];
> @@ -144,7 +145,8 @@ static void lut_free(lut_t *lut)
>   enum test {
>   	MPO_SINGLE_PAN,
>   	MPO_MULTI_PAN,
> -	MPO_SCALE
> +	MPO_SCALE,
> +	MPO_MULTI_OVERLAY
>   };
>   
>   static void test_init(data_t *data)
> @@ -159,6 +161,8 @@ static void test_init(data_t *data)
>   			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>   		data->overlay[i] = igt_pipe_get_plane_type_index(
>   			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
> +		data->overlay2[i] = igt_pipe_get_plane_type_index(
> +			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 1);
>   		data->cursor[i] = igt_pipe_get_plane_type(
>   			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
>   		data->pipe_crc[i] =
> @@ -252,6 +256,7 @@ struct fbc {
>   	igt_fb_t ref_primary;
>   	igt_fb_t test_primary;
>   	igt_fb_t test_overlay;
> +	igt_fb_t test_overlay2;
>   	igt_crc_t ref_crc;
>   };
>   
> @@ -264,6 +269,115 @@ static void set_regamma_lut(data_t *data, lut_t const *lut, int n)
>   				       size);
>   }
>   
> +/*
> + * Compares the result of white backgroud with white window with and without MPO
> + *
> + * Reference crc:
> + * Draws a White background of size (pw,ph).
> + *
> + * Test crc:
> + * Draws a White Overlay of size (pw,ph) then creates a cutout of size (w,h) at location (x1, y1) and (x2, y2)
> + * Draws a White Primary plane of size (w, h) at location (x1,y1) (under the overlay)
> + * Draws a White Overlay of size (w, h) at location (x2,y2)
> + *
> + * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
> + * a ref crc per flip)
> + */
> +static void test_plane2(data_t *data, int n, int x1, int y1, int x2, int y2, int w, int h, int pw, int ph, struct fbc *fbc){
> +
> +	igt_crc_t test_crc;
> +	igt_display_t *display = &data->display;
> +
> +	/* Reference: */
> +
> +	igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
> +
> +	igt_plane_set_position(data->primary[n], 0, 0);
> +	igt_plane_set_size(data->primary[n], pw, ph);
> +
> +	igt_display_commit_atomic(display, 0, 0);
> +

Should ref_crc be collected here?

> +	/* Test: */
> +	/* Draw a white overlay with two cutouts at (x1,y1) and (x2,y2) */
> +	draw_color_alpha(&fbc[n].test_overlay2, 0, 0, pw, ph, 1.0, 1.0, 1.0, 1.0);
> +	draw_color_alpha(&fbc[n].test_overlay2, x1, y1, w, h, 0.0, 0.0, 0.0, 0.0);
> +	draw_color_alpha(&fbc[n].test_overlay2, x2, y2, w, h, 0.0, 0.0, 0.0, 0.0);
> +
> +	/* Draw a overlay to cover up one hole */
> +	draw_color_alpha(&fbc[n].test_overlay, 0, 0, pw, ph, 0.0, 0.0, 0.0, 0.0);
> +	draw_color_alpha(&fbc[n].test_overlay, x2, y2, w, h, 1.0, 1.0, 1.0, 1.0);
> +
> +	/* Draw a primary to cover up the other hole */
> +	draw_color_alpha(&fbc[n].test_primary, 0, 0, w, h, 0.0, 0.0, 0.0, 0.0);
> +	draw_color_alpha(&fbc[n].test_primary, 0, 0, w, h, 1.0, 1.0, 1.0, 1.0);
> +
> +	igt_plane_set_fb(data->primary[n], &fbc[n].test_primary);
> +	igt_plane_set_fb(data->overlay[n], &fbc[n].test_overlay);
> +	igt_plane_set_fb(data->overlay2[n], &fbc[n].test_overlay2);
> +
> +	/* Move the primary to cover one of the holes*/
> +	igt_plane_set_position(data->primary[n], x1, y1);
> +	igt_plane_set_size(data->primary[n], w, h);
> +
> +
> +	igt_display_commit_atomic(display, 0, 0);
> +	igt_pipe_crc_collect_crc(data->pipe_crc[n], &test_crc);
> +	igt_plane_set_fb(data->overlay[n], NULL);
> +	igt_plane_set_fb(data->overlay2[n], NULL);
> +
> +	igt_assert_crc_equal(&fbc[n].ref_crc, &test_crc);
> +
> +	/* Set window to white, this is to avoid flashing between black/white after each flip */
> +	draw_color_alpha(&fbc[n].ref_primary, 0, 0, w, h, 1.0, 1.0, 1.0, 1.00);
> +	igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
> +	igt_plane_set_position(data->primary[n], 0, 0);
> +	igt_plane_set_size(data->primary[n], pw, ph);
> +	igt_display_commit_atomic(display, 0, 0);
> +
> +
> +}
> +
> +/*
> + * MPO_MULTI_OVERLAY: This test takes the plane sizes and assigns random position within the screen
> + *
> + * The test creates a white screen with 2 cutouts which are to be filled with 2 overlay planes.
> + * Testing multiple overlay planes
> + */
> +static void test_multi_overlay(data_t *data, int display_count, int w, int h, struct fbc *fb)
> +{
> +
> +	int x1,x2,y1,y2;
> +
> +	for (int n = 0; n < display_count; n++) {
> +
> +		int pw = data->w[n];
> +		int ph = data->h[n];
> +
> +		for (int i = 0; i < 1; i++){
> +
> +			if (pw <= w && ph <= h)
> +				break;
> +
> +			srand(time(NULL));
> +
> +			/* Generate random x,y positions for two cutouts*/
> +			x1 = (rand() % (pw-w));
> +			y1 = (rand() % (ph-h));
> +
> +			x2 = (rand() % (pw-w));
> +			y2 = (rand() % (ph-h));
> +

I wonder if using random positions can cause hard-to-reproduce failures.
Is there something in particular being tested via rand, or can we use a
fixed set of positions similar to test_cursor_spots() in
kms_plane_cursor?

Thanks,
Leo

> +
> +			test_plane2(data, n, x1, y1, x2, y2, w,h, pw, ph, fb);
> +
> +		}
> +	}
> +
> +	return;
> +
> +
> +}
> +
>   /*
>    * Compares the result of white backgroud with white window with and without MPO
>    *
> @@ -467,6 +581,10 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>   
>   	test_init(data);
>   
> +	/* Skip test if we don't have 2 overlay planes */
> +	if (test == MPO_MULTI_OVERLAY)
> +		igt_skip_on(!data->overlay2[0]);
> +
>   	/* Skip if there is less valid outputs than the required. */
>   	for_each_connected_output(display, output)
>   		valid_outputs++;
> @@ -494,6 +612,7 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>   		igt_create_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, &fb[n].ref_primary);
>   		igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &fb[n].ref_primary);
>   		igt_create_fb(data->fd, w, h, DRM_FORMAT_ARGB8888, 0, &fb[n].test_overlay);
> +		igt_create_fb(data->fd, w, h, DRM_FORMAT_ARGB8888, 0, &fb[n].test_overlay2);
>   
>   		igt_plane_set_fb(data->primary[n], &fb[n].ref_primary);
>   
> @@ -520,6 +639,8 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>   
>   		if (test == MPO_SINGLE_PAN)
>   			test_panning_1_display(data, display_count, videos[i][0], videos[i][1], fb);
> +		if (test == MPO_MULTI_OVERLAY)
> +			test_multi_overlay(data, display_count, videos[i][0], videos[i][1], fb);
>   		if (test == MPO_MULTI_PAN)
>   			test_panning_2_display(data, videos[i][0], videos[i][1], fb);
>   		if(test == MPO_SCALE)
> @@ -536,6 +657,7 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>   	for (int n = 0; n < display_count; n++) {
>   		igt_remove_fb(data->fd, &fb[n].ref_primary);
>   		igt_remove_fb(data->fd, &fb[n].test_overlay);
> +		igt_remove_fb(data->fd, &fb[n].test_overlay2);
>   	}
>   }
>   /*
> @@ -798,6 +920,10 @@ igt_main
>   	igt_subtest("mpo-pan-multi-p010")
>   		test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_P010, DISPLAYS_TO_TEST);
>   
> +	igt_describe("Multi MPO");
> +	igt_subtest("multi-mpo")
> +		test_display_mpo(&data, MPO_MULTI_OVERLAY, DRM_FORMAT_NV12, 1);
> +
>   	igt_describe("MPO and scaling RGB primary plane");
>   	igt_subtest("mpo-scale-rgb")
>   		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, 1);
