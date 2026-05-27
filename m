Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE2CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 11:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F1210E1B3;
	Wed, 27 May 2026 11:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYB87ptO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5FB10E1B3
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779882666; x=1811418666;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=66nOmuQMvMxCL0vQfgI/ffjthCrVxI6x47YK1qDTWbI=;
 b=QYB87ptODwzCe4fyQsobWGVt/C13jjMjnk7+yjchKAH+caYkJjoObrn3
 +h9jmztJDUTLCn18tmfUbw9b1Tv05P1sVuK7jo9zufB19oxnvHCoFeiYF
 2Z575I3XFnoKmW8gYEpkCxVIQPqPxs/KauOsI2URKSlgfDuEnvTCbi5Ip
 ejlYDK0UJpZhT7foBv+BR2kviJriHkxAtZ2rY+h9hfwj0iAScr6nIqzMd
 UI3qiVyge9nLECg5gx/LZeEOO4+xXdjEWd7sNeqYI2eRuSd5epfhsgtw2
 xMrgKHVi1oC6ft4+A0vYNJPmYs5jvmcoRoMM4CsFx4gymIVYaZUaVe+OR g==;
X-CSE-ConnectionGUID: CQmPS+/pQNiA6mAd6MnoGQ==
X-CSE-MsgGUID: kx9dJKYhTZ2ZKuLJb/jVhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80679300"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80679300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:51:06 -0700
X-CSE-ConnectionGUID: HnruuU3lQ+GoxsXOWTBfjg==
X-CSE-MsgGUID: 22KMuZ+zSYaZI23WBOdTag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242382623"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:51:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 04:51:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 04:51:04 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 04:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBQtfBRhYT5aFfRBO8qChR/lSCx+TMmgfCdXbKmzhnMlIDUh+3OE/JIuO+3jydcOCEZ+VliLYDQOCmFP1LKjDqlKTLS9veVMvGObJ2dozYvYxWP5wikeczqgeDsRil38rGRJI3o9KNDTLnaYk15Rx+9CfQWVC5jMV8gfFtE8TU40UZjoaVrBvKkP1Z4d20fgTg5JqkByl7Ds8UoINf6jMwM1USpuhdykbcpdojkczOE7GB1CnX6eYxdeFMf9Za3poWOoOAJ2sHKFd10Vj2RsEKstp+FWkZu7xhU1M9X2Yz3Ru6TXskEJ6MjCSnK8jmH8OqYP5Vz1GaGqeRZrVVEOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg1BUUdtqaE8PFbZhLt2F080cocCUSpJ/iC0ow+UI/I=;
 b=GOENQ84T6xVP7L4BzDV2X44GoQQWc3elndMQdIPODz9qaNX2jR1xZmR78Mpe3bpAsiN+cQ1m1tj+9uAFwcQVQzVjqP3+Cey4HTz0wUgAJVvoSGXbLEP9f24P2g6EcQmm4F2sNO0W0zcQJn3MKtGixoBkxz9nvIaE4J8K1hQfXQVwM/fweyS3WG4wJanUJX+VptWJPYhnY1Fa2nHX8W6XN5y0g0dAOKAWMIYVI5ZY0oQ4leVuDajCcdQevQDlZ1cwYxpSL3stIeg6DJa7wNU66OpjbsZNFvHlXsxBzlLa+OY6JvnIVf7t0RbNCdAy5pPrTg4k0bHP6A94noOz097wMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 11:51:00 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 11:51:00 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ngai-mint.kwan@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_wa: Return false for non-root users
In-Reply-To: <20260527034342.1952153-1-ashutosh.dixit@intel.com>
References: <20260527034342.1952153-1-ashutosh.dixit@intel.com>
Date: Wed, 27 May 2026 08:50:54 -0300
Message-ID: <87fr3d6pgh.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b423550-a5e7-4414-9dfa-08debbe6387f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: MbnlGc+vkZ3XOePjDX0I5xtWIZiY0QN0kOfG9zvsTPaQPaPHhaMYFU6bIti7zKcSsd/Ryf0FcFUytnbz4c4cBREvAvM3Qi2Y9LfIqyMQKudGwqdRPCrxcqXiGxwuZ2wbSywm1v4uhPbLkfLCyTdvIxxruRI2JMl8VtaztJbAsvgPNAGEMK6dHP3qGreaouSQ+W2rjTEkIfydc7LDpHJmTY4nzSZVNJL8reN9sRsvlQUEJtOLUNEMDAmIn9XBegatdOOi+AoBDQWxg2NB7nTd3U2hs9aRNsnlTC0VyU6gEOd2bviJWrkY1Ta5CeIE1OLAHo6pYM3Q6Wa5LjNJuFd7iGQNcZXB2vp70mZNGR650npJUP1RUnwpUUh8oYFqyu1jYrfF6fNTaliqGJyx3kZWiLlTNSUIOr7jJikxxVN1lGEMIti7Aprx4HiYL10nfZAcNYpZbQ7o+mT871Ka2Bmhx1gTkb0TZ6Fv5Mynst6UgtMZ4tFGnDk/1+DBi4wTwhkZ+hrL8uDxOJap5tOzrthdVN+F8dfX8CayY3SAhUAK9JtcLyW0rIi4JDDINO2XQ/kzZzVTcenCZ3i806RNATBT/9OjlheFtYeUFrxFT/Ra3t9RUemAcFOUpRSPMrXSXWS6ejVWuq6f1jRd5wuAQuPrtrOknUP2DZp1Kq6KEeqfJATd8y/wwpjK+HWLDFb+ZnKl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEMuqSaNM/U7G9uCFZQR4QYq9UMXzm+9TJW03qG13suQ8MwDTBclvHFeUWam?=
 =?us-ascii?Q?W325qdkQDzMkBfnSGwDNZGcW2myBOAymgEC2qze3ho6Mjq4PNekNqUf7dicZ?=
 =?us-ascii?Q?DgKEMZD6gu1atWC8PEZVKR63Aw66rRZ++/vyaRPER44lrysnX9kHuD5rjamJ?=
 =?us-ascii?Q?vaEbHtavBnBwAeHsg4kG/K9cAkfEAB7X0GEDUmq9GDth1i6/TsG5ulkvMbXN?=
 =?us-ascii?Q?YpLMdBARlsAJW4H5ZrLW3OZ9Kiyp+drtX/OeWHtZW3d18RnVE4lqu+zYXnwd?=
 =?us-ascii?Q?hyx1NZi6aZ5jWsZVEbY2dypbw1OfFmO9YZyNN+nbpYLKWez+FZ9ppt7WVmna?=
 =?us-ascii?Q?aDrHmu0C0KC+XUoyAIvl9v0ZHWw7rqrjEJPqEwYiZC2oeiA0B5HX2F3l8jit?=
 =?us-ascii?Q?KTJ9xAB7nNK//Wla8Knrfy9JBlA4CtETHpLKSbb6T6RyTAfgnH/Fyf87phFX?=
 =?us-ascii?Q?2TZ17fMCYtXUJnFiydgy7F2G/+nJYY+j8VNilJJOWWdFwVqqwIh4CYmu7h+c?=
 =?us-ascii?Q?hwBwKlWI/mrIv7zAWHL8ZytwixDmwXNdtAvgYc1ocAP9DqQRJKZwSeTYLHu2?=
 =?us-ascii?Q?EcIts922NLmwQbPARo/t0m0LU7WhSTaPkxWqiiTG5ancVOKg7JIC5v9AavYJ?=
 =?us-ascii?Q?dElGrDMa4Om0RuDo8NvBj7LKxKPHa24v7HLfu6xuthw2uxg1L5eQelLJJbNI?=
 =?us-ascii?Q?b+80ur0N9Y6c/MinbqkDfiiPdhrWBRBgDIkmvKNRbFumSY9+vnP8fvXn3tvw?=
 =?us-ascii?Q?y3zPvU+qgynNsfhTvbnMzj/BeaYur1toB00IlK2/4B2JkWnGz6aOlrzUFcy6?=
 =?us-ascii?Q?pRdjTi8JKIo5aege+RlNob2BWW8B/Gk7FxEbM4tOve0biwNrjGb0XgDJdoD3?=
 =?us-ascii?Q?ULBhWzCA13JfqU9pWL5Me6y8G9Y0ldP5V2pDK/oDc4iPQ8GenXZ8H8B4Xrzu?=
 =?us-ascii?Q?Um+aS4y2TydxhAAvE+d+boTn5nvvM+mZzz1q+8fcWDAdvkrO/H36KIiBlxyX?=
 =?us-ascii?Q?imaM9X+Hg/cE2VNxAga0BLmoPf/lmlx3O4KHCOD+tatuu3QnQnbZz3YB/dx5?=
 =?us-ascii?Q?TdJjeY9mwh+za8CB8T+pyBxi7Nc591E0pXpm40Mx7wKMI3J7oI9yo1lLH+h0?=
 =?us-ascii?Q?LSUQ+Q389nYaQXMB39xbJr9dzWS1M5EIdYP34CU0QWnpjcK1h5NO/WiAxRLc?=
 =?us-ascii?Q?M2GhGOeZI1n3w+VS084WSTyayzuw47uw6VfSOxg4WpgPdqZwidgigqw7gKND?=
 =?us-ascii?Q?KE9AXHXinRecPSPGd4tssRZkSkQwAueODrgk82/H5vm1oh4V2U7CkB9jRSJn?=
 =?us-ascii?Q?fDlRnyWLJZ1PLYqtBZWHz5DRGQhN/YHVJiqly610aCISgGsf3zEzDgzuNpqm?=
 =?us-ascii?Q?KRLVDvYrD/eYqZxMKRwIyZ72hQZYWcWSCu/dxwDQmqSgig0pW0aIYK9orszk?=
 =?us-ascii?Q?myDAjxIIk6WODrSDgbAjfDvPQtsBaeU/CnU0d1fGbOE7KI7AfpeoPyweZm1M?=
 =?us-ascii?Q?Dxvxo79hiRfJESTV6yaZ+4CZhSyUDWdZT+KJ8/c3oYZQVanL4r12JCV4KoqX?=
 =?us-ascii?Q?0QydqNbQCm8zPDqAabuEzoKO8wcz/nXmXN9KLSqHpVnTeQ4mdKbncg9Fdbgm?=
 =?us-ascii?Q?Yu1AsXrB//nXEW8Kd/zLDG88O1MQG9jcuqSH/YE26wQpull4Ilgkwm37voK5?=
 =?us-ascii?Q?evyw5J2Q6VOL9CIa+xlCR3RaLODBRPJEtQYXRzXJmHd2t8Q9nKTLP7KwEQ6h?=
 =?us-ascii?Q?lH92I66cKg=3D=3D?=
X-Exchange-RoutingPolicyChecked: UoqXdK7f222RcTwVdkYreFGDsLutotv/rm7e80GrQWsmCvCmiDWGkmD7w8DKe7vt9A2vwNryrLhgkPBAN0/HxfwK6uWeGuUUO8It3MXnSOJBhmaEz+ommffH/jRfVdKKWq841YUy7A/qTePwfGHaEQHa8tvtvxBwrdUOYxBHjGfM9gPpWZ4XZW7xHPGW9yeanThaYdMqiXko4Prwe/UfeXM8H8nD3mDnETXLWRPsB5sSlLIgI6hKrpCaA9Li4MSzCdv8QGV61Sj5hpJmJq8e/9/AambSpJNPU/ZttQU5Rf7VeC6lwfevzz+EtkWd7b+mwQmUpnM7XxpgbkaTpRHGzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b423550-a5e7-4414-9dfa-08debbe6387f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:50:59.9137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNT8jQRavbupFsLVh4arOn572OB9EAhut86g/ikFN9lNVFL1B3Zn1DktGszqs+5q0W239rp3UwNYXJqA9JYptA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
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

Ashutosh Dixit <ashutosh.dixit@intel.com> writes:

> Under some circurmstancs debugfs reads are initiated by non-root users. In
> these cases, just return false rather than asserting that debugfs could not
> be read.
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/intel_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> index a16ea62a4c..2d0d664f3c 100644
> --- a/lib/intel_wa.c
> +++ b/lib/intel_wa.c
> @@ -47,6 +47,10 @@ bool igt_has_intel_wa(int drm_fd, const char *check_wa)
>  	unsigned int xe;
>  	char name[256];
>  
> +	/* If we are not root, we can't read debugfs, just return false */
> +	if (getuid() != 0)
> +		return false;

This doesn't sound right to me. The function will be lying by returning
false here and will probably make it harder to debug issues on code that
rely on having the correct result for a workaround check.

My personal take is that we probably should start avoiding having
asserts in lib/ code and defer any assertion to real test code.

--
Gustavo Sousa

> +
>  	debugfs_fd = igt_debugfs_dir(drm_fd);
>  	igt_assert(debugfs_fd >= 0);
>  
> -- 
> 2.54.0
