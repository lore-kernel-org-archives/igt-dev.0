Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0240F10FB18
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Dec 2021 12:51:04 +0000 (UTC)
Date: Fri, 17 Dec 2021 14:51:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YbyHtDTnWqD9e3QR@intel.com>
References: <20211210172006.28654-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211210172006.28654-1-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Remove vblank
 counter check immediately after flip_nonblocking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: aravindh@codeaurora.org, petri.latvala@intel.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, quic_khsieh@quicinc.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 09:20:06AM -0800, Jessica Zhang wrote:
> Currently, there is a check that the vblank counter shouldn't change after
> a nonblocking page flip and DRM_IOCTL_MODE_CURSOR call. This assumes
> that ioctl is performed before the commit from the nonblocking flip is
> dequeued.
>=20
> The DRM_IOCTL_MODE_CURSOR callstack is as such:
> 	drm_mode_cursor_ioctl
> 	drm_mode_cursor_common
> 	drm_mode_cursor_universal
> 	__setplane_atomic
> 	drm_atomic_helper_update_plane
> 	drm_atomic_commit
>=20
> Becuase the commit work queue is scheduled earlier than
> DRM_CURSOR_IOCTL, it will finish before the ioctl. Thus, we can't
> assume that the current vblank count will match vblank_start after the
> cursor ioctl finishes.

Your driver is broken. The legacy cursor ioctl is expected to
not get stuck behind the page flip.

>=20
> Tested-on: Chromebook Lazor (Trogdor)
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_cursor_legacy.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index d50155e8..82c01bc8 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1307,8 +1307,6 @@ static void flip_vs_cursor_crc(igt_display_t *displ=
ay, bool atomic)
>  		flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
>  		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
> =20
> -		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_sta=
rt);
> -
>  		igt_set_timeout(1, "Stuck page flip");
>  		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>  		igt_reset_timeout();
> --=20
> 2.31.0

--=20
Ville Syrj=E4l=E4
Intel
