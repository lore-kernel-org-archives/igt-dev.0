Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DEBD690FC
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 11:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393DA10E43C;
	Thu, 28 Nov 2024 11:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pdm2XoGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334E810E0B0
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732794067; x=1764330067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PGoPedVu1IyJl2MDJA4P8vfhHklUdcf61YCG+TD4oR8=;
 b=Pdm2XoGg39OKdi1nROlkENePOdMiMBa6IO9+HlFbvDDmUDRAFBEnOaOR
 s59PWFWae90p4G7c7i98Gl/TxBcMzCFlobN2PmM6KFgATpzseb35eJ68R
 qx9msCjH5IJBVuyqsDEYZOOzzfaZ0cpzFxjQUEEtFaIdPN9KJDqtcE6+k
 3AhGZy6ceZVs11RJxooYg9qBY3Sh7OhWM+pLX4LFJQxTs1BNQK6OOCPuS
 AoEMsz3UmC8kXBjPOH83gtJevnM4EzN0sAmUlMrwNfeB3Fsa4nC2PFHFC
 Oh2z01PMz8XHxWTjrhN5ujV+Y8H5/7f/LsIqZrIghKfaGzmIc/zXWItOa g==;
X-CSE-ConnectionGUID: YJDBHGpgQWOV9WeXlyLJeA==
X-CSE-MsgGUID: 62Wip54jRPCiDYmEeZyjKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44082269"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="44082269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 03:41:06 -0800
X-CSE-ConnectionGUID: gsr8Q6aIT/mYRjTn0gNlfQ==
X-CSE-MsgGUID: FZhBpJR0T6ufbI2Efc+r8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="97176852"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 03:41:06 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 03:41:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 03:41:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 03:41:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Usp6Eg9+BVnH7Pzv6Lk/dwzKStRFNV6NRKdbDERX6PYCQLuz2VZK8eCGfZC5C6BNdTVTqGrcVURPVUIoQyKVWUXNezRIjQ+MDze/UpSJMP6RHvXC+R3sDhE+dsP06nO9HMrOHR4/mZpv7GxSQzIhFwDUCB7hQtzMomznfHPnKUAdVEnpHDtPSZNFiKoQpdqmpJLJB7Yvxw6ju5T269lluMGzoBPypzcUXZUD0mzj1NYVjipjUMlwKnLXa6L0iGpPjQ2To2X+d9DQz+E9DTSj/rjUbdJL19EUmYVuv4W/RYlfPhhZWQFml/0KF4DIbzsT9Sug6xqRuXF26hXTzlNwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bO+Lj0mQr6hYlb0MXfNyJss/c0IMzoK2sR/Zo67CByk=;
 b=FshKhRa37khbqJdg3KmELlXgW/HFo5JJk/X3XsdkPlp8NfpHosmzwlaciw8flNNXgBEr52umCp/ERKysKX/dINm/07hg/DLWpJu3E83eGAppAryk1S0yTjwpI4xmKL6lDRi7Bo3EixEOAJHJu3urIoqA7PKaiAzPq8AZxeDgECsMfFxOj6OO9sp7erlgmsRIT5AUFtV5qRM8cNmnsHprPmbPs8O6auOehaJGL3hTibnB9hVTfyWZ+2BFDX/V8U9LWyD/WwF5Ta4FLZSPEo/2zqoy9oaR0KRUNFa0LCUZQPWao0PfFHOubSsiqDmMdAyL3IrVf+9r2VxueA7k257+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 11:41:02 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Thu, 28 Nov 2024
 11:41:02 +0000
Date: Thu, 28 Nov 2024 06:40:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Manage verbosity of GT
 reset fault injection
Message-ID: <Z0hWxERCfBmmFvQy@intel.com>
References: <20241126230240.1780940-1-matthew.d.roper@intel.com>
 <Z0hOiOTWpw61gAZa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z0hOiOTWpw61gAZa@intel.com>
X-ClientProxiedBy: MW3PR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:303:2a::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7caa89-fa55-4dc1-9527-08dd0fa18948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RCP220/5ErL7geyujVuy2Xx8GY6hntWVtjDQ20WAbXQ6u8AGrUZnfRFlWI/J?=
 =?us-ascii?Q?wxzHuCl4imQVeewIcekmAg2V1NBj22lZDbOfi1/V04KFpN8L0IIjCpNmo8gh?=
 =?us-ascii?Q?zczqiRjA+82ugejdscIUx6thPM2eTD2qeUvYCQHL1QGTETYWIjfxeTEc7zYE?=
 =?us-ascii?Q?uczb/y+wlsVVlcK4PwY5UlLJSnWGMG0UwX43Zpyjou4TUcXFATVg6YW5R0qr?=
 =?us-ascii?Q?6Tf/YH0xf24hZaTQkqPFld/Ot+ZasnUdzsVvarAl/yZAEu7JIQrF02KXa/4p?=
 =?us-ascii?Q?Ld8TJN82mIeqAP3eSwH1UygOO23dsWi3V8Ct1sXs+xNbniwqG8rJL+l9B9Q7?=
 =?us-ascii?Q?C/lXkaZ3Rtv8w+CAFbuR1cV3pp3bYXqinrrj10I98QLNP14wVtx8lmG5XFsZ?=
 =?us-ascii?Q?Krlf9v3IoKAjCdZKK29mozWm5aL4ljor2xTB09/mi1s4V1InJWv6BgeLI8k3?=
 =?us-ascii?Q?wt+AQszafp0ggPwz2xJg0OC+6pU6sPlILDbsF0MWM4fqENGqWifzHu2+Paqw?=
 =?us-ascii?Q?ivWlcyA7rzTGnY4wWZOx/K934AB3QxIYVUGNztaU+frxpdpp/x2dyjuKoG6D?=
 =?us-ascii?Q?N67IaHbZZlNYU6LjSoBVtXwTThgb7TrDFu2PPw9sXomWBP7v4p2EbHfPkiaY?=
 =?us-ascii?Q?9aQmP+Npuuoitm0WBOIe6rIewDhb/2oBgeLcVnuLWC3hIL/0OCD4+yU6Ujf2?=
 =?us-ascii?Q?OykAB/1zLdaiT0PWfDChafmehivwR0X03cXy6ih9TGjeIpTZzXIvI4s5mWZx?=
 =?us-ascii?Q?DxPeRe6elpKiVkw7kmqS+g6LYQCOkqcKxr5yGgWc4+tP9IobU0zsiYYdfawz?=
 =?us-ascii?Q?Wwsv+O2X9bFLZ4jBav+cyZXlwX/G5I4poiKmviAwrVGVeqxY1PkW5Jc60TYU?=
 =?us-ascii?Q?DA8qrEu+eZOOzZSlsLKvqEw/mpTqpJU/nSieE2wJaEi0WDS+hQhh3RFLDuaX?=
 =?us-ascii?Q?Gg10NnlGQWkacQ+qdn3d1vn1gY5WZh3PHPOpVb34jRQxCERT4NQXMFrdrZMf?=
 =?us-ascii?Q?CM4HK+JC6KhMleI635gjsGXAdTpXChjOmdoydqNbI/YBv8Zond5szaodVzxQ?=
 =?us-ascii?Q?IBomhunAyL0mLn4LK2IIEq1KuM4vgfVaLrjjQrQea6WclYg+tlkxhotL1e47?=
 =?us-ascii?Q?Q2HqvilyyqxloIKv9hl7hXt+FFOjOE7fuZG4KznxncHC50ePtKFF2OFCfzUk?=
 =?us-ascii?Q?2EGb2+U8hhC2yBj/bYWWriMY8MuJJA1h+9U8ZH6gwxLi7UwxpH0LijlLozRT?=
 =?us-ascii?Q?e7lgdbq6L27lbTE1wLI47EPBlHMOEaUnJvX4UKE7MEg0ZacSJk8lRbgpQVKP?=
 =?us-ascii?Q?7MY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2qZm5PWHfMySjPsnGu3CQkQ0A/AmRkkolZTZAAG4P7H8wgFHKxt4GBLwOkiW?=
 =?us-ascii?Q?a3jW1CyF7RDpnaqkmUbrLzWQXpvW/1Lz1vCFHHgc5k4Ll85ZSgfWcFzGePEo?=
 =?us-ascii?Q?ntBbAMAIlFS8laKTodczEuDGuauC+S59ocjkmeDlLRxU7loqglXYIKQGzOEW?=
 =?us-ascii?Q?SCOM5rAucT7OVzd3UUyV3EVjfP+mnWXfgEK/4aKZuZZEqrBIHZ4Zp9dun2UV?=
 =?us-ascii?Q?OTsK5WbpEzoIrLfTumOenQ1DxPJ1SdRA190JQjvhKqU1iG722tFbZugDKX2o?=
 =?us-ascii?Q?F2V83cePKdT5QX57Z3IXG2OgMrPEBg46pKVKqhMSHUDuUodQP4bOz0umPg4F?=
 =?us-ascii?Q?5UUusuCuEpEJfcXJP3Ej0IOYHS1kDpFSnyIca72nzsfdRG4uKTfh/bxDtqiJ?=
 =?us-ascii?Q?05DnWrsUglphUGH3uHeNcPI/DZOY06usxnnykQf4+qNOMHs7VK/+QXrQw7m7?=
 =?us-ascii?Q?pHPg/Qs+sdrbrUo1CW6gZ9+76kvsC3nbKJSs5l+ASAIoxpQ92ENQguE2AXBd?=
 =?us-ascii?Q?0HyO5vkkTehviE7QK7elgMSw804jl8KRBeRctWvb9HQQJN5BdwbqokzuxtLg?=
 =?us-ascii?Q?xfRiFtjWxT5Z5mRNDUMw9R3UXBEpf5MvAxgSIfhS9NPCWjF8BVlCq3rDgQpG?=
 =?us-ascii?Q?glL/DdIsM0qWAGu/9IYE8UaYufY+gufuq9urm+NRmAu5et6XkBCT7JObAITH?=
 =?us-ascii?Q?t/FGNGtPccUxYq8lfbipz9qbdCh3D71537MfdQ7TPnEDl84mlMpEx99P9PQR?=
 =?us-ascii?Q?GeThkfLHIH1hAcqnflqjHCIWS4QHTAR0d+JDc0A6aPvpB5cw/Dlp9vdeU7y4?=
 =?us-ascii?Q?Ik+SXVNgyU09F6AEHOC56vkzbMIt2Mw5zA2S0x2Sw7yR7C/YuOu6mKsseFhL?=
 =?us-ascii?Q?zWjflZat1F+yg687AHexle0m4PuRvzEBzbYvHs2wi/6MCOKu42ldUA3drNn5?=
 =?us-ascii?Q?+q6pz46LUcH5LHCeIETAGgxm7ZW3JvQtncsNSZiE/qhaAF6h8vE9F4fVi3QS?=
 =?us-ascii?Q?Az4heCmtDLpfISiwoUPdfSLxLHiuIVw2615r4AK/KEV3PMMt0KOGDQ9MlGfi?=
 =?us-ascii?Q?MwG+jVA12Sqe6OOG6TFxFRLyoHeGHihocTnSOvYCmgLgo3wOjl0YmtwlgQS3?=
 =?us-ascii?Q?gTk5zZ9VTgmXokXkKjUaYcA0I66St1w1xAUmSqOJr0nkRVP38o7jchle2ESl?=
 =?us-ascii?Q?k5me5PoaevK18loWeGbQgLghY6OENsoHJvNVkAkxLXBUN4bmb/ImWGCiNSw7?=
 =?us-ascii?Q?42CjL7B43t8rtrPT8uijZkm/F9pEWX4EUtBH1MYW3JxS+MqE+JBO2Xpz1iAd?=
 =?us-ascii?Q?ZOEUpGrBFqCsgeAIfCzb2cS1v/6UnD0xdJqCawI059/ch8dMaTCPRektYeiD?=
 =?us-ascii?Q?JOtE53glZphRq1xWaLGu1MAFqKWo0j4YyOOvidJqFcRKSIvPtk3tug6WUp9p?=
 =?us-ascii?Q?UOxTRvCPjea5MvNOzKCt0uWujplI24m2goMoiEBqWHfna0Um0aacYyTHwXy8?=
 =?us-ascii?Q?vjPrLXaKaI56Uz3l2lb5GTV+KgCI9IogknuGfI8Wl75x+RVZuDQ5KuYGPNP/?=
 =?us-ascii?Q?MO6dM6cf87crl8xEqAfpTjNpX9iv5G+boRTYglzossLlwha1OpjzLcTySPfH?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7caa89-fa55-4dc1-9527-08dd0fa18948
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 11:41:02.6731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Sa2Q3zqVwXsWZUUJrBv77J20K61FKDjXFXPJNkAPNao0fzpTwiLKSml9W7BjR2HAVu/YIHp3BpQANGgQKSrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
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

On Thu, Nov 28, 2024 at 06:05:44AM -0500, Rodrigo Vivi wrote:
> On Tue, Nov 26, 2024 at 03:02:40PM -0800, Matt Roper wrote:
> > igt@xe_wedged@basic-wedged triggers a GT reset and uses fault injection
> > to ensure that the reset artificially fails.  This works as expected,
> > but depending on the value in the fail_gt_reset/verbose debugfs
> > when the test starts, different levels of output may be printed to
> > dmesg.  The test already marks the general "declared wedged" message as
> > expected so that igt_runner won't try to flag those as test errors, but
> > if verbose=2, then the fault injection framework will also issue print
> > dump_stack() output which gets flagged as a problem by igt_runner.
> > 
> > Explicitly set verbose=1 when running the test so that we get the
> > general wedged message and fault injection notification (which we
> > already tell igt_runner to ignore), but skip the unnecessary stack dump
> > that just confuses the runner.
> > 
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  tests/intel/xe_wedged.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > index 88e5d47f2..0db8c8eba 100644
> > --- a/tests/intel/xe_wedged.c
> > +++ b/tests/intel/xe_wedged.c
> > @@ -213,6 +213,7 @@ igt_main
> >  	igt_subtest("basic-wedged") {
> >  		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
> >  					       O_RDWR));
> > +		igt_debugfs_write(fd, "fail_gt_reset/verbose", "1");
> 
> Great finding! I believe this solves some of the cases that Kamil was working to mask.
> But also +Francois because it might have some use on the other fault-inject cases.

I forgot to add the rv-b tag here before hitting enter...

But that bought me some time :)

So, what about using verbose = 0 ? then we even skip the FAULT_INJECTION message
and don't need to filter for that as well, since by the test itself we know that
it is the injection.

But I'm okay on keeping 1 and filtering

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks a lot,
> Rodrigo.
> 
> >  
> >  		igt_assert_eq(simple_ioctl(fd), 0);
> >  		ignore_wedged_in_dmesg();
> > -- 
> > 2.47.0
> > 
