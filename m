Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E179FD29FAB
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 18:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E65510E9A6;
	Thu,  4 Dec 2025 18:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vmcp9yQI";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010060.outbound.protection.outlook.com
 [40.93.198.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4830610E9A6
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 18:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8YorM70S5ih54MEtoAYCsCFLEpNh8W9q3Qopnr87JadCHwQio9IgOnBtbcx9d5VY20slnUN5iAPf+FPo6GgcPE29rv7Wf4uFjt1gw419NHrZSNkUgvrjgMCX4+wEuaqpIyT4gW3U2mXOnsQzsiQGdYD+EQpZUzWQvdYBym+qg92Jp36E6JBdMA7oRqv9PCN7L8gYKi/t6SWRlgBc6+aWjXR/0/O1eVtfQiuUjaG8gvXJMKnaTmZhEuCJLPEQTyBrpM6Hetk8WfFGa4kdDWAy1KlZHdqdTxrHyTk+0wQjwjmNJxD3NRFYX6WmJgaIs06tvihZtqh5z6TUI5E77EEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZCXpZHFK2ofDJTTYSN+C1mpZJqkJ5LMuGvyvgisLfY=;
 b=RV48tl1xO3E8DMJxJwcTyE/gBYcjh1siBE1YtZsej6bjPjI1SAeXkXMc5iXrRs0j6VyLv9IUN84ZSZE8pqAsilcM8bVegj+TxhAo7ILWg1kxbDiAopPbwENznk18t5ZnouaS3urF17VIYewKLt6s0RyynMjOEZdevKi/f8u1sU9POsOWtZ1f/dGaUUMGLA6wAxdO54vZVPzyY8xZcIqCLbLjwbMqcP/FDSLrbPg7pYPmIyLHhSsR05uwb0d7AhuvuODqFi4nbK2xmfKXZRv6gU65j7OsW9O/DReTAwxoQmwNb3bVWYYEYBOwWuEYxz16Q34jjqWzX5CeOSaS37Q6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZCXpZHFK2ofDJTTYSN+C1mpZJqkJ5LMuGvyvgisLfY=;
 b=Vmcp9yQIMF0PTQ/0x1+Ufyytr8X7sUa/2zFVNET+eecuUSMO6seSRAGZ/dNh3c8BL4QLo9wnldqEWOZVsW2/GxYr7YrvqeaG8CS3Sor7UeGc6Q82UWiE8yYHAJtXI19vUmNgxPK22ocd45uIboLcBLicSJls8YAWZLWSw74EKqw=
Received: from PH8P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::16)
 by CH8PR12MB9814.namprd12.prod.outlook.com (2603:10b6:610:26b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:24:37 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:510:348:cafe::c5) by PH8P220CA0036.outlook.office365.com
 (2603:10b6:510:348::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Thu,
 4 Dec 2025 18:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Thu, 4 Dec 2025 18:24:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 4 Dec
 2025 12:24:35 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Dec
 2025 12:24:33 -0600
Received: from [10.4.12.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Dec 2025 10:24:33 -0800
Message-ID: <bac2cad2-9bf3-4691-90fa-f1dbae5f81c1@amd.com>
Date: Thu, 4 Dec 2025 13:24:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_bw: Correct skip message for mx pipe count
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
References: <20251204182034.307117-1-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20251204182034.307117-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|CH8PR12MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8defed-2742-47ba-a987-08de33626157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk9QOFZwVC9vRlBic3lGNzBoMXdjdVo5aXZpOFpjcXZaMno4L3A1L1JpVmZn?=
 =?utf-8?B?Y1lGN1JEdmswNUVxMTljdzJTWHR2b2hNdmlCM2xRMnQybHZNWnRzay83QmR5?=
 =?utf-8?B?aVJheU9yQktUOWpPNUJtR3psclNOYWVPL01KWERnakxSUDk0KzJTZlFkSDdC?=
 =?utf-8?B?ZW1IS3NpYUZDSWRmVzNaNVY1ZnA4Umkyc0VzSXpsVVVYYzQxSnBPYlFNRnkz?=
 =?utf-8?B?Q0QzSzR3eDRHWTFady9ScjA2Zmh3eHh4b3FlODFKQkp0R2RFbzM0bFY3OFlF?=
 =?utf-8?B?R3NDSE04UU11cGlyZ3RmNGZHekV0TmtiUmRIZUlqcUR3Y1plc2hpN0x5OEhy?=
 =?utf-8?B?cHNVSkZuOWdobmZHQ2JOTHQvaDdPaFNYbUVGUnB5cTg5aVZiMUNYYm00Qm9x?=
 =?utf-8?B?TXhBYWlkZWZKWi8va20yYzNXL0o4NWU0eXpNNXJUeWJwTU8zcWpTZzhIT0Zn?=
 =?utf-8?B?NEdJVFNkMkpmZ21FelAvQWh2Y3l0NTlCdU5ZeDRKay80QmNSK0RlTmhrU1Fo?=
 =?utf-8?B?RWtYUzBtRnJ5RWhCVzhRaTlPQWd0amFiODY1LzVVNHJtMXRxelJFWDA4MHhH?=
 =?utf-8?B?SVRDZ2ppN1FYMXgwazQ4d01sV216aDZ0cDJrdjl4NDRKS2NSbFdmbHRwV0tI?=
 =?utf-8?B?QWw4TmxqTHZ4YnJkMXEzQXdhSldGMlF1SFlCandlTjBkRmcrTEtvMElVNitY?=
 =?utf-8?B?MEoxenNTYXdWMG9nczJSVzFYbFgvb0ZzUjl0K0JBSTVwc3RxR2kyYk84ejY0?=
 =?utf-8?B?OUZlb1habnN2bGY4aWc4ME5KMkdLM3ZzTExQd2dmUFZwc3hJcElUYnVTVHFx?=
 =?utf-8?B?U2pzN0p0ZVdvWlpGeUdlUGVGYnkzUVRBTTFVNHp3NndEdDVobUNsWWYxeFJZ?=
 =?utf-8?B?WFN6M280U1kzT3NXMlVuUy8xdnhhOEZmT1FzTlVnbXZTamN0QWs1c1NxSHN1?=
 =?utf-8?B?WFNQRVNCUmZjSm5YTitQTUFpNmowdUtKWGtvcWZab1NtU09aOWhQckJFVjlV?=
 =?utf-8?B?VmJXa1V3NzAzUXpPZUpISHFzM2RxUGVTK1J4dDZFVlZNKzFweXk2d2MrUzM2?=
 =?utf-8?B?czhuMCtmWTlmcm5PdkNMcUZ2UVdnWFZ5OGw2M3JWOG55UzRPbkpxVGlKU1ox?=
 =?utf-8?B?NFc3V3ArTlpZVW9mbXZrbE1ZRC9iVnZOSHUxaGlGTVVmaTFicSt3TUt5cng0?=
 =?utf-8?B?Y2dvZzE2YmpoTG0yWnFkWnZKbGk2dDRkUFpXUS9BTkxGeFA2empqYVZrbG1J?=
 =?utf-8?B?MWY3MVNJVnlndXdNUWp0NU41aFZxQmZmRnFCaUY0L291aE84c1BYK0hLZ0RQ?=
 =?utf-8?B?SzljcU00Q0MrdFlHbENMWmlIYmRFcnNnaWdJWnAwb0E3U2xQeGFnSGdxMW9O?=
 =?utf-8?B?Q3pSeSsvNmdIbEljNm5QK0NRdXFxMkZWYWRnb0dhMTk2eFZXZXJpek9lT1Bi?=
 =?utf-8?B?T21GNGpBQkx5RGg2M01ONEZMSkJ4V2Jvc2xOTEJ3MXZTUUkrRy9tclZSMDV5?=
 =?utf-8?B?OUxEMEtCakt2VjNlOGtwbjh2VHh0cHJ0UFNGU0FwNXdsSFoyZzNRTTlRY08z?=
 =?utf-8?B?cUg2bllWcjk0dGJHeFVFRjU3VmVsZ0xZT0ZvelRUb0NKVWFBSzlJcnRaMVJE?=
 =?utf-8?B?M3BkTUxPdW8yY2xPZnRQeUlFOWJrWmxmTDJLSVJXem9vTXVDL2xXWXVKZjlN?=
 =?utf-8?B?aTBIQnhMNEZOZmtETGk3ZHpZRm1yZ0pZVWl1RWluWXA4dVpUUHRRay9OeDVT?=
 =?utf-8?B?RXlrV0FhcW43VW5RVXU2T1Bic05ST0t6NDVQRGF1U2Z4b2xEdzF1Yk1NYzNF?=
 =?utf-8?B?Mng5bVRqNEh1Qk9Wdm85MHY3ZFBNdnpFUUdmT1NSQ1FNVnUvSnBzZDJDcTc0?=
 =?utf-8?B?S2pPWFlSaGNoZ2ltZ29EMldyZXNvbTFlT3djMkFwLzd2L2FiQUFhL1NBamhX?=
 =?utf-8?B?WVdLdGU2TWVNbTQ3bUhwbHdONGMvYVVZcmRCdUtTMStzREdTRG0xZkZHTk16?=
 =?utf-8?B?aGgzaXVZelFSMHBDdnBlYTF4UmtYQVczb01BRHFieG9CN29yQlBnaGI1UWtL?=
 =?utf-8?B?L25nKzlkbWl0OExPWGUzd1JyNUhlNmtKWWZWMG9UNkRrMHIwOHAyZW5kUXFS?=
 =?utf-8?Q?fBT8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:24:36.5333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8defed-2742-47ba-a987-08de33626157
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9814
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



On 12/4/25 1:20 PM, Alex Hung wrote:
> "pipe" is zero-based so adding 1 to fix errors like:
> 
> Starting subtest: connected-linear-tiling-5-displays-1920x1080p
> ...
> Test requirement: !(pipe >= num_pipes)
> ASIC does not have 4 pipes
> Subtest connected-linear-tiling-5-displays-1920x1080p: SKIP (0.000s)
> 
> Fix spaceing errors in igt_skip_on_f too.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_bw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index ca05695d3..4ee5b0931 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -201,12 +201,12 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	for_each_pipe(display, p) num_pipes++;
>   
>   	igt_skip_on_f(pipe >= num_pipes,
> -                      "ASIC does not have %d pipes\n", pipe);
> +                      "ASIC does not have %d pipes\n", pipe + 1);
>   
>   	test_init(data, physical);
>   
>   	igt_skip_on_f(physical && pipe >= data->connected_outputs,
> -		      "Only %d connected need %d connected\n",data->connected_outputs, pipe+1);
> +		      "Only %d connected need %d connected\n", data->connected_outputs, pipe + 1);
>   
>   	/* create buffers */
>   	for (i = 0; i <= pipe; i++) {

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
