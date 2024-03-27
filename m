Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6C5C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 16:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3174210ED03;
	Wed, 27 Mar 2024 16:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sv33dFj8";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6E310ED03
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 16:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPWTsl+PHjoVVA+qrJKzTqzkBt9Zmfp1xtwvTq0zJTaDvbmfSsrFLYp7H7+TNkW57Q0Tfh5czUy85/fiSlnqucStd2DKU0ipKQipjZZJsRSp7pRkG/8YAKVstiD8Uhn2lgwjnk+nf/kI7ON68oJpzMVLDaZw4QQxcPbYkZb96oUWMPqDHpkqu9V14v6DR4rtux+plONxZRJ6Ijp9Ta8s9R78TxxLbhZ6EcGOB7qLZBK8/ZncSHr+QLBazjVeTiKRWWXkrAmVuweJ1OvvUcLxQGwpe4ZsYchfFU4Sgv6JrBXRpEHbxck3FCEnDHa+25opR7vn9b/1knviIaLrI8KrYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LML+aMwhIc2jzrlOgDxJ2cPLyo0VrJ15kPP36R3jqQw=;
 b=DS54GwQFq91vztWo4V0odKV2e47hs/QtLTGF9g+GZFUTZoWU18aoQUGh5N/5S4uRtQw+EoRYKUjMSr6y2Zyvgr8goBtrvlT1SnpGfRnKUSnLiLnM3KUHnZMf+LmmTKL7N4QkWunkgZEO0V+EKynZ9K9y3+MX687DWaJ+el4EBM9iHpgHMZ1dneBXZ0+njgi7Ogdahkk1sF/4IQbLZdA1YUIIZCLkicqcCCeCTIBEHpLkGOV4Tq+2gK9XD5Bm3X98DsjuL9kyaGkhVqeiW2VWB8wy4mn6hjCmKR94BMMVU+TnIMsO3+qczzkbkArk2kOBk/wEbTuV8bOuoXgME8GXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LML+aMwhIc2jzrlOgDxJ2cPLyo0VrJ15kPP36R3jqQw=;
 b=sv33dFj8tzbP9J7ONMy0TjhdE14jRsyHCT6jMWuMO7AwpXbQ0L09rxt/eOcv4dfzrMaO4h9OIYnWjMQYrDyWcFZhPTDcMLHv0VN2OXHJCqqZWWR3IxSuh2Op82E8aS64nEdj1pkDirw8CGa9CogxNnIA+ishyl5LtGkMKdhdm9g=
Received: from BYAPR06CA0064.namprd06.prod.outlook.com (2603:10b6:a03:14b::41)
 by DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 16:28:00 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:a03:14b::4) by BYAPR06CA0064.outlook.office365.com
 (2603:10b6:a03:14b::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 16:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 16:27:59 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 11:27:57 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>, Hersen Wu
 <Hersenxs.Wu@amd.com>
Subject: [PATCH 2/3][V2] lib/amd: Return false if dp_fec or dp_dsc is not
 supported
Date: Wed, 27 Mar 2024 10:27:36 -0600
Message-ID: <20240327162737.1082932-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327162737.1082932-1-alex.hung@amd.com>
References: <20240327162737.1082932-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 462250b6-a9e9-4c88-5002-08dc4e7adddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbgi9DP0obSudu5LRQXtuyr++ZLYtpBk0P9gGGJDBWDa/XifnWdx0YoZjcVV6ceANvfTqd138uJSMJRWAgaBhBFSvaK/YzyuABewjuqvuqPft1fFsJe59JouZCzmVkgrcsMpgHmUhAtndxPyyXxcLXT2yP083ujYjnixLCL+9y1GlrharxLDj4Druiqt3bmZHUtf5cInD8UE9xxpV462k2+ZV/ebYovPogBunDPpqY1i1FVydFC1KM5w7y5oFNnBVxqTU9TGOgUIBn6dCXSjtTgqF5RQgHosP4OOH7QI/GYAdUoXXeB6u6Oh3qJIWX1/L4jxutQWOWzABguYmk2fy/eIyr6+COCGF+Io1G6AEREzVxyUPPRzUO69CnO57sIGXnwTaSknGkQLqJZ7MfnMshY8ubmaFPDgpL39Up5zeNLDDpLynEBLrzp5COyEVZ0CaUvzteyYHDxGKlYPF4w16UtUswcMdgova7u7vvjfI77Ttnomw+fGpwf2Yct4ehKLYRflGJwkS104M93TEYeWsD7crSgV9KABjGq2LOFrmFc9RtU91Nti3wmFsmqc4RPDAFGEwLAkrC8F7qdfuOfE1OA1uFFlVX/6G2liaRdcg2My6qO2zoogqwupfKvGxes+2CVccTk/ek+S2197rFF+0bT1BMdGXRgBPHe4trKaCWUipvzVZnT2xi3co+DrXZI35pWDRdzXYs1lEoOr5nEZsdg2O/lvS8kk64eNRLTZR+LKzfXSDolEp6iDZ1qBCU8U
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 16:27:59.3788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462250b6-a9e9-4c88-5002-08dc4e7adddb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141
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

