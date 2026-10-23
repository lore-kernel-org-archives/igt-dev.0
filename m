Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4B606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=OnXPkV/g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768B910E62F;
	Fri, 23 Oct 2026 14:54:59 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38C010E496
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=FFB/0pP0YHBQTcxt9dVE78ADu/X25cjy0S9N3dUl1nA=; b=
 OnXPkV/gQZpSnxJsrlFRuMo/waJ1T7I/obQ5U2GWhhwjNF29KYLFZ+cJnYUwbFRuyc+6ocWr3cKSS
 MOMai+ur7RQBrZeLHsb/ZVZprQg4x+/cOcN1Q5PYOeHa9WNwNtMxQFLtinsQzRt3smAT6w/hT7VzK
 uTCIIiZbx9FFRL5sq/pdycn0JYlnr3qm1bxU73MUINdPNhQxSYm1YZyBdtVxFJj4OBH+hndVk1X9I
 JWRqxAw3YSMf0vlrjPNnSzG0YyYDIS/NNNaalC99JFzicC0hbE/EQwDn0JNO4YCgwnuOML3nz/GDR
 gkPzfwi9vmnd/JWJ4sTG2uIF66PSnfZpfg==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbO-007yo4-0R; Fri, 23 Oct 2026 16:50:38 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Arvind Yadav <arvind.yadav@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH i-g-t 01/10] drm-uapi/amdgpu: Sync with upstream header
Date: Fri, 23 Oct 2026 15:50:23 +0100
Message-ID: <20261023145032.22650-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
References: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sync to kernel commit
13af55f71399 ("drm/amdgpu/userq: fix struct drm_amdgpu_info_device padding for 32bit compile")
.

Note this also includes resolving two upstream ordering mishaps:

1.
struct drm_amdgpu_info_hw_ip->num_userq_slots was actually upstreamed as
userq_num_slots so that needs to be atomically renamed.

2.
struct drm_amdgpu_info_uq_fw_areas is a much worse situation where it
landed to both libdrm and IGT, while the kernel landed it in compatible
layout but under the name of drm_amdgpu_info_uq_metadata. As shipping
libdrm now has public API operating under the wrong name we need to wrap
it inside a compatible structure and keep the name..

3.
Padding field inside struct drm_amdgpu_info_device was also recently
moved but I think that was has no functional impact on IGT.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Arvind Yadav <arvind.yadav@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Jesse.Zhang <Jesse.Zhang@amd.com>
Cc: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 include/drm-uapi/amdgpu_drm.h       | 164 ++++++++++++++++++++++------
 lib/amdgpu/amd_command_submission.c |  20 ++--
 lib/amdgpu/amd_compute.c            |   4 +-
 lib/amdgpu/amd_deadlock_helpers.c   |   4 +-
 lib/amdgpu/amd_ip_blocks.h          |  14 +++
 5 files changed, 159 insertions(+), 47 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 321f374d4b9a..42a5fa8ad6b0 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -57,6 +57,8 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_GEM_LIST_HANDLES	0x19
+#define DRM_AMDGPU_PROC_OPTIONS		0x1A
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +79,8 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_LIST_HANDLES, struct drm_amdgpu_gem_list_handles)
+#define DRM_IOCTL_AMDGPU_PROC_OPTIONS	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_PROC_OPTIONS, struct drm_amdgpu_proc_options)
 
 /**
  * DOC: memory domains
@@ -116,7 +120,7 @@ extern "C" {
 					 AMDGPU_GEM_DOMAIN_VRAM | \
 					 AMDGPU_GEM_DOMAIN_GDS | \
 					 AMDGPU_GEM_DOMAIN_GWS | \
-					 AMDGPU_GEM_DOMAIN_OA | \
+					 AMDGPU_GEM_DOMAIN_OA |	\
 					 AMDGPU_GEM_DOMAIN_DOORBELL)
 
 /* Flag that CPU access will be required for the case of VRAM domain */
@@ -330,6 +334,7 @@ union drm_amdgpu_ctx {
 #define AMDGPU_USERQ_OP_FREE	2
 
 /* queue priority levels */
+/* low < normal low < normal high < high */
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
@@ -365,6 +370,9 @@ struct drm_amdgpu_userq_in {
 	 * and doorbell_offset in the doorbell bo.
 	 */
 	__u32   doorbell_offset;
+	/**
+	 * @flags: flags used for queue parameters
+	 */
 	__u32 flags;
 	/**
 	 * @queue_va: Virtual address of the GPU memory which holds the queue
@@ -473,7 +481,9 @@ struct drm_amdgpu_userq_signal {
 	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
 	 * @syncobj_handles.
 	 */
-	__u64	num_syncobj_handles;
+	__u16	num_syncobj_handles;
+	__u16	pad0;
+	__u32	pad1;
 	/**
 	 * @bo_read_handles: The list of BO handles that the submitted user queue job
 	 * is using for read only. This will update BO fences in the kernel.
@@ -557,7 +567,8 @@ struct drm_amdgpu_userq_wait {
 	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
 	 * @syncobj_handles.
 	 */
-	__u32	num_syncobj_handles;
+	__u16	num_syncobj_handles;
+	__u16	pad0;
 	/**
 	 * @num_bo_read_handles: A count that represents the number of read BO handles in
 	 * @bo_read_handles.
@@ -667,13 +678,20 @@ struct drm_amdgpu_gem_userptr {
 /* GFX12 and later: */
 #define AMDGPU_TILING_GFX12_SWIZZLE_MODE_SHIFT			0
 #define AMDGPU_TILING_GFX12_SWIZZLE_MODE_MASK			0x7
-/* These are DCC recompression setting for memory management: */
+/* These are DCC recompression settings for memory management: */
 #define AMDGPU_TILING_GFX12_DCC_MAX_COMPRESSED_BLOCK_SHIFT	3
 #define AMDGPU_TILING_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK	0x3 /* 0:64B, 1:128B, 2:256B */
 #define AMDGPU_TILING_GFX12_DCC_NUMBER_TYPE_SHIFT		5
 #define AMDGPU_TILING_GFX12_DCC_NUMBER_TYPE_MASK		0x7 /* CB_COLOR0_INFO.NUMBER_TYPE */
 #define AMDGPU_TILING_GFX12_DCC_DATA_FORMAT_SHIFT		8
 #define AMDGPU_TILING_GFX12_DCC_DATA_FORMAT_MASK		0x3f /* [0:4]:CB_COLOR0_INFO.FORMAT, [5]:MM */
+/* When clearing the buffer or moving it from VRAM to GTT, don't compress and set DCC metadata
+ * to uncompressed. Set when parts of an allocation bypass DCC and read raw data. */
+#define AMDGPU_TILING_GFX12_DCC_WRITE_COMPRESS_DISABLE_SHIFT	14
+#define AMDGPU_TILING_GFX12_DCC_WRITE_COMPRESS_DISABLE_MASK	0x1
+/* bit gap */
+#define AMDGPU_TILING_GFX12_SCANOUT_SHIFT			63
+#define AMDGPU_TILING_GFX12_SCANOUT_MASK			0x1
 
 /* Set/Get helpers for tiling flags. */
 #define AMDGPU_TILING_SET(field, value) \
@@ -789,6 +807,21 @@ union drm_amdgpu_wait_fences {
 
 #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO	0
 #define AMDGPU_GEM_OP_SET_PLACEMENT		1
+#define AMDGPU_GEM_OP_GET_MAPPING_INFO		2
+
+struct drm_amdgpu_gem_vm_entry {
+	/* Start of mapping (in bytes) */
+	__u64 addr;
+
+	/* Size of mapping (in bytes) */
+	__u64 size;
+
+	/* Mapping offset */
+	__u64 offset;
+
+	/* flags needed to recreate mapping */
+	__u64 flags;
+};
 
 /* Sets or returns a value associated with a buffer. */
 struct drm_amdgpu_gem_op {
@@ -796,8 +829,44 @@ struct drm_amdgpu_gem_op {
 	__u32	handle;
 	/** AMDGPU_GEM_OP_* */
 	__u32	op;
-	/** Input or return value */
+	/** Input or return value. For MAPPING_INFO op: pointer to array of struct drm_amdgpu_gem_vm_entry */
 	__u64	value;
+	/** For MAPPING_INFO op: number of mappings (in/out) */
+	__u32	num_entries;
+
+	__u32	padding;
+};
+
+#define AMDGPU_GEM_LIST_HANDLES_FLAG_IS_IMPORT	(1 << 0)
+
+struct drm_amdgpu_gem_list_handles {
+	/* User pointer to array of drm_amdgpu_gem_bo_info_entry */
+	__u64   entries;
+
+	/* Size of entries buffer / Number of handles in process (if larger than size of buffer, must retry) */
+	__u32   num_entries;
+
+	__u32 padding;
+};
+
+struct drm_amdgpu_gem_list_handles_entry {
+	/* gem handle of buffer object */
+	__u32 gem_handle;
+
+	/* Currently just one flag: IS_IMPORT */
+	__u32 flags;
+
+	/* Size of bo */
+	__u64 size;
+
+	/* Preferred domains for GEM_CREATE */
+	__u64 preferred_domains;
+
+	/* GEM_CREATE flags for re-creation of buffer */
+	__u64 alloc_flags;
+
+	/* physical start_addr alignment in bytes for some HW requirements */
+	__u64 alignment;
 };
 
 #define AMDGPU_VA_OP_MAP			1
@@ -815,7 +884,7 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_PAGE_WRITEABLE	(1 << 2)
 /* executable mapping, new for VI */
 #define AMDGPU_VM_PAGE_EXECUTABLE	(1 << 3)
-/* partially resident texture */
+/* unmapped page of partially resident textures */
 #define AMDGPU_VM_PAGE_PRT		(1 << 4)
 /* MTYPE flags use bit 5 to 8 */
 #define AMDGPU_VM_MTYPE_MASK		(0xf << 5)
@@ -1020,10 +1089,21 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
  *  Query h/w info: Flag that this is integrated (a.h.a. fusion) GPU
  *
  */
-#define AMDGPU_IDS_FLAGS_FUSION         0x1
-#define AMDGPU_IDS_FLAGS_PREEMPTION     0x2
-#define AMDGPU_IDS_FLAGS_TMZ            0x4
-#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD 0x8
+#define AMDGPU_IDS_FLAGS_FUSION			0x01
+#define AMDGPU_IDS_FLAGS_PREEMPTION		0x02
+#define AMDGPU_IDS_FLAGS_TMZ			0x04
+#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD	0x08
+#define AMDGPU_IDS_FLAGS_GANG_SUBMIT		0x10
+
+/*
+ *  Query h/w info: Flag identifying VF/PF/PT mode
+ *
+ */
+#define AMDGPU_IDS_FLAGS_MODE_MASK      0x300
+#define AMDGPU_IDS_FLAGS_MODE_SHIFT     0x8
+#define AMDGPU_IDS_FLAGS_MODE_PF        0x0
+#define AMDGPU_IDS_FLAGS_MODE_VF        0x1
+#define AMDGPU_IDS_FLAGS_MODE_PT        0x2
 
 /* indicate if acceleration can be working */
 #define AMDGPU_INFO_ACCEL_WORKING		0x00
@@ -1347,6 +1427,8 @@ struct drm_amdgpu_info_vbios {
 #define AMDGPU_VRAM_TYPE_DDR5  10
 #define AMDGPU_VRAM_TYPE_LPDDR4 11
 #define AMDGPU_VRAM_TYPE_LPDDR5 12
+#define AMDGPU_VRAM_TYPE_HBM3E 13
+#define AMDGPU_VRAM_TYPE_HBM4 14
 
 struct drm_amdgpu_info_device {
 	/** PCI Device ID */
@@ -1430,6 +1512,7 @@ struct drm_amdgpu_info_device {
 	__u64 high_va_max;
 	/* gfx10 pa_sc_tile_steering_override */
 	__u32 pa_sc_tile_steering_override;
+	__u32 pad;
 	/* disabled TCCs */
 	__u64 tcc_disabled_mask;
 	__u64 min_engine_clock;
@@ -1454,7 +1537,6 @@ struct drm_amdgpu_info_device {
 	__u32 csa_alignment;
 	/* Userq IP mask (1 << AMDGPU_HW_IP_*) */
 	__u32 userq_ip_mask;
-	__u32 pad;
 };
 
 struct drm_amdgpu_info_hw_ip {
@@ -1471,28 +1553,8 @@ struct drm_amdgpu_info_hw_ip {
 	__u32  available_rings;
 	/** version info: bits 23:16 major, 15:8 minor, 7:0 revision */
 	__u32  ip_discovery_version;
-	__u32  num_userq_slots;
-};
-
-/* GFX metadata BO sizes and alignment info (in bytes) */
-struct drm_amdgpu_info_uq_fw_areas_gfx {
-	/* shadow area size */
-	__u32 shadow_size;
-	/* shadow area base virtual mem alignment */
-	__u32 shadow_alignment;
-	/* context save area size */
-	__u32 csa_size;
-	/* context save area base virtual mem alignment */
-	__u32 csa_alignment;
-};
-
-/* IP specific fw related information used in the
- * subquery AMDGPU_INFO_UQ_FW_AREAS
- */
-struct drm_amdgpu_info_uq_fw_areas {
-	union {
-		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
-	};
+	/* Userq available slots */
+	__u32  userq_num_slots;
 };
 
 struct drm_amdgpu_info_num_handles {
@@ -1569,9 +1631,25 @@ struct drm_amdgpu_info_uq_metadata_gfx {
 	__u32 csa_alignment;
 };
 
+struct drm_amdgpu_info_uq_metadata_compute {
+	/* EOP size for gfx11 */
+	__u32 eop_size;
+	/* EOP base virtual alignment for gfx11 */
+	__u32 eop_alignment;
+};
+
+struct drm_amdgpu_info_uq_metadata_sdma {
+	/* context save area size for sdma6 */
+	__u32 csa_size;
+	/* context save area base virtual alignment for sdma6 */
+	__u32 csa_alignment;
+};
+
 struct drm_amdgpu_info_uq_metadata {
 	union {
 		struct drm_amdgpu_info_uq_metadata_gfx gfx;
+		struct drm_amdgpu_info_uq_metadata_compute compute;
+		struct drm_amdgpu_info_uq_metadata_sdma sdma;
 	};
 };
 
@@ -1594,8 +1672,28 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_10_3_6			149 /* GC 10.3.6 */
 #define AMDGPU_FAMILY_GC_10_3_7			151 /* GC 10.3.7 */
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
+#define AMDGPU_FAMILY_GC_11_5_4			154 /* GC 11.5.4 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
+/*
+ * Definition of user options
+ *
+ * option: AMDGPU_PROC_OPTIONS_OP_KFD_SIGBUS_DELAY
+ *    0:          Disable sigbus delay - SIGBUS will be raised immediately
+ *    0xFFFFFFFF: SIGBUS will not be raised
+ *    other:      Set the sigbus delay in milliseconds
+ */
+#define AMDGPU_PROC_OPTIONS_OP_KFD_SIGBUS_DELAY		0
+
+#define AMDGPU_PROC_OPTIONS_KFD_SIGBUS_DELAY_DISABLED	0xFFFFFFFFu
+
+struct drm_amdgpu_proc_options {
+	__u32 op;
+	struct {
+		__u32 value;
+	} kfd_sigbus_delay;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index c7b36970e192..f7101015efe6 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -182,8 +182,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 	amdgpu_dma_limits_query(device, &limits);
 
 	if (user_queue)
-		available_rings = hw_ip_info.num_userq_slots ?
-			((1 << hw_ip_info.num_userq_slots) - 1) : 1;
+		available_rings = hw_ip_info.userq_num_slots ?
+			((1 << hw_ip_info.userq_num_slots) - 1) : 1;
 	else
 		available_rings = hw_ip_info.available_rings;
 
@@ -409,8 +409,8 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
@@ -545,8 +545,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
@@ -656,8 +656,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
@@ -1466,7 +1466,7 @@ bool cmd_ring_available(amdgpu_device_handle device,
 
 	if (user_queue) {
 		/* For user queues, check user queue slots */
-		uint32_t userq_slots = hw_ip_info.num_userq_slots;
+		uint32_t userq_slots = hw_ip_info.userq_num_slots;
 
 		return (ring_id < userq_slots);
 	} else {
@@ -1490,7 +1490,7 @@ uint32_t cmd_get_available_rings(amdgpu_device_handle device,
 		return 0;
 
 	if (user_queue) {
-		return hw_ip_info.num_userq_slots;
+		return hw_ip_info.userq_num_slots;
 	} else {
 		return __builtin_popcountll(hw_ip_info.available_rings);
 	}
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 1f618d5a9509..ec230f5873a7 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -58,8 +58,8 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 4d3b34003b2b..470f16567e90 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -920,8 +920,8 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = info.num_userq_slots ?
-			((1 << info.num_userq_slots) -1) : 1;
+		available_rings = info.userq_num_slots ?
+			((1 << info.userq_num_slots) -1) : 1;
 	else
 		available_rings = info.available_rings;
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 3c694ddc56b1..1dfa4faa9e4c 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -275,6 +275,20 @@ amdgpu_dma_default_bytes(const struct amdgpu_dma_limits *lim,
 	}
 }
 
+/*
+ * Workaround a process failed where drm_amdgpu_info_uq_fw_areas landed to
+ * IGT and libdrm before landing to kernel. When it landed to kernel it got
+ * renamed to struct drm_amdgpu_info_uq_metadata but now shipping libdrm
+ * has API working with the stale name..
+ */
+struct drm_amdgpu_info_uq_fw_areas {
+	union {
+		struct drm_amdgpu_info_uq_metadata_gfx gfx;
+		struct drm_amdgpu_info_uq_metadata_compute compute;
+		struct drm_amdgpu_info_uq_metadata_sdma sdma;
+	};
+};
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
-- 
2.56.0

