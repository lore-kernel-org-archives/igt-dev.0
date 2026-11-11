Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA059606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NJqYaAI+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6697110E27B;
	Wed, 11 Nov 2026 05:51:49 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA15E10E0F2
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9erEb2s5O/hukQ1znaJG746wSAi4JPgIqW3piVvJeby0xODcr3wGE5NS1h/rVXywyfY66nMZbQ+iCBDmbPdEzLp6l7Bwh/t1Y0h1lAftz0tup5NujHOzHOvDUW/8Ro/IdGFsqkS9ZNF7nyBmPfMGpkiWgh1I7ac2dOHvN7gTOtde7lIt7Tgank6FAb4ikFfdZWFEdCPrxDTPOnWqjDWxQKI7PxVNO3N7Z1w3Q1K/fKPLdixrz1lSqG/nrME3lqxXfGWs5Yfmol/njHPouYJNRURadc4qLIU8xSqILq3QjC5LRYSZe+aC1/Ky1L4IaBHRWhpgpcsJG3oIArhW1HmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZBFUS7rPGk3JdFgI8+6XHw/RaHcBop+jX3vwS2fpco=;
 b=JszY/yA6VB4gc35QEqtvZ4cJqXMkcPvDA7Vhd9QwXkMuegH2KWfGlBuQ59u0I9tG/ce6RUQGSoikdEIpVmTia5pcImRgSnkStJjp4xxV/E8CYJk/eZTmCIQ0ElRRCSGdoqJn3lkn+avbI0vO96YdqbDd/shikBDQC+p/6T2hU1l7duLlP4XJPeSF96qdesAyDEyn43ChlgVCnapKrFLK0TWL6CWGPOOi0N6Xd+LUC3B6af7BdW+K1WghqEWxTlCVb50xk1HqWWq1ltQTtVPAEHPd6Shm23Hfkurgp3Vuf2AhlBRAgdwitT/gELeejddRT/KQsPQFdTYsVRlmhx37Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZBFUS7rPGk3JdFgI8+6XHw/RaHcBop+jX3vwS2fpco=;
 b=NJqYaAI+eBaEwbVus9WpvUcGLVoF6E1YlrEONdKJc4r89MwU52RIC632OhvN1m/c821e/LTOvVDjyW3MRgN21jYDsh0K3RiS0M2/GL95zWj42kvVXvLBbTEtrQGLBucQjXXKzPXCTWdeFpbyfyuNk+uGgo3UUtBoP9ltjXn25oo=
Received: from MW4PR03CA0092.namprd03.prod.outlook.com (2603:10b6:303:b7::7)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:49:40 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::7) by MW4PR03CA0092.outlook.office365.com
 (2603:10b6:303:b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 05:49:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 05:49:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:49:39 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:49:39 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 23:49:37 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu: add a shader dispatch test for user
 queues
Date: Wed, 11 Nov 2026 13:49:09 +0800
Message-ID: <20261111054935.3862301-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261111054935.3862301-1-Jesse.Zhang@amd.com>
References: <20261111054935.3862301-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SA3PR12MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 602a765a-8b7b-4758-6f43-08df3fb793eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|22082099003|11063799006|56012099006|261102123227099003|261009223027099003|261026135527099003|261026121527099003|261026130827099003|261021121427099003|261021135927099003|261022113327099003|261021123027099003|261021130227099003|261022075727099003|261022105027099003|261021133027099003|10067099003|261028144727099003|261022115727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: L07YAR8A1McbfmFqys9IiIEfhqOo77rSXoowVNjFk0o+62UMxmqoQ2QZjCesbKd6JgQvCMFG2c07pZ+xHwn7Y7d4ZD5VjYOUmmOmVtMlCvy1mucQxNyrxTGwenqvmakxKn0SsFt3cXtJM+Vv7/jT86Nr2u7WTMy2RZ6TVzWWS1D52UI2h/C/Evm5shhUSRlE194SPBbYy/vVndrADf3URuxjKwf0muNIJ2CoxdvTQCLIa8V1yg+gw2ILrOnNwwIXO/JQcZrIAZ7pi61yL04vlT7uCIjcafAi226qYRdmKO+uiFnssPmHNCdkafVQ3va7bKcMzOg6lrq44nwJXNovuBhz/HhmPBo9xQXapNowJ5ZtObZ7gfc9Pl/F08h+Ud1HY5oiJ2Gs/2MzXT6gXfzhciM+mRsCU1nstYVL/mwqa/dI944nQNYNCYMs4F1uJ1tXNcIAWKe5I9EQhUq0+jvtzUmb6eu3l9ouvzUiZqoNfVBrKEcv7343ujixpdB/IZ5HdulUHAiqTV90Rrbm0l/VnNDlKAEU1sHwyfMa3807Ty9qjhguOBHEFzIUXt1dbKfC++5+AJb1NTtLN3EHy6B9ngV+TV0CAmDWPBrlmYhEqV7+hAR8eWwpAitP0znOrj8ulQpXZL0Tca0Fl1bBWzACiGXFrEumhkuRaVZxQDT8I/OUufhZ+OxECrdxDJmOE1yLviyOUNNrPpbkvj+5CHQcMQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(261026135527099003)(261026121527099003)(261026130827099003)(261021121427099003)(261021135927099003)(261022113327099003)(261021123027099003)(261021130227099003)(261022075727099003)(261022105027099003)(261021133027099003)(10067099003)(261028144727099003)(261022115727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oAGaLzehD9ULlaDLBK50MlsUBmbIlhvsaQ7qAlFgtr5wUBrYIizRDXtw8Mr1+12x9w+zdk48I3unN32Oj+bMWvTaq3+4Hg+XBVCaPcVG64u8kQSIkE/EhwL+NR9g1QFiiwemXX3eRQ+Jb+NXHVeoiMg1iOMgTpqPfmOJXxHh/vjeYmznFL8ZI0Ml+yWE+bJNF4Z2iTa3QIHswyWzoFRXCbg6C0OHjIy951U990BlUJYEsvu90Wqw9p40Onx0yIdD/WwaYFuZZElDOkgzjYjL4iyN021SavAAP9c4fIywFXcVbLQBtZ6tA9IPBaYrMPkkKq5fl1ZPwhiLgldjha8JKVvZkH0vozIgPCKi+RcLEqpMZcvJItNBTCyGA5FbPpduMIOvN66ji37nN0elxlhJUmsxRyNz/WzTJO9LqHkJ9umTy5dLA8FPnEYhYXgoI9QQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:49:40.1703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 602a765a-8b7b-4758-6f43-08df3fb793eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949
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

Run the buffer clear and copy shaders on a compute and a gfx user queue
and check the results. The existing user queue dispatch subtests only
cover hangs.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 24 ++++++++++++++++++++++++
 lib/amdgpu/compute_utils/amd_dispatch.h |  2 ++
 tests/amdgpu/amd_dispatch.c             | 20 ++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 9cee17d6f..ebb721781 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -839,6 +839,30 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 }
 
+/*
+ * Run the buffer clear and the buffer copy shaders on a user queue and check
+ * what they wrote.
+ */
+void amdgpu_userq_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type)
+{
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t version;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
+	igt_assert_eq(r, 0);
+	version = info.hw_ip_version_major;
+	igt_require_f(version >= 9 && version <= 12,
+		      "unsupported gfx version %u\n", version);
+
+	amdgpu_memset_dispatch_test(device_handle, ip_type, AMDGPU_CTX_PRIORITY_NORMAL,
+				    version, true);
+	r = amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, 0,
+					AMDGPU_CTX_PRIORITY_NORMAL, version,
+					BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, true);
+	igt_assert_eq(r, 0);
+}
+
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type,
 		enum cmd_error_type hang, const struct pci_addr *pci,  bool userq)
 {
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.h b/lib/amdgpu/compute_utils/amd_dispatch.h
index 45858ba4b..a7cb5d348 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch.h
@@ -44,5 +44,7 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, const struct pci_addr *pci, bool userq);
 
+void amdgpu_userq_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type);
+
 
 #endif
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 0590a960b..f87c66c76 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -241,6 +241,26 @@ int igt_main()
 		amd_lockdep_end(&lockdep);
 	}
 
+	igt_describe("Run the buffer clear and copy shaders on a compute user queue and check the results");
+	igt_subtest_with_dynamic("amdgpu-dispatch-shader-test-compute-with-IP-COMPUTE-UMQ") {
+		amd_lockdep_begin(&lockdep);
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-shader-test-compute-umq")
+			amdgpu_userq_dispatch_test(device, AMDGPU_HW_IP_COMPUTE);
+		}
+		amd_lockdep_end(&lockdep);
+	}
+
+	igt_describe("Run the buffer clear and copy shaders on a gfx user queue and check the results");
+	igt_subtest_with_dynamic("amdgpu-dispatch-shader-test-gfx-with-IP-GFX-UMQ") {
+		amd_lockdep_begin(&lockdep);
+		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("amdgpu-dispatch-shader-test-gfx-umq")
+			amdgpu_userq_dispatch_test(device, AMDGPU_HW_IP_GFX);
+		}
+		amd_lockdep_end(&lockdep);
+	}
+
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.50.1

