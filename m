Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D083BD462AF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 14:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF5510E728;
	Wed, 13 Nov 2024 14:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hI7RCcbp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9375110E725
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731508594; x=1763044594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nUNr2p/4KIYsfTEfSigMDoeNSdS/QV/YFK3CTojGex8=;
 b=hI7RCcbp5hY4Jivp6t0cxVsrMogp1k7AM3OzIlRaYeFvEJfyCj+Z35tG
 Cjh206kVsZYHVmBLHoQYlWQvz2HKq6rMa6qXfWgBBbrSz/HAexbfYf4gF
 WsYHF04TkEwV3eJppRMGiGAlDyU0jc1UM8jQvrrJIDB5LQWkduO2Am4mf
 VpTUPNiHbZ1Fw+PgFkJmsEF9CCjXJVxcHFobGXz+SPU4erYf8dGdJVTpD
 tQfPlRVLBXhohRrSVgVOuRlEZ5iDDCyK4FDJGO4rzbCVK6mastAwLpyXx
 G2GaMiv4vn4s7Yh3xssReu+bP31SaQ6hooDQ0gl2lXqz6l98YBKXclFoR w==;
X-CSE-ConnectionGUID: GKj8MWpcRP6OfqONwbRseQ==
X-CSE-MsgGUID: gIjaRmloT4C6Xp3Dn0EZtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42031683"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="42031683"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:36:28 -0800
X-CSE-ConnectionGUID: iU09gGCsTQ6WgYi/oiNlHA==
X-CSE-MsgGUID: gmuinlDuRhiiodLyh/wWdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="87787819"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 06:36:28 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 06:36:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 06:36:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 06:36:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMJIZM1bVoVoHG5JIlzxJp/EE0Ap+WjmFqoeUw2XQwZcqLK9m6vTdLsvbQkbrwTua0m6jfMCUIy4TQu0oqqhKkt9ERO2VcYkzu/Z2PJdTeRMZ7N6NHj+7KaeHhNGufDbHD4MPNAPd4d5pkXFsJaEbvRxy3PJ92CB8sAEmM1LT2fuxy0/x0NhB47lhWn8QY1JGtVAi4dMI6hjnuh0g8M2L4c8u/S2yq1IXPfhyVBRwMhj3V2SQ3QyBzmeAoyy+4slv0g8oZmryUrZdh89lzgn2b+xTktXldQ1/QvCqd1a7f3eXy0FAktO2t4r62TdSiFVQIN4qNHdl0ApLR9dvNA1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq4gn4CVZznfDASEqMqnCEEfHuP0Hp/s5jtpN7HR4yo=;
 b=iIfEYPuj6HU+1f+T+v5Gb9JG8Q2x+cyuY/4CBuOcNsMcWAnWk6+R4svLLqn6735sob8Ja0YuRTeX7LXRmtbkmAmkdIH66kYpsL0UPmyU6VlE3puGzvq3/Yi5WWzocqS3dqwtNdmh/MrudQpAbE1XF98SYDgmqqCzujokKboJOMzcy5i8UprQk88SYhYXSTYpHCx/y7rNcEB0Gv+5TyxqKqAvOkHHFtM6T7DGz73M0VOsGxVwWm1LYGoJJu+Za9I7lsLFKri1eT+Wflo4CIZ7efhpUND169GYzTA6iH8DMvia3CKBE05HaMI31HMh48MOGJsOAJp8E86KPfVheI0UEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Wed, 13 Nov 2024 14:36:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 14:36:23 +0000
Date: Wed, 13 Nov 2024 08:36:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <clinton.a.taylor@intel.com>,
 <kamil.konieczny@linux.intel.com>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
Message-ID: <d3sktr4lrwy6cvec4h276dz2fi5slvlex5dklzgafqwl57vqbr@aeugx5broaje>
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
 <874j4if2mb.fsf@intel.com>
 <lkiuylps7ka6qbno3gjtpkjbvu6dxpbkjw6725cri35coysxcz@yfcafnu4oguh>
 <87wmhacf50.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87wmhacf50.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:303:8e::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8cffce-8f3b-46c9-f1b5-08dd03f08c22
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4JtRc5YFgUpypqOTkgNEEMWplbaj9FJ01xkfTz7vXZEVygpO4n68m9R+RdA0?=
 =?us-ascii?Q?EqxQBqY+SJ6W9MiZStFLnM0XZxq0CvGq8XAAMtnNRI/YMPfp1Kh/Pe1M3Rnp?=
 =?us-ascii?Q?eRK8YxRFwhPQMGG9orkZgRLUZOr68P0i8we7supjBEx6C64ET+l549Oy+zJD?=
 =?us-ascii?Q?CNdpA+m43xX5oLzMHQ+mQZCYyI80HkGI1XrfY0lAIIQZAAzcjopAmoJHro6j?=
 =?us-ascii?Q?bwxi8s+xOXzkgaxqgedPCFTS24RtIHI4VuP8l15RA7EHvQXt2E1iZHPlKo1N?=
 =?us-ascii?Q?bGMKq3fQgyD8Iq2n+MTyRjoptSbdL+jIMMh9RsGoqfFOvXoVeMPIyttaHMXj?=
 =?us-ascii?Q?/1J8z/V2FM9tw4PkLjZM0n1ZdRWLOhm+vrKGKBbDKpacEWxNsADTVuan7jPW?=
 =?us-ascii?Q?wzYN7+O7ej95ndlOeJGt/irHK78D6IXVTOIwj+3iS6P8jfJl9nix/a0HV24W?=
 =?us-ascii?Q?NJvMvONf4EmaDkeDJpZ3njsLdTyDceTVxDTIgAD6soaJ5CrwDAeYFLbDMGUQ?=
 =?us-ascii?Q?WgOub5oo9hkXTdGpR6BwDv+bSGbSQffmqtgnEkZmone2ZuLl2qIFAkD5BGAb?=
 =?us-ascii?Q?xIns5z6Vb7tlonuWxuIJPhscOTp9G2CUQWgjdR8Btc6xIrjBAjs6TITr7nh3?=
 =?us-ascii?Q?7uqvdkHhxuAoQDVwa3Dj4yEuM54AFZAMX1n3rUX/xAI1qQuikZ0KDLFAcaD0?=
 =?us-ascii?Q?9w3Z7vD8mgTyMKvkjKSyCXd7Fyw/BLhN9gz97c/S7scbZCGh0SQfWenYUFfw?=
 =?us-ascii?Q?6MH0Fxcrs/dh7aTUL9jC+OpDTlxHNadSvA0ABDufHttpAxtL7RHcNACtsPZI?=
 =?us-ascii?Q?yi6ZgKkFGkJ+twGHNQcvMJgg3s8/Zi/UPq4fZk+fj7y1VtcKFjTs0F+n0MXf?=
 =?us-ascii?Q?8Qqq2oVcJ1ny1dJzAzAAJsQQU+B1RNKbz5YeSCRz6M4lTN42m+LW2i/4egZ+?=
 =?us-ascii?Q?Guto8/yShFR5ZLY3JD5WLu+pcooDji78wsmKQNwPzHnhKc3RiJ5pGj7SEST6?=
 =?us-ascii?Q?Mr4smCKx4wXgPg0JmLOcrtGCe8g6Fs7vbmTGA6efX6iJ2kMWWBjFVWA26c5L?=
 =?us-ascii?Q?RirAmpKd6QPDaB8lv+LNM+1fNyUl8aEINlVuD3Lj2eX6RfFy+d6SFu+YGvSW?=
 =?us-ascii?Q?rjHGnuy2XebNiLSsRtqDkG3espuh8RMRfH1o3QrOLz4+HCaCO7kSOO16hsHp?=
 =?us-ascii?Q?qC/H7ZZQWblWRhWMxsM53l0UysuiCW9i5tYCiLxCfFn/HzZYXxjhw+wVE1Vi?=
 =?us-ascii?Q?53Lt339H6F+Wb+joJBi6qtsTzrjHP1JMMDeU+5KPufQWkL4+9SqVvBzbGq4J?=
 =?us-ascii?Q?l+OwN54703R534zfbR/4fxaq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VxdGXNi7USSqqOxljK4KmEA8AL5ymitMT14YVE4jVqYQA2qZ1zA0mfySU3r+?=
 =?us-ascii?Q?7TYr0gifoxh88/y7MCzgI6pQqDKO9MHta8XGNyztn0OEYBDCrQy8c1HZN7/B?=
 =?us-ascii?Q?i4FY7Wsr5PsYaBHCvm1cJKKGi+ln6dJNY5Zh5wZJ8QkQ5I/ZuXqo4HaeUkBu?=
 =?us-ascii?Q?ZxQSN6ZtTUGxWoARAuzNYGaljH7MYTNWpqAwbwgMUp/EOJ3VoUTcTsUolvGF?=
 =?us-ascii?Q?Qu4mKF/kfas1JwP3ZEKzUxjB29lagQUOrv3V+NKbhlUgSU7x4a6iCxNZkfAb?=
 =?us-ascii?Q?V1rOhbvWQLgMY3zv6Jcx6K7zCCTq5cXqxmn3BBc+nx2tcwEsf4sIJdUyo4kH?=
 =?us-ascii?Q?IdkWXLQ1KoehsdUh6adyBsc3oivMHXOvItIcq3YdVXvUeq+pkks5XM2BAvKt?=
 =?us-ascii?Q?59VNuxROUdHfYEckuwytIpJykHdg/HZ7FwHUTu4SrDMb79KnpYmv8lm71A4M?=
 =?us-ascii?Q?CMjJMbIJuf9MGHBoN4LT0uj/ecqa31d6RBzc+tqTBzI1CRX0PDPybgIDo4zT?=
 =?us-ascii?Q?Iv+pljpBDNgDb8b46ycYala7nmWRtHWrKG06Hvy+OmsiRnOVZlA6L99vmdQU?=
 =?us-ascii?Q?KmxEWW44lNHtcox+yY9VZIcuaJ7u0MuNu2xndVGAFcADFt1S3/fJ1R1F2qd3?=
 =?us-ascii?Q?LQEkKcrTozL4YyTnV6orOiddD3HB1yQQicVpQBM5LD793O6D54i6PtXz+xBj?=
 =?us-ascii?Q?CX2go7XdvxIBYGGQPaV32zym33PIKKG46I7mi2/2h6+kPMcVEX5KDYF/wiyE?=
 =?us-ascii?Q?HzkSFxKoofOK51b82npc5hDkN+Q1tIqgvW0jI/oj2xRaAq6i25HZt2mcwuJ7?=
 =?us-ascii?Q?p1XTOPVSUjDTR8dKf2rTmzjHawQ2JCTxW8XIPYyLHrimYHBpg1Quh+B3nOQL?=
 =?us-ascii?Q?DDI/Qhq+US988t308K3vHg8AKThySQKWKhrvcxG3wQ7pmiwsnOVtnVBV0FYa?=
 =?us-ascii?Q?hza6gsZqLtkcs+V9onqfbi01t7RnHShJVuVzR02498tiMgD1xaGD8MwR9olA?=
 =?us-ascii?Q?lq6GwMp49eRi1AuUab0ApflFPdM2YG23whR2/RqXmgVLUgT4fx7H9jRCZzdu?=
 =?us-ascii?Q?OEPtdlEBaVi+B1NmZudxTuQvBGFLDS5mF4fu4WYKc8z5xOfMXYrbl+8/LBKU?=
 =?us-ascii?Q?hlF82+aTiWj5vt1GINsCC7ZC+J58Js8sWedpdqETC3brDJvEQEOBHiiOP/Jn?=
 =?us-ascii?Q?B/M5M1+KSuz3e3AAiKfiMsxN4il28vTqDuYeNf0py1EtsdNMhhKpirfVwydv?=
 =?us-ascii?Q?/wBfRJadwkDMTAK2TxKTyhBja6I3Ewwft4y+ZTszvE3AQjj/iQxGdbHf/x5y?=
 =?us-ascii?Q?tjHiaCTfeb3mIer1KIQ5bLMKwJOJjPq6SiL4gklKOPvoN1rKWyGS/x2ob23P?=
 =?us-ascii?Q?+EDpjoduwWY3CPCRL2boanO7qVEijFxTnpNb4hEY0zqgvdvv4yrsJZ2cQG4+?=
 =?us-ascii?Q?a4LxbpV70txCukq45F7FmI7uhbAe0kttOu86KWpd/iEIWps2x4438UegSiGv?=
 =?us-ascii?Q?s7sCfOKPaSS7K/1++ujUjFkm7P/iBuEzBpZ9l/buf0uaEfahy6gJwgwpQJIx?=
 =?us-ascii?Q?+QdcwiP3QqZV753jfD0sIrwOMsuFsydU5yqiFOAWRUiyIm6RHjLlrWD1M+qD?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8cffce-8f3b-46c9-f1b5-08dd03f08c22
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:36:23.6950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: av6K2n+t6RwWxHjrJb08NskjKiXIOrP+/honnLmI4VEiEbITryRI2krROTE/YnHCxEo1xTNKIf2rPTm1xQevYQt/T2Ex37u6c4usHKhn2X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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

On Mon, Nov 11, 2024 at 11:07:39AM +0200, Jani Nikula wrote:
>On Fri, 08 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Fri, Nov 08, 2024 at 12:20:44PM +0200, Jani Nikula wrote:
>>>On Thu, 07 Nov 2024, Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com> wrote:
>>>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>>>> index ef2f74be8..9eb1141d4 100644
>>>> --- a/lib/i915/perf.c
>>>> +++ b/lib/i915/perf.c
>>>> @@ -37,7 +37,7 @@
>>>>
>>>>  #include <i915_drm.h>
>>>>
>>>> -#include "i915_pciids.h"
>>>> +#include "pciids.h"
>>>>  #include "i915_pciids_local.h"
>>>
>>>After this gets merged, maybe you could write a follow-up patch that
>>>renames i915_pciids_local.h to pciids_local.h and cleans it up; there's
>>
>> Actually to remove it. Why are we still carrying that?
>
>To cater for igt perf code, which uses smaller granularity than the
>kernel. It's a good question whether we should split the macros up
>further in kernel for the needs of perf.

ugh... I rather think we need to have a query or some identifier to
allow userspace to have these decisions rather than splitting the PCI
IDs.

And for whatever reason that perf (aka OA) thing still have cannonlake
there :-/

Lucas De Marchi

>
>> Or maybe keep it just for the IDs from the topic branch (which we won't
>> add more to, hopefully) so we can keep sync'ing with drm-xe, or
>> drm-intel or drm-next, depending on the context.
>
>There no more PCI IDs in the topic branches, even PVC IDs are now in
>-next, but we just enable those PCI IDs in the topic branch.
>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
