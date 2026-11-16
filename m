Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA73606A781
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cKjxEVI6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA72310E190;
	Mon, 16 Nov 2026 11:26:00 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4E10E190
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 11:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5o+eyWzSE81Tocwk3oObutGB7MEgJ7heaysM4dmBhQAFNvVMfDnoebTC7ruHMgtxc0OzwL9+FJ3xEzPvjFijDgazQPI6/s/CIHD1Qi3Qc8JOtLhXIr9IAAyNJ8uztz62tatH1Q3cd3fG+rLcvgYFDznOR31JBmLPZGq0jshwcp/9bvrYr7nbpTi6r7oq4bTUqRSLFUYF4XFz5rUnopOBXQbejUnNQKoYtsgbhVeeTMyw3P4Q77Uk/kmlkGWop2vuzYfbNUxIhNpMWTNyFeUgGAh43mHLb52uDRYudmCBO897RYSLM9Kq9u2q+eBIsPIzUylfov03aD4WUf1x+D2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mEO3wsPVZ6HROeFhZc/X38elZBiuNZkxMASNZe8apI=;
 b=lP2lSMaWA0TisI8ASqEkSzayCdqhZBxfyQqr1JJKUtby2UxII0H8EpSKGV1/3eBQowZm/v8qfxqhNoBqSedn50QCdP8bRvY8mFPqZ5z4OQ37r+Bnf/SDXodpL4p42ztjpcATnmTGHlc27jv5PX3L3GgOlVBhEcImgxkYHv1IUlqpOZKgS1jlkSqdH95QX63JrxQevcInTQ5aHkKF7kHoAgcTNRRDfwY8/55BtFUiyDKxUTzKOpURp7j+m3sL9RoY+OjBgzno7NiT+0f/tn036pj+3I8TCr6jiMJtto5Ah4/mmPh51qqkdC4sQPn2Kj/KFweIP/W8ekz+XtkaGp2wzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mEO3wsPVZ6HROeFhZc/X38elZBiuNZkxMASNZe8apI=;
 b=cKjxEVI6k7HZPl2pu3LW/IN8JW9fWa8I+KGpJv6Udo/aJ5R24onZZln4v/7Mm9SlTX2MBnuTpC5cVVHj+QX1mOjDNWyZURSa1bfXjf9sIOIqvSiSdOCeqoBbb954F5s3+210x7LYGup3oE6LaoOdHRjzG1YUbMFtUzmfe+oliok=
Received: from CH2PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:5a::28)
 by LV3PR12MB9216.namprd12.prod.outlook.com (2603:10b6:408:1a5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 11:23:49 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::4b) by CH2PR08CA0018.outlook.office365.com
 (2603:10b6:610:5a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 11:23:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:23:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 01:02:48 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 01:02:46 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 1/5] tests/amdgpu/amd_replay: Read DPCD at the target
 offset
Date: Mon, 16 Nov 2026 15:02:44 +0800
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|LV3PR12MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 810a2a5d-1e7c-462e-f19d-08df43d415fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: js6A4WW3j4Z7GyiNpw31mvOy97b2BhGp9ml6WSXWd+KrOh2i0oAWi4+AVgk7xAUKl1PQmOSGiC3pmStxcLrPMREVhpoB/oHkG+DX9uQek/obuP1sQI2QQJf+CVUd0+0tOlIYwimAxklTVF0ttnptlM4OrOtzpHzSLVng9VCw7qmTuQoLEBp3Bigkk6DRPaq43yHakczuRfYaZVKgjRJQpyCldZ2zXvBeKnbn22zc6wQiFFd3J82A6/awajH9niRduVfAqMMFgcRHUt0cp1MZ3809OXmgNh/WzTZV8P3p6X86VSCBnCQwH4hPHBiIwVLBBWxd/6Z19ikLihCfpvviOf5sze8BfP6O9+kLQ6DREuXV2aFq+8cO9IKbgFaR2VWd54BB6SeZmVvsepWfk46DBEKpPrzfL1V/iAwVwmBz831ZZyOkAHbDTQGNvYf858f1p1SnvsBVvsL1elg978Eit0WzcwORoGe3OzeqXCpRF8bAnkrNNjMEf1uXLMJO9Pco3f+87y75zxv4bGGwlsJ1KFsUQmAwdTHveSf48gx9I0K71AfDFM460opq60MyesOFrtWeQArP2mm3l+N/W/HEXva9hrD2MIQq5dOcXWCUhrLVYmGkMj+5ipEpvYNIsfa8v+cZXJB9Ep9IZfs07vpmt+0gqhGIFDjCib/6Zme8E/Xv5+lI6w0zTyZ1X392UeqNYhUOm1xNUROiQltUM5LKag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ny7c92d+R+znBbWSSi239zwiOKD0fZiFYWc7kyypb+V179lqTUe3ONUdmHMcqd+0Aht1TwbsyTyZVnMU7wwsMFDYvKdRsKF+nl1uYbp1B0+HaKGnXvjFXJYs2MG3z5O+2GWJ0l0uKH6NfgjfVoT5cARM953zzjaHfSf8zzJIZkwjQ2IlCsSpxKNTqyZBxYI3t7tfk7AbjpNkpbWTzLT+Kv7uX4HJzK291hHnYWzM0gnv8IEaeMu5O5nIV8hJY5ml86FglLJ34hsNFw/98C/PkaVEd+zaCzfUfG6G5pPiuv8sbavWfDqP99nq4B+IKDDmCmnMt0v9qFEVIlEXWw3h703YnJfLKa7VnmTbMH6r9Bl1NAY205e/W3Hn91VJiI7qUymgb3/DS2aIFwaJ0uek+tVCnjrzOPaHiS7XNyz2vSWEtzgFeoe5JJZ9AXjWcJQ1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:23:49.0666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 810a2a5d-1e7c-462e-f19d-08df43d415fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9216
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

