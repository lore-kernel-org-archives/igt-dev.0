Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F4606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pQo+12mO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C869B10EC67;
	Thu, 19 Nov 2026 06:30:17 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010024.outbound.protection.outlook.com
 [52.101.193.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EBA10EB84
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyIPDlgSvojiA7+Y1fMJsUm6ccVwO1Rr8O5OrbgdUdCN+z4N/Ex4TbFHmlMpN+mvx7o5r0IRZEkA/7FeDIM7j0MrW78wPkMTECbhyJPBpNGo8pbYfouaMxtXCpAMrcNN0mHoeX3ZOTwqXd2IVTTI90wy6PD6/md3YpVGaLwSoEHIlPYf0cb4n4eWk2rBeQwFC1qbsZA1SVtH5FU822lH1mNwA9YbBitzoXL0WVMcRVoN+u8hfNkkTcFLu3wYzmvboHr6lNEb6dI6XZosf/VR/U+Jk2EaC/3Gn5cDl5wDr3xIUFP0Gp4T1AyNcgaXkyIemGSw92ZXqy8XoMLdz7AJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppxYHGgvy06vCQ9Svyp9Dbox+g3270x+/VbQYELalNI=;
 b=uMH/JxhotKyJBZblGFZ9LwMIxBroUEb5nvMEz0KIi5IiSko8lJpmfJlZU2NIttn9a2J/U5V8E90JMXDwnowGl3fT8v25ZFdO6CHrl1ligXDmlqQZizopFdV7EmvGrcma9j39f47EWWvM1tn7aRppK2LrF4qsM3RX5mL0BQmei+TyZohzzYgHiAHHe0q4WrjydnIFI3R/yhOk2LCiP0i4fgoVP3NO3jRO4erQ/neSrkM8/r5m5mHSvFaXPm2Wy/VKEsRI3eWv5SPsxbC7oYy9K3/FOULsBcyfsHf7dIudHclaELuajom2EVULecPss4YOXSEycX0NDfVAvtv9lUp9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppxYHGgvy06vCQ9Svyp9Dbox+g3270x+/VbQYELalNI=;
 b=pQo+12mO9XcsrCbswqNRefmQkn7D64087k9VKLg5ZGZStmKtoF5uzwMAxVC9iKZVSLMsB73sqJc2e52A41r9csG47veX96CXO73zuwqseAR+11WbV456FcXCz3zSLw5KvSbVp+8xLxjjp+6hsu8DEf0s8LIxj05h5VYmIl9CpIE=
Received: from DS1P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::13) by
 DM4PR12MB6352.namprd12.prod.outlook.com (2603:10b6:8:a0::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Thu, 19 Nov 2026 06:19:19 +0000
Received: from CY4PEPF000392DD.namprd03.prod.outlook.com
 (2603:10b6:8:44e:cafe::95) by DS1P223CA0016.outlook.office365.com
 (2603:10b6:8:44e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 06:19:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF000392DD.mail.protection.outlook.com (10.167.247.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 06:19:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:18 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:19:17 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 11/11] tests/amdgpu: skip slth-gfx-umq-vgpr-proof
 without GFX user queues
Date: Thu, 19 Nov 2026 14:18:32 +0800
Message-ID: <20261119061847.3442210-11-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392DD:EE_|DM4PR12MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: d233f4e5-a350-41b2-433a-08df46050bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LNNTFVePvWi92LBkCC//daQfuCssHUSQqMEengT57ptlOsUAd9Nkoq5avoWbU2TStVheEgyr08A0x5Xv65vaQEe81jW6A1DXooGuVAUKEp0ySmNkYrPcSCesQe18D7cGxr16pxLykCjg+K/ZnbShLZC8fuLF8c/kFuoTYN4kFldIuMvlOCfPIVIO7Qb3QZbrBYKUpwrk4pdMdDHPupz3LkjKeHfbIKSxu6YiLOEjV4OC18UeWk/kDFQJ3Sawbn89b9WxDPd43JSINP83XK29fqKVFAZDwc6PEK6QZJfjc2ep7w/IagX7gcp0INfa+6PbXzTIB1fSebIhEhQjn6sQzhMHUGgr0Kw1gg5Tevngsa1eulaP+Qq/XWMQp1+VLydOvd/KF6XlexcMU3Lnwqsv8aOX4Hl3/GG2N1NM+gVsqqXvWeXyz9Awx/Sqgh63JIyHTOt+Cp4RE30bv1qz9HGTJvNnOE8zqwtWwp9MG8GuaM68WpP84bKbatoTkio2E04AkGqkvz2N18AyIl9FaZ57biPSBLg8Jo8dezi1xOpzuuItmYMCLCGBypbZzqzxUW8jSQV8j4Q8eagX1+50i6O0oX6S2xpNthZnAfzpxr4s5Gr/6uSzH7yn71JtGxBhEPcL7l5YHdlQsqJbpV4v9l17ESn9JdKYNGbKbZY3GmFdEdnnO3u4Py2gziNKMUcVAA9JqlSCkhieW9WdZLuKWWmmyg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0iK0I/9vu6tIKcVVW9V7FGo8ok6g+n13dsDBVMT20KTX9KxTxLya0Jk5EGEauuNJcVwaKY9o5GtYsoIrJW4ciDIVgu5cWSmyOlIhUU5Zy1B4p13ErvaLnh64+0i509nDvWUmG3VsRWdJEZvQLAEVslH99sMnXi8Nxro57LPvN1UQqp1Kzmo5uXejjJLhdcoRLh2L28OF0/L6ph/18Zr/FyfqK6FHBibJ9OI5ubkCOenAeAFbfmZcztUmW5B5A+m7oR2jTt8nby4q1kt5cAgufHA3LGXODK9LaWWsRqKywf9wsvvlXNt+f4KTFdtdZYSAB/7DDacqi3HXCrJbXREr/4YfUQxry6uD2oe53gesW/oW1zlKM5FlMqGXCB3QQ6Y7ErbPdEjQoSnTUudhTaZv747FwK8lYV4bAyWWvfQuZw1As2Q85J4W86bLWyMpNWOG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:19.3571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d233f4e5-a350-41b2-433a-08df46050bab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392DD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6352
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

The other SLTH user queue subtests require user queue support for their
IP, but slth-gfx-umq-vgpr-proof doesn't. It fails instead of skipping on
GPUs without GFX user queues, e.g. GFX10, which has no MES.

Require GFX user queues like slth-gfx-umq-returnproof does.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_slth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index 585726205..80b82595f 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -1591,8 +1591,10 @@ int igt_main()
 		slth_gfx_kq_vgpr_proof_test(device, fd, TrapHandlerIsaProof,
 					    42);
 
-	igt_subtest("slth-gfx-umq-vgpr-proof")
+	igt_subtest("slth-gfx-umq-vgpr-proof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
 		slth_gfx_umq_vgpr_proof_test(device, fd);
+	}
 
 	igt_subtest("slth-comp-kq-vgpr-proof")
 		slth_comp_kq_vgpr_proof_test(device, fd, TrapHandlerIsaProof,
-- 
2.50.1

