Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B200B606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 21:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G65ba8Hn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543F210E0E8;
	Tue, 20 Oct 2026 21:33:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38E510E0E8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792531954; x=1824067954;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XTThcIo64e3GTOFefnnhf1hVCq9wAIorbMofWnF2q30=;
 b=G65ba8HnDIY06qBYq/a2sIvTzCGtjrB8jCPVSw+fVqc/VwlJ8MKuwPwI
 sEDZk3lZg4ssbEPVJgwWnPh522OhHsyCZTOi8aNkksSscW9ajMWY98lRQ
 NgJLv0840zhN7racghGuxhGA+VS+V2C2nac9cFvrSYhua1/UDfYy4BUaA
 iw19gdqh41EtlwOGYGbBWjbZ938fIHJD+747rbyIeR7d09QqZCnAhkzZi
 sG+DRkdv5oe4MMd4OHxI9Kwd83Fw1LY9V7SERFK4NP5lUWgze6CfyNtUe
 6oz00lzNp2FOHtZVnBt9wN3rl2mWT2x7kGPBFKQa2I2sBM0gCjTYJp/K4 g==;
X-CSE-ConnectionGUID: ZgggWwuLTQWR5kYC4HpXmw==
X-CSE-MsgGUID: 0UPtDqLJS7yY271dshnn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1263220"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1263220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:32:34 -0700
X-CSE-ConnectionGUID: F+YrcvocRXWRSkqhkHqVQg==
X-CSE-MsgGUID: ilYe248iS1SW0xtLVqR01w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2805736"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:32:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:32:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 14:32:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFqy0mSU8Jb4GeJc3ACLs5ofF4dSXmH4N4YmXuPl/ume1Fe0F1UB5OHQC2WVU2yyFaAqFL0waeo2ymUoR+MZvTgDbDbQ+kC5wCsHvidyuiLVOiYh+kzYFY8ZuBRg44wCMimz0X6VZH6R2AZmV/UB/TmF/YLCkPBhHKG3THRDeyMbzWB8nhdt2ITfzGJquxMSEZu8FR4kgA/Ca6ynnVWMig6bcsU7nU0m+sSqJy59fmIMvFDtESO5JyG36o3kBjb7g5mU/WPOgp4AAu+wJpY4/VwavJHS2Kgu1Mz1gV5PZr/ism3Nsb1b6l1tL40MRi7Qrezbz+qSeHGFGNWqY46HNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsgqTpckycaqCkZGwhe8e/EbSZeh8ErA/Bb4yLSRT+4=;
 b=Bf4sbI6PuNq7JZ/mMiWsNPYOd4aSHyR7uOIbUBKOCAPzxOaqLCPvaFsUHF20uKBrsuKH8VtVJOE+Yp7zqsqqFBIlWmf/OPCdC/R0l7Rp5j3kulOUdLDPPD+DXcUrOUVPjbBWiYGXdyY/YIHAWzLwRv7vlDRvwFwrCLZLI8//581zToeQHaJbmhCWI6mL7w8XOHUVh3a/xXp0l5OCv366PGgemngFp9GnhkxbI8VO7Aoi+PZxcSTYB8MumbFpyHp85NrOqeurMkEPZCRnt/1maAHvrBgTODG+TEeKOh371dGC5YppFwavTVqJ3DyDFGgWRDceTnT1O/BZ7dMioJVCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by LV2PR11MB377618.namprd11.prod.outlook.com
 (2603:10b6:404:301::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:32:30 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 21:32:29 +0000
Date: Tue, 20 Oct 2026 14:32:27 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 05/11] lib/xe: Return boolean from xe_wa()
Message-ID: <20261020213227.GD180749@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-5-528b575299d2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923-wa_14026539277-v2-5-528b575299d2@intel.com>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|LV2PR11MB377618:EE_
X-MS-Office365-Filtering-Correlation-Id: a405641c-4f45-4f63-3964-08df2ef1a4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10070799003|6133799003|10067099003|18002099003|22082099003|4143699003|11063799006|260925021311599003|260925021911599003|260925022911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: /C1YXUXZIB2YuRzs/DfUOBScbkqmJpXvN3HEPqOaJUB2SiTFLXu/qt+ankg2itKrmGklxsTYz7MwW6Zoce+3IQET6vveSPJEgyizfOZWs5xduBOr/fsChBfn4RJPOoOcDsJdYSDEd6k6ZMjPyTpZzePbW6vIDl/Ua0Jbv528uEMsMRc/BirufgSBu7ovQu7FrbkscVQWNPlnzOFCDibTGAnYUdr6Z2/qmjxT1hPGdY7CvJn9lEjbPuSdLCNlw+vuqhHzfbexV/ATuqFoM5rwTCvjSLUdSBj2UFbkKcefN4YMTvzJUNZj+KluMab0b3S2WlUpFSde8mOXCYUWZapIXyZPYDMFmGtAOzy3yrEZ0YZxJ8BuIAp+ZaBwK2hF7jRdtVWPRhR+ozpNB/rtmQ6dWcQ30SnMMcCAel8p7ZdiSXdUDb2O7mywe2hwahGWjuED+YeGX9BrawkYScd1U0vNobzf30NexAgOIbsY8fZKeOhECW/vIqYqNSJgkbDbJpbmFaHAL+xgKZy9EZ7g9Ia2dsdGGiFr2JXqI5dD/y/yZxXHO+dBHHUVCV7NR98kUOEQsRlWMMPf/I2RQlS3agk4dvjMGEDLgA8hYR1CFyQ0Hhs1yvj8MaL5uXU9YQnYb3/CuCxHPdB3TGM5Gfg8AN66Fsg+haYD0hQC+3KnLQtfyPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNy5qfsMS0HbypyvYjwERjWhwez2je7wG2E0NADclg0Ia7xBTreWeB4s9wmA?=
 =?us-ascii?Q?LAqOCZyYyuGyP4PqExrj18grwKi9RXbELhXU+NBR1iTkjQdI60otRShLN1V8?=
 =?us-ascii?Q?hLf9epU/qVjm1idE1adtOMO0D6NAVIOGx5hh3w/jwXFXf/jBZ8O8BPHGCNxu?=
 =?us-ascii?Q?pdrquCC6pf6Eaqa+PFK36lBFfxJyOn2NqP/xc2B7gUJdoytTlxCUbcw8ivkb?=
 =?us-ascii?Q?vVAKpRnozXK1l2bBn4Kujmk99UfiqgUhPiGpsXgN2bxQlLLCHOs/dwh0dOGw?=
 =?us-ascii?Q?oCgx/krDBL6AvAbuAmaBxTmJSgNNxJf5D+MbWhg4u8FKZvG0L+PqOVvL0qbf?=
 =?us-ascii?Q?JyQAkswyj9AG0YacFRtesth0eXCYPFXQMsYSL62RuiTs1zjoJ/GrO1yYz8tn?=
 =?us-ascii?Q?mM0OiYLELSVw9Jp90apXwi3jZIjBXHIb1zr3X7EJoH00XBWLiMhluma6pXuP?=
 =?us-ascii?Q?wWa8lfovbwNotKZ66ey8e0DatZyxCXjSshfxBmiBUrLXIeE517AuIo5WF2oz?=
 =?us-ascii?Q?0Tdp6xB2YNEBkci5pyi2Hp8jHtNN0Wi3Zob8WEhrWLxiQElD/BrFT+RdiKvd?=
 =?us-ascii?Q?2eCrD0XNL4gAxc264OgNSW/so08qw0w6YKLZ+DSrbpugSbXkwzftQxWf6fD6?=
 =?us-ascii?Q?2t7X1CPaZZtG4aMO3tmoOF2Rhorsw1yolZcc88vzaFSm9WU6e1Xp5ybWMNCO?=
 =?us-ascii?Q?f9fd1XxhD2LIFxw+aY1XGmRPLzxINX8gxU1exGYPqZW+dmYSCagIgB/5R0ta?=
 =?us-ascii?Q?d/r9+X+F0IUaVXMnF8eKYefPwvz2XqTawD+iolEK8MwmZih52LAQpX30PfSi?=
 =?us-ascii?Q?YCHLFaUG5eg4Q5tZxEiz1yCUKZZ/Jw3I/RqO3sol+69LpTJUXzZbxh8AvG4p?=
 =?us-ascii?Q?lRPUBPKCW79BGwSICrjUegd4OZ9VHHnGXwK7BG2l+E2mm2FAIHFpYe1J3fhd?=
 =?us-ascii?Q?ohNSo+3YYux3sozvpIO/dOviQfdCD3BbQR5dSnp/rfAMeoHEe2WrkUsF8Rur?=
 =?us-ascii?Q?rmcXw7W7VXFyAhE3PkNNTwVWzZ0EO9ZOMyR6bylOinTiq42RlEqc2DqJWhv7?=
 =?us-ascii?Q?oDJJWtmZlLLaiKo+Dfb6F29rypAtH17nR7SOQZlnHpyUlOwY4+2w3wMJhPkW?=
 =?us-ascii?Q?VFakLcyMEbPyFWSDFV/MgNHJ7kVVxuexZufBOBLiU3fX6swIEcHav+Eh9fJE?=
 =?us-ascii?Q?AoM7SADYPl+2dAO2DcSVGNVCiZn3k/p11svLoPHj8bb5SKc3e31UGh2ByWWP?=
 =?us-ascii?Q?EypbhIA9Ws+mYYagtY+xh+BxEtvD++UeHzJor1oNwhfkseluL9nQ2NEgMf/b?=
 =?us-ascii?Q?v6X25L4syOAm82EEsfPmwaT+Rk0+Iikui/ngPgoXeAqsAe4NKT4lYWkBhjew?=
 =?us-ascii?Q?3gw7jTIhZizHTAhx+/zqGxayOQbnBy0mLdVFJns3Bhmi3WcybFcAKkwKZ6DY?=
 =?us-ascii?Q?8KvOsGY7gvTPLWK5/nhlwh0UnMjKd2T5aPtjC0BIHNDC8FH0+m29Xy2kfLiy?=
 =?us-ascii?Q?cbXdaN+ATr7BZBhJanV1KTiLKjyvnqz7kYVAQKv5ke6rSDPe+Qa87mTdpoDV?=
 =?us-ascii?Q?dbHl83mdXXz/ccOdXzbUKiL06IldMsid9NS2oRsbOnOk+2ZP/uX85jREvReP?=
 =?us-ascii?Q?XfdZLMsi2TdxfC8k8T4wkHs+UVH1RIhnEUQklHDsn7zGXgHMMUCSB+IaSAbq?=
 =?us-ascii?Q?MUJFVHxsUvNoe27AOfcfYdCxBbwcl4pRKoP4h/OpoCR1hn8j9LbC4u5pCIVM?=
 =?us-ascii?Q?uWZ0aPAG57ammgSKQKIY3i5YuTi4t6ai6HbyVFdO2qphmaRTg7ivOnZNQryD?=
X-MS-Exchange-AntiSpam-MessageData-1: 70toUCMwOgHKigpMxFMXCvaUIi8shpN0sQU=
X-Exchange-RoutingPolicyChecked: rjjvWztu/9g34qIoULI/ktlsiW6rXwtg33OLs6yLZwzvEqnM55oKYtb9cWT6RWbzlmwqp1M0WLuz74lYD0mPu+16kQn8Ki5Aw2bVO+rV1xNRDLiDYk2Ixxrj0A2tjsrhOfA5AZFy5U+tBrUCm9xX4drB1fIYevKDMK7tSD6c+Z/L5aiLO5WI/GEwVp8w66ksKm3X4Mn6UgDiJ/kcrYi5JnOw/uzS3gKmVEtnxrlLZmpDR9Wbkb7edKFQvG04CJU+23GgWp5/8GN6yiYiHPL/gc5IuNYNLqXG+7TWvu23fwp5v6AVU91M9xwoSo+4d0f09kb69cDovUe4JF+8G9/JzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a405641c-4f45-4f63-3964-08df2ef1a4d5
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:32:29.8578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+lW323b+WucQWABkGs9c22vBVK0BxBqtHh7x4K+D+1qIjcXtqq9oj/pUl4k2cbfuhjh4BxAROXe0zt/AJP1z/r7nzO05hcAQYqpF3HmG8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB377618
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 23, 2026 at 06:41:12PM -0300, Gustavo Sousa wrote:
> The function xe_wa() will cause a warning to be printed when an error
> condition is found.  Since the current users of xe_wa() do not check
> for errors, let's just convert the function to return a boolean.
> 
> Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/xe/xe_wa.c      | 11 ++++++-----
>  lib/xe/xe_wa.h      |  4 +++-
>  tests/intel/xe_oa.c |  2 +-
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index 59064219cd96..05af64151e7c 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -177,20 +177,21 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
>   * @fd: A drm file descriptor.
>   * @wa: Name of the workaround to be checked.
>   *
> - * Returns 1 if enabled, 0 if disabled, -1 on error.
> + * Return a boolean indicating whether the workaround is enabled.
> + * On error, returns false and a warning is printed.
>   */
> -int xe_wa(int fd, const char *wa)
> +bool xe_wa(int fd, const char *wa)
>  {
>  	struct xe_wa_cache *wa_cache = xe_device_get(fd)->wa_cache;
>  
>  	if (igt_warn_on(!wa_cache))
> -		return -1;
> +		return false;
>  
>  	for (int i = 0; i < wa_cache->num_dumps; i++)
>  		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa))
> -			return 1;
> +			return true;
>  
> -	return 0;
> +	return false;
>  }
>  
>  /**
> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
> index f0a826553df8..aa1c50c0f9c9 100644
> --- a/lib/xe/xe_wa.h
> +++ b/lib/xe/xe_wa.h
> @@ -6,9 +6,11 @@
>  #ifndef XE_WA_H
>  #define XE_WA_H
>  
> +#include <stdbool.h>
> +
>  struct xe_device;
>  
> -int xe_wa(int fd, const char *wa);
> +bool xe_wa(int fd, const char *wa);
>  
>  void xe_wa_build_cache(struct xe_device *xe_dev);
>  void xe_wa_free_cache(struct xe_device *xe_dev);
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 9571c62c115e..8ce39e6c5064 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2585,7 +2585,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>  	 * can result in buffer overflows.
>  	 */
>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> -	    xe_wa(drm_fd, "14026633728") > 0) {
> +	    xe_wa(drm_fd, "14026633728")) {
>  		oa_exponent = max(oa_exponent, 8);
>  		properties[9] = oa_exponent;
>  	}
> 
> -- 
> 2.55.0
> 
