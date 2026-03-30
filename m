Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812CF1061B0F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED7710E70F;
	Mon, 30 Mar 2026 15:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0YkoEfRj";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F77C10E6C6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mp+uZ3EgNQ4lUpR+2MaEoYqUcS5FNKXioZ+ZdshebkzDUrofYkyX8xMg1WGT7OPFvObvNx028TVnR6pL8qs3EczKpVF/mTsynKSrezPWQVoMPR04dlY4uGuA65BBLax1+3HBXErK2dnB+GLUHkCO9AHGNQGthaZFUflpWAi19p0HpW9rriKj4qjWKt0HpD+UDi6e1Gl03zBa5rGwuVRUFy9HuPIwydcggzvWOC7l7HG//CzrA1Lt5UoAzfe2HpRJcv7cRhkFe9MSxUViwlWHhxv6QjrJOcqi2KpZhPJkpj/v+5PSvE5MvISwiI+uqg0ceQ7883FbJ1mYLUIsw2CIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgAxw0onMuFZdoUcMht8bnnFzurkSssFPYIeZZWB7w8=;
 b=j75kTHP3vIL5KgI0P5pFW7pN+TTA+7pRi7GByqSwkm5gGYkWPySlSOuaoQINJhXyiwaS0u8TWaIv+XGDB2uQQYtBiBaiIYWNzbELk6Fmi493d88nJzOznLNUog4tTNdjkyh7HXr5hDs5OD5OPT/1JIWsk4x30XMWnTONKAE0l0xc5q6wfskHU3VEmO2cxK8yYaoFi6a2j8el7+CzGXibXkr/VUle2quDGYfTJ/5DhKAlk0+7PXhVQN8pqqYbEvxxwja1HSv2QzqSQSEQYImIrE+GPzV4POVNeGLguFxg2vZr5ZxsEMxtakJ+S02WHPeTTB+dFhhTp/EWphE1dBvHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgAxw0onMuFZdoUcMht8bnnFzurkSssFPYIeZZWB7w8=;
 b=0YkoEfRjEnRdrwxE0jnxHoqVAFNFYIZgeR112bgIX2FjVrDAyFphqYR1iGjgIi8WeDU4IgbVFZTFKtY71Dlip2tGvw30877m8/rdO1whPDCwrCg0GNj2Wv2LlbMDaITRn5i2lOEiMaLIrq4IkrPiEtHAH8ojeZnRSoZjGRVH62c=
Received: from SJ0PR05CA0090.namprd05.prod.outlook.com (2603:10b6:a03:332::35)
 by IA0PR12MB8973.namprd12.prod.outlook.com (2603:10b6:208:48e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:31 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::38) by SJ0PR05CA0090.outlook.office365.com
 (2603:10b6:a03:332::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.25 via Frontend Transport; Mon,
 30 Mar 2026 15:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:27 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 08:35:27 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:27 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 11/11] tests/kms_colorop: Increase VKMS bracket to 3 up
Date: Mon, 30 Mar 2026 11:35:18 -0400
Message-ID: <20260330153518.99898-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|IA0PR12MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6f1958-4731-462c-d27f-08de8e71f9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ricH/axf5IAtlrEF3xbYQWxQur38Z9olFrGRkIWGs9jtnNalu7jHv9VT9yippgsrxn8rk2xk2gjeToZyVMJhEkfAW8Qo7o+ygQ/ksgsA4D4PxI8JOd3vf9WnGlbKCbaE6qUneSRl7z4j/0QNdfJ++d7O89t6qPZ6yzxrVGjJWcSto4ql8HhNiSfi2ZAT9A68AnLdDdrZPmItxXbIhrdfSuHp9qicyUNA6NZopORZUb6mlZ02MbBC0UugCkmZoZbK0K3ZCszkOi5JEynOaWpuMZqrl1a9Z6i5f2+GHXu6Rlx7JJuBtwW+xqtjSFfZpndHkHAXwFjVr0RFXd8aFbR+Rd7QIUtb68b8EPqTUT90+40zlMt7mSYTiVEq7cU2cSw4ZSIC23l+pUinYXnUAHPsS+UUzDHi86hVPF8KCHmZO+vRkjq68PM+PclA1KHbbYIjNLvgeR1hDM18U8Hy1fqiMya0Ya8qm9KJI9AmSPu8nF/MZpS47r6aP+5fV+OOd0Pd3+2wKud2eikXiND8A6n/5n/QIiOCKMiDgTMfBwlFPt+yt0JWVZAX+X8sIkn8Dlu7c55WjgKlYL8vfRPHYD8wn+rDjTGn6YQXkbdLLT2xMclxz5BiQedKugyW1+DS/ydOsFtjPsPrJGzS9pOHSvsRLUkGogRKbz+ci1kk8KvxR1Vbt3dyNjsvxjb3/jWpjzW8TLMeItOYmF37OMZwNnuVLtLg5y13oQcyhlytVYEMLzUbu1BXN6QCB9cnW98KWSpu7jgpR4q7m3V+N+GBs+/5FA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: apaskSvroBdsgHma2G5JaLDIqrwMqWmBf6+3SlGHP5FXMTEP07Gd+M6ZHoiAW6X4bXX1g/CMp6gH6x99B/YdYWVL62WnFTMMzeNrvE1ZybTuWt46BlUNaa42iZvvNn0sCIlMxVqMwdQv6IgrdI9scbk+XsDwy1yZEZC/HM+6tPNBMsLa8tKpuwcY9Ch7SqorQXBIFDYuogg6cLDJ0UeW+sCUFi2s1fyidlF0kPHp7e8rR0CTxOMR7Ithnq4NB9SxNnKGZICVjKQlsWRdKRfWIJdUeovceHH7cjpwHbR7KAPkSxIRcxb7GBVtW+kXzjYBikutf+bLRBC22Aj+u4Eu9ybz+/FnC17D6LLwHp+w+xVppmQ1q7nHTltNYjL76U5gvlnINwBcLWXB1Awdb28yba4uuPjhE2ykhTi+fLPkE2sDUXZZ9HxDxnwbD8YJvnca
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:30.8087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6f1958-4731-462c-d27f-08de8e71f9ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8973
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
index b77fe0836195..cb3551a7d54c 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -242,7 +242,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	/* Each driver is expected to have its own bracket, i.e., by trial and error */
 	if (is_vkms_device(in->fd))
-		return igt_cmp_fb_pixels(in, out, 1, 1);
+		return igt_cmp_fb_pixels(in, out, 3, 1);
 
 	if (is_amdgpu_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 13, 13);
-- 
2.53.0

