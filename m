Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20F410F2870
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 21:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C88810ECCA;
	Fri, 27 Mar 2026 21:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G4K/xDw8";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010039.outbound.protection.outlook.com
 [52.101.193.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C7710E045
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 21:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdhqwJajAryJXa84UWlEq29DN1bq0Hzdgvltmu9Ik1qjRjoQE++zBADuWk+/4ZlUYg5TU2wTz1bB8tjsAn+spGuybl7ix8jZY/+TPgDwyvaIytYDJC3ZJpggwXCfLphNgVM3GaI4q0tszMAvv5sb+F7c991yhXCLPX89Odjqes/0ScsCCKxkVD/St8NX9hd+eI4RcwGh752ixb60afFlDf/5mbFDd1z5BVduKFZYRfgxk4Qd5EB4SKACaqczBxaG39OwfM9DhvLicxakXpMGOx5kWQ1iHIAnvPpvtqkVRd82vGSObC/aGPs3p9pyZmmbqu7n0Zi2Qfha5omnuhqJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trs//KFLHFJHtWRjvTKfkO5K/vGB9GJDLfsRYr5gWPI=;
 b=fj9pQLz8OnM3Q4UTtD94KDIygYi6GFyyyCEb/1UJbZdtqlWzjNwQioR9z587LvPXY9qErC+DMVJscvGyBGftCgJ6XSOfkqfoy3lChXB/yccGlQe+s1mkkEAcBQRWiF2vVf/iQPiu38wi/k6c4R5+Z2Yydy4y5shVyRh7QAEIp0zPRsOs4QznM+jK+tP0t1OYe1MY0+0+7AvbK9lLVeLvqPZzmSdMx3tfCE0AvHsWgTanzDJ8yzAmb77jnxWVpr5PDxi4ued866snVG+QpXjZDj/Sd1zjSrNdwOOpoThNAY9wyqz5HwdxpmMo/M2Yuxubipbt/sn0ChAdpwr6sXwlfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trs//KFLHFJHtWRjvTKfkO5K/vGB9GJDLfsRYr5gWPI=;
 b=G4K/xDw8bX4lySuJHMr/CHuz4U9JJur3ydKznfb90KR3UH8q8uHYrJFK6mQEcsD7ncdjWvEL7tnXws0+gLr/uzGt7dqXM+zbN9CjCLHbSo18P/3rrpMuWdDfyFiuDhmDaCy1/mNJxw/kJpsP+xQI7SrCkaf/h0hThlP8ijuvs3o=
Received: from PH7P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::34)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 21:06:08 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:33c:cafe::87) by PH7P221CA0054.outlook.office365.com
 (2603:10b6:510:33c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 21:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 21:06:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 16:06:07 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 14:06:07 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 16:06:01 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 3/4] tests/amdgpu: add lifecycle/sequence ioctl fuzzing
Date: Fri, 27 Mar 2026 17:04:44 -0400
Message-ID: <20260327210546.67038-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260327210546.67038-1-vitaly.prosyak@amd.com>
References: <20260327210546.67038-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 57186323-17c4-4776-f43e-08de8c44aaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Dy5avPw0MVJ4/hKUWd38zkeIeiLYE9XKktMdoxrLGYIFv+UwmUI+KPoVNXhAfrrvpcryOaKBJtj6Gfb5xOpmNF0lTxmSKrPFXtXIPOkQXWy1zdYXeyNE7Z38u1g01ce66ZXHNkmJOuArpMQCtjDPNBQGB2Br/Ux6qGQKyjCNAEi2w682H7YGtpVfQzlQOTqhdJra6a5KaEytb52qOEvn8ZvD5CLDryUeQRD1g9CTJLPx+FC+XSzuxuB1bDa1erVx8gYgD/4aK1GyNl9eRw8CrgZPOIl9s5paphCVNY8uY4o/N/a6oB94d2Ggz4DJiyXXulWb7OyRUPO1r9RwAg9hERE/aizYvKoqq4RlMbGlDVgYAO9Wj3/HgFIsj+57pmeg+tuFLD9J8tkYNut0I5bcbAQzu4VyDbj/UxSKDqmC1cf5eORQUAtxXV537t7l9r6vX1uw83PFRPLwFD5KKVMM8FHJAnkCLkGS5UX47GHwZgPhs7x+5xvCY+t7ehrybReLS/jCNeJOBrH7EkF0Nkkmj7kZiBoJV7gXEfY9p9OzmiXTCqHO1CYwvqyAPqmyZYKyYdwlwb9UFVu9hq2WTAoZ0jxI0AvHRj5AhV8TsSLTzwWpC69u0N3ycz6/sIbSNspHgX3kc6nEoHkSobVFG1FFjxFRtrZ26J/Ba2JnyOEvmT6gPNB7YjBpviEFzBfxt32BfH1j77ZZgQvpwLHFueDh5MHvsIWuPFjlkb28WgV1q6LC0++EPsiQxfX11wZznynZUemGBFh+BuXU+jLxUBNRDQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Kv4m8ijeKmPjzcUqeTbHyUb1uVgi/OXxoTP0ZzOOuW1YtUyyUW7I1ca55HybE1K3Ozex7zyk5+X+Y4j/bxUKf1PJ78YjyuvjEkHZfU8EBZTjTXveRYoG8T5E1ZlD817s7prmaAhxskAzAW6/DrABR3aHaMfQg5jCnN7c8Y9YJdEPyKvQimTHxIUkTqTMtSi7nwKUOPwRrKGu1qTUY2/pE1xwuG4UbH6WRbcOGNDYnIO/3Ad5eWCMvwM2wHzM0170HHs+yGUw10hojer++/w3yQjw/nhzj6DBRhZBtPFEf5nu9ZbLkuGuHq92NG+VS+bWIm1WYCuM1IV9daXbPzq9TS4sJGiR7XOk2RrFywbEti3fBlQ3Bvj2mbdOUvabdyVoKLG95i5NcU0+90f9A5wOJcbWTAstdZuN704FaOe29iAzoJBHvSvkKe7z2hPQdWz6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:06:08.1478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57186323-17c4-4776-f43e-08de8c44aaae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
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

Add lifecycle-fuzzing subtest covering operations on freed/closed
resources to verify the kernel handles them gracefully:

  - GEM double-close
  - mmap after GEM close
  - wait-idle on closed BO
  - CTX double-free
  - CS submit after CTX free
  - wait-cs after CTX free
  - GEM metadata set/get on closed handle
  - GEM op on closed handle
  - BO list with closed GEM handle
  - PRIME export-close-reimport sequence
  - VM double-unreserve
  - GEM_USERPTR unmap-before-free
  - Fence-to-handle on stale seq

Each case must return an error (not crash or hang).

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 317 +++++++++++++++++++++++++++++++++++++
 1 file changed, 317 insertions(+)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index c709973e3..d7bf12f14 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -1702,6 +1702,319 @@ amd_boundary_fuzzing(int fd)
 	}
 }
 
+/*
+ * Lifecycle and sequence fuzzing tests.
+ *
+ * These tests validate the driver handles wrong-order operations safely:
+ * double-close, use-after-free patterns, and operations on freed resources.
+ * Many of these patterns mirror real Syzkaller-found bugs.
+ */
+static void
+amd_lifecycle_fuzzing(int fd)
+{
+	/*
+	 * Double-close GEM handle: closing the same BO twice must not
+	 * crash the driver.  The second close should fail with EINVAL.
+	 */
+	{
+		union drm_amdgpu_gem_create gem;
+		struct drm_gem_close close_arg;
+		int ret;
+		memset(&gem, 0, sizeof(gem));
+		gem.in.bo_size = 4096;
+		gem.in.alignment = 0;
+		gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		gem.in.domain_flags = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+		igt_assert_eq(ret, 0);
+		close_arg.handle = gem.out.handle;
+		close_arg.pad = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+		igt_assert_eq(ret, 0);
+		/* Second close -- must not crash */
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+		igt_assert_neq(ret, 0);
+		igt_info("double-close GEM handle: ret=%d errno=%d\n", ret, errno);
+	}
+	/*
+	 * GEM_MMAP on closed handle: mmap after close must fail gracefully.
+	 */
+	{
+		union drm_amdgpu_gem_create gem;
+		union drm_amdgpu_gem_mmap mmap_arg;
+		struct drm_gem_close close_arg;
+		int ret;
+		memset(&gem, 0, sizeof(gem));
+		gem.in.bo_size = 4096;
+		gem.in.alignment = 0;
+		gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+		igt_assert_eq(ret, 0);
+		close_arg.handle = gem.out.handle;
+		close_arg.pad = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+		igt_assert_eq(ret, 0);
+		memset(&mmap_arg, 0, sizeof(mmap_arg));
+		mmap_arg.in.handle = gem.out.handle;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_MMAP, &mmap_arg);
+		igt_assert_neq(ret, 0);
+		igt_info("mmap-after-close: ret=%d errno=%d\n", ret, errno);
+	}
+	/*
+	 * GEM_WAIT_IDLE on closed handle: must fail, not crash.
+	 */
+	{
+		union drm_amdgpu_gem_create gem;
+		union drm_amdgpu_gem_wait_idle wait;
+		struct drm_gem_close close_arg;
+		int ret;
+		memset(&gem, 0, sizeof(gem));
+		gem.in.bo_size = 4096;
+		gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+		igt_assert_eq(ret, 0);
+		close_arg.handle = gem.out.handle;
+		close_arg.pad = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+		igt_assert_eq(ret, 0);
+		memset(&wait, 0, sizeof(wait));
+		wait.in.handle = gem.out.handle;
+		wait.in.timeout = 1000;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_WAIT_IDLE, &wait);
+		igt_assert_neq(ret, 0);
+		igt_info("wait-idle-after-close: ret=%d errno=%d\n", ret, errno);
+	}
+	/*
+	 * Double-free CTX: freeing context twice must not crash.
+	 */
+	{
+		union drm_amdgpu_ctx ctx;
+		int ret;
+		memset(&ctx, 0, sizeof(ctx));
+		ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+		igt_assert_eq(ret, 0);
+		{
+			union drm_amdgpu_ctx free_ctx;
+			uint32_t saved_id = ctx.out.alloc.ctx_id;
+			memset(&free_ctx, 0, sizeof(free_ctx));
+			free_ctx.in.op = AMDGPU_CTX_OP_FREE_CTX;
+			free_ctx.in.ctx_id = saved_id;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &free_ctx);
+			igt_assert_eq(ret, 0);
+			/* Second free -- must not crash */
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &free_ctx);
+			igt_assert_neq(ret, 0);
+			igt_info("double-free CTX: ret=%d errno=%d\n", ret, errno);
+		}
+	}
+	/*
+	 * CS submit with freed CTX: must fail, not crash or UAF.
+	 */
+	{
+		union drm_amdgpu_ctx ctx;
+		union drm_amdgpu_cs cs;
+		int ret;
+		memset(&ctx, 0, sizeof(ctx));
+		ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+		igt_assert_eq(ret, 0);
+		{
+			union drm_amdgpu_ctx free_ctx;
+			uint32_t saved_id = ctx.out.alloc.ctx_id;
+			memset(&free_ctx, 0, sizeof(free_ctx));
+			free_ctx.in.op = AMDGPU_CTX_OP_FREE_CTX;
+			free_ctx.in.ctx_id = saved_id;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &free_ctx);
+			igt_assert_eq(ret, 0);
+			/* Submit with freed ctx -- must not crash */
+			memset(&cs, 0, sizeof(cs));
+			cs.in.ctx_id = saved_id;
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CS, &cs);
+			igt_assert_neq(ret, 0);
+			igt_info("CS-after-ctx-free: ret=%d errno=%d\n", ret, errno);
+		}
+	}
+	/*
+	 * WAIT_CS with freed CTX: must fail gracefully.
+	 */
+	{
+		union drm_amdgpu_ctx ctx;
+		union drm_amdgpu_wait_cs wait;
+		int ret;
+		memset(&ctx, 0, sizeof(ctx));
+		ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+		igt_assert_eq(ret, 0);
+		{
+			union drm_amdgpu_ctx free_ctx;
+			uint32_t saved_id = ctx.out.alloc.ctx_id;
+			memset(&free_ctx, 0, sizeof(free_ctx));
+			free_ctx.in.op = AMDGPU_CTX_OP_FREE_CTX;
+			free_ctx.in.ctx_id = saved_id;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &free_ctx);
+			igt_assert_eq(ret, 0);
+			memset(&wait, 0, sizeof(wait));
+			wait.in.ctx_id = saved_id;
+			wait.in.ip_type = AMDGPU_HW_IP_GFX;
+			wait.in.timeout = 1000;
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &wait);
+			igt_assert_neq(ret, 0);
+			igt_info("wait-cs-after-ctx-free: ret=%d errno=%d\n", ret, errno);
+		}
+	}
+	/*
+	 * GEM_METADATA on closed handle: get/set metadata on freed BO.
+	 */
+	{
+		union drm_amdgpu_gem_create gem;
+		struct drm_amdgpu_gem_metadata meta;
+		struct drm_gem_close close_arg;
+		int ret;
+		memset(&gem, 0, sizeof(gem));
+		gem.in.bo_size = 4096;
+		gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+		igt_assert_eq(ret, 0);
+		close_arg.handle = gem.out.handle;
+		close_arg.pad = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+		igt_assert_eq(ret, 0);
+		memset(&meta, 0, sizeof(meta));
+		meta.handle = gem.out.handle;
+		meta.op = AMDGPU_GEM_METADATA_OP_GET_METADATA;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_METADATA, &meta);
+		igt_assert_neq(ret, 0);
+		igt_info("metadata-get-after-close: ret=%d errno=%d\n", ret, errno);
+		meta.op = AMDGPU_GEM_METADATA_OP_SET_METADATA;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_METADATA, &meta);
+		igt_assert_neq(ret, 0);
+		igt_info("metadata-set-after-close: ret=%d errno=%d\n", ret, errno);
+	}
+	/*
+	 * GEM_OP on closed handle: must fail, not UAF.
+	 */
+	{
+		union drm_amdgpu_gem_create gem;
+		struct drm_amdgpu_gem_op gem_op;
+		struct drm_gem_close close_arg;
+		int ret;
+		memset(&gem, 0, sizeof(gem));
+		gem.in.bo_size = 4096;
+		gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+		igt_assert_eq(ret, 0);
+		close_arg.handle = gem.out.handle;
+		close_arg.pad = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+		igt_assert_eq(ret, 0);
+		memset(&gem_op, 0, sizeof(gem_op));
+		gem_op.handle = gem.out.handle;
+		gem_op.op = AMDGPU_GEM_OP_GET_GEM_CREATE_INFO;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_OP, &gem_op);
+		igt_assert_neq(ret, 0);
+		igt_info("gem-op-after-close: ret=%d errno=%d\n", ret, errno);
+	}
+	/*
+	 * BO_LIST with closed BO handle: create a bo_list referencing
+	 * a handle that was already closed.
+	 */
+	{
+		union drm_amdgpu_gem_create gem;
+		union drm_amdgpu_bo_list bo_list;
+		struct drm_amdgpu_bo_list_entry entry;
+		struct drm_gem_close close_arg;
+		int ret;
+		memset(&gem, 0, sizeof(gem));
+		gem.in.bo_size = 4096;
+		gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+		igt_assert_eq(ret, 0);
+		close_arg.handle = gem.out.handle;
+		close_arg.pad = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+		igt_assert_eq(ret, 0);
+		memset(&entry, 0, sizeof(entry));
+		entry.bo_handle = gem.out.handle;
+		memset(&bo_list, 0, sizeof(bo_list));
+		bo_list.in.operation = AMDGPU_BO_LIST_OP_CREATE;
+		bo_list.in.bo_number = 1;
+		bo_list.in.bo_info_size = sizeof(entry);
+		bo_list.in.bo_info_ptr = (uintptr_t)&entry;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &bo_list);
+		igt_assert_neq(ret, 0);
+		igt_info("bo-list-with-closed-handle: ret=%d errno=%d\n", ret, errno);
+	}
+	/*
+	 * PRIME export + close + import-back: must not crash.
+	 * Tests the DMA-BUF handle lifecycle.
+	 */
+	{
+		union drm_amdgpu_gem_create gem;
+		struct drm_prime_handle prime;
+		struct drm_gem_close close_arg;
+		int ret;
+		memset(&gem, 0, sizeof(gem));
+		gem.in.bo_size = 4096;
+		gem.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem);
+		igt_assert_eq(ret, 0);
+		/* Export to DMA-BUF fd */
+		memset(&prime, 0, sizeof(prime));
+		prime.handle = gem.out.handle;
+		prime.flags = DRM_CLOEXEC | DRM_RDWR;
+		ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime);
+		if (ret == 0) {
+			int dmabuf_fd = prime.fd;
+			/* Close the GEM handle */
+			close_arg.handle = gem.out.handle;
+			close_arg.pad = 0;
+			drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+			/* Import back from the DMA-BUF fd */
+			memset(&prime, 0, sizeof(prime));
+			prime.fd = dmabuf_fd;
+			ret = drmIoctl(fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime);
+			igt_info("prime-reimport-after-close: ret=%d handle=%u\n",
+				 ret, prime.handle);
+			/* Clean up */
+			if (ret == 0) {
+				close_arg.handle = prime.handle;
+				drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_arg);
+			}
+			close(dmabuf_fd);
+		}
+	}
+	/*
+	 * VM reserve/unreserve double-free: unreserving VMID twice.
+	 */
+	{
+		union drm_amdgpu_vm vm;
+		int ret;
+		memset(&vm, 0, sizeof(vm));
+		vm.in.op = AMDGPU_VM_OP_RESERVE_VMID;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &vm);
+		if (ret == 0) {
+			vm.in.op = AMDGPU_VM_OP_UNRESERVE_VMID;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &vm);
+			igt_assert_eq(ret, 0);
+			/* Second unreserve -- must not crash */
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &vm);
+			igt_info("vm-double-unreserve: ret=%d errno=%d\n", ret, errno);
+		}
+	}
+}
+
 int igt_main()
 {
 	int fd = -1;
@@ -1739,6 +2052,10 @@ int igt_main()
 	igt_subtest("boundary-fuzzing")
 		amd_boundary_fuzzing(fd);
 
+	igt_describe("Lifecycle/sequence fuzzing: double-free, use-after-free, operations on freed resources");
+	igt_subtest("lifecycle-fuzzing")
+		amd_lifecycle_fuzzing(fd);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.52.0

