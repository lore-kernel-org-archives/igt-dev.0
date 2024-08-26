Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE672C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 18:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA3710E253;
	Mon, 26 Aug 2024 18:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fjTlNEf4";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2D610E253
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 18:03:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWy7FkYBbIcKulSr70Wpk7C3IRVnoEUDsEOzfwjIBWdMvk5Y8UEVT57KJBxUxiCg2ersbN6mNPjHd4XWjwZrP1BxWFaUXxe0yyY8HwhKoc66BMmQSgDOB0Z741mwVG1ufXoD4I42G4i6LDi4r39oaCFr9NytaJTmxJOftw7FD+84HcvRix3iF630zg7wdtaZKp3IA5UJXH/xQKZoB5GNZu0VFVFBH2T7AG/xQOEIa5z5pen6QMwEP32jm+bv1jdGalO65Pf9z4SUHHCqv1+omeqNqQM8D+823RrCqEixo/16cHcYKTTslnYUTn6CSzrSIVBfO7FcmKUM/4vU0BpjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU5znsIDKBhhNf24j4TArRjK/IJsswJ8IZnm7Or+0yE=;
 b=OvSPxVM7L7Hjhj/pJvXbQNrwE5K1g8hB8rFNUlkHapgtEt/AgKjpm8FWFqV4Pa7zyezJEAFclnRylRZWk/upO72A6HkxVAjMc3heOzuA/5QqvEh/h+xtCk/92wRpi+noNLTtwt/5Ap8MaAlz6AFW1VtN3uGU+1CkRSYRSKzzi7Hddf01PXsdGEeEWybETceRljY7zmHkz9//AGH8tIDlCxppoLLQnMr6g5enWpevAI5rtpwjiA5QK1ayWjHW0bkpzOSrcay39Qh7imCQOdCP3ApTPKdw8dB8qKcX4+MSHPrkvK8NfRMCDnM7ejZoAk5Kh0BOsram5g5aFbqNpUh53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU5znsIDKBhhNf24j4TArRjK/IJsswJ8IZnm7Or+0yE=;
 b=fjTlNEf418G8XvQNIpf+8yiw4OUsvTDty5vdtOytLNsJwFQ0t1SRQnaK559WVbVL7C4DnnedP+3GyP21s2j3dE9EH13JA0N52XM79uEut1TKkSGkxta0Tet9zqshShGHQtMjI9NFAcdnvhKayYaf3QEVQf3y02oiZ645CCYRB4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 18:03:09 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 18:03:09 +0000
Message-ID: <85514ca0-ce88-4373-9468-dadb9d634e1e@amd.com>
Date: Mon, 26 Aug 2024 14:03:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_abm: Remove the modeset for ABM
 level setting
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com
References: <20240826082520.25942-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240826082520.25942-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::24) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: afd1232e-55be-4c85-7a15-08dcc5f9582c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjhrT2l3T2NkYlVxVE1RR3ljYkcvZ1FoVkpwVUUxNXZjblpTSjlObGh4Tktm?=
 =?utf-8?B?bWY3akl0Q2p5dG9ZVDgrMUQ2YzBsZ3N6R00vNVRaLzRFNzR0QitwWGRycFdn?=
 =?utf-8?B?bEIwUm11UE9aME5sbEtISndHc1dyUStZN3dUTmRRdTJrUXFHTEhCdWFXb0dt?=
 =?utf-8?B?c1loazFmL2V2ZUlMcDFSZHdtTUs3dmJFN0hGcTNwTE50L2txSkRRQ0lnNHor?=
 =?utf-8?B?NWVBT0srTjI0bHg1S3dCTy9qbFVwRG80TzZBMTBUUmM3WUJ5OXYyRDNFYmhi?=
 =?utf-8?B?ODJ2aEUzNFRiV0w4OTl4QUVMUFVnNDk3dkdGOG9VeTRvUFAzcHVuZTVIclBv?=
 =?utf-8?B?NUVwZFhnK3dkZ2VqeTNMcGpCYXRGejZrdVpUWWtMd2FkbXlObWxjSHU4YWRj?=
 =?utf-8?B?cVFFaFRBcDZPUFJYNGx2OXBnMkdsREFlcjNocDRWcEdDY093QUhNM1J1ZkN2?=
 =?utf-8?B?WmNwc25aZFl3V2swQWllbDk5b3ZydnN4bmZySXd3RFAzdW9ldGE4aTNVclNX?=
 =?utf-8?B?WDZ3MHIrc3pPRmtjZFFMR2pGVTgrYWhoM0ZvMnJiSTJTTVY3OGxiR0hzOW9n?=
 =?utf-8?B?VFU1d0FBSnN4RUcyZ0NaSXdJUnowYytQa3htYVozcFE4RW1hWmhuY2hGU0p6?=
 =?utf-8?B?ODRLSHpIVkt6NnVXU0RwYzhyN3dsaFdKVEh1cVllVU9Ua3Z6bDZ6SG56Zkpa?=
 =?utf-8?B?NUtpNkZqUXVLY0VvNDlLMTYrQ1IvNVp4NTVxVEQvRUxvdFZRbXA4V05TRStJ?=
 =?utf-8?B?WGlxRlQ2Rks4TEZONGNRVW9Ia29rNXdDRGl0dTdTWURDb0J0TDlLT3N4bEt5?=
 =?utf-8?B?cWl5bnNGTFFPNG83d0k5MjRQVmsyV2grV0tQSGY3OER6aGJ2OUFTQzhQd2Ra?=
 =?utf-8?B?eHc1aVFmNHBsR2NVb2hTdjRaRHRkczl3dGpGS2F2OERENmhMY2IwSk91aURw?=
 =?utf-8?B?MkVBOXdFSWhVM1YrWHZaa2c1bDZoVGl6WjBvUzgwcVlGVFdFaGM5MzVKZ2NL?=
 =?utf-8?B?Nm1NUGhjdXVrSitRc1E5NmhVeFFCMnZnZ0dYWkg3d0VoK2VZd1ZJbTM3R3Mx?=
 =?utf-8?B?NDB4VklGc0wrT0Z6OEVoczJlOVJLMklwLys1S09yaHFpaE94blEvamIwb0c3?=
 =?utf-8?B?SDE5L04vMkVhcjk0K0Frb1IxcXlXYzZ2WmxibDlhOVhBejJOYXR5NFYrT0l1?=
 =?utf-8?B?SlFsTWw1ekhSaWpZUEl0N1NxZWpveFE0RzU3S0pWRHhEcFJaaUtJMnR1Zk16?=
 =?utf-8?B?Ry8zSXF5dUJ5S3d2bHZMNEFRNDRJWkNDaHFDeGxHVURoajBVT056WUNrWGJ1?=
 =?utf-8?B?YWVmYThaeXZKNVg1d2p5SnhuRk11c25pUFhxOUdvNzY1MTdReGM3dm00SVBZ?=
 =?utf-8?B?WU1KWm1TZnlYbFR5QXc5Q1hQemhtKzBMMlcxdVI1bmdhU0lkbjk5cGN1RmJh?=
 =?utf-8?B?NkpjZkhjUEtmTkNIeE90aUtrZE1RSnltRHgvdG1LZjh1czR4V2UvVjVHTXIx?=
 =?utf-8?B?bkI4L2lxRVN6bWh1cm1SaUlMUVExSWRCYU1hNUhhREFKRnlWSmxZNzRSQnNk?=
 =?utf-8?B?ekI3TTVYZm16Tld0UmJTRGxzdVR0Q0RaSmt0RDMrZkg1enRLSkJsVU1zUUQz?=
 =?utf-8?B?aHBvaEdZN2hUWUhoM2U4OTc4aFdNWGFRUVFqdWU5ZnQxSUhyVDgrbVIraXJk?=
 =?utf-8?B?QTEyVGlWTXpyYm1WR3VhK3lSYzMvR1JhcHRYVnRUa1pRT0NweExHSnpQcWJR?=
 =?utf-8?B?ZStTc25qcnhqWXd3bE53QXNDTmplR3FReHB1bWRzODFQRzVUbm1LcUc3VUVN?=
 =?utf-8?B?ZXdiSlFTck8yUENZSUQvUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1FvR2JEL1R1dklXaUx0MHJWSy9GbElvejQ3OFJDWEFHaGMwMk9RMnZudG9B?=
 =?utf-8?B?dW1YT1pXTzBpMFc0NFVuUEUvS1VlLytwdlo3VnpoRmN0N0ZJN0FFQVBwMTBC?=
 =?utf-8?B?WnpFbnNkZmpOaFczcDZNelppdkNiV01FVXozMVRab3FnNS8zWFJjVzd5VkFu?=
 =?utf-8?B?UTFQaVVVbWplRGxyWXBxdUhTTkgxQnR2em96cEpPQkdwTGJ6ZmtldldHbUg3?=
 =?utf-8?B?Znl1Zk1Hd3E0RHB3NFAvQnYzRzRPWmU4Tis3T0tDZXlTZHlqNW9uYU5XL1RQ?=
 =?utf-8?B?MmtwY0RNK2F1YWNMbkxGTkswbEZYdjA1K0dUVGxteXdlN2pwOENRS3pWVFF6?=
 =?utf-8?B?Y3orWDRxcHhNOS9GdElId3NtOHorREhOQUdaczRMTWFuV2MxWFFTZVZySmFS?=
 =?utf-8?B?SXFhWHhacjY5ek0vVERmbE1GNEJTUUROSktMaDFZcWZXZ0tYV3JXZmhsWXBX?=
 =?utf-8?B?ajhVS2pWejJkUndud2cxUFV6WG9GU0ZuMGhNNnI1V2xBejdYcGMwZUZrWm1x?=
 =?utf-8?B?RmU0d3lNazhjVVJ5ckY1WjRmZ0hMRVBZMHdlcEJBaXpEdkxFLzdJY1B2TzRI?=
 =?utf-8?B?bXhQenV3VkQ1ZHF4RkhXSUJ1RlEyZEhlZnRBMEltS2F2cWYydU5VMmFkdEx6?=
 =?utf-8?B?bUM1VWh0QnJXODA0eFZsT3cvOEJNTVhFMzV1NGlEYk5FYUR3UjNUUWhhREIv?=
 =?utf-8?B?YkFXL1NFczRSRWFuNUd6QzY2dVRGcVZwTnNBQnkwdkNaSlQvVEs4cjVMc1Uw?=
 =?utf-8?B?VlJKK3drclByL3BreWwzRkNMYlVJa2xVM3FHemR1dFkyOWsrRFh4bzhqZ2cw?=
 =?utf-8?B?YVRJL1Y1NVdzSW9jNFlMQVgybW1WYmJWS2FqMXJCQjV4QlIrbU5QMS9IckNJ?=
 =?utf-8?B?dEI4SThzaVR5ZVhhMHZlcGJaY0xPVDhQbWpSdVBkK3RxZFJoc1VvZy85U1JG?=
 =?utf-8?B?V1M0bzdsZE84MTQ0NlNEM0hHT0orN0xDbFdiOVFyWGlnTDNrQ0U5NXZSTitj?=
 =?utf-8?B?MWFTdHBiVG44Ri84OEhadHRzTFl1Vzd3Z1FYcUxXbDdTeFNCY1pweldpaUxN?=
 =?utf-8?B?N1R6ZHRNOVZ5NTRQY1JRZllmTXNRM24zdVMya2FxT0hSRVVheEgrWGNsaFMw?=
 =?utf-8?B?RCszQloxOEFscHdCMzd1MVZHRFpOUGwySHNlbjFGbHNSMDAzUXBJOUhEUzY0?=
 =?utf-8?B?T3pack5JVUV5R1dwQTRUZGoxRHpPbTdvSFVieEMwNC8ybmxGYWc5TDlncmFR?=
 =?utf-8?B?elUvWTRWWmFKaDMyZGNjSHNJUXFjMlM3RGxINXF0OUE1VVJSZ2hocVhoMzhh?=
 =?utf-8?B?eUVTc2FDSzRhZ1J6czJWQkg3Z09meC8yT0ZLTWNOVjRXcTAvbjIvUGlXTXdX?=
 =?utf-8?B?ZnlkY1B1UmZSdmt0MzUxQThpek94U2pFUXVLZkNnZHB5T1B2andPNDNOb1lh?=
 =?utf-8?B?Y0ZYcjF0cmJYTjJPWUlKL2dOdzd5QzVXYklvNzRJVDAxaFdYZ0RVU3ZSRm1s?=
 =?utf-8?B?ck9nL09wZnJuYkR6MDFqYit2ZVVXRG9RL1pSWXR6RzJ4KzRjRDlKWHpaWS9k?=
 =?utf-8?B?dmZPT05wWVFlc3dhNEQ1NGxlVXNaaVB4Y0lBTUp3ZmtHT1VRK0Fac3NDUU1z?=
 =?utf-8?B?MmRWQ3N2RlVreExrL0VrSTQybHhGZXVlamUyWHVzcFF2NzQweGJ1LzU4dVF4?=
 =?utf-8?B?OXl0dzZFOCtESk8wTjF3L0ZMTzJjNjNzdGFzNDQzMWF6eEtJczJ5aDdRWGRP?=
 =?utf-8?B?MWNPYk1xMmtCZ3JPUDBuNUw1OUVwK1E4dktmRERnNjJ5WUh1Mlp6cGtyVjZy?=
 =?utf-8?B?RUc2NGxYcThDNlhWWTBwYXJXcTVyNFVsaTVsMkd1R0hubjkyeWdwTHVoemV3?=
 =?utf-8?B?Q09rRlNqb0pic252djZNWHU5bmczdlZ2T0VnVnp4R3ZPMUJNNTJqS0RQT0xo?=
 =?utf-8?B?cHRZc2kzQk9ZZEZhcjRwYmR4b3hUcFduOWZuSEdKRENjRW1KT2lmS3VzYmJK?=
 =?utf-8?B?NlBranp0WkhQaENtcVdWamRDc09sbTQyeDA4UTdTbHVpeWJac0FNeXNCeTJq?=
 =?utf-8?B?aU9TU3Mzd3FUNTJKUElpclBKdDl5NjVOU1FKeXFranRpUGtRblFlNkd6aDk0?=
 =?utf-8?Q?PtHHU34Ihx8NXoix7mkRguW7h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd1232e-55be-4c85-7a15-08dcc5f9582c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 18:03:09.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+nQ8NxjYEAHo1xXWyD/Tumjzdm79X2nKQ22yhFewmo2jcFj+Lpw89Ku9NF4ruwG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594
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



On 2024-08-26 04:25, Tom Chung wrote:
> [Why]
> Set the ABM level does not need to trigger the modeset to take effect.
> 
> [How]
> Replace the DPMS off -> on transition in set_abm_level() with
> atomic commit.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
Thanks!

> ---
>   tests/amdgpu/amd_abm.c | 99 ++++++++++++++++++++++++++++++------------
>   1 file changed, 71 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 2882c2c18..a85f444c4 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -39,9 +39,75 @@
>   
>   typedef struct data {
>   	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
>   	int drm_fd;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;
> +	int w, h;
> +	igt_fb_t ref_fb;
>   } data_t;
>   
> +/* Common test setup. */
> +static void test_init(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	drmModeConnectorPtr conn;
> +	bool has_edp = false;
> +	int i;
> +
> +	/* Skip test if no eDP connected. */
> +	for (i = 0; i < display->n_outputs; i++) {
> +		conn = display->outputs[i].config.connector;
> +
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
> +		    conn->connection == DRM_MODE_CONNECTED) {
> +			has_edp = true;
> +		}
> +	}
> +	if (!has_edp)
> +		igt_skip("No eDP connector found\n");
> +
> +	/* It doesn't matter which pipe we choose on amdpgu. */
> +	data->pipe_id = PIPE_A;
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +
> +	igt_display_reset(display);
> +
> +	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
> +	igt_require(data->output);
> +	igt_info("output %s\n", data->output->name);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +	kmstest_dump_mode(data->mode);
> +
> +	data->primary =
> +		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +
> +	data->ref_fb.fb_id = 0;
> +
> +	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> +		data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.6, 0.6, &data->ref_fb);
> +}
> +
> +/* Common test cleanup. */
> +static void test_fini(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	igt_display_reset(display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +
> +	if (data->ref_fb.fb_id)
> +		igt_remove_fb(data->drm_fd, &data->ref_fb);
> +}
>   
>   
>   static int read_current_backlight_pwm(int drm_fd, char *connector_name)
> @@ -121,14 +187,9 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
>   
>   	igt_assert_eq(close(fd), 0);
>   
> -	/**
> -	 * We need to trigger a full modeset to have the new ABM level take effect.
> -	 * DPMS off -> on transition is one of many approaches.
> -	 */
> -	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
> -			 DRM_MODE_DPMS_OFF);
> -	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
> -			 DRM_MODE_DPMS_ON);
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_plane_set_fb(data->primary, &data->ref_fb);
> +	igt_display_commit_atomic(&data->display, 0, 0);
>   }
>   
>   static int backlight_read_max_brightness(int *result)
> @@ -156,25 +217,6 @@ static int backlight_read_max_brightness(int *result)
>   	return errno;
>   }
>   
> -static void test_init(data_t *data)
> -{
> -	igt_display_t *display = &data->display;
> -	drmModeConnectorPtr conn;
> -	int i;
> -
> -	for (i = 0; i < display->n_outputs; i++) {
> -		conn = display->outputs[i].config.connector;
> -
> -		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
> -		    conn->connection == DRM_MODE_CONNECTED) {
> -			return;
> -		}
> -	}
> -
> -	igt_skip("No eDP connector found\n");
> -}
> -
> -
>   static void backlight_dpms_cycle(data_t *data)
>   {
>   	int ret;
> @@ -354,7 +396,7 @@ static void abm_gradual(data_t *data)
>   
>   igt_main
>   {
> -	data_t data = {};
> +	data_t data = {0};
>   	igt_skip_on_simulation();
>   
>   	igt_fixture {
> @@ -382,6 +424,7 @@ igt_main
>   		abm_gradual(&data);
>   
>   	igt_fixture {
> +		test_fini(&data);
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
