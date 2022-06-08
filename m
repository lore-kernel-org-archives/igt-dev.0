Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F5B112867
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 15:36:25 +0000 (UTC)
Message-ID: <a0905570-64de-d92b-07ac-1f7d11204bae@intel.com>
Date: Wed, 8 Jun 2022 21:06:20 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
 <20220517120245.3521494-5-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220517120245.3521494-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 04/11] tests/kms_cursor_legacy: Test Cleanup
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

Test Cleanup LGTM.
Need clean CI.
Additionally, please remove all unnecessary comments in the IGT
like
"Test description for *"
These are not required.

On 17-May-22 5:32 PM, Bhanuprakash Modem wrote:
> Clear the system state before exiting the subtest.
> 
> V2: Fix Crash in *-modeset-vs-cursor-atomic test
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 158 ++++++++++++++++++++++++++++++--------
>   1 file changed, 128 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 1e0b2a79..033e2355 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -204,7 +204,8 @@ static igt_output_t *set_fb_on_crtc(igt_display_t *display, enum pipe pipe, stru
>   	return NULL;
>   }
>   Test description for
> -static void set_cursor_on_pipe(igt_display_t *display, enum pipe pipe, struct igt_fb *fb)
> +static	igt_plane_t
> +*set_cursor_on_pipe(igt_display_t *display, enum pipe pipe, struct igt_fb *fb)
>   {
>   	igt_plane_t *plane, *cursor = NULL;
>   
> @@ -218,6 +219,8 @@ static void set_cursor_on_pipe(igt_display_t *display, enum pipe pipe, struct ig
>   
>   	igt_require(cursor);
>   	igt_plane_set_fb(cursor, fb);
> +
> +	return cursor;
>   }
>   
>   static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
> @@ -421,6 +424,7 @@ static void flip(igt_display_t *display,
>   	uint64_t *results;
>   	struct igt_fb fb_info, fb_info2, argb_fb, cursor_fb, cursor_fb2;
>   	igt_output_t *output, *output2;
> +	igt_plane_t *cursor;
>   
>   	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   	igt_assert(results != MAP_FAILED);
> @@ -449,7 +453,7 @@ static void flip(igt_display_t *display,
>   	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height, DRM_FORMAT_ARGB8888, 0, .5, .5, .5, &cursor_fb);
>   
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> -	set_cursor_on_pipe(display, cursor_pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, cursor_pipe, &cursor_fb);
>   	populate_cursor_args(display, cursor_pipe, arg, &cursor_fb);
>   
>   	prepare_flip_test(display, mode, flip_pipe, cursor_pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
> @@ -496,6 +500,18 @@ static void flip(igt_display_t *display,
>   
>   	munmap(results, PAGE_SIZE);
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	if (flip_pipe != cursor_pipe) {
> +		igt_plane_set_fb(igt_output_get_plane_type(output2, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +		igt_output_set_pipe(output2, PIPE_NONE);
> +	}
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info);
>   	if (flip_pipe != cursor_pipe)
>   		igt_remove_fb(display->drm_fd, &fb_info2);
> @@ -526,6 +542,8 @@ static void basic_flip_cursor(igt_display_t *display,
>   	uint64_t ahnd = 0;
>   	igt_spin_t *spin;
>   	int i, miss1 = 0, miss2 = 0, delta;
> +	igt_output_t *output;
> +	igt_plane_t *cursor;
>   
>   	if (flags & BASIC_BUSY)
>   	{
> @@ -536,10 +554,10 @@ static void basic_flip_cursor(igt_display_t *display,
>   	if (mode >= flip_test_atomic)
>   		igt_require(display->is_atomic);
>   
> -	igt_require(set_fb_on_crtc(display, pipe, &fb_info));
> +	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
>   
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> -	set_cursor_on_pipe(display, pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
>   
>   	prepare_flip_test(display, mode, pipe, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
> @@ -638,6 +656,13 @@ static void basic_flip_cursor(igt_display_t *display,
>   	if (miss1 || miss2)
>   		igt_info("Failed to evade %i vblanks and missed %i page flips\n", miss1, miss2);
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
>   
> @@ -687,14 +712,16 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>   	enum pipe pipe = find_connected_pipe(display, false);
>   	volatile unsigned long *shared;
>   	cpu_set_t mask, oldmask;
> +	igt_output_t *output;
> +	igt_plane_t *cursor;
>   
>   	if (mode >= flip_test_atomic)
>   		igt_require(display->is_atomic);
>   
> -	igt_require(set_fb_on_crtc(display, pipe, &fb_info));
> +	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
>   
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> -	set_cursor_on_pipe(display, pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
>   
>   	prepare_flip_test(display, mode, pipe, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
> @@ -788,6 +815,13 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>   		sched_setaffinity(0, sizeof(oldmask), &oldmask);
>   	}
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
>   
> @@ -803,25 +837,16 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
>   	igt_output_t *output;
>   	enum pipe pipe = find_connected_pipe(display, false);
>   	struct drm_mode_cursor arg[2];
> -	igt_plane_t *cursor = NULL, *plane;
> +	igt_plane_t *primary, *cursor = NULL;
>   
>   	igt_require(display->is_atomic);
>   	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> -	set_cursor_on_pipe(display, pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
>   	arg[0].flags |= DRM_MODE_CURSOR_BO;
>   
> -	for_each_plane_on_pipe(display, pipe, plane) {
> -		if (plane->type != DRM_PLANE_TYPE_CURSOR)
> -			continue;
> -
> -		cursor = plane;
> -		break;
> -	}
> -
> -	igt_skip_on(!cursor);
> -
>   	/*
>   	 * Start disabled. No way around it, since the first atomic
>   	 * commit may be unreliable with amount of events sent.
> @@ -876,6 +901,11 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
>   		igt_reset_timeout();
>   	}
>   
> +	igt_plane_set_fb(primary, NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
>   }
> @@ -905,6 +935,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>   	unsigned flags = 0, vblank_start;
>   	struct drm_event_vblank vbl;
>   	int ret;
> +	igt_plane_t *cursor, *cursor2;
>   
>   	if (modeset) {
>   		uint64_t val;
> @@ -932,17 +963,16 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>   	}
>   
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> -	set_cursor_on_pipe(display, pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	populate_cursor_args(display, pipe, arg1, &cursor_fb);
>   
>   	arg1[1].x = arg1[1].y = 192;
>   
> -	set_cursor_on_pipe(display, pipe2, &cursor_fb);
> +	cursor2 = set_cursor_on_pipe(display, pipe2, &cursor_fb);
>   	populate_cursor_args(display, pipe2, arg2, &cursor_fb);
>   
>   	arg2[1].x = arg2[1].y = 192;
>   
> -
>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	igt_fork(child, 2) {
> @@ -1056,6 +1086,18 @@ done:
>   	shared[0] = 1;
>   	igt_waitchildren();
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	if (enabled)
> +		igt_plane_set_fb(igt_output_get_plane_type(output2, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_plane_set_fb(cursor2, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_pipe(output2, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info);
>   	igt_remove_fb(display->drm_fd, &fb2_info);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
> @@ -1074,6 +1116,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
>   	igt_output_t *output;
>   	uint32_t vrefresh;
>   	int fail_count;
> +	igt_plane_t *cursor;
>   
>   	if (mode >= flip_test_atomic)
>   		igt_require(display->is_atomic);
> @@ -1085,7 +1128,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
>   	vrefresh = igt_output_get_mode(output)->vrefresh;
>   
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> -	set_cursor_on_pipe(display, pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
>   
>   	prepare_flip_test(display, mode, pipe, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
> @@ -1150,6 +1193,13 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
>   		     "Failed to meet cursor update expectations in %d out of %d iterations\n",
>   		     fail_count, nloops);
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
>   	munmap((void *)shared, PAGE_SIZE);
> @@ -1171,6 +1221,7 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
>   		find_connected_pipe(display, true)
>   	};
>   	igt_output_t *outputs[2];
> +	igt_plane_t *cursors[2];
>   
>   	shared = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   	igt_assert(shared != MAP_FAILED);
> @@ -1190,11 +1241,11 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
>   
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
>   
> -	set_cursor_on_pipe(display, pipe[0], &cursor_fb);
> +	cursors[0] = set_cursor_on_pipe(display, pipe[0], &cursor_fb);
>   	populate_cursor_args(display, pipe[0], arg[0], &cursor_fb);
>   	arg[0][1].x = arg[0][1].y = 192;
>   
> -	set_cursor_on_pipe(display, pipe[1], &cursor_fb);
> +	cursors[1] = set_cursor_on_pipe(display, pipe[1], &cursor_fb);
>   	populate_cursor_args(display, pipe[1], arg[1], &cursor_fb);
>   	arg[1][1].x =  arg[1][1].y = 192;
>   
> @@ -1263,6 +1314,17 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
>   				    vrefresh[child]*target[child], vrefresh[child]*target[child] / 2);
>   	}
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(igt_output_get_plane_type(outputs[0], DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(igt_output_get_plane_type(outputs[1], DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(cursors[0], NULL);
> +	igt_plane_set_fb(cursors[1], NULL);
> +	igt_output_set_pipe(outputs[0], PIPE_NONE);
> +	igt_output_set_pipe(outputs[1], PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info[0]);
>   	igt_remove_fb(display->drm_fd, &fb_info[1]);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
> @@ -1277,11 +1339,13 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>   	unsigned vblank_start;
>   	enum pipe pipe = find_connected_pipe(display, false);
>   	igt_crc_t crcs[3];
> +	igt_output_t *output;
> +	igt_plane_t *cursor;
>   
>   	if (atomic)
>   		igt_require(display->is_atomic);
>   
> -	igt_require(set_fb_on_crtc(display, pipe, &fb_info));
> +	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
>   
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
> @@ -1290,7 +1354,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>   
>   	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
>   
> -	set_cursor_on_pipe(display, pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
>   
>   	/* Collect reference crcs, crcs[0] last. */
> @@ -1320,6 +1384,13 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>   		igt_assert_crc_equal(&crcs[i], &crcs[2]);
>   	}
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_remove_fb(display->drm_fd, &fb_info);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
>   }
> @@ -1335,6 +1406,8 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
>   	igt_crc_t crcs[2], test_crc;
>   	uint64_t ahnd;
> +	igt_output_t *output;
> +	igt_plane_t *cursor;
>   
>   	igt_require_intel(display->drm_fd);
>   	ahnd = get_reloc_ahnd(display->drm_fd, 0);
> @@ -1342,7 +1415,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   	if (atomic)
>   		igt_require(display->is_atomic);
>   
> -	igt_require(set_fb_on_crtc(display, pipe, &fb_info[0]));
> +	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info[0])));
>   	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
>   				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
>   
> @@ -1353,7 +1426,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   
>   	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
>   
> -	set_cursor_on_pipe(display, pipe, &cursor_fb);
> +	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
>   
>   	/* Collect reference crcs, crc[0] last for the loop. */
> @@ -1411,6 +1484,12 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   		igt_assert_crc_equal(&crcs[i], &test_crc);
>   	}
>   
> +	/* Clean-up */
> +	igt_plane_set_fb(plane_primary, NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	igt_pipe_crc_stop(pipe_crc);
>   	igt_remove_fb(display->drm_fd, &fb_info[1]);
>   	igt_remove_fb(display->drm_fd, &fb_info[0]);
> @@ -1485,6 +1564,9 @@ igt_main
>   	igt_describe("Test checks how many cursor updates we can fit between vblanks "
>   		    "on all pipes with different modes, priority and number of processes");
>   	igt_subtest_group {
> +		igt_fixture
> +			igt_display_require_output(&display);
> +
>   		igt_subtest("nonblocking-modeset-vs-cursor-atomic")
>   			nonblocking_modeset_vs_cursor(&display, 1);
>   
> @@ -1510,6 +1592,9 @@ igt_main
>   			{ "2x-long-nonblocking-modeset-vs-cursor-atomic", 15, true, true },
>   		};
>   
> +		igt_fixture
> +			igt_display_require_output(&display);
> +
>   		for (i = 0; i < ARRAY_SIZE(tests); i++) {
>   			igt_subtest(tests[i].name)
>   				two_screens_flip_vs_cursor(&display,
> @@ -1533,6 +1618,9 @@ igt_main
>   			{ "2x-long-cursor-vs-flip-atomic", 50, true },
>   		};
>   
> +		igt_fixture
> +			igt_display_require_output(&display);
> +
>   		for (i = 0; i < ARRAY_SIZE(tests); i++) {
>   			igt_subtest(tests[i].name)
>   				two_screens_cursor_vs_flip(&display,
> @@ -1544,8 +1632,10 @@ igt_main
>   	/*Test description for cursor-crc tests*/
>   	igt_describe("Test will first does a page flip and then cursor update");
>   	igt_subtest_group {
> -		igt_fixture
> +		igt_fixture {
>   			igt_require_pipe_crc(display.drm_fd);
> +			igt_display_require_output(&display);
> +		}
>   
>   		igt_subtest("flip-vs-cursor-crc-legacy")
>   			flip_vs_cursor_crc(&display, false);
> @@ -1557,8 +1647,10 @@ igt_main
>   	/*Test description for busy-crc tests*/
>   	igt_describe("this test perform a busy bo update followed by a cursor update");
>   	igt_subtest_group {
> -		igt_fixture
> +		igt_fixture {
>   			igt_require_pipe_crc(display.drm_fd);
> +			igt_display_require_output(&display);
> +		}
>   
>   		igt_subtest("flip-vs-cursor-busy-crc-legacy")
>   			flip_vs_cursor_busy_crc(&display, false);
> @@ -1576,6 +1668,9 @@ igt_main
>   						"and full screen primary plane. "
>   			"toggle: which toggles cursor visibility and make sure cursor moves between updates.");
>   		igt_subtest_group {
> +			igt_fixture
> +				igt_display_require_output(&display);
> +
>   			igt_subtest_with_dynamic_f("%s-flip-before-cursor", prefix[i]) {
>   				for (j = 0; j <= flip_test_last; j++) {
>   					igt_dynamic_f("%s", modes[j])
> @@ -1605,6 +1700,9 @@ igt_main
>   	igt_describe("The essence of the basic test is that neither the cursor nor the "
>   		     "nonblocking flip stall the application of the next");
>   	igt_subtest_group {
> +		igt_fixture
> +			igt_display_require_output(&display);
> +
>   		igt_subtest_with_dynamic("flip-vs-cursor") {
>   			for (i = 0; i <= flip_test_last; i++) {
>   				igt_dynamic_f("%s", modes[i])

-- 
~Swati Sharma
