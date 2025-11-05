Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A60CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 22:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A331910E0F7;
	Wed,  5 Nov 2025 22:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R08l50rP";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60EF10E0F7
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 22:16:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfxvVc0VHxLfpdCPPewmRY2nSuKBxB6IdaSB8TKFCTihs0ajgs1ez+8m8QbRrlxNqgDI+vopT/BP6i6bqULFbHFVdYfxhtYy4UvDIYZdOp3zRaCKbmoCcAXHUB4sJHnOXMEiGnLRojob6XcRyKv6qhVCDExGmfRqY31hHlo2HV0BMzKFObMrtMZRt6K4HpgFsBXW6EYnQd1QQ5Pe0oWtobhL9TCrCf8XUNvYLmn4Kpy1qiSsDB87npMwLAekdRX5ooBTS8NOdvFWFp3NDEpqjOeP+9LIuhbyBamSVqwvQaUfPA5owmbKL0WMXkzEk39QODeKOFRrT/tb8GsTmwrQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/3icdIoQWjHX7QaMXGALr5lP10VYI0sa7D6yLP13vM=;
 b=Iu0mI3QpptRZT1loQcHvDDw0y4om/WDjkXj9Pk+uHvlzarqgBzoUtFsFyilaSsxKQbzjXtOuDJYIH9iRv+B+OAAqeLzFrlAHQrsQwpIYMtxeWrRo30mluW+K1bpUIR26WwBDN568p0UgIK8zurwGAG7cXPjp9ry9c8ojINZOe7BQpu0CLQXTyZF69YFAqU43f1vBrQjW9VXEeGratSQkP965tnPwEc94XqnyseRQo8ZNkrCyuPEKQupIfjbHHb0wJN6aXI0lS9kOqGawIHrvpoy0PRap1D3qBBiyk+UVbmII2CkdrsoOhSqRJneCD9zlNLPt3JjtHpLszvPmTQMHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/3icdIoQWjHX7QaMXGALr5lP10VYI0sa7D6yLP13vM=;
 b=R08l50rPmo9HuG1E2LrPIoPFeHBucvgqxgVR9pI4Q/9zCAcUvm9bB6fFU3KR4dDMq0tU+ktMYa6dF65bIkN3rzW5aGmcv5S24w0OMAjWkbmpAB29c8nKqFSAjGJ6DFPP01RiENjg08AK6blnZ4SDD6pnmk6kM8uxrr5OVc4LgPE=
Received: from SJ2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:a03:505::29)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 22:16:46 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::7e) by SJ2PR07CA0005.outlook.office365.com
 (2603:10b6:a03:505::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 22:16:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 22:16:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 14:16:43 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 14:16:42 -0800
Received: from [10.254.40.35] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Nov 2025 14:16:42 -0800
Message-ID: <9c2d8afd-8283-4226-8c7f-b8d4daae530e@amd.com>
Date: Wed, 5 Nov 2025 17:16:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 32/32] tests/kms_colorop: Add Gamma 2.2 tests for 1D
 Curves
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-33-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20251030042801.2315866-33-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa0c986-a471-4461-ebe5-08de1cb901ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|42112799006|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHFiTXp0YWRiTHBzOTY4YzAwT0pVZnpRUE85enBDMlBSaHZJZTZzMEljUkwr?=
 =?utf-8?B?MVo5dkVaVEpraGpFaEx5RnFzVGN3OHVlMXhuYmhxamx4M29IcEZFNTNYSGIw?=
 =?utf-8?B?blJ3Mng0NEV1NERUcCthS0J2T0FDOWFXUDNBc0JxS2luN1ZCUFRzRThrWlIy?=
 =?utf-8?B?RVhuSXNkckNtUTJhaEhReTNHaEJ6TldYWTQzUkQ1VEJER2JCaDI4cExtbnlw?=
 =?utf-8?B?QXlDS1FSUEx2TWlWVWJ2dzN4MDBTR1BSQmJZaDZvTWZoS0oyU3haQ0g0dFNE?=
 =?utf-8?B?bGRsZHM3Nk51d2R6YzE1VGNGbUZaU1ZzaEc3Sm1jakNLSkFhOXdxajRLZjh0?=
 =?utf-8?B?M3N3Q2xtY2U0VCtQcmJsckVhTFNMaFo1SVkvM3pqTEtWUGw1K082RXhKcEZP?=
 =?utf-8?B?Uyt0YnhIeFhnTG9iTE5VWUVOdlM1U2RJRUMxSUdxYVVPUmNhNkc2blRvT2px?=
 =?utf-8?B?bENqMDl0RlJEQ1ZCZEVxUHRubE9sZ0tNVWRVZ3hjelR2MVRIQk4yY3Iyd0FW?=
 =?utf-8?B?YVQ0MlNNRFo2THZvSE1LU3hrRExZSUpoL1o2UGV6NFFhNUJSY0p0ay9rV2k2?=
 =?utf-8?B?bndRa2FXMGxvak1WVVlIOVVWdzBUS3orWUw3TTA0OFVpTytGTUpBd3JQcGJy?=
 =?utf-8?B?Z1YzbzVKR2o4aDd5MTgzdk92WXhFVW4xSnRzTFJNNFM4YUN4OUxpUW5lWjdC?=
 =?utf-8?B?NHZVQ005ckE1OUNEYmJGZzQyaXRUUE9nOXlweWtJVmUvMS91MGtkYmRDTkF6?=
 =?utf-8?B?Zmlza256NnlDSW1qbnBsWkVyd3JIWkVKM3BhYjBBTHc2UEQ3cG1QUEFpYW1Y?=
 =?utf-8?B?dFlwRWxwbXdzYUR0eGxJazFWZHF2TEQ1aWd1cE5EeVIvODZYK05JOEFFZVdY?=
 =?utf-8?B?clpqekNnbWxoZEFneWhkZC9kL1ZaeTdzTXJkT2hmWXc4QVZiUmQ5R3l2dkFC?=
 =?utf-8?B?YTM3NGY4d0ZXUUViUlBEL0VTN1BYVUNETHJld3FFb1VQSDNQSm9DYmFxdU9i?=
 =?utf-8?B?c2hWOFlWdlBBd2ZmYWdlTkNkcm53djZ3TThINGJtS0NyS0JjNGhMMHpYa3cy?=
 =?utf-8?B?WDRBUXhHeFcxdzdWbkhmWHAwV3lHVmUzUDlaMG1nK253THJIeVBEdWttd3cx?=
 =?utf-8?B?MXZCeUhQWFVGcE4wMGhNMjNPYjE5UGlzaXY3VW11TVUrdjZjYlNmS1Z4SDQ4?=
 =?utf-8?B?dW10WitCUW5sOXVGdjVHenNZRk9sY3BUR0htSmEvQTlxTWNYci91VWs4aXVz?=
 =?utf-8?B?NTlvekJ3czJoWllCbmUydXNrVEpTbnpLWWV2ditjVWx5cWIvdnA5SER0YW9v?=
 =?utf-8?B?eUZKVWpBeG5oZ0RjWjRQaWNqM2Z4MFhmZk1qeVpRK1JUTlRoTGdsak05Skhu?=
 =?utf-8?B?ajA3S0VvajBDRFlwa0Y4aHdxMk1Hbi8zdi9xN0M0Wk45eHRvRnNSR2ZLQjNz?=
 =?utf-8?B?L2xtQlJtdGh5NFNKM25sOVM3UWNwbExMbkRNVWpaQU5qbW9MSTRpQzJ2NlJq?=
 =?utf-8?B?U0hLT3RDbFJOVTdWcnBZUDVPd1VUaGZGRW9BK00rNlpqQzlqUTZ3VzlqOFZJ?=
 =?utf-8?B?d0RIUWpxK25vaDhjS3J0bFRHMmlaV2NyMklnTG1Zb1puUHJhTFpTZE1XVG5i?=
 =?utf-8?B?a1FLYUxQKzMvWVZFNG1hNUZKMjU1UnQyV0h0TW1aVFk5OFRWWDIyZldzeWt6?=
 =?utf-8?B?bS9iUUQ0OGh1eFlNZ1JZWGgwNkl2M1U4QUxUbzh1R1RhcXFsNGtoQm42blNU?=
 =?utf-8?B?Y2ZzMDNNYTdwazlKUXFwZEVzUEEyWFY0cVZQS3NVcUg1YlNGWjJRV2d5Z0NS?=
 =?utf-8?B?L0t0ZDU4cWQ0dy8yVi9QbHk4WkNkUHE2WHR5MWU0MFBFY3V0Z05kdHJHeHVv?=
 =?utf-8?B?ZWlqWlNTZGt2WE51aXh6SCtxVjVTRlZsV3ExcVU3REplZUw0cGlweDQ1azJP?=
 =?utf-8?B?MDYyU0x3emphendyc0VWT2pwajJ3NWszWFRQd2l1NkJJa3R3ZmVFSnpCTWdo?=
 =?utf-8?B?cDdkbFhNZm8rSjNMOE43alc4RDdqbzMwTy9qV2lBbG9kMHkveUFaZ0pRWlNR?=
 =?utf-8?B?em8rcVA0dEpNb1d4L09BWmU0UFlBK3BoenRyZEpRVktPTU5YWVllR3N5M2dN?=
 =?utf-8?Q?vINU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(42112799006)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 22:16:45.6673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa0c986-a471-4461-ebe5-08de1cb901ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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



On 2025-10-30 00:28, Alex Hung wrote:
> + * @gamma_2_2_inv: Gamma 2.2 Inverse
> + * @gamma_2_2_inv-gamma_2_2: Gamma 2.2 Inverse -> Gamma 2.2
> + * @gamma_2_2_inv-gamma_2_2-gamma_2_2_inv: Gamma 2.2 Inverse -> Gamma 2.2 -> Gamma 2.2 Inverse

Would it be clearer to denote that these are oetfs in the test name?
- Leo
