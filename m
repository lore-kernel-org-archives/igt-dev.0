Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Sat, 5 Jun 2021 05:46:35 +0000
Message-ID: <BY5PR11MB43723B6E6C4681C0900B9F70893A9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622176025-12499-1-git-send-email-vidya.srinivas@intel.com>
 <CAJUqKUpEJZXGLcktaS8Jaaf-N0pPpjKP0Fi4UjmBx+Zs_DrvdQ@mail.gmail.com>
In-Reply-To: <CAJUqKUpEJZXGLcktaS8Jaaf-N0pPpjKP0Fi4UjmBx+Zs_DrvdQ@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_big_fb: Wait for
 vblank before collecting CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you very much Mark, for testing the patch and providing the "Tested-by" tag.

Regards
Vidya

-----Original Message-----
From: Mark Yacoub <markyacoub@chromium.org> 
Sent: Saturday, June 5, 2021 12:20 AM
To: Srinivas, Vidya <vidya.srinivas@intel.com>
Cc: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org; Almahallawy, Khaled <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>
Subject: Re: [PATCH i-g-t] [RFC] tests/kms_big_fb: Wait for vblank before collecting CRC

On Fri, May 28, 2021 at 12:36 AM Vidya Srinivas <vidya.srinivas@intel.com> wrote:
>
> Without wait for vblank, CRC mismatch is seen between big and small 
> CRC on few Gen11 systems.
>
Tested on ChromeOS on JSL (Drawlat).
Tested-by: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_big_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index 
> b35727a09bd0..f90363c3beb2 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -254,6 +254,7 @@ static void unset_lut(data_t *data)  static bool 
> test_plane(data_t *data)  {
>         igt_plane_t *plane = data->plane;
> +       igt_display_t *display = &data->display;
>         struct igt_fb *small_fb = &data->small_fb;
>         struct igt_fb *big_fb = &data->big_fb;
>         int w = data->big_fb_width - small_fb->width; @@ -337,16 
> +338,17 @@ static bool test_plane(data_t *data)
>                 igt_display_commit2(&data->display, data->display.is_atomic ?
>                                     COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>
> -
> +               igt_wait_for_vblank(data->drm_fd, 
> + display->pipes[data->pipe].crtc_offset);
>                 igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
>
>                 igt_plane_set_fb(plane, big_fb);
>                 igt_fb_set_position(big_fb, plane, x, y);
>                 igt_fb_set_size(big_fb, plane, small_fb->width, 
> small_fb->height);
> +
>                 igt_plane_set_size(plane, data->width, data->height);
>                 igt_display_commit2(&data->display, data->display.is_atomic ?
>                                     COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> -
> +               igt_wait_for_vblank(data->drm_fd, 
> + display->pipes[data->pipe].crtc_offset);
>                 igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
>
>                 igt_plane_set_fb(plane, NULL);
> --
> 2.7.4
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
