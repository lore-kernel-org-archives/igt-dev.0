Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C36CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 22:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF1910E08A;
	Tue, 12 May 2026 22:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F3QXzdXz";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012030.outbound.protection.outlook.com
 [40.93.195.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8710E08A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 22:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWCX2f6XwiNxwm/gLRvgdoj5guzhCX1D9ZQabDE2/FEQGILDzIbNeWfx7+WvlZBC305ETqDxg65jErsmQo2eko3AiJ43VZSXwm5QdBel8nBdPXtfyBBEbdEBBbg+utf2hK6r791Etwv+wUIehVL1z00vaSnknuPuGVc91vo3pYd9/CAAK5KXUBUxNx0iezN/M7tzwPh3W3KGPhcyfd62//i/MC32YJiZlb6QVpvDW5+y5reK6Ufi2tUJyIzOqvX1x+gqNEXbxXpO1slxq3aISS2+8ln0ps8h7zE4P6g/KWtguC9WW+Bgd2hLiQ6hfzkdYXvqsoaAglsm9xCLZ+2vPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoNKta9tDhi6/wtWdtsf4JvWgL6lkLXMO9WFFCO8ooI=;
 b=nLSwQUbeNZhnk0jvyU8fqNsYBtWQyg1SUuZc+2n0ODAMN9Qz0f9mB3URijrQ+75MSEtePQXQHQPmIeQJpeIXMTi2gBlRoD7Y9jnUmpUfl6avpKOqTtS3yBk1LYZYh6AOsX/LYhCjGf90nY3tl/AWdTEBPMDAPkMvtFJ50Tg1gjnSpVQX4MixTAn7WB9o1jvIp4iyl9cl+zOlUVTBSUYkBY1Iex+Yqlk9zxQZqMMVR/0lpOAOaxLaEIb8z8rr8DYRwkSemxjtm7goiIH6nnwElO4lYcFvQ8Nq0kaKJnfn3TlAtdCADSjmRlAVV9FT5E1WtHg27js7Wc+ofspifkCPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoNKta9tDhi6/wtWdtsf4JvWgL6lkLXMO9WFFCO8ooI=;
 b=F3QXzdXzng3pfygG0sKanqNNXEK6ZPZPPbBLfpXN2oS4TbHG94WEwFW2uIV4B1xOxZ5iat5TkdIUnUuneI+t3Q48DrX73BqDovmuUgHZq6fTGVOGZpaj4Ryq3OdYIz6dR6hwI+ABp2kYHn6sxFiZJ9trSviOdnDcQpmLi6XJiNQ=
Received: from CH2PR04CA0029.namprd04.prod.outlook.com (2603:10b6:610:52::39)
 by BL3PR12MB6401.namprd12.prod.outlook.com (2603:10b6:208:3b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 22:23:18 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:52:cafe::bc) by CH2PR04CA0029.outlook.office365.com
 (2603:10b6:610:52::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 22:23:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Tue, 12 May 2026 22:23:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 17:23:15 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>, 
 <swati2.sharma@intel.com>, <kamil.konieczny@linux.intel.com>,
 <jani.nikula@intel.com>, Wayne Lin <wayne.lin@amd.com>
Subject: [PATCH][V4] tests/kms_hdr: Add interactive HDR verification to
 static-swap
Date: Tue, 12 May 2026 16:22:44 -0600
Message-ID: <20260512222245.1767752-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|BL3PR12MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b73726-44af-47fc-2ab4-08deb075110d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|3023799003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: nb1QL4gebaKLljQIHoTjkTCxuTn4pO2UF3X88OhvvkL8Ego2FvbjbGn1UQftgrL1eJ/kGd40ItmH9zDLNfAqiWkwYU6iAf5K3LAGQyo2vQ6oJ0VxaJb2LPAkdyrixpCYvmSASWoYmPtJjvaYxKAVOORZVc2V9qgjN2p1/y6PyZ4mC5+rrtE7M+WqrtplRqU0kf3wrpFZJI1GLue4Q5qCG+JB80nSU4xDwlJMY9QiepPOKfDYiJ/x4Pmz1Zo6A2H1XdkhgRnYP44tjwQ98pYd8s9IbDi5/fLKA5rOrXNizsZ8vvxBiGGoY1IZ8yVhwZ1uUVWaQd/KIviHqPLJhRgxnqnO/IowfnQWCeZp5a+0cdza9okZB0/HO7hXHtTcvZt5l5IztYwQsycyeX2eg0+WCvC2xzcepajP6bfIY8OnMKUE8NZEgmjOkrgTypfI0VIuUrKt2eSQZ3ccOKmqBEguxUJ3WyYPC/RM92s2gb9mKVlGRd50up2ct2azWaBUBECAMimMWbg59F5cruB/YlST7EaMExPjy2XQF82phEm3HkW74bNeeh0+CeFKRoqdAjDtoVbDJq6ph0ZvKMspolDITYCSKj91k+UQLguggtQXxULU5SPowpRRMNTc2oyxemtSN2uB6+UGGKTFRrS7e3pJFxXA7xmj8scCFGW7gzDzFi+B8fY67rLuRaLOlfBkiC8YC4/QyBejpNY6Pyq2WgIyWhyG994wt7KbobcJfh+U40E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(3023799003)(56012099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NYtYj8IxF/D50jOVRZ+yWa04jEvadgYea18WDAufFn/s7JWcbSia6aflGugP/l5Vu8c8w2HpiIdn+0D6YhAMuWJs1rMEd04NmD1misY1ceIGVOFpBhB8zX+4FeafOqqBLuGJC6PTJsPIBGn67tA5KlTdeoaPJdSSjG56q2OATo3Y/ul4z7xYy0ReiWy/2ia9hs+++CwOyMqxXCeaQmLJ5Q6ZIMgAIhoKTab8FfAjcFDIQ0dd1JswEVc0Lhmps9ZwXzxQTJmIgFbe+q30/kRjclCdtYo04BJ4BpIHL5BqFOzYctkpPoE7u1/chKLuzvo+8zxtAm0Dp0+lRvNM55PyhYtyNIGF5BhyrY7dj4utDEXaWq0SlqSQQEu0Fz9Qd8Zz5mwdlwxMY7HIerrOdUU0WPaGz8LtCbPcb0ty/+dyOfZ6eWu01ZVzL/Z2wtIMOTP4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 22:23:17.6376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b73726-44af-47fc-2ab4-08deb075110d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6401
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

From: Wayne Lin <wayne.lin@amd.com>

Add smpte2084 and traditional-sdr with igt_debug_interactive_mode_check()
checks in test_static_swap(). These checks are CI-safe (no-op without
--interactive-debug) and provide a Y/n prompt when run interactively:

  kms_hdr --run-subtest static-swap --interactive-debug=smpte2084
  kms_hdr --run-subtest static-swap --interactive-debug=traditional-sdr

The HDR metadata probe in test_hdr() failed with EINVAL because it attempted
to commit metadata without a scanout buffer present. Fix the probe to create
a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to validate the
commit without modifying hardware state. The framebuffer is freed immediately
after and the display state is reset, so the actual subtest starts from the
same clean slate as before.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Assisted-by: Copilot:Claude-Sonnet-4.6
---
 tests/kms_hdr.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index d50f87787..affd38887 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -454,6 +454,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(crtc,
 				    data->output, 10);
+	igt_debug_interactive_mode_check("smpte2084",
+					 "HDR pattern displayed with SMPTE ST 2084 metadata");

 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);

@@ -483,6 +485,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 		igt_display_commit_atomic(display, 0, NULL);
 	else
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_debug_interactive_mode_check("traditional-sdr",
+					 "SDR pattern displayed with traditional SDR metadata");

 	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);

@@ -571,16 +575,33 @@ static void test_hdr(data_t *data, uint32_t flags)
 							      "non-internal panel.\n",
 							      igt_output_name(output));

-					/* Signal HDR requirement via metadata */
+					/* Signal HDR requirement via metadata.
+					 * A framebuffer must be present for the driver to accept
+					 * a metadata commit. Use TEST_ONLY so hardware state is
+					 * unchanged.
+					 */
+					igt_create_fb(data->fd,
+						      data->w, data->h,
+						      hdr_test_formats[i],
+						      DRM_FORMAT_MOD_LINEAR,
+						      &data->afb);
+					igt_plane_set_fb(data->primary, &data->afb);
+					igt_plane_set_size(data->primary, data->w, data->h);
+					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 					igt_hdr_fill_st2084(&hdr);
 					igt_hdr_set_metadata(data->output, &hdr);
-					igt_require_f(!igt_display_try_commit2(display,
-									       display->is_atomic ?
-									       COMMIT_ATOMIC :
-									       COMMIT_LEGACY),
+					igt_require_f(!igt_display_try_commit_atomic(display,
+										     DRM_MODE_ATOMIC_TEST_ONLY |
+										     DRM_MODE_ATOMIC_ALLOW_MODESET,
+										     NULL),
 						      "%s: Couldn't set HDR metadata\n",
 						      igt_output_name(output));

+					/* Reset IGT display state; hardware was not changed. */
+					igt_hdr_set_metadata(data->output, NULL);
+					igt_plane_set_fb(data->primary, NULL);
+					igt_remove_fb(data->fd, &data->afb);
+
 					igt_require_f(!is_intel_device(data->fd) ||
 						      igt_max_bpc_constraint(display, crtc, output, 10),
 						      "%s: No suitable mode found to use 10 bpc.\n",
@@ -591,10 +612,6 @@ static void test_hdr(data_t *data, uint32_t flags)
 					else
 						flags &= ~TEST_NEEDS_DSC;

-					igt_hdr_set_metadata(data->output, NULL);
-					igt_display_commit2(display, display->is_atomic ?
-							    COMMIT_ATOMIC : COMMIT_LEGACY);
-
 					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 						test_static_toggle(data,
--
2.43.0

