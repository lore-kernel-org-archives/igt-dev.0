Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF1460A6F7B
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=sT8C79D9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92C210E02D;
	Thu, 29 Oct 2026 12:36:59 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50229112269
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:23 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T8ug533359961
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=T
 Ydv3L8MNakeJGcJ14PwODD518qdj8xp2ahFlNn6sl4=; b=sT8C79D9DZOMHYqlm
 AvJN0bEzyvIPToi+etfCY35nOAcfpSJXq5d3zjdspgIT00WPVfqYkynjLCbZ6uU3
 riGiUheslwn6UwJ3cSHfooroeiwErjnAOI080GqQZ3EkqnQNVQQ66qusxqPsDIZr
 +OQ42dy6/c/XaMZgWAtlHiwUi/czyRw4AAz92nbNnfSP9jCaS3xPKZ/v2MDKmErh
 vW+poTWeqTQjL0QA5NzIwLzDMz2o3Od9ys7zowu2DR4BAlkJfQzvdcQmCdmXr6Fm
 EPyoaQ0XbLIucqgSPeC0xOzP5pKWap9IQRCojeQbrn2Esjba05o/tRMKzOjJ08lg
 UXYCw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvd10cts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:21 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 12:34:20 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 29 Oct 2026 18:03:51 +0530
Subject: [PATCH i-g-t v2 3/3] lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT
 flag for PM MList allocation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-b4-render_update-v2-3-b3185bbe8091@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
In-Reply-To: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=7xoEvs68TWg66n8wysWveGI4/L5i+MoOgcFYF+RrmJI=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4z1HV9avRr0TnyGBI8xxNwa+2eYHYD7JP6+oo
 qoFi6r2DpiJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauM9RwAKCRDQJndZfgLx
 cILvEACiF37WYCj1AM6VeE+KyH9ODvAmTqQ/frRjkO23FwH4IlTZXV6cxD2torUa1QnZzpRaEYN
 pyEB7LLXzOkn7zQyAfsNNK0lgw/5AnU90Sh13OHVke/dfzs7ya09YHFq3oIcKNuTpI5RaNpNbWP
 T3AMupEiRSgk5TRpchc7wA0SdDZcsEU6YEDmnppnRBru4vthaQv75r6RZhZSj7A1q90DfcV9oaS
 dukw56PaykxNTI9QqQy9cAgHP4iVSaUYJYlfiebReUvEuySQmi85ByeM1DN1GscJ7Txc7+/QUMi
 gtaPP0xSVMU1GFBBt5CPvR6Ov4A/ecwYb5ieWHPb9p5ynJ7QF/pPgf3QgttC0kxUj8eR4luXYsC
 UkMin29vGxqhpANGGSQcYBzNtxOspiJNwSxX6OOolOnpex7z6wClYj6lL9WqGeFs6RQaefbY4BF
 WgQJokqQZdczQfVTioyMn5vYNMLcn3wFefDBGVr+HfrkAHeGljVWnQuR77O0YRNSt7c2zTH0eh8
 c0XSL2pXydOsm7qztXwmRrxHg1+A3ny5Lb1HQQNF+FeIOsLuNWBvtwNZUfw9EqA+8VgEFNIS/sT
 /RgJd0Yi/CjEOE7AP8SIQzXBz58r2frur362YXFPiyRtlFuyfCpkg6ZBgJpQs9ypkx5FcPjJR41
 rTI3ZmMvn/SB3Qw==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX1WtY19DRMSec
 I6MPsivsFIATirXAOBE+oQsroTWAxN3BfpWr8b97cleg5t5ubffNpXF0hkFqCTXdfH42AL/U89b
 UblFe3p4F/AO/GnS0LLKWSyEpw7ZJZX7mpghKBQUI3dROHvIDlyuMvLcufBaMgQ8fvlrTYR6R8H
 bUPtkygAhVtXU9SrCfvANekfpHdvnQ7yR+YoCaPubhqYifE80CXDzgnw01VOsYyupgeb7Jl2mZK
 wbdlAYB9JBMaIy5m6RjOevWRh14UfzSzXzDBMGPzmit4YFsEJiBIeJSbUBRwAWglf+SUvaU+QaD
 GqrJj3TIi4OxAKzrUcUEPNS8jQOU8hMTGMVbim6j9d5c6s4OPWbSStgUnenGhP01usdzJOIQ8jO
 yt4umi4Kjiz4xxK/9HiIvf7PguDnWGXwGHfYlcWnU673cjeUy8Hv+6nXirVC4w2xb1/kAjYX4ON
 ZX2n4DdL6qcXYmXlDQg==
X-Proofpoint-ORIG-GUID: H3AZT48tV8iCHjh9RTBefppVWte7wsj3
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6ae33d4d cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=orU94MdlTBgBgQKew8cA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: H3AZT48tV8iCHjh9RTBefppVWte7wsj3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfXwe8OILupR0sH
 aKchSuitRYhScDnhbcBzt1nUz2dk0tNUsdwaRsvcJWkeYcyId/NsIfjJLiLnEWB8m/F0CK0X8q0
 6fG48xU90Lh4rhifVkApufqHihFk/ko=
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList allocation to indicate
only PM/FW allowed to access the memory.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 lib/igt_pvr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index dbad69758..4a5fef2ae 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -841,7 +841,8 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
 {
 	rt_data_args->pm_mlist_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE |
+							      DRM_PVR_BO_PM_FW_PROTECT));
 	rt_data_args->macrotile_array_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));

-- 
2.43.0

