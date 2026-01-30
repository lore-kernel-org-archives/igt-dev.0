Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EA5D49C8D
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 09:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7699310E2C4;
	Fri, 30 Jan 2026 09:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zq7Dqrg4";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012038.outbound.protection.outlook.com
 [40.107.200.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1AF10E17E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 08:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNLWAEwp3wZiSdr+2xZG9Ce3bKNWni716h8pSWdEX1iBbf0uXssKL2LWHEcoWP6bjIXFeDONQCKuo1BrABwxIIMVzbo7qvVJLVIHDJqYWB/34thXonLTkiWCFNdvKXVeoNYpDI3je4piUgU8BaqwM8zPYANRqQrnE5oVPVrHqdMCaqqTMLih6Nesd8bVAaQ51TX4rwMvduM0fPOB78rvxool6/BIg2M2m4CVRVmS1vEtU80QH1HBwADSIycLywt9BW7k2jW/swZy/p4q3CGSMbVFBq9ciLNKKxKtSsCqpYrCAyLYYL65V2CWwMzUI+OCwkCnTCIit9fIzUHDR1VRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW9wrAxzEII52EECbQwp6WnbAA+4mlbJ8F62+JaX6bM=;
 b=aHqiP2ysxsswHojRtzUfYxO0mK6vXNDdz4UFKR1cQgZeg/c6lainmhuMx3CW59U7bnbcwST1sbXwZDyM/KsTFskZ+InUXxy+69XAL+6LLqWF+FvD87eP43WuxJDXeV0dMLB5lS8/rsrV/exvUspNkFQ/z+isslToBDgwY9TLaIJGLBn8J8aLTlp8c3bK841QXWfLG317rpjzbqZn8ctKQzyQGttAQ+y+gMfX936ZpHDjPkYVLmdlYQfq2nO8ikgk1HOOjxgZ4SoVXoH5lcdzx0eioQeiqu7dJrrfrzZuls+3ty0FFKvLFODmMt42117rvNKJo4Cc/CJor2TNmkyGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW9wrAxzEII52EECbQwp6WnbAA+4mlbJ8F62+JaX6bM=;
 b=zq7Dqrg4eZfCGIwBBap/TkzhZAhG2Rmq9LUCDdNofvmayPUXrO8yrJB9H/Q4cPIJfoWbv+xCGj6PIoJ8YZM0rsEvYqJSy6wSpuvzeFEUHUvNfzpNu3OVo43yTeEo+AhB1+l+x/CiyOjbuIm7bPwkk43M9rEs8DZHOTrmrq4zzI4=
Received: from BL1PR13CA0284.namprd13.prod.outlook.com (2603:10b6:208:2bc::19)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 08:17:00 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::82) by BL1PR13CA0284.outlook.office365.com
 (2603:10b6:208:2bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Fri,
 30 Jan 2026 08:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 08:16:59 +0000
Received: from rtg-jaguar-KRK2e.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 30 Jan
 2026 02:16:58 -0600
From: Tessita Thomas <Tessita.Thomas@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Tessita Thomas
 <Tessita.Thomas@amd.com>
Subject: [PATCH] Fix IGT JPEG Dec Failure
Date: Fri, 30 Jan 2026 13:45:44 +0530
Message-ID: <20260130081544.440891-1-Tessita.Thomas@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|BL1PR12MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 977f9deb-cd4d-468e-dc8c-08de5fd7f10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?baKUXXwNxJGPjiSOyjG2LA5q+jEfl58FbZ5B4jchKDkl9RTfO3rLsex55Nru?=
 =?us-ascii?Q?dADbhybtY1m0gMrmi0uy1OFhr39E5vMmb06P1ABJAtl755CgBvsFrkLz+Pqg?=
 =?us-ascii?Q?zTunbaWdMHMIYVZzFmtznmimg9NLauGE6m/ZQnYyAAkJGmn4Zx5Zb7EpA8jF?=
 =?us-ascii?Q?aDZtq6zXAPmbBEX8hcCk8aec4+bCVwCK2QvcOJKAbS99ZUCM59sRF2Rf85rH?=
 =?us-ascii?Q?Q7chban+Wv8E0OqT1IshuifKeHrsbICE+46dhYrP/+yEhCCl3tizNFqeC5S6?=
 =?us-ascii?Q?VGEr+musLm/V1aFeGFTbUEPECCaarTJjN5mYt96zCVQPKhtmuPHjIeT3qtwU?=
 =?us-ascii?Q?vrV5CoOD3enoScTaVMrSJ2YW6WofqSw3T6pZ106Js3mT5VJPJpw7TRUkRLD7?=
 =?us-ascii?Q?Es0Np/Sj4+BmNPf5FAsLmJYgPDMQeXqGwvFiXfJruPrzagfOqehRlI/s8vqR?=
 =?us-ascii?Q?Zot5ELFOJJHyREEYbKKSUDuxpcF1dO9jJ3Wg5B8Z89cSSuTGpD7uHRJsCG1N?=
 =?us-ascii?Q?zw2GYOfAKLZ3EcxQdmiweNgYiGCt8BQZAw8V5Zv3wzUQBOpQoVUoF3F5jhsQ?=
 =?us-ascii?Q?BTgkMpmaXRbxjkmZ6DOYWx7r3+rZMAUBUNWWKCDaynpA0lDniANbQ6hzhJ6v?=
 =?us-ascii?Q?+QzjWKRay/Ia92oHU010hrpS+rEovgjjMDHcDrmRC2i2BiwhBxR43/80wlKm?=
 =?us-ascii?Q?DmUuFwGHwq13EgVbK8w/DOjHsGF2nPWGmjk935Jm1lpZjfSh/4XCOIukt5lO?=
 =?us-ascii?Q?kvdTl5QWfBDQWku65Lk47JOPfuVn6BmL8Su1XFcxIgjPJ5Fp7NdsFY24Y7CH?=
 =?us-ascii?Q?gAFw95q2/xhbqjk/Pn29GV9U1v3mG7QK17VAEhltYiL0R2IcYKK9XsU1quQv?=
 =?us-ascii?Q?VjMncjs4ERtY4lZsBy5mEhSpVv/nEqFkGMzLrupeQuk7UJmsbAq9REdWQi5p?=
 =?us-ascii?Q?dz3G2BSWQtKp8MdWNYKxPj7hQq5Am5VNUVCL49hw+SNrjCe/ksyo0mz3RpMF?=
 =?us-ascii?Q?3l5AEiy9qYQ1vtQ2xXIliOXSk1x6AxtnfUAdTH+fvN763+4kFDx3+eVrbOM7?=
 =?us-ascii?Q?DMvD6hCq+RdQybxo3+CMq8WDK+Vt/q7w0fFgcBY+vgvlVeDLhcL6A5QPKl8e?=
 =?us-ascii?Q?esEmldUAsr7DdUk/+c7qOStOX+U6Ee0iJ6hxvaSRmWK4MT4u3/ouHk59tRSD?=
 =?us-ascii?Q?f9+8HuaYdUH71/O4bZ0r2Rv5170J3gPUS3YzFUHgVj9Blp0Qw3AfC541dcXr?=
 =?us-ascii?Q?71xGAOJl5k6LBx6Yzi12r6kGDAsptxeAZhOdI5R3PAv+vMp2eWHSGtbTH960?=
 =?us-ascii?Q?QVroeI5pAbumJcOyhNrwFQjjtJO9TIgbIN4g3Wsv/5rBZgIZZEdzFFxh5Q+b?=
 =?us-ascii?Q?+gDfyieGgZ0hgZwCbRq7XthUD0kiv7W5/KK54HBHWJFbhOnRyYHMcd10hggW?=
 =?us-ascii?Q?bbUgiax1sTrmoN9+vZPksXRKPUNpV8B3lu1YwegsrlShPBBWwz7L9v+iFY9j?=
 =?us-ascii?Q?sMGXfauxEEaSiBWkcK78LlNMhksKDC2EGo/rpKbSr8JuX/1QygPW3xqWCypL?=
 =?us-ascii?Q?Jc5otXh9a9z+AEPjkrPM9Y6+gfC0hgvB0mxXE4VCoKJ7atXyuaEFQy0/bL22?=
 =?us-ascii?Q?4+GTHy7DhisIeU+GZdbdQjWZuES6/eDphm+G8A+4v3qBRVmOf062j8KcJ5Qo?=
 =?us-ascii?Q?ig4oVA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XqKCu45wW8F3YbkNX+1Py4d1MZnhh037dt9zM3U/e/PhMOcefVpf0aNyVjahdvcdjkKoFIanTp82aMgOj0LTC98hcHD6uy+VJkx1NmO13fcdbYu7+Xsaxbyd3BP+wAHZ5vW/eQVNxuq/n2+CendDpJuR8EXALVy5MW2VigIUxdrUBDTo9vyO1xNFVsqeAWV+Mn8ZkG/sumSF1AQBoRoqGwRz+QSfw0vWHmlVX0I779ABwNHytmKAh5x8FaD/nkQJYzvYOve9t/9njWMD0Nttc7mWie2QL2eDl62avoMlrwXYo1sg1RJfvKfs4O8qxwImrI9fQjvuFEwz4mbO6fv1NXW3Ca/bvCGDrvkYe8JnIOinjqlDbCmmGFg3e/2GTHOyeiafQHrg5KNHR5iXlpxzN0xoXh5JWMqNkERIM33iflCvmjqMzfSDlbZWWqjsSHYF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:16:59.9569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977f9deb-cd4d-468e-dc8c-08de5fd7f10d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:48:42 +0000
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

For VCN 4.0.5, IGT needs to send aligned IB buffer.
Added padding logic for ip = AMDGPU_HW_IP_VCN_JPEG.

Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
---
 lib/amdgpu/amd_mmd_shared.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index f504db596..b9eff16f9 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -161,9 +161,22 @@ submit(amdgpu_device_handle device_handle, struct mmd_context *context,
 	struct amdgpu_cs_fence fence_status = {0};
 	uint32_t expired;
 	int r;
+	
+	unsigned int padded_ndw = ndw;
+
+	/* Pad IB to 16 DW alignment for VCN JPEG (ib_pad_dw_mask = 0xF)*/
+	if (ip == AMDGPU_HW_IP_VCN_JPEG) {
+		if (padded_ndw & 1)
+			return -1;
+
+		while (padded_ndw & 0xF) {
+			context->ib_cpu[padded_ndw++] = 0x60000000; /* NOP packet */
+			context->ib_cpu[padded_ndw++] = 0x00000000;
+		}
+	}
 
 	ib_info.ib_mc_address = context->ib_mc_address;
-	ib_info.size = ndw;
+	ib_info.size = padded_ndw;
 
 	ibs_request.ip_type = ip;
 
-- 
2.43.0

