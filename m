Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF854606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 06:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=xkn6Oo/W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8748310E40C;
	Tue,  3 Nov 2026 06:48:35 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80E10E19C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 06:46:58 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A35LbiS2131545
 for <igt-dev@lists.freedesktop.org>; Tue, 3 Nov 2026 06:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=c
 gGHbFFbuFQ/GqnySct+/sZ2JF2ZDCKWu6P7FsU6r8w=; b=xkn6Oo/Wu6jvrmQo4
 jokhDyr+CqCKPFPZYbdiubtCt/JOkJkX0JTxsCR2APcGguNv5WK1lYS/KDp5TuzJ
 mMqoRjJ14aP4Pu28NdrwJsI37rNSnxpKdj4TmMpRszMg70eHWnhp2e3eC5u0pBgV
 8E6DE9R9G8TlFKzHBAL00nib69XZobsGZdIV3MfEcYpot4SrYQHlq7ic73MS/xgL
 +qZVskgds3eN5RFlwm86PP2gEBsfaYNVzW2E3k4lGXIDalh6adedkAp9TZPdLgQw
 CIUy35m/Zi4j2HxJR8uJm+GLGmNFFAsWoD312NWlPe+ErnoJgXlRrlgDnG79rf9T
 e1SEw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99wj7m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2026 06:46:56 +0000 (GMT)
Received: from np-a-belle.kl.imgtec.org (172.25.6.177) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:46:55 +0000
Message-ID: <445694bf7317bf7844f5570072a6c3e599868da3.camel@imgtec.com>
Subject: Re: [PATCH i-g-t v2 2/3] imagination: Skip CPU access flag for a
 few Render related allocations
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>, "Development mailing list for
 IGT GPU Tools" <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>
Date: Tue, 3 Nov 2026 06:46:55 +0000
In-Reply-To: <20261029-b4-render_update-v2-2-b3185bbe8091@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
 <20261029-b4-render_update-v2-2-b3185bbe8091@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNiBTYWx0ZWRfX35WSF5JmXzy5
 gkmGDNDH8eJzHb+o+RqE1GWP2JpLHMPljqHAJE2h9Y2ycnKKutQku85CCbp8qp7+tPWqnMaT5R/
 5hZAfOx7xuVYsIlB+al8+58xXZKFHG+U0E/3f4zIea4ORFwyVrpcpoV6EpGodkjKbAk4gs/rtMz
 +LSaLysSPI7VDYJIJmUCDOl7An1XBR8D2LOzNeFLwmXt2vjmJaEa+4M4eEapQV50S0wENRPz/1b
 Alv7c0t6p0J8hoBQyvdBSYPK5fxFGWm9M10d3DPHb3FCsRBL3bCUpk7Bhu4UR4JDyhB73mhIQU9
 huxbSUwns4Dbc0Pb8HGYxo4/IVR9QmmBdQ2iBzLoLjkix5TgMtj+wZjsf73He07GYbyzK8p8Csh
 eKApuRsYHGGVfzYfsM5YXXPH2C3pOQLMMYWSjDb41+S963dEdaVb5Cetzdozqz1grJqngILjOC8
 5DAgvmDYJnbqKtea55w==
X-Proofpoint-ORIG-GUID: Mo1FOo1EhKxDtmyBYjg6aREsTSncsazQ
X-Proofpoint-GUID: Mo1FOo1EhKxDtmyBYjg6aREsTSncsazQ
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6ae98360 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=HeCxW2qTfJQGhuzPV_EA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNiBTYWx0ZWRfX66RhuEFm8rpk
 Z4XUAUHwKemDPoxPu28MQ/K8PSTfD/hmNbOsGkyGsIZ7Yi5UTb5VBHgrSqA/FeOVznh1VRQ64Cw
 +TSibc86YmT8smmtMNfsxECJ01c/lm8=
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
> Skip passing CPU access flag for BO's that don't need host access.
>=20
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>

Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>

> ---
>  lib/igt_pvr.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 22b0c2775..dbad69758 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -399,7 +399,6 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum dr=
m_pvr_ctx_type type,
>  		create_context_args.callstack_addr =3D
>  			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx_handle,
>  								      POWERVR_GPU_PAGE_SIZE,
> -								      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
>  								      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  		create_context_args.static_context_state =3D to_user_pointer(init_rend=
er_context_stream);
>  		create_context_args.static_context_state_len =3D
> @@ -817,15 +816,12 @@ static void igt_pvr_create_hwrt_geom_data_args(int =
fd, uint32_t vm_ctx,
>  {
>  	geom_data_args->rtc_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> -							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
>  							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	geom_data_args->tpc_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> -							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
>  							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	geom_data_args->vheap_table_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> -							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
>  							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	geom_data_args->tpc_size =3D POWERVR_GPU_PAGE_SIZE;
>  	geom_data_args->tpc_stride =3D 0x1;
> @@ -845,15 +841,12 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd=
, uint32_t vm_ctx,
>  {
>  	rt_data_args->pm_mlist_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> -							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
>  							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	rt_data_args->macrotile_array_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> -							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
>  							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  	rt_data_args->region_header_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> -							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
>  							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>  }
> =20
>=20

