Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED9606A327
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 23:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=shKs9DeT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A7F10E484;
	Wed, 11 Nov 2026 23:32:30 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011070.outbound.protection.outlook.com [52.101.57.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D768610E487
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 23:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA+c8pK97xFzO8xSkUonwQ4/bV/0FWfzr67bJpCfRNzrroKkjDj+Ffu1MMOKutc+uGAa/2RJkaA3QK46wHK/S7Ayvce2vpGs4jbk+AUha0jyPQfRL0HKMqotlHWp9WXGDB4oUp2BJ0Z7xgLz+Ckg5idogiw3bOo38M3qIm9Yg3d81v/28tlGTBUYDwz0pLUek57vx1fkpZczOcqHWhuk//mBAfYLNjGOLhtsDdSekdjf1y2MwN+djuGvHCT3Kzq3lnUlR0mQsRStuAGWMdXlOhnWAl3v7vukJW7+vIgzQSJrWcQTvdue9GAi14fpN8s6amxEiJqEGhrALDWNQxxxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCjdUi9VbgPDiQWsod3npXHHEha7Th+HDVd9b8TuXSE=;
 b=DBLZ0eHQE3Vf6c9RqiMIijR0a23rypqB0ltmOVK8k/vYC85gAvsaRGy8BvQR3WLMDWYqyb3xvB6X5EcrYMyPruwxNic2yDeGLbJhbIFDL8gRtv71fA7u2SFGM/rjxPLl2wOFX+BlGx6GLFBDcSY0qO/mJn6+JkqptZgNTjC8Ej/mqEhxrQrGqTd967Nt17XvB6XBn/EbJUOMjd/TvVFtdLfld8qef4bqDAMhZOuT7/qGMAtMWJx4jAsxGVq2ZKVMXaZU/QKCKYstpGzU29u/tw2/onCQWmVFBaCy8poNsHVfNaWaKKFOe8fjo8cTWBPSHW38rrt4vssd6Y2eRTMRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCjdUi9VbgPDiQWsod3npXHHEha7Th+HDVd9b8TuXSE=;
 b=shKs9DeTdKiq/a/vsY/Rx6LpvgYd/gakI0Z/XjPchLKTGDWwK5ZYPDG4hgCawTs4rslSW71hMMtosmTnDJXP7PX/54mZYf//Qu+YavPeVG1LPGmjCEIrw3uvAOod44pr/oEx9Qprx1Q3alTjP6U/e1ymEEHCExVSfnNLpcRI+6c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB449095.namprd12.prod.outlook.com (2603:10b6:8:4fe::22)
 by SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 23:31:20 +0000
Received: from DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0]) by DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0%4]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 23:31:19 +0000
Content-Type: multipart/alternative;
 boundary="------------tpWGa30DU8nqOC0qSS2QLzso"
Message-ID: <46712990-8d7f-43a2-afb1-e60f7b075c17@amd.com>
Date: Wed, 11 Nov 2026 18:31:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/amdgpu: wait for the dispatch and write
 back the caches on user queues
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
References: <20261111054935.3862301-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20261111054935.3862301-1-Jesse.Zhang@amd.com>
X-ClientProxiedBy: YQBPR0101CA0321.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::9) To DSVPR12MB449095.namprd12.prod.outlook.com
 (2603:10b6:8:4fe::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB449095:EE_|SN7PR12MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 921fbbc5-5ec3-4edb-b77b-08df404be3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|261026121527099003|8096899003|261009223027099003|261022115727099003|261026135527099003|10067099003|261028144727099003|261026140227099003|3023799007|261021135927099003|261021123027099003|261021133027099003|261102123227099003|261022113327099003|261021121427099003|261026130827099003|261022075727099003|261022105027099003|261021130227099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5HE6J2uSxC3aJvHRxWx7tAhmi4L7aOCog3AfC23CuDygmUzc07XCwK7YLxAxllFreTKpqh+JjDDpSno8pmQ4cJZROTAVo++LB9wljTyOHJ4qrcAOnsLLHqKj9K3fcIHiZ6DnN2uILHc+JXfHirsIclWIaQEBX3JFR18AIAiC4yaDgM2vS1/YbdEFwFOJXZQZh7+aYO67y6ENKrGTEH3jPF9ovefDKslgMP+6bMGKD9SKldrhGHzmrkA1hKOqS7lXqA5AiS51rXR2GovZyoRYvfqjJhjT6LwHD9HtD5+3/pbJ3rg2US1I1Nqsov9o3Eq38PCl+cZeRiPoJ5FZ5u83lIJk5UrUpkqO665/XrShfZcBgXhMFXnnnl1V7k9M8i/DfxB0IsD4d9GarvxV76bAdv9Xk0Z/uZB0qgUMJYTGM1EVkk7QkFAwZSVYfh/XasEzeDGV6Qvij1jnvm/8VcM4CgL2SbMsbl9NgU6Jgmal/Fe8iIuzbEfl7vLcr6N9Mv5GO7w/XesH633SnKZPzCC5xuRQkENnFN3y+4qAaq/qBaRibFU7GEtOWfMWFHpbesYU3N9OLmIgSPApKVnY9aHP+SOyAAqmpyflQVd5Bi8wUp1Elo1iEtgQ+uRAvrVsb89X8qaoh8Y0/6/fSGoAQglCgjw4QuNOtHVG+v/Hha2ItaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DSVPR12MB449095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(261026121527099003)(8096899003)(261009223027099003)(261022115727099003)(261026135527099003)(10067099003)(261028144727099003)(261026140227099003)(3023799007)(261021135927099003)(261021123027099003)(261021133027099003)(261102123227099003)(261022113327099003)(261021121427099003)(261026130827099003)(261022075727099003)(261022105027099003)(261021130227099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXZnRVMxU2FuSFhhaXJMQklKaXJLSHg5aG1mRW1ndTl2VEFKUDVORUsvV2RL?=
 =?utf-8?B?elhWS2tMZjY2NFNRTEo5UmU0VHFpbmdSM1lQOHJRV3JXNVltQ1RVMzVFZmo0?=
 =?utf-8?B?ZnFDcFVJSFlYTlcvU3c3WjJlQ2xhOFNPUE9IOEwrR0xINGtjNnZEN0kxcllp?=
 =?utf-8?B?NkI0amYrMWtZeGFCMS9rSWJEZ2Q2b044VFdpNUZDbFFqNGZjMm16NlMwQ2Ex?=
 =?utf-8?B?WmZRZEc0YTcxUWhna05uU0Zzb1Zic3l6Rm5pc2tndzRqakt5RGFpNHJkaWJw?=
 =?utf-8?B?Zm84WFFoZGthTTk2R2pmRFdOZ2t1Z2QyRm9VZ21YMVJqWjdicmZhRUF2UVkv?=
 =?utf-8?B?dUxhMUNFcmk5SmR1NWRDNzdPMEhBSEpNQ1FSdThZOUlUelZySmcwa3BMVXJV?=
 =?utf-8?B?LzhTOUFUNTA4aFFoL1psMU9rcmpLV3doMkdkeU82aXRBaDU4QjA3cFJQbnJF?=
 =?utf-8?B?VEt6QnJuVHZZTkkrTjM2UHFNR3EzVEo3cmI3NGNpbkxHMHdMajRlRmpwOVVo?=
 =?utf-8?B?L1oyRWlvVmFxQThtRFZsK1BGU3dyWVROWFFxK3IzVUNGdXlJZFY1amYrbXN2?=
 =?utf-8?B?SEdUdEtzdkV6Z0hOVklwQ0laSUxITmEyNm1PUVZKNEhBV3ROK3pBNGM5MGI1?=
 =?utf-8?B?Q2lUdXJtUFNsZ1BwOVZKYnE0T3FTL3JpNS9XeUw1MDcyZVhFUEFObEx2Z1BP?=
 =?utf-8?B?Mk55TDN4RmpqdGJUUXFVcmtIcmZMWStmcWhpZVg1VWVuRnZwSFBzQ3c3MGFI?=
 =?utf-8?B?azg5eUVJRnhmYUpRTStGekVCYWU4d1VrQ0l4d3UxOGRqS2YrYmtRN0ZhUGxo?=
 =?utf-8?B?bzNnbXZWaUdGTmVHRS9HVUVvL2VyU2h5a1RaUkZ5TkJQTEUvbnFMUFh5VXgw?=
 =?utf-8?B?dUpuZFZJcWRaelJTVTFOejI1R2tzL1gwUlFwQ2k4K21lSjBEdldMNWY1dWc4?=
 =?utf-8?B?WlRZbmZWTjlXQWNqS3kyS01uQ2U0eXk1bVNPZ1hMK0hMMnFnVTJ4blQ3eHBZ?=
 =?utf-8?B?T294ak5NM21uR0lNbi83b0VHcmNLblAzdFZMQXF6TFhkallGc21CVkZ0blBv?=
 =?utf-8?B?Z0lxak5DZlc3Q1Q2MGI1TGJ2RUNVNktiVUJpYi9wMG14TWxuOURzN1gzZ3BT?=
 =?utf-8?B?eEtpZjNZT08zV1psUFpSY3V5cFF6eVZXL2NubXo2ZFExTm1tWjNoNnE5RGlo?=
 =?utf-8?B?RUovT1J0alVSRGpIVXZSVGdjNmFmb21vU0E0T3FkZXBrU1U5VlpBMFp3UHk4?=
 =?utf-8?B?d1A5cGo3ZGdFaWtGeEQyb1N2MWFSOTEwMEpBZmJZSW54Ujc5QTdWbE9uMjdQ?=
 =?utf-8?B?VmpFN2NmekFaR0YxV0tDUzNZQS85ZG9uaGg2dE1wMTBkTDI1NW9GSHZpR1Iv?=
 =?utf-8?B?cjlvM09rUFRsY3U3OGlLUG5WcHlTdkgxcUtrbCtvb3V5dWV4MmJ3dG1WVmhl?=
 =?utf-8?B?dU9Yd3Arb3UvQUhVeVVHSVdLTjQxWG5GQ3M2dStIcmZVeGN0blRQTHFYUEow?=
 =?utf-8?B?eDBQUm9KWWtWbXBaSWZpc0U1MjdHN2I1aVJFSnZQU3oxbFd5d3V5TlFwYTJQ?=
 =?utf-8?B?M20rQ254WWdURHVTeTQvZGhyQkJjR1V2OTF2T3p6ZWNQRk9UaW9vaTRJZUFH?=
 =?utf-8?B?WXVQS0R6K2pZL1JqTitvbXJLc1hCOHBLQWhldmdFK3RsSHJjalRrNkVjNmR5?=
 =?utf-8?B?dDhXSmhteDBzRzgrbFNKaW5iVDJhbnc2OXdOdWwwUFFDM29DNHJQakRvbmNS?=
 =?utf-8?B?QmVuZ1pIc25CYm1nS0hRcDc5Y2luN293SmNicWNJSDRBV0Q4REhKM3I3eXJh?=
 =?utf-8?B?bDFwVnBIUzBVSmJFVVk0ejVtdUxiVHhRd2JXTlFIVWNJcG5GcTUvaitXYk1H?=
 =?utf-8?B?MndMOUNDNjd2RUxKV1FhcE1IZXI4UitiMFlZYThWZnIrYXloalpUeEdrNzU0?=
 =?utf-8?B?WGwrNXgxdzBMRHF2eGVYWUthUkVIUFFnTTV4MTUyTXJRaWtEUm9QeDhRdjVS?=
 =?utf-8?B?WTFHZ2RxZ1BwZ2lXUlRvYWJQR3MxcGFla3BwcnFnM3VIS3dtVkVSbWtpZElx?=
 =?utf-8?B?dDJXMWhHYVhURlAybUFkdVhIbGFrcGhMOFVIVVQxQ1pZMnFDa1FGVWVmS09s?=
 =?utf-8?B?b0N3T3VhNGwrNmhobk1oV1gvS09OZk0vUGxnNmJmMEhHalFKaTJkV2JPb3lx?=
 =?utf-8?B?UUV6YlpENXJFNUpDR3hpenBlT2tPTTNyMm43Y1ZRb2NPcFBkWTdwajAzSGxG?=
 =?utf-8?B?d1Q5aWZRMU9BbkxjMXZTSzEyblplUFFLMHc2TERsSi9MdmxhaGZzb1QvYmx6?=
 =?utf-8?B?U3VUc1d4aFJ3YUd6KzdTbVhMMEtZTG5mbXg4RFd0L3F0azJtbWUyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921fbbc5-5ec3-4edb-b77b-08df404be3bf
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB449095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 23:31:19.8736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9p+4aW6y+66fI9zCWjVs89Z1iETY4TDiG5CkNIHSdenl1DHrT2vWivAJE7PiNZhI7fbveTs1ZPp6lV22bxAlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------tpWGa30DU8nqOC0qSS2QLzso
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series of 2 patches is:
Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com <mailto:vitaly.prosyak@amd.com>

On 2026-11-11 00:49, Jesse Zhang wrote:
> A user queue only signals its fence after the IB: unlike the kernel fence
> of a kernel queue, it neither waits for the dispatched waves nor writes
> the caches back. So the shader results of the dispatch helpers were never
> visible on user queues, which went unnoticed as their check was skipped.
> On navi31, with the check enabled:
>
>   dst mismatch at byte 0 of 16384: got 0x00, expected 0x22
>
> Add amdgpu_dispatch_write_sync() (CS_PARTIAL_FLUSH, then ACQUIRE_MEM
> writing back and invalidating the caches) and emit it at the end of the
> memset and memcpy dispatch IBs on user queues. Also wait for the page
> table updates of their buffers there, and check the results on user
> queues too.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/compute_utils/amd_dispatch.c       | 85 +++++++++++++------
>  .../compute_utils/amd_dispatch_helpers.c      | 44 ++++++++++
>  .../compute_utils/amd_dispatch_helpers.h      |  2 +
>  3 files changed, 107 insertions(+), 24 deletions(-)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
> index feac6aa2e..9cee17d6f 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch.c
> @@ -115,21 +115,34 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	memset(ptr_cmd, 0, bo_cmd_size);
>  	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
> -					AMDGPU_GEM_DOMAIN_VRAM, 0,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_shader_size, 4096,
> +					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
>  					&bo_shader, &ptr_shader,
> -					&mc_address_shader, &va_shader);
> +					&mc_address_shader, &va_shader,
> +					user_queue ? ring_context->timeline_syncobj_handle : 0,
> +					user_queue ? ++ring_context->point : 0,
> +					user_queue);
>  	igt_assert_eq(r, 0);
>  	memset(ptr_shader, 0, bo_shader_size);
>  
>  	r = amdgpu_dispatch_load_cs_shader(ptr_shader, CS_BUFFERCLEAR, version);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
> -					AMDGPU_GEM_DOMAIN_VRAM, 0,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
> +					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
>  					&bo_dst, (void **)&ptr_dst,
> -					&mc_address_dst, &va_dst);
> +					&mc_address_dst, &va_dst,
> +					user_queue ? ring_context->timeline_syncobj_handle : 0,
> +					user_queue ? ++ring_context->point : 0,
> +					user_queue);
>  	igt_assert_eq(r, 0);
> +	/* A user queue doesn't wait for the page table updates by itself */
> +	if (user_queue) {
> +		r = amdgpu_timeline_syncobj_wait(device_handle,
> +						 ring_context->timeline_syncobj_handle,
> +						 ring_context->point);
> +		igt_assert_eq(r, 0);
> +	}
>  	/// TODO helper function for this bloc
>  	amdgpu_dispatch_init(ip_type, base_cmd, version);
>  
> @@ -178,6 +191,10 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	base_cmd->emit(base_cmd, 1);
>  	base_cmd->emit(base_cmd, 1);
>  
> +	/* Nothing waits for the dispatch on a user queue but the IB itself */
> +	if (user_queue)
> +		amdgpu_dispatch_write_sync(base_cmd, version);
> +
>  	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
>  	resources[0] = bo_dst;
>  	resources[1] = bo_shader;
> @@ -199,8 +216,9 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  
>  	if (user_queue) {
>  		ring_context->pm4_dw = ib_info.size;
> -		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> -				       mc_address_cmd);
> +		r = ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> +						  mc_address_cmd);
> +		igt_assert_eq(r, 0);
>  		seq_no = ring_context->point;
>  	} else {
>  		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
> @@ -232,7 +250,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	}
>  
>  	/* The shader only filled the buffer if the submission completed. */
> -	if (!user_queue && r == 0) {
> +	if (r == 0) {
>  		for (i = 0; i < bo_dst_size; i++)
>  			igt_assert_f(ptr_dst[i] == 0x22,
>  				     "dst mismatch at byte %d of %d: got 0x%02x, expected 0x22\n",
> @@ -320,10 +338,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	memset(ptr_cmd, 0, bo_cmd_size);
>  	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
> -					AMDGPU_GEM_DOMAIN_VRAM, 0,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_shader_size, 4096,
> +					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
>  					&bo_shader, &ptr_shader,
> -					&mc_address_shader, &va_shader);
> +					&mc_address_shader, &va_shader,
> +					user_queue ? ring_context->timeline_syncobj_handle : 0,
> +					user_queue ? ++ring_context->point : 0,
> +					user_queue);
>  	igt_assert_eq(r, 0);
>  	memset(ptr_shader, 0, bo_shader_size);
>  
> @@ -331,17 +352,30 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	r = amdgpu_dispatch_load_cs_shader(ptr_shader, cs_type, version);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
> -					AMDGPU_GEM_DOMAIN_VRAM, 0,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
> +					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
>  					&bo_src, (void **)&ptr_src,
> -					&mc_address_src, &va_src);
> +					&mc_address_src, &va_src,
> +					user_queue ? ring_context->timeline_syncobj_handle : 0,
> +					user_queue ? ++ring_context->point : 0,
> +					user_queue);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
> -					AMDGPU_GEM_DOMAIN_VRAM, 0,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
> +					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
>  					&bo_dst, (void **)&ptr_dst,
> -					&mc_address_dst, &va_dst);
> +					&mc_address_dst, &va_dst,
> +					user_queue ? ring_context->timeline_syncobj_handle : 0,
> +					user_queue ? ++ring_context->point : 0,
> +					user_queue);
>  	igt_assert_eq(r, 0);
> +	/* A user queue doesn't wait for the page table updates by itself */
> +	if (user_queue) {
> +		r = amdgpu_timeline_syncobj_wait(device_handle,
> +						 ring_context->timeline_syncobj_handle,
> +						 ring_context->point);
> +		igt_assert_eq(r, 0);
> +	}
>  	///TODO helper function for this bloc
>  	amdgpu_dispatch_init(ip_type, base_cmd,  version);
>  	/*  Issue commands to set cu mask used in current dispatch */
> @@ -407,6 +441,10 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	base_cmd->emit(base_cmd, 1);
>  	base_cmd->emit(base_cmd, 1);
>  
> +	/* Nothing waits for the dispatch on a user queue but the IB itself */
> +	if (user_queue)
> +		amdgpu_dispatch_write_sync(base_cmd, version);
> +
>  	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP); /* type3 nop packet */
>  
>  	resources[0] = bo_shader;
> @@ -429,8 +467,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	ibs_request.fence_info.handle = NULL;
>  	if (user_queue) {
>  		ring_context->pm4_dw = ib_info.size;
> -		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> -				       mc_address_cmd);
> +		r = ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> +						  mc_address_cmd);
>  		seq_no = ring_context->point;
>  	} else {
>  		r = amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
> @@ -455,10 +493,9 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	}
>  
>  	if (!hang) {
> -		if (!user_queue) {
> -		    igt_assert_eq(r, 0);
> -		    igt_assert_eq(expired, true);
> -		}
> +		igt_assert_eq(r, 0);
> +		if (!user_queue)
> +			igt_assert_eq(expired, true);
>  
>  		/* verify if memcpy test result meets with expected */
>  		i = 0;
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> index 180fbdd40..1105bb54b 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> @@ -99,6 +99,50 @@ amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base, uint32_t version)
>  	return base->cdw - offset_prev;
>  }
>  
> +/*
> + * The fence the kernel emits after a job on a kernel queue waits for the
> + * dispatched waves and writes the caches back. A user queue only signals its
> + * fence after the IB, so the IB has to do that itself before the results can be
> + * read: wait for the dispatches to finish, then write back and invalidate the
> + * caches like the kernel's emit_mem_sync does.
> + */
> +int
> +amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base, uint32_t version)
> +{
> +	int offset_prev = base->cdw;
> +
> +	/* EVENT_WRITE: CS_PARTIAL_FLUSH, wait for the dispatches to finish */
> +	base->emit(base, PACKET3_COMPUTE(PACKET3_EVENT_WRITE, 0));
> +	base->emit(base, 0x7 | (4 << 8));
> +
> +	if (version == 9) {
> +		/* ACQUIRE_MEM: CP_COHER_CNTL SH_ICACHE, SH_KCACHE, TC, TCL1 and TC_WB actions */
> +		base->emit(base, PACKET3_COMPUTE(PACKET3_ACQUIRE_MEM, 5));
> +		base->emit(base, (1 << 29) | (1 << 27) | (1 << 23) | (1 << 22) | (1 << 18));
> +		base->emit(base, 0xffffffff);	/* CP_COHER_SIZE */
> +		base->emit(base, 0xffffff);	/* CP_COHER_SIZE_HI */
> +		base->emit(base, 0);		/* CP_COHER_BASE */
> +		base->emit(base, 0);		/* CP_COHER_BASE_HI */
> +		base->emit(base, 0xa);		/* POLL_INTERVAL */
> +	} else {
> +		/*
> +		 * ACQUIRE_MEM: GCR_CNTL GL2 and GLM write back and invalidate,
> +		 * GL1, GLV, GLK and GLI invalidate
> +		 */
> +		base->emit(base, PACKET3_COMPUTE(PACKET3_ACQUIRE_MEM, 6));
> +		base->emit(base, 0);		/* CP_COHER_CNTL */
> +		base->emit(base, 0xffffffff);	/* CP_COHER_SIZE */
> +		base->emit(base, 0xffffff);	/* CP_COHER_SIZE_HI */
> +		base->emit(base, 0);		/* CP_COHER_BASE */
> +		base->emit(base, 0);		/* CP_COHER_BASE_HI */
> +		base->emit(base, 0xa);		/* POLL_INTERVAL */
> +		base->emit(base, (1 << 15) | (1 << 14) | (1 << 5) | (1 << 4) |
> +			   (1 << 9) | (1 << 8) | (1 << 7) | (1 << 0));
> +	}
> +
> +	return base->cdw - offset_prev;
> +}
> +
>  
>  int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr, uint32_t version, enum  cmd_error_type hang)
>  {
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> index c0113519b..e1c6e37f4 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> +++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> @@ -33,6 +33,8 @@ int amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base *base_cmd, uin
>  
>  int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
>  
> +int amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base_cmd, uint32_t version);
> +
>  int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
>  
>  int execute_compute_dispatch(amdgpu_device_handle device,
--------------tpWGa30DU8nqOC0qSS2QLzso
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>This series of 2 patches is:<br data-sfc-root="c" data-sfc-pl="|||[]" data-complete="true" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(22, 23, 26);">
      Reviewed-by: Vitaly Prosyak <span class="R78TQ" data-sfc-cp="" data-sfc-root="c" data-complete="true" data-sfc-inited="2" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(22, 23, 26);"><span data-sfc-cp="" data-sfc-root="c" data-complete="true" data-sfc-inited="2" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(22, 23, 26);"><a class="gQWhZ moz-txt-link-freetext" target="_blank" rel="noopener" data-sfc-cp="" data-sfc-root="c" data-ved="2ahUKEwiLu4exiYGYAxXBrysGHfwKGsMQy_kOegYIAAgKEAM" data-hveid="CAAIChAD" href="mailto:vitaly.prosyak@amd.com" data-sb="/url?sa=i&amp;source=web&amp;rct=j&amp;url=mailto:vitaly.prosyak@amd.com&amp;ved=2ahUKEwiLu4exiYGYAxXBrysGHfwKGsMQy_kOegYIAAgKEAM&amp;opi=89978449&amp;cd&amp;psig=AOvVaw3JCUyzdst5mLnaslwxsmgm&amp;ust=1794526255129000" data-complete="true" aria-owns="act
 ion-menu-parent-container" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 500; margin: 0px; text-decoration: underline 1px rgb(21, 88, 214); border-bottom: 0px rgb(21, 88, 214);">vitaly.prosyak@amd.com</a></span></span></p>
    <div class="moz-cite-prefix">On 2026-11-11 00:49, Jesse Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261111054935.3862301-1-Jesse.Zhang@amd.com">
      <pre wrap="" class="moz-quote-pre">A user queue only signals its fence after the IB: unlike the kernel fence
of a kernel queue, it neither waits for the dispatched waves nor writes
the caches back. So the shader results of the dispatch helpers were never
visible on user queues, which went unnoticed as their check was skipped.
On navi31, with the check enabled:

  dst mismatch at byte 0 of 16384: got 0x00, expected 0x22

Add amdgpu_dispatch_write_sync() (CS_PARTIAL_FLUSH, then ACQUIRE_MEM
writing back and invalidating the caches) and emit it at the end of the
memset and memcpy dispatch IBs on user queues. Also wait for the page
table updates of their buffers there, and check the results on user
queues too.

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>
---
 lib/amdgpu/compute_utils/amd_dispatch.c       | 85 +++++++++++++------
 .../compute_utils/amd_dispatch_helpers.c      | 44 ++++++++++
 .../compute_utils/amd_dispatch_helpers.h      |  2 +
 3 files changed, 107 insertions(+), 24 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index feac6aa2e..9cee17d6f 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -115,21 +115,34 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	memset(ptr_cmd, 0, bo_cmd_size);
 	base_cmd-&gt;attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&amp;bo_shader, &amp;ptr_shader,
-					&amp;mc_address_shader, &amp;va_shader);
+					&amp;mc_address_shader, &amp;va_shader,
+					user_queue ? ring_context-&gt;timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context-&gt;point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
 	memset(ptr_shader, 0, bo_shader_size);
 
 	r = amdgpu_dispatch_load_cs_shader(ptr_shader, CS_BUFFERCLEAR, version);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&amp;bo_dst, (void **)&amp;ptr_dst,
-					&amp;mc_address_dst, &amp;va_dst);
+					&amp;mc_address_dst, &amp;va_dst,
+					user_queue ? ring_context-&gt;timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context-&gt;point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
+	/* A user queue doesn't wait for the page table updates by itself */
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+						 ring_context-&gt;timeline_syncobj_handle,
+						 ring_context-&gt;point);
+		igt_assert_eq(r, 0);
+	}
 	/// TODO helper function for this bloc
 	amdgpu_dispatch_init(ip_type, base_cmd, version);
 
@@ -178,6 +191,10 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd-&gt;emit(base_cmd, 1);
 	base_cmd-&gt;emit(base_cmd, 1);
 
+	/* Nothing waits for the dispatch on a user queue but the IB itself */
+	if (user_queue)
+		amdgpu_dispatch_write_sync(base_cmd, version);
+
 	base_cmd-&gt;emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
 	resources[0] = bo_dst;
 	resources[1] = bo_shader;
@@ -199,8 +216,9 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 
 	if (user_queue) {
 		ring_context-&gt;pm4_dw = ib_info.size;
-		ip_block-&gt;funcs-&gt;userq_submit(device_handle, ring_context, ip_block-&gt;type,
-				       mc_address_cmd);
+		r = ip_block-&gt;funcs-&gt;userq_submit(device_handle, ring_context, ip_block-&gt;type,
+						  mc_address_cmd);
+		igt_assert_eq(r, 0);
 		seq_no = ring_context-&gt;point;
 	} else {
 		r = amdgpu_cs_submit(context_handle, 0, &amp;ibs_request, 1);
@@ -232,7 +250,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	}
 
 	/* The shader only filled the buffer if the submission completed. */
-	if (!user_queue &amp;&amp; r == 0) {
+	if (r == 0) {
 		for (i = 0; i &lt; bo_dst_size; i++)
 			igt_assert_f(ptr_dst[i] == 0x22,
 				     &quot;dst mismatch at byte %d of %d: got 0x%02x, expected 0x22\n&quot;,
@@ -320,10 +338,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	memset(ptr_cmd, 0, bo_cmd_size);
 	base_cmd-&gt;attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&amp;bo_shader, &amp;ptr_shader,
-					&amp;mc_address_shader, &amp;va_shader);
+					&amp;mc_address_shader, &amp;va_shader,
+					user_queue ? ring_context-&gt;timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context-&gt;point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
 	memset(ptr_shader, 0, bo_shader_size);
 
@@ -331,17 +352,30 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	r = amdgpu_dispatch_load_cs_shader(ptr_shader, cs_type, version);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&amp;bo_src, (void **)&amp;ptr_src,
-					&amp;mc_address_src, &amp;va_src);
+					&amp;mc_address_src, &amp;va_src,
+					user_queue ? ring_context-&gt;timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context-&gt;point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&amp;bo_dst, (void **)&amp;ptr_dst,
-					&amp;mc_address_dst, &amp;va_dst);
+					&amp;mc_address_dst, &amp;va_dst,
+					user_queue ? ring_context-&gt;timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context-&gt;point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
+	/* A user queue doesn't wait for the page table updates by itself */
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+						 ring_context-&gt;timeline_syncobj_handle,
+						 ring_context-&gt;point);
+		igt_assert_eq(r, 0);
+	}
 	///TODO helper function for this bloc
 	amdgpu_dispatch_init(ip_type, base_cmd,  version);
 	/*  Issue commands to set cu mask used in current dispatch */
@@ -407,6 +441,10 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd-&gt;emit(base_cmd, 1);
 	base_cmd-&gt;emit(base_cmd, 1);
 
+	/* Nothing waits for the dispatch on a user queue but the IB itself */
+	if (user_queue)
+		amdgpu_dispatch_write_sync(base_cmd, version);
+
 	base_cmd-&gt;emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP); /* type3 nop packet */
 
 	resources[0] = bo_shader;
@@ -429,8 +467,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	ibs_request.fence_info.handle = NULL;
 	if (user_queue) {
 		ring_context-&gt;pm4_dw = ib_info.size;
-		ip_block-&gt;funcs-&gt;userq_submit(device_handle, ring_context, ip_block-&gt;type,
-				       mc_address_cmd);
+		r = ip_block-&gt;funcs-&gt;userq_submit(device_handle, ring_context, ip_block-&gt;type,
+						  mc_address_cmd);
 		seq_no = ring_context-&gt;point;
 	} else {
 		r = amdgpu_cs_submit(context_handle_in_use, 0, &amp;ibs_request, 1);
@@ -455,10 +493,9 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	}
 
 	if (!hang) {
-		if (!user_queue) {
-		    igt_assert_eq(r, 0);
-		    igt_assert_eq(expired, true);
-		}
+		igt_assert_eq(r, 0);
+		if (!user_queue)
+			igt_assert_eq(expired, true);
 
 		/* verify if memcpy test result meets with expected */
 		i = 0;
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index 180fbdd40..1105bb54b 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -99,6 +99,50 @@ amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base, uint32_t version)
 	return base-&gt;cdw - offset_prev;
 }
 
+/*
+ * The fence the kernel emits after a job on a kernel queue waits for the
+ * dispatched waves and writes the caches back. A user queue only signals its
+ * fence after the IB, so the IB has to do that itself before the results can be
+ * read: wait for the dispatches to finish, then write back and invalidate the
+ * caches like the kernel's emit_mem_sync does.
+ */
+int
+amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base, uint32_t version)
+{
+	int offset_prev = base-&gt;cdw;
+
+	/* EVENT_WRITE: CS_PARTIAL_FLUSH, wait for the dispatches to finish */
+	base-&gt;emit(base, PACKET3_COMPUTE(PACKET3_EVENT_WRITE, 0));
+	base-&gt;emit(base, 0x7 | (4 &lt;&lt; 8));
+
+	if (version == 9) {
+		/* ACQUIRE_MEM: CP_COHER_CNTL SH_ICACHE, SH_KCACHE, TC, TCL1 and TC_WB actions */
+		base-&gt;emit(base, PACKET3_COMPUTE(PACKET3_ACQUIRE_MEM, 5));
+		base-&gt;emit(base, (1 &lt;&lt; 29) | (1 &lt;&lt; 27) | (1 &lt;&lt; 23) | (1 &lt;&lt; 22) | (1 &lt;&lt; 18));
+		base-&gt;emit(base, 0xffffffff);	/* CP_COHER_SIZE */
+		base-&gt;emit(base, 0xffffff);	/* CP_COHER_SIZE_HI */
+		base-&gt;emit(base, 0);		/* CP_COHER_BASE */
+		base-&gt;emit(base, 0);		/* CP_COHER_BASE_HI */
+		base-&gt;emit(base, 0xa);		/* POLL_INTERVAL */
+	} else {
+		/*
+		 * ACQUIRE_MEM: GCR_CNTL GL2 and GLM write back and invalidate,
+		 * GL1, GLV, GLK and GLI invalidate
+		 */
+		base-&gt;emit(base, PACKET3_COMPUTE(PACKET3_ACQUIRE_MEM, 6));
+		base-&gt;emit(base, 0);		/* CP_COHER_CNTL */
+		base-&gt;emit(base, 0xffffffff);	/* CP_COHER_SIZE */
+		base-&gt;emit(base, 0xffffff);	/* CP_COHER_SIZE_HI */
+		base-&gt;emit(base, 0);		/* CP_COHER_BASE */
+		base-&gt;emit(base, 0);		/* CP_COHER_BASE_HI */
+		base-&gt;emit(base, 0xa);		/* POLL_INTERVAL */
+		base-&gt;emit(base, (1 &lt;&lt; 15) | (1 &lt;&lt; 14) | (1 &lt;&lt; 5) | (1 &lt;&lt; 4) |
+			   (1 &lt;&lt; 9) | (1 &lt;&lt; 8) | (1 &lt;&lt; 7) | (1 &lt;&lt; 0));
+	}
+
+	return base-&gt;cdw - offset_prev;
+}
+
 
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr, uint32_t version, enum  cmd_error_type hang)
 {
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
index c0113519b..e1c6e37f4 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -33,6 +33,8 @@ int amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base *base_cmd, uin
 
 int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
+int amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base_cmd, uint32_t version);
+
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
 
 int execute_compute_dispatch(amdgpu_device_handle device,
</pre>
    </blockquote>
  </body>
</html>

--------------tpWGa30DU8nqOC0qSS2QLzso--
