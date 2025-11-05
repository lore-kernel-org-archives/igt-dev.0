Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84366CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 23:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6910E325;
	Wed,  5 Nov 2025 23:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XskBHvk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9868310E325
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 23:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762384106; x=1793920106;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h22OdY+y80crYDV+keeu5hO+/d/I91ulSRwBxGe1iDs=;
 b=XskBHvk11n2H1bVrJbGYrJWdnXYj4TNqj/3cy7tKQB/+Ohjw3PXgOAFm
 dAKLOQ2cy4COga979XwE6CBhylGhdeXAFiqMQjDmS3GHWQSoMLuV+F/P7
 oCFwrOQYfwrCsM1IJGeUUSDtxaLksfH3/c+q/i+QeIiwkNVzDiUCP+czQ
 v4kag7vwfbVh9tm/ZhD0RRnDqrWZ5PWSRWpyoj4niyJiS5cUluuhKwYrW
 sTc1b9e/Li2dirwK6UGWMJOOtz29aKDb+3m/fBpm7F4f6bYgUpvYZESyn
 ZgWRUYF06lOWy2W/9ifsKfQojophEOyqYkTVyiPiAKNHnDVIUpTRv+Ykc A==;
X-CSE-ConnectionGUID: SglCpsDNQGqUhmWBUKxqnA==
X-CSE-MsgGUID: J1hxvyqESWaDa72hZGZGkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75864336"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="75864336"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:08:26 -0800
X-CSE-ConnectionGUID: A60Ed76MRPi7hO96Q//oDw==
X-CSE-MsgGUID: gyI9BGb9SrmaeGqJksCuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="191691187"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:08:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 15:08:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 15:08:21 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 15:08:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7hh0IF6NrYdL4gMyCi24zn4HkasYUor5eV29z9Zy97UvTDPb+o1TadSN6eHG5/dO2ZApfwGSIX2NwcSUojmsKethGOXfB1EYTeT0g/8/p0A2eN6nLWjkrLh9edkbBDIiwWLAvNU0sXG9zuVrMLloEZhMWfbvsrXHH6nXaMGUL+lbfVkda81bodXrjfufXLj8Uz8o+mYiwAgfBTwny4kVrEFIu8ECwPlzQlt0pUmpnnB51IrTjCtHhPC6sR1fCGNNtb6fO5mQhPgVUfYD4uX9PxX3InChuK45+rOI6CuFAcdd8HOkePMZmuZX/dGeMClkUoq1AQ3Op9TjotAS6dwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsDY8BdbLhXeM02SQYRWxSwkbYGklPXpOV+VFC03zpo=;
 b=XCGDVVICeQS8Pv3taWuNA9WUikg1wU7bjcyoNoGDfy+2lnnLvc5BIKLm/mQjkfASGx4st4m1K5709HcOO3F+H8PPjoiF4YDVL8bohyw/zpgDYrcZafxm+XYSmCPh1oExvwmHKvSQVG4OJsoSmUWW4Dbireob6AXs1gkV35lzxNOS8YknFO7FEKowZnmwepmT08XhT6bol5l8WpyVTQuTepaBAB8hGGn6TepyAk0tx8I0IzTg+1OX06wPwrgbzEh09VD3Hdm6iQVDqdZf1nra1BgVPaOj0cJXPMqdaHE513lbfordMjLzpuzCvgHcXOXy6OqIQ2djUb75shKtclFK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 23:08:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 23:08:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_pmu: Reset sched_if_idle value smartly
Thread-Topic: [PATCH] tests/intel/xe_pmu: Reset sched_if_idle value smartly
Thread-Index: AQHcToPGNzcYl6EwCEKHBE7qLkIukbTkrTIAgAACsiA=
Date: Wed, 5 Nov 2025 23:08:17 +0000
Message-ID: <CH0PR11MB5444270749E2C09B10FD6CFBE5C5A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251105184108.161889-2-jonathan.cavitt@intel.com>
 <3766e36a-11b1-4603-b86b-de320a4f110e@intel.com>
In-Reply-To: <3766e36a-11b1-4603-b86b-de320a4f110e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA3PR11MB9376:EE_
x-ms-office365-filtering-correlation-id: 597e87ef-46af-4945-097f-08de1cc034ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Y93Hfsw6mPvZynCw09ZDVDyOVbEUVDdznCwyichLgha3+kBie4pWHEohuQ9J?=
 =?us-ascii?Q?eIywgQ+hyaN3JQgnU229O4yJ8JW/hXNlcEBmaSj8yl44K+/0riqQ22Zh/V7P?=
 =?us-ascii?Q?ZojiY9ZHm9c3SgmJl+mGFsFJ4dYyaEM3KJxtTNyGj1g6mPyvXWXRO5cxsyw4?=
 =?us-ascii?Q?gP71bvCAxmD0HSCnhO502LZl8O6nbzYEmUAuB+cRpV/rLXBO0lL9WUMG6sZf?=
 =?us-ascii?Q?vinziEN+OzcPER5xafc6BwYijDw3/NiGPaAMzaIJYGZyQJcDRDQds/bBKJy6?=
 =?us-ascii?Q?PCtYbUcQNlb4d/zNQDE+w9IRRx+szyv0l9tmanPcjOBHaQ+A23zw7d/f6Sme?=
 =?us-ascii?Q?QZhptJqDPyJkGzLipQV+eGV2R2lEYpuhibb3nwPpPT/S71l+FPzOT6CZ6Ygx?=
 =?us-ascii?Q?gHWEVja/YlyxgREBHqQ+owAEC5zbjqoMyesVZE2O9cTDT/Vhu7EBEo5xJcUG?=
 =?us-ascii?Q?ZBja8XCeD9lrb7ecEBwx9VnH9YOQBpux4G0ct8VyYYUxa0Yb+sZ4k5hOlp9R?=
 =?us-ascii?Q?rM1OY3KyzOZG7AMNkn/qtPKYFPXc8ariMK6fgEBS5G+dPbghD9S4A2NzFH14?=
 =?us-ascii?Q?UTcaTSvoL/bMTqPbbnx/m3if7rvVWblL3KlQyvS/7VsJOGSm5DMSywA6Y2kj?=
 =?us-ascii?Q?iszZIuDu7n42A6viqc53bJvAKuk0hdIwfXaUEybqQwEcwrgP35MwIhUwaBLR?=
 =?us-ascii?Q?Xhb8cGtjZRGXm1gXrkAPzLvp2aDYuae4hMgLX0zj0Y8DCDjdWelphUhp/Fds?=
 =?us-ascii?Q?jjcJARctRZuEhoVOw/6QkPmHhibuf9mXq9HRPKHN6WuAhadXrtfvaG5utVla?=
 =?us-ascii?Q?mt61kAcP25lj2ZBI5QU+826a+0zOM3GdnCbUh0Ev953N+ZLHM1cQUVJQbVul?=
 =?us-ascii?Q?SHMGA+ntYfxu8TcGvg4YyogWmLi/HI61lZxRhbQXI3wleWUZeczzgr5LYFuw?=
 =?us-ascii?Q?Mi9e9wN3tKGS+9S6A03M6VpBlDZPYu3kyy5iSJKWux455Nau3ISKj1LWpVQb?=
 =?us-ascii?Q?ggXQmIDXJtNRJA+QDlfzAmIhDB5DxPONoHILh81zf2sc3CcK7CLfOMm6VmuX?=
 =?us-ascii?Q?otBQSN3wOOoQSeBv5o3owg1Qm0RxiJRTp4PTpnJlJ87wH7raPFLmhA54G44h?=
 =?us-ascii?Q?jT1o4rnS6ze52+IaFa5Kw1PDsKOPmPrlte9oo4DXkGEEnKIrhVghE/xwOC4D?=
 =?us-ascii?Q?Fp0hL/Vm3JbqeCZrg3POISv96hTrlfMJVNpVAbXdczPT+DPBPwYSxrE6zJKL?=
 =?us-ascii?Q?gLKvrDfUjjYhS4LX7n2kEm/rbWqpCXGaMpM3TuQGgpMVYcG32UctR4pKabcU?=
 =?us-ascii?Q?Smp/pVIgv8plbN0bBx+L1bw26a1LfYBW0yfrju8lJr8RRHFYJmGHXjRKuAVk?=
 =?us-ascii?Q?8tyst8/h5SBgwgcoCJqFwtLSZ0/52HTyPIT/woqOI38IylsuXGzpZyum5QEl?=
 =?us-ascii?Q?57QquBC5vibf8TZdP8vcZ4+sNa67xZ7cT3toMPxyE3r+aGMTsuXqPQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MbRdC5H9dOqr4POziaie0TitVV01PvyazMijnsl0sMVmbEbq1aex57X2lK1F?=
 =?us-ascii?Q?W8A5V5TjNFtjg7NLRObG97Fyft6N5fObG/EeCOk3fb0vN1zMYvwOJjEhuw9P?=
 =?us-ascii?Q?2iYUpj8E90qqt7WRDenZOx90AHwMNA12LBLKsUtWsGqHPpDn5A6UnTaZV2P3?=
 =?us-ascii?Q?MvuNpYDW12RzGhXjEcNEAQAFYZuZFA3enXDLJdAOgHVJw0YE5nvg9oRLJQSu?=
 =?us-ascii?Q?R10DdqRcdBoeEFr5KnR++HBBg83tqlKwK6grQu8IBI6fPKZkqukoxu4Ep8yc?=
 =?us-ascii?Q?xLw5pxBY5fWw+yCusJHotryvuSyqsBmoEiIWAbF2kQmVel16sMCjLjXGClGn?=
 =?us-ascii?Q?PzfQz9ou8NZsd/BnX2t8z13zRymRC/LW4bhmLXOUIbRxqOihs1riVjfkbhme?=
 =?us-ascii?Q?cq1GC5FEc4hh3uK8grHDKhVXeDIDuUrwy68eG8zHUeavzjhAHNLaMOey1NA3?=
 =?us-ascii?Q?mKuSfXq+zyn0Embzwu7WEJJG4P7YSPah5Gp6UifXyhUkSIoKg2tfriH4wvzs?=
 =?us-ascii?Q?FzPVWNXHAnTLM0cn2b+l/8+tK5h9H1CeFDsd5owsJGbALAKbKZVIjzByPNY5?=
 =?us-ascii?Q?GH0lkCIaeczceEGicxXui2DtutJjcINTkPgwfslmBs908m4D4+KS76ragzgS?=
 =?us-ascii?Q?px8mrlLPvkyyjnoNUfSW4C+IL+yM88gokkoHr9s80FwLXODk3kn0tbG+r5L/?=
 =?us-ascii?Q?6FhaijUZVvpO0vZ+hZ4GPdPmdXUxvQDAuyxxXVKi+os5o0iCT2ZCz+IJ57ts?=
 =?us-ascii?Q?GNqEVJAmERo42aeAufCjny1EoXMqTU41k4zGGBtmCutwgjKDQF084ok8DIv5?=
 =?us-ascii?Q?I1ApYjzlEZ6fBTKu6UfuY5MPtC+Gb8czQTnRV+eY8QHHro0h/fGFH32ADhm3?=
 =?us-ascii?Q?whcVTyi7c04uPZ0tDNvCSbniedjXGQKgxTQLcr/g0QUwd3kWFVwLxfJFghJl?=
 =?us-ascii?Q?fAFcKdp95zQlFOuCLldgDa3omWJ6bnQRgSJvPCShgZYlkpjhQZn0QiCEfPNG?=
 =?us-ascii?Q?8HL9Cmy5dYcTHwnlkiTGIKI7KOMlaG1Ub2Sk5dhMrAOvCjaNGx3t2HEm77MB?=
 =?us-ascii?Q?V7XD6i8v7oGKRzSec9QMbC8pEMZQvyv755nsapXIinY6/AenODG0lEAmSm6S?=
 =?us-ascii?Q?1B6xRPrbxJ4OOj8VUH8AyqRJ3xYULklPhxUGpMe0U5mTISNjTIfJYavyf2dq?=
 =?us-ascii?Q?eXWd/uDd3mi9rT3PvGZHeWhAfwu/ogpyOFSFIxH6xh9nCtL5pS+qVIKi9zAg?=
 =?us-ascii?Q?UsKK2SBdx2yuyq59Ox3KtsL8YX4qwXi0A+KMlBvZBjg8/pC6fvAcdUNEHpTX?=
 =?us-ascii?Q?0ggajr8dkE/t8VW7Q6MRKA5/oy9HK5kIOHuSJA1TO2whutnXq8RUoN1gLTCe?=
 =?us-ascii?Q?0b/ewbkIa3Pk/7fOGf5bqTcYNGjCb2qQ4t+ghX2hbTa1trda5kj3WJ6X71tf?=
 =?us-ascii?Q?eHBcDn/thZGDMl7zedm7PVpgUeAdHXkrfHgSLJ+LJ4ET6Udd8HHLHArm5v0T?=
 =?us-ascii?Q?qHgLeh+ZSefOH7XRyPZ6v50DkUJ5LWED1SFnGaM2Gg9OehHT/THtMROfCgJO?=
 =?us-ascii?Q?htTH8mu4I1WSPWilfltmf3LEcE0xBWZ0oP6ke3Ke?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597e87ef-46af-4945-097f-08de1cc034ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 23:08:17.5898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NEIw3mPc0HDn6lMvmTt0CrMGEYjwdD2EsW3juLAPoFxV7BVPihjSz77X6bNBIVqmAUAPnjaxJn27YcMWpi9UiHgL6MK/o9AaIGqkbLawPng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
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

-----Original Message-----
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Wednesday, November 5, 2025 2:40 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop=
.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>
Subject: Re: [PATCH] tests/intel/xe_pmu: Reset sched_if_idle value smartly
>=20
> On 11/5/2025 7:41 PM, Jonathan Cavitt wrote:
> > Only reset the sched_if_idle value in unprovision_and_disable_vfs if
> > doing so is necessary (I.E. if sched_if_idle has been changed).
>=20
> sounds like optimization, is this a goal of the patch?
> >=20
> > Additionally, there may be some delay in processing the value reset
> > request, so add a short usleep after resetting the value via
>=20
> what kind of delay? what problem it causes?
>=20
> > xe_sriov_set_sched_if_idle.  This will presently only have a performanc=
e
> > impact on the fn-engine-activity-sched-if-idle subtest because of the
> > first change.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  tests/intel/xe_pmu.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> > index 9525655ba2..f3dc85bb1b 100644
> > --- a/tests/intel/xe_pmu.c
> > +++ b/tests/intel/xe_pmu.c
> > @@ -1010,7 +1010,10 @@ static void unprovision_and_disable_vfs(int fd)
> >  	unsigned int gt, num_vfs =3D igt_sriov_get_enabled_vfs(fd);
> > =20
> >  	xe_for_each_gt(fd, gt) {
> > -		xe_sriov_set_sched_if_idle(fd, gt, 0);
>=20
> changing legacy policy "sched_if_idle=3D0" is equivalent to resetting all=
 VFs priority to "low" and should be harmless for all cases
>=20
> > +		if (xe_sriov_get_sched_if_idle(fd, gt)) {
> > +			xe_sriov_set_sched_if_idle(fd, gt, 0);
>=20
> and while we can _optimize_ and skip it, it shouldn't have any impact on =
tests
>=20
> > +			usleep(100000);
>=20
> and kmd shouldn't need any additional delay,
> if that solves your problem, then you're rather hide it
>=20
> > +		}
> >  		for (int fn =3D 0; fn <=3D num_vfs; fn++)
> >  			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
>=20
> what is actually dangerous, and maybe even the root of the undisclosed pr=
oblem you're trying to solve here,

To specify, the issue I'm targeting is https://gitlab.freedesktop.org/drm/x=
e/kernel/-/issues/3970 .  It's not listed as a Closes: in the tags
because some other test issues are being caught by that filter which would =
not be resolved by this change.

> is leaving the default PT=3Dinfinity while enabling "sched_if_idle=3D1"
> so here, in addition to EQ, the PT should also be restored back to 0,

I'm going to assume that PT=3D0 and PT=3Dinfinity are the same in the conte=
xt of how it's programmed,
because otherwise I wouldn't be able to process this request.

> and we must make sure it's set to relatively small value together with EQ=
 during the test

That's probably doable... depending on what PT stands for in this context.
-Jonathan Cavitt

>=20
> >  	}
>=20
>=20
