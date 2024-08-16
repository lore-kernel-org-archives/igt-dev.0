Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41476C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 18:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E580A10E822;
	Fri, 16 Aug 2024 18:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Du7itfxo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6DA10E822
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723833584; x=1755369584;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AxMifT6VFmd+sRnwX0SioKMFqMZneDJ15ybF+yG/sAA=;
 b=Du7itfxonJ77V7K9933Q4pI1ES8lUVAT2EeSEzfOqMJZ6HzQ7g6vMZgR
 1KXtOOJJdxek7yZlYvuh9ntGl8g1BWgaalZfaYwS1gnOL08Y0A+E7W9R5
 RPuvox2jLobwogKaNmCLz49gRuTdFgPMaBvnqX+26eWnH+vPABqPY0jrP
 qkuzBQW5YxDNzTXdGRwp98sffzlaaaOkhPvVV3YLPH/L43xeGbaqb6aCX
 rCstqOTXZocJUpwSc7GHzlwyOaDRTaBtwNFZUW4278Mlc8nWs+qST/Knn
 D2cgVihXeXv7NxBBvpDca964PqHHJNL1d47kiNQyKLZ7xhzcz5dlqXpmH g==;
X-CSE-ConnectionGUID: EQ43r4RsSySdyZrUGSSquw==
X-CSE-MsgGUID: /u2aaePnQLSLDlWDz8RklA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25039940"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="25039940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 11:39:43 -0700
X-CSE-ConnectionGUID: rUe28LaZRlm64mwh4RK4Ew==
X-CSE-MsgGUID: NZZjLD5FQ1SBt4nzZlmmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="64707594"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 11:39:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 11:39:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 11:39:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 11:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJ0UIHsGU5HZ6YrqfRdDrVtyLfpE5Klc84EiEuSmTrv0/J51QE9A5Qx/3f5N9hAPmesOnvS5YbzRr74EdiZu90As3Daonsu3q0E75WPG4q01djfl8ZHsFKj7fU/+m3hGhAMgCchKXW4bQB+rnwhps8ZNH02NNhaHFqWTTBYCm39HBY26pFWoMB99K5yqCADneQkc/pVYCoaL+CBMWtiPjm3tpTRn7dLG+VRT9KTITtZrapd2nkS9f65+w+uuM2QLGhRO3SW8K08b8dbcsrxCOH+wFSecBYFxxEGOhPNryAlU0epsrotyX1PCFAFqC9GX67N0TmqpmXwt65cgPoDhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sye5wAbHW+N74SZvHDrqU9/IXBraKWitFxxUOEBBQag=;
 b=RteKvm1UZCLJqWCcW/Udryvb3BJtjD3YPkx1pOjhYlO4fngo031scyNuZyWtVFkjlK8Kc+9T/2ecp0bo70cN8t1RNafBhDMh6AHPI3F9n37bahfe/1vUEdvMjb9zBAjqwgAFZ2wJQq26e1/RKS2njHNaME5eYLlhodhRFrqVmjCvPb+Jm1uH5xPobvzZz8UO/iX6i+Igsm1q1uRg97P2xCEehot5PFVNk7OB7ONBDQloTZguBgfpFRDvQ0dANbj5u7xvxBkvMzjlp7fRrJTap+d0WkZEpenXfiyDG9meJH3kGC1u8EnnYLrdPagoDXvCKtKkGs5BVvTye6Vh40RCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Fri, 16 Aug
 2024 18:39:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 18:39:39 +0000
Date: Fri, 16 Aug 2024 18:38:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe: Add XE_MAX_ENGINE_INSTANCE
Message-ID: <Zr+cpJ9J8S0ZAqWI@DUT025-TGLU.fm.intel.com>
References: <20240814175013.3679997-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240814175013.3679997-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6509ff4f-f152-4d6f-9ab4-08dcbe22c807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eqAAr7BK/+YzZS8dx11iIvPIXyqCCqH/SzRPFooegCnea/LD0vLC23fPoQrq?=
 =?us-ascii?Q?BfYrzZGRkGUnf50Ly17do1bsOcou1aGKp38NbhwRYVEVdW2nKBBCXRr9vW38?=
 =?us-ascii?Q?2PZvL5aB1YVzterbdrq98Me4B1Sb3g4P26Z8UYqtTwlE7cN/wNGUtYJEXFM+?=
 =?us-ascii?Q?fTfYXD4nFUoGKgW7ap5WQLnE20bfmplcVgALZWNwqjsMJ6YFL+f8rwKHv7S7?=
 =?us-ascii?Q?HwgsMNa2EqWjuEPPonzRpahns3Rdxx7Xblmf7iVCvqacGLMMCafhophZ0eAa?=
 =?us-ascii?Q?WHh92IBb5ka9pO0QaCVP7sEGwds+eFn6getzNyqfgAq+zJf/kJgBc42bNkAe?=
 =?us-ascii?Q?T/czdmukP2XjK/50oFdgQufwAFJxfv0K/WozH5rsMuiTh4LhpivuK9y7EWDY?=
 =?us-ascii?Q?yd9UH8uwAQVZduL/0I8je1FowbCSXlOqPYyBh8L11a+LXZdoRK3c9Fx0H214?=
 =?us-ascii?Q?W8HFPd94qXZYZ2pfQ7wnJLADkksvBQFPSSOmLqqStra2jKqGsYxy+GfNqZ2m?=
 =?us-ascii?Q?q84jddG/hnd4qE15IOloPm4Kkkf/212OZuJtEwK9WMMg1aYKxNWtjjbASEHl?=
 =?us-ascii?Q?Se4yU72jEpHNS2Qp1ACn3td6Uf8Lia8R+iZ8EcqcCckp6dFUNM4dY+U9jurN?=
 =?us-ascii?Q?Gu6mCMR9O1/hXhkrX1m3EF3QfjkAdkga1O5pjcXyzMoVtF6nCj/J6EbBqXMs?=
 =?us-ascii?Q?L7mlec2W1QH66kFvBlCyTC+iuf7pfj75ZkXjL+Fk1M6gqjARRtKc9O+Ok66C?=
 =?us-ascii?Q?fQsTyRWC+lVICtecvH81JwZ4sfBuyzdS4AskUQRPrbvg9j7L6NnwOZ00hT2/?=
 =?us-ascii?Q?RXyTS/79nTK+CwwQF0Xr732YAahdkP1OigbQ1CbxIHbHA+tQgWFes/l1QQcO?=
 =?us-ascii?Q?NoHG4z8Ky0IbiZdSwVZldNxSJPSjp4Qw1KfuAORbWDvFPF3aGuJweCFgr+nG?=
 =?us-ascii?Q?9eYu4POPjfuITkrQzDVSVfm4sOF2emtVA1Prkob7lLkb7J3ff8H3cx3f5ugq?=
 =?us-ascii?Q?NwwknyV+oC5EG3XYvCpfOVruUdUMQ64bZws1y9vx7S6g6zyvXyBZNQJu7ln1?=
 =?us-ascii?Q?oV9ZdvofJe5e+o66fR1ZwjmTfPPOZdlc0ingZHHMcrZgACm/g09ffhxaoboo?=
 =?us-ascii?Q?gn6Oi/NH9hf1RxYKkVlE8skGPM3R87R+W84wQ4iZGZl36nWszH1GoBrwVXHz?=
 =?us-ascii?Q?epTmnfS2SFI4ev2DObxgMI8aXdjpe9HWVieIR3snyWhAHTnLqM0IUzBUs4+t?=
 =?us-ascii?Q?Jk1TE6qpfZzXbUYFHuqDzx92y3tMVHs4HCdbubGvaj+fLwnhubtkWfk6+16T?=
 =?us-ascii?Q?6BrGoMXMNuJI0K486tgZVyzy0QuZ5/UkhlT3vwTc8uWJzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nRXNhCzWCm7GwjtsmTJawT1JtoBmGkiQdEFd2N35fhOcHXsjVsSiOh2fy7IZ?=
 =?us-ascii?Q?cc6L8Ifa7oXO4C3emw8aBNN1ye+Xqy+SJLXRel8H08lbbwG73XtrJ92pOgR3?=
 =?us-ascii?Q?Ad7B1LZF0a1SQ/PIcbs2J5Xz7rgsw4WwwUdjwLVtl7q+FgDEd+RK4kEXjq5C?=
 =?us-ascii?Q?wIqbKi0ZLt0GUkjiqMO07UUyxdiyMWBqAAf8y6rX+sjnwJ1WJzHRt0t1HudQ?=
 =?us-ascii?Q?GMsJuZS2RWrmrwI/mh5igV8wgGvuRuUTl6B/2+MvU9DAhHwtzuSGnvpp9+Yf?=
 =?us-ascii?Q?3xPpVtco/JAA1My4oX3jUTcO5yZWcO2zDA2Rud9J7KEIm2RIUYSBww3dqxMO?=
 =?us-ascii?Q?ZL31cbGYSMPQCV7xM0fMTLCWGZ6QS7ZW8+epV+bP4Gjp7r6v1ShysowQqePo?=
 =?us-ascii?Q?nsVB0WP0+SjHiqMzO8fPQWCtJhu2fVt9hUtv0+TqOWLVV8e9cVQkqgnE2jEC?=
 =?us-ascii?Q?fhKAQqp2gvb787bGz6x7D6kyDpfJOPwSpUYZ0w1dQJsqqqsFBJzgjT+UNUH6?=
 =?us-ascii?Q?KBQBz3JQzGdJhgGqGKFnbI1HY1PNf7ZwazzYsNrOmtvBXYYPHA3MhoBw8xfu?=
 =?us-ascii?Q?Elk9HxtIG3Xmyy+C5igUlKo9loRzsC2EaNmIkYF+XOshqARUhfHtxbFOt5Y5?=
 =?us-ascii?Q?DCiZGzUZ29vOaexdzNqmBJHx9aTufi+VaCa+HURaIfiFZyBzNeCX7qjUkrVR?=
 =?us-ascii?Q?SLDcxhLRPjbDedskN1D66ZN8JNdWAfr7LQh/2JShkgn6NZhhDIGP6NwX3fba?=
 =?us-ascii?Q?XE0KkLn3Nhnh5mKJXhK0hOaPtMHv3saz7qGnruLan6NnRuxfpCr/s6U1Z37y?=
 =?us-ascii?Q?pRyZs/vbIBu7ojWCFt7E71y/lWs4/BfmCTQYq0761UPBf3/9N/pqDloRP/UX?=
 =?us-ascii?Q?w5eM5Lpn2MHyHyW5pT+mUQb1UQh3y5hodvpom537pz7SU+KmxV6Y20t9x6KQ?=
 =?us-ascii?Q?JXyWLtLydA+05aIHQEvY+J0SEWxV33xRkJTO5BYWFKt6aLyWKN4jVQ9t0wtb?=
 =?us-ascii?Q?catPr4IPjqMLMPeFRZWf7W9sFOLwiB6D7LU9OVJ9fh9Cpgn9lAkiGKneVFIV?=
 =?us-ascii?Q?jHBuZnzIy8Wrgr36YxrF9LzejMSXKWX/Q78g7az2zB2OjB1CF3rCtwhvFYLb?=
 =?us-ascii?Q?W7XGExjUXa95jC7/LQ8jWsw7VQcOKqiadRS07fhc1SVemSz/AwCDxwGehqSU?=
 =?us-ascii?Q?Ha9+oRtUs78gmMSYI5ncIyASrTY5q543NRTaa1emepKf0eAOlzp+hg51AC28?=
 =?us-ascii?Q?VQzhmRUNgSKsnY2u1mSRcw+UaYog+vGCzYYH16QbH93qnINVDluKg5Eni6Fb?=
 =?us-ascii?Q?2YPDWPiNQvQVeOCKs6kNoFVtKX+qP50OpWpfJaJo1w4c4DavTuJ5FcgQHJYT?=
 =?us-ascii?Q?5m5DybncNae94qPVsuVJUnqM5YUrCRqJz12EZ4PvEPk7mdJz5XGw0QaUpSp1?=
 =?us-ascii?Q?KtW4vX1wZuwIxQcMquJhgiMNywMwfUoiRJqDEkvgOlw1CaLfWHyOddLDRDr/?=
 =?us-ascii?Q?Mnzd0ZV3gfrjntus3WVKQYZwW+6GltKWOTFhfs7TR7uQDXUr6GOQ5YwejJnD?=
 =?us-ascii?Q?gPE8jrXx2JVSbmrGRixJCgTapBk8HkooNDtRIoJPkAzxBbVkk3HQBT0lsz6Y?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6509ff4f-f152-4d6f-9ab4-08dcbe22c807
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 18:39:39.0829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBGFI1LwIEcrPf4K63vHErU1ldL2WLLaVOmHUzOUE7CzpkUzMT/9X4jFlpEuggedBR0j86icEIfps0VFf4UrXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

On Wed, Aug 14, 2024 at 10:50:12AM -0700, Lucas De Marchi wrote:
> Replace all the duplicate defines of MAX_INSTANCE with a better one in
> xe_query.h.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/xe/xe_query.h              |  6 ++++++
>  tests/intel/xe_exec_balancer.c | 16 +++++++---------
>  tests/intel/xe_exec_reset.c    | 13 ++++++-------
>  tests/intel/xe_exec_store.c    |  1 -
>  tests/intel/xe_exec_threads.c  |  5 ++---
>  tests/intel/xe_spin_batch.c    |  8 +++-----
>  6 files changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index c33f91ca1..1e4d1512f 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -76,6 +76,12 @@ struct xe_device {
>  #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>  #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
>  
> +/*
> + * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
> + * used to declare arrays of drm_xe_engine_class_instance
> + */
> +#define XE_MAX_ENGINE_INSTANCE	9
> +
>  unsigned int xe_number_gt(int fd);
>  uint64_t all_memory_regions(int fd);
>  uint64_t system_memory(int fd);
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 73f69e7b0..53ea245a0 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -24,8 +24,6 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  
> -#define MAX_INSTANCE 9
> -
>  /**
>   * SUBTEST: virtual-all-active
>   * Description:
> @@ -46,8 +44,8 @@ static void test_all_active(int fd, int gt, int class)
>  		.num_syncs = 2,
>  		.syncs = to_user_pointer(sync),
>  	};
> -	uint32_t exec_queues[MAX_INSTANCE];
> -	uint32_t syncobjs[MAX_INSTANCE];
> +	uint32_t exec_queues[XE_MAX_ENGINE_INSTANCE];
> +	uint32_t syncobjs[XE_MAX_ENGINE_INSTANCE];
>  	size_t bo_size;
>  	uint32_t bo = 0;
>  	struct {
> @@ -55,7 +53,7 @@ static void test_all_active(int fd, int gt, int class)
>  	} *data;
>  	struct xe_spin_opts spin_opts = { .preempt = false };
>  	struct drm_xe_engine_class_instance *hwe;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
>  	int i, num_placements = 0;
>  
>  	xe_for_each_engine(fd, hwe) {
> @@ -187,7 +185,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint32_t data;
>  	} *data;
>  	struct drm_xe_engine_class_instance *hwe;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
>  	int i, j, b, num_placements = 0;
>  
>  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> @@ -244,7 +242,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint64_t batch_addr = addr + batch_offset;
>  		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>  		uint64_t sdi_addr = addr + sdi_offset;
> -		uint64_t batches[MAX_INSTANCE];
> +		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
>  		int e = i % n_exec_queues;
>  
>  		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
> @@ -406,7 +404,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint32_t data;
>  	} *data;
>  	struct drm_xe_engine_class_instance *hwe;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
>  	int i, j, b, num_placements = 0;
>  	int map_fd = -1;
>  
> @@ -468,7 +466,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint64_t batch_addr = addr + batch_offset;
>  		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>  		uint64_t sdi_addr = addr + sdi_offset;
> -		uint64_t batches[MAX_INSTANCE];
> +		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
>  		int e = i % n_exec_queues;
>  
>  		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 61c35ce69..bcda78609 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -105,7 +105,6 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  }
>  
>  #define MAX_N_EXECQUEUES	16
> -#define MAX_INSTANCE		9
>  #define GT_RESET			(0x1 << 0)
>  #define CLOSE_FD			(0x1 << 1)
>  #define CLOSE_EXEC_QUEUES	(0x1 << 2)
> @@ -164,7 +163,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	} *data;
>  	struct xe_spin_opts spin_opts = { .preempt = false };
>  	struct drm_xe_engine_class_instance *hwe;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
>  	int i, j, b, num_placements = 0, bad_batches = 1;
>  
>  	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> @@ -213,7 +212,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>  		uint64_t sdi_addr = base_addr + sdi_offset;
>  		uint64_t exec_addr;
> -		uint64_t batches[MAX_INSTANCE];
> +		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
>  		int e = i % n_exec_queues;
>  
>  		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
> @@ -793,15 +792,15 @@ igt_main
>  		igt_subtest_f("%s-cat-error", s->name)
>  			xe_for_each_gt(fd, gt)
>  				xe_for_each_engine_class(class)
> -					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
> -						      MAX_INSTANCE + 1,
> +					test_balancer(fd, gt, class, XE_MAX_ENGINE_INSTANCE + 1,
> +						      XE_MAX_ENGINE_INSTANCE + 1,
>  						      CAT_ERROR | s->flags);
>  
>  		igt_subtest_f("%s-gt-reset", s->name)
>  			xe_for_each_gt(fd, gt)
>  				xe_for_each_engine_class(class)
> -					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
> -						      MAX_INSTANCE + 1,
> +					test_balancer(fd, gt, class, XE_MAX_ENGINE_INSTANCE + 1,
> +						      XE_MAX_ENGINE_INSTANCE + 1,
>  						      GT_RESET | s->flags);
>  
>  		igt_subtest_f("%s-close-fd-no-exec", s->name)
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 67c53fbd1..1375ee906 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -21,7 +21,6 @@
>   * Test category: functionality test
>   */
>  
> -#define MAX_INSTANCE 9
>  #define STORE 0
>  #define COND_BATCH 1
>  
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 6e53d3cf8..06452862e 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -25,7 +25,6 @@
>  #include <string.h>
>  
>  #define MAX_N_EXEC_QUEUES	16
> -#define MAX_INSTANCE	9
>  #define USERPTR		(0x1 << 0)
>  #define REBIND		(0x1 << 1)
>  #define INVALIDATE	(0x1 << 2)
> @@ -66,7 +65,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		uint32_t data;
>  	} *data;
>  	struct drm_xe_engine_class_instance *hwe;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
>  	int i, j, b, num_placements = 0;
>  	bool owns_vm = false, owns_fd = false;
>  
> @@ -139,7 +138,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		uint64_t batch_addr = addr + batch_offset;
>  		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>  		uint64_t sdi_addr = addr + sdi_offset;
> -		uint64_t batches[MAX_INSTANCE];
> +		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
>  		int e = i % n_exec_queues;
>  
>  		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 4e95060d3..9314e229e 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -15,8 +15,6 @@
>   * Test category: functionality test
>   */
>  
> -#define MAX_INSTANCE 9
> -
>  /**
>   * SUBTEST: spin-basic
>   * Description: Basic test to submit spin batch submissons on copy engine.
> @@ -97,10 +95,10 @@ static void spin_basic_all(int fd)
>  static void spin_all(int fd, int gt, int class)
>  {
>  	uint64_t ahnd;
> -	uint32_t exec_queues[MAX_INSTANCE], vm;
> +	uint32_t exec_queues[XE_MAX_ENGINE_INSTANCE], vm;
>  	int i, num_placements = 0;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> -	igt_spin_t *spin[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> +	igt_spin_t *spin[XE_MAX_ENGINE_INSTANCE];
>  	struct drm_xe_engine_class_instance *hwe;
>  
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> -- 
> 2.43.0
> 
