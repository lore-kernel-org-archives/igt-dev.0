Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FF7C54E56
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8C010F299;
	Mon, 26 Feb 2024 21:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O37Gp/Hx";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BBE10F295
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwlo7RJbMLWCXxlD02Ljp6+x8q0Z1K9AuRG7vsIwfGycskOV2XUT9RU4BlIilk9o2kFw9e8uEJS/rq8uPVjP87iNMG3Nxg0wpFYZB6cJ7bxAZSnQ2ejhypmWFvXRjdJRxFKG2UPDt9zME/zqbzNjhXYVmviMzJvkVV4u05ludMZC7Ti0Mq9RkbYZ0K+Db0UhyWy9kyDAZskEpuGeBMVeTa+bJ2LBDK195i7+u8H5DoP1rUH+9ZIxV1AfYo9d5t20hdJAtHMAnUG+LAAO7YLSdoSCy+4Zottt7mJxEwGEKArW/qA9lViOg23nwuVoLFwE5TcIedXj1UJ4efmyElS+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA8J1uW+qLa9Owwtk56W/kKa0E64YZHeJQ1l6hpzLOI=;
 b=KFkqRLE5GI43XstWlh94RAxU5N6FhYPVm1QD1J+PTio9AUiXAJhDX0qtFC5bDcKv5cf8v1wYPG74HIeevz11Xw4mVBJBOcXj8o2f5SlkHe/9GGGEvqGZ5w9MnEnCMOk0zOpm9kzpHhc2Er1En+FPcNrn+xANnaF80SwK5iOmw6PXsoCl8fEMODs4mo8TlW9dnALtKogifQfQZTO2XuzTznDsh9fm0QN4lu9oob6NMHt4sqkodoJkU3fJlNMk5BezMlKNmPWAa0/9pnLEY5JJjPrk0tI+99Hye4Zl+B0uL9hQoYRUzwruHqkpjvBTNioCODMn0TJL6/L4rxtHoQwPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA8J1uW+qLa9Owwtk56W/kKa0E64YZHeJQ1l6hpzLOI=;
 b=O37Gp/HxeRpvxTcollcmcgQ9MnD26ELBB38c+WfoXI3307PbzS4sWUrWHVVJQoM0ZG0Ap5V7WFyHZYrS23Nwi9B53HFXo9bSjuuQR/aLQ1PQ1d2t74/MWaj8S6z84OIL54rojP/dOM6sSmIP34S4auyisdDct5R+6OCuMKAH6jc=
Received: from SJ0PR03CA0244.namprd03.prod.outlook.com (2603:10b6:a03:3a0::9)
 by SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Mon, 26 Feb
 2024 21:14:39 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::46) by SJ0PR03CA0244.outlook.office365.com
 (2603:10b6:a03:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:38 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:37 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 18/32] tests/kms_colorop: Add 10bpc test and skip if
 format not supported
Date: Mon, 26 Feb 2024 16:14:02 -0500
Message-ID: <20240226211416.100660-19-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ2PR12MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2947db-54fc-4d53-e969-08dc370ff176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: egVK+u/i6sA+ZMycY6WbUX0b6GSDTpxVbW9qBmEwd8of4saKYtLoEO5RuqyY/dF0yXYaKNzwQwLluWfpBQfHZO/R1CIf/DlspFHU2eXnofWMEDZWa4kGLZXkmalUjiDZEq9YpLgqfcelxYk6eEQ8HN0ByKlfdczZipuyeeSwUewBl2xUKQ9Wh6oC6BdRKuVg6V46cNERFg++tGLMxmSvjx+zFrLE0JFfaYzdPfPdHSHRGdG9HtBp0ZsGhKpFql3bB/MSEO6/CIOYdwhqVeUoTbILCOoBovq2o4I2OuG/8rTX0i5NwXcnt+AOhrlFDhIXQADZHt2t55HVaRsee/t4L1+CJaKv6YDB8urosNV/KR8gjHjLQR4H92rRqVvFQOuzVoS9MY5eC9kJB9U7N/ZAdyG/WcTH7Jdo7Ywr8xPeBFhIXzEz4cYcUWE3sD/8YgDeQUZ6Kcpi7yvOL5m2ksmppAlE4HHjIKVhVI35NcL9U9T3Qu601rbapGnbj6iCJ4rR+o7qR0UsHpYlGKtb7XEpXPC6DVXERZhzVSEbI7AlBbO9qzLj2dZA/PILO6NbNhIQBAQwWd1Xaz07gL0pXNudgZVSrMQ4K2lN3NlEWFMUfH8G3Y8+kUCoyj2xIaA5MmFmhwFM5LGa8y7aYNG8Bok+1Ax0sUEH+cryqFBa0DdImhrx9A0g5Xj4f4cFY31p6g8TXvUgQwvifAhRhQ1Vl0GB6jFyumzM1WS8PjjdraZxHAfwbmi4W2cwtQlKN9BK6wuK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:39.4125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2947db-54fc-4d53-e969-08dc370ff176
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 0013d311d878..68512f65413e 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -41,6 +41,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB8888 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -74,6 +75,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
@@ -82,7 +87,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(plane, &input_fb);
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -519,6 +523,7 @@ igt_main
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.44.0

