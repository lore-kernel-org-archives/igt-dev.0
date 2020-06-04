Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17B56E3F3
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2020 14:50:44 +0000 (UTC)
Date: Thu, 4 Jun 2020 17:50:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200604145031.GR6112@intel.com>
References: <20200603210506.17185-1-mohammed.khajapasha@intel.com>
 <20200603210506.17185-2-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603210506.17185-2-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Set pipe enum name to
 a pipe from drm pipe
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com, kishore.kunche@intel.com, suresh.kumar.kurmi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 02:35:05AM +0530, Mohammed Khajapasha wrote:
> set the pipe enum name to igt pipe from drm pipe,
> in case of non-contiguous pipes in display, the igt pipes cann't
> be same as enabled pipes in kernel.
> =

> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  lib/igt_kms.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> =

> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index afef5939..a42a44c5 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1958,10 +1958,16 @@ void igt_display_require(igt_display_t *display, =
int drm_fd)
>  		int p =3D 1;
>  		int j, type;
>  		uint8_t last_plane =3D 0, n_planes =3D 0;
> +		struct drm_i915_get_pipe_from_crtc_id get_pipe;
>  =

>  		pipe->crtc_id =3D resources->crtcs[i];
>  		pipe->display =3D display;
> -		pipe->pipe =3D i;
> +		/* Get right pipe enum from kernel for a pipe */
> +		get_pipe.pipe =3D 0;
> +		get_pipe.crtc_id =3D  pipe->crtc_id;
> +		do_ioctl(display->drm_fd,
> +				DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
> +		pipe->pipe =3D get_pipe.pipe;

This looks like it would break everything that currently
assumes pipe->pipe will match the index.

I have a feeling that if we aren't going to do the rename from
pipe to crtc (or whatever) then we should just add a .hw_pipe
which reflects the actual hardware pipe used. Then any test
which relies on hw specific things can examine that instead.
Also reviewing all the tests for such usages of pipe is going
to be some amount of work I imagine.

And this still wouldn't fix the problem of the logs saying
eg. pipe B when in fact it's hw pipe C. But I don't know if
there's any trivial solution for that.

As for the implementation, this needs an i915 check so we don't
blow up on other drivers when using that i915 specific ioctl.

>  		pipe->plane_cursor =3D -1;
>  		pipe->plane_primary =3D -1;
>  		pipe->planes =3D NULL;
> -- =

> 2.24.1
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
