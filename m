Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED910E1B8
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 07:29:23 +0000 (UTC)
Message-ID: <8c2e8d57-589c-4555-4968-20ab8d5b9395@intel.com>
Date: Mon, 31 Jul 2023 12:58:46 +0530
Content-Language: en-US
To: Albert Esteve <aesteve@redhat.com>, <igt-dev@lists.freedesktop.org>
References: <20230728143742.322532-1-aesteve@redhat.com>
 <20230728143742.322532-3-aesteve@redhat.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230728143742.322532-3-aesteve@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 2/2] kms_cursor_legacy:
 modeset-atomic-cursor-hotspot
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hello,

On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:
> Add a test for modesetting an atomic cursor plane
> hotspot property. Test added to verify the kernel
> patch at [1]. The test first checks if the
> plane is atomic and has the hotspot property.
> and if it does, it sets different random hot_x
> and hot_y values and checks that it is updated
> correctly after an atomic commit.
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2023-July/414509.html
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>   tests/kms_cursor_legacy.c | 76 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 1ebac9d31..ba68dc481 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1607,6 +1607,71 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   	put_ahnd(ahnd);
>   }
>   
> +static void modeset_atomic_cursor_hotspot(igt_display_t *display)
> +{
> +	struct igt_fb cursor_fb;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	igt_plane_t *cursor = NULL;
> +	bool has_hotspot_prop;
> +	uint64_t cursor_width, cursor_height;
> +	uint32_t hot_x, hot_y, prev_hot_x, prev_hot_y;
> +
> +	igt_require(display->is_atomic);
> +	igt_require(display->set_hotspots);
> +	pipe = find_connected_pipe(display, false, &output);
> +	igt_require(output);
> +
> +	igt_info("Using pipe %s & %s\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
> +
> +	cursor_width = cursor_height = 64;
> +	igt_create_color_fb(display->drm_fd, cursor_width, cursor_height, DRM_FORMAT_ARGB8888,
> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
> +
> +	has_hotspot_prop = cursor->props[IGT_PLANE_HOTSPOT_X] ||
> +		cursor->props[IGT_PLANE_HOTSPOT_Y];
> +	igt_require_f(has_hotspot_prop, "Cursor plane lacks the hotspot property");
> +
> +	/*
> +	 * Change the hotspot coordinates randomly and check that the property
> +	 * is updated accordingly.
> +	 */
> +	srand(time(NULL));
> +	for (int i = 0; i < 20; i++) {
> +		hot_x = rand() % cursor_width;
> +		hot_y = rand() % cursor_height;
> +		prev_hot_x = igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_X);
> +		prev_hot_y = igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_Y);
> +		igt_debug("Update cursor hotspot: (%d, %d)\n", hot_x, hot_y);
> +		
> +		/* Set cursor hotspot property values */
> +		igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_X, hot_x);
> +		igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_Y, hot_y);
> +
> +		/* Properties are not updated until the commit */
> +		igt_assert_eq(igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_X), prev_hot_x);
> +		igt_assert_eq(igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_Y), prev_hot_y);

I think, this check is not required since it is an obvious.

> +
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		/* After the commit, the cursor hotspot property values are updated */
> +		igt_assert_eq(igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_X), hot_x);
> +		igt_assert_eq(igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_Y), hot_y);
> +	}
> +
> +	/* Clean-up */
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);

We need to cleanup/set to default hotspot before exiting the subtest.

- Bhanu

> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_remove_fb(display->drm_fd, &cursor_fb);
> +}
> +
>   igt_main
>   {
>   	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> @@ -1681,6 +1746,17 @@ igt_main
>   			nonblocking_modeset_vs_cursor(&display, 16);
>   	}
>   
> +	igt_describe("Test changes the cursor hotspot and checks that the "
> +		      "property is updated accordignly");
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_display_require_output(&display);
> +		}
> +
> +		igt_subtest("modeset-atomic-cursor-hotspot")
> +			modeset_atomic_cursor_hotspot(&display);
> +	}
> +
>   	igt_describe("This test executes flips on both CRTCs "
>   		     "while running cursor updates in parallel");
>   	igt_subtest_group {
