Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404C3C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89710E361;
	Tue, 27 Aug 2024 15:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akGDsfE3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E3B10E360
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724774052; x=1756310052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WxCAo5CJHcxcm6ahDQAGOyRm9HSyc+SoTFm+y8pzjbM=;
 b=akGDsfE3orSXgEnXAVC+B2o+opk3p1Kdzn47KObH39anZjIWSqvIx5g1
 l/Xu4M5TMgc7vGN3rbcgK+462AOPEYNg8HxvWowrmhsxDiy+KUveVU/Nx
 M+BYoQ4oKxviiR3DpTUzOqWFpuFF77fywaKYWUbL7/OUJ1zTEjiadHE0e
 S1Wy0WyOrIXYEn1oY/YCvf4KxyBgOvIUeG2sytxGWftxD0APGCL6mlfRH
 8XhXQMb64LvO0PIFlNyaWKDjuWEaaTxw4NVGhNsCa1+zC8gjXppO0+WKP
 +YJ7YsP/mtF8FxQdhYI9ngAJR8GwvA+QE1TV9A2hOt0TLqxd/e9jP9XX0 w==;
X-CSE-ConnectionGUID: DPJ4vmyPSVG6suc8q3wlHw==
X-CSE-MsgGUID: JaOfAAOhR5O85/XDaPEvNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23064067"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23064067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:54:11 -0700
X-CSE-ConnectionGUID: oKpUrxskSfSBsv9LIMtVMQ==
X-CSE-MsgGUID: LQCDXlD9SmCqf4qrlUP8mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63411019"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 08:54:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 08:54:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 08:54:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 08:54:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 08:54:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTH6vlehNWLTE5JAlQ6O2CLeD+JXshaWau9kuJdakB79IzJtqq7Z/C61nDTPQ3grqrzRNycHpXicu2ADle8dBfZz9X4bmUqdT00rBJh8rqmeerNEPWCuAISZjXCaatjFNgd2t59/l336507RKmrAg0NlraUrDcPmMfwNlfHBScI40TU9tIo4VYxTRusgpfHWNLf6duzBi2i+3QXYmABjCrK3L8BRTcJhn1RC5ONEqQoU1Ah1b56/6Lu1tiT1COhXhKdcpCnvQe7GJ3ncwGVkE0y3eORFTucf3kNEJnyh55qGtYrxTCn9qPa8spHutId9Y760yvqkEhJhsLa3m2WC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJMBMC3ZWwsvtb8L8cj2zv+/nHGp8Js03coWVp6aT5A=;
 b=C1x+Pw8rPQ1qmHhYfu8rHB7kzDflG/lbX7jgHeFAFf+TIcxDVxkB0EXZ2LJqUyexqNdotzUNkDXv9qpqOobWFeymtPfYvhiMeCFMl2p/Rnxb4qFAjiB7DRS4XEchoBeJ9JDq6b3tY9P+ZawuQCPEHhXnsiqVpgG12ie4I2IyRSIF8eelYPpcDo9ZrZNiYWkKeYk1kzXSDTCuY1KI0VumMi0x3hv3VWsyiRPNArNXkox14GZrO4byGF0mwjQ4dYqj4UCGLkndI2RkREifj+QEFsGrrVe6IDcV9LCDlc4VgGIAsQ/87+bcviZQGT/gosbmprLdgUDCvonFQgstVneRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Tue, 27 Aug
 2024 15:53:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 27 Aug 2024
 15:53:34 +0000
Date: Tue, 27 Aug 2024 15:52:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Don't return early
Message-ID: <Zs32L7Y9GePDfXUg@DUT025-TGLU.fm.intel.com>
References: <20240827105222.13650-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240827105222.13650-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 25108468-0250-4bae-4a9b-08dcc6b06838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DyAa2smKraGtH91n3nEbYydvXKkzZlo0HD5dCEzi4uMSRQeGn640HIo9G8mu?=
 =?us-ascii?Q?bpoh8INjLH5Td6+c4gWosyM6KO8CKv9h4Rsns8uLcf65kqDi/ncy3xHIrMA2?=
 =?us-ascii?Q?rAceFf4l3/yAgI1lu8BuWej932ahk65Ya4BOYmr4fai7Qku7jCOHFnLeI94f?=
 =?us-ascii?Q?7yWM0bQ8+vPWvfXcWAKgWWuJlt1tOmUZFUfwA49w3cjLRYsF8ANm/r/lAPSJ?=
 =?us-ascii?Q?JKi1XTJEWJYB5lpNMtLVOA8UEm9LCkdCTBhX0T9giJa+M9V6eUIH9fUvhF2u?=
 =?us-ascii?Q?2TJDfR8213OoKm7qK+Ogk9gKEli0/APSMZ1m94uBA+NzaMUQQ9L88k9U3OHJ?=
 =?us-ascii?Q?qixHkisolJ59HRHbGvheqnGLv4wqIQvn6FPWHyRqFhhwSvPngo5bWD2UUQ4l?=
 =?us-ascii?Q?hw2IwZRi7OWSN4Y5ZsXo4PV40pWFqLzEfJOGQBAMP2ezvKwHMLnzN1DaxpQp?=
 =?us-ascii?Q?zPKuDKqfwOI9JgIamPYw9pYp6vntDHVjSIkgF8n0ViLj4xdF3L/vJg5hJtJC?=
 =?us-ascii?Q?O6kVCiCMNM1uWCmIb2G8d2CtfmEYBxTf9dJdHq9G4RzudXrr2zkmW71FadTJ?=
 =?us-ascii?Q?bB96LHugh2S4hIkOJiQBWEWeNYswFpqDbld5E2fvwHR2oKtjSyZ5KlxSoFf7?=
 =?us-ascii?Q?4s+c9xwN86+YW+dVMLewdUrPc3r492XOvIdmfzbJtkdRXBZAcUy6Oo25uLe8?=
 =?us-ascii?Q?K4RGZKxcRQw1IRnt2Te/pRCJyyYseZskiMDjaQGNoPAX63qUtykPe1Y1GjVm?=
 =?us-ascii?Q?w/Ve5kqq4Cxv6JvuaD7DXv/NVlMO6FI74IVJo4nZzcxDWLx3MaI7CDwk1S1V?=
 =?us-ascii?Q?4PocpyR0KhM72Clh++Woht+7hC9qRoWqh2wx00JXCV9mEyPHTbAeqgak/1jf?=
 =?us-ascii?Q?N2C+xzGP/rt2nluv+OfSwTdcCSK4LWSWUAFkGWcOln2InE312jriH4tsug8b?=
 =?us-ascii?Q?31v8K8MCKsAA9oJo8qPur9K4+PV6KHrIrRHRtAOcdNKZLJ9VFEf7dTmCqMRZ?=
 =?us-ascii?Q?gZJYmreamUA38NeLilIUFxHK0GoqoZvPi2N/2bupS0W6IzwjTPLnbnLyGMkw?=
 =?us-ascii?Q?gwzMS//63PlM76LmDp2su6DbKvffcvYImVCmsHwgmN3un1GbYILWu2o2qFqY?=
 =?us-ascii?Q?bcD6J0fwJpg8ZFRyVfqgZyHcbHzeCpBd89DMoKEGxyumOyWFj2lpgImS8sSq?=
 =?us-ascii?Q?luIf9+kh2BQoqsfBMxI8wMzncsHnJM7jScgzWQPiOX0yspm8W/TS+ok1IDLh?=
 =?us-ascii?Q?XHp8AEu53cMtwrfuUU1a5CFW9vySTeNfsD092OKrY2BoFk/+JiKxZ7Gn7AGm?=
 =?us-ascii?Q?Bvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oHLQgYUdDMTXM8k6Hj9NVmyyn5654U7zpD10CsTbVO0E5KEZffe17lo/rVmI?=
 =?us-ascii?Q?wkZzm97viToD/o3Sj1SBj5pgccE2OqMvsGYowyPf/uK6UsYvGmK1fe8mlkon?=
 =?us-ascii?Q?ohMHWuVgorIdFKjuHfDERsYM2f7kvJH1HWBeMBVwPSNvtHhy5+Ym6DXy2R2Y?=
 =?us-ascii?Q?VvyL339FNQedFuFZUT19d3DDjntny69Q10YJB6avsqnowrD20tjbdl7a3Cag?=
 =?us-ascii?Q?7FmZgdFpsxFLlMquHV2Y8Sq2e6ehLv7/07OxfdV3j2lbdOXr2L5bKuMousy0?=
 =?us-ascii?Q?PUJnN30rh8VcB7Mx/PNGJSH10+rvHOZ7UvXPvdtjeUEEf3h3OCjD8ARoKnMV?=
 =?us-ascii?Q?hFp0wAbidqChdNJSqmtYlE5N1Qu6eR1o5ISPfP9jVFi6SMXmcDYHgl1LMP10?=
 =?us-ascii?Q?/04n9CjsfWNXX46zMa3TPz8vMyqlHvSsZ+PRla2mxcBrfcwVIAHZkrkg8Mxg?=
 =?us-ascii?Q?Sdjp2FiS2IBSNTXRoVuwb5SUDGiBgmnlmDyruoX9GfQXJ5EB1ESfXHbLhcMs?=
 =?us-ascii?Q?llLlxbXtSm1mfUvGZ0xczDN1NalG6r5ZRl2SnU3jbWAKP7NbNn6b8JjcnLz7?=
 =?us-ascii?Q?bXOhOMPnH8wrTDAgeAqt8t0J+LBPRKsovETQHQvEXa0UiYPrIvaF72JspCG3?=
 =?us-ascii?Q?HjElOxuaI2aGTx3oN50PhmKZdfPnooUc4ucVNa09VYwwkErzmqOYQ1KWQAXo?=
 =?us-ascii?Q?YC9imiZU6Qf+ALirGeL04pgprk3exyMznoA6N5Yyz7DuMGtA6TGt6xYtFIwU?=
 =?us-ascii?Q?L7KtmHUEbEXaURKyO0nGX7LvYxG3j1XtVLxUGJBzuwS7e8T+rsM7pzGZ9aIT?=
 =?us-ascii?Q?hZPtGca1qSRwDzDVAmzd/lhjvf3WNBj01g202LdEDwpxTmMhtlEiOr4Vi/EH?=
 =?us-ascii?Q?h3TwsftuPpuC8F/9BpMVbikinDEyJ6v4RDQqMJ5/pb+AXyj+qtRZnSZ+Xg+q?=
 =?us-ascii?Q?Fu+kZJogxX4Xw83lYt9Wn0Bg1oT+NUABPWu0JIxCxaQ1UJmqq8LXrXtUDzT6?=
 =?us-ascii?Q?92e2zERGcdFsSmZrjoe8x81XQoinm4UQB2S3R1lJ7CuLrM+2ogOVFiVADMwB?=
 =?us-ascii?Q?J4xGpymOHzAEt2X487svgTQsGRb+FLwz2FpoF3N8f3HvzUzcA9mb8K3qUp0D?=
 =?us-ascii?Q?nkCnchKwXuFaI6ulZ9Vq/7HLIRXw24di1bMjV/TvIyFGntz7Apc5o3td8UGL?=
 =?us-ascii?Q?9jTz6ROs/MNbp2BnzzJUS2dAORKNOdofZzHrFIlMImhk0fBwd9th2LOyeEBl?=
 =?us-ascii?Q?ttgzvUWaMLKucXj/qiMnjyMBtBTzl7GJTFk5+aacuMkcX1kRDhIdLg09gKB/?=
 =?us-ascii?Q?CudVo22oP2h1VGPgSYDQRSffgwQUN7HnF6zWN+i2U1slLaaSEJj86gxpy64B?=
 =?us-ascii?Q?cXpc4tXv95cpvs2Ik4FSfJRZgG7bVVhhVP2cbfS9Kww1t/MTQ/Xjr2FB40uD?=
 =?us-ascii?Q?tMIqfi8qIXE1gciErHlZBwwtnw2Zoa1Z7NZQIWAYUKC2kP5u2b1WHyJUvoOc?=
 =?us-ascii?Q?0jybqIFpn48irygUm8+cQVGalfYUZkmOEkkeEf9tO0/hqmVYmz781OilQj+V?=
 =?us-ascii?Q?Z2jc+IQ65e+MTmFH3zH8ggdIWudZ+xXaetjWAzG5lOhULoUDABoE4EFFr6vd?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25108468-0250-4bae-4a9b-08dcc6b06838
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 15:53:34.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yzg6KxtagxKcuK2jcoaLhsu3flTy8UXr0PB1FgGJMeoFoCzY8IkMjymZz7WjxoIHO8jjmqxYFcJA/BqKH87U4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
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

On Tue, Aug 27, 2024 at 12:52:22PM +0200, Nirmoy Das wrote:
> Tests that are causing pagefaults should wait for exec queue to be ban
> otherwise pending engine resets because of on-going pagefaults would
> cause failure in subsequent tests to fail.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 1f1f1e50b..339c79353 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -36,6 +36,22 @@
>  #define INVALID_VA	(0x1 << 8)
>  #define ENABLE_SCRATCH  (0x1 << 9)
>  
> +static int get_ban_property(int xe, struct drm_xe_engine_class_instance *eci,
> +			    uint32_t vm, uint32_t exec_queue)
> +{
> +	struct drm_xe_exec_queue_get_property args = {
> +		.value = -1,
> +		.reserved[0] = 0,
> +		.property = DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +
> +	args.exec_queue_id = exec_queue;
> +
> +	do_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
> +
> +	return args.value;
> +}
> +
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
> @@ -324,6 +340,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], NSEC_PER_SEC);
>  
> +	if ((flags & INVALID_FAULT)) {
> +		igt_set_timeout(1, "");
> +		for (i = 0; i < n_execs; i++) {
> +			int e = i % n_exec_queues;
> +				while (!get_ban_property(fd, eci, vm,
> +							 exec_queues[e]))
> +					sched_yield();
> +		}
> +		igt_reset_timeout();
> +	}
> +
>  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>  		for (i = j; i < n_execs; i++)
>  				igt_assert_eq(data[i].data, 0xc0ffee);
> -- 
> 2.42.0
> 
