Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F32AEE57C5
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 21:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1C310E530;
	Wed, 31 Dec 2025 21:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyZyF1PI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B3E10E43F
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 21:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767216907; x=1798752907;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7CEPA+8lNhpaijx7/6poo+b1+S5+rkXF1w2Pzd+OzJk=;
 b=iyZyF1PIVg4Z4KgxBeSrfBeFDziCnZdS3UOx0hTrC/reIXNW/66UnH0O
 iqOzQIuv7M0VvgryaSVJccXuRx5KvFLmERRLumjvvcK68196T5ygUq5SM
 E3+0TR85r/vy+b0KwELbbB1pik/qtBS9WzNLRxqSY2bmtPJBTS0BaPpjr
 FW76g1NiYAcudz7ywYl5mo2+eT0sue4aquKdXWcBSgSWRpIpkqA6lfz46
 dRWNRiZ+y378TmfKkn/ybA0ZZ+uiK4LXqTB3YWiPf0I0BObvJzphHcJ/9
 VAaabtSAUk3tqTVhv/NCeDHwYTqXTJ3PkkjorXC1CtDglbqR3+SqRLCEu A==;
X-CSE-ConnectionGUID: 41Y1vdNwSWGdIizzcFq4Qg==
X-CSE-MsgGUID: Tmi5yxIkSnWCpA2WLorFvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68847316"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68847316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:35:07 -0800
X-CSE-ConnectionGUID: t28sm5BSQbCP8BsXdaDabA==
X-CSE-MsgGUID: Mxs05Wh6SciM6tAZmleAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="201522191"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:35:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:35:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 13:35:06 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:35:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIzmpdlEl+X1MPvab45Ct8656q5YhbHZF4kvEM3f2sHyiAmdJkopWNaqE97064v48vqg+HQ40948+Mlp/+N2BGC/S9dvn7YWELuWpNXGRnkdoXQq3qOL2nk3L4Qu3RSxIsAEr0guJkVdDvagrKTxVHXxhYbZYP9cWEo/aHe0OlF68tY5axjB/5vHHaubq6QNIYMQyegjAST/Qblfl+8M4grmcF/ENsv9GMRTgwrxNCQYoZ8eIubNvcS6DPiQ56pj8ecpLsV/I3rFXv97bKTjxkVa3ddzGDR7DwUBT4f78xvMxaCfWvLfJBj5+3F9jNUqtEPcpkuC3YnOXhTvu8q4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWSTPGaRBMl/MQvUFNuH6LoTkILQS9Gwm8k/bkvGFWY=;
 b=ws7XQThOugz3OCaIKmGS04dmaswW/IR1OVmvPhAsfXDdzWu3Mid+wOrkwhuF82OukhKd0OgY+tpkhBq4EbuJGydBiCD9i5oJJmKr/iiTbNQS02M89BK9vWXzS/nfixFWr1IJlK0guTutw4zNLdvqKHtjqSw6XbKrueaDAYv3n8FD0n7cwktWwOkLYUvI9PTAHcaP+Q6ALIyg0Tzq+KmhvrP32hyg6doRv4RBji0g8Mnk+Z3HyM+HPtWkNsaBLq56eBQg03QAEF2yj2o3VZcR0ojpzJxGVpwdCaT9I2OnP17RnBUR+i+DnqlzR/nEWIfycS8IUybeNi+uCYLddcpuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 21:34:59 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Wed, 31 Dec 2025
 21:34:59 +0000
Date: Wed, 31 Dec 2025 13:34:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 7/7] tests/intel/xe_exec_threads: Extend multi
 queue testing
Message-ID: <aVWXAMbNVuCdo__V@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-8-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-8-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d1b30f-88d8-4e38-04da-08de48b472d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p5wiqScsWnQBEOsIuymn1AMJdrqT+CRdFUt/D4xraibPbgj17k1s2KTb5Crd?=
 =?us-ascii?Q?xjQldl7uNlFRMgshYAPRpPeJCuAy8FZIOhaUefbRGZ0bNP+u7JA9AXg6VcSU?=
 =?us-ascii?Q?Ey8pxvhk+RteGws84hio/7hA1fxasTUWEAXddrqVQXQAhF8G71wZXHY0dbiB?=
 =?us-ascii?Q?KHSVEyGwCSroxHFJutipd6oHAnoqNo4KXTshhrViTEmt3honT116plbnlqqN?=
 =?us-ascii?Q?PIv6FQ40Djgzfow+Ljd45bWlC6TPgs9F9cQm9b+PwmaqhE4BizcDJfr+6BsT?=
 =?us-ascii?Q?VXN/Em+3Y+Z2wkCFJncmSRbdvcFMDXDkOajJ6cBfkjD1mDREjED0lK/2MNNG?=
 =?us-ascii?Q?0SSAVDlcIaJmGmA4oPvGvliMypb9hsI3XTce86TdT3zRTTU5lGVbOGthyPnE?=
 =?us-ascii?Q?hiSELDCA+SBkY+EfQ6I3HGtShFymrCgNQdwmSeZxmdpq92ikNa/gAZdDgAaV?=
 =?us-ascii?Q?N7UcpH7oASC6fFPUcC0uqXJNdWOMEXiD03zyeaxzNhc3BSbwWbIkD8KdkvUJ?=
 =?us-ascii?Q?qnJp6hZ9eWbn5JLPHdCLmhZf3JytUzNxV3i4Aa2zeYsJRbcFLOsaBrtzDh49?=
 =?us-ascii?Q?zFB9adpM6IEof84S+Em+/r3AV4/zGoVwPCrKJoksj6nMpHU0nyTiOzsVXY1B?=
 =?us-ascii?Q?MQqmeiMejWCCN9AG7gR7r7DCovjxZmjmd8m9krzbGWH6jlKFShqX0W2BYnFH?=
 =?us-ascii?Q?P7b35jeQJrZUfQ33NtsS95aV6CAg0gHjE1ABIAS44hOXSOR5etOs+3GCrMH9?=
 =?us-ascii?Q?/9KeElbGhnIsYz3yl90c2xlzQbYGGYgSiOZi0iLD7rjZhvIKAgstsvqItmtn?=
 =?us-ascii?Q?KoiKZ7NR8mGr3c3qh+Gz1AVmmq+xwZibCXiMxOEx8LbbtuMF70yjHDvrRC5t?=
 =?us-ascii?Q?C7bosjZrmtq2ngSluUyZqs1lWt58UBgxcf7s+PUgwDBO+Hd3eTjQ+ftdxx1L?=
 =?us-ascii?Q?wGI2hWbRrLGU1iwRvzBG5muf2sW8++wd1clJQigpfNpOn7KxSdoM9Ff6LQmc?=
 =?us-ascii?Q?T7at8HkoAVNO8QcYE6T8v/0unloqEIqbpBJm2Rb38b7qOg2pFHCf43i57lVo?=
 =?us-ascii?Q?o7AkhgffDbCPQQgGh7WO1wHNSzdli77ZN6ei7JdVrDrh27+07cuxJDXtiHSK?=
 =?us-ascii?Q?DsACqhrjbm/6Im5vXHiWLVbCTZd4RMR315/jO0bzURSd3mUUgrxS/xW57/6l?=
 =?us-ascii?Q?cMphhQC1tQ1Nf4JvtAHozfun1uKfcIvcH7RyyG2pBqq0hJsiA0TeF6E7N4fD?=
 =?us-ascii?Q?F6jd2bDO6OiOlOQBWhO0TZcs8DUpIFgC0eK7BgKnInZSMTbnkzYp+Sndjgj2?=
 =?us-ascii?Q?g11kbJHa9JpMNJ+TnY+ftPP2G1wftaxI1JUe0f/IxgUI8Vm6SeBl7y4XM33Y?=
 =?us-ascii?Q?U426ULlTWOeguAedsrUv5rAbQMqaKx9bL+I+H49Un0oR7pQxb5Ri6m3cWMMp?=
 =?us-ascii?Q?CNQq8MjcRbGuPA69dQxb57VZBtuV6y2o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OfvOHewiXXcmLEQmMrjaI7WVsbPjFe3yRoIjljoVWctEwCXRlP5NRyue/zCN?=
 =?us-ascii?Q?dGzlZWOdEiEO0VMsrhzGWIPT5U/xvw982SX3TGUzi9yVqROsOVFf7S7ChwfY?=
 =?us-ascii?Q?3gfVFpB5qv0VxhaDthYAt2w6U/3MxoKFwzRX13QHP/UGDXyeiDoC54tlrS9r?=
 =?us-ascii?Q?IL49zyJw0O6eeDJLPlsMvizhHVGaN7w6CMa+lP2seu0G7JJlTkJZXFp1vxJr?=
 =?us-ascii?Q?ATXmlYBXL9sJc1MWhVTb1a7ZvptifOGOF9RYp34vYqf6onXnTpPRoEenSQcE?=
 =?us-ascii?Q?/t40PDlMNwpAYYnNfUDjpqZc/2Hk8Leo0pm5h/ub0Q3+W9Lf6iY24bmLk6BD?=
 =?us-ascii?Q?d92y4kizDnOitiXY5wnifCI8jAiiatqtlqoRKXbb4Zv1PCEtru1U9Wx82MK/?=
 =?us-ascii?Q?LgUg58XzdOVjApsximHVzDBrS7g0MIze+GhwAEke+Mccb/okkUB8tjYcNgJ0?=
 =?us-ascii?Q?Wc8ZYV7rpKiNtv3ZyP/ARGGno9UxGeu1xkTAxIrhcm+YhdBepzlTcAFhqkDB?=
 =?us-ascii?Q?jy4gavdnYv8oH1tzXue64Su64sHqvwNJkOx045sYS1ExeuW47x7AxsDIW71N?=
 =?us-ascii?Q?zjKNXq3/76LRncYP04NsqXERqaExoz4lUvG4LafD8TEuabGyzrbhm08mg20H?=
 =?us-ascii?Q?RT3WAuAk8r18XJwA1qSsThAAE8J932W0VkeB8RNq0ZUu0o8qxo0gdjqS1fZ7?=
 =?us-ascii?Q?/O0d2F+q84j1qm5S0y5frLC+71OeuhY2QahVUkjSjLc3dTEJpCyC9ofpUTau?=
 =?us-ascii?Q?HZPKx2IE13g+WHvo7QHCZxVSojZ2Vw4bXXgCfffO1I8ro6GMGMjxtZMjyOLO?=
 =?us-ascii?Q?iTOSsSMW/nqWJjey8g+d5WB2C/ZmoVwWMxKIAa5nROZwLl1NPKnswB/wXvuA?=
 =?us-ascii?Q?hnQc7nonGYbR5qgP1qh2z5GHf2E3Y+jHAhrpnA40xQsW/xHAAWc3t/L96nEl?=
 =?us-ascii?Q?jAzf82YfnYnbJnq1jLwIC7oJW2bycblK0R0G9VXQmLpFp0gNwibLwKDtSsT/?=
 =?us-ascii?Q?No16FtTmHaP38PhIe78db3v1K3qTrf0lSr0cUWsha9DU2MC6SZHzzSzOKs53?=
 =?us-ascii?Q?kJ77jpln9Rf6UC7bvH2b3OeIAuO81hgck5tP52aBuNlOxcZD9L9FMXdQKAcI?=
 =?us-ascii?Q?yoGLbTa5V7TOHEFHHTMkvO3BvbRgT0V9m4Prbfr5RurwgjK/d2xR+YCGhp8J?=
 =?us-ascii?Q?7rCF2wF4N/mQ5H5rLoBHsFx1IpmpNoyEVfEJEwgwtBG6fHqv9mVVpcsuL4FK?=
 =?us-ascii?Q?wG+HYLB+TumpCM1CCwGAdvx6tlLy7jcrlMsQidfWhxR0XeYO0k7jM6QpVSWg?=
 =?us-ascii?Q?iYS5VryA2QbD7W46awpogpL0KEcNq4X0l7CIE2v9+I+ogSc/etDeY3rrZmLm?=
 =?us-ascii?Q?oPbPI31KGUbtm4hFeOHRuk7RwPSrVSt1WEJwg3xaCqx6nj6r8QOMtEo3ELGR?=
 =?us-ascii?Q?qygymJcTh3m9bfPhx4ZeQJJz0E0jW4aaTusIbMpkDAo7x3JIL7MsHNdeR/fo?=
 =?us-ascii?Q?ZYrepwRv9jNiD7XW9TvaB289h2f4OWaaEycI4/Ij2HpMbLvLgihwC70WTI/g?=
 =?us-ascii?Q?FCY+619LmcbRu/lr/A7+3RrHKgbS+bWJYAwJW7DhuEQRmSuxd9FOzn8+8y0U?=
 =?us-ascii?Q?ygbs7Jx7AMvTaJmnVqmEpT1icy1n5+Zb2FnRDs6ymdSRHilSI3Z0LWCsTqUu?=
 =?us-ascii?Q?X2BRf3OmoP10QcF2mIPKxxu9rKAZcEGHe0Chy2NxHAdhVxL6Mzn/B9Nc5Irj?=
 =?us-ascii?Q?u9VuXB1yOG9872gPHPYL42jbqyM0u8ki8qCvzV7LTlk6GTVxMy3A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d1b30f-88d8-4e38-04da-08de48b472d7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 21:34:59.3548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gVIBfFQdE6AYQu0YNxN+rQnrItrNdRBB9ssbJ0SVjkimRIvsnj4vWAZCb5voc5lMR/N/9x7LXxSvIO1dAo9hFquBcwrhHco5xvjuJ7L9uF3yyU8ycSwy+BgjdHFlgS8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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

On Fri, Dec 19, 2025 at 05:31:54PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>Extend multi queue testing to different scenarios.
>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Same here. Remove.

>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_exec_threads.c | 163 +++++++++++++++++++++++++++++++++-
> 1 file changed, 160 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 4bf1cd1b1..0545c7ab6 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -312,9 +312,21 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	igt_assert(exec_sync != MAP_FAILED);
> 	memset(exec_sync, 0, sync_size);
>
>-	for (i = 0; i < n_exec_queues; i++)
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+	for (i = 0; i < n_exec_queues; i++) {
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multi_queue);
>
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
>+	}
> 	pthread_barrier_wait(&barrier);
>
> 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>@@ -994,8 +1006,95 @@ static void *thread(void *data)
>  *	balancer mixed fd userptr invalidate
>  * @bal-mixed-fd-userptr-invalidate-race:
>  *	balancer mixed fd userptr invalidate race
>+ */
>+/**
>+ * SUBTEST: threads-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests

Same comments as in patch#1 applies here also
regarding SUBTEST name and MultiQ naming.

>+ * Description: Run threads %arg[1] test with multi threads
>+ * arg[1]:
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
>  * @multi-queue-shared-vm-basic:
>- *	multi-queue shared vm basic test
>+ *	multi-queue shared vm basic

Ah I see, the rest of tests are added in this patch.
It is bit confusing though as compute mode variant
support is added in this patch along with other
legacy mode test extensions.

It is probably better to move the above changes in
test_compute_mode also to previous patch with a
compute mode test variant added? Or simply merge
both patches together. It will also remove the
above multi-queue-shared-vm-basic description
change here which is unnecessary.

Also, I don't see cm* test variants being added.
Why not?

Niranjana

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
>+ * @multi-queue-cm-fd-userptr-invalidate-race:
>+ *	multi-queue compute mode fd userptr invalidate race
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
>@@ -1299,7 +1398,65 @@ int igt_main()
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
> 		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },
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
>+		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
>+			USERPTR | INVALIDATE | RACE },
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
>-- 
>2.43.0
>
