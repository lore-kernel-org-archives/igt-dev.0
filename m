Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624E9606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=qumsfyhr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AEB10E2ED;
	Wed, 11 Nov 2026 05:04:25 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB7D10E8CD
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:36 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AB3qIvt2691497
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=E
 zDYJgh7J9P+IRLekMuf+GKA5FuH4eDbDWUTBJvRA5s=; b=qumsfyhr09XJIjMow
 yZpe8O+ZPa+HU6MT76mwCVOQEdAJteshQb06/aAv7vi/Kd1C8DEnToN/06+VOrBH
 eZv5VOctL1SG4PhF+uyMw6gzSaU65Py/bhEBa0K8MgMDCnqWMX3z/29uX/PoKI6N
 vvRHzMZnMlkjm9eL1akFaU9UEHdvKMB8wmGRslg2th7d2JHr3yg0edIGMFR3AHdt
 eqjRHQN2GHplnEHT1MmmQalNpmWl8X0Z6mDav7eomPp/Ize6oFM1F7YUbgrAiTJt
 bSqkt0RVCax9uo8LEGnle0TZaPvdLBYCJnmz3E8y4Y/cfG8wNTb9zgLTCAUUHxUy
 4+0EA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hsvxx2xc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:34 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 05:02:32 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Wed, 11 Nov 2026 10:32:21 +0530
Subject: [PATCH i-g-t v3 1/3] lib/igt_pvr: Update general heap allocation
 interface to pass flags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-b4-render_update-v3-1-979dcf01ff43@imgtec.com>
References: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
In-Reply-To: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6571;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=xu6+pCNb/ELKHfPU4TmCZp014IzaSSWyX4Vyt2KJeDY=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq8/bmzsyQ1QO8nyTleVNfmtuqz9lZqumDDNMkw
 oMwZhLLjBKJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavP25gAKCRDQJndZfgLx
 cPIKD/97tUb5Wrdq8wj1rpgS9z6LeFqVhJKz91Zoo+V09FrjzwHP1WDjdQ1Y/iVK65DvKsm60UO
 oXH9HNUH9ottnDp7G8N83os+RnZeQRdtZHiEEy88HyEpIqDCJiCS9uul/G0AT+q/EwsHhGau6vq
 tUskSR9aXpydNCtT16THkcll8OhMFfmj38lYk6JejfZfcrLybyymKxMZfrs0dcw+ldIRekeY+mb
 1qrHdaXHDE39kfPTixYpohuWXmBvE9robTK/VnB46S1J1Ul5WUlftj1qaqBxRQXvpQaVwuWP9XQ
 PW/xjxcu0NkyTIwhFbOYmaIT0IRYo/GH2vn3VEJwrcHIOCxPr8LIz+QgTQVFcQwFqTIX1UPPSqM
 /pVuo5aXCs2l6r5LxxKOm7OvDPgSqTDe58bQHCmBs2c+B8SvLpqIEnjthf6c7aKy+a1TXoZhftw
 KieMOpBssKcq8J6aBPGEwywN8JqQFJkT57wNQ1W9nNhcIttCGv7q+dVPdGbCErog9WDgACDn/KU
 7lGViPSS69wtV8/QyfPhdsa+2aDJWHLy+snWfE6V37K7AXGfQrXmNaUuAOBN9JEiWJURf/+eJsH
 2tVdo+cdk/wLLAbC0uG1Jpe0KYC74wCLjyW7ulmmrA+WxppT3lTnA2N3a8uZgUlp9R/YqNX7rjW
 sm0uj/6jnYya0PA==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX5iuto6l/MG/J
 hkOFKgyHngRLfmsk1Io0a193QJIBZsHGyAPwDx0cLjjgxLJUCc9Wpnj+/qjnfaBWXxH75splbKt
 Ille5K5KENXvMkGRsPaJd8fro6tsKyg=
X-Proofpoint-ORIG-GUID: Rih2K1VO4LHNEHiJMPR_Fx2kVXhorGkd
X-Authority-Analysis: v=2.4 cv=H+JOUOYi c=1 sm=1 tr=0 ts=6af3f6ea cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=DM_0-Tm2ca_GMRGbu8sA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX32JliF5z/W91
 aCyOwTIKn+GCX16noh5I/VBxk8LKXJhbXaSPbVCXLWa60A+WegLat4k1MP8xCjTgUqheKV+sQte
 1TNSd/0ZXv1blyofxKPs6EpV18ALobrqkgHtD2WyWNswxzm7MjEvn/Tl+pPYZL6fSycmLMmAO3U
 NktPYPt5FgB298wriAZDYZBy9AZc13tmJG7UyzCdNkGQYrmsrGQapYGAgZykVendFZ644kayrLp
 09lTUA+KXuKx/zAJRygR3FRZH8+ucg5LpyJ42O/mtg75dJ0JCwvkbQebwQOqpdJwRfNpxzsHoKc
 PSxNu1A0izvXepUSgH0OoxadCGcOWkA2U+GQFzB+dbok65XX1ICXoDFHK+eIY6Zlig++q+bHPmY
 8P5wz2GqzUUcQkUECbuURjdA36JodPn21RXPJWgvjONUp2Ks/eLULtXENBTvqcObkete4e6F1Up
 LUW3jMd/gobEf2C1Z+g==
X-Proofpoint-GUID: Rih2K1VO4LHNEHiJMPR_Fx2kVXhorGkd
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

Update igt_pvr_allocate_general() interface to pass flags for allocation.

Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 lib/igt_pvr.c                       | 36 ++++++++++++++++++++++++------------
 lib/igt_pvr.h                       |  3 ++-
 tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
 3 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 799852da5..e771d0660 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -399,7 +399,9 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
 		create_context_args.callstack_addr =
 			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
 								      vm_ctx_handle,
-								      POWERVR_GPU_PAGE_SIZE));
+								      POWERVR_GPU_PAGE_SIZE,
+								      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+								      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
 		create_context_args.static_context_state_len =
 			init_render_context_state_stream(init_render_context_stream);
@@ -673,17 +675,15 @@ struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size
  * @fd: The file descriptor of the DRM device.
  * @vm_ctx: The virtual memory context.
  * @size: The size of the allocation.
+ * @flags: Allocation flags.
  *
  * Function to allocate and map GPU memory from the general heap.
  *
  * Returns: Pointer to the allocation structure.
  */
-struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size)
+struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size, uint64_t flags)
 {
-	return igt_pvr_allocate(fd, vm_ctx, size,
-				DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
-				DRM_PVR_BO_BYPASS_DEVICE_CACHE,
-				DRM_PVR_HEAP_GENERAL);
+	return igt_pvr_allocate(fd, vm_ctx, size, flags, DRM_PVR_HEAP_GENERAL);
 }
 
 /**
@@ -817,11 +817,17 @@ static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
 					       *geom_data_args)
 {
 	geom_data_args->rtc_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
+							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	geom_data_args->tpc_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
+							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	geom_data_args->vheap_table_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
+							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	geom_data_args->tpc_size = POWERVR_GPU_PAGE_SIZE;
 	geom_data_args->tpc_stride = 0x1;
 }
@@ -839,11 +845,17 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
 					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
 {
 	rt_data_args->pm_mlist_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
+							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	rt_data_args->macrotile_array_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
+							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 	rt_data_args->region_header_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
+							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 }
 
 /**
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
index b6e3dd676..bed02f968 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -67,7 +67,8 @@ struct igt_pvr_allocation *igt_pvr_allocate_addr(int fd, uint32_t vm_ctx, size_t
 						 uint64_t flags, uint64_t gpu_addr);
 struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size, uint64_t flags,
 					    uint32_t heap_index);
-struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size);
+struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size,
+					    uint64_t flags);
 void *igt_pvr_get_cpu_addr(int fd, struct igt_pvr_allocation *alloc);
 uint64_t igt_pvr_get_gpu_addr(struct igt_pvr_allocation *alloc);
 size_t igt_pvr_get_size(struct igt_pvr_allocation *alloc);
diff --git a/tests/imagination/pvr_submit_jobs.c b/tests/imagination/pvr_submit_jobs.c
index 566f9d2b2..21ccb03fd 100644
--- a/tests/imagination/pvr_submit_jobs.c
+++ b/tests/imagination/pvr_submit_jobs.c
@@ -52,7 +52,10 @@ static uint32_t init_compute_cmd_stream(int fd, uint32_t vm_ctx,
 	void *cdm_stream_map;
 	uint32_t stream_length;
 
-	struct igt_pvr_allocation *cdm_stream_alloc = igt_pvr_allocate_general(fd, vm_ctx, 0x1000);
+	struct igt_pvr_allocation *cdm_stream_alloc =
+		igt_pvr_allocate_general(fd, vm_ctx, 0x1000,
+				         DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+				         DRM_PVR_BO_BYPASS_DEVICE_CACHE);
 
 	cdm_stream_gpu_addr = igt_pvr_get_gpu_addr(cdm_stream_alloc);
 
@@ -212,14 +215,18 @@ int igt_main()
 		pds_buffer_base[0x20] = pds_inst_encode_halt();
 
 		vdm_alloc =
-			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
+			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
+						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+						 DRM_PVR_BO_BYPASS_DEVICE_CACHE);
 
 		vdm_buffer = igt_pvr_get_cpu_addr(fd, vdm_alloc);
 
 		size = PVR_BO_SIZE;
 
 		ppp_alloc =
-			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
+			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
+						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+						 DRM_PVR_BO_BYPASS_DEVICE_CACHE);
 
 		ppp_buffer_base = igt_pvr_get_cpu_addr(fd, ppp_alloc);
 

-- 
2.43.0

