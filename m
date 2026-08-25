Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C89C61DB6
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 07:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A5F10E817;
	Tue, 25 Aug 2026 07:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FZh1pvJD";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010070.outbound.protection.outlook.com [52.101.61.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F58410E14D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 07:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTEozFb+g+I6ciqqp7O8muVim3rwb5EF770CJwYct3WNuR1iiSTpLTIl4e4kjnAxCwyZUNr4GtP1ZWbCHMg1OQH5NMYvPOIqtDe++H4r6NZFJIwKGUiRB79319+waW19l3Sd7dMSpKFrD+895rIxOtcFkOxOZpDd7/aViQ6BpzHk7RcgAblPeD4AcqC/Ywq4nIZigKvHZVzK4AdVww8QRTW7NcTZYdQD3Hyb1IWMt6pjmQ50YcU1sgBUn0SFWFrnVPEA8pu1Fv8q6W26fVLVq/kxyUqodLAC9cPCUCcHVDIARqmMGIIZpWFQVbH34t/raoNGg3rZqi+2zEQg0RnKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+0E0SG/7Ul/BpyGtfJd+2iSPHbHKl4ZuhS4smSMqDk=;
 b=T8FXxZ2y7CEM5fwZe7B2Vpfp8AEIZV2AFSmpQNRedKSxPM4y8jH0mya42OUkeQZesxDL3WQGzcegSBRhBbB0PYfa5bqwtDCScc+VUvzVnp4CBrJfNeOzREuvES53eoIVy5Zrd1O/jooPjBNXMpHbVNQPMyx9Ut3+x43MyZU5JZNuM8b360u4wGbvTKOwvjaLOQ4whGYDqfb7sJY18m8qAVfLAxsmVokpLyT5n6nV3MKgwPrb5cBEUPQphCO80Rd6AqrFp7kuIPj6uYyAUMsZ8kfXGk8QWbrgzp8NRPDslWnsqsDpbuDrahIe6nEDx+tZZgCBbZpmLUSwo0X7Jjnbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+0E0SG/7Ul/BpyGtfJd+2iSPHbHKl4ZuhS4smSMqDk=;
 b=FZh1pvJD4nhqSua6AABo8ci938bm5nGxCxiGlcohpOrObRz0fIT8GioL0e9wjTxR0SSyDmTIfr555IWWbs9eeanAsSKybzN0WqR5rIjRvk2DDij+6zxilZEyZABXNn1lypdJ8LNkgR4nD7Tm4qaPzBv5wAexPhp9N3ss9CPGVGg=
Received: from PH7PR13CA0010.namprd13.prod.outlook.com (2603:10b6:510:174::20)
 by MW4PR12MB6997.namprd12.prod.outlook.com (2603:10b6:303:20a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 25 Aug
 2026 07:23:11 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:510:174:cafe::3b) by PH7PR13CA0010.outlook.office365.com
 (2603:10b6:510:174::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 07:23:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb08.amd.com (149.199.90.133) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Tue, 25 Aug 2026 07:23:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 02:23:07 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 02:23:04 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Huang Rui
 <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen
 <Xiaogang.Chen@amd.com>, Jenny Liu <Jenny-Jing.Liu@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 1/3] include/drm-uapi: sync amdgpu_drm.h for GEM_SVM
 uAPI
Date: Tue, 25 Aug 2026 15:22:58 +0800
Message-ID: <20260825072300.16348-2-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825072300.16348-1-Junhua.Shen@amd.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|MW4PR12MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 83296e9d-8a0b-442b-6c48-08df0279b801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: C/2AFba1vIwdaZ5C7lD/G5hYbQ45IOw/CivFP74n0yUW9aJaCF7vMXAk2/MahKLPukQorR/L4pZ5CIElPmoYvfgEkfg+1KhPyHLUOlmmc33F/WBUDSRW1SvgZG8yJKCycbDQ+byTpxTlHOOqKSMLArlXDjwJG47DujRtP8qZLwcJ+3TUxV7cwgml8ba6xQh2m7q5QjJm4ib7ArM3K3P4GsD7Bmb6FFU2yoKuuqvi0B4Cl4W4/xmZsi5yS7fz51wChzeoXXGeovAdbUcwNKQ1LWs+nef0I2sd9qzOMaG3OPLchZQkgXND1qSDzo6ezJwN9Uc6YYzKGgaftg8Y8wWYoEsiDwlsGwmIsEJ+t7tV2pV+sIupdPB4DXe4CvxxhjLde14j7aAoT6hb/WIFb1VWNdhlFLCSBl4fETkkd9pe+HlYik7AwSpnEFfL8z/nRbSJWZJXSfgwXVD9216b85Vp6pC2laMiQpP+H9C4f0EX+f+tbJW7dqmDjLNwJUJQNFem5toNYmXQuhZDBAPXLoPD5aHqn4A61/YA/f2u3rvHTA9FkJwI7HWkh3XDGnRarVdaWxhZlzs5dCxrd9C8aApuUyyltlv1n9sg5NJmABmcFI5/nSGqnqiU10ylxjYVrOtT3g9i0tptkmGV2dXVKOrt7RjC9C+JSwn8TGrq0/9KVEVUGq+yRbC5lazAp2CGlUxee6yPFN9gT1Pp2HUDNPAPFA==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: y7lSXPsWGYqx3wsR0a1yNqX+SUqUws04+jcJpgcj+rOApFYkW86j1n6sOs/ilKZ1DQQkyRHzwgUM2cZ1q4+03FI2vb/V3Zj8/oH1MX06ICaA1qVWzXdapVnRsCrZDvuKLUQbeoRLPhKs1KLnMrjj6be209zkUrSGiEF/l3CCCrJx7xM3YlE3nAr9sLhtyTca6YSljg/k7B3xTJwZkwYtiLWO3QKzvFxnB1R221VDIG51vb+OCdQaLbroLhvDTFZ7RAOu/onp5kQ10QXEyCsE6o1NkAwIjSRxAb/cMSV63AkT02YXBSR2fn4RnuZwbjICNO6UGwD7SOGhdneRzXs6UB564jApLIY4xF1lEpaMe+AMdDKW91clGvM152arYhzD7wZsZhlS2yHDjClknuoHzRTaJCln0F23aDyvQjwoTGXpRL5ZRmQCpB/XMQfHS6ks
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:23:11.0537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83296e9d-8a0b-442b-6c48-08df0279b801
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6997
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

Sync the amdgpu_drm.h uapi definitions for the amdgpu-drm-svm feature:
the DRM_IOCTL_AMDGPU_GEM_SVM ioctl number, the SVM attribute enum and
the drm_amdgpu_svm_attribute struct.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 106 ++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ca24519c7..1e7bb8c06 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -57,6 +57,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_GEM_SVM		0x1B
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +78,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_GEM_SVM	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_SVM, struct drm_amdgpu_gem_svm)
 
 /**
  * DOC: memory domains
@@ -1590,6 +1592,110 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
+/**
+ * enum amdgpu_ioctl_svm_op - operation selector for DRM_IOCTL_AMDGPU_GEM_SVM.
+ * @AMDGPU_SVM_OP_SET_ATTR: apply the attributes in @attrs_ptr to the VA range.
+ * @AMDGPU_SVM_OP_GET_ATTR: read back the current value of each attribute
+ *                          listed in @attrs_ptr for the given VA range.
+ * @AMDGPU_SVM_OP_RESET_ATTR: reset all attributes for the VA range to their
+ *                            default values. @attrs_ptr and @nattr are ignored.
+ */
+enum amdgpu_ioctl_svm_op {
+	AMDGPU_SVM_OP_SET_ATTR = 0,
+	AMDGPU_SVM_OP_GET_ATTR = 1,
+	AMDGPU_SVM_OP_RESET_ATTR = 2,
+};
+
+/**
+ * enum amdgpu_ioctl_svm_access - values for AMDGPU_SVM_ATTR_ACCESS.
+ * @AMDGPU_SVM_ACCESS_INACCESSIBLE: GPU must not access the range; any access
+ *                                  is a fault.
+ * @AMDGPU_SVM_ACCESS_IN_PLACE:     GPU may access the range only at its
+ *                                  current backing store; the driver will
+ *                                  never migrate pages to local VRAM.
+ * @AMDGPU_SVM_ACCESS_ALLOW_MIGRATE: GPU may access the range and the driver
+ *                                  is allowed (but not required) to migrate
+ *                                  pages between system memory and local
+ *                                  VRAM to satisfy the preferred/prefetch
+ *                                  location.
+ */
+enum amdgpu_ioctl_svm_access {
+	AMDGPU_SVM_ACCESS_INACCESSIBLE		= 0,
+	AMDGPU_SVM_ACCESS_IN_PLACE			= 1,
+	AMDGPU_SVM_ACCESS_ALLOW_MIGRATE		= 2,
+};
+
+/**
+ * enum amdgpu_svm_location - values for AMDGPU_SVM_ATTR_PREFERRED_LOC /
+ *                            AMDGPU_SVM_ATTR_PREFETCH_LOC.
+ * @AMDGPU_SVM_LOCATION_SYSMEM:    back the range with system memory.
+ * @AMDGPU_SVM_LOCATION_UNDEFINED: no preference; the driver chooses.
+ */
+enum amdgpu_ioctl_svm_location {
+	AMDGPU_SVM_LOCATION_SYSMEM	= 0,
+	AMDGPU_SVM_LOCATION_UNDEFINED	= 0xffffffffU,
+};
+
+/**
+ * enum amdgpu_ioctl_svm_attr_type - attribute selector for
+ *                                   &drm_amdgpu_svm_attribute.type.
+ *
+ * @AMDGPU_SVM_ATTR_PREFERRED_LOC: Preferred backing location for the range.
+ *	Value is one of &enum amdgpu_ioctl_svm_location.
+ * @AMDGPU_SVM_ATTR_PREFETCH_LOC: Prefetch target for the range. Value is
+ *	one of &enum amdgpu_ioctl_svm_location.
+ * @AMDGPU_SVM_ATTR_ACCESS: GPU access policy for the range. Value is one
+ *	of &enum amdgpu_ioctl_svm_access.
+ * @AMDGPU_SVM_ATTR_GRANULARITY: log2 of the migration granularity in pages.
+ * @AMDGPU_SVM_ATTR_HOST_ACCESS: Guarantee host access to memory.
+ * @AMDGPU_SVM_ATTR_COHERENT: Fine-grained coherency between all devices
+ *	with access.
+ * @AMDGPU_SVM_ATTR_EXT_COHERENT: Fine-grained coherency between all devices
+ *	using device-scope atomics.
+ * @AMDGPU_SVM_ATTR_HIVE_LOCAL: Use any GPU in the same XGMI hive as the
+ *	preferred device.
+ * @AMDGPU_SVM_ATTR_GPU_RO: GPUs only read the range, allowing replication.
+ * @AMDGPU_SVM_ATTR_GPU_EXEC: Allow execution on GPU.
+ * @AMDGPU_SVM_ATTR_GPU_READ_MOSTLY: GPUs mostly read the range; may allow
+ *	optimizations similar to GPU_RO, but writes still fault.
+ */
+enum amdgpu_ioctl_svm_attr_type {
+	AMDGPU_SVM_ATTR_PREFERRED_LOC		= 0,
+	AMDGPU_SVM_ATTR_PREFETCH_LOC		= 1,
+	AMDGPU_SVM_ATTR_ACCESS				= 2,
+	AMDGPU_SVM_ATTR_GRANULARITY			= 3,
+	/* Boolean attributes below: value must be 0 or 1. */
+	AMDGPU_SVM_ATTR_HOST_ACCESS			= 4,
+	AMDGPU_SVM_ATTR_COHERENT			= 5,
+	AMDGPU_SVM_ATTR_EXT_COHERENT		= 6,
+	AMDGPU_SVM_ATTR_HIVE_LOCAL			= 7,
+	AMDGPU_SVM_ATTR_GPU_RO				= 8,
+	AMDGPU_SVM_ATTR_GPU_EXEC			= 9,
+	AMDGPU_SVM_ATTR_GPU_READ_MOSTLY		= 10,
+};
+
+/* One (type, value) pair carried by DRM_IOCTL_AMDGPU_GEM_SVM. */
+struct drm_amdgpu_svm_attribute {
+	/** AMDGPU_SVM_ATTR_* */
+	__u32 type;
+	/** Attribute value; interpretation depends on @type */
+	__u32 value;
+};
+
+/* Argument for DRM_IOCTL_AMDGPU_GEM_SVM. */
+struct drm_amdgpu_gem_svm {
+	/** Start of the virtual address range */
+	__u64 start_addr;
+	/** Size of the range in bytes */
+	__u64 size;
+	/** AMDGPU_SVM_OP_* */
+	__u32 operation;
+	/** Number of struct drm_amdgpu_svm_attribute entries in @attrs_ptr */
+	__u32 nattr;
+	/** User pointer to an array of @nattr struct drm_amdgpu_svm_attribute */
+	__u64 attrs_ptr;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

