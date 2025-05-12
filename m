Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E99C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 10:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3077110E169;
	Mon, 12 May 2025 10:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4GzxPbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF8A10E169
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747044732; x=1778580732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VTqpl2rk31r3WYFBzoeUCSG37jF9kTrCrNfgBqMnMU8=;
 b=I4GzxPbORUJts8b6k2YjN17zs2Fa1gJfC45xLr0GXJBq8d1RXm3+ONQm
 Yme6u7zCvTHjQyX/LIFO1R2ZnBEvWdbItnWWpRPeW8J97B5FgIelOqX5m
 aTgzU8tIczMqAmqbmeIJi58+G1dgXfzpNoeUuEWHFOffmhSPeKT54yl8s
 FsjBOYr7Xas/vRS5UABmC7Ir/Cv126Gpo+jl6aYSjKZlgwJUURUIllweV
 MTHiLa7MayTxMNHEYfiWdM7uNIXHLTLkfc+ULjdruvi+Jvxu2fZEwhsrM
 2Sl9jG5X73HqUY6GjJZEf9ugHSmqZc33b9a3ovDyUxlAhS9atxc/h0mBp A==;
X-CSE-ConnectionGUID: cbhcAL3UTbaqvI87L8NZrA==
X-CSE-MsgGUID: KlCAzbtQSUu9XjTmsTRfng==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52481016"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="52481016"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:12:11 -0700
X-CSE-ConnectionGUID: 76NBvIExTKWN2exAgz3klA==
X-CSE-MsgGUID: W2IYdHhDS3uqTktWexpSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137225734"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:12:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 03:12:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 03:12:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 03:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S26IfP5vT92JQNXVyvO5StjCmzvOOQSZ6xEOy69/fi5vCk1j+/zUDGZldIzsWDtb6jlGBXIRw+5Muo8mzVyfOiCxKfGcSnY1ZjqvAsecqN/6X32pAf95gw4o32bgJPrVoz+HivEL+hFsFDTRV16I4fs3itphmFZ0AUcN0Vg1PPBu7zAvnT/h+OddYAmWpRTr9Y52WsXwKUZBs5fjrHeTZk8hS0lQj/Ue5UZu2pK4vkYuc4k51fnUJ9KxwjxBMXooRdB5t2YI7tduTzhsJ1mwqjDCWBRv6ORcQBLf+NynTUr0anu4dRM1R0QLgFXokcy/iDCtxoWRkAq7fxJZiw+QKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0DbiDkvA95ju16kGakMLYIQZKFFVqxrKc0MMkr6wSo=;
 b=fWjFk8jSGf8A2IkfogphX/3IePSiqveg7ZlMflV+k44dECJuyVfl9ZQYRQMc5fj/w2PpsILFB0B+wSEUkntWNBGXGRZygSTli8MhtCrltv/rl8Mqoqxxu5D4Wq3/AmQOukwFiJLG72GsiIJyoFZPb9wQVQVGZy5F+a9FnOXChsie+wPzheXNn5vlkzQwVlVANufxHSvx2vLxKX5Y/iwWY3xlRG/0gozBelCTP9UQS0pBnjerOnaEiAMhGBXGBBuMkeEjtty9pu3aqq4lEVAXTl03oaxPvXeyLQavGzMkwGMAUMhM5bHPhpVpcVu1DRb33uYvvv+iBi/2Ykk345XfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 10:11:54 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 10:11:54 +0000
Date: Mon, 12 May 2025 10:11:44 +0000
From: Jan Maslak <jan.maslak@intel.com>
To: <nakshtra.goyal@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
Message-ID: <aCHJYI6aeBcgpzxx@ART-DEV-395>
References: <20250414074522.3263805-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250414074522.3263805-1-nakshtra.goyal@intel.com>
X-ClientProxiedBy: DUZPR01CA0280.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::26) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 6123240e-4429-44a1-ab01-08dd913d6ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jtBfns3LXEZL0LD5GH8WJrLompmbNeX1aKlY4VZJ5IsY3c4dQLMdyzxlBPWP?=
 =?us-ascii?Q?/TVtfdi9BjIkQzLkEJe62FYlb7g67HG3zSX55yHwTempV4um2Mx8ubNvFIaJ?=
 =?us-ascii?Q?ECLNszY4ahu7+JHJT1ek78M+ctsQYzNtAUTak2jjq1DJ4m3QDNcO/9LKEIfs?=
 =?us-ascii?Q?gSbzf9OGC5VywBsaO3yYkMpY+sNdwDyXjareo5+EYsnU48Q6mzh7MRzED8Kc?=
 =?us-ascii?Q?kI7mT3M3qpzKBFNVzRxQmHRkdykEbSn7IDGaDc/uzXZkPW+i7cP+iFCyqvJ7?=
 =?us-ascii?Q?01ZJRPB3BiNOdGvlFaHqXgX77bpeicfenflrk+1UbxEV+lNMwh+Kr5Qd3/L8?=
 =?us-ascii?Q?BFKW3dbIMNNVDgdEbq8WpbfL1VU4PRmFo91mW0MO608RgLbA5WYERAjq+d0F?=
 =?us-ascii?Q?WI5S+GX1xuCW9VME4rejb4DXfSUqnf4rfTiXV8bBm38/uLK6nuMnFRTWlqa3?=
 =?us-ascii?Q?SkmZhl1udtffPRnO62oANbp99FJLX7NTNFtArw9fCqp6BN9VPnVDkZf4xi5I?=
 =?us-ascii?Q?Q7MhsZ2mLGvdK5ibbOTmMrv58cyINInTaD7OVSlTe+Wh01t0qfzLmkVcO/Yf?=
 =?us-ascii?Q?aspNzQ6qCzLQt3o3ij89LI8wMAsV2FL+vQyZ3NtXKMk0k3N6kiMwy3iGLrW4?=
 =?us-ascii?Q?ul+szFlCD8q/pvnL94QVV3qyGzCh5QQQet7fkYb/bTTNanFbMtb1mX4bCw/F?=
 =?us-ascii?Q?a9Ae0JIqsVf3eXSeL/HTrj0Qvc9xR+kbAzwUbgPZZ79JHJy37Y+JPfY/2OhU?=
 =?us-ascii?Q?0w/zLoyEJSuGCyaMCbz++Y0SAuBl2a8f6IdAv6ME0PaiILSX1Yk05ATunN1l?=
 =?us-ascii?Q?c2VZYvAyeUL4KtGNkM6iVyxmeBSGGjksD12PfkFCxwNVMRMzieU/nGIVPM0T?=
 =?us-ascii?Q?pnuL155RubvwO/LI43tEORo4DUO4MaS/xNAA09YHtcxLyOFcL1Yi4E9M70sa?=
 =?us-ascii?Q?64zKg6e32Qhlm/RxFOh2aDqQfDr+BYcz3iTHBtEhXsslid/I5RwVHd6o8VHB?=
 =?us-ascii?Q?U/Gui1Yk9sjziac6SNcbY7mun0fBvORePtbX94liXjJ2ez2M2VVRiy7Krnkd?=
 =?us-ascii?Q?Vt/UdhPSbQRNtxYAHP/vFyWCP5vnxtLg6/KplkG9E5zFG6pM5kBtfzI5pNOT?=
 =?us-ascii?Q?vTbzNd/P9UB5YUCeANgrf04OovXOk2gDimf90ysZksOoIZR3UuElpPzkjFnd?=
 =?us-ascii?Q?awbHQfqz37V/4AyBY6x2La2qxFrTYKiqt9ofVngH4rYuaD6H1V5/GzJmiHIv?=
 =?us-ascii?Q?W6PC1n4wyZvDuYxyIYofNPqNIdjEUidGhKFXRzavcMbC9DjQPQVuY9PH+MC0?=
 =?us-ascii?Q?vaUQYKamkdjWEuIdY5GcXAW8/XDWPKeT9mkJEx6YdyLpFWhRTbjXJDSrMqkr?=
 =?us-ascii?Q?48UGPAjSpmCGCl8owxXL1rWIBVTpS3YavA/NnaeDHZ45vlftAUB7jLxp409n?=
 =?us-ascii?Q?h22zcWtso8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/da1I5C2eQ6MZm7AwJVxQiqVOPI9XCTND+rgWtaMn753oGVGat5xDMexjP/N?=
 =?us-ascii?Q?Z/xjN758FgXDp1o/7OlNxFCLNbK+7+XtW40GZ9xd0JR340zeHtY5W97reZbZ?=
 =?us-ascii?Q?s85cK7LRa/yY+hIEIbBL26ST+rgdbUjDvt2nNDiYqR3AWLhznI8NjIQBKse7?=
 =?us-ascii?Q?VqX+FrlgJHwDtaq2lWnDvuHLGy/3UfN/dYX0yO760F7gjWRE+pCUdPZG7Dhb?=
 =?us-ascii?Q?8d84g8TD66gfI4/28i6ZLK/+f7RI0k0yIuJx4NLWajnGw+gvs+OMjtkJep0Z?=
 =?us-ascii?Q?s84pPwAmlISE5smcAJk2Ry66yDmTtPA9le9FUC4wyF1HqIdcLycRk/BgOEXH?=
 =?us-ascii?Q?yglgJZNVeK9EhI/Ahh0D0w0kd6GReFNsh6QR8x5DLD48ZKotUsye9AVSHmRO?=
 =?us-ascii?Q?JWsTVIg7spHMerSJMj86nqJXOazx8PlgtjBUSwM1LyoYqgtv0KkSCtuvJ4xg?=
 =?us-ascii?Q?BM9tBc8xi+dO2b4EmTi/xtfE4SNm7wwxOVsriCgr2os41Min5cUq03TmOMB/?=
 =?us-ascii?Q?wsL361zZCKE1xhF72JdFVfOsBjRXuRxjgPixHQ7bJLGdIuJBTppgWp+xA/+g?=
 =?us-ascii?Q?XIdt48m9m0iKwcBSzcPB4al6EqqHX1jgNjHZnSI5Pro5S2DzVBmx8fYe/e/u?=
 =?us-ascii?Q?uIMrhb3hCRUwk9xQXR27uB5NLk2z+yYxD+Aqk0Fk0Vj6I1+Hl9ydiVaNRwBk?=
 =?us-ascii?Q?HOw5KzBKqScg9dOhjytSFuO4Q97tSBr5XeVcxwYuGBu9/CMe/eASGbA6pznL?=
 =?us-ascii?Q?PZY+HIB0scL0Xxiw1+LJDXgQEGeBp9Kx20eUozE3XhxDcjUGS6QIqezP8mDs?=
 =?us-ascii?Q?eNMvWpxRZhJcMN9GZBIn8Z2rEJHF7QsdBsSSCBa1ETJB63m399VqohQlqfVG?=
 =?us-ascii?Q?nht1p91kkJKCdZjDsjSAuHjKqBN9ViPm5kxi/VE13Ms4jcTBmrI0TtYtt27A?=
 =?us-ascii?Q?eKx1DXTNGwGs5WzwuzrPASMchhSHdOyCxAKW/tT62hyMgkT6haGoJhYRHGJT?=
 =?us-ascii?Q?b5KayfqY4QgmWPjM+opEFxSCX5Cy07wIbDaD2U3gv5jUIll2M48wbXpfasHX?=
 =?us-ascii?Q?QLtXXvQ8S50fFCFj6s/tOsBLp3fRVZdOpV4kTO1swaQGdZkcmQuC288Bh8Yh?=
 =?us-ascii?Q?w1wFa3kKG+OYcw6gpnmkXnDVVVDaCMBhBrZ1Y1wb3WFHIXURNowObDjE8mKY?=
 =?us-ascii?Q?802sDZtJKGDwQQPatlUjPL+sF+6Rq5twP3Hdu04gQotizNEXfrTChJLi+g6k?=
 =?us-ascii?Q?5P77RtJ3ltMVvPtCcM2k73nCJLEwwrhZHipAtTTmAQgmCuH/ioAOGY/LFJ6I?=
 =?us-ascii?Q?8KiqZoMmULnF7nhkgM4qJ0JuLqfQR5vVpUEBBEXxhnGISzBcf1h4N2eQxw4R?=
 =?us-ascii?Q?VQcOUhE+RwhP6TwjAtfcnTiQRRx14yPAlN4APi5JasYM7HWNsyY69SKJE33Y?=
 =?us-ascii?Q?WL1TgeTOSn9hek5lBCSQmsEPBWT02nD5Mc7hXdVDs2xmE1Ksd+bosbCtM9by?=
 =?us-ascii?Q?sPSr/dS9toe9yw6AkI0szXufXZTEi83NDkzawMN81BQVuqKygVqZ3tVpwHnf?=
 =?us-ascii?Q?W4yEAMBVJw2tWivvhML8V1vbCwZ2XQBoLpq4sfqT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6123240e-4429-44a1-ab01-08dd913d6ba9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 10:11:54.3805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPs2a0TYE+oTcdNBhP1WhBBvYHih8YSzXql3thHqNShku8aYWmT0IqGb0wOkDhEvFZXshwHSHcSHUX4UjIlJwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
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

On Mon, Apr 14, 2025 at 01:15:22PM +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Map a memory then make it read-only and verify kernel out for read-only
> memory
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_mmap.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 5fd641075..649a11544 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -338,6 +338,24 @@ static void test_small_bar(int fd)
>  	gem_close(fd, bo);
>  }
>  
> +static int
> +__xe_query(int fd, struct drm_xe_device_query *q)
> +{
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, q))
> +		return -errno;
> +	return 0;
> +}
> +
> +static int
> +__xe_query_items(int fd, uint32_t *items, uint32_t n_items)
> +{
> +	struct drm_xe_device_query q = {
> +		.size = n_items,
> +		.data = to_user_pointer(items),
> +	};
> +	return __xe_query(fd, &q);
> +}
> +
>  static void assert_caching(int fd, uint64_t placement, uint32_t flags,
>  			   uint16_t cpu_caching, bool fail)
>  {
> @@ -357,7 +375,16 @@ static void assert_caching(int fd, uint64_t placement, uint32_t flags,
>  	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
>  	igt_assert(map != MAP_FAILED);
>  	map[0] = 0xdeadbeaf;
> +	munmap(map, size);
>  	gem_close(fd, handle);
> +
> +	/* Adding a Read-Only page check exercise */
> +	map = mmap(0, size, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
> +	igt_assert(map != MAP_FAILED);
> +	igt_assert_eq(0, mprotect(map, size, PROT_READ));
> +	igt_assert_lt(__xe_query_items(fd, map, 1), 0);
> +	munmap(map, size);
> +
Unnecessary empty line.
Other than that, LGTM.
Reviewed-by: Jan Maslak <jan.maslak@intel.com>
>  }
>  
>  /**
> -- 
> 2.34.1
> 
