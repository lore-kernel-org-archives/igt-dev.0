Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C916510EB38
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 11:26:59 +0000 (UTC)
Date: Thu, 23 Feb 2023 12:26:55 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230223122655.0ada0cf4@maurocar-mobl2>
In-Reply-To: <20230223105321.49048-3-zbigniew.kempczynski@intel.com>
References: <20230223105321.49048-1-zbigniew.kempczynski@intel.com>
 <20230223105321.49048-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/i915/gem_create: Use hash
 helper for gem bo pool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 23 Feb 2023 11:53:21 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Remove local 64-bit hash and use common one defined in igt_map.
>=20
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/i915/gem_create.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/lib/i915/gem_create.c b/lib/i915/gem_create.c
> index 1f9b7fcc01..99c839d7db 100644
> --- a/lib/i915/gem_create.c
> +++ b/lib/i915/gem_create.c
> @@ -252,15 +252,6 @@ void gem_pool_dump(void)
>  	pthread_mutex_unlock(&pool_mutex);
>  }
> =20
> -#define GOLDEN_RATIO_PRIME_64 0x9e37fffffffc0001ULL
> -static inline uint32_t hash_pool(const void *val)
> -{
> -	uint64_t hash =3D *(uint64_t *) val;
> -
> -	hash =3D hash * GOLDEN_RATIO_PRIME_64;
> -	return hash >> 32;
> -}
> -
>  static int equal_pool(const void *a, const void *b)
>  {
>  	struct pool_list *p1 =3D (struct pool_list *) a;
> @@ -356,7 +347,7 @@ void gem_pool_init(void)
>  {
>  	pthread_mutex_init(&pool_mutex, NULL);
>  	__destroy_pool(pool, &pool_mutex);
> -	pool =3D igt_map_create(hash_pool, equal_pool);
> +	pool =3D igt_map_create(igt_map_hash_64, equal_pool);
>  }
> =20
>  igt_constructor {
