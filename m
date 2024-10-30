Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2025AD5CCB3
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 15:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C710310E3E3;
	Wed, 30 Oct 2024 15:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CdQ5U1Cj";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E33710E3E3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 15:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdbVtZo/MkJuZ714a/A7tnsFlPeI3k6lbS4QU4T2tzI3c6paYyWp9assnVmFPb2szxpyAgUg4sLMDqk+CcVgOc59YD9Fz9y5E7h/fnvKIEx3ORP9uhI5GN5LrdCtl5BEWrakmy6pEPaMk+K95VVsT8TONzSv5bUnEd2PbuLwWFc2FzFN/1vMzq6IbrxARTOjRnRX4j76B+/nV3vz79zeYFzwzebfJUTmRqjCJkwXnQNs2JardyQlB8TlhHCVNAX4O1AVX2tMUwBo8iTzmGHmstuZsP3Y+CTHWUgFLi5Y1h8Y4KM/kSSqraOsPsUMBTDtcqFdEa6PCOHEOOSRy79rIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kI5Sp1Cj348CqYC3qX/+0ZHQZYySsAJLHXXW9ZzaTw=;
 b=qpPM7PLA3mXmS3nPYBOAk+SEh3LRixc5eT5xzOa6fTR8OaR0IoqeGW3io3Iit6RJ9CedJwfSJqNIjoCoRYMmlLz2XmnIyaapz6RcD+KXZ0BVcSve46oQDbD8mJnZrPn89rM7vX6ovGvelOG+D2nqOPER1dymliHokmoNd1W9be9D32CroZyle2k3+bPc61kouHpQRImByrCJSgydnOEUXnsW7jGttvaOcIZ9uZuETxPVCZ4Xr4ILnKmYq6r9e08Qlx7iP6Pwm1PzrdzrQffg9EgQdEAxf1GQlimPz7zHvHvC7td2gem52BUw9TWLvDeUC8yEU/zie4QbqkqXvea4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kI5Sp1Cj348CqYC3qX/+0ZHQZYySsAJLHXXW9ZzaTw=;
 b=CdQ5U1Cjc47m4ethBh3bJyfngVpaPz76NnDKmuWbhE7PRktuZNR0qjyOGc0GVKNPHiLOuoGZgwuKJTUJIOom+Y90c4spS/ytuQKTQk5sL5HA01BTP915R6pTp+vdcSVgINiBpabiuI05lFilYH7+sOOHj4hDl/HFnPKIVaBlP5Y=
Received: from BLAPR03CA0167.namprd03.prod.outlook.com (2603:10b6:208:32f::23)
 by PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 15:18:03 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::46) by BLAPR03CA0167.outlook.office365.com
 (2603:10b6:208:32f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Wed, 30 Oct 2024 15:18:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 15:18:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:17:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:17:30 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 10:17:28 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,
 v2] tests/amdgpu/amd_replay: Add some page flips before test start
Date: Wed, 30 Oct 2024 23:15:41 +0800
Message-ID: <20241030151714.2424-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e0abb4-6bc5-487d-11b7-08dcf8f60c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xstvS25mnZXKj/gCMBAsXDHf7+TYxCs+R9e4JWGoreBlaUISQwPd1EBrRa11?=
 =?us-ascii?Q?j2/9Vx9bZqgJqmKXXcidPqtr/fJenN3WVCpYdvdsedFuhP5lRE5PuXWffS27?=
 =?us-ascii?Q?Q5tcwkfl2YB1FQio4asglkYDUESSU40LrBo7YlHULjoHPeZALKYWqzJH5nF8?=
 =?us-ascii?Q?gL7I5zW9/iLku1V717iTJWnfQ6YCMgiFYkel72cuI/2ntwvVDz26liV8SsYE?=
 =?us-ascii?Q?CqncF77rguJB5AUphDsR5+5Q9R8TkKNu2onb6aamDr0I1Aw7S3qF/MR+h3uj?=
 =?us-ascii?Q?MvjD4tBDWc83YFjiqjqrr58UgZc6t873oPIMziJZK5jD51kgz8l+ljooaXE/?=
 =?us-ascii?Q?3hrmcprsEfb5kBdGFRwbLeCx69Cfp5q9RvS5VkkNJW6jhx8TbuDG/OFCKRed?=
 =?us-ascii?Q?AFk1y4DMuHOFs0nPkhnq6w8AIt84v8CNuR6A7UKiS+aJNzFrprR7PDCvMluv?=
 =?us-ascii?Q?PkwvVjX6Xtw7dF6oEf/52iSW+z9DBFbQgWDB1g/lEvtCQnmXs2OlpQIGsAfo?=
 =?us-ascii?Q?7r3giBME252xY4BhOw3daDTaMM/Z3rby06qo6x+91FaQn2hJ9T/rLV1si3bb?=
 =?us-ascii?Q?ZVTNFIk25STIi5f52IUVu+e+2V/IqcCoTCvk0d3JKnpJuUPc49xIWc3vCnn4?=
 =?us-ascii?Q?d4vD3lWL6CxVaBCzKLnjIp6GS3Or7hZhw8VhqsmQtK5SFKWFNwNUBshtPzHH?=
 =?us-ascii?Q?JxvrGekp0FGSoKykUQLRaZDqLZOvZ9Wq4KLYCz9LtZLGaI0Eq6C/QgtPe6pO?=
 =?us-ascii?Q?AnZ/laSGbMlk5HpMb3nDchOlnH7skVTqs5IYvedvOjaAkBPjAQA/KY8XHCVp?=
 =?us-ascii?Q?O6l4OnEnZ5WsKRkB42PtSMBL0dButlQIMvjc0d01ECYm4n/PGiOa6v1Tw1Fs?=
 =?us-ascii?Q?f4P5o7XVG+27RuLsDtAT6t996MzPuEdEjX7OPY+OQgFIjfsDbg5xgL+Atq9f?=
 =?us-ascii?Q?8VT2iaJfGMxZkSjg+Vk+yIVVGLYXojAXmdvXeWEZc3nwgRFdMNQgX12qP6u+?=
 =?us-ascii?Q?TqYaf/5E7zpbpN3fUE4nbh3s9UR/s5JyTeynk/bBpB2keExzTTJAZW2K7rYD?=
 =?us-ascii?Q?iDhIE6HBpfSUp3NMix9yWpPeu4/0UaZQsFDkNMeJYmrvcN9Pcz7YqXnqZ/1u?=
 =?us-ascii?Q?zMBs0HUQeRAruve0mjLAAQgsyLIDYgvknMC7ZMX2zuGDEUXRri5B+Qi/AquT?=
 =?us-ascii?Q?yw37+Uo1sKzgR5ndhiEvrF7oHEWU7t7FCEuRL/cvAdWYyJOw39otGMXAaUFt?=
 =?us-ascii?Q?Sd1LO5pc8r5oydVAaXAy1/lX1Om2nRNynay0uGjT8/+9lrgE8NNgKgIh5NX/?=
 =?us-ascii?Q?XKXBLzTPuAIJ3VHFCXB3hkxDEFmPdfJTzaXXQ6zLltcXDG6geQanuCpjyGxf?=
 =?us-ascii?Q?YuIqJvm0bI91GrK+EXYLEHiCyMvpnzhv+lS7/H8/D+5arPqGWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 15:18:02.7690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e0abb4-6bc5-487d-11b7-08dcf8f60c18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
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

[Why]
New panel replay driver behavior skip some atomic commits before
enable the panel replay.

This is because a kms client needs to submit fb updates via kms
in order for amdgpu to flush updates to the panel.

If a client updates the fb without going through kms (by directly
blitting to it, for example), then any panel self-refresh feature
needs to be disabled. Therefore, the driver vets the client by
counting an adequate amount of atomic updates before enabling
self-refresh features.

[How]
Add some page flips before test to let the panel replay can be
enabled first.
(This change can be backward compatible with old driver)

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 v2: Add some more information in the commit messages 

 tests/amdgpu/amd_replay.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index b5bb10b34..db2ac2de9 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -14,6 +14,7 @@
 IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
 
 #define REPLAY_SETTLE_DELAY 10
+#define FLIP_FRAME_BEFORE_TEST 60
 
 /* Common test data. */
 struct test_data {
@@ -50,6 +51,7 @@ enum test_mode {
 	TEST_MODE_INTERMITTENT_LIVE,
 	TEST_MODE_CONSTANT_LIVE,
 	TEST_MODE_SUSPEND,
+	TEST_MODE_FLIP_ONLY,
 	TEST_MODE_COUNT
 };
 
@@ -282,6 +284,9 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		kmstest_wait_for_pageflip(data->fd);
 
+		/* Do some page flips and let the replay enable */
+		page_flip_test(data, output, TEST_MODE_FLIP_ONLY, FLIP_FRAME_BEFORE_TEST);
+
 		/* Panel Replay state takes some time to settle its value on static screen */
 		sleep(REPLAY_SETTLE_DELAY);
 
@@ -366,7 +371,7 @@ static void run_check_replay_suspend(struct test_data *data)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 		/* Do some page flip and let the replay go into live mode */
-		page_flip_test(data, output, TEST_MODE_SUSPEND, 10);
+		page_flip_test(data, output, TEST_MODE_SUSPEND, FLIP_FRAME_BEFORE_TEST);
 
 		/* Panel Replay state takes some time to settle its value on static screen */
 		sleep(REPLAY_SETTLE_DELAY);
-- 
2.43.0

