Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDDB891C0
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 14:05:59 +0000 (UTC)
Message-ID: <e172cb8d-8f14-f84b-d799-7daad7af6130@intel.com>
Date: Fri, 31 Mar 2023 19:35:54 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20230321085732.29298-1-juhapekka.heikkila@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230321085732.29298-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: reduce work on
 framebuffer creation
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

LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 21-Mar-23 2:27 PM, Juha-Pekka Heikkila wrote:

> There was created pattern framebuffers on tests which are not crc
> tests, change these to blank framebuffers.
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
> tests/kms_plane_scaling.c | 38 +++++++++++++++++++-------------------
> 1 file changed, 19 insertions(+), 19 deletions(-)
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 71586efba..fe695b684 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -719,10 +719,10 @@ static void setup_fb(int fd, int width, int height,
>               double r, double g, double b,
>               struct igt_fb *fb)
> {
> -    igt_create_color_pattern_fb(fd, width, height,
> -                    DRM_FORMAT_XRGB8888,
> -                    DRM_FORMAT_MOD_LINEAR,
> -                    r, g, b, fb);
> +    igt_create_fb(fd, width, height,
> +              DRM_FORMAT_XRGB8888,
> +              DRM_FORMAT_MOD_LINEAR,
> +              fb);
> }
> static void
> @@ -803,21 +803,21 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
>      plane[2] = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
>      igt_require(plane[2]);
> -    igt_create_color_pattern_fb(display->drm_fd,
> -                                    width, height,
> -                                    DRM_FORMAT_XRGB8888,
> -                                    DRM_FORMAT_MOD_LINEAR,
> -                                    1.0, 0.0, 0.0, &d->fb[0]);
> -    igt_create_color_pattern_fb(display->drm_fd,
> -                                    width, height,
> -                                    DRM_FORMAT_XRGB8888,
> -                                    DRM_FORMAT_MOD_LINEAR,
> -                                    0.0, 1.0, 0.0, &d->fb[1]);
> -    igt_create_color_pattern_fb(display->drm_fd,
> -                                    width, height,
> -                                    DRM_FORMAT_XRGB8888,
> -                                    DRM_FORMAT_MOD_LINEAR,
> -                                    0.0, 0.0, 1.0, &d->fb[2]);
> +    igt_create_fb(display->drm_fd,
> +              width, height,
> +              DRM_FORMAT_XRGB8888,
> +              DRM_FORMAT_MOD_LINEAR,
> +              &d->fb[0]);
> +    igt_create_fb(display->drm_fd,
> +              width, height,
> +              DRM_FORMAT_XRGB8888,
> +              DRM_FORMAT_MOD_LINEAR,
> +              &d->fb[1]);
> +    igt_create_fb(display->drm_fd,
> +              width, height,
> +              DRM_FORMAT_XRGB8888,
> +              DRM_FORMAT_MOD_LINEAR,
> +              &d->fb[2]);
>      igt_plane_set_fb(plane[0], &d->fb[0]);
>      igt_plane_set_fb(plane[1], &d->fb[1]);
