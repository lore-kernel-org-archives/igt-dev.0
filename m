Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF03B6E0F8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 13:09:42 +0000 (UTC)
References: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
 <20210504004313.28804-4-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <5e980124-6e06-0907-a854-c2faa5a31383@intel.com>
Date: Fri, 7 May 2021 18:39:37 +0530
MIME-Version: 1.0
In-Reply-To: <20210504004313.28804-4-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v4 i-g-t 03/14] tests/kms_cursor_legacy: Fix mode
 selection for 2x tests
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
List-ID: <igt-dev@lists.freedesktop.org>


On 5/4/2021 6:13 AM, Bhanuprakash Modem wrote:
> When two monitors connected through MST, the second monitor also
> tries to use the same mode. So two such modes may not fit into the
> link bandwidth.
>
> This patch will find a combination of modes that fit into the BW.
>
> V2:
> * Remove MST specific logic (Daniel)
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 47 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 44 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 4723e1ff9..5f032afe2 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -50,6 +50,15 @@ IGT_TEST_DESCRIPTION("Stress legacy cursor ioctl");
>   
>   igt_pipe_crc_t *pipe_crc;
>   
> +static void override_output_modes(igt_display_t *display, igt_output_t *output, igt_output_t *output2)
> +{
> +	bool found = igt_override_all_active_output_modes_to_fit_link_bw(display);
> +	igt_require_f(found, "No valid mode combo found.\n");
> +
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_pipe(output2, PIPE_NONE);
> +}
> +
>   static void stress(igt_display_t *display,
>   		   enum pipe pipe, int num_children, unsigned mode,
>   		   int timeout)
> @@ -393,6 +402,7 @@ static void flip(igt_display_t *display,
>   	struct drm_mode_cursor arg[2];
>   	uint64_t *results;
>   	struct igt_fb fb_info, fb_info2, argb_fb, cursor_fb, cursor_fb2;
> +	igt_output_t *output, *output2;
>   
>   	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   	igt_assert(results != MAP_FAILED);
> @@ -406,9 +416,20 @@ static void flip(igt_display_t *display,
>   	if (mode >= flip_test_atomic)
>   		igt_require(display->is_atomic);
>   
> -	igt_require(set_fb_on_crtc(display, flip_pipe, &fb_info));
> -	if (flip_pipe != cursor_pipe)
> -		igt_require(set_fb_on_crtc(display, cursor_pipe, &fb_info2));
> +	igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
> +	if (flip_pipe != cursor_pipe) {
> +		igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
> +
> +		if (igt_display_try_commit_atomic(display,
> +					  DRM_MODE_ATOMIC_TEST_ONLY |
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					  NULL) != 0) {
> +			override_output_modes(display, output, output2);
> +
> +			igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
> +			igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
> +		}
> +	}
>   
>   	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height, DRM_FORMAT_ARGB8888, 0, .5, .5, .5, &cursor_fb);
>   
> @@ -879,6 +900,16 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
>   	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
>   	igt_require((output2 = set_fb_on_crtc(display, pipe2, &fb2_info)));
>   
> +	if (igt_display_try_commit_atomic(display,
> +					  DRM_MODE_ATOMIC_TEST_ONLY |
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					  NULL) != 0) {
> +		override_output_modes(display, output, output2);
> +
> +		igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
> +		igt_require((output2 = set_fb_on_crtc(display, pipe2, &fb2_info)));
> +	}
> +
>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
>   	set_cursor_on_pipe(display, pipe, &cursor_fb);
>   	populate_cursor_args(display, pipe, arg1, &cursor_fb);
> @@ -1129,6 +1160,16 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
>   	igt_require((outputs[0] = set_fb_on_crtc(display, pipe[0], &fb_info[0])));
>   	igt_require((outputs[1] = set_fb_on_crtc(display, pipe[1], &fb_info[1])));
>   
> +	if (igt_display_try_commit_atomic(display,
> +					  DRM_MODE_ATOMIC_TEST_ONLY |
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					  NULL) != 0) {
> +		override_output_modes(display, outputs[0], outputs[1]);
> +
> +		igt_require((outputs[0] = set_fb_on_crtc(display, pipe[0], &fb_info[0])));
> +		igt_require((outputs[1] = set_fb_on_crtc(display, pipe[1], &fb_info[1])));
> +	}
> +


Here again we have 2 versions of subtests legacy and atomic, and this 
will not work for the legacy part.

As mentioned in previous patches, need to add support for legacy try commit.

Apart from that other changes seem reasonable to me.


Regards,

Ankit

>   	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
>   
>   	set_cursor_on_pipe(display, pipe[0], &cursor_fb);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
