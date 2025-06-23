Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599DCC77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 09:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6A510E0E9;
	Mon, 23 Jun 2025 09:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuTHhD2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD09510E0E9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750672477; x=1782208477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nMUB2/eoH0XD0aaqIp/H4jY4t9oASLeDphzfR6CSdaw=;
 b=PuTHhD2nP9Y2H3EmeBC52GpV9D4R9DWc08ifDkBvZIi7sfjsvxt85Pxy
 Q2GkVvVgl2cSzMFtld/F2eq6M2URiqCGHmNRisM0aNz5D1u5xJIjfiLtr
 wFtv+mKkLtH8djGIcJLtyhWezB6aO/5GHUw/A8dodJ8WACFdh7V+Omx0m
 +jwbaJal9F/n0eRGdC99LW9PAS07G7IjC0jihtCfJk2dDGKCzwyWYGjKN
 jQfQ24sYBsGRvqvOyp+EWOFWtNIqGMLRZ2xbdhnp+ktDZPMXn4FusUBnM
 SQYtwfd9qEWdKGtOjUsyBCYMz3LSDj54wgpaj1RMNUKjYippWolMMR+up w==;
X-CSE-ConnectionGUID: GaWuWtoBSVinqs52xXDSsg==
X-CSE-MsgGUID: TWoFN/FcRVK4ZQ5l7Kn29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53005266"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="53005266"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:54:36 -0700
X-CSE-ConnectionGUID: 2sR7WDpKTciI3RZTVrUiUQ==
X-CSE-MsgGUID: kJYPvNcQR8u7pJSvvvYDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152226490"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:54:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 02:54:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 02:54:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 02:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZGwscutOIO+cWknDeH/q6S5QsifksiluHr4Mp4tIlkcAKO2cJD5cMBaC2vDVxJXXCiL1L7qtFIXccOiKnjC2ZW6A3C3xku5RoPZP7D+9IG9xoDtzugTp8MIMZtUZh60ecdIGpu/GN5ztuJhtfJWo0IjeMhkvVdOJ6WI1lZR0HJISjy8VhS991d+u9z1Za4osHLc26GCfX/Eo2hs2Wy7jIZ+YuAhg1c9wWKVQPAsKYYT5h4ZnzIUbgwadJjtmX0GECsbbBr0fWxJuAYLTy59qtRJIbxmKgzfJcoHZGIWoeVm36si14nhePf5d7z6TLxzkmA+E5ENAm7+RcAJm1bk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T70GB5XDHB2QNWkSL1ZqQQh0/VfAhOzICkbi1PI1+8=;
 b=ef5skEccB4LU3VcgTJ4fUFo1EccajJuVcATqNV6dlrm3qBTMWokR/m5HlEhX1Ec3fQCjCW7ilIptnBqyEi+8UZNrj3XsuhAleSe5/UMml9qd7+1R7yFUIPNXSHc9za05ay+Quo32Q6bS51fGF3PBJB8wfWrYgOxhb4d2KtHi4tZWZ6+O5E2ab+4CDEFqHERwnn8ODZ2wPAnbMgIjFQ2XcsK77qA8HrlZJhAptqYLX6vsjNPNhGNGxWL/JsuYFiKsae2keGGeat/XTOCA40h1ecqiRYUkFv49k32fXcR9GvZOhguoz60uEYmNnfQtUHUCUT7luXazrChRZjLnuM+ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYYPR11MB8332.namprd11.prod.outlook.com (2603:10b6:930:be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 09:54:33 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 09:54:33 +0000
Date: Mon, 23 Jun 2025 11:54:26 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] tests/intel/xe_exec_system_allocator: Add section to
 trigger 64k fault
Message-ID: <aFkkUmGWZH-mJMnc@fdugast-desk>
References: <20250616070640.2061642-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250616070640.2061642-1-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR06CA0001.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYYPR11MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 42439fe4-353a-4ed2-289a-08ddb23bf49f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CJwY6oVqVAliDKZw0OxfDD2IjqCR3G0fHjtLZNMY/Qfn0gz1bP7CSkb17W0H?=
 =?us-ascii?Q?BZZsbD/IDbQiqJW6YqtOydMGZBKMbfTx0ZiGPXs9PCpVhLnB9BapYdW0FFap?=
 =?us-ascii?Q?jhXIcOYJOuJIWmM7mFDVnSm0uvuPnIgcAJHVjureqa+j4SnNPrEOKU6Kknkn?=
 =?us-ascii?Q?tzH93GFfGaeMRCmKRN9zDTOyZiG3pUfq5y6YdfmlIyFMNVefy8zRiBK1R6ZF?=
 =?us-ascii?Q?le+oBCIKGE/3CfnMAOoqYSm/pmHCM2BM8HGWaWnYItIi1oJvJeYnZuY6Kdh+?=
 =?us-ascii?Q?WLH1XTFzFsWAXAFHzMmRyVSA3CS7z7qOet+YQcLdnvEA6SlSWPzNAfZ3hQU/?=
 =?us-ascii?Q?e9nNhCyqW5f7H93fOa96icGjd4IZkHsVQxLuxeAc70kCr1GGCIx86ptcwXny?=
 =?us-ascii?Q?V6sY2fq6ozLkWGkAZHxIPht3OeJQF+84VZNXkeTc5V+gqw9S3mscr2QSd/YZ?=
 =?us-ascii?Q?kJwvbjeJ98lgAOZrFw5ETmFiji1htIkK0YZIGKFxAShwvhGPpZieBMYNpa05?=
 =?us-ascii?Q?fFCCa9FG7w507UFT8APPGayMJqTqo4SEiaCFDwk70Wgp//ro99QU9xVjQ2M4?=
 =?us-ascii?Q?a2VC+OY1ifVzzR+YewIb2wa3rdg7mgK9aG80LQvkvVg7Orr1NeNyNFXWimVp?=
 =?us-ascii?Q?1WfK9vEK+Pg7+kyC5DfGhq30DZwhIDD/4CpB1Hxb9zfyDZlwqHnvMfm5/eLp?=
 =?us-ascii?Q?uZHDAZ7xt32FwM68TmyVWHoT3gySkQOBnY+sRHrUSvnx7W5jIZKcGr4uMmJ2?=
 =?us-ascii?Q?jKN9W97moV54B42hVEXVbI6IV+l1YQA/vr0WTBFAnHDlb7axjHDkxdtKGngM?=
 =?us-ascii?Q?N0WHb8P8l+J6cHJcR/p7yxs0uz+/PdjNcO06F5+7iiBB4zODLVYPQq3EFPDY?=
 =?us-ascii?Q?3USBS/liXYfM0oSESW0Ioc5NciaG42Fu/rW17kaxFOHaawioiirxOxsxJjCF?=
 =?us-ascii?Q?DLYesNR3KXDrokQcHTa/Fcq2qAsH/Eq6/NaAI31UoQgvnrbWAkYVHLVBEFuH?=
 =?us-ascii?Q?sX8aWeV0dwh0vmqSiIe1D/d4FuOox59vwkerJ3Js0jex2l6CqBGISZDcO3Fw?=
 =?us-ascii?Q?+uWahzZnWzG9OWAJuX7jUtWfpqxxzldWH0yISswnnKE1vkh16PbE3A8h/MBG?=
 =?us-ascii?Q?TTJ55BW7Z5nZHN1rFOhS/OUXAOU5ltHR5Beg3Irwp7L6aVIzgCHX55SVfBTx?=
 =?us-ascii?Q?3JIJ009dZqLSotRCKmIF3BTn81G8GkO5ln/YiwTgmEDPVeMbFMTpftdBRCLb?=
 =?us-ascii?Q?8OSSj+dmwlrRY+IUIO3NrhkKzikJslzEiu+CdZg2szKr7edXJvpQoN88CCbu?=
 =?us-ascii?Q?7GCx+xEEuA+QnaqYvPXLrpUafBqQLXTv39TQQg5nMUxZwoS9slWhCXwDTA6y?=
 =?us-ascii?Q?2ALGsBQjlzmmlVJfi9L8UN9rh9i4QSOtUewdbP2iyKEnXtn2NgOxh0GbguGl?=
 =?us-ascii?Q?YiHld98CUBs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBtNrcp0TxPL1dCjegENv22FkEWdEndrzKlSc1f1prl27LaFTWXJ2mShQ2dx?=
 =?us-ascii?Q?yLA5JZxLR4qyPwXURq5mg2zVw54NU5w/lnCvuh1ldqFBM92OejqCU17cr0BP?=
 =?us-ascii?Q?T8RADecmTYVnM/QRctA+W+lWaWwxO9wAKoFqT2DQbujbIeTSNC49eC2c9Ovy?=
 =?us-ascii?Q?zfdQbJvAL26dVElWSYHfVGsmEcuQpR9n9lrhEw4CW/OJH6kz/FSjug5wNArV?=
 =?us-ascii?Q?B8B3Tceykgq4Q/tsY3zstfGzxW40XiCh7OWT+RASsxVyduMU0Sf6n0GwD+Kb?=
 =?us-ascii?Q?p3zYMEREj5Ypa2zBUp3HPOh5TuDBe+Ke7hXGf3V4AnVA4AK6U/A5JzSOxbKK?=
 =?us-ascii?Q?C76ZnkmD8lQcUeqkga1IzEFpHeOvWeUWpCN81XiaeYPotvO8mqQ/T1gy7wR9?=
 =?us-ascii?Q?tmlbe9GFqGJROZ99Jxca/el/erFHyWoluxlM2hdK+rTEnjt8COp7rasnydAQ?=
 =?us-ascii?Q?6aogSMCklcuBinXsu1z+978PtxkJ50+jSMwUih0lxVNodzxM0Cd+02dASpfu?=
 =?us-ascii?Q?MeGOy8rp9CNCm5hBpyf427Y4dSeGbpeyyyYLMRyoz8522ksZanTjUgp5+DIq?=
 =?us-ascii?Q?KFTewNikXP+xryCcoKo26zS9MPpcA0HwMazr9wICg67ZFKc0cENo3AgHTBG8?=
 =?us-ascii?Q?WVx4eaiRNyEnfaxqchTSve17AWQdjyedbjlKbhfW+BT6BryzBdQFum9tNlhL?=
 =?us-ascii?Q?lnivAZAkLIpzPkB2fi2NPjwjqz+UuTkrpOLtigFQwZaBqm5Q6k6Q+OCqLV5l?=
 =?us-ascii?Q?399XN3kPleDZeYF/WhOHQj6BldeksuWcae2n8z4UwcW694xg7oTFHymbyw2k?=
 =?us-ascii?Q?3bJGJx9xNQTfB9hpH/iOHVfjrh9x8BerLEWyZyMY3EcV0Pt4mFfMfBiztKEN?=
 =?us-ascii?Q?XGUUhJOaFXNL5Qrkv1FRtqLQrQNxphVE4gc5X+/4K8JF3HoQWiYOqRL7penF?=
 =?us-ascii?Q?UtRamj1N5oz75kfnQzPUZ8ko/P9Fgsmko1exr02dM1cRAsFowkpoIUAo4hy+?=
 =?us-ascii?Q?NcXRyJ+y6dMwU4UQ3fT6aCP0ILMOnedOb4aVHM2dVvGSLubPVpHtTobyk80k?=
 =?us-ascii?Q?iA18lNGcxQpjgUuEkhwheru6jJri4WUejOK+CU6qKK6IEVpSEzLl7p855h9g?=
 =?us-ascii?Q?pUT0Us9zTI1iBZSUS5+2unSAVUIrw7t2ByFgffwOgLG2HbjbYhzg71SN8Zxj?=
 =?us-ascii?Q?gp2rfdUeZQ+X6SLqMWOzHxvYz6oMAMvGWVh79vEQDYXSfVg7xX2QtfkgdlDD?=
 =?us-ascii?Q?fvK4c2IKp2hRtB5qvJh+gV1M+6DZF4h/HXHiQxdVx6Fi7qmHuTwK76Of+12Y?=
 =?us-ascii?Q?HzgmdrvxhQFXxbgoVdVL606rUfAm6xgo4suqEuGrCkqGoLN5u5Iq4eOGWhqs?=
 =?us-ascii?Q?hHzrI/fTPqNCzsZ2g2Z+3/DEhRRqDtK4T2kvt+OFPRLfqq7fp/8TFRuBFoQF?=
 =?us-ascii?Q?uVGYuHj/gYM5DLXWwY+YehCquBH0oVrcJLsd1s5mdy0tWRk5EKVc+nYyLXPc?=
 =?us-ascii?Q?iixvCTPS6+XfOn7nOox0CBEysMUbl647/TLLVcwxI62e32oLwT5B3lkJyCtr?=
 =?us-ascii?Q?/9rt3+fnW1JsnHEc6XibwyiJSwIFv7ILmqKU/YPsPCZoQV2Pu9C+PN9DyhF4?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42439fe4-353a-4ed2-289a-08ddb23bf49f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:54:33.4665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUXcL5bYoHDwqOC5SvMmGdLvfH3CwRmP6sljAaoqEhASYwvd1ZIdDCQM36yAgh2lY/q6t8NaAvOaXgBp2Lt1XbfNRVghzQevoDSzq678lfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8332
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

On Mon, Jun 16, 2025 at 12:06:39AM -0700, Matthew Brost wrote:
> 64K is the fault size in Xe. Add sections to explicitly trigger these
> faults, as they are interesting and having dedicated sections helps with
> profiling the KMD.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Nit: to help clearly identify the tests, we could rename the previous
section from "many-large-%s" to "many-2m-%s".

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_exec_system_allocator.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 2a99bd435a..65d281c784 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -806,6 +806,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * Description: Run %arg[1] system allocator test many times with large allocations
>   * Test category: stress test
>   *
> + * SUBTEST: many-64k-%s
> + * Description: Run %arg[1] system allocator test many times with large allocations
> + * Test category: stress test
> + *
>   * SUBTEST: many-large-execqueues-%s
>   * Description: Run %arg[1] system allocator test on many exec_queues with large allocations
>   *
> @@ -1741,6 +1745,11 @@ igt_main
>  				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
>  					  NULL, s->flags);
>  
> +		igt_subtest_f("many-64k-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
> +					  NULL, s->flags);
> +
>  		igt_subtest_f("many-large-execqueues-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> -- 
> 2.34.1
> 
