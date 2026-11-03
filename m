Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511D606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=gdB/ryGN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A3B10E19C;
	Tue,  3 Nov 2026 06:47:38 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299610F3A2
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 06:46:33 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A36cd4u2269569
 for <igt-dev@lists.freedesktop.org>; Tue, 3 Nov 2026 06:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=s
 lWOECsHWGXhZsZ6oz5UlEacsA6fcmTaL0NP0fZaVU0=; b=gdB/ryGNvYbpyUT5Y
 BbuZROr6VthwAeLZtuD2rcp2Eicpk4qIGhwvftx09oPhjNk2IFg/3BrpcBytaG7S
 jwT8Y1MW+JySDanfDyrePp002vmNQI14Zc9m45FPaCRd2eHZt4F0vRW+fF+4p3Ti
 rpUa9UKdVjNv5XEXuFFjdBzfexGHRWuudVUdGtBwB7QXPV2aPNyQIOSEe9vZNjrj
 6lgkogskgIPkfOnLkc8emjw4sh+rJrGZMEmDOo5WswnTq4rdQj+AS9nojNxmwKZn
 2sGWruJIzZ4wuOAEFvosZcqSW2wJ87LhIY4nTFAVH0DjodW8JNkjRGblMu0QwOpc
 XlPiA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99wj7m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2026 06:46:32 +0000 (GMT)
Received: from np-a-belle.kl.imgtec.org (172.25.6.177) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:46:30 +0000
Message-ID: <19ad3c6d8360aa6297ab270e77ed3cc4cf23ce81.camel@imgtec.com>
Subject: Re: [PATCH i-g-t v2 1/3] lib/igt_pvr: Update general heap
 allocation interface to pass flags
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>, "Development mailing list for
 IGT GPU Tools" <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>
Date: Tue, 3 Nov 2026 06:46:30 +0000
In-Reply-To: <20261029-b4-render_update-v2-1-b3185bbe8091@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
 <20261029-b4-render_update-v2-1-b3185bbe8091@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNiBTYWx0ZWRfX8plqzSAXhEf3
 9a9/KE53pjOgneX7sMVeaxWMw/UYtD5/0bwX8sBf3Ou6hoQPWp9B81/iE5mlztgv+cDTyxfvq25
 3Lt474MaEHh8EaemXHvl1DHo+ttnDtAYblE2iACFckef9LQ3SVXiSgKEFIwi+RyWmSk0OMRcscs
 OKU7aW8B8k7JpR11sP34Kgng5LNabZhNnAFIviVoJ2vUx3W0FwdP0xN6Pixpbpw0+lD3I2p7UMs
 pKvQps9NBbrkBIHCEzbLeg+k66bHzNsZ/X3PQYIwKYgfigtRx3ROW9iAtAf0UTnHCCJqF0Y3cNg
 pxXP6tCHD4ekX4lqPkyEASondJZADGGszL6+BaWmiMbu98kll3fC81IWdJWwzD9th2WdBomqe0E
 /Dbr3eQHrbDHilcDeHuJuHf4zYLUIdT96TLPhmSGrlZzWN1bw9oGnXsgNbNgnxJu6+Zm9o/eptn
 7u/TxNoiLFrj7JMGT4Q==
X-Proofpoint-ORIG-GUID: syn5jE3Ah6AxznqoIL_VF3wM4gblsNch
X-Proofpoint-GUID: syn5jE3Ah6AxznqoIL_VF3wM4gblsNch
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6ae98348 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=OfEzzV-AryabSNTlh6sA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNiBTYWx0ZWRfX3Fg/DZzYPmth
 J4Q9hlGIfZrUeZgPqWpXIY1M2gwCm1d4kV61hRKjbmHY5sFUemVNGmb55lwbzjD4/vsJfMggKL3
 9rYFJ48SspszfagVcs3AHK/CkjMdEDk=
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-29 at 18:03 +0530, Brajesh Gupta wrote:
> Update igt_pvr_allocate_general() interface to pass flags for allocation.
>=20
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>

Only a minor nit below.

Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>

> ---
>  lib/igt_pvr.c                       | 39 ++++++++++++++++++++++++-------=
------
>  lib/igt_pvr.h                       |  3 ++-
>  tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
>  3 files changed, 37 insertions(+), 18 deletions(-)
>=20
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 799852da5..22b0c2775 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -397,9 +397,10 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum d=
rm_pvr_ctx_type type,
>  	switch (type) {
>  	case DRM_PVR_CTX_TYPE_RENDER:
>  		create_context_args.callstack_addr =3D
> -			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
> -								      vm_ctx_handle,
> -								      POWERVR_GPU_PAGE_SIZE));
> +			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx_handle,

nit: I'd not move `vm_ctx_handle`.

> +								      POWERVR_GPU_PAGE_SIZE,
> +								      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +								      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  		create_context_args.static_context_state =3D to_user_pointer(init_rend=
er_context_stream);
>  		create_context_args.static_context_state_len =3D
>  			init_render_context_state_stream(init_render_context_stream);
> @@ -673,17 +674,15 @@ struct igt_pvr_allocation *igt_pvr_allocate(int fd,=
 uint32_t vm_ctx, size_t size
>   * @fd: The file descriptor of the DRM device.
>   * @vm_ctx: The virtual memory context.
>   * @size: The size of the allocation.
> + * @flags: Allocation flags.
>   *
>   * Function to allocate and map GPU memory from the general heap.
>   *
>   * Returns: Pointer to the allocation structure.
>   */
> -struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_=
ctx, size_t size)
> +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_=
ctx, size_t size, uint64_t flags)
>  {
> -	return igt_pvr_allocate(fd, vm_ctx, size,
> -				DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> -				DRM_PVR_BO_BYPASS_DEVICE_CACHE,
> -				DRM_PVR_HEAP_GENERAL);
> +	return igt_pvr_allocate(fd, vm_ctx, size, flags, DRM_PVR_HEAP_GENERAL);
>  }
> =20
>  /**
> @@ -817,11 +816,17 @@ static void igt_pvr_create_hwrt_geom_data_args(int =
fd, uint32_t vm_ctx,
>  					       *geom_data_args)
>  {
>  	geom_data_args->rtc_dev_addr =3D
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	geom_data_args->tpc_dev_addr =3D
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	geom_data_args->vheap_table_dev_addr =3D
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	geom_data_args->tpc_size =3D POWERVR_GPU_PAGE_SIZE;
>  	geom_data_args->tpc_stride =3D 0x1;
>  }
> @@ -839,11 +844,17 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd=
, uint32_t vm_ctx,
>  					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
>  {
>  	rt_data_args->pm_mlist_dev_addr =3D
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	rt_data_args->macrotile_array_dev_addr =3D
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	rt_data_args->region_header_dev_addr =3D
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  }
> =20
>  /**
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index b6e3dd676..bed02f968 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -67,7 +67,8 @@ struct igt_pvr_allocation *igt_pvr_allocate_addr(int fd=
, uint32_t vm_ctx, size_t
>  						 uint64_t flags, uint64_t gpu_addr);
>  struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, siz=
e_t size, uint64_t flags,
>  					    uint32_t heap_index);
> -struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_=
ctx, size_t size);
> +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_=
ctx, size_t size,
> +					    uint64_t flags);
>  void *igt_pvr_get_cpu_addr(int fd, struct igt_pvr_allocation *alloc);
>  uint64_t igt_pvr_get_gpu_addr(struct igt_pvr_allocation *alloc);
>  size_t igt_pvr_get_size(struct igt_pvr_allocation *alloc);
> diff --git a/tests/imagination/pvr_submit_jobs.c b/tests/imagination/pvr_=
submit_jobs.c
> index 566f9d2b2..21ccb03fd 100644
> --- a/tests/imagination/pvr_submit_jobs.c
> +++ b/tests/imagination/pvr_submit_jobs.c
> @@ -52,7 +52,10 @@ static uint32_t init_compute_cmd_stream(int fd, uint32=
_t vm_ctx,
>  	void *cdm_stream_map;
>  	uint32_t stream_length;
> =20
> -	struct igt_pvr_allocation *cdm_stream_alloc =3D igt_pvr_allocate_genera=
l(fd, vm_ctx, 0x1000);
> +	struct igt_pvr_allocation *cdm_stream_alloc =3D
> +		igt_pvr_allocate_general(fd, vm_ctx, 0x1000,
> +				         DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +				         DRM_PVR_BO_BYPASS_DEVICE_CACHE);
> =20
>  	cdm_stream_gpu_addr =3D igt_pvr_get_gpu_addr(cdm_stream_alloc);
> =20
> @@ -212,14 +215,18 @@ int igt_main()
>  		pds_buffer_base[0x20] =3D pds_inst_encode_halt();
> =20
>  		vdm_alloc =3D
> -			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
> +						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +						 DRM_PVR_BO_BYPASS_DEVICE_CACHE);
> =20
>  		vdm_buffer =3D igt_pvr_get_cpu_addr(fd, vdm_alloc);
> =20
>  		size =3D PVR_BO_SIZE;
> =20
>  		ppp_alloc =3D
> -			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
> +						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +						 DRM_PVR_BO_BYPASS_DEVICE_CACHE);
> =20
>  		ppp_buffer_base =3D igt_pvr_get_cpu_addr(fd, ppp_alloc);
> =20
>=20

