Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4636606A32C
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FTd1ctgu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977B410EA0E;
	Fri,  6 Nov 2026 13:15:36 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FDB10E3BC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 13:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euxBAjljwQuHw5Tc/auJq1aeMQKwbLRoyJNHPyv8WbYkJJTujwN0JTIpLrmfjnI2eLFBs2u1dyWccjXNGYLhSBcJD9SSQ/TsS/OjKs86eboVjEksm1ub3rbU/GOlf24y4QlQfRKu1UG6WLzEz694PKvpQh1hkOeWlL1Bl8aRgKHbwsYFJ8tmbZQHP0lvHqmk2M8k/YszKoKePt4E0bHC7cJm8oGOPuMf9WWm70qeCUTjBSXhODuFbiiTKYE3NF8UxRZIZGVqa7j2ClPUfo6XVWpnfhS+VYjNRg1tM7UOkEE4kA6sa1QlvQSJPnDyuaa5iflxZS1fnhsrR6Gb0mcXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uXpocwMVwEKkkqHr+v7oNUd+zjsv8qCK1puUiZJu98=;
 b=mZPZ6CJSikPALm80dcazunuF7gZpXn+TZjQoq3mSgzj8NlkDfK+C+dFHkn2vAdfNgdku2lP7ckg0iUgOvfLOItzd5YJE66AUHpO4/Oi9GMiZXXL6WkNRnsICNJb625Qqx0gkeJY9LLDIQ+h1Q0nAWk9QBir9mCNSx4D/l8pvmSDleqdXl+If4Id9vR7EATXmGPWwY3Pyq3h9AVMZmcOCBBNOA0M+OzHhQZqOoBlMJry8rpSMWxR1hJB3ENVxGCS6cf73g5IoRnurtl/0jbn1egya7h7R8g52z2Oz2+CeewOLsZE3lRiAFwpksa3PmP+j1smzSg5T0OiaDQJC3jiuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uXpocwMVwEKkkqHr+v7oNUd+zjsv8qCK1puUiZJu98=;
 b=FTd1ctgu58b3S4IwF0bWvReiYjZs0Kzb7qrcrFF0cbKaFZD+9RpIPH0qCjlsrbkKtIte1CdBxopxVXPSEuystxtvIeoNZwdGEr6cehX5EevNJkCPqOcIde2XOMx7DNSJRo8M6FMxrRKE+FTATS1EziA2AmhFdPTd9tJANSovR90=
Received: from MW4PR04CA0074.namprd04.prod.outlook.com (2603:10b6:303:6b::19)
 by IA1PR12MB9500.namprd12.prod.outlook.com (2603:10b6:208:596::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 13:13:43 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::4b) by MW4PR04CA0074.outlook.office365.com
 (2603:10b6:303:6b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 13:13:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:13:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:13:41 -0600
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 07:13:38 -0600
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Christian Koenig" <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen <Xiaogang.Chen@amd.com>, Jenny Liu
 <Jenny-Jing.Liu@amd.com>, Honglei Huang <honglei1.huang@amd.com>, "Zhu
 Lingshan" <lingshan.zhu@amd.com>, Yiru Ma <yiru.ma@amd.com>, Junhua Shen
 <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v3 1/3] include/drm-uapi: sync amdgpu_drm.h for GEM_SVM
 uAPI
Date: Fri, 6 Nov 2026 21:13:27 +0800
Message-ID: <20261106131329.73236-2-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106131329.73236-1-Junhua.Shen@amd.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
 <20261106131329.73236-1-Junhua.Shen@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d2ae59-eb1a-4b0d-9bdf-08df3c07c7b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|261022105027099003|261026121527099003|261028144727099003|261102123227099003|261026140227099003|261021121427099003|10067099003|261009221227099003|261009220027099003|261009223327099003|261009223027099003|261009221727099003|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: kGAA0aPRoH7Sue8etYUNiZNnyRATI487ZVARP07eqa3GtWiKuWnbhdTORM8uGMuqW1TcRXgw0+s7XBMXBDF26q3ZYCnEXY1LVIHTC0fbbJBm8dKv4WgunTEYfU7KF02heyCVDGHYQXbFaPeOfi1i2muSagDHO8+ddV6AMQiggTt5wslHxnKAiSjz/rh8jh0IPBnef4G0dLvrTD4KmvOpzbA1F24+ZCjlfHODKuA81fFB19BzZgnvbSfRrP+ui3kNpKBKl19BBp9YVkaeBi/48RamISPZKkIM6yShBXIBlDvwHyeybcQCwP4xdnOc5hD5pkzGte5dW57Eb8lVAwfSUhMZ+kdEwsjNkw82k78AfQihXlJ8x31VoPa/S94hQVi7ozbiLeDBBnQfVcZEFU/2zi5Pusw+V2MKLXrLmTrX/0xgxkqflmsa/wBSbA007Zev6NNOplgScaTUiV28M0GkSaVIS9mBqRrjljhOEFHlY4PAJ+/QsO8vyBaqy0nsgMwSRCJA6wdbMFMOyvyVkg6pX09ka6xYfSmWEAf7uRnoUF7n7Qa1kIXikrZkIiNA3ZFtbnBb/hRnzLgvVr/VDiqvLyyFttuv5VKzgwHAkoarOjvCOEFrX3rVmLS2AXHp/bYI7ucpiWStJHKhXS35foYTVIMSq5aEqqFXKwbgd1GGoOJX+Jt0o26nS0EcwZWs5cKh/esEDoPxvJabXIG+heo2dA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(261022105027099003)(261026121527099003)(261028144727099003)(261102123227099003)(261026140227099003)(261021121427099003)(10067099003)(261009221227099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221727099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UwkWzm5gJjStslE4Z2h74RLpi4SdwEzP1/f0UnrOARWfP5ask7u1NeRptYzHtiTIEwwPfuL0RN0VfXb1zBYCTJGh3mYTzZh52z5StRpxTiH7o2DzsB4LLu0F89wg1Air2v/+fGMAcO+MuznTUW2/YZ5JxLZRfh6xTlA2XijGbfkvdP3hyujOSOTEQniIP1QICg4YcMV0J2dZeI+k2yAJ1jro7IFAmLcTVteygKP3U7DbGXd4Sa9wrwJtv8N3LgqYlbju/nzpqSwYm46EzgP3x62zHHUsKyD1LFM+cDwHfYgxbdkvtiIHfQJoFFTmXkOmIOCaEuv1dbHc0E9qeDfx54UdvTiEBjmtig8mnh/Zm2VEK/jYRaDX+zdTKviwD6ZVhdfhQhJuJBs0WrUVouvCRSAFz6kadfa+A6Z+OCCNaWQ5VgETmqsDoF4SiPfCS0gN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:13:42.1625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d2ae59-eb1a-4b0d-9bdf-08df3c07c7b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sync the amdgpu_drm.h uapi definitions for the amdgpu-drm-svm feature:
the DRM_IOCTL_AMDGPU_GEM_SVM ioctl and its argument and attribute
definitions.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 125 ++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ca24519c7..27991b87f 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -57,6 +57,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_GEM_SVM		0x1C
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +78,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_GEM_SVM	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_SVM, struct drm_amdgpu_gem_svm)
 
 /**
  * DOC: memory domains
@@ -1590,6 +1592,129 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
+/**
+ * enum amdgpu_ioctl_svm_op - operation selector for DRM_IOCTL_AMDGPU_GEM_SVM.
+ * @AMDGPU_SVM_OP_SET_ATTR: apply the attributes in @attrs_ptr to the VA range
+ *                          [@start_addr, @start_addr + @size).
+ * @AMDGPU_SVM_OP_GET_ATTR: query the attributes at @start_addr. The caller
+ *                          lists the attribute types it is interested in via
+ *                          @attrs_ptr; the kernel fills in their current
+ *                          values and updates @size to the length of the
+ *                          contiguous range starting at @start_addr over
+ *                          which those values are constant. Input @size is an
+ *                          upper bound. This lets user space (e.g. CRIU) walk
+ *                          the address space and read back all attributes
+ *                          without knowing the range boundaries in advance.
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
+ * enum amdgpu_ioctl_svm_location - values for AMDGPU_SVM_ATTR_PREFERRED_LOC /
+ *                            AMDGPU_SVM_ATTR_PREFETCH_LOC.
+ * @AMDGPU_SVM_LOCATION_SYSMEM:    back the range with system memory.
+ * @AMDGPU_SVM_LOCATION_UNDEFINED: no preference; the driver chooses.
+ * @AMDGPU_SVM_LOCATION_LOCAL:     back the range with the local VRAM of the
+ *                                 device the SVM context belongs to.
+ * @AMDGPU_SVM_LOCATION_HIVE:      back the range with the VRAM of any device
+ *                                 in the same XGMI hive as the local device.
+ *
+ * The location is expressed as a fixed enum rather than a device file
+ * descriptor on purpose: a descriptor has no stable meaning across a
+ * checkpoint/restore (CRIU) cycle.
+ */
+enum amdgpu_ioctl_svm_location {
+	AMDGPU_SVM_LOCATION_SYSMEM	= 0,
+	AMDGPU_SVM_LOCATION_UNDEFINED	= 1,
+	AMDGPU_SVM_LOCATION_LOCAL	= 2,
+	AMDGPU_SVM_LOCATION_HIVE	= 3,
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
+	AMDGPU_SVM_ATTR_GPU_RO				= 7,
+	AMDGPU_SVM_ATTR_GPU_EXEC			= 8,
+	AMDGPU_SVM_ATTR_GPU_READ_MOSTLY		= 9,
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
+	/**
+	 * Size of the range in bytes. For AMDGPU_SVM_OP_GET_ATTR this is an
+	 * input upper bound and is updated on return to the length of the
+	 * contiguous range starting at @start_addr with constant attributes.
+	 */
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

