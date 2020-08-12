Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41F66E04E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2020 04:22:47 +0000 (UTC)
References: <20200811201805.15078-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <1514b231-c2c6-2280-1267-d963cdb0e4c5@intel.com>
Date: Wed, 12 Aug 2020 09:52:44 +0530
MIME-Version: 1.0
In-Reply-To: <20200811201805.15078-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Remove duplicate code
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

LTGM.
Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 8/12/2020 1:48 AM, Bhanuprakash Modem wrote:
> As kmstest_get_vblank() API is already available in lib, remove the
> local/duplicate functions and use kmstest_get_vblank().
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 74 ++++++++++++++++-----------------------
>   1 file changed, 31 insertions(+), 43 deletions(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index e631f087..9959fe32 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -480,18 +480,6 @@ static inline uint32_t pipe_select(enum pipe pipe)
>   		return 0;
>   }
>   
> -static unsigned get_vblank(int fd, enum pipe pipe, unsigned flags)
> -{
> -	union drm_wait_vblank vbl;
> -
> -	memset(&vbl, 0, sizeof(vbl));
> -	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_select(pipe) | flags;
> -	if (drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl))
> -		return 0;
> -
> -	return vbl.reply.sequence;
> -}
> -
>   enum basic_flip_cursor {
>   	FLIP_BEFORE_CURSOR,
>   	FLIP_AFTER_CURSOR
> @@ -526,10 +514,10 @@ static void basic_flip_cursor(igt_display_t *display,
>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	/* Quick sanity check that we can update a cursor in a single vblank */
> -	vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> -	igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +	vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
> -	igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   
>   	for (i = 0; i < 25; i++) {
>   		bool miss;
> @@ -543,7 +531,7 @@ static void basic_flip_cursor(igt_display_t *display,
>   					    .dependency = fb_info.gem_handle);
>   
>   		/* Start with a synchronous query to align with the vblank */
> -		vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   
>   		switch (order) {
>   		case FLIP_BEFORE_CURSOR:
> @@ -557,7 +545,7 @@ static void basic_flip_cursor(igt_display_t *display,
>   				break;
>   			}
>   
> -			delta = get_vblank(display->drm_fd, pipe, 0) - vblank_start;
> +			delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
>   			miss = delta != 0;
>   
>   			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
> @@ -566,7 +554,7 @@ static void basic_flip_cursor(igt_display_t *display,
>   		case FLIP_AFTER_CURSOR:
>   			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
>   
> -			delta = get_vblank(display->drm_fd, pipe, 0) - vblank_start;
> +			delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
>   			miss = delta != 0;
>   
>   			switch (mode) {
> @@ -580,7 +568,7 @@ static void basic_flip_cursor(igt_display_t *display,
>   			}
>   		}
>   
> -		delta = get_vblank(display->drm_fd, pipe, 0) - vblank_start;
> +		delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
>   
>   		if (spin) {
>   			struct pollfd pfd = { display->drm_fd, POLLIN };
> @@ -604,7 +592,7 @@ static void basic_flip_cursor(igt_display_t *display,
>   		if (miss1)
>   			continue;
>   
> -		delta = get_vblank(display->drm_fd, pipe, 0) - vblank_start;
> +		delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
>   
>   		if (!mode_requires_extra_vblank(mode))
>   			miss2 += delta != 1;
> @@ -632,13 +620,13 @@ get_cursor_updates_per_vblank(igt_display_t *display, enum pipe pipe,
>   	int target;
>   
>   	for (target = 65536; target; target /= 2) {
> -		unsigned vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +		unsigned vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   
> -		igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   
>   		for (int n = 0; n < target; n++)
>   			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, arg);
> -		if (get_vblank(display->drm_fd, pipe, 0) == vblank_start)
> +		if (kmstest_get_vblank(display->drm_fd, pipe, 0) == vblank_start)
>   			break;
>   	}
>   
> @@ -683,11 +671,11 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>   	else
>   		target = 1;
>   
> -	vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> -	igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +	vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   	for (int n = 0; n < target; n++)
>   		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
> -	igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   
>   	/*
>   	 * There are variations caused by using cpu frequency changing. To
> @@ -725,7 +713,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>   		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
>   
>   		/* Start with a synchronous query to align with the vblank */
> -		vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   		switch (mode) {
>   		default:
>   			flip_nonblocking(display, pipe, mode >= flip_test_atomic, &fb_info, NULL);
> @@ -737,23 +725,23 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>   		}
>   
>   		/* The nonblocking flip should not have delayed us */
> -		igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   		for (int n = 0; n < target; n++)
>   			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
>   
>   		/* Nor should it have delayed the following cursor update */
>   		if (!cursor_slowpath(mode))
> -			igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +			igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   		else
> -			igt_assert_lte(get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
> +			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
>   
>   		igt_set_timeout(1, "Stuck page flip");
>   		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>   
>   		if (!mode_requires_extra_vblank(mode))
> -			igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
> +			igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
>   		else
> -			igt_assert_lte(get_vblank(display->drm_fd, pipe, 0), vblank_start + 2);
> +			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 2);
>   
>   		igt_reset_timeout();
>   	} while (nloops--);
> @@ -938,7 +926,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>   		 * Try a page flip on crtc 1, if we succeed pump page flips and
>   		 * modesets interleaved, else do a single atomic commit with both.
>   		 */
> -		vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   		igt_plane_set_fb(plane, &fb_info);
>   		ret = igt_display_try_commit_atomic(display, flags, (void*)(ptrdiff_t)vblank_start);
>   		igt_assert(!ret || ret == -EBUSY);
> @@ -969,10 +957,10 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>   			goto done;
>   		}
>   	} else {
> -		vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   		flip_nonblocking(display, pipe, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
>   
> -		vblank_start = get_vblank(display->drm_fd, pipe2, DRM_VBLANK_NEXTONMISS);
> +		vblank_start = kmstest_get_vblank(display->drm_fd, pipe2, DRM_VBLANK_NEXTONMISS);
>   		flip_nonblocking(display, pipe2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
>   	}
>   
> @@ -997,7 +985,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>   		}
>   
>   		if (vbl.crtc_id == display->pipes[pipe].crtc_id) {
> -			vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +			vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   			flip_nonblocking(display, pipe, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
>   		} else {
>   			igt_assert(vbl.crtc_id == display->pipes[pipe2].crtc_id);
> @@ -1005,7 +993,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>   			nloops--;
>   
>   			if (!modeset) {
> -				vblank_start = get_vblank(display->drm_fd, pipe2, DRM_VBLANK_NEXTONMISS);
> +				vblank_start = kmstest_get_vblank(display->drm_fd, pipe2, DRM_VBLANK_NEXTONMISS);
>   				flip_nonblocking(display, pipe2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
>   			} else {
>   				igt_output_set_pipe(output2, enabled ? PIPE_NONE : pipe2);
> @@ -1265,18 +1253,18 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>   
>   	/* Disable cursor, and immediately queue a flip. Check if resulting crc is correct. */
>   	for (int i = 1; i >= 0; i--) {
> -		vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   
>   		flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
>   		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
>   
> -		igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   
>   		igt_set_timeout(1, "Stuck page flip");
>   		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>   		igt_reset_timeout();
>   
> -		igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
> +		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
>   
>   		igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
>   
> @@ -1346,12 +1334,12 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   		spin = igt_spin_new(display->drm_fd,
>   				    .dependency = fb_info[1].gem_handle);
>   
> -		vblank_start = get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> +		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>   
>   		flip_nonblocking(display, pipe, atomic, &fb_info[1], NULL);
>   		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
>   
> -		igt_assert_eq(get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   
>   		igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &test_crc);
>   
> @@ -1361,7 +1349,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>   		igt_reset_timeout();
>   
> -		igt_assert_lte(vblank_start + 1, get_vblank(display->drm_fd, pipe, 0));
> +		igt_assert_lte(vblank_start + 1, kmstest_get_vblank(display->drm_fd, pipe, 0));
>   
>   		igt_plane_set_fb(plane_primary, &fb_info[0]);
>   		igt_display_commit2(display, COMMIT_UNIVERSAL);
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
