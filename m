Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912C16E9A6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 16:26:59 +0000 (UTC)
Date: Thu, 19 Aug 2021 19:26:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YR6GT8BJaB1RXTYq@intel.com>
References: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
 <20210819115942.23920-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210819115942.23920-2-thomas.hellstrom@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/ioctl_wrappers: Query if device
 supports set/get legacy tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, apoorva1.singh@intel.com, zbigniew.kempczynski@intel.com, Vanshidhar Konda <vanshidhar.r.konda@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 01:59:40PM +0200, Thomas Hellstr=F6m wrote:
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
>=20
> Add a method to query if the device supports setting and getting legacy
> tiling formats for buffer objects.
>=20
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> ---
>  lib/ioctl_wrappers.c | 17 +++++++++++++++++
>  lib/ioctl_wrappers.h |  1 +
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 09eb3ce7..3f412f7a 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -136,6 +136,23 @@ __gem_get_tiling(int fd, struct drm_i915_gem_get_til=
ing *arg)
>  	return err;
>  }
> =20
> +/**
> + * gem_has_legacy_hw_tiling:
> + * @fd: open i915 drm file descriptor
> + *
> + * Feature check to query if the device supports setting/getting
> + * legacy tiling formats for buffer objects
> + *
> + * Returns: True if tiling is supported
> + */
> +bool
> +gem_has_legacy_hw_tiling(int fd)
> +{
> +	struct drm_i915_gem_get_tiling arg =3D {};
> +
> +	return (__gem_get_tiling(fd, &arg) !=3D -EOPNOTSUPP);

Spurious parens.

Looks to match the kernel so
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +}
> +
>  /**
>   * gem_get_tiling:
>   * @fd: open i915 drm file descriptor
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 9a897fec..d248c568 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -118,6 +118,7 @@ void gem_require_caching(int fd);
>  void gem_require_ring(int fd, unsigned ring);
>  bool gem_has_mocs_registers(int fd);
>  void gem_require_mocs_registers(int fd);
> +bool gem_has_legacy_hw_tiling(int fd);
> =20
>  #define gem_has_ring(f, r) gem_context_has_engine(f, 0, r)
> =20
> --=20
> 2.31.1

--=20
Ville Syrj=E4l=E4
Intel
