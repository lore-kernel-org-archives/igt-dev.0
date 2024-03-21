Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63761C6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 22:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB6610FD08;
	Thu, 21 Mar 2024 22:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EoI3d6dQ";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E679210FD08
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 22:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gD6ezKcINZ6kMYphBeUFTvj1SHrfCmt04jt0mqG4WT94mv+uidnJ5Qf8Vh1WNSgIrL9uxxjXvqWseLcXC770LAx4rI1uqVYoy5CaXU2v7Qms/Xh110SlJTONXY9RxheJYc8W6IwwIspROT3D6FkNIYQXWoUcEsw/9M7quySNNkJx3cY82HmQ423bvxRs9MvEj7aYw188Bi+q5UxQ+kdv67Q0QefeEyCCmXIQA8tMAzj7Oi6r12+XKxIpgMansRBsbVXNoVx5UcRuzGCTX7mPmFcMqvhd03pdEW4tGnXlxsGi47Tm8+WQM8/HEEMaR+hZYue+dYLTOoSZ5wketQeYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7awnExWj3rmzanDNw7rcrIcNC+GBrQEQ3YKsviUvowY=;
 b=eoQ7LPAKAJmL1ShswopeQNG0xYUiapa8tFLWWFU1yL/fXXSYeo4KmYZQCwXdvn6au5anW19ujtlKjjkdEOKgtmd9mbPtydVZoAbU24Jau/f44OMLO+E3fTOegC9SgIKVG7UM9GL+hYcIpBt5KEWXq7wxfv17oxZbQEdKxr/VYUD9rFrsk1jYkOqHsPT2Vhqye6mTwyO/Mrr5bn12FKH7bTOTEnA+3kKo3H8CS8UyAUEdMkxwiwUgRq73bPRK7QN4Ofs5yWD0MDOII7jG3FvytzXUk3sd+8Jizgy7c5bC2SA85gtaZP3KuDLHXsPqxCfVxVfXNrDmwJQvY0lEkjAnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7awnExWj3rmzanDNw7rcrIcNC+GBrQEQ3YKsviUvowY=;
 b=EoI3d6dQZvqFkhcZxZ7ifcfV/pOnw3BJ6njTjsLp3DsHl+cItwliG1SVLWr9D4U/rvkGaH2fGm44urkJ2kEWxVIfLZ6Z8FsDsE22KDFxpCrz+TxOLD9mNNGbnh4IyHvjlbAy/FE3CQWr9uDcETaCDYECV81zaiAP0aO5e7cUP/U=
Received: from BN9PR03CA0413.namprd03.prod.outlook.com (2603:10b6:408:111::28)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Thu, 21 Mar
 2024 22:48:28 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::fb) by BN9PR03CA0413.outlook.office365.com
 (2603:10b6:408:111::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Thu, 21 Mar 2024 22:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 22:48:27 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 17:48:26 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 2/3] lib/amd: Return false if dp_fec or dp_dsc is not supported
Date: Thu, 21 Mar 2024 16:47:57 -0600
Message-ID: <20240321224758.1531610-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321224758.1531610-1-alex.hung@amd.com>
References: <20240321224758.1531610-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|LV2PR12MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 58eacbb5-2350-443a-c394-08dc49f90643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1p35wkZUKOZSuxYD+q91apCohS38+GjceOXOqwgqr46gFJPFGmDtv3edOmYhLgR75oSf00poK8vP26v72IZJZVpwVlulIsWhgijw6/7X7ThizdCQk2QDAp+Yj2vPNVoUeIEY19W3+bQ3R8QC+UBZlJAH4Y6YSp7GjzKJeuXbUztpQD8NA7SfRn+FTx0jskrmARvMUZqJZ42++4sOU+zE8tYmaLP5S6fi/HUXWoBgiwxIvf0Vvc9Deijhu4PwjvtoU9qYNE941UcJVSX8Vn32bQ8Y6TznBcgHgAkt/IrAiIn1lL7/jPL3LKXkQTtiej8VWvGmw1kf5AOUn73m125KX2guQPCtLmv91LzJ4v+rERSvrqjg82PfrRT/PRgx82Bem1dBl1xzQBTenk+9OtUsd+9bUMVMcMc46efo2PGq9hNJ2+UqAzr2zUzSk2ndEVeqhNJgj3yS8n1xbSD74moJQt5FP51hJRIeUINdJPLFpkCHUAgBSVNntSjSi0fnmpDgnq43MmyTTzvY0617ujkQXO14YULQQ13W3qvgkV5Tv23nlqtbu9VHNzAE4N5tAABYRo73gvF09edL9PuVYLfHvE4NkY14zlpsbT7vybbZKWvyj6G3uyfHplrkcHVkHh38ca3go8gYoa+hxcelbDNCfiKa+yqhxOmqhzz9f540TY2/0rh0WV6v8fwe68s2mtQsyX4M3orggS0X+C9GLguJDVUtgK/nn+Qjtl9efwzmxkakrl/GVLe4VS0QJZ/qFFlN
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 22:48:27.8993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58eacbb5-2350-443a-c394-08dc49f90643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_amd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 623883dbc..a321da335 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -353,10 +353,10 @@ bool is_dp_dsc_supported(int drm_fd, char *connector_name)
 	}
 
 	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, sizeof(buf));
-	close(fd);
+	if (ret < 0)
+		igt_info("Reading %s for connector %s failed.\n", DEBUGFS_DSC_FEC_SUPPORT, connector_name);
 
-	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
-		     DEBUGFS_DSC_FEC_SUPPORT, connector_name);
+	close(fd);
 
 	return strstr(buf, "DSC_Sink_Support: yes");
 }
@@ -380,10 +380,10 @@ bool is_dp_fec_supported(int drm_fd, char *connector_name)
 	}
 
 	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, sizeof(buf));
-	close(fd);
+	if (ret < 0)
+		igt_info("Reading %s for connector %s failed.\n", DEBUGFS_DSC_FEC_SUPPORT, connector_name);
 
-	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
-		     DEBUGFS_DSC_FEC_SUPPORT, connector_name);
+	close(fd);
 
 	return strstr(buf, "FEC_Sink_Support: yes");
 }
-- 
2.34.1

