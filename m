Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6706C52D71
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 17:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F34210E7AC;
	Thu,  8 Aug 2024 17:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SyffocsQ";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2B410E7AC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 17:27:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=genYE6KEelHrvQc6dCidom0/lzjCJ/8Sd8vaEBQmfzK0u3EaVXFVxVfw2ItJeJPNyXy3WKLAIQotNQ4xVRkLf8Bl6imb153/DwNcpDPX5MMcpdMo41GzL9RzYojp47Cp0xZ0c72IuUcVXmKyFGTlu9hbOMfWfZ6vfD3VFD1sJpwGGfeLxKt1ggMK9Sc14vMpxYdNq9ieC7DWckJGPo7iT66GB5R8Ty9vgsSaJcpw3zHy8l/2J/hPh+3LfQd1hcWHGd/BEdTw3J1AjICOAKsNXBnr+92GycjYBaAXyh6Upxsi5vghRgMshg7/EdsiHPxPyRrHMRhXFTVzTBBWzfZIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1GQ7zPheggoI8bD2jKUv2XB9RA8lexP11Nf8W+EO3k=;
 b=SgXtOPD+tXNShD/AaG3RqO2t1reN7+DO2Ry+hmHVivrxP/NQJVrtgjwHKGPY5f9/eq8s6JRLKrPBJ7Fi7eHJN5abytvqdqfMCauw1ab17Ghjj01lzODwZ2racAJf2PsHWTX01KffxPhDVUjYXoXTjtpTSzCSig8hJYrsl6HQ/sgPzIXMX+OqrydUKswjSNVgtdMJ9Jfzw/7qeciPzDbfXMasOXNUFIziOt2H+G3WrozPqcBqIvIfmRMMw3kS+Fe+6LEGbZnDOON3OZXHFyr29hHYiQYXF85jUtYipReA0Gzo8Z+Q+hMrKPyBYTJ/5bziRCuB2ATGMupJowHyACIrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1GQ7zPheggoI8bD2jKUv2XB9RA8lexP11Nf8W+EO3k=;
 b=SyffocsQ+nXgZIxn6NEC23UVp91UL7dnPCu2GlFEoBCum444hDeccLawudsZ1QNIV3l+vizWZj7DEcQhFqvqcLzASkngYBXPJWYjCYkbs1+JcHUxj4FNEz6ittGuWNfID9SyxxFKHUVhW1SFpSWdF86a9q+DibNmt9ftNjYiGGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 17:27:46 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7849.014; Thu, 8 Aug 2024
 17:27:46 +0000
Message-ID: <a05466dc-b7fd-4100-8aee-620f77a7719b@amd.com>
Date: Thu, 8 Aug 2024 13:27:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amd_dispatch: fix KGQ hang test
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240808084058.2704009-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240808084058.2704009-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR15CA0064.namprd15.prod.outlook.com
 (2603:10b6:408:80::41) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH3PR12MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dc4d37-a17e-4de7-9002-08dcb7cf6b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2JBbCttNXFNanZwUGRwbzRxRll3bDErUDVZcW1CandzOHVROHVvQXh2Lzcv?=
 =?utf-8?B?UnVLNXJhWWlJYXB6OWJ2eUdoSzR5WUhVb0lBR09heE9QbExRZllJUkJIeTVk?=
 =?utf-8?B?NlRHVzF2QTZnY1hVUGZNeVFTUlRKOVZzVHJONzFBVTVRMVM4TUhxSUV0OFdn?=
 =?utf-8?B?dmJqMSt6NENKNFhXQUg0aC9vbytCYUR1Yzd6S0x4UXlqaEhzemlqU2ZIeHlF?=
 =?utf-8?B?ek52cVZpNHlmUmdac2J3OTdlVXhUM3dWaEtmdkFBWDZaYk9GK2VvVFpZd1Vm?=
 =?utf-8?B?Zm0zYXg4UnVBSmVUWkg1Y09wV3h5dWFyczlRamhxMjk1TzlFT3dPenpTcFNK?=
 =?utf-8?B?WHlsK3U3L05FRk0vWjVaRnM1NWV6VDhOWXNDdmF1WUxrVmFQVWV1cjZ5T0o2?=
 =?utf-8?B?YXVVN29IUWFnbnRrY1lYdDc5NWdWRExyNkwwdzk1aFk4cXdEbFRUbWdGRU1D?=
 =?utf-8?B?b2VRMHRSekRtbDZTNUIraTJXVHNOdG1wQ0JWNVNaRlFZZTh0YnpPaFBEYkVG?=
 =?utf-8?B?Ny9TcEUzTnZQSWVWRzk5akc2aWgxQzVGM29hbWU0RktkWHhSdDliNk5YYWUz?=
 =?utf-8?B?bkp2aXlPREFOTGhncENncFRPV2tJUU1WSmcyREI4SURHZEVuU1RJcjBtbXl1?=
 =?utf-8?B?dG5tcklOQ1ZiQmVvbkNya2ZZTXJCOTBycVdBQ2xoK21mYm9JSEdSWlRyWGVq?=
 =?utf-8?B?bzNWY3BYRVAzTnZ2bGR0R0xLTFMyVDloNFpFdDVRdVoyOFRSdlhEbUtESGVJ?=
 =?utf-8?B?cXE2aFRCQWNDZGlpT0g5Qm9Xdm84Zms0RjJsSWo3ZHBwMndMN3FwS3AzRnJ4?=
 =?utf-8?B?c0FYVlZpdEN0Q3lJUU1kcXpRU1lpeElYRHJaK1pFL25GdXBvUTNORUVhNnAr?=
 =?utf-8?B?ek9GS090Y3d4SlFKdGV2OWZwZDFlU2JWamIzbjRvenpzMk5QWkM1aUM3Ymxz?=
 =?utf-8?B?M1JxUW1VYkR2SDhqREhIK2FLSU1CU1c2QWFCZUtyN0Z6Ty9sN0FJREdtSzZJ?=
 =?utf-8?B?VzBaYjdDOE5rZFFQWEJBNkJnNS9wQ1ZxYXVFWFBCZXNDb1RBei9WVFBXL1ht?=
 =?utf-8?B?TVJiendTYXBiUTVHWFVpdExJTEN4ZFQ2eVlLcU84czJvbWdRMzdYTzUvY3VW?=
 =?utf-8?B?UDJHZTk5UXR4bEc1VEkxdU14V2hOdlVNSGt4TnpGaENKS3JiaTBPcmIyVFJR?=
 =?utf-8?B?YmVmdi9ENjBRZUtRbVFKRkEva1NZWEJWbmtYOGdtVUFnODFlcHByaURlRk84?=
 =?utf-8?B?czJUaXFYRGtRQ1BVR1Z4bHhQMkF3aVhzUFNFYzlTVXM1ZGdlNEtWYVVqenZS?=
 =?utf-8?B?VXA0RVViOEpqYzFtYUFZOGZMTldnYjZzZEI2TklOdGpaZ01BVno2QzNiMUh3?=
 =?utf-8?B?QkdWb1JnMmloWjBER2NEWnpObmhIYzd1cmFuYnNZSzFpd3RvTkV2a1dvQ2VI?=
 =?utf-8?B?dUhVOTJLdjluWjlRUGNQb21hTHZoUEV1UDYwQ0lCTmhiVDFOYXQwQitva0Zt?=
 =?utf-8?B?NXhmQ2JSbDludmVGQU1TNkRNaTlBTEtJb2dwVnNmSnZjMDRoa3VvRCs2Nisw?=
 =?utf-8?B?blNtU2pTSHdIZENoMzgvMmxvR3lFa1JVVGZBemUrdzNvOGxmSzhua3FzT085?=
 =?utf-8?B?TTNkRVd2YnVucElXc3hRZ3gvN1hqa1B2S0FRejVkbUUzTDRZcXBqdjNHYUl4?=
 =?utf-8?B?ZmgrRmNkNXF1ang2UzkvMDZsWkNlbGdvbjFnTVhNYlg3UFVFVVdqOG1pckkx?=
 =?utf-8?B?OUZkL056bGNqY1lPNzZVRnJhaWRDK0pGSUFZbCtlWHBDbEJNREdERmpxUUdw?=
 =?utf-8?B?V2dpUkN2Mjc1WXo5N3Erdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjN2Yi9wWnFUTnY5OERMRXpQcTd6UndNbkh5S0RMTlFNLzBqMzY4QU5ZNkJz?=
 =?utf-8?B?SWwwTWwxV0dmTUJzNUlCbFlhSUh6MjM3WmlzRllpK1hPT2VnVDM0YTlyQXlY?=
 =?utf-8?B?WVJwT0p4VjNnTjl2N2lyS0xoMDFlczZSc0orMm1ua21jSXc4WHpwaUpPWHFO?=
 =?utf-8?B?NnJpWEFQak9BOUNxYUtLRytEU2lSaS85NnNFaU0xUWc5cCtLZndqMkd0SlJN?=
 =?utf-8?B?T29lZkU4VVdlZFFZdkNEa1VSWHFuTUFwVEgyQjJqZUorTFZyZW5SK3g3TUVH?=
 =?utf-8?B?NzhlcHpabzhmR1pBMllyWlM3dG96ZTlqRWp3OGZoRzJIYmRvMmthOTh0QWhN?=
 =?utf-8?B?alNUWnhNZlJqSnJiWjBEMW9xZzNkRmRCcEJ4MTlub2VrWTFpRUhhUExZNkJz?=
 =?utf-8?B?emJBVjRRVlJWaFhzQ0ZLNmRkcTI1amVIUEFPWHdBdWVkM3FVOU5JbWc2SGRT?=
 =?utf-8?B?RFhLZEJNQWprYmgrVGdad0hLOTNaZnNLUDBEVUJZUGszK3N6Tk1WVHNWNXps?=
 =?utf-8?B?NEtYVHBSaFFtbHFDZU5GSzRKWkRyMURRM09GZ1BoOEM4M3FRMURHQjNkOElt?=
 =?utf-8?B?ckdOeFdSYlBMcHhJTHBNdGhMQnhERzBBbWEvQ2NySXQ2bE8vbG45OXdMUG9R?=
 =?utf-8?B?OE1TL0VNNEVBMng4QWpHTmR4Nkt2enhBSEtzODJ2UERsVXg1dDIxSWExT2dn?=
 =?utf-8?B?K1pyOTI5NUJNVk44TmtFSkw5ZWJwQ3F2Zlp4TkR5MmNPUDY1ekp3R1g4VjM0?=
 =?utf-8?B?cktBaGhzOEpaY0xYNXpYaTFJME5ZcWZ4QisyVDZVMm1IaGVRUzRTemIwRlJx?=
 =?utf-8?B?VUhyK2hvdlRDTW9JeEgxbnlzS3Bxc2w3amROeUo5VGVZcFhnSGsrNk5TbDFJ?=
 =?utf-8?B?WkRqUkVYRlZsMFNJWGIrSExiQXNFSWNwVXRheDBxeGVrQzFPRXRBT3RscitB?=
 =?utf-8?B?aXF1UUhyeWU4ZlMzazdGR1cvR2FSNWNURTN0NGFxdHpUWFRweWt6MWQyRHF1?=
 =?utf-8?B?aWEvL0FQZG9yd2s1a003ODVialh4M0wyZXNEWWFYWHNrOXd0WmgrL002Wk9z?=
 =?utf-8?B?bHN5cWdJeFl6djlkcVpPVWlHOUcxcEZOOWY4SHMwRy90cGFISmNMeW9TeW9Y?=
 =?utf-8?B?V3oyNVFEb3lLRmp0MTlCeklYSWwwalhEb3dxcmU2TTRjMjFTTGVaMGNWdGM3?=
 =?utf-8?B?N2FTVFdMTnh4Rm45VHJlemJGclIvZDZPRlVpOUg1bENmWmFKcmxTUmszQU10?=
 =?utf-8?B?ZUNiMC9tdFd3QlpiVDdSaWZjbUt5WDYzVS9WKzdJeS9HN1pua2pScGpuakw3?=
 =?utf-8?B?VjBvNi85V2VuMlJEUkFRREdCcVVyMlhqUm9zNGpQYXpidHVHTzdCYmlPV1ZO?=
 =?utf-8?B?TTQxQkkwbmZuZ1AzU2xHNUUzOFZHK3EvOTdzV2dwZkxWUkNPeXVHZVpBWGln?=
 =?utf-8?B?K1M4N3VZVXJzM3YyNG1veGx5Ym5VL0Y3cVpSaVNyRGpQKzBkZ2hHcm5RMWdu?=
 =?utf-8?B?cjNGZWZRd3dDYVVPQ3plK0JuWjJPejdwUWU1ejV1dG1Ga2JOdEZ6QmltYlBK?=
 =?utf-8?B?N1pnZlVWWWdPRG9Nb0Vkc2V5MlhkSXVoWEdHWHdGQk9aUTlYTy9aQnZPTnR0?=
 =?utf-8?B?VDNWNzNsanlMOE4xZ0FnZG5OR3ZsL242WXlKNXhuNmlZZDVhM0o3Q2NDTk9D?=
 =?utf-8?B?QUE1Umh6U1FFbjZZd3lobEYxdWNJSzQ0Tk5ia2FZU01UdzQ1dmQrV2ROWFd2?=
 =?utf-8?B?b2IrN0cxR29SeDBqdkYwWTNUYURZekRtQ2pvTTU0dk1XNG0yN3ZUNW9lQWlu?=
 =?utf-8?B?emJTRjR5RzVnMTNvYmxoRXdoMm1qVFFKbTBxSEdOMnpJREc3M3MwUDg5YjhS?=
 =?utf-8?B?b2xKd1BFVFpJK2xuOFh6bmEyZ1NNQ01GQllPdUMxSjk1cTE3UnRTcUd4OXZ5?=
 =?utf-8?B?Mkd5WlRsK2xvS05QNXNybDVWYkVFaWlIS08xQ2hkNkRUUk5uUWRRYWFGSitt?=
 =?utf-8?B?SkNhQWFaa0RRTVZpVWg4Y0c0NXNPdXI5eDhWM2FPc1lwOXhHYlhUWWc4UG9Y?=
 =?utf-8?B?clQvTmJ1a3d0ZU5OQ3lqRHU0TzNVang1aElwdXhjK05DOHVsS25rRXB5TzI4?=
 =?utf-8?Q?hQb64gT7MANhsYTaO2M8y595j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dc4d37-a17e-4de7-9002-08dcb7cf6b0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 17:27:46.3846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAU7t/daxGTYiQh0RMPC3Yp1sV7xq47UCRO22yQjpfwqgCFW95AkwxRkDg+nv76rMCp1kURsXE7qpxxjTqvFAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401
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

The change looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-08-08 04:40, Jesse Zhang wrote:
> Set specific error type for KGQ hang test.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_dispatch.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
> index 2c17e90ab..76b62128d 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -26,9 +26,9 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
>  }
>  
>  static void
> -amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
> +amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle, enum cmd_error_type error)
>  {
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 1);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error);
>  }
>  
>  static void
> @@ -118,7 +118,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
> -			amdgpu_dispatch_hang_gfx(device);
> +			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
>  		}
>  	}
>  
