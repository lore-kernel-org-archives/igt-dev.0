Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEBAC35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 04:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A3F10E7EC;
	Thu, 13 Mar 2025 04:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaBrGGEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9403210E7EC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 04:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741839580; x=1773375580;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vDmUCdjeyP+0IyxNC0LlWb98wQwGYhbrGPKpboUPtmU=;
 b=MaBrGGEGWyQsuqrZHnccnnwAYDEv4MHL2lvEbhRxLpUGGW+/qJvBWjsz
 aTNkRFVpfGm7dc5h0dODwkLfTBNkl5GRfv4CalzXH/y7Wy6stDemtYIxJ
 GrK2/lYKTz0RzXdv+qkgd2jlPLZyW0wva7igKwfLHL/UcGy9/btCIisyV
 oiHJDiH292o+8q5hRsGlWz1UTQnYD7NELYOshMYY8mvEYAcVC5217ZWhl
 UE04OoHdxItvg6yGPhy46ImcxJ7ZagPTif5/ZFQmLeJooK+TWctSrZ093
 l7OTbaw3jvpRsnzpVyIGbwEE5MDNGXdLVq3+qQ7Sk029Vve/B+Yl84AEW g==;
X-CSE-ConnectionGUID: yd1DX9YpQXqnlCb/3hPqlw==
X-CSE-MsgGUID: k3ILxnyuRAuCCsjfEvDrNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42820228"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42820228"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:19:40 -0700
X-CSE-ConnectionGUID: K8w1v6IAQ6e1tP+R9Ro4oQ==
X-CSE-MsgGUID: UkeN+1S8R3i7Gz7eWmbARA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="124993345"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 21:19:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 21:19:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 21:19:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 21:19:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX8Eh/Dt0Wc/bdq84EJ1J1jEC7B8BaOM4QOzty07X4TOqLpwAaqrNa5JI8n0IMglwvXzZd7lmys0jJs1w5Jbk/RShv6iTQ4kaI455bh8k4EiQ65cnD3tx07GvxsJR3BzHwM7UbqRhHSb38WTAikKn9eyJIuvwI1imDNIHcAIvulhzGw41N/o3NuBibGfgQNfH/MSG5YWTP8heuZkvNlcAQtUCild/m7LwKknBijNyWbJlEM4P0CaK0abzqzuR80XBx0VME0hxmS29AnDJDzm0DbLIX6J1Q8xeSMSVWSSOVTjk04Tte5BPyfOWcKDyVnwYTHibARYNE9NlORANMx74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Kea2MNiOe5fcqjiLs8ZOTOpl44+byR8uu/yX7h9Iio=;
 b=i7zH3OHCVgWJozpKHuu0bpurcWs6bWrectDqaF8Lv9rBd9x3wZBPB/Hl+sDfCfseSgo4P5Hl7V7wVRLALk+gUI0zecW1i8oBlX/+PfWmI7rV9ychqNVIOu+71e4lhLQNd2Vx0STA7k9xZDKBNiNLc8soVPcVWSiQxjopoKy4QuesBBy1bmH8xkR9bR8P8nw3buhI0F4EaOANeA1rX73rGjZQBWjQCvcELbHSYmAL0zdD7r1w6iel78MbWwK3jGlRcgwUhk9GLXvXnCLtCVXiR2p+6o28Bul8ORk+d/Cz70ORYLhx+N1D06HEmJIgZn4UkLBAAKij7x4LDrIPYzcm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 04:19:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 04:19:29 +0000
Date: Wed, 12 Mar 2025 23:19:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization
 tests and skip when no utilization data
Message-ID: <snev4fbltcxduu46wsngqfpynsm73vr4vq6vmmdr4nchgeiefp@42jbrrbro6tl>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
 <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
 <ip3lgnjby4aeplweqxvtcjubj27hktvzciqvvu5r7u7vkzqs4n@y7uomewtoetr>
 <f78e21cc-d1f4-4974-92b8-b3d497a5c50f@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f78e21cc-d1f4-4974-92b8-b3d497a5c50f@linux.intel.com>
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 824b9a82-fce3-4745-d8fd-08dd61e63f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gL1EDWwT+CgvQggKm5X0awnL5jCFwd+PAjEtt3mgQ0ElZQ6yNEoGoLgoaH?=
 =?iso-8859-1?Q?0tYjsm87GMYIjRJ2kLHfLBqH6lgS3byGeOz4SIQJLwVW+EAphknpf2R/5R?=
 =?iso-8859-1?Q?Bq8kraK7a+nlJneAeirWQySJsE7VPqQlNwj8lF7PcnPtV3RRwrm3wKTAa0?=
 =?iso-8859-1?Q?2g/TGUApaU8w2rqTn//arDGH6J6WPPB3c8ezMwfVR3criByndXPEffysnb?=
 =?iso-8859-1?Q?N/58HTU9spK+UKxEkEOOqUExaQHzRc6fwuS/5KUtSERa/RJhOfpPj9CtPx?=
 =?iso-8859-1?Q?JgSb/NK1HXZgv8uXeBSrGT6YI4k35pEx6winbNDb60VcG7U6hj47lUwywX?=
 =?iso-8859-1?Q?HYui7ErpNbIXlhWh2FGBx3bjNbufV5gHJxeN1MIjV9O/B9mZKGPzXpgHGF?=
 =?iso-8859-1?Q?uNtNAswu/NsR+6ucbpSs0twoxD9UvSq5KQpOGy+5riwSBzzhsbNRz3166E?=
 =?iso-8859-1?Q?cKHp0q824TcILqgWuc0OvbBYQ8J9+N0PELxf/nOGiwEJFuAaenVZzklG+D?=
 =?iso-8859-1?Q?BfyGz8JA+lKqbVHj2tbPzVtSQrTrt8+i56xx/x24I4ImG1LfFhlF/rYtOa?=
 =?iso-8859-1?Q?8Alpx5VIT9fIGYR4BYguNiwiLBgr1HTU+c8cBF6DBRxhQrJUmJEAccFfVC?=
 =?iso-8859-1?Q?yh9FbFSJUbUH9oTk9bk13rWhbi7+Otufi6Ki87lKKfTvQM+e2pvfy3iXLA?=
 =?iso-8859-1?Q?bi7gmcXLXikzV1mR8iYrop667WwUXaDRzKJkKv97hFRzp4BdQOh9f63yb9?=
 =?iso-8859-1?Q?+lotnDoxvJDMYxbcLxA7RjnyVVvQiumimV/OeQOsbb23mlnqR6RUZuGu3s?=
 =?iso-8859-1?Q?D6MLeRxhcOze8mTKhE8ShJfL5hqKLuZ/v8Ey4bJmMz+ydocuL64DLIsWDu?=
 =?iso-8859-1?Q?6HifOrciM0/HlrRrZGuCWPld7ucMXiW1Cq0kDSTEP+fu2vk9NDZXMBQbjA?=
 =?iso-8859-1?Q?A+csKrR+m8bWpvLvVJDbCjJ8XjRpy+w+5lnm2/QIDp73JDswxaOwWlY8or?=
 =?iso-8859-1?Q?pNccPq55MOwZloDD8ze+RWh5+qWlw6RFScESi0HJ427OM/cQDiWyXEeCbA?=
 =?iso-8859-1?Q?H6QSUltUm21eoH9U7lURQSMxFwIrJIvPl4qSSZfydtwX3A6khq4mLB8/p4?=
 =?iso-8859-1?Q?gn5e7NQxsP23XwkhEHACQD9Xx2M1qf6aszDP7lvd7pGiGgyAx2iW3k1qvy?=
 =?iso-8859-1?Q?TTn1kxlqJ/YuHxgBEEoKwnJff21CxF1J2ApSZ4/DJb8YDA1RBl8GAr+kOi?=
 =?iso-8859-1?Q?Vp1ql20w5HL+BGVLrvDuVUCg36iisC3mSXNgRo4naZ4m9DkWiPTLk1+Hey?=
 =?iso-8859-1?Q?6aMRM9jAEiKcxL8oFLi6jOcSGBgKj8aRzs6syrneaWWnOjaWKZUlir77lN?=
 =?iso-8859-1?Q?zlUmNGccZX9Pzh5hB951sRHksow9lTkR40u6o/TgAflcNkOs0l/+PZnvIq?=
 =?iso-8859-1?Q?MduIYGRBJOXNUHGy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pnrwgKWli4Bug3yJTfoO0oJpXhsrvb4d8yEuUL3FN6R2WF1cQc5IZFRcB5?=
 =?iso-8859-1?Q?ghRaiinr7cn4AIQEmc+/nnNsBrYHz/jRLPIt8PgLIERO/xQ1lCUMcsdhN/?=
 =?iso-8859-1?Q?/HTj7A4Nsmanu+RPfE/T/8tQa3pnXlw+Lt3cdX1EiR7dsYFJQhARvRVLh/?=
 =?iso-8859-1?Q?GTKwBKGU/n1lSBr21szFj0yl2JQIhTm2vLAs29e/0c8BLm5KDQMEVBGkCZ?=
 =?iso-8859-1?Q?aMbKl09atDOXt2qAUEMheiBW2BliprjCuk4KYYxd9JSMFvLS55c8nj+WpE?=
 =?iso-8859-1?Q?srzzj3bR1Lwq2fO5h3sS1cRfvsFAm5/GK5o2gcaSv7GYDgxLZ33KXtSQiw?=
 =?iso-8859-1?Q?Ja/RUFPbsl8cOcX+3M/nzOlQeB7hB/PUKUW1tRGNGJWD5s3R1TyuTMejZp?=
 =?iso-8859-1?Q?9Wb0jp3nOWimhjpdNPwjsmoR8Ucl/P4aLJmBKG2OKEo+gaRO1oTbnhZy0r?=
 =?iso-8859-1?Q?Xf46wwBp/dEycqk6WbKVjjCYB1gSQN1QPIqTbx49Fx7d6PItfwpsZ4QMSH?=
 =?iso-8859-1?Q?YEjnGkEgFI9tYjcgHo2hl9ZzDOrcqVw7J9RndkSuqE62VhULuFHMDspqFY?=
 =?iso-8859-1?Q?4xzhGixIaWRStSaW2V5MuI3iv2mWIWb75CHGLR4TCSE5K9jvdSBXOMUkIs?=
 =?iso-8859-1?Q?/MysPopwAjtMNPZN+gc3U3BPhydW6ufrGnVkGkXT+D2//YBA47nc/Uslwg?=
 =?iso-8859-1?Q?b+IDZ5Usn7xX4/6i41yesudwC9zc7OhCF1BWzKGFq1Q4iP8IM8lN1eVAH7?=
 =?iso-8859-1?Q?2/PQAI1gWVUQLcskdaRYXs1cmUldzOhemIs/Yh4d6y1RJ0gnPCrDzNQHx9?=
 =?iso-8859-1?Q?QBWUw5JCS4hWIlSnWi1wgJtAw42UEwTzUS7aWmB/nvWWNPUzvpaG81Kecq?=
 =?iso-8859-1?Q?LIlosBUNXCzEI3IpUjX4URR9aOOU3aENSsnfTGTScgocnSNPeJ01p6nndY?=
 =?iso-8859-1?Q?NRX3UepHyFI/LUNN1vlZlJNDgTQ5HpYA8pwOrnMdpUKJiUIT0Ej2dMkGqX?=
 =?iso-8859-1?Q?3YIOeqHk8gakzV9yFT82/zw/4s5ES8nJtDV7D9eim04R0gxrnlZeTqdAa3?=
 =?iso-8859-1?Q?h7gWMfM7ZSwcmsHjx7a+hqoA6cz4otY5PrwLQ5jHh1riH2QbhF/+Qzllsn?=
 =?iso-8859-1?Q?EaR0I7xxx32D1kguFakIq+v5wXRMOnhz8tTz1DzszrDMzJc9UqVbJM4cBD?=
 =?iso-8859-1?Q?8osaOowqsjf1RacLWnpHt4fD6zoLefJCljKZBACkQ488jOePeHEPAQWUG+?=
 =?iso-8859-1?Q?RBG719R8mIdUBqScdDsc9DHWiQFNHROdphkM8qLu0dJgqsLbZGx7VFQr4a?=
 =?iso-8859-1?Q?8ygzTmH143wVW6XYp6k4tUGOwQtCTetWv23x7oO/REUw2rhUnmqQypnJMI?=
 =?iso-8859-1?Q?KhCnN+fMdWjCYmH+yOxDKp4Fnls2JY/0WDTLIhjAV0dxTfEiE9JZGlc1dc?=
 =?iso-8859-1?Q?vIafrXWlO2HPHl7pSr3JOAmhlJ3veyuOl9RxV/TFah/+iwVW2O/QfqRYYl?=
 =?iso-8859-1?Q?4tP/631KXvNZIq5XeFDQAJtrP2eDGMqCI8ntUV9/sV5HPv8elmgQTYwb/9?=
 =?iso-8859-1?Q?CkTPYz9Tj43vOMAWQbKbuT3Hglgw6nm6dJWIe6yhDABfWQ2onfNiim3Z91?=
 =?iso-8859-1?Q?vir/7k00rUvjoyZXbTqmhNu2AfKqQO9sq1Nwljbhz9kHdbhENN3OMI/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 824b9a82-fce3-4745-d8fd-08dd61e63f92
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 04:19:29.5260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ1nXc+mSC34D72Ku5mtta3bhyYI8XFWkREJbHahAjeEy8uAbM4w3I3xtnS0EDWScIzCRAS0eESUUK+Ps2DmQCVVZk3SXepdnnH2ZG6C+iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
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

On Thu, Mar 06, 2025 at 10:19:37AM +0100, Bernatowicz, Marcin wrote:
>
>
>On 3/5/2025 6:08 PM, Lucas De Marchi wrote:
>>On Tue, Mar 04, 2025 at 07:56:39PM +0100, Marcin Bernatowicz wrote:
>>>Wrap all utilization-related subtests in an igt_subtest_group and add
>>>a fixture that ensures utilization data is available before running
>>>them.
>>>
>>>Link: https://lore.kernel.org/r/20250205191644.2550879-1- 
>>>marcin.bernatowicz@linux.intel.com
>>>
>>>Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>>Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>tests/intel/xe_drm_fdinfo.c | 122 ++++++++++++++++++++----------------
>>>1 file changed, 67 insertions(+), 55 deletions(-)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index 7330b4330..d18fe10d8 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>@@ -735,10 +735,6 @@ igt_main
>>>    igt_subtest("basic-mem")
>>>        basic_memory(xe);
>>>
>>>-    igt_describe("Check if basic fdinfo content is present for 
>>>engine utilization");
>>>-    igt_subtest("basic-utilization")
>>>-        basic_engine_utilization(xe);
>>>-
>>>    igt_describe("Create and compare total and resident memory 
>>>consumption by client");
>>>    igt_subtest("mem-total-resident")
>>>        mem_total_resident(xe);
>>>@@ -751,57 +747,73 @@ igt_main
>>>    igt_subtest("mem-active")
>>>        mem_active(xe, xe_engine(xe, 0));
>>>
>>>-    igt_subtest("utilization-single-idle")
>>>-        xe_for_each_engine(xe, hwe)
>>>-            utilization_single(xe, hwe, 0);
>>>-
>>>-    igt_subtest("utilization-single-full-load")
>>>-        xe_for_each_engine(xe, hwe)
>>>-            utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
>>>-
>>>-    igt_subtest("utilization-single-full-load-isolation")
>>>-        xe_for_each_engine(xe, hwe)
>>>-            utilization_single(xe, hwe, TEST_BUSY | 
>>>TEST_TRAILING_IDLE | TEST_ISOLATION);
>>>-
>>>-    igt_subtest("utilization-single-full-load-destroy-queue")
>>>-        xe_for_each_engine(xe, hwe)
>>>-            utilization_single_destroy_queue(xe, hwe);
>>>-
>>>-    igt_subtest("utilization-others-idle")
>>>-        xe_for_each_engine(xe, hwe)
>>>-            utilization_others_idle(xe, hwe);
>>>-
>>>-    igt_subtest("utilization-others-full-load")
>>>-        xe_for_each_engine(xe, hwe)
>>>-            utilization_others_full_load(xe, hwe);
>>>-
>>>-    igt_subtest("utilization-all-full-load")
>>>-        utilization_all_full_load(xe);
>>>-
>>>-
>>>-    for (const struct section *s = sections; s->name; s++) {
>>>-        igt_subtest_f("%s-utilization-single-idle", s->name)
>>>-            xe_for_each_gt(xe, gt)
>>>-                xe_for_each_engine_class(class)
>>>-                    utilization_multi(xe, gt, class, s->flags);
>>>-
>>>-        igt_subtest_f("%s-utilization-single-full-load", s->name)
>>>-            xe_for_each_gt(xe, gt)
>>>-                xe_for_each_engine_class(class)
>>>-                    utilization_multi(xe, gt, class,
>>>-                              s->flags |
>>>-                              TEST_BUSY |
>>>-                              TEST_TRAILING_IDLE);
>>>-
>>>-        igt_subtest_f("%s-utilization-single-full-load-isolation",
>>>-                  s->name)
>>>-            xe_for_each_gt(xe, gt)
>>>-                xe_for_each_engine_class(class)
>>>-                    utilization_multi(xe, gt, class,
>>>-                              s->flags |
>>>-                              TEST_BUSY |
>>>-                              TEST_TRAILING_IDLE |
>>>-                              TEST_ISOLATION);
>>>+    igt_subtest_group {
>>>+        igt_fixture {
>>>+            struct drm_client_fdinfo info = { };
>>>+
>>>+            igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
>>>+                             ARRAY_SIZE(engine_map),
>>>+                             NULL, 0));
>>>+            igt_require(info.num_engines);
>>
>>humn... is this fixture exectuded in addition to the outer fixture
>>for each each subtest? Otherwise it won't have the fd open and thus no
>>client.
>
>Yes, it is executed in addition to the outer fixture (but if the outer 
>fixture fails, this one should not run), so xe is already opened. This 
>fixture applies at the group scope - if it fails or is skipped, all 
>tests in the group will also fail or be skipped.
>
>However, as Kamil pointed out, fixtures are executed even if no test 
>from the group is selected for execution. This means that if we run 
>igt@xe_drm_fdinfo@basic-mem (which is outside this group), the fixture 
>from the utilization group still runs, potentially logging an unmet 
>requirement.

ok, that's unfortunate. it would probably make sense to change that
behavior.

>
>IIUC, the only solution is to move the checks inside the subtests.

yeah, I see you went with that approach. Looks good to me too.

thanks
Lucas De Marchi

>
>>
>>Lucas De Marchi
>
