Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC0606A323
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=LOep/lQq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E301711263A;
	Fri, 13 Nov 2026 14:45:17 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A160610EC25
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 14:44:09 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6ADCsNwX541072
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 14:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=8
 zT+hMsQo8X9VKJ1zV61mmy6tEN9EOWCUQ9wPBExQLk=; b=LOep/lQq+IuOD0XaV
 iGL2Yo9uwzzScgCG/d0r4L6oytWpjCnStKaN9phhb6mUEFgiAyHW8HU87DS1vZum
 CnschfNWgK2YPqS3WXCUnxqIdSTNGAK/e4hlXDvMMi+c+iHf7NDtOwYLxXiasXaA
 j7J5hza5R2IKSUrR19pM/oDFZNq7mr09WpW+msdWpk5lMJn0T+y/LB4hyWIKC/y5
 G3eYPO1VWF9HNeZgSdaHss5FX/YA6W/U87Ic2pZWSDHCuPs8CDv83KNzFoINDbxw
 kcSfRFkXRS3iDwXDMYw7nSRAvbJoYRlH51rPHlw9g3JIdXs5/onFqA873+ykxSsE
 FXE7Q==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hwpd4rhap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 14:44:04 +0000 (GMT)
Received: from np-a-belle.kl.imgtec.org (172.25.6.177) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 14:44:04 +0000
Message-ID: <90b2f69fea302fe0c698ac0eaabec03ddbaa37de.camel@imgtec.com>
Subject: Re: [PATCH i-g-t v3 3/3] lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT
 flag for PM MList allocation
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>, "Development mailing list for
 IGT GPU Tools" <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>
Date: Fri, 13 Nov 2026 14:43:58 +0000
In-Reply-To: <20261111-b4-render_update-v3-3-979dcf01ff43@imgtec.com>
References: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
 <20261111-b4-render_update-v3-3-979dcf01ff43@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=aP1lOr9m c=1 sm=1 tr=0 ts=6af72234 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=sg5-cvHtWS2g9pmdw-UA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: i1cstEwXURYXOIWsOCa8asyto3vo-iJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfXzkf8PhRdnExS
 KyE1XKpKo+5Z51K90sDKiZeD9JExwnf41GRBBPDEbWh8pqg5TUnOsQeIskJS/bAEYW33pO0grd2
 7cyqx5SpQgp6x6OpUMuGuy3UssEyAl62fcD06WFSzrfDAthay9NaTbGWIB+SYwW19YNlO22UcHP
 PiSodH354Y0zuxfGAPNU8wVLFGvvngXoyIpmvo1PVmBNBCHB80Z0MCvw19qYfGhHBPVmAXK+Osc
 67FTgQvYGEEXJ00D1U3NMjn3RQmjkPhaBXbCMxdr4WJtWtGxe6jX3FeB18TW3sl/5ehMVemfu+U
 6B0NAOKcZEFDw6qn7DTkCPUkXGqmdf2m+dnCHdwRdPcJfTedgdgOF7qjKPCAePLIq9jV2cOk1cC
 Zis/bdf/y401CjeAc5jekdd85poVxSw82r+5yjE2okVmiu2bF1ftLjcRDpBHbjGi8mCbcjE2Hu4
 2fywBpSCff3VqeYQrYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfXxnX2oJIq2RPn
 vzXtFsfs//bhGZsrFDexYwA5EngWarINPrh9LKUIvPwhha2sWGbLeJs4Vk4pMVL/ozO2AVQ6yIO
 aYlO1pNqlb8jkdgN54+WCE+eAyW/eAw=
X-Proofpoint-ORIG-GUID: i1cstEwXURYXOIWsOCa8asyto3vo-iJ_
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

Hi Brajesh,

did you mean to drop this patch in v3?

On Wed, 2026-11-11 at 10:32 +0530, Brajesh Gupta wrote:
> Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList allocation to indicate
> only PM/FW allowed to access the memory.
>=20
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> ---
>  lib/igt_pvr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 9e88b2e41..36846d7d6 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -842,7 +842,8 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, =
uint32_t vm_ctx,
>  {
>  	rt_data_args->pm_mlist_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
> -							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE |
> +							      DRM_PVR_BO_PM_FW_PROTECT));
>  	rt_data_args->macrotile_array_dev_addr =3D
>  		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_=
PAGE_SIZE,
>  							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
>=20

