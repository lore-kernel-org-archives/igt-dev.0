Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F322C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 12:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EEF10E353;
	Wed, 19 Mar 2025 12:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvyYZg75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C1E10E353
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742388112; x=1773924112;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=vkqeXlcqhG/Q4TgnTVPMSgd/CwVQtOhuEkb6ObVYhCI=;
 b=SvyYZg75E17XLsnIg2gsxH2E/lHtizPfgxEc3b7BeuowOTYjcGl3hW7D
 6OLbvG1ynqBDyZLDKVhfmGvc4UyOeBBz+o75cmtDSqNS2smQtTo0pL+rU
 uDWSIKlZkFypgARBSAgxSIjknzczhMOnvsckMnOSPOApjOT1qZJ68kvug
 +zOmJlHDCXq5Gd73i2Bfu7mlsHZoPjiJ/Ojo4v8QJkGZY0FBWvr+pD/HI
 tsDs68cRWq4gRYyq++g0SQGOwpbvy4Q3MN9mgjxNVA3rOe32uSxHhoaY1
 ybjYVO3cCAvjXAyygRVh5BUvW52D6EHH6+U9mWNlZSRRfwHaY/EjO3NMv Q==;
X-CSE-ConnectionGUID: h4lHZJYdTye0k5wLp2fFyA==
X-CSE-MsgGUID: H/ebOIxDR2K+rZGcVZU4AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43590257"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43590257"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:41:52 -0700
X-CSE-ConnectionGUID: Bpj7VwXnQN+sLYsrDyKv5g==
X-CSE-MsgGUID: OIbJdXimRZeFoD+Nc15yrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="123540524"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.26])
 ([10.245.246.26])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:41:50 -0700
Message-ID: <b7619b7a4a16255b8261155a2c7efdd89b96f4d8.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/5] lib/intel_blt: Promote blt_bo_copy()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Wed, 19 Mar 2025 13:41:37 +0100
In-Reply-To: <20250305090743.16894-2-francois.dugast@intel.com>
References: <20250305090743.16894-1-francois.dugast@intel.com>
 <20250305090743.16894-2-francois.dugast@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, 2025-03-05 at 10:06 +0100, Francois Dugast wrote:
> This function abstracts copy with mem blt. Move it to the library so
> that it can be also be used elsewhere without code duplication.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0lib/intel_blt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 53
> +++++++++++++++++++++++++++++++++++++
> =C2=A0lib/intel_blt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0tests/intel/xe_copy_basic.c | 36 +------------------------
> =C2=A03 files changed, 57 insertions(+), 35 deletions(-)
>=20
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b2fb3151e..84318a557 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1903,6 +1903,59 @@ int blt_mem_copy(int fd, const intel_ctx_t
> *ctx,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/**
> + * blt_bo_copy:
> + * @fd: drm fd
> + * @src_handle: handle of the source BO
> + * @dst_handle: handle of the destination BO
> + * @ctx: intel_ctx_t context
> + * @size: BO size
> + * @width: width
> + * @height: height
> + * @region: memory region
> + *
> + * Copy BO with mem blit from @src_handle into @dst_handle.
> + */
> +void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> const intel_ctx_t *ctx,
> +		 uint32_t size, uint32_t width, uint32_t height,
> uint32_t region)
> +{
> +	struct blt_mem_data mem =3D {};
> +	uint64_t bb_size =3D xe_bb_size(fd, SZ_4K);
> +	uint64_t ahnd =3D intel_allocator_open_full(fd, ctx->vm, 0, 0,
> +						=C2=A0
> INTEL_ALLOCATOR_SIMPLE,
> +						=C2=A0
> ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +	uint8_t src_mocs =3D intel_get_uc_mocs_index(fd);
> +	uint8_t dst_mocs =3D src_mocs;
> +	uint32_t bb;
> +	int result;
> +
> +	bb =3D xe_bo_create(fd, 0, bb_size, region, 0);
> +
> +	blt_mem_init(fd, &mem);
> +	blt_set_mem_object(&mem.src, src_handle, size, 0, width,
> height,
> +			=C2=A0=C2=A0 region, src_mocs, DEFAULT_PAT_INDEX,
> M_LINEAR,
> +			=C2=A0=C2=A0 COMPRESSION_DISABLED);
> +	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width,
> height,
> +			=C2=A0=C2=A0 region, dst_mocs, DEFAULT_PAT_INDEX,
> M_LINEAR,
> +			=C2=A0=C2=A0 COMPRESSION_DISABLED);
> +	mem.src.ptr =3D xe_bo_map(fd, src_handle, size);
> +	mem.dst.ptr =3D xe_bo_map(fd, dst_handle, size);
> +
> +	blt_set_batch(&mem.bb, bb, bb_size, region);
> +	igt_assert(mem.src.width =3D=3D mem.dst.width);
> +
> +	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> +	result =3D memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> +
> +	intel_allocator_bind(ahnd, 0, 0);
> +	munmap(mem.src.ptr, size);
> +	munmap(mem.dst.ptr, size);
> +	gem_close(fd, bb);
> +	put_ahnd(ahnd);
> +
> +	igt_assert_f(!result, "source and destination differ\n");
> +}
> +
> =C2=A0static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct
> blt_mem_data *mem,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t fill_data)
> =C2=A0{
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 5d6191ac9..4357d70eb 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -271,6 +271,9 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
> =C2=A0			 uint64_t ahnd,
> =C2=A0			 const struct blt_mem_data *mem);
> =C2=A0
> +void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> const intel_ctx_t *ctx,
> +		 uint32_t size, uint32_t width, uint32_t height,
> uint32_t region);
> +
> =C2=A0int blt_mem_set(int fd, const intel_ctx_t *ctx,
> =C2=A0			const struct intel_execution_engine2 *e,
> uint64_t ahnd,
> =C2=A0			const struct blt_mem_data *mem, uint8_t
> fill_data);
> diff --git a/tests/intel/xe_copy_basic.c
> b/tests/intel/xe_copy_basic.c
> index a43842e39..458106b0b 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -44,41 +44,7 @@ static void
> =C2=A0mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const
> intel_ctx_t *ctx,
> =C2=A0	 uint32_t size, uint32_t width, uint32_t height, uint32_t
> region)
> =C2=A0{
> -	struct blt_mem_data mem =3D {};
> -	uint64_t bb_size =3D xe_bb_size(fd, SZ_4K);
> -	uint64_t ahnd =3D intel_allocator_open_full(fd, ctx->vm, 0, 0,
> -						=C2=A0
> INTEL_ALLOCATOR_SIMPLE,
> -						=C2=A0
> ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> -	uint8_t src_mocs =3D intel_get_uc_mocs_index(fd);
> -	uint8_t dst_mocs =3D src_mocs;
> -	uint32_t bb;
> -	int result;
> -
> -	bb =3D xe_bo_create(fd, 0, bb_size, region, 0);
> -
> -	blt_mem_init(fd, &mem);
> -	blt_set_mem_object(&mem.src, src_handle, size, 0, width,
> height,
> -			=C2=A0=C2=A0 region, src_mocs, DEFAULT_PAT_INDEX,
> M_LINEAR,
> -			=C2=A0=C2=A0 COMPRESSION_DISABLED);
> -	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width,
> height,
> -			=C2=A0=C2=A0 region, dst_mocs, DEFAULT_PAT_INDEX,
> M_LINEAR,
> -			=C2=A0=C2=A0 COMPRESSION_DISABLED);
> -	mem.src.ptr =3D xe_bo_map(fd, src_handle, size);
> -	mem.dst.ptr =3D xe_bo_map(fd, dst_handle, size);
> -
> -	blt_set_batch(&mem.bb, bb, bb_size, region);
> -	igt_assert(mem.src.width =3D=3D mem.dst.width);
> -
> -	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> -	result =3D memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> -
> -	intel_allocator_bind(ahnd, 0, 0);
> -	munmap(mem.src.ptr, size);
> -	munmap(mem.dst.ptr, size);
> -	gem_close(fd, bb);
> -	put_ahnd(ahnd);
> -
> -	igt_assert_f(!result, "source and destination differ\n");
> +	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width,
> height, region);
> =C2=A0}
> =C2=A0
> =C2=A0/**

