Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B1710E6D2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 09:09:22 +0000 (UTC)
Date: Tue, 25 Apr 2023 11:09:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230425090917.fwatejyz7p2uon2n@kamilkon-desk1>
References: <20230424183400.465464-1-mcanal@igalia.com>
 <20230424183400.465464-3-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424183400.465464-3-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_plane_scaling: remove
 unused parameters
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

On 2023-04-24 at 15:34:00 -0300, Maíra Canal wrote:
> Commit 1b9ca59a ("tests/kms_plane_scaling: reduce work on framebuffer
> creation") changed the colored framebuffer to blank framebuffers.
> Therefore, there is no need to pass the RGB colors as parameters to the
> function setup_fb(), as it only creates a blank framebuffer.
> 
> Fixes: 1b9ca59a ("tests/kms_plane_scaling: reduce work on framebuffer creation")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_plane_scaling.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 7f5cb00d..19528a40 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -715,9 +715,7 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  	igt_assert_eq(ret, 0);
>  }
>  
> -static void setup_fb(int fd, int width, int height,
> -		     double r, double g, double b,
> -		     struct igt_fb *fb)
> +static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
>  {
>  	igt_create_fb(fd, width, height,
>  		      DRM_FORMAT_XRGB8888,
> @@ -744,20 +742,20 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  
>  	switch (test_type) {
>  	case TEST_PLANES_UPSCALE:
> -		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
> -		setup_fb(display->drm_fd, w2, h2, 0.0, 1.0, 0.0, &d->fb[2]);
> +		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> +		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
>  		break;
>  	case TEST_PLANES_DOWNSCALE:
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 1.0, 0.0, 0.0, &d->fb[1]);
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
> +		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> +		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
>  		break;
>  	case TEST_PLANES_UPSCALE_DOWNSCALE:
> -		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
> +		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> +		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
>  		break;
>  	case TEST_PLANES_DOWNSCALE_UPSCALE:
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 1.0, 0.0, 0.0, &d->fb[1]);
> -		setup_fb(display->drm_fd, w2, h2, 0.0, 1.0, 0.0, &d->fb[2]);
> +		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> +		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
>  		break;
>  	default:
>  		igt_assert(0);
> -- 
> 2.40.0
> 
