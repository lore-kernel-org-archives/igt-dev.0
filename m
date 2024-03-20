Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C92C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 21:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57110F2CD;
	Wed, 20 Mar 2024 21:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izWz2QcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512EF10F2CD
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710970561; x=1742506561;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=hNdtLCTCEzdznTCHH7qCZ4nvMVqEPLZA6P8F9FRJAL0=;
 b=izWz2QcER2s8a4AWsB718V3GuqPtLdHUpB8UmBsZ+GFcSQRIo71scBA9
 IFSJeYpCuogYZTpfPdWkOqz5HU1Ah9oqgt3io9Iq+B02PY45LHamlRspb
 7RdpbXtG2fTMxfNWOnR0Imjz4P+X9a54CHySEcg1tijmf9Xdqpfa8/Wr4
 2fWQqw8wPkSl1cNOztoOhEvcV76d6P2dKiHxfEFLk4Jpwp+fk7xAw9wYW
 3iaTdytieD2tTuOq0r1V+iHoobIuSrvmPnPJmiRIjwXUDO8yBt2gk1qK7
 GcukgWgIHgdRxb48L28kCklh7mZaxvFKqRAfB5MY47Yv//beFwW+2cDOE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5761858"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5761858"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 14:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18930232"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 14:36:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 14:36:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 14:36:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 14:36:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 14:36:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4L7MfFI5zG9hmroBfWzI5pcW9NzLyCScbKpqCtsDR2kaKMTlkMNZ8aK3tTzBw0Zp7F1u4WXKUb6WifHoh6AyUa4vXyoKY6BiJNbG698lAspCQOD5Rw5oPSFc4JLmwykycTpFY3KXcYGUWf/ZuQVDWtoKfYAoixC4RXyD4htTSAawyDzA+x7RMgQPagbrzJdUv/fZY7sl92/QBoKXNFkHaIZXu0nTPqf8KCulP1RwIqJP2E4/epGVYYdMoIC9tapOwz0rdLlVhLRKcUVkVTds7l3xlLE30pAYS0qk9HxWDAoUN6mX6LTLLV25wh50nG+ca/Fyq9NNtCBct0iKbenxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fRmdk9v7xqWViumHGDWf3EF1agOwp9VQmaSAWSgDr0=;
 b=CQRNj+7/E8pjde3pALVmjfZ4NI3d56lyc7DqdBseneL/VFLzLSkcbWltI4k+s7ou2jBCj4NTmeAmLNitEgck5HqQjxoY3s63Pp/io3O1hOlKc62JJ8v/pJPNgfnMTofvPsFRzGOhzbl5CVLFbEScb7Lr1bFe3nEre7ISrWhxWfg1Jod2clB5XCPforCQmuYrFwOnq41m3QEUx4E1w0tDTayJhrcBEUX+Qy8nQLop+IosJa634Qt1FXwXBdlp8FM9UCipeJs7diaMw/JvDRmjtnxF87/yAOiVyMNEnfNAe2QIBxbAGP3HPeVE4oxS8V2s8JM4Le/hMBdKBA+wAMSlNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 21:35:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 21:35:57 +0000
Date: Wed, 20 Mar 2024 14:35:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLnhlQkFUOiBzdWNjZXNz?=
 =?utf-8?Q?_for_tests=2Fxe=5Fexec=5Fthreads?= =?utf-8?Q?=3A?= Fill in GT
 field for second balancer thread
Message-ID: <20240320213554.GO2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240320192356.359327-1-matthew.d.roper@intel.com>
 <171096906828.921315.16341365470152478558@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171096906828.921315.16341365470152478558@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f35bad-ef17-4990-2a0b-08dc4925ba88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +wBtGYZzA7FBPE/IX8BG1B7tHiYtIbi/s3XOsTsP+7KwBuhJ34UauU8rNgfwdyole//g7PMawSW0m5qvtfZY1H8JpGH0ecKHiiz7KT4/rM5XfNUB5XNUag8mL1McCq1MwqoG42v4bqRrGx6oqiSuzx0P75q8xf3p0/WL1rBEA4hNKXHvKQ939iL6Cjx9bD4LQLXTn5rfkdrpIF8xusPPQ21dds4bi92Eks131GItCh+/5+q14dNFpDlepEnyj7mTbKqo7sWPC9si2A/A5jE0AIrBKGd7iC7ISyTiZD3FNEiav35X8UPkY+Xt2wvOmM25b3YawLW2TpHWAuJZzPZhRwxkQ0RHc5MtG1TcHTM95+FxrQzGgQtfc8XSx8sglT3dZwyjrH/MZQFOskrEgiyThvDx4hfnGVCjekIb0ER4oIM830IZya12Hf/8c7Ac7eVVj7+jmQuJt4owH1coOXybbJtm2kz4k788ZLg66xvcQ9bfP89N22J189EvOvRgEIWkoujMQznKrRHskSdFl6OaBPTRIm3PuQeg3TuSA6DlaTSa/fNzqJlGCyIrK5vm6dxHMHcBg9n5plLRSgakcSZMpdPzfi4G87o6vWJJ2pzparHs8ooAmWWbCwrMdfBMmKI5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CsNdyF2sua1G5sntLewgs/4N/HWjxxtb99CguhyNtrzv92L088clxb+KQ+Ot?=
 =?us-ascii?Q?Kkj15y+NjOgsUNaNRaq458kBwyeCrI2mESaMvUHC30cORpl7NS3idLsNqdOe?=
 =?us-ascii?Q?YGNdMbS/Mg6aTqWYNU5XJRtY7ClDeCZoRBq0gVQ5fZAeBgMFRj9ygH1iJ5Xi?=
 =?us-ascii?Q?bBcWyWcE3OnvMJ2T+yWYPjpzewhZwIsvYNN/jLGWEsy7bVru9wCqVIVPZsCi?=
 =?us-ascii?Q?dSi4FyBY0Gj1ZwrzboGzavMdOApY20riPbsZk2cr9R2AXBFJQjXY0wEi/GMl?=
 =?us-ascii?Q?Tzv9VvlFxV+yBS7PihvzzdFXpl6D9ZGXhnHRXs1LsCOuZtUfSyueGcCEKl3b?=
 =?us-ascii?Q?GjwVNZCmlvsruIGZndggDPa4FdF6tGHND2dUoznjoCG1sn8AdfzivszzBO7B?=
 =?us-ascii?Q?bj8RhrPryBonCsej+RJDFWBa6MpW4jpwh//ame9e+OVh5Sz6FaBYRw9CSOjI?=
 =?us-ascii?Q?Mu+a9yJoB92ecT1cE077vLZSHtdj5OcsB/0ylHFeWvNwGR/sVlXowrQL6iAi?=
 =?us-ascii?Q?kDK7OJKulFz2/SsDGtZbbUKTxMu2x0z1DAe9zJcy87dzfh+Zba9cPwzV1Wr1?=
 =?us-ascii?Q?VefsAXC2c60T++BPBVJ5Pqq9Uwiq/z8p5Le8RUHQ/om2FggUaJdz/yrtwy7J?=
 =?us-ascii?Q?NEzBIe3nQF4Rex04D2gH0josU91U7u53G32ma/1aQJ6KawuEmxzMXNcfmlQr?=
 =?us-ascii?Q?8O3M3+IyZsp6yDr24Z+Mnm/Z86FK/wc2M/Pl0AvjfI85WYDmSnPnS+Hx30YW?=
 =?us-ascii?Q?pTYEb+58pAUwNXOuKko/Oho3X84k9bA4hlZkbusedAAbV1fMyUaeE9HV9HHx?=
 =?us-ascii?Q?DNUiHmu5CJ1e5mqLmYWiWYGKaYX2qw/gjB51sXEeyyJruNlQdlWcmak5tnIC?=
 =?us-ascii?Q?scLKVNw4ib3mKfILsoiLvytKgTbB6VNQkIBI28c9Bf7uLonEWMJv9gV3eb4V?=
 =?us-ascii?Q?XBvgbE3d915LiQy1aaK5JN3bTuTQJtK2Fqi/CEf3PciIyJ1LDrB1D6kGvvmi?=
 =?us-ascii?Q?Ors70AfmGyroxz1hKnH2ANbtHVuK9SEZeGIe6Koyn5GYLRtFCc9JzwsgDUgy?=
 =?us-ascii?Q?b3tkTz8i2e8z/W0IhRiP3uBLqs/Rlw6uZb498Vh7KQUkzJGH+UuG/CMDufZ2?=
 =?us-ascii?Q?c+wRJUzbpAUBFfSBN/qAtjxXoVftF11kH8Jsw3VjDekBd6H9wjxRCDLqL0qX?=
 =?us-ascii?Q?QOhxHY26lxsVqFBvpv67poOyc5UW4NBh0bUTtYWMXb74Koo4sMtMxsDbfFje?=
 =?us-ascii?Q?lFSpzoTczZhpSE4eHfJbucxDHg0Z9BjsvUG313P0FFXsOR9Jls9zi2ArNdJD?=
 =?us-ascii?Q?OjY5CKLa1NrDmyWyWfri4/jnS9FdvgHvDCCFS5TxwEIScFFTzazdHwRTXZPJ?=
 =?us-ascii?Q?v4UUi9Yp+YQbTMO7Vtl38zafMaoyZMK0b/HRfrG3W+R2Hc//JRKBcxbAdUhd?=
 =?us-ascii?Q?jf6AdHc3iPnkI5yQpnTj3H49Uka+kp/8JBLFhtIhOa1rLT0bPX01pBtQukCq?=
 =?us-ascii?Q?2/UFnA0BK2HGEzVQwdIueyZuKHGcu6M7X9Quxe+Lq3VuhTLO6LU+OTyXDG04?=
 =?us-ascii?Q?S5B9BeQM1J4jchGoYyhP4P0CRph/yR31KQ9oNRCZ2AAtX5ARiy8B994Rl2QJ?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f35bad-ef17-4990-2a0b-08dc4925ba88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 21:35:57.3069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWqEmqB5MePI0Pmve9bVJgBjBl2Wqer1CgLmSR49RDBEYycjaLpttM9JEfGHcDGxh7AQRdTIa5uDtqMw/I4JLoJxb5xmy6ceS2RzqBaXgUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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

On Wed, Mar 20, 2024 at 09:11:08PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_exec_threads: Fill in GT field for second balancer thread
> URL   : https://patchwork.freedesktop.org/series/131382/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7771_BAT -> XEIGTPW_10867_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to master; thanks Lucas for the review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7771 -> IGTPW_10867
>   * Linux: xe-966-cfe25dc9ae2e1add3f2605831bf6d8bea481164b -> xe-967-1cbe0387180a61b6abb4f5a6261763adaecbf51b
> 
>   IGTPW_10867: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/index.html
>   IGT_7771: 7771
>   xe-966-cfe25dc9ae2e1add3f2605831bf6d8bea481164b: cfe25dc9ae2e1add3f2605831bf6d8bea481164b
>   xe-967-1cbe0387180a61b6abb4f5a6261763adaecbf51b: 1cbe0387180a61b6abb4f5a6261763adaecbf51b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10867/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
