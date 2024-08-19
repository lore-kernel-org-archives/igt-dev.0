Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E96C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A02810E0AD;
	Mon, 19 Aug 2024 20:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJknNG31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2378A10E0AD
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724100937; x=1755636937;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=pTmILyfuhTxyAfIN4UOBOWdUi9Zhff9BUFQJeA5JFv8=;
 b=YJknNG31awaG9L0RUfV/FbpHvtYBd+5Wkl/NSTSHjBMopNBZ0fpeVWOP
 c+sNlTKHLajOJoVYiUjiHXYYOXIJ2fDLZfXP6v7pKHr/5maR0ujUlpDeE
 K2rsXeKqiViBIRHjBe6fif+lv9PwfjNRhSJDf4uxvs0nfTDeigDBSDcju
 a+3k+mn3J2hsFpxVHQ8G0QbOdXbvxwpD1feM0KaAQCBgB+Q78mKsY7ScM
 Ju6w4uRjHwojlhWZeJGLiWYEtbixHMtn8nVtp25jPG8FA43jPzJOtGxXp
 l5cSV0BGC1I+4cGhxQW6NZogXhESGVuNNaFvWeyNngwhcY25bJw49w3LE g==;
X-CSE-ConnectionGUID: d9oy36F2Rqye6Hdjphp+HA==
X-CSE-MsgGUID: A0x6Va5fTbCJCOhjnLs51Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33754616"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33754616"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 13:55:37 -0700
X-CSE-ConnectionGUID: LIb5zZD1QQe9r8Y5CsXaIg==
X-CSE-MsgGUID: 2mimunfsSS2Ogyc27d7/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60331268"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 13:55:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 13:55:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 13:55:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 13:55:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOmP9gE6MjXpocPqnARwXJ+hzcwsZEV1WOTGHV6p0knN14OauorziHIEZU3bhpFqNf4KejaEWkKJYN+l2SFiYvxIN3fKu/9AXxWXDukPwvByb9hwhENDuB0qrLPi45jekp8cDDnyoxWw18FMxEeh9Kn+kfGl7as9u3Mx8Un8r8JfbspN9BKjJw9qeC2TDznPLoVoQRnCQ/zPG4DgiJpkBc4BKTSFv6bu5aAkYkHCGhVNcRTqNA4ZoEM7Xn1LyLZd13jsSh4yg2PWX0T2GaJeZ15Kz+vlnZOEXQTv87DtpOWeyxyWTjw8yjhzpNf0iwrnbSQM2ukRtYZls+a/xJ+MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoGOdI5erXDEKoJmsus8P8i5yuPf38rDQEZKHjmmKy8=;
 b=QaTg7b8aU40i+HH4xxJ2H8q339KVNo5fMxmvMAJBWdETvs4EwxWHLM8SnAXcj51MSFBfDBh/W21SfdEWqOD9IitBbvXeUCaDFYg19BHam2ftwGD2mbtadWXjTHpY7YlomcIxDGq3honD/tlf2/hZEsOcZB9w9TujDom53cGkXRZCqOSWPXKx7jmWpy09XzQhtbFgC6K62yZEpNmT40HrwAtIxe5XpHJoOCgRUEAwDgqx5ljz7ikFrURqrTz5AYXmF+bNmVu41O9Wma/hLtcDOUAqJsg9vMBKCdUgs1jFTzHtkH9FzBUVUfNWBxLG3CioszhmRYJhwlJygOqPL6TfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:55:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 20:55:11 +0000
Date: Mon, 19 Aug 2024 15:55:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_drm_fdinfo: Add single engine tests
Message-ID: <ze6jemttgmndsyszzrs73a3o66vlwx2xga3b5oh6uegc2kttpx@4jlivqmv3v3s>
References: <20240816222140.22577-1-lucas.demarchi@intel.com>
 <172388596099.659725.5115629147987798491@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172388596099.659725.5115629147987798491@2413ebb6fbb6>
X-ClientProxiedBy: MW4PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:303:b4::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a105e8-0412-422f-f152-08dcc091374f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y0L/tr9RgFChUBIoZBuivM1iMGxwN/lGo68kjoEhri8HgzMzA6H5U5V9mgFW?=
 =?us-ascii?Q?zT0Tha/MnH0xVsfN9yyQVAcLp9fudbSba6IteVgUTEbZeuYki7+q/YvXI2kx?=
 =?us-ascii?Q?xUiq2nI2ro0hk42QclR67HR+ZJ8+KsDRLIiwXQNBIMaiAeB23o15I/4CWw3d?=
 =?us-ascii?Q?BqIjl8eqgwOgA6mJfMGxTsOEYJnhGJ4x1w+Lz/8XVEUjhKCHRJqlUfqTTh4f?=
 =?us-ascii?Q?rn2xOxDbLP4hYL81YRr4rr9ObdZ3rKlo6pe1sc1udDEqR9rThm7g8PUdnxyV?=
 =?us-ascii?Q?zwmjI4+NbOz4SDqNDi4VMU2omrzK3y1GzcXC0FCZUJokBkXhRbNZk4AOzm3a?=
 =?us-ascii?Q?/SOxfuzjma7K08PSQpAwG8zzB5HQi5zAt+8VCnmmujjFeIFEEU9hFFx0Y+/K?=
 =?us-ascii?Q?6rUjM1jAudAYYL6J9Ax9kUyGbp3dAkr2f4v9FY2xUAxjXuXd6aWWXS3QnN7B?=
 =?us-ascii?Q?hzdx14IocSKDY91y3Y4xTyDloXJwmzq7jQQbissI3VWP5U9fAWHFnBO12YUS?=
 =?us-ascii?Q?I/nCsbK0yqeXA7ujOCNfmtwmhlXYCrg+2PSn8uhHu2uDNN+XlnanId+Q/Rin?=
 =?us-ascii?Q?gWpki4xj/Q96mrV+8A48RUOt61jIDQ8E+iJBl7JFCtxhZ+dbxpJPHypuWdtz?=
 =?us-ascii?Q?7UTHazjhw/J9CNNsTMeJoybE/unryzJSSJzgW5Ye2LU5mR08JBJX0Pm4zj+K?=
 =?us-ascii?Q?CAbTbLLU/wvL8drOFjy33pFP1ttpMno2f2T92ybhJInMkI9oqeq8WeFfl4VN?=
 =?us-ascii?Q?kXJHAt0X2n+jj567Cg9yPEwuFJS/OdqUaiflkdRxgw6yhRtFqzVyLQmsh9o1?=
 =?us-ascii?Q?b8XvspRTrQy4wyzK+XPlAqIhTKqvk77t/Kp4hGRHrFaNFM59t2ZpLxjxW+8K?=
 =?us-ascii?Q?5xYjZr+msQeBUwWjMQ9/aIwzq1U7tEV50Zvo74X1lVHOx62Mg6WoV8VUrrJy?=
 =?us-ascii?Q?7KnTrRrf+QXUsgyGN3xKzYYGHOymxbRFxwUOQDbdZzYR5/MkfQaIhzPaPdev?=
 =?us-ascii?Q?0xfBd5Sd+I7WOzvTi1StwEkujXF7M0jANe54J5wINYNiV+j+Wi5tCMIWaJWD?=
 =?us-ascii?Q?cvvVI9+8kNwcjenjW6pxLStKeHMaX0WpZePNbJaEP2aepSxsQGJjSxBKNEjL?=
 =?us-ascii?Q?CwIoGvwu2G+dgZRRe9nhIFWqrC8iX/vE8DX5cFV7HZkTuSQjHVmtpGQCQqxK?=
 =?us-ascii?Q?wMH3i0yMzv8rBNisw5t6pDfWDC34u4KdbbpuqoSIIKFoSIZVLM3gdfEtcNbH?=
 =?us-ascii?Q?LCJZzSQbctWjfi9zteRAGKwAWOTmDqJcOGmjLKGQjHXmf2Vl6Ej9meGlNd0C?=
 =?us-ascii?Q?OMw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S2ZElLGHXG2Ho8ZkdQV79bjE/FjxFGX/ZbJj0yZxf0dlKySoNJI006dFk8qP?=
 =?us-ascii?Q?cFN/PAJMFQ8nbIGF1hCI10l35dyYblsYgXg0hXhiLn7Z9uu3eVLG25poT3pA?=
 =?us-ascii?Q?rALqcEUipunagI3wPkdc6xnckJkRBAJCb6zIXlQ3TF5rDCtJ0KlRoIXZDs/8?=
 =?us-ascii?Q?X8q+D1AFwmhugN7Tp/JJD42ARMpGw6yl9PbuJ9w74FadB3dAizbyyzAHIn6Y?=
 =?us-ascii?Q?aDbTp+dqP0yfeXWorMKiBIN64k6zpEQtXzRUHorEef73q/ocvR1r1ZlLDPe1?=
 =?us-ascii?Q?p0l0KkDxd81rlR1ILzj2H+SaMQf9mGNQyxYnBxEmSs4+db4Q2hmhWn6yVRr8?=
 =?us-ascii?Q?vFoJVeXAlN1JHfhUxFHy0MBSFPtFgYLGiDlOKP/dv3guKD0nZaHDbIKg1fqD?=
 =?us-ascii?Q?VQOSlTPWlVSfyDXICdsSpKZjLxLAZ+gv1lWgPmq9M6FK7PV8caCziq62vbRx?=
 =?us-ascii?Q?zhJC/aIYAv8w80BSqlgOIG5rFvg9rT8SFQNWWjKhh9UZxGN6mCjOq+3H/zwh?=
 =?us-ascii?Q?plnZavj8H9SlYjGZQraHtcFXqXWWxcVgU+YtO6vyx8p2pq9MsGU136zwrdxt?=
 =?us-ascii?Q?0vS1YrdKfRpYph4M66ZDQ/wrO70hR0/L8g7FPI1TLFpTvi83tYekw6p2VEJA?=
 =?us-ascii?Q?2mq3NF4iWwwbrO9yL9A1BDN8FaJUCOrrN7qO0Rdx8WdMEPv+YKUvBwt++3ZU?=
 =?us-ascii?Q?jPqmgkgqM62tQYPfGs4xY662s43EQ/M73MJMHVO3VDVHjHP89/pjlbD8OaeY?=
 =?us-ascii?Q?gOIHHDwEMZ3k+3wlB31wrSsDTN7sWOlSJ7SoRYsL+rJ+zOeNzrcul9NMFhuo?=
 =?us-ascii?Q?7PawHCnolEri8dqISRDzsbif45pD/4CgUGnI+xozmdcAe4Og64vMkAozhuc3?=
 =?us-ascii?Q?6ii4euExHBaAwaYEUWidhAjyE0xk+nQ32xMbbbMRRv5pQgg667Az71LYNsdL?=
 =?us-ascii?Q?hEF+uVUvpJ98xWe/50BumeagA+FNc30FTPQKNtnUXToURq1p56f6VpLwMSZD?=
 =?us-ascii?Q?EIOO6KSjtzzLk7Ay0KLDvL9Q0w7WsNDlNkWVZabNbCxXqIG0spZ93uO/p8ym?=
 =?us-ascii?Q?DGgvlVI8R9sUaMeNF1G0KNvRBr88Q+ZiXODaliN2zPsoSOSRVMSnjAP1a7Mw?=
 =?us-ascii?Q?frHMKWn5Fn1e7HWaSRi497k07fC/imEZV84IxT1JJsQ5H63729FHYvOjtcJ3?=
 =?us-ascii?Q?mg6jArSjfJRjv6w39QYWjqVqVo22x3MoM2viqa/IXJElOVnz4+aOAQmUQTYF?=
 =?us-ascii?Q?w8yvqSFqY+X8FFr2+YW4jI2MqbYIfep8eHLZEVEIq93EaDc1yJeUyZAvIUqS?=
 =?us-ascii?Q?7Dw6ID9I/WjFtBPP3alxPTV2+0osldhIB+aJZcFTpkUHSNSom7+JPCvclGea?=
 =?us-ascii?Q?lNR3ErJJonKV0A/XXMes9ObpG+oOdvqQpo9gstidszOtvmxinQfqXSbmOiPm?=
 =?us-ascii?Q?71athzc5zfBxvNYcco+mUhvw3E8xOjOrPIz3TfKhDibREiuSm5DcBylSXVvj?=
 =?us-ascii?Q?mbQxYVhE9NTNIq9WWXe0dhhN7OrifZV7fNd/2b1tpqZrJIWDAm1ivxUHYdA1?=
 =?us-ascii?Q?oUTevbd0BcOBqKNZlYRfo4Gl9MrGA6HMBApIgzxtM8IIvoixyOhHgTUEPlqd?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a105e8-0412-422f-f152-08dcc091374f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:55:11.3277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7BkM9rH/OBj4a9rLFFLUd0/ChcNkyPSUANRwZcsY2PlpcC05qA1iFp/vZ0fXvHN9ITjnDnygKUlas0F4dY9214uiXBlPog83qV+cQzQHMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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

On Sat, Aug 17, 2024 at 09:12:40AM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: tests/intel/xe_drm_fdinfo: Add single engine tests
>URL   : https://patchwork.freedesktop.org/series/137405/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from XEIGT_7975_full -> XEIGTPW_11592_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with XEIGTPW_11592_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in XEIGTPW_11592_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in XEIGTPW_11592_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
>
>  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
>    - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
>
>
>New tests
>---------
>
>  New tests have been introduced between XEIGT_7975_full and XEIGTPW_11592_full:
>
>### New IGT tests (3) ###
>
>  * igt@xe_drm_fdinfo@drm-busy-idle:
>    - Statuses : 3 pass(s)
>    - Exec time: [3.47, 3.55] s
>
>  * igt@xe_drm_fdinfo@drm-busy-idle-isolation:
>    - Statuses : 3 pass(s)
>    - Exec time: [2.54, 3.55] s
>
>  * igt@xe_drm_fdinfo@drm-idle:
>    - Statuses : 3 pass(s)
>    - Exec time: [2.52, 3.52] s

The 3 new tests passing.

Applied, thanks.

Lucas De Marchi

>
>
>
>Known issues
>------------
>
>  Here are the changes found in XEIGTPW_11592_full that come from known issues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#1659])
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>
>  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1399]) +1 other test skip
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
>
>  * igt@kms_content_protection@content-type-change:
>    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#599])
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-6/igt@kms_content_protection@content-type-change.html
>
>  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
>    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1541])
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
>
>  * igt@kms_flip@2x-absolute-wf_vblank:
>    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1421])
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html
>
>  * igt@kms_flip@flip-vs-absolute-wf_vblank:
>    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#886]) +1 other test fail
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>
>  * igt@kms_flip@flip-vs-suspend@a-dp4:
>    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1195])
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-dp4.html
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-dp4.html
>
>  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#656]) +2 other tests skip
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
>    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#651])
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
>
>  * igt@kms_hdr@bpc-switch-suspend:
>    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#2028]) +4 other tests fail
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_hdr@bpc-switch-suspend.html
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html
>
>  * igt@kms_plane@plane-panning-bottom-right-suspend:
>    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#2028] / [Intel XE#2533]) +2 other tests fail
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
>
>  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
>    - shard-lnl:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#324]) +1 other test dmesg-warn
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
>
>  * igt@kms_pm_dc@dc6-dpms:
>    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#1430])
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
>
>  * igt@kms_vrr@max-min:
>    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#2443]) +1 other test fail
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_vrr@max-min.html
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-8/igt@kms_vrr@max-min.html
>
>  * igt@kms_writeback@writeback-pixel-formats:
>    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#756])
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_writeback@writeback-pixel-formats.html
>
>  * igt@xe_evict@evict-cm-threads-large:
>    - shard-dg2-set2:     [PASS][30] -> [TIMEOUT][31] ([Intel XE#1473]) +1 other test timeout
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
>
>  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1392])
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
>
>  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#2229])
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>
>  * igt@xe_oa@oa-exponents:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#2541])
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_oa@oa-exponents.html
>
>  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
>    - shard-lnl:          NOTRUN -> [FAIL][35] ([Intel XE#2514])
>   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
>
>  * igt@xe_pm@s2idle-d3cold-basic-exec:
>    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2284] / [Intel XE#366])
>   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
>
>  * igt@xe_pm@s3-vm-bind-unbind-all:
>    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1162] / [Intel XE#1941] / [Intel XE#569])
>   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
>   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
>
>  * igt@xe_pm@s4-basic:
>    - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#2019])
>   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@xe_pm@s4-basic.html
>   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_pm@s4-basic.html
>
>
>#### Possible fixes ####
>
>  * igt@kms_async_flips@alternate-sync-async-flip:
>    - shard-lnl:          [FAIL][41] ([Intel XE#827]) -> [PASS][42] +1 other test pass
>   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip.html
>   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html
>
>  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
>    - {shard-bmg}:        [DMESG-WARN][43] ([Intel XE#1033]) -> [PASS][44] +1 other test pass
>   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
>   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
>
>  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>    - shard-lnl:          [FAIL][45] ([Intel XE#1426]) -> [PASS][46] +1 other test pass
>   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>    - shard-lnl:          [FAIL][47] ([Intel XE#1659]) -> [PASS][48]
>   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>
>  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>    - {shard-bmg}:        [INCOMPLETE][49] -> [PASS][50]
>   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>
>  * igt@kms_cursor_legacy@torture-move@pipe-a:
>    - shard-dg2-set2:     [DMESG-WARN][51] ([Intel XE#877]) -> [PASS][52] +1 other test pass
>   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html
>   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html
>
>  * igt@kms_flip@flip-vs-blocking-wf-vblank:
>    - shard-lnl:          [FAIL][53] ([Intel XE#2422] / [Intel XE#886]) -> [PASS][54]
>   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>
>  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
>    - shard-lnl:          [FAIL][55] ([Intel XE#2422]) -> [PASS][56]
>   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
>   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
>
>  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
>    - shard-lnl:          [FAIL][57] ([Intel XE#886]) -> [PASS][58] +1 other test pass
>   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
>   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible:
>    - shard-dg2-set2:     [DMESG-WARN][59] ([Intel XE#1551]) -> [PASS][60] +1 other test pass
>   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
>   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>    - shard-lnl:          [FAIL][61] ([Intel XE#1901]) -> [PASS][62]
>   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
>    - shard-lnl:          [FAIL][63] ([Intel XE#1901] / [Intel XE#2028]) -> [PASS][64] +1 other test pass
>   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
>   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
>
>  * igt@kms_hdr@invalid-hdr:
>    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][66]
>   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
>   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>
>  * igt@kms_pipe_crc_basic@suspend-read-crc:
>    - shard-lnl:          [DMESG-WARN][67] -> [PASS][68] +1 other test pass
>   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
>   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
>
>  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>    - shard-lnl:          [DMESG-WARN][69] ([Intel XE#324]) -> [PASS][70] +4 other tests pass
>   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>
>  * igt@kms_pm_backlight@fade-with-suspend:
>    - shard-lnl:          [SKIP][71] ([Intel XE#870]) -> [PASS][72]
>   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html
>   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html
>
>  * igt@kms_pm_dc@dc5-psr:
>    - shard-lnl:          [FAIL][73] ([Intel XE#718]) -> [PASS][74]
>   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
>   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
>
>  * igt@kms_universal_plane@cursor-fb-leak:
>    - shard-dg2-set2:     [FAIL][75] ([Intel XE#771] / [Intel XE#899]) -> [PASS][76]
>   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>    - shard-dg2-set2:     [FAIL][77] ([Intel XE#899]) -> [PASS][78]
>   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:
>    - {shard-bmg}:        [FAIL][79] ([Intel XE#899]) -> [PASS][80] +1 other test pass
>   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html
>   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html
>
>  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
>    - shard-lnl:          [FAIL][81] ([Intel XE#2028]) -> [PASS][82] +6 other tests pass
>   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
>   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
>
>  * igt@kms_vrr@flipline:
>    - shard-lnl:          [FAIL][83] ([Intel XE#2443]) -> [PASS][84] +1 other test pass
>   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@kms_vrr@flipline.html
>   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-3/igt@kms_vrr@flipline.html
>
>  * igt@xe_evict@evict-beng-mixed-threads-large:
>    - {shard-bmg}:        [TIMEOUT][85] ([Intel XE#1473]) -> [PASS][86] +1 other test pass
>   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
>   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
>
>  * igt@xe_evict@evict-large-multi-vm-cm:
>    - {shard-bmg}:        [FAIL][87] ([Intel XE#2364]) -> [PASS][88]
>   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
>   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html
>
>  * igt@xe_evict@evict-mixed-many-threads-small:
>    - {shard-bmg}:        [TIMEOUT][89] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][90]
>   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
>   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
>
>  * igt@xe_evict@evict-mixed-threads-large:
>    - shard-dg2-set2:     [INCOMPLETE][91] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][92]
>   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
>
>  * igt@xe_evict@evict-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][93] ([Intel XE#1473]) -> [PASS][94]
>   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_evict@evict-threads-large.html
>
>  * igt@xe_exec_reset@parallel-gt-reset:
>    - {shard-bmg}:        [TIMEOUT][95] ([Intel XE#2105]) -> [PASS][96]
>   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
>   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
>
>  * igt@xe_live_ktest@xe_dma_buf:
>    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1192]) -> [PASS][98]
>   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
>   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html
>
>  * igt@xe_live_ktest@xe_migrate:
>    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][100]
>   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
>   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
>
>  * igt@xe_module_load@many-reload:
>    - shard-dg2-set2:     [DMESG-WARN][101] ([Intel XE#2019]) -> [PASS][102]
>   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_module_load@many-reload.html
>   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@xe_module_load@many-reload.html
>
>  * igt@xe_pm@s2idle-exec-after:
>    - shard-lnl:          [FAIL][103] -> [PASS][104] +1 other test pass
>   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html
>   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-2/igt@xe_pm@s2idle-exec-after.html
>
>  * igt@xe_pm@s3-vm-bind-prefetch:
>    - shard-dg2-set2:     [DMESG-WARN][105] ([Intel XE#569]) -> [PASS][106]
>   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
>   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
>
>  * igt@xe_pm@s4-multiple-execs:
>    - shard-lnl:          [ABORT][107] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][108]
>   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
>
>  * igt@xe_pm_residency@gt-c6-freeze:
>    - shard-lnl:          [FAIL][109] ([Intel XE#2028] / [Intel XE#2512]) -> [PASS][110] +1 other test pass
>   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html
>   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html
>
>  * igt@xe_pm_residency@toggle-gt-c6:
>    - shard-lnl:          [FAIL][111] ([Intel XE#958]) -> [PASS][112]
>   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
>   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
>
>  * igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:
>    - {shard-bmg}:        [DMESG-WARN][113] ([Intel XE#877]) -> [PASS][114] +4 other tests pass
>   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html
>   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html
>
>
>#### Warnings ####
>
>  * igt@kms_async_flips@invalid-async-flip:
>    - shard-dg2-set2:     [SKIP][115] ([Intel XE#873]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#873])
>   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html
>
>  * igt@kms_big_fb@linear-32bpp-rotate-270:
>    - shard-dg2-set2:     [SKIP][117] ([Intel XE#316]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html
>   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html
>
>  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][120] ([Intel XE#316]) +4 other tests skip
>   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>
>  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>    - shard-dg2-set2:     [SKIP][121] ([Intel XE#610]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#610])
>   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1124]) -> [SKIP][124] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>
>  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][126] ([Intel XE#1124]) +11 other tests skip
>   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>
>  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][128] ([Intel XE#610])
>   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>
>  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
>    - shard-dg2-set2:     [SKIP][129] ([Intel XE#367]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
>   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
>
>  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][132] ([Intel XE#2191])
>   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>
>  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][134] ([Intel XE#367]) +1 other test skip
>   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>
>  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][136] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
>   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>
>  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][137] ([Intel XE#787]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
>   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
>
>  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1252]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#1252])
>   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>
>  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>    - shard-dg2-set2:     [SKIP][141] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>
>  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#787]) +90 other tests skip
>   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
>   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][146] ([Intel XE#1252])
>   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>
>  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>    - shard-dg2-set2:     [SKIP][147] ([Intel XE#314]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
>   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
>
>  * igt@kms_chamelium_color@ctm-limited-range:
>    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][150] ([Intel XE#306])
>   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
>   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
>
>  * igt@kms_chamelium_color@ctm-negative:
>    - shard-dg2-set2:     [SKIP][151] ([Intel XE#306]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#306])
>   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
>   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html
>
>  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][154] ([Intel XE#373]) +10 other tests skip
>   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>
>  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>    - shard-dg2-set2:     [SKIP][155] ([Intel XE#373]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>
>  * igt@kms_content_protection@dp-mst-lic-type-1:
>    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][158] ([Intel XE#307])
>   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html
>   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>
>  * igt@kms_cursor_crc@cursor-sliding-512x512:
>    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][160] ([Intel XE#308])
>   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html
>   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
>
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][162] ([Intel XE#323]) +2 other tests skip
>   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>
>  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][163] ([i915#3804]) -> [SKIP][164] ([Intel XE#1201] / [i915#3804])
>   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>
>  * igt@kms_fbcon_fbt@psr:
>    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][166] ([Intel XE#776])
>   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
>   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
>
>  * igt@kms_feature_discovery@psr1:
>    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][168] ([Intel XE#1135])
>   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_feature_discovery@psr1.html
>   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_feature_discovery@psr1.html
>
>  * igt@kms_feature_discovery@psr2:
>    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1135]) -> [SKIP][170] ([Intel XE#1135] / [Intel XE#1201])
>   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-463/igt@kms_feature_discovery@psr2.html
>
>  * igt@kms_flip@flip-vs-suspend:
>    - shard-dg2-set2:     [DMESG-WARN][171] ([Intel XE#1551]) -> [INCOMPLETE][172] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
>   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
>   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
>
>  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>    - shard-dg2-set2:     [SKIP][173] ([Intel XE#455]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>
>  * igt@kms_force_connector_basic@prune-stale-modes:
>    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [i915#5274]) -> [SKIP][176] ([i915#5274])
>   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html
>   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>    - shard-dg2-set2:     [SKIP][177] ([Intel XE#651]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
>   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>
>  * igt@kms_frontbuffer_tracking@drrs-suspend:
>    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][180] ([Intel XE#651]) +33 other tests skip
>   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
>   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][182] ([Intel XE#653]) +31 other tests skip
>   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][184] ([Intel XE#658])
>   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>
>  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>    - shard-dg2-set2:     [SKIP][185] ([Intel XE#653]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#653]) +14 other tests skip
>   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
>   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
>
>  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>    - shard-dg2-set2:     [SKIP][187] ([Intel XE#356]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#356])
>   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][190] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][192] ([Intel XE#498]) +2 other tests skip
>   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
>   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
>
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>    - shard-dg2-set2:     [SKIP][193] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][195] ([Intel XE#498]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][198] ([Intel XE#2318]) +5 other tests skip
>   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][200] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
>   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>
>  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2318]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>
>  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>
>  * igt@kms_pm_dc@dc5-psr:
>    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1129]) -> [SKIP][206] ([Intel XE#1129] / [Intel XE#1201])
>   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html
>
>  * igt@kms_pm_dc@dc6-psr:
>    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][208] ([Intel XE#1129])
>   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
>   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
>
>  * igt@kms_pm_dc@deep-pkgc:
>    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][210] ([Intel XE#908])
>   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
>   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
>
>  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1489]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
>   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
>
>  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][214] ([Intel XE#1489]) +2 other tests skip
>   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
>   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
>
>  * igt@kms_psr2_su@frontbuffer-xrgb8888:
>    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][216] ([Intel XE#1122])
>   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>
>  * igt@kms_psr@fbc-pr-cursor-blt:
>    - shard-dg2-set2:     [SKIP][217] ([Intel XE#929]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-blt.html
>   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-blt.html
>
>  * igt@kms_psr@fbc-pr-cursor-plane-move:
>    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][220] ([Intel XE#929]) +12 other tests skip
>   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html
>   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
>
>  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][222] ([Intel XE#1149])
>   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>
>  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][224] ([Intel XE#327])
>   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>
>  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][226] ([Intel XE#1500])
>   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>
>  * igt@kms_vblank@ts-continuation-suspend:
>    - shard-dg2-set2:     [DMESG-WARN][227] ([Intel XE#2019] / [Intel XE#2226]) -> [DMESG-WARN][228] ([Intel XE#2019]) +1 other test dmesg-warn
>   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
>   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
>
>  * igt@kms_vrr@cmrr:
>    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][230] ([Intel XE#2168])
>   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_vrr@cmrr.html
>   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_vrr@cmrr.html
>
>  * igt@kms_vrr@flip-dpms:
>    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][232] ([Intel XE#455]) +18 other tests skip
>   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_vrr@flip-dpms.html
>   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_vrr@flip-dpms.html
>
>  * igt@kms_writeback@writeback-invalid-parameters:
>    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][234] ([Intel XE#756]) +1 other test skip
>   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
>   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
>
>  * igt@sriov_basic@enable-vfs-autoprobe-off:
>    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1091]) -> [SKIP][236] ([Intel XE#1091] / [Intel XE#1201])
>   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
>   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][238] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>
>  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][240] ([Intel XE#1123])
>   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>
>  * igt@xe_evict@evict-beng-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][241] ([Intel XE#1473]) -> [INCOMPLETE][242] ([Intel XE#1195] / [Intel XE#1473])
>   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
>   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>
>  * igt@xe_exec_fault_mode@twice-invalid-fault:
>    - shard-dg2-set2:     [SKIP][243] ([Intel XE#288]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
>   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html
>
>  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][246] ([Intel XE#288]) +26 other tests skip
>   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>
>  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2360]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#2360])
>   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>
>  * igt@xe_media_fill@media-fill:
>    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][250] ([Intel XE#560])
>   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@xe_media_fill@media-fill.html
>   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_media_fill@media-fill.html
>
>  * igt@xe_oa@disabled-read-error:
>    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2541]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
>   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_oa@disabled-read-error.html
>   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-463/igt@xe_oa@disabled-read-error.html
>
>  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][254] ([Intel XE#2541]) +5 other tests skip
>   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>
>  * igt@xe_pm@d3cold-basic-exec:
>    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
>   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
>
>  * igt@xe_pm@s2idle-d3cold-basic-exec:
>    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][258] ([Intel XE#2284] / [Intel XE#366])
>   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html
>   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>
>  * igt@xe_query@multigpu-query-invalid-cs-cycles:
>    - shard-dg2-set2:     [SKIP][259] ([Intel XE#944]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>
>  * igt@xe_query@multigpu-query-mem-usage:
>    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][262] ([Intel XE#944]) +3 other tests skip
>   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
>   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
>
>  * igt@xe_wedged@basic-wedged:
>    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][264] ([Intel XE#1760])
>   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_wedged@basic-wedged.html
>   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-dg2-435/igt@xe_wedged@basic-wedged.html
>
>  * igt@xe_wedged@wedged-at-any-timeout:
>    - shard-lnl:          [DMESG-WARN][265] ([Intel XE#1760]) -> [DMESG-FAIL][266] ([Intel XE#1760])
>   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@xe_wedged@wedged-at-any-timeout.html
>   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/shard-lnl-7/igt@xe_wedged@wedged-at-any-timeout.html
>
>
>  {name}: This element is suppressed. This means it is ignored when computing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
>  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
>  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
>  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>  [Intel XE#2422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2422
>  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>  [Intel XE#2512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2512
>  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>  [Intel XE#2517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2517
>  [Intel XE#2533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533
>  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>
>
>Build changes
>-------------
>
>  * IGT: IGT_7975 -> IGTPW_11592
>
>  IGTPW_11592: 11592
>  IGT_7975: 7975
>  xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c: d6dac3db19935f5939cbb033eea30c90bdf3888c
>
>== Logs ==
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11592/index.html
