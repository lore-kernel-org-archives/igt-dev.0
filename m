Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F7FC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 16:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7EA10FE00;
	Wed, 27 Mar 2024 16:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vEkE6zFI";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48810FE00
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 16:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jfu1LJkwgEoSqutdi+DRqV9owktncy8S14vBODNVF4T61N8ag6LwC2gYJwXW+zCqXTM68EnoVo67Ty9GSG1LxJeFU6NkPz/G9FbB2NHBKM2D/84FzWyE6WOGQa2Llr+G1l93N70yK3ZOCZe/RciKuNGAy0HKHMUPMYqDIyMdVa8W50gAXiri+nxjiXVY8sbVVJSFGIPSsd4YpnJb0Jqj7U4DfhL+fVIkpDBiitVjH7CXM1MIFAnD+05xdWbHHpm1pfvwxS+90vit/q3wV/OFgZdZP2KuP5uNYATJ0WWfZjkZPNpKy6Qx5NvEI4qjbcN2QGlJdfsYswJv33AET5/hfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LML+aMwhIc2jzrlOgDxJ2cPLyo0VrJ15kPP36R3jqQw=;
 b=N5cYh9IKF8gV+nt1ajR0RQF+oeYtA6bfq6hctPbrkFT3yIiYXXQk3y6hEV5RgK6b0gbB3RopuHAGqCjlGuAY4v3LFO5Ewf9xtZKA6iUfJ3O43y+FgbyQKjwzmYpXgIgmAlUnkvwtWmxQZYRd9vypvCmozp/ZW/Y0JERL192DLsdv2hM+eBgBs/2EhUBKtpuItifLuxWJLNu1OC2d/cdJ7cCA0gMyNVjJVKUjENn6cD40jmTp9s+k9hugTkSJbCh3Dg+wBsPpnw1LZeqbLAU6qgNN2fq0RUkV1BHxlSONdqdmOAdFvdnqiG9uuTRppzh34gXYDJsWD0oNMQD5NJcnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LML+aMwhIc2jzrlOgDxJ2cPLyo0VrJ15kPP36R3jqQw=;
 b=vEkE6zFIzqEVrygGKmWai/DdFvywbiVeHoV6lv7Wa01E0tsEBTSUhS7SjGRyhyZDOHbL72LRzvna7LGWbmB5LCa0ADOm2RFm7MUbKM1zIzJCWkCYFDIlDVuGd+p3kTgf19yyKVflCc2eQT5lcoJy9HjnmkPdg1HjZD/hg86udLY=
Received: from DM6PR01CA0012.prod.exchangelabs.com (2603:10b6:5:296::17) by
 IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 16:24:52 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::65) by DM6PR01CA0012.outlook.office365.com
 (2603:10b6:5:296::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 16:24:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 16:24:52 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 11:24:49 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>, Hersen Wu
 <Hersenxs.Wu@amd.com>
Subject: [PATCH 2/3] lib/amd: Return false if dp_fec or dp_dsc is not supported
Date: Wed, 27 Mar 2024 10:23:21 -0600
Message-ID: <20240327162322.1068745-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327162322.1068745-1-alex.hung@amd.com>
References: <20240327162322.1068745-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f32d8e-c1b8-43c8-7818-08dc4e7a6e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6zhIau+uQ8llOWTSBOjqx5AyYTZw91qmS3hYQbJqBPBOHfCGqr0HOaq7l7FojA77scrOzbLV3id5pXl0WkC4Ta5QuY4qjgxQjiAkDRRFk61nxwOKahiYCJ+EpZLKqf9MoxhZilmdm6P9bFLb8V4XAG/oemmN18uiB0Zpi8G7i+RcA1svCXKbvDP6m9/mR6tgaLSjPWMhkTOe0AaQuicSskMMUByKOQHQ4LBpJggacoNif1daEwPL6mCtMJZSgTQQVz16Y4hJw53rrOQBi7rLdlymQNs4XFR1TDLdNNNB6jStM9Lfo08UFltwyNWdu5Gc8AO2gsvnf+SZaK68Zff69QN9/3pFoVsY6Axs3EqoHiNNTk9y57+MA/0uiGL52+9UAJRrw6lGSBEwpAN97bV8ArWZhA3J836A7zcmR3PIlFeYbcxgZ1VPvET6Nm1BGMUSEWnt7V0+JR3GyXBc24OPqSrkGxB5kNbglJTPvs77qTXHgq5cW5aBazlC4G7FRjU9mRTxJHX+jMzDbRYGNadlHpDT4No8eP09SGDjVyXSU7Ws3dVKB4zHXmesREr1FOSlDSimezBojF13stpkriRCLM1uAGjbmeS8sIKFxh9r3UFVRlsHB1XabMzBKRsjo9gkSbjmLfdLe3L4a/Zwm64DctTRVqKV2Tte0gjY4+aBOwTFrjsaSWycZDdntH7W5s9lkhk4Rf8gdQkkiG7gZoKiU44iuGIICy/VEVFQ+aYqg7GZiS5BG75KQLGSQVAZegwI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 16:24:52.1394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f32d8e-c1b8-43c8-7818-08dc4e7a6e3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540
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

Stop assertion but return accordingly when dp_fec or dp_dsc is
not supported.

Reviewed-by: Hersen Wu <Hersenxs.Wu@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
V2: - Limit lines to 100

 lib/igt_amd.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 623883dbc..c0c4dfc67 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -353,10 +353,11 @@ bool is_dp_dsc_supported(int drm_fd, char *connector_name)
 	}
 
 	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, sizeof(buf));
-	close(fd);
+	if (ret < 0)
+		igt_info("Reading %s for connector %s failed.\n",
+			 DEBUGFS_DSC_FEC_SUPPORT, connector_name);
 
-	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
-		     DEBUGFS_DSC_FEC_SUPPORT, connector_name);
+	close(fd);
 
 	return strstr(buf, "DSC_Sink_Support: yes");
 }
@@ -380,10 +381,11 @@ bool is_dp_fec_supported(int drm_fd, char *connector_name)
 	}
 
 	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, sizeof(buf));
-	close(fd);
+	if (ret < 0)
+		igt_info("Reading %s for connector %s failed.\n",
+			 DEBUGFS_DSC_FEC_SUPPORT, connector_name);
 
-	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
-		     DEBUGFS_DSC_FEC_SUPPORT, connector_name);
+	close(fd);
 
 	return strstr(buf, "FEC_Sink_Support: yes");
 }
-- 
2.34.1

