Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44386C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 12:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED67310E353;
	Wed, 19 Mar 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS82bHil";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00CC10E353
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742388143; x=1773924143;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=PX5nijf7fILngOe9gNfwk4wdWs0vgEvAkgf1dr/yJ48=;
 b=dS82bHilwppkdjbnA4dOPF8CWn6tGEk1KKquPh8m73u2999w2y/ex239
 JIqPXIBbxLrCtOX6sYdACUFXYy4OuGR8sqbGUbxCyR0M90S9lykWARIN6
 dudPCxNXYl7ILqbsU03fTXL2Qy/KUWwOzXNj9/AmbW1MRZOeNRzmP4Cb4
 KMUkMzMg5oHdEZG+3i9M4hiHNfoEuoYCdAOyrITrSzsF1BUANlGYrfwSb
 SHAq2E41ddVvE0tzjdHQ4b+yWufppTM9Jd2yBWwLSNcVOObPoYOOD/jcQ
 9nA88wULVgaWR6n9/Hh6mV7OHZCCVXVvDZfwfl26L4QGzbHOiadgKhFqP w==;
X-CSE-ConnectionGUID: WuvnljIEQGyCmi/zrjO5LQ==
X-CSE-MsgGUID: pAXveDyWSO2YO366wLd+WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43590331"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43590331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:42:23 -0700
X-CSE-ConnectionGUID: PLgdBiAFSMG+oZ+pbMKj9g==
X-CSE-MsgGUID: glcibiYFSqi0owtnjWBP2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="123541153"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.26])
 ([10.245.246.26])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:42:21 -0700
Message-ID: <56fc4f363cbcd2fdf21e6db0074e15e86177621f.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/5] lib/intel_blt: Allow forcing multiple runs in
 blt_mem_copy()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Wed, 19 Mar 2025 13:42:19 +0100
In-Reply-To: <20250305090743.16894-3-francois.dugast@intel.com>
References: <20250305090743.16894-1-francois.dugast@intel.com>
 <20250305090743.16894-3-francois.dugast@intel.com>
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
> Allowing to run the same copy multiple times presents no functional
> advantage but it can be used to keep the copy functions busy longer
> while other tests are being performed.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0lib/intel_blt.c | 34 +++++++++++++++++++---------------
> =C2=A0lib/intel_blt.h |=C2=A0 3 ++-
> =C2=A02 files changed, 21 insertions(+), 16 deletions(-)
>=20
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 84318a557..315a2e145 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1815,10 +1815,10 @@ void blt_mem_init(int fd, struct blt_mem_data
> *mem)
> =C2=A0	mem->driver =3D get_intel_driver(fd);
> =C2=A0}
> =C2=A0
> -static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct
> blt_mem_data *mem)
> +static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct
> blt_mem_data *mem, int ncopies)
> =C2=A0{
> =C2=A0	uint64_t dst_offset, src_offset;
> -	int i;
> +	int i, j;
> =C2=A0	uint32_t *batch;
> =C2=A0	uint32_t optype;
> =C2=A0
> @@ -1831,16 +1831,18 @@ static void emit_blt_mem_copy(int fd,
> uint64_t ahnd, const struct blt_mem_data *
> =C2=A0	optype =3D mem->src.type =3D=3D M_MATRIX ? 1 << 17 : 0;
> =C2=A0
> =C2=A0	i =3D 0;
> -	batch[i++] =3D MEM_COPY_CMD | optype;
> -	batch[i++] =3D mem->src.width - 1;
> -	batch[i++] =3D mem->src.height - 1;
> -	batch[i++] =3D mem->src.pitch - 1;
> -	batch[i++] =3D mem->dst.pitch - 1;
> -	batch[i++] =3D src_offset;
> -	batch[i++] =3D src_offset << 32;
> -	batch[i++] =3D dst_offset;
> -	batch[i++] =3D dst_offset << 32;
> -	batch[i++] =3D mem->src.mocs_index << MEM_COPY_MOCS_SHIFT |
> mem->dst.mocs_index;
> +	for (j =3D 0; j < ncopies; j++) {
> +		batch[i++] =3D MEM_COPY_CMD | optype;
> +		batch[i++] =3D mem->src.width - 1;
> +		batch[i++] =3D mem->src.height - 1;
> +		batch[i++] =3D mem->src.pitch - 1;
> +		batch[i++] =3D mem->dst.pitch - 1;
> +		batch[i++] =3D src_offset;
> +		batch[i++] =3D src_offset << 32;
> +		batch[i++] =3D dst_offset;
> +		batch[i++] =3D dst_offset << 32;
> +		batch[i++] =3D mem->src.mocs_index <<
> MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
> +	}
> =C2=A0	batch[i++] =3D MI_BATCH_BUFFER_END;
> =C2=A0
> =C2=A0	munmap(batch, mem->bb.size);
> @@ -1853,6 +1855,7 @@ static void emit_blt_mem_copy(int fd, uint64_t
> ahnd, const struct blt_mem_data *
> =C2=A0 * @e: blitter engine for @ctx
> =C2=A0 * @ahnd: allocator handle
> =C2=A0 * @blt: blitter data for mem-copy.
> + * @ncopies: how many times copy is run, > 1 can be used to stress
> the copy function
> =C2=A0 *
> =C2=A0 * Function does mem blit between @src and @dst described in @blt
> object.
> =C2=A0 *
> @@ -1862,7 +1865,8 @@ static void emit_blt_mem_copy(int fd, uint64_t
> ahnd, const struct blt_mem_data *
> =C2=A0int blt_mem_copy(int fd, const intel_ctx_t *ctx,
> =C2=A0		 const struct intel_execution_engine2 *e,
> =C2=A0		 uint64_t ahnd,
> -		 const struct blt_mem_data *mem)
> +		 const struct blt_mem_data *mem,
> +		 int ncopies)
> =C2=A0{
> =C2=A0	struct drm_i915_gem_execbuffer2 execbuf =3D {};
> =C2=A0	struct drm_i915_gem_exec_object2 obj[3] =3D {};
> @@ -1875,7 +1879,7 @@ int blt_mem_copy(int fd, const intel_ctx_t
> *ctx,
> =C2=A0					=C2=A0 0, mem->dst.pat_index);
> =C2=A0	bb_offset =3D get_offset(ahnd, mem->bb.handle, mem->bb.size,
> 0);
> =C2=A0
> -	emit_blt_mem_copy(fd, ahnd, mem);
> +	emit_blt_mem_copy(fd, ahnd, mem, ncopies);
> =C2=A0
> =C2=A0	if (mem->driver =3D=3D INTEL_DRIVER_XE) {
> =C2=A0		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> @@ -1944,7 +1948,7 @@ void blt_bo_copy(int fd, uint32_t src_handle,
> uint32_t dst_handle, const intel_c
> =C2=A0	blt_set_batch(&mem.bb, bb, bb_size, region);
> =C2=A0	igt_assert(mem.src.width =3D=3D mem.dst.width);
> =C2=A0
> -	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> +	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, 1);
> =C2=A0	result =3D memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> =C2=A0
> =C2=A0	intel_allocator_bind(ahnd, 0, 0);
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 4357d70eb..217cade02 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -269,7 +269,8 @@ void blt_mem_init(int fd, struct blt_mem_data
> *mem);
> =C2=A0int blt_mem_copy(int fd, const intel_ctx_t *ctx,
> =C2=A0			 const struct intel_execution_engine2 *e,
> =C2=A0			 uint64_t ahnd,
> -			 const struct blt_mem_data *mem);
> +			 const struct blt_mem_data *mem,
> +			 int ncopies);
> =C2=A0
> =C2=A0void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> const intel_ctx_t *ctx,
> =C2=A0		 uint32_t size, uint32_t width, uint32_t height,
> uint32_t region);

