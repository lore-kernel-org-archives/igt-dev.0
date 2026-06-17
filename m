Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9559DCD98F2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 17:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAB310EAA9;
	Wed, 17 Jun 2026 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpUNxw4f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B133910F085
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781717581; x=1813253581;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5jOfdgpnVbKKxLlw4PVQCtgxmPzRVKtErZcHnE0r050=;
 b=VpUNxw4fQwzk34QnMpvLgmD3l7KyTLT4IweX9FUIFqYUDH+5Pim+Q5nJ
 T7MDe0Sszmu5B9OevGkj6RXRX8sIlcY3gMTE8k3EnTd8Vg+m4A6VC4lLs
 tqGdky/fUA204e2iZnhLNodnCBOcmR7nV0OMb6+2MfA7jWt+WCLYQXkpl
 UXWdsEaMWhH4ATRRfP82U4omICv0vvAxwCatmtCqvHbI9/eB/xBHJhzKC
 dELb0GE6nBj7uhG3wZczkjV5VPpJ87rKAROaslo7TahUeZidDNG3uyfka
 x3r7WcFV22DCuf+0UyzFJ5ZG1uO0YFLtfxwOmqlK/6QCMxOr4paUhfXf+ A==;
X-CSE-ConnectionGUID: 6C+YxYueSt2UZvzJARg1QQ==
X-CSE-MsgGUID: 3akdqxkBRbic3CfV901qDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82303704"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82303704"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 10:33:00 -0700
X-CSE-ConnectionGUID: Z6UCIPenS56mqt0jWrgiEA==
X-CSE-MsgGUID: +T3rfxygSx+B0U+NAmt6LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="248204680"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 10:33:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:33:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 10:33:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjWmvyVIX+QW7Q4zamZoDHIR90r8USYHzfUroYnunesMe+ft7+I6yGZNzoZCfTzBPWdKC7JR78vATxoseKWz/jp+LcPOkzc8iIJBX7Tt0IOodG7t8SZzqeWoe4uCl3eZPD5o1zZC2BmR1foAHx2PmwdViTGwy/7NXlYNT92cIk8GCL1WZurQEt+ePf+h7IRj4/dWCXXkuy32/t8opU92Nl33W3+3tokf5R3aeq+09nab968dsk+hv/S3znJTNpDPOvntLuCCN/EQ3S8sTULK+3aATcGeVits8cwdMEMSGVzP7lt5hAcwL/cjNEU4sCevBz9Y6yL4jwLcil7Eb1bSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTMtxq2Sro1asVtOB/HOPWEb4SCDUEtUo8as0vspbpg=;
 b=uFAyrmhzbLz31I3MWNGVKdLaDraSINgNK3jve0jVM4hzdi28mCKJDGcThq3DksSx8oj3mbE8eM+6mP4V390GgMmbB1+koetBsoPJhE1hjPmnXP5iaX6fd3x8UKzedpLMRk/vl6+QhAT8aAHS1Qyq8W1y5SgUPHtkOiRq4H9vhxDfYMk5qoQdVJpl8ACJneoaSmGG1IcczNmNw7LU+6dMY1MkbRjYhaqXP0K1sfyOtZUpGxrw3fcuJ+dAPZO98VfMflZ4LNsMebacajU+9qrn7LhFKJgFUViu+fAddy47MIOKGis4ty98rWNNCCsu9U5Bxf24i+uRXnzGDgHEBGphhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 17:32:56 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 17:32:56 +0000
Message-ID: <11d084b2-d028-478d-a48a-e0ef21975b76@intel.com>
Date: Wed, 17 Jun 2026 10:32:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Fix gt-frequency failure with raised min
 freq
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260616193656.2131881-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260616193656.2131881-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:303:83::6) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0edd83-2099-45f6-b76e-08decc96779c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DqaG0V1cnUXh2eAfdLKAv1tVNjDM3PpGfArVp4kgt3W4Dvi+hgSvW/m8nlH6Cy26M4k9tg5qKxXhKUEz7HyqkWlJkrB68qboTtkeP2hzThusGCc/cJkelluquP8GgVf1863ZorKT73UJamo3x03Geq3RE2UVMUq/thVls4FVDw3t5Ii7ISzXBTPP4C/6H8ufl1Jz61bZqPV0wznj6pGwS2erZtyfsHtVwllo33eBq/FNrmwQiGMuap4jTtwWfVAO+mohgs/3gLkcmxGtA8WOI3a23AAXCFTkjNFVcxsmj3vGGGKG3gqV+S4BPI+XdexVG96xJXOZSkfpbwzwL4QX9wiNkdo7L+KPiT0UhI0VK3DN+JXkJevKBsCVPzrZo6mPaNQAV6G+kB6ogt74GO0KstsDkCXc3MXh99ENXDALTOioQq7eXeJruWG74z9CXDxOa5W9J2gT5/QP48+rkZ+6D5pto9/VohJ/VLxGq20B+a+mXReqZAx/Znlv8m2ML0YXIglDn/dGs4794grvHAPaAaiVKntJg31rdl3yXMPKnoquOYkHBwiEVmBeRdRyUkwz+y3auZyxJnwUInUNY6lIHhpjp02cFmivn0L7dLEzr20qTv1Q9TOHfi2kBoTTTEgmHIoDZ+kolzg2TNXxmriNrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnpuYi9QU1RJZG9KRWhKdXBxZXYyZUhKUUpGamdyeTRZZnlqQ3NKNGMvUjkx?=
 =?utf-8?B?WFd2ZHhtUVQvTmVBa2ZUbW96RFNlOEd3WEFEbFhEUTVTMTc0aXpTNUdxdUNm?=
 =?utf-8?B?bHYwVTMwbGgzc1VPOFNzbm1yZmFRWkJoZ3RsSTQvRjhjUFZtLzRIYkRIUnR6?=
 =?utf-8?B?dWQ0MjQzMHNHSTBjVm53SEZndldFNUYxTkF5RnNyMmQvQ3JTS0s5cmNsSUN6?=
 =?utf-8?B?dDRZREVOeEtvODVYbml3L0JZTUZyTko0MDU2TE5HT1U2enhReE1mY2xCbXp0?=
 =?utf-8?B?R2NHMklLUnppN0I1Z29VRWpzVlN0R0syWElEbUs4Z1FmRTU4V2lPd0JoRWkr?=
 =?utf-8?B?MG5ETEkzQXp3YU00R2lLUGNxclBBc0pOWFRTNEUxak44dUhleWxPNjh0NUlj?=
 =?utf-8?B?am43UlcvaUc5TVkyNDRpUDZEVnRxK2N0THFKajdPREpMNDdBRXJPQVNvT2Nz?=
 =?utf-8?B?bFVUZkxraWlmMm84M2p4OGJzMlJYRG9pTFRKV2w3NW4vVzBPckVyNkJBd1Rx?=
 =?utf-8?B?WWtQQkhtaXA4U3RHN2xiTmZYMkVCbHZxYU9QbEN0U01tV20rYlZqTFJodi9x?=
 =?utf-8?B?SEFwSFVjNVdWeHgyeU4vMkk0ZVVxUk9CVjRFNlBsTWdtMkJKSXRhNURyUmVq?=
 =?utf-8?B?cnkrQU9TdEtjMWY0R3l4TGMvMExsNWttMWxHZ2NXQ3gwLzdtbWpRMUFFeVFl?=
 =?utf-8?B?Tm1wc05QQmhLWFl3OGpHQmxLbTVCUFlRSFBkVm9QTWJVZVh0VCtFWTFKVHZQ?=
 =?utf-8?B?QVBNdzR3MEJzYitYK0Z2VkIyUnR5ekpidXMxbUo3WkZ1eFdCTFJkbm13c3Z0?=
 =?utf-8?B?aHdrZVFsdTBqaUdnYUpFMGJrZzJXekFvVFpNcGhIR0M5R1ZVNnBOQ2pLR2U5?=
 =?utf-8?B?cUFBaVNoV3dHdys3YmRValB2V0NCYXV5U1ZtMEdHQjBqNXlxUFZPTnhsOTh1?=
 =?utf-8?B?OHA2M3NTeUtONDRYK2I3aHRzdkJMb3I0Smc3cmxtWTNSamg0bHdnRzVXNFBs?=
 =?utf-8?B?Q2ZwdmI5eDZBbmdBc2d3TWpRTXM5UHgxZXI0NU1jOE1nN0x3alBxMjNQckht?=
 =?utf-8?B?Ump2cVdEOGVXL0M2VjQvTnVTSmJnS2cxT1hwbEh5Z2s4ZjJ5WUt4MExPZ1Zs?=
 =?utf-8?B?WnlqTndkUk9zMEdKMGpOMEpRdjB5ZHBKenZINE5Kc2lHMlpNazRZdkNLY1lN?=
 =?utf-8?B?VkhoemNJNnM3Q1RqS2VVMWYxNkpyMmVwVGtzZFpvKzRHUTdFU2hhV2pjbzdS?=
 =?utf-8?B?VTJHdHdiMXBIMWRrT1J3MGtuc3dLblhYTER0WmZMbEdrczVFdFZnY0tsSm80?=
 =?utf-8?B?UTlYSExOVFliTXVBYkdMbmYxNDk3WjdhcCtVTUdDK0VGTkhyK3RLZ0M5K0dw?=
 =?utf-8?B?SFB4bkdzQk1QcW1KTWRTK0J4SE5qQUtXc0k5YUpNMWFhUG53RjZ0OGQvZlZy?=
 =?utf-8?B?Mk1WNUthSTVqQi85M1QzS21hL2gxY0lndmRndW4rSk5VZ24vUVBaZEcxN21Y?=
 =?utf-8?B?bDk0bUdVdDA5Y3ByWjBsOC9VdmtkNVpVcHdpaHl4OEt6VHRDQVdFbXpLMzJI?=
 =?utf-8?B?a3VqYzNpU1BlYkg5WDRkY2lrbzN2OWRhV3BUNm8wU1I5SUpvSWhnRlpVSWto?=
 =?utf-8?B?dW9yUVc4Y0FRMFZRTVZVa1ZaWWVad2FRNGRGR0plcXdRS2VGZUZFbHcyRzF1?=
 =?utf-8?B?aHNTcE5MK1hiaHRabFUxdldpVGNtUmtUcWJmbEkwOFpCbnUvbHY2aEhQbVJi?=
 =?utf-8?B?aFdoV0FVYVNZdFpnWWoxQUNWOGtOS0Q5dHNNSTdudk8vWWxqWWJYMDNJMG0y?=
 =?utf-8?B?dnBuN05sU1JsbGpCaE96Tm9BS255VW1HaFB5TStRVE92VVBUUDNzdWc1Z0Zj?=
 =?utf-8?B?MUkvVmtpc1RweWhYK1U4NkthZkp4L1ZwYVV3eHVhbDdzcmY2ZlN2eGxmSnB4?=
 =?utf-8?B?enNZZEFiSE5ZL0NxVTF3aDlhT0FLbStCUmp4TXhIN0xCaHByT2xOY1dUWXFV?=
 =?utf-8?B?UWVkN3RueE9sZ0hXV0dKcDErY0hVUkx2MmIvRTV5L0hEN3B5SjgvcksydXNP?=
 =?utf-8?B?SWpFWWdkNlJqREp5Q0ZDNGNMdzk1R2ltamFQd250bzYwZXpwRVVBM2VmdUo1?=
 =?utf-8?B?dDFjbG9EN1ZuSm1NQ0YzL1Fwb3lUZ21uNkYrbFpKa0dOWnR2ZlpWZ1NkU2N2?=
 =?utf-8?B?UytvYWhLSXNBK3VQTmI0VWpmNXIwUEFnb2tlaTVQWVJVYllxRDg0UTM3bVg1?=
 =?utf-8?B?TGoranNUK0ZaTUNKMTNPTi9SODAxTXQ4SmIvRTZlTUJsdTFDNEpYNEhxM1d3?=
 =?utf-8?B?N1cwcjk0aW11MGptZHFNSzhLcGJFUXpIWEZCdHpNbHJxZC9XWEpJOW5qc1hL?=
 =?utf-8?Q?b4xFasXGdXb/x4WM=3D?=
X-Exchange-RoutingPolicyChecked: qu8ziYHSWgcYchtChFCjE0bGVUHWy2Ajak1J8INGv7pCleg0TgVTAZ+Z7Y4lju3Y6qB0VBGw03Y40KVhOwIRBJvkxCsgGsR62GpVneEHqnbervRrjcQXHPALKGWclOJggMuaIht+QbM9LSsb4i5NP+ixXS3Knv2qVJF1dYYXxtx7vdO2btLfrlxBlQh6x4n0VA+KAK17uMZog0kiwq2XuL8bzQxZhXBzKnFOtbPVxjgjg755bSdgdFDNBEVAGQswj7HS0IFpJ6Vd3uIFhG+lzGtOfy1GkA8EmCDB84mP45J6E09RgrF9wSyK7d18aAqex5ocpkxanrTBMJS78LohYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0edd83-2099-45f6-b76e-08decc96779c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 17:32:55.9387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4BwBIAjSUmRpCm9rF8BPHett3ReFNzdYiwjdZrMUXzWvsAJ0fl/+iwDEerDeE9/ZGJrz0ftPufWf6vA2zisfp/WA6jYA13D3BAMyFwBbvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
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


On 6/16/2026 12:36 PM, Sk Anirban wrote:
> The gt-frequency subtest can fail when the min frequency has
> already been raised above RPn before the test begins. Using that
> value as the original minimum prevents the later min_freq write
> from enabling the GuC ignore_efficient_freq parameter, so min_freq
> can keep moving toward RPe.
>
> Save RPn as the minimum baseline instead, ensuring the min_freq
> write enables ignore_efficient_freq and the final restore check
> returns min_freq to RPn.
It'll be good to mention RPe fluctuates dynamically based on thermal 
conditions, so better to test with RPn, which is fixed.
>
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/issues/8344
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index fb4b871e7..4bbc801a1 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -903,10 +903,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	unsigned long config_rq_freq, config_act_freq;
>   	double min[2], max[2];
>   	uint32_t gt = eci->gt_id;
> -	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
> +	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "rpn");
>   	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> -	uint32_t current_min;
> -	uint32_t orig_rpe;
>   	uint32_t vm;
>   	int pmu_fd[2];
>   
> @@ -956,9 +954,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	 * Restore min/max.
>   	 */
>   	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
> -	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
> -	current_min = xe_gt_get_freq(fd, gt, "min");
> -	igt_assert(current_min == orig_min || current_min == orig_rpe);
> +	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   
>   	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>   		 min[0], min[1]);
