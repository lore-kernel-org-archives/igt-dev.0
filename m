Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A1CC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 14:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7A10E273;
	Thu, 15 Oct 2026 14:55:19 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010014.outbound.protection.outlook.com
 [52.101.193.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E14410E273
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 14:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJu2d+ZZ7uRu/f8TReN62OP+vPZJN6VbBmgCuMVymtAmEEzTBEhFcSpzhnLqew6B7d7F+dOycyrwlF2K/MdTSht/msV45UH8kuT93ca7msIZ/+o7SHaT+MyjzqF4VTkzuXlTwmhkO3WjVePFv75gjFoyZF33w2DXUhGVI+0GIFnjHbgStIR6inH6rlHgRrSIuiBx4BOoXVtpbP6T6Sl5JeAnlWen+E6b8wMQQp9g5ldlZdRDpPEtJFO2liAF26cYvUJ/VACQx5yyYCQO0eWoyH9FuuQRkEECOHGiYLjl7mHw9q9jSzObISSTwNj1NFm3yYsVUvr6wACK+blGVzdmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPui3xpObXmNyUMNAV1S9znVFQNdjeqH93gXZMkLPO0=;
 b=E8utTAGhnuIgCIpnAkbm9/rEKjCrEfn0ddtXvPsU9QcjMvzqmXomgY5Y2Vs8yfdgR/MI5qxgSXLEjdumkRgM1V52yr+cWNTY3ReSq1YW4J/TVW9+XIIbDi4HZCKWMtHRwOygVsMUxokVVCP40Yzk3afMGsvuTP5lniN2ct8/8hAh/kEkXRJMlyteh3UsQnHfB9bmM+4BLwG3cqGbxf6AqWO/HDRGVmal3gVqEQkpYb7RCXYA9GgG5ml2VbD5YIE8ftSm3PuD2qDcEk5RUvsbCl08570RNrWKZkvzY0X9nm3ZoxxkMLQRaIUpEC98TF+dtY8w+fROLZMp3fN9lnhGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPui3xpObXmNyUMNAV1S9znVFQNdjeqH93gXZMkLPO0=;
 b=pohNK88y1AP1lyvndNP0o9sXiFAzIQmEgDh/1CGj8d0Egx+UrIocKNSDFPyH2NQx7SwUxlfc1RCRDgw6Yv7tCoeOJOai2U/HOemtHEslBSmk6I4xsqqYVm0js0RMH/M5S9Fp5MTxjMxrX3FBZVkRw0n5DsPGovuBkJgDcWfGvdQ=
Received: from MW4PR03CA0180.namprd03.prod.outlook.com (2603:10b6:303:8d::35)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:54:14 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:8d:cafe::c) by MW4PR03CA0180.outlook.office365.com
 (2603:10b6:303:8d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 15
 Oct 2026 14:54:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 14:54:13 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 09:54:05 -0500
From: David Francis <David.Francis@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Tests for GEM_CHANGE_HANDLE (v2)
Date: Thu, 15 Oct 2026 10:53:54 -0400
Message-ID: <20261015145355.3972674-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b49b98-9a8a-4888-9dc5-08df2acc2d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|6133799003|18002099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: TS40+obZM0ozUXJRld9a883KPbb0PwFzQtY1QfOIoWCk/HAs/1nK6aCNU0zOzA/asPNWkdBNzwiqTedX+GvdSgdmFaPADgq3vH8D8tz6MbyfQ+vksl+3Jlr8Ivaswc6ALfmN6amTDYHeJg1pRmccUnRIcP6EexALneECEZ7jSNPonqYMFIbxcfOm9PezmRrJp2okeKh90nuEoPdYCQ1+vTuydRX9tI+nKTda+TZEcyPVjxYjSPQvCNF/Tmhgc5krXgYc7axm8dUZk2aFz3NBn+Qh8Q7LJpsTt7Spl8wLKGYt1AbgZNkmXxDOiojJ/h1xRZk6XycN28YXFx/g2ollWHwAjFu3qtn8HFTfzci4qXHdL0BYe6Lr7aJzQkT5pJZhLo2OCAvr9GL1s5jvpMYyzEmJLo4775zUyjUd34I63gQ5VBy+uTe9u11ZyEqvKMmVq/nbnAYhGzwhTYSYQXwh81tnZsOkPW0zvg0u+QUtATNfkG6zuFCkaudQ2USP87OnSZ7sqHOzdXLzuu92dzoNMPLRc3Nd0PMf1NWCg6C7q/6Qn5wHUTFufZddNmIBsuhMktOwSfRU3+03aYED2qLl+d4oxl5VbMS19MovNquUURVWaF9Y6FhLKO7HH6e0D/qfQCBns7o3qi6ShL4NdZe/If42hVdTKHkUpnwlNr2ob3ryp/N3EXpeYQAhchorZh/02S3ODS6Rk1ODc70nbYBDvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yaumXotCCfAAIYarDXYQI0Y5oiA7M8KXp/IxWZb2ZvelW2s8/ySKlLcrRcckU4X5A6aANkUnaAxAHr4iXs83u9uTRL0bMgfJuIWA0jRhhg2do7KUGbeoPuFAkMMYW7w3Y8G2QzSLEqz/q3Hn9tYQix8UewKMifPdLeD0mvKSwNZB4zByKTQM9G8YHu7AzSDMLmnYPukiiNh5NnU8gJ1g1nMpmOJx1xyUn4rNOWMZ6oLU93Cgjv3S6QrwpAorFMKvx19TAirPG4vipiXuG1TIiIHST+iT7NxRFv1k7YMBC8MfP+p1tbUH7BqW0YNyMqadwN6xoYFbNRfjCBm8oXPir04riv6gdNek9cwPKOPdGzl5h7/8luyP9wEpWMUO8xEiY4xiRIw6VF0mce24JqaCU65pLBVRehj7NjSkHB08epirCIbvBaLAwXg+P9A9pe4b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:54:13.3740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b49b98-9a8a-4888-9dc5-08df2acc2d93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
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

v2 of the tests for GEM_CHANGE_HANDLE, with minor changes as suggested
by Sebastian Brzezinka.

These changes are meant to accompany kernel change
[PATCH v2] drm/gem: Fix and enable CHANGE_HANDLE
on dri-devel mailing list

And CRIU change
plugins/amdgpu: Don't change gem handles to themself
on my CRIU branch
https://github.com/fdavid-amd/criu/tree/amdgpu-no-change-self
(necessary because the kernel change slightly modifies the interface)


