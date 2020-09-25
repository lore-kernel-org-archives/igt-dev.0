Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B5A89182
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2020 15:08:10 +0000 (UTC)
Date: Fri, 25 Sep 2020 18:08:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200925150806.GQ6112@intel.com>
References: <20200925042613.18301-1-karthik.b.s@intel.com>
 <20200925042613.18301-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925042613.18301-2-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v11 1/2] lib/igt_ioctl_wrappers: Add
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

On Fri, Sep 25, 2020 at 09:56:12AM +0530, Karthik B S wrote:
> Add a generic helper for DRM_IOCTL_GET_CAP ioctl.
> =

> v10: -No changes.
> =

> v11: -Pass cap ID instead of the whole structure. (Ville)
>      -Fix the patch ordering. (Ville)
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/ioctl_wrappers.c | 17 +++++++++++++++++
>  lib/ioctl_wrappers.h |  1 +
>  2 files changed, 18 insertions(+)
> =

> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 3781286d..3f35609a 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1318,3 +1318,20 @@ int __kms_addfb(int fd, uint32_t handle,
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
> +bool igt_has_drm_cap(int fd, uint64_t flag)

The docs and code here don't match. I fixed that up and
s/flag/capability/ for clarity.

There was also an int vs. pointer compiler warning in the
othr patch  which I fixed.

Series pushed to master. Thanks.

> +{
> +	struct drm_get_cap cap =3D { .capability =3D flag };
> +
> +	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) =3D=3D 0);
> +	return cap.value;
> +}
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 870ac8b7..e0ec203d 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -196,6 +196,7 @@ struct local_drm_mode_fb_cmd2 {
>  =

>  bool igt_has_fb_modifiers(int fd);
>  void igt_require_fb_modifiers(int fd);
> +bool igt_has_drm_cap(int fd, uint64_t flag);
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
