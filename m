Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD38910EBA7
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 17:50:05 +0000 (UTC)
Message-ID: <d1e10fa3-c3e2-768e-c061-2df8fcd0c253@intel.com>
Date: Thu, 29 Sep 2022 23:19:46 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220923134114.19713-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220923134114.19713-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_busy: Test cleanup
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

On Fri-23-09-2022 07:11 pm, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.

https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/i915/kms_busy.c#n414

Please move "igt_require(display.is_atomic);" to igt_fixture just before 
calling igt_subtest_with_dynamic().

With above change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_busy.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
> index 99a07c2a..e17a6ffb 100644
> --- a/tests/i915/kms_busy.c
> +++ b/tests/i915/kms_busy.c
> @@ -144,8 +144,7 @@ static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
>   	igt_output_t *output;
>   	int timeout;
>   
> -	if (modeset)
> -		igt_require(dpy->is_atomic);
> +	igt_display_reset(dpy);
>   
>   	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
>   	igt_display_commit2(dpy, COMMIT_LEGACY);
> @@ -230,6 +229,7 @@ static void test_hang(igt_display_t *dpy,
>   	igt_output_t *output;
>   	igt_plane_t *primary;
>   
> +	igt_display_reset(dpy);
>   	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
>   	igt_display_commit2(dpy, COMMIT_ATOMIC);
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -274,6 +274,8 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
>   	igt_spin_t *t;
>   	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
>   
> +	igt_display_reset(dpy);
> +	
>   	output = set_fb_on_crtc(dpy, pipe, &fb);
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> @@ -363,8 +365,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		for_each_pipe(&display, pipe) {
>   			igt_dynamic("flip")
>   				test_flip(&display, pipe, false);
> -			igt_dynamic("modeset")
> -				test_flip(&display, pipe, true);
> +			if(display.is_atomic) {
> +				igt_dynamic("modeset")
> +					test_flip(&display, pipe, true);
> +			}
>   			break;
>   		}
>   	}
