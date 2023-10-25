Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204ED10E554
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 05:56:23 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Date: Wed, 25 Oct 2023 05:56:18 +0000
Message-ID: <MW3PR11MB4748128D31F08CD3A38006A3AEDEA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231025022050.14282-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231025022050.14282-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_copy_basic: Fix
 validating the mem set values.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM,
Reviewed-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> sai.gowtham.ch@intel.com
> Sent: Wednesday, October 25, 2023 7:51 AM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_copy_basic: Fix validatin=
g the
> mem set values.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Avoid crash by memory un mapping the dst.ptr after validating the set
> values.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c in=
dex
> 059c54488..fe78ac50f 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -113,13 +113,14 @@ mem_set(int fd, uint32_t dst_handle, const
> intel_ctx_t *ctx, uint32_t size,
>  	result =3D (uint8_t *)mem.dst.ptr;
>=20
>  	intel_allocator_bind(ahnd, 0, 0);
> -	munmap(mem.dst.ptr, size);
>  	gem_close(fd, bb);
>  	put_ahnd(ahnd);
>=20
>  	igt_assert(result[0] =3D=3D fill_data);
>  	igt_assert(result[width - 1] =3D=3D fill_data);
>  	igt_assert(result[width] !=3D fill_data);
> +
> +	munmap(mem.dst.ptr, size);
>  }
>=20
>  static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint=
32_t
> region)
> --
> 2.39.1
