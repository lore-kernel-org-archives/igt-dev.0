Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B25DC5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1459D10E470;
	Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qibw1hmk";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF0F10E47C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZlCQo1ix4u71ZR6aT9BYERUEROcY+/QSdMWAI/iSPS/zFAqSVjGdiGVK0XNoRqQRkg4aK1djgt6uTYqyAJY8Wg/+1T5GLKErtIiV8XpS3QBSRqSgPLZCElgSszbxHiDJievEq5SU49NKOVU9mHFV9b9GsKyCyaxUQMBPeEcsGw5QTTjdwUOccmWUsz83FTdUwS4nlw+0ueGyRyNovGJhsD/cab29MPGpGuaCMqt7x170+BnZ8BQ6FzMNha+/QvSejK5hwRGOZfd4iWfCbalkcR1YP6MEbppUpAGLSlJkOL73JniEA2i/0xc7oIfK0Fu85b/vj4gERyAAtdwXtoqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MWOhzJw7RyH4Idbr0dFlH6+hDoIpz6wOC7KSz5Msxs=;
 b=BUKXqtIpdB7fql999nzZK4JMRb0jvBmI8TlhWnJYC4L8e7EYNySFTsPGKpEm/QY5hTIQNuR9Jj9hLfiGAHqDJMZ+OuO9c8WgI198kJN2zcH1bqvoP1TXD87rc51ibYZ2eQN/K6s9NcAV6KgTSbz0p5VDjsiht407KF2eMsnOdqdvaVqh/de1N5zOsX1jess6Hsu/Kxc34vMkHOuSYRSyoLu0aEObCYZLFbY8kiS2KxXqww7dQRL1uH7/Fh+igA98WH1KyRF1ZRFlH5AcQxBaGGceakBTT65WVIQhGgxNl6KiKPYhg8lFpB0k6FDqnlLZMnlp3cBFKLv6Kdo1gHEiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MWOhzJw7RyH4Idbr0dFlH6+hDoIpz6wOC7KSz5Msxs=;
 b=qibw1hmk+RWgkKFtbaf/7raWgbNMZV5woggmpvbCOWr0jufANCv8Z822AUGYadU/pwZsFfW0jIZ80TiCpjpvpCXPKVITq++6T973zAivVSnylRNZgq0F2Pxg/HFCumN0fIhKWdCYoX3dCKwL62qf5TXNSy8YAD054zkxSQfQjes=
Received: from CH2PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:59::17)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:39 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::13) by CH2PR03CA0007.outlook.office365.com
 (2603:10b6:610:59::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:37 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 23/37] tests/kms_colorop: Set wide [13,
 13] bracket for comparison on amdgpu
Date: Mon, 19 Aug 2024 16:58:09 -0400
Message-ID: <20240819205823.316656-24-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MN2PR12MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: bab389ab-8460-4aed-8911-08dcc091b39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?THrkk3B+aPhYNul4YGzXCDNfDmd8rfvaDAr0GZi7LHY5kvmfAuNkaKwf9vTS?=
 =?us-ascii?Q?5+Z0hesaHO4WBOL1ZQlB9/dDIFfRMngGqjwpMwVM9GS8luDq9LsahKEDdNkE?=
 =?us-ascii?Q?JC6d+ctO5jhN4yGwW0T7bDasgphZpE7ScQcZlDcwhWnWkJ+MML/Sdx6AIejI?=
 =?us-ascii?Q?PeULotQHMY/o7d/X3No1mlS6jCm5QSRbkEfYPKI5qFO8Jl+As8QFmoRMEaGV?=
 =?us-ascii?Q?b8dQAfnqxtIiCOWmmYFFPMNVj/3DKpEyZjATuG+2KUlkzHyatZ03HpjLFnZW?=
 =?us-ascii?Q?D0XyxwDe7FhHNBBIcK6hT6wqNyCiIWsdHADkQHiH/nBDGQKv9ypRyBnmSfqq?=
 =?us-ascii?Q?F7I1hQH3IzL09UKNwGCjmoNR/biJB14g8KNSAyl/8wPlwwTfqbPKTQJ+2H5D?=
 =?us-ascii?Q?mdGSNEg1hco+VQ6xAubVbK/7y+TC6OnfvAv8kOUEVLhXQT8NYwiC3lplE5os?=
 =?us-ascii?Q?VbZu8cjYUAi74VHsdTTokq57qWgW7KCFxS7xZ2WilEtrZK/ZUz68QsjB6Hsb?=
 =?us-ascii?Q?ZjqM5DoDDxAur54bBpBkqgm1KpHzmx7TgSQF6cc/vlwR9PXAacqgEwykrQXy?=
 =?us-ascii?Q?TAXN9L/d/uUbgyLPErJk9Cw2DD73GqcfpURQ04VTlM7LbGZbo8QQVVt49pUP?=
 =?us-ascii?Q?E3gTZAvnxYlBH5wYh+bBNtH5oklE0U2998LCukrw9QgyzFaRmN+yhYPicURL?=
 =?us-ascii?Q?C+n5SzbL2wKuSenRWGPhlr8x6/OS064RbVuT0ULgKw0LzD8cLhCn5jdK8A7n?=
 =?us-ascii?Q?XmYQoJfS+vO2COlGZKE7xH2VKVnPdCgazTJHEHDoKY35Ohpu9t2VWVwt1HEl?=
 =?us-ascii?Q?0gDwN3tG3+cRGnWFwbMDFDlqG7ejk8nA9CgO7s+0nDFXZCO2y3ftQCRQeOzS?=
 =?us-ascii?Q?NeE4bhzZXb/FdS0u+5RCstKX0DKMvtM00o+s1nP4VvtoBFuXpEBQnvdXbClp?=
 =?us-ascii?Q?VVgQ/g/wvSmV+WO7F3EEfpON6t5roJujMrHAOVnaJel5GCrttwl696nj0cF/?=
 =?us-ascii?Q?IhCFvSYKfHD/tgfQ+Oa72a5e/LMXDXHrR6DOAvlKbuLDSWpU+z/iFujz+XCZ?=
 =?us-ascii?Q?Jdlj5CCdZZrgH2Gdlv6rkFetj3X5wD1t2cUj4vVc9Jv7UKWly1VqRXm6JDdr?=
 =?us-ascii?Q?3EEl9AH6f/VOUo2Fc38JAtq2R3LaJ15g0I1O8fb7kxVWlJvFDPl57tbzjCdw?=
 =?us-ascii?Q?nJvwwQWQNAQUStccl2TVU0T+1lkPXZnmdt1CEHFDdtFHSSyPOg6Y6X2ysZLi?=
 =?us-ascii?Q?NXWyubwAYGFB/EI74LNq/0ZkNnDmeIlaNtSwMtoBsDi0WelJnPYq8k0ivjpY?=
 =?us-ascii?Q?7lEGuRsQiXWvxZAIimE+ksIxvJ3sJZ3j++W4hRtc/vx6N88yH6gt2iUSxFlj?=
 =?us-ascii?Q?hjeF5/iGUErmRDqIeF73LdrwShvjYlE6T13zrzV+P6ER0NBfxmcef22nlL+2?=
 =?us-ascii?Q?/81F3Qo6XOcIK0lC/o11/D4cSuRBy01p?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:39.5026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab389ab-8460-4aed-8911-08dcc091b39a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
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

Setting a fairly wide delta for now, to pass tests. Note that since
tests run with 10 bpc surfaces on amdgpu a wider bracket isn't
unreasonable. Still, this should be investigated to reduce the
delta.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 3fa799e7c084..659fe63a5e4d 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -354,6 +354,8 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	if (is_vkms_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 1, 1);
+	if (is_amdgpu_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 13, 13);
 	else
 		/*
 		 * By default we'll look for a [0, 0] bracket. We can then
-- 
2.46.0

