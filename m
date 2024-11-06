Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36603D59F53
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 16:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E195410E1F7;
	Wed,  6 Nov 2024 16:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fH+XXj+4";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51310E1F7
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 16:51:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3GU2YTuf0/EGhWY1S3ZsXc63iXWxTdzdpN9HBhzFaophkODVMiiseZwjclwEe6GRcL9l6nZ8HE+d25r0nkAt5E4qT5X7AjTtq90KJ1aemTeTsMEvDWXOGTQ/yF468GjU4sKPEE9fjo3nmhxjxWuyZoYDgfICUQej0pV3khFD7W8f7uAJ7CV0HrhryMFz8mubS+o7XMA9d91DlwpDl6pbA5iD+0RRhL3ONTBxu9qBGe5I0OUGeqdIXLGGkhgIQunPggir2fLluuNXV1boOyxsXKUiq55YRPwlv0X/SIQE6L6bSI2ScBVxNYL/+YqqJhPaUuhA/G1bFBxT5D5NF0bOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6eszZrRg8CNRU6oYPIaFE3QungQ6frnepbv3qnQyZA=;
 b=JSuqoJ8bulQye88feeD8Jve7uejag0SZnN01AdC76Rses1w+gihiqKi6yregAktVRFSRyQOOYyUI2u69qMXdHdqRHTQCXA640b3R/WbDmQvRECcHltC8ZjVt+ThhQZZSnY9E3BbO4oQrqMLZLe29FipoAzK934YCqt+eIQXzlMq94TQUl3TWLDjptDQBWNlOY3L8Fo4NXMu8boFC4qUM1oCWEgWuiNcAnjSJSJBF9bBeOn8fAlq2NEAEBobkLMnuCdx48ZezWO3TGi7KUInWJQ8KFjxvv+UbTtFq4wKzOxJy+hpzLVOCDcs4sRYBPfTPUnhg2OXy5pIoNc3tHZorwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6eszZrRg8CNRU6oYPIaFE3QungQ6frnepbv3qnQyZA=;
 b=fH+XXj+4+4zTwT/kD2HooxxO8t3ZqKv15w1S6zFI4XzYTqAJzDo1Lt/QlHPQUNjZZjfZefA6lL/vbvQPY7qEp8hpVOrqcv5vSTSeene7PUPKfM7OVBxJtSwmhhPF3YJgoeMqiYthzugSwUobKkRbMbiVHVXKs5/gHtxEbyZgyOQ=
Received: from BY5PR20CA0023.namprd20.prod.outlook.com (2603:10b6:a03:1f4::36)
 by SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 16:51:14 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::58) by BY5PR20CA0023.outlook.office365.com
 (2603:10b6:a03:1f4::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Wed, 6 Nov 2024 16:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 16:51:13 +0000
Received: from MKMMARLEUNG02 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 10:51:12 -0600
From: <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, <alex.hung@amd.com>,
 George Zhang <george.zhang@amd.com>
Subject: [Patch v2] tests/amdgpu/amd_abm: Fixed tests to only run on one
 output per pipe
Date: Wed, 6 Nov 2024 11:50:58 -0500
Message-ID: <20241106165058.35171-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: e015b02c-fa4a-476c-29ab-08dcfe8339a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fzzY3LsNUxNm3gT40ZV/+uE6iEgA0C0hCrIST3ywJI2ia3uZohdTENdg4DlM?=
 =?us-ascii?Q?rBjx4mYH8igHuQP7z/EkXd3fdCtQx6fVClNSzVNhXR9dETRTYfm/OXa7Sye2?=
 =?us-ascii?Q?wn6hKf1MVXFLBDVy6aOeKTvVYLAqyN0+rm1F4qTS+JbdvcP7kqDnpU9FS4k2?=
 =?us-ascii?Q?LAYqM0A95L7y3mw0KYe7Ize7TN9qHNUM1n1Ne5ZoNadxIu1yFwCiLDhC4qRP?=
 =?us-ascii?Q?VX41xslKw00cnyW52Ic0D7QgWxE3efOooDvh+PWRqAVSWNqdux9Hu00WMABo?=
 =?us-ascii?Q?1K2w+REU5Dk5WV9RvYgsCoMW0v2wI+DXOS6yP1rhzU21bLcXw7gD3FmIancm?=
 =?us-ascii?Q?XoDkDoE1Eu4lTppIu4oZbAVYfHCO+1hKc9cP1hqFA+iegwK318D4cTPwUZBS?=
 =?us-ascii?Q?PfpNfdtDSin/N0S5GoPiiSgYkYA8KhGXYZD5CRELu0NRx32fpeSHnLdYirEN?=
 =?us-ascii?Q?Etc+f7/v3R+HR9e0wDespc/pGKGMYd8rIy8mwacHkUHJaoP6sSrHIZiAEa8R?=
 =?us-ascii?Q?MFX0WOIR7E9xeCah/9oD5trH2fI5ISHoFy+Dru2Bw2fhpT56dSa56QvuUS2I?=
 =?us-ascii?Q?1Fk+EIpnx5RQCF4nnSOXCsjfc00TkGU9tCW/mlDtxEYs41WB+e6VYV5oV8Ye?=
 =?us-ascii?Q?XsO0x9UA433ERGII5e4GHxxkdkZLo8CtQFjJbHIszMNfv2YZy1/gWF+Xovs/?=
 =?us-ascii?Q?2Nh7jRCcBhS6/cA+Sj52XJdtPzcjDXSkMY8hlt6S+2SEvpeNvP52mKfnvLrf?=
 =?us-ascii?Q?1pTCtc/vHa3BSZaHwJ0MTp0DZyE8DUzuJ1xt4PocM/lwpQqgJ6Jww2zEKoRj?=
 =?us-ascii?Q?GDwHISYwsTUcq7PA4fYAQqJ/+9LMite+8XqewP5YJt78+0/rTQablz/zcn5L?=
 =?us-ascii?Q?8kNoKoRg6IwntXKFkn2ATRUfVGxPXLFPw/woebSt4J6DZcbVZg50O7Zpe4T5?=
 =?us-ascii?Q?AAJFNb/XNhtfta4mww+GXGmXiazSXKQ8ylCXoFH8riAtztX0OoJQDoGdRF9N?=
 =?us-ascii?Q?AiUKdgaFFfoks8g5EvSsNYP4jXpd18E3gpEOnE6SDT2MEU50bd0olkOissNy?=
 =?us-ascii?Q?WrRNKqzVkPPsE8hOI22ip0UivxOO327YCsqAWPaq5ZkaOLRv+1n41+YVuG2X?=
 =?us-ascii?Q?kTUtSNQ/SgywjuSzyhA7yRXZBRKg2zzBbq7/eH7jf0xc5+AnkKL/rAd0Lkiv?=
 =?us-ascii?Q?QdwJMSVWy0TP3uN7BYyypI9/+/rd5fovZpln29om6Ozl/4jhthSGWlOiUlHn?=
 =?us-ascii?Q?0lxe8SrvvcaFikL4vddKxrEbj5ItbzAuM5p5+35LZOtB2/NjTcts2uA7zG+J?=
 =?us-ascii?Q?/YM7d9JQh7xf0YVP+eCidWh1cFWdGlZGdJ+BXNLM/JJTmpukcYyzAaRe3bE7?=
 =?us-ascii?Q?9AaiU65q9/qad3GNeReRUddRb5OOvOuxuW+KOmkXNlqys+TU4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:51:13.9189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e015b02c-fa4a-476c-29ab-08dcfe8339a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912
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

From: George Zhang <george.zhang@amd.com>

The abm tests only need to run on one output per pipe, instead of all
pipes. Additionally, fixed the monotonic_abm not changing the abm level.

v2: Made change for more tests

Signed-off-by: George Zhang <george.zhang@amd.com>
---
 tests/amdgpu/amd_abm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index a85f444c4..e196b6ebc 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -225,7 +225,7 @@ static void backlight_dpms_cycle(data_t *data)
 	igt_output_t *output;
 	enum pipe pipe;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
@@ -257,7 +257,7 @@ static void backlight_monotonic_basic(data_t *data)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		ret = backlight_read_max_brightness(&max_brightness);
@@ -291,7 +291,7 @@ static void backlight_monotonic_abm(data_t *data)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		ret = backlight_read_max_brightness(&max_brightness);
@@ -299,7 +299,7 @@ static void backlight_monotonic_abm(data_t *data)
 
 		brightness_step = max_brightness / 10;
 		for (i = 1; i < 5; i++) {
-			set_abm_level(data, output, 0);
+			set_abm_level(data, output, i);
 			backlight_write_brightness(max_brightness);
 			usleep(100000);
 			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -324,7 +324,7 @@ static void abm_enabled(data_t *data)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
@@ -357,7 +357,7 @@ static void abm_gradual(data_t *data)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-- 
2.34.1

