Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF04C98314
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A7E10F38E;
	Thu, 24 Sep 2026 07:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EU7XgqE6";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7030F10F38C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uwxa+UcW5aTcDobH3yiRPuODor8rvL0T30QkHM6vaw8yqV8Xpf7CnksYfzgWTON/abbWxjhOngfCIhV0IQht8f4fNbd5maq1l9mTp6yY4KJ6OsuOyzzBw1JEwcCJxHQBJ4HgTsM4m4aUWlYHn1YIlz5tgWM7RMkHpgG4YOK3unpzj3sVCv8btjybMtH4Q5emQDPBfY6xes12bYuF3VbMzllSd4nGGf5QLExM/Ng0973KbO2l0e0sDv8wZlRwvScY1dcZLWu6EXmqaiLYW+vLKVjM9XkG+Prmzr/8juHN022rJajR/rKdhLE2mQzA85cW6QedsQiV/ozxzQLKrkooMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DKITJhYuxqnwMbZrSITWfQLscgKNJNTxA+YgiV1rog=;
 b=RErWi6uq0AdQUEwyeOy9arnTvB+Z1Kbf0dRp+ArsIHLvtmmO3j77Ur4G7nifrZ7S6Z2zNy/N79oea3nkvYnKtqeAlGA5PKZXZGSzbWRrfd+vFTEyeJq7jQry5EG3rsSdQ+PtZ58kIPz8PquyeqhwxkjHqHT2+Lp5BeYeG3Zocz49KrzaJGEQea9dHKaVF2iAcVO6BjH7fc4L//VER3LxWy+yycgekjZreKSoGTQrIIu9dWBwvHuSI7MLln5odhhWiPY0MPsNElMncyk/+nHZfWx7zROVZkksJG10Wfscxw+gobtMyjKw3T7lCt5+H3tfZQSfYZsJ7mXSpihXMdVE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DKITJhYuxqnwMbZrSITWfQLscgKNJNTxA+YgiV1rog=;
 b=EU7XgqE6kzouY71xLxoKslRr58erxICW5JTCNDVypNcFgI393vE/rRam0DEGlm6Ty6garV5oezLLumylTAlrgOWfsMmQHPQ1HUytYv9xXK6a6aYYCyDap5qGYyrYFnhSSBJCqCZxz4Koa3qsoztXzOWL4tSTShnfogabLmToBcM=
Received: from CH0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::31)
 by PH6PR12MB805463.namprd12.prod.outlook.com (2603:10b6:510:3fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 07:53:09 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::58) by CH0P220CA0003.outlook.office365.com
 (2603:10b6:610:ef::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 07:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 07:53:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:53:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:53:08 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 02:53:01 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Claude
 <noreply@anthropic.com>
Subject: [PATCH i-g-t v2 1/3] include/drm-uapi/amdgpu: add queue id to user
 queue wait IOCTL
Date: Thu, 24 Sep 2026 15:51:56 +0800
Message-ID: <20260924075300.172142-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|PH6PR12MB805463:EE_
X-MS-Office365-Filtering-Correlation-Id: be081f45-ae7c-406c-d35e-08df1a10dfea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|10067099003|56012099006|18002099003|6123799006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: WIf6rxejXW1iRjSdGoP0JnVvpR7zIJxz2An72XzvNBKvJWoD2+2I1ZoqP/Yr7onF8A8+SS0+tuBLjzIrwn8A1dQhGSLfbktK9BEagnz/0gkCQ0yXxsrQSCR3n2eD2aJb50tjNakTl8kKKJxSJVOqCkXHTKIuNV/zXnWwaPdw1dW6JzrHlcY7YLQaSRKNBJPS6Rbv4zRX5LtPhK/yVaz7pgvo3KzGlbQi1MG2WidhDQUnrHTJmrS4TelmHiuDgBLPjYw0OlHudisttf7fP9PEI9y+yxezlH+jLQxWM/ApDT6eW5+dfcIQ5NFbw+THiKUXa7R6twxYSEjHY+nrWct9ySoGcoyf4UxHA0EWUrdb8WvuwauW5BiGmN7aoZrfW9GNL1F5tG54s+al0usGltOpNyzNFfkpF5MGKGqnMXLmIHD41tEsMlVaK1LlUS9YXUtxSsqkgI6bbLHrO3os1/HIuFd73h0og6idC2N1Q7plbHCT1ZlYmiSfM6VAVC//CVXPF1JSaa8FFJUp9/EHB3GPok9k2PX8/5a9hgjYgYHwckl0Z2zDl136SzeIhQLEOJ9yfzCssSEwqvs5J8RbcH2XE9gO0a1C+T69njAduzYg+OGuG8+ipggQdFdJbhNbAl/C6s1yY7SdUFqjnFJsm4ArUxJWW8p7m+kGrUhSDWHN/0U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003)(6123799006)(11063799006)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MxLGbFSMfZFD8jDooYc0DU1yXqEn8X3B3HyX2oNbtLbLZZvpwQYn+2qzfEjMMtFk+Gv/b9u81PdNdDUxQOB9SkfCDyYpj1FbO1/fce/jdH05gP4B92LzkkVZHVRUaRRTCAO82OqNaXJl05CQg8FN7KhPrPg4pXZ6WVXSoiEb2CYgIoi1iGtbWj0V6W0e7pRwAXkxPqxIks/t1cd3VA8v3PkE3t7AKWqyncRE1K9Uq9yj0lPXFMZrGkONMRo51jBEnoOSj1yUtYYgIiScVCqeUhV7UVMGgyxSqJkhCtEsOveW8lwRODIfg3l9+6t23K9921LhmthkInewQI5rEr8znDywZeCBaws7Gl4GE3lfy+VFQTGqDI6S7PiLv5ZkryCsECpiYJT9A3Rj9CrMiYPt7u1eDsrhfuMWP/z4xjiXQ9/glHT+3pPnxpX2G/hbVBT9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 07:53:08.8069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be081f45-ae7c-406c-d35e-08df1a10dfea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB805463
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

v2: delete change-id

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Co-Authored-By: Claude <noreply@anthropic.com>
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

