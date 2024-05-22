Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951F7C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86CA10F5D3;
	Wed, 22 May 2024 14:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq1vQhKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54F10F5CE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716387949; x=1747923949;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GyZ0ggb3Ly7g/tK0fk5IzwVn2KyfDkg0P+/UiNmB2es=;
 b=Bq1vQhKkRxPw/Q5KrRNUY6/7FVyMOMdEQnWjNowHtwL2Qp/13t8UIJIG
 V95wEUsKFufotLwkRUe3u7BsUf8L2swVFtAl94NyA/m1QLBfpxbPyRFOy
 GsMZd4g4d0xhDOBxw6U7dxix011Yqgv5rbuKuZCg2FOfgt3hr3nffYje5
 jQEm3ESBUvxhAWGqLa8Oe9U5iNh4xuIMGuXVBg61q5cU67ULl86mn8hGx
 2IJ1QtVlgZZMOBmcmlWe/CFlcjBJjd/ouPdiSX7e5vwiz7dMRKXl8mrnN
 UEgN8u5DIHzCxPQwV/DVRbXkdirRV13yS1wasg5tX/nZN8f8t8i8NuNQd g==;
X-CSE-ConnectionGUID: E2sxcCBSTpiV9Yql6iFGNQ==
X-CSE-MsgGUID: hCmhjh9fThetAggGvgplCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30175494"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30175494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:25:49 -0700
X-CSE-ConnectionGUID: 6MspbbAoTBqhzJLrvK6dlw==
X-CSE-MsgGUID: SJDDYgEwSPq6oXCEyCF5bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="64146886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 07:25:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:25:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 07:25:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 07:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZElo4YLDjK6Ct2cfzfqvM7rNG6ZC66TRDK5tfAPC1L4gWGIczUO6CJj0yp20v5Ydud0ThKp+y4dFEQZTyKsaWW7HEPpeeyfBU72OQFWCZKDVUXheDC03cELosDhlTyP06ShCKAcSQO4++1MhI/DCGtOye/G0gDkzoect5Aa/uX5VZcoplOO6XfO1fDOUvoh/qXxLFyxv6aszNIS6aSY8MJavVeniKg1SrDT1jVv9JF3XK4xUw+U4+J6hWxkfYL9RsWbwFGqmV1epjEYcEJCzgiXNpVd3T6h+UjCQhQ6S1btJfHd0DAYOzP79tKRKKP1eS7OwkGOoy/YSGvcqzIKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKKXi+vJpPRHdJMCrRzxeUK7tKtlkOI3B3DAfhtzT70=;
 b=WTgESDhKiUs2kEcI6LR3CDjp+oYIAT4DsBRAVhh3YpgvErNQOVLBTzMz2LnhXpBR0UQhYR3tOeSEb/8e5ziqM5/AxLlXH8ke2fRxaHs43JgQ4GNpFbomCxYsgK2vtEiVcgEzhVFI4uQb7pvcecsQ6stPu/kR2FkT+q04fjt1eDexFaDZ5NpPiruFdoSfmeJTO82EN3qYZpVVeCoyN834ygtXeAnhCZOXPq9TrB/r2GAQs6Nll0RbLC4ayaXkOD9WVcCw+0rLnZT0B3dWmHIfUi5gBOi3VwErrilXJ0oYO3v2wzmCP0Kh7aG/A3G0b8H/tRA03AzMu7Yh4LWDRhx6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Wed, 22 May
 2024 14:25:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:25:43 +0000
Date: Wed, 22 May 2024 10:25:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t 1/6] tests/intel/xe_pm: Update runtime pm conditions
Message-ID: <Zk4AY9lcqHTGgd3Y@intel.com>
References: <20240521151640.280354-1-rodrigo.vivi@intel.com>
 <Zk3pPEt99nHKYEk8@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zk3pPEt99nHKYEk8@fdugast-desk>
X-ClientProxiedBy: SJ0PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f6fa79-c360-4703-cf38-08dc7a6b1076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fisvUqWLBqoW2T6bK1arky0YeiVY+zJVPD6ALZg+0h84jmz55TQzt/whH92E?=
 =?us-ascii?Q?EtCmDIogrypxs4Y+kJAlaE7FMS+YI4QCM9ZKyIDNPC/gZzdv1JTewiX50PVh?=
 =?us-ascii?Q?PeLd6PnyCWkUV1vYWBMC+2vRLWo3+ysuXz+yorXm7yrw/xI4jKeEZaPQaxDL?=
 =?us-ascii?Q?lvzNQiZxmwEnsXzW3epNd985zCuA+v7HJRzjFGTbVDlavmyCo1A3vrbP+5v1?=
 =?us-ascii?Q?KmRmzX7iHiHr+rVvHgt0CY7cSzU9Tl/VJcRH7OV/1VyydwctbOKz5ZMW/QIU?=
 =?us-ascii?Q?ca+YKBWNjLQv1WfL57zW//HsvSte/O+Bl6BFEfBMsEztYJlO+AIWp38lCDwV?=
 =?us-ascii?Q?+t0g+LFEYTDrk7GWcCZpbnIcW58lfJFZN40Sm7UHn0KJ55dUzYXWM5RN0i+Y?=
 =?us-ascii?Q?JZyQo6u576ASPdwY0klnCfvEEnEeC8alpCgClcG4cnk2VsgbEYwkSe9LqWDG?=
 =?us-ascii?Q?bXUunZO0nnW8lBnrCY2VLdi45rPHy6b3DZal4O3sr8KQIQ9dAMwBEBry9FLo?=
 =?us-ascii?Q?gnUHbHjJgLFRAqZVYfLMzBdEWHtFv88GYVSR3B/YuKoUCb2ACR4srJrO3Hh5?=
 =?us-ascii?Q?vROozdtgeVhmSh9Fj9sr37VxytI2PdnxQ87HB5TOqTzzXdZon3+7O867Au1L?=
 =?us-ascii?Q?l2N4/s+V3qvfwOgDLWsGghQjlA6Ok+B7UVkE9vjxTAbGk2UdQ/N8MFxfOiCc?=
 =?us-ascii?Q?wFY5u1+n49IxwGFH9cGupyiZwsfmwcpD2CewQmekFRCXWFa89HnuM5t6z2Rp?=
 =?us-ascii?Q?nEDPdFZMxba+yw7TJ6nyh66hbFWMAIENnclgzSI6vxRPBrjzgtL66y/ox8QJ?=
 =?us-ascii?Q?1jHDY83mHOhUGFjARQxmc+xlzdF4v0EsLZVtXGuUNpmz0k3DHiPyFO2Aw0Hm?=
 =?us-ascii?Q?Qge1TZYKtpW7DfNvRfywQNS3JdlAGpuzbIUlEZ13aEm4Ngz/cXF+0yhenRkl?=
 =?us-ascii?Q?DxCGA11m3soQ/UC7S9RKL2fewNUviTglGxLgTU0zQuYRDjV8yANTaEF12F3Z?=
 =?us-ascii?Q?GeqdnGWNqIfkklV32LeztJJ4fdYz05mbCneotpvMlUGYjAck5PvRqw1WiDXv?=
 =?us-ascii?Q?79nSlCy1Ox+YQINASsap8fHRhogXVeFO+jF5Fa40N89qP12gg2y6OMSySNjM?=
 =?us-ascii?Q?dafgTzl/rEEPg/x/gPdqZLLRl5KxMTQdhFObIa2X435Ee+jpsPaJKnDgrM9V?=
 =?us-ascii?Q?cev7B8RP9XG470DjZqRE3jqK83Ym82v4uxv8Ww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g8TfrMa9Ijyy/EOmZ0nVQweUIpIQlfDhivo1tJM0byInm+j956PwuwCo0Vpa?=
 =?us-ascii?Q?bZ+ApOOIj1FuEq4ItkJjDV5Mdw2t1ptWuGmORfquO+hhnBhN8B1P/WFd9mr6?=
 =?us-ascii?Q?szfYiOiVk5pPrzIRY6+eSBjahRREBqpNYo6Kmfz78fTSjp4TO4Kw7fnDCwvX?=
 =?us-ascii?Q?+Fl36Zk1vJuQ9+6JecfRJEivPSC2bBXfnKZJoHqOi28ktsXgu0udfjp7GowG?=
 =?us-ascii?Q?mlqDzZeti8meD/NwmcUidFvEINDhCiybxVxjwORb3TpDvHJ/PGWB2VPLzRSf?=
 =?us-ascii?Q?CeaGWcnVFtGIglzmFShP7xHSWUlhf9BVd3q7sPstlvl0WBqNqVZt5PkXKKIY?=
 =?us-ascii?Q?GRPUKy6Q7U/57VP5aUtxV2raoPWfBayFQH+oFH9hQsZrtgSg1CL9yGHGcpJK?=
 =?us-ascii?Q?w/3+0gh09LFPnesGjNkJ39ILaNCBZ5ycLzfiV6iQDfQMuJATI+3YheHW3cgv?=
 =?us-ascii?Q?mEpXWuxVuQVgtPOSIPGwtu+6Ax6Kl+JCbXBwUC/cAMklmxJHKS83ugIbKVsu?=
 =?us-ascii?Q?tc4eir0NUf3OFJCnZ0EPWhgsHyg3SgWSbGVdoKjh4Z08mfoB1luVZp70zhRl?=
 =?us-ascii?Q?AUg/JcUr75YuKZLP3Ro0pE8ohyVwGAt5JY6sxJKjXkRtukuFUzUku8EQUR28?=
 =?us-ascii?Q?vDkuVkF1Ji8JbOqrQtc5He+ofOb52+T25M6pEZn7dma7BgHTRkDwSnn3saX5?=
 =?us-ascii?Q?RRTh2Ni48759nTQgHVW7y+GA8ILw+lb9DuJsCwGRpvfdTsPf9qoUUoy8mNH5?=
 =?us-ascii?Q?z+ogd+DqcnvgELEFTre9YyhXs0ZrAqHH6zU42O9oVvXCtfQvhG6KVEM6uOuo?=
 =?us-ascii?Q?FnvmChNxfpU5qoBvX8AfL17R6naj0oVBAHhhiivMLSAKUrrxDh8Zx1o7RHO2?=
 =?us-ascii?Q?0exstZzs5XhwE6rpPpOvrffNTB2A06jxO86IqS4uXNhwS5e+/FfCDldv89X8?=
 =?us-ascii?Q?zc5bEZT8tedIGrfRC2GNqhIHM8q+WEsFOw6B7n65isXDt+KO3qe9GcUt0J/a?=
 =?us-ascii?Q?0ZNACAUW77A+naoGW+zy918ryW+g/MPmUgatpG6rNFdsKXxykzE+ZHK6li9z?=
 =?us-ascii?Q?MUwejavHfNoQbu9ltbf3NQXyFUzECD7Ki1bwGXtgyisX9BU9cAShJhSW6YbN?=
 =?us-ascii?Q?CLA/Bv2HniDzdovm3pyGg/5quXNr0+ejQwcQvliL72u9Goediu6J0HBsgyxi?=
 =?us-ascii?Q?d/TGSaNTdsERx36BAg0LeEANwKsjKS/+hkKBmMqz8fn/l/RhAm1g2iExviQj?=
 =?us-ascii?Q?ztMbl7vxmp8GQOb0D5yigYHS0iNqEjz0rs4E4VLD39J7yDSVf34jLVLKefL2?=
 =?us-ascii?Q?3AZtv5SGBDZnos+Aa8slbutsrdAOTxJqb36KUXHWp/rx+h1Sqt0I+B9vBbsv?=
 =?us-ascii?Q?Ls8h9HPG8iJx6rr2z7w+1iHwBKiQBhQCHbzBIvOxKYumm84gTgJ8nXxFzLca?=
 =?us-ascii?Q?+h++uM9UF5N7haytNFSVM+sUXgVvk753ZIv9snHRmP1EPO/R62j4qExjKWMW?=
 =?us-ascii?Q?k3Z2uFeK4vMZtSQXejrRkQJGVXC6I8GmraxRAgNtTwm7kSPI7p5BiXiKIw63?=
 =?us-ascii?Q?y+eyMP7RPpKKTnniod3OeKiIvFMb54XVrccF/TBFnzr1O4/YlRzzHDApPXjT?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f6fa79-c360-4703-cf38-08dc7a6b1076
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:25:43.8289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2dWSi1w9JpVSR9HeUMy9vVdGWEALNJ9rG+NdgzlpXVs+zHtaqKRZgRZkDjZePldiPai218x/Cfu6z2boVKPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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

On Wed, May 22, 2024 at 02:46:52PM +0200, Francois Dugast wrote:
> Hi,
> 
> On Tue, May 21, 2024 at 11:16:35AM -0400, Rodrigo Vivi wrote:
> > Xe is no longer holding a runtime pm reference for the life
> > of a VM or exec_queue.
> > 
> > Also, IGT changes autosuspend time to a minimal time, so we
> > cannot guarantee that rpm is still suspended after the execution
> > has finished.
> > 
> > So, the reference usage is not a reliable reference.
> > 
> > Hence, start using runtime_active_time as the indicator
> > that runtime_pm resumed upon our actions.
> > 
> > v2: Usage of runtime_active_pm and inclusion of mmap tests.
> > v3: Add doc for the exported lib function (Kamil)
> > v4: Use uint64_t for active_time, which is a big number in
> >     miliseconds. (Kamil)
> 
> s/miliseconds/milliseconds/
> 
> > v5: Used PRInt macros instead of %ld (Kamil)
> >     Tell what unit of time is returned. (Kamil)
> 
> It seems that improvements from v3, v4 and v5 would also apply to
> igt_pm_get_runtime_suspended_time().

New patch 6 in this series:
https://lore.kernel.org/all/20240521151640.280354-6-rodrigo.vivi@intel.com

> 
> > 
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  lib/igt_pm.c        | 25 +++++++++++++++
> >  lib/igt_pm.h        |  1 +
> >  tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
> >  3 files changed, 55 insertions(+), 48 deletions(-)
> > 
> > diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> > index fe7692960..baaa6657d 100644
> > --- a/lib/igt_pm.c
> > +++ b/lib/igt_pm.c
> > @@ -1412,6 +1412,31 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
> >  	return -1;
> >  }
> >  
> > +/**
> > + * igt_pm_get_runtime_active_time:
> > + * @pci_dev: PCI device struct
> > + *
> > + * Return: The total time in miliseconds that the device has been active.
> 
> s/miliseconds/milliseconds/
> 
> With that, feel free to keep my RB.

Thank you so much!

> 
> Francois
> 
> > + */
> > +uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
> > +{
> > +	char time_str[64];
> > +	int time_fd;
> > +	uint64_t time;
> > +
> > +	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
> > +	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> > +		igt_assert(sscanf(time_str, "%ld", &time) > 0);
> > +
> > +		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
> > +			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> > +
> > +		return time;
> > +	}
> > +
> > +	return -1;
> > +}
> > +
> >  /**
> >   * igt_pm_get_runtime_usage:
> >   * @pci_dev: pci device
> > diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> > index 91ee05cd1..15e301533 100644
> > --- a/lib/igt_pm.h
> > +++ b/lib/igt_pm.h
> > @@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
> >  bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
> >  bool i915_is_slpc_enabled(int drm_fd);
> >  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> > +uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
> >  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
> >  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> >  
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index b4a8c4d15..d301ad031 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -185,34 +185,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
> >  	return true;
> >  }
> >  
> > -static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
> > -{
> > -	uint16_t val;
> > -
> > -	/* Runtime resume needs to be immediate action without any wait */
> > -	if (runtime_usage_available(device.pci_xe) &&
> > -	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
> > -		return false;
> > -
> > -	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
> > -		return false;
> > -
> > -	switch (state) {
> > -	case IGT_ACPI_D3Hot:
> > -		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
> > -						      &val, 0xd4), 0);
> > -		return (val & 0x3) == 0;
> > -	case IGT_ACPI_D3Cold:
> > -		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
> > -			IGT_ACPI_D0;
> > -	default:
> > -		igt_info("Invalid D3 State\n");
> > -		igt_assert(0);
> > -	}
> > -
> > -	return true;
> > -}
> > -
> >  static void close_fw_handle(int sig)
> >  {
> >  	if (fw_handle < 0)
> > @@ -323,27 +295,28 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  		uint64_t pad;
> >  		uint32_t data;
> >  	} *data;
> > -	int i, b, rpm_usage;
> > +	int i, b;
> > +	uint64_t active_time;
> >  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> >  			  d_state == IGT_ACPI_D3Cold);
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> >  	igt_assert(n_execs > 0);
> >  
> > -	if (check_rpm)
> > +	if (check_rpm) {
> >  		igt_assert(in_d3(device, d_state));
> > +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> > +	}
> >  
> >  	vm = xe_vm_create(device.fd_xe, 0, 0);
> >  
> >  	if (check_rpm)
> > -		igt_assert(out_of_d3(device, d_state));
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = xe_bb_size(device.fd_xe, bo_size);
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> > -
> >  	if (flags & USERPTR) {
> >  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
> >  		memset(data, 0, bo_size);
> > @@ -381,8 +354,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> >  				     bo_size, sync, 1, 0);
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> > +	if (check_rpm) {
> > +		igt_assert(in_d3(device, d_state));
> > +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> > +	}
> >  
> >  	for (i = 0; i < n_execs; i++) {
> >  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > @@ -426,9 +401,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
> >  				NULL));
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> > -
> >  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> >  	if (n_vmas > 1)
> >  		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> > @@ -456,15 +428,13 @@ NULL));
> >  		free(data);
> >  	}
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> > -	if (check_rpm)
> > -		igt_assert(out_of_d3(device, d_state));
> > -
> >  	xe_vm_destroy(device.fd_xe, vm);
> >  
> > -	if (check_rpm)
> > +	if (check_rpm) {
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  		igt_assert(in_d3(device, d_state));
> > +	}
> >  }
> >  
> >  /**
> > @@ -558,10 +528,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> >  	size_t bo_size = 8192;
> >  	uint32_t *map = NULL;
> >  	uint32_t bo;
> > +	uint64_t active_time;
> >  	int i;
> >  
> >  	igt_require_f(placement, "Device doesn't support such memory region\n");
> >  
> > +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> > +
> >  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
> >  
> >  	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
> > @@ -572,7 +546,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> >  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> >  
> >  	igt_assert(fw_handle >= 0);
> > -	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +		   active_time);
> >  
> >  	for (i = 0; i < bo_size / sizeof(*map); i++)
> >  		map[i] = MAGIC_1;
> > @@ -582,22 +557,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> >  
> >  	/* Runtime suspend and validate the pattern and changed the pattern */
> >  	close(fw_handle);
> > +	sleep(1);
> > +
> >  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> >  
> >  	for (i = 0; i < bo_size / sizeof(*map); i++)
> >  		igt_assert(map[i] == MAGIC_1);
> >  
> >  	/* dgfx page-fault on mmaping should wake the gpu */
> >  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> > -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  
> >  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> >  
> >  	for (i = 0; i < bo_size / sizeof(*map); i++)
> >  		map[i] = MAGIC_2;
> >  
> >  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> > -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  
> >  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> >  
> > -- 
> > 2.44.0
> > 
