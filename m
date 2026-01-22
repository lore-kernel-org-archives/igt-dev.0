Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF51BD6CFA1
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 19:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A05510EA5A;
	Thu, 22 Jan 2026 19:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4cJCLhMn";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010043.outbound.protection.outlook.com [52.101.61.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241B310EA5A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 19:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAZHu68/W3vPJvXROO0LhB/Oqiw2i9UrjEcFwckfzzLbgR9+K2R5kGxndhJmwusDLy0V9QKJFxQp5NN1fD1zYrO6CIniqOBhxho5fIiWkIIFmCo6A0NI0oVYJIhfffH01G4FMmPQq8foileup775X6B/eRKHMRK3OBXrFBzqlbFnjZF898zDMt6ToPrMKRgq6F/R5ANzamAq8fv59+shsg3qvH84DCeI3oJ+WSx4QnbiRV3rrmgA11+SPXmrpbUo7Sep6kFBsf58Ad0ql5YOWq6aaDVmXfm9cTcmQbwXQuCIb5SvDDt00iXeTCaKpho3iCVk6wpkSd287CwRfwlioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JODbNk2u2qZdzJFvNL1aVoiZI6hbsEjEjSF5TVYVEYA=;
 b=N2YSBRukj3etE5jR+y32y+u8vNCmtF4E5BTbQA4q4R8wTw3plTQnQaCSPrpws0QFXs0GHZzUwuxERY+XJ77CWn7G27vgIn2aDvbwRRA/zs416jSmFvYWyB/sBEtXxT4JiV7wzoRWAgUEbc/2TT+KD/0PXmxdmj0obA+YGqbDrI7v7GpnPKou8/VGWQlcQdDL0P3o9Id6JkyEuZxFA6YD0Xg+i8O+aoPh1RahzZ9g+csxombQKMagp1yorrdxaxGQUxXQXqjH/QQE8P2d09bfPWulEywBRO8dPW9Gt2j4GjdqxLYPcFK1oBQ+1cLFs9vlk1GC+cRgeqpoLn7a+oSaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JODbNk2u2qZdzJFvNL1aVoiZI6hbsEjEjSF5TVYVEYA=;
 b=4cJCLhMnj68t6qoK9ZJH6hIskvxJ4bblUym8H7Vrl30RtnH6UhQY7b+v6LgKY20GmrK3MfVk+isNWy5gO0uIQvaW/ovWmNpnampPGkJuXTU/gJLLgPh42bTfZleMCUTdpMkvDPX1Lem32dpZ7gHGpvSuRKuvfRBGaietjaAz8Cg=
Received: from PH7PR10CA0001.namprd10.prod.outlook.com (2603:10b6:510:23d::23)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 19:22:10 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::70) by PH7PR10CA0001.outlook.office365.com
 (2603:10b6:510:23d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 19:22:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 19:22:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 13:17:06 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 11:17:05 -0800
Received: from [10.4.12.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 22 Jan 2026 13:17:05 -0600
Message-ID: <0ace9930-4a61-42e4-9faa-0a1899f0160c@amd.com>
Date: Thu, 22 Jan 2026 14:17:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_atomic: Fix overflow in immutable-zpos
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <Daniel.Wheeler@amd.com>
References: <20260122002006.572719-1-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20260122002006.572719-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 76656794-2c04-4e44-3345-08de59eb89fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3pSNTVtUWNENkFVQUczcS90VlA1MHpaT3ZNRUdmT292MTdWeDVDUk9mczBq?=
 =?utf-8?B?V3d1YzBaZVRUWE1YV3dFbEtTbU9COFNjL3pVNkhvZUFidjV3eFBHMUZ0VGJo?=
 =?utf-8?B?SnB0NFVXUmswOEVsTWx5QjIzTkxSak1qaUhTb1kvWksxWjRuUUJNemJBYlAv?=
 =?utf-8?B?UEpDRVZIYWM2YmQ5VWlQTXVpejJOd0NoTXF3Z0xoeDYydTNmMGlJTUtHTllU?=
 =?utf-8?B?d0tPVTMwc0NpbjM5UHNEZzZQZXFnbEx6UjBVQ1hsbkdJVThtNVc0ZlNuTUpL?=
 =?utf-8?B?SXRGRUxYZjloVUF3Q1kyVStLM01hbjBmVjNXMDlHZ0Q3Q3FOcWNGR2Zha3dH?=
 =?utf-8?B?T3FvUHBmZWlqVitpWGVGL1BTUlZxYU9rZkQ1OXVlZW9oZHBMTHdmS21LaEZI?=
 =?utf-8?B?dmt6MEo2RWVGS1BNNzFDWVNXMWx2cC82WDBHSlRkZlQ5N25lMjVMMjJaRzFL?=
 =?utf-8?B?ZFhoalhrT2NvR1JaWXFmRkJ2VTZYdlo0TEVFejcyN0twY2JXV0VjaHR1MTdN?=
 =?utf-8?B?Q1ZkSURyU2RORnR1azc0NWRqZ1UwRmw1VHoyZHdKaURtV1F1bUp0c0JlZzBP?=
 =?utf-8?B?cHNoa0x4ZDREUUl3NVpqcCtRVGF5c2REd2hwZWhqK3FWeEEvN2RLMkhmVzZF?=
 =?utf-8?B?MHpoMjg4QUJwMEw2aCt5aS9JOHFBY0oyZDdIQ0xYcnBGUGcxa05RbnMvaFRW?=
 =?utf-8?B?THM1b3IzMGh1eVNzb0pnaVBLU3RsOTlaZTllREVIVy83VjRBeUJMNTRFN3h2?=
 =?utf-8?B?UHp6YVFmbWVRQW9ZSWlpTmIwMjFrVTJ5THJlQUJqT3VYREdKUFhJVXZEejln?=
 =?utf-8?B?a1VabVMvSUdhVmpUYUFMVEZEZXh5T3JZSm9HU3pjODFvTFRrZHM4a0oySWo5?=
 =?utf-8?B?VGlDNyt5WERQOUJvUzJhKzk1UnQ4N0lEaWpPclozZUI1OEV0YkM4NXhFVDJp?=
 =?utf-8?B?bUdrS1ZCUmo5YUdSNnVJNWFRWjV1d0VJS0R1cmlqZVdNajg4YjNtQ2RJR1J0?=
 =?utf-8?B?ZzZXM21tazZwNHhKWnBNQmJGcnYzMmk4Qis4UFhDY0g3anozNUVMVCtvTENs?=
 =?utf-8?B?WHRwZmdhMnIwd1ZnV0NKS05zOWVvVmpsUW1GYWltYnNieUpyQkJLWitvblFn?=
 =?utf-8?B?VFQrdFpHd3VFRWNqMm1LYkVOT1I2aklubTk4UFZweEU2UkZKbWxvWk56VXZC?=
 =?utf-8?B?M2xrbDJFN2UzeWVVTWpua2pETVpPQ0Z3V3Rkem1jcjg5c2xrVEQxYXFoUXVZ?=
 =?utf-8?B?RmhYZHhreHNJd2NWbXlnVDdFa2w3UDNUZlAvWFJWT1g4cXIrN0w3WnlaN3E1?=
 =?utf-8?B?bTVCSkNMMU53UVhzUWRSR0ZiOTZCVnNWcWY0N3JldDVPMG5rVFdOaVowcUlB?=
 =?utf-8?B?SlhaTUY1d0JxVXJBT0M5TlpZNlVrdHRYcEM4ZkJXZXBxc2U5YXZ4VXQ1ajVx?=
 =?utf-8?B?dTlrR3ZUbkJsWHpYeVU5REphQmVKbkxGNEsxdUgvTWorbVA4WkVDUnhHOU1p?=
 =?utf-8?B?NG9lQ3ptdXhpT2lwdCs0dzRNZlp3YXlSTHptQTNhWXlDTmdwVjJCMVVoaHdN?=
 =?utf-8?B?UGpqUlZNTDZCSXpPWGhoc0RVRUNtY2F4RCtQWm9KSWdWZ1lkcXdNTEMyRHBE?=
 =?utf-8?B?ZkVUOFNMNVR6TWJ6S0Qxc2ZvQm5KTnYrVktMNEd5RVErK2kzRGVadWdqSVZo?=
 =?utf-8?B?VjBNQ3dVdnlCUHgwNnkwSzNteURuYzlxRHNwQlhZYzVPUmxDSmdxcm9WNkdu?=
 =?utf-8?B?dldTWk5YYzUzdzA5cDRPRFFjdDhWNmNRRnNtT3RlVVdIbk1TeTBNRlhUMThs?=
 =?utf-8?B?aVIzVVB5Q2dpdFVDWFVqemx6eUVJRkhCR3NWTzNMUG9seHFpZ2Jqb09KVlFM?=
 =?utf-8?B?VUl0YUt5NFM3d2s3YndST09nMnYyUzRHSTd5UXc5REZhT08rRUlGdExNR1hM?=
 =?utf-8?B?aWpGZUZSVEdnS3JEMGg5Z2RHVVNEV0dtTmJpV1ZEQS8zRm42VVdjSnprdHdz?=
 =?utf-8?B?c2JxeUI4SkZzQWRvcmVhdzgxQjRCU1lJQkZDbDQxS3RWNHZkbGtqNFMrSG4v?=
 =?utf-8?B?VFlobVhQMlBkbGdrRVZMZEQ2UzlPR0VlNm9JSjFVSkJhZzg3VXpRM0ZxbUF3?=
 =?utf-8?B?M2prTmQxVkdqc2dKTXhEdzQrbzVON2VXcWk5akRFS2NSejJaR2NFd0wxRXVQ?=
 =?utf-8?B?RGg2WWc5Qzk0YUxuQ0lDSW80VXJmZnIxb25JQnNHWGk4QkhldE5oY0V6Nm5J?=
 =?utf-8?B?bEpKWnJzcnZNc3VSTEJtZko3ZHN3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:22:09.9709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76656794-2c04-4e44-3345-08de59eb89fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656
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



On 1/21/26 7:20 PM, Alex Hung wrote:
> [WHAT]
> zpos can be greater than n_planes so checking it before assigning to
> plane_ptr[zpos] is necssary.
> 
> The overflow can cause w_lower and h_lower to be corrupted such as
> w_lower=3840/h_lower=2160 -> w_lower=88491792/h_lower=88491288
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_atomic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 58d57cafe..4614301c3 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -494,8 +494,8 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
>   			continue;
>   
>   		zpos = igt_plane_get_prop(temp, IGT_PLANE_ZPOS);
> -
> -		plane_ptr[zpos] = temp;
> +		if (zpos >= 0 && zpos < n_planes)
> +			plane_ptr[zpos] = temp;
>   	}
>   
>   	fb_id_lower = igt_create_color_fb(data->drm_fd,

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
