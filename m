Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1F4606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=x638oSEk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDD510E108;
	Wed, 11 Nov 2026 06:39:23 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010014.outbound.protection.outlook.com
 [40.93.198.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4183E10E108
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 06:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEhdOxgasELttS+l7SfKkU1SlEbe9qa9rktxRe0LzrY3AR8qduxH9NkjIUCZDVf6aVdAWNx52d/XE2VXvh65JH/4cEw1XnMdIDxu4vzBg3ldPOR0nUOm5YdYMA51QK0zrkVgHRzuMev1QJvDVHiAfOgJ5szXk4OBg5LHnpkWTbD7hed3K4n7sqPfO9gAv7mf+bszBAWm6kJLVwWZb6O7Jht02x6N5BZ5ccKBUG57MmRjW02z/sKZUlTJUWL2+2UqxFgGzhg5uLAWoN5Av6XEq7e9mTQ0JN2xEcMw5GTXZsmkyUBdU3JGYaJFHayqPOi2uZpYMrxuw00sKYWONuQawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vb/Y1iHWOe/cTFsHftHVtvs/l1EyNaTsQGhLiYIXoM=;
 b=JWm5s8EQhQTkQ70q7TgfW9XrW6x3MxtlRj67E/U9oDAJW3DlgnaRLgI45Z8veV2n+FyuIF0cDCAnMw3zVb564nzKRG+Soq9GY56WbbhBRPPuvWhIKutoVbnxP4yQVfSitS8+iPS1R2JawJRMqp8Pj5rkguaZ0sRXB6FJE2zoBjP+HsH/AdWZbzXBhhJ45+qw6w98xzb7I5wAQ1UGnZq84k+uqpUxVv2DD+Qicov9LmGCJJMrjSCzTAI5FHXMYmfMRu3wx3GPO8F4QA6oxShKCxPdkfPzejoYZjvOPXiwIPDFgno9iA6y2iyFZfMpWR+ljgRcsKU1zthDwJUIeIUqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Vb/Y1iHWOe/cTFsHftHVtvs/l1EyNaTsQGhLiYIXoM=;
 b=x638oSEkfUTtSw8njx1Ij4DmFDLUS/2gZayvcetEudg7RJWscSJHZiDYmMTDBCSGOxyfBkhISnq/U6s6EIbUU6cftZhTThU2PrxL38rLthlNTk5DJtJymTIZmTAU6uaxDncAwrb4tUED5TJagvq90xK5isuJ0jmgYp3TNQAjzl8=
Received: from CH5P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::21)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 06:38:16 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::6c) by CH5P223CA0016.outlook.office365.com
 (2603:10b6:610:1f3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 06:38:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 06:38:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 00:38:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 00:38:12 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 11 Nov 2026 00:38:10 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH] lib/amdgpu: program COMPUTE_PGM_RSRC3 for gfx12 dispatches
Date: Wed, 11 Nov 2026 14:37:57 +0800
Message-ID: <20261111063810.3878508-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 5489b85e-a7cb-4481-763a-08df3fbe5dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|11063799006|261021121427099003|56012099006|261009223027099003|261022075727099003|261102123227099003|10067099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 1//Y7gdbqpVEQgYNJTZ67obthQ8cyFH6B3BJgPERfu/YpIXqT3TS99M0RQQ+cL3yse+I/hLeS/8FuVPcJJoBLJ6kGJHPHCWLXJAHblgRpYNg7P9NsEOyc9iunFixZD3wfQxitXNAV5r+R7g9bAB7ZxGpELuH+WXWwpARB8VksejqfswNxaTCy74LJL9N31lINpJj95AWNMJa8xa/C6YU9VyNrSsXFaQvxiBKlXtO3eCKWohuoU4QNvtcj2/jv8LDdK4NdplqaYl65wSH4ruhihdT+uvFVFzd3h0WTaYyvYoRkKbfBsh9n4Lsz5hkimvteAldEsMJhCylB/j7/pwXHpvpY9XO9JB7Lud6il3G3RvbrA0Nk4OJyUFaR4tEtWbVvvAyW6EMSAYsghL4yfIlV8LkZUgFJbpc6Tf8X88Tj5Zg/JSC2x8ZDyKFmUSWZM8jwGKh8v13ybH+MGu6AiWVcBhZbj5pSL7rOgj5ujBPmU+i4luax15LZRt5zhnY35JeI+qrH71siVGeDTVrojGsXF0aOjMGFpbSLpMDPP5zM0pD/U2tx8YOFdhgz7u/E6RUvfB+J+ww/I9yBHpeLph/oxsF4Emzl3iL7I7BD7yalywVXp+rkLf+9eremeS90OxbBEZWly+OXap39ab3sv7lSH/WAdmT9Y3n05E3fvQE4iIqwWdI3XS5fn7hEX9SMIbZBSSyBultJJ89GSBPXzBoZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(11063799006)(261021121427099003)(56012099006)(261009223027099003)(261022075727099003)(261102123227099003)(10067099003)(6133799003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: af0tRhRbMV8X/LJS5gERylxKtigCOvAZgG5AjeftYJLPns9DoXMAneOfHDlFiVetEErUGyt56ys51455H6TE3G77O3opPhAFHC9wpu6/+rnP/USf1QEjT6zU0LWqP8sh3JF/lNIXSvGtpu88frI4/QUM2d/O4P3j4Jnp9ngaT7Sqh3lpqcO87KfzKF2UMRsE1ShI1lc09WjmYne+XxfD1AgQKNq9neG1nEGvYT8LlPEGXwvOmOwvYEzDRQY53NI0Lz57hncSRokX8Ngswe5ghoe7VY5pxC+dh2aIrCSnsginxbcNwDLctMEPZroyoWn0w9/BZ69SLoijj9Z8lrEkJjT7zu9kM8lkl9KpIP6e6JEBlVgjvIBq+Vsm45IGbVxeVYS97t4ugrZVzIsWypD+x9IIq4tEZ2ewpwGPrCMRyhmICxVoguX3Xmxynlb1vhsg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:38:15.8331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5489b85e-a7cb-4481-763a-08df3fbe5dbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321
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

amdgpu_dispatch_write2hw() sets COMPUTE_PGM_RSRC3 for gfx10 and gfx11
but not for gfx12, so the dispatch runs with whatever INST_PREF_SIZE is
left on the queue. On a navi48 gfx user queue that makes the instruction
prefetch run past the shader BO into unmapped pages:

  [gfxhub] page fault (src_id:0 ring:24 vmid:8 pasid:1199)
    in page starting at address 0x000000010011b000 from client 10
    Faulty UTCL2 client ID: SQC (inst) (0x9)

Limit the prefetch to the 4 KiB shader BO. That gets rid of the faults,
seen in 4 of 40 runs before and in 0 of 70 after.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch_helpers.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index 1105bb54b..c05198d8b 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -224,6 +224,15 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr,
 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 		base->emit(base, 0x228);
 		base->emit(base, 0x3f0);
+	} else if (version == 12) {
+		/*
+		 * mmCOMPUTE_PGM_RSRC3: whatever is left in INST_PREF_SIZE makes
+		 * the instruction prefetch run past the shader, limit it to the
+		 * 4 KiB shader BO (in 128 byte units)
+		 */
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base, 0x228);
+		base->emit(base, (4096 / 128) << 4);
 	}
 	return base->cdw - offset_prev;
 }
-- 
2.50.1

