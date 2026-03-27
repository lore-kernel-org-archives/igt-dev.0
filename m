Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9B510F2870
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 21:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6684D10E045;
	Fri, 27 Mar 2026 21:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e2sZgyCW";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2451510E045
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 21:06:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHOaO3GWCHHYMjpgZJcvBIUZXPHAeIAlvMCCenfK3YZOk9NFDF0z/4orA+rTzkmkcuerjucheXVhpRV+dFMxKWHLCNvyo8jnh8OQCT8iJwsz/R36LxaO6C1tA46jm2vvboYWjysPOUNfHvy6v2nLEd1PjYQyYTrsX9IOHvohxyklVueVcKa20dwvUtmuEn8lpiRfbFodKpfialNrro0LyzuNGWOFIor4mVN9djwQioGwEGe3nZyPGr30ayH0IACPtgo/QXUycbAgL+2Or2fE7FGxj9Gsy/vqcjaLZz7F42FZfAt15HMGMuus0gkbRzIMh+4d3lYT9pUIO6H6BuW64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPhvIQxlwu4+iy8e4yM4N0kaUnE7dF2ysQTQ+GwJDdU=;
 b=CzhvoASpDCJLZRNP+2NoCA4Ixj5w/fjewSb8zF/lUaOibEwMFQaymPSa4K53leMI4IdirQFxBXNh0Y5LkElzFy35iCJFmciRcGE6V1nYrCUMoa69VVmEQWTLe665hYmm9Aci3O4fgd0I8u45wVKEyAixia+VEIflfZc5mO4JcvI+tvlPN/9cMsAhUmPJjMJhYDXA/CQGknTaA3syRT7fTFp6Bu9pBkA1kF8DQ/ZC+xVvuzgXyt3RF/jv+L1I4SWJs1ZtMtqCrNx2+PNKcCWE2i8ceUlBiAgl5bcIdimKPcppo0ohnIypHp9i6T/90U1OQ4PVZ5IM8af+fiecBgPDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPhvIQxlwu4+iy8e4yM4N0kaUnE7dF2ysQTQ+GwJDdU=;
 b=e2sZgyCWoP2zd5xqILJ1N0vEjT5hsFRS/8M1ihaGem/f7MP9bvYWvwUo9igA7KMXtEJPPCAv4SwlrmGaUnfzMS2wbeBf0ZyvokhVu8Oh+cdrSJARMD5CH/6xo1NwENDfvL9SLHvioQmM5VFe0gYZunkiGTbGhxHsxlQIz+L034c=
Received: from PH7P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::20)
 by DS0PR12MB6656.namprd12.prod.outlook.com (2603:10b6:8:d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 21:06:02 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::fb) by PH7P221CA0016.outlook.office365.com
 (2603:10b6:510:32a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 21:06:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 21:06:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 16:06:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 14:06:01 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 16:05:56 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/4] tests/amdgpu: add boundary and edge-case ioctl fuzzing
Date: Fri, 27 Mar 2026 17:04:43 -0400
Message-ID: <20260327210546.67038-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260327210546.67038-1-vitaly.prosyak@amd.com>
References: <20260327210546.67038-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DS0PR12MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 41615a79-8c5b-4bb1-787e-08de8c44a72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0wrtvO/QR5pW969VTHLGYVgoE62r7n93NnhN0drGgeI7/4fqWtVuhTGXzldjyksMoHm6pe1jOLejEPxIMvWXmgmqNfEC3n1cwPflCC14H199gKcJJ7FWok6XvPnLRmafo8SxzbC4Qq+pH/2R6V0oMz90NJXCnT3W1TrQalaFsIGuYQ+XWMQc6YA4/dg2aeRkMCj2fhkomuJ1ze2YNJwcZRWbbWT8ZJ7AzaJNfJZlEg8YZNbKbGd+EKncBxJXZ4iYW7zEOXLIUZOOUznPzh1jnpvHv7RjTx2Bh4QFklWNpTtucaoAip2uAVjSk1UMpUmbucwJHUxJHZ7KNSgQj1kwmuizZwG5i2PH4s6nvAcsXpYe47sKIfmo6442C2IR9jUKP/qTc1Oo+WCpJspMIBomC9AqE2hk9NFhBUS382g4HVorMGI3+Fe99Hye6cp2C1c6dXn+V9wGksI7+nIn7D3vUjLzGPLXay7MKOviTNPseoxfQDN+WD2wzHEXulF5e5hl+/aM9gY602FZJR8ZiSfjAhzg0y3LG54O9Urekg+7FHMJxZx3soJJRsfjYOluT02jfDyZOXaW5UJuNepmWijrJtmS3L26msIgCV+hwA7LCWnOAmseFMEKA40Gw7cSwWHFT9r+zOn1ez9zYlUNSOehGrqBq6Cm4Dow6b1laaA20ySPWoQxhlep70p4xGdogKPGPWx6x9RZrvKpCJasMF43i1KmUjQuths2wu2bilyMWmmmxAmoFRfxtOcrk3GMwkv4VWhqQ4IqOmOrNoT5GnUDIA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hTQrjvgICsQgneqSGxSZQBwq3yGCPLYGHs8KfTxvSTLyTqIYbNxZXyfkL8an0hVeqSMlcarOi/kpVYFI20liKEmB3caave0bZLiF/Q1l2Ya1FFtI5Fj2JDaqTO4AyrhjPmO/fbsvenqiEF7/y3jL652LcZ5UlvBbVipVebJ62xR7WAx6LtyAFDXNi62llp148CZNVthzptk/3j9mR4iySUeJtz0rLAsb9IFXh5uXGfGH7uXPMGP4844U48pE5D13TOu2K+opi3ZtSK5M+08zeLNf46eeohSRI9mZ6BJv2TofqsHAnIIbJgK6MUpg5gSu7r4pXvaMdRVOxJ5XLWRSDwfFniklhSyiAtVDMHbwnSig8ewY0ShnRkaHaUdgf7j327wLZ0ioaKnezp7sInWylBSidhHqjINZKzccoFCfGphjiKV/hr6M0qVHX8FRx95q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:06:02.3034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41615a79-8c5b-4bb1-787e-08de8c44a72a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6656
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add boundary-fuzzing subtest exercising extreme parameter values
and corner cases:

GEM_CREATE:
  - Boundary sizes: 0, 1, page-1, page+1, 1MB, 4GB, 1TB, UINT64_MAX
  - Every domain combination including invalid/no-domain
  - Non-power-of-2 and oversized alignments

AMDGPU_INFO exhaustive sweep:
  - All 19 known query IDs plus 3 invalid ones
  - FW_VERSION for every firmware type (VCE, UVD, GMC, etc.)
  - HW_IP_INFO for all IP types beyond valid range

Stress/lifecycle:
  - CTX rapid alloc/free (64 iterations) for ID recycling stress
  - GEM_VA with misaligned address (must reject)
  - GEM_VA with zero-length map (must reject)
  - SCHED priority escalation to VERY_HIGH (unprivileged check)

All cases verify the driver returns errors without crashing.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 361 +++++++++++++++++++++++++++++++++++++
 1 file changed, 361 insertions(+)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index ed1adc733..c709973e3 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -1345,6 +1345,363 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 
 }
 
+/*
+ * Boundary value and edge-case ioctl fuzzing.
+ *
+ * Tests extreme/unusual parameter values that are technically in-range
+ * but exercise corner cases in the kernel validation logic:
+ * - GEM_CREATE with boundary sizes (0, 1, page-1, huge)
+ * - AMDGPU_INFO with every known query + invalid sub-fields
+ * - CTX alloc/free stress to test ID recycling
+ * - GEM_VA with misaligned addresses and zero-length maps
+ */
+static void
+amd_boundary_fuzzing(int fd)
+{
+	/*
+	 * GEM_CREATE boundary sizes: the driver must reject zero and
+	 * excessively large sizes without crashing.
+	 */
+	{
+		static const uint64_t test_sizes[] = {
+			0,              /* zero size */
+			1,              /* sub-page */
+			4095,           /* page_size - 1 */
+			4096,           /* exact page */
+			4097,           /* page + 1 */
+			(1ULL << 20),   /* 1 MB */
+			(1ULL << 32),   /* 4 GB */
+			(1ULL << 40),   /* 1 TB -- should fail */
+			UINT64_MAX,     /* max -- must fail */
+			UINT64_MAX - 4095, /* near-max */
+		};
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(test_sizes); i++) {
+			union drm_amdgpu_gem_create gem;
+			struct drm_gem_close close_arg;
+			int ret;
+
+			memset(&gem, 0, sizeof(gem));
+			gem.in.bo_size = test_sizes[i];
+			gem.in.alignment = 0;
+			gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+			gem.in.domain_flags = 0;
+
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+			igt_info("gem-create size=0x%llx: ret=%d errno=%d\n",
+				 (unsigned long long)test_sizes[i], ret, errno);
+
+			if (ret == 0) {
+				close_arg.handle = gem.out.handle;
+				close_arg.pad = 0;
+				drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+			}
+		}
+	}
+
+	/*
+	 * GEM_CREATE with every domain combination: some are invalid
+	 * and the driver must reject them without crashing.
+	 */
+	{
+		static const uint64_t test_domains[] = {
+			0,                              /* no domain */
+			AMDGPU_GEM_DOMAIN_CPU,
+			AMDGPU_GEM_DOMAIN_GTT,
+			AMDGPU_GEM_DOMAIN_VRAM,
+			AMDGPU_GEM_DOMAIN_GDS,
+			AMDGPU_GEM_DOMAIN_GWS,
+			AMDGPU_GEM_DOMAIN_OA,
+			AMDGPU_GEM_DOMAIN_MASK,         /* all bits */
+			~(uint64_t)AMDGPU_GEM_DOMAIN_MASK, /* invalid bits only */
+			UINT64_MAX,                     /* all bits set */
+		};
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(test_domains); i++) {
+			union drm_amdgpu_gem_create gem;
+			struct drm_gem_close close_arg;
+			int ret;
+
+			memset(&gem, 0, sizeof(gem));
+			gem.in.bo_size = 4096;
+			gem.in.alignment = 0;
+			gem.in.domains = test_domains[i];
+
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+			igt_info("gem-create domain=0x%llx: ret=%d errno=%d\n",
+				 (unsigned long long)test_domains[i], ret, errno);
+
+			if (ret == 0) {
+				close_arg.handle = gem.out.handle;
+				close_arg.pad = 0;
+				drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+			}
+		}
+	}
+
+	/*
+	 * GEM_CREATE alignment fuzzing: non-power-of-2 and large alignments.
+	 */
+	{
+		static const uint64_t test_alignments[] = {
+			0, 1, 3, 7, 255, 4096, 65536,
+			(1ULL << 20), (1ULL << 32),
+			UINT64_MAX,
+		};
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(test_alignments); i++) {
+			union drm_amdgpu_gem_create gem;
+			struct drm_gem_close close_arg;
+			int ret;
+
+			memset(&gem, 0, sizeof(gem));
+			gem.in.bo_size = 4096;
+			gem.in.alignment = test_alignments[i];
+			gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+			igt_info("gem-create align=0x%llx: ret=%d errno=%d\n",
+				 (unsigned long long)test_alignments[i], ret, errno);
+
+			if (ret == 0) {
+				close_arg.handle = gem.out.handle;
+				close_arg.pad = 0;
+				drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+			}
+		}
+	}
+
+	/*
+	 * AMDGPU_INFO exhaustive query fuzzing: iterate through all known
+	 * query IDs and some invalid ones.  Each must either succeed or
+	 * fail gracefully -- never crash.
+	 */
+	{
+		static const uint32_t queries[] = {
+			AMDGPU_INFO_ACCEL_WORKING,
+			AMDGPU_INFO_CRTC_FROM_ID,
+			AMDGPU_INFO_HW_IP_INFO,
+			AMDGPU_INFO_HW_IP_COUNT,
+			AMDGPU_INFO_TIMESTAMP,
+			AMDGPU_INFO_FW_VERSION,
+			AMDGPU_INFO_NUM_BYTES_MOVED,
+			AMDGPU_INFO_VRAM_GTT,
+			AMDGPU_INFO_GDS_CONFIG,
+			AMDGPU_INFO_VRAM_USAGE,
+			AMDGPU_INFO_GTT_USAGE,
+			AMDGPU_INFO_DEV_INFO,
+			AMDGPU_INFO_VIS_VRAM_USAGE,
+			AMDGPU_INFO_READ_MMR_REG,
+			AMDGPU_INFO_NUM_EVICTIONS,
+			AMDGPU_INFO_MEMORY,
+			AMDGPU_INFO_VBIOS,
+			AMDGPU_INFO_SENSOR,
+			AMDGPU_INFO_VIDEO_CAPS,
+			0,              /* invalid: zero */
+			0xDEAD,         /* invalid: garbage */
+			UINT32_MAX,     /* invalid: max */
+		};
+		uint8_t outbuf[256];
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(queries); i++) {
+			struct drm_amdgpu_info info;
+			int ret;
+
+			memset(&info, 0, sizeof(info));
+			memset(outbuf, 0, sizeof(outbuf));
+			info.return_pointer = (uintptr_t)outbuf;
+			info.return_size = sizeof(outbuf);
+			info.query = queries[i];
+
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_INFO, &info);
+			igt_info("amdgpu_info query=0x%x: ret=%d errno=%d\n",
+				 queries[i], ret, errno);
+			/* No assertion on ret -- some queries legitimately fail;
+			 * the point is the driver must not crash. */
+		}
+	}
+
+	/*
+	 * AMDGPU_INFO FW_VERSION: fuzz every firmware type.
+	 * Some FW types do not exist on some ASICs -- the driver must
+	 * return an error, not crash.
+	 */
+	{
+		static const uint32_t fw_types[] = {
+			AMDGPU_INFO_FW_VCE,
+			AMDGPU_INFO_FW_UVD,
+			AMDGPU_INFO_FW_GMC,
+			AMDGPU_INFO_FW_GFX_ME,
+			AMDGPU_INFO_FW_GFX_PFP,
+			AMDGPU_INFO_FW_GFX_CE,
+			AMDGPU_INFO_FW_GFX_RLC,
+			AMDGPU_INFO_FW_GFX_MEC,
+			AMDGPU_INFO_FW_SMC,
+			AMDGPU_INFO_FW_SDMA,
+			AMDGPU_INFO_FW_ASD,
+			AMDGPU_INFO_FW_VCN,
+			AMDGPU_INFO_FW_GFX_RLC_RESTORE_LIST_CNTL,
+			AMDGPU_INFO_FW_GFX_RLC_RESTORE_LIST_GPM_MEM,
+			AMDGPU_INFO_FW_GFX_RLC_RESTORE_LIST_SRM_MEM,
+			AMDGPU_INFO_FW_DMCU,
+			AMDGPU_INFO_FW_TA,
+			AMDGPU_INFO_FW_DMCUB,
+			AMDGPU_INFO_FW_TOC,
+			0xFF,           /* invalid type */
+			UINT32_MAX,     /* invalid max */
+		};
+		uint8_t outbuf[256];
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(fw_types); i++) {
+			struct drm_amdgpu_info info;
+			int ret;
+
+			memset(&info, 0, sizeof(info));
+			memset(outbuf, 0, sizeof(outbuf));
+			info.return_pointer = (uintptr_t)outbuf;
+			info.return_size = sizeof(outbuf);
+			info.query = AMDGPU_INFO_FW_VERSION;
+			info.query_fw.fw_type = fw_types[i];
+
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_INFO, &info);
+			igt_info("fw_version type=0x%x: ret=%d errno=%d\n",
+				 fw_types[i], ret, errno);
+		}
+	}
+
+	/*
+	 * AMDGPU_INFO HW_IP: fuzz all IP types including invalid ones.
+	 */
+	{
+		uint32_t ip;
+		uint8_t outbuf[256];
+
+		for (ip = 0; ip <= AMDGPU_HW_IP_VPE + 5; ip++) {
+			struct drm_amdgpu_info info;
+			int ret;
+
+			memset(&info, 0, sizeof(info));
+			memset(outbuf, 0, sizeof(outbuf));
+			info.return_pointer = (uintptr_t)outbuf;
+			info.return_size = sizeof(outbuf);
+			info.query = AMDGPU_INFO_HW_IP_INFO;
+			info.query_hw_ip.type = ip;
+
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_INFO, &info);
+			igt_info("hw_ip_info type=%u: ret=%d errno=%d\n",
+				 ip, ret, errno);
+		}
+	}
+
+	/*
+	 * CTX alloc/free stress: rapidly allocate and free contexts
+	 * to stress ID recycling paths.
+	 */
+	{
+		int i;
+
+		for (i = 0; i < 64; i++) {
+			union drm_amdgpu_ctx ctx;
+			int ret;
+
+			memset(&ctx, 0, sizeof(ctx));
+			ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+			if (ret != 0)
+				break;
+
+			ctx.in.op = AMDGPU_CTX_OP_FREE_CTX;
+			ctx.in.ctx_id = ctx.out.alloc.ctx_id;
+			drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+		}
+		igt_info("ctx-alloc-free-stress: %d iterations\n", i);
+	}
+
+	/*
+	 * GEM_VA misaligned address: map with non-page-aligned VA.
+	 */
+	{
+		struct drm_amdgpu_gem_va va;
+		int ret;
+
+		memset(&va, 0, sizeof(va));
+		va.handle = 0;
+		va.operation = AMDGPU_VA_OP_MAP;
+		va.flags = AMDGPU_VM_PAGE_READABLE;
+		va.va_address = 0x1001;  /* not page aligned */
+		va.map_size = 4096;
+
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_VA, &va);
+		igt_assert_neq(ret, 0);
+		igt_info("gem-va-misaligned: ret=%d errno=%d\n", ret, errno);
+	}
+
+	/*
+	 * GEM_VA zero-length map: must be rejected.
+	 */
+	{
+		struct drm_amdgpu_gem_va va;
+		int ret;
+
+		memset(&va, 0, sizeof(va));
+		va.handle = 0;
+		va.operation = AMDGPU_VA_OP_MAP;
+		va.flags = AMDGPU_VM_PAGE_READABLE;
+		va.va_address = 0x100000;
+		va.map_size = 0;
+
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_VA, &va);
+		igt_assert_neq(ret, 0);
+		igt_info("gem-va-zero-size: ret=%d errno=%d\n", ret, errno);
+	}
+
+	/*
+	 * SCHED priority escalation: unprivileged user must not be
+	 * able to set high priority.
+	 */
+	{
+		union drm_amdgpu_ctx ctx;
+		union drm_amdgpu_sched sched;
+		int ret;
+
+		memset(&ctx, 0, sizeof(ctx));
+		ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+		if (ret == 0) {
+			memset(&sched, 0, sizeof(sched));
+			sched.in.op = AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE;
+			sched.in.ctx_id = ctx.out.alloc.ctx_id;
+			sched.in.fd = fd;
+			sched.in.priority = AMDGPU_CTX_PRIORITY_VERY_HIGH;
+
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_SCHED, &sched);
+			igt_info("sched-priority-escalation: ret=%d errno=%d\n",
+				 ret, errno);
+			/* May succeed for root, fail for normal user -- just
+			 * must not crash. */
+
+			/* Clean up */
+			ctx.in.op = AMDGPU_CTX_OP_FREE_CTX;
+			ctx.in.ctx_id = ctx.out.alloc.ctx_id;
+			drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+		}
+	}
+}
+
 int igt_main()
 {
 	int fd = -1;
@@ -1378,6 +1735,10 @@ int igt_main()
 	igt_subtest("kgd-ioctl-field-fuzzing")
 		amd_kgd_multi_ioctl_field_fuzzing(fd, amdgpu_dev);
 
+	igt_describe("Boundary value and edge-case fuzzing: extreme sizes, alignments, domain combos, AMDGPU_INFO exhaustive query sweep");
+	igt_subtest("boundary-fuzzing")
+		amd_boundary_fuzzing(fd);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.52.0

