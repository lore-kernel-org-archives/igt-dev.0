Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363ADC44506
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 17:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC86410E851;
	Wed, 21 Jan 2026 17:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBJdZTHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA6010E851
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769015969; x=1800551969;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LXPH/R4llGegIa4/599JveWMypgQ0tjWdNJnJyOuT1A=;
 b=BBJdZTHmF5I+sUt0YVzCMYqjUEQi49w43l93UL7mBYFMbzLzbXGt2VBa
 9mYllhdI+rf9LL0GqRllxnRycBm16VkWzHhKzO/pSHE60cJkp85g00uWa
 NhCGG374uWiNcYBgZHay8kPsBKeWaZgT7sPKeNAJ2jlgMUjZOcr+YOizx
 pN+AAmqwgrmGqjBSD9mBE7VZ46hsdYuLfGKT8YksKHEwOzz0fy8lmhKUW
 kI45auScQsJ5yDy2Lwr9mr82SHuMPpSNJSFkiPLLu9nHtJ4MSwwmgEDEO
 rf0BfFi+8iRFl7BpPayv2LxeVV6LaG1k49v+BJAAJtrNXy7ER527tEMD1 g==;
X-CSE-ConnectionGUID: Fa8au3SNRX6rxML2MEcD6A==
X-CSE-MsgGUID: LmHN3J5dRrq3dIUxNeXu3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87661287"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87661287"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:19:29 -0800
X-CSE-ConnectionGUID: 3AG2QHuHT+O4nds4iGeTuQ==
X-CSE-MsgGUID: FX4EdOauTHWYs+uMna+z3g==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:19:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 09:19:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 09:19:28 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 09:19:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy6EGM82jxsd/IiXSrWuOoH4VL8BmSo+i1yd8Qb1owvYCspov7fcj5mLndURt20qPk0XJ5yIywU5eYOyfKgbLbpAS5zhQ2F1UM28HxMvACxFpQ0lgwD8X2IaEu4RckGodievXQMNugtw5hmAzYt/Opn4eKzTuHXcycp5GmpKRp2uRpM71LTWmqCUerJdGBW9/K5zPZqHCit40q8dPuFevvjkfH45Z513cd0n3V5wM15rUZcTfJeuqrJkl8yL0v3WmKQva1gl+TL9bZxwylwzgi8XJDyMiQa57S4KpaBuXmiyHr5+8qi437Yz1mAAz+WmQUPJx4jG+heB+yRS4duu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ttiYIj3fYOlLyU3tz/UQqS0bUGQHBU4W3yGI0CIZ/M=;
 b=t/R5nbePAWary0Yrgu7AUpDNw+ma0hFuhiDjeOAwaWHwqOlLVlZ5W46Gv7y8IUXwhqgBtGVaaM3/CcR+PJwnloCBBX0BI93M6WCAqikyOGEq7XsXhAuXD3uprdqOJ5r1e4DNT6gCv2Ac9LFUiOAWrUWPGFHhwHzdeNvHy4MJ0jcq1WD6MCEfae/WVEl+jPQL/lEw3P77CpCePyV/x4uQV/LaF0vixmu6JVEyFTlmQiIuwNb4+21GrBZg85o7QYT3qfLrDOsfX85A7gCFuNa9FpUjjuJmwvrtUhPR+801R3PKCuh866ZcURa3XV4cAnQoM/AH1ni0cL9YkkXKBhdSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PPF58BF5162C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 17:19:21 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 17:19:21 +0000
Date: Wed, 21 Jan 2026 09:19:18 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH v3 6/6] tests/intel/xe_exec_threads: Add multi queue for
 compute mode
Message-ID: <aXEKlisYXez_vEjv@nvishwa1-desk>
References: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
 <20260121114631.277272-7-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260121114631.277272-7-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PPF58BF5162C:EE_
X-MS-Office365-Filtering-Correlation-Id: d44e2280-938d-4234-700c-08de59113794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Kyl5M6MWf1FdbdVxtxLE7QMVK43c5npaxZBs6t1H7ZzVNFXdOXuZfwiuyiI?=
 =?us-ascii?Q?ixemej/utdMXRBGDW+WrJf5A4y6J8Dlxws5g9EPzvrqeaejO3cvdx5pZ2de8?=
 =?us-ascii?Q?J6MtvGZgIQ3EOF6g5W/LyM3I/C3J/o2S7GkZ20Wyrk/baWcmf2S0Z3IwE/Ff?=
 =?us-ascii?Q?ZB3d9jjz6+gwFwS38AQLsKPeBafqofZqQzVdv0tR5fTfjQwwlb7OiF5/9Uil?=
 =?us-ascii?Q?hZp8LZg2jFa00c3Nz2TDDgWSHQK3REgB99kM4Kjo6qGEESJqSw7ErIPtJDht?=
 =?us-ascii?Q?gk4KSTZTwY8o7W4Ls/HDiba28GAZjuFUa3b4xfRMpGCB9kaUFb2Kz2gMoXVh?=
 =?us-ascii?Q?YNw6q7u78vllzjk5fTw4v71P06e5R8xKUkY2KeMUvXtqGRUaK6MaB4WkM3ry?=
 =?us-ascii?Q?h55V8aSkbkyV1QSyWWR7lpLJjpGbzPhywEpea8epqivLx1g/hbchnfLUTc3V?=
 =?us-ascii?Q?PefzaIUGnuD/hisEUAa/fAYvL7w3DFauzWCszPB9aHGTRXsodcohR+Eg/CAr?=
 =?us-ascii?Q?JUk6Jcgx+zBNDxFCJqTWhUzaXlTGy9fIDHa298BO3CbNP5pZZ2hU/SywvNzd?=
 =?us-ascii?Q?QnQUJXyIa2vyC84oumoZmAjWoO0upUr7tg8JJciza2wjPRqNnJXiFOdDXTOH?=
 =?us-ascii?Q?3VylBKJukiArRvgHNDQhUab3YPYV/ktNcZwpPxX6IMV1ZezyTPf+rUzKeVWi?=
 =?us-ascii?Q?NK6kjYVyEqHZAD+JnxvO7owFXTUU3/mv/zVZzKkN2BVQSw2M5lKAtCltzwk6?=
 =?us-ascii?Q?6OxIomWE+jpUe6WRBLmofOjjlizpNYI+yofAsuDWqkEXHn6/dFo7SAXsigGS?=
 =?us-ascii?Q?GillPyl7JKCZaBkNwUrO+t10rSm9E/Ld+jsIGeF647dZlgumUbySTUtNwth+?=
 =?us-ascii?Q?1bd6uGkqzyrpQK2tWajqtJDQwkRhlo/0pnPthsrdidNWbiFHBpjtUlbVWqhZ?=
 =?us-ascii?Q?7eyxIPdbkBqS9a4jg5bPZ6Ml23mOiEriiGb2xwV/Y0zpEMM3zVBOgsvDQDb1?=
 =?us-ascii?Q?Gutgh7ZRB3EtAsTAVXNN6yLsrntYD5gQMgMMuTqWuBAs8sUmT1vz3f0dRz/9?=
 =?us-ascii?Q?28HQketH9UsiUrlGbJmF9ul/VWOvXMgu/B8xsxPv8i0dd/CROr2Y8i2PfEDA?=
 =?us-ascii?Q?g3m76Z0PwD7MsL4lj0lKzm4CfDvH1+wNUhsYMuUmvrcm9yJ4dhIZfjSqt9yL?=
 =?us-ascii?Q?jrPQ7qVyZbqKFdru8d0vfRshEtJr351usYz4LJA5ZXGOm38/q6qVNlYDguLY?=
 =?us-ascii?Q?+VRq0UCJkg7K9aRyOjN2b515VnYWGZDHvx41DojYXmg+o3WM2wv7Yc3j0025?=
 =?us-ascii?Q?6sIkOBtMKG71XsJ6GiO6MvJGxEGiduBcdcVPl453Sx+fYLODZ+Ru/pB1Y/DK?=
 =?us-ascii?Q?/PF5/J6ZP2mxtQp6iRMmEXkAqlX+vNHbp1GxVp9HvCstaXpBQc00l9rf7ZyN?=
 =?us-ascii?Q?sGw1RK1NY9G9oTF9HSFVH6YJBiKQrzsWFi1e6CjeB6V6rdrgq0P7F2ylJOkG?=
 =?us-ascii?Q?FL9LrWb1LpfJohDoduhE2L6npxELn7EXpDsls1TC7aVkd/F5R76Vktj4PrdF?=
 =?us-ascii?Q?LewCNFs+A+cbC/7ngTs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y/vUvnTndijUQg9KCp9FH7N95WPFNSpOeqFLzdN9qwN88Ve1BfkQVLU7wNw6?=
 =?us-ascii?Q?SHe8s6cOUHekVff4KgXWioEksGMlJdEm+u5nBZHUq4tnRCM7hKas93yqvTsK?=
 =?us-ascii?Q?iY0+yF5SnmKF/5cQpcJkB5AaEuzpiZ+rbJgOXnDzY1YdYHf8/s7SfPE6/9g6?=
 =?us-ascii?Q?cAch2b4nB5PU6yepbqBeq2DcT14nIpGL/+8Xu6GcJiRAaXurk/4EdAu21qPq?=
 =?us-ascii?Q?PNQN3o7t2h0tWq6eRrZGWDFPIbzWIrprFzZVLe7+yBND2svs6RKC3KDuBV/a?=
 =?us-ascii?Q?O1BdTjuVbPrru07LCZ/Te0pcOAmP83QUdUwQyVyUXtaMncKJ4YzhbBrG9X65?=
 =?us-ascii?Q?6ZFUGy/ucSYTiCFT0i6MzppYIVUe+tibTMtuJHPSZrKfpGFGB/gJWNkw5fRP?=
 =?us-ascii?Q?oZ10nI1iTAw9cCDPYzsCVUWn5VPN5rkLKr7sgyFbfJYfLkulNFQeiyb7HgXV?=
 =?us-ascii?Q?ccxh/ailJXQ5AdfxawESm/dz7OfMFSlWym5bncXa5yTp9nOIf91r0QSH00t7?=
 =?us-ascii?Q?lMBZICowiU/OWDnyPJFYqG9xqnyFX79QSc1tuHrqo4zvb5WqPGjOQYcAxBAE?=
 =?us-ascii?Q?tfVfKE23b9gQVX5MTO/fzV39GJYMyQxvM0t+gYmVnk8Bb6yqXvzwdnIQTxDm?=
 =?us-ascii?Q?zOghseF+VKenr6vg0Vaqk5RGRfyc2FHwFyxjAY0uYa6I+FxYT/1Q0bdsunIK?=
 =?us-ascii?Q?x1v/tC7m6LH0e+C5/nQjf7KkAML/vhGjbhvhDcMpj6wLo11qcB52/1hQSv0k?=
 =?us-ascii?Q?NAZa4xUm/Zaeny5dzmkJNRBdhmQ2J3SEPnT+qQwRo0qLt+J8T/0HhFc3gaS0?=
 =?us-ascii?Q?DrOt9Ty2c9hRxwXxYvGn/VsxIpAk1cgnxG5ZkEFaAOqoBi6BKt4GBCeNuVVH?=
 =?us-ascii?Q?Br3+G/yHrHH2M19kuQ6mjqJMnVk/Qeu8oZ8Bn0/6nTvMBx6/7CIFRipOKo1a?=
 =?us-ascii?Q?2ycuGuZJQMDn5zylYHm17ayts8mmB97PGAuuz0ZMoiaOGkVtY0Zifl1Oo6do?=
 =?us-ascii?Q?AmEgd+JbWs1I5M7XBFCpwTmnafMweTD1s3r1Xiy59wcQPbr4OIlbk3cksUgG?=
 =?us-ascii?Q?NCULUBnXttREarKuSzIkcspY4b0TNQofMB1N7MjeU4kxJbS1mWeROOTyFpzc?=
 =?us-ascii?Q?YbiDSR5c0PXHcc8pN6pGbhhMMyEeOeMgLKKDw76oVhE5FBusCJ6H1IG4Y1Uh?=
 =?us-ascii?Q?GWIOwZ6/pHaLk+RrSYi2CLWf0PgEGx4HHR8ROZGTkbpMk9e46mBcWFxrfm7E?=
 =?us-ascii?Q?1Y6t40UJq4mfUIdoOGoQ4nDaSkDwmgd4NyBgdCj4K7j6J5ypgwtyqGedwvx0?=
 =?us-ascii?Q?82TMAtBKCD91Gra/ikXxRs7bSbTKrMTXjr5HF4+okWP363Q1b9SIQGDD+BmZ?=
 =?us-ascii?Q?gtyOXkD4tSs+IVDx3Re+fedFx+bd54dkn6kiOzCCW+tf7S5pOtFCUreu8RJo?=
 =?us-ascii?Q?XEQEZSRzk1a6CezF4uLKPLI89tbHS11HrNPKIdP21mS2OiyF4KUDFXg59oXB?=
 =?us-ascii?Q?O6049Ega73J/Ee/Gwls3RXn5fb/BPwjU4023ACp3y4SbWrIJuKQWQFhsDTQa?=
 =?us-ascii?Q?KpmR6ACRWsmYEN2VU11BDUNEEBiDWrzEAQUGTR+u5HWtYRT+OKZbAdzjFRNt?=
 =?us-ascii?Q?rJWdl6wHzE3vq2rx9AfuvtnFpObCTrsJYUQtZTLrXSQsL7lKS4XZJBZJxptP?=
 =?us-ascii?Q?MZaiikeJg0D8MHNknbqmWk1kBLEhLpD4GBWh8VxNBnMSnt0W69rQINUtPIgm?=
 =?us-ascii?Q?i5K1/Vo2GUN35s6K2fWfyv/TIIvCpw2Pb0gVJVH+Y384rFAI8gZQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d44e2280-938d-4234-700c-08de59113794
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:19:21.5949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7haxCH8JP0cR40q8Xj4FOsVZpjAB5Ic0qpo3ont1gvjs66yQuckDEC62rF8iQcCJaSUOf6yu3P7A1diHmPfC/6t5vxC82V3kMBrgzdH+SXFJUihgUxNLb2sG3jM+0JT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF58BF5162C
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

On Wed, Jan 21, 2026 at 05:16:31PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add multi queue tests for compute mode.
>
>v3: Add multi queue related code in the test_compute_code function.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_threads.c | 79 ++++++++++++++++++++++++++++++++++-
> 1 file changed, 77 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 0c14b242a..27d5a8928 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -312,8 +312,21 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	igt_assert(exec_sync != MAP_FAILED);
> 	memset(exec_sync, 0, sync_size);
>
>-	for (i = 0; i < n_exec_queues; i++)
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+	for (i = 0; i < n_exec_queues; i++) {
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
>+	}
>
> 	pthread_barrier_wait(&barrier);
>
>@@ -1074,6 +1087,42 @@ static void *thread(void *data)
>  *	multi-queue-mixed fd userptr invalidate
>  * @multi-queue-mixed-fd-userptr-invalidate-race:
>  *	multi-queue-mixed fd userptr invalidate race
>+ * @multi-queue-cm-basic:
>+ * 	multi-queue cm basic
>+ * @multi-queue-cm-fd-basic:
>+ * 	multi-queue cm fd basic
>+ * @multi-queue-cm-userptr:
>+ *	multi-queue compute mode userptr
>+ * @multi-queue-cm-rebind:
>+ *	multi-queue compute mode rebind
>+ * @multi-queue-cm-userptr-rebind:
>+ *	multi-queue compute mode userptr rebind
>+ * @multi-queue-cm-userptr-invalidate:
>+ *	multi-queue compute mode userptr invalidate
>+ * @multi-queue-cm-userptr-invalidate-race:
>+ *	multi-queue compute mode userptr invalidate race
>+ * @multi-queue-cm-shared-vm-basic:
>+ *	multi-queue compute mode shared vm basic
>+ * @multi-queue-cm-shared-vm-userptr:
>+ *	multi-queue compute mode shared vm userptr
>+ * @multi-queue-cm-shared-vm-rebind:
>+ *	multi-queue compute mode shared vm rebind
>+ * @multi-queue-cm-shared-vm-userptr-rebind:
>+ *	multi-queue compute mode shared vm userptr rebind
>+ * @multi-queue-cm-shared-vm-userptr-invalidate:
>+ *	multi-queue compute mode shared vm userptr invalidate
>+ * @multi-queue-cm-shared-vm-userptr-invalidate-race:
>+ *	multi-queue compute mode shared vm userptr invalidate race
>+ * @multi-queue-cm-fd-userptr:
>+ *	multi-queue compute mode fd userptr
>+ * @multi-queue-cm-fd-rebind:
>+ *	multi-queue compute mode fd rebind
>+ * @multi-queue-cm-fd-userptr-rebind:
>+ *	multi-queue compute mode fd userptr rebind
>+ * @multi-queue-cm-fd-userptr-invalidate:
>+ *	multi-queue compute mode fd userptr invalidate
>+ * @multi-queue-cm-fd-userptr-invalidate-race:
>+ *	multi-queue compute mode fd userptr invalidate race
>  */
>
> static void threads(int fd, int flags)
>@@ -1434,6 +1483,32 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "multi-queue-mixed-fd-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | FD |
> 			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-cm-basic", MULTI_QUEUE | COMPUTE_MODE },
>+		{ "multi-queue-cm-userptr", MULTI_QUEUE | COMPUTE_MODE | USERPTR },
>+		{ "multi-queue-cm-rebind", MULTI_QUEUE | COMPUTE_MODE | REBIND },
>+		{ "multi-queue-cm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | USERPTR | REBIND },
>+		{ "multi-queue-cm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-cm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-cm-shared-vm-basic", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM },
>+		{ "multi-queue-cm-shared-vm-userptr", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | USERPTR },
>+		{ "multi-queue-cm-shared-vm-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | REBIND },
>+		{ "multi-queue-cm-shared-vm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
>+			USERPTR | REBIND },
>+		{ "multi-queue-cm-shared-vm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-cm-shared-vm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE |
>+			SHARED_VM | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-cm-fd-basic", MULTI_QUEUE | COMPUTE_MODE | FD },
>+		{ "multi-queue-cm-fd-userptr", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR },
>+		{ "multi-queue-cm-fd-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | REBIND },
>+		{ "multi-queue-cm-fd-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR |
>+			REBIND },
>+		{ "multi-queue-cm-fd-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | FD |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
>+			USERPTR | INVALIDATE | RACE },
> 		{ NULL },
> 	};
> 	int fd;
>-- 
>2.43.0
>
