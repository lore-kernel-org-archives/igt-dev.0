Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC196FB44
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 13:22:05 +0000 (UTC)
Date: Fri, 31 Jan 2020 15:22:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200131132202.GQ13686@intel.com>
References: <1580470869-698-1-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580470869-698-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: fix fbc
 checking rules
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 31, 2020 at 01:41:09PM +0200, Juha-Pekka Heikkila wrote:
> Fix FBC checking rules for scaledprimary subtests
> =

> References: https://gitlab.freedesktop.org/drm/intel/issues/160
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  tests/kms_frontbuffer_tracking.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tra=
cking.c
> index c788b59..2c765c3 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -2614,16 +2614,16 @@ static void scaledprimary_subtest(const struct te=
st_mode *t)
>  	do_assertions(DONT_ASSERT_CRC);
>  =

>  	/*
> -	 * On gen <=3D 10 HW, FBC is not enabled on a plane with a Y offset
> +	 * On gen >=3D 9 HW, FBC is not enabled on a plane with a Y offset
>  	 * that isn't divisible by 4, because it causes FIFO underruns.
>  	 *
>  	 * Check that FBC is disabled.
>  	 */
>  	igt_fb_set_position(&new_fb, reg->plane,
> -			    reg->x + reg->w / 4, reg->y + src_y_upscale + 3);
> +			    reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
>  	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
>  	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> -	do_assertions(DONT_ASSERT_CRC | (gen <=3D 10 ? ASSERT_FBC_DISABLED : 0)=
);
> +	do_assertions(DONT_ASSERT_CRC | (gen >=3D 9 ? ASSERT_FBC_DISABLED : 0));
>  =

>  	/* Back to the good and old blue fb. */
>  	igt_plane_set_fb(reg->plane, old_fb);
> -- =

> 2.7.4
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
