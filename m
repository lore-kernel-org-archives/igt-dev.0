Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B8ECAC5B8
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 09:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C008D10E06F;
	Mon,  6 Oct 2025 09:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcZacevY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3055F10E06F
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759742248; x=1791278248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UnAjc9rjUBgGTI8WmfrsjpHkUEWseLs5pF2IVGvjWro=;
 b=IcZacevYXs1pXqkKpmH9096bU2pYvGpkMNZVzcNYx/W+i+Y7IGRN3Xyq
 VWlUowsgHIeu65uVue8Gwku8VpAnu04wHiMqI+O0a97gWDjIqRUHHarIP
 PX9xXUUADuWejclImKsIFGJL6LydLOFzG1UepniNF3mGMkyWH6hoLhm+W
 d/9zXRv5fOgv+O16Ojo3I5+Mg2WOlSXCGVCGsm9lvhrfDpJPrXPUAsGs5
 zJHH4x95FO+u11FmPiTofSfCtyNzUTIRTxcUpJAgoPwXoEqpu5gmx3OjE
 ZqwXMlMlGvl1w3TY010lukJXnB4iF+htW02t9OzC9DDtku0HntRtt087h A==;
X-CSE-ConnectionGUID: +TEXwxB3SV6CFizyopBHgA==
X-CSE-MsgGUID: gIzuTaeJSySFZSBEnqw/hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73338994"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73338994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:17:27 -0700
X-CSE-ConnectionGUID: oKXhmKW/RPusLFy59jlqsA==
X-CSE-MsgGUID: ABrbYNEgRWm4+WYrZuS5TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="184213546"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:17:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 02:17:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 02:17:25 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 02:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssOK3vE9ngyL9u0pjuoaap5UM6UP2UZVhaImZTMrPRa1hMm4DiSd4Vv89RHZhM357MHdi7cZNHASgKJJDXiuiGyPDYf6qobt62vDrx0Wb0lJ4MfwJHqKAOKNrwEzZJYTs1PoARRW0vB10iqrazlw76C6NVWTOOQkIwdAx0fUFXHCujdb9/ksyjGQu3xHIE1vjlgfK04eULtDYn4MRN5xGKM2HTG3bGOH2PdkvfRHOV3+K4TbR5Da233exzEBE9UZb4BOZk3/yXaEgRE7ImNk1JJN3TVXaWkKopC9gVFSy5h8D5tATbvtaNThXc70yX13j+YpEGi5XPmogecMF2/+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SG1KfsjWcpRU20rI0SKWGfBn5TIMobpbASbCYoJLuLE=;
 b=xZKBcuinpsAdPvOZDYxry52tPWWE9tBaF5gJ+4hFBiNeG53RaBWo3Dv6Z5B/mKhqxiMmh/Z3aA9JeXf99UD+ENxHdGaKAIB5bzIAULlPzfDGG+5WubYv+wmipaK9H73992abBy6L/tddlW7SlP7r9MRMkHmDZO9pliDV8wyqs1B0+Aphswrq9MXNYLjRfSr9FOji0hMHbHIYEfqttAEcZzN9oyAwMHGtyYMpriu1kPFWG/oqO1CWmvNiDWRR5WJdFzoRprWQgfW92nThLVkiZvAJ/9jSgm3eJk6CYhMFjx5lVW5QOyHdPMFrUGvhrUInbAQCFIGZ/mFHVo9vepenIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:17:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 09:17:18 +0000
Date: Mon, 6 Oct 2025 02:17:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] tests/intel/xe_exec_reset: Add
 long-spin-comp-reuse-many-preempt-threads
Message-ID: <aOOJHMN8L0VJIh4K@lstrano-desk.jf.intel.com>
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-6-matthew.brost@intel.com>
 <521cc99c-a53b-485e-a688-71ca9b90a54b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <521cc99c-a53b-485e-a688-71ca9b90a54b@intel.com>
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 91aaa71d-03ad-411d-7ef8-08de04b925f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nZdi6BLTVfnbktqMLNeEypVOtdzxtJkfxRcp6HFk6i2sX3eG4VRl5ZLTb95k?=
 =?us-ascii?Q?XTistyT9YULfcH/OioLXmxtUU5s0w19v7M9Z8CZMJrNRohmYOUkSwxPJu80n?=
 =?us-ascii?Q?AWJHhX61dqzE7LujZfbbGT7pz6zadVwNGq9PXiY18PyTwPrmQYjpOtjYoqXO?=
 =?us-ascii?Q?RynZvrs/PT80G42EhHFx/6e+9CU/U27P/IG49ULXPsQJiBzbsvX3N+aV1nKa?=
 =?us-ascii?Q?VGYIl8neOwhVhvEE6ME8wfa8Ai7kT3WbbJHcBl/duof8kNi4L0urI2umEUdC?=
 =?us-ascii?Q?404OyqlzH70N3Nk4Zk0CKXTr4DdM0qE4Fo/jb8iqxkMnJYMcu19O30tbLhXp?=
 =?us-ascii?Q?jQJMV6av5bW6mGrTOIVadjkv5ng1+UoUboiXPkGxZelEIa2saBbayIiGN6Rr?=
 =?us-ascii?Q?fd0ZIpnMo9T0MmXerAb0kYHPQVKHrrVApHB6U4hHrYK26NrFokjOeDF2DUq2?=
 =?us-ascii?Q?JRmmjQ0wSu+RSkFUOVMrwWFnPe8gAXoIlQzAKDQfLSKdJDXkUGNHYrtzWwzK?=
 =?us-ascii?Q?A3trdQWQJyLTfsU0klEnIOwrzBJOdB71Rhh6TooggALx40c2Ny1jlWyLRZ3n?=
 =?us-ascii?Q?VgcMEBa2rCFg6FQeq1bVrGSeOEtY4vuqPv/9DhmbJ5ACPrGgzbpvdXX/srLV?=
 =?us-ascii?Q?kvp0ba085n7IxjsWV9PIc6E7+6a4A2Viexfdax2b7gifLilBuOMusWrJKhPH?=
 =?us-ascii?Q?Themh4YCWmMRiGbuBL3vLJU+topTCB5gMOFalFQVkuDaXnCk5T4DGZX/s0Bg?=
 =?us-ascii?Q?s3DpYnQcNZe7Crp3Y7tTxGCf2at3oD599L8m5zhMD+5ho9tF0uzIzSF2JhjQ?=
 =?us-ascii?Q?dkD/8PjTeerhrQkFSDfAxgVxNAyfaViQy4m9yuD57owdD/ucOQqf7GtzA0fs?=
 =?us-ascii?Q?WnbcbZR8Jiwh+Efbl8S3T9MQomR3bWMmeHAW5AnLYEEjr+fMKGSbAWNvPlqu?=
 =?us-ascii?Q?gAXFCRCRDx3j9fim7MJ0O+9DwcMMPX29TRTJ7YBH9SpjYVjfYnBI8dLdAaq8?=
 =?us-ascii?Q?kk92gZKMwDsfWOTIdYJftkG+7OnGX4nsJAM28X+Iv0SMsY2peLZbkBmfOrsf?=
 =?us-ascii?Q?IfwNdYOcMmUSVUih+M5Pe6MTC+f3CaRx2cddZRwDEA5ZA8sWQxXGoAHszaeV?=
 =?us-ascii?Q?OHh4VQJCLRkawpJPZ1omCTGlr8h0WI18nj9XZ7YUBqZbGzEpcdXeNQPEDbYh?=
 =?us-ascii?Q?kx0b2WUaZf//bwaQIa7QZFz0+SgqvKRbLMTfRwgct0yowJC+LRZsL2Kd1n7C?=
 =?us-ascii?Q?FjHxZyZgq6c1UoqXMH+J6xaEWT/KZYb8NYDoNi5T7NXUn1INf0cjW8XpXEvm?=
 =?us-ascii?Q?4M0H38hi1uXVUtZO4rxqVJAxRFAiLeq8u11SN9l2KMgQ/64/4DPU3B4gNT9n?=
 =?us-ascii?Q?t60cwZB6RbVs4xoe6pv/11QjC8DERnkwDUz3G8FTpQgteHZmzJuYOObLbAhd?=
 =?us-ascii?Q?tMUK1dOBCwTruuRs9eoDknxYq2bo20AR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/eCOHlYjti1bIu5geJCpd2w26vXr6891l7dMnYE1/ODP6xD0md8+VeO3h2XC?=
 =?us-ascii?Q?CvHnT1W4cRNZF1RUYlFYyFO6PnrUT+Vpyyb8VQabW603sQ2VtRZ2qDdVcxJO?=
 =?us-ascii?Q?FmwyqqIWhhzVG+cEo0eKVg8hX3GMJqLNQbhQL+TgQzWJy9QnVTykU6miCHfx?=
 =?us-ascii?Q?AZPtaKWjBieF67/fUFrQP6Yr+lJoWI1rJy9pGVjDulwVxjkudAsjcEBJC5Pb?=
 =?us-ascii?Q?to4Xh1nrLKvXZ4VIgHzthU0mEmRacdjFqlSdDqY6JStErBaw7MTgUIsSvzut?=
 =?us-ascii?Q?hzUON468m5n1MyIpSODKkXJM35fRoduPmHutWPKQl2qhdbvKvuzw5at1pN6f?=
 =?us-ascii?Q?FZTlxq061FRezqRgsRImksGiWl81XtY6baLOEW+hkID3SGarENnQjU9NtMm3?=
 =?us-ascii?Q?5XaTkAUDF/MvJ8j+GbopbAAP3ravSlPLaoGpezPqb7w1mgJW9FPEWA3ktYHb?=
 =?us-ascii?Q?2W5Tn+7qdlyZKyVmMgpgrQbGGXjNcsG/NuefV8hTjdiWBcxeCLM88h0G9zzR?=
 =?us-ascii?Q?TAsjhGBNzEKXovWwceWsDsWrcj/eiqBJJiSxYfxba+NDd6PHIGTp+q8zSdzB?=
 =?us-ascii?Q?eOgapJZSNl/lcEu2G8CxPufm13WtgWrNwN1kMv4UMBUyUxijgi5GEwZ1Rc4r?=
 =?us-ascii?Q?ySeCuKFe/WO+O3zYkBT1IVefr3tK3FVGJHGgWcU45DKgQ60FmGFhNkau7sqj?=
 =?us-ascii?Q?h4mNyODF2xtfDfjHn9araJ3IJWxJxOX8U8J19oNMZ5yJPY2Tt1HGpf5oFkWp?=
 =?us-ascii?Q?0KbieK39F5qsDxPevlJ34DcSh3SNjnGoid+abhlYyg+Qimm1KVS/9V4wtqZ1?=
 =?us-ascii?Q?++ecnZumicyeGNFg7tS/uc2wGmBctIL0i8MUX5uqbQyMuF17cmfLoAvh/+eV?=
 =?us-ascii?Q?JNamcu2fuQH5eMwJyt0lDSAkBAVPS1ITlRrJuos/i/NfuB7VXmRoi7JRTuo3?=
 =?us-ascii?Q?W1oFNONub0HF65gmeVszcMW1htnr54YU3iZ9pUXaR7XHa5tGwAWqkpY5s0j3?=
 =?us-ascii?Q?zqKMJu75BIkb2T6YliYF0E1XsfBp31O2Np5bPzrcmmpowKbVKQGRfUuad5M1?=
 =?us-ascii?Q?Qbj/TPP6WWXm/wQDUyEGfHM3Pv71Qriod4QuwDmvCfo89WYpD99iHBTGCu+z?=
 =?us-ascii?Q?/BmMynQbeVubr3xSqGqRUfFyGy5W4uWN4z8JX7Orsq5Hz+hgoWuATiw/BG/m?=
 =?us-ascii?Q?bLBJ4XvebGid3S/8PR75IPsKyi4Xcvsw6OP3fSUmmrj7tZia3Ycmf8E3fSXZ?=
 =?us-ascii?Q?LHkSoRlQVg+dCQZ8SlU1bhupuYXFLJt1dOtpui0aKih7RxU91vtDrnkhpObj?=
 =?us-ascii?Q?lUNPg9fAKpqean/7r5TfFm8SE0pyTVz6xLi/mCE8OkEjh1/3PTJ/Y3hgAJxG?=
 =?us-ascii?Q?pnpGrfOjhVhIM7KJI9pKfe+9dawy08dRNxJ3WZI+eBye0Y6kbhh4HprYj/Y/?=
 =?us-ascii?Q?COUKB2b7mMdHFA0r0xEnjUsuInkZvrfZNyywe9+L0NSRioAtA3ZO16N23bKk?=
 =?us-ascii?Q?QVelMXkDk3kPhoE8FbAE+db+drjTD8E/Sn8+KT33x9VGydzd62jCkL1ZBJKe?=
 =?us-ascii?Q?odN9zcHXCOjK7y3+PVCGhOHgZMVyk9VovuRDh7l1bWIhNcJbq8uuVbi/RjI6?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aaa71d-03ad-411d-7ef8-08de04b925f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 09:17:18.8141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZTMSi2MidvTA33/If+DGVSsQg9NljKkakM+g8kbatsj5Qio/AQgaYlNfm/h1KgJ7kKVcsOIBUul6spYQUVEAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
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

On Wed, Oct 01, 2025 at 05:16:19PM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 24-09-2025 02:43, Matthew Brost wrote:
> > Add long-spin-comp-reuse-many-preempt-threads which verifies compressed
> > memory can be used during this test. Useful to test VF migration.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   lib/xe/xe_legacy.c          | 38 +++++++++++++++++++++++++++++--------
> >   tests/intel/xe_exec_reset.c |  8 ++++++++
> >   2 files changed, 38 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> > index cb53a8cfc8..74432a4b3a 100644
> > --- a/lib/xe/xe_legacy.c
> > +++ b/lib/xe/xe_legacy.c
> > @@ -9,9 +9,11 @@
> >   #include "xe/xe_ioctl.h"
> >   #include "xe/xe_legacy.h"
> >   #include "xe/xe_spin.h"
> > +#include "intel_pat.h"
> >   /* Batch buffer element count, in number of dwords(u32) */
> >   #define BATCH_DW_COUNT			16
> > +#define COMPRESSION			(0x1 << 13)
> >   #define SYSTEM				(0x1 << 12)
> >   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> >   #define LONG_SPIN			(0x1 << 8)
> > @@ -72,6 +74,9 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> > +	if (flags & COMPRESSION)
> > +		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
> > +
> >   	if (flags & CLOSE_FD)
> >   		fd = drm_open_driver(DRIVER_XE);
> > @@ -79,11 +84,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	bo_size = sizeof(*data) * (n_execs + extra_execs);
> >   	bo_size = xe_bb_size(fd, bo_size);
> > -	bo = xe_bo_create(fd, vm, bo_size,
> > -			  flags & SYSTEM ?
> > -			  system_memory(fd) :
> > -			  vram_if_possible(fd, eci->gt_id),
> > -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	if (flags & COMPRESSION) {
> > +		bo = xe_bo_create_caching(fd, vm, bo_size,
> > +					  flags & SYSTEM ?
> > +					  system_memory(fd) :
> > +					  vram_if_possible(fd, eci->gt_id),
> > +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> This limits BO creation for VRAM right. So, the compression case will not
> work for IGPU?

DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM gets squashed in
___xe_bo_create if placement is system:

382         /*
383          * In case vram_if_possible returned system_memory,
384          * visible VRAM cannot be requested through flags
385          */
386         if (!vram_selected(fd, placement))
387                 create.flags &= ~DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;

So this test works on dGPU and iGPU. I've verfied this test on BMG /
PTL.

Matt

> -Satya.> +					  DRM_XE_GEM_CPU_CACHING_WC);
> > +	} else {
> > +		bo = xe_bo_create(fd, vm, bo_size,
> > +				  flags & SYSTEM ?
> > +				  system_memory(fd) :
> > +				  vram_if_possible(fd, eci->gt_id),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	}
> >   	data = xe_bo_map(fd, bo, bo_size);
> >   	for (i = 0; i < n_exec_queues; i++) {
> > @@ -94,7 +108,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	sync[0].handle = syncobj_create(fd, 0);
> >   	/* Binding mechanism based on use_capture_mode */
> > -	if (use_capture_mode) {
> > +	if (flags & COMPRESSION) {
> > +		int ret;
> > +
> > +		ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, bo_size,
> > +				   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
> > +				   intel_get_pat_idx_uc_comp(fd), 0);
> > +		igt_assert(!ret);
> > +	} else if (use_capture_mode) {
> >   		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> >   				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
> >   	} else {
> > @@ -141,7 +162,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   		xe_exec(fd, &exec);
> > -		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
> > +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
> > +		    !(flags & COMPRESSION))
> >   			xe_spin_wait_started(&data[i].spin);
> >   	}
> > @@ -202,7 +224,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> >   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > -	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
> > +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
> >   		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
> >   		     i < n_execs + extra_execs; i++)
> >   			igt_assert_eq(data[i].data, 0xc0ffee);
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > index 113ceb2178..f5db1ff8ba 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -123,6 +123,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> >   #define GT1				(0x1 << 10)
> >   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> >   #define SYSTEM				(0x1 << 12)
> > +#define COMPRESSION			(0x1 << 13)
> >   /**
> >    * SUBTEST: %s-cat-error
> > @@ -702,6 +703,9 @@ static void *thread(void *data)
> >    * SUBTEST: long-spin-sys-reuse-many-preempt-threads
> >    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
> >    *
> > + * SUBTEST: long-spin-comp-reuse-many-preempt-threads
> > + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use compressed memory
> > + *
> >    * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
> >    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
> >    *
> > @@ -878,6 +882,10 @@ igt_main
> >   		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
> >   			LONG_SPIN_REUSE_QUEUE);
> > +	igt_subtest("long-spin-comp-reuse-many-preempt-threads")
> > +		threads(fd, 2, 16, COMPRESSION | LONG_SPIN | PREEMPT |
> > +			LONG_SPIN_REUSE_QUEUE);
> > +
> >   	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
> >   		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
> >   			LONG_SPIN_REUSE_QUEUE);
> 
