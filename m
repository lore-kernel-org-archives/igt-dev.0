Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F1606A32C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HXeJyOaP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFA010E037;
	Mon, 23 Nov 2026 21:45:17 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011022.outbound.protection.outlook.com
 [40.93.194.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4CA10E037
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 21:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CicuScv/ui1UjiBUOqhdc2ks0jfbOilM2h0PspwEnvcb/39//VNJoSknu/WySyRFnCpTTOvhjKiQmcTMkRJU5A2JOy5ZEO5wmNCxLHakhG0OaQj9AeanpW/2QirC/B8BDYqN2EvmJEGmbmqMtUKFcCIesD+ZuaNlIo7isFR2OIxQGTLy0rQPKqd/yvyyNgaKhJAvmN53ByGvPcPpfo5x8CSIbNXhIff5F2ntC1DSxB2zKD1xuIPra8g+nc3hZMCj3zJd6iJm5uk0j8CaZ04/SBi3YWlUOkLAHecI0tNvPKpucatkDEJWU8L3z3O9e1Ba3ts8/5hWYtBVSeB+n58q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knoU5v7ronEnYCaHmjAmtoD9s3ZoI8A7RKXtwOriops=;
 b=qNuXjld31LhUwCFz2unP+AmJq6ID9Y3sTX1RiUVJLsdggl3pQBY1uhL0r3un2H+Dm3ULSzcps3IaKU6YePX6QQejRjZbpZmluDO5hpo+cUoMPdDjt9kvUurJqsQxu8H7bGJl2BwL/3EJ3v1ZLP3XxUDsDOrZ9kXhroyQNYqv1eS/EYLAjSoSL5Ex8lK21k/x4an4aFcMIaSBMasgzSx0ZGLPTiViEDAjjzCXjm99NKs76f5l0Rf8LQX1WB6016SE8VRdYycQLqPu+ieyPNV/R7bSefVKQiUQd2TWEXu+PvpThCAnYZ+CKWMjLCfb6QfTLvA+VyMVz4QZkPtHaKqDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knoU5v7ronEnYCaHmjAmtoD9s3ZoI8A7RKXtwOriops=;
 b=HXeJyOaPzjNEgm31re448I8wkLDeET35czZ3z87kp5djG7HBAIYdya9HuCprs/gx1xpI6Lt6gVjxZTbzbtR3MYV70keFmBHkacDYggdTqARUII+CQ+TgxHoA50oztA4N+PHyOJ2RdyeE3Sh3x5neJZrzSplk+BNX50c6dF2HKIk=
Received: from PH8P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::9)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 21:44:07 +0000
Received: from CY6PEPF0000004C.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::86) by PH8P221CA0004.outlook.office365.com
 (2603:10b6:510:2d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 21:44:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY6PEPF0000004C.mail.protection.outlook.com (10.167.247.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 21:44:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 15:44:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 15:44:04 -0600
Received: from tony-dev2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 15:44:04 -0600
From: <Haoming.Qi@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Alex.Hung@amd.com>, Tony Qi <Haoming.Qi@amd.com>
Subject: [PATCH] lib/igt_fb: use cached copy for slow reads on amdgpu
Date: Mon, 23 Nov 2026 16:41:35 -0500
Message-ID: <20261123214135.3566782-1-Haoming.Qi@amd.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004C:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: a418317e-dbf9-438c-ff9c-08df49aae60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|11063799006|56012099006|261026130827099003|261022075727099003|261102123227099003|261026135527099003|261026140227099003|261026121527099003|261028144727099003|261022113327099003|261022115727099003|261021121427099003|261022105027099003|261021123027099003|261021133027099003|261021130227099003|261009223027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: pYlqbyS9G+CU6xABTcag6L0HJPZ0ptmgmu+X5bVhRUQq6WsPIFMKnlv1147ZYkxmu6P1oZ9dh8eF5B/nI9rHI+WN5Jm20XxwD3+MDpp+WBBk8BKJPBRqN0SZ053b3FhkFZDajf3UWmT4ICmRtXfMlLpAb+V/BpiIjLeOARLKG7G9uvmC+g/mHT+E+fQW6intySazbTefKzgu4dAoVXshWDHogaCq4OVC/0TX2uC7tBMoj4Bn0ikHa5aZ5Q9PTsuPl0trPraN/7Orhr1dKib1NPEFw9hTi0otKYDd8Ev01OSatBOBSUyHGdsQXy1nPbX9FG3FFaqFqZo35wWY9CGk7rni/exx4uwCrf/d1/40QEvyoRoNnB23xhZg0SdvqmiB2SbEZVLVgfChGiF/+C61pXbfwvSxZmKrVfJXWPqHvTslulbCJNm0pqSaLf6pzC4WxayRCl13wXMR8QgG3RebhYBjbnVxonnZfelkv+Ftr5/YheFk8e3MLuXqc6VwgKeh8THAKHWzRPr3dr2oP224laoVPJoNG6FkNy1m61u4B0vbXwdd8cRyRmb/Tss4oVXDufduMd6UNi5vaAjZyg/Nsmw17/7Z3UGBmjkVkoMDMe24znPxorf8wSJcAP3WUEez1etp8KPqB8QRsNC0DYwellrKd+tbmEq1cAVj+M17tVgtiTEJ9oJn/jbMw2/gXdwxOt13MFkAmfgEQKYiRTEZDg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(11063799006)(56012099006)(261026130827099003)(261022075727099003)(261102123227099003)(261026135527099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022113327099003)(261022115727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261021133027099003)(261021130227099003)(261009223027099003)(261021135927099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FPZzsCRnBSepuIBKim4Xcye9Td+c9hroxkDYF23Rf0x8CF2KBlOZ5CYFXH1W9LEjPbStYZFIIcdFuXpCbCCPr1hA5hHt1r11FFRslUDm3XU+yEysYwOr6Mjh8l7gjWVuNrcE89Gctx/4UOy4wzb5oFSnPDVJJNnKERTG4ACi19UrawloaYoL9VDwCPPBpgrjErXWCdDxKab3iZ8naoQlMyyKA1eCvmdQ7+0kAq4PNag5E9CCRA9qBZ0L9qD7fVv+MSX45vX4pTQurHlKAP7m63yXZm20xpdx2Hutjl7Blc36jfQoO2Ise7u8gglstUDSSVopkmswzam4WxkblP2a92pS299kgk8Bj2gD0lQoXUUgVsvTSO4sM9WuiVw7YPmokwcSmg+gNs826wRo2M0pSLgLpBTMQdZXpgpYDVg+ZYwwBHhy3drT2qu81GwcgZUV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:44:06.2464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a418317e-dbf9-438c-ff9c-08df49aae60e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY6PEPF0000004C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429
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

From: Tony Qi <Haoming.Qi@amd.com>

create_cairo_surface__convert() only sets slow_reads for Intel, so on
amdgpu the YUV->RGB conversion reads the source framebuffer pixel by
pixel straight from its mapping. On discrete GPUs that mapping is
write-combined VRAM behind PCIe, where uncached reads are extremely
slow, and they get even slower when memory runs at a low clock.

Set slow_reads for amdgpu as well, so convert_src_get() copies the BO
into system memory with igt_memcpy_from_wc() and converts from there.
On APUs the extra copy is cheap.

Profiling amd_plane@mpo-pan-p010 on a discrete GPU showed 97% of the
runtime in convert_yuv16_to_float(). With this change:

  amd_plane@mpo-pan-p010:   111.3s -> 9.3s
  amd_plane (all subtests): 7m40s  -> 51s

No change in subtest results.

Signed-off-by: Tony Qi <Haoming.Qi@amd.com>
---
 lib/igt_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 3d15f0595..e993d7d71 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4803,7 +4803,7 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
 		igt_assert(blit->base.linear.map);
 
 		/* reading via gtt mmap is slow */
-		cvt.src.slow_reads = is_intel_device(fd);
+		cvt.src.slow_reads = is_intel_device(fd) || is_amdgpu_device(fd);
 	}
 
 	cvt.dst.ptr = blit->shadow_ptr;
-- 
2.53.0

