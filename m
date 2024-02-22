Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CA7C5478C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 21:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2089610E0A3;
	Thu, 22 Feb 2024 21:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7XTfgXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC1C10E0A3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708637364; x=1740173364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cFRmFWyehHhQExD0fa1hWC0sLNzFM5FhzStwtswGxQA=;
 b=W7XTfgXCy1tCj191V8yopl7ClrA0Ti+a14BRdq67hR2/gOGV7EtOZshQ
 Nh8QIdIgoYJZgSU5XYxfluyUu3NJ1RriyDemPrXJ3zO4RRoufey/IFWy0
 M/Nzvq5woDrSsMVEzdi+cc5h9xriNrDGSDhAuTp6bPYj050BCOSSU/XsE
 UAnj14/7UbPRAaZyMr+ka0h9pwKSKE2SRiDcNI/ASkSqoGXv99cHoHMlW
 bheX8y6x5NbzDZHJ3B3u39ameGEissJFY0xV9bUyax6wcttLcaR2WD94h
 fJt0fOYHKVwtPBXGqIfZOZKKXJXu7BxqCHu5LguNhgfQHpOhdRMZThTrj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2762983"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2762983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 13:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="36658585"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 13:29:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:29:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:29:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 13:29:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 13:29:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ1SSJM8fcjx5UF+36MJATzDsp6nlBSmYjr5Ild832o4jyAg6N+Uh1tXJ0xkztpFQiwGPACg06wMSWdQlGSI+gjZOaz1byb6VG0Zmz9jg6bqk0wvwFDkaiBf/NO+sSyQbdwY0JUNdo9lClEnBAPSRaHSOPy6lgPVnbGfXvmssPxjOMXgVfo7COyd78TJXFgZ2yACTyfJ+/Pr1ZVngTAJmEDF2Flw554zhy1BVR9fJNuRzlto+oqaU79cQubWUoSF2VhBhU2rXjxqoR8Y4vQh/fMdq18q8NwlbFxesWVvTwVxU04xw2daFC4uB20q7MoXuK7JwLoKqlAMm3rCkOxgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+sf0gql4dqU6f7xeHIi0P8gI1O44jmHjLCQdT+O1kA=;
 b=hUjmJDNkmjROLNDIlB320mF6scBnZYB9OsT0NT10V930VSVyvGr1ZRTcQFTjOaCF6lL2/Nf0yuyNmLeat1qwpIdiX7+yKBeUJSZV8E128keZ/PKIc9QDro0YPwDKkzxOoAjhgEz6ovM2JMmvAibyiPyFoqi7bEyu0y0ZAwXQfHKUz7C/P3JgEToFsyOfQSZhaMpJ27ZBThDN3nuIabi0z8Cyiv2O+WtcEi1OKXgvv6P9qXTbpxurPAPgzlRxwhWc6bhj9zHxiYzzne5b9MDd3bLU/hsxlCsuXeq46Ni9dzQsC1CBNp4AlIcn6v+rGB9EaQ2Qv7pfl+7WY9t3VNAiFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 21:29:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 21:29:13 +0000
Date: Thu, 22 Feb 2024 16:29:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_sysfs: Use same var for sizeof()
Message-ID: <Zde8paI0Rj5I8Bz4@intel.com>
References: <20240222193326.3004623-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240222193326.3004623-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b06b938-3412-486a-eef9-08dc33ed508d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuZ8PD8t8zkLINZaDJi8jVmbADW1Nhu/5DzJo+lGeZobfCvYwAuCUUVxT/Zg0+bKBUnVozggB7zjHqMNkkG52Y7L9zSkLXNCicMQ7laX2wmvL8QAYkm7+hRc4+bwlMRYmcUWkc/DZwSVvRHsjASYetMX4bLg3sg8uoSy+LIQiTETbTaNY8n9RKJ4ab+N1QRRyz4VNQW/K1/hZvalJ50+ttvHOo6IUS1SpgKSPmMe0249UlapAxJ7CD+hwNFC43KaicZv2s7c2GkadYDIkuVRI4e+eNa/pdgZs48H4c93tal3B+g3El3Kfme4+h72dKZ7LlshlT7vV1ontj0S79mpGZx0xjxD/eE07B+BNrxpQz7UPwp/R9PVOqliYG4r51TV1dSQGlontQ14FZk3OH3ln21lAACkpL+1960XqvVPv1B5agIprQISVV13TmAzuqTNezl6cCbA3h/3nyAtKIj7DIVDbsWj+BLb6/8GlwxSyGfmsVnguV4aK1fW7SsOT5pu7JCzoHonvt2YmZPQOr30rYzOXf61JjzoCDPBFQSLuw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UH/LidUN6QGcjSqNOb64L8ZWN9dYgjFhn7N9iHpEuTaO8PfokjG7MsxVsqTs?=
 =?us-ascii?Q?aNsp4YOaOclz0OiHTZDck9lwG/ZDXhjYYgFQxigkiZOnyZvLohlTvGyiyEoD?=
 =?us-ascii?Q?R4P2viRXkYl0R0f2VvikSgT3jmj7mnAlrfZNJsw5mYpYp1s3UpbYp5Rilpa6?=
 =?us-ascii?Q?jrCk1w8iuy4NkkfVmyhL5gzOkdf0IuWbkeGgTOcTuPr4TtTULmqmbO6xfiP0?=
 =?us-ascii?Q?QfwasjTcz90WBak7VReWjyxJoZJL0Gfw5pNVtyh6hJYBhVjCOLtYW1w1RGUm?=
 =?us-ascii?Q?VVWxkZOsDKW+22yjPJi3WVDxVxZAb+0vUr2nyi4tokF+94YHnnllxi7/3hxY?=
 =?us-ascii?Q?tNDgqhT4NMwMAEjgSwcqTjd82Qu5D7zFUl043p/c5z1KGTJGqitFDi5Jwf4H?=
 =?us-ascii?Q?WPZCj5Br7CLVkzGZ/tNwhRAwrRXMuYZXLIcIHGCgmaJR8XZpaEm2iuU7Ax7k?=
 =?us-ascii?Q?VgCYUSkccuobB4hFzz1pYMTQ73CUs1VZBJkH1Rg0sYElFMnR7aQRX4g/+9oL?=
 =?us-ascii?Q?VOSyr5z4kiwj/QIS4goWGg1VCJRFuajTuVf6xMHytbLwIxCad/IBBPL+oi5B?=
 =?us-ascii?Q?M8WeoYwj5ojnYgDWSt7F5rK8sRfvY1sIrUgniH4WokOqHOHtXQImS2AnLYcX?=
 =?us-ascii?Q?SkqIVhlC3tMmOyPXgtw8EiS3Wekshl4EPHew032MijyzsoF4bAnYmH+V94PA?=
 =?us-ascii?Q?ZuQR3gEkT/4hJaiSerHIMTA0Mx3wH6R+BMbjN8ZGFLcQbUtl2IBaPXGdqlcw?=
 =?us-ascii?Q?96lV80/9KkGT6bD/8a/JNRK+ndvUfybNB5cGwkYy+JITNGamDEa927uw3ftJ?=
 =?us-ascii?Q?DGvvSQL4VF83vwKWJjgz8aqzf2vX80dyGlhcL9Vh93JlyaEiSFh2wAvf3OXx?=
 =?us-ascii?Q?OvOobGvPnNejYim1yIsy41bbZFrLJb8Ll5xzF23m1Tb6WUmZ9QVFRowEIyow?=
 =?us-ascii?Q?mtzAPcbskhO2yr5woZx/JnEFkPCDH4ycRYMmri5GIaxU26DliNIo7PBl5Hp4?=
 =?us-ascii?Q?bVBw1sYLnRx23eo10LbwVgMPlSKSbse5uEfWuovG/pXZPzfykr4IQViENth0?=
 =?us-ascii?Q?AzCijwMJwh5Pnr/QNq465PIw06I2rHqQy3QSVv2AyxvNDXCeGvYjNZYUu1kp?=
 =?us-ascii?Q?lxo6Xjrcvb/FbW7j2LEB5nKlOUzuRYgFC0+lExO167vJZ95bpGCgNAoYMybC?=
 =?us-ascii?Q?DkN2tghuqKkikcYfGQMYu/7OUYodYkrNU6D79MyBgECJIqdyCdKYZw1P2knn?=
 =?us-ascii?Q?zZR8k1eR7iO6RHBdb44w+ed636q0BinxSaYoLf0XY0uvvQlCLsjtQqtQdO3U?=
 =?us-ascii?Q?z5JWMF7XobUkGbnG6zKqVMSfGenCOsED9jLwrZ+Zuh/7BW5ANPEzeRZcPXta?=
 =?us-ascii?Q?Jyz5r8qyILAVuK4CAJmzFRm7UmkDx0PXl28GvzUsXXrGpXGkC3TYjR85pN1d?=
 =?us-ascii?Q?QMW9KhxK5b5npA5NMa6Rhemqa05jbddCouEFPaahmhRAPQVucaTqwevxFoj2?=
 =?us-ascii?Q?aGcBu/4dXB7ESA/8iYdvEOyXaiFLjXlgS2Jf0i59BmEaPZG/GLV6LvtPyfKL?=
 =?us-ascii?Q?aha82EB4698XSaCbGnhOm6IUVUn8AH1UA8OTfAGasEJ8RyVEK7kGuaaO3NRn?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b06b938-3412-486a-eef9-08dc33ed508d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 21:29:13.4137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ub/InDMyxUWbdqtOAqxhriGeSAi7gcQDryFqmx0fUY+uj31kFkeyI33SIKkGAINo5AnMuPEZU5jE6E+lUerQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
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

On Thu, Feb 22, 2024 at 11:33:25AM -0800, Lucas De Marchi wrote:
> Let's guarantee we always pass the same pointer to vsnprintf: if we are
> using the array size, pass that instead of buf that could point to
> something else in an eventual refactor.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 51b610114..2b0225138 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -513,7 +513,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  		return -errno;
>  
>  	va_copy(tmp, ap);
> -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
> +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);

indeed safer (thinking about the possible refactors)

perhaps we can even move *buf = stack from the begin of
the function to an else of the if(ret > sizeof(stack))?

anyway, this is already much better

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  	va_end(tmp);
>  	if (igt_debug_on(ret < 0))
>  		return -EINVAL;
> -- 
> 2.43.0
> 
