Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00ECCD3427
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 14:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC6810EB09;
	Tue,  5 May 2026 14:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PU73eE8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC78010E443
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777992658; x=1809528658;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q4E3XwRw1MoCdYf735HoinLFNJF6jFQ1V37XGCotlqA=;
 b=PU73eE8VJHIcKI2BCFMtfZv/FjlSwa0f34ZKa9OcsihePaB7csIciR2E
 wFQp371AiQEZoNlr8A9rjiLIvyE/PYJ88+qHm1xt9IoZlRZsY9HRmXCG1
 nf9BEtOmm2cf1tkgkCF+jLaqOksPSq5c3Mi92Jy0dzXJ9yjurdVFPj0zn
 ZmF+bOMWyC267qmF0zqLWoYP/0kCLuhbqTDoy+UjjahKhEpIixxsf2Op7
 D3EmZFVBo6ADxuPW7blYJyIJnkeFzslQi5xM36nAD2twDqb8v39EUNcq4
 T4Hk+gU1mEL7rA/kZ8QiJKLa0m7BKBZis4ZeCDJBIsXTLnnVPufJP5d+Q w==;
X-CSE-ConnectionGUID: eSmqICT6St2g/ODsS2ynOg==
X-CSE-MsgGUID: t7DG6i0ASIW/VjRaLAQ8qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96293573"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="96293573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:50:57 -0700
X-CSE-ConnectionGUID: N5jp7gIMQaKo7Dfx+KYiAA==
X-CSE-MsgGUID: ePT0XeUXQMO4LDqcmxEQ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="240814537"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:50:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 07:50:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 07:50:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 07:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkK5bFwGRVaeN/4AZUthn/a+wkINth9LrAMY3jMKEssAuKa5Kz3I7D4ycAfcDeOmoB6tn8GGY4U66eMtUSfNFQMqgjVOjbnpTHILJEAjY/QKd3FoL53wcAX7Bo3wK9QUOtdRg3ALjyBl9+E5OWHP5bV5z0pXUCgenB1AXAy1uNBM3PWuUo7UO9KO/p8uZSXxqsmQC+EIvLBvFQx5m2aH6mmvSjgiVNLV7d+Fnuk88Epw9lMdQ5J17LCVMWYMyfAdCsj9OTnmKXWY7gnoaRUaheLDvfE5PtkINFG0ddxX0re5S6PgdZ28DVsRNpc8Q6FoaKU8H0g+eVozl+BJrPiW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCtGjye+0jM/lg3QCp/VVGyOeD6+kyCJcfwoic5Lev4=;
 b=l/SXWd64kXtRGr3/J78oHTrBJZo8WHcghWElA6duMJT9GEUrJXKYLuJslxpDk/w5sqIFS+JhL/6NBHY+twLeG9sFpdgof+DKBmXO1WArVaJLotsbOYD5ETqPBYMO2v/5HIYJAOPH+EBnKN9uoYfKgeHbKbfqYSqbAla+k/oR1UtdP+99vHoKLeLjrtHnjV491I5MkW5wmCtEWYq+FARlONJR9BGQWJoxXBg9yCyhcGLE9MEy7zC24MNo1QPs/Pq57Z2/ZMYtGEEqaDdO391gDGAnDtLY47UXh6YhOjUcS6TtvMzpsFEjwQ/58ZLqgEfzDFxm+HcTRSjQIYEw8PtE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV4PR11MB9514.namprd11.prod.outlook.com (2603:10b6:408:2e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:50:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 14:50:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <shekhar.chauhan@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v4 1/2] lib/intel_wa: Add workaround check for a wa
 within debugfs file
In-Reply-To: <b74b725efd89cbd381d50ce36281a9fbaa98a2bd@intel.com>
References: <20260505054741.486361-1-shekhar.chauhan@intel.com>
 <20260505054741.486361-2-shekhar.chauhan@intel.com>
 <87wlxix9nf.fsf@intel.com>
 <b74b725efd89cbd381d50ce36281a9fbaa98a2bd@intel.com>
Date: Tue, 5 May 2026 11:50:49 -0300
Message-ID: <87qznpykom.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV4PR11MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 49796bb0-b0e8-4c24-ba03-08deaab5b4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: DZCYvrWMECkn/WhYdwcuYRKToX07hTYRuRuyjV1iIgVljWH4/4h5HoKhdvwubvzU/Kl5vbkoFLvL7uLgb+xIb9hiXyQ2Iu0o9rr62pcbI8xR1+ElEizwToz5LIEuLxZlK47bo068zxLHNAkLdt1/hdGIQND2B2JuD1HCMP4UsIUVTblP7Ait74Fftp1lf3T5/wkweiRRAnh5DtIxq6R06QrPIygHwXSqR98RvH7mB1t8pCeex9BGnZhUilLb7XHrsPVpjdGNCpOiBVRi3PWgi662V+4nKi7CW1iVTMprDFpGAfw3iYMrbrn0MV5lLPvQWtR7E8/QdnVqpyY4FlgY/nITIHltaTnvqrzsEwLKhNw/5gv1XcB6Xx8NlaM0tgiW9nS3skuH9QBBhkydMmEIwEAhtxzbWEtlG5nBCV/DWg0NKf+vRY8ZWMO32LNNuzmkvVx2HddDNPiyzkfGd1JDyzUVNSMpLcReKR8KUJVZncE6X1QazWYyLKufwrCE68qXZ8MxUoqxIS/s7JTqwDKJ6LC9nssy9JCDK97GF6LhmZpOBUpG6jif4kXar4JuTStXzsgEeekQ/Rl+9euRtTH9SlvIelUR81vQXFipiUgu8uvYDa5WWt8sCaMZm8ShYdsPmH7SIYtg+NF/glXgaDmvztdReFv4T5j0gJq6xsogBgwtInBNiLpEiZ+Rf1VcbdQl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fBkZmYHzTEMWrEkq6j4qkf136XqgDoyr+mIMAkkZNPkDTiplrU+aA4Y9lZx?=
 =?us-ascii?Q?LuiI5j5bJYO3qGfqwzdaqo16HlZ2k0Vyi57DShLBsJMerdrpTQqdLce+T3Bs?=
 =?us-ascii?Q?v/u9dM42+ICHPDyIVzyb2s60LdeBpNxnRNSN1T3bI1kUTz7gYAg7zkwcsHFD?=
 =?us-ascii?Q?egdAVj529naAI4QyYb+vAChspCZ5uPMyMyE5/ajnzjQfW7mX2IDdX+YvU58L?=
 =?us-ascii?Q?DzzGDuPqTOR+EwAxkODQFzgiVu9JCWGnUdYQkzHyEg4vcUNdo/kT+pr0wRk/?=
 =?us-ascii?Q?+uxqEog+YA7ni3UCsyjW166ADdqqj90sj42bA7cz978E83ThfD0EARbMWfRQ?=
 =?us-ascii?Q?MIosYVxs9UcuL3UWSTJiSIq2Fbx9SoYtDCpU8HJ0TQ+r9iC5Zd2CXnXT1RtK?=
 =?us-ascii?Q?KxA/It9QNS1iE7dCcQRUxB+IBCRx1lXadAVNdQfLD8LL7Y+QMGUr5QhgMhWK?=
 =?us-ascii?Q?rz0oHJAkWM6Ycp7r83pxv+Uf5/bOOp37abGr8A0Ft6yqY8sPWJUnOvnGM4Ve?=
 =?us-ascii?Q?+0B6je4dwqJdKsLfeYRO6ozIM+TBrYVC2TzjYmiceT9pqIdpUoSFGGNqWWmZ?=
 =?us-ascii?Q?UkzEQqQ7Wc0ExyVoBvC9xmyayXxrnz0SNzXpPja+fa9zmik+pc80s7oFG17A?=
 =?us-ascii?Q?C/uH65+IC9P6bes3wN97y5efO/wiFhsVm86pp9MwBm8PijxDfpy/V10Pljbt?=
 =?us-ascii?Q?STnvjazqMBQPQfIVFA5H5L6jWo7Hool6S7EYstzWm+zWCewL0ni5tWMHHkW0?=
 =?us-ascii?Q?Q4iLoihGynIDfBAfMeJL0iYLm6KHKiTZKVcZNCwW9m0Vlj1eIFVNCEQcNjvb?=
 =?us-ascii?Q?VtOXdpEG10SdoYsmRJO8JzvYsSNLeGbKTWuA7gBL9L1NhLeVnANBBXUU/a9R?=
 =?us-ascii?Q?RRAVuJIRHpWH6TZYXxbpTwfGbnZBxvGdKMHdOgq91acNhVY3SwbqkwIvTrhi?=
 =?us-ascii?Q?S9G+a3n7dTxFctQB/8BU+y28bEbBnK184g9BHZsQa7AFwhtpwI1naRPaVZyk?=
 =?us-ascii?Q?HDKmUpzL0nLr7nMQjFlS7tXb4ZvN9S1vhp2V0Ld4CVw0pL9ny8Q1OclqZHsq?=
 =?us-ascii?Q?C4/IrWL6eg46hR1OS369VO+upvxN9vSvz946RFL+XnAOrhb7xaCNCYK+8ff1?=
 =?us-ascii?Q?vJtkTtDl6oivaZmYxTXoa1EFd8M91jIHqZf+wcfFjL0uFEJkmY0fOOhQRYGs?=
 =?us-ascii?Q?SNFxav/Z9fXEyeuGXhCO0bbG9ksIiOoDUypR9sOfUwi2wFlV/Iv5W8fwTHjA?=
 =?us-ascii?Q?qxNG3G63Pk3fBgGjdDIZO8lBCZC3MqwYsWBVwumYsHe+BUgRogZFIp3SrdFw?=
 =?us-ascii?Q?+5N754qSDuCdIyUqPxxajH74wdTL9psx2SjWNoAZ0AkRt4H66rWZUrNVb9Dv?=
 =?us-ascii?Q?2d+RDTXqhhkx/y1FragAhHn/n/j5GDIW+uhAHcpbo2kQhIVM6LdxGcD2oBIv?=
 =?us-ascii?Q?N52gblQCOgP4lIrXwWdiL5988nqFhGdnWQsxYBlLzR5tq36esZLROz3+ix/U?=
 =?us-ascii?Q?iTofYYKjM9X2DfhhPO6uyWE0bGtmXuALM3Jj+ddV5O51HcR2mC9FZOc2NJr3?=
 =?us-ascii?Q?IATmR1+iOb/EATkAK/qkrboa3TidKbg0dtfNUcjO7IfgrRd0RkDMr90v2r08?=
 =?us-ascii?Q?Rjh0Hd829v0xJgGGb+Je4Z3xMc6dE0xtKGKduAtGYxdr7diVrOmRTAn+AvsD?=
 =?us-ascii?Q?/spS73bEJfEq5HZDtNQCA1xJzpyx2w2EuxbCzDoyV0vHxm8ZT0zejU7p2xuP?=
 =?us-ascii?Q?IPdRQ9AQ5g=3D=3D?=
X-Exchange-RoutingPolicyChecked: eAqzBBEolP26Nsz8gW5j1qgNmlbTbYd3UB1kJ/lGBcoU+z+fIIi5L+E+1Du56zTIgdRLmoTeI34YoFrdl8Wf4AqaBBMG4Ciysu8rXszdJ2w7uUHAW+Qi47WT2ZrYcm68F+lfCjWzDqkE5q4pJnHKrG/ODLHjWesJagslAwBFZDJfnuJeLJysbYWkAg9vI63LPs3NJHgSZxk3Puv/DzpcgQ37kqD5e2n9vUoI6oB0DRIJRailtVjHq7OdhtdSIKnOC7fT5+eUDinGG3Z+9+EKGBR4mvfRObzhD3DOjTs0ueIA212L6gGg9XzaFr++xeWL4QqkaV6M2bLwR1IruKB2og==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49796bb0-b0e8-4c24-ba03-08deaab5b4b0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:50:53.3358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R41EJPElPDT05AE06zEa13sQp1qldP/w+gpMj7tz6HCZ0J7FkeTpJTXfxFyWnAwu1of/3XfET2U2aN4Xkjq6bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9514
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

Jani Nikula <jani.nikula@intel.com> writes:

> On Tue, 05 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> I think there is room for improvement on how those functions are
>> implemented: the use of strstr() is not very robust, since it can return
>> partial matches; and this function is currently xe-specific (i.e. can't
>> be used for i915), so we need some assert to make sure that it is being
>> called only for xe.  However, those are unrelated to this patch and
>> could be fixed as a follow-up change.
>
> There are already lib/i915 and lib/xe directories. lib/i915 and lib/
> have a number of things that are specific to Intel (either i915 or
> xe). lib/ has a number of things that are specific to either i915 or xe,
> but not both.
>
> There's a lot of room for moving things about to improve clarity here.

Yeah... Should we reorganize stuff into 3 separate directories then?

  - lib/intel for things common to both drivers;
  - lib/i915 for things specific to i915;
  - lib/xe for things specific to xe.

--
Gustavo Sousa

>
> BRm,
> Jani.
>
> -- 
> Jani Nikula, Intel
