Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8924DD5C0F0
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C6A10E9FD;
	Fri,  8 Nov 2024 15:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+97g02E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F8E10EA08
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731080797; x=1762616797;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QxOrZJLr1n+fR47fEGY8vSYGoH7nwYB7U2RAynIa/f8=;
 b=Q+97g02ERCIQjIvAW69Foe+ViBSSeslVgEGqaOZbHgm/x7QrqSwqSQxQ
 FYhtnihg0FzE7CkjWBiaTUccrj/cl66UZnyCwZEdZQIcczbYBqpjjukLt
 JNId8lGMDlsz9SNp8AOLNAYLi++b9HqzVNLeNmGz8AcSpda3gr+wITm5l
 lH/Te20aoO4IhgcyQhVf5RfBdZiD/SUBZZkYcxy1TVm+/EFJLUL+8G79P
 lJrVaenSYzQHwyzvQaaN5Qu1OTgfHC5DhJMGyaNBjdh+JAglGg0CML29B
 XhHctqEhTcc49BZUhkwDs42mUg3C+3m8NUSfhshORtJWEY0cJf7GWCaZ4 g==;
X-CSE-ConnectionGUID: u57k7YU2QNO7lZcPRqm8HA==
X-CSE-MsgGUID: 5UonFbMdRTK8y8G5okcDmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53529946"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53529946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:46:37 -0800
X-CSE-ConnectionGUID: FaVOzAadQIusrrl7wylkAQ==
X-CSE-MsgGUID: zKfH55C+Sfu0wdxxkKwetg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85950227"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 07:46:36 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 07:46:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 07:46:36 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 07:46:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB9ZWGGzM2shamcb98WAW+wL+CDWptTdDKRsrV0Yn7j8yC8Eai3uxgP+I9KVw9gZeg8vTVpI28PPsL2A8oUeMjgcXbnJLIqv/bixOusj0SXwiINIqkfFsBRf4OuMJCSmW9pqLXO5mwG5UqR0wKmR/MzY+hN7Rf6FFEJlgOF8qOc1yKt6y9IvWUh7sdEcZmSCsL7eIekcZ7JsxsNe2nG/M0WAyBjVm/ATvR4olIrZLNgRqqQ6vGjeODdHk9d6npMx1TWz8OgqLvDErQ9wg5ce2VVgrELicJ0IHT6rL5G5ObkiXaKhfCxxMNK2TFadwkxkXbtfuAlufdq1VfChR6Q18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mNzlJ0kWcpVmm15sxLyZiAs0+lLgp3+t+c3ZmA2Jhs=;
 b=gSzsqrWfGLWJHxAGdD6O9PgETfjtWit/1YvmiNNITB9qDe0RIt1DocM+UwHH5YjgoQdFwopZaNrbgTfGMJASYR1ttmJiJyF5xSnnw3G9GztHBsgXaYBlyydZKxy79S0DT2gFuqZstaVFGhGDuHxehsj4TZW3rOsCQaq4PCKcvgTKaE0nNc90qMzzpOio2UjhAE0dEcAND6W5CBH9gbrm7iLWIZ4O2Op81NFX/R0r6FcgkwRtGyViVr/oWh4YLap+smB4wau50wBvD4/0I3Bl927Nxygq10FNFE1pXF/uXhRBJYmSzLil5cymn4hOEUDoHt2Sf9OHvhjAxbsqhHoTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.33; Fri, 8 Nov
 2024 15:46:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 15:46:32 +0000
Date: Fri, 8 Nov 2024 09:46:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <clinton.a.taylor@intel.com>,
 <kamil.konieczny@linux.intel.com>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
Message-ID: <lkiuylps7ka6qbno3gjtpkjbvu6dxpbkjw6725cri35coysxcz@yfcafnu4oguh>
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
 <874j4if2mb.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <874j4if2mb.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: a6add291-856a-4b2e-687f-08dd000c847c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9IZKLzcnFTb4U3edaaT0Z5jeXbhwbwVdVjMyRWuTMcBrVr0M5qw09FKU7XQy?=
 =?us-ascii?Q?PyFv/yiMYQvZowjZmz0xjpuevwHPVl+CPblAeS9LURxXHndsYSWvie8GTKMS?=
 =?us-ascii?Q?HMYo0b6lDbmHdDkumYfzI4A3pWBNEwVuToqWBdU06vrFZWOIxMJck8O2Rsrt?=
 =?us-ascii?Q?NH/hkkTffXRE37+B1GSFCln4Yzu4btwOdutc0xIO+rnZkCZoqNm4qr1iy+fD?=
 =?us-ascii?Q?Z27ES6ttAJtOdQ5vwR1w7rK1UsyZKaIfDa/qXaDsrminaSDUYvIOXi+DAIX7?=
 =?us-ascii?Q?GODgHcaPHYZbdYkdZiNaGXdAIfD6T/G5wt9cr9GZxqHHxM/LROwv72b/2ev2?=
 =?us-ascii?Q?Br7kVFUv3EfGnFiwj+7L7jfKSvZgKfCStayEEQpHydqwN9/HRFNYSnuL6sNi?=
 =?us-ascii?Q?L/IDwJGUzLaYYBnJ10sivWWGWL4verdW0eXWGxXBLxdkbNwjNvoFLxHV6b6h?=
 =?us-ascii?Q?DhZ6ao2KYKiyApAjamHIwrVzqCGaQrTrR2ECedBglqfSteucJcgEe9GoR2bu?=
 =?us-ascii?Q?knS9xejDjEFQrDKhLuqbmFkMMPqcvKIq9wET5QVqNXvp9+OLE/eqCAXKRclI?=
 =?us-ascii?Q?RWNHYmq/TuggBDQHAk0DpRLXF1XpTgMvoxQCs0otk28CO7adTMP1wRZ9NREf?=
 =?us-ascii?Q?zS27Gif75nF1WtbrCPkQFfnFBRQqnmt1PQjIIj8emqYB5biFt4SusWm4wASK?=
 =?us-ascii?Q?kvi6T0hVTZNlCB78kLd4tPdTOn3w9PP/9dNUEG/+q4MyrjutOGf750Y3tY4h?=
 =?us-ascii?Q?CMlSrLmO0miyqu5chDVVzVQrX1IZwU/C4et7vvmiCbtTZraTAPwLcb42cDs8?=
 =?us-ascii?Q?KdA7+7MUm+uy4e2T/GSo314xtFUCZBstcgW9+j1HdeExOPMo4iIpUjZ2PgQ2?=
 =?us-ascii?Q?vC/GBdzFLl1j1ygrtKWNpymxuKie7r5kX+woZ63xv/HzbZSmjZwZHAxp7aRq?=
 =?us-ascii?Q?RT2bk1820gavPqVj3tiPkIj7hzmq6fNJK+oNiR8ywt9w+fJ4cEH30+C/g5SI?=
 =?us-ascii?Q?ksJNtG4qYRzr1jDZUAP2Z8fSmrmV/R3G+/zp1pZghEYRrRlKNPtS0LNgPE4N?=
 =?us-ascii?Q?+BDpIuCsisyI4B+tSmdjT6xm5bM8CdVk9t0LVcnkYvzBrHaHOa2wh6ZYJ9Vg?=
 =?us-ascii?Q?+tMEDbKhfsEeCbl2gy9wd71O0O2UG/L+2CXfESySnTvw4u4jS6pv58ikhNzU?=
 =?us-ascii?Q?da+/K5f5OSADk57KNFJ5sMFX+vYw7A9/fCLx1FTVONNMM87pb2SSAKN15prj?=
 =?us-ascii?Q?hpWVmiMFfNNErY7yRkv58hxtIs87sgXGqIQNvaxJO8QtH15soADp4NZSN0Ru?=
 =?us-ascii?Q?O54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Olvi+Otab8PRtNwJom1fGDNgk3/EuzKqRop8uSotZU2F1SnynaBQbKZw5rVR?=
 =?us-ascii?Q?cIop79hUXF7/Ha7pIt3pcb71nUlYskC5fsEnp2fnKt1b80rDqIABpfwjvnDT?=
 =?us-ascii?Q?O/9w1XuxFJPzquVG88HqH49HtlTJEMvZGs/WWww2t+x8aowVBk4UVSOOhfFd?=
 =?us-ascii?Q?bcqVmte6v/txkqswO1Z8VcPnse/CLeEt6Qe4fw4bDwcE7K9msuNwJT0Vw070?=
 =?us-ascii?Q?NVLPdJrgBvkFLUoivtw9kcCBgpFWSIdVu3NwOV3CUuq0yGi0NLC74KE9BnXN?=
 =?us-ascii?Q?LDGSCAt9KJ2U+jnHcQY3qEUjUiGTVuDp9511biPqPekbDVw7RPWWWWGMXn0j?=
 =?us-ascii?Q?OsRUjKzeAFw1jBW0Tt6XFq49Ui4bc9BAoM1aeLuuJKyRyIWm5mcATIVyGk2n?=
 =?us-ascii?Q?CLqVjrvCSrMy7CCYr95VgN1iYayOakvGytznNi2YRhtFc9vuMwauBOisuF2S?=
 =?us-ascii?Q?psXxvnodav1TZ97irYlNbKDwfhvSGJiJ1MXb5aHyzVwGL6xiQgNwCQaaXrnt?=
 =?us-ascii?Q?NudWxmY7Z+rojTkaDOwdRjM+1RgQHx3h/Z7FH5+oWSFlWC7xiAmycwir7UKZ?=
 =?us-ascii?Q?b98Jtv1KnN2Ea7UBYph2sZrMHQxZC8Yo1mILXsEAT8E+fV/3IegP8SOE78NX?=
 =?us-ascii?Q?12CIFkENrVxAzcMx48YgNwtnxF/ZgjJ51Z8hwT3ey/HhufGJJlxg2etU7TX2?=
 =?us-ascii?Q?uoaAtT/5o4qDp1DpM0CvS7aUfq0LNNql7tEO6dOZhdCGYAXrDxvmcAFH4PL3?=
 =?us-ascii?Q?XTgaqe99ge+2e7XaxfTfA2VMaVUGSiPn3n/QN562v2JOfCL+jOsFvYrYrVcD?=
 =?us-ascii?Q?kc4Mk/0vRug/XkPVLaD06mpBV+7cnXjhVqUMuc3Fd2tQSH2yxt8fUGN1TjSX?=
 =?us-ascii?Q?c5DLQthSDKLCUg18AxXX4gMzkaaAotLKZ91V7fp3nYY+I9KVU+h2CEwOdeif?=
 =?us-ascii?Q?Q7BSiDz3MVIZ/JTyr2pGtdNdOjN5s3i1AVhx+QKQ05D/jpgI90PR0n1QX5gL?=
 =?us-ascii?Q?UuJpwUtHbdsODHvnO+MmgQq4p3LRnsLaNnKjNFpcD/LCdiffmNy/hsDqBGCm?=
 =?us-ascii?Q?/fBTBNJpS7cr7F4elH/MCD4z5wYoJOy7o+U4jADa4lB8cNvJAYqLOefS9m1B?=
 =?us-ascii?Q?g3dflYvIBDzC2H8FIFSqIJAVi2x8t84+t89CAAgI4lXPRErN0q6dtHcNSlV5?=
 =?us-ascii?Q?RqgYgbGfkLmMTbnZJZkh0VJnqaNK1kRvZ2J4CwI2avWXkvyazjXT+6QwZ8uT?=
 =?us-ascii?Q?eOJnjEDUyBEeA9RZXvOBFIij7FJnLCvJqcE+QHdQy1SN+NZ1/Qfc2mHLjE7e?=
 =?us-ascii?Q?NMKKOsZOIpUU+gTCdPXPrWrqJ3xUu23zo+SDZbOnqdYsHw+CgAlGzfJdliTN?=
 =?us-ascii?Q?J+NCDOK5HBzbv51+wiyrfjg9PSHu8spJu6sN0nc8L3ACMFsnEGfoDkqJ3tuF?=
 =?us-ascii?Q?S86mb/FfIWXPF+7+veT/F5A+SifKNOsYBSnPTFFRsXoihoaUtyIl9RdSmeL7?=
 =?us-ascii?Q?jo/1JJN1nUZzwKRcVO+HFOnJGa4NQLoPzJgf95gDBK/sRVsema0kwPB01xMk?=
 =?us-ascii?Q?y5SEEI/6fk2Z2fExZ0VHS2vK+8VYQVVK0zLs5w1oSxyyfiiW4crjyqjDwYfI?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6add291-856a-4b2e-687f-08dd000c847c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 15:46:32.0107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5Fq2HqIA1++KakuTZwAXE1nUjhKhD7QP3+5WZYQNipChuNyI7T8iJRJctUcOf27n9BWgGLMAwsjxMjWtCOYmi75CSKC4UiWz6iwNLBKLzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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

On Fri, Nov 08, 2024 at 12:20:44PM +0200, Jani Nikula wrote:
>On Thu, 07 Nov 2024, Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com> wrote:
>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>> index ef2f74be8..9eb1141d4 100644
>> --- a/lib/i915/perf.c
>> +++ b/lib/i915/perf.c
>> @@ -37,7 +37,7 @@
>>
>>  #include <i915_drm.h>
>>
>> -#include "i915_pciids.h"
>> +#include "pciids.h"
>>  #include "i915_pciids_local.h"
>
>After this gets merged, maybe you could write a follow-up patch that
>renames i915_pciids_local.h to pciids_local.h and cleans it up; there's

Actually to remove it. Why are we still carrying that?
Or maybe keep it just for the IDs from the topic branch (which we won't
add more to, hopefully) so we can keep sync'ing with drm-xe, or
drm-intel or drm-next, depending on the context.

Lucas De Marchi

>some old cruft in there.
>
>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
