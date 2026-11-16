Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440B606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L/lSJpot
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F1D10E7BD;
	Mon, 16 Nov 2026 15:38:31 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CA710E517
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 15:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icNp7rF2ozd+ZaIJxZ7sYRLm0Wn8d6I6ChLi9pMt2/TlLhs9rq6momzwdFiUHSAS+bpnY8DBeP+t536RVEksTqW6TeuUOSOwth6EtLUx47FrWyXP0s2dBAa7J5yhZ2ckzmIzMu2uC+nNmFXYnGkfz8VWxqax/Omh2ysk0JxEIV6urZPwhSoM8rcS6ClcmE1Bv6po5Z7D85AGWtxFjOwPejKpA/ve6ykAmEcplwvfIMQvII9riPYnyoUVlgjxntCJkudIENi2wrALHnVVBoDOyrSSz+nFYA0gucKmBkRF89gTQOYHCvliBeHDFLFLVH3Jbn/4ZLd707TpDAg4BHYZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wq7K1AxbKWGUZguqxiHFzKLL+8H8dTnCuPMVoVlM6Aw=;
 b=i7MmaXbjLv97pdSXMDFM2dqsdvqcFt2UspxXFnnhpXxnmkrTyCG4lrsM8WMvvwBjFnLhIOeX0COV13nkbbNVNG+OxswQwh0vf/VDBTyQMH0doFULL14svSYxChqSttNWj02LgzB/33P56YbzIJdYgyOwYi9WWLhw62S5PWWzFFp+sR3vCcIK2konLhjYIFpf8/RO31BSHgBsD/4dTY8+Vr7erYxF5OfSl0JZqgfvffHEb7zhMbnMGqF/CMAUKZhGfV76p00zFUHgVBsJtnAFVM/pHjROUs+vfShhVDYqbOlcyukeGyCk70jzvOdghPV8EAUqeEXbcpHTl9AW+5C3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq7K1AxbKWGUZguqxiHFzKLL+8H8dTnCuPMVoVlM6Aw=;
 b=L/lSJpotUQjwntqj9yb87M2ZfOOhYwqp2hxOgHGXX86JIAZ+fO8XrA7jD9aAglic3zLEGPlLFDC19ZwxMEW0t9ECXRqvpoR5vssp7IHpMmNC8TVO6BfJxJLpgrIUHYz+UexKGW7+Jn3JsWyjeMFqPCRgjwh3sgwUex0bAytpiIM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:36:20 +0000
Received: from MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321]) by MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321%4]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 15:36:18 +0000
Message-ID: <3d587940-aaed-4b03-802c-3828c569b8f8@amd.com>
Date: Mon, 16 Nov 2026 09:36:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/amdgpu: add VPE version identification to
 command objects
To: Caden Chien <chih-wei.chien@amd.com>, igt-dev@lists.freedesktop.org,
 Solomon.Chiu@amd.com
References: <20261116132028.2021-1-chih-wei.chien@amd.com>
 <20261116132028.2021-2-chih-wei.chien@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20261116132028.2021-2-chih-wei.chien@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:303:85::11) To MW6PR12MB8705.namprd12.prod.outlook.com
 (2603:10b6:303:24c::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8705:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: d2260a3c-511d-4b28-fda4-08df43f75bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|20052099010|3023799007|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261026135527099003|261026130827099003|261021121427099003|261022105027099003|261021123027099003|261022113327099003|261022075727099003|261021130227099003|261021133027099003|261022115727099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: /DkOuZzfLT54B8xcxgmHtkRZOm/DTKhpIg2GFUHSviCpDhQGB5GHbUFrTMR57dDx94bdP2h2MBOYsYQGWH4zaGlqBpnMKyTetk6L6dyhcxgfm5R2XN9uUS6OfpjZ4hV3ptr8cio33t4JwyowdOjlB4Lvoff44wuTWx5LyMNUrcxQjpi8sGvQ8b3Cx00IWliVrWrbS4qf67JOxgTaan/LCNl2Y2jx9H8FIfIwApl89SXf9DvxuYXxasxbF7iuFgHWzs/iMlOTD86XvfSeYyYSTxnc57Nlt+Nz86VHFVkiSlqwrkxzQ+0acGV46VIf7eI4aHDm9QGE2NKXJz7DUhnOsD+WK57uZVp/Y2pYKHrm92QrA+sYliwapa2tKI8DMBcbiyag/Uh42Fto5lMaib0nr2aWpA7DsPNnA0WuGZjRyChZGIrFyIkfQLZEbCvoHnXuGT/esSey2jVANj1KMxMpoxb0CRpTry3lFJrrMJotvw1CeBJEBey9Ok+1tG2UdieMZU7uNmq9/h+cvdDjepQmCHA/FN6HZhF6LqhNXiisZXKn+lP4GlAxRpi2h4YZrmRUdApe9LO2/n2tbWGDfywo/TWr7a21NwwNPEwQrbqaYRdISkN8/wrx/hs2tRJhWx1RgjgEDPLeIYwf2kyWWBsSEHt5YJEU3675gyqm2jMRQio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(20052099010)(3023799007)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261026135527099003)(261026130827099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022113327099003)(261022075727099003)(261021130227099003)(261021133027099003)(261022115727099003)(261021135927099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1gwWW1VbEJkcTlzb1pnQ1FCSnZsOHNjU2lBc2Z6cjA3SjFuNml0WFJ4dnE2?=
 =?utf-8?B?M1M3VEJqSlNmaVZTMm1HM1I4WjdRR2w1UVY3L2M3VExZZUFTV1JvSDkzZk9D?=
 =?utf-8?B?QlF3a3ZKWFpCMHBldkVhSGxrRUdJa0VESktlSTM4MEZTQnlVdmRkRFhMUFRO?=
 =?utf-8?B?MlVTNFVId1d1blZ6TVdSZFNKWGFVVDZVTlk0TmdXb1V6cGVHbmd6ZHZWVGlU?=
 =?utf-8?B?blNxaXFTbk5PaWR2QWpETVVYSHArT1JCT2hXOHBLUnAzbFZBT09qQ0tIaGV2?=
 =?utf-8?B?YWREM0lyQzE3d1hFaXZZODhWc3RKMFJxNnZFQ3BiMU5EcGlmeTB3RkJoUFE2?=
 =?utf-8?B?QVZaWDZLd1B2bmlzUDlKbWZqaEpqaU1Zei9lWE55NXRaVnRIMTEvR3VqenRr?=
 =?utf-8?B?STFIRzd3WU13eVk0NkZMaDN0enFHRytPUmRKdXlzTVFUSDUvc0VHS2M4LzVC?=
 =?utf-8?B?ckpWU0RLMndrMTYxajkyS09rZHBnSVZZN3B5ejNtUlFqMHRvZXRUSUdpTUdI?=
 =?utf-8?B?VFkrdjhxVEVjT0FhdktXc0lzOTJxVXFJVnB5ZHk1YUVFbWY3dWFIN0R2VWcy?=
 =?utf-8?B?QkNsZ1k0REt2RjNoVmxQR3NoSDl1bDhzN1ErY0hBMDVRcEpoV1k4amVDS0dW?=
 =?utf-8?B?WDNDelJyNUlHcGN0a2QyYmFHT09oSGRrQkVwRis4WHp6R2ttRDFWamtnckRk?=
 =?utf-8?B?UFdkMXdWMGhDTmtiQkhVYkpIcEUxN1ZGQ1lrZjNzSUFYa0ZVRmZXSjcvNVh3?=
 =?utf-8?B?eVE0YWVXRlBDZEVxYytYd3hKMi9USERqa0syRlZZYUYrbi96MHdpSDNMalVZ?=
 =?utf-8?B?bnNrdG83VTNNMTNCbnJ0WHNFaU92N1pNNUpPb0UrRXMxUzNNYlVrNWc1bFZo?=
 =?utf-8?B?TW0ya3lEdnVURGdUTHBXdCtNZHk4bE9lbHhYQ1V0WTJwM3oveHNhNFFVN0t0?=
 =?utf-8?B?MXMvOWVMZkJFQ2NEeXl0Y3F2T2RHK1JkZkZwKzJMT0dWTlU5UzVXOEQwNjhr?=
 =?utf-8?B?ZFJYZkdJenVRWC9BWFVxN1Rqb01sSzZpZWs4ZkdOYlRzNmJkTTJmR1dVZmk5?=
 =?utf-8?B?Z0VnRFpiQnh5TmhsK1ZWOHY4MXNpVWFOcFlyeXZJeFA0NDZ1ZCtmaFF2cnB1?=
 =?utf-8?B?RXdIQ3lKSTA5ZkU0VzA3SEg0dkU3L2syeWxDczJjRDRQOUNlM1hSY0J4RlFp?=
 =?utf-8?B?bGtRMk1YaDQrZkdsMlVHRWRMK1NCc20xUDZWeFY3QUwwc2JacGxMT2JJMGU2?=
 =?utf-8?B?Z0pqRmVOUEVyQmdxWVNaQVRmUVJDRUVGQjZIT2kzdytOOFNpYit0WG5VVC83?=
 =?utf-8?B?QzBPeGcwNlZ6cVhXSXBmbk1pekZLQ2IvQjFKOTRDcW9wMC9iY1c2K3M2NWlt?=
 =?utf-8?B?cVJnUi9xUkdaMEVyTHRRSm1LOFRoc3lMNW9BZnhNdW9heXJXenRLTzQwMGg1?=
 =?utf-8?B?bDRrbjFMazBkbVJkc0puWEN6MTkrbVkzNFRWdnZydy9idmpoSE82bE10aXY0?=
 =?utf-8?B?RlJZS0MramxZT016bGpEcitML0lYbE0rcTJ4WGhKRWVpNko5K1dheCtGeStJ?=
 =?utf-8?B?NEM1M29tR1NsOWJSeXBVeWllQ0s1RGFGMm1oUHpBazhqZUlsRHgwY20yS2tm?=
 =?utf-8?B?VHJtUzQvVU10NmtHRGRxUG5ONWxaaTk4VGVham8yMzgyc1h4d09wSHNyOC90?=
 =?utf-8?B?d2hrWjA1K3JhbEJ4Z3V1UGJVa01kUnVmSVNnN2xGMXNJMmgxT2ZOMVNheWpD?=
 =?utf-8?B?WTJvQUpSaW8xMSthQjZtRm10SkRFRkU4SHFpQmE3dGczakd4YmZzRm55YU00?=
 =?utf-8?B?UlpDQTYzTHNXcnBXSkU4WC8zZzRDRkdjY1l3dVA0Wi9KaklvNkVyRmhpelVP?=
 =?utf-8?B?aVluOE1qTVpBMXVzb1kwSFdycEdJWU50TDBrMmpqQlZMQlpEMmFsMmZCOExm?=
 =?utf-8?B?YWtXK1hGWXF1RnpXQlJzdG40aTAxVFBNUEJzeU0yTDFsbmozVEhsaUV1VzlQ?=
 =?utf-8?B?dmdQNDBsK3Y0djRBV0VZSzBXVHhXZS9kOUYrQWFla2JrTFdWblBKZ1JtNlFU?=
 =?utf-8?B?S2gyUnN1WktySFlQeXREWlAxWGJvc0VFUlVOdm5zL0x2R0g3dkxhY0RicHJO?=
 =?utf-8?B?dzlWcVZpNkVJTXB6TzhzQndxQXE1c21TRDJOTnhoNVhKTkdacjdqc3VXL3hu?=
 =?utf-8?B?RGxQSDNvamE5aU0yU08yZ3BDVWtvUzh1NnpUa3BZTEthbk9SclpyL0ZiRzRT?=
 =?utf-8?B?TWtMYW5JU1NGdUR3UkJYZmlnZHlrSytlMEVZWGU4UEprMWVMNk5MdmEwUzg5?=
 =?utf-8?Q?eDY4XSwF+2itH6okEr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2260a3c-511d-4b28-fda4-08df43f75bad
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:36:18.6099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Thm8hp3bYQrSyjaeMEiMOfP9oqyXeebVuMiMM7rYSSGFJS14nuRJRl8EQmxUXiKrbjiduXDYCg+7H2FCdXkqJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 11/16/26 07:20, Caden Chien wrote:
> As each command object is specifically for a VPE version, let's annotate
> version number to its name, so it won't conflict with future command
> objects.
> 
> Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
> ---
>   tests/amdgpu/amd_vpe.c     | 28 ++++++++++++++--------------
>   tests/amdgpu/amd_vpe.h     | 24 ++++++++++++------------
>   tests/amdgpu/amd_vpe_cmd.c | 24 ++++++++++++------------
>   3 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
> index 658c3b8b0..ae76445af 100644
> --- a/tests/amdgpu/amd_vpe.c
> +++ b/tests/amdgpu/amd_vpe.c
> @@ -152,13 +152,13 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>   	const uint32_t pitch = 1024;
>   	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
>   
> -	uint32_t *vpec_csc_cmd = vpe_get_vpec_csc_cmd();
> -	uint32_t *vpep_csc_cmd = vpe_get_vpep_csc_cmd();
> +	uint32_t *vpec_csc_cmd = vpe1_get_vpec_csc_cmd();
> +	uint32_t *vpep_csc_cmd = vpe1_get_vpep_csc_cmd();
>   
>   	frame_size = pitch * height * 4;
>   	context->num_resources = 0;
>   
> -	alloc_resource(device_handle, &vpep_cmd_bo, VPEP_CSC_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &vpep_cmd_bo, VPE1_VPEP_CSC_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
>   	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
>   	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
>   
> @@ -195,15 +195,15 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>   	/* gpu address of dst */
>   	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
>   
> -	memset(vpep_cmd_bo.ptr, 0, VPEP_CSC_CMD_SIZE);
> -	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, VPEP_CSC_CMD_SIZE);
> +	memset(vpep_cmd_bo.ptr, 0, VPE1_VPEP_CSC_CMD_SIZE);
> +	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, VPE1_VPEP_CSC_CMD_SIZE);
>   
>   	memset(context->ib_cpu, 0, IB_SIZE);
> -	memcpy(context->ib_cpu, vpec_csc_cmd, VPEC_CSC_CMD_SIZE);
> +	memcpy(context->ib_cpu, vpec_csc_cmd, VPE1_VPEC_CSC_CMD_SIZE);
>   
>   	context->resources[context->num_resources++] = context->ib_handle;
>   
> -	r = submit(device_handle, context, VPEC_CSC_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
> +	r = submit(device_handle, context, VPE1_VPEC_CSC_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
>   	igt_assert_eq(r, 0);
>   
>   	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
> @@ -243,8 +243,8 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>   	const uint32_t patch_src_luma[2] = { 2, 8, };
>   	const uint32_t patch_dst_luma[2] = { 14, 20, };
>   
> -	uint32_t *vpec_hmirror_cmd = vpe_get_vpec_hmirror_cmd();
> -	uint32_t *vpep_hmirror_cmd = vpe_get_vpep_hmirror_cmd();
> +	uint32_t *vpec_hmirror_cmd = vpe2_get_vpec_hmirror_cmd();
> +	uint32_t *vpep_hmirror_cmd = vpe2_get_vpep_hmirror_cmd();
>   
>   	frame_size = pitch * height * 4;
>   	context->num_resources = 0;
> @@ -266,7 +266,7 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>   	igt_assert_eq(r, 0);
>   
>   	/* prepare VPEP command buffer and setup command buffer data */
> -	alloc_resource(device_handle, &vpep_cmd_bo, VPEP_HMIRROR_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &vpep_cmd_bo, VPE2_VPEP_HMIRROR_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
>   	/* patch gpu addr of vpep cmd */
>   	for (i = 0; i < sizeof(patch_vpec_index) / sizeof(uint32_t); i++) {
>   		vpec_hmirror_cmd[patch_vpec_index[i] + 0] = (uint32_t)(vpep_cmd_bo.addr & 0xffffffff) + patch_vpec_offset[i];
> @@ -282,8 +282,8 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>   	}
>   	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
>   	igt_assert_eq(r, 0);
> -	memset(vpep_cmd_bo.ptr, 0, VPEP_HMIRROR_CMD_SIZE);
> -	memcpy(vpep_cmd_bo.ptr, vpep_hmirror_cmd, VPEP_HMIRROR_CMD_SIZE);
> +	memset(vpep_cmd_bo.ptr, 0, VPE2_VPEP_HMIRROR_CMD_SIZE);
> +	memcpy(vpep_cmd_bo.ptr, vpep_hmirror_cmd, VPE2_VPEP_HMIRROR_CMD_SIZE);
>   	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
>   	igt_assert_eq(r, 0);
>   
> @@ -293,8 +293,8 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>   	context->resources[context->num_resources++] = dst_plane_bo.handle;
>   
>   	memset(context->ib_cpu, 0, IB_SIZE);
> -	memcpy(context->ib_cpu, vpec_hmirror_cmd, VPEC_HMIRROR_CMD_SIZE);
> -	r = submit(device_handle, context, VPEC_HMIRROR_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
> +	memcpy(context->ib_cpu, vpec_hmirror_cmd, VPE2_VPEC_HMIRROR_CMD_SIZE);
> +	r = submit(device_handle, context, VPE2_VPEC_HMIRROR_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
>   	igt_assert_eq(r, 0);
>   
>   	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
> diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
> index eb4a02650..9f7828b53 100644
> --- a/tests/amdgpu/amd_vpe.h
> +++ b/tests/amdgpu/amd_vpe.h
> @@ -16,10 +16,10 @@
>   #define SRC_PLANE_PATTERN	0x12345678
>   #define DST_PLANE_PATTERN	0xff123456
>   
> -#define VPEC_CSC_CMD_LENGTH	12
> -#define VPEP_CSC_CMD_LENGTH	154
> -#define VPEC_CSC_CMD_SIZE	(VPEC_CSC_CMD_LENGTH * sizeof(uint32_t))
> -#define VPEP_CSC_CMD_SIZE	(VPEP_CSC_CMD_LENGTH * sizeof(uint32_t))
> +#define VPE1_VPEC_CSC_CMD_LENGTH	12
> +#define VPE1_VPEP_CSC_CMD_LENGTH	154
> +#define VPE1_VPEC_CSC_CMD_SIZE	(VPE1_VPEC_CSC_CMD_LENGTH * sizeof(uint32_t))
> +#define VPE1_VPEP_CSC_CMD_SIZE	(VPE1_VPEP_CSC_CMD_LENGTH * sizeof(uint32_t))
>   
>   /* horizontal mirror commands
>    * source:      1024(pitch 1024) x 256 RGBA
> @@ -29,14 +29,14 @@
>   #define LEFT_PLANE_PATTERN	0xff123456
>   #define RIGHT_PLANE_PATTERN	0xff654321
>   
> -#define VPEC_HMIRROR_CMD_LENGTH	38
> -#define VPEP_HMIRROR_CMD_LENGTH	1661
> -#define VPEC_HMIRROR_CMD_SIZE	(VPEC_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
> -#define VPEP_HMIRROR_CMD_SIZE	(VPEP_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
> +#define VPE2_VPEC_HMIRROR_CMD_LENGTH	38
> +#define VPE2_VPEP_HMIRROR_CMD_LENGTH	1661
> +#define VPE2_VPEC_HMIRROR_CMD_SIZE	(VPE2_VPEC_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
> +#define VPE2_VPEP_HMIRROR_CMD_SIZE	(VPE2_VPEP_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
>   
> -uint32_t *vpe_get_vpec_csc_cmd(void);
> -uint32_t *vpe_get_vpep_csc_cmd(void);
> -uint32_t *vpe_get_vpec_hmirror_cmd(void);
> -uint32_t *vpe_get_vpep_hmirror_cmd(void);
> +uint32_t *vpe1_get_vpec_csc_cmd(void);
> +uint32_t *vpe1_get_vpep_csc_cmd(void);
> +uint32_t *vpe2_get_vpec_hmirror_cmd(void);
> +uint32_t *vpe2_get_vpep_hmirror_cmd(void);
>   
>   #endif /* AMD_VPE_H */
> diff --git a/tests/amdgpu/amd_vpe_cmd.c b/tests/amdgpu/amd_vpe_cmd.c
> index 5dbc2a83b..0ed7ead6d 100644
> --- a/tests/amdgpu/amd_vpe_cmd.c
> +++ b/tests/amdgpu/amd_vpe_cmd.c
> @@ -5,12 +5,12 @@
>   
>   #include "amd_vpe.h"
>   
> -static uint32_t vpec_csc_cmd[12] = {
> +static uint32_t vpe1_vpec_csc_cmd[12] = {
>   0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
>   0x33002384, 0xff000021, 0x330023c0, 0xff000021,
>   };
>   
> -static uint32_t vpep_csc_cmd[154] = {
> +static uint32_t vpe1_vpep_csc_cmd[154] = {
>   0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
>   0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
>   0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
> @@ -33,24 +33,24 @@ static uint32_t vpep_csc_cmd[154] = {
>   0x0004aad4, 0x00000013,
>   };
>   
> -uint32_t *vpe_get_vpec_csc_cmd(void)
> +uint32_t *vpe1_get_vpec_csc_cmd(void)
>   {
> -	return vpec_csc_cmd;
> +	return vpe1_vpec_csc_cmd;
>   }
>   
> -uint32_t *vpe_get_vpep_csc_cmd(void)
> +uint32_t *vpe1_get_vpep_csc_cmd(void)
>   {
> -	return vpep_csc_cmd;
> +	return vpe1_vpep_csc_cmd;
>   }
>   
> -static uint32_t vpec_hmirror_cmd[38] = {
> +static uint32_t vpe2_vpec_hmirror_cmd[38] = {
>   0x00000001, 0x00800000, 0xffff8001, 0x00000010, 0x00800080, 0xffff8001, 0x008000c0, 0xffff8001,
>   0x00800100, 0xffff8001, 0x00800140, 0xffff8001, 0x008001c0, 0xffff8001, 0x00800740, 0xffff8001,
>   0x00800b80, 0xffff8001, 0x00800c40, 0xffff8001, 0x00800cc0, 0xffff8001, 0x00800d40, 0xffff8001,
>   0x00801280, 0xffff8001, 0x008016c0, 0xffff8001, 0x00801780, 0xffff8001, 0x00801800, 0xffff8001,
>   0x008018c0, 0xffff8001, 0x00801900, 0xffff8001, 0x008019c0, 0xffff8001, };
>   
> -static uint32_t vpep_hmirror_cmd[1661] = {
> +static uint32_t vpe2_vpep_hmirror_cmd[1661] = {
>   0x00000202, 0x00000004, 0x00400000, 0xffff8001, 0x400003ff, 0x00000200, 0x00ff01ff, 0x00000004,
>   0x00400000, 0xffff8001, 0x400003ff, 0x00000000, 0x00ff01ff, 0x00000000, 0x00500000, 0xffff8001,
>   0x400003ff, 0x00000000, 0x00ff01ff, 0x00000000, 0x00500000, 0xffff8001, 0x400003ff, 0x00000200,
> @@ -260,12 +260,12 @@ static uint32_t vpep_hmirror_cmd[1661] = {
>   0x000b0003, 0x0004ac70, 0x00000000, 0x0004ac74, 0x00000000, 0x0004ac78, 0x00000000, 0x0004ac7c,
>   0x00000000, 0x0004abdc, 0x00000000, 0x00047840, 0x00000827, };
>   
> -uint32_t *vpe_get_vpec_hmirror_cmd(void)
> +uint32_t *vpe2_get_vpec_hmirror_cmd(void)
>   {
> -	return vpec_hmirror_cmd;
> +	return vpe2_vpec_hmirror_cmd;
>   }
>   
> -uint32_t *vpe_get_vpep_hmirror_cmd(void)
> +uint32_t *vpe2_get_vpep_hmirror_cmd(void)
>   {
> -	return vpep_hmirror_cmd;
> +	return vpe2_vpep_hmirror_cmd;
>   }

