Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50906E0CF
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 17:09:56 +0000 (UTC)
Date: Thu, 24 Sep 2020 20:09:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200924170951.GM6112@intel.com>
References: <20200923140258.7553-1-karthik.b.s@intel.com>
 <20200923140258.7553-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923140258.7553-2-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v10 2/2] lib/igt_ioctl_wrappers: Add
 igt_has_drm_cap ioctl wrapper
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: michel@daenzer.net, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 07:32:58PM +0530, Karthik B S wrote:
> Add a generic helper for DRM_IOCTL_GET_CAP ioctl.
> =

> v10: -No changes.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/ioctl_wrappers.c | 15 +++++++++++++++
>  lib/ioctl_wrappers.h |  1 +
>  2 files changed, 16 insertions(+)
> =

> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 3781286d..3ea60c61 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1318,3 +1318,18 @@ int __kms_addfb(int fd, uint32_t handle,
>  =

>  	return ret < 0 ? -errno : ret;
>  }
> +
> +/**
> + * igt_has_drm_cap:
> + * @fd: Open DRM file descriptor.
> + * @cap: drm_get_cap structure.
> + *
> + * This helper verifies if the passed cap is supported by the kernel
> + *
> + * Returns: Whether the cap is supported or not.
> + */
> +bool igt_has_drm_cap(int fd, struct drm_get_cap cap)

I don't see why the caller would want to pass in the whole struct.
Also passing by value is a but nuts. Ie. I'd just the actual cap
ID and keep the ioctl struct details hidden inside this function.

The order of the patches looks wrong. 1/2 won't build w/o this AFAICS.
'git rebase -x ...' before sending the patches is always a good idea.

> +{
> +	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) =3D=3D 0);
> +	return cap.value;
> +}
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 870ac8b7..4cf4004d 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -196,6 +196,7 @@ struct local_drm_mode_fb_cmd2 {
>  =

>  bool igt_has_fb_modifiers(int fd);
>  void igt_require_fb_modifiers(int fd);
> +bool igt_has_drm_cap(int fd, struct drm_get_cap cap);
>  =

>  /**
>   * __kms_addfb:
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
