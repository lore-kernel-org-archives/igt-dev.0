Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460F96E105
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Apr 2021 07:40:47 +0000 (UTC)
Date: Tue, 20 Apr 2021 10:41:53 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YH6FwbTnAOOxVLN4@platvala-desk.ger.corp.intel.com>
References: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
 <20210416174841.20132-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416174841.20132-5-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/kms_plane: Ignore the crc
 frame count with --skip-crc-compare
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 08:48:41PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> While debugging one might run things with "--interacive-debug=3Dmodeset
> --skip-crc-compare" to actually see what things look like on the screen.
> To do that without the asserts failing we need to ignore the crc frame
> count value since we may be sitting there for an arbitrary amount of
> time staring at the screen.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/kms_plane.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index f20f5bee918b..9fe253a8c393 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -549,7 +549,8 @@ static void capture_crc(data_t *data, unsigned int vb=
lank, igt_crc_t *crc)
>  {
>  	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
>  =

> -	igt_fail_on_f(crc->has_valid_frame && crc->frame !=3D vblank,
> +	igt_fail_on_f(!igt_skip_crc_compare &&
> +		      crc->has_valid_frame && crc->frame !=3D vblank,
>  		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer o=
verflow?\n",
>  		      crc->frame, vblank);
>  }
> -- =

> 2.26.3
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
