Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541C0C98314
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470D10F378;
	Thu, 24 Sep 2026 07:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fPJdkikM";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1A310F378
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS8WFlmqNpMh/BxRzFMByBNWTCiJQ0hpUMYSLcrwyzVFsbNSsXwRE5Jt1J/5Qg80JcTAaVHsE8z2sDEJwRall7i5vk/7LtIeKe97JsmAnDnCB6Y99BhbBLwH5FIO1AL+3cXc73LnPNgnupKQvlljRUiBwAJV3qZT3/kKeDhQEq4veXWub4fhzrZDTvCCY9Sv0waw4niKJEa5qBKoaRNLSasth5qmdseEWgwq3nFdyLV0UNqgcp7jmINIvBH6CZovvgDhFPDBKEJ5DMbra3fFb7TVrCq/nvG1623qOJNEnVF8KlnHp9wusgPcM3dYYbqsW3B6W6151yTsp8fcVSHOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1W1YftESv93kQNT6SYIKeMP4bDRI2CwU6cwRte19Vs=;
 b=EXeNcNFjpyF15Hw8cPQfuk4qVUmWHVdBnWrzXKIx39SAaf7hSHKO89JaJVazwTyq75IkN2MHCmoqi0lKu9VPx5iHQ/PMGOo/EwSNvYxRnM7zRMROjJqrj7AEnaNNQHPYO0XkMPT26KpoYsSeGJafdqNIINC3aXU5GjEd5v8sSHkGNmAF7ZIum4jKypl0P58jm8DiYJfs4unW5/LEAhf3l0aepF4NoKDROtLbxJECigBJzgjtqGPcNBQnQRxJIjs6TGoA1ccIaiYdex0b+Q46LnLgS1X3zRYD29+xc2MB2Vd6FC5iWtnB7A9dMrhnqYmXQVYt9sT8hkycycR/zzoJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1W1YftESv93kQNT6SYIKeMP4bDRI2CwU6cwRte19Vs=;
 b=fPJdkikMGsDrMm3wuiBq9Uu2d0dzbtpRo16Jy/JAcYf7CD/Mez359T8hbnl22ZcCZY49+aLtkqoc8Pav3p92hbg8hrb/cqZul5S5EQ0UsmoGMvmFSBHZTgf5mAvdJ2tuWuDBrUyanZFA8sYYcV7VhDMa1Mk6Cn5tKP7YA8RGYsA=
Received: from CH5P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::12)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 07:45:11 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::1) by CH5P223CA0022.outlook.office365.com
 (2603:10b6:610:1f3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.17 via Frontend Transport; Thu,
 24 Sep 2026 07:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 07:45:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:45:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:45:02 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 02:45:01 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Claude <noreply@anthropic.com>
Subject: [PATCH i-g-t 1/3] include/drm-uapi/amdgpu: add queue id to user queue
 wait IOCTL
Date: Thu, 24 Sep 2026 15:44:39 +0800
Message-ID: <20260924074500.169386-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|PH7PR12MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec0da5c-476b-40c3-e7bd-08df1a0fc2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|10067099003|11063799006|6123799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: o9/5IzJY08QfCY8gg0h6Vc1BupfcsLr1Qzx8JGkQFNFuLeNwL+cQc5rCMLhNnBKc419HZq4N70+l3c7wH+RsPG5p8zFcopSYXEFFZ8Y3cX4iAxaIsYavuzBsMtbKHhER0iJrxQwreBzpQOkwbk5yLprHN7jkdX9dRxLNDAOyV3Hefsi2IR4zRPSIbyLjwLi3XbQhAKjBrnKm+8xTk+bpb/AqEIIrkU5rtEh8ad1cp01Z0Cj51w+t7+9dUeGiQxIfDIN+s/I3RGbQeglmbp2I5mtPQQDgdoKtTJvPaI4vo9LpIJ0MzVrjgwSZF/wxwyApwO4saFSfK+uoobkhFazClZtc92VsG4qqAtUageYts7TeojwPGFNfKXx6j9Ke8jjKur/wW7MiWBB77QATKaPe3Q9tPlquOt3mBxHVJ5H5Qp6LGL3lPS+/zd/sWNva8bVQ+Li3pnIDV8AQFh4jBNjD9a7vH7LhSi/iDrSr2y8Qp2w15XZSnM5tOIavoCyKOvJhn3ku5ptg/icAryGbgmPHQkhtnY2HWwTQz2lA5nBs0ffXua4SIQkr+nhoCmMub2j4q4PCO4uieHGNw3uKzttZJPCTIhmHInMt7PfHU2gc5YvewJPH5Ob/a5ghsyCREyBWdx5xPkgaHC+50wsSlzIAA05ZrEgpkGSWOfGkOZvDdGw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(10067099003)(11063799006)(6123799006)(56012099006)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xKwNx5HYvZ8plAj+PBWugFwbM8IleBDtqN/x/FyRsgwM/RtIbdo2sL0C7ufGCJ3qgO+o03W+iMRQgoUVdICFpuTpZlFwVUKliEFhk9J/Aj33UxFtkf4YNTynRkuTbnsXO1VeVDccjYYlOZOVdJwxsRTQKmpn56L32+IWaqQTrzbUOwhk5smXfVX3DLEAP4EShKM3jokk++j0Mms+jQqc2LsVFPO2lTuGIWISi2F4hzQO6IYl5FnzFzPYgS8Vu426ABXvXus3yGtGv/qYLw9XjQIrAGL6t2t7pPbYPC16TjYIpeeCDpIJYgd0vzBnbZJVUMtMEgwK9ApbwMuHKbGisvemulBSgWu7Dr+opb1t2N3MntQK2mVOutFekc8N/91bM7kMXBpprEHOioHpyhd6kJcaFw9BY2m9AegW5BUbMG6QDSZPbpfWyNpa7X6CKWUF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 07:45:10.6307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec0da5c-476b-40c3-e7bd-08df1a0fc2ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174
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

Add waitq_id (plus padding) to the front of struct drm_amdgpu_userq_wait
to match the kernel/libdrm uAPI. The wait IOCTL uses the queue id to
retrieve the wait user queue and maintain the fence driver references in
it, so that queues in the same context release their fence-driver
references before queue destruction.

Mirrors the libdrm change "amdgpu: Add queue id support to the user
queue wait IOCTL" by Arunpravin Paneer Selvam:
  https://gitlab.freedesktop.org/mesa/libdrm/-/commit/15e174c1ed2426be3228eb595f942481cfcf5a90

Co-Authored-By: Claude <noreply@anthropic.com>
Change-Id: I66558a7da2e39283b52ff02dfdcd1ad2b8e9fb9e
---
 include/drm-uapi/amdgpu_drm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ca24519c7..321f374d4 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -511,6 +511,12 @@ struct drm_amdgpu_userq_fence_info {
 };
 
 struct drm_amdgpu_userq_wait {
+	/**
+	 * @waitq_id: Queue handle used by the userq wait IOCTL to retrieve the
+	 * wait queue and maintain the fence driver references in it.
+	 */
+	__u32	waitq_id;
+	__u32	pad;
 	/**
 	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
 	 * job to get the va/value pairs.
-- 
2.49.0

