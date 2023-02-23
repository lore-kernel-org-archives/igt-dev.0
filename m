Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992FD10EB38
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 11:26:45 +0000 (UTC)
Date: Thu, 23 Feb 2023 12:26:41 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230223122641.06bda1da@maurocar-mobl2>
In-Reply-To: <20230223105321.49048-2-zbigniew.kempczynski@intel.com>
References: <20230223105321.49048-1-zbigniew.kempczynski@intel.com>
 <20230223105321.49048-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/intel_allocator_*: Use common
 hash helpers
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

On Thu, 23 Feb 2023 11:53:20 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Reduce code duplication by using common hash helpers from igt_map.
>=20
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/intel_allocator_reloc.c  | 23 +-------------------
>  lib/intel_allocator_simple.c | 41 ++----------------------------------
>  2 files changed, 3 insertions(+), 61 deletions(-)
>=20
> diff --git a/lib/intel_allocator_reloc.c b/lib/intel_allocator_reloc.c
> index 60cbb88511..3aa9ebe763 100644
> --- a/lib/intel_allocator_reloc.c
> +++ b/lib/intel_allocator_reloc.c
> @@ -34,27 +34,6 @@ struct intel_allocator_record {
>  /* Keep the low 256k clear, for negative deltas */
>  #define BIAS (256 << 10)
> =20
> -/* 2^31 + 2^29 - 2^25 + 2^22 - 2^19 - 2^16 + 1 */
> -#define GOLDEN_RATIO_PRIME_32 0x9e370001UL
> -
> -/*  2^63 + 2^61 - 2^57 + 2^54 - 2^51 - 2^18 + 1 */
> -#define GOLDEN_RATIO_PRIME_64 0x9e37fffffffc0001ULL
> -
> -static inline uint32_t hash_handles(const void *val)
> -{
> -	uint32_t hash =3D *(uint32_t *) val;
> -
> -	hash =3D hash * GOLDEN_RATIO_PRIME_32;
> -	return hash;
> -}
> -
> -static int equal_handles(const void *a, const void *b)
> -{
> -	uint32_t *key1 =3D (uint32_t *) a, *key2 =3D (uint32_t *) b;
> -
> -	return *key1 =3D=3D *key2;
> -}
> -
>  static void map_entry_free_func(struct igt_map_entry *entry)
>  {
>  	free(entry->data);
> @@ -252,7 +231,7 @@ intel_allocator_reloc_create(int fd, uint64_t start, =
uint64_t end)
> =20
>  	ialr =3D ial->priv =3D calloc(1, sizeof(*ialr));
>  	igt_assert(ial->priv);
> -	ialr->objects =3D igt_map_create(hash_handles, equal_handles);
> +	ialr->objects =3D igt_map_create(igt_map_hash_32, igt_map_equal_32);
>  	ialr->prng =3D (uint32_t) to_user_pointer(ial);
> =20
>  	start =3D max_t(uint64_t, start, BIAS);
> diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
> index 8d5105f114..3d5e45870e 100644
> --- a/lib/intel_allocator_simple.c
> +++ b/lib/intel_allocator_simple.c
> @@ -59,43 +59,6 @@ struct intel_allocator_record {
>  #define simple_vma_foreach_hole_safe_rev(_hole, _heap, _tmp) \
>  	igt_list_for_each_entry_safe_reverse(_hole, _tmp,  &(_heap)->holes, lin=
k)
> =20
> -/* 2^31 + 2^29 - 2^25 + 2^22 - 2^19 - 2^16 + 1 */
> -#define GOLDEN_RATIO_PRIME_32 0x9e370001UL
> -
> -/*  2^63 + 2^61 - 2^57 + 2^54 - 2^51 - 2^18 + 1 */
> -#define GOLDEN_RATIO_PRIME_64 0x9e37fffffffc0001ULL
> -
> -static inline uint32_t hash_handles(const void *val)
> -{
> -	uint32_t hash =3D *(uint32_t *) val;
> -
> -	hash =3D hash * GOLDEN_RATIO_PRIME_32;
> -	return hash;
> -}
> -
> -static int equal_handles(const void *a, const void *b)
> -{
> -	uint32_t *key1 =3D (uint32_t *) a, *key2 =3D (uint32_t *) b;
> -
> -	return *key1 =3D=3D *key2;
> -}
> -
> -static inline uint32_t hash_offsets(const void *val)
> -{
> -	uint64_t hash =3D *(uint64_t *) val;
> -
> -	hash =3D hash * GOLDEN_RATIO_PRIME_64;
> -	/* High bits are more random, so use them. */
> -	return hash >> 32;
> -}
> -
> -static int equal_offsets(const void *a, const void *b)
> -{
> -	uint64_t *key1 =3D (uint64_t *) a, *key2 =3D (uint64_t *) b;
> -
> -	return *key1 =3D=3D *key2;
> -}
> -
>  static void map_entry_free_func(struct igt_map_entry *entry)
>  {
>  	free(entry->data);
> @@ -755,8 +718,8 @@ intel_allocator_simple_create(int fd, uint64_t start,=
 uint64_t end,
>  	ials =3D ial->priv =3D malloc(sizeof(struct intel_allocator_simple));
>  	igt_assert(ials);
> =20
> -	ials->objects =3D igt_map_create(hash_handles, equal_handles);
> -	ials->reserved =3D igt_map_create(hash_offsets, equal_offsets);
> +	ials->objects =3D igt_map_create(igt_map_hash_32, igt_map_equal_32);
> +	ials->reserved =3D igt_map_create(igt_map_hash_64, igt_map_equal_64);
>  	igt_assert(ials->objects && ials->reserved);
> =20
>  	ials->start =3D start;
