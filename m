Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D39606A32A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=Dx4M+c89
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4A510E1F9;
	Mon, 16 Nov 2026 09:54:45 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518FB10ED8B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:52:00 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AG7XBIZ3597227
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=u
 ZmGQvdlK/WQ6L2nKXcelWXCnL9hzOjuTyamMmC3kVM=; b=Dx4M+c89cAdkIfhBw
 rDsGjNScZDVqWEqJ9nfdqX9CA+ErfglPgB2+c8pDvJvssU2Y3UUXWd7qtXnIvzLw
 rf2P82t6s2Lnh/4aqsa2pB45wZkpg8QCIEXUpuF0hHM/ds93T06j5ghGn82Gfti7
 9xSu0vEAMaIDIDuwUPCgIAo0x8KiqyUok14nH0vX1Btn/7fhvj2MK2159Gcw7maQ
 JlGxoCfOQW6FEMBHH/CyG6mhp7b8cAuObKsUrJeFTTP5JbeyMD6AK66S7g4yT/EC
 f4ahfH9kAfdr2CI8ikkW+Pig+P2AXmRCENxTcrpZ8/LXEBhRRGfb2f948GCyyPYZ
 G9/Xg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hxests9c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:58 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.225) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 09:51:55 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Mon, 16 Nov 2026 15:21:38 +0530
Subject: [PATCH i-g-t v4 2/2] imagination: Skip CPU access flag for a few
 Render related allocations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-b4-render_update-v4-2-ace469e01c8a@imgtec.com>
References: <20261116-b4-render_update-v4-0-ace469e01c8a@imgtec.com>
In-Reply-To: <20261116-b4-render_update-v4-0-ace469e01c8a@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=CtDK6ASfUFmxKR8G0bTwXdZgrTq/eHB/wQvnuB9x0Ac=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq+tI4StQdU/ULpOIM44qXb5rOw7aqY86QN0jOD
 VBTygjrTsOJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavrSOAAKCRDQJndZfgLx
 cDZ4EACr79e7iDFp1ZIiJ9Ph6MOuhs/p5w9VoiE3KO4WwT7W59dHISMw0plmXA2UGuZjG+EKNqV
 xMYiE75LwwpYds9javtFBvKqulspyot3gVJz7CJRb8/P7vuD9y4kMlPuK9v9fe1q9Lortkiq0yQ
 o6sZ2O9omyJuYXjMzR7d/BI7cC3U1j1V1PTCMi7I5WcekgV1Z4DHqIkJ4hvkgph5PoCrjuJDf67
 JzrWSDT6a/+grwn7DsBCr3lm+7FCwaL6ZjHL4fMrkuvFz1xy+5mTT8rE/vVW4nqKFcIy5Sw9lwA
 TZjoQ21HwJsrIi8s/R9nRDcYP4+A9hA6lM2MIN+Z04+O/PmNhzKFa/JwsqwfXsS5ydbx07LBxPQ
 qZvvjWqPMqoGVOTM1O030KiXal0H1a5SAcXFbKUObfEpUh5RtU2y99l38cT9+K0szFTRsXEn/9y
 AFfl5DJjMiYKUp6UiaeDOu1xwZBREKbtSq0iFJWuSavT4jNaAF6ihRa44CUMdRqRIPa3jzzFjax
 mpZWkhQVhK/3vBGsDkWCzPg94JMuYDXccUcHb9i1Mmts7vCNmvwrLhhPt0djbe8+8IYXP6j8qyw
 QqdlNkT+uGkQT87asbCd0SKFGs/9xo1hEjZ/glDNOTeac6if5LVT356IeOxYGJ9oXSXlwRf6xx6
 /7+N6qlujWToqJA==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-GUID: kbyoT2PpE-PXS9G3y4CBldQbX-pWbDPV
X-Proofpoint-ORIG-GUID: kbyoT2PpE-PXS9G3y4CBldQbX-pWbDPV
X-Authority-Analysis: v=2.4 cv=O8OsLx9W c=1 sm=1 tr=0 ts=6afad23e cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=HYrZrZQ_E1YA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=BY7FiyTaXdFL-9TwcfAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfXyg0nAijvoQ3T
 fF7XO0JpKGCiW8CbTpe9P5rC872qqQ256Iemvl1ZL+kyoOkO4r8hsOk0vRDBoZB2t+tNDvrgxcY
 BeFTDYU3zS+YZt1VZp7bm+oZNXLDcmF3fAApCY8UkDSlL7yGx+FeC0bYjJOXelJlY5Zn8y79c+u
 3+XM8rjMH4eHF7TqwTa0UKz0qBhSesFV7a7Ilgts7hG7wNmtdNeK86woMgWmMd1+xwRIaXHhhZ/
 KAgvs8obeydOXDT3LvKWEDQuTrJWiiujriilx8TNK0fazyXPir2v+8PkB7IzppHsn8BOtzD+/eq
 zb1ZnjSR84NYRtF5VLWx1zBz/i26AtLOYVJagq0ZnGWChCU/rpyGMcV5qL3MI41nnnVxuqn3TEN
 99lZ3/3EBIqToN/6VlbY88GOyktVy/dKxuySQc2tcDUFsESGO08+XbAUjB8Lw7CjHNUAnRKytUR
 J+nAizUkYj56SIdUekQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfXyWUc5mZ4UzmB
 pbJkyJVdAX8nz8iCWKYyg5czbxu8zU/aSluC+yHTbsE3IFkcYyX77OGBBMdqtVUAp3BRUaq77LH
 FbvbUgxGP7EtbAcXgpIFQMiVcw6W8p4=
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

Skip passing CPU access flag for BO's that don't need host access.

Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 lib/igt_pvr.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index e771d0660..9e88b2e41 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -400,7 +400,6 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
 			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
 								      vm_ctx_handle,
 								      POWERVR_GPU_PAGE_SIZE,
-								      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 								      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
 		create_context_args.static_context_state_len =
@@ -818,15 +817,12 @@ static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
 {
 	geom_data_args->rtc_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	geom_data_args->tpc_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	geom_data_args->vheap_table_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	geom_data_args->tpc_size = POWERVR_GPU_PAGE_SIZE;
 	geom_data_args->tpc_stride = 0x1;
@@ -846,15 +842,12 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
 {
 	rt_data_args->pm_mlist_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	rt_data_args->macrotile_array_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	rt_data_args->region_header_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 }
 

-- 
2.43.0

