Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A96EC35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 12:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D26010E4F3;
	Wed, 19 Mar 2025 12:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4OJRpdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B673510E4F3
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742388401; x=1773924401;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=RnWvLnC9yqWUMF0WsYTp2JhD/T12iey1DJkDd/G1QQ4=;
 b=V4OJRpdXUjXK/qtUKzeZo2ajaFyBJK3BtKIUCON5+YhywF5U3tqPv5Ax
 rUA6U994imavry+ZQX090tML4R92KwOps35PtZwYEMloqSCKhyVGfLTwm
 dSM4L/O9KEg4rHKKkrNYtG3vgu6wjLnLIrjra0gryI0IHIGccfslDKUz4
 w7GvhUT6MzNHYcdcteonojrYzsG2/x1i4SoD+hOvP+seA2TrW/PVcorWG
 VTtSX9Peks8zcZ+3M+D7xclyiE14H1SqZpbhNL/LImOhuHNjZsvSAA310
 AuZsC6X5p5eoNO5wg9twDXriri9KEiaq+8AW6qItIjsOloLpW4mjm8CEv g==;
X-CSE-ConnectionGUID: UcHxfX4cR4mzohofX8fZpQ==
X-CSE-MsgGUID: 52JAxt+jT7W6/FZFEGYF8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43496579"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43496579"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:46:40 -0700
X-CSE-ConnectionGUID: EEQayLm3Tciz3oL7pDdHAg==
X-CSE-MsgGUID: FJcREwHGT1ivzm6nm5tacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="123356277"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.26])
 ([10.245.246.26])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:46:37 -0700
Message-ID: <64ae230cc3358e1c750bc5749aa3f3bbeaba6092.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 3/5] lib/intel_blt: Use blt_mem_copy() to stress
 copy functions
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Wed, 19 Mar 2025 13:46:32 +0100
In-Reply-To: <20250305090743.16894-4-francois.dugast@intel.com>
References: <20250305090743.16894-1-francois.dugast@intel.com>
 <20250305090743.16894-4-francois.dugast@intel.com>
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
> The new blt_mem_copy() argument ncopies is handed over to the
> underlying function blt_bo_copy() which actually runs the copy,

Hmm. I'm confused by this commit message. Isn't it blt_mem_copy() that
actually performs the copy?

>  so
> that the caller of blt_mem_copy() can use a higher level function
> to stress the hardware copy function.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Otherwise LGTM.
/Thomas

> ---
> =C2=A0lib/intel_blt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A0lib/intel_blt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0tests/intel/xe_copy_basic.c | 2 +-
> =C2=A03 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 315a2e145..5cdf1ea8d 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1917,11 +1917,12 @@ int blt_mem_copy(int fd, const intel_ctx_t
> *ctx,
> =C2=A0 * @width: width
> =C2=A0 * @height: height
> =C2=A0 * @region: memory region
> + * @ncopies: how many times copy is run, > 1 can be used to stress
> the copy function
> =C2=A0 *
> =C2=A0 * Copy BO with mem blit from @src_handle into @dst_handle.
> =C2=A0 */
> =C2=A0void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> const intel_ctx_t *ctx,
> -		 uint32_t size, uint32_t width, uint32_t height,
> uint32_t region)
> +		 uint32_t size, uint32_t width, uint32_t height,
> uint32_t region, int ncopies)
> =C2=A0{
> =C2=A0	struct blt_mem_data mem =3D {};
> =C2=A0	uint64_t bb_size =3D xe_bb_size(fd, SZ_4K);
> @@ -1948,7 +1949,7 @@ void blt_bo_copy(int fd, uint32_t src_handle,
> uint32_t dst_handle, const intel_c
> =C2=A0	blt_set_batch(&mem.bb, bb, bb_size, region);
> =C2=A0	igt_assert(mem.src.width =3D=3D mem.dst.width);
> =C2=A0
> -	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, 1);
> +	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, ncopies);
> =C2=A0	result =3D memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> =C2=A0
> =C2=A0	intel_allocator_bind(ahnd, 0, 0);
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 217cade02..86681f1dd 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -273,7 +273,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
> =C2=A0			 int ncopies);
> =C2=A0
> =C2=A0void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> const intel_ctx_t *ctx,
> -		 uint32_t size, uint32_t width, uint32_t height,
> uint32_t region);
> +		 uint32_t size, uint32_t width, uint32_t height,
> uint32_t region, int ncopies);
> =C2=A0
> =C2=A0int blt_mem_set(int fd, const intel_ctx_t *ctx,
> =C2=A0			const struct intel_execution_engine2 *e,
> uint64_t ahnd,
> diff --git a/tests/intel/xe_copy_basic.c
> b/tests/intel/xe_copy_basic.c
> index 458106b0b..20926cbb7 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -44,7 +44,7 @@ static void
> =C2=A0mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const
> intel_ctx_t *ctx,
> =C2=A0	 uint32_t size, uint32_t width, uint32_t height, uint32_t
> region)
> =C2=A0{
> -	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width,
> height, region);
> +	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width,
> height, region, 1);
> =C2=A0}
> =C2=A0
> =C2=A0/**

