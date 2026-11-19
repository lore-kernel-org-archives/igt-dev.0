Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999E6606A324
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fL8INSs6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3E111262F;
	Thu, 19 Nov 2026 15:55:52 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC024112605
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 15:54:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlsU+wDqdl+QV6sI4GUOVqqcQxgGQbkEjZcT2xcEchvAV8i7K8ADC0XbfJoriAKDy7aOlBZKKDCKH7u8K25Kmvz6xhjm+llIa+Fzot4CuTlmfLnXq2lGwdXgnb/EZGO00CZ9lsfkFCXBlBW9ctdosGZ/6doouaQ4man4O8nUMUW67/sS7dheTFxyWhjLt7DKqCbhI1wNaLsHj4ehkZmO/HcX52RzBbXHGXaXxsjtFPkv3ZeWMj3jtTmYLtj3mhzsneuxNJPIaTXTPaZPwLlLJCN05SqHsabBxS1OD45zqrCsPzqhBbmaWwRXLPEwVkTx8Qb2K8vAsdDTXaZZafjcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4LWOg60w85XD+riQToIXT4/iDNyYq/AjcpMFLPJqD4=;
 b=pilKi696Kxrwx44Ny2+c5mnP0kG+iVrl7RKxYKFviFwDfr8MuyFx208ICJ5g523hPmstgQ53cxPOpz/DLH1BsaeVhYX4ABgLF4+t2pi+R93ft3eDmnx8ovR2FSpMer/0h9tPnV8OIg2cqksCR86wD6yN1Kbqq3e00U6DhvU3LmTXc916KlDIIj+7wtgPbUN7UzSIlAnvPcqWSJ+rOkBJmqtuT6UD3TjDQ5ix8rvBg0sxw3XFBVFHK3V0YhogxX9uoP62R2coHAoYiHd8Fv+rRewQmbGVXHmKSeyIBYEdIpKsi6dHyKqEUDm2/OAR2oSzFz6H1ByJzNzsjbbyaPEeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4LWOg60w85XD+riQToIXT4/iDNyYq/AjcpMFLPJqD4=;
 b=fL8INSs62hIKM8FRsiLRmeZTllkRua7ZywaI6kRXsxXUjIvdAsobFd14NF35HbsTORnTYMGUxti5sQY17CAFOYFWHDM8ikqrYnMeB10Yi1KZcRe7h3p3yvTjdP3yH+x1f3bMvakUqhUbZgzAKCHijTa9UzWpfvxrFsTR4DBh+VI=
Received: from DS3P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::17) by
 BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Thu, 19 Nov 2026 15:54:41 +0000
Received: from CY7PEPF000000E8.namprd04.prod.outlook.com
 (2603:10b6:8:45e:cafe::6) by DS3P221CA0012.outlook.office365.com
 (2603:10b6:8:45e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 15:54:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY7PEPF000000E8.mail.protection.outlook.com (10.167.247.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 15:54:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:54:39 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:54:39 -0600
Received: from hwentlanrmb (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 09:54:38 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 0/1] tests/kms_colorop: Add Gamma 2.4 and 2.6 tests
Date: Thu, 19 Nov 2026 10:54:31 -0500
Message-ID: <20261119155432.2494029-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000E8:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 299271e5-be7a-4efb-a76b-08df46556c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|261102123227099003|10067099003|11063799006|56012099006|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: BqYBX2u0w29uRwwcZg1LeMubBgPjd540bLPgAhg0HagqKckBJT4yY1j7ik5Mj5Xjveh0LGO55J5Jr0phascK3i6TRtps01mXonDqpsP/+z7GEwen/6HfOq38gdAsTxKOOPh0/944Y4pl4JOLlbHEtVwsmrH3Ibdpsh5BdRgNFHalja/CkAp4cqpS2bGj69v3sG/w+L1B9iCAX7JYEQRVWmwZyMLL0oUuBxNveWpOxyHlB8DNPh+e3lJ4C4OAPJX0R17ni5kKyilEmzIWq0/mH9JUGbsP6bVtCTGQtNPGZiX/kN0ZSgQc/pt57BkUvvm0jqDpI0EJzUF7zhd15K7bUzcnuy4Rt/3JfDFYjcgWtdDy2lXdWC8yPHW38/3w2htVpKgMqW2OuEjaVPh4aT4YVg4MYOvIIuU+x4xf7ubOmFadh398KNbdd7dV0gC14nffDVsqSoeEfXC9RQ1ng/uOD8bx0r0ZTSvL22KuSJWARfKdLPTyPqHtKBnVvJ/YzaL1CDKJCd9biKdizOz/SUK1aTpZTRriNXzLRBQezHgHCqQ6czWym144SHAqvN6M/ln5fSCX3+Sd7bZ2ceECjWUJ6xAA9XKNzOskQUfxNiR9NzHEcgfwSwZzUyLMYV/atmINSGXoKWXtMJHmKY6a6stA0/q9wnHiA/wvZ/gX1WjfaJJrtz8baQy8cDmdq5VmYPnpLohRwOf7Hmk0sgwc9KOWqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(261102123227099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261009223027099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rRJMX/i3fWSw9f0qRceuRFeOeUAuh5Jw7TjxBCjygySLfxI9QUGlTok1ScpAx+eal/lgHasTewvO2sdZhGyzV1rn1jewxRVr/FTL1ITZ8Cw1/9uuuVfBhMXvqluP2h1mDxyUD6sUCZEpYSGbOiq6HnFV8aYgGRVNmZ6+GFRgeB7Vl5RTG6yOlCVVmp3qtBS1UeX4g/9ky2gWH+RU/crsOLmwcUTebxEp6UACCC/6PqnKt2Lg4kZ2bVgJQihA76sV2p1wWMUkivblyXuuT+CgdGKIG2nTzLO4rsYaHKMPBiTmsMR6yOJLCZBydzuQpwaOypV69tUa2jtNR91wLjSjKgx4yeuOrdkyBCRaueMMsOf7VXpkleG/K66oXWf3twCej6qPvknSqHlC4gIEpNMZJ2Fe47VvOtWxJtOEQH7r0YuNbLwe8iO1cXhkQdz4GkO0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:54:41.0752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 299271e5-be7a-4efb-a76b-08df46556c37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000E8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mutter needs a pure 2.4 power curve. kms_colorop only tests 2.2.
These tests add 2.4, and 2.6 for completeness.

Tested on Navi 48.

The kernel patches for these curves are on the amd-gfx and dri-devel
mailing lists.

Harry Wentland (1):
  tests/kms_colorop: Add Gamma 2.4 and 2.6 tests

 lib/igt_color.c            | 20 +++++++++++++++++++
 lib/igt_color.h            |  4 ++++
 tests/kms_colorop.c        | 18 +++++++++++++++++
 tests/kms_colorop_helper.c | 40 ++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |  8 ++++++++
 5 files changed, 90 insertions(+)

-- 
2.56.1

