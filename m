Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD08606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KVkhIQhl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9510C10EF7E;
	Mon, 16 Nov 2026 11:33:07 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011040.outbound.protection.outlook.com [52.101.57.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC7910E190
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 11:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3gShlAtw4Ltna1FxFnry781ECBcrbKNm3DueO9SZSJbhOGIj0tgQyaVKRCY6pJRa5hadLgBrhZJPQ72GSR4yDBcgq+eOY05r2PBq74oYlmcIbOWoQioWcBFw6ow863FJVOE1rERKcAH7jv1+yFnUDM1lajyjGRHPzzbLRbVK7S4rBgycXn9fvEyfUTuDoLQG/mMKW3QCfcrsCBjBFJ8oQ1KVl2sjwSRdmUMIdcx3HCbiuCNnKGe+PFAQg7I4Bbi70vMvvzF0GXq2m3MrNwkNKAvjlnj6jUcLyapooAoW4ikpIokFOBzCqxJuO47H9mmgtFVsMOdYw6b14HqsIo/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mEO3wsPVZ6HROeFhZc/X38elZBiuNZkxMASNZe8apI=;
 b=g4naz7XFKdedfp64NKIvjc5M79T3uyXcZCK+s9rNZQHkUVeK6qQ7kFdPVlFrHtgB6gNspWPpjC7pn15n3TVwXv4/Wbb8fz9uHR65FwidIpq008Coog0leDHbzUnnb+yNmkbbTkCbKaVjw0f0Wr4hNh30TasrP0/5fB0vKwYH8O/PPafOttjhVrPUSaXiIhHPB4T3bDhy/AnqbKYsf54jBXfp9TiCjRIXrhZ9lNEskC8/3CTTH7XWEQhwigoon+uvridAN2Wtfv6gJQW4+O8lKQkAEr2dbTg6BQVbLhEcsrDCnMVA48jp200dIoGLm7GC5dY10MsfdxeTjCQNlxUPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mEO3wsPVZ6HROeFhZc/X38elZBiuNZkxMASNZe8apI=;
 b=KVkhIQhlCbrWX9RW81OdkGUCkhtapfGEMO+zjiFwrcJcNkl5Q7FZr0qhY6KDUNRCsaDlysE0WdRqGND7kxdxC9R2IJY2f1fEe4q38IXTVS1+xH9V9TxrRR0E9ROXz0Gtg6oDLjIIVzgimEEIaO65k+f+XzPEioyEBrEhGa1mYSA=
Received: from CH2PR10CA0003.namprd10.prod.outlook.com (2603:10b6:610:4c::13)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:25:24 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::a6) by CH2PR10CA0003.outlook.office365.com
 (2603:10b6:610:4c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon,
 16 Nov 2026 11:25:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:25:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:12:32 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:12:32 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 02:12:30 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 1/5] tests/amdgpu/amd_replay: Read DPCD at the target
 offset
Date: Mon, 16 Nov 2026 16:12:30 +0800
Message-ID: <20261116070248.4103604-2-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
References: <20261116070248.4103604-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CH3PR12MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: b24fd53d-2eab-427e-24aa-08df43d44ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261026121527099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: w8j53c+vm0S2T7fPK/C8O9+gFHeOkFZodwpPmjgsPsZgKpEAfv0sxenAU4wwbehh1CbCkl2WL4PMQ4kHFBeB4cSsEb+7YG2n8BNeVTh/oemuiWEFQ07kcNcpqOpErvTajBOB+JfzloTBcAZ0LVD88ilNsIIgcmr0qinqWoZSSuMbbyqQGFH0uA4Q/AHY2G479lgUtqNrBOBrlmTI7qxE9y8ySX3FUb0MfpYP4K5kkbpxDyer9KQTAZio8FrvqUAacFbj0Nl7k3wdo22rQs8i6ieT/w0vDLnHt3gRh+o8J8RTzPfuo4H39F5GkkgwMollHzgprmC0F5XgHlyru5lfKveHJi8h6JMI0AQ1+5/3fbQGT4tve7M9Bp985bjrMIEmy1sK3Xga/xwsd+jkXMIQnLwn6i01h/37mOSr1xFkT7ufeorjybErz42e1zSBD1mwDEjLjwakbY0PQvZP+dhXMpexQHmc3HouuehsAIU57/k+ep4GENNQWFUDqOfwGOBDLUr/hqvOdOXbFYgKTBUGDQmKD0UyWjOy0PVNW5N+r5HF1b2JljAilIjNNSrf6KRSuXYZK4s3xbzJ8mT1FvNvpfOZG8JTypjZJ9GGyqgBEOFFWVdIthp4dZkINxfvIaWSM0mzhTWn1DJRQ+1fB7lyOrq9O1KcTex14Pv07n0F34pSynMr+DoyDmbdWyQtMAC9cQ17zx8buCmSAEb9Q8fqSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261021123027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4TWmAtevAACiQdhFuAhIr5PBcp69R2M5qAcnoMz8YQqolmaxX1lZwCKtF0Yfnku4SfoLr8UxP6cVZDpKqIVOaOa/5z/sMD8qVywIBnafZPg+XbTcHWddHDt/umOlkavanqzbaGjoevcmOGa/9RXHt/B6xZFlGRnV1bANTq9mk7oLhTntZWp6gqsXKoe6sXwpYyeLGdVbZbREvMJmKOdM1YRRc8bHg0o/uxWke6vUtdYcTzB4gdIKppCI6P6goyY2kGB47Rp7C4eWVuwqr0jqur1pXI2dBauptgAWEidOdpksR+OgI/jQTj6xbrTAnVCdS62C3eZkc14ZjYEql/GrQOa+e62vR6bljV85LIFBEqwRUTMkwOVuEB6o6qcXKxY4Wb0yoi30deyh9piw5fbfVWaaZ18nyUCV43jQaVPejamkpjnIZNNabJUfiqHswSIv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:25:24.6337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b24fd53d-2eab-427e-24aa-08df43d44ef4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455
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
Message-ID: <20261116081230.s2ltJZaDQDPp6e8IvQjkWIqBCF3wrHRztI6pc6KFqX4@z>

A short read in dpcd_read_byte() returns a byte from the wrong offset.
Use pread() at the target offset, and drop the double close of dir_fd.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 775bed190..4640eb804 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -159,7 +159,6 @@ static bool dpcd_read_byte(int drm_fd,
 {
 	DIR *dir;
 	int dir_fd;
-	uint8_t buf[16] = {0};
 	*val = 0;
 
 	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
@@ -171,7 +170,7 @@ static bool dpcd_read_byte(int drm_fd,
 	for (;;) {
 		struct dirent *ent;
 		char path[5 + sizeof(ent->d_name)];
-		int fd, ret, i, j, k;
+		int fd, ret;
 
 		ent = readdir(dir);
 		if (!ent)
@@ -185,31 +184,17 @@ static bool dpcd_read_byte(int drm_fd,
 		fd = open(path, O_RDONLY);
 		igt_assert(fd >= 0);
 
-		k = (addr / 16) + 1;
-		j = addr % 16;
-
-		/* read 16 bytes each loop */
-		for (i = 0; i < k; i++) {
-			ret = read(fd, buf, sizeof(buf));
-			if (ret < 0)
-				break;
-			if (ret != sizeof(buf))
-				break;
-		}
+		ret = pread(fd, val, 1, addr);
 
 		close(fd);
 
+		/* closedir() also closes dir_fd */
 		closedir(dir);
-		close(dir_fd);
-
-		if (ret > 0)
-			*val = buf[j];
 
-		return (ret > 0);
+		return (ret == 1);
 	}
 
 	closedir(dir);
-	close(dir_fd);
 
 	igt_skip("Missing /dev/drm_dp_aux*, check DRM_DISPLAY_DP_AUX_CHARDEV in kernel config\n");
 
-- 
2.43.0

