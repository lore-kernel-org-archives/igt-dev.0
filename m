Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D43C531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 06:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F14410E0F4;
	Sat, 25 Jul 2026 06:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CcyAisfX";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013025.outbound.protection.outlook.com
 [40.93.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E818010E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 06:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzK+E1UdmDmsv5sDZ27kTYfjXTQrGdzHTjPunXrP+srP66UknbjxMSIVHGBR0JitkXUhNIYFHNZ5AyB4c2i6s+XqWCrd7exJnP3AkvwKwWrQnF6fJKqX7gwXzpgOcVnbh4prKhpFwMWiDmn1xBQNA1jdw9yZLVVe+se7evl84tyiuydhxadZvM5rpBPdwPXr77+o0hQOHOAYctctVUa0a8xEdGTkuZzntT9bcmSuXzxHDO1LChIoTjS02s3UFb+G2yMrKfq3EqX3vHYHhesj+N7xoWmBoofCuznV5zsxkhcxvmu7L9wvyzbVVoZlTAADp8mI6Uct5qQsQ3FhhzjVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Qm/quoRs1PEBXX4sv5jd9hSTaaxzSHFGXYlOCeZfTw=;
 b=AfpGYkKJahUcOKXTvanMh/U9dHjl+RTKXkkJUFDoCwKaW9/uokGH/sBOrcDi/8VnC8y/P70/p5gmAcIm/tVe4ZP0elT2g/JmZBp7ovGIBpbozz6SbKSJHhLDbiZjVECfEyycaabcOVw3X8SR12N1zULAnBtph3a5G1BgJwnj3vcWdhcT8+130+kKlZi44KQe5IovMwJzlYDYQMgMTKl/hXe86R1Wjw2ZISwkhP9KYS8bTe69ehvGzbEUy0X8dSaBef2+cU3pwMCsKRaGYUuhzT1dDhSKI7pea9o8ph4Lpp1YLhIRS35ewN1S5ziZ7I9qdVJD6OjLVW4hHwtKy6pW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Qm/quoRs1PEBXX4sv5jd9hSTaaxzSHFGXYlOCeZfTw=;
 b=CcyAisfX7Bd6hSi4UTWcIimbQfnbZvX341FsDy3axeYEBvDhjCkDhI7rPpL73a9jRq1251Jp5TR8P209WORxY24lmeZ3e1xLCv4iEuWtMMOz3COPo7J83ms8ta9MvYiLYKHhbe9LhqpbsSjKaHr6pGUJKZXni3YXx0WPQO4YgE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 06:56:27 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 06:56:27 +0000
Message-ID: <e4dcc6bd-95ff-468c-9431-cbbcf0436ccc@amd.com>
Date: Sat, 25 Jul 2026 00:56:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] lib/igt_kms: Add IGT_COLOROP_FIXED_MATRIX
 property
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-3-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-3-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:303:b6::30) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: ebef6b45-ed7b-43af-0d32-08deea19d933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: U3iu41YCV+Mcq0WoYhdCqKBtjnz6/TrqEYhEJxw3c6q/9J1M94LrP4pli3Kuvt+OW/pfw/cP4AokS411XRCVXAwac+nOxhJ+I7j0K3tzRlO8oeyTwMeaptq2iw1BUe2COQ+ACgM5yYhFrrnTaU1DQCmhaprdvjCwOwUStcQBJsm8PDaOYLGAVj63Rjhw4zwaWNnF1tCXgrvhGjC168Y3WMFU8wwuQ85E5CXHdkZSqr0AQfvgitulfxDB9Uv4S00pIciZCrTUWp/HwYzF/ROkdjRJDnTYDxZyeqkvrd3gQd4cde+Qq3vsHAPP8dkvlZhkpvYoxAofHLQRIg5PCoZRu/0c0p9WkEeclq470Ez3SxJmdwcMUawnRUMBi3A/NjL/Y8diOnTBFE6WeAteNSqX0YErQBi7aiWK8yJCvZD3RFSELBeVWBkBMKJOw7sAiCRzZxWD3dwyavew1ly/vRq7RpJ4v+Isq44jEBM9/BcmeSZMw2TifpSU+sc0Okc/UFmx0eyrmnySfXFZrtvUDxUz5pkM62qwY5CNuVvRe0VQrri/tpsT9AZVT+7BX0jiaOSgkDCIGxUS5iPLd35WE/6ISXe0hVEepEKOOS8AmlUfTXxdw/M2DNsDGv/kLzLNz7aqeIPWU055+qSTwfrB5dmHlxWVGa8WxhOgJ4mn4qYDlHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWYxVlJPQmdoTmxkL3dYODMrSzlGTjUyY3RmSktZMWNXZnlBOWxRay9YbFZ2?=
 =?utf-8?B?aW5CL1pleDFsZXE2anJBNHRNVFZUSEpJSlBHK2UvcXpCeCtSRng5c2w1NnBL?=
 =?utf-8?B?TVB3RDJmU21TekpaWFcrYVkxR0ZycHdyVm5HcmFSYXFpNGd2TGFURldRcEhk?=
 =?utf-8?B?OXg5WmVad2pZMlNmdFhmZk0yUFhwM2FTY3QyUVNqUTIzeXV0NWc1YjZoeVpa?=
 =?utf-8?B?TDdTcS9kakFIL3lkLzlsLy8wRkdzTWI4dUR1ZVJjakJMMWZ2WW8xTk1MNGxL?=
 =?utf-8?B?UERuVmRPRzhrbjBLSjhoQnRBQkxwcUxtakh6TGlCd1FTQ0tTck00Nk4zQkRa?=
 =?utf-8?B?d3diZmtWYSs1MzR3bTVmakF3cEs4UVZrUzJOVXA0c1dqVzZvNENIeGxwUWxx?=
 =?utf-8?B?UVNTZjdnR2gvYWZnak0vNU5VUlZQYjFLdDBSSU1xTDh1RytOYllKMC81RFV1?=
 =?utf-8?B?Mlo5RlVadnVvVTdvWUlmMEQzdXhxNWZVMHM5cmVSUWs1M01RS2Fvcm1qSWRN?=
 =?utf-8?B?TTVoRTFpQkpUaXIxQzNsZ1ZFaFhzOHdMeW9xTlkyYWdnSFdkNE5ZZkVxa3kw?=
 =?utf-8?B?Q3BSaVFOV0ZZdE5qV1JPeFE0N09zWG9xOHlPdnhoMlVSY1NrVXZnQnZqbVdE?=
 =?utf-8?B?ZUNtU0Q1OEtwSEMwVlZhY3QwVUR3MjdSRVFPaHR1cmxYS1l2cU0xRi90cUFF?=
 =?utf-8?B?NnNIU3p2NmRjV29mNEZCbDEwb1Rtb1h2Q0x0b1AwUlRLOC9vaFB1V1M0SVVT?=
 =?utf-8?B?MTZobE5PTTB2WVVHNzJKS1FackNOcmhqNE1QVVdjRDlRRTN3RGt6TTRPZGdE?=
 =?utf-8?B?eWk1WjR3N0htQXNZMEM1cGdBdFdvRjVWN1o3WkpVbDNFcnpLZEMvVUg4SnZj?=
 =?utf-8?B?VFNRanJWcUZscUFZMEtIVnYvL0F2UmhiQ2crMkcvNVhMQ2I0UjNUdFBCOHBl?=
 =?utf-8?B?ZW15KzVSVGlkWjUybFlyV2FqKzVwditUQXYwWVMwNEtxd21MQitVUGx2RGhm?=
 =?utf-8?B?S1J1TjdkRERwaUcvME9LWDMwaWplRkFNKzV0cUxZeVMxbHl1OWFrT0xvWFJ3?=
 =?utf-8?B?MnFzZS9rM3dVSThRN01oQVU3cUpMa3ZENlE1NUF1Q2R0VXlaUXZiNVQ1aUU5?=
 =?utf-8?B?REExK2ZQdGNqVittT2FucE5wYkswcmxCTXRtRURqZThsRVUwL2R4VXdieGZD?=
 =?utf-8?B?U2phY3ZIdWFsc2xwNlZDOWZuNUY4SXg5T2Iwc2Y1WFUwcVQrRytOeFkvNGZT?=
 =?utf-8?B?Q0krQnEzbUtWdzV5TGdWZGxjLzhzS3c1a0Rrb3lQTEx5cXJZYXNsT1NJWWpU?=
 =?utf-8?B?L2s4dTVuNWhzaEgwVmttOWFRUlpIcWtiN0w2alliSFhtdlpSNVdIcHRyY0Zk?=
 =?utf-8?B?bU5rVm8xM3dHVXozUURHV1Nha29lT0VDeHcxVkp3QURrMW80Q1ZVWVF3YUhs?=
 =?utf-8?B?OXBlbXpVVWVkS1RQUTN4RXNFY0poRkRrT3BWbjFJZGxwc29VWmhjQ3YzOVI4?=
 =?utf-8?B?VlNkQlV4MEU5dmJRYXVXR3Vyekw0MWQ2YzU4anZCc2ErVVZLdzdwMnhpQXNl?=
 =?utf-8?B?ZDNrekdhazBsMkZRZFdHcDYxRTUwSUVjdHJjOEFid3lHdTZoWnRQTEcrYmp5?=
 =?utf-8?B?VDFBRE01VnkzNG5QMlFNc0NUaWJ1MHliZ2FPYXErRU5VUGY0eFFFcjZIVWNo?=
 =?utf-8?B?YnZYOEZheFZnc2hOVHRydmRBSDRheHYxVDRqOUlHNGFyY1o0bGtqMmkxWDlQ?=
 =?utf-8?B?MFZzRGNYbmV0Z3VPamQwYThGYm1DR01zTUh3dUpSZmhjelRkeEFyMktoRHNq?=
 =?utf-8?B?a1pHVkliMTd6ZDI1STRnZE5uMi9IOGZ3N3g4OFNleGUyQlppVkorbVFXNFVT?=
 =?utf-8?B?YUdyVE41bnU5Z0dwaEFUaXF3KzJOMFpjb1prVmZpcnhuL0ZTQVJCQmcwWUN1?=
 =?utf-8?B?aEd6bkpGTVAxL0ZDbEYvRmtycUtDRklkeUtsUm10VjRBS1krMUI4MWIzVnFs?=
 =?utf-8?B?K2NlQjR6aXF3R0FnekU1MEptYWQxWENDSG93LzV5d0I3ZFNERUVIYncySjVC?=
 =?utf-8?B?d3dpdG52TExnUzdUT1UwWlFvcEk5eUxYWDdPZWNuQS9tR2RNdUFHbzIrSzdw?=
 =?utf-8?B?SG1teStjV202SEhveFh6ZElGVEMyT1J0RHlhc0NaTkIyKzhxdU84TExHT1pk?=
 =?utf-8?B?WlphRXBKdW9Oc1dUbU5ndTNCa09yWnhDUHlGUURyWmZhVXBkeit2ZDFBWTh5?=
 =?utf-8?B?QUU1UEYrLzhhRjJhTm9NNFlUclFPakUvTWFzd1k0ZjdCT2pVYlRGRzc0NzZN?=
 =?utf-8?Q?rHe5+OVzD42SnxXM8E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebef6b45-ed7b-43af-0d32-08deea19d933
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 06:56:27.3633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iP2gC3EVHU9ywWej5uSozFGSKSFnj0y9qKxKq9OAaukqjr0LL7SFf8xgYhdYzFdzn/IzAuzPRHEb23lFJpfCOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857
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



On 6/23/26 11:57, Harry Wentland wrote:
> Add support for the Fixed Matrix colorop property:
> - Add IGT_COLOROP_FIXED_MATRIX property to the colorop property enum
>    and names array in igt_kms
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_kms.c | 1 +
>   lib/igt_kms.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e82d32130666..9003b2b9e670 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -725,6 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>   	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
>   	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
>   	[IGT_COLOROP_NEXT] = "NEXT",
> +	[IGT_COLOROP_FIXED_MATRIX] = "FIXED_MATRIX_TYPE",
Should we move IGT_COLOROP_FIXED_MATRIX before NEXT?
>   };
>   
>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 3df3ba86630e..1be58288e119 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -363,6 +363,7 @@ enum igt_atomic_colorop_properties {
>   	IGT_COLOROP_MULTIPLIER,
>   	IGT_COLOROP_LUT3D_INTERPOLATION,
>   	IGT_COLOROP_NEXT,
> +	IGT_COLOROP_FIXED_MATRIX,
Should we move IGT_COLOROP_FIXED_MATRIX before NEXT?
>   	IGT_NUM_COLOROP_PROPS
>   };
>   

