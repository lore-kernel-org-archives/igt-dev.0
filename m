Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6F9CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CF210E8A5;
	Thu,  6 Nov 2025 11:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiXEIqTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937F710E8A5
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762429504; x=1793965504;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dq9kkm/uyrx8TtFXLlRo02gJWN3+2hglfq3nBeOaSBE=;
 b=jiXEIqTSpM7ikXWvAbTU9GnNT5ercBQJLYfVhheNaTIgM6WaNekBCKEL
 RhFr/rTKqvxb8wgK2DcCUN/SbFY955ewlM7UkmKWtCIj3bBIN8jlFcAoM
 l3zUJUEhz1/6I74V4yI+kOaW4+9V6/TYrJSjNxqzH/s/4PB6JIaPEAAFQ
 WssEESlZQZKXVNfVkfnO00IuULiu+dXjfNDG5azBB+6RbSeY+BkaeU2wJ
 OZfwRJp8l2y3hKQT/eAn3wxIIucPCfF2JMKz1Iu+OqB2ThCVPCW/ZHpA2
 Fa6A7QQI0j4XaPq9QimBNxTXrF2XlSsz0jpoGaMfhNeaPUN0YHKHZoyD4 A==;
X-CSE-ConnectionGUID: JRn6Dv1nTxm/dukpCUftAA==
X-CSE-MsgGUID: ZrNEUfdjTxGgu4RIE6XRkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75249040"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75249040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:45:03 -0800
X-CSE-ConnectionGUID: DxST8G9IQnm2yTw+2zYQHA==
X-CSE-MsgGUID: 3dhWlW+OQ1KoSFeoZjgMVA==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.174])
 ([10.245.244.174])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:45:02 -0800
Message-ID: <13bce67cabfae0c51f68a998ac1ddf8a9611bffe.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_peer2peer: gracefully
 handle ENOTSUP
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sanjay Yadav
 <sanjay.kumar.yadav@intel.com>
Date: Thu, 06 Nov 2025 12:45:00 +0100
In-Reply-To: <20251105115132.97222-4-matthew.auld@intel.com>
References: <20251105115132.97222-3-matthew.auld@intel.com>
 <20251105115132.97222-4-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Wed, 2025-11-05 at 11:51 +0000, Matthew Auld wrote:
> Currently this blows up on the multi-dGPU setup we have in CI when
> importing the VRAM from one device into the other via dma-buf, due
> the
> P2P internals reporting this as unsupported on this machine. Trying
> to
> manually white list the hostbridge device on the P2P side is also
> unsuccessful since the read side test fails due to a data mismatch
> when
> reading from the exported VRAM. There are also no hangs or errors in
> dmesg although strangely the write side test passes. So it appears
> that
> the direction of the copy is broken when reading the exported VRAM
> from
> the importer side. Manually disabling/enabling iommu also make no
> difference. And finally hacking the test to force same device
> import/export makes the test pass, which should rule out any kind of
> test defect. With that gracefully skip running the VRAM import
> subtests
> if this is reported as unsupported by the kernel.
>=20
> v2 (Kamil & Sanjay)
> =C2=A0 - s/ENOSUP/ENOTSUP/ in commit title
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6433
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1173
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0tests/intel/xe_peer2peer.c | 39 ++++++++++++++++++++++++++---------=
-
> --
> =C2=A01 file changed, 27 insertions(+), 12 deletions(-)
>=20
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> index b777d2b66..70374e56d 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -116,11 +116,24 @@ static void test_read(struct gpu_info *ex_gpu,
> struct gpu_info *im_gpu,
> =C2=A0	uint32_t im_xe =3D im_gpu->fd;
> =C2=A0	uint32_t ex_src, dmabuf;
> =C2=A0	uint32_t stride;
> -
> =C2=A0	struct drm_xe_engine_class_instance inst =3D {
> =C2=A0		.engine_class =3D DRM_XE_ENGINE_CLASS_COPY,
> =C2=A0	};
> =C2=A0	intel_ctx_t *ctx;
> +	int err;
> +
> +	blt_copy_init(ex_xe, &ex_blt);
> +	src =3D blt_create_object(&ex_blt, ex_reg, width, height, bpp,
> 0,
> +				T_LINEAR, COMPRESSION_DISABLED, 0,
> true);
> +
> +	dmabuf =3D prime_handle_to_fd(ex_xe, src->handle);
> +	err =3D __prime_fd_to_handle(im_xe, dmabuf, &ex_src);
> +	if (err =3D=3D -ENOTSUP) {
> +		blt_destroy_object(ex_xe, src);
> +		igt_assert(ex_reg !=3D system_memory(ex_xe));
> +		igt_skip("P2P VRAM import not supported on this
> device, skipping.\n");
> +	}
> +	igt_assert(!err);
> =C2=A0
> =C2=A0	vm =3D xe_vm_create(im_xe, 0, 0);
> =C2=A0	exec_queue =3D xe_exec_queue_create(im_xe, vm, &inst, 0);
> @@ -129,17 +142,12 @@ static void test_read(struct gpu_info *ex_gpu,
> struct gpu_info *im_gpu,
> =C2=A0					 INTEL_ALLOCATOR_SIMPLE,
> =C2=A0					 ALLOC_STRATEGY_LOW_TO_HIGH,
> 0);
> =C2=A0
> -	blt_copy_init(ex_xe, &ex_blt);
> =C2=A0	blt_copy_init(im_xe, &im_blt);
> =C2=A0
> -	src =3D blt_create_object(&ex_blt, ex_reg, width, height, bpp,
> 0,
> -				T_LINEAR, COMPRESSION_DISABLED, 0,
> true);
> =C2=A0	dst =3D blt_create_object(&im_blt, im_reg, width, height, bpp,
> 0,
> =C2=A0				T_LINEAR, COMPRESSION_DISABLED, 0,
> true);
> =C2=A0	blt_surface_fill_rect(ex_xe, src, width, height);
> =C2=A0
> -	dmabuf =3D prime_handle_to_fd(ex_xe, src->handle);
> -	ex_src =3D prime_fd_to_handle(im_xe, dmabuf);
> =C2=A0	im_src =3D calloc(1, sizeof(*im_src));
> =C2=A0
> =C2=A0	stride =3D width * 4;
> @@ -198,11 +206,23 @@ static void test_write(struct gpu_info *ex_gpu,
> struct gpu_info *im_gpu,
> =C2=A0	uint32_t im_xe =3D im_gpu->fd;
> =C2=A0	uint32_t ex_dst, dmabuf;
> =C2=A0	uint32_t stride;
> -
> =C2=A0	struct drm_xe_engine_class_instance inst =3D {
> =C2=A0		.engine_class =3D DRM_XE_ENGINE_CLASS_COPY,
> =C2=A0	};
> =C2=A0	intel_ctx_t *ctx;
> +	int err;
> +
> +	blt_copy_init(ex_xe, &ex_blt);
> +	dst =3D blt_create_object(&ex_blt, ex_reg, width, height, bpp,
> 0,
> +				T_LINEAR, COMPRESSION_DISABLED, 0,
> true);
> +	dmabuf =3D prime_handle_to_fd(ex_xe, dst->handle);
> +	err =3D __prime_fd_to_handle(im_xe, dmabuf, &ex_dst);
> +	if (err =3D=3D -ENOTSUP) {
> +		blt_destroy_object(ex_xe, dst);
> +		igt_assert(ex_reg !=3D system_memory(ex_xe));
> +		igt_skip("P2P VRAM import not supported on this
> device, skipping.\n");
> +	}
> +	igt_assert(!err);
> =C2=A0
> =C2=A0	vm =3D xe_vm_create(im_xe, 0, 0);
> =C2=A0	exec_queue =3D xe_exec_queue_create(im_xe, vm, &inst, 0);
> @@ -211,17 +231,12 @@ static void test_write(struct gpu_info *ex_gpu,
> struct gpu_info *im_gpu,
> =C2=A0					 INTEL_ALLOCATOR_SIMPLE,
> =C2=A0					 ALLOC_STRATEGY_LOW_TO_HIGH,
> 0);
> =C2=A0
> -	blt_copy_init(ex_xe, &ex_blt);
> =C2=A0	blt_copy_init(im_xe, &im_blt);
> =C2=A0
> -	dst =3D blt_create_object(&ex_blt, ex_reg, width, height, bpp,
> 0,
> -				T_LINEAR, COMPRESSION_DISABLED, 0,
> true);
> =C2=A0	src =3D blt_create_object(&im_blt, im_reg, width, height, bpp,
> 0,
> =C2=A0				T_LINEAR, COMPRESSION_DISABLED, 0,
> true);
> =C2=A0	blt_surface_fill_rect(im_xe, src, width, height);
> =C2=A0
> -	dmabuf =3D prime_handle_to_fd(ex_xe, dst->handle);
> -	ex_dst =3D prime_fd_to_handle(im_xe, dmabuf);
> =C2=A0	im_dst =3D calloc(1, sizeof(*im_dst));
> =C2=A0
> =C2=A0	stride =3D width * 4;

