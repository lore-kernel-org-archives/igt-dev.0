Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0223ECA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E2D10E983;
	Fri, 15 Aug 2025 04:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iWRVTgNL";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B2B10E983
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7uR9tW+da95p3Ic2Fv1w5CFTbRWNcv5aPRfQ36ma6ELTyb3LFovVQnFNy/xr0ITba10XI/kzwGuUmaBIkUsa5mwcvXS6KSPUF2EApdTNmqkYWzIuTTpmjfFOiwrdIKjzN0ea0wcpHWeSZZO+lTSbc8Lh5HphbgCOHILjou3hgMxU/GtQmk/272el3nysOt5hcFwFCZHEGVWBLOXmTBeHAJyQ/sUdNnPsjOtaQY2dwRAhpxkL1h03mFrJ0Nk4e1k41LX2r6MVSXTWThxIZxMvBI6/c/X+ykMkrjxrF4EKpUjOHLvPpQa0OAckq+u1V58SYfEnDYRFrFPFiEujrDwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1ZPCnEGq9r+yboK281UqLxhP22zMj0yzcfGzp/ymA0=;
 b=wVEE1o5OYit3f7s5tb5TStM+TUMlDIas7SfvaEGxpapVIMuoQQyhXyqVRpTS4OE9ptGTWEiEcytOfZA3lonS3rd8UR9clw7CP6BHyiFceaEd+69m7zzxK3CaZ//aH3+pGzKij1o1nBZ63GGhnenHXDxU/apHYdaR62l79pzM72FHgrhvMnZ4u1EImKNL9s7RSsJ/LbnPvtMM39KzsAtvxqCwNablJqAgcNrpyhiDFvOmmkeBfuNcCXszPEqfX3x6D6bFES/ceL/p2Xq5YrjV3pRGrilZe4V8uC3lies/VWbrWWCxWgLI31hMZ0E1a9F8Aawe/UW4EuxX97/BskN5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1ZPCnEGq9r+yboK281UqLxhP22zMj0yzcfGzp/ymA0=;
 b=iWRVTgNLcU14JBoIvVwaaXqhFwHh1JkqhUXx7yI4tXFxFGhQZufIbe65cco1GxGoVXJJvVl3q5y6cxpkQoN+ovdAVpDJz4wByGqnLsKDow+uc9/f36BC77ruVgNeV35qzang312lPw/a743YAnl8Ll45ampw0G3sDpUwXddxjpI=
Received: from SJ0PR13CA0040.namprd13.prod.outlook.com (2603:10b6:a03:2c2::15)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:08:15 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::63) by SJ0PR13CA0040.outlook.office365.com
 (2603:10b6:a03:2c2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 04:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:08:15 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:08:13 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 05/30] tests/kms_properties: Add colorop properties test
Date: Thu, 14 Aug 2025 22:06:34 -0600
Message-ID: <20250815040659.3321102-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd4d6eb-0e2a-4123-77a6-08dddbb15bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YaWqia8KNkM8rKzrgmM5ZupnFRvUO9/RLTzM5b5Or8J6HKwSvYFt8H6TkooE?=
 =?us-ascii?Q?ztG3bj5U3XIz6NN6kCx5fYoTToOspzOnBTXyH3gcFmuwRGpwmMp+coCuQQhn?=
 =?us-ascii?Q?DbDaR7OSGKKIYVh2xmwBhgBHVLAsUYY3JT6tvsezura8FK6zW4coDBVFN1z7?=
 =?us-ascii?Q?t7vmnRqXQRRAtfrOte4geR1gJ9wK6dUjQYJklxDKH2t7RnPLItd4yuKydcwS?=
 =?us-ascii?Q?LSKilELbgHkuwSC5RGAgeTuDES7169Rsiw1cEZAApeGrkh8mA+BTa2xpoLQL?=
 =?us-ascii?Q?IFQ/zYfv9sxrQPtkNZWR4fD84AMiEPIcAKy0NmfLeKHAXzo3oecb2WLlh+va?=
 =?us-ascii?Q?XhYEtEv/TXiaheXSbtE4U2iV4ucmIQQc7O6ehR37HKomV8KHfg+taQ6OxnRc?=
 =?us-ascii?Q?KCBn6JCfT4VoHKxdDqB1kLLPaQw6l1DoMliC4R4fITanCpotzURtkG5PQumS?=
 =?us-ascii?Q?qcqnGzLizb8Yx9oPd+HPqijZkN+ewGjEXM5go2zOmTlGoDGrq43JMvCdGFHJ?=
 =?us-ascii?Q?ipPhwzu8ev8N1VhWx84D+f2x1DZkWtNgeTFZhkSNtUxQQPCQ11ltJWyDmEr7?=
 =?us-ascii?Q?fdo/8dHbobmUAjpJS9x7LtBi8prhI+3liyzZJdr80eX7wPxHha1sOOY0sHRM?=
 =?us-ascii?Q?OkiKslkuRySjQcAyr9zAwu5oBIiKuZ/ZD+oMHEm1xC7y/H738dJY/qMdCaKf?=
 =?us-ascii?Q?5lOylUz3TLnDlmxCKiRRgCrZn3+e5+3zPaIk/zbufyIEkYtQfqiZ4016gSzm?=
 =?us-ascii?Q?LiUKLatn27UIfEQdTKogWDbBez+/Yey7x4pEbz0ZNYYmCSG6XVXH65iQUwtT?=
 =?us-ascii?Q?77VvV/Tc7+cdfo2H8wf/8xrhCjHE1saCRxarPCQvJ9DkIEfcQPd0Bs5C0Xn4?=
 =?us-ascii?Q?GTaqfzYkYgAe51plKkFF2zYpPWLV7n1j+8iA1PQaK4TmeRe0nJ4W3VBEWVh+?=
 =?us-ascii?Q?EB2JowO3Om0DNsP6DhNvvpEJ7l02mrEE4+S6sU0c0FzhBGKkAnQJD/bJOA5t?=
 =?us-ascii?Q?z705Scyd+uuNtAWuCM1mJQfmlgmryobuP5wx8wEoDbQD726+/UWMSBAc4zBo?=
 =?us-ascii?Q?2cqyIFW5IY5FuFj+aqPzTxZ6JGE9KLHT0+zDepCCEKj6pphu9spvUDUTCcDG?=
 =?us-ascii?Q?k/26HAnbhzUIp/3MCjkSqNiq0dM4I+BsIVqe/fT/Qqo4MhvBERV6dzx5IkA5?=
 =?us-ascii?Q?1blvoE0MbJMv7L2PnY3vA2oMzn8ZbIDfS0kvI1EA5BZSkumYXAsb+YjNcuaK?=
 =?us-ascii?Q?kls8XnPgFFfIXeWw5zCCCsXSd2GPerTiFb9fHYNFvAUaLEuAoyFPb9WW76kQ?=
 =?us-ascii?Q?tpJPYkokRlAZqhLY+ChG3N173RtSJK57rUklBiX3lDDL31Rfhzn5bZOYVRwW?=
 =?us-ascii?Q?pCG9RBd2a43/PZCVyiaUZ7UEpIlKzbUYcU4hLrBLdiVWMJH8lPK20qUOds/J?=
 =?us-ascii?Q?shpU/HtySyhyT3mQoAOT1ei0ILwt+Nh0Ppnl3oxyWT+h5/t23buiVQgWbghs?=
 =?us-ascii?Q?nvHCE6uKWV+JgvvJ8PMIr2FeJA480OHPo1fx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:08:15.1887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd4d6eb-0e2a-4123-77a6-08dddbb15bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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

From: Harry Wentland <harry.wentland@amd.com>

We've introduced the concept of a new DRM core object, the
drm_colorop, to represent a color operation as part of a
color pipeline.

Add new tests to kms_properties to test the properties of
a drm_colorop object.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_properties.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 3bdf23aad..a4d73fe1b 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -47,6 +47,7 @@
  * @crtc:            CRTC
  * @plane:           Plane
  * @invalid:         Invalid (connector/crtc/plane)
+ * @colorop:         Colorop
  *
  * arg[2]:
  *
@@ -230,6 +231,39 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, boo
 	}
 }
 
+static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+{
+	struct igt_fb fb;
+	igt_plane_t *plane;
+	igt_colorop_t *colorop;
+	int i;
+	int colorop_id = 0;
+
+	prepare_pipe(display, pipe, output, &fb);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
+			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+
+		/* iterate over all color pipelines on plane */
+		for (i = 0; i < plane->num_color_pipelines; ++i) {
+			/* iterate over all colorops in pipeline*/
+			colorop = plane->color_pipelines[i];
+			while (colorop) {
+				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
+					kmstest_pipe_name(pipe), plane->index, colorop->id, kmstest_plane_type_name(plane->type), output->name);
+				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic, false);
+
+				colorop_id = igt_colorop_get_prop(display, colorop,
+								IGT_COLOROP_NEXT);
+				colorop = igt_find_colorop(display, colorop_id);
+			}
+		}
+	}
+
+	cleanup_pipe(display, pipe, output, &fb);
+}
+
 static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
@@ -275,6 +309,37 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 		cleanup_pipe(display, pipe, output, &fb);
 }
 
+static void colorop_properties(igt_display_t *display, bool atomic)
+{
+	bool found_any = false, found;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	/* colorops are only available with atomic */
+	igt_skip_on(!display->is_atomic);
+
+	for_each_pipe(display, pipe) {
+		found = false;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			found_any = found = true;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				igt_output_name(output)) {
+				run_colorop_property_tests(display, pipe, output, atomic);
+			}
+		}
+	}
+
+	igt_skip_on(!found_any);
+}
+
 static void plane_properties(igt_display_t *display, bool atomic)
 {
 	igt_output_t *output;
@@ -853,6 +918,10 @@ igt_main
 		  "Tests connector properties with legacy commit" },
 		{ "connector-properties-atomic", connector_properties, true,
 		  "Tests connector properties with atomic commit" },
+		{ "colorop-properties-legacy", colorop_properties, false,
+		  "Tests colorop properties with legacy commit" },
+		{ "colorop-properties-atomic", colorop_properties, true,
+		  "Tests colorop properties with atomic commit" },
 	};
 
 	igt_fixture {
-- 
2.43.0

