Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C36FC5AC7C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 10:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085EC10F45A;
	Fri,  7 Aug 2026 10:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0o4nwKKV";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1440810E3B7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 04:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck1bjR4TIjuewRvtOAZwzyEiN3wDMmi2ox6eX5GpyGyupg3kWDcVU4CjoN8ov69fjV1ZHq/ckFyTWSOZPCJnIl4NjrgLMztQuCh+qpXlCr4KxnezmdphEehWrhThPgfsXkaPGp+lqJcQtJhWszh3QRghsW1pJXwwpQQ+tud/AR/7U2b8eE8jXgKR2fb8bRcdiPnl1g/X81vmASORJalapjSaxjVh69GBU7mwWWxVla1CrkvNqcia8Fge2hoDlT1lwr1G/bXBo1CLqYdGot0b4A+0FfcLMCbXF8aM2OBV2WUK56bSjyigVikbwIDsHZ92r0w1lFCpiQFhESIGKu+5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfrYaYpBjCtko4iVsTiHT06NOw271Tvv85zrEy42Pos=;
 b=wRH5lSUYsGDUiEt0y6gJqL7pRMjKJ2A1dW6b2AsxMwN2KCxUgRyprVaJFkYEKiku+o9uKe3xbXPS7H+uyHpCzladmBFoDdEh2ww7l4j9NME3AOczwLoGzhJrhAmqFBqkXrLbp+UC6Z58FHvbKdBlrNpDgQA/aq0BjseuzJ+KFVNqj/YoI6COc+0AAp2jHA7a2GRF8G6K3w3uOJfmTxtG9bimSeD7/V4Un+FOZWSoSZ5W3E5/+zzmc2YkAhqrO300CmwAF6REddl7ugIrWvK713zI+T7YJCtwegc9t4xRTYBhBd/6Zt4gyrj+IfDrG8xtMN8FwbBFwFAJQWfxQOwRaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfrYaYpBjCtko4iVsTiHT06NOw271Tvv85zrEy42Pos=;
 b=0o4nwKKV1bnnkMDHT/DEKFEkUBWNk3uzHUWJvAj2obRGW5wgXtfG5RavZS/WU7MbhlmwoLoTet1KVj6PaOaDVGbWvFFbR88hKmNKw9oWEmE9bzVWg7fC13lEc1m3KhHCQJfQIV1ZRIj0J5emYl34fcmauK2GXQqb/M1cIB/a004=
Received: from BY3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:254::24)
 by SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Fri, 7 Aug
 2026 04:56:35 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::73) by BY3PR05CA0019.outlook.office365.com
 (2603:10b6:a03:254::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Fri, 7
 Aug 2026 04:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 04:56:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 23:56:33 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 23:56:33 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 23:56:30 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Huang Rui
 <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen
 <Xiaogang.Chen@amd.com>, Jenny Liu <Jenny-Jing.Liu@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 1/2] lib/amdgpu: add SVM helper library and uAPI
Date: Fri, 7 Aug 2026 12:56:19 +0800
Message-ID: <20260807045620.31954-2-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807045620.31954-1-Junhua.Shen@amd.com>
References: <20260807045620.31954-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|SJ0PR12MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4bff7c-cabf-4076-ed28-08def4404172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|10067099003|11063799006|3023799007|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DQDlS6qyjfiGQ45A4wKPaAe9JmJIdrTpqlLSAe9P5WaUeV3E9RH1oL6ATlqy2CPZJZFgWt2PMr9uYuHjBpi7stqSVOWIzIyYWVmJ8r8gmaiRNfPwWldU5143LwKqo7IPXSuwH4ljI5Nsckl27yXV8ETBfT9HsjbgnzyGijm4mdbFds+99W1auDlQP5vlfUHdcUCWIRSqKR/y49AcpP4YY7YR+m65Z73RI0FtpvTZicV1+FXD0y/ziXD0Q+EVd8FiQKZ/+tJ2PW/7fBZXaDUjbysdqQC0VWZ+4sleBCpjjzwiBu+YWofq2QkK+pfPv5lS//Ne6ZbXnvnem6g4ysdvjFo8rc3beEaWO0KjnjudtZtztRj4Be5IAYtCkRLtqx1nPWubreUSXXB1Fy6X2nn8MMaOmjS3nfdr4oN/N9PKZBe16myqoxWIL+B88ECPAth13YwXxc1JiyxnvcIo+oaspUTgLsP9wh/3Ds+BkJZYF2d6uiJbtdL/pKq3Fw+FHmdTxTpJiqUVhvu7nFG8apavBWNBFAJpATdTAu1T0nLjkD1PGZEVipKUwZYvnAVk9b7wimfB2HhC9oeoOGenLWngJxupIyGNeVixeg+rIFpqJJyUwIs4/QvrwNq7YZ+xJY9xB9LfnOIak94mEsmogda8W4YXB6GRfqSvbplNbsbLSpXymGdkLq/o+xvxGyEoFqBQy3cJ2xRapdsatlwMDFMDeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(10067099003)(11063799006)(3023799007)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jHt9Cr4PqLB7cRlUHWzy+gwt+A67v8hx0wWBjavIcK3x9oVEiGgjd/IKLtkJqhIKqkXaQM107EmxOZJdXumlY4gPCnHxzQ88K4EPKYD0vyBP0bp5YVUSj1TIkOGo2YOHzMjqKf4QCH7gMXfrb3xH5tLCIDrUq1LZyfYzDKxiCnTumvKvsFPxnCyOoxobeVVIacGzvZg8It8eJsrOyFLnu+Hm/4aJI1kRHsqFHZCJTZlNo5UQBUPzrorljFXw9Ut9wHWWZQwm8VhoK1lzwQBagwrSgryzVlLTl+NrBXbAwU1/Gx7N4Q9HEHdVzH7E49fvicMDjTubDXxeldCqZcloFthjkVW1WZWbZnkWnG0gXZC3ikY+eh94IOh75ar7pcA/qu723JEYDSi6sYR7m68+bi0lJ3hnJeHZ7uF2aAMWikmIW+5rON+KUOxnAp+JmapI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 04:56:34.4968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4bff7c-cabf-4076-ed28-08def4404172
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8113
X-Mailman-Approved-At: Fri, 07 Aug 2026 10:35:08 +0000
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

Add a reusable SVM helper library (lib/amdgpu/amd_svm.{c,h}) wrapping the
amdgpu-drm-svm uapi (DRM_IOCTL_AMDGPU_GEM_SVM) via the render-node CS
path, along with the corresponding amdgpu_drm.h uapi definitions and
meson wiring.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 106 +++++++++++++++++
 lib/amdgpu/amd_svm.c          | 215 ++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_svm.h          |  42 +++++++
 lib/meson.build               |   1 +
 4 files changed, 364 insertions(+)
 create mode 100644 lib/amdgpu/amd_svm.c
 create mode 100644 lib/amdgpu/amd_svm.h

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
diff --git a/lib/amdgpu/amd_svm.c b/lib/amdgpu/amd_svm.c
new file mode 100644
index 000000000..21db3e546
--- /dev/null
+++ b/lib/amdgpu/amd_svm.c
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#include "amd_svm.h"
+
+#include "amd_memory.h"
+#include "amd_PM4.h"
+#include "amd_ip_blocks.h"
+#include "compute_utils/amd_dispatch_helpers.h"
+#include "igt.h"
+
+#include <errno.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/user.h>
+#include <inttypes.h>
+
+/*
+ * The core SVM ioctl wrappers (amdgpu_svm_set_attr / amdgpu_svm_get_attr /
+ * amdgpu_svm_reset_attr) are implemented in libdrm and declared in <amdgpu.h>.
+ * Only the IGT-specific convenience helpers live here.
+ */
+
+int amdgpu_svm_register_range(amdgpu_device_handle dev,
+			      void *addr, uint64_t size, uint32_t nattr,
+			      struct drm_amdgpu_svm_attribute *attrs)
+{
+	return amdgpu_svm_set_attr(dev, (uint64_t)(uintptr_t)addr,
+				    size, nattr, attrs);
+}
+
+int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
+				void *addr, uint64_t size)
+{
+	return amdgpu_svm_reset_attr(dev, (uint64_t)(uintptr_t)addr, size);
+}
+
+int amdgpu_svm_set_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size, uint32_t location)
+{
+	struct drm_amdgpu_svm_attribute attr = {
+		AMDGPU_SVM_ATTR_PREFETCH_LOC, location
+	};
+
+	return amdgpu_svm_set_attr(dev, (uint64_t)(uintptr_t)addr,
+				   size, 1, &attr);
+}
+
+int amdgpu_svm_get_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size,
+				uint32_t *out)
+{
+	struct drm_amdgpu_svm_attribute attr = {
+		AMDGPU_SVM_ATTR_PREFETCH_LOC, 0
+	};
+	int r;
+
+	r = amdgpu_svm_get_attr(dev, (uint64_t)(uintptr_t)addr,
+				size, 1, &attr);
+	if (r == 0)
+		*out = attr.value;
+	return r;
+}
+
+/**
+ * svm_compute_copy_dispatch - Copy one DWORD src->dst via a compute shader
+ * @device: AMDGPU device handle
+ * @version: GPU version for register programming
+ * @shader_mc_addr: Shader ISA GPU address (caller must keep the BO mapped)
+ * @src_mc_addr: Source GPU virtual address to read from
+ * @dst_mc_addr: Destination GPU virtual address to write to
+ *
+ * Builds and submits a single self-contained compute dispatch that copies one
+ * DWORD from @src_mc_addr to @dst_mc_addr using the shader at @shader_mc_addr.
+ * A fresh context and command buffer are used for every call to avoid state
+ * pollution.
+ *
+ * Only the internal command buffer is placed in the BO list; @src_mc_addr and
+ * @dst_mc_addr are treated as raw GPU virtual addresses, so they may be SVM
+ * VAs (CPU VA == GPU VA) that have no backing amdgpu BO.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+int svm_compute_copy_dispatch(amdgpu_device_handle device,
+				   uint32_t version,
+				   uint64_t shader_mc_addr,
+				   uint64_t src_mc_addr,
+				   uint64_t dst_mc_addr)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_cmd = NULL;
+	uint32_t *ptr_cmd = NULL;
+	uint64_t mc_cmd = 0;
+	amdgpu_va_handle va_cmd = 0;
+	struct amdgpu_cs_request ib_req = {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+	amdgpu_bo_list_handle bo_list = NULL;
+	struct amdgpu_cs_fence fence = {0};
+	uint32_t expired = 0;
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+	int ret = 0;
+
+	/* Create fresh context for each dispatch to avoid state pollution */
+	if (amdgpu_cs_ctx_create(device, &context_handle) != 0) {
+		igt_info("Failed to create context\n");
+		return -1;
+	}
+
+	/* Command buffer for PM4 packets */
+	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+	    AMDGPU_GEM_DOMAIN_GTT, 0, &bo_cmd, (void **)&ptr_cmd, &mc_cmd, &va_cmd) != 0) {
+		igt_info("Failed to allocate command buffer\n");
+		ret = -1;
+		goto cleanup_context;
+	}
+	memset(ptr_cmd, 0, 4096);
+	base_cmd->attach_buf(base_cmd, ptr_cmd, 4096);
+
+	/* Initialize compute dispatch state */
+	amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, version);
+	amdgpu_dispatch_write_cumask(base_cmd, version);
+	amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, version, 0);
+
+	/* Program user data registers:
+	 * s[0:1] = source address (64-bit)
+	 * s[2:3] = destination address (64-bit)
+	 */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x240);
+	base_cmd->emit(base_cmd, src_mc_addr & 0xFFFFFFFF);
+	base_cmd->emit(base_cmd, src_mc_addr >> 32);
+	base_cmd->emit(base_cmd, dst_mc_addr & 0xFFFFFFFF);
+	base_cmd->emit(base_cmd, dst_mc_addr >> 32);
+
+	/* Dispatch compute shader with 1x1x1 workgroup */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+	base_cmd->emit(base_cmd, 0x10);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
+
+	/* Submit command buffer */
+	if (amdgpu_bo_list_create(device, 1, &bo_cmd, NULL, &bo_list) != 0) {
+		igt_info("Failed to create BO list\n");
+		ret = -1;
+		goto cleanup_cmd;
+	}
+
+	ib_info.ib_mc_address = mc_cmd;
+	ib_info.size = base_cmd->cdw;
+	ib_req.ip_type = AMDGPU_HW_IP_COMPUTE;
+	ib_req.ring = 0;
+	ib_req.resources = bo_list;
+	ib_req.number_of_ibs = 1;
+	ib_req.ibs = &ib_info;
+	ib_req.fence_info.handle = NULL;
+
+	if (amdgpu_cs_submit(context_handle, 0, &ib_req, 1) != 0) {
+		igt_info("Failed to submit CS\n");
+		ret = -1;
+		goto cleanup_bo_list;
+	}
+
+	/* Wait for completion */
+	fence.context = context_handle;
+	fence.ip_type = AMDGPU_HW_IP_COMPUTE;
+	fence.ip_instance = 0;
+	fence.ring = 0;
+	fence.fence = ib_req.seq_no;
+
+	if (amdgpu_cs_query_fence_status(&fence, AMDGPU_TIMEOUT_INFINITE, 0, &expired) != 0) {
+		igt_info("Fence wait failed\n");
+		ret = -1;
+		goto cleanup_bo_list;
+	}
+
+	if (!expired) {
+		igt_info("Fence not expired\n");
+		ret = -1;
+	}
+
+cleanup_bo_list:
+	amdgpu_bo_list_destroy(bo_list);
+cleanup_cmd:
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
+cleanup_context:
+	amdgpu_cs_ctx_free(context_handle);
+	free_cmd_base(base_cmd);
+
+	return ret;
+}
diff --git a/lib/amdgpu/amd_svm.h b/lib/amdgpu/amd_svm.h
new file mode 100644
index 000000000..4c1a175bc
--- /dev/null
+++ b/lib/amdgpu/amd_svm.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_SVM_H
+#define AMD_SVM_H
+
+#include "drmtest.h"
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+/*
+ * The IGT-specific convenience helpers below are thin wrappers around that
+ * core libdrm svm set/get/reset APIs.
+ */
+
+int amdgpu_svm_register_range(amdgpu_device_handle dev,
+			      void *addr, uint64_t size, uint32_t nattr,
+			      struct drm_amdgpu_svm_attribute *attrs);
+
+int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
+				void *addr, uint64_t size);
+
+int amdgpu_svm_set_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size, uint32_t location);
+int amdgpu_svm_get_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size,
+				uint32_t *out);
+
+/*
+ * Copy a single DWORD from @src_mc_addr to @dst_mc_addr with a compute
+ * shader.  Both addresses are treated as raw GPU virtual addresses, so they
+ * may be SVM VAs (CPU VA == GPU VA) that have no backing amdgpu BO; only the
+ * internal command buffer is placed in the submission BO list.
+ */
+int svm_compute_copy_dispatch(amdgpu_device_handle device,
+			      uint32_t version,
+			      uint64_t shader_mc_addr,
+			      uint64_t src_mc_addr,
+			      uint64_t dst_mc_addr);
+
+#endif /* AMD_SVM_H */
diff --git a/lib/meson.build b/lib/meson.build
index 3001b473e..6e1d6634c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -180,6 +180,7 @@ if libdrm_amdgpu.found()
 	lib_deps += libdrm_amdgpu
 	lib_sources += [
 		'amdgpu/amd_memory.c',
+		'amdgpu/amd_svm.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
 		'amdgpu/amd_cs_radv.c',
-- 
2.34.1

