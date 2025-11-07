Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334B6CCFA13
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 00:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B4110EA15;
	Fri,  7 Nov 2025 00:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtymcjPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3210EA15
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 00:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762475722; x=1794011722;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O6En432RmN3hKXpwibxW+cZNNll0dvPr267Tub3yM8c=;
 b=CtymcjPAvuxjgE/i+koU/uliniN3770MTGwgqqHUvoNaI7Bca55pZo1A
 PzApGyR5fNnlc7bo5/wRvGsZ9m9YEf5HzqM5E/XYbMXj89obWSKG2MZRA
 J/8Xqojk7pqhsMneH2Taso036CiZV9fN/eSgbnwvo5z+Xag7RxYJ6JEMI
 oe82evB/FfR5gGAzg8oGVYDyeSShoSUzvyZHapE9iwwStXfwSjPvZRHjp
 6OYzA37jA88NbD0MW/ycnEKXGfwgT2lCD99oP7m9KJ/RgGb0B02DM91vR
 cqz//fCPNcmFWWp+b/jouSpvXB/yrC5dZDYxOvBXBUtwLwP0W3mNCT4/B g==;
X-CSE-ConnectionGUID: G/FoR8gSTRuaOeftbFAbcQ==
X-CSE-MsgGUID: z6EubcsCTbupn2chDS+tGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75315885"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="75315885"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 16:35:22 -0800
X-CSE-ConnectionGUID: 6325l4RMTbW7fDXU2vRk9g==
X-CSE-MsgGUID: Gh3l6IfzRVq94r/8NEZQZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187560372"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 16:35:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 16:35:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 16:35:19 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 16:35:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPRteJsAiCCtXnm4y5c+czCHYz39lWHen/uc6D4dkPAiBPjvAkHuzjfGAvqpyEF24TpcJFWZuTLIu+I8B5FUnUMVbnSg5Q+BswUuun/eosld3bGv+VTn0lzkVxM7juTG0SLSMY8xmQsOGEqYwEJ9u1NYbodMWbZlvwVzFUr1a1LbT3Ts10/8tQe7Pnx06RZs3KNI6WtWN1D3WOMGnk/wNEjlG7sOuadJqPnWYzB1TCcgaJA76ORrgN54zGu+ZXJjigDNsGrGTEgVqpwIkYw8MVbuMbw2itb/GRfoKTWsh0qDySQqYCGnjr6FqB6L/Nw4OXTudR8GR32NQ07kLUxjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzgxewtbztC8PbSV9eyGdcvh+2YP3PneaDLSSbE81WM=;
 b=F/6CCHsPQGlXjN+oCEAf/2Kv7A/ki7JhT9IoQ2L5pBTPt2nymuMkeSppwX4so6GjK8P+i8PZTz2fj/RQltpQ6auus8tVpHdDn/7aypiBglbmWZx+yRl0bc/naaGe8ooV2wkK3rvQH/UgmsEwUNriQR1CT6ima9slOpuU+2Rt0Sh9Sx6MkEe72d1x+dPVuBN+xWP1WHFdY+FkFFYiGjyHu0PzoO0D7TFfkSqHOG/KwdUy8hRt+mIubm9adXtz1hPk83pH4i0rXbpyFQqNjmVvoA4og1j2lE2NTT/N8WobO4onhwTZ6IIHkkGwvppnV5bJ9La3u40xtRwzHmrdJB1Uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 00:35:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 00:35:09 +0000
Date: Thu, 6 Nov 2025 16:35:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <balasubramani.vivekanandan@intel.com>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] lib/intel_pat: Define pat indices for
 xe3p_xpc
Message-ID: <20251107003507.GE3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
 <20251106153419.1741989-4-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251106153419.1741989-4-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 397b5857-5415-4516-3b65-08de1d95818c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eevxxo+h8wpXIC1shIixzzkQbc66CLT2NgeJJDgYVF86DSllFhlXGhuKM6hj?=
 =?us-ascii?Q?K44qiU/5mpUkaSz6Cdjb/kB+xT9OBXgUyJBcECD0TkZUp7GoI8ef/f1gjda5?=
 =?us-ascii?Q?eucutq2aettc+lcAfawxU5PBYihgn53kaCrrZpaQDLDwrIGyGIHKmZKY+kXu?=
 =?us-ascii?Q?/PRyeU4M/KH8XHKxqgwokCMiXewtwAOG1U0RdEqt9ehaXiOUa91g8GlLqYMo?=
 =?us-ascii?Q?L47mGip2aJJO+SHNL2fLx34esJ+Up6JDL7fGgceF8iHCGuvG119jN5sgPmQ3?=
 =?us-ascii?Q?Wv2Dr/CZjJXMp7bJWbEd/x5joXsFGK5Ig/EuECZL3JmN2YMlz2F6Qs1F3XBW?=
 =?us-ascii?Q?f+eVNLI4f48P8kXv/pX2KoIcJwzwn9lZp0vchFpWwOifcyDQWkdvQTHOVEjl?=
 =?us-ascii?Q?uehbgh8x7sFeI3wgkBYiDlMSg78c7OD/U7FkvL64nfACiXNRn9hLMYjbBule?=
 =?us-ascii?Q?mgN5N56UEILb+PIU/pMu3w6vJFGAlJoxUxi6+YH57hyO0R1jEWNq1+fbvZ+Y?=
 =?us-ascii?Q?/gGo0PpiUJR/2N7rrCtWNHMACar8iDLDLP9EK9JyqVVr3xUEu4QfdjrZu8cH?=
 =?us-ascii?Q?Wg09CtYCgq2Un1f0MgL4veOqj/EBlRYb3I0yvRmtxb9ymrsnC63k+jTweKfo?=
 =?us-ascii?Q?j+mXprRyWHJeNb1JKqmoNSzwiKGRgMr0P5wBS2YRoVtx3VYo/tq1gCCiCVLY?=
 =?us-ascii?Q?rHiQnuGJP+E8d6rnjfJjpbPVnk660BApOEILosssvo5M/n8hmTJ1zyrA1WQO?=
 =?us-ascii?Q?5AO8sIu9c9mwAyPO1QUT3TFGAr4SNaoWcJlZXu2zeJDqDxmfGPc+SkJbVedo?=
 =?us-ascii?Q?pQl6WQtSkISM7nJZtXqqtdmYzDG9QPzo4JscfO02pkdc86LSTjYRBMuXyitE?=
 =?us-ascii?Q?gsUvqE+35G8mSSARS3uhyz2eyogk+BYx2psVZA5NpbLdsDpEkQE4Gd+UT6Bg?=
 =?us-ascii?Q?R34puWZt2iAW7Ig3toZesxkrbHU8SpHfds5yUO7eq34oD59vIafPOItt8VdT?=
 =?us-ascii?Q?NmCOiZB7ULt8EOtA8KRV0FeeYFhrGAYDsHBUAFwGVACGJ0rIqUCBlq85H0kf?=
 =?us-ascii?Q?J6+dZqdixPt8jJ2wfopK3GsnkZQywUsmmeQRDZbjcheqKQV28sgiDpGcnsMX?=
 =?us-ascii?Q?qT3ZYk32allfUCRGx0ycoGcMaNJmiVlg3nzlGS3tMKGthBZJjc/JlYvh47br?=
 =?us-ascii?Q?vw2rHBYUIpfxrTICkheLttlMBySf+szMTBjJtKY+IcYko432Idrg77fQPmkJ?=
 =?us-ascii?Q?V7KpdlaopLlDk4s2c1qda9qmlktPI6XSzlLCPmTar9YniCMyaBw4MBZz7+4x?=
 =?us-ascii?Q?7W+MS0qdFU0EuaGxj+SM7bWXadNfl+lLIeMbRNbw0BPUJCRbRzMouHOVskKv?=
 =?us-ascii?Q?LEd31uwrB963zSHrTrfEKEEXlCJmBOJk2VV5SNtRZP7XTVpXqfsKogmejpX9?=
 =?us-ascii?Q?6l7hUJuAYCVsYZyRiFKtJEWGwkeUBAi9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A/YtXHom4Mk/hfqYrsrz3j8b5ylmCyRjKvIE8sO/YHf5eqcoudcy7362zTDr?=
 =?us-ascii?Q?7DKQPamtspQBfiHgB5Oj6FM9U99QYD1oNBPQX4m0r6/2AEu+R8JT8RsmgcqC?=
 =?us-ascii?Q?mGrI20jXZw1TD5YwR4WGl+RywPZGHgHTqAwRKof9hNqsm40NBVl8Atn7nULB?=
 =?us-ascii?Q?dJ0DyY0auEJRQlbBASstrQjP0gLXL30BMU4esAr+uJUMkjLza3eHwESSkuTK?=
 =?us-ascii?Q?t6ILtJFrTPRIYQDEnJ12DMHB8XtbZNyWKVEylgE6zdbt3s31TdFMpvTKzwny?=
 =?us-ascii?Q?h2iAjI65AhGDuQo2Y4rcGRUABnTmFWJPCJLsDUGMTAwrE2Zp4ipPB95RrQV2?=
 =?us-ascii?Q?j9poJUfU9QR3vvtQQe9svi2HeTPfFAZqhNu8gV41xtKCKZ/5LWMHvWLk/mfq?=
 =?us-ascii?Q?dZO2RJtgt+snXbd8Hqd1kWV+VAbiXedal/a0r0TRJA/k6wK/F6T8CLYdvDVO?=
 =?us-ascii?Q?ByQ1JQpYBq/tDlwTZqa9z26tZkaN5vppB/sn7KVMFIOSwV0yCcJVipw9p8um?=
 =?us-ascii?Q?e7KjObuT1SU4M0CQ3b6QBMO8bEktjezO+Pe8yZQ70ksZFXRN+cbQu2qKnoB3?=
 =?us-ascii?Q?FjTtH6XwK3YCRlV3VMXHHklDcevLqIPQegOuhfvqYzdkyNhdyTGRsNOfnk0l?=
 =?us-ascii?Q?ZTaQLMwcUyAGCWgMqRQCEHbfYPjmMIr8H/Vzq0ubb+ocYbNUbp0NAHAs89eO?=
 =?us-ascii?Q?vRokLAnDmRjFm0SyGG8AV39agfT9xkSl71mNaAOta575dgXaRexapJjKZXwb?=
 =?us-ascii?Q?LAzvBBajFOXKeuY4Zekp3ietFjDoAbVt+Xn4aK+AOsOqI9t3GMYCdcVBSr1d?=
 =?us-ascii?Q?dLaXH08Y0+OeW4VfprP7q+PWIw4O8H829Fqw1O0af1GCWGt2XG9B6liFjQRe?=
 =?us-ascii?Q?v7ywZCppIlcNcOsJNEQ/rieJwnwp5irYisuGwa6COH6QQQ38ueGBW4xYUazN?=
 =?us-ascii?Q?bo5LxHG4qIVPsscnGNN0/RzYqTQ3d8trBH98yzVAbZpKlnaiqk4vIuiSX3jg?=
 =?us-ascii?Q?q6lH0TWeThBSMTXILmgAwFpqsF2DBpHyI4aKdsBt2RUtD0oE89yNHAWAa1yK?=
 =?us-ascii?Q?1WX9etJdwf10NIljyRYCiv2IIbFPslKMhVsB8lztjm+e3yL8hekCyoILD20I?=
 =?us-ascii?Q?tA2JgVsHD4FjSuN0E47akJqJt3Aplay3Eue7Gp/FBJyrQS4m4AZitnLjoxSY?=
 =?us-ascii?Q?fnw3+vemCdEHImZ0kSjKp0cCpUbfMeHtFmmf0gYhUMjyhZ+zzOLcveq6oP1x?=
 =?us-ascii?Q?V+8W28vCrCf7WUj+FwG2BDNJBB3hmRmr+Q5zipojiFDJBH5bSh7y6d7GnKRW?=
 =?us-ascii?Q?5mZxD4nQn1Ou11ZTXxiyopfFDqVk1xqtGTjBisRRgqSJvAnNBnDMEGzlMXWM?=
 =?us-ascii?Q?YjzVwMIwCH8TWTAHhRKqCTrJPeJpv9IPVZ8Qv9f/O0H4Vr5IMRczcduD6I67?=
 =?us-ascii?Q?KhNhvzFO1YeAyetwF7jI/3X1dRYLSI9Jn0dyJSRo6w+vWdRPpMdeWiDmBd0h?=
 =?us-ascii?Q?pyR8KnBl/Y6p5+SDo/ZviVxgDOwBkPBWdCplLVtuW+GPCdY0ZoAlMw9TVYML?=
 =?us-ascii?Q?Zhx4K2m4YtwHwJiNcg6z2I3l/pyixrylsCsHSCcs7fYiFAOhnDMT8BD2WRt7?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 397b5857-5415-4516-3b65-08de1d95818c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 00:35:09.6477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqwU/DFqW+YWMLcdAbsXdB0C0wi6/dezWLvbnetm/gwXRjnzFi1I+9PVkId/0p0gdTXvGMPi0Q5GghmogNofzEcrJovRjgyPbZoYPVxd9Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
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

On Thu, Nov 06, 2025 at 09:04:19PM +0530, Shekhar Chauhan wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Right PAT indices selected for xe3p_xpc.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Matches the details on page 71582 of the bspec.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/intel_pat.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 156b1ee5d..e3588110a 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -19,8 +19,12 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
>  
> -	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -	    intel_get_device_info(dev_id)->graphics_ver == 20) {
> +	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> +		pat->uc = 3;
> +		pat->wb = 2;
> +		pat->max_index = 31;
> +	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> +		   intel_get_device_info(dev_id)->graphics_ver == 20) {
>  		pat->uc = 3;
>  		pat->wt = 15; /* Compressed + WB-transient */
>  		pat->wb = 2;
> -- 
> 2.51.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
