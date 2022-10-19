Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C7910F168
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 07:26:30 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Srivastava, Vikas" <vikas.srivastava@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Iddamsetty,
 Aravind" <aravind.iddamsetty@intel.com>, "Wilson, Chris P"
 <chris.p.wilson@intel.com>
Date: Wed, 19 Oct 2022 07:26:10 +0000
Message-ID: <DM6PR11MB449239A1E38EFEED33CE1BB98D2B9@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20221014090228.2340914-1-vikas.srivastava@intel.com>
In-Reply-To: <20221014090228.2340914-1-vikas.srivastava@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_module_load : Use
 GEM_BUSY instead of SET_CACHE for sanity check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Yang,
 Fei" <fei.yang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add original author in the signed-off along with yours and in the author pu=
t the original author as major changes haven't been done.
After that change.
You can add Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> vikassri07
> Sent: 14 October 2022 02:32 PM
> To: igt-dev@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Wilson, Chris P
> <chris.p.wilson@intel.com>
> Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Yang, Fei
> <fei.yang@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_module_load : Use
> GEM_BUSY instead of SET_CACHE for sanity check
>=20
>     Use GEM_BUSY ioctl for sanity check as SET_CACHING ioctl
>     is not supported on latest platforms like MTL.
>=20
>     References: VLK-36552
>=20
>     Signed-off-by: vikas.srivastava <vikas.srivastava@intel.com>
>     CC: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>     Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
>     Cc: Fei Yang <fei.yang@intel.com>
>     Cc: Stuart Summers <stuart.summers@intel.com>
>     Cc: Chris Wilson <chris.p.wilson@intel.com>
> ---
>  tests/i915/i915_module_load.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.=
c
> index 1009a22b..eebb3167 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -226,13 +226,13 @@ inject_fault(const char *module_name, const char
> *opt, int fault)
>=20
>  static void gem_sanitycheck(void)
>  {
> -	struct drm_i915_gem_caching args =3D {};
> +	struct drm_i915_gem_busy args =3D {};
>  	int i915 =3D __drm_open_driver(DRIVER_INTEL);
>  	int expected =3D gem_has_lmem(i915) ? -ENODEV : -ENOENT;
>  	int err;
>=20
>  	err =3D 0;
> -	if (ioctl(i915, DRM_IOCTL_I915_GEM_SET_CACHING, &args))
> +	if (ioctl(i915,DRM_IOCTL_I915_GEM_BUSY, &args))
>  		err =3D -errno;
>  	if (err =3D=3D expected)
>  		store_all(i915);
> --
> 2.25.1
