Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBACC4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 13:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D8F112CC1;
	Fri,  3 May 2024 13:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxkZQbno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E812112014
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714743299; x=1746279299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DBR91KKW/GgXW2mUHkcXeko4hJ4JGjuscf2X4WkDqs8=;
 b=lxkZQbnoEwHN/4OOaZD1x11HviZG18PFprjwPNTMJXDP7ZopDr+W3tPX
 2sOUL1GpIOlWu8pEbFGETz6rmdqbD9Ime3HWcXlemDP1SQumblwyX1nUb
 b0FqThpiB7bqe3gJMNEU/GLw/SbausbPez+hAwuBoDot6fy/ej50XZ3fu
 DSyaVvG9luzBXT23dLTR7V8wa+Z2qn3iG1U4q6Jn/oNTfv0rXVPpXxLg7
 67taQLqK8SEmFHiBlqcmBesNXY/5L1DQ8lvj2EkUOd3B/qCtYn0sQgv0U
 WuxlZTypnl2sotEH9Igg1bsa7Fo0s9NqgvBoJIaLr48hi1DV1697cpkz7 A==;
X-CSE-ConnectionGUID: aLnnN4H6TYCYhTv7O67+7w==
X-CSE-MsgGUID: d47K5URrTNS6Q78Vr2ZbDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28028181"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28028181"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:34:58 -0700
X-CSE-ConnectionGUID: sdeHrUyOSxurCaUgL9uZxQ==
X-CSE-MsgGUID: DCYgVO4TRCuH5s9ryXyZ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27545434"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 06:34:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:34:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:34:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 06:34:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 06:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsIkGt/vhzfF0pxHZ5NSi70To0OfzxwjSyv+CU1R7kc+NZxcJaZdBzJ6D4FHHfA2r+swG6nqVA/6g1QeSnKbYAWIu9iISH4C6ibPtSLWkza4NfVHGNy4qFotW3ag0JAFg30iqjbvkrNXySdDzE6LafvCEjeZcQSPHSOGhEpiG/9lG55ULpAfK4vWsArWqE1iQKq97mEKgB+BovHexoUyPKBbMA9Dzom41AAH3C26HTZXwP0GI5UMyjN0HXch3nWucdousNOlB3tLtxANEIBt6Dc9yAcIMuKp6jyr02dFeV1rveEfL36mRZwA9qDtDitmCO4cMi/ScZh9V61f0n4jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=686dDz849tVz7PRejp1gaQq3ha/2GytsEBu3esMcWc8=;
 b=M3HcZccv/gVvCI7bIz3S4s069FZoQK72QTIhFlcDEdx/6nE7+LBB2oAp+oRQ+Pk82PAKVXAmoz3Jw25TqLlekt8eCRhPSHpFnqWLXsd2ED/wygX2l4YR3A+rJxNbyXkWHxNFzDaxJCYLKjfkWBBT5FyXQVB5E7ixXp9SjffHJOYLrFIA9sTSam95XBzwovDNuOMsYVWHIrKZ04tF6txaTC3t8rRBorbLQcm6s/7Nnfd4ekylKa417D9yEg9KIg7ffU1rTjLFLyURHagCWUU7JWTBpjZNLpL+sVWSGV2wsCsdiwlVG+MJzBBpwO8dAClL3u75l1UuaANm6dCTzcN+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 13:34:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 13:34:51 +0000
Date: Fri, 3 May 2024 08:34:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] igt_core: Update doc on generated test-list.txt
Message-ID: <2qjohrmswopw7vwoxc6o2jv34a4imnd77g2shmlyiyljvflf7d@whfxdi266gwh>
References: <20240503115545.44784-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240503115545.44784-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: SA0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:806:130::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 13187fc7-5fd2-4039-f8f4-08dc6b75cf6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zZIWif6RnKV8VDwbKfK8CHE00dYbiRUR97kYhj/BVQQOz8f6XkeWhszmL39p?=
 =?us-ascii?Q?TPP2DWppHB8+RAgUaPUoAocmDi7V+xv16pQ/axfIaUa9udu3UlcDiknMWWEb?=
 =?us-ascii?Q?ufhylQI9N1zYAViAlwpY2istWraubspEtRSNiQBMf/3himek/WFdx/sp/jZG?=
 =?us-ascii?Q?HTEe8TH8CMZ5o1tzb6ciafRhY+bIpoEILXDdr8tv230rwu8u+ThDKGdLPNQn?=
 =?us-ascii?Q?EnaPJ5+5UQVI0jOkLDwWjLlVBltVmP9bNfC7M0WVOhn7ljXJaVbiT9Gswvcl?=
 =?us-ascii?Q?uvrTREP0K2CAcbafL8bTnK4zJFtw2AwB0RGPV80D1XprwTCNnfSVoe9wKwAq?=
 =?us-ascii?Q?I5FvABbc+nHzE1Je/OX94+uqnAz3Nq9weGbiZITWCakY75VOFrC7P89EAA8V?=
 =?us-ascii?Q?Ys124HbxiOR5ijPxPH2sJMMSIohS1kn2O0qtjywQokYJQQic1aTYKDe3rVOs?=
 =?us-ascii?Q?DGyMO71BD2rtxmIxZu7eKxQa35qwIWEBEU/6KdqFuWgVo99z86j4OXFR9ai4?=
 =?us-ascii?Q?MW8URoM/MvVlVtnw5hjAdgoTgDqnoxCvfhD7vJFz2Zn6S1uQK7hRsJyOmjEb?=
 =?us-ascii?Q?hLupqYT530BO6hfXDX6SMXQkbmug4ktc/VHiXw5eupwenDRWrZldm57gii0S?=
 =?us-ascii?Q?mms1MZ37HvlS5NnJcZhB91PYxMb53IyNX3698X8EI8qomwmA5dEjByGlpM0u?=
 =?us-ascii?Q?t7RaP12iLlPKZnyXW4vP/VcrOukNVu/47242txrUqH9vfT+bbaXtVclu1mj+?=
 =?us-ascii?Q?m/yOcT4ZKME4rtZqhgPjGLJhl/Lg83coD+7Vg3t/WSYqwSfCqs55t2XQ7oAP?=
 =?us-ascii?Q?v1bKNZ+qlljdYR7/YGc5DyB4vzUSrkf5taYXOE0u0jDcSwrxWPjpAqS9KJ92?=
 =?us-ascii?Q?lBjawO1kBBdYqxyJD5s7yGAM9I0MwMNTeC5hJdB/empLnhcBE8E7i3WJRESc?=
 =?us-ascii?Q?/GGYpmfyVfMeEol3eOb52lMg0UtzYw2vEudX1AXM6Ka5qm7c7BlqigWIvlJ5?=
 =?us-ascii?Q?EJR4Hd+p4F+SzSiCOP2PGyVLtw/HjqBuz7CkNQDquGgceBqtD8da6aixwEAz?=
 =?us-ascii?Q?oJYgqlGXGNaAvoO+PFL9GFb/rbR/VD2B9V38rJPcyUW0SEV80iVes5pNMifL?=
 =?us-ascii?Q?3RdQ4SiRaEOuOzsNbok4c8+AElKl4vc7CM+O/8N8e6CziMcK60HM/pR5Aucq?=
 =?us-ascii?Q?l1Mc6LV4skJ+6thTXhXqm2we2wmxMlIs56f1vArgOfZHK+cP5vf7+/GiPTfy?=
 =?us-ascii?Q?VojUQqOtYZBx+99pwqg2HRlsNknXjGpkvpl55cea8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Vy89Q5Mh18hwtw1H+m1uCWHuyXWwlmfXm7/vkACpzq0okL9sSCTL2JqBQMd?=
 =?us-ascii?Q?Uj6lXmOaOkU7ufLp3Au/f5yfqRRB89ZiY/Gtvh070Sjv7XOEvgB8X38KHzSa?=
 =?us-ascii?Q?xXZuNPUed5akLvQvBxKQnhJyuqjCjNZzTCsAlgbeE0C1TBkgJXR5Ymb885Qk?=
 =?us-ascii?Q?gjGoQCK3hSrXp282yXKWZBJjDi4JaJlPDW91Bo3TdIUFxCeOYAM509R+hfHd?=
 =?us-ascii?Q?Pq7LyRUtR+eK/fO+NIKrnxKd40enrx+KF4kxhxdzButMjE0gmbQ+amGc7dt7?=
 =?us-ascii?Q?sn5bDX8Rgi+Pb0LToelWTyy74ideEnAPXVHfre7B0uja24eta2bYXhZaK4Da?=
 =?us-ascii?Q?TUHHyxaUZlZvKZH49arzQFYSaJOrmxKdhgFccTIbvWGrAJBtxo836MfHJr6x?=
 =?us-ascii?Q?Ppa8yE06pF2NmS7uE35ReY0ZQQIL1q3/6olBA4NzJv3NANOY3NebznGZo37D?=
 =?us-ascii?Q?yPG6WMvtLhhsZ0qtlP2bwv4vXhGHITU2stiUatJ2MPRuCgpu1R/2OWpEVPto?=
 =?us-ascii?Q?ud24o1QztmhpoQ3eWM4Use6rR89vBbU2LOYHmY+jqAm99YRmD3lLRmjsk7LL?=
 =?us-ascii?Q?q/2t1DQ2vvjRwUQY6cT3bKBXkm0w1dpiVXmKCk9lYjGweMtSP7cWcfbajC4/?=
 =?us-ascii?Q?VmFk2GQyRZqGJ4Y4qnN/YQz+3sjVzEq7M+wzNCIBC7sP4uHryUcKokEggGXx?=
 =?us-ascii?Q?3AZQZwmyDXUIAMx9z0Uzgwvuz2wIlUzOIYT+WuKKIQ2neGBytjIkm3vcEQQI?=
 =?us-ascii?Q?H8Q97dUYTTaV5aXGPPd675y5SCLsmw8CnyKyLF6FjzhHim5Dxf6j1WXUxUOo?=
 =?us-ascii?Q?vbWf8jCpfNIUkG8TaGlWXY4Wlahb7KMImTwPWIUdrwoIXRUn8FXgUqpe2v8t?=
 =?us-ascii?Q?1POxg0QH5rV6TptclmcMxHGjaYwQvrz2zzIXAU4vvmMHfOXFSfR0kTJbmz9A?=
 =?us-ascii?Q?YUHcRwNaHLtkh82PHqVkmWCO8Y5ki1iCbxV5znrw2ibBMxTfeaXpgH9B5f61?=
 =?us-ascii?Q?3TxrthqXP88azbJnUZoGIx6yY3J08s4AfRMqj9dZh05rAk5ir98FrMwj5i67?=
 =?us-ascii?Q?+Crae3X9o/NjZ1bPPH3ZYIUbP4GL9Gx9J7NQqYtCirofpbFYIFvyGkV5YHfY?=
 =?us-ascii?Q?ZPoPDfM5XKH3CLOt/A0zIJ5egF0dQXZ3BQ+FmpB5RW4UX827viqOZN1UHzG0?=
 =?us-ascii?Q?qj5gNjmqGo1fprmFiirtiO+e+2v8ors8pFCxRcqMn4LDBe3pihEEHRIvnqjj?=
 =?us-ascii?Q?nXsJVciyZjbNUpjatR79TkFCoEMaFQC4TxcWJme0oZY4E0VOXnvmT3QPF81Y?=
 =?us-ascii?Q?4z7mwB/0MzAFQoReI2shu35Gv53lFUzFYRz3ArDjv44tndfDeMfQVlS7xQqS?=
 =?us-ascii?Q?MHsbC6vZTBH4ansNObRekSz0P1CpJj3pm+vWVUiTVqYdc7ldFU09bW8vBPd9?=
 =?us-ascii?Q?xzUc/7qN7vqilInOXkTGdaueh5IbZJ+bsKVJjBALzbiJK9qrHE9nJghApBlK?=
 =?us-ascii?Q?Vay6f4tC/HYS2czTfWfDu85mtRoxXxEo2ATeQvEXmqb3wwngp5hOVXc87+Q1?=
 =?us-ascii?Q?MW4T6TIHd74FnQTcNzsz11Dpr5bWq0D3R6fkE7NF7Gh6my1VNt0/DanvG7p6?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13187fc7-5fd2-4039-f8f4-08dc6b75cf6a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 13:34:51.6410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLF8OV5wERhmWD5IPumRwlfFHAbgC7y9cKylYWsl0JnHTLlChSFg9HyXGwpjxxtIIgRTmuoBqbPWtZQb5tDjsnnHIzqLmAquE86iXFawVFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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

On Fri, May 03, 2024 at 08:55:46AM GMT, Gustavo Sousa wrote:
>Commit e72686b83b0b ("tests: create a single combined test list")
>updated the build to generate a single test-list.txt instead of the two
>single-tests.txt and multi-tests.txt files. Update the documentation in
>igt_core.c to reflect that.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> lib/igt_core.c | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>
>diff --git a/lib/igt_core.c b/lib/igt_core.c
>index 1abe3d3370d1..3ff3e0392316 100644
>--- a/lib/igt_core.c
>+++ b/lib/igt_core.c
>@@ -217,11 +217,10 @@
>  * On top of that tests may report unexpected results and minor issues to
>  * stderr. If stderr is non-empty the test result should be treated as "warn".
>  *
>- * The test lists are generated at build time. Simple testcases are listed in
>- * tests/single-tests.txt and tests with subtests are listed in
>- * tests/multi-tests.txt. When running tests with subtest from a test runner it
>- * is recommend to run each subtest individually, since otherwise the return
>- * code will only reflect the overall result.
>+ * The list of test executables is generated at build time and stored in
>+ * tests/test-list.txt. When running tests with subtest from a test runner it is
>+ * recommend to run each subtest individually, since otherwise the return code
>+ * will only reflect the overall result.
>  *
>  * To do that obtain the lists of subtests with "--list-subtests", which can be
>  * run as non-root and doesn't require a DRM driver to be loaded (or any GPU to
>-- 
>2.44.0
>
