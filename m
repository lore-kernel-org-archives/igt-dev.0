Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A891B10EA7F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 07:26:02 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Srivastava, Vikas" <vikas.srivastava@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>
Date: Wed, 19 Oct 2022 07:25:53 +0000
Message-ID: <DM6PR11MB44929940DA19092E724182B68D2B9@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20221017075822.2655487-1-vikas.srivastava@intel.com>
In-Reply-To: <20221017075822.2655487-1-vikas.srivastava@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Avoid caching ioctl during fork
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Yang,
 Fei" <fei.yang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add original author in the signed-off along with yours.
After that change.
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> vikassri07
> Sent: 17 October 2022 01:28 PM
> To: igt-dev@lists.freedesktop.org; Wilson, Chris P
> <chris.p.wilson@intel.com>
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Yang, Fei
> <fei.yang@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] Avoid caching ioctl during fork
>=20
>     Both gem_exec_flush and gem_ctx_engines require the SET_CACHING
> ioctl
>     for some subtests.  The ioctl itself, called by gem_set_caching, is
>     wrapped in an igt_require, forcing a skip when the ioctl fails.  MTL
>     currently fails this check with -EOPNOTSUPP 100% of the time.
>=20
>     Normally, the ioctl failing and causing a test skip wouldn't be a
>     problem.  Howerver, the failing call to the ioctl is made within a
>     forked child process in some cases, which causes an error to occur.  =
By
>     checking whether or not caching is supported before these cases occur=
,
>     the resulting error can be downgraded to a graceful skip.
>=20
>     v2: The gem_ctx_engines subtest does not require using gem_set_cachin=
g
>     if the domain is moved from CPU to WC, so the ioctl was removed from
>     the execution path.
>     v3: Replace gem_mmap__cpu with gem_mmap__device_coherent instead
> of
>     gem_mmap__wc in gem_ctx_engines.c
>     v4: Fix formatting
>=20
>     References: VLK-34086
>     Signed-off-by: vikas.srivastava <vikas.srivastava@intel.com>
>     CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
>     CC: Fei Yang <fei.yang@intel.com>
>     CC: Chris Wilson <chris.p.wilson@intel.com>
>=20
> ---
>  tests/i915/gem_ctx_engines.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index b0646516..e9cc25d6 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -492,12 +492,10 @@ static void independent(int i915, const intel_ctx_t
> *base_ctx,
>  	}
>  	param.ctx_id =3D gem_context_create(i915);
>  	gem_context_set_param(i915, &param);
> -
> -	if (!gem_has_lmem(i915))
> -		gem_set_caching(i915, results.handle,
> I915_CACHING_CACHED);
> -	map =3D gem_mmap__cpu(i915, results.handle, 0, 4096, PROT_READ);
> +
> +	map =3D gem_mmap__device_coherent(i915, results.handle, 0, 4096,
> +PROT_READ);
>  	gem_set_domain(i915, results.handle,
> -		       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> +		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>=20
>  	for (int i =3D 0; i < I915_EXEC_RING_MASK + 1; i++) {
>  		struct drm_i915_gem_exec_object2 obj[2] =3D { @@ -515,8
> +513,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
>  		uint32_t *cs;
>  		int j =3D 0;
>=20
> -		cs =3D gem_mmap__cpu(i915, obj[1].handle, 0, 4096,
> PROT_WRITE);
> -
> +		cs =3D gem_mmap__device_coherent(i915, obj[1].handle, 0,
> 4096,
> +PROT_WRITE);
>  		cs[j] =3D 0x24 << 23 | 1; /* SRM */
>  		if (has_64bit_reloc)
>  			cs[j]++;
> --
> 2.25.1
