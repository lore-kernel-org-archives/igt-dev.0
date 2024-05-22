Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FA7C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 17:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4B210E135;
	Wed, 22 May 2024 17:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CijJaPFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070E110E135
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716398154; x=1747934154;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YKjhKqxPX0VUQREFsBUh49K44NghVhZMEAGyfOmXumE=;
 b=CijJaPFeVajpt0s25YF4VGAo54zDMxRAK9qpNboW4nW9Lgpot27zviQe
 54zW2V0vXCADeiqiFgI5dc7PzV4DbX+EICDtFkYnlPqIRRcODJ1AVjhRj
 jwjyG7xfsQpr2C0O4CrGym/WBO9diAchAyDlA1O9Tyqkk8XyZhd6JehGz
 mF8ZuvWaS2V4GgDg2Eq9hCLsn45jbJ11O9b1bIyFruNHXerm46+Xt2w3s
 J5DO5hk0Db1G14T+iwY1Ja+CJxy7uStUlI1AAypxV/+TX4YFO8ShRmX6Q
 8LEczCVWTLCmrP4bx4+mfbJaht5xHZhNsrg9EVVZ2g6IfLqX6zCpIAZhx g==;
X-CSE-ConnectionGUID: RrpABzBGRDqT/OzV985gwA==
X-CSE-MsgGUID: UJlPZhSgSqy/lvUJhur4TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30171177"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30171177"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:15:53 -0700
X-CSE-ConnectionGUID: 0wKEozSsRx631eGGmgNoxQ==
X-CSE-MsgGUID: xghqwj1lSTmfhrPviw3ebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="37750969"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:15:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:15:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:15:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:15:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O12elDB7aY9YTd/ZhQPv9vH8AoswXQkGzPVvW98ojkUwl6lfORLxFRVGJRdAn7D1gCAHhCXrxuZEmWNMzZuqNAZdjpnrfVHU2EpmzwsYOjUhfUMj8KXok7Tx6dfjJvd66XfPUCCfrnrJCDGFrsGvhqiOezbrFp72G9t9OG7QaxKM3pPoTh34vT45NhhmuO7Jj80qAGtU1afdrJpd8aHQfZ+OhoPWvBUAzPz1aatsMP7NUMGFfWrg1bwPxaiAMQ1ie0dcSXiEKOcYJYcsu+ShW6S0NNTBc30zXhgQ+YIWiZit65bWCsXDvqCdueDQWy5Q+7kEx8NXwYbkROm9Af6AvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9pSyYO7oJZZr5zV/ExOEtHAdkprH+Z8mS+dYJ1hxBo=;
 b=KlAH5zbnemKZyB1CWFSrR/6Ka1Z3U4Gk+ny27ExPD/wD0/WM/li89nUkVplMyJrq2jBpbjrNa0DzjgQKZWAhz1NXm7X6fjQFkRcvJIMeqrUbkI6UJCLSP1ZohsqTV1gmsFxAY3lPicniW/UfuX28Oq/nRzKPu0wxN061hb73qagp4Soi/BokvkdIlJlGupwS/YGDAFqUl/lyH/ceQ9qNTIg37fMMF2L3Q3a7xAefrfcoaZl/rTtcnEo03g9Asx2Wpe9dL6sY3n/sOctRsIfsZtxIESErBfU7njPlZrHsBMBKqOImryaQLe2VudXHMj91eKU+uhluEcX4tcaTIbKU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 17:15:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:15:48 +0000
Date: Wed, 22 May 2024 13:15:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 10/10] lib: switch i915_pciids_local.h to xe driver
 style PCI ID macros
Message-ID: <Zk4oQT7Rooi709ME@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <dca416158698f28ba603e804467b2bee6c2e5d59.1716373923.git.jani.nikula@intel.com>
 <Zk4bch_ZlDFZWW6W@intel.com> <871q5trcqz.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871q5trcqz.fsf@intel.com>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: b255cd34-b22e-4f59-7afd-08dc7a82d323
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KgWMuESMV/wDOnbHfYF+YSeKG7mG/DFHNlDT1zBYfu04Cf7m0r5sNolnv1MS?=
 =?us-ascii?Q?jbmzGHuzfbLDVbY106pRqf7QDLum7ieTxEEKP5BYTxYaywN575dvtxkmZjzn?=
 =?us-ascii?Q?czEG8XJiPSU779eBXHCgiPGo1IXguKniHsoSZylc4qpAUKUvUFAn2AlzBqJC?=
 =?us-ascii?Q?hg3PrHXht9p86zkyZHYREANT4LugNsAJHiu/JqscA0k5QpDxOXmxwHVAV1B0?=
 =?us-ascii?Q?RvUjyBIeHBDuPdBH85Q0mFqSoKdReHlORrGR0ZCT6PmmDbHZ49IKmggMIHlO?=
 =?us-ascii?Q?1FYcV4pLUE0U+4clmZuJb+L9Xi7uen0dkGC3oQFVSb3UJ0NnV+2MjAXKYYzV?=
 =?us-ascii?Q?4teOK+6JJuG0DuCfAytrggl9yXICAuzeiCLdgQuWT9pI53y/+Ble9H0BKROG?=
 =?us-ascii?Q?e1B5VOvcn0dGSXx/sc5V6NYotbgFaDTuK3DVIa74bn53abc3LUco2qHNXb62?=
 =?us-ascii?Q?9yCoyxy6hZ5QvNA0i54z/sjREVFxN5FD6Kof9AeczFZmUOiVLpKE3x1c64Ao?=
 =?us-ascii?Q?myb5j6dt9kAG/Z4x3gFF7HWjKQSDMGqnbhq1sCFmQfrLx7skZ2G7ZFPUqlHy?=
 =?us-ascii?Q?Lag+VoUzB7ymvfophFL9OG4aWBf4dqoV1/1HW5BNkaYAMosWB4VTO6OI8SSL?=
 =?us-ascii?Q?yOOuZoV/nB16sL2l65dAuEi16RL3mUW1XcyYUlotYgx1dZWuidxN5zwCrJCG?=
 =?us-ascii?Q?sqa1y1w9Oi2hD0G22ctpFXtAtxR1yd+J6HzLeyS1kKK4nsOvBeD5WkChX02x?=
 =?us-ascii?Q?Hvjn9yn6yeBzKGYJk1t9YioMXI/oEny9mRGB55hIJC40do8MHsIsH8M6aXlP?=
 =?us-ascii?Q?u6oopFdW4iWO0tZCOdUpg0I/CgSyaDcptnpLszGUCpv6HpGLcujdNftcVlnZ?=
 =?us-ascii?Q?yuhPDk6KyP0XAr3G5i6m9d7iUT3mMVSkMPIOUpBM1lk55nj3mHaDr6gGLTgL?=
 =?us-ascii?Q?xv44NQ/21LG5vw321BGvhyg7dv1QtKt2U68pwfyF8g8A3Qsm7khFW1QX4fUi?=
 =?us-ascii?Q?QbL8XYXyIlXuILCjkVM2yu4o3FhU2duVcNaG6yN32sAWHo2ZaUP9G3fagD5a?=
 =?us-ascii?Q?3CHJNWWI35BqrQZG90yb/gQ1zfH3cC21EgwAK1L+Ugy/wfF/j3ErVZkaaQQs?=
 =?us-ascii?Q?dHb9QIcgwoAGAjz+wgZbJ/VNnSStbp5A4jqOc5y5Flv7Wp2kQbTCVh288KFa?=
 =?us-ascii?Q?l2XG6a78zFneyKbFaiRKwsZ7quu9VrcnxiVnFdEFo67w9PW4mI9wDaJzP1IQ?=
 =?us-ascii?Q?iQNkpQCTgTrQBL4NFAp1jA8tTqsBYvezZAS6AGsCQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ItNrNCaig3jUIAaIWTqIwz6lfTD9ty2omXM+VRMZjR2siJ9WF00DrEJyu6wb?=
 =?us-ascii?Q?SiEaASMkvWGRD1yu/slhJA/dxA9iChzM+sQd5r4py+i/bLpn9O+m9HhuqUWe?=
 =?us-ascii?Q?GvTprL2ZD5FZGW66PH9dNZlxWruYgfveWaFj2/+IAL1rwc4eRsYYVxDqtx7i?=
 =?us-ascii?Q?3ohLe024CM7RMpzGss70PKkkkJ8K6j7UgszqxjZv/AraLZxyeMntVd3/6klh?=
 =?us-ascii?Q?b+3lnEJ9mnN3E0CLq7VyrI+uxWLzW9YwdPho5fMWqSjw6ehTU/lFTS4EN9+s?=
 =?us-ascii?Q?D8WFf70lHbLtR6gsuVppK5R/tKCunDD0EqKyGUbdjeo4NDe61TbTSyNz2JNv?=
 =?us-ascii?Q?4I71v0LVibPxT19EN9dPEi+YsCW6ChcT9MJygd94OD8/RTCei7TbjcMMbF2Q?=
 =?us-ascii?Q?pwqWTmaWlTA+2gFb60VlPxDesJh9QiPKovvz37CsH8/hWxdHitJhRa8Jtphf?=
 =?us-ascii?Q?mI95ilQsrYOiIJbBalVJXq+HLM1KbwhVSWS95LcZ/3kkftjpAvCEgCTcEoRw?=
 =?us-ascii?Q?GRDFoGRrePcaVfsliApb43JMa9QgEkXQqbtq4pF4bF+Q/fLELtndfo522+iq?=
 =?us-ascii?Q?/QnYEh2eOb+Usa6eBMI/qhIbYkP8WbCdkF5JUksU/+J9sOEMAxUk6I5rgCKo?=
 =?us-ascii?Q?DnPwjEOyHTAkEjI1i+DmsR/vMMfHWYS7UvksTepgIncjjJhtd36462a/L1DJ?=
 =?us-ascii?Q?rW/PajWIsRn0Zj7HJfQef/jVgPaRPYaRNX6UreyETdVDVBK1vGYb0RDS+jhD?=
 =?us-ascii?Q?QKiVknnTz98u7hJbWu87OtelBeM9SuPKiUjOQosnbDTMDrNiUMvW5Ur2KLO5?=
 =?us-ascii?Q?X7RYyFPF4pGCpw55qUEXAN/RV9CU4yJeqPnvobf7W0RTWOSOBT5AXZokPL2r?=
 =?us-ascii?Q?Zn3ZHVEtRUYbFsLKaUhH1KRoiiBseh4ICliReO7wAf6oLyPBEej5GFEJ/Jp9?=
 =?us-ascii?Q?B+U/z1WQd9Yc7WvYWmvrmsvoinq6PURg1fu6qoRkKaZPyy+JgKFoiIKHZP0O?=
 =?us-ascii?Q?baivr0sJFmEVyglyRlir1fBsNMtifP9C8qk65d+bJ6fF46RYYWHPYIbJ4fse?=
 =?us-ascii?Q?i+0w5eudT8jhgkzmecZq9q/EmpzCSyvkCa9ZfMXoL1i0eqg+ci0eu10aSvE2?=
 =?us-ascii?Q?iTX0BLYElEfZ0hk1CXVgknZMYDYSgwCnIUXcKMdCcVeDqPw7J6tHSCdGl6Oe?=
 =?us-ascii?Q?DQI/I0D0aTRehMj3dtd3aX4nrTM8fqrcXikOJgCOtxBEis9Azwq4zlDjbpX6?=
 =?us-ascii?Q?TyQtXV/r3KHWHd6JMoFGKvGVe0Lb+Niyl9kULUKHD/B52QmNr1jKPbF5WgiC?=
 =?us-ascii?Q?rmJKTfc5OIXNe9RC2qQ58Syhn7qOB9awBciwFx4VIcqQjjB1HeZRv+Z44+SX?=
 =?us-ascii?Q?Bl8okxas5SGvE8TIZ/hmCKs1cd5yS9MPoA/R/CT6WWUfouL5c71VY2K4Shch?=
 =?us-ascii?Q?J2nkkus/a/H5/FIkBTsYqZ01GcdYDQjG3/vBeVSN2uCIL+Nij+jURPdv31+0?=
 =?us-ascii?Q?KW0MtaKX9Fp3YxCxaM6BPys5W8OBin/Qt7otfcDSofF57mDu/efXrn7PwNLh?=
 =?us-ascii?Q?QUGbk39YeVh2fCXdp3kxtE2+N6m+jdYCYRBqWajQKsseF7wgu0Sz2EktMzHt?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b255cd34-b22e-4f59-7afd-08dc7a82d323
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:15:48.8402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVUpdyyCUZB74lafzy7DNjFllWQ4ZNxBTQ7ypmOykBkU8CEaeZ1UzzisHLt/iisi0ubP4UjikBmL1gEMlteYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
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

On Wed, May 22, 2024 at 08:13:24PM +0300, Jani Nikula wrote:
> On Wed, 22 May 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Wed, May 22, 2024 at 01:35:23PM +0300, Jani Nikula wrote:
> >> Follow-up the kernel i915_pciids.h switching to xe driver style PCI ID
> >> macros, and do the same for i915_pciids_local.h. This is a clear
> >> improvement in the perf code, for example.
> >
> > I'm confused now on why do we need this i915_pciids_local.h o.O
> > but anyway, the change is good and right:
> 
> We'd need to split the MTL macros up kernel side to match IGT perf.c
> needs, even if we don't need that kernel side. But might as well do it
> for Single Point of Truth.

hmmm I see...  yeap, we should probably do this.

> 
> Ditto for PVC, we should use XE_PVC_IDS from xe_pciids.h, but there's a
> diff between those and what's in i915_pciids_local.h. Needs some
> analysis why.

This case is different... PVC IDs are not fully merged upstream.
They are part of a drm-tip's topic branch.

> 
> Anyway, all this can come as follow-up.

Agreed!

> 
> Thanks for the review,
> Jani.
> 
> 
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  lib/i915/perf.c         | 12 +++--------
> >>  lib/i915_pciids_local.h | 44 ++++++++++++++++++++---------------------
> >>  lib/intel_device_info.c |  2 +-
> >>  3 files changed, 26 insertions(+), 32 deletions(-)
> >> 
> >> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> >> index 4b00ba5de9d4..ee950b3c03e4 100644
> >> --- a/lib/i915/perf.c
> >> +++ b/lib/i915/perf.c
> >> @@ -204,13 +204,10 @@ is_acm_gt3(const struct intel_perf_devinfo *devinfo)
> >>  static bool
> >>  is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
> >>  {
> >> -#undef INTEL_VGA_DEVICE
> >> -#define INTEL_VGA_DEVICE(_id, _info) _id
> >>  	static const uint32_t devids[] = {
> >> -		INTEL_MTL_M_IDS(NULL),
> >> -		INTEL_MTL_P_GT2_IDS(NULL),
> >> +		INTEL_MTL_M_IDS(ID),
> >> +		INTEL_MTL_P_GT2_IDS(ID),
> >>  	};
> >> -#undef INTEL_VGA_DEVICE
> >>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
> >>  		if (devids[i] == devinfo->devid)
> >>  			return true;
> >> @@ -222,12 +219,9 @@ is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
> >>  static bool
> >>  is_mtl_gt3(const struct intel_perf_devinfo *devinfo)
> >>  {
> >> -#undef INTEL_VGA_DEVICE
> >> -#define INTEL_VGA_DEVICE(_id, _info) _id
> >>  	static const uint32_t devids[] = {
> >> -		INTEL_MTL_P_GT3_IDS(NULL),
> >> +		INTEL_MTL_P_GT3_IDS(ID),
> >>  	};
> >> -#undef INTEL_VGA_DEVICE
> >>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
> >>  		if (devids[i] == devinfo->devid)
> >>  			return true;
> >> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
> >> index 0043b0cd9b34..92879704aa8e 100644
> >> --- a/lib/i915_pciids_local.h
> >> +++ b/lib/i915_pciids_local.h
> >> @@ -9,41 +9,41 @@
> >>  
> >>  /* MTL perf */
> >>  #ifndef INTEL_MTL_M_IDS
> >> -#define INTEL_MTL_M_IDS(info) \
> >> -	INTEL_VGA_DEVICE(0x7D60, info), \
> >> -	INTEL_VGA_DEVICE(0x7D67, info)
> >> +#define INTEL_MTL_M_IDS(MACRO__, ...) \
> >> +	MACRO__(0x7D60, ## __VA_ARGS__), \
> >> +	MACRO__(0x7D67, ## __VA_ARGS__)
> >>  #endif
> >>  
> >>  #ifndef INTEL_MTL_P_GT2_IDS
> >> -#define INTEL_MTL_P_GT2_IDS(info) \
> >> -	INTEL_VGA_DEVICE(0x7D45, info)
> >> +#define INTEL_MTL_P_GT2_IDS(MACRO__, ...) \
> >> +	MACRO__(0x7D45, ## __VA_ARGS__)
> >>  #endif
> >>  
> >>  #ifndef INTEL_MTL_P_GT3_IDS
> >> -#define INTEL_MTL_P_GT3_IDS(info) \
> >> -	INTEL_VGA_DEVICE(0x7D55, info), \
> >> -	INTEL_VGA_DEVICE(0x7DD5, info)
> >> +#define INTEL_MTL_P_GT3_IDS(MACRO__, ...) \
> >> +	MACRO__(0x7D55, ## __VA_ARGS__), \
> >> +	MACRO__(0x7DD5, ## __VA_ARGS__)
> >>  #endif
> >>  
> >>  #ifndef INTEL_MTL_P_IDS
> >> -#define INTEL_MTL_P_IDS(info) \
> >> -	INTEL_MTL_P_GT2_IDS(info), \
> >> -	INTEL_MTL_P_GT3_IDS(info)
> >> +#define INTEL_MTL_P_IDS(MACRO__, ...) \
> >> +	INTEL_MTL_P_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> >> +	INTEL_MTL_P_GT3_IDS(MACRO__, ## __VA_ARGS__)
> >>  #endif
> >>  
> >>  /* PVC */
> >>  #ifndef INTEL_PVC_IDS
> >> -#define INTEL_PVC_IDS(info) \
> >> -	INTEL_VGA_DEVICE(0x0BD0, info), \
> >> -	INTEL_VGA_DEVICE(0x0BD1, info), \
> >> -	INTEL_VGA_DEVICE(0x0BD2, info), \
> >> -	INTEL_VGA_DEVICE(0x0BD5, info), \
> >> -	INTEL_VGA_DEVICE(0x0BD6, info), \
> >> -	INTEL_VGA_DEVICE(0x0BD7, info), \
> >> -	INTEL_VGA_DEVICE(0x0BD8, info), \
> >> -	INTEL_VGA_DEVICE(0x0BD9, info), \
> >> -	INTEL_VGA_DEVICE(0x0BDA, info), \
> >> -	INTEL_VGA_DEVICE(0x0BDB, info)
> >> +#define INTEL_PVC_IDS(MACRO__, ...) \
> >> +	MACRO__(0x0BD0, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BD1, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BD2, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BD5, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BD6, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BD7, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BD8, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BD9, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BDA, ## __VA_ARGS__), \
> >> +	MACRO__(0x0BDB, ## __VA_ARGS__)
> >>  #endif
> >>  
> >>  #endif /* _I915_PCIIDS_LOCAL_H */
> >> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> >> index 30aca2abd7be..e80ea54707de 100644
> >> --- a/lib/intel_device_info.c
> >> +++ b/lib/intel_device_info.c
> >> @@ -617,7 +617,7 @@ static const struct pci_id_match intel_device_match[] = {
> >>  
> >>  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &intel_meteorlake_info),
> >>  
> >> -	INTEL_PVC_IDS(&intel_pontevecchio_info),
> >> +	INTEL_PVC_IDS(INTEL_VGA_DEVICE, &intel_pontevecchio_info),
> >>  
> >>  	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
> >>  
> >> -- 
> >> 2.39.2
> >> 
> 
> -- 
> Jani Nikula, Intel
