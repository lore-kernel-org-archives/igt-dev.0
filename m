Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645F7D6CFA1
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 19:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425810EA60;
	Thu, 22 Jan 2026 19:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EluJivaX";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013010.outbound.protection.outlook.com
 [40.107.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCF110EA60
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 19:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnVzuMSwyZ6NOKMghzpankeDjrYUG9hMe0F42UnwWx93ak8qsTfP9nanEPobrFnJeSwlm6Ou/sI0/+ztHIRuTYz5VBeAIXFHwTuuihEBQgKtz4WPWII0KpAYYZ3A7vfZDPVz4QlDEqCthUaO2viB/JufFE93yE16TyeyK4LiPl/CYHgLCTdERNa4Aws7M7Ze7RnGPb0ZHs/foUE8UcslIfqUMOdUybo4di3j2Eo2dGGTRlq1WgXpJeIIqhzxaeWaUiKEIFwA/m/mUHG/NudkFfU5rctQiG8NYA1v6dUxWCAtvaxT3a2RSNdyExKLqPdcRizExKeEguQ5HKOfK18hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHP+s+QLsAcxFBp+UyFqybP561lCdq1Zi9SlyHt5GMc=;
 b=GaYpQeQkpIOgV0QWm7UFDhukq0nTKvT25M+NQ3lSgsQ4l5lXWZakKXWmQ+0hD0B9S4KLAZI5P4WOCQEI0Pq+0W8aQxStqq7OFYsXGnP/aok4tXFHzfGD+LW04kpEaez6eH0X0lrTvoLB0PUjFxlHZKdJQK1YEoKiuSr+phxu9R4I/FVcVvo1xbQVUj2la5MIQ9NXX1Mw1UmzzGF5Eln0CC+W61mlnvm50uVVS7XXsjgBFNhx6wlD55ZMjJNKBD6irLgQX1nFcjkq8e5+00EgLwhdTU4ILK7qph8teg0qX1bwmioBAo80FWjGjhQxWVwJrH6Z1dVgT+ie6bsumzHczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHP+s+QLsAcxFBp+UyFqybP561lCdq1Zi9SlyHt5GMc=;
 b=EluJivaXew/Ljyst9OQgBcgDfX2LBBcNpiaiASWL9f9Pke9N15XX9cdKZotLHjGkYdQ+Fy0oPiDjw9mfoAWFwMcgmoiXbFD6aynnGhqAsi5bzHKlrJSuvjdJ5eumbATs+S/EIouw1/gTsTy3Cx8Jy969WorRvIgq2TMXPzjfAkg=
Received: from SJ0PR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:33b::34)
 by SA5PPF9BB0D8619.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 19:32:19 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::88) by SJ0PR05CA0029.outlook.office365.com
 (2603:10b6:a03:33b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 19:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 19:32:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 13:16:44 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 13:16:44 -0600
Received: from [10.4.12.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 22 Jan 2026 13:16:43 -0600
Message-ID: <df577f4c-86c1-44b8-9a7c-1179a6c20be2@amd.com>
Date: Thu, 22 Jan 2026 14:16:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] README: Update oneliner build command for igt_runner
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>
References: <20260122170901.644692-1-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20260122170901.644692-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|SA5PPF9BB0D8619:EE_
X-MS-Office365-Filtering-Correlation-Id: ab80c348-2dce-4495-6faa-08de59ecf4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zit2NGhTSnRvb0llOXo0YWxFNDduVFFGVjlKV2UyRHpNSnVYZ2x0QmxqaXF4?=
 =?utf-8?B?S1dXOHBaVnIyeVQvWGlCM1pBWSttd0FVRjMzaG0xUDY0NWUyVWhjOUd4dHdQ?=
 =?utf-8?B?dElzRis5RTVlNVV4RXNMb28wMVhyR29HYUJMd0dxcEhuV3N5VURpWHlpWEJU?=
 =?utf-8?B?SEE3N3RlOHlWYlhydEt2UkY4L3V6YTJJai9SbEhVbzVOTjNOajV2WCsxb2tU?=
 =?utf-8?B?RnJBclo5L08vcC9MR2thZDFIQ2xCN25wSnNYK2dXdHpCWjJrMFQ2WVd2Ny9r?=
 =?utf-8?B?K3FWMVhBVk1CVXNhdk00YWthVy9jNG1vZGlIVXN2K3RXZ3BHUTl0MGdkdmQ1?=
 =?utf-8?B?YlVUcThGbTB6MjhZU1pjZWZ3bThDY3ZGMlpnSC9OWEJsWUFPQ2MyR2lVT1JS?=
 =?utf-8?B?NDlyWmF6RklSWURaaTg2OVhyVmd4b1REVFUwR2dOSnFiNnVoV3hQYkVYMUhC?=
 =?utf-8?B?a0FiUEJ6bG95YTNEclRERXRMak1abitqNGRQTzRkekxJVWFIMFhZdjRtMHZU?=
 =?utf-8?B?aXRnL3N6ajdLQ1JxTzlFTHJXY21aV0w2dGZqTThuSWEzdm40SUw3cUZLYlJK?=
 =?utf-8?B?ZlFKbkpyNERNdFdzMDExWS91Zm5oWk42UXhma1RmMFNiUTBjZzYzMTRVWVpH?=
 =?utf-8?B?bFFMbXNPM2pQNE11WUI2OGxKZzhxSFh5blpaUlp2WVptRy84VVk0WCsreXVB?=
 =?utf-8?B?cDZKOWx1a2lOSDgzRHBvTTU1cTV3V2h5eFFoYmtzTjdYZ2xkU3NKVGd2Z2tv?=
 =?utf-8?B?Q3dvNXFsRVZtQXZvR2NJOEhGZ284cG5FeGZjVnFYbVJjUFgxeDhkSS83Z0xj?=
 =?utf-8?B?MXU0VnFPbng5VmNXWm1XL2t3UnVMc3RndGZDL05USVhLb2V3WjUrazRCQ1M2?=
 =?utf-8?B?WFB6Z1JLTG1CRmlVUWxMaWcwNFZrWC9ib2swYnNrRGhPUVFmSzVsd0ZLa01T?=
 =?utf-8?B?Mml5cGlMT0lpSnE4MTA2ZUZMbGtuUVd5dWFlWTdTdm5XRVJkTjJBR2ZReERm?=
 =?utf-8?B?SjRHclU4RExmd3lCY3N0WG83aEowT0xjNnpLT3Y1L3dpa0FUZktxRmJCVTJX?=
 =?utf-8?B?S3l4cDh3VFZwSGJEcVZYUVdOZlZiNC8rNUJlcHNZb3RHTGpwTVhKWURHeHZv?=
 =?utf-8?B?Q0tMcVZTY1RpRW5aZERieUJGVzBHVXlaK0VOY05FSUQrK3h3eHlVbGsycmc2?=
 =?utf-8?B?QU9BU2UvZjBjTmZYR3pHWGQrTEZXV1haOUwwOG9WMDQvNHIzYmd1R0lpVGp5?=
 =?utf-8?B?VDl6MEVmcWEyRnBlcmJKQUViM0s0VFp6UThhL2dpTklJWWRqYVZyekZ0Z2ZO?=
 =?utf-8?B?K05DK016RjhMOEx4VFR2Z1Fpak1ieHp3L3VyMjFkSWRQem5RckIrOTN3YTM3?=
 =?utf-8?B?cWJDbGtseUNmVnhBRG55TzRrYXRwdUlidy94UkVqRTlvL3lXYVErTnMvM090?=
 =?utf-8?B?MmEwdW1RZnlBank5Ylp6dksvc243dFJVMDFZcEdnRGJ6VU93R2hodkpZYURk?=
 =?utf-8?B?MTdVUkNTTTVXKzFJcVJsZHpESy9pRitsN0lQeTQxdjMxenkzWnVXY1ZqaWcv?=
 =?utf-8?B?MUt2eWZud0JsMFFzc2k1bVNjOXZUT3ljb0RIdXRYRG1Pd0g1MzZ0aktjQ1Y1?=
 =?utf-8?B?cWdDTS9uTFdWVU56Z05IT3ZCQlc1eHBQUzl3V2M1MXlPQVF0NXJqU0FCNnhN?=
 =?utf-8?B?UkJRSm1CYVNvUHRpaGxSVHRBRlBHTWxjQTlWU3Vsd29aNUZLSjZGUU5TNm9o?=
 =?utf-8?B?K2ZBY2IzT0krRlBMVWJpQlk5ZURDYWVPbk1wQndCUFdaMTNLK3duYVZoeWNY?=
 =?utf-8?B?UG9qZkVvdnBvUVpucWVHRk43eEhBR3A0WjQ0WVplVXR2cW41aXZENG5YaE5P?=
 =?utf-8?B?UnFVL3VacG1sWkVaMU83YXlLQlIxY1IwenRPQWZkUU43My9SU2VDcHdsY1hk?=
 =?utf-8?B?S3VuMUVld05TTWVnbjN3K1lwdG9HOU1JaDRseXRpQ29VVlNTQWl1ZE53S1Fo?=
 =?utf-8?B?Q3hHOWxWSmRiRVRxNnIxUW5PbDR5RzhGc20rbFVKejgzV0FZMHUwekdibTZu?=
 =?utf-8?B?YUFkRGZrcWpLVTcwcmg3aUdxbVY4dndWREtNWWJhM01QdEtFZ3NHRE5mTWRv?=
 =?utf-8?B?cUdFaGsxdjFoOFhYbTU5NTVackcyZC9QWEFIZ0xERTN2b1RQMzhvaXZISVlv?=
 =?utf-8?B?MVhSWndJd3p6VlZpb2Y3NjcybVMvZUwxL0xSZW1tb1F1bldDTUprSm5DVE9O?=
 =?utf-8?B?YkFnS0FNdFNoUDhRNUZhNGpVempBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:32:18.7386 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab80c348-2dce-4495-6faa-08de59ecf4e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9BB0D8619
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



On 1/22/26 12:09 PM, Alex Hung wrote:
> This fixes the following warning:
> 
> WARNING: Running the setup command as `meson [options]` instead of
> `meson setup [options]` is ambiguous and deprecated.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   README.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index c0382ce43..b4b9a37ea 100644
> --- a/README.md
> +++ b/README.md
> @@ -88,7 +88,7 @@ running.
>   The test suite can be run using the `run-tests.sh` script available in the
>   `scripts/` directory. To use it make sure that `igt_runner` is built, e.g.:
>   
> -    meson -Drunner=enabled build && ninja -C build
> +    meson setup -Drunner=enabled build && ninja -C build
>   
>   `run-tests.sh` has options for filtering and excluding tests from test
>   runs:

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
