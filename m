Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5728606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 06:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HktVU/xF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4892710E1BE;
	Tue, 17 Nov 2026 06:04:33 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B5610E045
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 06:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lo+bS1+iDBslK9aRuwS5J5bSz6tUCpbufh9WuXETRzrZyxxye4uyIBXRWkrDXU8o3AgHqwuHnDo1gOdIOXKfZPfByBCTw8xrZTVzhu8VWrcrGdJzku8voEMnZwjzP2MoKbkKLmpVkks3G+RexAD2wHmKcBqgETjqJoFLZU+BoZ8dlul15eJ9njEjeqP4JZ5LZYankXPvLUQtqJZNRo974BaER6+OP7gv8UDsCSvJhIh8olkEKKcF5i2JGYIYA1PcWZSgt75+8C35uL5K/XagJJJFlqmWtUbrBorCtRrN82IwtQlFR68Gl6cP+EcokDOX1+OVqCndLdoPziyPz+i1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7rsyLO/rG288z4iS0dXY61fh30mV4VeniZA0o7ssI8=;
 b=yRlh8hW00AVgPQ3niuJHalHE6uRQP8Tnr0gCB6fFQo+o9ghsE+7ShUsSB/iiRVvL8p2M//NYLpNiapE0MzHidT1BT1W7YTrC964HAWdCn9pnObyuSjMZxzvkv2WAQDNLMGCSQ8v+6OSoM4RzproogOpsNYAhBdFrchbCRJUoKVkyianaWg+Gsn9KHHNbmeOz2qTtKltsaIZ2V/93vvLbzbFswmAA+H68MeRh88ZTjrUHkCGcJMPVXFF8iKHPrs3jyJSCZWq/10zV6g5XmOeAGtSUUi+2I8+E8zDd0SL6oEnowU78fFk3xGid+iDgjI2WGu1ixG2F7e5qHe5Z1FBu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7rsyLO/rG288z4iS0dXY61fh30mV4VeniZA0o7ssI8=;
 b=HktVU/xFzYTC1Sgkk1mLhhlMyyHB/Xl7R+JC8W3BHj+NpRv+r27mKN2xFUVUARZ4AuXTLTmI+rmcCR/k2EHVo+SmuRxkxNd3vRpylN/uaY0CIrHEWppE4SWlsvwkMn6eHXnzkDi6Y9yNUIG5PPPScUzClgUl7o5z74QxFKENR3M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 06:01:20 +0000
Received: from IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::dbd3:cc22:a850:dc1e]) by IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::dbd3:cc22:a850:dc1e%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 06:01:19 +0000
Message-ID: <b3627556-c61e-45a1-ad6d-c481a967c1ee@amd.com>
Date: Tue, 17 Nov 2026 11:31:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/6] tests/amdgpu: move the SLTH tests to amd_slth
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20261116081916.2142984-1-Jesse.Zhang@amd.com>
 <20261116081916.2142984-6-Jesse.Zhang@amd.com>
Content-Language: en-US
From: SRINIVASAN SHANMUGAM <srinivasan.shanmugam@amd.com>
In-Reply-To: <20261116081916.2142984-6-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::9) To IA0PR12MB8208.namprd12.prod.outlook.com
 (2603:10b6:208:409::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8208:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: da78f940-a431-40bc-17e9-08df447032b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|11063799006|260925021311599003|260925022911599003|260925021911599003|56012099006|261026121527099003|261026135527099003|261026140227099003|261028144727099003|10067099003|261022115727099003|261021130227099003|261021135927099003|261021133027099003|261022075727099003|261021123027099003|261022113327099003|261021121427099003|261022105027099003|261026130827099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: XEELv6MrBJ+f+dun20bNVfOie/MC0YBUgtr/Ou/9LeLCFTHrMwj9aDpSv01MVYvRvHe5nUSEztvZ3N3jJPbNm9UhaDje0lBjU26rjtoha8gark6meMVLBICUK6k2eySI8NAYIT6ymms6g7mESzakKGskEhZxbB8Gab4DRMJQSzNHSIsgpI5x66tvosY0F+3s40L9uHORCVo+sZW1D+CuXApEBLBnzcZfM68HvYCPn0f1EMo4mHox5Lia0AqKWDcQ1jGeCCoQ9fr299ORSo4TbMNuAFuaWSySxS1STxHXiFJEqJFDO2FfoeY3kN5L+dgYzLJOpyhfEpmDnsrIE7he2I85EBm/AVaEwiABwF37eBdAyvnqRikeiWpNL65m6ett6p1siAmVzM5NlIbQxopRk1PX39RJeie/ruYQDn7oYzLs0i7zXLqe5hU9zv/QlUpXT5zaMAan3w59Rpkz0gVX/E6lcLMpE9Sqm5ZDWD2ILe+4fIFhK86vSUdHGBqAEa7OphYmhlVZ6KG+/i6O7EFRArhe8pw5wXGSug2qRpXSzZby5WXWc72IRm52ZvPUR9uUx00tnAnUkYXk93Q+VxeGt8u9VrM5ciap128UitXh5YdPcOWYFcRO+R298SBVNUr3sslTlK9puid+olYamqO3g2bexlQuAUzDRKfbL6coxm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8208.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261026121527099003)(261026135527099003)(261026140227099003)(261028144727099003)(10067099003)(261022115727099003)(261021130227099003)(261021135927099003)(261021133027099003)(261022075727099003)(261021123027099003)(261022113327099003)(261021121427099003)(261022105027099003)(261026130827099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhjeCtEQ0tac096TmRES1VVMEdiSHM1WHh1NzJ0bmNHTmtYcW9aS2U4djJj?=
 =?utf-8?B?dlZieWxZQi9iMGlSWXlDM1B1WHNheU9lTStiV3IzcHUveS8xTW92WjBZQTYy?=
 =?utf-8?B?WTVOZlhPTllJbXVUWW5TM1JLZXMrWVVsbWljRW9KQzNQd3Z4VXlIako3VTFC?=
 =?utf-8?B?eEFFNHE0SU9GQmZGdkhXZkQ5MTdYMXZvMm9nMC9GV0swdVN2eFpzeVBDOG11?=
 =?utf-8?B?VDVzc2plZUpjVktTWXNmRVJQeCtCS3RPQWVSVzhNYlVkbENJWmtNL2E4N3l6?=
 =?utf-8?B?T2ZUalVvbEdkcm9ISWpOMy9mcVllZVQ1NmM2cEpFY2x4S201blhIWXFwTXhF?=
 =?utf-8?B?V2tSUlFCQ1FxODRRVkhldU9QWGxrUFhpRVhBSVo2VkgvWTd5dFk3RVFRQVpB?=
 =?utf-8?B?L2JCT0VXZEdFNVVrYUlpQmJRZzVucmh4dm9pcVpEZHRZcDFUVlV1WHZhSmhk?=
 =?utf-8?B?YXBPSUliY29MMnZEWHkvUjJlQUwremxsRUdnUXVubm84V2FUVTVXZ2UvMG5W?=
 =?utf-8?B?M0kyQXZwMThabE1OTDVuZkhCUzVmTE5FOHZuaC9YVEJHeDVoc2ZXa21SZFo3?=
 =?utf-8?B?WU5zdVhvZkdBVW5GRnBUOTVVN0VsN1ZQVXdiZXIycHczNmZnMGh5Q1hWTnpU?=
 =?utf-8?B?b0kvQVZHVlRIaFo4SFZzTjVja0lta1ZHbVlMcXcxVXdiNXA4NTliY0t4bGRx?=
 =?utf-8?B?VU1lNG1RdCtQdVdXeHc0LzV5eVlLa1NFSjgrMXBkZHdnYmFWa0RVT3c3SEUx?=
 =?utf-8?B?N05TaTRvUGE5QmNFZ0QvWStBUmRES1loaHBjT2dXeHViL1E1bXRMZ0R0RlFY?=
 =?utf-8?B?Rmg5N0tqSFNScUtCdzhhTnZSQ05LQWpSallnMDlaVjVEN05KcGJwK3ZHaTNI?=
 =?utf-8?B?ZWNhZ3BUZCs2bmlBZVVZbVJxdXNXTkZPMDZnM1F3cUphdEZHSnpxWmNaaENG?=
 =?utf-8?B?VkVVUzVjS05UNExLT1ZxNDhLbHdsbURQUHp6bmxuQmpvaUZMQVVybUNoSU9V?=
 =?utf-8?B?VjRaSElkdFdHaGJEWnpMZFhzWXhJQ3kxUmZjWndwbWRDRHpyQjFGZGhPallp?=
 =?utf-8?B?SWdHbHdZMGZRT3QzQU5oU0UwTGw3b1p2WHQ5NHdSRW5sUmRsbXBxa3IrRTNP?=
 =?utf-8?B?UStxNjdVcE1qZlN1eXNNQUlGZmZnWFVtLzkzenBOazVFKzVPTTlnS0lEdERP?=
 =?utf-8?B?aDVWNDFKZ1hYQnB1K0F0Y3huQ0dhSVhiaTNSZXdHRTVDT3FlWmU3bmNVNDZi?=
 =?utf-8?B?UitoTy91bW82OVBXTHZaVlhtenZpNTFCdGVvejdVZ0FOSngyeFllVzRyOEVU?=
 =?utf-8?B?bTlRQVQrU3Fib2txTHd3UDFMRWFFMHFQd2o3TU9YSkZnMHZwMkV6WThBWmUx?=
 =?utf-8?B?YmMzOU9MbkRtUHlna2F4U2cwME5QTlloSXZIYkRCeEVIQjNkcnI2N3lOeVlG?=
 =?utf-8?B?ZkhFdzlKZWNjYlN5eENWQ0RIblJZbjUvaGFXNnlPSkdmeHpxN0FBaUNOVlZw?=
 =?utf-8?B?WmREZTgyN0VORE5CY0pKZ2tzUE5WaGhUcDZ5MHMvY3ZINWVGTVFEUVM1aHF0?=
 =?utf-8?B?c2IvNVZuQVllL2loZHVLb2hOZm5wVnBvOWFHV3czRXFBWUUyUnpRQTN3cVhm?=
 =?utf-8?B?dUhlZDk1Qy9IQmU5bUZ4WFk3Y3lRWHE0RDMxdCsrU21RMkxRdEMrSi9MVEZT?=
 =?utf-8?B?UXQ1ZUt5K2NCOU1SbGlUcXIrL05GR3BET25wSXlreksyQUgvS1VwWXlRRFpy?=
 =?utf-8?B?bTNpUU5PU0d1ZWlJS1JqUmFVNDdPRWV4K2liR1BGeXMvR1dxU0daWFIxdmgx?=
 =?utf-8?B?NTN4eVVjcU5jV0dHMjVxL3V6MTlYNFNSTDRGSWtrcmRjbzN4MVVjSTBjNVdF?=
 =?utf-8?B?WDFzWGk3VXN3VFhUOS96OHVQR0JNMTFVdEEwMlY2aU5lMXdqWFJmV2VlR1ZB?=
 =?utf-8?B?dUdhRzFyeTJaOVRsTnZ5bUM2RnNTY014a0x0R1NMNHN3L0Y4cUtwTmFmNXgy?=
 =?utf-8?B?ZndJK1UyUXdSMkQvcWhIckk3U2N1MXZDSDMyTWhaZm9EUUNUY1gyYlFMejZt?=
 =?utf-8?B?QzhUaFNWMW5kRld2ZmJGNlgzUGZZYWdyNzRZaFF6QkFPZENHNVBPeXo0NUtQ?=
 =?utf-8?B?OUhtZDZuVHNlQnV4VmJRM25pWnYvQ3NLdEZESXMxa2VST294VzFNWGJveG1l?=
 =?utf-8?B?c2xXdldRa1E2L1ZXeUhYYXJRWmI1UmVBdjEwbGVVVUpHL3NYcFY3cUpacWxq?=
 =?utf-8?B?dDIwUmdHdkhmRVVrVC94S0N0ZTU1RnBRNWFMbHBIVWxIbFkvc2p5a3BWekdB?=
 =?utf-8?Q?3i4gN70g04WIWWTiKI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da78f940-a431-40bc-17e9-08df447032b3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8208.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:01:19.3756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qv4XH6hid/LMG3HnAEqunJ4lb44GcRZH0F6O+VKKTGWnVJ6QQYN6z4lqeOSc2rlP1prW9ShI8XJqndzZPVn54g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552
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


On 11/16/2026 1:48 PM, Jesse Zhang wrote:
> The second-level trap handler tests have grown to seven subtests and
> about 1500 lines of their own helpers, shaders setup and dispatch code,
> none of which is shared with the other amd_basic tests.
>
> Move them to their own amd_slth test. Skip them when the LLVM assembler
> is not available, like amd_mem does, instead of failing on the stub.
> amd_basic is back to what it was before the SLTH tests were added.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>

SLTH test split-out, UMQ coverage additions, and CWSR save-area support 
changes. The updates look good to me.

Series is:
Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

> ---
>   tests/amdgpu/amd_basic.c | 1498 +-----------------------------------
>   tests/amdgpu/amd_slth.c  | 1564 ++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build |    1 +
>   3 files changed, 1566 insertions(+), 1497 deletions(-)
>   create mode 100644 tests/amdgpu/amd_slth.c
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 364ba774b..590163b7b 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -20,28 +20,9 @@
>   #include "lib/amdgpu/amdgpu_asic_addr.h"
>   #include "lib/amdgpu/amd_utils.h"
>   #include "lib/amdgpu/amd_platform.h"
> -#include "lib/amdgpu/shaders/amd_llvm_asm.h"
> -#include "lib/amdgpu/shaders/amd_shader_store.h"
>   
>   #define BUFFER_SIZE (8 * 1024)
>   
> -#define TBA_SIZE (2 * 4096)
> -#define TMA_SIZE (4096)
> -
> -struct slth_bufs {
> -	amdgpu_bo_handle tba_bo;
> -	amdgpu_bo_handle tma_bo;
> -
> -	amdgpu_va_handle tba_va_handle;
> -	amdgpu_va_handle tma_va_handle;
> -
> -	uint64_t tba_mc_addr;
> -	uint64_t tma_mc_addr;
> -
> -	void *tba_cpu;
> -	void *tma_cpu;
> -};
> -
>   /**
>    * MEM ALLOC TEST
>    * @param device
> @@ -865,1453 +846,6 @@ static void amdgpu_fwm_test(amdgpu_device_handle device_handle, unsigned ip_type
>   	free(ring_context);
>   }
>   
> -static void slth_alloc_buffers(amdgpu_device_handle device,
> -			       struct slth_bufs *bufs)
> -{
> -	int r;
> -
> -	memset(bufs, 0, sizeof(*bufs));
> -
> -	r = amdgpu_bo_alloc_and_map(
> -			device,
> -			TBA_SIZE,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_GTT,
> -			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
> -			&bufs->tba_bo,
> -			&bufs->tba_cpu,
> -			&bufs->tba_mc_addr,
> -			&bufs->tba_va_handle);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_alloc_and_map(
> -			device,
> -			TMA_SIZE,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_GTT,
> -			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
> -			&bufs->tma_bo,
> -			&bufs->tma_cpu,
> -			&bufs->tma_mc_addr,
> -			&bufs->tma_va_handle);
> -	igt_assert_eq(r, 0);
> -}
> -
> -static void slth_free_buffers(struct slth_bufs *bufs)
> -{
> -	if (bufs->tba_bo)
> -		amdgpu_bo_unmap_and_free(bufs->tba_bo,
> -					 bufs->tba_va_handle,
> -				bufs->tba_mc_addr,
> -				TBA_SIZE);
> -
> -	if (bufs->tma_bo)
> -		amdgpu_bo_unmap_and_free(bufs->tma_bo,
> -					 bufs->tma_va_handle,
> -				bufs->tma_mc_addr,
> -				TMA_SIZE);
> -}
> -
> -static int vm_set_l2_trap(int fd,
> -			  uint64_t tba_va,
> -		uint64_t tma_va)
> -{
> -	union drm_amdgpu_vm args = {0};
> -
> -	args.in.op = AMDGPU_VM_OP_SET_L2_TRAP;
> -
> -	args.in.l2trap.tba_va = tba_va;
> -	args.in.l2trap.tba_sz = TBA_SIZE;
> -
> -	args.in.l2trap.tma_va = tma_va;
> -	args.in.l2trap.tma_sz = TMA_SIZE;
> -
> -	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
> -}
> -
> -static int vm_clear_l2_trap(int fd)
> -{
> -	union drm_amdgpu_vm args = {0};
> -
> -	args.in.op = AMDGPU_VM_OP_CLEAR_L2_TRAP;
> -
> -	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
> -}
> -
> -static void slth_prepare_tba_with_handler(
> -		amdgpu_device_handle device,
> -		struct slth_bufs *bufs,
> -		const char *handler)
> -{
> -	struct amdgpu_gpu_info info = {0};
> -	char mcpu[32] = {};
> -	uint8_t isa_bin[8192];
> -	size_t isa_sz = 0;
> -	int r;
> -
> -	r = amdgpu_query_gpu_info(device, &info);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_family_id_to_mcpu(info.family_id,
> -				     mcpu,
> -			sizeof(mcpu));
> -	igt_assert_eq(r, 0);
> -
> -	igt_info("family_id=%u mcpu=%s\n",
> -		 info.family_id,
> -			mcpu);
> -
> -	r = amdgpu_llvm_assemble(mcpu,
> -				 handler,
> -			isa_bin,
> -			sizeof(isa_bin),
> -			&isa_sz);
> -
> -	if (r)
> -		igt_info("amdgpu_llvm_assemble failed r=%d\n", r);
> -
> -	igt_assert_eq(r, 0);
> -	igt_assert(isa_sz > 0);
> -
> -	memset(bufs->tba_cpu, 0, TBA_SIZE);
> -	memcpy(bufs->tba_cpu,
> -	       isa_bin,
> -			isa_sz);
> -
> -	memset(bufs->tma_cpu, 0, TMA_SIZE);
> -
> -	igt_info("Trap handler size=%zu\n", isa_sz);
> -}
> -
> -static void slth_prepare_vgpr_proof_shader(amdgpu_device_handle device,
> -					   uint8_t *isa_bin,
> -		size_t *isa_sz)
> -{
> -	struct amdgpu_gpu_info info = {0};
> -	char mcpu[32] = {};
> -	int r;
> -
> -	r = amdgpu_query_gpu_info(device, &info);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_family_id_to_mcpu(info.family_id,
> -				     mcpu,
> -			sizeof(mcpu));
> -	igt_assert_eq(r, 0);
> -
> -	igt_info("===== SLTH VGPR PROOF SHADER BEGIN =====\n");
> -	igt_info("%s\n", SlthVgprProofIsa);
> -	igt_info("SLTH VGPR PROOF ISA DUMP\n");
> -
> -	r = amdgpu_llvm_assemble(mcpu,
> -				 SlthVgprProofIsa,
> -			isa_bin,
> -			8192,
> -			isa_sz);
> -
> -	igt_info("amdgpu_llvm_assemble returned %d\n", r);
> -
> -	if (r) {
> -		igt_info("===== SHADER SOURCE BEGIN =====\n");
> -		igt_info("%s\n", SlthVgprProofIsa);
> -		igt_info("===== SHADER SOURCE END =====\n");
> -	}
> -
> -	igt_assert_eq(r, 0);
> -	igt_assert(*isa_sz > 0);
> -
> -	igt_info("SlthVgprProofIsa size=%zu\n", *isa_sz);
> -
> -	igt_info("SLTH VGPR PROOF ISA DUMP\n");
> -
> -	for (unsigned int i = 0; i < (*isa_sz / sizeof(uint32_t)); i++) {
> -		igt_info("ISA[%u] = 0x%08x\n",
> -			 i,
> -				((uint32_t *)isa_bin)[i]);
> -	}
> -}
> -
> -static uint32_t execute_slth_dispatch(
> -		amdgpu_device_handle device,
> -		uint32_t ip_type,
> -		uint32_t version,
> -		const uint32_t *shader,
> -		uint32_t shader_size)
> -{
> -	const struct amdgpu_ip_block_version *gfx_ip =
> -		get_ip_block(device, AMD_IP_GFX);
> -
> -	amdgpu_context_handle context_handle;
> -
> -	amdgpu_bo_handle bo = NULL;
> -	amdgpu_va_handle va = 0;
> -
> -	void *cpu = NULL;
> -	uint32_t *ptr_pm4 = NULL;
> -	volatile uint32_t *ptr_output = NULL;
> -
> -	uint64_t mc = 0;
> -	uint64_t shader_mc_addr;
> -	uint64_t output_mc_addr;
> -
> -	struct amdgpu_cmd_base *base_cmd;
> -	struct amdgpu_cs_request ib_req = {0};
> -	struct amdgpu_cs_ib_info ib_info = {0};
> -	struct amdgpu_cs_fence fence = {0};
> -
> -	amdgpu_bo_list_handle bo_list = NULL;
> -
> -	amdgpu_bo_handle bos[1];
> -
> -	uint32_t expired = 0;
> -	uint32_t output_value;
> -	int r;
> -
> -	base_cmd = get_cmd_base();
> -	igt_assert(base_cmd);
> -
> -	r = amdgpu_cs_ctx_create(device, &context_handle);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_alloc_and_map(device,
> -				    65536,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_GTT,
> -			0,
> -			&bo,
> -			&cpu,
> -			&mc,
> -			&va);
> -	igt_assert_eq(r, 0);
> -
> -	memset(cpu, 0, 65536);
> -
> -	ptr_pm4 = (uint32_t *)cpu;
> -
> -	memcpy((uint8_t *)cpu + 0x1000,
> -	       shader,
> -			shader_size);
> -
> -	ptr_output =
> -		(volatile uint32_t *)((uint8_t *)cpu + 0x2000);
> -
> -	memset((void *)ptr_output, 0, 4096);
> -
> -	shader_mc_addr = mc + 0x1000;
> -	output_mc_addr = mc + 0x2000;
> -
> -	igt_info("s0 expected address low  = 0x%08x\n",
> -		 lower_32_bits(output_mc_addr));
> -
> -	igt_info("s1 expected address high = 0x%08x\n",
> -		 upper_32_bits(output_mc_addr));
> -
> -	igt_info("========================================\n");
> -	igt_info("SLTH DISPATCH START\n");
> -	igt_info("========================================\n");
> -
> -	igt_info("ip_type        = %u\n", ip_type);
> -	igt_info("version        = %u\n", version);
> -
> -	igt_info("base_mc_addr   = 0x%016llx\n",
> -		 (unsigned long long)mc);
> -
> -	igt_info("shader_mc_addr = 0x%016llx\n",
> -		 (unsigned long long)shader_mc_addr);
> -
> -	igt_info("output_mc_addr = 0x%016llx\n",
> -		 (unsigned long long)output_mc_addr);
> -
> -	igt_info("shader_end     = 0x%016llx\n",
> -		 (unsigned long long)
> -			(shader_mc_addr + shader_size));
> -
> -	igt_info("output_end     = 0x%016llx\n",
> -		 (unsigned long long)
> -			(output_mc_addr + 16384));
> -
> -	base_cmd->attach_buf(base_cmd,
> -			ptr_pm4,
> -			4096);
> -
> -	igt_assert(gfx_ip);
> -	igt_assert(gfx_ip->funcs);
> -	igt_assert(gfx_ip->funcs->gfx_program_compute);
> -	igt_assert(gfx_ip->funcs->gfx_dispatch_direct);
> -
> -	igt_info("========================================\n");
> -	igt_info("NATIVE GFX PROGRAMMING\n");
> -	igt_info("========================================\n");
> -
> -	igt_info("user_data[0] = 0x%08x\n",
> -		 lower_32_bits(output_mc_addr));
> -
> -	igt_info("user_data[1] = 0x%08x\n",
> -		 upper_32_bits(output_mc_addr));
> -
> -	gfx_ip->funcs->gfx_program_compute(
> -			gfx_ip->funcs,
> -			base_cmd,
> -			shader_mc_addr,
> -			output_mc_addr,
> -			0x002c0040,
> -			0x00000010,
> -			1,
> -			1,
> -			1);
> -
> -	igt_info("PM4 dwords after gfx_program_compute = %u\n",
> -		 base_cmd->cdw);
> -
> -	gfx_ip->funcs->gfx_dispatch_direct(
> -			gfx_ip->funcs,
> -			base_cmd,
> -			1,
> -			1,
> -			1,
> -			0);
> -
> -	base_cmd->emit_aligned(base_cmd,
> -			7,
> -			GFX_COMPUTE_NOP);
> -
> -	igt_info("PM4 dwords after dispatch = %u\n",
> -		 base_cmd->cdw);
> -
> -	bos[0] = bo;
> -
> -	r = amdgpu_bo_list_create(device,
> -				  1,
> -			bos,
> -			NULL,
> -			&bo_list);
> -	igt_assert_eq(r, 0);
> -
> -	ib_info.ib_mc_address = mc;
> -	ib_info.size = base_cmd->cdw;
> -
> -	ib_req.ip_type = ip_type;
> -	ib_req.ring = 0;
> -	ib_req.resources = bo_list;
> -	ib_req.number_of_ibs = 1;
> -	ib_req.ibs = &ib_info;
> -
> -	igt_info("========================================\n");
> -	igt_info("PRE-DISPATCH OUTPUT BUFFER\n");
> -	igt_info("========================================\n");
> -
> -	for (int i = 0; i < 16; i++) {
> -		igt_info("PRE[%d] = 0x%08x\n",
> -			 i,
> -				ptr_output[i]);
> -	}
> -
> -	igt_info("========================================\n");
> -	igt_info("IB SUBMIT\n");
> -	igt_info("========================================\n");
> -
> -	igt_info("ib_mc_address = 0x%016llx\n",
> -		 (unsigned long long)ib_info.ib_mc_address);
> -
> -	igt_info("ib_size_dw    = %u\n",
> -		 ib_info.size);
> -
> -	r = amdgpu_cs_submit(context_handle,
> -			     0,
> -			&ib_req,
> -			1);
> -
> -	igt_info("cs_submit ret = %d\n", r);
> -
> -	igt_assert_eq(r, 0);
> -
> -	fence.context = context_handle;
> -	fence.ip_type = ip_type;
> -	fence.ip_instance = 0;
> -	fence.ring = 0;
> -	fence.fence = ib_req.seq_no;
> -
> -	r = amdgpu_cs_query_fence_status(&fence,
> -					 5000000000ULL,
> -			0,
> -			&expired);
> -
> -	igt_info("========================================\n");
> -	igt_info("FENCE STATUS\n");
> -	igt_info("========================================\n");
> -
> -	igt_info("query ret = %d\n", r);
> -	igt_info("expired   = %u\n", expired);
> -
> -	igt_assert_eq(r, 0);
> -	igt_assert_eq(expired, 1);
> -
> -	output_value = ptr_output[0];
> -
> -	igt_info("========================================\n");
> -	igt_info("OUTPUT BUFFER DUMP\n");
> -	igt_info("========================================\n");
> -
> -	for (int i = 0; i < 16; i++) {
> -		igt_info("OUT[%d] = 0x%08x\n",
> -			 i,
> -				ptr_output[i]);
> -	}
> -
> -	igt_info("========================================\n");
> -	igt_info("RESULT\n");
> -	igt_info("========================================\n");
> -
> -	igt_info("output value = 0x%x (%u)\n",
> -		 output_value,
> -			output_value);
> -
> -	if (bo_list)
> -		amdgpu_bo_list_destroy(bo_list);
> -
> -	amdgpu_bo_unmap_and_free(bo,
> -				 va,
> -			mc,
> -			65536);
> -
> -	amdgpu_cs_ctx_free(context_handle);
> -
> -	free_cmd_base(base_cmd);
> -
> -	igt_info("SLTH DISPATCH END\n");
> -
> -	return output_value;
> -}
> -
> -static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
> -					int fd)
> -{
> -	struct slth_bufs bufs;
> -	uint8_t isa_bin[8192];
> -	size_t isa_sz = 0;
> -
> -	struct amdgpu_gpu_info info = {0};
> -	uint32_t version = 12;
> -	uint32_t value;
> -
> -	int ret;
> -	int r;
> -
> -	memset(&bufs, 0, sizeof(bufs));
> -
> -	igt_info("SLTH GFX KQ VGPR PROOF\n");
> -
> -	slth_alloc_buffers(device, &bufs);
> -
> -	slth_prepare_tba_with_handler(device,
> -				      &bufs,
> -			TrapHandlerIsaProof);
> -
> -	ret = vm_set_l2_trap(fd,
> -			     bufs.tba_mc_addr,
> -			bufs.tma_mc_addr);
> -	igt_assert_eq(ret, 0);
> -
> -	slth_prepare_vgpr_proof_shader(device,
> -				       isa_bin,
> -			&isa_sz);
> -
> -	r = amdgpu_query_gpu_info(device, &info);
> -	igt_assert_eq(r, 0);
> -
> -	if (FAMILY_IS_GFX1200(info.family_id))
> -		version = 12;
> -	else if (FAMILY_IS_GFX1150(info.family_id) ||
> -		 FAMILY_IS_GFX1100(info.family_id) ||
> -			FAMILY_IS_GFX1036(info.family_id) ||
> -			FAMILY_IS_GFX1037(info.family_id) ||
> -			FAMILY_IS_YC(info.family_id) ||
> -			info.family_id == FAMILY_GFX1103)
> -		version = 11;
> -	else
> -		version = 10;
> -
> -	igt_info("Running SLTH VGPR proof shader\n");
> -
> -	value = execute_slth_dispatch(device,
> -				      AMDGPU_HW_IP_GFX,
> -			version,
> -			(const uint32_t *)isa_bin,
> -			(uint32_t)isa_sz);
> -
> -	igt_info("VGPR proof output value=%u\n", value);
> -
> -	if (value == 42)
> -		igt_info("SLTH trap handler updated VGPR state, shader resumed successfully\n");
> -	else
> -		igt_info("SLTH GFX KQ VGPR proof failed: expected=42 actual=%u\n",
> -			 value);
> -
> -	igt_assert_eq(value, 42);
> -
> -	ret = vm_clear_l2_trap(fd);
> -	igt_assert_eq(ret, 0);
> -
> -	slth_free_buffers(&bufs);
> -
> -	igt_info("SLTH GFX KQ VGPR PROOF COMPLETE\n");
> -}
> -
> -/*
> - * Run a SLTH shader on a GFX or compute user queue and return the dword it
> - * stores. The second-level trap handler is set per GPUVM, so user queues get
> - * it like kernel queues do. The shader stores to the address in s[0:1].
> - */
> -static uint32_t
> -slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
> -	     void (*prepare_shader)(amdgpu_device_handle device,
> -				    uint8_t *isa_bin, size_t *isa_sz))
> -{
> -	const struct amdgpu_ip_block_version *ip = get_ip_block(device, ip_type);
> -	struct amdgpu_ring_context *ring_context;
> -	struct amdgpu_cmd_base *base_cmd;
> -	struct slth_bufs bufs;
> -	amdgpu_bo_handle bo;
> -	amdgpu_va_handle va;
> -	volatile uint32_t *ptr_output;
> -	uint64_t mc, shader_mc_addr, output_mc_addr;
> -	uint8_t isa_bin[8192];
> -	size_t isa_sz = 0;
> -	uint32_t value;
> -	void *cpu;
> -	int r, i;
> -
> -	igt_assert(ip_type == AMD_IP_GFX || ip_type == AMD_IP_COMPUTE);
> -	igt_assert(ip && ip->funcs);
> -
> -	memset(&bufs, 0, sizeof(bufs));
> -	slth_alloc_buffers(device, &bufs);
> -	slth_prepare_tba_with_handler(device, &bufs, TrapHandlerIsaProof);
> -
> -	r = vm_set_l2_trap(fd, bufs.tba_mc_addr, bufs.tma_mc_addr);
> -	igt_info("SET_L2_TRAP ret=%d\n", r);
> -	igt_assert_eq(r, 0);
> -
> -	prepare_shader(device, isa_bin, &isa_sz);
> -	igt_assert(isa_sz > 0 && isa_sz <= 4096);
> -
> -	ring_context = calloc(1, sizeof(*ring_context));
> -	igt_assert(ring_context);
> -
> -	ip->funcs->userq_create(device, ring_context, ip->type);
> -	igt_info("%s UMQ %u created\n", ip_type == AMD_IP_GFX ? "GFX" : "compute",
> -		 ring_context->queue_id);
> -
> -	/* IB at 0x0, shader at 0x1000, output at 0x2000 */
> -	r = amdgpu_bo_alloc_and_map_sync(device, 65536, 4096,
> -					 AMDGPU_GEM_DOMAIN_GTT,
> -					 AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> -					 AMDGPU_VM_MTYPE_UC,
> -					 &bo, &cpu, &mc, &va,
> -					 ring_context->timeline_syncobj_handle,
> -					 ++ring_context->point, true);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_timeline_syncobj_wait(device,
> -					 ring_context->timeline_syncobj_handle,
> -					 ring_context->point);
> -	igt_assert_eq(r, 0);
> -
> -	memset(cpu, 0, 65536);
> -	memcpy((uint8_t *)cpu + 0x1000, isa_bin, isa_sz);
> -	ptr_output = (volatile uint32_t *)((uint8_t *)cpu + 0x2000);
> -	shader_mc_addr = mc + 0x1000;
> -	output_mc_addr = mc + 0x2000;
> -
> -	base_cmd = get_cmd_base();
> -	igt_assert(base_cmd);
> -	base_cmd->attach_buf(base_cmd, cpu, 4096);
> -
> -	if (ip_type == AMD_IP_GFX) {
> -		ip->funcs->gfx_program_compute(ip->funcs, base_cmd,
> -					       shader_mc_addr, output_mc_addr,
> -					       0x002c0040, 0x00000010, 1, 1, 1);
> -		ip->funcs->gfx_dispatch_direct(ip->funcs, base_cmd, 1, 1, 1, 0);
> -	} else {
> -		/*
> -		 * gfx_program_compute() starts with CONTEXT_CONTROL, a GFX only
> -		 * packet, so program the dispatch like the compute KQ tests.
> -		 */
> -		amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, ip->major);
> -		amdgpu_dispatch_write_cumask(base_cmd, ip->major);
> -		amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, ip->major, 0);
> -
> -		/* COMPUTE_USER_DATA_0..3: s[0:1] = s[2:3] = output address */
> -		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> -		base_cmd->emit(base_cmd, 0x240);
> -		base_cmd->emit(base_cmd, lower_32_bits(output_mc_addr));
> -		base_cmd->emit(base_cmd, upper_32_bits(output_mc_addr));
> -		base_cmd->emit(base_cmd, lower_32_bits(output_mc_addr));
> -		base_cmd->emit(base_cmd, upper_32_bits(output_mc_addr));
> -
> -		/* COMPUTE_RESOURCE_LIMITS */
> -		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> -		base_cmd->emit(base_cmd, 0x215);
> -		base_cmd->emit(base_cmd, 0);
> -
> -		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
> -		base_cmd->emit(base_cmd, 1);
> -		base_cmd->emit(base_cmd, 1);
> -		base_cmd->emit(base_cmd, 1);
> -		base_cmd->emit(base_cmd, 1);
> -	}
> -	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
> -	ring_context->pm4_dw = base_cmd->cdw;
> -
> -	ip->funcs->userq_submit(device, ring_context, ip->type, mc);
> -
> -	r = amdgpu_timeline_syncobj_wait(device,
> -					 ring_context->timeline_syncobj_handle,
> -					 ring_context->point);
> -	igt_assert_eq(r, 0);
> -
> -	for (i = 0; i < 1000 && !ptr_output[0]; i++)
> -		usleep(1000);
> -	value = ptr_output[0];
> -	igt_info("output_value=%u (0x%x)\n", value, value);
> -
> -	amdgpu_bo_unmap_and_free(bo, va, mc, 65536);
> -	free_cmd_base(base_cmd);
> -	ip->funcs->userq_destroy(device, ring_context, ip->type);
> -	free(ring_context);
> -
> -	r = vm_clear_l2_trap(fd);
> -	igt_info("CLEAR_L2_TRAP ret=%d\n", r);
> -	igt_assert_eq(r, 0);
> -	slth_free_buffers(&bufs);
> -
> -	return value;
> -}
> -
> -static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
> -					 int fd)
> -{
> -	uint32_t value;
> -
> -	igt_info("SLTH GFX UMQ VGPR PROOF\n");
> -
> -	value = slth_umq_run(device, fd, AMD_IP_GFX,
> -			     slth_prepare_vgpr_proof_shader);
> -
> -	/* The trap handler sets v2 to 42 before the shader stores it. */
> -	igt_assert_eq(value, 42);
> -
> -	igt_info("SLTH GFX UMQ VGPR PROOF COMPLETE\n");
> -}
> -
> -static void
> -slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
> -			     int fd)
> -{
> -	struct slth_bufs bufs;
> -
> -	amdgpu_context_handle context_handle;
> -
> -	amdgpu_bo_handle bo_dst;
> -	amdgpu_bo_handle bo_shader;
> -	amdgpu_bo_handle bo_cmd;
> -
> -	amdgpu_bo_handle resources[3];
> -
> -	volatile uint32_t *ptr_dst;
> -
> -	void *ptr_shader;
> -	uint32_t *ptr_cmd;
> -
> -	uint64_t mc_address_dst;
> -	uint64_t mc_address_shader;
> -	uint64_t mc_address_cmd;
> -
> -	amdgpu_va_handle va_dst;
> -	amdgpu_va_handle va_shader;
> -	amdgpu_va_handle va_cmd;
> -
> -	amdgpu_bo_list_handle bo_list;
> -
> -	struct amdgpu_cs_request ibs_request = {0};
> -	struct amdgpu_cs_ib_info ib_info = {0};
> -	struct amdgpu_cs_fence fence_status = {0};
> -
> -	struct amdgpu_cmd_base *base_cmd =
> -		get_cmd_base();
> -
> -	uint32_t expired = 0;
> -	uint32_t version = 12;
> -
> -	uint8_t isa_bin[8192];
> -	size_t isa_sz = 0;
> -
> -	int bo_dst_size = 16384;
> -	int bo_shader_size = 4096;
> -	int bo_cmd_size = 4096;
> -
> -	int i;
> -	int r;
> -	int ret;
> -
> -	igt_assert(base_cmd);
> -
> -	memset(&bufs, 0, sizeof(bufs));
> -
> -	igt_info("========================================\n");
> -	igt_info("COMP KQ VGPR PROOF\n");
> -	igt_info("SLTH VGPR PROOF\n");
> -	igt_info("========================================\n");
> -
> -	slth_alloc_buffers(device, &bufs);
> -
> -	slth_prepare_tba_with_handler(device,
> -				      &bufs,
> -			TrapHandlerIsaProof);
> -
> -	ret = vm_set_l2_trap(fd,
> -			     bufs.tba_mc_addr,
> -			bufs.tma_mc_addr);
> -
> -	igt_info("SET_L2_TRAP ret=%d\n", ret);
> -	igt_assert_eq(ret, 0);
> -
> -	slth_prepare_vgpr_proof_shader(device,
> -				       isa_bin,
> -			&isa_sz);
> -
> -	igt_assert(isa_sz > 0);
> -
> -	igt_info("SlthVgprProofIsa size=%zu\n",
> -		 isa_sz);
> -
> -	igt_info("===== SLTH VGPR PROOF ISA BEGIN =====\n");
> -
> -	for (i = 0; i < isa_sz / 4; i++) {
> -		igt_info("ISA[%02d] = 0x%08x\n",
> -			 i,
> -				((uint32_t *)isa_bin)[i]);
> -	}
> -
> -	igt_info("===== SLTH VGPR PROOF ISA END =====\n");
> -
> -	r = amdgpu_cs_ctx_create(device,
> -				 &context_handle);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_alloc_and_map(device,
> -				    bo_cmd_size,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_GTT,
> -			0,
> -			&bo_cmd,
> -			(void **)&ptr_cmd,
> -			&mc_address_cmd,
> -			&va_cmd);
> -	igt_assert_eq(r, 0);
> -
> -	memset(ptr_cmd, 0, bo_cmd_size);
> -
> -	base_cmd->attach_buf(base_cmd,
> -			ptr_cmd,
> -			bo_cmd_size);
> -
> -	r = amdgpu_bo_alloc_and_map(device,
> -				    bo_shader_size,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_VRAM,
> -			0,
> -			&bo_shader,
> -			&ptr_shader,
> -			&mc_address_shader,
> -			&va_shader);
> -	igt_assert_eq(r, 0);
> -
> -	memset(ptr_shader, 0, bo_shader_size);
> -
> -	memcpy(ptr_shader,
> -	       isa_bin,
> -			isa_sz);
> -
> -	igt_info("shader_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_shader);
> -
> -	r = amdgpu_bo_alloc_and_map(device,
> -				    bo_dst_size,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_VRAM,
> -			0,
> -			&bo_dst,
> -			(void **)&ptr_dst,
> -			&mc_address_dst,
> -			&va_dst);
> -	igt_assert_eq(r, 0);
> -
> -	memset((void *)ptr_dst,
> -	       0,
> -			bo_dst_size);
> -
> -	igt_info("output_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_dst);
> -
> -	igt_info("output_lo=0x%08x\n",
> -		 lower_32_bits(mc_address_dst));
> -
> -	igt_info("output_hi=0x%08x\n",
> -		 upper_32_bits(mc_address_dst));
> -
> -	amdgpu_dispatch_init(
> -			AMDGPU_HW_IP_COMPUTE,
> -			base_cmd,
> -			version);
> -
> -	amdgpu_dispatch_write_cumask(
> -			base_cmd,
> -			version);
> -
> -	igt_info("shader_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_shader);
> -
> -	igt_info("output_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_dst);
> -
> -	amdgpu_dispatch_write2hw(
> -			base_cmd,
> -			mc_address_shader,
> -			version,
> -			0);
> -
> -	igt_info("cdw after write2hw = %u\n",
> -		 base_cmd->cdw);
> -
> -	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> -		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
> -			 j,
> -				ptr_cmd[j]);
> -
> -	igt_info("========================================\n");
> -	igt_info("COMPUTE USER DATA PROGRAMMING\n");
> -	igt_info("========================================\n");
> -
> -	igt_info("mc_address_dst      = 0x%016llx\n",
> -		 (unsigned long long)mc_address_dst);
> -
> -	igt_info("dst low dword       = 0x%08x\n",
> -		 (uint32_t)mc_address_dst);
> -
> -	igt_info("dst high dword      = 0x%08x\n",
> -		 (uint32_t)(mc_address_dst >> 32));
> -
> -	igt_info("SET_SH_REG base     = 0x240\n");
> -
> -	base_cmd->emit(base_cmd,
> -			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> -
> -	base_cmd->emit(base_cmd, 0x240);
> -
> -	/*
> -	 * s0:s1 = source address
> -	 */
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)mc_address_dst);
> -
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)(mc_address_dst >> 32));
> -
> -	/*
> -	 * s2:s3 = destination address
> -	 */
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)mc_address_dst);
> -
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)(mc_address_dst >> 32));
> -	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
> -		 (uint32_t)mc_address_dst);
> -
> -	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
> -		 (uint32_t)(mc_address_dst >> 32));
> -
> -	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
> -		 (uint32_t)mc_address_dst);
> -
> -	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
> -		 (uint32_t)(mc_address_dst >> 32));
> -
> -	base_cmd->emit(base_cmd,
> -			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> -
> -	base_cmd->emit(base_cmd, 0x215);
> -	base_cmd->emit(base_cmd, 0);
> -
> -	base_cmd->emit(base_cmd,
> -			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
> -					3));
> -
> -	base_cmd->emit(base_cmd, 1);
> -	base_cmd->emit(base_cmd, 1);
> -	base_cmd->emit(base_cmd, 1);
> -	base_cmd->emit(base_cmd, 1);
> -
> -	base_cmd->emit_aligned(base_cmd,
> -			7,
> -			GFX_COMPUTE_NOP);
> -
> -	igt_info("Dispatch PM4 DW=%u\n",
> -		 base_cmd->cdw);
> -
> -	igt_info("========================================\n");
> -	igt_info("FINAL PM4 DUMP\n");
> -	igt_info("========================================\n");
> -
> -	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> -		igt_info("PM4[%02u] = 0x%08x\n",
> -			 j,
> -				ptr_cmd[j]);
> -
> -	resources[0] = bo_dst;
> -	resources[1] = bo_shader;
> -	resources[2] = bo_cmd;
> -
> -	r = amdgpu_bo_list_create(device,
> -				  3,
> -			resources,
> -			NULL,
> -			&bo_list);
> -
> -	igt_assert_eq(r, 0);
> -
> -	ib_info.ib_mc_address = mc_address_cmd;
> -	ib_info.size = base_cmd->cdw;
> -
> -	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
> -	ibs_request.ring = 0;
> -	ibs_request.resources = bo_list;
> -	ibs_request.number_of_ibs = 1;
> -	ibs_request.ibs = &ib_info;
> -
> -	r = amdgpu_cs_submit(context_handle,
> -			     0,
> -			&ibs_request,
> -			1);
> -
> -	igt_info("cs_submit ret=%d\n", r);
> -	igt_assert_eq(r, 0);
> -
> -	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
> -	fence_status.ip_instance = 0;
> -	fence_status.ring = 0;
> -	fence_status.context = context_handle;
> -	fence_status.fence = ibs_request.seq_no;
> -
> -	r = amdgpu_cs_query_fence_status(
> -			&fence_status,
> -			AMDGPU_TIMEOUT_INFINITE,
> -			0,
> -			&expired);
> -
> -	igt_info("fence ret=%d expired=%u\n",
> -		 r,
> -			expired);
> -
> -	igt_assert_eq(r, 0);
> -	igt_assert_eq(expired, 1);
> -
> -	igt_info("===== OUTPUT DUMP =====\n");
> -
> -	for (i = 0; i < 32; i++) {
> -		igt_info("OUT[%02d]=0x%08x\n",
> -			 i,
> -				ptr_dst[i]);
> -	}
> -
> -	igt_info("output[0]=0x%x (%u)\n",
> -		 ptr_dst[0],
> -			ptr_dst[0]);
> -
> -	igt_assert_eq(ptr_dst[0], 42);
> -
> -	ret = vm_clear_l2_trap(fd);
> -
> -	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
> -	igt_assert_eq(ret, 0);
> -
> -	slth_free_buffers(&bufs);
> -
> -	amdgpu_bo_list_destroy(bo_list);
> -
> -	amdgpu_bo_unmap_and_free(
> -			bo_dst,
> -			va_dst,
> -			mc_address_dst,
> -			bo_dst_size);
> -
> -	amdgpu_bo_unmap_and_free(
> -			bo_shader,
> -			va_shader,
> -			mc_address_shader,
> -			bo_shader_size);
> -
> -	amdgpu_bo_unmap_and_free(
> -			bo_cmd,
> -			va_cmd,
> -			mc_address_cmd,
> -			bo_cmd_size);
> -
> -	amdgpu_cs_ctx_free(context_handle);
> -
> -	free_cmd_base(base_cmd);
> -
> -	igt_info("COMP KQ VGPR PROOF COMPLETE\n");
> -}
> -
> -static void
> -slth_prepare_returnproof_shader(amdgpu_device_handle device,
> -				uint8_t *isa_bin,
> -		size_t *isa_sz)
> -{
> -	struct amdgpu_gpu_info info = {0};
> -	char mcpu[32] = {};
> -	int r;
> -
> -	r = amdgpu_query_gpu_info(device, &info);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_family_id_to_mcpu(info.family_id,
> -				     mcpu,
> -			sizeof(mcpu));
> -	igt_assert_eq(r, 0);
> -
> -	igt_info("===== RETURNPROOF SHADER SOURCE BEGIN =====\n");
> -	igt_info("%s\n", SlthReturnProofIsa);
> -	igt_info("===== RETURNPROOF SHADER SOURCE END =====\n");
> -
> -	r = amdgpu_llvm_assemble(mcpu,
> -				 SlthReturnProofIsa,
> -			isa_bin,
> -			8192,
> -			isa_sz);
> -
> -	igt_info("amdgpu_llvm_assemble returned %d\n", r);
> -
> -	if (r) {
> -		igt_info("===== SHADER SOURCE BEGIN =====\n");
> -		igt_info("%s\n", SlthReturnProofIsa);
> -		igt_info("===== SHADER SOURCE END =====\n");
> -	}
> -
> -	igt_assert_eq(r, 0);
> -	igt_assert(*isa_sz > 0);
> -
> -	igt_info("SlthReturnProofIsa size=%zu\n",
> -		 *isa_sz);
> -
> -	igt_info("RETURNPROOF SHADER ISA DUMP\n");
> -
> -	for (unsigned int i = 0;
> -			i < (*isa_sz / sizeof(uint32_t));
> -			i++) {
> -		igt_info("ISA[%u] = 0x%08x\n",
> -			 i,
> -				((uint32_t *)isa_bin)[i]);
> -	}
> -}
> -
> -static void
> -slth_comp_kq_returnproof_test(amdgpu_device_handle device,
> -			      int fd)
> -{
> -	struct slth_bufs bufs;
> -
> -	amdgpu_context_handle context_handle;
> -
> -	amdgpu_bo_handle bo_dst;
> -	amdgpu_bo_handle bo_shader;
> -	amdgpu_bo_handle bo_cmd;
> -
> -	amdgpu_bo_handle resources[3];
> -
> -	volatile uint32_t *ptr_dst;
> -
> -	void *ptr_shader;
> -	uint32_t *ptr_cmd;
> -
> -	uint64_t mc_address_dst;
> -	uint64_t mc_address_shader;
> -	uint64_t mc_address_cmd;
> -
> -	amdgpu_va_handle va_dst;
> -	amdgpu_va_handle va_shader;
> -	amdgpu_va_handle va_cmd;
> -
> -	amdgpu_bo_list_handle bo_list;
> -
> -	struct amdgpu_cs_request ibs_request = {0};
> -	struct amdgpu_cs_ib_info ib_info = {0};
> -	struct amdgpu_cs_fence fence_status = {0};
> -
> -	struct amdgpu_cmd_base *base_cmd =
> -		get_cmd_base();
> -
> -	uint32_t expired = 0;
> -	uint32_t version = 12;
> -
> -	uint8_t isa_bin[8192];
> -	size_t isa_sz = 0;
> -
> -	int bo_dst_size = 16384;
> -	int bo_shader_size = 4096;
> -	int bo_cmd_size = 4096;
> -
> -	int i;
> -	int r;
> -	int ret;
> -
> -	igt_assert(base_cmd);
> -
> -	memset(&bufs, 0, sizeof(bufs));
> -
> -	igt_info("========================================\n");
> -	igt_info("COMP KQ RETURNPROOF\n");
> -	igt_info("SLTH RETURNPROOF\n");
> -	igt_info("========================================\n");
> -
> -	slth_alloc_buffers(device, &bufs);
> -
> -	slth_prepare_tba_with_handler(device,
> -				      &bufs,
> -			TrapHandlerIsaProof);
> -
> -	ret = vm_set_l2_trap(fd,
> -			     bufs.tba_mc_addr,
> -			bufs.tma_mc_addr);
> -
> -	igt_info("SET_L2_TRAP ret=%d\n", ret);
> -	igt_assert_eq(ret, 0);
> -
> -	slth_prepare_returnproof_shader(device,
> -					isa_bin,
> -			&isa_sz);
> -	igt_assert(isa_sz > 0);
> -
> -	igt_info("SlthReturnProofIsa size=%zu\n", isa_sz);
> -
> -	igt_info("===== RETURNPROOF ISA BEGIN =====\n");
> -
> -	for (i = 0; i < isa_sz / 4; i++) {
> -		igt_info("ISA[%02d] = 0x%08x\n",
> -			 i,
> -				((uint32_t *)isa_bin)[i]);
> -	}
> -
> -	igt_info("===== RETURNPROOF ISA END =====\n");
> -
> -	r = amdgpu_cs_ctx_create(device,
> -				 &context_handle);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_alloc_and_map(device,
> -				    bo_cmd_size,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_GTT,
> -			0,
> -			&bo_cmd,
> -			(void **)&ptr_cmd,
> -			&mc_address_cmd,
> -			&va_cmd);
> -	igt_assert_eq(r, 0);
> -
> -	memset(ptr_cmd, 0, bo_cmd_size);
> -
> -	base_cmd->attach_buf(base_cmd,
> -			ptr_cmd,
> -			bo_cmd_size);
> -
> -	r = amdgpu_bo_alloc_and_map(device,
> -				    bo_shader_size,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_VRAM,
> -			0,
> -			&bo_shader,
> -			&ptr_shader,
> -			&mc_address_shader,
> -			&va_shader);
> -	igt_assert_eq(r, 0);
> -
> -	memset(ptr_shader, 0, bo_shader_size);
> -
> -	memcpy(ptr_shader,
> -	       isa_bin,
> -			isa_sz);
> -
> -	igt_info("shader_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_shader);
> -
> -	r = amdgpu_bo_alloc_and_map(device,
> -				    bo_dst_size,
> -			4096,
> -			AMDGPU_GEM_DOMAIN_VRAM,
> -			0,
> -			&bo_dst,
> -			(void **)&ptr_dst,
> -			&mc_address_dst,
> -			&va_dst);
> -	igt_assert_eq(r, 0);
> -
> -	memset((void *)ptr_dst,
> -	       0,
> -			bo_dst_size);
> -
> -	igt_info("output_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_dst);
> -
> -	igt_info("output_lo=0x%08x\n",
> -		 lower_32_bits(mc_address_dst));
> -
> -	igt_info("output_hi=0x%08x\n",
> -		 upper_32_bits(mc_address_dst));
> -
> -	amdgpu_dispatch_init(
> -			AMDGPU_HW_IP_COMPUTE,
> -			base_cmd,
> -			version);
> -
> -	amdgpu_dispatch_write_cumask(
> -			base_cmd,
> -			version);
> -
> -	igt_info("shader_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_shader);
> -
> -	igt_info("output_mc_addr=0x%016llx\n",
> -		 (unsigned long long)mc_address_dst);
> -
> -	amdgpu_dispatch_write2hw(
> -			base_cmd,
> -			mc_address_shader,
> -			version,
> -			0);
> -
> -	igt_info("cdw after write2hw = %u\n",
> -		 base_cmd->cdw);
> -
> -	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> -		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
> -			 j,
> -				ptr_cmd[j]);
> -
> -	igt_info("========================================\n");
> -	igt_info("COMPUTE USER DATA PROGRAMMING\n");
> -	igt_info("========================================\n");
> -
> -	igt_info("mc_address_dst      = 0x%016llx\n",
> -		 (unsigned long long)mc_address_dst);
> -
> -	igt_info("dst low dword       = 0x%08x\n",
> -		 (uint32_t)mc_address_dst);
> -
> -	igt_info("dst high dword      = 0x%08x\n",
> -		 (uint32_t)(mc_address_dst >> 32));
> -
> -	igt_info("SET_SH_REG base     = 0x240\n");
> -
> -	base_cmd->emit(base_cmd,
> -			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> -
> -	base_cmd->emit(base_cmd, 0x240);
> -
> -	/*
> -	 * s0:s1 = source address
> -	 */
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)mc_address_dst);
> -
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)(mc_address_dst >> 32));
> -
> -	/*
> -	 * s2:s3 = destination address
> -	 */
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)mc_address_dst);
> -
> -	base_cmd->emit(base_cmd,
> -			(uint32_t)(mc_address_dst >> 32));
> -	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
> -		 (uint32_t)mc_address_dst);
> -
> -	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
> -		 (uint32_t)(mc_address_dst >> 32));
> -
> -	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
> -		 (uint32_t)mc_address_dst);
> -
> -	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
> -		 (uint32_t)(mc_address_dst >> 32));
> -
> -	base_cmd->emit(base_cmd,
> -			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> -
> -	base_cmd->emit(base_cmd, 0x215);
> -	base_cmd->emit(base_cmd, 0);
> -
> -	base_cmd->emit(base_cmd,
> -			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
> -					3));
> -
> -	base_cmd->emit(base_cmd, 1);
> -	base_cmd->emit(base_cmd, 1);
> -	base_cmd->emit(base_cmd, 1);
> -	base_cmd->emit(base_cmd, 1);
> -
> -	base_cmd->emit_aligned(base_cmd,
> -			7,
> -			GFX_COMPUTE_NOP);
> -
> -	igt_info("Dispatch PM4 DW=%u\n",
> -		 base_cmd->cdw);
> -
> -	igt_info("========================================\n");
> -	igt_info("FINAL PM4 DUMP\n");
> -	igt_info("========================================\n");
> -
> -	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> -		igt_info("PM4[%02u] = 0x%08x\n",
> -			 j,
> -				ptr_cmd[j]);
> -
> -	resources[0] = bo_dst;
> -	resources[1] = bo_shader;
> -	resources[2] = bo_cmd;
> -
> -	r = amdgpu_bo_list_create(device,
> -				  3,
> -			resources,
> -			NULL,
> -			&bo_list);
> -
> -	igt_assert_eq(r, 0);
> -
> -	ib_info.ib_mc_address = mc_address_cmd;
> -	ib_info.size = base_cmd->cdw;
> -
> -	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
> -	ibs_request.ring = 0;
> -	ibs_request.resources = bo_list;
> -	ibs_request.number_of_ibs = 1;
> -	ibs_request.ibs = &ib_info;
> -
> -	r = amdgpu_cs_submit(context_handle,
> -			     0,
> -			&ibs_request,
> -			1);
> -
> -	igt_info("cs_submit ret=%d\n", r);
> -	igt_assert_eq(r, 0);
> -
> -	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
> -	fence_status.ip_instance = 0;
> -	fence_status.ring = 0;
> -	fence_status.context = context_handle;
> -	fence_status.fence = ibs_request.seq_no;
> -
> -	r = amdgpu_cs_query_fence_status(
> -			&fence_status,
> -			AMDGPU_TIMEOUT_INFINITE,
> -			0,
> -			&expired);
> -
> -	igt_info("fence ret=%d expired=%u\n",
> -		 r,
> -			expired);
> -
> -	igt_assert_eq(r, 0);
> -	igt_assert_eq(expired, 1);
> -
> -	igt_info("===== OUTPUT DUMP =====\n");
> -
> -	for (i = 0; i < 32; i++) {
> -		igt_info("OUT[%02d]=0x%08x\n",
> -			 i,
> -				ptr_dst[i]);
> -	}
> -
> -	igt_info("output[0]=0x%x (%u)\n",
> -		 ptr_dst[0],
> -			ptr_dst[0]);
> -
> -	igt_assert_eq(ptr_dst[0], 2);
> -
> -	ret = vm_clear_l2_trap(fd);
> -
> -	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
> -	igt_assert_eq(ret, 0);
> -
> -	slth_free_buffers(&bufs);
> -
> -	amdgpu_bo_list_destroy(bo_list);
> -
> -	amdgpu_bo_unmap_and_free(
> -			bo_dst,
> -			va_dst,
> -			mc_address_dst,
> -			bo_dst_size);
> -
> -	amdgpu_bo_unmap_and_free(
> -			bo_shader,
> -			va_shader,
> -			mc_address_shader,
> -			bo_shader_size);
> -
> -	amdgpu_bo_unmap_and_free(
> -			bo_cmd,
> -			va_cmd,
> -			mc_address_cmd,
> -			bo_cmd_size);
> -
> -	amdgpu_cs_ctx_free(context_handle);
> -
> -	free_cmd_base(base_cmd);
> -
> -	igt_info("COMP KQ RETURNPROOF COMPLETE\n");
> -}
> -
> -static void
> -slth_gfx_umq_returnproof_test(amdgpu_device_handle device, int fd)
> -{
> -	uint32_t value;
> -
> -	value = slth_umq_run(device, fd, AMD_IP_GFX,
> -			     slth_prepare_returnproof_shader);
> -
> -	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
> -	igt_assert_eq(value, 2);
> -}
> -
> -static void
> -slth_comp_umq_vgpr_proof_test(amdgpu_device_handle device, int fd)
> -{
> -	uint32_t value;
> -
> -	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
> -			     slth_prepare_vgpr_proof_shader);
> -
> -	/* The trap handler sets v2 to 42 before the shader stores it. */
> -	igt_assert_eq(value, 42);
> -}
> -
> -static void
> -slth_comp_umq_returnproof_test(amdgpu_device_handle device, int fd)
> -{
> -	uint32_t value;
> -
> -	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
> -			     slth_prepare_returnproof_shader);
> -
> -	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
> -	igt_assert_eq(value, 2);
> -}
> -
>   int igt_main()
>   {
>   	amdgpu_device_handle device;
> @@ -2455,7 +989,7 @@ int igt_main()
>   	igt_describe("Check-all-user-queues-for-write-operation");
>   	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
>   		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
> -		    userq_arr_cap[AMD_IP_COMPUTE] &&
> +				userq_arr_cap[AMD_IP_COMPUTE] &&
>   				userq_arr_cap[AMD_IP_DMA]) {
>   			igt_dynamic_f("all-queues-with-umq")
>   			amdgpu_test_all_queues(device, true);
> @@ -2478,36 +1012,6 @@ int igt_main()
>   		}
>   	}
>   
> -	igt_subtest("slth-gfx-kq-vgpr-proof")
> -		slth_gfx_kq_vgpr_proof_test(device, fd);
> -
> -	igt_subtest("slth-gfx-umq-vgpr-proof")
> -		slth_gfx_umq_vgpr_proof_test(device, fd);
> -
> -	igt_subtest("slth-comp-kq-vgpr-proof")
> -		slth_comp_kq_vgpr_proof_test(device, fd);
> -
> -	igt_subtest("slth-comp-kq-returnproof")
> -		slth_comp_kq_returnproof_test(device, fd);
> -
> -	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-GFX-user-queue");
> -	igt_subtest("slth-gfx-umq-returnproof") {
> -		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
> -		slth_gfx_umq_returnproof_test(device, fd);
> -	}
> -
> -	igt_describe("Check-SLTH-trap-handler-updates-VGPR-on-compute-user-queue");
> -	igt_subtest("slth-comp-umq-vgpr-proof") {
> -		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
> -		slth_comp_umq_vgpr_proof_test(device, fd);
> -	}
> -
> -	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-compute-user-queue");
> -	igt_subtest("slth-comp-umq-returnproof") {
> -		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
> -		slth_comp_umq_returnproof_test(device, fd);
> -	}
> -
>   	igt_fixture() {
>   		amdgpu_device_deinitialize(device);
>   		drm_close_driver(fd);
> diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
> new file mode 100644
> index 000000000..69b6c0633
> --- /dev/null
> +++ b/tests/amdgpu/amd_slth.c
> @@ -0,0 +1,1564 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +/*
> + * Second-level trap handler (SLTH) tests.
> + *
> + * Install a second-level trap handler for the GPUVM, run a shader which
> + * executes s_trap on GFX and compute kernel and user queues, and check that
> + * the handler ran and that the shader resumed after the trap.
> + */
> +
> +#include "ioctl_wrappers.h"
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_PM4.h"
> +#include "lib/amdgpu/compute_utils/amd_dispatch.h"
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
> +#include "lib/amdgpu/amd_utils.h"
> +#include "lib/amdgpu/amd_platform.h"
> +#include "lib/amdgpu/shaders/amd_shader_store.h"
> +#ifdef AMDGPU_LLVM_ENABLED
> +#include "lib/amdgpu/shaders/amd_llvm_asm.h"
> +#else
> +#include "lib/amdgpu/shaders/amd_llvm_asm_stub.h"
> +#endif
> +
> +#define TBA_SIZE (2 * 4096)
> +#define TMA_SIZE (4096)
> +
> +struct slth_bufs {
> +	amdgpu_bo_handle tba_bo;
> +	amdgpu_bo_handle tma_bo;
> +
> +	amdgpu_va_handle tba_va_handle;
> +	amdgpu_va_handle tma_va_handle;
> +
> +	uint64_t tba_mc_addr;
> +	uint64_t tma_mc_addr;
> +
> +	void *tba_cpu;
> +	void *tma_cpu;
> +};
> +
> +static void slth_alloc_buffers(amdgpu_device_handle device,
> +			       struct slth_bufs *bufs)
> +{
> +	int r;
> +
> +	memset(bufs, 0, sizeof(*bufs));
> +
> +	r = amdgpu_bo_alloc_and_map(
> +			device,
> +			TBA_SIZE,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
> +			&bufs->tba_bo,
> +			&bufs->tba_cpu,
> +			&bufs->tba_mc_addr,
> +			&bufs->tba_va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(
> +			device,
> +			TMA_SIZE,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
> +			&bufs->tma_bo,
> +			&bufs->tma_cpu,
> +			&bufs->tma_mc_addr,
> +			&bufs->tma_va_handle);
> +	igt_assert_eq(r, 0);
> +}
> +
> +static void slth_free_buffers(struct slth_bufs *bufs)
> +{
> +	if (bufs->tba_bo)
> +		amdgpu_bo_unmap_and_free(bufs->tba_bo,
> +					 bufs->tba_va_handle,
> +				bufs->tba_mc_addr,
> +				TBA_SIZE);
> +
> +	if (bufs->tma_bo)
> +		amdgpu_bo_unmap_and_free(bufs->tma_bo,
> +					 bufs->tma_va_handle,
> +				bufs->tma_mc_addr,
> +				TMA_SIZE);
> +}
> +
> +static int vm_set_l2_trap(int fd,
> +			  uint64_t tba_va,
> +		uint64_t tma_va)
> +{
> +	union drm_amdgpu_vm args = {0};
> +
> +	args.in.op = AMDGPU_VM_OP_SET_L2_TRAP;
> +
> +	args.in.l2trap.tba_va = tba_va;
> +	args.in.l2trap.tba_sz = TBA_SIZE;
> +
> +	args.in.l2trap.tma_va = tma_va;
> +	args.in.l2trap.tma_sz = TMA_SIZE;
> +
> +	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
> +}
> +
> +static int vm_clear_l2_trap(int fd)
> +{
> +	union drm_amdgpu_vm args = {0};
> +
> +	args.in.op = AMDGPU_VM_OP_CLEAR_L2_TRAP;
> +
> +	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
> +}
> +
> +static void slth_prepare_tba_with_handler(
> +		amdgpu_device_handle device,
> +		struct slth_bufs *bufs,
> +		const char *handler)
> +{
> +	struct amdgpu_gpu_info info = {0};
> +	char mcpu[32] = {};
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +	int r;
> +
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_family_id_to_mcpu(info.family_id,
> +				     mcpu,
> +			sizeof(mcpu));
> +	igt_assert_eq(r, 0);
> +
> +	igt_info("family_id=%u mcpu=%s\n",
> +		 info.family_id,
> +			mcpu);
> +
> +	r = amdgpu_llvm_assemble(mcpu,
> +				 handler,
> +			isa_bin,
> +			sizeof(isa_bin),
> +			&isa_sz);
> +
> +	if (r)
> +		igt_info("amdgpu_llvm_assemble failed r=%d\n", r);
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert(isa_sz > 0);
> +
> +	memset(bufs->tba_cpu, 0, TBA_SIZE);
> +	memcpy(bufs->tba_cpu,
> +	       isa_bin,
> +			isa_sz);
> +
> +	memset(bufs->tma_cpu, 0, TMA_SIZE);
> +
> +	igt_info("Trap handler size=%zu\n", isa_sz);
> +}
> +
> +static void slth_prepare_vgpr_proof_shader(amdgpu_device_handle device,
> +					   uint8_t *isa_bin,
> +		size_t *isa_sz)
> +{
> +	struct amdgpu_gpu_info info = {0};
> +	char mcpu[32] = {};
> +	int r;
> +
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_family_id_to_mcpu(info.family_id,
> +				     mcpu,
> +			sizeof(mcpu));
> +	igt_assert_eq(r, 0);
> +
> +	igt_info("===== SLTH VGPR PROOF SHADER BEGIN =====\n");
> +	igt_info("%s\n", SlthVgprProofIsa);
> +	igt_info("SLTH VGPR PROOF ISA DUMP\n");
> +
> +	r = amdgpu_llvm_assemble(mcpu,
> +				 SlthVgprProofIsa,
> +			isa_bin,
> +			8192,
> +			isa_sz);
> +
> +	igt_info("amdgpu_llvm_assemble returned %d\n", r);
> +
> +	if (r) {
> +		igt_info("===== SHADER SOURCE BEGIN =====\n");
> +		igt_info("%s\n", SlthVgprProofIsa);
> +		igt_info("===== SHADER SOURCE END =====\n");
> +	}
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert(*isa_sz > 0);
> +
> +	igt_info("SlthVgprProofIsa size=%zu\n", *isa_sz);
> +
> +	igt_info("SLTH VGPR PROOF ISA DUMP\n");
> +
> +	for (unsigned int i = 0; i < (*isa_sz / sizeof(uint32_t)); i++) {
> +		igt_info("ISA[%u] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
> +	}
> +}
> +
> +static uint32_t execute_slth_dispatch(
> +		amdgpu_device_handle device,
> +		uint32_t ip_type,
> +		uint32_t version,
> +		const uint32_t *shader,
> +		uint32_t shader_size)
> +{
> +	const struct amdgpu_ip_block_version *gfx_ip =
> +		get_ip_block(device, AMD_IP_GFX);
> +
> +	amdgpu_context_handle context_handle;
> +
> +	amdgpu_bo_handle bo = NULL;
> +	amdgpu_va_handle va = 0;
> +
> +	void *cpu = NULL;
> +	uint32_t *ptr_pm4 = NULL;
> +	volatile uint32_t *ptr_output = NULL;
> +
> +	uint64_t mc = 0;
> +	uint64_t shader_mc_addr;
> +	uint64_t output_mc_addr;
> +
> +	struct amdgpu_cmd_base *base_cmd;
> +	struct amdgpu_cs_request ib_req = {0};
> +	struct amdgpu_cs_ib_info ib_info = {0};
> +	struct amdgpu_cs_fence fence = {0};
> +
> +	amdgpu_bo_list_handle bo_list = NULL;
> +
> +	amdgpu_bo_handle bos[1];
> +
> +	uint32_t expired = 0;
> +	uint32_t output_value;
> +	int r;
> +
> +	base_cmd = get_cmd_base();
> +	igt_assert(base_cmd);
> +
> +	r = amdgpu_cs_ctx_create(device, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    65536,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			0,
> +			&bo,
> +			&cpu,
> +			&mc,
> +			&va);
> +	igt_assert_eq(r, 0);
> +
> +	memset(cpu, 0, 65536);
> +
> +	ptr_pm4 = (uint32_t *)cpu;
> +
> +	memcpy((uint8_t *)cpu + 0x1000,
> +	       shader,
> +			shader_size);
> +
> +	ptr_output =
> +		(volatile uint32_t *)((uint8_t *)cpu + 0x2000);
> +
> +	memset((void *)ptr_output, 0, 4096);
> +
> +	shader_mc_addr = mc + 0x1000;
> +	output_mc_addr = mc + 0x2000;
> +
> +	igt_info("s0 expected address low  = 0x%08x\n",
> +		 lower_32_bits(output_mc_addr));
> +
> +	igt_info("s1 expected address high = 0x%08x\n",
> +		 upper_32_bits(output_mc_addr));
> +
> +	igt_info("========================================\n");
> +	igt_info("SLTH DISPATCH START\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("ip_type        = %u\n", ip_type);
> +	igt_info("version        = %u\n", version);
> +
> +	igt_info("base_mc_addr   = 0x%016llx\n",
> +		 (unsigned long long)mc);
> +
> +	igt_info("shader_mc_addr = 0x%016llx\n",
> +		 (unsigned long long)shader_mc_addr);
> +
> +	igt_info("output_mc_addr = 0x%016llx\n",
> +		 (unsigned long long)output_mc_addr);
> +
> +	igt_info("shader_end     = 0x%016llx\n",
> +		 (unsigned long long)
> +			(shader_mc_addr + shader_size));
> +
> +	igt_info("output_end     = 0x%016llx\n",
> +		 (unsigned long long)
> +			(output_mc_addr + 16384));
> +
> +	base_cmd->attach_buf(base_cmd,
> +			ptr_pm4,
> +			4096);
> +
> +	igt_assert(gfx_ip);
> +	igt_assert(gfx_ip->funcs);
> +	igt_assert(gfx_ip->funcs->gfx_program_compute);
> +	igt_assert(gfx_ip->funcs->gfx_dispatch_direct);
> +
> +	igt_info("========================================\n");
> +	igt_info("NATIVE GFX PROGRAMMING\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("user_data[0] = 0x%08x\n",
> +		 lower_32_bits(output_mc_addr));
> +
> +	igt_info("user_data[1] = 0x%08x\n",
> +		 upper_32_bits(output_mc_addr));
> +
> +	gfx_ip->funcs->gfx_program_compute(
> +			gfx_ip->funcs,
> +			base_cmd,
> +			shader_mc_addr,
> +			output_mc_addr,
> +			0x002c0040,
> +			0x00000010,
> +			1,
> +			1,
> +			1);
> +
> +	igt_info("PM4 dwords after gfx_program_compute = %u\n",
> +		 base_cmd->cdw);
> +
> +	gfx_ip->funcs->gfx_dispatch_direct(
> +			gfx_ip->funcs,
> +			base_cmd,
> +			1,
> +			1,
> +			1,
> +			0);
> +
> +	base_cmd->emit_aligned(base_cmd,
> +			7,
> +			GFX_COMPUTE_NOP);
> +
> +	igt_info("PM4 dwords after dispatch = %u\n",
> +		 base_cmd->cdw);
> +
> +	bos[0] = bo;
> +
> +	r = amdgpu_bo_list_create(device,
> +				  1,
> +			bos,
> +			NULL,
> +			&bo_list);
> +	igt_assert_eq(r, 0);
> +
> +	ib_info.ib_mc_address = mc;
> +	ib_info.size = base_cmd->cdw;
> +
> +	ib_req.ip_type = ip_type;
> +	ib_req.ring = 0;
> +	ib_req.resources = bo_list;
> +	ib_req.number_of_ibs = 1;
> +	ib_req.ibs = &ib_info;
> +
> +	igt_info("========================================\n");
> +	igt_info("PRE-DISPATCH OUTPUT BUFFER\n");
> +	igt_info("========================================\n");
> +
> +	for (int i = 0; i < 16; i++) {
> +		igt_info("PRE[%d] = 0x%08x\n",
> +			 i,
> +				ptr_output[i]);
> +	}
> +
> +	igt_info("========================================\n");
> +	igt_info("IB SUBMIT\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("ib_mc_address = 0x%016llx\n",
> +		 (unsigned long long)ib_info.ib_mc_address);
> +
> +	igt_info("ib_size_dw    = %u\n",
> +		 ib_info.size);
> +
> +	r = amdgpu_cs_submit(context_handle,
> +			     0,
> +			&ib_req,
> +			1);
> +
> +	igt_info("cs_submit ret = %d\n", r);
> +
> +	igt_assert_eq(r, 0);
> +
> +	fence.context = context_handle;
> +	fence.ip_type = ip_type;
> +	fence.ip_instance = 0;
> +	fence.ring = 0;
> +	fence.fence = ib_req.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(&fence,
> +					 5000000000ULL,
> +			0,
> +			&expired);
> +
> +	igt_info("========================================\n");
> +	igt_info("FENCE STATUS\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("query ret = %d\n", r);
> +	igt_info("expired   = %u\n", expired);
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(expired, 1);
> +
> +	output_value = ptr_output[0];
> +
> +	igt_info("========================================\n");
> +	igt_info("OUTPUT BUFFER DUMP\n");
> +	igt_info("========================================\n");
> +
> +	for (int i = 0; i < 16; i++) {
> +		igt_info("OUT[%d] = 0x%08x\n",
> +			 i,
> +				ptr_output[i]);
> +	}
> +
> +	igt_info("========================================\n");
> +	igt_info("RESULT\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("output value = 0x%x (%u)\n",
> +		 output_value,
> +			output_value);
> +
> +	if (bo_list)
> +		amdgpu_bo_list_destroy(bo_list);
> +
> +	amdgpu_bo_unmap_and_free(bo,
> +				 va,
> +			mc,
> +			65536);
> +
> +	amdgpu_cs_ctx_free(context_handle);
> +
> +	free_cmd_base(base_cmd);
> +
> +	igt_info("SLTH DISPATCH END\n");
> +
> +	return output_value;
> +}
> +
> +static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
> +					int fd)
> +{
> +	struct slth_bufs bufs;
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +
> +	struct amdgpu_gpu_info info = {0};
> +	uint32_t version = 12;
> +	uint32_t value;
> +
> +	int ret;
> +	int r;
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +
> +	igt_info("SLTH GFX KQ VGPR PROOF\n");
> +
> +	slth_alloc_buffers(device, &bufs);
> +
> +	slth_prepare_tba_with_handler(device,
> +				      &bufs,
> +			TrapHandlerIsaProof);
> +
> +	ret = vm_set_l2_trap(fd,
> +			     bufs.tba_mc_addr,
> +			bufs.tma_mc_addr);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_prepare_vgpr_proof_shader(device,
> +				       isa_bin,
> +			&isa_sz);
> +
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
> +
> +	if (FAMILY_IS_GFX1200(info.family_id))
> +		version = 12;
> +	else if (FAMILY_IS_GFX1150(info.family_id) ||
> +		 FAMILY_IS_GFX1100(info.family_id) ||
> +			FAMILY_IS_GFX1036(info.family_id) ||
> +			FAMILY_IS_GFX1037(info.family_id) ||
> +			FAMILY_IS_YC(info.family_id) ||
> +			info.family_id == FAMILY_GFX1103)
> +		version = 11;
> +	else
> +		version = 10;
> +
> +	igt_info("Running SLTH VGPR proof shader\n");
> +
> +	value = execute_slth_dispatch(device,
> +				      AMDGPU_HW_IP_GFX,
> +			version,
> +			(const uint32_t *)isa_bin,
> +			(uint32_t)isa_sz);
> +
> +	igt_info("VGPR proof output value=%u\n", value);
> +
> +	if (value == 42)
> +		igt_info("SLTH trap handler updated VGPR state, shader resumed successfully\n");
> +	else
> +		igt_info("SLTH GFX KQ VGPR proof failed: expected=42 actual=%u\n",
> +			 value);
> +
> +	igt_assert_eq(value, 42);
> +
> +	ret = vm_clear_l2_trap(fd);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_free_buffers(&bufs);
> +
> +	igt_info("SLTH GFX KQ VGPR PROOF COMPLETE\n");
> +}
> +
> +/*
> + * Run a SLTH shader on a GFX or compute user queue and return the dword it
> + * stores. The second-level trap handler is set per GPUVM, so user queues get
> + * it like kernel queues do. The shader stores to the address in s[0:1].
> + */
> +static uint32_t
> +slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
> +	     void (*prepare_shader)(amdgpu_device_handle device,
> +				    uint8_t *isa_bin, size_t *isa_sz))
> +{
> +	const struct amdgpu_ip_block_version *ip = get_ip_block(device, ip_type);
> +	struct amdgpu_ring_context *ring_context;
> +	struct amdgpu_cmd_base *base_cmd;
> +	struct slth_bufs bufs;
> +	amdgpu_bo_handle bo;
> +	amdgpu_va_handle va;
> +	volatile uint32_t *ptr_output;
> +	uint64_t mc, shader_mc_addr, output_mc_addr;
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +	uint32_t value;
> +	void *cpu;
> +	int r, i;
> +
> +	igt_assert(ip_type == AMD_IP_GFX || ip_type == AMD_IP_COMPUTE);
> +	igt_assert(ip && ip->funcs);
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +	slth_alloc_buffers(device, &bufs);
> +	slth_prepare_tba_with_handler(device, &bufs, TrapHandlerIsaProof);
> +
> +	r = vm_set_l2_trap(fd, bufs.tba_mc_addr, bufs.tma_mc_addr);
> +	igt_info("SET_L2_TRAP ret=%d\n", r);
> +	igt_assert_eq(r, 0);
> +
> +	prepare_shader(device, isa_bin, &isa_sz);
> +	igt_assert(isa_sz > 0 && isa_sz <= 4096);
> +
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	igt_assert(ring_context);
> +
> +	ip->funcs->userq_create(device, ring_context, ip->type);
> +	igt_info("%s UMQ %u created\n", ip_type == AMD_IP_GFX ? "GFX" : "compute",
> +		 ring_context->queue_id);
> +
> +	/* IB at 0x0, shader at 0x1000, output at 0x2000 */
> +	r = amdgpu_bo_alloc_and_map_sync(device, 65536, 4096,
> +					 AMDGPU_GEM_DOMAIN_GTT,
> +					 AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +					 AMDGPU_VM_MTYPE_UC,
> +					 &bo, &cpu, &mc, &va,
> +					 ring_context->timeline_syncobj_handle,
> +					 ++ring_context->point, true);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_timeline_syncobj_wait(device,
> +					 ring_context->timeline_syncobj_handle,
> +					 ring_context->point);
> +	igt_assert_eq(r, 0);
> +
> +	memset(cpu, 0, 65536);
> +	memcpy((uint8_t *)cpu + 0x1000, isa_bin, isa_sz);
> +	ptr_output = (volatile uint32_t *)((uint8_t *)cpu + 0x2000);
> +	shader_mc_addr = mc + 0x1000;
> +	output_mc_addr = mc + 0x2000;
> +
> +	base_cmd = get_cmd_base();
> +	igt_assert(base_cmd);
> +	base_cmd->attach_buf(base_cmd, cpu, 4096);
> +
> +	if (ip_type == AMD_IP_GFX) {
> +		ip->funcs->gfx_program_compute(ip->funcs, base_cmd,
> +					       shader_mc_addr, output_mc_addr,
> +					       0x002c0040, 0x00000010, 1, 1, 1);
> +		ip->funcs->gfx_dispatch_direct(ip->funcs, base_cmd, 1, 1, 1, 0);
> +	} else {
> +		/*
> +		 * gfx_program_compute() starts with CONTEXT_CONTROL, a GFX only
> +		 * packet, so program the dispatch like the compute KQ tests.
> +		 */
> +		amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, ip->major);
> +		amdgpu_dispatch_write_cumask(base_cmd, ip->major);
> +		amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, ip->major, 0);
> +
> +		/* COMPUTE_USER_DATA_0..3: s[0:1] = s[2:3] = output address */
> +		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> +		base_cmd->emit(base_cmd, 0x240);
> +		base_cmd->emit(base_cmd, lower_32_bits(output_mc_addr));
> +		base_cmd->emit(base_cmd, upper_32_bits(output_mc_addr));
> +		base_cmd->emit(base_cmd, lower_32_bits(output_mc_addr));
> +		base_cmd->emit(base_cmd, upper_32_bits(output_mc_addr));
> +
> +		/* COMPUTE_RESOURCE_LIMITS */
> +		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +		base_cmd->emit(base_cmd, 0x215);
> +		base_cmd->emit(base_cmd, 0);
> +
> +		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
> +		base_cmd->emit(base_cmd, 1);
> +		base_cmd->emit(base_cmd, 1);
> +		base_cmd->emit(base_cmd, 1);
> +		base_cmd->emit(base_cmd, 1);
> +	}
> +	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
> +	ring_context->pm4_dw = base_cmd->cdw;
> +
> +	ip->funcs->userq_submit(device, ring_context, ip->type, mc);
> +
> +	r = amdgpu_timeline_syncobj_wait(device,
> +					 ring_context->timeline_syncobj_handle,
> +					 ring_context->point);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < 1000 && !ptr_output[0]; i++)
> +		usleep(1000);
> +	value = ptr_output[0];
> +	igt_info("output_value=%u (0x%x)\n", value, value);
> +
> +	amdgpu_bo_unmap_and_free(bo, va, mc, 65536);
> +	free_cmd_base(base_cmd);
> +	ip->funcs->userq_destroy(device, ring_context, ip->type);
> +	free(ring_context);
> +
> +	r = vm_clear_l2_trap(fd);
> +	igt_info("CLEAR_L2_TRAP ret=%d\n", r);
> +	igt_assert_eq(r, 0);
> +	slth_free_buffers(&bufs);
> +
> +	return value;
> +}
> +
> +static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
> +					 int fd)
> +{
> +	uint32_t value;
> +
> +	igt_info("SLTH GFX UMQ VGPR PROOF\n");
> +
> +	value = slth_umq_run(device, fd, AMD_IP_GFX,
> +			     slth_prepare_vgpr_proof_shader);
> +
> +	/* The trap handler sets v2 to 42 before the shader stores it. */
> +	igt_assert_eq(value, 42);
> +
> +	igt_info("SLTH GFX UMQ VGPR PROOF COMPLETE\n");
> +}
> +
> +static void
> +slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
> +			     int fd)
> +{
> +	struct slth_bufs bufs;
> +
> +	amdgpu_context_handle context_handle;
> +
> +	amdgpu_bo_handle bo_dst;
> +	amdgpu_bo_handle bo_shader;
> +	amdgpu_bo_handle bo_cmd;
> +
> +	amdgpu_bo_handle resources[3];
> +
> +	volatile uint32_t *ptr_dst;
> +
> +	void *ptr_shader;
> +	uint32_t *ptr_cmd;
> +
> +	uint64_t mc_address_dst;
> +	uint64_t mc_address_shader;
> +	uint64_t mc_address_cmd;
> +
> +	amdgpu_va_handle va_dst;
> +	amdgpu_va_handle va_shader;
> +	amdgpu_va_handle va_cmd;
> +
> +	amdgpu_bo_list_handle bo_list;
> +
> +	struct amdgpu_cs_request ibs_request = {0};
> +	struct amdgpu_cs_ib_info ib_info = {0};
> +	struct amdgpu_cs_fence fence_status = {0};
> +
> +	struct amdgpu_cmd_base *base_cmd =
> +		get_cmd_base();
> +
> +	uint32_t expired = 0;
> +	uint32_t version = 12;
> +
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +
> +	int bo_dst_size = 16384;
> +	int bo_shader_size = 4096;
> +	int bo_cmd_size = 4096;
> +
> +	int i;
> +	int r;
> +	int ret;
> +
> +	igt_assert(base_cmd);
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +
> +	igt_info("========================================\n");
> +	igt_info("COMP KQ VGPR PROOF\n");
> +	igt_info("SLTH VGPR PROOF\n");
> +	igt_info("========================================\n");
> +
> +	slth_alloc_buffers(device, &bufs);
> +
> +	slth_prepare_tba_with_handler(device,
> +				      &bufs,
> +			TrapHandlerIsaProof);
> +
> +	ret = vm_set_l2_trap(fd,
> +			     bufs.tba_mc_addr,
> +			bufs.tma_mc_addr);
> +
> +	igt_info("SET_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_prepare_vgpr_proof_shader(device,
> +				       isa_bin,
> +			&isa_sz);
> +
> +	igt_assert(isa_sz > 0);
> +
> +	igt_info("SlthVgprProofIsa size=%zu\n",
> +		 isa_sz);
> +
> +	igt_info("===== SLTH VGPR PROOF ISA BEGIN =====\n");
> +
> +	for (i = 0; i < isa_sz / 4; i++) {
> +		igt_info("ISA[%02d] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
> +	}
> +
> +	igt_info("===== SLTH VGPR PROOF ISA END =====\n");
> +
> +	r = amdgpu_cs_ctx_create(device,
> +				 &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_cmd_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			0,
> +			&bo_cmd,
> +			(void **)&ptr_cmd,
> +			&mc_address_cmd,
> +			&va_cmd);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_cmd, 0, bo_cmd_size);
> +
> +	base_cmd->attach_buf(base_cmd,
> +			ptr_cmd,
> +			bo_cmd_size);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_shader_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_shader,
> +			&ptr_shader,
> +			&mc_address_shader,
> +			&va_shader);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_shader, 0, bo_shader_size);
> +
> +	memcpy(ptr_shader,
> +	       isa_bin,
> +			isa_sz);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_dst_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_dst,
> +			(void **)&ptr_dst,
> +			&mc_address_dst,
> +			&va_dst);
> +	igt_assert_eq(r, 0);
> +
> +	memset((void *)ptr_dst,
> +	       0,
> +			bo_dst_size);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("output_lo=0x%08x\n",
> +		 lower_32_bits(mc_address_dst));
> +
> +	igt_info("output_hi=0x%08x\n",
> +		 upper_32_bits(mc_address_dst));
> +
> +	amdgpu_dispatch_init(
> +			AMDGPU_HW_IP_COMPUTE,
> +			base_cmd,
> +			version);
> +
> +	amdgpu_dispatch_write_cumask(
> +			base_cmd,
> +			version);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	amdgpu_dispatch_write2hw(
> +			base_cmd,
> +			mc_address_shader,
> +			version,
> +			0);
> +
> +	igt_info("cdw after write2hw = %u\n",
> +		 base_cmd->cdw);
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	igt_info("========================================\n");
> +	igt_info("COMPUTE USER DATA PROGRAMMING\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("mc_address_dst      = 0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("dst low dword       = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("dst high dword      = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("SET_SH_REG base     = 0x240\n");
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> +
> +	base_cmd->emit(base_cmd, 0x240);
> +
> +	/*
> +	 * s0:s1 = source address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +
> +	/*
> +	 * s2:s3 = destination address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +
> +	base_cmd->emit(base_cmd, 0x215);
> +	base_cmd->emit(base_cmd, 0);
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
> +					3));
> +
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +
> +	base_cmd->emit_aligned(base_cmd,
> +			7,
> +			GFX_COMPUTE_NOP);
> +
> +	igt_info("Dispatch PM4 DW=%u\n",
> +		 base_cmd->cdw);
> +
> +	igt_info("========================================\n");
> +	igt_info("FINAL PM4 DUMP\n");
> +	igt_info("========================================\n");
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	resources[0] = bo_dst;
> +	resources[1] = bo_shader;
> +	resources[2] = bo_cmd;
> +
> +	r = amdgpu_bo_list_create(device,
> +				  3,
> +			resources,
> +			NULL,
> +			&bo_list);
> +
> +	igt_assert_eq(r, 0);
> +
> +	ib_info.ib_mc_address = mc_address_cmd;
> +	ib_info.size = base_cmd->cdw;
> +
> +	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	ibs_request.ring = 0;
> +	ibs_request.resources = bo_list;
> +	ibs_request.number_of_ibs = 1;
> +	ibs_request.ibs = &ib_info;
> +
> +	r = amdgpu_cs_submit(context_handle,
> +			     0,
> +			&ibs_request,
> +			1);
> +
> +	igt_info("cs_submit ret=%d\n", r);
> +	igt_assert_eq(r, 0);
> +
> +	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	fence_status.ip_instance = 0;
> +	fence_status.ring = 0;
> +	fence_status.context = context_handle;
> +	fence_status.fence = ibs_request.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(
> +			&fence_status,
> +			AMDGPU_TIMEOUT_INFINITE,
> +			0,
> +			&expired);
> +
> +	igt_info("fence ret=%d expired=%u\n",
> +		 r,
> +			expired);
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(expired, 1);
> +
> +	igt_info("===== OUTPUT DUMP =====\n");
> +
> +	for (i = 0; i < 32; i++) {
> +		igt_info("OUT[%02d]=0x%08x\n",
> +			 i,
> +				ptr_dst[i]);
> +	}
> +
> +	igt_info("output[0]=0x%x (%u)\n",
> +		 ptr_dst[0],
> +			ptr_dst[0]);
> +
> +	igt_assert_eq(ptr_dst[0], 42);
> +
> +	ret = vm_clear_l2_trap(fd);
> +
> +	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_free_buffers(&bufs);
> +
> +	amdgpu_bo_list_destroy(bo_list);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_dst,
> +			va_dst,
> +			mc_address_dst,
> +			bo_dst_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_shader,
> +			va_shader,
> +			mc_address_shader,
> +			bo_shader_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_cmd,
> +			va_cmd,
> +			mc_address_cmd,
> +			bo_cmd_size);
> +
> +	amdgpu_cs_ctx_free(context_handle);
> +
> +	free_cmd_base(base_cmd);
> +
> +	igt_info("COMP KQ VGPR PROOF COMPLETE\n");
> +}
> +
> +static void
> +slth_prepare_returnproof_shader(amdgpu_device_handle device,
> +				uint8_t *isa_bin,
> +		size_t *isa_sz)
> +{
> +	struct amdgpu_gpu_info info = {0};
> +	char mcpu[32] = {};
> +	int r;
> +
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_family_id_to_mcpu(info.family_id,
> +				     mcpu,
> +			sizeof(mcpu));
> +	igt_assert_eq(r, 0);
> +
> +	igt_info("===== RETURNPROOF SHADER SOURCE BEGIN =====\n");
> +	igt_info("%s\n", SlthReturnProofIsa);
> +	igt_info("===== RETURNPROOF SHADER SOURCE END =====\n");
> +
> +	r = amdgpu_llvm_assemble(mcpu,
> +				 SlthReturnProofIsa,
> +			isa_bin,
> +			8192,
> +			isa_sz);
> +
> +	igt_info("amdgpu_llvm_assemble returned %d\n", r);
> +
> +	if (r) {
> +		igt_info("===== SHADER SOURCE BEGIN =====\n");
> +		igt_info("%s\n", SlthReturnProofIsa);
> +		igt_info("===== SHADER SOURCE END =====\n");
> +	}
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert(*isa_sz > 0);
> +
> +	igt_info("SlthReturnProofIsa size=%zu\n",
> +		 *isa_sz);
> +
> +	igt_info("RETURNPROOF SHADER ISA DUMP\n");
> +
> +	for (unsigned int i = 0;
> +			i < (*isa_sz / sizeof(uint32_t));
> +			i++) {
> +		igt_info("ISA[%u] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
> +	}
> +}
> +
> +static void
> +slth_comp_kq_returnproof_test(amdgpu_device_handle device,
> +			      int fd)
> +{
> +	struct slth_bufs bufs;
> +
> +	amdgpu_context_handle context_handle;
> +
> +	amdgpu_bo_handle bo_dst;
> +	amdgpu_bo_handle bo_shader;
> +	amdgpu_bo_handle bo_cmd;
> +
> +	amdgpu_bo_handle resources[3];
> +
> +	volatile uint32_t *ptr_dst;
> +
> +	void *ptr_shader;
> +	uint32_t *ptr_cmd;
> +
> +	uint64_t mc_address_dst;
> +	uint64_t mc_address_shader;
> +	uint64_t mc_address_cmd;
> +
> +	amdgpu_va_handle va_dst;
> +	amdgpu_va_handle va_shader;
> +	amdgpu_va_handle va_cmd;
> +
> +	amdgpu_bo_list_handle bo_list;
> +
> +	struct amdgpu_cs_request ibs_request = {0};
> +	struct amdgpu_cs_ib_info ib_info = {0};
> +	struct amdgpu_cs_fence fence_status = {0};
> +
> +	struct amdgpu_cmd_base *base_cmd =
> +		get_cmd_base();
> +
> +	uint32_t expired = 0;
> +	uint32_t version = 12;
> +
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +
> +	int bo_dst_size = 16384;
> +	int bo_shader_size = 4096;
> +	int bo_cmd_size = 4096;
> +
> +	int i;
> +	int r;
> +	int ret;
> +
> +	igt_assert(base_cmd);
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +
> +	igt_info("========================================\n");
> +	igt_info("COMP KQ RETURNPROOF\n");
> +	igt_info("SLTH RETURNPROOF\n");
> +	igt_info("========================================\n");
> +
> +	slth_alloc_buffers(device, &bufs);
> +
> +	slth_prepare_tba_with_handler(device,
> +				      &bufs,
> +			TrapHandlerIsaProof);
> +
> +	ret = vm_set_l2_trap(fd,
> +			     bufs.tba_mc_addr,
> +			bufs.tma_mc_addr);
> +
> +	igt_info("SET_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_prepare_returnproof_shader(device,
> +					isa_bin,
> +			&isa_sz);
> +	igt_assert(isa_sz > 0);
> +
> +	igt_info("SlthReturnProofIsa size=%zu\n", isa_sz);
> +
> +	igt_info("===== RETURNPROOF ISA BEGIN =====\n");
> +
> +	for (i = 0; i < isa_sz / 4; i++) {
> +		igt_info("ISA[%02d] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
> +	}
> +
> +	igt_info("===== RETURNPROOF ISA END =====\n");
> +
> +	r = amdgpu_cs_ctx_create(device,
> +				 &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_cmd_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			0,
> +			&bo_cmd,
> +			(void **)&ptr_cmd,
> +			&mc_address_cmd,
> +			&va_cmd);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_cmd, 0, bo_cmd_size);
> +
> +	base_cmd->attach_buf(base_cmd,
> +			ptr_cmd,
> +			bo_cmd_size);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_shader_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_shader,
> +			&ptr_shader,
> +			&mc_address_shader,
> +			&va_shader);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_shader, 0, bo_shader_size);
> +
> +	memcpy(ptr_shader,
> +	       isa_bin,
> +			isa_sz);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_dst_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_dst,
> +			(void **)&ptr_dst,
> +			&mc_address_dst,
> +			&va_dst);
> +	igt_assert_eq(r, 0);
> +
> +	memset((void *)ptr_dst,
> +	       0,
> +			bo_dst_size);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("output_lo=0x%08x\n",
> +		 lower_32_bits(mc_address_dst));
> +
> +	igt_info("output_hi=0x%08x\n",
> +		 upper_32_bits(mc_address_dst));
> +
> +	amdgpu_dispatch_init(
> +			AMDGPU_HW_IP_COMPUTE,
> +			base_cmd,
> +			version);
> +
> +	amdgpu_dispatch_write_cumask(
> +			base_cmd,
> +			version);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	amdgpu_dispatch_write2hw(
> +			base_cmd,
> +			mc_address_shader,
> +			version,
> +			0);
> +
> +	igt_info("cdw after write2hw = %u\n",
> +		 base_cmd->cdw);
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	igt_info("========================================\n");
> +	igt_info("COMPUTE USER DATA PROGRAMMING\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("mc_address_dst      = 0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("dst low dword       = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("dst high dword      = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("SET_SH_REG base     = 0x240\n");
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> +
> +	base_cmd->emit(base_cmd, 0x240);
> +
> +	/*
> +	 * s0:s1 = source address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +
> +	/*
> +	 * s2:s3 = destination address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +
> +	base_cmd->emit(base_cmd, 0x215);
> +	base_cmd->emit(base_cmd, 0);
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
> +					3));
> +
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +
> +	base_cmd->emit_aligned(base_cmd,
> +			7,
> +			GFX_COMPUTE_NOP);
> +
> +	igt_info("Dispatch PM4 DW=%u\n",
> +		 base_cmd->cdw);
> +
> +	igt_info("========================================\n");
> +	igt_info("FINAL PM4 DUMP\n");
> +	igt_info("========================================\n");
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	resources[0] = bo_dst;
> +	resources[1] = bo_shader;
> +	resources[2] = bo_cmd;
> +
> +	r = amdgpu_bo_list_create(device,
> +				  3,
> +			resources,
> +			NULL,
> +			&bo_list);
> +
> +	igt_assert_eq(r, 0);
> +
> +	ib_info.ib_mc_address = mc_address_cmd;
> +	ib_info.size = base_cmd->cdw;
> +
> +	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	ibs_request.ring = 0;
> +	ibs_request.resources = bo_list;
> +	ibs_request.number_of_ibs = 1;
> +	ibs_request.ibs = &ib_info;
> +
> +	r = amdgpu_cs_submit(context_handle,
> +			     0,
> +			&ibs_request,
> +			1);
> +
> +	igt_info("cs_submit ret=%d\n", r);
> +	igt_assert_eq(r, 0);
> +
> +	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	fence_status.ip_instance = 0;
> +	fence_status.ring = 0;
> +	fence_status.context = context_handle;
> +	fence_status.fence = ibs_request.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(
> +			&fence_status,
> +			AMDGPU_TIMEOUT_INFINITE,
> +			0,
> +			&expired);
> +
> +	igt_info("fence ret=%d expired=%u\n",
> +		 r,
> +			expired);
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(expired, 1);
> +
> +	igt_info("===== OUTPUT DUMP =====\n");
> +
> +	for (i = 0; i < 32; i++) {
> +		igt_info("OUT[%02d]=0x%08x\n",
> +			 i,
> +				ptr_dst[i]);
> +	}
> +
> +	igt_info("output[0]=0x%x (%u)\n",
> +		 ptr_dst[0],
> +			ptr_dst[0]);
> +
> +	igt_assert_eq(ptr_dst[0], 2);
> +
> +	ret = vm_clear_l2_trap(fd);
> +
> +	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_free_buffers(&bufs);
> +
> +	amdgpu_bo_list_destroy(bo_list);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_dst,
> +			va_dst,
> +			mc_address_dst,
> +			bo_dst_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_shader,
> +			va_shader,
> +			mc_address_shader,
> +			bo_shader_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_cmd,
> +			va_cmd,
> +			mc_address_cmd,
> +			bo_cmd_size);
> +
> +	amdgpu_cs_ctx_free(context_handle);
> +
> +	free_cmd_base(base_cmd);
> +
> +	igt_info("COMP KQ RETURNPROOF COMPLETE\n");
> +}
> +
> +static void
> +slth_gfx_umq_returnproof_test(amdgpu_device_handle device, int fd)
> +{
> +	uint32_t value;
> +
> +	value = slth_umq_run(device, fd, AMD_IP_GFX,
> +			     slth_prepare_returnproof_shader);
> +
> +	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
> +	igt_assert_eq(value, 2);
> +}
> +
> +static void
> +slth_comp_umq_vgpr_proof_test(amdgpu_device_handle device, int fd)
> +{
> +	uint32_t value;
> +
> +	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
> +			     slth_prepare_vgpr_proof_shader);
> +
> +	/* The trap handler sets v2 to 42 before the shader stores it. */
> +	igt_assert_eq(value, 42);
> +}
> +
> +static void
> +slth_comp_umq_returnproof_test(amdgpu_device_handle device, int fd)
> +{
> +	uint32_t value;
> +
> +	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
> +			     slth_prepare_returnproof_shader);
> +
> +	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
> +	igt_assert_eq(value, 2);
> +}
> +
> +int igt_main()
> +{
> +	amdgpu_device_handle device;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +	bool enable_test = false;
> +	int fd = -1;
> +	int r;
> +
> +#ifdef AMDGPU_USERQ_ENABLED
> +	enable_test = true;
> +#endif
> +
> +	igt_fixture() {
> +		uint32_t major, minor;
> +		int err;
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +		asic_userq_readiness(device, userq_arr_cap);
> +		amd_platform_filter_init(&gpu_info);
> +
> +		/* The shaders are assembled at runtime */
> +		igt_require_f(amdgpu_llvm_asm_init() == 0,
> +			      "LLVM assembler unavailable\n");
> +	}
> +
> +	igt_subtest("slth-gfx-kq-vgpr-proof")
> +		slth_gfx_kq_vgpr_proof_test(device, fd);
> +
> +	igt_subtest("slth-gfx-umq-vgpr-proof")
> +		slth_gfx_umq_vgpr_proof_test(device, fd);
> +
> +	igt_subtest("slth-comp-kq-vgpr-proof")
> +		slth_comp_kq_vgpr_proof_test(device, fd);
> +
> +	igt_subtest("slth-comp-kq-returnproof")
> +		slth_comp_kq_returnproof_test(device, fd);
> +
> +	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-GFX-user-queue");
> +	igt_subtest("slth-gfx-umq-returnproof") {
> +		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
> +		slth_gfx_umq_returnproof_test(device, fd);
> +	}
> +
> +	igt_describe("Check-SLTH-trap-handler-updates-VGPR-on-compute-user-queue");
> +	igt_subtest("slth-comp-umq-vgpr-proof") {
> +		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
> +		slth_comp_umq_vgpr_proof_test(device, fd);
> +	}
> +
> +	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-compute-user-queue");
> +	igt_subtest("slth-comp-umq-returnproof") {
> +		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
> +		slth_comp_umq_returnproof_test(device, fd);
> +	}
> +
> +	igt_fixture() {
> +		amdgpu_llvm_asm_shutdown();
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 11e5c00da..784879d14 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -57,6 +57,7 @@ if libdrm_amdgpu.found()
>   			  'amd_userptr_invalidation',
>   			  'amd_close_race',
>   			  'amd_mes_reset',
> +			  'amd_slth',
>   			]
>   	if libdrm_amdgpu.version().version_compare('> 2.4.97')
>   		amdgpu_progs +=[ 'amd_syncobj', ]
