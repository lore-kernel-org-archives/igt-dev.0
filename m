Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAF8CE8359
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 15:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E55410E530;
	Mon, 30 Sep 2024 15:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YorGeTzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2821210E540
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727708497; x=1759244497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BCxOMj6enkxeSf8TNH7jsMhnLh5QAlbpgV2CzvDEROs=;
 b=YorGeTzzHLv+31UVyGzl6CgY2WYN1k2BeKCpI6JxLgZSEnuDIf9I11q+
 bpkEHOWVgIvmBunSWqifwOqJLXcsr1bdMfmVTTnazwetRBWa5iofXjj83
 TAuag5osGpPActRD90E5120mjRW8PISDlAimMDvWfBY3gYhzExhRd2t7+
 Oc6mffSHxR/U6DqyguFk/Ws+VOFOItgjUGzzC1JUNRd9iGTeWVXwpbokW
 k5Ss+1ub/+vpwSbOMVRwHhyDP9qGXhsczcH0ZTIMa3EnNMMk22hDFyLsq
 druZuKM4GoZ59hKrxkAcAApqmO23Iqm+LaFqR3w5sEdyHKn6JGKsNIP4y A==;
X-CSE-ConnectionGUID: WxAbUQjyS6ODQggIQwkDGQ==
X-CSE-MsgGUID: HBqO29mgRiWTn3K5H8BOpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30502564"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30502564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 08:01:36 -0700
X-CSE-ConnectionGUID: U9gW0th7R7y2K6RVVD7AZg==
X-CSE-MsgGUID: WJ3pjKftRtGn1SnYC/9UxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77714983"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 08:01:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:01:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:01:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 08:01:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 08:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vf7lMjSXecLPYprKyDqMBRJNuk5fkPrhnJKyAnmCpnNUrrTYpE87ZruSbXuH4Mrcsm4CnhqniBW80qXBOs2CtczXe3vXTnpK6ONrc6Z+QP8CdrhReC3bcjJ3+/AxnfA5cUT2qutnHz0+aBK4Hnt6/TqkMXzi5SqYpoYS+3LL91wXVTmY7EpzBLQrSgRh9m6CSiEts1HwCDkf+yvD2XVjYb1D4uJXqE6dQvtGr1US4HxIh9X0CXxaP9P/SmY7JFCCvwTFYwt8CTsR4Pk+D1rlNDlT+GQ1EY0z/iwSe+4GGaECqCPAocekHnjL4B5opk8mjhQJuibxkZ1MJWsVJ/q4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVSRFpcuelaKo25YVufVJN1AlTtjkb3IptNCubISpME=;
 b=tk51W312zuttXSUdcqScoV8WWHZXmble+EzHZfRj6LXzqmLPFef64z9+abBHQEEkwb9sqpxIi8byAJWWhUecQcCn3FMm0aLuIx12gW1xdSXsBHPSbHeB+QQqgYLYBka45v1uPJVBcgbvCd7GkcUL+hnkgT2WRFhzap4RjtsCYOMKjkhKYQvAXsbKPIlZZTisnntxtXdoVDMBNkX2zchAwVFJt0oQHjwJTI0Njiron3+GNTEPnArEpoqVqlRoCUzABpQSMRCQZjpIRfBQlu+vJ42bQHyTxf6hHhGbiEoreGNOludrCCqMMGU5ksQQsx1nPzANiLYoaLvtsn3LiTWgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 15:01:28 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 15:01:28 +0000
Date: Mon, 30 Sep 2024 11:01:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t PATCH V3] tests/intel/xe_pm: one suspend/resume cycle for
 all xe
Message-ID: <Zvq9RYJFz5OzpxL5@intel.com>
References: <5cdb17b6-7045-40c7-89b1-b55b6eff6623@linux.intel.com>
 <5868458c-cc10-4fb7-80a3-0210315ff93e@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5868458c-cc10-4fb7-80a3-0210315ff93e@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:303:83::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 893779aa-8747-4d8d-2276-08dce160c284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VlFSB+6UgVBUWuI6pMIqims8KL4ftD9yFIfDb2rERz1qbI9NptXmvJuBSM7I?=
 =?us-ascii?Q?8myQNmjcMaZ596C6GRG6SI5TlhqcqYf0T++uiUsXUFQ410gI9LscoB8cCcZI?=
 =?us-ascii?Q?K0DVgpCtIAwPHpZfg9OsmaoUjFG9P32dPQXHj1kIFYJeOpDodeLN2LF39C2W?=
 =?us-ascii?Q?nMuxgIxWDH04v2oYsULdY6NGg3q2IgXkuSgmxEZLjdN8ZUCj7eTGOtYh+k8b?=
 =?us-ascii?Q?fi98g7ION0s7LmneE1TmFf6TeMAm1qwNAvEjt5Au3sLKEKo4Wz+eGMaa0Jf8?=
 =?us-ascii?Q?lu4yJn0ObJIP99nVGUnLVPgxnnsoaE/O+1StD1wzu4WerLFUKZZ2iAT8t/G/?=
 =?us-ascii?Q?zF+Hp76YmszSYHzZ56uo+jX2Kj59T9RcAIrwRx8ZN9UleYCOW0F5ba+Ak4zN?=
 =?us-ascii?Q?ZyhJ18Agx0atK79FPsgAVKwabO4NouJzcxx+qiDvJ1hgbYXBpWc1e1MfMqpj?=
 =?us-ascii?Q?IVVxHQ0PKp/dJMN7+Wk4p6zMH2Co+jS8gOW9wh2HPax4uv8JOv6hEeUrZnxG?=
 =?us-ascii?Q?io57dqpkdk/SkZMkgpgiJjKWUoE8Dl9g7hkY4nXbg+0jP5f92kyXpzM5xjjH?=
 =?us-ascii?Q?c8sNCB4I1ejeAOC21YFEIkFbfQZlovSZaZBEJlgBoLWVqxKvykdo8o+4ZyqR?=
 =?us-ascii?Q?3lZIfDfFT7xjpNGdMcMwL2TvTvMl0XSwZCub4WnLzjfOWKGfffEa0iqyzaRK?=
 =?us-ascii?Q?ntwqOkkNLcnkr23+VIyfXxwYe6syz+519LO2GxWrIy2V1ZFs5AOWlHSXG1JB?=
 =?us-ascii?Q?l/iR4Ks0JvP4UFlwGAQpGJSXQP6dRoy/Q9AWu7NC6cbHbv28euoAQX/ywAiJ?=
 =?us-ascii?Q?/EYHnJ+fxtt3gF44YUGxSnyKkMHLBaJweunpjbmq5QS+36Hdzhp7zKdzCW3h?=
 =?us-ascii?Q?ypg/lm65KTpLUpmoD2s6Oe/9IchkGPTMmgdqnzQRp/e0gCYgd+oNbYqbvB/Y?=
 =?us-ascii?Q?2xMRIScY7OovJp/nQbk1MZCqMkM6UbjgVmei8hlF6FTSLFbU++tjxYniJes7?=
 =?us-ascii?Q?DICyaI5OrH8+b6Qcm+6hAxd+3ARJf3ldLeUy6AVpDaBsCt4bOxjo/WJaYBwN?=
 =?us-ascii?Q?rh8Yh14jRBRuy4yJz6pG4RoKMzkdtWdDDTK46JusvAqWX2vuEK3i4lQfU0Qh?=
 =?us-ascii?Q?4hkzSkFFCJ0gap0+NEihCaeA6HIhMu1suDFxOtRrWw9LA3axQzK+juJkcWUd?=
 =?us-ascii?Q?Frk1io7n478KKccpQOKxxuZlItQUwvak2dJa1rz2+hQWH5GW9TQrTiK0Zjwl?=
 =?us-ascii?Q?Wi4ESKjgsIO5dpR6slxRRAEW53pXRP6il1z1XPaZ9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2F+d2wuP8zycLSVfe0STfMP5+msRXYPJnpMBWDowmRUwChAcM7cVBufQKiIb?=
 =?us-ascii?Q?EpEKSgaGjUkW8c+mQyY9Rz99JrEY57AmUEbuKzrtCc4s2RsMZpMSUb5FRzb4?=
 =?us-ascii?Q?MnXuZTqT5xXvveBxIYuubZQIMz0zzRMafAkm5wyRYrUKxgygAcurSMkipC3V?=
 =?us-ascii?Q?otvOMUiZQ9F3gVRTK6AGFFvNBrJaxdvlDeIfyCbTZ9vzziG+Vzs2pYdItKjk?=
 =?us-ascii?Q?UOkp65IoIt0EEpTYgo5Pj/9fuj6H0YeGP3Xa+zpGzDw9ysrRBz636KJqsbRo?=
 =?us-ascii?Q?Jifs3O+CG9Jt8YiJFIE7WWy8anaCz6abRsTSj53AlRqwdBE+cMtwcRX7Aoso?=
 =?us-ascii?Q?QRcaZly/YI0dIGiadKHaxIZRvrmtNbzI6FlCeCuDHt6oQ6kb9FdQQzyVmy/C?=
 =?us-ascii?Q?O9NXeeV0N+FGzlw73EtgiKn38xjjNx9bWeUhBpoD2cFNEXwPSX+tl87dtreK?=
 =?us-ascii?Q?PDiWJwt59oab9B2GBzwlrh9SGkSQNbgtMyvhljVE0riR0n1k/CNEINh8cmBj?=
 =?us-ascii?Q?bEwTDMn/kG09rXQRAPOPvPiBwIG8wTP40QYi6FUQX5cT6bZWSKb0ff4Gq5lD?=
 =?us-ascii?Q?LVi/uy+tTxHr6f8MBp6TNx2XMUSRE70hfznZs/wHY3+A4uusbvd7gSI4L9Ah?=
 =?us-ascii?Q?Y6q/VyM6cEIZAjv9I6e5Ihi4Ws8P1vqHjcSXlI5dT2Se/S5k1iJxE0qQFlIz?=
 =?us-ascii?Q?HjU3N8txsExmAa1k/YlpotLl5XWHM3BQB/m9qf0Ri4KHbfXQA4U9O77jx1PB?=
 =?us-ascii?Q?jx0wH1QsSxO1pmKmAQCHLQpw7JTC4ND7qebv3azz0tu3BhCawg64ER84FeSA?=
 =?us-ascii?Q?bTbWXGzPITRGY3IZ/WlQf4eIUflM5u7d8FhkncaH4tujhIvEb8VBJ6/Yx8mI?=
 =?us-ascii?Q?aUdbkCKRK+SzTxyjm8c4Yiy7lLrAouIadUoX6Ja4UTnXkKC2Gf4Pd5e0HJ4j?=
 =?us-ascii?Q?1emRprKLsQCg/Qm6PmaT7JpZmmrx7z6J7/DcrHWjiBV32Ks0ysCCJ0eXgJwi?=
 =?us-ascii?Q?M6auOXiTc2Z9PKfAdgGUE6syCGNU4PFjYF814vYqCPjAsfhJxQ1fr9G7cWFM?=
 =?us-ascii?Q?OTQYgekatDXKkZdNsKsMNAxwRNI8W8zSnR5PglFgKmKTxUFFuTk+K/5I6aBB?=
 =?us-ascii?Q?GlFbTBu3zgTMSlHsEGgCn+Hl3/WXvrccVXgdNrnryCyIpKbXoV1NPzc5kM8B?=
 =?us-ascii?Q?e2ymtQY2ZY/zgUc6Q/UY+KFm8GIFEOVreNeirD1EHParCJLI0AI337eA5ZZY?=
 =?us-ascii?Q?UhuETqBh2kQNDMjw+CtXgspABnpqxVdIWZDXKc2+Cjh2cSAY1Qm9HmIxPwtf?=
 =?us-ascii?Q?4n5SPV6wCiNU2vvp++awY3kKHV5p3Grg5FTmZ5Q7PLzEz/yXR6fm6kEAFXuG?=
 =?us-ascii?Q?4xfcHZiPb/97dl2Vs57VVf1la59QK6AFi2NMGWHG79Zyf/Dk9i85wFiJxRVS?=
 =?us-ascii?Q?VBx3OXPvqELCSuIXJ2p7og3n+q1nyZS8btxLJmanlksNtCrdfho/siSBw3yt?=
 =?us-ascii?Q?UYnoHq4LJOSJcAZi4zi97YT8izbFhRroWPukod2wDK7UPsHBFHeWYCtMBQqN?=
 =?us-ascii?Q?0diD+I/um8qFdmZIhUyb2sKC87EZUsC04x6DCYqIoB5SOnJ+eAK2EmA+Rcwo?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 893779aa-8747-4d8d-2276-08dce160c284
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 15:01:28.4943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgg2UfpVj0qYT3z3oOdWoiku18Fe1+2TzUsTjb+IvlLOaRJ8X+sP0n0trv2VD45jaX7bIRXXJHNJonP6GCq9aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
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

On Sat, Sep 28, 2024 at 09:35:25AM +0200, Peter Senna Tschudin wrote:
> 
> Changes the behavior from running one suspend/resume cycle for each
> xe engine to running a single suspend and resume cycle for all engines
> considerably reducing the xe_pm run time.
> 
> V3: * Always join threads
>     * Update the code comments to state code paths that run concurrently and
>       that do not run concurrently
>     * Rename threaded_test_exec() to test_exec() as the main function
>     * Move the comments describing the tests closer to the new main function
>       test_exec()
>     * Rename the typedef test_exec_args to child_exec_args
>     * Rename test_exec() to child_exec()
>     * Remove test_exec_wrapper() and update child_exec() to use a pointer
>       to a struct for function arguments
>     * Do not declare the engine instance as argument of test_exec()
>     * Remove the semi-random sleep(2) after the suspend and resume

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed.

> 
> V2: Remove race condition around child_ready and fix subject line
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tests/intel/xe_pm.c | 403 ++++++++++++++++++++++++++------------------
>  1 file changed, 241 insertions(+), 162 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index eee89428c..b50d8dbc7 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -54,6 +54,22 @@ typedef struct {
>  uint64_t orig_threshold;
>  int fw_handle = -1;
>  
> +static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
> +static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
> +static bool child_ready = false;
> +
> +typedef struct {
> +	device_t device;
> +	struct drm_xe_engine_class_instance *eci;
> +	int n_exec_queues;
> +	int n_execs;
> +	enum igt_suspend_state s_state;
> +	enum igt_acpi_d_state d_state;
> +	unsigned int flags;
> +} child_exec_args;
> +
>  static void dpms_on_off(device_t device, int mode)
>  {
>  	int i;
> @@ -199,85 +215,12 @@ static void close_fw_handle(int sig)
>  }
>  
>  #define MAX_VMAS 2
> -/**
> - * SUBTEST: %s-basic
> - * Description: test CPU/GPU in and out of s/d state from %arg[1]
> - * Functionality: pm - %arg[1]
> - * GPU requirements: D3 feature should be supported
> - *
> - * SUBTEST: %s-basic-exec
> - * Description: test exec on %arg[1] state once without RPM
> - * Functionality: pm - %arg[1]
> - * GPU requirements: D3 feature should be supported
> - *
> - * SUBTEST: %s-multiple-execs
> - * Description: test exec on %arg[1] state multiple times without RPM
> - * Functionality: pm - %arg[1]
> - * GPU requirements: D3 feature should be supported
> - *
> - * arg[1]:
> - *
> - * @s2idle:	s2idle
> - * @s3:		s3
> - * @s4:		s4
> - * @d3hot:	d3hot
> - * @d3cold:	d3cold
> - */
> -
> -/**
> - * SUBTEST: %s-exec-after
> - * Description: suspend/autoresume on %arg[1] state and exec after RPM
> - * Functionality: pm - %arg[1]
> - *
> - * arg[1]:
> - *
> - * @s2idle:	s2idle
> - * @s3:		s3
> - * @s4:		s4
> - */
>  
> -/**
> - * SUBTEST: %s-%s-basic-exec
> - * Description:
> - *	Setup GPU on %arg[2] state then test exec on %arg[1] state
> - * 	without RPM
> - * Functionality: pm - %arg[1]
> - * GPU requirements: D3 feature should be supported
> - *
> - * arg[1]:
> - *
> - * @s2idle:	s2idle
> - * @s3:		s3
> - * @s4:		s4
> - *
> - * arg[2]:
> - *
> - * @d3hot:	d3hot
> - * @d3cold:	d3cold
> - */
> -/**
> - * SUBTEST: %s-vm-bind-%s
> - * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
> - * 		with vm bind %arg[2] combination
> - * Functionality: pm - %arg[1]
> - *
> - * arg[1]:
> - *
> - * @s2idle:     s2idle
> - * @s3:         s3
> - * @s4:         s4
> - *
> - * arg[2]:
> - *
> - * @userptr:	userptr
> - * @prefetch:	prefetch
> - * @unbind-all:	unbind-all
> - */
> -static void
> -test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> -	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
> -	  enum igt_acpi_d_state d_state, unsigned int flags)
> +static void*
> +child_exec(void *arguments)
>  {
> +	child_exec_args *args = (child_exec_args *)arguments;
> +
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
>  	struct drm_xe_sync sync[2] = {
> @@ -289,7 +232,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		.num_syncs = 2,
>  		.syncs = to_user_pointer(sync),
>  	};
> -	int n_vmas = flags & UNBIND_ALL ? MAX_VMAS : 1;
> +	int n_vmas = args->flags & UNBIND_ALL ? MAX_VMAS : 1;
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> @@ -302,74 +245,76 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	int i, b;
>  	uint64_t active_time;
> -	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> -			  d_state == IGT_ACPI_D3Cold);
> +	bool check_rpm = (args->d_state == IGT_ACPI_D3Hot ||
> +			  args->d_state == IGT_ACPI_D3Cold);
>  
> -	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> -	igt_assert_lt(0, n_execs);
> +	igt_assert_lte(args->n_exec_queues, MAX_N_EXEC_QUEUES);
> +	igt_assert_lt(0, args->n_execs);
>  
>  	if (check_rpm) {
> -		igt_assert(in_d3(device, d_state));
> -		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +		igt_assert(in_d3(args->device, args->d_state));
> +		active_time = igt_pm_get_runtime_active_time(args->device.pci_xe);
>  	}
>  
> -	vm = xe_vm_create(device.fd_xe, 0, 0);
> +	vm = xe_vm_create(args->device.fd_xe, 0, 0);
>  
>  	if (check_rpm)
> -		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +		igt_assert(igt_pm_get_runtime_active_time(args->device.pci_xe) >
>  			   active_time);
>  
> -	bo_size = sizeof(*data) * n_execs;
> -	bo_size = xe_bb_size(device.fd_xe, bo_size);
> +	bo_size = sizeof(*data) * args->n_execs;
> +	bo_size = xe_bb_size(args->device.fd_xe, bo_size);
>  
> -	if (flags & USERPTR) {
> -		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
> +	if (args->flags & USERPTR) {
> +		data = aligned_alloc(xe_get_default_alignment(args->device.fd_xe),
> +							 bo_size);
>  		memset(data, 0, bo_size);
>  	} else {
> -		if (flags & PREFETCH)
> -			bo = xe_bo_create(device.fd_xe, 0, bo_size,
> -					  all_memory_regions(device.fd_xe) |
> -					  vram_if_possible(device.fd_xe, 0),
> +		if (args->flags & PREFETCH)
> +			bo = xe_bo_create(args->device.fd_xe, 0, bo_size,
> +					  all_memory_regions(args->device.fd_xe) |
> +					  vram_if_possible(args->device.fd_xe, 0),
>  					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		else
> -			bo = xe_bo_create(device.fd_xe, vm, bo_size,
> -					  vram_if_possible(device.fd_xe, eci->gt_id),
> +			bo = xe_bo_create(args->device.fd_xe, vm, bo_size,
> +					  vram_if_possible(args->device.fd_xe, args->eci->gt_id),
>  					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data = xe_bo_map(device.fd_xe, bo, bo_size);
> +		data = xe_bo_map(args->device.fd_xe, bo, bo_size);
>  	}
>  
> -	for (i = 0; i < n_exec_queues; i++) {
> -		exec_queues[i] = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
> +	for (i = 0; i < args->n_exec_queues; i++) {
> +		exec_queues[i] = xe_exec_queue_create(args->device.fd_xe, vm,
> +											  args->eci, 0);
>  		bind_exec_queues[i] = 0;
> -		syncobjs[i] = syncobj_create(device.fd_xe, 0);
> +		syncobjs[i] = syncobj_create(args->device.fd_xe, 0);
>  	};
>  
> -	sync[0].handle = syncobj_create(device.fd_xe, 0);
> +	sync[0].handle = syncobj_create(args->device.fd_xe, 0);
>  
>  	if (bo) {
>  		for (i = 0; i < n_vmas; i++)
> -			xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0,
> -					 addr + i * bo_size, bo_size, sync, 1);
> +			xe_vm_bind_async(args->device.fd_xe, vm, bind_exec_queues[0], bo,
> +							 0, addr + i * bo_size, bo_size, sync, 1);
>  	} else {
> -		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
> +		xe_vm_bind_userptr_async(args->device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
>  	}
>  
> -	if (flags & PREFETCH)
> -		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> -				     bo_size, sync, 1, 0);
> +	if (args->flags & PREFETCH)
> +		xe_vm_prefetch_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> +							 addr, bo_size, sync, 1, 0);
>  
>  	if (check_rpm) {
> -		igt_assert(in_d3(device, d_state));
> -		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +		igt_assert(in_d3(args->device, args->d_state));
> +		active_time = igt_pm_get_runtime_active_time(args->device.pci_xe);
>  	}
>  
> -	for (i = 0; i < n_execs; i++) {
> +	for (i = 0; i < args->n_execs; i++) {
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>  		uint64_t batch_addr = addr + batch_offset;
>  		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>  		uint64_t sdi_addr = addr + sdi_offset;
> -		int e = i % n_exec_queues;
> +		int e = i % args->n_exec_queues;
>  
>  		b = 0;
>  		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> @@ -387,59 +332,211 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		exec.address = batch_addr;
>  
>  		if (e != i)
> -			syncobj_reset(device.fd_xe, &syncobjs[e], 1);
> +			syncobj_reset(args->device.fd_xe, &syncobjs[e], 1);
>  
> -		xe_exec(device.fd_xe, &exec);
> +		xe_exec(args->device.fd_xe, &exec);
>  
> -		igt_assert(syncobj_wait(device.fd_xe, &syncobjs[e], 1,
> +		igt_assert(syncobj_wait(args->device.fd_xe, &syncobjs[e], 1,
>  					INT64_MAX, 0, NULL));
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>  
> -		if (i == n_execs / 2 && s_state != NO_SUSPEND) {
> -			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> -				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> -
> -			igt_system_suspend_autoresume(s_state, test);
> +		if (i == args->n_execs / 2 && args->s_state != NO_SUSPEND) {
> +			/* Until this point, only one thread runs at a given time. Signal
> +			 * the parent that this thread will sleep, for the parent to
> +			 * create another thread.
> +			 */
> +			pthread_mutex_lock(&child_ready_lock);
> +			child_ready = true;
> +			pthread_cond_signal(&child_ready_cond);
> +			pthread_mutex_unlock(&child_ready_lock);
> +
> +			/* Wait for the suspend and resume to finish */
> +			pthread_mutex_lock(&suspend_lock);
> +			pthread_cond_wait(&suspend_cond, &suspend_lock);
> +			pthread_mutex_unlock(&suspend_lock);
> +
> +			/* From this point, all threads will run concurrently */
>  		}
>  	}
>  
> -	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
> -				NULL));
> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
> +			   INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	if (n_vmas > 1)
> -		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> +		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync, 1);
>  	else
> -		xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> -				   bo_size, sync, 1);
> -	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
> -NULL));
> +		xe_vm_unbind_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> +						   addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
> +			   INT64_MAX, 0, NULL));
>  
> -	for (i = 0; i < n_execs; i++)
> +	for (i = 0; i < args->n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>  
> -	syncobj_destroy(device.fd_xe, sync[0].handle);
> -	for (i = 0; i < n_exec_queues; i++) {
> -		syncobj_destroy(device.fd_xe, syncobjs[i]);
> -		xe_exec_queue_destroy(device.fd_xe, exec_queues[i]);
> +	syncobj_destroy(args->device.fd_xe, sync[0].handle);
> +	for (i = 0; i < args->n_exec_queues; i++) {
> +		syncobj_destroy(args->device.fd_xe, syncobjs[i]);
> +		xe_exec_queue_destroy(args->device.fd_xe, exec_queues[i]);
>  		if (bind_exec_queues[i])
> -			xe_exec_queue_destroy(device.fd_xe, bind_exec_queues[i]);
> +			xe_exec_queue_destroy(args->device.fd_xe, bind_exec_queues[i]);
>  	}
>  
>  	if (bo) {
>  		munmap(data, bo_size);
> -		gem_close(device.fd_xe, bo);
> +		gem_close(args->device.fd_xe, bo);
>  	} else {
>  		free(data);
>  	}
>  
> -	xe_vm_destroy(device.fd_xe, vm);
> +	xe_vm_destroy(args->device.fd_xe, vm);
>  
>  	if (check_rpm) {
> -		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +		igt_assert(igt_pm_get_runtime_active_time(args->device.pci_xe) >
>  			   active_time);
> -		igt_assert(in_d3(device, d_state));
> +		igt_assert(in_d3(args->device, args->d_state));
> +	}
> +
> +	/* Tell the parent that we are ready. This should run only when the code
> +	 * is not supposed to suspend.
> +	 */
> +	if (args->n_execs <= 1 || args->s_state == NO_SUSPEND)  {
> +		pthread_mutex_lock(&child_ready_lock);
> +		child_ready = true;
> +		pthread_cond_signal(&child_ready_cond);
> +		pthread_mutex_unlock(&child_ready_lock);
>  	}
> +	return NULL;
> +}
> +
> +/**
> + * SUBTEST: %s-basic
> + * Description: test CPU/GPU in and out of s/d state from %arg[1]
> + * Functionality: pm - %arg[1]
> + * GPU requirements: D3 feature should be supported
> + *
> + * SUBTEST: %s-basic-exec
> + * Description: test exec on %arg[1] state once without RPM
> + * Functionality: pm - %arg[1]
> + * GPU requirements: D3 feature should be supported
> + *
> + * SUBTEST: %s-multiple-execs
> + * Description: test exec on %arg[1] state multiple times without RPM
> + * Functionality: pm - %arg[1]
> + * GPU requirements: D3 feature should be supported
> + *
> + * arg[1]:
> + *
> + * @s2idle:	s2idle
> + * @s3:		s3
> + * @s4:		s4
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
> + */
> +
> +/**
> + * SUBTEST: %s-exec-after
> + * Description: suspend/autoresume on %arg[1] state and exec after RPM
> + * Functionality: pm - %arg[1]
> + *
> + * arg[1]:
> + *
> + * @s2idle:	s2idle
> + * @s3:		s3
> + * @s4:		s4
> + */
> +
> +/**
> + * SUBTEST: %s-%s-basic-exec
> + * Description:
> + *	Setup GPU on %arg[2] state then test exec on %arg[1] state
> + * 	without RPM
> + * Functionality: pm - %arg[1]
> + * GPU requirements: D3 feature should be supported
> + *
> + * arg[1]:
> + *
> + * @s2idle:	s2idle
> + * @s3:		s3
> + * @s4:		s4
> + *
> + * arg[2]:
> + *
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
> + */
> +/**
> + * SUBTEST: %s-vm-bind-%s
> + * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
> + * 		with vm bind %arg[2] combination
> + * Functionality: pm - %arg[1]
> + *
> + * arg[1]:
> + *
> + * @s2idle:     s2idle
> + * @s3:         s3
> + * @s4:         s4
> + *
> + * arg[2]:
> + *
> + * @userptr:	userptr
> + * @prefetch:	prefetch
> + * @unbind-all:	unbind-all
> + */
> +
> +/* Do one suspend and resume cycle for all xe engines.
> + *  - Create a child_exec() thread for each xe engine. Run only one thread
> + *    at a time. The parent will wait for the child to signal it is ready
> + *    to sleep before creating a new thread.
> + *  - Put child_exec() to sleep where it expects to suspend and resume
> + *  - Wait for all child_exec() threads to sleep
> + *  - Run one suspend and resume cycle
> + *  - Wake up all child_exec() threads at once. They will run concurrently.
> + *  - Wait for all child_exec() threads to complete
> + */
> +static void
> +test_exec(device_t device, int n_exec_queues, int n_execs,
> +		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
> +		  unsigned int flags)
> +{
> +	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ? 
> +								SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +	struct drm_xe_engine_class_instance *eci;
> +	int active_threads = 0;
> +	pthread_t threads[65]; /* MAX_ENGINES + 1 */
> +	child_exec_args args;
> +
> +	xe_for_each_engine(device.fd_xe, eci) {
> +		args.device = device;
> +		args.eci = eci;
> +		args.n_exec_queues = n_exec_queues;
> +		args.n_execs = n_execs;
> +		args.s_state = s_state;
> +		args.d_state = d_state;
> +		args.flags = flags;
> +
> +		pthread_create(&threads[active_threads], NULL, child_exec, &args);
> +		active_threads++;
> +
> +		pthread_mutex_lock(&child_ready_lock);
> +		while(!child_ready)
> +			pthread_cond_wait(&child_ready_cond, &child_ready_lock);
> +		child_ready = false;
> +		pthread_mutex_unlock(&child_ready_lock);
> +	}
> +
> +	if (n_execs > 1 && s_state != NO_SUSPEND) {
> +		igt_system_suspend_autoresume(s_state, test);
> +
> +		pthread_mutex_lock(&suspend_lock);
> +		pthread_cond_broadcast(&suspend_cond);
> +		pthread_mutex_unlock(&suspend_lock);
> +	}
> +
> +	for (int i = 0; i < active_threads; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	active_threads = 0;
>  }
>  
>  /**
> @@ -678,7 +775,6 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>  
>  igt_main
>  {
> -	struct drm_xe_engine_class_instance *hwe;
>  	device_t device;
>  	uint32_t d3cold_allowed;
>  	int sysfs_fd;
> @@ -718,8 +814,7 @@ igt_main
>  		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
>  
>  		/* Always perform initial once-basic exec checking for health */
> -		xe_for_each_engine(device.fd_xe, hwe)
> -			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
> +		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
>  
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> @@ -731,14 +826,11 @@ igt_main
>  		igt_subtest_f("%s-basic", s->name) {
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> -
>  			igt_system_suspend_autoresume(s->state, test);
>  		}
>  
>  		igt_subtest_f("%s-basic-exec", s->name) {
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 1, 2, s->state,
> -					  NO_RPM, 0);
> +			test_exec(device, 1, 2, s->state, NO_RPM, 0);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
> @@ -746,31 +838,23 @@ igt_main
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>  
>  			igt_system_suspend_autoresume(s->state, test);
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 1, 2, NO_SUSPEND,
> -					  NO_RPM, 0);
> +			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", s->name) {
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 16, 32, s->state,
> -					  NO_RPM, 0);
> +			test_exec(device, 16, 32, s->state, NO_RPM, 0);
>  		}
>  
>  		for (const struct vm_op *op = vm_op; op->name; op++) {
>  			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
> -				xe_for_each_engine(device.fd_xe, hwe)
> -					test_exec(device, hwe, 16, 32, s->state,
> -						  NO_RPM, op->flags);
> +				test_exec(device, 16, 32, s->state, NO_RPM, op->flags);
>  			}
>  		}
>  
>  		for (const struct d_state *d = d_states; d->name; d++) {
>  			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
>  				igt_assert(setup_d3(device, d->state));
> -				xe_for_each_engine(device.fd_xe, hwe)
> -					test_exec(device, hwe, 1, 2, s->state,
> -						  NO_RPM, 0);
> +				test_exec(device, 1, 2, s->state, NO_RPM, 0);
>  				cleanup_d3(device);
>  			}
>  		}
> @@ -792,17 +876,13 @@ igt_main
>  
>  		igt_subtest_f("%s-basic-exec", d->name) {
>  			igt_assert(setup_d3(device, d->state));
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 1, 1,
> -					  NO_SUSPEND, d->state, 0);
> +			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", d->name) {
>  			igt_assert(setup_d3(device, d->state));
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 16, 32,
> -					  NO_SUSPEND, d->state, 0);
> +			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
>  
> @@ -842,7 +922,6 @@ igt_main
>  			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
>  			cleanup_d3(device);
>  		}
> -
>  	}
>  
>  	igt_describe("Validate whether card is limited to d3hot,"
> -- 
> 2.34.1
> 
