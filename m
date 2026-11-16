Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170E606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iul0Jpsf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9A810E9A8;
	Mon, 16 Nov 2026 08:14:34 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553E710E9C7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 08:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4o/yYbVyCBZW+91siVZnQWTH5QR97Ly8t3ftQMrmNvZLPT5+XOvvcOXYFXesHfa6t9/HR2lGJRZyQiZiIf/ZqWw4QtqLVVL3LlwjwOJHEuNGcrZ+C0zcl/47Y7PMWULblOn+kYy2LFfPvqp1z0Nb1EpTZCmaOOY/+pbElIRa12ZSF1tb7pXGti20Uf4B9V3loN8Gf4YzrH5YXvs7KVTi4GyMnUY+RWfT2hl8kLhDFRljIXBlcyVZGwBE/QzXCVCdfdQ/ruSm+/2UyZcqI3hxMMVk+a9pepdKGXu0jH4x/ukd4tzRDdtFnhJzfCWbVnaQ9QZq6Jnm6B7ltP1/i671A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=bqr9UL4cpyQgujO9K1H688/BV/2EVEEO8XqinpG13r0rEhmmFHT/0ucoXgIJowEBZjvp+bcbcpccdR4iTy5QAv/QGmDIJJETsuGEMKdzhKCLHj5X1va19FfiPwoiL2No1G1tAqlymfDGxJAGT6kEmB4PE+6/4wIy5DFUsZr/rHJDeWWQ6te+VpdwF8LcrhJyOWPjBWeO2rLA7nimFX82P59d7tHF8xckeQPvk2u7cIuEgqtM2u8JcmyKQ9LUjoou4uKQBsjB07/vzWTd7mdEozxYJjKN3NrfY+nLdfR8OJqP+KQLMmrp5UnGdnSLlUc5cQmFS0RcTdvodhcOMy/8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=iul0Jpsf7iJftunu9E0MvSN/tIFg5EAzVb0bHID5IEtf4NxXPmRhXLykhhQpP+WzDLGFQ+bp4PQFW4v1NPNe3pQVZvtOu0379F7RLqwAoIQdwVNQEWRBXGPwJQ0OeaPGnDSAAfB3MK18K3INU7Nim5brfof7gprEs0WVWDrfYO4=
Received: from MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::12)
 by CY8PR12MB7634.namprd12.prod.outlook.com (2603:10b6:930:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:12:35 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::6a) by MW4P221CA0007.outlook.office365.com
 (2603:10b6:303:8b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 08:12:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 08:12:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:12:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:12:34 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 02:12:32 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 4/5] tests/amdgpu/amd_replay: Require REPLAY_STATE_3
 after settle
Date: Mon, 16 Nov 2026 16:12:31 +0800
Message-ID: <20261116070248.4103604-5-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
References: <20261116070248.4103604-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|CY8PR12MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: d1be4328-adda-4628-9062-08df43b95ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|261009223027099003|3023799007|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: OtW1Ze40tqKOEq/XwX0o8czQCw7s27Bi1nzDT3xJb9oBf0348g6ZjS5Slzt0ihb/B/at/Y5+/jJA79/S7LCkSTCdK6k5zAp2eJJqN4q6sq0TrcZxsTYkBI2ghV13BquC0OoNWbUAKRYOY34j3WgSRkV28KYtoJZy06Hjz/IgMSK5S7NxSjBrtCXrhHtQLCyo4Y0cf8PV54HXsaTv1kJRwYrtLebo+vfTpOOfFHDSHo6zdGk6zEoNR6x6T5GXw+61OXgNb9BmFwJbN/oAf6tEryCFqo1ra757XkYb3nabteXeen4bCTa9VvoyQKq09tmwe0D+e6PQZ/4DGpWLLPaKtTMckOPZZnniDQ5hHuhz47cgEUFhZktNq4v+4fuaP+vU69FCeYyOly4t8CCdmpRjOOTnKxpheGS9QGcUGYp9WY0BDTDi8V2/jJL5ExPKZjEZ2ptPhaTg7x3QKsrz55un62l1vCcec4zKYQ9ku+eHdYKp7nFrQlsBCeUD5e/6MpY/HW8KANeqEGIbZZTB51oQ6PzvF8HmvEsDC9zvhBmeU9YxsPPz5Y5X1o1qn1bUn4PnHnvriZ8I+NtwZ0s8KaaSvLLE9ioG665GIctkO89KFz0489KUJgTYCrckiXIp98Gu40e0GNSahW2zXtIwb9s2n4x98lxrFFckf/Axwg/quygCj+P7x+z0ei8Ju9b03IR2Rf6H6M3V839h2KC6FMPnaw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TtuYbnnvtbu2tsOnZKS2GqSs5hiO6hRyJ7AXbH5aMy6NMp1Mfo26HXuz5ALnrZuanjN9xHULbO+GHWEbFkw1GYaZkgYxquNIaYqAhEgVXe0ZmYS7+pOo4WiXB9itcSewNVpB1zfQIW/VIEawvHfzJCdO7wOFpx1A3VkYYeEH9aZSC72+3Yl1UHb01pwdjuL8pkGjHbMYkH/1hoxWEUHN7LyytbYS+U9RpPVT7mA0zv95NcbKKewVjv5gwjz9sUlO7mRg5v38/ofSbQuiXk/xSAoU84eFhaCMcIo21TGK85XMZr7FZJmdH4pll880cLtgzYITsuKuFC8ugKdG39IsCHJSqU6F+gTpjyE92tSKJGocLu8B2Ki+oPrhL8bBfIoqKSLbR3U1MIsHhOdRHqGHfW4y3ee5jyFm/G+48yk8nkOMuUozJCuRVYDxFnQdcWoO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:12:34.9466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1be4328-adda-4628-9062-08df43b95ef1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7634
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

REPLAY_STATE_2 only means Replay entry has started.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 7082df706..e73d2abf3 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -280,7 +280,7 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 		replay_state = igt_amd_read_replay_state(data->fd, output->name);
 		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
 		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
-		igt_fail_on_f(replay_state < REPLAY_STATE_2,
+		igt_fail_on_f(replay_state < REPLAY_STATE_3,
 			 "Panel Replay was not enabled for connector %s\n", output->name);
 
 		/* Do some page flip and let the replay go into live mode */
-- 
2.43.0

