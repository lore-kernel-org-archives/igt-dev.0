Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A50810EB37
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 11:26:30 +0000 (UTC)
Date: Thu, 23 Feb 2023 12:26:26 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230223122626.74b37eab@maurocar-mobl2>
In-Reply-To: <20230223105321.49048-1-zbigniew.kempczynski@intel.com>
References: <20230223105321.49048-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_map: Add 32-bit and 64-bit
 hash helper functions
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

On Thu, 23 Feb 2023 11:53:19 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Creating igt_map requires hashing and comparing function. Common case
> is using 32-bit (like fd, etc.) or 64-bit keys (offsets) so adding
> such helpers reduces code duplication.
>=20
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_map.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_map.h |  5 +++++
>  2 files changed, 64 insertions(+)
>=20
> diff --git a/lib/igt_map.c b/lib/igt_map.c
> index da8713a186..ffa1e6beaa 100644
> --- a/lib/igt_map.c
> +++ b/lib/igt_map.c
> @@ -196,6 +196,7 @@ igt_map_search(struct igt_map *map, const void *key)
>   * Returns: map entry or %NULL if no entry is found.
>   * Note that the data pointer may be modified by the user.
>   */
> +
>  struct igt_map_entry *
>  igt_map_search_entry(struct igt_map *map, const void *key)
>  {
> @@ -500,3 +501,61 @@ igt_map_random_entry(struct igt_map *map,
> =20
>  	return NULL;
>  }
> +
> +#define GOLDEN_RATIO_PRIME_32 0x9e370001UL
> +/**
> + * igt_map_hash_32:
> + * @key: pointer to 32-bit key
> + *
> + * Function is hashing function for 32-bit keys. Key is pointer to 32-bit
> + * value so it must be dereferenced.
> + */
> +uint32_t igt_map_hash_32(const void *key)
> +{
> +	uint32_t hash =3D *(uint32_t *)key;
> +
> +	hash =3D hash * GOLDEN_RATIO_PRIME_32;
> +	return hash;
> +}
> +
> +/**
> + * igt_map_equal_32:
> + * @key1: pointer to first 32-bit key
> + * @key2: pointer to second 32-bit key
> + *
> + * Function compares 32-bit keys.
> + */
> +int igt_map_equal_32(const void *key1, const void *key2)
> +{
> +	return *(uint32_t *)key1 =3D=3D *(uint32_t *)key2;
> +}
> +
> +/*  2^63 + 2^61 - 2^57 + 2^54 - 2^51 - 2^18 + 1 */
> +#define GOLDEN_RATIO_PRIME_64 0x9e37fffffffc0001ULL
> +/**
> + * igt_map_hash_64:
> + * @key: pointer to 64-bit key
> + *
> + * Function is hashing function for 64-bit keys. Key is pointer to 64-bit
> + * value so it must be dereferenced.
> + */
> +uint32_t igt_map_hash_64(const void *key)
> +{
> +	uint64_t hash =3D *(uint64_t *)key;
> +
> +	hash =3D hash * GOLDEN_RATIO_PRIME_64;
> +	/* High bits are more random, so use them. */
> +	return hash >> 32;
> +}
> +
> +/**
> + * igt_map_equal_64:
> + * @key1: pointer to first 64-bit key
> + * @key2: pointer to second 64-bit key
> + *
> + * Function compares 64-bit keys.
> + */
> +int igt_map_equal_64(const void *key1, const void *key2)
> +{
> +	return *(uint64_t *)key1 =3D=3D *(uint64_t *)key2;
> +}
> diff --git a/lib/igt_map.h b/lib/igt_map.h
> index cadcd6e35f..a0fbd1419f 100644
> --- a/lib/igt_map.h
> +++ b/lib/igt_map.h
> @@ -171,4 +171,9 @@ igt_map_insert_pre_hashed(struct igt_map *map,
>  			     uint32_t hash,
>  			     const void *key, void *data);
> =20
> +uint32_t igt_map_hash_32(const void *key);
> +int igt_map_equal_32(const void *key1, const void *key2);
> +uint32_t igt_map_hash_64(const void *key);
> +int igt_map_equal_64(const void *key1, const void *key2);
> +
>  #endif
