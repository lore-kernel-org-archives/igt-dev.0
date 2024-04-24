Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651A2C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 00:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6CE10EBF3;
	Wed, 24 Apr 2024 00:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Otmn1TLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CCB10EBF3
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 00:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713917078; x=1745453078;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=/ohZUIE39W1ViFv9tfUjnYtThc/mvj8Rc5F9JU5TJS0=;
 b=Otmn1TLVC+VgsvlOssU9zJ9dlTV6f3fIhb6CXQfo5ju1sAjn1rTpxols
 fMX9qNRb82yfbE+ZJHkeyhGtbCFSNafdC1zWeYgGj6SmL1UzgP/nx/ktP
 Cm6dlFBV9jcOJqAG6THMvhJz6mjWxTahDGVckM7CGk4WpdRcfXqVegFso
 G5lCsJ5SQpvbphSn33/h8b8RJs3KhhPoz3mUdrgqVXvTw6fdDXnhdU3N8
 gGo9bw1zODwkCDeNrFiXB2DEoj1uK388a79DDrBuwhBAiCEhveeQFiFNe
 2bGAFN96LQyV5sebqu0RHCdRL2HwGhr4sc7Eg7w5xGpgRbrqrtTkRI6oX w==;
X-CSE-ConnectionGUID: bOG26FPHTxy0U/C3T9ud7A==
X-CSE-MsgGUID: Y6EF5WqcR7aT2kAjEMWpqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9636738"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9636738"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 17:04:37 -0700
X-CSE-ConnectionGUID: OWNsBj/FTm2m0SQjGYsT1g==
X-CSE-MsgGUID: EY4uCk1LR86jCuhNuR98ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="25044161"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 17:04:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 17:04:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 17:04:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 17:04:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 17:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9WpMEzt61+kVOamztbQovJJMWYn7AEMv11R+MlYkQFiY4bpvbSyz7eeG5WAGOiUwM7/yxueJ9AFB3UrfFa+55gqFaJ78optFkGgFfOGq+i4O1WsZEC6/rFtPnreHPakW8JP/nviD3mx5RTxZXIwl587bsBxWEs5uN101UW9bz8Sz0y560kDzpTiaZ7RyRVtqUxdtOBl0uLJjwyisXsRWHMS+KHLufe1M3RUe8dWP5e7JfTOxg6SnU9nnpgiFTLV+lyW3UgkX71gq8Gz3HbsmrE/4eQqvvYjX5kEFArLTbU6zYdcEnQ0m8rCnHwBslDs1cpcAFOskeODUS6PPGiiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ohZUIE39W1ViFv9tfUjnYtThc/mvj8Rc5F9JU5TJS0=;
 b=eLce6oUrxiFXKq9TvYMkYa66SlcEY4OP1OCGUZQYwd5kc2hGzqjJVaQHiRGue5vcsBza4rG8a4qJZJi+giBDizCbsCvOnhfZ2oiP0K+PNVB8pA9/PR/rhdiN2vRf5nChpVPMu16UAXBvTwqkoJYQM6xZDa7w8Vnc7sN4t4YeEcsEMcHHjdea5tCc613g65PZXGBKeXhYUxW2iiO6gyJ2WLUyJIuUJD4sixEzisjN5kkcF5rLSgfwdn/m8ptm63RCgsfYxSMxuZryx2NUGw/XMJ2g7c7WDluCs4YOp9AbzBYyig27aEzk/k+KNNDRMNTlOBcsTOpRecCumk/xxlqfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 00:04:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 00:04:31 +0000
Date: Tue, 23 Apr 2024 19:04:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, Jani
 Nikula <jani.nikula@intel.com>, Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] intel_reg: Move decoding behind an option
Message-ID: <wezp727amvjj7lkom4pxw45lzkjjjva525bgpd3xsspcyqxibq@opzpbbg7nmec>
References: <20240416154338.102157-1-lucas.demarchi@intel.com>
 <20240423194828.mk7gbfe25gmhomcm@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240423194828.mk7gbfe25gmhomcm@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: e5481c52-a880-469b-e792-08dc63f21de9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7grUbVWopv2QVNQ4LYJt69nr+Cn4Yi8LBy3id2hwIyTqTX0+76trOVHmw4iV?=
 =?us-ascii?Q?xQsBnP2JmTALQHur52bnlBX1tXRY3mslOUx/wJYyDf2uh5SHokNIi9wqk/sO?=
 =?us-ascii?Q?88KTI00nrMYI0TeQdNXQQ6dnmA/3BsqoBHLnydxiybhy7RNr2RwjX/oi7U+f?=
 =?us-ascii?Q?5SXfh5Bd5pKJoEGfitHV6dNrJ5anO43QaF0Kvb139fSxoSv0snb1yHRb1A3e?=
 =?us-ascii?Q?xwLQOefCzW0Lcfr/Aj4ML+feZch/DK1HSWDK40KN+2XvLvpOSIN0t2wBsf9b?=
 =?us-ascii?Q?F5KRT00cCoh4C54byJAojK0+5uj2gwte795RNQrP+Gye2fvgjFATIizWCyq3?=
 =?us-ascii?Q?VZqxN0i3cDs1iiIBi52SsVs/n8u6nqeO6+JvfAaAtdpmZu7PX/c3qAlTUpo0?=
 =?us-ascii?Q?hPGK1vWGM1VTZdE4rcKv2WcNn90cfhhiSYby2MYjXxhX4sree6hwFeqWQUV6?=
 =?us-ascii?Q?QufpqVXmc25YaeD3X6xCK3uwR6lSzsHilCDt+sDwxF7EjZp9Wgg1+IITrHoU?=
 =?us-ascii?Q?RBMsJpz5a8RlyqTdyAHOtn2YMgb6zIhRYwSKNlciR6al4iopII/HsumMhmHV?=
 =?us-ascii?Q?E40Syqk2eyLQsDc9zC/O6wogeOnuCPjelxi38qRUr9VHBV6zddIbLFz/oHQK?=
 =?us-ascii?Q?AgJ+kBdsZVITevFoiJd/H0k4eRK6N6I4NGjQwhCSlYgRtRcTvjCEhbcC7Fot?=
 =?us-ascii?Q?VFyR0Y6/qsLVSw2+OkBhfWIRKwOaIKrj6urz0o/NGd6Rc6HQIpVf2kBzjF6b?=
 =?us-ascii?Q?M6Hgw76umLTV/7AuKcNfIeZlUjYlNfLI21BQbl4sVA2IWYrykYysKP+JrQET?=
 =?us-ascii?Q?GdJK54MDaPUc+uQuwy+5Ijw4GtDLxFtBjeqhMddGDmWfP3ekiILJ0XfSuobH?=
 =?us-ascii?Q?u+zf5AsbLtuZmDhsm8ttkYpnGzuOiksps1JLcVQ5U7HPTm5a0jocGRRLEap3?=
 =?us-ascii?Q?flk7Tq5YdwdVlNNFUGgJvjqz9MSgo0KVNl4A4FGTF4b8d4PH2EQaZDNYkOfX?=
 =?us-ascii?Q?d2OuAET5cnwHSfaPrEW8IglL9jn1m2wBc7czUR3naEZyk5O+WpUsuU786YPz?=
 =?us-ascii?Q?V1P1Tg6RDqfrJ0CXiF+8r/uA/pJ5uTShhFAGfiTEx6ay+DN6PfMB/OLGVbnB?=
 =?us-ascii?Q?OgyJwJLuhBmTvZ74q8WhCqq9gK9JbEp3KYxzFAhJK8LgujBfEB8yOS5nHF6p?=
 =?us-ascii?Q?8kz9uTmLiCySJjtqvT+hKJtAvEyTKMrFAWR5RuLyaS/kOSUYhfN3aAK5v+OS?=
 =?us-ascii?Q?O2CFSQbNOdv5G3xj14uyfAJq6MTg+om0ixsUdwlgeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gRWFvWv2QZv1Wl7NgWV1AR32r7KajY6LWfz4aP73iOi2uDsdTkRzjNyz5t1m?=
 =?us-ascii?Q?tTaimTPoKmyUnMh79BzRRIAUwedJU1RqR/KCnwEtOLWLAb4rRkfEcg0R+Stb?=
 =?us-ascii?Q?ed0KnMU1u3C4McRcJXNcUGXACqnvA0ESnW0tbuo8EhUykaVxsekl0sJcG5f6?=
 =?us-ascii?Q?fE4vYXtrnNxWoTXtQ8+mhuWmWwCKTZZiK9u4/FkZnTczQhu6FczZtz3ToE0s?=
 =?us-ascii?Q?QlYHj02H21noYQDlZyJ7AcXTcQ5KyUgGRkaIZB/L5qYHO4AQiAQLw/1pghV5?=
 =?us-ascii?Q?iU/U1QGaw/J0ggdIZDUi/s8S/BYql1DH/5xuAyBJ2cH8nhy30AhZJzQLSYaP?=
 =?us-ascii?Q?jDgGeo3gjq78xJ/jKLYuXzK1yDchYpJiI6PWz0FmZeN8ELZBIRN8MEsF1KOO?=
 =?us-ascii?Q?4xY82NFLlVjJjyiASbyICP3lM6xzT/eH8f3XABt714VunaQBZ0t5HiBH/iPD?=
 =?us-ascii?Q?z3rDRNR5hPDYkPcSUaQVA3qNZmLB+OkqljYnrg0F28scpCh9IuR0fmSETsk3?=
 =?us-ascii?Q?fGpokk9wd2J3ZEvitqrSz19LrqlUO+bVv6HywnNBK4KgmikI/vK8dKvKG9IE?=
 =?us-ascii?Q?Tdo++eCIhwUurQk2JMQzI8W+InLfi0M0J1tgvHetZLCZpnaiC2BGKFGxFbcD?=
 =?us-ascii?Q?2NRLZDUS9qr9a6AYeR7F2QdvXg/sksOdwxiy779ExfgoZe46tzNGRE9Lbq9g?=
 =?us-ascii?Q?SF61Sc4H4W4GFlfkUfNNdslba5WlYg9QfQn/6o69hkpEWwXYMs7DPosoAW/1?=
 =?us-ascii?Q?wyIdhg5aaxSv5MvAqQvM2Ifcs8OPSJufI0s6gaoZFpIcTxDkKNVGMNTwVf1S?=
 =?us-ascii?Q?m7kI4B2smU3zoz0c6zCbzQwUCYLQRelaBW8D3Uqxy/2X7hnl3hMr9O5pxXEm?=
 =?us-ascii?Q?KEvWVhC1Dp49GWffgykVa0qGTbrf3qLH+yAWKNOb4FnD+D75CbFRL83pNNkY?=
 =?us-ascii?Q?KUTZSePfpbrUUA4D5cR34PxiGoOfQnEfzsrbpI5TNVaea8mfTI/1c2jVIRWb?=
 =?us-ascii?Q?lteMzugdZudxhuD3BYbz0PupjxLZB6qinMXnyrXq2Kt1csElPLiyoTlBb1B+?=
 =?us-ascii?Q?WLihQmEiVklC/xZbcVDBSqVPxwuf5mpuo/f3s2krlgx5OgT7SYrhSqvBjwh9?=
 =?us-ascii?Q?K27l2UhkANGqWwxmCV75ZlqI5jnViy0lkavUJUiCc3meQm5klAGWqW75ohrd?=
 =?us-ascii?Q?9qVe/r0RCRTNm62mVE52oFHaNgNt0kJsu3wTG+FTMAfS0c6URsZ0O0+hbPD5?=
 =?us-ascii?Q?UXKo0Fk+kaD/3T1Ad+NnvQI8w5/I0rgQK/ts4R6Q2GnT5GL/5PuTe1D/K6hh?=
 =?us-ascii?Q?sqNNBfW/0VvIZ0AIJBuz2+cdYNbay0oO14Ce9YMaGatpyGaUa5gfCyVX1Utr?=
 =?us-ascii?Q?zoSmY3ju4bNcLhBk9L8zYt69hUN8cwq1Bl3z5pllu50UM+/mzv+je7Djffsr?=
 =?us-ascii?Q?F3v1i730KnRKlWB/IZGHe9/5rhATBoyiLDiPbPwUxyEPLoXLR0RGDT9hgHTw?=
 =?us-ascii?Q?w5PRfgIzcv4ooiEiTEB3CBYoB6Mp7ZeoV/pOsKSrMBWE8/5oVYtLpUId43CH?=
 =?us-ascii?Q?uY+1W2E7/pkoxJYcfEhSc5efsT45urfI8Gw/2iI4sPfhP+Z9i1XjYRjUcxi4?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5481c52-a880-469b-e792-08dc63f21de9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 00:04:31.7383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDA0GbsUfZwoKYME4bhtC/oD+t1gpzIh1FnKRLqeUguy+b+VkrGqTJUXNdTN8iWFqNy3rrfi4zo+Ca4Tt0sFjiF5jBYFY8s1XZK5FAVhURs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
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

On Tue, Apr 23, 2024 at 09:48:28PM GMT, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-04-16 at 10:42:07 -0500, Lucas De Marchi wrote:
>
>small nit, use prefix "tools/" in subject, so instead of
>
>[PATCH] intel_reg: Move decoding behind an option
>
>better:
>[PATCH i-g-t] tools/intel_reg: Move decoding behind an option

I read this too late. Just submitted another patch series touching gputop
without having the dir prefix... `git log -- tools/gputop.c` seems to
agree about not using the tools/ dir although the same for intel_reg.c
it seems we are not really consistent.

As for --subject-prefix: it used to be important when we shared the
same mailing list with i915. This is long gone and there isn't much reason
to keep it anymore (unless when cross posting to other mailing lists).

>
>with that
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

well... It seems I had missed Jani's reply... still a few things to fix.
I will send a v2 later this week. Thanks.

Lucas De Marchi
