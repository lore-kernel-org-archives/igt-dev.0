Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD7606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=XKWWErQy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3F110E1F9;
	Mon, 16 Nov 2026 09:53:51 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5610ED5F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:57 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AG8XfYo3664688
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=E
 zDYJgh7J9P+IRLekMuf+GKA5FuH4eDbDWUTBJvRA5s=; b=XKWWErQyg2TL6z5Rn
 1xVShZZug/hzS/mLFFj5IjManGx9zFIXvb+pQCWzt4p0PPRLMEmcrsBVfwVIFFXi
 OuC+vkoVONP5PaxgGnU7/pSTzO8ESqLUK5M/Jwr0Ah/xd6/og4GsMmbER8L3/0+c
 fyLwcyDSmtQa84+RhVVYd2V3ib3naSpDsGPLfAHsPxImYMf4qU2WfsADepZ/6Os2
 pbLgwaOnrz4nMr9n7UsfZSGaGtt4SPOdytgcThK/MF96JCYP3KeaeS8sXQQJKk5c
 VyL7Degu075/sfHiaiium/cdOAJXCMJ1mkdQpIf0gl70E0Kcyxc5StHKIZgCY85C
 24vnw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hxgky1dys-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:56 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.225) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 09:51:54 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Mon, 16 Nov 2026 15:21:37 +0530
Subject: [PATCH i-g-t v4 1/2] lib/igt_pvr: Update general heap allocation
 interface to pass flags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-b4-render_update-v4-1-ace469e01c8a@imgtec.com>
References: <20261116-b4-render_update-v4-0-ace469e01c8a@imgtec.com>
In-Reply-To: <20261116-b4-render_update-v4-0-ace469e01c8a@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6571;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=xu6+pCNb/ELKHfPU4TmCZp014IzaSSWyX4Vyt2KJeDY=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq+tI4vVMLRUQR1sy+mKugwuhKnj2xmjkHdUSja
 ADTXRgzXRuJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavrSOAAKCRDQJndZfgLx
 cOoiD/9SgcxbZeGZHUopHoZk0z6ym/WxuJk8qAMwEenYUofRa5UflomITDCQtWgDjJj1gVyyvKD
 4RSuraY/SEJKSgHwn93ylopM+GIMto0BB7oEx1+ZM2xVM7GUJlpSDhuxlkfyvxGPz46g9qvTxJ+
 tb8RwxWnMogPIwZ3DQiwaNDReFwm+XZot3V3wrG9sOKHlA+3KfHW6RKTn++AJysX8uxawV3+7D1
 VcRtutmMfUZBPRT+SoPhn6JA7HnL4xJqnMh1suKYoKXusU0T5U39s/0KuhZKeqyK7rziSDYkeC2
 feeyK8OOEoQWxjEeh78pxWP2m0Gq8pfaj+BdbJxD6FUu5QiTnBhzKp9d+WmyrfnhYmzHvVNAEUS
 h8CW+Ihk8EQfYnbSiPNcCoK6PFj3FDK6GVa+c9/L8xQ0fuZWOSSET6utnO9758O2CexhAVLb94L
 n5uCe5SPbZrHfs8WB786nVtPsO8TRdgYFQcCu18zR7uVKBKt7Zf/47jJxHmhO3CvV97T3y/IJ8O
 QRLm7PQUC6XiZJS94/iAdoQBx9aQrUNx0MWtbGSqEmI6GI68G/8sOkKIJXDO5R+HizS41g7lzMg
 Xd9fTrn1DIGU/xfpIbImck92JKjYqqfEQYXUmFtipZKsVsrpg7jQhyqVVWK6CSp5tknqHlSRtkq
 LO5pLEtsFaYcoYw==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfX8YdUz89l781y
 3Vu13iqnWB8mA7+S3kkFrm2Kz8vGUNMNWG3yA44B/c2UJfz8Q/HtFAbD2NmiQKJbk0t0FHWwPZb
 XO2sTuF7xZKuYW1vnbEyPmIflDGP2c9JO/D0CUXgqu1FKKcXr8bEQG04W3b0CsweJMxLhp9a6Yp
 DxHbfLCwWH+i64Co6jQR0OAaoxind/WlTYfMo7blJyOgmdn6hPt90gNrIEKusf2TRxL1bS/F42A
 aY3ZnX6V+NuYoSwgPJveBd/bwBts9hGErFhshm52RkHWcNgtwsg6e8WENQbwKM6H2mgHe8IeELe
 OgUIaov9ImIny/w5Acv98i1l9GxvP49/wXUOgSESYKashnL2rnCWJwPQHyDA5spIV3HMRwkxeIT
 DvebeePwbLwPZKDtA+KsRrlluLdqhbbryKSGrdM/9QcKNh1OMvRaeEYsc9Jsd5TbhPW5LlEAcV1
 GCie4OKw6BfJWrsWgtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfXzsy8joT8ZZNH
 fKrGOGWOH3+Lf71fbb/PKDgp9LN3y43yd0281p58C5r4f39yw8IEa0YSVfL7IYwAETEob9NIdjt
 wMputeX9YlnqBFtJMy24C+u5qgF3ACY=
X-Proofpoint-ORIG-GUID: _6TPNTFgSgCV--aSsXyinTPIgyq4ACrq
X-Proofpoint-GUID: _6TPNTFgSgCV--aSsXyinTPIgyq4ACrq
X-Authority-Analysis: v=2.4 cv=TbsDJhQh c=1 sm=1 tr=0 ts=6afad23c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=HYrZrZQ_E1YA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=DM_0-Tm2ca_GMRGbu8sA:9 a=QEXdDO2ut3YA:10
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

