Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C7C369D1
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 03:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892910E27D;
	Fri, 25 Apr 2025 03:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DS8yGj+M";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A686510E27D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 03:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlDfZ5WqsTLqJzm7a8mncRAL/mUxtsnMX4y+mDKTYuLT7KX+Fd8f/RX+g53idIoVuRa1AzHZ4i6wXtt6X+2N0dGxtlGa0PJcouP8O7WtAjj6MkpHXEsviYF+o9OVtyKbJJ3/O2cNhuiKgkYN6RqoxNtQ27NAX3KA3PHXmqmqRv0khCEG9gwjyEeoajICeUQiVbt3XPz5enRJRJrxTma6DxM3yPodz8tVacHh+HLBGA48UR9sf+UPCjLOIN9P9QIIPw+pUH6uUcdBrLNRwNYwgAZGkDrYiF7nWsK+8eFiPRiQDGk2AIpQw+HDVmMhRuYCXQspfu/RijozXveEbcXccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAt05ZqRAoZo+RyVY0uG4EJx5MKUoZj7Epeg2b7vgVw=;
 b=ub0R9gchVl5t5S8Y+DYzPdTzRyM/KekvDbVEQCTCJTrQuVwxmVFVQw+b/ZNq4f0hvce7xtBURQg+Lhky9CMFuhhXqHhm+ukT+mUi8DCDwO2MX1dBKuUoviSSJRhSF7hRGYQtBxa7ZGDgVuC5Z3a+ijyXg3pp7+iZ94OyZKVOCwKaJoVaqPEuTcX13Kqi3Wuc2/h474GkFwWFcw6PhOh6lI31Tdeei+eWx+MMjWVYsoDqGZOY4IUBGclDMpbr8JaRj4XxzAj/oJ1frt9KqXudKbo6K30vFivXX/zdwonXN9M0BAWvRJonI5QNIbaQt1CfbycRYeMp2cmtlDEXeNCulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAt05ZqRAoZo+RyVY0uG4EJx5MKUoZj7Epeg2b7vgVw=;
 b=DS8yGj+MSCPBpDsHwEv7AYAiuH+m/s+21VcSLtoUk61sTAg9P+UbSyqP4JMkN+GoD3017eLLw5P3VNhh+p/lzw//Pfe1SGG5f6dsfsDtAPblVVRxbE8bD6j4fCrXBqKHNZ2XAtZEVrbm/1QklUCjKaqdvCIeX8iFi4eLNh8+/GM=
Received: from BYAPR07CA0104.namprd07.prod.outlook.com (2603:10b6:a03:12b::45)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 03:31:31 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::30) by BYAPR07CA0104.outlook.office365.com
 (2603:10b6:a03:12b::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Fri,
 25 Apr 2025 03:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 03:31:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 22:31:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 22:31:26 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 24 Apr 2025 22:31:25 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/3] include/drm-uapi: add AQL compute queue flag to DRM
 header
Date: Fri, 25 Apr 2025 11:31:12 +0800
Message-ID: <20250425033124.1185655-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdd1578-a5af-4818-8c0e-08dd83a9aaf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J6cfVa+mn3LbpwQTohdXQP3NAMljWD4VLDYhlgk4BW2DkiFZyLTDuLBGU/yz?=
 =?us-ascii?Q?vHNV7FHTAXbUaN46oZPBWBJBmqKS2rJhdJDlgiVwDHGb+o/AdeifQIffjgCF?=
 =?us-ascii?Q?XSVo2O+typ55DV1nd6T1TG8LQACbWgSvpYLepTxI6ffYm61bnoqTd4MFIlUN?=
 =?us-ascii?Q?Fwqn3shQl/3AAIYsciStXcSrlU1wqA3owb+86TcAf78MJVEediSS8rC4nvi3?=
 =?us-ascii?Q?1QBRPUlMX7Pti6HdXcvzWSxuMNXahooocMYBIzTGZTe62HH9ddF4NEmvKNQ5?=
 =?us-ascii?Q?zYnhM9l+C/Z0+/wpl7iRLZvyc8r5RWYf5AUplDKrbRnp+adY0JqNnA+3HYpd?=
 =?us-ascii?Q?3BO0CY+yBKFVZUfY/zaECc8a/G2ZpwA0NjOKd49Xq6juKMGMk/LvetN7dzmU?=
 =?us-ascii?Q?GFcFlZywZEKtTHdDxTqz3/AsrtKV3HJV2DaCEEtNQrbD8n6LfHH9JzBKkc3L?=
 =?us-ascii?Q?zW/WawEdK7Th28iS5ubWg8SgFcKRnpIzoMR/H7oQlyDZk4j5JUh1xLfjF5ke?=
 =?us-ascii?Q?HdS8RdQtwUCGBs3SA4p4RO9s55As6uiH5z5344NO5HBqf+OrpeMfW5D9KV56?=
 =?us-ascii?Q?sa1RcHu8TOf4JmitkxtaePWDYnlHT7kuovopVr5F2yLUcvdS0BFqi4TNR8nD?=
 =?us-ascii?Q?coy8fJ+1z1kBWxQzrRNWtDmbvshoDaW2WxxlRpGAG2hBWmH471aL7NHOl+Oj?=
 =?us-ascii?Q?MXDnSklsSCc7W+aeJyxr0Ab/rL74LG9zaIKgIQFMqAYKKFYwuw1omwRAC0rb?=
 =?us-ascii?Q?zw0/AdEutRKc6AE4sSYZQpRO5lnF0Hfopfmn0hp3xBCc8ILMmKANzj3z4gzy?=
 =?us-ascii?Q?7F3esUvKe/mhyBIhnPp9GuXLzYWxq8JP7DbLhoLQvj2XRwrdpzD/wxrhVYbV?=
 =?us-ascii?Q?uB9pEpBICxJOBy/TQkWxLEV9rdnBBeR3E8xGdEeDsKgduQezeEJDdb15+bRX?=
 =?us-ascii?Q?Kk84Ow5PKg3EUeUXRyD2M0sFPXqXYBnjnkCEa+o73TxdvCmzF8eQJ8IVqYbx?=
 =?us-ascii?Q?NXrslF93HsVoMKtNxLcUhZQ2MNg7NP896oeo4zMMR72nTnkrxUBarhceK763?=
 =?us-ascii?Q?HHGYCMhPjBgeSKTEYm6sfN/ZlxRGavNCDINYdQ2zee4SgWxfMAA33AF9qLsk?=
 =?us-ascii?Q?eZ9zdBplPOfheyQBOPB0pjoJ5plIMS/MM8pga0gZ6zknwllY2ZSwptAEEx4e?=
 =?us-ascii?Q?no2f/dWxAJPe5M5ipoTvXmIYY7TWnUAc2Zf2mN0WXz4s/nfOGVBdeaKkfAAk?=
 =?us-ascii?Q?ei60bijcMOcAa1XXjVOaMmYKzg7R7siGgDcnw2iCLTXRSqv9JxIdK9IFuO/z?=
 =?us-ascii?Q?UN2KHhuOwj5GFkdbexS3rkryiyv8WVp3d3F6NucCtQGLQ82wiBk+NjJbGte+?=
 =?us-ascii?Q?TICoC5ZCUA8kjLvFs+lo3cnsPNLDBb9jcewTqjRX/SBy5KqEl2r/PBX/E7rU?=
 =?us-ascii?Q?pOWIGebffcKNIXT5ThK44efLb1Iebr7t+3V2TW8C3nqdg4oLAtOKqFLCzt5f?=
 =?us-ascii?Q?9dLwAHUoTavfL8D7aIltEzFR2j9KiC4oWvc8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 03:31:29.6587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdd1578-a5af-4818-8c0e-08dd83a9aaf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039
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

Add a new flag `AMDGPU_USERQ_CREATE_FLAGS_QUEUE_AQL_COMPUTE` to indicate
that a compute queue should use the AQL (AMD Queue Language) packet format
instead of the traditional PM4 format. This is required for upcoming
HSA-compatible compute queue support.

Signed-off-by: Jesse.Zhang <Jesse.Zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 3f4813879..75ccbc7fe 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -338,6 +338,8 @@ union drm_amdgpu_ctx {
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH 3 /* admin only */
 /* for queues that need access to protected content */
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE  (1 << 2)
+/* for compute queues that need AQL rather than PM4 packet format */
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_AQL_COMPUTE  (1 << 3)
 
 /*
  * This structure is a container to pass input configuration
-- 
2.49.0

