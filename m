Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00AD606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 02:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=e3xV+7AC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8568710FF0C;
	Thu, 29 Oct 2026 02:54:26 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E4410FF18
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:43 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T29I4H1494350
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=d
 h+Z35ZNYEKES7GFRaS95c/HAPOZ3pV5G5owA7xRiMk=; b=e3xV+7ACNQP5F5fE9
 ZEUj45pX2xlXUX+CF4jESkEO89+KbVOOCx/IJefcyTtYvD+FA7ESibb+9VY7natZ
 tGqtm0Tv25Hr121BDXGT+dld9Ee7tjqghjm9abF3Be/uvGiyfOt2o0bTJDiYrgim
 zpB/zXOlVC9ulvpPRV8HRuCogpDl2WBUthFd3E7hxMi2FR4lDcLpuA0bpe74WA+o
 88WBviGAqH8jj30bMq+ZGpud9mKeF15tw3d8r92lJNiWH/XXjPDzaEsPfVkwrP1a
 426o83V/T/FVVvJXbF4e0nj4GpCPR0gusTAx5lDhaAkiqq0BpiBLJDNI88504Csm
 ZQSJg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvbj81hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:41 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 02:52:40 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 29 Oct 2026 08:22:27 +0530
Subject: [PATCH i-g-t 2/2] lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT flag
 for PM MList allocation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-b4-render_update-v1-2-4a92ec210d6a@imgtec.com>
References: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
In-Reply-To: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=6aIa0AapwD3bX0G/ycBbKiwZwCqIafNTwX4CF+bNEAU=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4rT0VLK2MMeELZracQMQ94yfuJHcACKrYIUQz
 aW+ONe4GRGJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauK09AAKCRDQJndZfgLx
 cEibEACVftpVQ2JxnBg7zNtSIYtLHt0+LtcZCoRhbepi/7l0uO4a47oyEvf8ricefYeJcZ24jWq
 xuZZFOQPq8Pw2tUzNjBv7lZrKGfUdf2ibYTV33AS/K5zla/Qpl22ueL7PavjGAyCaJtF5/VH7dy
 YaIDsdKdxpMg0m+3v/ndQGYOHrV5y1yKBYRbpwaewWNBcm9nC1IqkQ/yOuLF64tm7rD/tr+XyEm
 IvuNzogwV7d9TAXr5OKdewwwQCgmd6G7c3AyQn6cIb2YlJPZ23ohAwxATaxn8VMik2Cdzrp0zsC
 K5Gw1sdcDtSLOPJjB6kyRSPlAmctAvXDHLRVyn4TNbF0kU90sv33AfZAWZypzGXRV5Se64m2J9/
 rgpJSfr4LvVfHYH03wa16CUGySn0D4noBuM1/gic2KK2sE54pbpUOqwmzODMNb9F+bEzF9Vq0Vw
 gVoxPArPl2V2fXgNraYVjhs+D1Xl7mI7GfafHvj82nzmeeMCTqF1GaBxEhP/HoxbHRtBAnDAsUN
 bH4GNzG49C/NWeqWi0iKh2Uw5fmc4RHdZki9eRwCVa6SwSX4hdTCGFCUSJYPDgHxxgvTLaV/aqD
 VgizWz8yThNkmdf5TcjWnsdfd/KRAiWXe0SKsPnUAmcO0ENfWPiNQ6Vj9NCD3buLBVHOyG3FR5A
 EMgYy1JH9JeboUg==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-ORIG-GUID: PojWRj_N59ItDuRT1lLC7NKxU2NuTl3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMCBTYWx0ZWRfX9xW3ZZZQiM2f
 wZjV5jzO5saGqC+pDWIh+w7QkC3H5cY+v6UI5mzrNeoQ1UTyP21cWebunXJ8UbJNzBsziucxDoQ
 aknm9ZNC2OWnihTVzM+KLoK0QfF77t8kOy2UoGQdbXSPV8gJxPjqDrPw92lXrzXj+On0YEpUT8m
 KLl5sbgCSivQCcWM/2RE0548xi5YGvaReuA2IJesQxOqwUM8FqleAPxTSt3EefS0fBmBiaCUX0l
 wkil2SAlazVuw+Vk3sFMebxAJXrDRQW6KuAhmOKmUBGTMunWHgGXMv+BhdN16jIFwI+m5KVuqqU
 Uen0Xa8XvYUw8gp93Xx4yHkgd2quyaOdk6sA3nRgLtAPkJlMwh3wfyvXB5zUWOBN1PC3+Ig87c6
 j++igbAhsRIGz7ALaeL3ZIT9TydwfWqDL9bhWlpdVnAKpp8YKNXqAz7QmRBDyPWlav/IujYicYh
 JC8knEN/8nGWagYlDdw==
X-Proofpoint-GUID: PojWRj_N59ItDuRT1lLC7NKxU2NuTl3z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMCBTYWx0ZWRfX+R2xTMjKtaX9
 oCpVNZsKB0EOanoxcWtUiSKkF9JctDZMnBvE6d65T12yjWAPCi14L5xoFaeZAa47mUdDRzuOryL
 /s3+E1hVS3u34Fi/ZDAZCDHfS3FW1KY=
X-Authority-Analysis: v=2.4 cv=NvdE4MdJ c=1 sm=1 tr=0 ts=6ae2b4f9 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=bk-is2VYtKlYqtvnumsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
index ecca46c48..87644fe2f 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -838,7 +838,8 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
 					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
 {
 	rt_data_args->pm_mlist_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
+							      DRM_PVR_BO_PM_FW_PROTECT));
 	rt_data_args->macrotile_array_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
 	rt_data_args->region_header_dev_addr =

-- 
2.43.0

