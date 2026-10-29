Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D31606A326
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=bN4WHusX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C4E10E02D;
	Thu, 29 Oct 2026 12:37:49 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFA110E11B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:22 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T8v1wJ2233395
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=3
 Izu8NNhJ0ZJjsmnLyu48AkHiKu6OYQKO6tuTm8gNkg=; b=bN4WHusX9kjOy6HZQ
 QNYmSAqP5F5Q6bL39Ji2V03txe2+57f+aQ+ICMQnGOHsBev9nqT1ZCfRQ5aMQ1AU
 g7qSOkP+ZJ+N/e1edwI2iiZm2M6ZkuxGZk5E/IcePJK4PjfFZkC/MC8CVq7vhFzL
 bhwO491e+B8hoE9SDGbtyso3pvMQuxto828RBs9Vq62j58IKg4SB+qS4/dGYYXY3
 eAqWs8ngIpomWF2xIWJoY+INijkTcaSzTmMojvnc3WJ+qfFWuwp1CGcVJ+rqMsRR
 PFOlJRDbnE+C3QXEyKRio4LhIWXe3c4xExmUwjTfb/rtK7vPoWBaWu+lzOAejNFu
 ZM+5w==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvbj8efd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:20 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 12:34:18 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 29 Oct 2026 18:03:50 +0530
Subject: [PATCH i-g-t v2 2/3] imagination: Skip CPU access flag for a few
 Render related allocations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-b4-render_update-v2-2-b3185bbe8091@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
In-Reply-To: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=CVMDFPw1lIpWfv8TrF3TqJloywjIOew4WhCytb5OJq0=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4z1Hd+NEY44T8+7ZBWimC4iY0tQUbEJ7ZpVl9
 WyIQpoSGfeJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauM9RwAKCRDQJndZfgLx
 cK2NEADTK2oJGb1PBexRhlNngu3+e7gd4iYbajTs4hgVqgue8Z/KYRRdA1gjx4Shbrjh7/mjoQX
 ewPcNWgYeDSVOHOvr9L6R3kWZEakQH3EjY9HO5qSZ/9mKkNBgQz20mgN6gEAz9Cv+STuz8vSixM
 /QBELRIlONDFum0+PYKVjUMuPfXF14lh7UNk3PRRG578nYG4YViMs0+Ds1TUCYB48KPyLFlnuJ/
 CoddWWpX0sqvmaxDBQiwGLlseT+5oQFQZ0ydaFxKEiO2dRXX8ncYEsQMp7PrAuQn0bOJDLGXWJN
 ASFyZNgROuJvfqJrKFFWJc7BWlqGoUd2z5dYlmL2pR+P0kiSXZ+npOoEcrMg2S78Q4FQu6jkq3Z
 r2n23lPSLfB9BLW8MQuysX43gmm5SJTogH+lkGj4YGH2B2LJGF4aBxTN/Da7A48kdmVLttW901B
 w7LC4r4B0d4aGOcjRsRVDARQKbFlQnz1kiQ6JO1vlG6glLRTaJC+qQY4fgI3Jm2lTI0yHirI/ha
 liqs1DVBey0vZnnp9M//Bd3YV6lVV0YLrj4xDlfmlYhdwWt/lp08wRxD+C8zeMbFW6F0FSWZmjX
 sJ2V17qbusnjqV1ipDOj03iB8MO4VbGzWxXF6CNRgTQYXn52QdbsQQPUkfI0SVFjQTLp3PG/ELI
 +IepDAcbjHUP8Uw==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-ORIG-GUID: 15DkGXQaT4gMzaEmXaihXwncyTFAvGVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX69ze4pqGq954
 UjTt6qjU/mL3c/44E+dsEDwEng/ab7twGDCYWRWwaGbaEC9MNcaZen0xTAmSyKmyjdOjNZDLzzm
 WrzNBDF9OtIYDeWupKqmG/W+dQ7mnPDhT4ee6Tk5q3r9Ewr8FATbscH1ZbWYGhXM6vuAzsY1n5/
 iK/fSdpvBa6wH+g0KuMv221JODkRAAXnosDiLH0RlWDapkBkzD1Bsa/adxja8hMSZ0rpKqxI1A5
 /BnoClADBZQjDLk77r0ynapIGzxO3Blx9w3NKqEjCJtCKBi7RVbcdAaDtENyo8qSs5n05yDfmk4
 TxzGiclZyCWNObWhUvVmNXgY1DxcvB7/2OHug82+WABCJgvwJbbe4+ZlXbyCKj9LSuMVAyNcGEZ
 WzKzojh2AIObEnQ2/IvE3B92n29w4JdEyq81k977HI/yeI+cW22Hl7rYSBffr1ZOjFPOA47IImD
 JNUBdynG0pQAPcVyvRg==
X-Proofpoint-GUID: 15DkGXQaT4gMzaEmXaihXwncyTFAvGVi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX8V7JjxEm/HCb
 44jF32gfmWeCRylpfFb3O9E7IsTnAbFdI+cHbR8lb1scJZNXCn/FjPEP4ti+QTpkoRj8GNBGyAd
 wxe2vK6QZTco1EJI8gmYChUgq8UcNB0=
X-Authority-Analysis: v=2.4 cv=NvdE4MdJ c=1 sm=1 tr=0 ts=6ae33d4c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=BY7FiyTaXdFL-9TwcfAA:9 a=QEXdDO2ut3YA:10
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

Skip passing CPU access flag for BO's that don't need host access.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 lib/igt_pvr.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 22b0c2775..dbad69758 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -399,7 +399,6 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
 		create_context_args.callstack_addr =
 			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx_handle,
 								      POWERVR_GPU_PAGE_SIZE,
-								      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
 								      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
 		create_context_args.static_context_state_len =
@@ -817,15 +816,12 @@ static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
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
@@ -845,15 +841,12 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
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

