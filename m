Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ADFC44508
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 17:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1A910E0D9;
	Wed, 21 Jan 2026 17:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="at+Q0xCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190F910E0D9
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769015947; x=1800551947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G/uYJiYBkR30OiGB/PpP8YYOflHcJWULV7kuP0KBS1Y=;
 b=at+Q0xCvYy5K7yazl8sy7rSE67qn5RZzS7cC9Ir/glBWnb+cjl0u0813
 eK2HJSlaLYqn05VfR/Yvp8XOlOFDb7RZgq1YRaxAvlunwoe6/Xm8CDJWn
 c/Ecob27sRCdZD84672DPvlMzRCf7TVpWxNMfqCGTSnkADO9yrmbsqup7
 YCHWyXbIb0Vkys4OdgqrNGpz3xdOnw66fjwvUHbnrd9SY+3udsY+HRllt
 xnl4UfokNEUkNNn9/3QJ1prn4Qs96wiDiEMRho4JShRRPtDOuBe8vE6es
 Ak8IK6eo+NP7RjgayxVrVsZkZys8amwJ0/sb8MdC6utLK3AeLyGoOfyEg Q==;
X-CSE-ConnectionGUID: 15pSDtrZSOGIQQqKfbbg8w==
X-CSE-MsgGUID: 6Wi5NlpTQMmU10pEyxDRQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87661243"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87661243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:19:05 -0800
X-CSE-ConnectionGUID: ua9UNu7qSkCIArkqQWMqaw==
X-CSE-MsgGUID: SUhzpsRQTtC6SEeH+48f6A==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:19:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 09:19:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 09:19:03 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 09:19:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJVb9VAJ/nSJkCQ2oyGb6lJV9zgt0KHmqYqgX5aXA/TmYUMnlv0ZIQu0Ep7Hrc+9IqRbEl/IsRCpML88iN3eahKP2c0t0+fL3PIkrtg4isKC2YrIq5Kni2q5Jgue3dMouRfnjWrj8chFC1Jx+7ilhUzXKwy7TuMI6/u7XZc3DQdGYxHXDj7syv7S6BFfTq1F3VomngECGenSHuQcY4Km/hEjRcyspHHfSB+TeSGzcBdow5sZujmzJCABhTKUVTYeKmaXRsPGw6rRsIGeehzs1Z/eMXVJWaqBAThR75ffF2MYksK2+dMn04etbxATDYNpc2mQyH2qyvPHLu/xVcRDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwEVLXJBQcYti5gHK5W/EaKFnLfgmkyYZQM8rsMi514=;
 b=fq8yTaezUYGIGovQoIoa/MhYHBZNzqe687SGEX8oLixDlpk3yrM6ep4/EhkYP1UQnmCMKeMxccexGv5YIVVI2wJQ26hv0+8LyW/uxzowgyiLvNjV26IiSE00o3niu74Iwm2mI3KHGRiYA212T9uVLeg6+4IPR6bxhJXzeExUp/DvH2yIbQGXroBA52XILHNywo+3TSvdH6UGlSn5RpkOLBfe7XFANA+t8da/hvILxWCopHnqeYu8VALmJvbzgQa50KRNUb9v5UbJ2kVMM1pGlM4SPmuQscib1j9lHcOLhbpSfj4qeqh/c6NrH4koM3cZEGbPA9KBXT6MmALOOGUUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 17:19:01 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 17:19:01 +0000
Date: Wed, 21 Jan 2026 09:18:58 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH v3 5/6] tests/intel/xe_exec_threads: Add multi-queue
 basic test
Message-ID: <aXEKgnIjPNQuQdpN@nvishwa1-desk>
References: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
 <20260121114631.277272-6-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260121114631.277272-6-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: 5931c07b-5956-4b1a-8e02-08de59112b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f+Isz4sQP4SBoZpc+JZ97ngtF/ZuD4l8lNo+ychjFsA8eQ+80XDhLCb9CHvT?=
 =?us-ascii?Q?DJJKb8x3PyuQJ38KYEj+etXsMuEJ6D2GD8zpoV+vTnFqDiuaPEwxsYDoDTGi?=
 =?us-ascii?Q?WxmM8FbYCDqFGQ/osWOfyHts0BaYSsViiKSOqbh09HpXn1YygsX7JXUCTK+h?=
 =?us-ascii?Q?OHpowhhHnqz3ZzYSDIAkSRrAZ1Ew0bf+BZXvmGeUHP2ggBV4Naf9CXpunQER?=
 =?us-ascii?Q?1nd3j5Ju2mAzUHCn/nFfXPLTcFSlNc5ZixBXXwFBGtEMouojuo2c0AeXdnHf?=
 =?us-ascii?Q?MtREzZTAkol4r+lDyyZms+pjyXu3byngXnZuIGGxUmt6kgBKXUVZb3A4e/RK?=
 =?us-ascii?Q?rWkllemQyM+1SJ1NTZaGNI06L5a2A9DR5grnz1ylZjSOzA4sqCl6eblnsobg?=
 =?us-ascii?Q?wsZEhaoqfgLTHKM2NcPPh7s1bduylIDn91SkfEombx+LD6HhUQEMVmyo05wf?=
 =?us-ascii?Q?u4KCZvoOn5lbazYCQqognlemXda/VsidFvCrfCbVrQ1wVVcOJa1oKB9dtPxH?=
 =?us-ascii?Q?GD/eY/qR5JJ3vufDZGJK8pnCn8jCCWRrkbMkVpjNiiWWpVsrH/VIwI3Mx6lD?=
 =?us-ascii?Q?UKw15f6kSjhnOL8dIIS2Ekm2U2fuHF4Fyt5b3Tf/RDK3MHSjdeCrB4Toqbi8?=
 =?us-ascii?Q?TvECCSSVxSFgnDxzD4WWF2a3Q4pHAL9JXvFVZQlXk3QbLBUbkY0UWGuhwltp?=
 =?us-ascii?Q?Hof5j0xnZnE14IIiZW1FeiCWu1ZejSA0AfG0l7pu8FreBT45FUyhhwcVt5iY?=
 =?us-ascii?Q?ab3OlfpNN43k2KMeqTZtYSyXPCSJcM9UhaPzJxxfz5v+Lwfld1ywt0FKMkQG?=
 =?us-ascii?Q?ruceQAyDtk6SXsD96Lf/Udca4NsyWErcpsmlJg7qBQJrGuW/ymE85WlXPiei?=
 =?us-ascii?Q?FJ1QwSGeMfraHhyMjfxG4SzoaVmmtwqCRoM0fLXvaF5blFvcoKY35vjJWZna?=
 =?us-ascii?Q?LurfRpyNiO5S6FPZEdQ5DbOUnfHBGuHKuEZuPDeVZuitnHUuggGP08anI68T?=
 =?us-ascii?Q?YsuwolIFlxk7vnFDRvfCH755d1q5bFO3DkrBT0HqQZKDqVppR8CkDaM8+mDE?=
 =?us-ascii?Q?5nIntgePa86ZejH5FtRe/DubRC6wOLfX7sgxlN3BQZTs4buDZeiPGXukQrKT?=
 =?us-ascii?Q?WkKCXkchNR4HSEwTakHLMTtFWWgotSwmjmVfuum2q+tij9EuFq4E4dG9vGVX?=
 =?us-ascii?Q?UMjbPjXuB5dNxTke4fp54CE5YCvyP3DKNAnb9iYUcgUrRu2k8Ap4Ju8IOdoq?=
 =?us-ascii?Q?wTmvoUj8gIRaCk+RZb5iqPfS9h8Gf7jFc/75SfaryjrXhbPTFV9fkC8wPXfC?=
 =?us-ascii?Q?35KafNuYUzgMdIupjhCaLeh/FAKl7ARwjPfQ19OCnWOvER1XYOszOHDU4xzR?=
 =?us-ascii?Q?HNAZm2WkWNLLHOqxLOhv/6Pqmo9tgAw7oAqd5aa7ifESh94ktabmc9fpNBt6?=
 =?us-ascii?Q?rYnRZh8z7v/hRHlU214q/AuAPdoVlBecCxC8lcTEmu1Dvi9hig7Xmhisojf/?=
 =?us-ascii?Q?5tgc14DBMGRiHU1pA2itBGmUEnbpgyIXHNWtpjEz2klYLpxbBjD/OLVBuLO0?=
 =?us-ascii?Q?feh4I2xFQ6Wb2SclJAs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lPILNrt/S93tqBSlJDPAqohZPwpkCfncdMyIEwrwFnSZl8v6HDskKMDUveTO?=
 =?us-ascii?Q?2HRIDdZAsqg9/qSSCh37Rix/FWeLk/vqUBeDKbS0a+hOn4Tezgm/v5LYDrzX?=
 =?us-ascii?Q?p4UYnsoyY0B9qcHqukh+5XYylngeTnqFPWxbsP7TURbe/wcvNO2EP0iLXsfr?=
 =?us-ascii?Q?vqenS3TFCqxDqaeylGtYyfTYaVH6rHL8jiJCOReMGlaezgF1mjaDarny5C+s?=
 =?us-ascii?Q?qULfo4LVWKB/Un7RfwM52FaX1kolyK9d52zArL9D2ho9wEpC8m2XZaQciHCc?=
 =?us-ascii?Q?RuCFVTF3teCE/iVyVe0UJf4Ap+O8vR0BjSlDjKjR/wccT+P32OI9zgx3/Cb9?=
 =?us-ascii?Q?yVfCVX2aAPlaSsWS4G1Sd77j83VfPlPFjNATPgdJXErA/4yChQg2BDrYHJeS?=
 =?us-ascii?Q?sOpGCtkNQFUDz64Igctj8awo8iQmV21zFEmMkoDLTzokwrdWZZ1Ka7tUNC/R?=
 =?us-ascii?Q?FlKkJnj04YSaDsQBLXmqWCFrelU3/rfxO1FnDoltcUswhs8cV8BjJz4bKPKw?=
 =?us-ascii?Q?DctIVAvkfceGxiM9j8GoSJG4BMKszHhZR8WM8TulPBUtI5frr8wkeAzWYCTz?=
 =?us-ascii?Q?JoVjKLC9EIW+lf2GVmjfK8Y/Almzdhp74aaKUyTJluNNGHZyFLOCNJIx+LHe?=
 =?us-ascii?Q?NLRPeB1h8g4wrL3y+5fTdHW1Q9iFWidbQHl6tjQbcQWYdO/jUqqrJG2sVAYD?=
 =?us-ascii?Q?mcj7FHwaG0J9MlysaogBQiFqU4a6AG2seARHV863Ic/Kw5wkP5xmXBxJlO2T?=
 =?us-ascii?Q?r9KtmOQM21zKkTVdWYeC87q/6fV3oN2s8Q/yWPkUJWq7q18XNa+EzXPFLRfk?=
 =?us-ascii?Q?EbBFSxyAg8fMkAyma2T1e5xeKB8D0QeYAY+WCxQIHMXEU8YaevXJ1nM+CSae?=
 =?us-ascii?Q?N+T7woKDVpV/0911AeL3j5hugOsxb62P63Opw7mKJpUwZS1iPA52/O8i/t0e?=
 =?us-ascii?Q?R9UZHqTYbFo4y6fx0GZHI1fVY/GZpP94ozcY3kK7vU375JBMYVLhctdNOiuS?=
 =?us-ascii?Q?iV++iu9tAbrKo62dOPVqmLNOVwuiRIE6MWQYoR/3yrNegL3ExefVINHBbC9N?=
 =?us-ascii?Q?7uICJUh8A6YKiz1jc9BnnRap3QTqRjfu9Y+hW4BnXsR0DifY7GGW/pBFtwha?=
 =?us-ascii?Q?pzfWavzxkzv5DhKAShd/+j7m9qYwDYUOVDlZTUDQkC7vO0ZHAEAXB+WwefxN?=
 =?us-ascii?Q?ZfnExQi1JObhxBNgiMsShu2sL/tOFYVKDPU8sFcRWnnKBgCepmuDNtVDWJyJ?=
 =?us-ascii?Q?uz5T9Jv8HP7TlDN2/pfpGWiLMpmwBswvjnC17VKQec8OKtY+jhckJo082YH5?=
 =?us-ascii?Q?G9whsnjKz0P0SBW7ONRNopJTQTpEpTFG1MUu38DDVzYFi/b2mf1kISeYJwFc?=
 =?us-ascii?Q?sXMPOgqo53vY4NP8SjSWWq8KYRZodAkFi3+TCtz2Q1loU9KeBwJ4p/epGwOi?=
 =?us-ascii?Q?IQgJXX7TMQp4Txbf8rALDrAWueROyGb4XxO3Cr323XqE9q7lAxNBlpdhrgJl?=
 =?us-ascii?Q?1RgEKketmzxdBypb/aY2zyVhSDHP/ARcFkQjQvqFKV5WKcQ+4w4FzuV+7Z0v?=
 =?us-ascii?Q?Bv+lswkZ9rUYxz7Xjrx8yxmyzXSRRcT2ql4nR1wDc+qrjh3UlRPw2wUJQdzR?=
 =?us-ascii?Q?176+5F0+Ml10sM+33znZboZgoIoaKTzZQXM64rrT9V02EWs0iFcVnaXW155J?=
 =?us-ascii?Q?hvldNvPxzTiNZ2c/a3wyny3LrbCmh3R2+D7XEHcvN89AXymLRA4QGbC0B1cc?=
 =?us-ascii?Q?FaL/IDUpT2BOYJmJpUp1zxsCaOgdRFHozBFTwyCEgOFtgMVx6ySA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5931c07b-5956-4b1a-8e02-08de59112b5a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:19:01.1756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 572VVGpTVCUzfxBn8La9mAWjVN/7+mSdc/Y5ic7QRUdZynVna9NzL+PSzlzleh4oJSEcE63O2+Drclgb3jqE5aXXDlszzesz/2doc8WYFGq6SqQxOcv55wRY5cZuXqwc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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

On Wed, Jan 21, 2026 at 05:16:30PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Check multi-queue functionality in parallel execution scenario.
>
>v3: Move out compute related to compute related patch.
>Rename multiq to multi-queue in the commit description.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_threads.c | 173 +++++++++++++++++++++++++++++++++-
> 1 file changed, 169 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index e8d56a3ef..0c14b242a 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -41,6 +41,7 @@
> #define REBIND_ERROR	(0x1 << 12)
> #define BIND_EXEC_QUEUE	(0x1 << 13)
> #define MANY_QUEUES	(0x1 << 14)
>+#define MULTI_QUEUE		(0x1 << 15)
>
> pthread_barrier_t barrier;
>
>@@ -540,8 +541,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>
> 	memset(sync_all, 0, sizeof(sync_all));
> 	for (i = 0; i < n_exec_queues; i++) {
>-		if (!(flags & MANY_QUEUES))
>-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			if (!(flags & MANY_QUEUES))
>+				exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
>+
> 		if (flags & BIND_EXEC_QUEUE)
> 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
> 									0);
>@@ -979,6 +994,86 @@ static void *thread(void *data)
>  *	balancer mixed fd userptr invalidate
>  * @bal-mixed-fd-userptr-invalidate-race:
>  *	balancer mixed fd userptr invalidate race
>+ * @multi-queue-basic:
>+ *	multi-queue basic
>+ * @multi-queue-userptr:
>+ *	multi-queue userptr
>+ * @multi-queue-rebind:
>+ *	multi-queue rebind
>+ * @multi-queue-userptr-rebind:
>+ *	multi-queue userptr rebind
>+ * @multi-queue-userptr-invalidate:
>+ *	multi-queue userptr invalidate
>+ * @multi-queue-userptr-invalidate-race:
>+ *	multi-queue userptr invalidate race
>+ * @multi-queue-shared-vm-basic:
>+ *	multi-queue shared vm basic
>+ * @multi-queue-shared-vm-userptr:
>+ *	multi-queue shared vm userptr
>+ * @multi-queue-shared-vm-rebind:
>+ *	multi-queue shared vm rebind
>+ * @multi-queue-shared-vm-userptr-rebind:
>+ *	multi-queue shared vm userptr rebind
>+ * @multi-queue-rebind-err:
>+ *	multi-queue rebind err
>+ * @multi-queue-userptr-rebind-err:
>+ *	multi-queue userptr rebind err
>+ * @multi-queue-shared-vm-userptr-invalidate:
>+ *	multi-queue shared vm userptr invalidate
>+ * @multi-queue-shared-vm-userptr-invalidate-race:
>+ *	multi-queue shared vm userptr invalidate race
>+ * @multi-queue-fd-basic:
>+ *	multi-queue fd basic
>+ * @multi-queue-fd-userptr:
>+ *	multi-queue fd userptr
>+ * @multi-queue-fd-rebind:
>+ *	multi-queue fd rebind
>+ * @multi-queue-fd-userptr-rebind:
>+ *	multi-queue fd userptr rebind
>+ * @multi-queue-fd-userptr-invalidate:
>+ *	multi-queue fd userptr invalidate
>+ * @multi-queue-fd-userptr-invalidate-race:
>+ *	multi-queue fd userptr invalidate race
>+ * @multi-queue-hang-basic:
>+ *     multi-queue hang basic
>+ * @multi-queue-hang-fd-userptr-invalidate-race:
>+ *	multi-queue hang fd userptr invalidate race
>+ * @multi-queue-mixed-basic:
>+ *	multi-queue mixed basic
>+ * @multi-queue-mixed-userptr:
>+ *	multi-queue-mixed userptr
>+ * @multi-queue-mixed-rebind:
>+ *	multi-queue-mixed rebind
>+ * @multi-queue-mixed-userptr-rebind:
>+ *	multi-queue-mixed userptr rebind
>+ * @multi-queue-mixed-userptr-invalidate:
>+ *	multi-queue-mixed userptr invalidate
>+ * @multi-queue-mixed-userptr-invalidate-race:
>+ *	multi-queue-mixed userptr invalidate race
>+ * @multi-queue-mixed-shared-vm-basic:
>+ *	multi-queue mixed shared vm basic
>+ * @multi-queue-mixed-shared-vm-userptr:
>+ *	multi-queue-mixed shared vm userptr
>+ * @multi-queue-mixed-shared-vm-rebind:
>+ *	multi-queue-mixed shared vm rebind
>+ * @multi-queue-mixed-shared-vm-userptr-rebind:
>+ *	multi-queue-mixed shared vm userptr rebind
>+ * @multi-queue-mixed-shared-vm-userptr-invalidate:
>+ *	multi-queue-mixed shared vm userptr invalidate
>+ * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
>+ *	multi-queue-mixed shared vm userptr invalidate race
>+ * @multi-queue-mixed-fd-basic:
>+ *	multi-queue mixed fd basic
>+ * @multi-queue-mixed-fd-userptr:
>+ *	multi-queue-mixed fd userptr
>+ * @multi-queue-mixed-fd-rebind:
>+ *	multi-queue-mixed fd rebind
>+ * @multi-queue-mixed-fd-userptr-rebind:
>+ *	multi-queue-mixed fd userptr rebind
>+ * @multi-queue-mixed-fd-userptr-invalidate:
>+ *	multi-queue-mixed fd userptr invalidate
>+ * @multi-queue-mixed-fd-userptr-invalidate-race:
>+ *	multi-queue-mixed fd userptr invalidate race
>  */
>
> static void threads(int fd, int flags)
>@@ -996,8 +1091,11 @@ static void threads(int fd, int flags)
> 	int n_threads = 0;
> 	int gt;
>
>-	xe_for_each_engine(fd, hwe)
>+	xe_for_each_engine(fd, hwe) {
>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>+			continue;
> 		++n_engines;
>+	}
>
> 	if (flags & BALANCER) {
> 		xe_for_each_gt(fd, gt)
>@@ -1023,6 +1121,8 @@ static void threads(int fd, int flags)
> 	}
>
> 	xe_for_each_engine(fd, hwe) {
>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>+			continue;
> 		threads_data[i].mutex = &mutex;
> 		threads_data[i].cond = &cond;
> #define ADDRESS_SHIFT	39
>@@ -1277,6 +1377,63 @@ int igt_main()
> 			FD | USERPTR | INVALIDATE },
> 		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
> 			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-basic", MULTI_QUEUE | 0 },
>+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind", MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR | INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE | USERPTR | INVALIDATE |
>+			RACE },
>+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },
>+		{ "multi-queue-shared-vm-userptr", MULTI_QUEUE | SHARED_VM | USERPTR },
>+		{ "multi-queue-shared-vm-rebind", MULTI_QUEUE | SHARED_VM | REBIND },
>+		{ "multi-queue-shared-vm-userptr-rebind", MULTI_QUEUE | SHARED_VM | USERPTR |
>+			REBIND },
>+		{ "multi-queue-rebind-err", MULTI_QUEUE | REBIND | REBIND_ERROR },
>+		{ "multi-queue-userptr-rebind-err", MULTI_QUEUE | USERPTR | REBIND |
>+			REBIND_ERROR },
>+		{ "multi-queue-shared-vm-userptr-invalidate", MULTI_QUEUE | SHARED_VM |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-shared-vm-userptr-invalidate-race", MULTI_QUEUE | SHARED_VM |
>+			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-fd-basic", MULTI_QUEUE | FD },
>+		{ "multi-queue-fd-userptr", MULTI_QUEUE | FD | USERPTR },
>+		{ "multi-queue-fd-rebind", MULTI_QUEUE | FD | REBIND },
>+		{ "multi-queue-fd-userptr-rebind", MULTI_QUEUE | FD | USERPTR | REBIND },
>+		{ "multi-queue-fd-userptr-invalidate", MULTI_QUEUE | FD | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-fd-userptr-invalidate-race", MULTI_QUEUE | FD | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-hang-basic", MULTI_QUEUE | HANG },
>+		{ "multi-queue-hang-fd-userptr-invalidate-race", MULTI_QUEUE | HANG | FD | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-mixed-basic", MULTI_QUEUE | MIXED_MODE },
>+		{ "multi-queue-mixed-userptr", MULTI_QUEUE | MIXED_MODE | USERPTR },
>+		{ "multi-queue-mixed-rebind", MULTI_QUEUE | MIXED_MODE | REBIND },
>+		{ "multi-queue-mixed-userptr-rebind", MULTI_QUEUE | MIXED_MODE | USERPTR | REBIND },
>+		{ "multi-queue-mixed-userptr-invalidate", MULTI_QUEUE | MIXED_MODE | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-mixed-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-mixed-shared-vm-basic", MULTI_QUEUE | MIXED_MODE | SHARED_VM },
>+		{ "multi-queue-mixed-shared-vm-userptr", MULTI_QUEUE | MIXED_MODE | SHARED_VM |
>+			USERPTR },
>+		{ "multi-queue-mixed-shared-vm-rebind", MULTI_QUEUE | MIXED_MODE | SHARED_VM | REBIND },
>+		{ "multi-queue-mixed-shared-vm-userptr-rebind", MULTI_QUEUE | MIXED_MODE | SHARED_VM |
>+			USERPTR | REBIND },
>+		{ "multi-queue-mixed-shared-vm-userptr-invalidate", MULTI_QUEUE | MIXED_MODE |
>+			SHARED_VM | USERPTR | INVALIDATE },
>+		{ "multi-queue-mixed-shared-vm-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE |
>+			SHARED_VM | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-mixed-fd-basic", MULTI_QUEUE | MIXED_MODE | FD },
>+		{ "multi-queue-mixed-fd-userptr", MULTI_QUEUE | MIXED_MODE | FD | USERPTR },
>+		{ "multi-queue-mixed-fd-rebind", MULTI_QUEUE | MIXED_MODE | FD | REBIND },
>+		{ "multi-queue-mixed-fd-userptr-rebind", MULTI_QUEUE | MIXED_MODE | FD | USERPTR |
>+			REBIND },
>+		{ "multi-queue-mixed-fd-userptr-invalidate", MULTI_QUEUE | MIXED_MODE | FD |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-mixed-fd-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | FD |
>+			USERPTR | INVALIDATE | RACE },
> 		{ NULL },
> 	};
> 	int fd;
>@@ -1285,8 +1442,16 @@ int igt_main()
> 		fd = drm_open_driver(DRIVER_XE);
>
> 	for (const struct section *s = sections; s->name; s++) {
>-		igt_subtest_f("threads-%s", s->name)
>+		igt_subtest_f("threads-%s", s->name) {
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
>+						"multi_queue is supported on graphics version 35 and above");
>+				/* Balancer can't be set with multi-queue at the same time */
>+				igt_assert(!(s->flags & BALANCER));
>+			}
>+
> 			threads(fd, s->flags);
>+		}
> 	}
>
> 	igt_fixture()
>-- 
>2.43.0
>
