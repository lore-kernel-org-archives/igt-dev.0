Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C01C67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 10:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C135113ACA;
	Fri,  5 Apr 2024 10:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbGPj5JC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAD7113ACA
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712312486; x=1743848486;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=V2N5PxoeJLe0bZOduYG/PK78vjcBkCL669uPnZQt5L4=;
 b=UbGPj5JCTup+mnZIIEHAh06n0/HhgfQ4b7agPJxfiK2yfSFOs6yCAtU8
 /FY3MYYBMJljFljZCOlsKUxMpFgs4ctojmHOKpTLYlJVF48my9TbF5qrr
 DkW0mXbDP5T/Sjb7v0nozXurY/bEs+VyrxjPTsEyS13r99oNnDHF4rjp7
 Ij3IcnumYnJyp8l4ogTvtI+J7uVK70oWcsIeNv19Uj/KoK5mRJOJKiWNz
 r/Oh3sIRwg8JNY1uE8a0AMSZXoMuJFbcj6r3m+C3aBn3WAyeyoLuP2TFP
 5SlThi1/UKdf4bgajRfCUKFQXxtlQ0kwjFzs70krnNV5/Gj6B5zwll22d g==;
X-CSE-ConnectionGUID: /hDpYx8ZSfGkNfwbbL+dKg==
X-CSE-MsgGUID: dDXADE4QQJay2d56AXtjKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11451434"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11451434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 03:21:25 -0700
X-CSE-ConnectionGUID: AG9htcztRFWKsZaYPHOQ2w==
X-CSE-MsgGUID: p67MR3kiTMOWyiR/fd1+0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23602305"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 03:21:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 03:21:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 03:21:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 03:21:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 03:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS5mtH4onbE5j7UzXEGiPAqjoAaifGyD9GA2836zxMPj7jlrX7NNzka0L++lZLZM5+8wjKCcADm2aX/wPtUpDIcmNmW2SVcmhYq3oYIOuLj9pqDzKBqHUijbODfLIQeyDix7vL0XWBfsf3Yyd6odtRj6NURztrUMtRrQ3rkZPjNIYDHQUwOWVBfUpee+BFdNumQJfwCTpfW/fUlqAxZacPsnsTxFAeqAC732ZKVFgQGYy6GdwwgKKchfYHqc4ML9htAcdm1WC3sFrPA17o+7RYHYtovBTYAPXrTG9Ybf3U0mHfLq1kPdwo4dhWBXBP8WUDtpBLbeLY7aJNNDdjFfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax5HWN35CST4FdhYvQHABEYhgJfh2SDHMlwW8/3fYsQ=;
 b=bhLVoYphZweWSAwRTqaJlVtkepzZlGSIQtp4l1zHQ8N1PiMkcqKefh+xYcBYmOlf+3FZr3wwBPZvI5VGOCE7JGP5EengvqBQy3COeejzRQBtgLjMI/OJKTihoBrU1f3luoOkO3eH649s4hyo1+vGn+/1rnJ3m44eGOgHjfYjdtB374Dhxj3P3ghfV5HmQqGtMfCPyrzY9Z9MM5wBu2Mg0A114d1Cz4KVbFdwiEpJO+nPLqS8bhf9ToW29XL3fafV8dkpLHVa4RVTnRZjHudPRioUq4cxGqJRwLymp8WeWmzAhV5+kFFerfP/5++kxhwYmwev1/hA+JE1ThHCI5sHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 10:21:20 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 10:21:20 +0000
Date: Fri, 5 Apr 2024 12:21:17 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 lib/xe_mmio: Introduce Xe MMIO lib (rev3)
Message-ID: <20240405102117.u7uxrkrewvuocgca@intel.com>
References: <20240403120955.4070545-1-piotr.piorkowski@intel.com>
 <171221645577.1208645.8040270488131826053@8e613ede5ea5>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <171221645577.1208645.8040270488131826053@8e613ede5ea5>
X-ClientProxiedBy: DUZPR01CA0300.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5103:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvk+i431Ko16D+YT1vjhba7+vy1HBhabZDo9QZUVjbEEgjmW6kIU/TwPE2aX49AtG6wvT9u6F2btqgxsunSCisHZ+bXzoNoHh83qSnC4FoGCfmf8eDJVd+aPyLeg9xhslldM35Q83xjeZMe2+HoQ1Ylvsyc7r/MBcByHJmHte0BFsWq5kZBxTOcLO1Gzc9GWRDg0md5wucbondKaG99nLRwOVfPzpPmE6YKBTI2LG3SYJQej7sG17ck75ME0wchjXpW1GpFRnVVPmY4SwBkzdDJQKls8AIyxl2UgPv7UoWjeqlK2wwU4QH38lLoinbsWUvskFr1QN/iUjKL4sjvkGLilez/zAgwxwq8B3UDg5cFSFoeTEJBwSBikMm51BaaWvxLPe28tjriPpDmkMj48QHNYf+Dp7O6ND+fNUjUZGlTCNXiOtHtrOt7Yz1gJyRa1cQ8M6R+/FA/tZxJsO8r1CptXLoS5d6voo0CRy0V5XN709/OXhfVTmYsM3syB8vyuHkBsYkfzoCq2m7/kKNptaFSk5o4Rzl9d7dqopjVDIvLhsmCoqjZKRrKtxPGdUuk3qOC3yPXOq8B5tiH6k6wF7MmbONjWLhpS0kOZX98JLUtyShVE40YT9nLW7LKXPLo6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJvUms4N1NMZFhlM254VnBjdzVPUlhqVGFyRzh3YmZNSktIb05NeXd2WnBF?=
 =?utf-8?B?bHVGdk1UZDlucTBGLzFPWDFMTCs2N3ZmbmtJalBmOUpmcTBOUk5JMHNEdlo5?=
 =?utf-8?B?a1FZYVplZEZ0cmZHd0hNd3pSckJNUU83ZnN6NWtscUhTN3RzQ2dwVWpLS2Fm?=
 =?utf-8?B?YU5wZjhaeHB0YVk1ZC9MUjVqbXJ5WVhzUGpEeWdvbEwyRldJUzNNRVdhVmhX?=
 =?utf-8?B?MDhjdzBKd052ZlBxcW1vM3orN1NpcEtEbVE1azBHM1BzYVlDT2NYTEljQjRn?=
 =?utf-8?B?SGpySGNGckJ1YXo1VUpodi9US0xiT0czTDkwVUJlSDMvN3kyUjFWTjg3RnpC?=
 =?utf-8?B?eFI4VlNZU2hmZVBwby94V3NQNnFXRHYwUnZ0R1M0cHl5a3lNN3hZSU1lUUo3?=
 =?utf-8?B?U3g2Tmw0ZmpScjlEZUVvaHpTbnkzRFR2bVVZQmcyZ1ZMY09ZRlZqUjRKaWFL?=
 =?utf-8?B?MVRJU3VWaXQwaWNWWk15b3NpcXRaQnZSMThSaXZORVhGa2NCdjhlNStDR2cw?=
 =?utf-8?B?cWxzdjI4Z3ZwSm1rODZJb0xWSHhCQTQ4dGhISTRaTXk1bnRpbjNtNUNDUVgz?=
 =?utf-8?B?OVVKaGh3Yk5jUVRGUmhWaFpGbjlHdUJDZUxOaGZCNktLUnAzdjZqOE9WcDFx?=
 =?utf-8?B?OGlEbHBRcjllNVE4aUtoeVFNTWdEMHp0and2ZFZnK0dVNzZHUWlmMk1XMGk4?=
 =?utf-8?B?QWFSb0pndWZPU1NuSUNXSkNNQkFicmFob2FwbEFvUFhzZ2pZQnB5U1ExUUFP?=
 =?utf-8?B?UWVmWVVFOTlYUmkrQ1NsRXlpN2Qvek5PSVJycDNVRUNGN3ZJNVRUY1kxbUFI?=
 =?utf-8?B?b0JIOE1ENHVFQW9kNE9VSDNGNkNrMkMwUHJQVXVWdGRQSHhhOWg5NUxVMFJx?=
 =?utf-8?B?dVdwZXFqTUFtYVBsVWszcUh0WHRockx2eXFUdFAxMWlMc0plMndoa1l3VjM2?=
 =?utf-8?B?WmhPcFlGZUsvWFYvaTJ5OFJCd0QzRGZjMmo2cC9aR1k0VWlMcXQySjNINUxx?=
 =?utf-8?B?L1ZsZVlpemcwTjk1RzBnY08vSHNOVHJmSHAyUVIwUjJ5WmZNbVpTMFA4eC9l?=
 =?utf-8?B?d3JXaVBScXRIUkxlNW1kelB2TERHR2pISDJkTFUvZVRNbkgwcWF6U05Wa0dl?=
 =?utf-8?B?YklyK0dqNTk0bkZSNFh5YmhxelpGQUNPdDIrZzAvRGF6dnBqcklsMk5YeTZr?=
 =?utf-8?B?MHd6R0lXQjViRlJEUGRKdHZZeEFtUEUveHJXeDJrc1dsRWtQZWVCU1MyT3lE?=
 =?utf-8?B?aUFYKzhTNC9PY3cvKzJwM2w4ZGs1KzNKdHh6VjFHdmRVLzZmSVVTLzVJeXdU?=
 =?utf-8?B?RkhkR3phalBxeHZFckYvdU1iVFVGaVZENy9LWE1UUCs5U2Mvcis2SEplN2sv?=
 =?utf-8?B?S2tyQkF0dmZOUXczeHZpVXQ3TWw1ZFpRQ2ZkMFc3eE5FMVNpT3QwcDlEcUl1?=
 =?utf-8?B?YlNOZjZhNFpGVWllVDc5cUVjM0JKMXk1TGJqNUN3dHRrR2J0dThKMmY0eDZi?=
 =?utf-8?B?YVQwOEdBSVlKcTNPOFlubXRYbldTRFc0cVFtYVgwUTVFZVl0Nis1ZjlSc3ZS?=
 =?utf-8?B?cHhoQXVKcXRsR0xvTC9ZNzFEbGNObDhDdEFMb2JxdE84ZVRUQUR2eFRyblVG?=
 =?utf-8?B?aGEyNGdZMDI5S3A0N1o5SEFUVzQwQXN2MmlxOE02d05aT1JpUTAvY3pvbkNv?=
 =?utf-8?B?cnZVSE1LZytFUlpyR25BR2RSejhZZkcwYUJYWHFwcGZIQlFrbWR4cnBrK1Vj?=
 =?utf-8?B?Y3owVGFMUTFoK3pjcXNndDJPcmI1R2VGZXRONlFWdnFHaXNobGU0SXpGZExt?=
 =?utf-8?B?YUh6Q3VXM0dlRWNRVGMvUnR4Q0hWZEhyakNBaUh0SDMvaFV6OHh6MFRlVzdw?=
 =?utf-8?B?VEl4YXBlUU9tNVBDU01jbXZOZmlqSU9rTGJBVlVkS0NtbndVTlhwR3J0SXNU?=
 =?utf-8?B?ZWVlRiszNEFhREM0SGVJait1cEJOb0xyc0l5Q2tFSzNVbXZ3Ukp3R2J3MkJD?=
 =?utf-8?B?WGg1RUlSYm5yUUxJT1I5aHJ0QlJnR215ZDVIUUcvOEpiSHN2VzllUGI3dkdo?=
 =?utf-8?B?QTE0Zk1FSnJobmp0TGpZRS82c1g1SU9zN25ZSk5KeklUNXBUWjJSbWdvTjFt?=
 =?utf-8?B?TklLSEF2R0ZUQ09HUHU1dVloOXUybzM1UDhPODNlZ2VZUzlxUVRLVEtaOE5Y?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca1720d-c27c-4773-8249-08dc555a22ce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 10:21:20.1164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/Lx4ZGwTWHUMbRaoHkb6gM7PfaKJq3+tMLInYnq2HCUNlQDG+g+udOAYh+PMyj8T+vlGoZ//S8jQmUchEesKnridzjERVnWDNHOrcjANfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on czw [2024-kwi-04 07:40:55 +0000]:
> == Series Details ==
> 
> Series: lib/xe_mmio: Introduce Xe MMIO lib (rev3)
> URL   : https://patchwork.freedesktop.org/series/131591/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7798 -> IGTPW_10972
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10972 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10972, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/index.html
> 
> Participating hosts (36 -> 37)
> ------------------------------
> 
>   Additional (4): bat-dg1-7 fi-glk-j4005 bat-jsl-1 bat-arls-3 
>   Missing    (3): bat-arls-1 fi-snb-2520m fi-bsw-nick 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10972:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload:
>     - bat-dg2-11:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7798/bat-dg2-11/igt@i915_module_load@reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg2-11/igt@i915_module_load@reload.html

Not related:
<4> [212.978405] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6dbf: 0000 [#1] PREEMPT SMP NOPTI
<4> [212.978415] CPU: 7 PID: 676 Comm: prometheus-node Not tainted 6.9.0-rc2-CI_DRM_14522-g406e10d886a2+ #1
<4> [212.978419] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
<4> [212.978422] RIP: 0010:hwm_energy+0x2b/0x100 [i915]
<4> [212.978575] Code: 48 89 e5 41 57 41 56 41 55 41 54 53 48 89 fb 48 83 e4 f0 48 83 ec 10 4c 8b 77 08 4c 8b 2f 8b 7f 34 48 89 74 24 08 85 ff 78 2b <45> 8b bd 54 02 00 00 49 8b 7e 18 e8 d5 e4 ea ff 49 89 c4 48 85 c0
<4> [212.978580] RSP: 0018:ffffc90001927d00 EFLAGS: 00010202
<4> [212.978582] RAX: 0000000000000000 RBX: ffff88811aae6428 RCX: 0000000000000000
<4> [212.978585] RDX: 0000000000000001 RSI: ffffc90001927da0 RDI: 000000006b6b6b6b
<4> [212.978587] RBP: ffffc90001927d40 R08: ffffc90001927da0 R09: 0000000000000001
<4> [212.978589] R10: 0000000000000001 R11: ffff888110af0040 R12: ffff888132d13810
<4> [212.978591] R13: 6b6b6b6b6b6b6b6b R14: 6b6b6b6b6b6b6b6b R15: ffff88811aae6428
<4> [212.978593] FS:  00007fdec2a00700(0000) GS:ffff88849f380000(0000) knlGS:0000000000000000
<4> [212.978595] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [212.978598] CR2: 00007fdecad179d0 CR3: 0000000115c16000 CR4: 0000000000f50ef0
<4> [212.978600] PKRU: 55555554
<4> [212.978601] Call Trace:
<4> [212.978604]  <TASK>
<4> [212.978605]  ? __die_body+0x1a/0x60
<4> [212.978610]  ? die_addr+0x38/0x60
<4> [212.978612]  ? exc_general_protection+0x1a1/0x400
<4> [212.978617]  ? asm_exc_general_protection+0x26/0x30
<4> [212.978620]  ? hwm_energy+0x2b/0x100 [i915]
<4> [212.978724]  hwm_read+0x9a/0x310 [i915]
<4> [212.978823]  hwmon_attr_show+0x36/0x140
<4> [212.978828]  dev_attr_show+0x15/0x60
<4> [212.978831]  sysfs_kf_seq_show+0xb5/0x100
<4> [212.978836]  seq_read_iter+0x111/0x450
<4> [212.978840]  ? rcu_is_watching+0x11/0x50
<4> [212.978844]  vfs_read+0x203/0x340
<4> [212.978848]  ksys_read+0x64/0xe0
<4> [212.978851]  do_syscall_64+0x6e/0x140
<4> [212.978853]  entry_SYSCALL_64_after_hwframe+0x71/0x79
<4> [212.978856] RIP: 0033:0x4b10f0
<4> [212.978858] Code: 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 49 c7 c2 00 00 00 00 49 c7 c0 00 00 00 00 49 c7 c1 00 00 00 00 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 28 ff ff ff ff 48 c7 44 24 30
<4> [212.978864] RSP: 002b:000000c000111790 EFLAGS: 00000206 ORIG_RAX: 0000000000000000
<4> [212.978867] RAX: ffffffffffffffda RBX: 000000c00003e000 RCX: 00000000004b10f0
<4> [212.978871] RDX: 0000000000000080 RSI: 000000c0000c8d80 RDI: 0000000000000006
<4> [212.978874] RBP: 000000c0001117e0 R08: 0000000000000000 R09: 0000000000000000
<4> [212.978877] R10: 0000000000000000 R11: 0000000000000206 R12: ffffffffffffffff
<4> [212.978880] R13: 000000000000001c R14: 000000000000001b R15: 0000000000000040
<4> [212.978883]  </TASK>
<4> [212.978885] Modules linked in: vgem drm_shmem_helper snd_hda_codec_hdmi snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core snd_pcm mei_gsc i915 prime_numbers i2c_algo_bit ttm drm_buddy r8153_ecm cdc_ether usbnet x86_pkg_temp_thermal coretemp kvm_intel kvm e1000e r8152 crct10dif_pclmul video crc32_pclmul wmi_bmof mii ghash_clmulni_intel ptp mei_me i2c_i801 pps_core i2c_smbus mei intel_lpss_pci wmi [last unloaded: mei_hdcp]
<4> [212.978924] ---[ end trace 0000000000000000 ]---
<4> [213.335121] RIP: 0010:hwm_energy+0x2b/0x100 [i915]
<4> [213.335301] Code: 48 89 e5 41 57 41 56 41 55 41 54 53 48 89 fb 48 83 e4 f0 48 83 ec 10 4c 8b 77 08 4c 8b 2f 8b 7f 34 48 89 74 24 08 85 ff 78 2b <45> 8b bd 54 02 00 00 49 8b 7e 18 e8 d5 e4 ea ff 49 89 c4 48 85 c0
<4> [213.335306] RSP: 0018:ffffc90001927d00 EFLAGS: 00010202
<4> [213.335310] RAX: 0000000000000000 RBX: ffff88811aae6428 RCX: 0000000000000000
<4> [213.335312] RDX: 0000000000000001 RSI: ffffc90001927da0 RDI: 000000006b6b6b6b
<4> [213.335314] RBP: ffffc90001927d40 R08: ffffc90001927da0 R09: 0000000000000001
<4> [213.335317] R10: 0000000000000001 R11: ffff888110af0040 R12: ffff888132d13810
<4> [213.335319] R13: 6b6b6b6b6b6b6b6b R14: 6b6b6b6b6b6b6b6b R15: ffff88811aae6428
<4> [213.335321] FS:  00007fdec2a00700(0000) GS:ffff88849f280000(0000) knlGS:0000000000000000
<4> [213.335324] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [213.335326] CR2: 000056031eb95d58 CR3: 0000000115c16000 CR4: 0000000000f50ef0
<4> [213.335328] PKRU: 55555554

- Piotr
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10972 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
>     - bat-arls-3:         NOTRUN -> [SKIP][4] ([i915#9318])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#2190])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-jsl-1/igt@gem_huc_copy@huc-copy.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][6] ([i915#2190])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/fi-glk-j4005/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-arls-3:         NOTRUN -> [SKIP][8] ([i915#10213]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-jsl-1:          NOTRUN -> [SKIP][9] ([i915#4613]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][10] ([i915#4083])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@gem_mmap@basic.html
>     - bat-arls-3:         NOTRUN -> [SKIP][11] ([i915#4083])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][12] ([i915#10197] / [i915#10211] / [i915#4079])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][13] ([i915#10196] / [i915#4077]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][14] ([i915#4077]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][15] ([i915#4079]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@gem_tiled_pread_basic.html
>     - bat-arls-3:         NOTRUN -> [SKIP][16] ([i915#10206] / [i915#4079])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg1-7:          NOTRUN -> [SKIP][17] ([i915#6621])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@i915_pm_rps@basic-api.html
>     - bat-arls-3:         NOTRUN -> [SKIP][18] ([i915#10209])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@i915_pm_rps@basic-api.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-arls-3:         NOTRUN -> [SKIP][19] ([i915#10200]) +9 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - bat-dg1-7:          NOTRUN -> [SKIP][20] ([i915#4212]) +7 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg1-7:          NOTRUN -> [SKIP][21] ([i915#4215])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][22] +10 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - bat-arls-3:         NOTRUN -> [SKIP][23] ([i915#10202]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-jsl-1:          NOTRUN -> [SKIP][24] ([i915#4103]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#4103] / [i915#4213]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][26] ([i915#9886])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@kms_dsc@dsc-basic.html
>     - bat-jsl-1:          NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9886])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-jsl-1/igt@kms_dsc@dsc-basic.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][28] ([i915#3555] / [i915#3840])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-arls-3:         NOTRUN -> [SKIP][29] ([i915#10207])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-jsl-1:          NOTRUN -> [SKIP][30]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][31]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-dg1-7:          NOTRUN -> [SKIP][32] ([i915#433])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-dg1-7:          NOTRUN -> [SKIP][33] ([i915#5354])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
>     - bat-arls-3:         NOTRUN -> [SKIP][34] ([i915#9812])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-arls-3:         NOTRUN -> [SKIP][35] ([i915#9732]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - bat-dg1-7:          NOTRUN -> [SKIP][36] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-jsl-1:          NOTRUN -> [SKIP][37] ([i915#3555])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-arls-3:         NOTRUN -> [SKIP][38] ([i915#10208] / [i915#8809])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][39] ([i915#3555])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg1-7:          NOTRUN -> [SKIP][40] ([i915#3708]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-dg1-7:          NOTRUN -> [SKIP][41] ([i915#3708] / [i915#4077]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
>     - bat-arls-3:         NOTRUN -> [SKIP][42] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-arls-3:         NOTRUN -> [SKIP][43] ([i915#10212] / [i915#3708])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-arls-3:         NOTRUN -> [SKIP][44] ([i915#10214] / [i915#3708])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-arls-3:         NOTRUN -> [SKIP][45] ([i915#10216] / [i915#3708])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/bat-arls-3/igt@prime_vgem@basic-write.html
> 
>   
>   [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
>   [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
>   [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
>   [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
>   [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
>   [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
>   [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
>   [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
>   [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
>   [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
>   [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7798 -> IGTPW_10972
> 
>   CI-20190529: 20190529
>   CI_DRM_14522: 406e10d886a22211d2866bfa9322aec1727171f8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10972: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/index.html
>   IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10972/index.html

-- 
