Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C267B10E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 23:06:52 +0000 (UTC)
Message-ID: <8db66c9b-e68f-a85b-d8ac-fab319465fc4@amd.com>
Date: Wed, 19 Oct 2022 19:06:49 -0400
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20221007230937.2532541-1-alex.hung@amd.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221007230937.2532541-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: allow an extra
 vblank in atomic-transitions tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-10-07 19:09, Alex Hung wrote:
> On i915 devices:
> kmstest_get_vblank() calls a drm_ioctl(DRM_IOCTL_WAIT_VBLANK), but
> vblanks are not updated until a following read() op triggers kernel to
> update vblank, ex. "[drm:drm_handle_vblank [drm]] vblank event on xxx".
> 
> However, this is not the case for all devices:
> kmstest_get_vblank() triggers a drm_ioctl(DRM_IOCTL_WAIT_VBLANK),
> and then drm_wait_vblank_ioctl() in drm_vblank.c is called and
> returns vblank, ex. "[drm]] crtc 0 returning xxx to client" right away.
> In this scenario, the read() op does nothing related to vblank.
> 
> Since the vblank can be updated before the read(), the extra vblank
> in commit da0b6abeshould also be allowed before the read().
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_cursor_legacy.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 1ad92eaa..868cfb97 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -802,6 +802,8 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>   		/* Nor should it have delayed the following cursor update */
>   		if (!cursor_slowpath(display, mode))
>   			igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
> +		else if (mode_requires_extra_vblank(mode))
> +			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 2);
>   		else
>   			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
>   

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
