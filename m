Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68711CD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FDB89A77;
	Tue, 23 Jun 2026 18:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lk94iDnm";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEE910EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7evrbMGOcFhNICxwCDMlr7as4kU894CETjxMja/uRiOu8Uh5QoO8kMf7sfL29hpWQsHHjkio7xMSU3AuF0KvNUmUC1KvdYw3F1I+k0Ef6SpiPgjYNvpLziaGz7g9sg4CPukgNyI6ucJ6JV42GWDEE5vaU39w4suAKTrg7kcwuC+rRewRF0CAxDTTV45agUHa4lxDFaTbLh764gyAhNGQZ1YE4tyWRtnNOmB5OTJ8cp9lGIa/a6IqaFvNpSlQ6AuG7HFV6t7dYD6G9i+2KvXsQPawUBGOD9C1/plOGdGrcPa+UaFSWnYLcbzfXgBmANnDw/lw+D8cEZhxGeekoAuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL7hLB1/eIq+he4G2F3pQPi7nc5F11ycCo4nGwRayuo=;
 b=hdBKsoqsp98XFqN0hLzYi4aOtVr/D0V9xiFXFYj+mqvl87Xj9QxdbrWuJs8p3NdaXfixfvjvPYxT0z7x9WIu5ggvPx7hdGzmO6+Sencpvs40LmHN3mWTz0gu8AKu3FMhEAT/v1PwKM0PuzKv4D0L1Y3WBXgWEfJ9D+YpH5oQvqIQRu7cgF2I1FhOXUlKhCRm62FNThdpeOO4xi+KzgILwUYrYzhH+df/woA5MLufP6jaio5sxuBRWsUalBsGCRIaNbo9SjsTiWHK/56q/6TNqMNjhz9sMrHgl06wsbZY+zkIrI3V40uwVRbekeXoGxUvxkrFw5c9edHdCvt1tmPVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL7hLB1/eIq+he4G2F3pQPi7nc5F11ycCo4nGwRayuo=;
 b=lk94iDnmqDe72YHuP1/LlqGlj1nSUr5x4Fg8X3JZeAbDNRq6GHRyWLcZwORbG0jis7JulITQMGK1ysXqezLJolstXEPoS6S2/1r65WP9FJGyU1TVCUbedG1vVOqLWlbt20MPDMopXZYQyTLrMbKiHKZADlL2qm0KutAcg2+gjjg=
Received: from PH8P221CA0045.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::20)
 by CYXPR12MB9339.namprd12.prod.outlook.com (2603:10b6:930:d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 17:58:01 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::23) by PH8P221CA0045.outlook.office365.com
 (2603:10b6:510:346::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 17:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:58:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:52 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:51 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 12/12] tests/kms_colorop: Increase VKMS bracket to 3 up
Date: Tue, 23 Jun 2026 13:57:37 -0400
Message-ID: <20260623175737.171142-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|CYXPR12MB9339:EE_
X-MS-Office365-Filtering-Correlation-Id: a729b2a3-7eaf-4d27-b152-08ded150f734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: C2l0AmdgdV39F3bQ+BBRtgvjhi7T/09yKNVVmARSm8lsLheAwki0tTREwAsr0VtnabSsE+1zcw1sRa/q1RwwB/eWy8jsteFT0zWgvmJAFWX0PqQ6nR1VXP2wCu9ypTbygQry8q+YsmcBIGWarm2lM1bvqQYU3kPWhwLomK8QYQJW5f+eHG9XqqUqg3yElcWMRMGlG9Mwli4B2Eh2HT3q3Rh7OwIv1g/nQ4BTciM0dXFJVeABrUkXh4QaTVC0qBFio3GCM62nmaNiQejg9n3o+fbKON8JbiggBycbG1SqrqW5XNDR4nRbmH4SkBj0xbhyx384qhAw7Zg9wOlUpoVqopgKwYQvYRYYrdP1R1l0s5lmZOMKe5Bu6XixOiUUtbC/5VFgyBvAGrPDQ2id0WcAVL/gN3KB5Pfic8Crdc9kq3JUIYPWXOHyJF1WLwpRvtf/FGtFAb2smeRuvLeD0O20DM/5UUucg3byG5AZzPD9KIrxOdlDFioLenivDmR3djhPGK0aLduxKj5gkRW5qwdNiRreJb4yKqtSP0EuUfmI9Zr29cV8DfeyM23ywdBqQCub4SS3hFWtUDeCHEOaYSurSNfXVC8IAHDS5YPEghfFuWIMeg2dxSh1vEWUyLajSmpg4eaAumzKlSioGzcOpC5EB3kFp2fGYTF0T+JoqQE+Pur3KbfdxzLJ2WDotSGz/JKfgzceU5bKIrqOVHLS+XK06Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(56012099006)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tOglTTDB1kFa0QMt1mWBQ7q0DrPODQ5Jr44GWlh+24MWIFf/VnO5YhJl2mvNJuNcJu0yMBf6hqjsRloMM5Rp3CfV7tzr/bPR4ojQbTMWfPCQBBRvJ/bOLdr3gthpAh51klFv3zGrDnX0UymjM/uk2tddSGElOaWBe9M3kpMB1QnnktB80HAYTFdXlqact7AMYP/NNzn9A37KivnJ5KhvsK34l//Z445HA4Emvfveudz2dXSSL3TB6iYKcW0ElH9/JL2S7IZJLlYqHKAkNXcID297fJRGmYWnsG7HbTQ3B/DEeFK0G+xuodlo9hE3J/+AFoqx3g4fxNNx1wp0WeiSEkbXpCDW/9R/TQcbwG4U0OuIx7RupkduHZ/fLoeiZxQMb9TJveebKiuoOa8082QtVJ8DJ3UyB3qR3ZCJ0BHTLTaLJ/QymK8MwyQ6JbZhJBEs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:58:00.7339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a729b2a3-7eaf-4d27-b152-08ded150f734
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9339
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

The delta is a bit wider for tests of the CSC with other colorops.

Increase it to 3, which is still pretty tight.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index a2784243c0f5..393c66de51ed 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -234,7 +234,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	/* Each driver is expected to have its own bracket, i.e., by trial and error */
 	if (is_vkms_device(in->fd))
-		return igt_cmp_fb_pixels(in, out, 1, 1);
+		return igt_cmp_fb_pixels(in, out, 3, 1);
 
 	if (is_amdgpu_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 13, 13);
-- 
2.54.0

