Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AE7C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 20:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814A410E1A3;
	Fri, 21 Jun 2024 20:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4sP1YBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557CD10E1A3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719002461; x=1750538461;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2yaU2nr6e8lRkBCcxPlcoEG2/V0QNZhSjNRe83xPAKs=;
 b=G4sP1YBHD3cMvZJNywP9JqaFkDB6/4qbpDxMZThp5qkQt/gjkuxmtcPW
 X92jxNCvtmkD0qBIJUrqlUVpAKiX0ccPBvJx+jw7q25IHodUwaJApgaQj
 L4JCXG7XBNusEY4Wpvzg8u38IoD8gRGx2d4upQYDd0k11shz1G4U9pmcL
 7mOjFL+MEFwz0tciqCpt6r2kURwi4BWz7rco1CR8mx++CQU+g/cLgmTh7
 LfY49MLjwTzubPjKGTT4p8YYbZARJMgWi/885in2rGNFzj/w8XRcgMypl
 ew3AUQ9r8HAya69TXXw94hwH6Leb099nRSAiqkAyVgL7QJvx9HMi73w9u A==;
X-CSE-ConnectionGUID: wHzzhse0QmKE7KkQKJ/52w==
X-CSE-MsgGUID: 9nEbQuqOTS2YkuegxV6axw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33597903"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="33597903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 13:41:01 -0700
X-CSE-ConnectionGUID: 6ZPj0BZ1Qf60NVzbskZbOg==
X-CSE-MsgGUID: WnbakjqiSYGIZZ4hvGc1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="47640133"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 13:41:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 13:41:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 13:40:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 13:40:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 13:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4UciavCfET/Pp1JxETL1HFEFvAgA7rKFLa9IeDsWwJOTb4wf6/ZKiV3hc/UDEQeqWFlzFP4G/r1UP+f1IHacgc6M6TfbK+E622VfkAekAzQ92hmpomNx+8tGW3zo4wb7gEOLTKP3vyBnMC8+x8VsJTwBA+UtrY598YvFQ81z2AvfITiHX3/2itlaJ5QDhaiwwbaUICIqjTDmGyLxYbWvvMyW5rTMaL9GwHUKPNqHNbZW41oWolc76kzmPJAGPs8AG5XorBwk7rpouX2z70CeljS7gZ+alTkKu2drbuRmwXIKhyM2Q/HQbzchaCjQzy+3zo9x9mSMgcICk56k85PTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF938M5yWk8thDlWMLWG71f5viSRPZMpx1eBdRj7dkg=;
 b=UsUjzsuKXY9Md2Wf9H3xkA397jJk1DxRmFSQbB7F+Fi1mYcNbpPWGX1sfv2o1sTbTBuzEREy0F/VWaZW8ter8FxNTMw6yQ+ipJ11X2+CjfTxHHJMImrzrMj6kA/pycOUSCp5bPIZybVVLp5yd94CGo5nSHX3MAo9zo6tkXfnau3efyW4gpwLUzkh0YeCccwIJXUR0mG+TmArUxQYQlR0CltKoEIpz7WRwHOStW52RSzZNasx6iWrYSz+urZ288ysyHOAAYMp5BHtw0hkR3KaTyf3W+4iH0qs6F3AMQS1h+bcKHW8i9iXjQvReSgCCrhn87MlaL9WBHe1z4hc0owkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33; Fri, 21 Jun
 2024 20:40:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.024; Fri, 21 Jun 2024
 20:40:57 +0000
Date: Fri, 21 Jun 2024 13:40:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pat: account for Wa_16023588340
Message-ID: <20240621204054.GS2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240619143542.110461-1-matthew.auld@intel.com>
 <20240619143542.110461-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619143542.110461-2-matthew.auld@intel.com>
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 38911f2f-ecd3-451f-e3b1-08dc92327416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YYRvnluZS/v/Q1LSRwVIv7uiS2JLiwvQwJ8LqCyptiphUY6zpQjCYnT41L86?=
 =?us-ascii?Q?ettdsQ96JkmfURtbu73KlZ5GBtK98np3EIJBg6wtCkaI2GinixafDY4ELMNh?=
 =?us-ascii?Q?YGNlG8RUwwj/3JAfcajI/oJmy9dtr2B5pcfhSLsQ42sOaNd7Ngd/PYmjkmj3?=
 =?us-ascii?Q?aD39HprNp+qq9n/Y4EsIrUv+a6UrB3mfG1ovX/Pa6MKBKrgVKbY/lkvgB20h?=
 =?us-ascii?Q?oXxR0g0JX12koGLrokAv6eKlc1GFn78dTlDLe2bsoYjN3Z6xzKhYfGG1GTLO?=
 =?us-ascii?Q?amT2fyCDCPUtNO8MaHTL/Wo5viovI0pi/AJqcwG/5gakJDNU4W1JaOv4KEqW?=
 =?us-ascii?Q?SpOwR2yxUUZ87rH2WnF2wk7/uh7fPShfazPohcSCV1qu0+b3FssUWzYJCRHx?=
 =?us-ascii?Q?E2CCkokLPDyRopcOXNxMHflLR/Gfcj6BuYa/N1IKYvqzg1bZcuddnFwkpRL2?=
 =?us-ascii?Q?5+z8uYZLUSzI2uMHdtlu5Lwg3tqvseodrjBbbTLxIPH7rhtfDwkVms29XmG0?=
 =?us-ascii?Q?qjIHoitPcyYnDSIrhiUs7H162TB//nyGvVUp72zRNpxn9vc5aATI72H8Cb2c?=
 =?us-ascii?Q?B6JWPIn+cFvqNA55TVJd2kyw9XOTKx6X+ZdIvjm+RBnVMAyj6JnjlzfCfhxA?=
 =?us-ascii?Q?OGjHvK4ifeLujnu7jrUIXdFiVf45j/ZVMK2vnWuiSPx9hs4yMpemyWtaCUDX?=
 =?us-ascii?Q?74Hx/wOq0MqHY0bn8yVDLnu/ys2cLTqwQLT8ZMiWFD2e7ShjDEaEVOKtEiBf?=
 =?us-ascii?Q?k49gpNZt+ItgEO6sXuSToeIxfPk3Eph5h1TW970aSWpmtk8lZbXsuwz68Ku1?=
 =?us-ascii?Q?0HYGcBNygsLK7skZjmV9B7nXCfOZfm1fA+0Qdsz6y2N6SV2BYJNNKrYrQDlF?=
 =?us-ascii?Q?hipCFiy5cS0vUowxJo9Hp18zsD4BLBP8dRfQ1xuAhu/GpKxgY+AWwQbVbTFU?=
 =?us-ascii?Q?FH91DwheGziWFReneIqbj/vXKOov9qOrrlB7rbGmqr1T5+VXDnoMz+rPV/YX?=
 =?us-ascii?Q?s2nTShgp/rJiqx4PhWn9qIqSYXQwOHZoH5r3u8kgPHi47qRKJMjTsOqvDZw0?=
 =?us-ascii?Q?hyraeuFMxBEfY3zvXlo5MoOBu+/DEwooZymC7EgLUdAYld5pESvbAtkcLgkP?=
 =?us-ascii?Q?9bFp13luJh2B9E9d+5ppvQV2h7AiY8GOxe0BdKAtSFKbO3A6VUCYDH3lfc89?=
 =?us-ascii?Q?oqI8IcCN+tnO8v3g2voOJLgQPK4dikq8ntgLDOQhZSHSWI/Vie4cq5Wxu6Cx?=
 =?us-ascii?Q?qBaE7Po6yIRt5khDrGhxxEG4D5t2TM9eTLwgrkNi24OUcSvjTrpWhEnwD8m9?=
 =?us-ascii?Q?4dFanpOZIutLFsLphBtQv8gJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mNY8f8JYVcKK0/y53/ZrDaJvc8PSHOHg/3m9GjRK/sgqk6eNftZyAAWbH9Mk?=
 =?us-ascii?Q?RVCJnX1xUc2tNT0J5UpR1LG4yyHfCza514gju1hi2xpd/w0fOLryKj38eyuv?=
 =?us-ascii?Q?DRekrkjv4LxKh/OYpMaK4SAyPv/Mpj9DWlirX5w80Mx5EznR4suNFS8/QPGo?=
 =?us-ascii?Q?yLP48xdujtlFr2IipkZwgzk7qqyN1I3cbc0CxUKSUMFXOkvyKOjnw9vjCRoF?=
 =?us-ascii?Q?I0HT7W8V9w92up04J6Bqqvx5tRowww/j4icIBJND4obHsHajNy67VraxDfzg?=
 =?us-ascii?Q?etLLgyG5VC8/Yme7WT9yR+1wuUr2DPez5dIf+skU2Z0520JxSr48p0sfsz2z?=
 =?us-ascii?Q?SxATdstTinlwgvqH7QYNXOOjxBPy6TRC4cHKtHttHnDIoMJV5KzEQ0Zo1eMD?=
 =?us-ascii?Q?Mpgw3OMPlTOPdDlMQoZZoxHscVT5HbEGZMoRFOeYx/uRB4ShBLGrbIoyQkc6?=
 =?us-ascii?Q?WXrOIR0ii7lGu83HH655LEtkeMv9Litamvo2HT93JLUL0XxrXiAGVCNrB3br?=
 =?us-ascii?Q?MIItF/LlywDj89lsWvGyVdiaW8GRXZzUfD3O0H+KCAHx5Porsft/zrP7L9XL?=
 =?us-ascii?Q?vGcGEmJDRUgOiyQHiZ7REANmNIGiHzRMB6J3YOYzqcO82riOEHNR/6eFeNeV?=
 =?us-ascii?Q?jJMwUKFh8gzU+Avws7oQ0v5C8h3sPlfZ0LMGWyZfWyteUssS5ejV4D9Ht9PK?=
 =?us-ascii?Q?+t3cJ84/mt0oDqYh98VLcV/v748YcgE3yUa0hZJCsyoIqlST4nr9o8mU/wiz?=
 =?us-ascii?Q?iI/JcwnCL025RmqAIWM9Ek39Zim+mHPNjmnZ7YWUaupbbpmszxkXDvm23Byh?=
 =?us-ascii?Q?78QP7P7k2ZD0ynY1WiEq1dC1n+XSiwbFIKHGTkv0naMfAWKidZ8NO+C0P9yi?=
 =?us-ascii?Q?M3n3t4sppDGjH1uMlxPaYZelmlBZazDBstlGNLqFhtIQ1I98JXXvM+uGCL/j?=
 =?us-ascii?Q?8lzjmqApXUHkUoamTX75GIA/q1Ggl0o7t0Ev7woUVl/+45SpQ8aQj3tRzsWF?=
 =?us-ascii?Q?oDuLZJKRemmsHH1xa7XhLzBlRBj4sAednVT1dy3vClzB8R2ClQa1c90Pr50L?=
 =?us-ascii?Q?ASB1Ml9Fo1BcHwoTBBgpbCTdu4S8ZdJV8s+1fOMO49CzGQlfXLWpWGkPTlJK?=
 =?us-ascii?Q?g5MLb1KLBeK1B4Zbp9/vAara+7eF4Bl5J0XX0Utctdc0iE+9GppHLeI3UzTJ?=
 =?us-ascii?Q?JlJTWcFq+m2MouHflyqRG7b/y9/fbouWPptZQSKhk27elb0hG032Cw5PwP/t?=
 =?us-ascii?Q?n3nE6u2jkVh49aGLQ0X/j449jgIOgJbABxcB/qVusfmPiFv1Ocg3yCSEfb+U?=
 =?us-ascii?Q?Jq1AMnGr2OeI58h8hakQzhg+iz4eYPZBoR/K2NVy/oiUcqkJ4Bo2bipIyER8?=
 =?us-ascii?Q?40jiP3y32B4sPHfzqeQSOxjXekNNz7RTUd8857MEw7wLaGC964l8h0TTOzOq?=
 =?us-ascii?Q?im+UEDDkDBCaCich76/rWWNNvn2w9e+JCeUsbU2QDtLtMmllw3E5y7i9zxFy?=
 =?us-ascii?Q?ocySqk2odLsIBXOY9bNmHiPPL+AuKjn/gsveBB6ecG7EFnL0qlR5ROvVuDzP?=
 =?us-ascii?Q?66pm5gPGHq3hNOmyhKiHlmoyT7P4ZFZozMGmlWtAIxWNwW2RjNHV0FehfGK9?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38911f2f-ecd3-451f-e3b1-08dc92327416
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 20:40:57.4203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtm1jDnKQvIaKXNyfo4lTH5/jTJaQV/Q8g8zl1wpMaSJWUkAMuc3ctcsqnSmHE9Gg+BKcoXvjCzBkX36ctC0HZxse9Crjfg4D05LtW9vlUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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

On Wed, Jun 19, 2024 at 03:35:42PM +0100, Matthew Auld wrote:
> We can't use the CLOS3 entries on BMG g21.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/intel/xe_pat.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index fe6a367aa..82155f1d5 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -929,6 +929,18 @@ const struct pat_index_entry xe2_pat_index_modes[] = {
>  	{ NULL, 31, false, "c3-2way",     XE_COH_AT_LEAST_1WAY       },
>  };
>  
> +const struct pat_index_entry bmg_g21_pat_index_modes[] = {
> +	XE_COMMON_PAT_INDEX_MODES,
> +
> +	/* Too many, just pick some of the interesting ones */
> +	{ NULL, 1,  false, "1way",        XE_COH_AT_LEAST_1WAY       },
> +	{ NULL, 2,  false, "2way",        XE_COH_AT_LEAST_1WAY       },
> +	{ NULL, 2,  false, "2way-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
> +	{ NULL, 5,  false, "uc-1way",     XE_COH_AT_LEAST_1WAY       },
> +	{ NULL, 12, true,  "uc-comp",     XE_COH_NONE                },
> +	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
> +};
> +
>  /*
>   * Depending on 2M/1G GTT pages we might trigger different PTE layouts for the
>   * PAT bits, so make sure we test with and without huge-pages. Also ensure we
> @@ -1169,8 +1181,13 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  	igt_subtest_with_dynamic("pat-index-xe2") {
>  		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
>  		igt_assert(HAS_FLATCCS(dev_id));
> -		subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
> -						     ARRAY_SIZE(xe2_pat_index_modes));
> +
> +		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> +			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
> +							     ARRAY_SIZE(bmg_g21_pat_index_modes));
> +		else
> +			subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
> +							     ARRAY_SIZE(xe2_pat_index_modes));
>  	}
>  
>  	igt_subtest("display-vs-wb-transient")
> -- 
> 2.45.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
