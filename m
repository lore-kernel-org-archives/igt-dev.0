Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBFBE77173
	for <igt-dev@archiver.kernel.org>; Sat,  7 Dec 2024 00:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470AD10E1FD;
	Sat,  7 Dec 2024 00:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1YqA843";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F018910E1FD
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Dec 2024 00:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733530907; x=1765066907;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cdf6SgJ56bcihZsaTklJIJh941RzQ3bKL5B/sCZ+4qE=;
 b=F1YqA843wm/MefOtzIeUygQJ2ojxRrLGbi7/f1eZllxqVtEl2ufG2Rym
 VwdhpnUFH3NZQg3ooS6aZMLcvoUAT7NVPiTSER//EPRURdEBTodJUNe7G
 GwLeLWEwY8VT2klU8nxmMrFTMckRxFPIeon2r+3LovK3RUZW+NWcb3ZPK
 GMpsnsJOrBqPpLcHg9AVIzSNmbigseB/QSMqp9S+SKw2wWfODs+AYQs3R
 nbD3lPJSTv4uRHfwcjSfE7EuzKRn9tkKcBbQ+9T3+fsZ5yIKkUUnNQQHl
 WsEymyGAVBNNfwP3LtDGJXeteeKqs+VdTlhBmSWDeIEmYJiTfCIuVnrOv g==;
X-CSE-ConnectionGUID: 5ZUMYKzCQV+W2WACyx6GoQ==
X-CSE-MsgGUID: mjhomtH2TbGHGOdySREe1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="37832925"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="37832925"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 16:21:46 -0800
X-CSE-ConnectionGUID: wmd6Wtl2QAqMl4/BMwN0VQ==
X-CSE-MsgGUID: xdCy3m3PTEi2LGcD+2mxtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="117800303"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 16:21:46 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 16:21:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 16:21:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 16:21:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lyfc0Y5V32MBgqo7ePbx1lMKoz2kBiwcjG2eQvz6mJRCsFmVGE94OprcSAkVYBspXrFSY3etCdaQ64RAJMMjo6/oRhKfrnbgRTW6pC9vYdJz58kj/CEaN7jYbU/Vyb9l8jMvikqLiOHTpcgtTdbAn1V0iBzYqu6IEnp/3YemCCZs7v3fjxCeik0+RhqWBfINt5QCVoaYh6ugLRUolFZTIGjdNPKnW8ZXMT8JsXKRq+S2M0d+9GaXXCms97Q2ANqfISQDWGavRoxU6ON6dJPJKLiV6MrfdgbHbFmEJzXIoWX9W5pQcm1WQoqGyK14k4CDS2wWHV0PJY7B0+WgvUuM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p1MshWqVcSY3fF3hggciYzinuRuqZfVWJda/hudTH0=;
 b=ereznPA+ai73OMhMGg73PGsi4a3uikqp1Ns6t03VryQRX48v6eSo0yuTzU8YEaiLX0cRXysDA1vOlHsQjMmbxYnym51+JGUfkfbohOcvfQvyqYDElSczwH9QfoyZZUFKHD+/uDQTbKe5xuIwGfwTR3FeipjiOo40NlCW2udhNrcyB3yu99CokwU73KSmjqFg2b0jIe798JWswfK7x6wHvsYyaJY1avI7lYW5JTH/ocgPCO4i5ggHRzDlKeZGAh5v9CD6gSByQUbawsrnJvvGzZrWKEYiTc2Qbmmmyh+/Zp3PQCvPsCMA9lfkcGsB7r//r+Z8uuxR9QfC6p0qkLQWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Sat, 7 Dec
 2024 00:21:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 00:21:42 +0000
Date: Fri, 6 Dec 2024 16:21:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 7/8] XE3: tests/intel/kms_frontbuffer_tracking:
 fix x-tiled tests for case when there is no x-tile
Message-ID: <20241207002140.GO3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
 <20241206212748.2101217-8-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206212748.2101217-8-clinton.a.taylor@intel.com>
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: ff69f604-2ce9-43aa-e1e3-08dd16552008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UNEwf8sNvC7hKHIAoD5yr93va1oM5NUNpBGBwDqVPNOWxCROHMY9TW3kmG7R?=
 =?us-ascii?Q?XTxIN9b2HR5S+DKCG+CRcJ9ppNXGSMmy1pJZSO/i2X0Y+BaKmSeJrPgctvEH?=
 =?us-ascii?Q?XR9jNjEFKocDnZprUQyLhVu+jrUsifsz1c3vc6Het2y01iTUFZ1+zxYqxgtP?=
 =?us-ascii?Q?Il1J/f0Moiq9pIvPiUZSAl1MPctm0NUbSW0b0ZdQSjlF0hQiMVttjwwMOm8c?=
 =?us-ascii?Q?99HZdTqo4OZd88pC397RWbE3Y069mAAUXOhC8nfyatH7jd9poXMU6uGKvF38?=
 =?us-ascii?Q?yhhuUc+1kHss/uqRq+rmrsZggBY4tc1bPYKMraiwzhv672xBuPXDzzzgD4/q?=
 =?us-ascii?Q?Us1NS8etmSHDqngb+EvgaNIr5VlCZZBGzDOuA2TgAPCabn0eR1pKrP4zKiXy?=
 =?us-ascii?Q?oDovGh2RVwtIFX7bCI5zA3xX9Lc4Dmm1NWOfzwbtiOdFw78YBB7sRi0B6BGQ?=
 =?us-ascii?Q?/sxxEZLgX05EfozVCnCuyYJk3MVYKgmhxp2xYpdHDBUwN+HMpFqIorTJinGu?=
 =?us-ascii?Q?oj97lMNddVrDgwgt91O4c+AqL81EQA3jmwQFpe6kA1uaivAZNdkKhX9c7Bic?=
 =?us-ascii?Q?4x7BArtw6a3aflxH+rrEbj6Y6r6UNtH9e+vpYssRuJccNsYYuuygMo7uoTcQ?=
 =?us-ascii?Q?Mh1K7E/jp/fEn9mORchkuH087DPEsQRrmpwgdtOg+uhisr7aRnzDvLnZfZjD?=
 =?us-ascii?Q?EFdDPbj73r5fW4vJA5cm3XGVr6J4BsIceEZ8Q1TCVtnUEHTEWSIBEPilxZrO?=
 =?us-ascii?Q?z6v+/2YWnPi1oRe2OtCTUhJf4+Yl3NO2eWZXdVpXMTJwEANCLFJ9MhM52p6B?=
 =?us-ascii?Q?ItX4rO8G/HaAHPDMO1OH/bAwrpAcwm3pUeXCsRuapYYOJC8iXyI34P5kYr/4?=
 =?us-ascii?Q?782julCEE5rAIfO4mdX18a7r18zoWC59SAi7bPa1TrlJADUx51X6MvP2FUWb?=
 =?us-ascii?Q?SS3QBJyZth5xpWJRKFdN8bgbrfrIm4USabGcHneYhmL+hRXfE9tQK2aqI6RW?=
 =?us-ascii?Q?t64ebT/7AtfeMCHhOUPpR8MHFz+axyHvBT0n902lBopV6kb/m8Ni47sSFSvM?=
 =?us-ascii?Q?6nXx7Is7jrQgvY6OuZaJHNmnO1nA21NVqo92p07C5VljBHeh2+phTapvxHNu?=
 =?us-ascii?Q?oExKXy1A9netnojN2rZchpzZP/W0crADXLUhKjw2+g3w3WNKENrWmPIPz+i7?=
 =?us-ascii?Q?7B1DaZSIou5KI2pYPjOp2tUkQbfANeI+OE0CCbh6VKsg5heH5hzlz2CnP4mu?=
 =?us-ascii?Q?VQ+dLSUQxN7RoCdtjADyXZPUKS/Tq59WBd+ytRAC619rYAq9pF7aZQQfBCFu?=
 =?us-ascii?Q?z0yklQnrfPtoTtiaWM+Tk0hdQWNsz9DXrYqnT8LreFuO9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iFk3lOex/umJ1uJ+4bbXdhAI/Ow7N89b3XxIhAWwINQL4x8PY6hIN9j7bNa/?=
 =?us-ascii?Q?0Ordo1mVfbQ7ORLpTlRFTF0hh79bfJJ7oeisMNAVgOUZH3t7HwCA5zqDT/57?=
 =?us-ascii?Q?oTAqAoWOQyfeRyD/jGI7Fd+agtgudQZmWKDBzT3rDFpAftiRa0SNw/2BWi5u?=
 =?us-ascii?Q?hWWgfc5tNYZCeOndY98M1rk0pEYLVkJcsuadLFTtFzwUEPQcbbZIN8WJNL06?=
 =?us-ascii?Q?EV7mMVmQlHNIcVG/Fu1wI+y8kf8Ia6wB3gbk0PpEV1NH5gw83323V73HuH3Z?=
 =?us-ascii?Q?k1KwZIXMN4DhrjdsxOAkJkvzFTscnWVi9qur8ofp3P1x9Xh7ozttNSIFoEVJ?=
 =?us-ascii?Q?gjbM2RRrn2ZQxGXIP593O8lHU9TbTbKJ38EyT8+WL/uf3MdFv++zcy1xb0qu?=
 =?us-ascii?Q?cpT/X46qJkrbEMpqGTtkqNA3nEqnA7Ey/jRflpyBNouF5jxcrOWrYCcKYNBH?=
 =?us-ascii?Q?p+3/5sv9DecVjRwCaZorqD/l035s4mn3Jsz9UCsICedqFmmMBYomXpH0gJkY?=
 =?us-ascii?Q?iM0f6wGiA5+2N/QO7V/6KdA/O07vPZU5q4sFeav5dyb5xTEtzzITGiO+hBOP?=
 =?us-ascii?Q?Q8gF908mC6t1au+/7U5Rqk2UFyAkUNQ2Hhgd1OugQSj0luXnHLSzP1CN7AEG?=
 =?us-ascii?Q?GUNPXJu7+gBJP+ojeIAN7niV8DCpACA+cO+nyhjGXOoOVGStmKaCjk+IqTOg?=
 =?us-ascii?Q?KAIDaL4/WyXi6bMB4IPVqqShxjpyepzaB9x7lgbdxd5LedLBMhnO0WJf87lp?=
 =?us-ascii?Q?XBFN3WRtblECvxzSPC8JB+r0ckt1rs2FTlcgDNZCHsRG20nVoawjNWpDehQp?=
 =?us-ascii?Q?ceL7PkfhicErwPlfsTfaLYKwfUie21LHvV8O4knS+cxkCd5KYzBofynku19R?=
 =?us-ascii?Q?FLpggECxLW63r/4xjDcTkmP70ZCq6XTDA7F6OtpP5T9HZzzwFj0IOiErL3fg?=
 =?us-ascii?Q?vTHn/xju4yLaa71fjVCeAAoAfb0MyVoneHIqVftHfxdCyNpX8aWu1MBcJUT0?=
 =?us-ascii?Q?SLXa20YQGM54Wx0kQu3kOhv1E9EWW34XEfucGYZF3GNHDdgQlTs5yG7DQu1c?=
 =?us-ascii?Q?KxiAEnk4ZGzbCMNUPze7V5npNH5nq7wMStdUg2A7iNcm8Z91Ms7tqMisP5wH?=
 =?us-ascii?Q?tNvJn1xhIH2iDGpqCtei7g/fW4ytz9OOb64HZeFfnQt0F7EPfKxz+ucgEW0w?=
 =?us-ascii?Q?LYBuiIUWYarHv8Uxe4ml6Y+Cksuh2/hh3Fr70Gtp8RK351kRxE2Tlsz8JOxb?=
 =?us-ascii?Q?rAYaJHpwGuogKSGVxR9urET+LBWUj2RJJD8oej2/6AZ9aN+ycD5k0F1yYlq3?=
 =?us-ascii?Q?qd3l8vDv6xA6d1bfG2ERRclIF5DRdMw4AuJyLlczzqCRfY/tuVJhy+x7N5dv?=
 =?us-ascii?Q?5Y6QtvAlRTMIvOw5HYatgnl5d+NNzThOP2hOKDYlxChnWnsfXYpISY69voQw?=
 =?us-ascii?Q?41Yt4wtX+U2EaGaz4BDnL1GsEzH99yDpoUNPywz+N2STn46e7dB3cvUopvF6?=
 =?us-ascii?Q?nB2Noc1RsMr1x56bqDyD6fW76BxTVd8elLuIDVt4BqI3gWCw/HJQ+G1M4TUv?=
 =?us-ascii?Q?MlfEHyhUzj1oKA8h0YTMIwKTL73jtJsqj7AAKxszUSkFRgyEHMvCF2ZLYJdk?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff69f604-2ce9-43aa-e1e3-08dd16552008
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 00:21:42.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mL/ToldY/DheEgvxTyjOMfQmW18m1IX47hojT2p1hQXWnzvtSC18dRtna03XBgsn3ysvY+I2taQtxteIxjNtvo63Fu5FMlN0Ll1o7Fqbmew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
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

On Fri, Dec 06, 2024 at 01:27:47PM -0800, Clint Taylor wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> 
> On Xe3 display no more support x-tile and will disable such framebuffers
> 
> v2: Optimize display_ver checks (Sai Teja)
> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e41ee0a80..c5b3fd46f 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2181,7 +2181,12 @@ static void setup_modeset(void)
>  	offscreen_fb.fb = NULL;
>  	offscreen_fb.w = 1024;
>  	offscreen_fb.h = 1024;
> -	create_fbs(FORMAT_DEFAULT, opt.tiling);
> +
> +	/* Xe3 remove x-tile from display + */
> +	if (drm.display_ver < 30)
> +		create_fbs(FORMAT_DEFAULT, opt.tiling);
> +	else
> +		create_fbs(FORMAT_DEFAULT, TILING_4);

We should really try to get away from hardcoding assumptions like this.
Real userspace can't check the display IP version and is expected to use
the information the kernel already advertises.  It would be better if
unspecified/default tiling just walks down a list of modifiers and
uses the IGT helper to check whether the modifier is supported; once it
finds one that's supported it can use that.  Tests that try to
explicitly use a specific tiling should skip if the kernel doesn't list
any modifiers with that tiling.  And things like this where the user can
manually specify a specific tiling format on the command line should
just plain fail if they specify a tiling type that isn't supported (we
shouldn't just silently ignore what they were asking for).

>  }
>  
>  static void teardown_modeset(void)
> @@ -2302,7 +2307,6 @@ static void setup_drrs(void)
>  
>  static void setup_environment(void)
>  {
> -	setup_drm();
>  	setup_modeset();
>  
>  	setup_fbc();
> @@ -3146,6 +3150,7 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
>  	case TILING_LINEAR:
>  		return intel_gen(drm.devid) >= 9;
>  	case TILING_X:
> +		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : true;

I don't think this is necessary.  This function is only used by the
"%s-tiling-%s" subtest, and it's already bailed out if tiling is X-tile
before we call this function.


>  	case TILING_Y:
>  		return true;
>  	case TILING_4:
> @@ -4226,9 +4231,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_output_t *output;
>  
>  	igt_fixture {
> -		setup_environment();
> +		setup_drm();
>  		drm.devid = intel_get_drm_devid(drm.fd);
>  		drm.display_ver = intel_display_ver(drm.devid);
> +		setup_environment();
>  	}
>  
>  	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
> @@ -4537,6 +4543,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  					if (t.tiling == TILING_4)
>  						igt_require(intel_get_device_info(drm.devid)->has_4tile);
>  
> +					/* Xe3 remove x-tile from display + */
> +					if (t.tiling == TILING_X) {
> +						igt_require(drm.display_ver < 30);
> +					}

This function already has a

    if (t.tiling == TILING_X)
            continue;

earlier, so we can never get here with X-tiling.


Matt

> +
>  					if (tiling_is_valid(t.feature, t.tiling))
>  						draw_subtest(&t);
>  					else
> @@ -4568,7 +4579,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	t.format = FORMAT_DEFAULT;
>  	t.flip = FLIP_PAGEFLIP;
>  	t.method = IGT_DRAW_BLT;
> -	t.tiling = opt.tiling;
> +
> +	/* Xe3 remove x-tile from display + */
> +	if (drm.display_ver < 30)
> +		t.tiling = opt.tiling;
> +	else
> +		t.tiling = TILING_4;
> +
>  	igt_subtest("basic") {
>  		if (!is_xe_device(drm.fd))
>  			igt_require_gem(drm.fd);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
