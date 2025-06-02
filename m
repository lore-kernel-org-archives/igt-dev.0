Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1205C5B555
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 17:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3D710E572;
	Mon,  2 Jun 2025 17:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H98FCZyE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F40310E57B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748886880; x=1780422880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A23dDvxt0EwpBRGtLhXG6iMPoa799XIxIf6XUcgk7Eg=;
 b=H98FCZyEeYKmUQmILfPqzwc7N17YdPK7bpEWeRih9K5FlmjDPlgXB8jP
 uObKtoWu1q1vpItEgBFGZhqohSYyTPCBFVU+u4WNj+n4titgBbRIA6gbj
 6Oeom4P/Ajv37rGGDK3rcMqiFrJZcsG5toff+PBwFWXiheO2omvjGqiBh
 WbIJdkXAex7yyglSPgf0FluA2aP2jI7nfToccz9Tk2CSOhq3hy/8fid+T
 2tSvfP6cDlsmA34mLxcqHdaq1vtq87/z/6gxuDqN74WglheSrsnv7ij7f
 x6GE/fC4//AOwya51AH6GvN1vzMPPrj4Xo8ROWoIKtpsHCowiLkqKmGrd Q==;
X-CSE-ConnectionGUID: rmfxDe8KRLuj4M1Plo6dDg==
X-CSE-MsgGUID: UKIkPuNeQxSNbkq+SVca6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50905786"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50905786"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:54:36 -0700
X-CSE-ConnectionGUID: R0cYzev1QuKtMxWLwPLaTg==
X-CSE-MsgGUID: pRp+whshR8mH5nXUfrGJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="181767249"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:54:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 10:54:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 10:54:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 10:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtuzcQCItmTE3WzC6HeGLCA32wqGoNJjJDhj5XHrKBVH4dWRl5Ns7G4FDIZWMRE46zgvVUGMU6uAZ4vP2YNNFTugVB9/ktI3ay185XgQj6VC7DUT101yjVVBI0F2vOSVIJjg0mBaGAlcYyi/CXzotmxLxD1rgtcPdpyCVxcyntn7R3WLRcZEwm76XN9o9UByMiWVSF2QVycswu72nuJSggeOYvNEda/a8mmODj5cgBvS7YDPxsmXlNVGmzmMIb4oaDecufc74WbVM6+H5AHvMNq0sbQYFtfssTSECkDU6LtRBTLwPyIJEKIkynajO7/4fYZCSxCrcEB/TyspXECzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A23dDvxt0EwpBRGtLhXG6iMPoa799XIxIf6XUcgk7Eg=;
 b=mUR/WTG6HJJZFQBpSR/Doqc7x8jRF23trYrcaPEtiH2vutkhyw+/glXsdraOOajw2ryfgbywn8whOhD4n7zChkzSf746xNsE32vvL2vgOrII2TMbccx8Bq1lQildJfaulbtw9UFCZCUuZ39u4Zw8ctUbYF0vhCMWID6q0QaUDeIxILMIykYBTDmkB5BufZGQmfYqg4odPBKPa4g/zKsyJI3/XaRos4Fk9bPZNlwq1z+tYLgv3uYToUIP2SV7D2/rou4228FuFYw3dT8uO07TqMRE27SdLidVbvqbw8PlENG5F73dUwkCU/MycEvhAUoR9WHQ2GF7SNQHUt0lw5JjSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 2 Jun
 2025 17:53:47 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 17:53:47 +0000
Date: Mon, 2 Jun 2025 12:53:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_drm_fdinfo: Drop
 TEST_TRAILING_IDLE
Message-ID: <4tgxvdxtu2m7z3vdisdpbgpe5rkfi3m6rs474pxyscwi23xsx2@2au3x3lmd7v6>
References: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
 <20250520232027.351497-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250520232027.351497-8-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f6b04e-32c6-472d-9480-08dda1fe6ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lxLuHL1jaqF8MtITpNJiTQzdEJNOeK5TebZKs/P6LXoO3WLQMNW9NtbCeLyF?=
 =?us-ascii?Q?+/sT+aiCEydPDrS8LSXfiS2vZqfGHFPkn5hoLihxVhRVtSYBslxG3lmMiGBD?=
 =?us-ascii?Q?nC0az1PowNISGlZtB/XjyYMGeLZVk+lXtcQpytJHM8phwybyBHEvBmxoFz5U?=
 =?us-ascii?Q?7zQ1ucKhQH1wNcIfjQSBOqtnzMe2YDG4kEVuqYPZz7+6utIDGfJ1j4SsLTdu?=
 =?us-ascii?Q?V4ylGU9JHo5rjWKs7TENvPdGqYE6Qjfz9S6QaC+k35MOXeFeZ0qpa2HXRh9U?=
 =?us-ascii?Q?Vkttdd0RT5QJft37xhmei7yvZlz1g1e3ePNdM0vF7ghJ9tUXiZmwNOXASF1a?=
 =?us-ascii?Q?DhuOcGtR4GKims/awn/0bw3mJqau2e+WyWtmT7A7YLIWRhKIKLLInnhdHxPI?=
 =?us-ascii?Q?5ci/kEk6OFpzOuY9fAH+JFBJkF5o6LJ264sVKI1hZl49hyXY25lmiNy4pJ+l?=
 =?us-ascii?Q?yS7PfeAVHJjNI49N6rhswoTn+GWCyOAcutW1eliutoDcJsrkp307WzyHoM3N?=
 =?us-ascii?Q?Wi40WyPAXRVo4scowdwH8zp/1V1f30heO9dmghw3UZ1X02wLkkqE2iPhBpp7?=
 =?us-ascii?Q?9Fr4LEPIsgqP9PbGl+z12IlHzFitNSjjWigaVvFYczOWXICnPsKcrmVX2Q4k?=
 =?us-ascii?Q?mBma+2qyiprNyTK09ejEilaqF4yRDxXyPbAxULWFV2hFdsM/4T2hWbRLzdi5?=
 =?us-ascii?Q?AqeNN861aPaEVAtiiRBLvgs06fTe6N1TwUmeva52ilLdzFYLZmksVywyHhig?=
 =?us-ascii?Q?tTOG6J8qZSeWCtPOkDTNyXclnKKai1S3eNp/trwrTD1Qvq55wCt9959u5rAO?=
 =?us-ascii?Q?bD+6YlbzDuL5GmftlF5pFq6WHmZ/dEqJYlE83itXRVoRTgbeFMWr7QIb0wkv?=
 =?us-ascii?Q?/rBDQt/N3ya6LuVsiY9bPP75VgIgoXwFTDhKoAVeBBUme2L82QkG6C8uwju+?=
 =?us-ascii?Q?AYUlYdMTCke876TghoZwDUSeUUDMtOxk1ypeE69VjtAP9+hOK0XVQ3sAypBB?=
 =?us-ascii?Q?0jOS4euE4C1JDlGhOHXe3qqNi2R0eInrchbWgefafDRqJbYjUs6YvygMZtzg?=
 =?us-ascii?Q?CtKdgpLb02xK8ll/9RD7ElLaDSLFQfEMBI9n2ypT/xeoP+xqXzCOOTLWWz5Z?=
 =?us-ascii?Q?yY8MSZVnCCh+EmTWj8+7Enoy5lAG+UUzKrxRrvoJJMUBeIGb13oevb4kt7FN?=
 =?us-ascii?Q?Knu9qqi1uC0vztF8iwiD7Gys9AxsGPY4KSU7e0zUdPvp5J5hhHYhvMygI+VN?=
 =?us-ascii?Q?0IRSi5RVQdm6enXbZmc2tXRSDfsctFh1dFApZsvl9WuaIt0zM/5vrd01KRmZ?=
 =?us-ascii?Q?QH/CDHaGeUHrBUY08tBb7Iywpi7UrqCC8K0w4ygoWWgVVkiUCpM3swqD2SzB?=
 =?us-ascii?Q?zvPXxQCv2wrQ/tt2EAAyKIcvChXSoWYwgL1B6WeKjsDHhSTwLOcNDoC6p9Jf?=
 =?us-ascii?Q?K06tFnQzY08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UWEfzlaieAsrLDHaxH5/God15p8hSvi9sbhtbrSgHRMjgqv/wyZI3wQCTwGI?=
 =?us-ascii?Q?c8l9SPNeI443L7osw1+2fZOxTvoCpgFxQrhfGQkhkXEGZCzLyNSz5U9dRv0V?=
 =?us-ascii?Q?oMa2CYGN7X3bzwufyBpE7bnT0fg9XRjvFPlqQEuA5HoV8in21RkS5o7MqsO0?=
 =?us-ascii?Q?OZsO+IA06OsADU+xl7/ZLxUBoJ1l4SWIH5LyUs8SenekBNJxH/LoVYvrnRFo?=
 =?us-ascii?Q?h84ZKWL84A12DKmySSolvnaWEurtHRetUswR+OYNXtCGm34qyVO7UCMhq3QQ?=
 =?us-ascii?Q?sBDk7hbssFbwF36lHJRQsDrVKukj4LFQfR5R9yYqbfOD4QuD338Abt6pjJiL?=
 =?us-ascii?Q?6XqfMFxGr/b2xs2A95B/kt3jlpqMEjRezu6AYB8m6kNCsGPW9hK8BYa7VATj?=
 =?us-ascii?Q?gGc+ghblIXE+mPtr/t0/nOJgJESTMCk8H3zWKjE/qs84VTCQrZblZf7pC5yA?=
 =?us-ascii?Q?2R/vA0FyW9euDPfGmzZnAqPaGPbhnwZ5s4rDzmQmOMIgO4ZEz9InXh7aMuBq?=
 =?us-ascii?Q?AqYEIcenNDWziJ0je0s19kfNqnrFUmLr4XglJzTVrqn/PEQQbgiV1+wYnrdD?=
 =?us-ascii?Q?TrkVFGZXFZrUOwLJ7j/kmUNOpAyEeKHcGBI65W5aeKuD6laoRXVwnSo2Nh/1?=
 =?us-ascii?Q?OEKIwQwvA9QLQ6Cn4sodnuBgHXb2D6fI3BLwvn2Shc/Nk7pccvzUEc9TfCwq?=
 =?us-ascii?Q?wuN3bpGP/6ciGHxnsmt/HgE1Zqq4PWF4eSwRrqJC4CoF4TvIqzPIqvU2QuTy?=
 =?us-ascii?Q?Owx2S+MzMxWzfH+M4wg5Y+90vrM6Epys+ePfJwKBcOewTi1aa+1SggzQfgh8?=
 =?us-ascii?Q?Iq9A+XMdSQ6smks15WtF0qkMsSse5jGr1kGU7HotI1pXvqsmFmqXk87jzFso?=
 =?us-ascii?Q?Oz57DEOwkuiLYDCrN8irv837TJd69JMf9hXSBS6n7bUzm7O0GKIHdJLotWYE?=
 =?us-ascii?Q?YdCiN6cpCO8vRpp5uzpzqZzej2fzRYwKWIQIw1ybOSin7ZvMIYo4eE9x7ds2?=
 =?us-ascii?Q?9e8eMLc8GHBOJJdYf8UzEAnvO6wR1R8eBNXYQfbdDyQioFkM6sLcinMs8Ven?=
 =?us-ascii?Q?gaToSRNG690TZUjcInlE96wlbHuM3Qsq371cLMIAsQKMI8OJQTRAzfofvxLo?=
 =?us-ascii?Q?oY0tCREXDLCbKUTAJIBYiwBnh0+EE7OmFt9jEgicmpdjDITWZVaprF+J/zay?=
 =?us-ascii?Q?rnxoSF6ZuS7Ql1OeUWTVFNMqSk0GQ3XSt/0oaL/BWXz0IR7ttdabbEQAMN2l?=
 =?us-ascii?Q?j+FeDJCxht4hYhHhARd8d6Cu8gQUiIKF2xQc14OZ375gDehM8MxAK+8+wI/u?=
 =?us-ascii?Q?d1QTIdZdGGFd++HjcD27gbciJncrXQ4KGx5KUU2Qxzpnk/V7epUamlBnhQw1?=
 =?us-ascii?Q?RZyl3gMD41J08ocNBpnlU3nZKTbO55oxVU4POomtmW+h6LCCw6/TU9WnZk1G?=
 =?us-ascii?Q?sBQ515sHHP7dhh82fPDHCIVM4ZQnKyXfuI6EHFyPlyfWSVlfTeaTtEWZhM1O?=
 =?us-ascii?Q?7Gimi7Hl5nnp5guevkFiy5ZzJuWl9MvacE6SbfHkLBbIpENWqOW3gYGDZwDJ?=
 =?us-ascii?Q?ynhP4W7iZ+HxZQvh+phX15gmQtyt55WrimoT20nSIxbWGED9y0Shz+5gqst8?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f6b04e-32c6-472d-9480-08dda1fe6ca1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 17:53:47.5452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA9rCZKhEwBnzNhBjm7niIMdNzUSmi2divMZzjHGHRqp1Xesx3Qg20pZTV/qTEMwuYzUvR2l3oPAMT44y39pUk5v+Ayng9tQuaDK/zQTVRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

On Tue, May 20, 2025 at 04:20:30PM -0700, Umesh Nerlige Ramappa wrote:
>All current tests are ending the spinners before taking the second
>sample of utilization, so no need for this flag.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
