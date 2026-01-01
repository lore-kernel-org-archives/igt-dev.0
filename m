Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751A9EE57CE
	for <igt-dev@archiver.kernel.org>; Thu,  1 Jan 2026 04:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3AD10E1CC;
	Thu,  1 Jan 2026 04:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTZ9b+VA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889410E1CC
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jan 2026 04:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767241150; x=1798777150;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q1Z24nuy56mTV4mw+qB3LORVn6ERJLqWG9GiDeIdU8k=;
 b=WTZ9b+VAz5DZ2NcpZxOYGfwt3fWFM33Zz1Q0EMqlpBrJuvFJXHGJ/fcw
 qv+VM4SbshJ1U5hbcqI4eIpnOF+KBnCujAIjSCcKar7gwTOtkmOi47WMz
 0bcQOM0JiKY8QqdT/Fth4lRbTVpUQUCCcS12CBm6uhKGzTZvunh1Q34UU
 G33HCp9Yhc1cBULcjHzCWXR4Y8fKQctQi6inJu/SjABOPs+WCK+OvypuF
 KtzbWH4dL+piCoB1JPRhtnWXTu6CVA0XvuwEf16vm3a83y51bfGuDMFzc
 csRDGLgFhNSLCK3MO8mY6I1ogx+JiBbpKBKlVdGzrwFW67SsFX48cA3EK A==;
X-CSE-ConnectionGUID: jTB6bkacS1WkrQyrvCnrNA==
X-CSE-MsgGUID: BKi6XGAeR36sZQuJbL3tiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79096274"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="79096274"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 20:19:10 -0800
X-CSE-ConnectionGUID: tbcG9DHNQFyoCqkgsAIlvA==
X-CSE-MsgGUID: a3F930G4SZqC4qI+ogbCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="202026681"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 20:19:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 20:19:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 20:19:09 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 20:19:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9D9M0r/oU9dOy8849TCBsRY/tulqmFIgQU8XqBvA0HyQa29iR6pjusHuHF5jy3JGW+hVI8Ioo07VloQO1W1JcwyNay83QQWNHFnhg76XACJhJLS1IWjDpkYT6oL8zCSq0a3clJgN6gt2Ejqgs5wyr0zupDG+CLv+SqXTsHkh9mxCBfatj0V5w7lRS+B7Xxxk9EYjrTCpP93Of4MFstuN1fMfgofm2LZs0aiuryNtk4h+9qRvXHS/xcy8sD1IJtRc4kZTIt0nW1hTqV9VuA5nP07sLFF8Wr4Jg9XC1uWfJ2yyTcdCKhfmiX/Lx7zqFhsQhMgHtuz2AwNXAaU0+UOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avp43sLGuDf18hMl7WB7U7gvblLMgfe6/pEST/PV+dA=;
 b=rGBB9/NU+eVTX+RZ7+hwRv+tjj+/z8Kyu8odJwBkwTg8Ll5UY5lxDGQGOqPBg8x30dAAfxORxEgl/gXo80OQ7Qvc8VFg9xYqd8XN8aetMzHZLdKVZVFWMMrfhMlpECK3MZA4SBDyv+vadnfl6KVNA6wL5EoNu+hjFce3B+8EkMqmh1ldgcRUdoC6Jqkoo/wF7zyDW2RUfJu+Lwn41NkEhsea+rCzoufwIiPLM7TTvIqRiuNfeJqma232gH8/UkukvBW5t0mgQIKbvQLUIMVTlWwG72K6K8P1RprwZ+hQ4ZFvkGLNvP3RzWkZzNc+PcdQqUli+V1c56yiLGobA+FPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 04:19:07 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Thu, 1 Jan 2026
 04:19:07 +0000
Date: Wed, 31 Dec 2025 20:19:04 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi queue
 basic test
Message-ID: <aVX1uHLfhZ7SQVb7@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-7-priyanka.dandamudi@intel.com>
 <aVWShAsoxGrXXtom@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aVWShAsoxGrXXtom@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 9615cd6f-4ed8-4c92-dd6a-08de48ece7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JwG0mFtjr2YoXOkZeKTUNMo2G+soQyj6x1Nus+rcxf1jnHnKvFRXJxNKPNvU?=
 =?us-ascii?Q?SqIwOSWNA5pCTinvbMcs1YpOAV9GJjl0eCOfvifSRTZr50IgGOZPY0eHzvUA?=
 =?us-ascii?Q?hBaApIVOB24A5p1i2PXyks/qijsrB6vzb7Vs80viZ8hVUQUjKBu9cnv9oKAl?=
 =?us-ascii?Q?KlI/IPXdmudfJC6iBgwaUmsDIsHU72ocDZFlZASfeOsz853Etbi1wDPZC3rM?=
 =?us-ascii?Q?ePFrBciKTK9XUAbXrtwQgkFtuRF25h7etZ0vpQP9nh74O8Ok4KLYiI27EiYF?=
 =?us-ascii?Q?GgL+EWdFhXkGKzeUsLX4XLUMVsa/Dd8m+Y6GxI/eS1tLjymBmVkSmh1zo2OH?=
 =?us-ascii?Q?6PQA21VIlTbE+SHxg8ffhU3Q4yBhk/n+6kZ00eXRj8JbFC2IKdfmCMHl0LxD?=
 =?us-ascii?Q?u7Z05eV0WHkhapIHXulUgFLSCSPhUQ1dZ4IuhDd59zcCLss//aWq1EW123WJ?=
 =?us-ascii?Q?9eS1xaNat3x3MiMuWrTWfKMyZqgrenq7ybleG6AVYgn4MuG/0Wc2QMCr8Y2e?=
 =?us-ascii?Q?q9b5+X64JH+WQGwodZQ1mlTjv4TtAs6tKB5hrqUkPPmh+yPtTx6WIms3MzOx?=
 =?us-ascii?Q?4XOfTcwnERCyIxVg4tNZ+KFMr60xyCGQGYfpQYwQrQfLyMl7CM2QUIIrC9Nf?=
 =?us-ascii?Q?EumNzsYa7YLhjIxzYRCXHzcYao0D68/2HwP1V2dRbbBkINvOpxEJxlIjJVRN?=
 =?us-ascii?Q?CwUpSh+NAhXS0vbeTy1E0xPnsw4n5eogR86AmOAUo4m6hNdPiYdz2I/jbcdL?=
 =?us-ascii?Q?N3oB/gGxfB00/cyNypXdkjMc5F60Ees4ogr0f3C5UJcTfaC0XZxJ+hUaiKLt?=
 =?us-ascii?Q?7tvrxPDhqIBO64bNLIefiqi2917WXbQB3iZ47m3grovy76KhiElUlaRLY2M5?=
 =?us-ascii?Q?gUEA6FV7fNPE55l16rEx1YmNx9073wkFGDnowimPi5uBNG0GvbFz2VxBjClK?=
 =?us-ascii?Q?BcL3vBeyA1+RQb+sZsKhUZkUNbjveGfLo4NyrgSpXZCc2oEPmJQMPG771OLT?=
 =?us-ascii?Q?xoLbrgoCf+wO2tkrhSYZxFd8RfHq9Q5x8goAvd9TjtzUPMAdL9T2SKV/Q+4y?=
 =?us-ascii?Q?AmCwIjmC8dhPIdoq+tGFyASi8cFiXzqC493mwUMhLULkiDRVcuqvbCNQj/wg?=
 =?us-ascii?Q?8Tzv3jwFpnwdt/uLDVvGQCNntn6eehZxJnBzoC/s96Qvf7t3Sif+A6Gs/0Op?=
 =?us-ascii?Q?sIBhstyUZmaRiXBTevx461bOO3dlWxMPxfI0STFZR39oYLP33K6V8QA2dfCP?=
 =?us-ascii?Q?mrmOWec63KpeNwcEe+3qHb1mV5zkTdv/Uniy7YjSFAm94Ro1v1XBp6Je+myI?=
 =?us-ascii?Q?yw+Kfs+XMj82fCgdvbf5WQt+bk05Ufnm6/flp9ZEw/rjLSMtJHZTFNfdf7n3?=
 =?us-ascii?Q?Xv94/Mqu+/8PGMmV8urI4UtyvRUAWiZ0OQs+W95NspCH77eZJrW1o5WD2pJ+?=
 =?us-ascii?Q?0cmsPH2iNt33mVeUM8lblREoXFu3Fsyw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VDIlJZNZ7LOgUeVPYmYtr2kBZP/8d3GCXECdgtUOKOGsfXRGrgvU/12I7wv5?=
 =?us-ascii?Q?anIfSU7ibxZIkS3FL4AvD2/mbh9Y3SqLaUSQikzQyuuNrViW6loF29B4xorH?=
 =?us-ascii?Q?KnZrZjVhTHIeMb8sej2tAADJ8W5mGGMJU4Qt/8LqMThFBJqCW/SN2bkLBx8l?=
 =?us-ascii?Q?X1FlfK7GjxNoO2x8Cby4SINhzKskEjzWTXPIb/naDsduq3UahxZIaDdH2B9K?=
 =?us-ascii?Q?KDGl1VWUGSUiRuOfj7XkGuZpifngGX5P2R/q8/Ui9VLp7McbcmZDEbXRii2K?=
 =?us-ascii?Q?BQ/hQ6dh9PAmVGSCwmSXDAiY51nzq74XdDhss3NDZHcGrUU90jq0sf+g5yDv?=
 =?us-ascii?Q?JedCrSDtzdE8sP3ism20KPDOqom3OYiv18jpjvKisp0qzkAi073klfO6c50P?=
 =?us-ascii?Q?g17pTbnL37p4I315qxjd+f8ynW7HvLQIVlqvRD7V2ShLb0GIR625neRwDtD2?=
 =?us-ascii?Q?CJ7+FkU1wzEuOeXe7VeniLA/DD0Dl9gEnBbF2R9nop8u6iQPBEbX92ZdVmuI?=
 =?us-ascii?Q?BPuVcLsr7EYYUWDu0q2T2cFBYGez7lSlH6GmUa4Q9rnmOKCSVDQTYTO+HScK?=
 =?us-ascii?Q?EJyn7jlygSRO+fEdKt7mM3Fq1Bx1P3PCeDotiGMhq5DLjS3z3ALg3f+fJ4VG?=
 =?us-ascii?Q?z5AaEeAfb4JwSH6JO2Wn+iN+ZY5EtW1bhaVpnTK3n52sPxbYrR9SWIhmOozO?=
 =?us-ascii?Q?JtTMr5Ib/T+IVGJQvkVzUCF7iwT7Q1ZW/3UsIitY1Nnk+no0SJ5EunK+TQWV?=
 =?us-ascii?Q?o8mLm5x8PWW+VhzhJqq8Z/67DpsEuE5NfO+m/GLTQ1P60Ig27yKBz0GdjA9C?=
 =?us-ascii?Q?Q+S2YWViLQ1NddkYh86JxJXUOfFgW/DKwfkK1b210Vl3MbHQQFEUAJMlrgxj?=
 =?us-ascii?Q?P614iymCYX+gzXPVjqoYiurAZwYxR8va9yFVERSLcRHl98VP8tCBgFZrwV7w?=
 =?us-ascii?Q?EuMZ4y5pDOBGBGapfs5niOdu2UfgAtbtJYKd3mXC7NJ8sbTTyNb3u441NYxY?=
 =?us-ascii?Q?QycMt5nK4PfBXsz5tUMugq0ttftqWaLvKFnEmT4SmD9ixTFNbTCVG3Ltai0D?=
 =?us-ascii?Q?KZRSSkVfhvytt0l8U5KT9Dwkf6KQV0Bsa7BxKHNgY4r94CMlSUTRrkO7Fc79?=
 =?us-ascii?Q?jvct2XlIT6EI1VzM1e8XLBgm28JRNOB+IWXU19K+95Q+dZZZHJB/mAmv/rot?=
 =?us-ascii?Q?2rOGmPFoWlIvtctNMbnFV8GiDraQ3DX8XEj3zxzUuqs4zAe8Fe7wsYT7NK2j?=
 =?us-ascii?Q?22LctOp1YjHDb2pTqkzrHJF87vILrTP3SP1vYsTVLuwWwFH6oFRXPjowF8Bb?=
 =?us-ascii?Q?+0gjN6Sa+PJOY3RPTiOptq2Swnk0zo3Yg0lqQyCxRY6uSA6rmG8HXsIpEMhU?=
 =?us-ascii?Q?XHGwtoIBtug/VTkzXu7eghMLSWPZuWUhqdXlX7HJYEt7EnAvbLOXrPZqP6fb?=
 =?us-ascii?Q?p2/A/7SnVXNGU/Vxp1ESWML7t5AxfOcajddRAGWan2tQUNzzLbZeyg/4iTYj?=
 =?us-ascii?Q?d8/r0NzG2qOEH6MsgwaLk9Fd14VeeV6Zw5fRnY+thWJblL2s5QnJwQUZl8ng?=
 =?us-ascii?Q?7Vs3m4bTG+LzS2wW4h2DQ2BhOrLe05QDejRgHWp2GEyWcpVw8buCG4gCt8Bj?=
 =?us-ascii?Q?a9PGjW1Pjrh7q2Omq+3FUqImelhqmH69TNP+BGsOFsmUZjpYEnxA3QNW8uTp?=
 =?us-ascii?Q?EnkxO4VZ49/4F0aOXXlTY+UL4xPTv7w07T+L79Cx1fAlHIHA+En+/eO6q6CX?=
 =?us-ascii?Q?wdy7dVNBHCYb6p8WC5aQy1Pzzj0ffbvonjX5xkoUKKtzIW3/IJSg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9615cd6f-4ed8-4c92-dd6a-08de48ece7ea
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 04:19:07.4880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtWy9Ri4WODBTZbhHLnP5EYfyPDuFNkdPfBi/kX6Z4MCTCkzVhgDPT78gpOhySpBtwQpxHGAUJY3fMVlW6u2K+QWwU5Zum6qmN64Q8bfYdf/cXYf9ygUDCsGurXAlKjn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Wed, Dec 31, 2025 at 01:15:48PM -0800, Niranjana Vishwanathapura wrote:
>On Fri, Dec 19, 2025 at 05:31:53PM +0530, priyanka.dandamudi@intel.com wrote:
>>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>>
>>Check multi queue functionality in parallel execution scenario.
>>Changed naming for multi queue and assign exec_queue create
>>
>>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Same here, remove email ids that are no longer valid.
>
>>---
>>tests/intel/xe_exec_threads.c | 39 +++++++++++++++++++++++++++++++----
>>1 file changed, 35 insertions(+), 4 deletions(-)
>>
>>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>>index e8d56a3ef..4bf1cd1b1 100644
>>--- a/tests/intel/xe_exec_threads.c
>>+++ b/tests/intel/xe_exec_threads.c
>>@@ -41,6 +41,7 @@
>>#define REBIND_ERROR	(0x1 << 12)
>>#define BIND_EXEC_QUEUE	(0x1 << 13)
>>#define MANY_QUEUES	(0x1 << 14)
>>+#define MULTI_QUEUE		(0x1 << 15)
>>
>>pthread_barrier_t barrier;
>>
>>@@ -540,8 +541,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>
>>	memset(sync_all, 0, sizeof(sync_all));
>>	for (i = 0; i < n_exec_queues; i++) {
>>-		if (!(flags & MANY_QUEUES))
>>-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>>+		if (flags & MULTI_QUEUE) {
>>+			struct drm_xe_ext_set_property multi_queue = {
>>+				.base.next_extension = 0,
>>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>>+			};
>>+
>>+			uint64_t ext = to_user_pointer(&multi_queue);
>>+
>>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>+		} else {
>>+			if (!(flags & MANY_QUEUES))
>>+				exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>>+		}
>>+
>>		if (flags & BIND_EXEC_QUEUE)
>>			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
>>									0);
>>@@ -979,6 +994,8 @@ static void *thread(void *data)
>> *	balancer mixed fd userptr invalidate
>> * @bal-mixed-fd-userptr-invalidate-race:
>> *	balancer mixed fd userptr invalidate race
>>+ * @multi-queue-shared-vm-basic:
>>+ *	multi-queue shared vm basic test
>
>I don't see MultiQ mega feature being added here as done in patch #1.
>Looks like it is not consistently added. It probably makes sense to
>remove it from individual patches and add a separate patch for all
>the multi-queue tests.
>

Or update is consistently for all the new tests added in this series
(in their respective patches) and add another patch to update it for
multi-queue tests already upstreamed.

Niranjana

>Niranjana
>
>> */
>>
>>static void threads(int fd, int flags)
>>@@ -996,8 +1013,11 @@ static void threads(int fd, int flags)
>>	int n_threads = 0;
>>	int gt;
>>
>>-	xe_for_each_engine(fd, hwe)
>>+	xe_for_each_engine(fd, hwe) {
>>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>>+			continue;
>>		++n_engines;
>>+	}
>>
>>	if (flags & BALANCER) {
>>		xe_for_each_gt(fd, gt)
>>@@ -1023,6 +1043,8 @@ static void threads(int fd, int flags)
>>	}
>>
>>	xe_for_each_engine(fd, hwe) {
>>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>>+			continue;
>>		threads_data[i].mutex = &mutex;
>>		threads_data[i].cond = &cond;
>>#define ADDRESS_SHIFT	39
>>@@ -1277,6 +1299,7 @@ int igt_main()
>>			FD | USERPTR | INVALIDATE },
>>		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
>>			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE },
>>+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },
>
>What about other tests? Why not add multi-queue variants of those?
>
>Niranjana
>
>>		{ NULL },
>>	};
>>	int fd;
>>@@ -1285,8 +1308,16 @@ int igt_main()
>>		fd = drm_open_driver(DRIVER_XE);
>>
>>	for (const struct section *s = sections; s->name; s++) {
>>-		igt_subtest_f("threads-%s", s->name)
>>+		igt_subtest_f("threads-%s", s->name) {
>>+			if (s->flags & MULTI_QUEUE) {
>>+				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
>>+						"multi_queue is supported on graphics version 35 and above");
>>+				/* Balancer can't be set with multi-queue at the same time */
>>+				igt_assert(!(s->flags & BALANCER));
>>+			}
>>+
>>			threads(fd, s->flags);
>>+		}
>>	}
>>
>>	igt_fixture()
>>-- 
>>2.43.0
>>
