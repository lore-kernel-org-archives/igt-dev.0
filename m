Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A63D5D683
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 18:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD88410E8C4;
	Thu,  7 Nov 2024 18:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYNuKArs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E9410E8C4
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 18:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731004612; x=1762540612;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=IcvNJtxMlDD7zzCw0T+rBqUZZGKE54CkOmGhTYOcUT4=;
 b=PYNuKArs7+AEFj4zxIw9l1hirLao4sckfc9qJzWUvT5Lmb4GrwRIHlrq
 0qz3frz3QDh41bzqXpoNKhPQq0TyFp0JYqAMzlz9JinVUyfQVyLTD3xwv
 r/Nq9c7OG+N9/TDk3E4jo+sb8c9neOtdCqGY83xN4eQqJSwqTmUqZIpvQ
 h9Eiyu6mgGyDucxic6a7CnIAsvpXIRnvUouxopiBwB9PmsH3bAInO6fn4
 5Fz1siI5Ut4Gziw/sWKiQLKrDewGCIfy4dSiQvCAlEXBfKjI7kLpw2Qz1
 8HUIqIYpuXHE72RumlbKGTxblgRSzA3ewqnO3er9GVZMIBxdf2YSFEZ6G g==;
X-CSE-ConnectionGUID: TeMd8BANSoGtqBVSmnjWbw==
X-CSE-MsgGUID: XzDHGY9bStmCoVdKVYFDWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30971140"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="30971140"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 10:36:52 -0800
X-CSE-ConnectionGUID: A0XLWNvdTY+90K2NzW50yA==
X-CSE-MsgGUID: JSQaw+PvQu2UQ8gSGVgu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="85987122"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 10:36:52 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 10:36:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 10:36:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 10:36:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK14gLlEzwx0ZDSYH13PURP0ZFKJfBoTpP1wIf16+mn4G2BF29zQw45Uhzgb35ErRAUITNcBB4xONkgyP/+TTHVgrHIT1qCdi61JCtt9CEgh54RpbMxDYe2uyGJuohaqWxdkZB9V7B5MbcqpH1/D2oY/pNd3QhHRYQIF+3sXPkafDZvjMBYXEZ9J8vfwgSax3jkROIJtmmqZp9kZ8+FAX/Iqgqz1rG3RNs4LDvgXgzRvv9jT7THjxBQ7uwYFe9F/AhvqdK8BM0Y/x21cycwVE1jFjHq7fnfKBRQwU2zxhbt+WdKRI1wgIJqaK5Zy//CEI5+wsKzthgRF5KzXzj0w8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11JtidcbTpSyZ+F2MLG6ICt2Ucvl1B0EFXEran8BlcE=;
 b=wyHoOhkozE07svSmgsp99ESDx0f+tzKlDYXQ4IR2A/BAaDaac6Sa5jkvlC3CHJw526gZrRWVLfA7+pwQfEEkLclfktxWrfq5m+DflWt/D2HPyQiolIasxYHk517rmMB0FMkN1400SQe7Z55U3X+za9nNRk970t/nyDaO6p/aPP2XIHLf9G4ZXEDECVk6NcVt3Tonq22KPL4FYxVzPhxrFseaJD0cx6BBXN0KdoMZkrHbzRnNbvoO+nlDs3+/Puv/vGcVb3LJfeCqFxkKijzqrUOShwMhFsakjGl28HEUt3Jm8o6EKwRedFB7ZWUUts1K6zxTYryRdqcB0DRGuM0v8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB8826.namprd11.prod.outlook.com (2603:10b6:8:256::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 18:36:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 18:36:46 +0000
Date: Thu, 7 Nov 2024 12:36:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Free log_buffer entries on exit
Message-ID: <ypjxm3cpvsxvco5nn2wyxrpllmtb7k5pkksehtsve7piyrjal6@hesxrn4iz4ia>
References: <20241107070208.3143050-1-lucas.demarchi@intel.com>
 <20241107173145.avmfmvivykerfpz7@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241107173145.avmfmvivykerfpz7@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:303:dc::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 98099057-572d-40ac-7327-08dcff5b2262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FFqdyy7xJC/nw2eV6EhRbLL37kKTFL+bZkSaAvmV8lzcf3meWu3z4uPc1Pfh?=
 =?us-ascii?Q?+VwOXxN+jcKwCBeIN2o+aFKpfFVrcW3pQTz4Zw4HkvWE7l4JA5Yf5jvO3uX+?=
 =?us-ascii?Q?TAdpdJeBEbHZkaFJp4iXitMHrLlEDvN6oaiRFPmk8SGW12yMGTFiNDfDYw1x?=
 =?us-ascii?Q?eugVYYrxYRFVvwQPwNcJ2uqiaGcNPdBnp19dxTOzQ50yAih1ZTgfN3Zv3dGu?=
 =?us-ascii?Q?EOsMHteBucmSORtdecCCHe9ZZT4TzAGiM7JLHBE6qvHCGC+wxmXlUazifiuO?=
 =?us-ascii?Q?K7ziOaoCvr01CjvIv38B84J0zQuyaynpUS01s7n7msmedJiZ8aD1VtKKgXk+?=
 =?us-ascii?Q?rc4S1w2jkpB+uZOpdsA0z/f/D9UjSmpOapfFe8Sm+vU6DxHgJwk/apmr+YQm?=
 =?us-ascii?Q?JYAfIvupbtXMXGXNEeQsWwTAPOPRWe1ThB/VkCRYu6ZDxgK0iGKHHVIEqfr/?=
 =?us-ascii?Q?NuRzs+th/VN93tVm8q+TZOa/xNmtYFu5RHNSwj659yalj8gsvjmlM3zd4CIu?=
 =?us-ascii?Q?av40XjSYpVXs7OguY/wLW6ITNtU4hT+Axmf5a+FQbk4uf0q+5EeGGToDRjvH?=
 =?us-ascii?Q?ztm2Lb4ru6QzZxCCABWtZyEka/qd6Dt7lQgskd1/K9CEr9KEhiWMTUKx9qZs?=
 =?us-ascii?Q?oatzlBJEMyoMh5zlyIHWkKHH2AUj3eKNU8ackFog57UuYA9tcw0DvVDEqycO?=
 =?us-ascii?Q?rrV260gHa3ysXvppIK6x4I0IB9iHACGxv0SGjfzdS5JI46t1KlKT6QdfRl3d?=
 =?us-ascii?Q?m2eBaLmWINLA+FFNNz2T3VOmsPO5BE7G8I1gZySfNnaoy/XkPSXLO2sdKpTA?=
 =?us-ascii?Q?sYPKXCrkWuwoardvKMCw0u3ZCHaQZa74NDK5dOtZ7+ijhqfDCwiX1YcaiRd1?=
 =?us-ascii?Q?17zoVGiHZ6aQikTy8pwLKsSbem9CsgoLnd6IifEZwY9E0oLB552enzU69bAB?=
 =?us-ascii?Q?8+CEw/NnhbVnb1MIYdP4XEbC6y8J7BMdk07LHldMIZAJyU1V60DSF3zIB9GZ?=
 =?us-ascii?Q?r736CwClUMJIBedbC/chWrD538gnXhM16WFYeomgqtxlM6G77rF7ekKaOoew?=
 =?us-ascii?Q?ftp1rENouuW1UgFy4hHWboarFr5QT2Gk2kz33GqK4RP99B2Dicfi+F487Bn/?=
 =?us-ascii?Q?zpACztKFzoqXeuRd0wfA5He4k92RXPnRmLHh6L34BZbvUrIwSQDohtdkxSYN?=
 =?us-ascii?Q?8AlFrcJojGQobjJA4mUPSnbry6Rzk8VQ2BrCiJtSD0AiMeY58Y6PJ39S7F84?=
 =?us-ascii?Q?EEFuq3t8BPHQm4jfWau7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehhO+B0LqYFiCWrjtMwRVxC6qCxOdPZfHgerSGeietFrsdBwqokWRQluIOfC?=
 =?us-ascii?Q?6K/y15D3TFjmmdLABGQBgMoAta7dqX8lBDyXy7h4ZkFvBR8rf3sCzy/JpPRB?=
 =?us-ascii?Q?VvgCfUq3Z3fHyv+RKF6e0OlFFGCViWG7dwj3LsL4/eUxuaZuPKcBytS36Dpc?=
 =?us-ascii?Q?PwAZ09ks+M2sy6rFDRLJ5B3pqT140qvVQXNCix6wsH1lXUPGJ6CCDTio/q4e?=
 =?us-ascii?Q?tbwwKTiID/80UWrHawcyiAyrqnGFUShZBqLzuTZR1QjLOPsFfyJ+p8Kqtztq?=
 =?us-ascii?Q?Px5sNzLBIzQRM/WIG5wlrbhfPP0/6Qn3Ie3MNvFm8di7dMzz5GBz4H+Aqo4t?=
 =?us-ascii?Q?kV82r9MDV0+1x1c8XViPcNUYWXRMKDCTbw/xg+YVony3AnESNVX6xt+AWAjH?=
 =?us-ascii?Q?TEKpfV3e/jESEYNykDFo/S0xNhe6LM6yQQzAdN34QtMEPLkBhw+6hzX0nCfB?=
 =?us-ascii?Q?sHcIFzOl32MDgIDVJKQdq0GwX09OJGil0NQsy4MtLF2THdnJ63+62rqmz6Iw?=
 =?us-ascii?Q?C9gdi88KZj2OC0pXN6RZhjd+P7wwmQYyi53az/fEd4+VbYjdoHodF4nTKcGc?=
 =?us-ascii?Q?qw09qMEX+FZzXLlXLiVgyTEUW297UJm3xIooWQak0SCL11K8cYzY04mE9HP+?=
 =?us-ascii?Q?PbE9f6U5mhkl9BDi0W/tU8WgHHLcYiCDrZQpb7STQ9u/uCXDY+GCVRpBWrwQ?=
 =?us-ascii?Q?Ndgm0azBH0E9If3Z02aEHMTOgwV4eEy6n8ry/RrflPcBtPeJXG8IMSXJPW3X?=
 =?us-ascii?Q?sVO5STJfjJ4xN8LhGkrqCpXoxvv0r1Xmmdd67lzk6qgRH8c4LiHKN4+Pldaw?=
 =?us-ascii?Q?0eoWr/c/Zr34PrYA7tmqQLbBbIrkuySWMiIj8vbC6HHo4brZkpR6/8yveIT1?=
 =?us-ascii?Q?3tjTUl6735wW9sne8DCzPNlEeyL1viV/Hv2vlIptKswsDb1l/qixJ6W9dzDu?=
 =?us-ascii?Q?k89SAEia8SJDo9vivepUi0kprCdLIpo57/Szc2k9igL5B2pqIhaV18+Y01B/?=
 =?us-ascii?Q?uQfDHk5yOXzUFAE4M6ZKIPIsS3snWVlyRQLiPo7u0DSAlbyixEtjEKGW46J+?=
 =?us-ascii?Q?RhP7L9JDhpFZl79ycvGJ+GBFZk5CsOmTKaL9+GYccBcphFNvpJN/DEeQIZNe?=
 =?us-ascii?Q?u9AdJROzgANw97VZOtVevPtGgQlq1yYtaYhAGyQRcio53cVkuLtjTWu0jizQ?=
 =?us-ascii?Q?v4nvxrJ6hGPn5coPpXMGspxqR4+TiyCCeJ7VUac+B/YEAAZnsyztBFtfMxAr?=
 =?us-ascii?Q?Pt8rs2J6BMRlRHgJvfB5VSfLfqKvB1oxuIwe4wNomA2+IPqoZM5dbD3EKIEe?=
 =?us-ascii?Q?A6k7q2e9VoAltIjDOen//6XZvO6EhtL0aLhJs+RJp44PUrz+InHPa8k8fr4R?=
 =?us-ascii?Q?3U504BOHiZaMZBkEI+Waco19Bxn52U07KoeWch9bcJmVj7ze4YCe/uZ0uFuR?=
 =?us-ascii?Q?cCFlDR+5L/gLSDdu6+MVt9Kry82Wk229bra0IMYgNoEeUKw90NLECAdzAgy2?=
 =?us-ascii?Q?tBXydUS1wqG4OzORX9caRfSfRRZuYIIzrfM6XFIqN2pjfieI5cDiAcvXYdfC?=
 =?us-ascii?Q?/3TxnkZwOjbW1T7wK5upZfPCD8iKM5NFfihaUmvC7m0eBUcqL97tHdCSv0KS?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98099057-572d-40ac-7327-08dcff5b2262
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 18:36:46.6255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcKn1RZBph0Lr9j4CiWqSLIbJQnvkIMMdtsK6o8ge6jLtJof3uNWG/bZ3eo+RvftFidaoldNwH1aML+pw64u9firkOQS5RTZXnJ60aQ7IuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8826
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

On Thu, Nov 07, 2024 at 06:31:45PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-11-06 at 23:02:08 -0800, Lucas De Marchi wrote:
>> Make sure the buffer entries are released, otherwise valgrind output
>> becomes each used entry as still reachable on exit (up to 256).
>>
>> Test:
>> 	# valgrind --leak-check=full  ./build/tests/xe_live_ktest  --r xe_mocs
>>
>> Before:
>> 	==16082== LEAK SUMMARY:
>> 	==16082==    definitely lost: 0 bytes in 0 blocks
>> 	==16082==    indirectly lost: 0 bytes in 0 blocks
>> 	==16082==      possibly lost: 0 bytes in 0 blocks
>> 	==16082==    still reachable: 33,473 bytes in 59 blocks
>>
>> After:
>> 	==15992== LEAK SUMMARY:
>> 	==15992==    definitely lost: 0 bytes in 0 blocks
>> 	==15992==    indirectly lost: 0 bytes in 0 blocks
>> 	==15992==      possibly lost: 0 bytes in 0 blocks
>> 	==15992==    still reachable: 31,083 bytes in 42 blocks
>
>Thank you for a patch, there are still some blocks left,
>maybe because that buffer is a ring? e.g. it could have
>end < start

no, those blocks are other things.

Note that we are looping with a uint8_t. When we have start == 250
and end == 2 (impossible due to how we place log messages, but just for
illustration), it's expected to free the positions [250, 255], [0, 1].

Some more context explanation of this change.

I sent this because the first leaks I was seeing were related to libkmod
and as the libkmod maintainer I was curious if it was a leak in libkmod
that was getting masked by us not releasing its ctx. It was not, and
just releasing the ctx (see
https://patchwork.freedesktop.org/patch/623301/?series=140746&rev=3)
made those go away.  While doing that and running other more log-heavy
tests, I was getting a flood of these 256 blocks, so I fixed that just
to get them out of the way of what I was really after.

Looking back to this patch, not sure there's much value as whatever
binary using it is already on its way out.

>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_core.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>> index 407f7b551..879d1ecd8 100644
>> --- a/lib/igt_core.c
>> +++ b/lib/igt_core.c
>> @@ -469,11 +469,21 @@ static void _igt_log_buffer_append(char *line)
>>  	pthread_mutex_unlock(&log_buffer_mutex);
>>  }
>>
>> +static void _igt_log_buffer_reset_locked(void)
>> +{
>> +	for (; log_buffer.start != log_buffer.end; log_buffer.start++) {
>> +		free(log_buffer.entries[log_buffer.start]);
>> +		log_buffer.entries[log_buffer.start] = NULL;
>> +	}
>
>Here you should use the same loop as in _dump, so
>
>	i = log_buffer.start;
>	do {
>		// do ops here
>		i++;
>        } while (i != log_buffer.start && i != log_buffer.end);

there's an off-by-one bug in this loop that I didn't want to reproduce
here: if we never ever logged anything, at the beggining start == end == 0,
and in the first check i == 1. Which means we will print (or free in
this case) the 256 entries. Oops.  I think we always log at least the
test name, so it's not a bug we reproduce.

>
>Or even simpler, init with NULLs and then just free all?

it's a static variable, it's already zero initialized.

>For example, if start=2, end=1, there is still a valid pointer
>at end==1

no, end marks where the *next* entry will be. At the beginning we have:

start == end == 0. There are no entries in the ringbuffer.

After the first logged message:
start == 0, end == 1.

If the ringbuffer ever wraps, then we will always have:

start == x + 1; end == x, or
start == 0; end == 255

Except for when dumping the contents, this ringbuffer doesn't have any
consumer incrementing the start AFAICS.

>
>Or do one more ops for case 'end < start'

in the wrap case, see above. The key of the implementation is that we
are using a uint8_t and relying on it wrapping back to 0, so we can just
increment the head until it reaches the tail.

As said above, there isn't much value in this patch other than "let's
get it right", so consider it optional.


Lucas De Marchi

>
>Regards,
>Kamil
>
>> +
>> +	log_buffer.start = log_buffer.end = 0;
>> +}
>> +
>>  static void _igt_log_buffer_reset(void)
>>  {
>>  	pthread_mutex_lock(&log_buffer_mutex);
>>
>> -	log_buffer.start = log_buffer.end = 0;
>> +	_igt_log_buffer_reset_locked();
>>
>>  	pthread_mutex_unlock(&log_buffer_mutex);
>>  }
>> @@ -624,8 +634,7 @@ static void _igt_log_buffer_dump(void)
>>  		i++;
>>  	} while (i != log_buffer.start && i != log_buffer.end);
>>
>> -	/* reset the buffer */
>> -	log_buffer.start = log_buffer.end = 0;
>> +	_igt_log_buffer_reset_locked();
>>
>>  	_log_line_fprintf(stderr, "****  END  ****\n");
>>  	pthread_mutex_unlock(&log_buffer_mutex);
>> --
>> 2.47.0
>>
