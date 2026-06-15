Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C32CD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B310E34F;
	Mon, 15 Jun 2026 10:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnxAiLzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF4C10E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781521146; x=1813057146;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ScItIOGprWOrdVGGjhMXZ4mxdfMqblZRK/k+dwXzdyw=;
 b=AnxAiLzNvARU5AKfGtzbdZ3YQ6F/DCWFmfTBUKaXOn7XIVNdyT63cDbP
 RDhUlxcwB7ZOUpt4jrXql2LEcoPC/kcaxz4yVR6uLIEbXgJ1nn82m58Zf
 StLbdx2WN144R+58vlnczIZUzMyIo1iuvIExJfNZC95eqw789WHmaUg+j
 8128LUvulBSOwVmZTe3aHWakk8ZJ84pwv4MKEdQjHrgKOSrlvfRj9uT7P
 KF7+EppIeqNmFBc7J7GiNQzqKOlHOBStJkYpEHVVt7bIWnpDt5AKcglGO
 Nyose7xwNaT8iFEFWdG4W8nbv/N0TfkgctX1D08jOKsEOLTLVv/WVV4ID w==;
X-CSE-ConnectionGUID: jV8LSEIBQB2Ab8o8O494YQ==
X-CSE-MsgGUID: V+rOgmrZTqqK2KMwcAfM5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="86156910"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86156910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:59:06 -0700
X-CSE-ConnectionGUID: 1TqXwFLUSZC2s3dJmRz2Ow==
X-CSE-MsgGUID: if/Zb2oJQ3ipChKFSec4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246332401"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:59:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 03:59:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 03:59:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 03:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mle9iULga6gV+lsMWlfJhR6XNRXVbMr5ILqxMfehY6dtBphyt50UxEZEEVa3i7CR3ExUv1LSPNRqpLNVE9J23eu4Qw+h3f5PxbY1GUTj5RaVaweMZeVxh0ugf2AndFAuGImpqS9b8AKeM1WurO1XKbnSqPxJJF0m8o9mVbl/Z/9CqgZ1yvaJU/hc+OuB3b4sS4czne/fn1nomjnC3qHCG9oOolYcJyXkiA7Ne1IDa4kg8PvFUDbcPXPs+sC1REsdEngrcaNGKHwlVwdkZHX3yKg/2JZu5XGnIpKV127PA2+Ad00s/vQvqP0LYHW/DQvwhdjAJ0vgykGUn0Vy7i1a8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyemGcjo3iAfdNe7YBB6K2UiL78U1GJ/Qafqw5GUp3A=;
 b=o4DEkMB3feYKJ6DZFaZx2id0cw96r/Ti2i5BAwOdRgy3dT6Qs+53lJUrNMt0ZjlMVhjNO09zK/rtqW8ONCgL8Z4QFKQpVwJWhRFTl7s+4fqdlFVzzyigeqXNnwGZlwRqpvcwY6b4Dwlw/2yKPdTmu9jGgFWGpMxfbhFfCq1wQjYTpNuQ+wmYKNuztQxoe54eP/yP4MZnVIO4wJGDTGZP2WgairgetrojCSQlITprL7TKH8iiJ48MPthBDGFy9shxPNJ55DKY62K8VDZNM0zvlG/8dedoeOvVMA5302/NZ1fqm0vJDr1C17oQJ/iC+P3KnwAiY9o9zRszS8rpxWCUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH8PR11MB6903.namprd11.prod.outlook.com
 (2603:10b6:510:228::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Mon, 15 Jun
 2026 10:59:01 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 10:59:01 +0000
Message-ID: <b78ea595-c307-4951-b236-a067c4f215f2@intel.com>
Date: Mon, 15 Jun 2026 16:28:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Rename
 subtest to preffered-loc-atomic-device
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260615094043.3925465-1-nishit.sharma@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260615094043.3925465-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0199.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 61431778-0435-45ad-bc34-08decacd1b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FEIJtHM6Ecsqol7Qr3nhN/19bMq6sY731ZusUOsbmwtDre7nAYfVFEuim12ZmsiKjjtuV1Bq6yaltQWm4XOe0KRDY89TnSFH4fVcyM+HdbFmUmDuVfULH2XVsn7DjYKwac8L7X2d4nKmQ19INOqULsOJEwKMy/9Gr8MaV7CSYvl1IkC8GPSo49Qa3l1Hc9scuy77ay87/G0tGWOIJgmPHGkGd9nn2umS1SXFVUOUEDG/cUUptaeMvc3nGKaEdu4FhUbdmjGG2mvWTeO8vNoyc5g8vsOUITMeaHfY5cFh61yuC2ojnVjWgzJOYOWrcijYeDiVCkQkvVY1LyV8bh8lclGRb3kA1BdbjmSUBOhhQmSq8ec6wN0w9RwVWFLDbu5XL58/iirH7ngbJfvK5QYai8BtnAqt7FxjDw2S2MayH6awmVM9biFqRifjiMUsN74LN6zm3WX/8lFF68wyC5+c8HL9AprWlPa2nIE+xQ/Dly9q03SQnTjJH9ecUCi7Gd97DjGp301KyOnermFT97sk1vy8x6PYGeWKeIC64CI5BRCjdOn5qmuFD2yiZsHPpM2qR0NECd0iZDRtM01eOORs+2Ox1A8ymGDyQ4BodutAmZ3eCG6bdghNN2qVA5OaHtaMUeztVqSinqw9PzSSPqP/WM/R4e7CXFeLdV2Fw6xbilVR+MB1obkeVhfvfPMV6EFm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djR3RjRMOXZuUzcvU3JGclJqdFFUM1JMalhBbVZsaTFad2U2MGpYUHhoK1JH?=
 =?utf-8?B?aFhIYjZ3aXFSa1dzSlUreWZybTFZZ3pyRVlPeElQRFNSQWZHRkRIcGJxZ2N3?=
 =?utf-8?B?VUt0cVF1TlVwbUpKZUcrUWVEQWdjNzNESmo4R1MxcVoxVkdxaEdxTG4rc3lh?=
 =?utf-8?B?Ty9GaldPanFDWDlzQnFrdzArbDRyaFpTcHRabXdHeS9GL0VjVEhEMG12MkJk?=
 =?utf-8?B?NnJhZnJDcHZCM1VWczBOVGFsNWYrZERIN3Jnb1E0a2M3U0o3Y3dVb05idHZ0?=
 =?utf-8?B?cERaNjFOUXgvam1GUlgrbytsVWpXY3h5ZEl3NG9veGpTZm9MUHgvS240cWFU?=
 =?utf-8?B?VDFzWlMzd3MxUU5GWnh3ek8yRGl6ZnlPN25FdExvOUViMERvaVRKRlF4Zzgz?=
 =?utf-8?B?UkVmRk9Ja3Z0LzRMeVV2S1cwRDFoK1dDNVRSRHYwdERBaTVHcmpFbGNhbnJV?=
 =?utf-8?B?WEtCelFOU3c5RlIrQkwvRHhvRFhrbDJxQ3l0T2ljb1NISmZIUWs3Z0ZOazlX?=
 =?utf-8?B?d1ZVbktlcnNobWx0ZXFVeDliMmhQRm1POWJCd0oyU25OVzkyaEdZZGIvR1Mv?=
 =?utf-8?B?djBjTGttU1hFQjhLSi9uS1RiZFk3TTAzSEluSlpIUHU2V1Zob3FFRVBmaGlj?=
 =?utf-8?B?dm0wS1dlM2pzYVV3c0doN05ZMWxobUxKZXg5U0g3YTlkRlo1bktpNHVhKy8w?=
 =?utf-8?B?S0JNUnZPR2QyY1R6Wm1UTkE0cU84aERPa3lSTnJ0SXRmUWtsTXZvb0kvRlpu?=
 =?utf-8?B?ZGFpTHBNL0dndDZ4N0ZkeU5pME5pRVcvT3VtSDNiWHVUcU5qMVlJQk9rSDNW?=
 =?utf-8?B?U2ZLd2pYWmdXSzI2Y0lkall4K3RiMzM5NVk3QUVLR2lkSVR6UlF2T0JEWmxx?=
 =?utf-8?B?aGloRW1zbmU5WDJVbWw3cFdSd0F4dGJudG5DQnZHVjBuTU1jQWxNVGNIQWRY?=
 =?utf-8?B?Z0tqMTBHU3ZaZjlNRDhWZnlLaUpUL2xFcjhlcEgyWko0SXVzZ1hrWm9xWnpz?=
 =?utf-8?B?dDdIS2p6RHNDdTFnaDNobE9iSzl0cWNZNWZ1SlRMOUdqajJKREdla1RrTFZD?=
 =?utf-8?B?d2psOUQ0emxPSjdCajV2K0JBa0RheThuSlA1WjRCZEtmL0tQZjh6aUVyWFhQ?=
 =?utf-8?B?cG92cWZsbi9PSmU1SThzaTFCYk5TR05GSVRHNTZUQk5rcEJ1TzloU09nekFK?=
 =?utf-8?B?QXpzTkhGUHc4SFN3RVA5L2xVZjFZdDJ6WUxKeFBxRXdJdTlDNk0vVWxvd0VI?=
 =?utf-8?B?YldLRURuNDlhNzhwQ092TE90UWgveUtUNWVMcGR3c05HU0FZYysrYW14cE8z?=
 =?utf-8?B?akxQR3NEQnF6SmNJeko3Q2xPS0UvczVkVnZkaTVxNkFwc0wvS0lweWlEKzdP?=
 =?utf-8?B?ckl4aHg2dTZEV25TeWQ2d0J0VGlRUkZyOXFGWnEyZFl4dXJiYnlYNkV3VkpQ?=
 =?utf-8?B?cE5OSGwxdWdSeWQ0eXFZZCtudUFlRjk3V1Rwd0hpdXJuWXpOZDdhTHg2dGdO?=
 =?utf-8?B?ekdTMFFkdHFuMzR1NG8yYlNmTTdzN2VTM1BWOG9SQUVIWlkzRlY2M09ZNUc5?=
 =?utf-8?B?YlpBVThUVTR0ZG95MVdYZ1o2VDl5SVl1Z2FFUWwvN1ZhdGNnRFFQWWtCS1dK?=
 =?utf-8?B?T3NPejNTdFJPZWdEdnVKaHdWUXNrRWpwT21Wek14OHhvSU9yTkRUVTJXZ2Yz?=
 =?utf-8?B?bXVaMjRzS0hENEdXY2VWNEorQ1lsbGdERklmT2FST1ZaRXYycDBFNFhsY3ZT?=
 =?utf-8?B?S2dRTWpZYmVjR2RyMGVockQrQWtXdEI0Ti84UTliMzc5cklvTGI2S28xQ3M3?=
 =?utf-8?B?SGhpcHNseHR3MHo3RmovbGNCRzkxcU9aeXpQdFBFenRrZzh5eGYxNTkwS0Y1?=
 =?utf-8?B?b3dlWjZVQXRRRTlkQUFXeUhDNDNwTDJrUFZrcjdJTTBWSEhnTHM2cEpONnBD?=
 =?utf-8?B?ckJ1d3N5dDRjeVZiQ2lielJyVWxUUjdaWGM5dUduZVhGSUY2YURLRFVic2cx?=
 =?utf-8?B?Q0JnS2JRSzh1OXFmN2pIdXppVjJzdVdtZWZvZjRsbmI4QzRVb3A1cCsrdFRR?=
 =?utf-8?B?YnRTL0w2THJmWGtlVUkrd0piWTkremx6aTMwdnhSdXlGdGJreGNhSEF2cXRq?=
 =?utf-8?B?dHlNS2JxSXBDdzFqZnFHUUdaamd3ZmF6SmFTemd0TkwrVm5sb1hRS1J4bG5Z?=
 =?utf-8?B?d2RqK1BGU0dMQ29tTE1PbWJCTFYyNDJFaXM5WWh5RTR4N3NrR2VBM25QRWhL?=
 =?utf-8?B?T285MW1WVDdYUHJ5NU9TYmVDdDBrU1p1bjkvM3RyRHhTNmQvNXBIVThHMG9E?=
 =?utf-8?B?UUIxM1cyV0FEWW9sWjdndzRFQkdEbG5oWi9xZVVNdzdCcVBRNWRxSVhYTTdI?=
 =?utf-8?Q?hA3z8vHDwAocYEMY=3D?=
X-Exchange-RoutingPolicyChecked: YigLDrG+kkO3RzOFjChRrI33g0+Lng1iTL8JtXtbUCOyJHtLFHdadC8cyQdqWs0Q0/noo4qNfGcMlbhSLH+iLeiKbMBNGX/dSGfdAKUmFp8zowbNpQPPc93kh2hW7XC9wY2oeZ8r/KcrTYEaVE2vS01wjxsMj+9A0Adnw5lLUgcA6LYfy7BlwKFkAS+h+AkDPq55Z+kVTTuMRswbYCMHnGnLSTIJA1irUW9iFtx4CPZ+umNx5X1QAbm3We3DLDnY17uW9e0T3dTk7QnEqQgahA2hLywcwpTVHWEiNPz2ifZedQLOqvPi8vmUB6c/oJfV8B2U/Gu6yl4ooxr+oezoCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61431778-0435-45ad-bc34-08decacd1b84
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 10:59:01.5507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09tyq/xr4GvMpIQb5xhbmRYIIRLDddhkW4wE1MQ3IkuxIxGwS72vHtzgnrtiayJn1A79G5Vih5VkFN2/D41Pez1W4gL9zeJyLxDt2y8YF3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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



On 15-06-2026 15:10, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> The subtest name "preffered-loc-atomic-vram" is misleading because
> it exercises the DRM_XE_ATOMIC_DEVICE preferred-location atomic
> attribute path, which applies to both dGPU (VRAM) and iGPU (SMEM)
> configurations. Running a subtest labelled "-vram" on an iGPU where
> no VRAM is present causes unnecessary confusion.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   tests/intel/xe_exec_system_allocator.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 8fafb503e..48ae738ec 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -508,7 +508,7 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>    * Description: performs prefetch and page migration
>    * Test category: functionality test
>    *
> - * SUBTEST: madvise-preffered-loc-atomic-vram
> + * SUBTEST: madvise-preffered-loc-atomic-device
>    * Description: performs both atomic and preferred loc madvise operations atomic device attributes set
>    * Test category: functionality test
>    *
> @@ -2538,7 +2538,7 @@ int igt_main()
>   		{ "atomic-inc", MADVISE_OP | MADVISE_ATOMIC_DEVICE | ATOMIC_BATCH },
>   		{ "preffered-loc-sram-migrate-pages",
>   		  MADVISE_OP | MADVISE_SWIZZLE | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
> -		{ "preffered-loc-atomic-vram",
> +		{ "preffered-loc-atomic-device",
>   		  MADVISE_OP | PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
>   		{ "preffered-loc-atomic-gl",
>   		  MADVISE_OP | PREFERRED_LOC_ATOMIC_GL | ATOMIC_BATCH },

