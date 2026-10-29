Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0F9606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=ScRXiZVg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECB510E11B;
	Thu, 29 Oct 2026 12:36:09 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE03112267
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:20 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T8ur4V3360446
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=E
 tU89Cb9fj6Gap98Ieo+1hu3tZyzDr5oAwFEo6hEzsY=; b=ScRXiZVgFyjjpW59p
 NjR0prxvh8KioR7ofK2jWOOqhHZDjDFaVAIXiyb4tesV69cHtDIxngiT27f8P3AA
 v0z+qswGWau2OqXQ5r1zwmH6hIa2D4ORrzt1mOjoaCPhhl0TqakCuBEvhg7fxZAg
 liwYbXge+BK1TIMwSY7Kd7yJBv1GTY9ZJmwZ2xqjsPkIUEWUeeyXoHLbaC99Y7hh
 I7dL1FW6+cq5pHrGWd3QPB/8hgs21JPNztUJMScGKoSV2qZBFxal5rSrAoKTfgmS
 BVzqQkZ6QNYqt5O2zQ68vLu/EURw9676+Wx/+tntwwsrwaW5bqmF6/2AMh9GSv36
 ZjESw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvd10ctr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:19 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 12:34:17 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 29 Oct 2026 18:03:49 +0530
Subject: [PATCH i-g-t v2 1/3] lib/igt_pvr: Update general heap allocation
 interface to pass flags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-b4-render_update-v2-1-b3185bbe8091@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
In-Reply-To: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6634;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=0MFZ4SH1qKcRbHDiY1sdKLv6DloRu2KvIbPYhWrb24g=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4z1G7BWHQ9huoIC+8G8W9cJkBOsVfUO6tG25b
 fQGAgQlML6JAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauM9RgAKCRDQJndZfgLx
 cIq4EADFvVwSp5lDjQ34vEZO85ZuKSHOXlWGjzZygzg+qrDzEqXrWD7pae2HynxRe5rj8+TYcjP
 1SRjdAl1lh8VjKON1N3uKDgY421duKBZaeiAMLXs4r7ChnG7kmqDA8FOrcOXkfcbsmZUCD4YpEZ
 NbjJQjexcCX06gLU47SInsaJUq2k33SSG/mnY+yax68BgcA3hE3A2uMmAVtzrDf5JBMCzlMSh1J
 4GF39Zl+5saHYpR6n42nw/P2J6C2+WB1rO17aEfwfIfggeWnlce1NuURgQRngFCarup46oXx6o8
 sYm5enYur1G28DBZZZCf8HISZCbohVig2OrnB/M0bGGJYzfXHSB0PNPTFRE/CGkI8yzfWgy3bjg
 mY4SRYjeHaTt0uTFkkZea9fwgw2nltzx+ESglVsau/s4cPjNf/rrZ2MJ/2J1OzlBsySKM6z36kE
 ptLAvdHRaxrV7IL7xcPy1fZiPOx5w7SUC3UGUbRhCAQ2xW6Xz9RvrletJrkzgxp5KNWyNMFQqy8
 hnas408/jbISOoS59r5zenCE3hWHRE+HhmM1KfpP9zZgzG4kHLCG0VA1KfZmHcTv73g6fBDEvrM
 An9IwHCNdRXofX+MWFmI4PtpiCr8CfXcJYJ95dbcjFqRoXgv90OeYd76YXmBxaXT+JuA1sLsvvU
 5FB3391+fjrs1Rg==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX/h6QTcD4iCfW
 D8cwmfvSTOwr1kMcu18U8GL1cBCiWLGjZbhqJBqxcmu+dDf7v3dL0OCwc/mIjJDJva6jDdrVhy6
 vNpX3f32KpWiv4EsC172xdGFctwkZzuHxjaldqoeAxnOFjOpNnkLQdqMGHn2sJjEVHpUY2v87ER
 YBuqdTZaBSw2ic6+CQLAk84EviDb0R0cDZMDjW/SuTf9v071lH5TBKcR11rh/3dKK8pspbFP7lJ
 lecg5gMi2DSq+e/xdIvdBYTr1Z1zGcZRYxafqK0k1u28pMMSWbi8Q3JkmHEtNDTZ381mAa5DQ0y
 pQjvUgJwos4OeTtrmvuQznp+v349gRFtOgu/fh4/m0HE46FL/pNdHJI5CRKKV7z5FvYM1iS2uag
 0nIGq4+HJu3/aJGxTxy3Ts365KIQ5gL3bGBxIpsmIeAhpyWp/Zy+KWpWD3aH4rCRYUXFSWRNLk5
 N/pdeDshG6FUHXxv4Tg==
X-Proofpoint-ORIG-GUID: mXI-8umRMMKk6MHi-vSSan1iFwEADnF_
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6ae33d4b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=DM_0-Tm2ca_GMRGbu8sA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: mXI-8umRMMKk6MHi-vSSan1iFwEADnF_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX8UuW4eTa2H4S
 bP6jbKiR6mAde7JTivAwOES+lThy/JH7xnK5LQv5TuMjdL6tRd9z9nkqXPi+eHfgT/LsCR+3zmQ
 nKZCpA/yB5KpXW7RJ7S1Mx8NdRwUqQw=
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

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 lib/igt_pvr.c                       | 39 ++++++++++++++++++++++++-------------
 lib/igt_pvr.h                       |  3 ++-
 tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
 3 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 799852da5..22b0c2775 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -397,9 +397,10 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
 	switch (type) {
 	case DRM_PVR_CTX_TYPE_RENDER:
 		create_context_args.callstack_addr =
-			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
-								      vm_ctx_handle,
-								      POWERVR_GPU_PAGE_SIZE));
+			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx_handle,
+								      POWERVR_GPU_PAGE_SIZE,
+								      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
+								      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
 		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
 		create_context_args.static_context_state_len =
 			init_render_context_state_stream(init_render_context_stream);
@@ -673,17 +674,15 @@ struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size
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
@@ -817,11 +816,17 @@ static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
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
@@ -839,11 +844,17 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
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

