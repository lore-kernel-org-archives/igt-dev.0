Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C679606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 02:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=GvMSu78H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051D310E739;
	Thu, 29 Oct 2026 02:55:16 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F001610FF0C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:41 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T2ieUJ1558239
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=w
 z5nrNqDqS7nXpes122YpRdCjUc7jpEptS5eZfh5XUs=; b=GvMSu78HA2SgGPqI1
 pR/Z/uZ+/CnM+5P254WWigOGjlE9gCPmSE9GFTZ1ibpfV6mFrHWcEy2u2mZQt4Er
 EPjWLz3QG8KWrC4QB9NHaMzzlsazmtjrjaFT3kbg09VFaEFgaiU1YphdTjXueGBY
 Nm/H2D/kZk/HZvG1WF9AJ4vQInsSzJeLVLvUk2aARRrofeDxHdQ2SF+p33Su8Fnd
 fUw9KdmYLnDmPyJXA+KSS+YQoGjRu/I76eZbjyAj7T28GZKpmP7n8RKNm+hd1xZS
 cY+8zhQUCsYLg2n7MmvFwo0KxfjRcBU2/bZT9hTabK38uDe6kfY1nerxZD06MzQe
 7Nrgw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvbj81hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:40 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 02:52:38 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 29 Oct 2026 08:22:26 +0530
Subject: [PATCH i-g-t 1/2] Drop CPU access flag for a few Render related
 allocations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-b4-render_update-v1-1-4a92ec210d6a@imgtec.com>
References: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
In-Reply-To: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5997;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=Y7zdzRfZGERb6448kB+IrwZ01scWW+wJvHDWGYcz4gk=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4rTz3IUHUCTkiMxStOWRUcDFGCnNotQDsv/on
 msU8uwsGweJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauK08wAKCRDQJndZfgLx
 cM/kD/9+jGd4bVYVZllpkAmALiL0cp+d8murr68a5Qo5jEMI7+Ps9r6wN9iZFdAZHdimjPKwuSw
 K4R67oVYFoemCQu1W2fuWjTJ5lDbCdCv3cE/sJbQ2jN8RwEaJHRXzjymIn1P+kTEyDZz0Z9aonj
 uVm9Vp1MpGdYEQS4mCJhriv7Kr5iDlAubUH3GqSeRGiEdndm1ZB9Dm3S5NIEHJUCkrpAqbM9Umv
 c2zBadzZrj3c3zAmRP6LIj120wlrG+Zqa8sW/C1L7qRHZgIE0QorxuiRoBJGTjAPeK/aJKpvkdX
 vziqmJMuSx7xYBE85jFE0j10fbEu5rI/rEDShf0uUnHV+KReqmJLWmjUcta8Ww5XXLsgTUkpZCE
 SfRXVVaH/uCMtHUl835kELqlYdn/q8bFKU7Zgq1jB4BsHmmxfaJvynf3pTdWPTC9IaLS1aXyfuU
 J/rPquyGq4fvJ88JPPhUPaSaGNcs6uDESaF5AhnHIgPuf7s/ZUU4b58UpAo42DXxvnluo08dWLQ
 jbMZYDu4cbKMcx9ojcPtshcw1Q4jhB+RRHNda8p64uycUb/AFuJTHksfmCwRgvOC8Qsmh5/7/LY
 Zt0nt8UJC/8NB6txmh2nIZRaDWiBsuIRHkXfh/WtOAizWkQQlopCL+BkvsVg38Twqi9pexzwqgG
 ifAATnlH9NXbN/w==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-ORIG-GUID: HB4IPMmXAU3Huo35wISHNRwbxkfoM-pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMCBTYWx0ZWRfX/w0gcEAtZ+l+
 5/sQ3+S376Ohl9dX4iTNwP2S6zEpdA0YG3qakkktdmhUOBEE3Egc3p2nHfnnsw/QR/otxda1d0c
 RXe1clAu1KZvmiq3hB0DIRPAe77Tj6h0u7OpACfdiusWtuyHyY+AClYhmI3We7v4ORNhhA1Ex9+
 /aRbbdVkL8vpZEk+MhJnBgFCN1jlquvSlcKiCcBpL9KU8YUKyIrtPdHYOko245hSbZp5zgdzJBj
 YwxEPJEX+YJvlnjH7qpF1M7JALttqg8fJ6s3zsN0D9bBtJS4raWO+Lmlgf+JdSZNQD8n3O+5qWY
 R3+zTyjK4cEpS3ZTabrTRQvGc1JZ5RNMk7hxsecdQU1WJ08TL5ruwCIR8iKPwUBbWLEwYAv2FGT
 AdbvV+BvWpQdKnu6trlLOfXg3AO+a8fJxLoQMpdO4IA/zXLGlj7EVlU+eThb3vlJrTe1+xuKa75
 mTiEPLZSbiNl+dtIWew==
X-Proofpoint-GUID: HB4IPMmXAU3Huo35wISHNRwbxkfoM-pl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMCBTYWx0ZWRfXw5UtmgrUeYp9
 JlG6FOnwJm5adCNH2dEJStc0jxshxAUuZY3zzwp/rL/tCDC6NtgENTFVlJ5MpjuR/LRFwtO7wTR
 Ld6UarfKPs79JjudKCnTp7DIwKBuVUo=
X-Authority-Analysis: v=2.4 cv=NvdE4MdJ c=1 sm=1 tr=0 ts=6ae2b4f8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=JxZxjtekC2grhIA-Mo4A:9 a=QEXdDO2ut3YA:10
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

tests/imagination: Skip CPU access flag for a few render related allocations

Skip passing CPU access flag for BO's that don't need access.

lib/igt: Interface update to pass extra flags for general heap allocation

Allow users to pass specific flag other than DRM_PVR_BO_BYPASS_DEVICE_CACHE
for general heap allocation.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 lib/igt_pvr.c                       | 23 +++++++++++------------
 lib/igt_pvr.h                       |  3 ++-
 tests/imagination/pvr_submit_jobs.c |  9 ++++++---
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 799852da5..ecca46c48 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -397,9 +397,8 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
 	switch (type) {
 	case DRM_PVR_CTX_TYPE_RENDER:
 		create_context_args.callstack_addr =
-			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
-								      vm_ctx_handle,
-								      POWERVR_GPU_PAGE_SIZE));
+			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx_handle,
+								      POWERVR_GPU_PAGE_SIZE, 0));
 		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
 		create_context_args.static_context_state_len =
 			init_render_context_state_stream(init_render_context_stream);
@@ -673,16 +672,16 @@ struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size
  * @fd: The file descriptor of the DRM device.
  * @vm_ctx: The virtual memory context.
  * @size: The size of the allocation.
+ * @flags: Extra allocation flags.
  *
  * Function to allocate and map GPU memory from the general heap.
  *
  * Returns: Pointer to the allocation structure.
  */
-struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size)
+struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size, uint64_t flags)
 {
 	return igt_pvr_allocate(fd, vm_ctx, size,
-				DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
-				DRM_PVR_BO_BYPASS_DEVICE_CACHE,
+				flags | DRM_PVR_BO_BYPASS_DEVICE_CACHE,
 				DRM_PVR_HEAP_GENERAL);
 }
 
@@ -817,11 +816,11 @@ static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
 					       *geom_data_args)
 {
 	geom_data_args->rtc_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
 	geom_data_args->tpc_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
 	geom_data_args->vheap_table_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
 	geom_data_args->tpc_size = POWERVR_GPU_PAGE_SIZE;
 	geom_data_args->tpc_stride = 0x1;
 }
@@ -839,11 +838,11 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
 					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
 {
 	rt_data_args->pm_mlist_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
 	rt_data_args->macrotile_array_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
 	rt_data_args->region_header_dev_addr =
-		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
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
index 566f9d2b2..78a4b0bbf 100644
--- a/tests/imagination/pvr_submit_jobs.c
+++ b/tests/imagination/pvr_submit_jobs.c
@@ -52,7 +52,8 @@ static uint32_t init_compute_cmd_stream(int fd, uint32_t vm_ctx,
 	void *cdm_stream_map;
 	uint32_t stream_length;
 
-	struct igt_pvr_allocation *cdm_stream_alloc = igt_pvr_allocate_general(fd, vm_ctx, 0x1000);
+	struct igt_pvr_allocation *cdm_stream_alloc =
+		igt_pvr_allocate_general(fd, vm_ctx, 0x1000, DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS);
 
 	cdm_stream_gpu_addr = igt_pvr_get_gpu_addr(cdm_stream_alloc);
 
@@ -212,14 +213,16 @@ int igt_main()
 		pds_buffer_base[0x20] = pds_inst_encode_halt();
 
 		vdm_alloc =
-			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
+			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
+						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS);
 
 		vdm_buffer = igt_pvr_get_cpu_addr(fd, vdm_alloc);
 
 		size = PVR_BO_SIZE;
 
 		ppp_alloc =
-			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
+			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
+						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS);
 
 		ppp_buffer_base = igt_pvr_get_cpu_addr(fd, ppp_alloc);
 

-- 
2.43.0

