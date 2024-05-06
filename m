Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA02C10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 14:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAFB10EB09;
	Mon,  6 May 2024 14:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMGXvHzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6708010EB09
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715004750; x=1746540750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WR7/Q6Xv4dj2yArDkBFyQkdu24LP8wsMFmpK+Uz6Q0I=;
 b=WMGXvHzQLlWzU8Y/l/B1+28BsmbfwcSKvQd37++y+k7+HRMViqGyqWZw
 +iKydIN6LXG8vdNfciipVvdGaxTh9Qpwt/bhSo3+LcP3sVtwW/wiflAxt
 AoJAs9fy2QQT2mY9tPzRMSpY9Hcj8lFkqpxMNajDpc1UlVL6p4c1UOCl6
 FsVwiW+tIyZuTLm7Bs1ddA9WjCXqYSVPcr0I3J0glfG695cB5Ht7YgvJy
 XVk97jIvzEWgO7gPWcJJilCszso65l0SI6iqDfPEwHJSmWPV0LGY+AW47
 52sQht3FGx/MTBUakc++nyUQ0AC3m0riE2uCNJDw5Okev7hL/CAU595h1 A==;
X-CSE-ConnectionGUID: UqwHY+KwRtGErtKEG3ilsg==
X-CSE-MsgGUID: Z6AqkcSWRO+L1+C21Eui9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10911196"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10911196"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:12:30 -0700
X-CSE-ConnectionGUID: i3pB+K+GQc6zdSXtjaImzg==
X-CSE-MsgGUID: SkW8Rk8IRA6320ZAUbgOJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28268722"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 07:12:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 07:12:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 07:12:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 07:12:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 07:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwr3ZOXgp7DapBTd8xdeAojvmfWP4ZxfRuoMU9lHM8yvIY19AJ4qxBsfLuHNDGWK7n5peftDOgvtFJ49EQ+k3se/Es2VRkg2u+eY3qSWgfurjMkCbLmXwahcIaGfW1wggUpqy1Fjce+Mu1KXl3WCo60n4efr6czU7/W1ui6h3Kokv0rdmaNqDK018RjeGOQwUFb2HtzCUkCEElT/m2wBu3C5cM1SFZhPM9zAGMnG+/Od2n+xjipVoPdYDzKB26Kr1CE0Ic8dQ+PBIEKQgY381kcFQnMKG9uPKno54WVTDK+8m+wM1NOCRr5fFXKZOz0l0UncXFhMsHQh1jkqPKconQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjmSJ/t7WD0WL2XiYo/VB0ilwbXKS5r+9Rk24MBw0ns=;
 b=bTyQZEG9m86Q2G7vePyZbFX42dXdAxYcx8fwgtXDvhXf1BfkDYOL1D+FAV8OE43NuwSt6TgUrIxJS9OMRQw10suP+f81L0U+4b0upTIjw2fVlgroICpz3uSgb+H1nvpjAFMIQyb5wHGRcJHE3QDy+zJ+Y4CY1HCIN5pIZr1a56xDamrVE9i7Hj8BcLHvgDZHEedB7wiqiynyeoCIfj0wHu2Iw0MppT5J+pZ83HKVaoghAYrB+/iYitmV8LvCX3SWESAm4IlBkohDpVB5tSsdn96mxQepGGuHe8VeHQYFMPVeTIQDRu+BCHpmT3Eog3X/pm8cqqm0iOynXiM+dCJpdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 14:12:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 14:12:24 +0000
Date: Mon, 6 May 2024 10:12:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_aux: Name function according to sysfs
 file
Message-ID: <ZjjlQ_caFahpRvtz@intel.com>
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
 <20240503224745.14890-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240503224745.14890-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 4115d618-330f-40fd-465c-08dc6dd68d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wjljNQ5h+qoWu6E/pVakc2Lk9k37IS5Vr+dc6g+JLtySAjkH7x/KCIH9zTs3?=
 =?us-ascii?Q?oJlvstc7aOtWsyYLthF97w5ACROTiOaD2pVVp9fpUR3LIq3NZRU3VFGzw09T?=
 =?us-ascii?Q?bIWrqgwELZOPnA0L+k2jipaIxfV9Ji2Soeb8TLezLOjYfa/of6PEhoIH5cUa?=
 =?us-ascii?Q?+yIyzUVdwYqurgCIeT0n6eYC1qRdTmJ9cLIROsx+SDg9pQdxRdIekvXOIalQ?=
 =?us-ascii?Q?D9/S2F7h547K4E9DfeFtrvgv6el0M+fikUAbaRz58efTwTcOOl4n5N1yrO7E?=
 =?us-ascii?Q?IwdUXCw2NyQ+Gef9SYgzmlxK6WbyGf7193rhoAeW63pi1Kzfl/pQ5e3Sjq2m?=
 =?us-ascii?Q?vn+PXq5vK1DBGtWRC9z6NFp8E6eEasIbj2vOx8VDU8OwxnkMo/7Kh2GEzjPh?=
 =?us-ascii?Q?4m7LEVZuvvDG0WY/oVRKR48tkZpm1w7IHlld4eByGOoS4nZNNPlAQaFOeJTd?=
 =?us-ascii?Q?2JD4AoVzNWvpGhWGHecNH/+4pZdpPalC36R+/tfe1SLO0XbI/JKOqSfy8h5e?=
 =?us-ascii?Q?hRwp4MPW9a3S4fGqe6YpQUvLbxKaJzTIWZxwmSieUJIrn6mfKLELn10iiFEc?=
 =?us-ascii?Q?rwqPrEkpzUrMJlSnqVHQmIhLxBlnVFju3Xa4/YrSTOwqqRF9872iKTdEtUq3?=
 =?us-ascii?Q?dEATCEDs+eaoSr59rkAmdiLLZt7Y/71FEt9SzBWo01zqkBQjn6loykdRGooj?=
 =?us-ascii?Q?7LNIlkGmsuzH1dbx0NP7fiABmf2hglMF9vxR38pmy+cxyrPhjQDN269GCuU8?=
 =?us-ascii?Q?ez9lQd/UjQpUd7RpMMM/wiPl3Mqhc1DUKXxzpYsGLPw4ZMirI+34OwxEocpM?=
 =?us-ascii?Q?7zphGsrCyB8dJCOwIsF8th4jowps6WoHfjHc5b/fpBva8nzNNlvgG2+tGHYb?=
 =?us-ascii?Q?pUZ4Mh4RFnLFieSOXND3fMwPY8/Bs8JNEnlq98VMWyaaXM7xGOikQ/dRbSjU?=
 =?us-ascii?Q?3FvQsrkKyxEukZLe4x5aS9wblFZ67a1yMrmWjT4XnfQ5RBAb0dZN8QV57nex?=
 =?us-ascii?Q?ZbMDyRD2WHagXFqGpZheQt44dqBBTsQkpL7ye9pv+Dwv3UF5he3/W/fs+FpP?=
 =?us-ascii?Q?dQ9GK0VYoa+WyLUYbVryEGZkuNNuTzqr7V+6o0m+tezqRPhsXoT4a3SumSFj?=
 =?us-ascii?Q?PrrClTe08EdgJbiPyEDa1+qDN7YY7SoPPqshluyS7+dFezxDblIy3zfjSQkG?=
 =?us-ascii?Q?U873I+QKmOjOKm8TvQkJLBQQcSd2wzy3BF9eRx0eUe8zkbe1bBoHTy1T422H?=
 =?us-ascii?Q?VtOn89ssILLAsvUjZEtXFbZemWZRmYK0lnHqxKOJHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ILpp9WVVIJk8RHdRdH3gyGlDj/RKqVus7lUg97jb3P/J1XbhnL7IbpgKPuH0?=
 =?us-ascii?Q?EyDmV6bmIL9m8eFISawUy0em9u2/pUKjSu+sF0TaF3WrKAqf6MmUJA+6T5EH?=
 =?us-ascii?Q?bkTGMqxgiXVdqajWnRupcuoNJq0gLOTmlSdUCkwwWrXwlD1iu4OFh+Xdrq4f?=
 =?us-ascii?Q?gEtssWMqhecgPqjspnJHDipcNuo9XNsBOIuiz+dgymZYNwKRLf+wucoQoMxX?=
 =?us-ascii?Q?e0qDedgyFQMfBZObc6LUiTPeVdRfKiay+dMXoonDdffuOLqVrtS6sbyQbjnm?=
 =?us-ascii?Q?M/xC0I5EQacI7LRVoo1gJEw9Q1aTw9Cq8tcf59flrgPoRPe0D1uaJYkXFh1N?=
 =?us-ascii?Q?XcCB752fIam3cMzcBxbfbClpV7TgOJDnnKfL5NbBEm1ogX3fkQjQsRySAfwi?=
 =?us-ascii?Q?JFKkFcgMpjYZZDm4IfslhZlQNDj3kLDI/DS97i61pV3vkEAGqL6Wd/UqUuCF?=
 =?us-ascii?Q?x1NJZPsjb6/1/NOT8sjIiPGgj8+F0OVct8M+dHQ+HDLHeC3EE8CjFOo9cjAc?=
 =?us-ascii?Q?uusZ8MCKWywEKFA10NOPJEqoypFZzVQPnWMl2IP6tpr3MeSZ/stGxX6yaL8u?=
 =?us-ascii?Q?eDFZS5t4+UpnMrPiIXdsmNARwYNhYNONlPVlRBawpwNaIsvn5oIWlcE3R6iZ?=
 =?us-ascii?Q?PAX9A9/VPhUflQ3SijMANx8VfcTxiuDEljlQtQxplXeQGb+RNQ379m8rsQSH?=
 =?us-ascii?Q?aeJoxObcJdKtnQ6IpA3JKTvCbQupyqWWuLxMIDpUTU1RMTw+WkdE6oL9Go+J?=
 =?us-ascii?Q?oKLoiYX7yDe+TZ3WiCshojZ1ZXgl9vqEBP76bexgZh0Yv4xFey4jf3D4ZbIA?=
 =?us-ascii?Q?FTTGeuNHMSjK2MWDkCRKi0wVJVC1MfQ952Cc/T7zU5GmXUOyHDCrgKImUFsO?=
 =?us-ascii?Q?LHSjY5yg81sF+HjFP2fP5hBKBYTJXwWBq0mTbY8RtFH2Yrpx10wJKHSmzsXN?=
 =?us-ascii?Q?t63OPSC0K4kK+ZbvtlURp79PV8Jmx45FvIVd8s9fzdZRAGp0ATsTuhultL1i?=
 =?us-ascii?Q?aALDFbED4RvN9sZwIhxbdhTVVt6LIfN0JTBWGp6FDG//uCz60qtZkdIBnzSk?=
 =?us-ascii?Q?5Yzf1Z5+5dJZRwNOFjV1hLZAhno+NbWZRiHyPB8WX+IuQcMeqePpWIuRvLEZ?=
 =?us-ascii?Q?vYQdO/wzYIzledSuDT81CYcOKazFBOv/M3C5KeMaCqnLEm2shTciFhYnTng9?=
 =?us-ascii?Q?RorA8vILsUQLNCN4rvmmI2js93EAK/8h5CleQS7POqrS3iB5t61MDnW/m0HM?=
 =?us-ascii?Q?d+z63eO/Zy7HocVaShk/Cvs2cZ6pPQ33lLJdk4DKAijq+0tLAPFCELxgjkfw?=
 =?us-ascii?Q?dAmBfwByGWm/X0wnu8wP8AXAabz6R83StvPjoJ6YRFmOPQ2CPijuBRk0D5yP?=
 =?us-ascii?Q?kKbgWwHgx4oLEEF9faQtRBh2wNBkgLyJWJ9dWIfMjI2Egey/iDslRY4YfT2n?=
 =?us-ascii?Q?niC7MtTMQvoXe8zFsEpfCVUIv8BH1PU4leyVRh4u8JtaacyP8Db2HQ0a2Shz?=
 =?us-ascii?Q?KxN2gCJn8flZ3QLf7VQddiEMU1vRUIRgkeRx7Kd8cyPJXNvfrBcR5jhCO79S?=
 =?us-ascii?Q?XhlBMOaeXLn1BxxDyVBL3kfqF+k+RgSii5ngspbb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4115d618-330f-40fd-465c-08dc6dd68d26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 14:12:24.0674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2j21bPXUtIM+ZsA7M8mg/wXy7EYNTHTW8NcdkEDu5xe+J/mPa26RpbbMb+594V/dGwG3W+abBYgtr1GK2eygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

On Fri, May 03, 2024 at 03:47:44PM -0700, Lucas De Marchi wrote:
> Let's follow the sysfs filename that is being written/read so it's not
> misinterpreted as something else: at first I thought it was dealing with
> /sys/power/state, which it's not.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_aux.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index d6aeb876b..398665999 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -732,7 +732,7 @@ static const char *mem_sleep_name[] = {
>  	[MEM_SLEEP_DEEP] = "deep"
>  };
>  
> -static enum igt_suspend_test get_suspend_test(int power_dir)
> +static enum igt_suspend_test get_pm_test(int power_dir)
>  {
>  	char *test_line;
>  	char *test_name;
> @@ -765,10 +765,14 @@ static enum igt_suspend_test get_suspend_test(int power_dir)
>  	return test;
>  }
>  
> -static void set_suspend_test(int power_dir, enum igt_suspend_test test)
> +static void set_pm_test(int power_dir, enum igt_suspend_test test)
>  {
>  	igt_assert(test < SUSPEND_TEST_NUM);
>  
> +	/*
> +	 * When pm_test is available, it needs to be cleared or set to specific
> +	 * test before /sys/power/state is written (which is also done by rtcwake

                                                                                 ^
missing closing parenthesis

with that fixed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> +	 */
>  	if (faccessat(power_dir, "pm_test", W_OK, 0)) {
>  		igt_require(test == SUSPEND_TEST_NONE);
>  		return;
> @@ -1009,7 +1013,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  		      !igt_get_total_swap_mb(),
>  		      "Suspend to disk requires swap space.\n");
>  
> -	orig_test = get_suspend_test(power_dir);
> +	orig_test = get_pm_test(power_dir);
>  	igt_aux_enable_pm_suspend_dbg(power_dir);
>  
>  	if (state == SUSPEND_STATE_S3) {
> @@ -1021,7 +1025,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  			      "S3 not possible in this system.\n");
>  	}
>  
> -	set_suspend_test(power_dir, test);
> +	set_pm_test(power_dir, test);
>  
>  	if (test == SUSPEND_TEST_NONE)
>  		suspend_via_rtcwake(state);
> @@ -1031,7 +1035,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  	if (orig_mem_sleep)
>  		set_mem_sleep(power_dir, orig_mem_sleep);
>  
> -	set_suspend_test(power_dir, orig_test);
> +	set_pm_test(power_dir, orig_test);
>  	close(power_dir);
>  }
>  
> -- 
> 2.43.0
> 
