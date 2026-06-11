Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC647CD98D2
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 08:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D2010ED83;
	Thu, 11 Jun 2026 08:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWvzeqN8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30BD10ED7D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781166276; x=1812702276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iwt3ROE4gHshHkoc7kFzeGy+XPllTikyaQMzQS3jGRA=;
 b=MWvzeqN8W5HNPDLjxszOW/tvs2qrj//WDoH1Jtn7VM/1PZ+oyZWOdxak
 C/yrevj5yh7X6URbKtKxOkcMq+UPckaOS25xXqD59qOsBePW8bIqPfCMG
 0YGyIrwdgE/b77UyF4ZStWUspqyvNyaBlpw5aSOAqPCC4XiwtMcgDbLoV
 TBnUTUDBdDts79YlJ9H0k4vpJlTz/DFS2OMou30D/YV+S51dEzI3DsnEr
 m7xEmHj7QJtMtLsPmkrioPn6Qle6XXOp8r1OP3E1hcVbSrYOb61I9OlVg
 n5w48st9VgFS7Epk+JkU982XWruiWvnYZe5gP7nmV0qc52g1Gw/EfrhG1 Q==;
X-CSE-ConnectionGUID: yk6hB/ZkTdWBuJFIcDRQoA==
X-CSE-MsgGUID: l6BGN937QVqnggWbiPszJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85871580"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85871580"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:24:35 -0700
X-CSE-ConnectionGUID: kgj6vmY6RNyibgyNb7Le1Q==
X-CSE-MsgGUID: nDWiLs6MRqyZvppx9BBN/Q==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:24:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:24:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 01:24:34 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcHc/2y+XJhYMdoot74ZCyLzopvD6tdhPuXT2TosNxs2aKnU76IqL+t7wAkPFjZW2raH3stYi8M/Hg/anewew40v1Zd1cEMA0PjWx08tmZjp1kbWbQ0o3G6vhbeb/gn+bBGv6pyT25cckfJEWB3RfYy7Gv4lrdmF0YXvDHSfNBtfl6JAAYzTi/11FSvApNwvFiav51Dbs9GYfyyRaPH2xnpL2HMfYttObY8wCpjM0j6HVPqXcyo/I6tH6oaRDJthsHJu2oZ2ZX/4Bkrzj8szpQ6Kjs/8W35ewvc6ZN8AbSUtSqaEwlK949A7F0vUSRrlOm9cNoIkmCMcWS66jPX+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kUq9Xuoqq4bMcfneM79rp+Cd9vF+1i9tqGjvw9+bao=;
 b=fwOLEVtXuPF/5K2WFAw7seP/MsOVDbwGP+SvpnL4Q030hK+IyyHqBjz74T4Odx3PN57AQzjv7CsmPKP+chFsXggisGz4Qsu4l02ktGjmqjslqQQte+ylCoHFLFlWPT2dEe8FbM3PWoZxTj6+GWbss13jGxZbhkkL1Ss01yTsNKOOQvRlPzZonV8hBTPm4aFY3k1UhvmTuxYZRUHoCnFUelVkbx5ZtkJRg0VBpt5jlWbFq6fOk6818OZDtBO0z59IR4CmXPbarXGyKG+O9hnhbSNOCA9cIGD957PplPkmWs8fYohY7ChJHJj9HlFeYMJgBTvrLtQk57ai283jQR8BBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:24:27 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%7]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 08:24:25 +0000
Message-ID: <c4624301-6ada-4378-a7f9-c8fd3b9a1bd0@intel.com>
Date: Thu, 11 Jun 2026 13:54:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8] Add test for oversubscribing VRAM in multi
 process environment that creates VM, bind large BOs and submit workloads
 nearly simultaneously.
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <thomas.hellstrom@intel.com>
References: <20260609052220.358316-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260609052220.358316-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::7) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|SA2PR11MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdc216f-c821-4d0a-1262-08dec792d903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: HxPG+j6mVBssRuxjSO7iwOQJjOiwRlahiPYBQ7Usicu33umLddR9lZ+r/GPipXANC0hamP7Or5NXKPL5CJ3ffl61RH5bGS7JTeCnhZgcSyc9TDcAPtitMhwaOYkmtgq3BwZDh7FZ+ssG5KCs6HEVKUMiSxw4u6hGhuS3CMtC8DnfmYzUHPEsbdpTVK68y3NGpVhQqD598/ml3PgYW7ZZUX4Cj0PycjxPiZwQ7GDCxBWMWKKYmimiTAYWLQqm/GJgRu8JahrSRdA1hwZC/Jad77CsfSxULlX9JY3GWIgwk8KsAwNLY1YqBijpY3zHUcZ6+Zp6mCVVv1jssLK64vsptWelZ5wdtrBJ4aho0OwSAO4RfFdRwiWgATkYe+ynkAS5YM/ZF8q7RibEyRyfWxLLKTf+Ny4ZX+KWquivmlpsAyiHjeOU1+Bs0MdlNBqA0PYhLSn5HLayLgIhHJBuffRaeLz8YeTcPux9DFAyn+xZ3mqediRH07gReKZOcBbXXGsrG8JpYmoz5jPDk2xw9jqNFkxs/+htzinG2FtmrDwAlATpSkimRonGl5j0rGS1Wl4j2s4c98j5dqnZfGQ1tA/Trms8E1DOh3DkbQ6ZggYsy8Oq4/QxjXn31mCuJXPA/KJj+y/UBLrEN9Z9bYbbqqL7RmFuGZACgoOIpPV1L7q+A/RIeCV//BZIPyM8GD6D5VSr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2FnYzQ1QUxETEp1dHRMT0VHbzJFM3V5L1Q4TzBnSEMyd1NhU3Zrd0MzVVR5?=
 =?utf-8?B?RHkrZHFCM05Oc2FlanFOVVFHSTdsMFFvQlRHZlVVUTBUL1ZJOEp0UjRkTnRq?=
 =?utf-8?B?SFc3L2NncHhubSt0enlkSVN5K1U3Tkh4TTdweU12TTVkUXNrS21sazFlZ1Iv?=
 =?utf-8?B?WHc0MDU3Q0pyNWFXN2pIclZQU2JkQ1FnMEFvdUl4VTVRSXNoM09ZSDFpbHJW?=
 =?utf-8?B?MlVRMFlyVnh3clpHV1VYYWNsODVVY1h4KzdwVSttUXdnMjlDZjRzajF3VXdI?=
 =?utf-8?B?MWx6RG9mVWVJOG1kbnpvVTJRdTJsRlNQbWFTQ0dKdmV3SE5WeFNDVTZVdHhR?=
 =?utf-8?B?NWdHTFpKNlNsdDVFS3cvWHhJTVJ2bTQwL3Bob2NaRXR0YjJ1ajV4WXI0bHVw?=
 =?utf-8?B?Y2dCVkhlcloxSkdGWmJab2pkT29lS2pLMHQrV1JLdFc4WVY5UkhDQlRJcDQ2?=
 =?utf-8?B?STFyNFZaS3g0S0E5endJZ200TW1rbVFOZXEveHNoNlU2MG1ZaVNrRmRkTVJD?=
 =?utf-8?B?TWppcG1kUGluaFNvZndUWXVPaWU3ZlczaXJvdDUzeEJVV0Z0WHFzSk5ycG5i?=
 =?utf-8?B?K3pNUW9mU3g0WVF0eEg2dVFkaldqMFVERDF2MFU5T2dTYXVLYW9zUGRlbC84?=
 =?utf-8?B?WTFFd3BUNlpLWUR6Mnh1M25Ga2JieXpuWit2dFFUemJTb0EyOTlnNHpjNHNM?=
 =?utf-8?B?MzdieXBBalB4ZzhxaE1BTHUwLzFPenRIOFNsRDRvdXY2UjNpS3ZHc0hYME1G?=
 =?utf-8?B?MW5ZZ2VMeWdHcitFMXdDZHYzMXZzT3VnbC8yTjZKS1hIRklCQTViNy80OTI0?=
 =?utf-8?B?QXk5NjFVMmZ4bURTNzRqM1Q5OEt3ZW53V0FCQjVPc21PQzcyVUxZSHBwcnJm?=
 =?utf-8?B?K1ZGT3JrdFUvU2cyUHowaUxYNzVEeS9EK1RVMjRhNmF5VmI2alZPeFIxVGJk?=
 =?utf-8?B?Rm9jL1FaQ1VLbGtLdkRoaVR3YnZNZlAzSVRDNW54K3lnSE92UWM3VGdKUElv?=
 =?utf-8?B?MzBaMk1zSTY5SUp2N3FlN01rcklaQ2lYV3dPMGFxTElaT0VybE1uL2Jackkx?=
 =?utf-8?B?N3Z4R0lJNmQ2cjR5RktGT0xwVjdDNmVEcXhVZDI4Ykl5aWJiSm9zZW8xSDhS?=
 =?utf-8?B?NlErRm5HY3ArcUxMTE9RMC9mbFQ2WkZYaTQ5QzRRMnpkRGxOS0NvMkhlandm?=
 =?utf-8?B?R0VpSFJrMUVqY0dXRGk1TUgrVjBkT1NxcEVtcjhlSGxMUy8rTWJ6RDdObExq?=
 =?utf-8?B?WTJkbkhCaE1lM0hmRnRqRi9JNzJBQWV0NW9sMlB6Vy8vSkRadjNNRVlVbVNE?=
 =?utf-8?B?cUthZUkvYUI0dzlLeEdFaHNlUnBFd2JVQSs1THFRN0NhMU1xN1hnc25kMXdr?=
 =?utf-8?B?dWkrSFZyTTFEcURod3RMcGhsRitkeENuZWRWZmo2bDE3eU5jc2hNZkJYb2o2?=
 =?utf-8?B?dytQY1BkZGdGY3pFUXNXRHhEdGsxWlBpSC9DVURuYnlKNDJRM3hpZktwWWxu?=
 =?utf-8?B?TU1XUWZ3dnR6a1FlL1pmZ1RqVXczY0tiWUJvRHM1NFJEQnRubmhiNUE5L01s?=
 =?utf-8?B?UzZEZG5KMStGRFJDaVp6c0xiajYwWUtmb3NrbXdzeEFiM3JhL1NLd1lZRWdh?=
 =?utf-8?B?SDh4NlVleXY4M3hndmxycEZaUFRFUStaUTFOUWFWR3hzcG5kbzJRT1lDY2ZU?=
 =?utf-8?B?SjArNElrZ2RkajdwcE5acTVyT3QxOXgrVFFRYTFzYVYzTUpESWVpNkFySXp1?=
 =?utf-8?B?TlVmSVVFWUMxaXFoNUE3VVBucW5INmZYdkdNS256Y3NyVFNyVERqR2JLdUpR?=
 =?utf-8?B?SDZtckhsTWd1cDd4azE3b2Q5SnV2NEw2aElQY2txR2VlOUhtaE1iNG9tckF3?=
 =?utf-8?B?YkNYMm5wYmM3OFJKUTYreVhhUG10LzdCaGVQUFFIVmRaaHJkWlZWanJXTllH?=
 =?utf-8?B?K0lBWm03SEhFaEd2SGJWWm9iaHVpVHpZL1djdER0RGpTNGRlZ0ZMM0liZmlr?=
 =?utf-8?B?Rno3bWppZURUWTl1MldESlVmUXB3SGFDTnVNblZzMTEyU21YK2Z1VTFOeCtv?=
 =?utf-8?B?REFoSHdLY1NIQzh6cm96bVRaNnZXdzV5NFFRRHFlcExQR0NUU3pUckxwTndm?=
 =?utf-8?B?VXJyQk5qWHd1akFqUWNWcENNQjU4MlRodDhudVVWeFRzUys5bGlvYnFDaGZR?=
 =?utf-8?B?TGFGdlVGakNRUlhWdTJheTZTUnBWUUZHUmVicXJ0L3gzbGd2VDVBejdHM2lZ?=
 =?utf-8?B?dTdQU3lUYVBkeFZiZHhIY3JrYjZ0ZDhRTHBUTVVucUk5LzFZNmI1Y1Y0VERm?=
 =?utf-8?B?QnVNaUdNb0cvbTZsdmhYK1RGYlE1QzVDUlp6UmQwckdmOFpnaDQyUT09?=
X-Exchange-RoutingPolicyChecked: UxwZYegWLOuAKeqOc/gIl1VIy3oPvoqUa5imCsDs1XAtzVr2JSW+lCZN3yymu4Q+RxRfui9FXl1lT7HSCEVZnDeG3R/25jBo5H/B2osCE4KI2WdPqLlvDWNiye2Zkt38Ng2ZTIr0erW8juiFvQBBhKAiH0GplHsnsMIOUJCmD/gNN96CMA1YOpfdQ0VpFikxBuRsrTsh4Ae7jirwNJZQA14X95uqXsxT97wxG/F4IuZ6A75hjmedoSX4McqeQVnOvXZjuiy7lES3TczoYRjKXaeezXAduZhv9l9fVzkyyT9O9JgdPWOpq20PykdZXNFmqowQ00N6nUh02v8nh0guvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdc216f-c821-4d0a-1262-08dec792d903
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:24:25.5413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfiJ5jhH167yIGQnR59CZ8IPH9lI9AcL41mia+uKuy8pf+9J1lFVa7Pdif8iuYe5pX1H6FM9X5Knf5MAZj2NFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
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


On 6/9/2026 10:52 AM, Sobin Thomas wrote:
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
>
> v2: Removed helper APIs usage clock_nanosleep and commented
> code.(Nishit)
>
> v3: Refactored code to smaller functions.
>      Added check for available SRAM usage and keep the max process to 20.
>
> v4: Remove explicit macros definition
>      Replace Bind ioctl with library calls.(Thomas)
> v5: Remove unused query_mem_info
>      Fix xe_exec_with_retry (Thomas)
>      Rename align_to_page_size with ALIGN macro (kamil/Thomas)
> v6: Fix vm_bind_bo_batch: move igt_assert(ufence) before first dereference
>      Fix create_test_bos: check errno instead of ret for ENOMEM/ENOSPC
>      detection, since igt_ioctl returns -1 on failure. (Thomas)
> v7:  Save errno immediately in create_test_bos before it can be clobbered.
>       Handle non-ENOMEM/ENOSPC failures in create_test_bos.
>       Remove dead code (retries == 0 check) in xe_exec_with_retry.
>       Add igt_skip when both vram and sram n_bufs are 0.
>       Add MAP_FAILED check on result_bo.ptr after xe_bo_map. (Nishit)
> v8: Add error check while performing vmbind.
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 464 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 464 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 408bfdb71..ac2e335c0 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,7 @@
>   #include "xe/xe_spin.h"
>   #include <string.h>
>   #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>   
>   enum overcommit_stage {
>   	EXPECT_NONE,
> @@ -29,6 +30,93 @@ enum overcommit_stage {
>   	EXPECT_EXEC,
>   };
>   
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +};
> +
> +struct mem_bind_sync {
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance eci = { 0 };
> +
> +	/* Use first available engine */
> +	xe_for_each_engine(fd, hwe) {
> +		eci = *hwe;
> +		break;
> +	}
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
> +}
> +
> +static int xe_vm_bind_array_get_err(int fd, uint32_t vm,
> +				    struct drm_xe_vm_bind_op *bind_ops,
> +				    uint32_t num_bind, struct drm_xe_sync *sync,
> +				    uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind = {
> +		.vm_id = vm,
> +		.num_binds = num_bind,
> +		.vector_of_binds = (uintptr_t)bind_ops,
> +		.num_syncs = num_syncs,
> +		.syncs = (uintptr_t)sync,
> +		.exec_queue_id = 0,
> +	};
> +
> +	igt_assert(num_bind > 0);
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +static uint64_t *
> +vm_bind_bo_batch(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size, int *out_err)
> +{
> +	uint64_t *ufence;
> +	struct drm_xe_sync bind_sync;
> +	struct drm_xe_vm_bind_op binds[size];
> +	int i, ret;
> +
> +	ufence = calloc(1, sizeof(uint64_t));
> +	igt_assert(ufence);
> +	*ufence = 0;
> +	bind_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.addr = to_user_pointer(ufence),
> +		.timeline_value = 1,
> +	};
> +
> +	for (i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.obj = bos[i].handle,
> +			.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		};
> +	}
> +	ret = xe_vm_bind_array_get_err(fd, ctx->vm_id, binds, size, &bind_sync, 1);
> +	if (out_err)
> +		*out_err = ret;
> +	return ufence;
> +}
> +
>   static uint32_t
>   addr_low(uint64_t addr)
>   {
> @@ -3073,6 +3161,377 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
> +			   struct gem_bo *result_bo, int ints_to_add)
> +{
> +	int pos = 0;
> +	uint64_t tmp_addr;
> +	#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +
> +	batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +	for (int i = 1; i < ints_to_add; i++) {
> +		/* r1 = integers_bo[i] */
> +		batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
> +		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
> +		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		/* r0 = r0 + r1 */
> +		batch_bo->ptr[pos++] = MI_MATH(4);
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
> +		batch_bo->ptr[pos++] = MI_MATH_ADD;
> +		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> +	}
> +	/* result_bo[0] = r0 */
> +	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
> +	while (pos % 4 != 0)
> +		batch_bo->ptr[pos++] = MI_NOOP;
> +	return pos;
> +}
> +
> +static void create_test_bos(int fd, struct xe_test_ctx *ctx, struct mem_bind_sync *bind,
> +			    uint32_t  placement, uint64_t *addr)
> +{
> +	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
> +	uint32_t ret;
> +
> +	for (int i = 0; i < bind->n_bufs; i++) {
> +		struct gem_bo *bo = &bind->bufs[i];
> +
> +		bo->size = GB(1);
> +		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
> +					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
> +		if (ret) {
> +			int saved_errno = errno; /* capture before anything can clobber it */
> +
> +			bind->n_bufs = i;
> +			if (saved_errno == ENOMEM || saved_errno == ENOSPC)
Again I doubt if xe_bo_create() returns ENOMEM/ENOSPC on failure. Please 
cross check in KMD implementation.
> +				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
> +			else
> +				igt_assert_f(false, "%s allocation failed at buffer %d: %s",
> +					     mem_type, i, strerror(saved_errno));
> +			break;
> +		}
> +		bo->ptr = NULL;
> +		bo->addr = *addr;
> +		*addr += bo->size;
> +		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
> +	}
> +}
> +
> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
> +{
> +	uint32_t expected_result = 0;
> +
> +	for (int i = 0; i < ints_to_add; i++) {
> +		int random_int = rand() % 8;
> +
> +		int_bo->ptr[i] = random_int;
> +		expected_result += random_int;
> +
> +		igt_debug("%d", random_int);
> +		if (i + 1 != ints_to_add)
> +			igt_debug(" + ");
> +		else
> +			igt_debug(" = ");
> +	}
> +	igt_debug("%d\n", expected_result);
> +	return expected_result;
> +}
> +
> +/*
> + * In concurrent VM bind stress tests, multiple threads simultaneously bind
> + * buffers to GPU virtual address space and submit batch operations. This
> + * creates significant GPU memory pressure where the kernel may transiently
> + * fail batch submission when:
> + *   - GPU page tables are being updated across multiple bindings
> + *   - GPU memory is fragmented across many concurrent buffer mappings
> + *   - Multiple processes compete for finite GPU resources
> + *
> + * Without retries, transient ENOMEM/ENOSPC failures cause false test failures.
> + * Retrying lets us distinguish temporary resource exhaustion from actual
> + * driver bugs. Non ENOMEM/ENOSPC errors still fail immediately and are properly
> + * reported with full errno context for debugging.
> + */
> +static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int max_retries)
> +{
> +	int rc = 0, retries;
> +
> +	for (retries = 1; retries < max_retries; retries++) {
> +		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec);
> +
> +		if (!(rc && (errno == ENOMEM || errno == ENOSPC)))
> +			break;
> +
> +		igt_warn("got %s, retrying (%d/%d)\n", strerror(errno), retries, max_retries);
> +		usleep(100 * retries);
> +	}
> +
> +	if (retries == max_retries)
> +		igt_warn("gave up after %d retries\n", retries);
> +
> +	if (rc)
> +		igt_warn("errno: %d (%s)\n", errno, strerror(errno));
> +
> +	return rc;
> +}
> +
> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
> +{
> +	if (bo->ptr) {
> +		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
> +		bo->ptr = NULL;
> +	}
> +	if (bo->handle)
> +		gem_close(fd, bo->handle);
> +}
> +
> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
> +				   struct mem_bind_sync *sram_bind)
> +{
> +	for (int i = 0; i < vram_bind->n_bufs; i++)
> +		gem_close(fd, vram_bind->bufs[i].handle);
> +	for (int i = 0; i < sram_bind->n_bufs; i++)
> +		gem_close(fd, sram_bind->bufs[i].handle);
> +	free(vram_bind->bufs);
> +	free(sram_bind->bufs);
> +	if (vram_bind->n_bufs)
> +		free(vram_bind->binds_ufence);
> +	if (sram_bind->n_bufs)
> +		free(sram_bind->binds_ufence);
> +}
> +
> +/**
> + * SUBTEST: oversubscribe-concurrent-bind
> + * Description: Test for oversubscribing the VM with multiple processes
> + * doing binds at the same time, and ensure they all complete successfully.
> + * Functionality: This check is for a specific bug where if multiple processes
> + * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
> + * deadlock in the bind code.
> + * Test category: stress test
> + */
> +static void test_vm_oversubscribe_concurrent_bind(int fd)
> +{
> +	#define MIN_BUFS_PER_PROC 2
> +	#define MAX_THREADS 20
> +	/*
> +	 * Cap SRAM test usage on large-RAM platforms (e.g. PVC). On small-RAM
> +	 * platforms (e.g. BMG with ~32 GB RAM) 50% of RAM is ~16 GB which is
> +	 * below this cap, so behavior is unchanged. On large-RAM platforms
> +	 * 50% can be hundreds of GB; cap it to a bounded value that still
> +	 * provides meaningful memory pressure for the concurrent bind test.
> +	 */
> +	#define MAX_SRAM_TEST_SIZE GB(32)
> +	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
> +	uint32_t max_by_mem;
> +	uint64_t total_vram_demand = 0;
> +	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
> +	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
> +	uint64_t target_vram = vram_size * 2;
> +	uint64_t target_sram, total_vram_bufs, total_sram_bufs;
> +	pthread_barrier_t *barrier;
> +	pthread_barrierattr_t attr;
> +	/*
> +	 * Dynamically cap VRAM oversubscription so the overflow into system
> +	 * RAM stays within 25% of available RAM. On small-VRAM platforms
> +	 * (e.g. BMG) the 2x target fits within the cap and behavior is
> +	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
> +	 */
> +	target_vram = min(target_vram, vram_size + sram_avail / 4);
> +	target_sram = min_t(uint64_t, sram_avail * 50 / 100,
> +			    MAX_SRAM_TEST_SIZE);
> +
> +	total_vram_bufs = target_vram / GB(1);
> +	total_sram_bufs = target_sram / GB(1);
> +
> +	/* determine concurrency from memory pressure */
> +
> +	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
> +			 total_sram_bufs / MIN_BUFS_PER_PROC);
> +	n_proc = min_t(uint32_t, max_by_mem, MAX_THREADS);
> +	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
> +
> +	n_vram_bufs = max_t(int, 2, total_vram_bufs / n_proc);
> +	n_sram_bufs = max_t(int, 2, total_sram_bufs / n_proc);
> +	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
> +
> +	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
> +		  vram_size >> 20, sram_avail >> 20);
> +
> +	igt_debug(" n_proc = %d\n", n_proc);
> +	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
> +	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
> +		  total_vram_demand >> 20, (double)total_vram_demand / vram_size);
> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
> +		  n_vram_bufs, n_sram_bufs);
> +
> +	barrier = mmap(NULL, sizeof(pthread_barrier_t),
> +		       PROT_READ | PROT_WRITE,
> +		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(barrier != MAP_FAILED);
> +	pthread_barrierattr_init(&attr);
> +	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
> +	pthread_barrier_init(barrier, &attr, n_proc);
> +
> +	igt_fork(child, n_proc) {
> +		struct xe_test_ctx ctx = {0};
> +		int rc;
> +		uint64_t addr = 0x40000000;
> +		int expected_result = 0, ints_to_add = 4;
> +		int max_retries = 1024;
> +		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs, *sram_bufs;
> +		int pos = 0;
> +		struct mem_bind_sync vram_bind = {0};
> +		struct mem_bind_sync sram_bind = {0};
> +		struct drm_xe_sync batch_syncs[1];
> +		struct drm_xe_exec exec;
> +		struct gem_bo ufence_bo = {0};
> +		int vram_bind_err = 0, sram_bind_err = 0;
> +
> +		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
> +		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
> +		srand(child);
> +
> +		igt_assert(vram_bufs && sram_bufs);
> +
> +		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		create_exec_queue(fd, &ctx);
> +		vram_bind.bufs = vram_bufs;
> +		vram_bind.n_bufs = n_vram_bufs;
> +		sram_bind.bufs = sram_bufs;
> +		sram_bind.n_bufs = n_sram_bufs;
> +
> +		create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 0), &addr);
> +		create_test_bos(fd, &ctx, &sram_bind, system_memory(fd), &addr);
> +
> +		if (!vram_bind.n_bufs && !sram_bind.n_bufs)
> +			igt_skip("No BOs allocated; VRAM/SRAM unavailable, skipping\n");
> +
> +		pthread_barrier_wait(barrier);
> +
> +		if (vram_bind.n_bufs)
> +			vram_bind.binds_ufence =
> +				vm_bind_bo_batch(fd, &ctx, vram_bufs,
> +						 vram_bind.n_bufs, &vram_bind_err);
No wait fence/signaling on vm_bind() completion?
> +
> +		if (sram_bind.n_bufs)
> +			sram_bind.binds_ufence =
> +				vm_bind_bo_batch(fd, &ctx, sram_bufs,
> +						 sram_bind.n_bufs, &sram_bind_err);
Same as above
> +
> +		if (vram_bind_err) {
> +			if (vram_bind_err == -ENOMEM || vram_bind_err == -ENOSPC) {
> +				igt_debug("VRAM bind OOM (error: %d) - expected on oversubscription\n",
> +					  vram_bind_err);
> +				vram_bind.n_bufs = 0;
if bind() returns ENOMEM/ENOSPC then why we are continuing executing 
below implementation?
> +			} else {
> +				igt_assert_f(0, "Unexpected VRAM bind error: %d", vram_bind_err);
> +			}
> +		}
> +
> +		/* Assert if there is any bind error in SRAM */
> +		if (sram_bind_err)
> +			igt_assert_f(0, "Unexpected SRAM bind error: %d", sram_bind_err);
> +
> +		integers_bo.size = ALIGN(sizeof(int) * ints_to_add, 4096);
> +		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
> +		integers_bo.addr = 0x100000;
> +
> +		expected_result = fill_random_integers(&integers_bo, ints_to_add);
> +		igt_debug("%d\n", expected_result);
> +
> +		result_bo.size = ALIGN(sizeof(int), 4096);
> +		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
> +							 system_memory(fd), 0,
> +							 DRM_XE_GEM_CPU_CACHING_WC);
> +		result_bo.ptr = NULL;
> +		result_bo.addr = 0x200000;
> +
> +		batch_bo.size = 4096;
> +		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
> +						       system_memory(fd), 0,
> +						       DRM_XE_GEM_CPU_CACHING_WC);
> +
> +		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
> +		batch_bo.addr = 0x300000;
> +
> +		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, ints_to_add);
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		/* Wait for large bind operations to complete before binding small BOs */
> +		if (vram_bind.n_bufs)
> +			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, INT64_MAX);
> +		if (sram_bind.n_bufs)
> +			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, INT64_MAX);
> +
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
> +				   integers_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
> +				   result_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
> +				   batch_bo.size, 0);
> +
> +		ufence_bo.size = 4096;
> +		ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, ufence_bo.size,
> +							system_memory(fd), 0,
> +							DRM_XE_GEM_CPU_CACHING_WB);
> +		ufence_bo.ptr = (int *)xe_bo_map(fd, ufence_bo.handle, ufence_bo.size);
> +		ufence_bo.addr = 0x400000;
> +		memset(ufence_bo.ptr, 0, ufence_bo.size);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
> +				   ufence_bo.size, 0);
> +
> +		batch_syncs[0] = (struct drm_xe_sync){
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.addr = ufence_bo.addr,
> +			.timeline_value = 1,
> +		};
> +
> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = 1,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +
> +		rc = xe_exec_with_retry(fd, &exec, max_retries);
> +		igt_assert_eq(rc, 0);
> +		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, 1, ctx.exec_queue_id, INT64_MAX);
> +		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
> +		igt_assert(result_bo.ptr != MAP_FAILED);
> +		igt_assert_eq(result_bo.ptr[0], expected_result);
> +		cleanup_bo_resources(fd, &ufence_bo);
> +		cleanup_bo_resources(fd, &result_bo);
> +		cleanup_bo_resources(fd, &batch_bo);
> +		cleanup_bo_resources(fd, &integers_bo);
> +		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
> +		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
> +		xe_vm_destroy(fd, ctx.vm_id);
> +		close(fd);
> +	}
> +	igt_waitchildren();
> +	pthread_barrier_destroy(barrier);
> +	pthread_barrierattr_destroy(&attr);
> +	igt_assert_eq(munmap(barrier, sizeof(pthread_barrier_t)), 0);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -3486,6 +3945,11 @@ int igt_main()
>   		igt_assert(xe_visible_vram_size(fd, 0));
>   		test_oom(fd);
>   	}
> +	igt_subtest("oversubscribe-concurrent-bind")
> +	{
> +		igt_require(xe_has_vram(fd));
> +		test_vm_oversubscribe_concurrent_bind(fd);
> +	}
>   
>   	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
>   		igt_subtest_f("vm-get-property-%s", f->name)
