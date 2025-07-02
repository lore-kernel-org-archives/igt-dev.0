Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1AEC83038
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 00:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914B610E688;
	Wed,  2 Jul 2025 00:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UC+/6RHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A310E2FC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 00:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751416490; x=1782952490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FiB/H+cdhzhjxzLXxdcT2Vl9d9XIIAfnFn+mHWZpQ8c=;
 b=UC+/6RHGwdnvW9D2p1lQYOfjmyJ5KuopLUnhM+/J3XAfcbIl4zK2ih+h
 RzJe3a/srtKCkUSfXtqx1sZSLodaf+d93jrKH1G0fHGZPiu1X9jdpsT2j
 xZ0tEtTV4bWUbby0WponmMbVSXtfrO6TRYNUKw3+w+/21eX7cLSmgnBDU
 dL3AXCSFoHrWth8mI5UgZ+XUIGmsP+5jN2k6HD9G6ZjjAdeBpueFp6ATP
 /oqPkw+u8/Qu6/OZ75hzzLZD8M9YO/1ziH4wOBJikf9KTjtTFoEW9Q6+1
 x0fG/sfdJ79KTgL2KCn3slYgAOZgYIyI4n4OGZTUyeO+q5l56+EXDKZK2 Q==;
X-CSE-ConnectionGUID: K0wDfQkbRleVhYwu4MbU+g==
X-CSE-MsgGUID: meYhp2mZRN2XJKSTLPfmDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65046338"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="65046338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 17:34:49 -0700
X-CSE-ConnectionGUID: DmJvpmGhTqevFp5eqh0rFQ==
X-CSE-MsgGUID: 8ymhnIsETxed5qo757pDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="158475910"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 17:34:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 17:34:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 17:34:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 17:34:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+CtLU78y6dSij0HQpzb+UzehEkJsw+SiufYfJ7Sh5rs9CN9fxOhYDFRKQIUTUupvsznvMhSACOZf38iE6EVLkhGEFbzLqYnoKru53xxhkpkYZ7mcFiUGuZ75P50KHomupw8eaWO7J4uRiBkvFNMa0k7Q68t5RTFxMMtT+qVJzt99wB401a8gMuQZVnYzT9VJru/NAUfCvh9n7DdOQi0IdkI9DHlCNC2MjKR/rFdWFwzGyevctPU7kA5h3I+OnSUwQMfIUmaeYtnzzZNBg+9TM3u5o9Im84SdcI5fDTOQg8hjYXfpOdyOacUxcS+QF3q95voG0bU7munOuMP/4LrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmJRr+nrhoBHPnPu+9eWEKr6UwT8MVF/Uce9bdEc7Zc=;
 b=RJGW4r9CVc+c4h7yMhrDrj1tzH8i968034eBD9no2GObKkVC8T/yGXPq0XxWJ9p9A0etk3KRKakkI1hlaArmTicSsrpZLrLAm1pygMfO4jAmFiGfS1ZjWE9Vuiq8MbrZIUlAVzXnJD47ifbkYR+QorJjdKkrImIZZmdNSHO0WMRX0rXZOiCxs8PFgd4HmaGOjIoYpEmHClMewmlmNogtgJ8skUrcaJx8caKKZ5zkLxQg47IT1RLM98TFF0OJRRrMQ7cv59d97LiO2NjONYF/fcDzb/TZjoMN57FfaEjgWJGY8xMUqOc9zxhbdK+veo3v6No4AUrWQtwy21kJX3dtzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 00:34:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 00:34:04 +0000
Date: Tue, 1 Jul 2025 17:35:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 0/7] Future-proof GT ID handling for Xe
Message-ID: <aGR+4iq4QKJBXDrW@lstrano-desk.jf.intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250630163529.2096664-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c38f92-5816-4303-e4b2-08ddb9002610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m63QsMAc5N8BO36PvRnn7p3kU0DFxg8idkFbt1A9rBEWYHR9X1q5+25Ljd40?=
 =?us-ascii?Q?EgbrAuATWQ3+U6CPkjtAFyTpend27rZl38cK14wI52/d9SQRtFexkQXXNhdL?=
 =?us-ascii?Q?4phtj/eQzpVXT/J/VhrDs1YrEqoCGtH8R8P9NYsGM10bsjjK0yma2HpWl/69?=
 =?us-ascii?Q?LrPUB5UUchwtVeHD9Q0YPz7ykcYzePfOXM32061w1j6O4ExksXGqcjUsycNo?=
 =?us-ascii?Q?uRfZ1DxsQQ6Cm8nuzIuZTEZLKdTIvWR1fPBiu3FU+ydIzmna9t9/6HF+YNIt?=
 =?us-ascii?Q?8q7KjopvYMqbvqQGpQoM6jP6YY9NWM/nwQVKw59Nv+j7MDNRa96Yd9VjBIWE?=
 =?us-ascii?Q?tqljyoCwsjaL3QmphsjYxosQl4d8V7klmjE7lPVQbHvLAwjX0sktTvIXRJ8M?=
 =?us-ascii?Q?4aWY04DIplMddAFkXVemk5X/dDsPhOgoEX/U1P46JMccS/kMsIoXb+uBWEES?=
 =?us-ascii?Q?0Bc+iX5Iza8hUkw933MOnrKAqQPb0fZZ8j+xNlVrJHWhfMItPL3O6ERTaWT8?=
 =?us-ascii?Q?VqJdoI1kmO0iqfKNtE9Q35pKhK2Rja4hEqZgwKZEm1TzL9NtHlbhl36PR93W?=
 =?us-ascii?Q?/VQ2vJBEK8zdiSiUiXzhw/z2mJy2LChTEt4eOawq86V0SqhftdsmAiYuirPp?=
 =?us-ascii?Q?/TK4PkE7h1PnSGlgI+nKDL9/pcWbO5ljTe+92nN5JDEZnpKYv6PT3/V7Y612?=
 =?us-ascii?Q?iQGzto7UCIYaKVU2piIMFIZAbve7Eq67YsX11TsVQPlFTVkktMl7malTHJWG?=
 =?us-ascii?Q?VqFi2FZ7EA5UebwrYVH9yT8o7xh9G5BuPWc6baT3/bPnLnXaQ0x9eL/h4m02?=
 =?us-ascii?Q?GaSmRl9n77S6HnHaUaP/VX8GKNJR2AFItiY4GdLxiXRfms1QMeYjvBlXMBj3?=
 =?us-ascii?Q?md6JPcp7/aIbC1qYsy+aOofZvPisI5jv/uT1m1MvO3brWBzJbqMHvFcVkxA4?=
 =?us-ascii?Q?2UqE3sTBJQo/Dx0IAhL2dkLnDFaq14nVNaPsGkCQQ/2+US1AN8sEQcDistIc?=
 =?us-ascii?Q?fOkoy1ue5Uw7Xr67zspBAr3QYzNxo835Z8nHT0aJRgFwFjtgM0hGAZFF9VwL?=
 =?us-ascii?Q?+3Zxc+HzoS18WfiOyAM1u9ieiyBIU7uYWGI1tzVC3bf4Q4bu+CqexPN1EmPA?=
 =?us-ascii?Q?CtlM+BJ1is4BKissI/TnyEryZW4nA3DvlUI5Kgr9jUJBbZy4mtp1PlpQ172t?=
 =?us-ascii?Q?mhpY9fCO4fhACA1ArcjKBY+q+Un7FxYfsIPlQlvdq/x0bxrHucyjp4dABBpc?=
 =?us-ascii?Q?Az02qQmTUkvfvVYYk8X5sVinZL0L8Ujtm8bpXOgTk+aWg/yoX7IJtZVbE5Bm?=
 =?us-ascii?Q?+2+IKAfW7+3g6nf8GTVgWmRON7Gv8CPsbh+t5cfy8AeA/ayc0ZftrpsxmtTe?=
 =?us-ascii?Q?+qkpLhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GKIuwCokwVr++izcagLQ2g1jtEBqcGfQtCtZ27oCeDLsw6TRT6EXm+LMX9FI?=
 =?us-ascii?Q?BuOxOjf48q+G4wyGArChHGd3F800Y96rhqx7mPaMe+QbasyfO2+KVCwPbaDt?=
 =?us-ascii?Q?0n70e+lhbKM06Feo5UPd/cLLmMInkS5r9UiJfNbhahj5LlHjLxPj4veFELAD?=
 =?us-ascii?Q?Ui/VQ0D9+GYR2LLKKN2pTKOYYDmw2s2SZXN7zQjVMoeCf9qmkm0PUCJ1O23a?=
 =?us-ascii?Q?CPMn+jIRXA1jV9zT8ByxpSokHfAumKvlLdMIX0YX+AXlsT2+Qlm6Q3MUWNWI?=
 =?us-ascii?Q?NCRhha8+N+0uuUOCSnJTYpKIRRtbBufKgQCcCujFMk5qMSfyxRDiJArT38Nf?=
 =?us-ascii?Q?+IyINN2/N8HWzwEvMixto6VIJv0dg7IV9uL99YP05rqgl4RJRUGwRDMFpmCt?=
 =?us-ascii?Q?TWJEUDHm3sFFR5P+4aZebRiMTW3tPrTlwNIGjNNTgmzMQAMm8gucOh/iOO53?=
 =?us-ascii?Q?9Z6Soh0QkdJSqiqfAVBiV+iVKANGFTS7g3XC9+sUPRuIWkW//TV/UvVAkCk+?=
 =?us-ascii?Q?JHzMm4wZFuKEmoXhJx+twBryrpF1VO+A6t8RUTdZnxRMR0lOltPqjRwygsBq?=
 =?us-ascii?Q?QPjPi12jLSLFUa/ytdyzrBQzTObGtxIotAFafhaMMOBen5bQ0T/msfj9LpZk?=
 =?us-ascii?Q?bjVH4kz5OmY9ljPuyaKWlnUAEo2jQ999ylp4KnEFV+7m3Q9I4zhl8baFygiv?=
 =?us-ascii?Q?501r2KrCRc8gz+cz98UY1CPoHy4CeQRHT2SueOQH7oZo0G5ojtP0BFmberDv?=
 =?us-ascii?Q?tkdg+WLHjmpw4Li+WymgNuRzFOM6FRTVZqAMABBi9AlosEIP1f/b4uFp7Xk3?=
 =?us-ascii?Q?Eqt2O9w27SMzxzoh0dmdvvl+cs5fy6W74X1i4u//1fw1whgHJ3MTHhgyIs9A?=
 =?us-ascii?Q?h0JDV4oyW/zJk8ZSoo4y/x68Y+GZbio/SCT/M9RIWKdB940bcoSl2jfGzDLG?=
 =?us-ascii?Q?qDg+CLXQ6NJkbTDktUG/O0C981qKoC49kXAG93GVZrVHmh1iTg2wlE6FZS64?=
 =?us-ascii?Q?NaXqXcAeBbpS/GJOHNxFIbXXa6Ckl/BJTSfO9kZuOB3YrxazsdnyDxqICbuf?=
 =?us-ascii?Q?GBRoXDr+6mIi+AEdi5+OMBkxlz9VfZ9O1PAD/JDf4ldZJVb9yXoadR8qthYL?=
 =?us-ascii?Q?ld7VH3zorNdc21vUwjniIxD1uyCQOwrnBCQwaF59tugbcZfCRgQzGBSiJAMq?=
 =?us-ascii?Q?n1bZfMjIo3sfKpCq6nbUTB4aXtJg0YRBBB9GHNFQv3wWHmVp5e6xxT0tJuNO?=
 =?us-ascii?Q?Snx4M8xWD+o6tq+SzPwsAOY8WUoeYCsfJiSy0C6z2YU5Xnh9BKtrG1ZIPrIL?=
 =?us-ascii?Q?Btw1zbIZQNy0UKtBxHm76k7n2eieNFML9zt2ACRMHGsi7Gv6JMQf7wPhiX1a?=
 =?us-ascii?Q?ACc3A1JwqI0xZlBEtuOXAMFuDhQfJmO9Gk45wby2Xw1IDqBBEoZbrcE3tmdM?=
 =?us-ascii?Q?drCukyG+FqaXd+HorIXHvyKrwqTwMMy/r3M/o8p87j3Z9yhPecTCY9scpPBm?=
 =?us-ascii?Q?35emqwC80IT0xmxfw2m1LIyvOsmnCMph9gaEjT2ZgoIBAwRPMJvms9iqw/Tj?=
 =?us-ascii?Q?LvmwUhWmG8E/wM6n+aAoP8VY4Vs8DgybH5z/UYpUtGwjgfxNRR1uNozuIeoK?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c38f92-5816-4303-e4b2-08ddb9002610
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 00:34:04.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +B6EJk57OGZPVNtGiMzUNNS6mnA9jFLMOVMg+NjYZQ9Exzco+3o1MuErKvP9dNdCFVINyh/V6LDqHTtUQy31Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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

On Mon, Jun 30, 2025 at 09:35:30AM -0700, Matt Roper wrote:
> Current Intel platforms fall into one of three cases:
>  * Single tile, single GT (primary)
>  * Multiple tiles, one GT each (primary)
>  * Single tile, two GTs (primary+media)
> 
> In all three cases, the GTs are always consecutive (0 and 1) and the
> GT's uapi ID matches its index in the xe_query GT list.  Future
> platforms could potentially have multiple tiles with multiple GTs each,
> and/or could introduce new types of GTs.  In either case, it's possible
> that there might be "holes" in the set of GT IDs returned by the GT
> query (e.g., 0, 2, 3 if a multi-tile platform only media on the second
> tile; or 0, 2 if a single-tile platform introduced a new type of GT, but
> lacked media).
> 

I think in the future we may logically remap GTs too for various
reasons. For this to work, the gt_id returned to user space really just
needs to be an opaque handle which the KMD can assign whatever value to.

I haven't looked through this series (or KMD) but it seems like step in
the right direction for logical remapping, right?

Matt

> We need to break IGT's assumption that the uapi ID used to represent a
> GT always matches its index in the GT query.  This series shouldn't have
> any functional impact on today's Intel platforms; the goal is to just
> future-proof the code for new types of platforms that could show up in
> the future.  Similar refactoring and cleanup is happening on the xe.ko
> side at https://patchwork.freedesktop.org/series/150192/  although this
> series does not depend on the kernel work.
> 
> 
> Matt Roper (7):
>   lib/xe: Track valid GT IDs
>   lib/xe: Don't assume GT ID matches location in GT query list
>   lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID
>   lib/xe: Ensure GT loops iterate over all GTs properly
>   tests/intel/xe_query: Look up GT reference clock correctly
>   lib/xe: Add xe_dev_max_gt()
>   tests/xe: Don't assume max GT ID is num_gt - 1
> 
>  lib/xe/xe_query.c        | 78 ++++++++++++++++++++++++++++++----------
>  lib/xe/xe_query.h        | 10 ++++--
>  lib/xe/xe_util.c         |  7 ++--
>  tests/intel/xe_compute.c | 47 ++++++++++++------------
>  tests/intel/xe_gt_freq.c |  8 ++---
>  tests/intel/xe_query.c   | 13 +++----
>  6 files changed, 103 insertions(+), 60 deletions(-)
> 
> -- 
> 2.49.0
> 
