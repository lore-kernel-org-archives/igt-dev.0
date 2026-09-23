Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25F5C9830C
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 13:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0BD10F019;
	Wed, 23 Sep 2026 13:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="A26c+7lx";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D89010F002
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 13:02:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68N8JTB31778021
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:02:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=5
 3cH/c0fDHdwMxzLpXDpRtb3TFK+tipZmZmn0Xm1nBM=; b=A26c+7lx9dqjST8pw
 DicAm96nVxIXBcm2qZGYSdk/P4z8mS9U7MXmqtCFPIojEQhh7f0tKRKFx+Dx1Op9
 tt5zHHBauoaA1oObL0mxcLLc8Trdh0njpbXDQ4qhvO+jlTkGUO2RfSvjwY5RKTdY
 RYKfDEnbk7tELXclPmp3Jb0nrwmizW02vyOoJ+8L+4MZMVmqiZlSJna18Fq5lyG8
 ehGCGDfKOR09p4c5feedE98bDarM5efpRR3kX4fxZm6JddlTrBDfdXgTPx/oTeW9
 hLnnSLq6N78zxKSkLbdn9fos7iLk2LbzNIBmbuheEfeZrmX/vNaSeA1vyQ/7wnXY
 ceEWQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4gsjftkmgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:02:26 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 23 Sep
 2026 14:02:13 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Wed, 23 Sep 2026 15:01:51 +0200
Subject: [PATCH i-g-t v3 3/3] tests/imagination: Add SUBMIT_JOBS tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-b4-imagination-submit-test-v3-3-d70b50b54cdb@imgtec.com>
References: <20260923-b4-imagination-submit-test-v3-0-d70b50b54cdb@imgtec.com>
In-Reply-To: <20260923-b4-imagination-submit-test-v3-0-d70b50b54cdb@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790168531; l=34939;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=NbephR4cylvYUXkAGNTK8op+3PJozKvboEtl9zSPPH8=;
 b=0XBSDoIzmMYtIqVCdM1hHZP7fiZoR5XuThTydswtS/QeWlT8rCqVY0ubUAoZMQ6mwaS2tqjvd
 mmPkaGWbr2qDVlZcH/+3DX0/idCr5aCFS51Wq+h8CCwyIGISQ95eckB
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Authority-Analysis: v=2.4 cv=GPKdgeNK c=1 sm=1 tr=0 ts=6ab3cde2 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=Q-sUgy3zgWnUnAsdL_EA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX6DHeQfTre5CI
 v+k9QgmNPP4fi01eo5jJwcG4KGfy9/gx1B117iihj/R6WKtL7HMHUG4Y6eDnZvcK5xmUtIS3PPC
 otVkKZkmvcfQ8U8bztk+LA/yd2AuWmn+dMCvjyamM8nQIl+izRU9tPrdanwFwpHMbRx+pAF1kCn
 /8EqnSrcYR2Ev7IvpG4O5oNKeF/772VVcmmXx3s6u3hkTJ/K9waEjz9pCn27ReAscd0e1QborCI
 YTbs38aopuSyQ2eXTvzkVLg8/0gr8wdr+eYDCbaG2xA6+etdRcQ8itEfJK1Ohrema2E3VvQmoxx
 ulK9ZtWeGiOrn9vZYggPiTr17QnMnnXsvxGxMmQanZgLdx5Mcc8dTbtdv4gAtmQKwPDOO0hSRyU
 72odjn5FkS2EJYO3IJqQD2pSHnjouhNAj7TPXTP14L8PMVXS4yos+SRCtVN0uZM617xI7YuKTBW
 kDiK4D5q1pZPBUNTD7Q==
X-Proofpoint-ORIG-GUID: Vba9I5NVeV7o_fMqoZG1U3nb4_w38Rp2
X-Proofpoint-GUID: Vba9I5NVeV7o_fMqoZG1U3nb4_w38Rp2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXy/hO/w0MlNYK
 Y/FXVQlUbWQya/fXtwQJgEJZK5M0lyf3YTu3cNPW6bGlcA1ThOGgqhOCULyK1nPd7JuPusrmyuz
 lVmhBjqqToMvCrGmGTnjVXWulespUok=
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Donald Robson <donald.robson@imgtec.com>

Add tests covering the SUBMIT_JOBS UAPI.
The tests exercise common submission paths and validate ioctl
parameter handling.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 lib/igt_pvr.c                       | 232 +++++++++++++
 lib/igt_pvr.h                       |  20 ++
 tests/imagination/meson.build       |   1 +
 tests/imagination/pvr_submit_jobs.c | 655 ++++++++++++++++++++++++++++++++++++
 4 files changed, 908 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index a28b11f92..799852da5 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -296,6 +296,146 @@ void igt_pvr_ioctl_vm_unmap(int fd, uint32_t vm_ctx_handle,
 	do_ioctl(fd, DRM_IOCTL_PVR_VM_UNMAP, &arg);
 }
 
+/**
+ * init_compute_context_state_stream:
+ * @stream: Pointer to the memory where the context state stream will be initialized.
+ *
+ * Function to initialize the compute context state stream.
+ *
+ * Returns: The length of the initialized stream.
+ */
+static uint32_t init_compute_context_state_stream(uint8_t *stream)
+{
+	uint8_t *stream_start = stream;
+	uint32_t stream_len;
+
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream);
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_context_pds0
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_context_pds1
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_terminate_pds
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_terminate_pds1
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_resume_pds0
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_context_pds0_b
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_resume_pds0_b
+
+	stream_len = stream - stream_start;
+	STREAM_ADD_ITEM(true, uint32_t, stream_len, stream_start); // update length
+
+	return stream_len;
+}
+
+/**
+ * init_render_context_state_stream:
+ * @stream: Pointer to the memory where the context state stream will be initialized.
+ *
+ * Function to initialize the render context state stream.
+ *
+ * Returns: The length of the initialized stream.
+ */
+static uint32_t init_render_context_state_stream(uint8_t *stream)
+{
+	uint8_t *stream_start = stream;
+	uint32_t stream_len;
+
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream);
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // geom_reg_vdm_context_state_base_addr
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // geom_reg_vdm_context_state_resume_addr
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // geom_reg_ta_context_state_base_addr
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task0
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task1
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task2
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task3
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task4
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task0
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task1
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task2
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task3
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task4
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task0
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task1
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task2
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task3
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task4
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task0
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task1
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task2
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task3
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task4
+
+	stream_len = stream - stream_start;
+	STREAM_ADD_ITEM(true, uint32_t, stream_len, stream_start); // update length
+
+	return stream_len;
+}
+
+/**
+ * igt_pvr_ioctl_create_context:
+ * @fd: File descriptor of the DRM device.
+ * @type: Type of the context to create.
+ * @vm_ctx_handle: Handle to the VM context.
+ *
+ * Function to create a device context.
+ *
+ * Returns: Handle to the created context.
+ */
+uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
+				      uint32_t vm_ctx_handle)
+{
+	#define CONTEXT_INIT_STREAM_SIZE 1024
+
+	struct drm_pvr_ioctl_create_context_args create_context_args = {
+		.type = type,
+		.priority = DRM_PVR_CTX_PRIORITY_NORMAL,
+		.vm_context_handle = vm_ctx_handle,
+	};
+
+	uint8_t init_render_context_stream[CONTEXT_INIT_STREAM_SIZE] __attribute__((aligned(8)));
+	uint8_t init_compute_context_stream[CONTEXT_INIT_STREAM_SIZE] __attribute__((aligned(8)));
+
+	switch (type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		create_context_args.callstack_addr =
+			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
+								      vm_ctx_handle,
+								      POWERVR_GPU_PAGE_SIZE));
+		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
+		create_context_args.static_context_state_len =
+			init_render_context_state_stream(init_render_context_stream);
+		break;
+
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		create_context_args.static_context_state = to_user_pointer(init_compute_context_stream);
+		create_context_args.static_context_state_len =
+			init_compute_context_state_stream(init_compute_context_stream);
+		break;
+
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		break;
+	}
+
+	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_CONTEXT, &create_context_args);
+
+	return create_context_args.handle;
+}
+
+/**
+ * igt_pvr_ioctl_destroy_context:
+ * @fd: File descriptor of the DRM device.
+ * @ctx_handle: Handle of the context to destroy.
+ *
+ * Function to destroy a device context.
+ */
+void igt_pvr_ioctl_destroy_context(int fd, uint32_t ctx_handle)
+{
+	struct drm_pvr_ioctl_destroy_context_args destroy_context_args = {
+		.handle = ctx_handle,
+	};
+
+	do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_CONTEXT, &destroy_context_args);
+}
+
 /**
  * igt_pvr_ioctl_create_free_list:
  * @fd: The file descriptor of the DRM device.
@@ -663,3 +803,95 @@ struct pvr_device_info *igt_pvr_get_device_info(int fd)
 	return &info;
 }
 
+/**
+ * igt_pvr_create_hwrt_geom_data_args:
+ * @fd: The file descriptor of the DRM device.
+ * @vm_ctx: The VM context.
+ * @geom_data_args: The geometry data arguments structure to initialize.
+ *
+ * Function to create hardware render target ioctl geometry data arguments.
+ *
+ */
+static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
+					       struct drm_pvr_create_hwrt_geom_data_args
+					       *geom_data_args)
+{
+	geom_data_args->rtc_dev_addr =
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+	geom_data_args->tpc_dev_addr =
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+	geom_data_args->vheap_table_dev_addr =
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+	geom_data_args->tpc_size = POWERVR_GPU_PAGE_SIZE;
+	geom_data_args->tpc_stride = 0x1;
+}
+
+/**
+ * igt_pvr_create_hwrt_rt_data_args:
+ * @fd: The file descriptor of the DRM device.
+ * @vm_ctx: The VM context.
+ * @rt_data_args: The render target data arguments structure to initialize.
+ *
+ * Function to create hardware render target ioctl render target data arguments.
+ *
+ */
+static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
+					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
+{
+	rt_data_args->pm_mlist_dev_addr =
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+	rt_data_args->macrotile_array_dev_addr =
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+	rt_data_args->region_header_dev_addr =
+		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
+}
+
+/**
+ * igt_pvr_ioctl_create_hwrt_dataset:
+ * @fd: The file descriptor of the DRM device.
+ * @vm_ctx: The VM context.
+ * @free_list_handles: Array of free list handles.
+ * @num_free_lists: Number of free list handles.
+ *
+ * Function to create a hardware render target dataset.
+ *
+ * Returns: Handle of the created hardware render target dataset.
+ */
+uint32_t igt_pvr_ioctl_create_hwrt_dataset(int fd, uint32_t vm_ctx, uint32_t *free_list_handles,
+					   uint32_t num_free_lists)
+{
+	struct drm_pvr_ioctl_create_hwrt_dataset_args create_hwrt_args = {
+		.width = 256,
+		.height = 256,
+		.samples = 1,
+		.layers = 1,
+		.region_header_size = 64,
+	};
+
+	igt_pvr_create_hwrt_geom_data_args(fd, vm_ctx, &create_hwrt_args.geom_data_args);
+	igt_pvr_create_hwrt_rt_data_args(fd, vm_ctx, &create_hwrt_args.rt_data_args[0]);
+	igt_pvr_create_hwrt_rt_data_args(fd, vm_ctx, &create_hwrt_args.rt_data_args[1]);
+
+	for (uint32_t i = 0; i < num_free_lists; i++)
+		create_hwrt_args.free_list_handles[i] = free_list_handles[i];
+
+	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_HWRT_DATASET, &create_hwrt_args);
+
+	return create_hwrt_args.handle;
+}
+
+/**
+ * igt_pvr_ioctl_destroy_hwrt_dataset:
+ * @fd: The file descriptor of the DRM device.
+ * @hwrt_handle: The handle of the hardware render target dataset to destroy.
+ *
+ * Function to destroy a hardware render target dataset.
+ */
+void igt_pvr_ioctl_destroy_hwrt_dataset(int fd, uint32_t hwrt_handle)
+{
+	struct drm_pvr_ioctl_destroy_hwrt_dataset_args destroy_hwrt_args = {
+		.handle = hwrt_handle,
+	};
+
+	do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_HWRT_DATASET, &destroy_hwrt_args);
+}
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
index aa022c158..b6e3dd676 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -11,6 +11,18 @@
 #include "imagination/pvr_device_info.h"
 #include "pvr_drm.h"
 
+#define DRM_PVR_EMPTY_OBJ_ARRAY(type) \
+	{ .stride = sizeof(type), .count = 0, .array = 0 }
+
+#define STREAM_ADD_ITEM(condition, type, data, stream) \
+	do { \
+		if (condition) { \
+			type *item = (type *)(stream); \
+			*item = data; \
+			stream += sizeof(type); \
+		} \
+	} while (0)
+
 struct igt_pvr_allocation {
 	uint32_t bo_handle;
 	size_t size;
@@ -42,6 +54,10 @@ void igt_pvr_ioctl_vm_map(int fd, uint32_t vm_ctx_handle, uint32_t handle,
 void igt_pvr_ioctl_vm_unmap(int fd, uint32_t vm_ctx_handle,
 			    uint64_t device_addr, uint64_t size);
 
+uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
+				      uint32_t vm_ctx_handle);
+void igt_pvr_ioctl_destroy_context(int fd, uint32_t ctx_handle);
+
 uint32_t igt_pvr_ioctl_create_free_list(int fd, uint32_t vm_ctx_handle,
 					uint64_t gpu_addr);
 void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle);
@@ -59,4 +75,8 @@ void igt_pvr_free_all(int fd);
 
 struct pvr_device_info *igt_pvr_get_device_info(int fd);
 
+uint32_t igt_pvr_ioctl_create_hwrt_dataset(int fd, uint32_t vm_ctx, uint32_t *free_list_handles,
+					   uint32_t num_free_lists);
+void igt_pvr_ioctl_destroy_hwrt_dataset(int fd, uint32_t hwrt_handle);
+
 #endif /* IGT_PVR_H */
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index 59749b51e..7ae8ddd0a 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -6,6 +6,7 @@ pvr_progs = [ 'pvr_dev_query',
 	      'pvr_hwrt',
 	      'pvr_quirks_enhancements',
 	      'pvr_runtime_info',
+	      'pvr_submit_jobs',
 	      'pvr_vm_context',
 	    ]
 
diff --git a/tests/imagination/pvr_submit_jobs.c b/tests/imagination/pvr_submit_jobs.c
new file mode 100644
index 000000000..566f9d2b2
--- /dev/null
+++ b/tests/imagination/pvr_submit_jobs.c
@@ -0,0 +1,655 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
+
+#include <errno.h>
+#include <sys/mman.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <time.h>
+
+#define PVR_JOB_STREAM_SIZE 256
+#define PVR_SYNCOBJ_WAIT_TIMEOUT_NS NSEC_PER_SEC
+
+#define PVR_BO_SIZE 0x2000
+#define PVR_NUM_FREE_LISTS 2
+#define PVR_INVALID_HANDLE 999
+#define PVR_STREAM_TERMINATE_BLOCK_TYPE 0xc0000000
+#define PVR_CDM_STREAM_TERMINATE_BLOCK_TYPE 0x80000000
+#define PVR_UNUSED_JOB_FLAG (1u << 15)
+
+#define ROGUE_PDSINST_OPCODEC_SP            (0x0000000dU)
+#define ROGUE_PDSINST_HALT_OPCODE_SHIFT     (28U)
+#define ROGUE_PDSINST_OPCODESP_HALT         (0x00000006U)
+#define ROGUE_PDSINST_HALT_OP_SHIFT         (23U)
+
+#define TRUNCATE_64BITS_TO_32BITS(expr) ((uint32_t)(expr))
+#define ROGUE_VDMCTRL_BLOCK_HEADER_BLOCK_TYPE_PPP_STATE_UPDATE                        (0x00000000U)
+#define ROGUE_VDMCTRL_PPP_STATE0_WORD_COUNT_SHIFT                                     (8U)
+#define ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_ALIGNSHIFT                                   (32U)
+#define ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_SHIFT                                        (0U)
+#define ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_ALIGNSHIFT                                   (2U)
+#define ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_SHIFT                                        (2U)
+#define ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_CLRMSK                                       (0x00000003U)
+
+#define ROGUE_TA_STATE_HEADER_PRES_TERMINATE_EN                                       (0x02000000U)
+
+#define ROGUE_TA_STATE_TERMINATE1_CLIP_LEFT_SHIFT           (23U)
+#define ROGUE_TA_STATE_TERMINATE0_CLIP_RIGHT_SHIFT          (18U)
+#define ROGUE_TA_STATE_TERMINATE0_CLIP_TOP_SHIFT            (9U)
+#define ROGUE_TA_STATE_TERMINATE0_CLIP_BOTTOM_SHIFT         (0U)
+
+static uint32_t init_compute_cmd_stream(int fd, uint32_t vm_ctx,
+					uint8_t *stream,
+					struct pvr_device_info *device_info)
+{
+	uint8_t *stream_start = stream;
+	uint64_t cdm_stream_gpu_addr;
+	void *cdm_stream_map;
+	uint32_t stream_length;
+
+	struct igt_pvr_allocation *cdm_stream_alloc = igt_pvr_allocate_general(fd, vm_ctx, 0x1000);
+
+	cdm_stream_gpu_addr = igt_pvr_get_gpu_addr(cdm_stream_alloc);
+
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
+
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // tpu_border_colour_table
+	STREAM_ADD_ITEM(true, uint64_t, cdm_stream_gpu_addr, stream); // cdm_ctrl_stream_base
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdm_context_state_base_addr
+	STREAM_ADD_ITEM(device_info->quirks.has_brn49927, uint32_t, 0, stream); // tpu
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // cdm_resume_pds1
+	STREAM_ADD_ITEM(device_info->features.has_compute_morton_capable,
+			uint32_t, 0, stream); // cdm_item
+	STREAM_ADD_ITEM(device_info->features.has_cluster_grouping,
+			uint32_t, 0, stream); // compute_cluster
+	STREAM_ADD_ITEM(device_info->features.has_tpu_dm_global_registers,
+			uint32_t, 0, stream); // tpu_tag_cdm_ctrl
+	STREAM_ADD_ITEM(device_info->features.has_gpu_multicore_support,
+			uint32_t, 0, stream); // execute_count
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
+
+	stream_length = stream - stream_start;
+
+	STREAM_ADD_ITEM(true, uint32_t, stream_length, stream_start); // update length
+
+	cdm_stream_map = igt_pvr_get_cpu_addr(fd, cdm_stream_alloc);
+
+	((uint32_t *)cdm_stream_map)[0] =
+			PVR_CDM_STREAM_TERMINATE_BLOCK_TYPE;
+	return stream_length;
+}
+
+static int64_t syncobj_wait_timeout(void)
+{
+	struct timespec now;
+
+	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &now), 0);
+
+	return (int64_t)now.tv_sec * NSEC_PER_SEC + now.tv_nsec +
+	       PVR_SYNCOBJ_WAIT_TIMEOUT_NS;
+}
+
+static uint32_t init_geometry_cmd_stream(uint8_t *stream, struct pvr_device_info *device_info,
+					 uint64_t vdm_gpu_addr)
+{
+	uint8_t *stream_start = stream;
+	uint32_t stream_length;
+
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
+
+	STREAM_ADD_ITEM(true, uint64_t, vdm_gpu_addr, stream); // vdm_ctrl_stream_base
+	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // tpu_border_colour_table
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // ppp_ctrl
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // te_psg
+	STREAM_ADD_ITEM(device_info->quirks.has_brn49927, uint32_t, 0, stream); // tpu
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // vdm_context_resume_task0_size
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // view_idx
+	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
+
+	stream_length = stream - stream_start;
+
+	STREAM_ADD_ITEM(true, uint32_t, stream_length, stream_start); // update length
+	return stream_length;
+}
+
+static uint32_t pds_inst_encode_halt(void)
+{
+	uint32_t encoded = 0;
+
+	encoded |=
+		(uint32_t)((uint32_t)ROGUE_PDSINST_OPCODEC_SP << ROGUE_PDSINST_HALT_OPCODE_SHIFT);
+	encoded |=
+		(uint32_t)((uint32_t)ROGUE_PDSINST_OPCODESP_HALT << ROGUE_PDSINST_HALT_OP_SHIFT);
+	return encoded;
+}
+
+int igt_main()
+{
+	const uint32_t num_free_lists = PVR_NUM_FREE_LISTS;
+	uint32_t free_list_handles[num_free_lists];
+	uint8_t compute_cmd_stream[PVR_JOB_STREAM_SIZE]	__attribute__((aligned(8)));
+	uint8_t geometry_cmd_stream[PVR_JOB_STREAM_SIZE] __attribute__((aligned(8)));
+
+	uint32_t compute_vm_ctx_handle;
+	uint32_t render_vm_ctx_handle;
+	uint32_t transfer_vm_ctx_handle;
+
+	uint32_t compute_stream_length;
+	uint32_t geometry_stream_length;
+
+	uint32_t compute_ctx_handle;
+	uint32_t render_ctx_handle;
+	uint32_t transfer_ctx_handle;
+
+	size_t size = PVR_BO_SIZE;
+	uint32_t hwrt_handle;
+	int fd;
+
+	struct pvr_device_info *device_info;
+
+	struct igt_pvr_allocation *free_lists_obj_alloc;
+	struct igt_pvr_allocation *ppp_alloc;
+	struct igt_pvr_allocation *vdm_alloc;
+	struct igt_pvr_allocation *compute_pds_alloc;
+
+	uint32_t *ppp_buffer_base;
+	uint32_t *vdm_buffer;
+	uint64_t *pds_buffer_base;
+
+	igt_fixture()
+	{
+		fd = drm_open_driver(DRIVER_POWERVR);
+
+		igt_pvr_init_allocators(fd);
+
+		device_info = igt_pvr_get_device_info(fd);
+
+		compute_vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
+		igt_assert(compute_vm_ctx_handle);
+
+		render_vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
+		igt_assert(render_vm_ctx_handle);
+
+		transfer_vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
+		igt_assert(transfer_vm_ctx_handle);
+
+		compute_ctx_handle =
+			igt_pvr_ioctl_create_context(fd,
+						     DRM_PVR_CTX_TYPE_COMPUTE,
+						     compute_vm_ctx_handle);
+		igt_assert(compute_ctx_handle);
+
+		transfer_ctx_handle =
+			igt_pvr_ioctl_create_context(fd,
+						     DRM_PVR_CTX_TYPE_TRANSFER_FRAG,
+						     transfer_vm_ctx_handle);
+		igt_assert(transfer_ctx_handle);
+
+		render_ctx_handle =
+			igt_pvr_ioctl_create_context(fd,
+						     DRM_PVR_CTX_TYPE_RENDER,
+						     render_vm_ctx_handle);
+		igt_assert(render_ctx_handle);
+
+		compute_stream_length =
+			init_compute_cmd_stream(fd, compute_vm_ctx_handle,
+						(uint8_t *)&compute_cmd_stream, device_info);
+
+		/* PDS for compute */
+		compute_pds_alloc =
+			igt_pvr_allocate(fd, compute_vm_ctx_handle, 0x4000,
+					 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS,
+					 DRM_PVR_HEAP_PDS_CODE_DATA);
+		pds_buffer_base = igt_pvr_get_cpu_addr(fd, compute_pds_alloc);
+
+		pds_buffer_base[0x20] = pds_inst_encode_halt();
+
+		vdm_alloc =
+			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
+
+		vdm_buffer = igt_pvr_get_cpu_addr(fd, vdm_alloc);
+
+		size = PVR_BO_SIZE;
+
+		ppp_alloc =
+			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
+
+		ppp_buffer_base = igt_pvr_get_cpu_addr(fd, ppp_alloc);
+
+		/* PPP state for terminate */
+		ppp_buffer_base[0] = ROGUE_TA_STATE_HEADER_PRES_TERMINATE_EN;
+		ppp_buffer_base[1] = (256 << ROGUE_TA_STATE_TERMINATE0_CLIP_RIGHT_SHIFT) |
+					(0 << ROGUE_TA_STATE_TERMINATE0_CLIP_TOP_SHIFT) |
+					(256 << ROGUE_TA_STATE_TERMINATE0_CLIP_BOTTOM_SHIFT);
+		ppp_buffer_base[2] = (0 << ROGUE_TA_STATE_TERMINATE1_CLIP_LEFT_SHIFT);
+
+		*vdm_buffer++ =
+			ROGUE_VDMCTRL_BLOCK_HEADER_BLOCK_TYPE_PPP_STATE_UPDATE |
+			(3 << ROGUE_VDMCTRL_PPP_STATE0_WORD_COUNT_SHIFT) |
+			((igt_pvr_get_gpu_addr(ppp_alloc)
+			>> ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_ALIGNSHIFT)
+			<< ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_SHIFT);
+		*vdm_buffer++ =
+			TRUNCATE_64BITS_TO_32BITS(((igt_pvr_get_gpu_addr(ppp_alloc)
+						  >> ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_ALIGNSHIFT)
+						  << ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_SHIFT) &
+						  ~ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_CLRMSK);
+
+		*vdm_buffer++ =	PVR_STREAM_TERMINATE_BLOCK_TYPE;
+		geometry_stream_length =
+			init_geometry_cmd_stream((uint8_t *)&geometry_cmd_stream,
+						 device_info,
+						 igt_pvr_get_gpu_addr(vdm_alloc));
+
+		/* Also need free lists and hwrt data for render jobs. */
+		free_lists_obj_alloc =
+			igt_pvr_allocate(fd, render_vm_ctx_handle,
+					 size * 4, DRM_PVR_BO_PM_FW_PROTECT,
+					 DRM_PVR_HEAP_GENERAL);
+
+		for (int i = 0; i < num_free_lists; i++) {
+			uint64_t free_list_gpu_addr = igt_pvr_get_gpu_addr(free_lists_obj_alloc);
+
+			free_list_handles[i] =
+				igt_pvr_ioctl_create_free_list(fd,
+							       render_vm_ctx_handle,
+							       free_list_gpu_addr + i * size);
+		}
+
+		hwrt_handle =
+			igt_pvr_ioctl_create_hwrt_dataset(fd, render_vm_ctx_handle,
+							  free_list_handles,
+							  num_free_lists);
+		igt_assert(hwrt_handle);
+	}
+
+	/* Invalid job and context combinations. */
+	igt_subtest_group() {
+		igt_subtest("submit-jobs-fail-zero-length")
+		{
+			struct drm_pvr_ioctl_submit_jobs_args args = {0};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-compute-no-cmd-stream")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = 0,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+
+			job.cmd_stream = 0;
+			job.cmd_stream_len = sizeof(compute_cmd_stream);
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-compute-with-hwrt")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+				.hwrt.set_handle = 1,
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+
+			job.hwrt.set_handle = 0;
+			job.hwrt.data_index = 1;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-compute-bad-context")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = PVR_INVALID_HANDLE,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+
+			job.context_handle = 0;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-bad-flags")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = PVR_UNUSED_JOB_FLAG,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			/* Check the invalid flag is still unused! */
+			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK);
+			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK);
+			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK);
+			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK);
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+
+			job.context_handle = transfer_ctx_handle;
+			job.type = DRM_PVR_JOB_TYPE_TRANSFER_FRAG;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+
+			job.hwrt.set_handle = hwrt_handle;
+			job.context_handle = render_ctx_handle;
+			job.type = DRM_PVR_JOB_TYPE_GEOMETRY;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+			job.type = DRM_PVR_JOB_TYPE_FRAGMENT;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-compute-wrong-context")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = transfer_ctx_handle,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+			job.context_handle = render_ctx_handle;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-transfer-wrong-context")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_TRANSFER_FRAG,
+				.context_handle = compute_ctx_handle,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+			job.context_handle = render_ctx_handle;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-compute-too-big")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = UINT32_MAX,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, ENOMEM);
+		}
+	}
+
+	/* Compute jobs with sync operations. */
+	igt_subtest_group() {
+		igt_subtest("submit-jobs-compute-single-wait")
+		{
+			struct drm_pvr_sync_op wait = {
+				.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
+					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
+			};
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &wait),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			drmSyncobjCreate(fd, 0, &wait.handle);
+			igt_assert_neq(wait.handle, 0);
+
+			/* Clear the wait! */
+			drmSyncobjSignal(fd, &wait.handle, 1);
+
+			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
+		}
+
+		igt_subtest("submit-jobs-fail-compute-no-syncop-handle")
+		{
+			struct drm_pvr_sync_op wait = {
+				.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
+					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
+			};
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &wait),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, ENOENT);
+		}
+
+		igt_subtest("submit-jobs-fail-compute-bad-syncop-handle")
+		{
+			struct drm_pvr_sync_op wait = {
+				.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
+					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
+				.handle = PVR_INVALID_HANDLE,
+			};
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &wait),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, ENOENT);
+		}
+
+		igt_subtest("submit-jobs-compute-single")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+				.sync_ops = DRM_PVR_EMPTY_OBJ_ARRAY(struct drm_pvr_sync_op),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
+		}
+
+		igt_subtest("submit-jobs-compute-single-signal")
+		{
+			struct drm_pvr_sync_op signal = {
+				.flags = DRM_PVR_SYNC_OP_FLAG_SIGNAL |
+					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
+			};
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &signal),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			drmSyncobjCreate(fd, 0, &signal.handle);
+			igt_assert_neq(signal.handle, 0);
+
+			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
+			igt_assert_eq(drmSyncobjWait(fd, &signal.handle, 1, syncobj_wait_timeout(),
+						     0, NULL), 0);
+		}
+
+		igt_subtest("submit-jobs-compute-single-wait-and-signal")
+		{
+			struct drm_pvr_sync_op syncs[] = {
+				{
+					.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
+						DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
+				},
+				{
+					.flags = DRM_PVR_SYNC_OP_FLAG_SIGNAL |
+						DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
+				},
+			};
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_COMPUTE,
+				.context_handle = compute_ctx_handle,
+				.flags = 0,
+				.cmd_stream_len = compute_stream_length,
+				.cmd_stream = to_user_pointer(&compute_cmd_stream),
+				.sync_ops = DRM_PVR_OBJ_ARRAY(ARRAY_SIZE(syncs), syncs),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			drmSyncobjCreate(fd, 0, &syncs[0].handle);
+			igt_assert_neq(syncs[0].handle, 0);
+			drmSyncobjCreate(fd, 0, &syncs[1].handle);
+			igt_assert_neq(syncs[1].handle, 0);
+
+			/* Clear the wait! */
+			drmSyncobjSignal(fd, &syncs[0].handle, 1);
+
+			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
+			igt_assert_eq(drmSyncobjWait(fd, &syncs[1].handle,
+						     1, syncobj_wait_timeout(),
+						     0, NULL), 0);
+		}
+	}
+
+	/* Graphics-specific jobs and contexts. */
+	igt_subtest_group() {
+		igt_subtest("submit-jobs-fail-render-without-hwrt")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_GEOMETRY,
+				.context_handle = render_ctx_handle,
+				.flags = DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST |
+						DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST,
+				.cmd_stream_len = geometry_stream_length,
+				.cmd_stream = to_user_pointer(&geometry_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-geometry-wrong-context")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_GEOMETRY,
+				.context_handle = compute_ctx_handle,
+				.hwrt.set_handle = hwrt_handle,
+				.cmd_stream_len = geometry_stream_length,
+				.cmd_stream = to_user_pointer(&geometry_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+			job.context_handle = transfer_ctx_handle;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+
+		igt_subtest("submit-jobs-fail-fragment-wrong-context")
+		{
+			struct drm_pvr_job job = {
+				.type = DRM_PVR_JOB_TYPE_FRAGMENT,
+				.context_handle = compute_ctx_handle,
+				.hwrt.set_handle = hwrt_handle,
+				.cmd_stream_len = geometry_stream_length,
+				.cmd_stream = to_user_pointer(&geometry_cmd_stream),
+			};
+			struct drm_pvr_ioctl_submit_jobs_args args = {
+				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
+			};
+
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+			job.context_handle = transfer_ctx_handle;
+			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
+		}
+	}
+
+	igt_fixture()
+	{
+		igt_pvr_ioctl_destroy_hwrt_dataset(fd, hwrt_handle);
+
+		for (int i = 0; i < num_free_lists; i++)
+			igt_pvr_ioctl_destroy_free_list(fd, free_list_handles[i]);
+
+		igt_pvr_free_all(fd);
+
+		igt_pvr_ioctl_destroy_context(fd, compute_ctx_handle);
+		igt_pvr_ioctl_destroy_context(fd, render_ctx_handle);
+		igt_pvr_ioctl_destroy_context(fd, transfer_ctx_handle);
+
+		igt_pvr_ioctl_destroy_vm_context(fd, compute_vm_ctx_handle, 0);
+		igt_pvr_ioctl_destroy_vm_context(fd, render_vm_ctx_handle, 0);
+		igt_pvr_ioctl_destroy_vm_context(fd, transfer_vm_ctx_handle, 0);
+
+		drm_close_driver(fd);
+	}
+}

-- 
2.43.0

