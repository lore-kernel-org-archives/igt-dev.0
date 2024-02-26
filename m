Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBABC5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DF210F295;
	Mon, 26 Feb 2024 21:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oIJxgu5+";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316DB10F295
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKUNbikZxwo38BMiQ20+tYgzwc4e3gLORfSb5oNeh4rwd6NCcKIjVGC7Wf6WJUnjzB1dkOQdy0KwdIHFqPjofNTkacf52of3l+r2TxQYHgLO18jfHeO3Mn9o8kM1DMl77XFgAnu/KLrEUhMzSRqOo2UdPmWQAkYw20pSodDSUb/5SdScvVhMXvGhgLVDVujjkpkB+RXwhtODiMwZfEDq25jPRq5/nz1bKftA44HC+mFcPRafXmF5rvl0zkjkP95ROJkD1HSv2E61DO7LDtaoJdzGsB8EIMo8Pmc/yvFCxsoyDA8fRNlVMPprZNqZF9lO3uLBbz6r1jzjKmSChJ3FdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e70EyTWrR3yr1GKdstiX0z9OGSaBqKh5LaiFSMkS47g=;
 b=YYV5hge9zzno+eY3wmlE/oJBApLkxu9mF+tRGWNw6W5rdZDTJGy90Lngo4Xl6NjxCD1oYVXW1Plp8tffdmLx7/DQpgnAZ/qjzHTip2zPOuQ/Xtsdl8BVh21tSYtTtCMmjhvjh/LKTPMvjV5jLvYOzsl8BxXCD9F7KpgXy1YGvULz+U7GvONT/wS0/f5kc0pFeZ9w9NqvPq5VkdjpdG6eDBTw5AFdFkzKfiLKVSENA/PU0pSDi43RqKClfvRjrVz6CJY2ZYy8u7h6dRj/mC7k6F4v6IGfWnrY15q9v4KbDnf+eCZqz3eFtMYw4g+tTUJlQs+Or6SDI+6YCwS0YtTBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e70EyTWrR3yr1GKdstiX0z9OGSaBqKh5LaiFSMkS47g=;
 b=oIJxgu5+zAResZti/SshiDTQcxiyQ/BiU3Exbg7ZglZRKV5d389yE2shODM3Jjr+K5spvmEeCOdlKJWq/ymawP+u5izn80aHRyEilLHInQKMyXM/32MFpeDYR3HrqwFSUhX32LskpHgTybAOZZqYqhV9nyL9EoHDvJFAcSJK2ks=
Received: from MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:14:40 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::c8) by MN2PR15CA0016.outlook.office365.com
 (2603:10b6:208:1b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:38 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:38 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 19/32] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Mon, 26 Feb 2024 16:14:03 -0500
Message-ID: <20240226211416.100660-20-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: e76280ee-2e2f-4bba-002a-08dc370ff1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJ8YoSGebmCir+cB4OhVcK1khLH5gzhCBTTwllG+IavokQZbx/WgQE8c0ULdv0zscobLP5xiPxsIwQciwaowJ5fTW8RWXIPy0ZtOxYdXdHEoIMTqoTzpM88+oORUVloTG1mZ1VKF9/lcowJIBr0tEuFTwe5AA+OgpvV64s6Y1Lh+CZxZuTUSlC0BqDXUDJ/V6S4neD6M4alPCap0iwsZSFkcUJOStSdnz31eow6Mf5IBSZhcoguOqzdd8lplOBqIa29fWp/7ua9mIFN0BCyhA+0iZbuW1AMwow0lKa8Ks8O6AdfLKSQhLYd8sSmm5NHZtE3IN9tCu/au/eExY/G/W6ScStY4EOW6lrsOOLo6HZh35Jlac2Jmnnn5KciOm96a7Ibqkd0MZ1/enMSmvilfL/lekNO+f84njd8hV0oGWt2z5KybfoszNtrBnyprtdYS+5qUbOzFkIKv1QEW9i3P1gcnYX0gjushfafKdortxMc5KV+GERT49srtbLI0WjWXMHOT+T12c6Io90JuPsYundLF0YrFnScZ5YBqALSkkwFwHEEMCvKYfOKiU3D7TabzBX9RCOFPQCIEkokmAFY1mLWkOf3s828hpXBv1lBkMR6CY8X1JTTvEnQGanil2Pl4HgThrA/YjBNtj/TcnR1TbWHTj5Z6ceHqCbsa0ZciWruQUYfOc1CuL2fxXaTM0SMF9PaFWybyVT0TTVe1S1xePBV4KaT1rvKbApAva5qaPl14HV6qEuMR5IVfzHejozfH
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:40.2046 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e76280ee-2e2f-4bba-002a-08dc370ff1eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060
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
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 68512f65413e..5b0b32819baf 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -69,6 +69,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -83,6 +87,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
+	/* check writeback formats */
+	wb_formats_blob = get_writeback_formats_blob(output);
+	format = wb_formats_blob->data;
+
+	for (i = 0; i < wb_formats_blob->length / 4; i++)
+		if (fourcc_out == format[i])
+			found_format = true;
+
+	igt_skip_on_f(!found_format,
+		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
-- 
2.44.0

