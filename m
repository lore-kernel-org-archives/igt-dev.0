Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A91FC83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 07:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67510E513;
	Tue,  1 Jul 2025 07:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GTHNMg4o";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B6B10E510
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 07:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6JyHAjF11bHeSlypYxFxg/AlNnMmUMVpDQ/WJ1T7DvaKhf74MYwPAB0rolt9wnbAjuTPKQ0bkuHNmKm5N1A85e4S+28xpx8vleYYwfiPKBXazLLepklz51WIue7hFuYSaQtiqlbtpZR9PJAP+IGtnldtVJgB66p/we8Ufqn55Ouy50lEUpYB13aNKUskiO8sL+IfM+151+sFblHVkygjt6Pc2KYr5hHqIVPVA+/fGcK2vwPwBYPeZSnTIHC74xZvEhBesMwYsdOHBi5Uf5Qgry2JW3EsxwI8U8g/hzE1gzMzR0I505pK+Uf+tLXJysogkqfVxRmH1S0/oth5slB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SjHXJOaK9l2rYKavfc9CjSPmPFAh/SnGVuGk5hwTx8=;
 b=mL4W4KZJOCxHxfeX7ADx0r3EV3qoB1OxtsmpM/amAY/mD6TL4HTcgeVMpgnWxdxu7IdgU1SnP8KRmbpFlIuYXeFCPEnBcHaPpD7A3Qp3neVicJnhX7O9U1G1bNhcAREMmr4Vbuacjl/UGKaoN0FKA9uIgGuEVW9LwWeUR2plvBPbrFT9AbgsPEpj46gf1QS/7ZuvSGFYT5wXQCngbAJb4zqXQc3Hzbgp9yiR9P8sFMuuA9c6G9ZMdS5ry8lI3rVcAZVJXkxVQgsBRmSJyh8De83XKdYN4UOFzdpEa5Dxc00an/LXwU5TxrVG+hHY5HDYgjUQ4ZiKlqCeKLbAb5jfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SjHXJOaK9l2rYKavfc9CjSPmPFAh/SnGVuGk5hwTx8=;
 b=GTHNMg4oOoL3NzWJJnWcnOf866POiDb86PKj1YcId434MKCRfBtMFE5iDtM19Sdtia5WhAQpprSL6RG/G7b2sRDBetKYRlMNijbfVu7CJYJD9lZKxj34aySLSnDKTtw8X3uX15ieyVGUze6HBZakJvd/CEicas3Nrgxeh9Yjjwo=
Received: from BLAP220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::27)
 by SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Tue, 1 Jul
 2025 07:17:27 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:32c:cafe::40) by BLAP220CA0022.outlook.office365.com
 (2603:10b6:208:32c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 07:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 07:17:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 02:17:26 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 1 Jul 2025 02:17:25 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2 3/3] drm/amdgpu: Add RPTR support and volatile
 qualifiers for user queues
Date: Tue, 1 Jul 2025 15:17:22 +0800
Message-ID: <20250701071722.226903-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701071722.226903-1-Jesse.Zhang@amd.com>
References: <20250701071722.226903-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SJ2PR12MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: de94782b-ff8d-490c-50b7-08ddb86f5537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Jy5GBTDw2hZJ6hHcUvqVgf57+paqoXAuZwHc05gCuk7PYep1RZlcEi3nVCF?=
 =?us-ascii?Q?vCYo3tgvHgv6T24ELBrhGKJMRP24TaFIm3liRZ3Jk/PBfl/w5qSnv9fK2w05?=
 =?us-ascii?Q?dspPo6OLm/bRDsgiXiVwkbHxpFVZ284hxSoNOOkHRcDRdV2FtA+nitXrV19x?=
 =?us-ascii?Q?HSQqJXocn3Ha48qs9O2c7utngDPJXEt5JBD/ExhUWHqvakto+vspQAHwUeBZ?=
 =?us-ascii?Q?a/YOdN01xMsmAUMcj/bHM5/f2QywY0zDZmR3TFKSAw5h8pPdsB+eiVJPCTAO?=
 =?us-ascii?Q?pVKRwiJl9JOj9P/PRUaUQqjUWFZPj4bb8Cq18A7aJZZotPY8xQQ8Yi7mDxju?=
 =?us-ascii?Q?XXuuxvNq7PjeVAFU8tgsbvnfmrg8NOUACudd7Gv69W9byWE0g0BHbuh+aPmO?=
 =?us-ascii?Q?ke5zzxjdBBgxk2FJ7ccI4m47mus8eNEwQZtZ/oF6KaAGehx833az9Vhq1D38?=
 =?us-ascii?Q?ayxw/q0PSKSeUGUMD8eXiQLrirjaTQNH9/j+7djyrIz2ncR9rDvcGDhxsMUU?=
 =?us-ascii?Q?SpaII3CBPqTy0GnJjoFuI990W1UnOBqoWqmmVKs6nHwLXceGgMq+Ud4noCph?=
 =?us-ascii?Q?nNcE0flD34+AEAiUebVSSm1B+i7q5pj/lWf4/6Gl07qSODthEUjY4nc+bG8d?=
 =?us-ascii?Q?O6isLKMd7s6c2H8uEokj0oZrMcuYIeduOCzeDIFsVeKwc+m85AHfsTia19q3?=
 =?us-ascii?Q?JIiErIF376porKBgQ2akdKlqsD31Xj79N9qGp0crwpa0nGvadnr34TJk+oJL?=
 =?us-ascii?Q?nUlmoVrUXiu0fl7eq73dFqGKpuhcshaM2dpNtFLgzG9y1gwR4hj2DIFk1x4q?=
 =?us-ascii?Q?wInT+NSmUVg2gJGLbyO0Hn6lKkB87ebbnJE+DIKDF13M+KnE80fdeJk7d9bv?=
 =?us-ascii?Q?1JkBB2eKZOT/1RqaAtHGZyMEvhPj7ecToIeapS82o3sXFbis1+sURxQMta9T?=
 =?us-ascii?Q?W72+JGe8GELUT8yPGX1hMqB30hmcyjKyv9F4WF0Nr4BDexlOe3SdcJwinTuf?=
 =?us-ascii?Q?msLW+VFK6w3bh221z7X8GcrFciv3j1gQE1qgA5qd46UX5Xt9LA2a6+SKNX0m?=
 =?us-ascii?Q?+apny7DXsP0OZGZ80QHoFRcDiwel+B51OFMmMaxoJCnONNq2d0wBibpbfbRJ?=
 =?us-ascii?Q?+aYaKeI8yMHlkdeUvcD7IFI78492/97yglUon14CsOkg/7fRTpmdXedPdLvm?=
 =?us-ascii?Q?uhNqP/TBcyHzQNI7GLPtubJ0AETBEoFKoE/1x84sd+MSkdmN7Fjhl5FseA6A?=
 =?us-ascii?Q?tw8EliAcBgoguTK1tDyWLHn0OO+nVeUeeYv5843KawmEipGcctIUAh1Go0YD?=
 =?us-ascii?Q?s5NrSipDKkJmSYMyvnP5scQpB1xthEUoj36QB5icT7cRevosoiDToS3Jjc0C?=
 =?us-ascii?Q?iD1GpYG8kcTWqrgkBPvMygZ02+vX8dtf0s7p/3dFWbLPJW2NPghtu7+UBqM0?=
 =?us-ascii?Q?Q/2gxDGoBf7Ny6xUeVSooPJLBsvs5V/H6NkoGmEUEu3Wu8+3OjKCyl8V+ELc?=
 =?us-ascii?Q?PHBI/fDN4o9FjEa/SnBEppAb0FV2WeZwzEau?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:17:26.6615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de94782b-ff8d-490c-50b7-08ddb86f5537
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8876
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

This change introduces two improvements to user queue handling:

1. Adds rptr_cpu pointer tracking in amdgpu_user_queue_create()
   to properly handle read pointer management for user queues.

2. Marks both wptr_cpu and new rptr_cpu pointers as volatile in
   amdgpu_ring_context to ensure compiler doesn't optimize away
   accesses to these hardware-mapped registers.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h | 3 ++-
 lib/amdgpu/amd_userq.c     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index a6c35c171..2a4fa1742 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -166,7 +166,8 @@ struct amdgpu_ring_context {
 	struct  amdgpu_userq_bo eop;
 
 	uint32_t *queue_cpu;
-	uint64_t *wptr_cpu;
+	volatile uint64_t *wptr_cpu;
+	volatile uint64_t *rptr_cpu;
 	uint64_t *doorbell_cpu;
 
 	uint32_t db_handle;
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index 10e82a5a4..43a2d10c5 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -416,6 +416,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
 
 	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
+	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
 
 	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
 	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
-- 
2.49.0

