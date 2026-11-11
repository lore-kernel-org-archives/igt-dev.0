Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC0606A326
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=KESIPwzj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D4B10E2ED;
	Wed, 11 Nov 2026 05:05:17 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF0610E2ED
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:37 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AB4YEjV2835333
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=u
 ZmGQvdlK/WQ6L2nKXcelWXCnL9hzOjuTyamMmC3kVM=; b=KESIPwzjspX4QD3hz
 6uO11OxCPAvin229rTQ+VkrU6P2jBTGg15U74ekRjxmI8kGX1NUISp5KDOcshLDv
 zxi4AX9QmCu3RyTpcvayIvaLVy0P0ocPXuIHZ/i3KiEIEHI5gh89lO4wShTOIafO
 avaiXRwCD+Qpq45v0g1UxYwd5UEzKTdg06bBu2kc+s/NNPkQrW2Gce795IB2IJMS
 f/eEw39pGdfnJfUHP8/K6Jo+btSi/aFZeOIOLe3Mk/B3l2E9PNqwQDeyFMOVXwRs
 EDIybyzSJHOZcMeMhY0/Kzve5QhhfyNirHtY3tlodXsl+3Fj20lWj0bqGgAl+uHM
 x6uNQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hu8pn9fak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:35 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 05:02:34 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Wed, 11 Nov 2026 10:32:22 +0530
Subject: [PATCH i-g-t v3 2/3] imagination: Skip CPU access flag for a few
 Render related allocations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-b4-render_update-v3-2-979dcf01ff43@imgtec.com>
References: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
In-Reply-To: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=CtDK6ASfUFmxKR8G0bTwXdZgrTq/eHB/wQvnuB9x0Ac=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq8/bmfdViQZFzbjuaSFa3zBD0a2r9ctxnzjpsq
 gcf4hzml62JAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavP25gAKCRDQJndZfgLx
 cKnwD/0ctmiSroUM0ME2WsLPV4Eune9bKP3o4cOUyXu+I7x4n2rn5WpVULxu5HQ5bP4j/2wPzKp
 Ua/0kYjnK6LwV8pnWeQ9cr5HrPBIbVaOIsCzHYvY2ZQHg6FNT97yoqyRiPpEDvQ7tNW1VUdcXDO
 1+XFYrXgQSWJqatbyIsQUT/3dEgWSPVBjnJJXYcoytcssBIFhvGibLO6d7Ed8sqgSmSyk6hEgZI
 H/v2wjqS0ZxTPjKgvrGCvY+296NYRHiBpAuXN0RYQRPzz3Xpe1fEN017SrtSc/4fRUsl4FHj1AO
 7S6wURu8KIK5SNr/oHW5wYbzZci/yYFnEUg3Jh/Rhj3yLsdhRA4C/8ixgNZai7jYku/OSKj/u4U
 qbKtaiU1rMHSXmy+hlkk/ibeFOjBdB9R7UZuHJGQ2a/ITXLYelv4rH0xDkbJP3FkMk3vFyO+T/A
 cxPl+eGw96f8A6KYx1qw9FOlGTS7PrDAr47qbB8kTsGCYzLZpncwImr0/QypATMxqkeULfZsJbM
 0puPbzKP1uGZ5E36V0qYBE3H5X77xhliyBz3EqvbtujZydw0La9lAaUN7ns6kXCB9goH3OUy8JR
 jLI4Z/mF43BbS6iuBVWNdMxx4xek53iHD8JXSRv3Q+DsbmCjEa3rguBXziPEVCRqxRJ8UuuAHKC
 5CJsbU6VatZcADg==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Authority-Analysis: v=2.4 cv=P46vFSAu c=1 sm=1 tr=0 ts=6af3f6eb cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=BY7FiyTaXdFL-9TwcfAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX138D3ipw5WYv
 5yHcEUJzaJJgMH5HXXhKrimcleWGnmSVJs7vTf7KgScn/jOJwumkzO+Y6HGvNMUXd6VRDYARiWo
 ZeAIiPjM0qvYaQXpVlRb3bhodL0GcpN1cEHqUAu7SphIcMvqTUDFoelB7/yGEKW79PFaUpkwhB3
 HshBUz4Y+hU7ZQiHEnKpRk9l0qBTcayebp0MzLm/X4SvH8lX9tEe6ZSXc4/2LcRdhlpIP4yKKBn
 Hcm+1KhtaND523GZM3hZmys96oWmFifH/iOozr8Q0aWmlXLDEFdXhcEneZkSSlo0QWfHARYQqvD
 vYO0+lPov239H4SOwq6qS6yzq4SXb9zuWlc/kVulbI9Qede4PaQ+sX3HGSRXX4+rpYelnMkGK6i
 aaZ/4/26/A5FEBrUI5USnJJC/FzSM6nYRaY+LnNN2L2ESb2S9ECMYfUO2Ktwt3kHnaYiMDP22M8
 Sj9CgxwFz/OMyrE/b+g==
X-Proofpoint-ORIG-GUID: L4UsLh6OMBn0Wywrf8RHrmeu9H9dWI1K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX7jFAVXMrVZvO
 5exJSmu8XO09dzxoGRTZIJY0mr7X+77Y8D3332xAk3oLYmPdv+mq9A1lxrfEkz1WiRh93FASfJ9
 /6Q6zlBYyDqf4XBzfaS4bvuv8anG4ek=
X-Proofpoint-GUID: L4UsLh6OMBn0Wywrf8RHrmeu9H9dWI1K
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

