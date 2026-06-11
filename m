Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDABCD98D2
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 10:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8ED10EE2E;
	Thu, 11 Jun 2026 10:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w2N6qlsX";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC59910EE2E
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 10:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iobem+FsloVHZVAOirPPRV6miZHViI0P7aDojFgvAS9g5yCowxRVwWkARqwSysKHLyiOb9ohNUCSD9w6MnfP5X764MrN27Of87sLy4c8vyVNLFQCXh9nqFSF22lvf2/cDjUvjWP8TVans9fBehLY0V9u55fzM1uS1iaeZg8hhvetRzr+60i0e1WUfH3M7Hx7cfH5HFefITPIGnHf38oeloR7/UOhQ5xtkruePzh+eG1kxyCGcWbDSjBVKDjFec5NAnx1wYxOTvgxcF1eMJCrohS/+3OP/42kCfEFQj2W0x5b+Rcj3/fmUcLAz7WoDhqB0kEMRu+qDuE8RQzbLNnkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DH4tX0f+Yjl315Zj/C/TKfUuJkNU5z3v/zjpWYNlqY=;
 b=U97H/ecjOil2PaLM5xttTpIqUYKhjxLrsVunehLpls0/OG2aiDQPQcakuTlms8mCNQYZGsc6b++vxFoA5JUrE0jdo3GPc6rkxrhbExv6z09IDjm+jOm3vgK71q5kMuk8oMLrt7/NeNesCbnAHiWCdd2AHocr/F6Mi3sK5GNsh5XS3RRRftaFo18hi0obsO1aZ//FfkIWheAvCyUW13nUPvfs7/9R6Qaf/GjeBTYLAdvITYj17QYp8OPTPMSeI1dbXeFFDFV8IlE0ZuU/bP5LVmLJZZIgZlpUgqhMe/P0kFEX/XXdc/KnOAx3EXTwWEzFPiq0x+z97h0pWGPhucJPFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DH4tX0f+Yjl315Zj/C/TKfUuJkNU5z3v/zjpWYNlqY=;
 b=w2N6qlsX5QaVNbKWErvz24nKbDz8wX6fnziaDH+6t6XIanu10TE1LJ2tkVRQuBFKy7CnLpiGzYp4HTEQu7h7h4J64On7GHn3I1i90Fj9EQnLXHvemy91y8phGMSo2iL1AyKxAdF1vVdelW6zW63QJVvQ3YOiL3BZbXPNXcglYgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by IA1PR12MB9739.namprd12.prod.outlook.com (2603:10b6:208:465::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:43:00 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0092.017; Thu, 11 Jun 2026
 10:43:00 +0000
Content-Type: multipart/alternative;
 boundary="------------1DqvZFS0UHjArtzg9pXJgsL0"
Message-ID: <9bade19e-74d4-4509-93bf-4e0d224f9da5@amd.com>
Date: Thu, 11 Jun 2026 06:42:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: check hang slow guilt via QUERY_STATE2
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260611090747.947651-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260611090747.947651-1-Jesse.Zhang@amd.com>
X-ClientProxiedBy: YT4P288CA0079.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::9) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|IA1PR12MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: aafbc881-c3d5-402a-28c7-08dec7a634be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|11063799006|56012099006|8096899003;
X-Microsoft-Antispam-Message-Info: KcM45SJzjaLTARrf/deWlnDVDcHJbg7s1kBrwjKm/7oe0aDirlIZ5UIKK7SA2PMggZwuBDpv7Sft8nuxVDfcAydT2bsJbHswPFTTL4bY6nlzJVjtjXGYyMB5fjqvI5J5pbowwcN73kzVn5Lm7HnGDA1WJy/UK6vdw9voIGJPr1MH/+smLSFzllBiH9IEzYJckjLoY1GZZ+mqqyn6C9fLoQh2JaCrLJQM9ZxL+TXB1HxkRfw0LGxvQfyggX0g01CnwoCGjIZZD8YvcByPDZAWysr1yQqPPr049l1mNntCHvSnLVX+vZ8sndPqv1RVDY7Bkjd5vuvPolTAAdOkPV2QyysuOUcwWHr74qKJyvAwdm0i7Zc5L6L2gL8t4hMKKwxRZ95QZh2oK8zRvjfOXAAjvk78WH+28EnoGq/2cLZqA+QisxGCGXdh0opyy16hBNfVIj+RqPZ9tpInLQ2VtkRlSScdp6JwdFEZl2hfclM4sa24NKwMdiaJfvP9i8BM4/YJJIcPLg9uOofaL+y0RCkbgh0YlBY5jqiiOCJKlY8OhMFYBOJ0REPZAQDX8mJXkXla8uHxzyCKRkDaR/zEWCEz8BLqG9AViw0ZrP1mMy4OjsNsQddNkFxJi7OlnnARh8vnAJThD8eut4Fm4J18F0KWGT2sIrgubm+o/ZHZNwpNOG5xW7FvLei1q0daZ6Lh5EjZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHo2eGhVdElpQUp1cS9SK2RERU1MNGNwSW5zTXllcDBESHI2d0tWV3F3RHQr?=
 =?utf-8?B?WmhUS1ZvMElOZ0ViQzIvSEhId1lCUmxPSWZrU253WUFDYVM5Q3hiRVpYMENG?=
 =?utf-8?B?dk1iQzRXTlBaY3p4RkhZWHJxdVd0WVA3dnRsdUNwVHkwa1FTbnhoTUZlVkdJ?=
 =?utf-8?B?cGMvUVlzVkUvRXVydHZsM0NnTnhHQUk2Q1grNCtMT1d0cjdHN0dzSXhuVjk1?=
 =?utf-8?B?aGw3cGNhby9FUHBqR1dEZTZiZzg5eW12UllRVjVoOS8wRVlSZEhqeTBUZVYy?=
 =?utf-8?B?TkJXUGZTZ0hGVVFrZXQvS3hZVWZjaTA4Q0lhbXRuM2w4WmVqR1pUMkZlMDVM?=
 =?utf-8?B?bU5VUHFtdkZ5MGE5ZHYzcWZaUVA5dDlIejNMZXhaREN2TmhtQ1hyRUtORXlP?=
 =?utf-8?B?VFZ0L1A2UDBEK0xXS3pCQ1ViS1ZJWnE3eXJXQjhHT2MvQUxSSnZmVWprbWxP?=
 =?utf-8?B?dkpuZEZJempCbFVxOU9jMVYvTytDK1kzaW5zNHM1elRWQ3AwTGM2WGVUcFdJ?=
 =?utf-8?B?YXdUVGZveFB1VmlYdE9vU2ZHdG9CcFMybERmRjloVVppMkp4MU03ZHlSUURw?=
 =?utf-8?B?MVltSVNUWGFCNkdnREExNnRUMDVrU21iYmlhTXBnTXlsVTZvMk5uK3FvY21u?=
 =?utf-8?B?M2IxZVE3Z1cxZ0FwbFZjUnlWSnJOa0FRRjljcytkVXpHOGlRRGswUmJuZjcr?=
 =?utf-8?B?cXVEbjg4dk91MDc3cTFUQ3kyajJGekNjbklSL3F0SmNQZ014VVlVUDR4bDAx?=
 =?utf-8?B?eWtPL2htTDVJc1NodHE4K3pwcjI5VU9ZVW1tWjdURWxoZTVWV2RtSHFUZGxE?=
 =?utf-8?B?dWsrdk5iUUpKWm0vZURkL0QzWlAvQWp0MVB5NzljN3RYTytXZkJOMGo2ajkv?=
 =?utf-8?B?aHdNZjBiYUJyakNzTjdoVWtKeU1kY3R6b2d1OUJISkR0Zkp0RVRYa05ZZTZn?=
 =?utf-8?B?eE5UZHBGbFNNVnU2ejN5cmJ2R05OS05ENGo3WWl4Uk1LL091eUhhZDNYcW1R?=
 =?utf-8?B?TUNmejExYy9vTVpSSkVpVUhLZy9xeDM5SHRaSUsrS3o0L09jYi9sSUtDQlYw?=
 =?utf-8?B?MnVwWWhnZndVc3FHblRLaUF4T2hnYXdtS3pxN0UzR1BQMFhRSWw5ZU1XMVMv?=
 =?utf-8?B?aGt3TXBsOXNnWTVKZ3ZMYm1Ea1BOTytpU0FFczNsMzlMYS9BZ1V5UnFtMDVj?=
 =?utf-8?B?QTJaVzZpOVZsNjU3SXlMSDlSdUhtRFZwTjNEOTM2S0NnK1puYWhnd1JxVkNx?=
 =?utf-8?B?TGxERWYyZklPSUc3Zk4wN3BobEVERCs3Y2tEdi9qQVByVGFCNDhYaTJFMTEv?=
 =?utf-8?B?eDQ2dndOQ2k5akxZWDhNSjVyMXI1cDJQMXo1SjNwZGVNbVJGb1hQcXo1NERq?=
 =?utf-8?B?cVlSSFZFVklZQXkwUmtOQ2VtV1dDOWVTVlgxZVBsc3NDMElPWm8xYzZIamw3?=
 =?utf-8?B?MXlMellPa0xYb0pob3hoeGpJdGx6THNXWFUxZDdBbVgvUGxoc1haeGc4Z0JF?=
 =?utf-8?B?R25USUh0SFFnSW9QZExPL1JmSHNzWWV6cXYyZmp5WFhoQWEzcXRVVVBVOVNt?=
 =?utf-8?B?Sm1POG9RYkZYSmJ6SEZyb3ZpQzYwM0FyeDFXbk5CMmZDU1hZTlQzd0dwZVF6?=
 =?utf-8?B?TThuSk55bjN3KzYrZHU3V3ZGMmRreThXaWJ5cStYaWhnTWljRE1pZTRKNUtE?=
 =?utf-8?B?Rkx6NjhRbS94NnBiUGNrbk85dDJ5a2pVVXlWNkJNbmZxOWZZei9EMFhnNjQ0?=
 =?utf-8?B?MG1JS080NHN5WHFnenlTTmE5MzRTM1ZNVWF1S21qMHZkdllLYjdmVVlmK0VB?=
 =?utf-8?B?NGtTc2g3S1BNcUQyRGMyYkl5c1dBT1VuSW5OeEY3VlN2YUJOZ1h2c0ZvSmlw?=
 =?utf-8?B?a0RrR05SRmt3azk5elBQWHFUdTFoSE53UEcwWm1IdjdaRXgwQmRaUTFnRzA5?=
 =?utf-8?B?RjVxOE1NdkM0YmtzQmV6RUE3RHpyU01xQWZLTkpUSDlyUytDNjcxWnduaHhx?=
 =?utf-8?B?aWY1UmgyUXNiRWhRV1BsbDRVY282cGJZVnJ0ODI4bUZHYThpeVZRdStOWjhq?=
 =?utf-8?B?eWcvbmlxajRuNXBqU3ZYRlRVYzBtcWhCM0lLTWdrTVZ0bUZZU1VBMDFIdThl?=
 =?utf-8?B?dUZ1bUFaYTVQb3krSVFKejIyYWZlS3RGeE92akV3RHh6SFRTU3BWNWtKVTNa?=
 =?utf-8?B?VWhvdGtJQU1pb0U1NnhYMis0dlRmdEZ3SGQwY2NkZ2QxNEdOdFdLYWtHaWF1?=
 =?utf-8?B?QVNsYWVpR011Mi9XTUV5TFF0VFZwMUpHUmwxTUpEQVVmeGczbUJDSUNvRUlu?=
 =?utf-8?B?MlFwUFdTTWRaMGtZYkZNZTJKWXphUHJyVEVQOVZrV2JrWEVraGtjUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafbc881-c3d5-402a-28c7-08dec7a634be
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:42:59.9631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kl94ahi3IiyJzv17XW7WEGnYkueaYUcK9OKroOYIp+KH+tZZrfIIVtBwTSY5mnr4KacRXIrEs80fWxX2Pv6Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9739
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

--------------1DqvZFS0UHjArtzg9pXJgsL0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please check the compilation with older versions of |libdrm| where |QUERY_STATE2| was not available. We need to add the appropriate |#define| guards and in meson.build  so that the test simply skips or does not run on these systems.
LGTM, Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

On 2026-06-11 05:07, Jesse Zhang wrote:
> amdgpu_memcpy_dispatch_hang_slow_test() submits a hanging dispatch from
> its own context and then verified the reset via the legacy QUERY_STATE
> ioctl (hang_state). That interface is deprecated and cannot attribute a
> reset to a specific context -- it only ever reports UNKNOWN_RESET.
>
> Check guilt via QUERY_STATE2 instead: once the reset has completed (not
> still in progress), the context that owned the hanging dispatch must be
> flagged AMDGPU_CTX_QUERY2_FLAGS_GUILTY.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/compute_utils/amd_dispatch.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
> index 138222cde..76a6c1f55 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch.c
> @@ -489,8 +489,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  static void
>  amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  				      uint32_t ip_type, uint32_t priority,
> -				      int version, uint32_t gpu_reset_status_equel,
> -				      bool user_queue)
> +				      int version, bool user_queue)
>  {
>  	amdgpu_context_handle context_handle;
>  	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
> @@ -677,13 +676,16 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  		r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
>  		igt_assert_eq(r2, 0);
>  
> +		/*
> +		 * The legacy QUERY_STATE ioctl cannot attribute a reset to a
> +		 * specific context, so check guilt via QUERY_STATE2 instead.
> +		 * Once a reset has completed (not still in progress), the
> +		 * context that owned the hanging dispatch must be flagged
> +		 * AMDGPU_CTX_QUERY2_FLAGS_GUILTY.
> +		 */
>  		if (!(reset_flags == 0 ||
>  			  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
> -			/* If we're in reset and reset hasn't occurred, then check
> -			 * that the hang state is equal to the GPU reset status and
> -			 * assert otherwise.
> -			 */
> -			igt_assert_eq(hang_state, gpu_reset_status_equel);
> +			igt_assert(reset_flags & AMDGPU_CTX_QUERY2_FLAGS_GUILTY);
>  		}
>  
>  		r = amdgpu_bo_list_destroy(bo_list);
> @@ -770,7 +772,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  					    ring_id, prio, version,
>  						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
>  		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
> -						      prio, version, AMDGPU_CTX_UNKNOWN_RESET, userq);
> +						      prio, version, userq);
>  
>  		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
>  					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
--------------1DqvZFS0UHjArtzg9pXJgsL0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBBAB" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Please
      check the compilation with older versions of <code dir="ltr" class="KDcb0c" data-sfc-root="c" data-sfc-cb="" data-complete="true" style="font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0.916667px solid rgb(240, 242, 245);" data-sae="" data-copy-service-computed-style="font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0.916667px solid rgb(240, 242, 245);">libdrm</code>
      where <code dir="ltr" class="KDcb0c" data-sfc-root="c" data-sfc-cb="" data-complete="true" style="font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0.916667px solid rgb(240, 242, 245);" data-sae="" data-copy-service-computed-style="font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0.916667px solid rgb(240, 242, 245);">QUERY_STATE2</code>
      was not available. We need to add the appropriate <code dir="ltr" class="KDcb0c" data-sfc-root="c" data-sfc-cb="" data-complete="true" style="font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0.916667px solid rgb(240, 242, 245);" data-sae="" data-copy-service-computed-style="font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0.916667px solid rgb(240, 242, 245);">#define</code>
      guards and in meson.build&nbsp; so that the test simply skips or does
      not run on these systems.<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBBAE" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">LGTM,
      Reviewed-by: Vitaly Prosyak <span class="T286Pc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);"><a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBBAE" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);"><span class="T286Pc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);"><br>
      </span></div>
    <div class="moz-cite-prefix">On 2026-06-11 05:07, Jesse Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260611090747.947651-1-Jesse.Zhang@amd.com">
      <pre wrap="" class="moz-quote-pre">amdgpu_memcpy_dispatch_hang_slow_test() submits a hanging dispatch from
its own context and then verified the reset via the legacy QUERY_STATE
ioctl (hang_state). That interface is deprecated and cannot attribute a
reset to a specific context -- it only ever reports UNKNOWN_RESET.

Check guilt via QUERY_STATE2 instead: once the reset has completed (not
still in progress), the context that owned the hanging dispatch must be
flagged AMDGPU_CTX_QUERY2_FLAGS_GUILTY.

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 138222cde..76a6c1f55 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -489,8 +489,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 static void
 amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, uint32_t priority,
-				      int version, uint32_t gpu_reset_status_equel,
-				      bool user_queue)
+				      int version, bool user_queue)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
@@ -677,13 +676,16 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 		r2 = amdgpu_cs_query_reset_state2(context_handle, &amp;reset_flags);
 		igt_assert_eq(r2, 0);
 
+		/*
+		 * The legacy QUERY_STATE ioctl cannot attribute a reset to a
+		 * specific context, so check guilt via QUERY_STATE2 instead.
+		 * Once a reset has completed (not still in progress), the
+		 * context that owned the hanging dispatch must be flagged
+		 * AMDGPU_CTX_QUERY2_FLAGS_GUILTY.
+		 */
 		if (!(reset_flags == 0 ||
 			  reset_flags &amp; AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
-			/* If we're in reset and reset hasn't occurred, then check
-			 * that the hang state is equal to the GPU reset status and
-			 * assert otherwise.
-			 */
-			igt_assert_eq(hang_state, gpu_reset_status_equel);
+			igt_assert(reset_flags &amp; AMDGPU_CTX_QUERY2_FLAGS_GUILTY);
 		}
 
 		r = amdgpu_bo_list_destroy(bo_list);
@@ -770,7 +772,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 					    ring_id, prio, version,
 						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
-						      prio, version, AMDGPU_CTX_UNKNOWN_RESET, userq);
+						      prio, version, userq);
 
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
 					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
</pre>
    </blockquote>
  </body>
</html>

--------------1DqvZFS0UHjArtzg9pXJgsL0--
