Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E73B6E4E3
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Aug 2021 09:19:03 +0000 (UTC)
Date: Wed, 18 Aug 2021 12:21:50 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YRzRLu2nT+0zywDb@platvala-desk.ger.corp.intel.com>
References: <20210817232154.152035-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210817232154.152035-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/kms_cursor_legacy: Handle
 cursor movements as slow patch for display 9+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 04:21:51PM -0700, Jos=E9 Roberto de Souza wrote:
> i915 is dropping frontbuffer rendering support for display 9+ so
> this evasion attempts will never happen as DRM_IOCTL_MODE_CURSOR will
> be converted to atomic commits that will be executed during vblanks.
>=20
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 0f0df951b..6cc2cf329 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -303,8 +303,13 @@ enum flip_test {
>  	flip_test_last =3D flip_test_atomic_transitions_varying_size
>  };
> =20
> -static bool cursor_slowpath(enum flip_test mode)
> +static bool cursor_slowpath(igt_display_t *display, enum flip_test mode)
>  {
> +	/* Intel display 9 and newer will handle cursor movement as fastsets */
> +	if (is_i915_device(display->drm_fd) &&
> +	    intel_display_ver(intel_get_drm_devid(display->drm_fd)) >=3D 9)
> +	    return true;
> +
>  	/* cursor moving doesn't take slowpath, everything else does. */
>  	if (mode =3D=3D flip_test_legacy || mode =3D=3D flip_test_atomic)
>  		return false;
> @@ -600,7 +605,7 @@ static void basic_flip_cursor(igt_display_t *display,
> =20
>  		if (miss)
>  			{ /* compare nothing, already failed */ }
> -		else if (!cursor_slowpath(mode))
> +		else if (!cursor_slowpath(display, mode))
>  			miss =3D delta !=3D 0;
>  		else
>  			miss =3D delta !=3D 0 && delta !=3D 1;
> @@ -753,7 +758,7 @@ static void flip_vs_cursor(igt_display_t *display, en=
um flip_test mode, int nloo
>  			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
> =20
>  		/* Nor should it have delayed the following cursor update */
> -		if (!cursor_slowpath(mode))
> +		if (!cursor_slowpath(display, mode))
>  			igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_st=
art);
>  		else
>  			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_s=
tart + 1);
> @@ -1119,7 +1124,7 @@ static void cursor_vs_flip(igt_display_t *display, =
enum flip_test mode, int nloo
>  			vblank_last =3D vbl.sequence;
>  		}
> =20
> -		if (!cursor_slowpath(mode))
> +		if (!cursor_slowpath(display, mode))
>  			igt_assert_lte(vbl.sequence, vblank_start + 5 * vrefresh / 8);
> =20
>  		shared[0] =3D 1;
> @@ -1558,7 +1563,7 @@ igt_main
>  		igt_subtest_f("%sflip-before-cursor-%s", prefix, modes[i])
>  			basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
> =20
> -		if (!cursor_slowpath(i)) {
> +		if (!cursor_slowpath(&display, i)) {
>  			igt_subtest_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {

You can't do this. If you're not in a fixture or a subtest, you cannot
touch hardware. In general, don't attempt to do

if (...)
  igt_subtest()


This should rather be something like

igt_subtest_f("...", prefix, modes[i]) {
  igt_require(!cursor_slowpath(&display, i));
  ...
}


--=20
Petri Latvala



>  				igt_require_gem(display.drm_fd);
>  				basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR,
> --=20
> 2.32.0
>=20
