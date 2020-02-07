Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE966FCC7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 14:21:36 +0000 (UTC)
Date: Fri, 7 Feb 2020 16:21:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200207142133.GB13686@intel.com>
References: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
 <20200128112549.172135-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128112549.172135-2-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_fbcon_fbt: User
 interactive debug helper
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 12:25:48PM +0100, Daniel Vetter wrote:
> Instead of hand-rolling our own which can only be enabled by recompiling.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  tests/kms_fbcon_fbt.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> =

> diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> index 506848cfcf47..236e09ea1ebd 100644
> --- a/tests/kms_fbcon_fbt.c
> +++ b/tests/kms_fbcon_fbt.c
> @@ -37,8 +37,6 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbc=
on and the frontbuffer "
>  =

>  #define MAX_CONNECTORS 32
>  =

> -static bool do_wait_user =3D false;
> -

Got confused for a second when you're not removing the part
that sets this to true. But turns out there is no such part.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  struct drm_info {
>  	int fd;
>  	int debugfs_fd;
> @@ -48,12 +46,8 @@ struct drm_info {
>  =

>  static void wait_user(const char *msg)
>  {
> -	if (!do_wait_user)
> -		return;
> -
> -	igt_info("%s Press enter...\n", msg);
> -	while (getchar() !=3D '\n')
> -		;
> +	igt_info("%s\n", msg);
> +	igt_debug_wait_for_keypress("fbt");
>  }
>  =

>  static void setup_drm(struct drm_info *drm)
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
