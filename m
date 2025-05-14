Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B778BC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 22:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C61A10E047;
	Wed, 14 May 2025 22:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTRAYu4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F75410E047
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 22:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747263280; x=1778799280;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MZuaQKvXlOkgQC8on8eyB/OEOBJEnu1LI/brTNHsXHE=;
 b=XTRAYu4+hMg25tDjnoEyYqHjzM4/VvfyjheuQ1VaKm8SNnRtbmCtMb9L
 L77W/HzI1R5tlLIxSxctjRVt+aa5euYZoM4fCZTTbAz9Tm0Icu+BnaS85
 cwP60fmcadsvGaYTLUt+1zRubVoW164JzlV4jXeKbRI5LEVcgF1JDUtmD
 d7Owvij7USUeA6Ev+4FyKPu1AODIqqmSXWl7/QtM1ywda5Fe095wiJ84X
 8ImY0/NVYsiwL+NWrA0jX5UGI0ALOg1rtLTCrLOJo2yroyd2AQPMdhErA
 hrBBJF0jLKhoQ/8t00MlZ9RnPwEd+rNZTepMt9XeoFQ8JLMHyoyjkHn8o w==;
X-CSE-ConnectionGUID: DrEzOfGJRCq5Y5cM8sm0QQ==
X-CSE-MsgGUID: lUXbnoNwREWU/pxOWlXwyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49321679"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49321679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:54:37 -0700
X-CSE-ConnectionGUID: UXtXsfshRJqPVOzlslO2Ew==
X-CSE-MsgGUID: phBNlBWESea2qbla90Ociw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142202372"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:54:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:54:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:54:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWQkRC+DGzX6wqUf3wssmui9uX25XaR04+nSlI+5lPdkZVGX19oIWScCbmAWiSydryrIF0raNTAMg4LRWQRtQJTyHtowFdUBrmbs9tFTH3KWArHiYlO2yGiF3gSPWe2ZR9bETpI6BU7fTBSFxPCVjwqyU1vnhX0WmIGooiDchOgMxd6bFnjuPDN1QlAJ46mK3inN5U4sLulOhYdg1GV1gY9qMSuQoVJ2SGJmwry7VKv58iXm67uH6t2FVdJMEG2PL8pL7zSqOnJ/VkPxS4GKwIclxF+J7+1lfb+T4ERK5wzye1g6cF8MrAaYm2pzniCtfVW8SxjPiPpjr4WxdDyxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Wqo5l05RDwU+ilu6loryWxAVIUARJ9htA41Ik7L2TY=;
 b=yCLKU0lb5zFALdwhINirdhcfRDrmhhwjH11v9vVHX488swjiiNb426FWfzAecj3LlonmllZLMGgIFMACCQfZd5OLswPJk6wk53j+DseJjf/uBC5Nyx9QBMUqDX19+haHqEQCr/oYKzzJIelGBSr1+h7PKqyKNl0MwdzdPqs/LVpSwdKDj8ATAvJba0YbcQvZizbiyqfa5FWkiRuEYPqlTYJvY+sGDj1e3mOzf0ekGu4UyfA2+nlh8Hzc36jQdsP5u35ykXhEajfBfyKX1ScZUlCCzSgXH3jilVackpqPiXE9LuOD8HcgHBANax9jhdf13OkhBGkuaYkYFAWMDah0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 22:54:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 22:54:34 +0000
Date: Wed, 14 May 2025 15:56:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to
 validate basic SVM functionality
Message-ID: <aCUfgdmqoELpzeh4@lstrano-desk.jf.intel.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-2-sai.gowtham.ch@intel.com>
 <CH0PR11MB54448237AA56E9E424BEE56CE596A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54448237AA56E9E424BEE56CE596A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f5e9e4-6c04-49c8-f7a6-08dd933a4b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MkpLPT9pIJEDO92tbUBVKcirGJhfDdy81B9utc7EVYIPeaGZbOlsDUXIbKH6?=
 =?us-ascii?Q?6AO8FIazsX49vffHadwxYoil9WZ0U50QKUOK11xJqBb+FeYm3EkTFuU7QWNI?=
 =?us-ascii?Q?Qklyw29jBVsUkp45/QsJNhk/J9dLMFjHuHuY9db9byKTZ9kLB5CA/yM/LvKo?=
 =?us-ascii?Q?wenIaNv+faP2i8SyxW9BJ/qUiljv9ytOtAmaHOxnWidm/oK3AcMq+J2LQg4J?=
 =?us-ascii?Q?tSUec1iSwwUk8gT+JixWT0h+AJ0ZXhhCrDvKnOP63iPgE6qA5yRlK7MiaBWi?=
 =?us-ascii?Q?WAUGMdcfLA1FvHMIiY/Aj6wdGgnW0njVKkMOpDYGKwvk29pTdQqW8mmQTf9A?=
 =?us-ascii?Q?eAgXJMnu8ExaRYsBWglYLDGtQgjTHwyTxI7Jw2uaOsRiMQPUAk13s6Jkf/2Q?=
 =?us-ascii?Q?TNU+oCs/ytIrhRZeCz4kWdsSu34R5uLU1QkR5egIu2ouRfTsV9XcjsrEO8Sb?=
 =?us-ascii?Q?Fli6BndYuTOdnv+7umNadDGldMQPd9n8Qbp4Emu3WcJ/rJnfjEMnBuB6V456?=
 =?us-ascii?Q?7XjH+sIWbNIECaYpsTr1CHgeTKmPbMpFJB7IOM4A2ca0ThosRto7+FD7zpHA?=
 =?us-ascii?Q?oxUefblKeBm+0nG99nvenDO69pDi3QMfzVLFKBJZs1S1a+MuH74MifnyA7lO?=
 =?us-ascii?Q?B52RMR4SIeU0C8IhEQdCOZIM8Phdrrd4EHDBBR55XUkIa9AGfzgBLG6NC6Wl?=
 =?us-ascii?Q?S9Sot1x158vMNBSKHPVxC9ilf9JlGBSUveHgvTG2YdUWlAQbkzv68WWmCns7?=
 =?us-ascii?Q?rueEZZh/nGQjzevYvhcdsYnnRIJ3QTkw6V6N8IVX+ws2eOgCBj9c2zgseecP?=
 =?us-ascii?Q?x3Mu7hPMQ99NRxbUPC/K8eJR1Gc86qsehvUKwiCRZjjL4sSoQsWp7/tT6eok?=
 =?us-ascii?Q?/ZqXTDSfEzNmnKp8pgzxxpK6SujJEE6mBm+6v5he/INgwCOZ4fRmoKf2Ohkl?=
 =?us-ascii?Q?cm/z8GdgKyAfr7h/exqs/xJIAd6ANxLl8fqZqhMgyzbPSqOh+TExl72XacZj?=
 =?us-ascii?Q?xrAe1vowCso82JF8S6/ZG3aFAQkm+jWi0aa93FPEQTrrM6e8qrg5ZauteFj4?=
 =?us-ascii?Q?Od8UiDGkcN7yelTs/x5C99i9/VJdS5PSC1bJdctEdsolpaXY1J9vFMrgQE4a?=
 =?us-ascii?Q?60ZHBCcinVRn704AlInJmNNEc1MqRtM0PV0JuAx5aXMzw2e/wMtOiBNAsNjJ?=
 =?us-ascii?Q?Bos4uk2fFa0wO6u6XMsCGioZ6rYMxjOCNJUSNd4KhtkylwR4WzAS++yTDfHg?=
 =?us-ascii?Q?87kiKgM2jU0gFa2n/1AM9VfhQOup2tvsokO30+vh70Z5WcEUBrMRQ6Ivr06/?=
 =?us-ascii?Q?DH0rQ7MeUFPl6iSn/18IaSSvw9H4/piB1qTOB3VcVrW+tSIilEoOCp0Wv/Jl?=
 =?us-ascii?Q?8FFnYCSEyUoC12Jkr0PVnjd9+h6mhKkD6nIsDC5sAyRx6whqLgVHqsdFo8Hx?=
 =?us-ascii?Q?4IB5OPV4yVw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+eNdxq3L0AKq7dMaQUQmGyHOadwjWYSsB28YGnP+NkGNfdDrjK+vukYbuD+?=
 =?us-ascii?Q?McqreODC+2GE2646N+5v9AI2/xRzMEU5Ei1+KEFNIiBT3h4WNhd9jEtjJJ6e?=
 =?us-ascii?Q?kjCOpVt0hpJkkBRX3130eGEvtfbU9rIiJtCWIy1JWB4FG7t4HqHpK4Xvq2+V?=
 =?us-ascii?Q?BHHz/LoRPhauPURFt8tKSZCgDVTIByutbabhhsuZRdK3kn7VbKPyQSFguJiG?=
 =?us-ascii?Q?WfMGUhJ80JvHC4wYL9s7a9cZ0TTP6KNiqnk82bDTbOd+H647sff47u2Jjn3K?=
 =?us-ascii?Q?+gUOamrxpER+DJ1dldjfPROVJbYcqRh7PVfwkqwBU/Sx1wI+MdCsVm1AFSZu?=
 =?us-ascii?Q?y1aYDI4+33JarVLjhyJSi4ByVX1dBxi62J1LWZj527RB9Lj+YY0JiePm3DB5?=
 =?us-ascii?Q?4MBmjEf75P8MWLkhEwlprioN1vtfkqZ4wwXzoofqjaaxnGFiNAhsr0PQfuUI?=
 =?us-ascii?Q?HL0XxKI8Eidqewr3CiYO3rCwSEoJNrzp+QUgazsowk3CiUXBAKCTW+yUAJOy?=
 =?us-ascii?Q?/XHMj8dXkKJt4goU+ItHuHjgm7rbctKNyJmiFPrYmbNIFkmyj9EA8CICn4dX?=
 =?us-ascii?Q?ZABb6zz41sI+XEFlOWhE8ssnUt3yKmAUdqgLmQjJJW12C60gDVUMYSesR+/C?=
 =?us-ascii?Q?oXIDJjh3ZDPusu7oXkx/e0qn8kferXpT6HrwV1PLNTWLakHczJ221Vty0SSE?=
 =?us-ascii?Q?zol7quPSH4IeLdF0esNu7gjg4TrrRSXje2o/fOct2r9+ow38LkXDRCGaEGPL?=
 =?us-ascii?Q?COZGIq2v7lytYCAVgLyjHHXMmkNKfevxZmKb5XKyac4FMysloD3T7FrsfKg7?=
 =?us-ascii?Q?Q61qi+lqmsNb2dckoga0qInYO4qoSd1YfOMgjPEFI1CzYyEjmo6JQCRKAuEz?=
 =?us-ascii?Q?Vw07lVLMa6NVwkKxyzotcj3pibK/nIQCNq4OexrJuRnRaEfVO2+32bhge2ss?=
 =?us-ascii?Q?R4KLOlkQcjQ2ixvdE7QUNos5p+Iqn8qOyXNN1bc56b3vbmPk3BirS/guy+oj?=
 =?us-ascii?Q?PjMkBP/5CS8X4sr2NVD4Axvmj0UdqQkoT3ygNY4V+UMNuvwS+h+on0uD0lk3?=
 =?us-ascii?Q?ajye+LRl+rrWGlwae+hxsLi+gzwe2cnNKBgDrUZuPBWlkBBoJKUe8aipioM2?=
 =?us-ascii?Q?8YlmIt7+4217DS7/MWQP1D0NPDgNnaibE/D7fTnLsT+ylJSuQ2RwgsQuUR9Y?=
 =?us-ascii?Q?GrPN2vc0nCuic4UDfcXjrDcwqy6yQsdbY/k7YKKrZxqsmfWRAUxM2VJ/S+lU?=
 =?us-ascii?Q?SxbhmPYXn9lbDuBweEc2E9Xe2KoRxIsJ7OJwJyZjeJXLp7VcqYMP2V/EHE16?=
 =?us-ascii?Q?fJf57A3/Wy2Dhf1omhLcQXi9t02ftBvwY3acLggbriizfUldwWWqBsJrvs0G?=
 =?us-ascii?Q?x/FpYaHMmuf3BAcdpJRhUVnlQDm50g0DhSsrTRpIECaE7x2VsvvsgmxJufZ/?=
 =?us-ascii?Q?Uff07KfU99ump8XUlQgSLa7yTnrTutYanWLJlhXUagYRD1KrBhp3RYOJQBMq?=
 =?us-ascii?Q?aG6OImfm6V+90A9Kls6DeFB4mT20FSawI/T5KC0ggSoTwGVmdZvsGGAMZLW/?=
 =?us-ascii?Q?6a71Zz57St+BTk3eY2ZqsQ+VnVbEa1JvBu8JKosVoL63Q1XGMeKzGes0fBWJ?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f5e9e4-6c04-49c8-f7a6-08dd933a4b60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:54:34.0738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IDAXFoKT/LEoGJw78VMcd+TUzwto0IvrBbg1D/eNstieiHlNDIf3Ugyx16EOaXjS5b5EX+NS3MIp1XunEaJ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
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

On Tue, May 13, 2025 at 04:44:31PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sai.gowtham.ch@intel.com
> Sent: Tuesday, May 13, 2025 10:07 AM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to validate basic SVM functionality
> > 
> > From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > 
> > Basic test validates basic SVM functionlity.
> 
> s/functionlity/functionality
> 
> There's also a non-blocking comment below, but otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 

What? No. This existing tests already covers this case.

Matt

> > 
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 64 ++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 06daac8c2..ba11ed834 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -32,6 +32,8 @@
> >  struct batch_data {
> >  	uint32_t batch[16];
> >  	uint64_t pad;
> > +	uint64_t vm_sync;
> > +	uint64_t exec_sync;
> >  	uint32_t data;
> >  	uint32_t expected_data;
> >  };
> > @@ -405,6 +407,63 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
> >  		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
> >  }
> >  
> > +/**
> > + * SUBTEST: basic-svm
> > + * Description: Test validates basic svm.
> > + * Test category: functionality test
> > + */
> > +static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
> > +		       size_t bo_size, int num_dwords)
> > +{
> > +	uint64_t addr;
> > +	struct drm_xe_sync sync[1] = {
> > +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +		  .timeline_value = USER_FENCE_VALUE },
> > +	};
> > +	struct drm_xe_exec exec = {
> > +		.num_batch_buffer = 1,
> > +		.num_syncs = 1,
> > +		.syncs = to_user_pointer(sync),
> > +	};
> > +	struct batch_data *data;
> > +	uint32_t exec_queues, vm;
> > +	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> > +
> > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > +	data = aligned_alloc(aligned_size, bo_size);
> > +	igt_assert(data != NULL);
> > +	memset(data, 0, bo_size);
> > +
> > +	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
> > +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > +	bind_system_allocator(sync, 1);
> > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > +	data[0].vm_sync = 0;
> > +
> > +	addr = to_user_pointer(data);
> > +	for (int i = 0; i <= num_dwords; i++) {
> > +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > +		uint64_t batch_addr = addr + batch_offset;
> > +		uint64_t sdi_offset = (char *)&(data[i].data) - (char *)data;
> > +		uint64_t sdi_addr = addr + sdi_offset;
> > +		int b = 0;
> > +
> > +		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> > +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > +
> > +		exec.exec_queue_id = exec_queues;
> > +		exec.address = batch_addr;
> > +		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> > +		xe_exec(fd, &exec);
> > +		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
> > +		data[i].exec_sync = 0;
> > +		igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> > +	}
> > +	unbind_system_allocator();
> > +	free(data);
> > +	xe_exec_queue_destroy(fd, exec_queues);
> > +	xe_vm_destroy(fd, vm);
> > +}
> >  /**
> >   * SUBTEST: unaligned-alloc
> >   * Description: allocate unaligned sizes of memory
> > @@ -1597,6 +1656,7 @@ struct section {
> >  
> >  igt_main
> >  {
> > +	struct drm_xe_engine *engine;
> >  	struct drm_xe_engine_class_instance *hwe;
> >  	const struct section sections[] = {
> >  		{ "malloc", 0 },
> > @@ -1695,11 +1755,15 @@ igt_main
> >  		fd = drm_open_driver(DRIVER_XE);
> >  		igt_require(!xe_supports_faults(fd));
> >  
> > +		engine = xe_engine(fd, 1);
> 
> Non-blocking:
> If you just need to get "any" engine, then you might be able to "hijack" the
> pre-existing drm_xe_engine_class_instance *hwe above for that purpose.
> Though, you'd need to declare it using a fixture beforehand.  Something like:
> 
> """
> igt_fixture {
> 	/* Get first engine */
> 	xe_for_each_engine(fd, hwe)
> 		break;
> }
> """
> 
> We could also still use xe_engine, but it doesn't look quite as elegant:
> 
> """
> igt_fixture {
> 	/* Get first engine */
> 	hwe = &xe_engine(fd, 1)->instance;
> }
> """
> 
> Then, the below subtest would look like:
> 
> """
> igt_subtest("basic_svm")
> 	test_basic(fd, hwe, SZ_64K, 1);
> """
> 
> Note that we'd also need to place the subtests in the next two patches
> after this fixture and before the subtest below it (once-%s), lest we need to
> repeat this fixture process again for those new subtests.
> 
> It's not particularly important we use the hwe in this way, so I won't block on it.
> But it would be nice to avoid any additional variables where we can.
> -Jonathan Cavitt
> 
> >  		xe = xe_device_get(fd);
> >  		va_bits = xe->va_bits;
> >  		open_sync_file();
> >  	}
> >  
> > +	igt_subtest("basic-svm")
> > +		test_basic(fd, &engine->instance, SZ_64K, 1);
> > +
> >  	for (const struct section *s = sections; s->name; s++) {
> >  		igt_subtest_f("once-%s", s->name)
> >  			xe_for_each_engine(fd, hwe)
> > -- 
> > 2.34.1
> > 
> > 
