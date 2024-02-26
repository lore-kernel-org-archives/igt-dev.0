Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AFAC54E55
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DFB10ED25;
	Mon, 26 Feb 2024 21:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Le8WePy";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0391A10E7F7
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNf67RdeFekzEkrdpPJSg7kln0q0H4wFyGti8oNqNj8XRaarxvH2pzhiXkH5dnmpNXtxJ/SNbLZJrUqetAXopA9YOXxYArB7KCOq4zUXukNdbFl3tWQvUwQ5HOuFcfuUEiWYKdkCZ+PkKPZn3XjRvps9E3Kf6UGJETBRPS5McjQNzySlFdvf6dH3HqFy7YZWFUu8EkQcFAYJAOIKiXqbeBlUAtoQH2AASsUwwXO6KmnqTn+8vSciKPQzcHdWapay4QPbx0YCgNbfLH4hCmBnv9au7LXO7J5uP7tw+1uWnh8Zeer61CZ+UqHEw/RBYx/WmAvMPJQmDyuIBGLjorKSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmgs/jrK9KQG67LOQK1fKGUecgekxZ8ZxEasdz8kCxc=;
 b=OlBI3/V4pl+fCgAnUqx79S0/iwIlpKnIpSX32zepvrLkGBIwGv+kha+XqOGafQLXHeUuoGMOnaWpEIREOcqTubjw9lXQ0RZ89x0cjq6aOd+vLTrJhAZqUcZU9iBoBoKTT8XhLg7yQCKPpwKKSbC3jgFigSD+rp5kFpc8O2nTNNs2258Ipcb0HqhGTjiIUEzUoqobhmr4qs4XyyyNGyhn1J87YtB7x8f0zmh7lEU5s1cB259UWp6t83d1QemriqJvrTRowVqFVRNQeGp8iztPRyMHNEp0wr0TZ0O/JfYwnTAidYmXqB+4XWhPatp/D2EowuncbFkL+YT+KcketIsWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmgs/jrK9KQG67LOQK1fKGUecgekxZ8ZxEasdz8kCxc=;
 b=4Le8WePy96D9mjqlNdXtSqu7/IX3iy18lJQ9KRjB2XueVukDjSwZQ3lOO3gBNwH0PeCGgLWYmZHP65SVvKpJ0162bQBVjKQ8Ll5UlFZohp8+DjIUty9Atjl75LDwBDXxoht3qy5Vk/JWKZT839Pyr+IIfAWyKuCcanyMG4nvtVY=
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:32 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::85) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:31 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:30 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 04/32] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Mon, 26 Feb 2024 16:13:48 -0500
Message-ID: <20240226211416.100660-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: b522c6eb-1363-44e3-00b3-08dc370fed03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llyQk95QErE+Yt4sn58phuuFJtlhcLE54i0urWaSNnYr3uwfMbOWEioqTIfcWvqeTphvj2ftnScPaOcezYAAXy52Rv+J48Ympv5pQ3CpGQywOKJI2uKMU1AKmfc8tFkya0wC3GSCVZgPWl5/lmyKbeOPsB5A9HM12vZjQXFw3j0N9AcmNG7zk68lW5q691Ifhp/UwnbspcNNzgTkiQ/KogIfoNbgJQ8XA76n3laC+FNw9cGLCPiEVqpUe77DGPDyQqwAg01nUJHSRXZwavRtgY3SyVfmb+pfU5hdvR5Gua+1axOKbSVcuTqUVAB9tHO5qxXYCLkdHzqDVXu1q/P2OZGYJhKHOhtamfDdSl9tpOBx1tnMK7EbikIp/jS7IxluhfD7vuPTqQYe2vLO0QsCYuDMJDZuwTOf8QdWZohPTJdOUUDtrGocTwUgkFkTkOurTHXDITZRu2o6fHbd05LhD1G1cLfcjYMuXICUEw7bKSFRzAOsouobFSB/UikYEitoqalM1mhpPLr4HUm/NT6l+iB2E+PY2W0t3wF4NO8u25cfVaVSUywkQVICR01zZxDlAfVBpa3WihaI+WOQiS0TkBwwGS0J+ApTVRiosFT5YntJntwU+STEXQmib54EovzP2D0sJ9PZUZQ9fD7Jwg/LtBoSSdsZQZGD8R8yNmtH8/Sz9SB9k4tucuHg85ISvlvgzff6dbdm+71d6EZLlDDxZfLV4oAwwgZvSMOn+3a2rs7gK5FIfE4279CAtQJF9nom
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:31.9420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b522c6eb-1363-44e3-00b3-08dc370fed03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667
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

We don't want to set this by default since existing tests
might require COLOR_RANGE and COLOR_ENCODING plane properties.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 +++++++++++++++
 lib/igt_kms.c          |  4 ++++
 lib/igt_kms.h          |  1 +
 3 files changed, 20 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248deb1..002337cc9709 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -836,6 +836,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0cccf56aefd3..3a78f603f592 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2801,6 +2801,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6591f6e227b9..86b5f8b9373d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -482,6 +482,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
-- 
2.44.0

