Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD6FC7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 21:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1A310E5FD;
	Tue,  1 Jul 2025 21:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrGYhSPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277E510E5FD
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 21:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751407062; x=1782943062;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rzQXedxSsJoYGGkyFkn6R/CXURg5f7Jy008h6dTCjPU=;
 b=XrGYhSPGBkJc97fhmGCvh288xnD6huARYZuUGzfwLwYPUHii2Bd0tGYN
 5Lk1uvNrH3G7LmsRKykxANpzuflmEaMP0VfRRrKvHqLUwIRNdPvAi8bOq
 wuGouWnyyN9gtHAA1H8nHBT16E/Cv5++gjHuzIVw9cWuykRNmhy4tpmaW
 lp+6f/Zntmt4ZS18e3zMWHREsxXKrluUUF/PotwVZ96eFirvMb5FfBnKf
 H9cBuwBJmUrZcB3KwSOsd7HcYZXoz65U7e18EH9u8ptyQv1HOFSTSaDJn
 sAmw6HbNl/ZbeLoCJdiT0oVe8qu4beb4qG8FAcgxGc0AaSo9pKbEMSmel A==;
X-CSE-ConnectionGUID: mQWs3CeIQrq1QtnzEOb3rA==
X-CSE-MsgGUID: bPJKSrtHRyaMyPUilfGysQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53409839"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="53409839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:57:42 -0700
X-CSE-ConnectionGUID: 2mQbio+3QOuOJYgrsV4oig==
X-CSE-MsgGUID: Igai48N7RnGP8JD+1Oh/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="158450339"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:57:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:57:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 14:57:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEQa604na0lJhNxYkrSt/0bSAic632hrw4LdW9ipCa3oEnPWPYv9zCG1FgRUaZjVAcPBgQfB1C6NE1jaE6LxkhA4YL6P1yriNZI2RkM2iTce+mZKGAl85r5fwFR3FjodTKNNejYgwomAy/6zvHd7kGAg7SXb5IhqXKyA67t7nC6P+mrYoi7c2ST9E2fqt+djrIgE1wK0Evi+ErOz56xCTmrwa7FSPtbTgWCxTp/jY3BnRuVaGKE1Ne3kPH6ncEyRP1QfjjgJbhM1zDORi2RvJ6QQ64UgSmYgY3v2czUya9FGUti/GYsB6jTLKZewo8GIrINyPUpQ57mhd6xxTVoC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5am8pM4bFRUy2GmHZUZacFzbqiCT8B89hE48IDdlMQ0=;
 b=qv7Qa7nXZ/cXW/88yvxXFxYpu3Rk0RclreJk0WpUczmPnMCtUWYuQpk6OYJssxff6WtmLLSDZ+o+d6G/1GkvHC+F8WPAxT33rytE1ikuGqZZxYVSIvyoKF4knNX6HQ67PooCGt3dpapeSTubo91RkYvGXC0O7D+j5k9XzsYo0Ox0bYeVNoGfknDdvHbaOCgzBFBFsSXmZLsgT264u/PSXnyIsQTscPVPl3o0Rt7VVGlQ2cr60qOaT+46f7ZbCn4JK2yVbwZq6Smc+UtUmC88GToe0U+uXeyU37FdVfK03WoXLyh6GA+MMhD0wWhdN9CakbscHJunUHG2j1/VcrC37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 21:56:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 21:56:56 +0000
Date: Tue, 1 Jul 2025 14:56:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
CC: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] PVC: tests/intel/xe_multi_tile: Added Multi tile
 verification in available platform
Message-ID: <20250701215653.GD1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250318103740.124966-1-nishit.sharma@intel.com>
 <MW4PR11MB7151AA7B4EED5EA0FB7CB9F9E441A@MW4PR11MB7151.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW4PR11MB7151AA7B4EED5EA0FB7CB9F9E441A@MW4PR11MB7151.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: cd689df3-42e3-436c-0ce4-08ddb8ea3223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/DsonvYIOXICZGdZJL3bdw56Us6tWA8aZeKSAaMYrHFS4wh2KuBCWqJaya?=
 =?iso-8859-1?Q?NWWbif0pcL1WOsUSdRUv3PcVnMe5XLYQaE/H+VpLpMASHt6GYFDvDYMt9o?=
 =?iso-8859-1?Q?pCPqYxDo+nSwoPu8ZSKlJVXYXYovrEP6mHLJ4T9ifQydZpgDvuj5JJncne?=
 =?iso-8859-1?Q?4Sh23cRKaT5KmkQkRF01q4YY/hfoBt5kVoveOtvEd1S02lLOypVEnTwKLi?=
 =?iso-8859-1?Q?7D8mNFqtFb5b03vT+JJCUockjoObv28bmJCdKB/gMrAMkN4hkRG28ZjV9C?=
 =?iso-8859-1?Q?+Tia4qfBZ3y6tMfhfNLbIsLAZg0Ga5ahyBfdNIJUjAOPBjNtavAXb0ZCtd?=
 =?iso-8859-1?Q?hkIfJWAT8j9b1e3UezteFv7eSc1RijWKSdZ1RGyDBQW7M4tz5aFfjW8uGC?=
 =?iso-8859-1?Q?PM9UrENW/wtUL+YyUNVjs3/oBEfm8Y+CliHxWmXmAWTUGQ/NtebKMtoIYx?=
 =?iso-8859-1?Q?40cw9QTif8wJCHVTCVFiuhJJ0Z4JLEkjTXlsrTkjbQeDjcgy49abfqKXGG?=
 =?iso-8859-1?Q?o+V0rhpRFfbD0OY9eX/BBcJPR26lNplu5v30inFviI2oZg6VjBFiVsuZXt?=
 =?iso-8859-1?Q?cCRQiH4zEe+IXDS+EsSxInnGUZFPTh8N+qM/Ha9YRiDXEsThyVWyiwLrcq?=
 =?iso-8859-1?Q?kUApSulJzsLGk8LS4EDp9zmCGPY3cMUHOULRCwTdavcd4JS0a1RLjBofOA?=
 =?iso-8859-1?Q?wwjWLpOd0xMCJFbAycQ0Z+BjGci2eIww1QINpWUgOgMnMPIks9TJALyboM?=
 =?iso-8859-1?Q?+ArLI833mljOgT3adDHt8m6/EY1PB6dqposCFelbYZglu9NvmblZK5vHbn?=
 =?iso-8859-1?Q?EpDa/lhhZTm1Obw4Kcr8K1ItqRVUUkWpL06y6vtMrIieD0RkK7AuLZmSqS?=
 =?iso-8859-1?Q?An5uZOmVwovfei1dBtzLB5NApUoBFhuTfBe25L62jDYhjJomE41cOdXlAT?=
 =?iso-8859-1?Q?LKy7Rj4JkU2HE/PE4QjkvOVVku1+uiQ00HHRgON8ImDjYQfg+IvPnAoNVC?=
 =?iso-8859-1?Q?yck6ABgYtY1/MX/KRV2tj+yyMaA4n/9iXjgpGk+z90BfdmRlfrI6zlQE9Y?=
 =?iso-8859-1?Q?mJHPVVkXq6FeUfFOfmH7jm1DAP9LItj/o/In3nfWFvLg6fUt1ABbo0bKiB?=
 =?iso-8859-1?Q?CG5bvi6ZgwRPCmMvnsUzzlRbC9JTiT5i4RLCVKCX9VJcb3GSu9zHjWZGgd?=
 =?iso-8859-1?Q?Iz2IsJGJllgN13djzZpLyn/g22EIiO0x/gzLVs2pHLVAbNYTt6G74B7V6b?=
 =?iso-8859-1?Q?O1U4HwjqhFRkYrp8ZaRCvN6nTYhYcPR8c58FZYRQB5Dr2kviSIS63epr1H?=
 =?iso-8859-1?Q?k9JcLwV/r2mO+4koBsdslLV1Kwj4O3J7moaEy0verQxxATJC+BNH99Jr+y?=
 =?iso-8859-1?Q?Tn52L7PqS5dRxszuGK1xR0Y/LjX4hLBzpX+FzKQss46y03BmUqbNE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XaeEZlUgj+Ueem0k7eCFHF8lMclz38aGMNgUPfeapLtcqhm5aJGFIEvnOm?=
 =?iso-8859-1?Q?rj8YxjLeHU7V2xEucH9/C/bEfmSFyVo3a+qJwv/eU/Z5ExFM647Tk5y6PW?=
 =?iso-8859-1?Q?v2D/YS2SZNwSXARRDrojk7RF4AeVamMHV588f798LD1l0VLbRNdzysDeth?=
 =?iso-8859-1?Q?idqBYH0l35sJTQgn9UVdvxDpV3guU+X7ihIBr6wty3OwJo+tAcKv+s32DG?=
 =?iso-8859-1?Q?uCivbx68h8xdrXihkQ+GPkcQHxZYeMIMocTtlVj3HEYAkY9wAI/PIm/Zwz?=
 =?iso-8859-1?Q?pyuazUVsOFkmuwXo202amXSqZQcP3xe3p8gOxQzXS4pL43tu8sepFTv5Tc?=
 =?iso-8859-1?Q?/3iM6c9E3KWCpoUGI71gyLNXI9cjoBv9HnwLuU/vpXRbsRk3+Bqpjjo0PW?=
 =?iso-8859-1?Q?B/799Dzg86bRrFb9vEbupo936gflt8bgtwS/VjOnC5BruOhO4ldY6WsGhq?=
 =?iso-8859-1?Q?MPCHSzOiaM+oVYUCwu68ACybQ8nI5duysg9encmHZ69roM+FPXz7abg6my?=
 =?iso-8859-1?Q?TKvEjtsuKXYzLGd4LcCd8QJ6p2lWaXCOpBIL4OFozslaHfcYXCkLGt6Pe5?=
 =?iso-8859-1?Q?kI5FDinhsoC1IOFwH3M0PG+o3GRHYSQVYwVloroFUMNGb2uJXazBcRsMtD?=
 =?iso-8859-1?Q?hRGSf36HsiLRwFyMOAIwHyGkrOMwkKMcKGU1AUzW7oX0dKWBVva5luSHHK?=
 =?iso-8859-1?Q?oNeA6fqpzmD5lrzAA5iPa/a5m+JAHYN/t0OwDgXx0tgb0DidsyxPfgyMEL?=
 =?iso-8859-1?Q?MW2CX3mkiAYB6HRBKTMt2At/OYac/+pduO3DN8+FZCmrU32P0/9xJB9ixj?=
 =?iso-8859-1?Q?umByfBYglaQgCXV+pASi5MZjg9M4eKfUFGu1KVWGvOlOtKoFf4JYed3B0q?=
 =?iso-8859-1?Q?9z7UFvjPBZjThEGf6Xpx9SWtanknNSC/W+CB8FSzuZAQEOsPyMkYM7ASTJ?=
 =?iso-8859-1?Q?+38NGsED3atACnEgGJ4rrtOw7tixYIzS1YfZQQcvNFB7lyBQgUeyTc/0j1?=
 =?iso-8859-1?Q?8UgtjHDuG0IQ1TzDzwe/QBdgfLTHOCfe2bGrPBu1RQubqr0O9VYwI2fAdF?=
 =?iso-8859-1?Q?u2aqHvGJE+WvWkvjd9dGzlb/nra74U4dAiAgN7tvmpLqK5xSycqh54eBcU?=
 =?iso-8859-1?Q?5fC4ZZsNPdt0arMwLvfb21OJAqLFdIN/jLk7ft+ETS+1ViJnqBq8kxDacd?=
 =?iso-8859-1?Q?WjzDsd40eazn0REWJLrefNFbCasxzMu+OsDwdzuQ4QAT0CtjIrRT+spyKv?=
 =?iso-8859-1?Q?R9XBBFs7dWMv6tCapjzsgwCEacP/aNsbnZIq5Oqu2BazE8Xn397T+dxxpX?=
 =?iso-8859-1?Q?uRUmyh9QoVrf67dJ2fqbyYW4DOLaHai4eLgeyZNq2G89NkDNL41lidTLDp?=
 =?iso-8859-1?Q?KuYr0e/tlXt269QLKt8DBlxmjK+b4zW3I0+seDnYmG385qmQNt5G557k9t?=
 =?iso-8859-1?Q?51rOobOSvo/fvv5CjStcJLazY2pPTsS3R8CKMIE61tPJnfynG5EuO85+pw?=
 =?iso-8859-1?Q?UZPFNgBtxxVarvxOrboSH83azocqb4eiUOzPhgkchbv+67IcTh3bb9lLGq?=
 =?iso-8859-1?Q?zK9MgICDfUXJpotyQeO0FrQCbPphi3SyLBlPAFABuRgeA/PRYGa7Wi6WbW?=
 =?iso-8859-1?Q?nJBxCTKLY1BqOWGQ0DmjSo+0oMJQ5irx5+3yDQva4+ohaq0K7sGb3Hhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd689df3-42e3-436c-0ce4-08ddb8ea3223
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:56:56.0746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUtdzP0flVwgYie9IjIRbQznGYJbAZxwN78MQhbV/LrbaA0QFQ1iCD+SoS98GKD+I/Ekk/I0sZgBNiRXXao8D0QS7psUFsb5NMcKPVf4l9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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

On Tue, Jul 01, 2025 at 01:03:09AM -0700, Sharma, Nishit wrote:
> 
> This multi-tile test verifies whether platform supports multi-tile or not. If multi-tile supported then how many gt belongs to single tile%d and type of each gt.

I think I mentioned on a previous review, but the important thing is to
clearly explain what kind of behavior you're trying to verify/test.
Have we encountered a specific bug that we're trying to write a test
case for to ensure we don't reintroduce it in the future?  Or is there
some specific invariant about the uapi that we're trying to guarantee
isn't violated?

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_tile.c | 274 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  2 files changed, 275 insertions(+)
>  create mode 100644 tests/intel/xe_multi_tile.c
> 
> diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c new file mode 100644 index 000000000..d302dce28
> --- /dev/null
> +++ b/tests/intel/xe_multi_tile.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + * Authors:
> + *      Nishit Sharma <nishit.sharma@intel.com>
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Test to verify if multi-tile support available in platform
> + * Category: Core
> + * Mega feature: General Core features
> + * Functionality: Tile/GT operations
> + */
> +
> +/**
> + * SUBTEST: multi-tile-info
> + * Description: Test gathers Tile_ID/s, GT_ID/s, GT Type info
> + * Test category: functionality test
> + *
> + */
> +
> +/**
> + * struct xe_gt_info - Holds ID and Type info for GT
> + * This structure required to check gt_id belongs to specific
> + * tile%d and gt_type which should differ for each gt
> + * Can be optimized in future
> + */
> +struct xe_gt_info {
> +	/* GT ID */
> +	int gt_id;
> +
> +	/* GT Type */
> +	int gt_type;
> +};
> +
> +/**
> + * struct xe_tile - Holds gt_count and gt_info per tile%d
> + * This structure required to store tile%d related info like
> + * number of gt/s belongs to single tile
> + * Can be optimized in future
> + */
> +struct xe_tile {
> +#define XE_MAX_TILES_PER_DEVICE	2
> +#define XE_MAX_GT_PER_DEVICE	4

It would be best if we not hardcode things like this inside IGT since it
will just lead to problems down the road.  Part of the point of the
xe_query interface is that we can support any number of tiles and GTs
and userspace (including IGT) shouldn't need to make assumptions like
this.

Also note that the XE_MAX_GT_PER_DEVICE value isn't correct for any
platforms we have today.  We only have:
 - single-tile, single GT platforms:  1 primary GT
 - multi-tile, single GT per tile:    2 primary GTs
 - single-tile, multi-tile platforms: 1 primary GT, 1 media GT

It seems likely that we probably will have multi-tile + multi-GT
platforms at some point in the future, but no such platform exists yet.
And even if/when those platforms do show up, there's no guarantee that
the "4" here will be accurate; we could wind up more than two tiles, or
more than two GT types on those platforms.

There's a lot of other refactoring going on in both the kernel and IGT
right now to break assumptions like this, so we should avoid adding new
ones here.  The xe_query interface can give us a GT list of potentially
any size if that's what the hardware supports (e.g., 6 tiles and 5 GTs
per tile for some hypothetical future platform) and userspace like IGT
should be able to just walk through that list and not make assumptions
about the upper limits.

> +
> +	/* GT count */
> +	int gt_count;
> +
> +	/* GT info */
> +	struct xe_gt_info gt_info[XE_MAX_GT_PER_DEVICE]; 
> +}tile[XE_MAX_TILES_PER_DEVICE];
> +
> +/*
> + * Get gt_list using XE_DEVICE_QUERY UAPI returned by Driver
> + * gt_list holds tile ID/s, gt ID/s, type and other information
> + *
> + */
> +static struct drm_xe_query_gt_list *xe_query_gt_list(int fd) {
> +	struct drm_xe_query_gt_list *gt_list;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert_neq(query.size, 0);
> +
> +	gt_list = malloc(query.size);
> +	igt_assert(gt_list);
> +
> +	query.data = to_user_pointer(gt_list);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	return gt_list;
> +}

Do we really need this function?  IGT already queries all of this
information during xe_device_get() and stores it into xe_dev->gt_list.
I don't see a specific need for a redundant copy of the information that
IGT is already fetching automatically.

> +
> +/*
> + * Dipslay gt_list information to user
> + * gt_list holds tile ID/s, gt ID/s, type and other information
> + *
> + */
> +static void
> +xe_show_gt_info(int fd, struct drm_xe_query_gt_list *gt_list) {
> +	uint16_t dev_id;
> +	dev_id = intel_get_drm_devid(fd);
> +	igt_assert(gt_list);
> +
> +	igt_info("Displaying GT Info\n");
> +	for (int i = 0; i < gt_list->num_gt; i++) {
> +		int verx100 = 100 * gt_list->gt_list[i].ip_ver_major +
> +			gt_list->gt_list[i].ip_ver_minor;
> +
> +		igt_info("type: %d\n", gt_list->gt_list[i].type);
> +		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
> +		igt_info("IP version: %d.%02d, stepping %d\n",
> +				gt_list->gt_list[i].ip_ver_major,
> +				gt_list->gt_list[i].ip_ver_minor,
> +				gt_list->gt_list[i].ip_ver_rev);
> +		igt_info("reference_clock: %u\n", gt_list->gt_list[i].reference_clock);
> +		igt_info("near_mem_regions: 0x%016llx\n",
> +				gt_list->gt_list[i].near_mem_regions);
> +		igt_info("far_mem_regions: 0x%016llx\n",
> +				gt_list->gt_list[i].far_mem_regions);
> +		igt_info("type of gt: %d\n",
> +				gt_list->gt_list[i].type);
> +		igt_info("tile_id: %d\n",
> +				gt_list->gt_list[i].tile_id);

I think I mentioned in a previous review, but IGT tests are generally
intended to be executed by automated CI systems and such, so we don't
really want a bunch of output look this.  It would be better to have a
separate program in the tools/ directory that displays information about
the device in a human-readable manner.  It's okay to have a little bit
of debug output if it will help debug failures in the test, but in this
case you're dumping a bunch of information that isn't actually used by
the test, so that's not helpful.

> +
> +		/* Sanity check IP version. */
> +		if (verx100) {
> +			/*
> +			 * First GMD_ID platforms had graphics 12.70 and media
> +			 * 13.00 so we should never see non-zero values lower
> +			 * than those.
> +			 */
> +			if (gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
> +				igt_assert_lte(1300, verx100);
> +			else
> +				igt_assert_lte(1270, verx100);
> +
> +			/*
> +			 * Aside from MTL/ARL and media on BMG, all version
> +			 * numbers should be 20.00 or higher.
> +			 */
> +			if (IS_METEORLAKE(dev_id))
> +				continue;
> +			if (gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA &&
> +					IS_BATTLEMAGE(dev_id))
> +				continue;
> +
> +			igt_assert_lte(20, gt_list->gt_list[i].ip_ver_major);
> +		}

This seems to be a copy-paste from the xe_query gt-list subtest.  Since
these checks are already been handled by that test, we don't really want
to duplicate it here.  If this is xe_multi_tile, then this test is
expected to be testing something specific to multi-tile platforms, not
general logic that applies to all platforms.

> +	}
> +}
> +
> +/*
> + * To check whether tiles are in order or not or if any tile order is
> + * skipped/missing as returned through UAPI
> + * Function returns 0 if all tiles in order or sequenctial otherwise
> + * returns 1
> + */
> +static uint8_t
> +xe_check_tile_order(int fd, struct drm_xe_query_gt_list *gt_list) {

Do we actually guarantee any specific _order_ of the GTs returned by the
query interface today?  In practice, we'll return all the GTs for tile
0, then tile 1, etc., but I don't think there's any mandate that we have
to continue to do that on future platforms.

There's probably an expectation that tile IDs don't have holes in them
(although GT IDs might), but the GTs returned by the GT list query don't
have to be ordered according to their tile.


> +	int prev_tile = -1, tile_id;
> +	uint8_t tile_mis_count = -1;
> +
> +	igt_info("Verifying tile order/sequence available in platform\n");
> +	for(int index = 0; index < gt_list->num_gt; index++) {
> +		tile_id = gt_list->gt_list[index].tile_id;
> +		if(prev_tile != tile_id)
> +		{
> +			if(++tile_mis_count != tile_id) {
> +				return 1;
> +			}
> +			prev_tile = tile_id;
> +		}
> +	}
> +
> +	igt_info("Tiles available in platform are in order/sequential\n");
> +	return 0;
> +}
> +
> +/*
> + * To get tile count. UAPI returns tile ID based on GT ID
> + * tile count is calculated and rturned for further processing  */ 
> +static int xe_get_tile_count(int fd, struct drm_xe_query_gt_list 
> +*gt_list) {

It doesn't seem like anything in this test actually cares about the
exact tile count, only that there's more than one tile.  So this could
be replaced with a simpler function along the lines of

        bool is_multitile(int fd) {
                int gt_id;

                xe_for_each_gt(fd, gt_id)
                        if (xe_dev->gt_list->gt_list[gt_id].tile_id > 0)
                                return true;

                return false;
        }

Note that the specifics of that loop will change a bit if the
refactoring series at https://patchwork.freedesktop.org/series/150975/
lands (we won't want to be doing a direct lookup of the gt_id in the
gt_list at that point).


> +	int prev_tile = -1, tile_id, tile_index = 0;
> +	int tile_count = 0;
> +
> +	for(int index = 0; index < gt_list->num_gt; index++) {
> +		tile_id = gt_list->gt_list[index].tile_id;
> +		if(prev_tile != tile_id)
> +		{
> +			prev_tile = tile_id;
> +			tile[tile_id].gt_count++;
> +			tile[tile_id].gt_info[index].gt_id = index;
> +			tile[tile_id].gt_info[index].gt_type = gt_list->gt_list[index].type;
> +			tile_count++;
> +			tile_index = tile_id;
> +		}
> +		else
> +		{
> +			tile[tile_index].gt_count++;
> +			tile[tile_index].gt_info[index].gt_id = index;
> +			tile[tile_index].gt_info[index].gt_type = gt_list->gt_list[index].type;
> +		}
> +	}
> +
> +	tile_index = 0;
> +	tile_id = 0;
> +
> +	return tile_count;
> +}
> +
> +/*
> + * To check gt type. UAPI returns gt type based on gt ID
> + * The gt/s belonging to same tile%d must have dfferent types
> + * If found same gt/s within tile%d program will halt  */ static void 
> +xe_check_gt_type(int fd, struct drm_xe_query_gt_list *gt_list,
> +		 int num_tiles)
> +{
> +	igt_info("Verifying gt type belongs to each tile in platform\n");

This explanation doesn't seem to match what the test below is doing.
But we also don't need these igt_info() lines at all, so we can probably
just drop it.

> +
> +	for(int tile_num = 0; tile_num < num_tiles; tile_num++) {
> +		for(int gt_num = 0; gt_num < tile[tile_num].gt_count - 1; gt_num++) {
> +			igt_assert_neq(tile[tile_num].gt_info[gt_num].gt_type,
> +					tile[tile_num].gt_info[gt_num + 1].gt_type);
> +		}
> +	}
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	struct drm_xe_query_gt_list *gt_list;
> +	struct xe_device *xe_dev;
> +	int num_tiles = 0;
> +
> +	gt_list = malloc(sizeof(*gt_list));
> +	igt_assert(gt_list);
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_dev = xe_device_get(fd);
> +	}
> +
> +	igt_subtest("multi-tile-info") {
> +		/** get gt information from driver **/
> +		gt_list = xe_query_gt_list(fd);
> +		igt_assert(gt_list);

As noted above, we already have a copy of the GT list stashed in
xe_dev->gt_list thanks to the xe_device_get() call above.  There doesn't
seem to be a benefit to doing a redundant query and storing a parallel
copy.

> +
> +		/** display gt info to user **/	
> +		xe_show_gt_info(fd, gt_list);

We don't need to be display information to the user in a test.  That's
something that belongs in a tool instead.

> +
> +		/** check platform has multi tile **/
> +		num_tiles = xe_get_tile_count(fd, gt_list);
> +		igt_assert_f(num_tiles > 1, "Tiles available %d Multi-Tile not supported.\n",
> +				num_tiles);

We don't expect all platforms to support multi-tile, so this assertion
is going to cause a bunch of failures (it will fail on anything that
isn't PVC today).  If the subsequent tests are things that truly rely on
multi-tile platforms, then this should be an igt_require() or
igt_skip_on() so that the test just skips if you run it on a platform
that it isn't relevant for.

> +
> +		/** check tile order **/
> +		igt_assert_eq(xe_check_tile_order(fd, gt_list), 0);
> +
> +		/** check type of gt in tile%d **/
> +		xe_check_gt_type(fd, gt_list, num_tiles);

The actual checks here are what we'd generally turn into individual
subtests.  Although it's still a bit unclear whether these need to live
in a test by themselves, or whether we could have just added these
somewhere like xe_query where we're already doing sanity checks of the
information returned by the GT list query.


Matt

> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build index 2f5406523..cdc68498d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -328,6 +328,7 @@ intel_xe_progs = [
>  	'xe_sysfs_scheduler',
>          'xe_sysfs_timeslice_duration',
>          'xe_tlb',
> +        'xe_multi_tile',
>  ]
>  
>  intel_xe_eudebug_progs = [
> --
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
