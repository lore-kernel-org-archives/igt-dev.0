Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B13FEFB52
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 14:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B510EB74;
	Fri, 27 Feb 2026 14:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1dFW7ZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5710EB74
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772201083; x=1803737083;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JaoLHhkRDT5eiM9/l22SzlPGQ6G19fEjalWQrpRJQNc=;
 b=h1dFW7ZJhwlIGA7Xv5xawWYZsHErzzQXncgnuG0o3vgyYXistibmqYee
 Gf/uK41SpaiLHz5aFfNx30oDvFvFoVLOYa8AOKfcy3Or7e9XSGCmx03rP
 SDe0woDBngeaWEvtYLKWWen175guNUV1IjVsLuk6/Yt89aX/VgPuuI5WZ
 NrwIoAdxNwsHaeTJzsuXOz62DRTMeQ7WC2yFCgMYXofqaTLived8jK9w5
 l79IFGkRlHTMcFcY85VHOHaEt750kiU3Js0JqJ41OeLM9cPrS65aMJU3D
 5VqA7BYwviqkwEcOLsxLk4rgeNpA4/4HF6ZtduypXa4AuTVDTtFroVcsv A==;
X-CSE-ConnectionGUID: ziiSaYCITz2Xd2refuE8Ew==
X-CSE-MsgGUID: n/b+GJH5SBm/GGS0DI1FmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90685877"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="90685877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:04:42 -0800
X-CSE-ConnectionGUID: tw82ndYTRfCu0QkdCAKg5A==
X-CSE-MsgGUID: BNMCYm+mTHe63KhkUFaaqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="247421204"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:04:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 06:04:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 06:04:41 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 06:04:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp3WSBC91kqqDAGhFrvk7DHu842LKrG5chcuF7RexCj3gdLrZ7mZEeYP7X8ZOdzrBaahpJVo4y6iu5TppzYZWRQJ4MEQbvBNnESKKtiiokbhFHFhk2lKbIOoXFq1vatiFUA/b89fPz7on9QN+Jtnt8gjhkPYWD1LWSCEXYReWYDYFmBRrDAYZ9eGGdFAJdGcP4FUy+dQRcgzqJ74L23IDt+iF8SRQSGV7rpKAm+mUz0jsozzARCUG0gdFQ201yLUQ3DTzq0q1pJ/A/Z8p2L6uVKKung5mnyvQolO6UbzMl5WIhLKIAKh1iS7PC43mB5Oxv4Q+cGAA5TTKLBIyZnN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poAUCFHElNxmFzzwao72rwofEA5oAaGzbtZ7mvpG5xM=;
 b=u4NUjDJfa7OCbsM3zSEECqWgpjIyJCKHxwssxcC4MzGk2fzh/rjGISKqpjCFvySsDS3YvjP8Sza9YRczrBUlla5U8C9b3UOeSLlnA3YCgBFYj8v5b+f0f8ZPendq2LL3h/16p8l0eMnuvXmjUdzLklwjC9EOEUCpN+vjYw1f4smG1X06nn1C9EMkV4m5XkVqzLoRvs3Vne5JDlzRx7q7VW+N1YHQ/+7Jf9bf4WBlqBaKdDR8F7zXBIBlRqid6V07NO9xp6A6CeSn1Jrzmjq7/BO/uh5JgSm88iEkdcNoBG4xEb2dMrWdKto/IERtrpQAJG9PgMcxjBys/PTZ3gXSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by BL4PR11MB8872.namprd11.prod.outlook.com
 (2603:10b6:208:5a8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 14:04:38 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3%6]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 14:04:38 +0000
Message-ID: <4bd8011b-3708-4124-9c15-122b1c8c5523@intel.com>
Date: Fri, 27 Feb 2026 15:04:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/allocator: add canonicalize helper for 57
 bit
To: <priyanka.dandamudi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
 <20260224082800.1581935-3-priyanka.dandamudi@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260224082800.1581935-3-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 043aee07-f578-4769-5b8f-08de7609251e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: ajE+MYVVVbNMzzUU4SLp8EQ3c9jBfEDhYYWLGxcTHES4+buip3QDybWv3ovh5TqZCWgmybadLBZ9c638blxcFaauQVmjqpfryQngH2W9s0aFnWIGefNT+38XqL78AV1Ae7vTCByEoX5VT2YFwBK1/S2evhIKF+QSv/s1AAHaHT4wLAWj5hMy1TcPwnHedueXMBzZE0ZnQ2mwOUrlyLixOOKVKMAdd86pqr50hv+zj000Rgtd/Zq0iitnZW82s65G0LIXbuLFdtRchl72FJmt5a42bkQpi9Ca88VLftrYt7cCgdt89JSKOn4uJnAllGzfCAnwk3NvgrWGHon/w5jvIPqKUumh+/utPE6DHKEd6G93P4Zi/nHl4mjOweANLC2M1uAP6XHiXsLQCqxQ1+83ZkFQybUk/ubhwt58be6O0wOASZQukayfDn9ha0fEJUqIgIjSEUhPDEVJ40E42O7IPczVDBUTfqmqniFG1tUUeRNTIBD97ZKvtwrKFwy0EZipAWnnBPbucNkvSbbCjXdDZkJKiqAanXw0SRRrQWU8KIiHnOUw/sZon+0FYJdsGJyQ/N6KHHzo/7P74Bq4+ABcaCaXRWIpWVKiCX1CwztNqrvpmO7s1DBxkQ9+QPvuWSzSFpxaSUYs73q0LgITv+SecAPOZxFC8hdXQcdFuhpaVkkizINciNZoLJMspGtxjDqA58SDpePbS1Y6pnzJ1vfQaEIovN9I22Idrs+uY8TGdJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dtOUFUSmMyNHQyVkcxK1JPdFhLMHZFZ3N5ZjJJdzF3SmFudTN2b1BXWHdH?=
 =?utf-8?B?Qm9iZkJqRGlEaDdFKzBsRm5KSXRkc25uMGZ0R0FWcVFTeWpvTEtDZ3RRMFZR?=
 =?utf-8?B?aFpEWWNkdEZxcHJUeXN4a1FvUW9aNnMrRHcxVk9udlBtYTZwNVdrQXh3REo1?=
 =?utf-8?B?empjWEZzUzNhWjZicUFsNU1iS0t3bzJ6N1pTNVdzckprNStvM3Y0U3F6aTk3?=
 =?utf-8?B?VXpNZXZMSUpOeEhJbzBDSzAyQ3o3VFYxWExOeXlZVW9Iem1SbVhKbUZ1cmlw?=
 =?utf-8?B?OWpjd3ZSa2hxZDBNOTE2NzY2Z3hKOUp1eU8wQTUrK25KRWpUdms4UEduVGRj?=
 =?utf-8?B?Y0Y3WjlFUTU2WkU1YSt2bGtNRmVMZ2RpTXFub3hSamRWWDNiOE9vd2crNFY3?=
 =?utf-8?B?NFNLY281V0xQTnVJd2U1azNUTlhTdTJvMG91eWpMZkxYWWxodTFnUEo2eEJT?=
 =?utf-8?B?NkF5RkpUTzlMd21GMGJWNngydTNUcy9OdW14ckFueVo1QXgxbWlmYlBneVk1?=
 =?utf-8?B?QUE4cHVVUndJN0k4R1grQ2xia1RlTVdTWUpGQU1sZXM3b2pGQ3B6VHYyYmdq?=
 =?utf-8?B?L2IvTVBWNEU2dGNsRkMxYWljcmh4RmxxR2N1NG9KcVR2Nk9VbSt2VkhrZkR1?=
 =?utf-8?B?dXQ3dFZOZVREeGd3TmtVcUJwek43aExETm5KbXpwaytvZ25KeUd6Z1g5RzBV?=
 =?utf-8?B?MnVxdFF6Vk9sRG5IbHpLejY0cFdOalFsTEllUmRYbENrWGdGNGZsZUhFK0du?=
 =?utf-8?B?K1FjQXNSNlBvd2hkSWdiOEtKVGZ5Und0WFFTWE4zNXQ5V1FzWFhwRENIK21Q?=
 =?utf-8?B?WENxSnhSMWh3VlVRNFlQOGxEVVBjVE45THR6L2p6T3Jzb2xYM0pPS0FROUJz?=
 =?utf-8?B?c1d1QnFDOXFUcmI0TG9uQmhXSkZWemhxblY5OUYrVVFEd3piVGlJVDU0c1lV?=
 =?utf-8?B?NDFqNGtwSnlMTDVwSDR6bk9LUnI4ZkNiZUZCV0JaK2hXZFFyYjFYWUFIRnhm?=
 =?utf-8?B?L0ZQRjJOdjNxU1dmVExCVFIvRm00Ty9NdERYTlk0U0N0ekl4VDJ2N09sSEMy?=
 =?utf-8?B?VXBTWklQSGZuVWFqTTRLdVdNQXFPL0xnSDNPYnR1ZE1MSGNLRlY4dm1HZTZF?=
 =?utf-8?B?THAzVTRkdjlob0lkRWhYNXVzWWpjVmo5RlJlU2U4RW1sMVdLSWtWZjFuWXBp?=
 =?utf-8?B?R0tES1pTM3JkeGUzZDRPMERCazVzQXlXMWxxdXN5MDUvRzFLRHJqaHVMcDhI?=
 =?utf-8?B?WWtjWW0rdW5Lci9XcURDdUdadVRJTFZ1OEpUb1hBN0dQYUNpeVRFR1B1dW85?=
 =?utf-8?B?eSsvNWZvWkg0L1RtOTIvY29nRmpwK29DUkdFSy9BeGNtQUNNdzMzekZqV1R5?=
 =?utf-8?B?bTJ5bWttVDA3YjVuU1lUMERnN2huN3kvTUtyQW11OWsvN255VmRlRXdKbVA0?=
 =?utf-8?B?ajNzZWgwdzY1bFQ1eEJ1cUtVSW11Vk1zMlFKRU96N3NPQjZyTDFDN1M0NlZ6?=
 =?utf-8?B?cVBrcTIwZ0NxZDlRZDM5RXdrWXRLVXd5UWVxSDNpOEtYV3kzRmNjbk1EQmM4?=
 =?utf-8?B?UzQ0N1BxcksxamczaXBOQUlWZ2hoc055ZTJVdW84L2dxZXc1NnVZamZTWHlF?=
 =?utf-8?B?N1VDQWNpVzIzejg2UlYxbmY5d0dxRnZVWnlOYkI4bEtRNTNKYlY5SzFIMnAx?=
 =?utf-8?B?MjNnMVk4Wm5NV2xQbHNlTDZQRDJRbWlEcVlQNFF4MERYRG42OFlQajRoMFlQ?=
 =?utf-8?B?dXVmZmU2bzd1MDN5aGpqQ1Jubk10OVBFUEdLYTVrMS9ma1RiM3VGS1lVYm9r?=
 =?utf-8?B?blVyTmVaSCtIaE1ua3F0NkMvb0lKbjNEQm91Tm9CdFRuSG1pYVVFVkg0N3RU?=
 =?utf-8?B?SlptbTExS0ZibnZ5dFJnR0VEOFcwTExKWmlrVEhRcDlJak9jaW5UYm83bnk0?=
 =?utf-8?B?V0NoOVBXZTB1WlN0RmV3MFd6WVhVLzBhMmtkQlJQd0JrUUNBWEhlWnE0ZS9Q?=
 =?utf-8?B?U2R2RHA2NCtkL3liWXJHZFV2Vzk1bGFOUUt6bXdEU2k4MU92cHdsaWIrdEpr?=
 =?utf-8?B?bnFWYVFLd3VzWTFJSkFDMGhDZXNCSWNLVFBQMHdQSXE4TVFueEdOU3dobkZk?=
 =?utf-8?B?SVdBc3ZKR2Y0dk1sTFdLbHNHV3o0dk9DN1dPZHlNTHliT0JHaml5ZzhEL3h2?=
 =?utf-8?B?OXlFNlQvOTRSVmwzRFRhNkpacFNpTzlZQmVxMXkvMUVRUm9hUllEZDNLejNC?=
 =?utf-8?B?TlZ1OXgvQTNoMVd5LzNORjlvTGhxRElpMzBtY2RERlVxVFk3LzVSMmwzTFJi?=
 =?utf-8?B?WXhoS1UrUzBMb2IwaXArMkVCME1qK05HQ3ZVcDhZWnNDZzJWeDJsQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 043aee07-f578-4769-5b8f-08de7609251e
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:04:38.3867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWu0rgMjvSX/SR2MD+KQMkup3t+3jpzEafEFaqfAYqooANyS/z9hM+SJuTXw4B5lw1l3omCdKHOOzEV1tLYEiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
X-OriginatorOrg: intel.com
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

W dniu 24.02.2026 o 09:27, priyanka.dandamudi@intel.com pisze:
> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
> The efficient 64-bit mode introduced with XE3p requires a 57-bit
> canonicalize for the ppgtt virtual address.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   lib/intel_allocator.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index 9cd83ea270..87c1453e91 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -219,12 +219,18 @@ void intel_allocator_bind(uint64_t allocator_handle,
>   #define INTEL_ALLOCATOR_SIMPLE 2
>   
>   #define GEN8_GTT_ADDRESS_WIDTH 48
> +#define XE3_PPGTT_ADDRESS_WIDTH 57
>   
>   static inline uint64_t CANONICAL(uint64_t offset)
>   {
>   	return sign_extend64(offset, GEN8_GTT_ADDRESS_WIDTH - 1);
>   }
>   
> +static inline uint64_t CANONICAL_57B(uint64_t offset)
> +{
> +	return sign_extend64(offset, XE3_PPGTT_ADDRESS_WIDTH - 1);
> +}
> +


>   #define DECANONICAL(offset) (offset & ((1ull << GEN8_GTT_ADDRESS_WIDTH) - 1))
>   
>   static inline uint64_t get_simple_ahnd(int fd, uint32_t ctx)

