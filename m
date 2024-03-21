Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D716C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 02:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3587510E384;
	Thu, 21 Mar 2024 02:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QbZcBpQi";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4F10E384
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 02:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9ykG64LaH2tMrm8eW99WrruuIFXFNnsketYgtl2qxQLN/2RvXNDMuNLaX7p9iwxL6Qbyn5z0qY9VVTrzWVP6QWxfE2RWy/jzrONbLLbc0tFyuuBkliet4BoZj2IDVMIVc9xPA06vTSWbE6LH6Df7gYRKcGAFIsOyXUejsYSuLoEPra63ZBh6EWDIwN/SWJenygODCCr+TFaP1bxC9aUaH000PAdokKqpy0OarkY/luMXAHnO/1akqRVAmzg9iW3E5BLPcGEkH/vOaFYIvg2qveFmg0Mw+GhsA1HJGoT2Zkt3WwEx6WE0CHSXsA3YCVWSGBmrpx6ZR4iNjeMVlMVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9Umw1Rh0AF2370igqPEg0sAatFEppoj9PNS+90F0CM=;
 b=FPiIGTEDcuiGDhu1Dgp54/KUHDxH1GmxJg7Vpnqm6K7dTjzbi1xpi+WJmZw5CH1lqXQ/sa5hCXDYjr8aBfcC+qQLewDlG/jA+CpYllVbNrcD5/JQ7cR5+qngCiXiWk3/XfheWHoB5v4f7a5pA0wqewYe99P37wpKzBMLFesJWcxBr4B2AuNk8tgGRiZIP+ZlsA0SA8jcdn0MQDI3t7Ofk2E7vXFUY0KUPd9Sn+lNRAGRi+SijJMdrrJSwELCRkP/CYVapoALlJpSb1i0wJh2vqLRqbJQih32KtBefj9aYVB9O/k998CpLEgpVhBDbLdXarMUNBeOx+V6N5hxm/k7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9Umw1Rh0AF2370igqPEg0sAatFEppoj9PNS+90F0CM=;
 b=QbZcBpQieD+vpWRHb518iYJgUT7//AFjFfIRNJEwuCryyxcMXklIXF3ibqPeENU0QvacbtFkcl0m3GAKuciJ0ceCM93M9BhSdohMIkt/rR9r4ifJmCHXXMnYSRCpnPKyEsNxPEJBx/b3ZzXHLABT6CykfcGoMKdmtVJQtGynuJk=
Received: from CH2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:610:57::17)
 by SA1PR12MB6994.namprd12.prod.outlook.com (2603:10b6:806:24d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 02:04:26 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::b1) by CH2PR12CA0007.outlook.office365.com
 (2603:10b6:610:57::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 21 Mar 2024 02:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:04:26 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 21:04:22 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 1/2] lib/amd: check output has hpd before trigger hotplug
Date: Wed, 20 Mar 2024 20:03:53 -0600
Message-ID: <20240321020354.843729-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SA1PR12MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 308411ff-a112-44fa-49bd-08dc494b3c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fi50eHqeG4Ht8Kx00foXdxWWEdjXhxu9FGZYDatYrFD7X8S8aPYR5ITJVJJLdfc5SzSam9m9oJ6IFZc+cVllyuV+ADPxo3KG+TT04SdxUhAZfi8yHx77+Wis1Hu8/9aoj4JPPinkl4NfgdorP6dsoIart6H8Ad16QHvE4vEHSATB/blBSI6+rnjFtaUmChC6uxQ9EbToDGMPrPEhZiqicv7VMh4cqf1C2WZYODYZ97xbIFPzMqycgIJsNh1T2j4dWslMW9McUKNzhQxhhAhRDrB+0p8/mTeH/Jvq3Z85bpFq7puehuj2ICpbk+nhpts4lqoghLAanWlyGY/51JXJI0AgdTPJ8gElYLcKKf8/+HDaYne3OrTInSUcFm5CQORdoX4TD+pmsBJ3Bjwohl+QEGvFtPmjC/QQX19l8ND+iE7T+t30mB72D9kXFIQk1wticr6v17rsU6x2NepZYKR8mL4HU3qC+zlOMmFcruaYzqPzIAsMhdV3O66gK6oBXHaWcWR/vJAkYr+Ybtj+tHEUvr94lGEmOzaNljGg0XN9xkecGhSgKOz03H0naQWUjtp0+Fu86pV4zQmj2lt4QjrxtZkjtxZx3XyAifPmJOmWKf2+zdrznwUuC06rF7RhFvI+kDlCi4BjqudwNk3SvxFppWGof/XxNZGualptYXcwZJHphr9MAXdOVyCZSNOmGr/oG7F84oG4se8QUlg1kqtuqX0mum0e+iQKNb/Kyx7VpEffhYJgp+wC+REPERPe9OBg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:04:26.0839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 308411ff-a112-44fa-49bd-08dc494b3c38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6994
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

With commit ff1d9a601 writeback connector will be enabled and it has no
hotplug capability. As a result, this function always fails for such
cases. This is fixed by checking HDP in advance.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_amd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index d0b53c08a..623883dbc 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -799,6 +799,9 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
         int wr_len;
         const char *enable_hpd = "1";
 
+	if (!igt_amd_output_has_hpd(drm_fd, connector_name))
+		return 0;
+
         fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
         igt_assert(fd >= 0);
         hpd_fd = openat(fd, DEBUGFS_HPD_TRIGGER, O_WRONLY);
-- 
2.34.1

