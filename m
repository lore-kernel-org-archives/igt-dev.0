Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A22D66B85
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A0610E249;
	Wed, 17 Dec 2025 19:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIMEHpCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FAB10E249
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765998950; x=1797534950;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FOSuDXyW7nTSOQIcYfoTkf+r3aup6td9MmegeQk1wV4=;
 b=jIMEHpCf4Of2WTGZ6K+e8ur71CGXJPMj9+TK4uyumhtkN/pvDo76uChB
 6Rf9mBhFrTN+xEOXpBexl0q3MQE0tsFPEgjdEscpg/eRCmSL3LwK+a3Xf
 4rckSqmhDcs2J2Nca3cdFLp8wwLrMkwI1h1W++MxquaU2TNosb+A2zxyF
 0UeN67wovpZOGZbvCaRT7Ao+K25BPx4esZwVHM++HzG5RFXvQwjJQ0E6K
 HOcwH55lxxgUP5vdIDFRS+0t1oMM3JBvodQ+AacjgPdIAT6fFJmuC0glQ
 Ojh7Pw3rrwnDr/9MHxcZQwP2QgpsVy2CIapUwQesETGfayABrf/pka3M5 w==;
X-CSE-ConnectionGUID: VEzHpYwzQDmoUZpNvG0UDg==
X-CSE-MsgGUID: WEU3ON7KSPeqYM0I05BscA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67986439"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67986439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:15:50 -0800
X-CSE-ConnectionGUID: CmJNLMaTTdCKy0TwPjSBFA==
X-CSE-MsgGUID: xBo8wFDrSi6LJo+JQ1LV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="198282176"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:15:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 11:15:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 11:15:48 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 11:15:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sA01ZvgR3FMQIbAQmMEKNI6F9DRqTe7yoX9b8bjckadCGVDq0ty744KTEGmlcCVwBkeupq19mmHajKMk5Czu8qUGvWAZrX9+TaJOe27/lnwnCLLZNbcUUWe6HlXQMOmlhmpthRvFrUlEdJP91ZFX8G9W7dCKOUncN3J6pzrppTM8ITIZgJhe3ZCv0OHE6dBykxZC94V7Q76v19Gb1HHBvrM9AG6ypPMba1ndwVLlXwQb934CLwMnkX0oBiXpoWfSb8GRyYxIXd9P5DTurPTKZ+eUZSQxgwewKtjAWe9OWb/NUMKPwTO0xj27pCdKJyRKvmug8APVsPom2wKdpnNESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzWJXsHuXZe8ftlwY7qlM905v5aH8Y3/7pTuErXF7Lg=;
 b=VskXVhUW2zNlM/7RKmAcqig+9YuYwKwSMxLULkfKeIjZVx4sG5lfqNPk2whBOW++D7d+93Rl2lesV+tEjfVtRSDE2QZ06/NAX6mDmAeIJraZ7kckMOspv3ifWq0Y/YPwdfh/r2QQlm8/j65Go8TmGSkWcx11y+Shky7+IC/4vh/fWndjqvrE9xNjFNXS0+191ugbNNRIa7itU5VqSlDXyAheLos+3cV+tju3DGdY43FLPgpdwRgBjlyvt0Ji46ICGDXLyXxWa444MGp0b+F9tRP6BZCewYNucqPYXB/8RyNvdZ17jjauUrfxIKYm/tAmWxjx+uEgJIRR+79NaMgMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPFF8B526086.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::862) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 19:15:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 19:15:38 +0000
Date: Wed, 17 Dec 2025 11:15:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
Message-ID: <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217080732.266257-2-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPFF8B526086:EE_
X-MS-Office365-Filtering-Correlation-Id: a592bda6-a722-4d86-8948-08de3da0a96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oy07lQ66URNiqBshOcMCl3TMSPnDO4Jlru9B9o6R36t/wle86GenusFaer?=
 =?iso-8859-1?Q?SxQ5Qyqf8qevRfI1iMO/oAI80eCkVdImqisqLn6v0wHx1i93omS3owcu3c?=
 =?iso-8859-1?Q?63LQ2ZGZ/n7mjt0nPg36+KgtWnbWoGQIPBBTAj1DEyoIYOfTg8Kl76f2yo?=
 =?iso-8859-1?Q?bxHZ124KTXut4yuWlPcoF27TP7wl4D9CLflU9x56p72yzAWfnsk3mbzUJl?=
 =?iso-8859-1?Q?tIBOfUXa57iyrb2YFiW9A11ePC+w02l5p2lks5kLzBHhoO09CBi1I3xaYL?=
 =?iso-8859-1?Q?JXc0+GKloVU+1OWZ5zVWrU6vly/q8z8vCUN851V7Z5jrqb/FPgLTwxcTnu?=
 =?iso-8859-1?Q?UKBiocZLSXhq79KVjSFoDN7gX6SkoAzPv53tFBc2uycV/t/Dq0OptvAc8Y?=
 =?iso-8859-1?Q?nPRH7bwO2hzHsWOvZ7EBmnlJFRRstUzWZiXy4ixVa6CPYHEv9nnEgT5cMd?=
 =?iso-8859-1?Q?JnOJwK9GT4TGrMx2dGpi71SCyxBNkS0tbm1E8Q2vKWhSLLQoKktSGGVDao?=
 =?iso-8859-1?Q?H/ir7VuGFf0iyTyqJoFqZFF5Mq0xqpA+DGuTRoXgYOZpeJFsZ8OKOzm1Bw?=
 =?iso-8859-1?Q?KSkAtjgeaa+qeeLiNAdO4rmBx737Gr2g2DczcivZMM1C/FfvMxegDX2OjR?=
 =?iso-8859-1?Q?/OJgwFrSmkkB/xoTwFCZVrGl78LresAeEUQLeVg1/bzosuPUBKJaIPVuTF?=
 =?iso-8859-1?Q?hFOqYx56Bifc7sMd8pw78XvhD51X4lghTyts+TEhjGvZCXQ5PNE5x3xhpL?=
 =?iso-8859-1?Q?YSlpcEZH4GWkhkUhZGCnrZO4TvtD6pmU45xTLrbt9kMt0VwFo4VoIrdeRU?=
 =?iso-8859-1?Q?zeuB/hGjjye03kVOfD/ZxE9Jz6ZleFaWM34xGcaHwlamvRfIkML9c/o9wq?=
 =?iso-8859-1?Q?R+VZclEwuZ7Cwax8glaRYMtvESVRAeBiPm1NICn+szCNCW7ylmCgXqCZkP?=
 =?iso-8859-1?Q?ECJ0P++PZmclZ839Y7lEF4+uCivzyBLONSxqt6yQ2SNnVt0UTX6SctNJcu?=
 =?iso-8859-1?Q?NS/uTG7I5Z4kvNAp3qoJb+GSNXl7EWG/EIBBtITHrMWkYQUdsW3EckWjqg?=
 =?iso-8859-1?Q?enJxZR1i6LEF7RzSGx7pWvHS3FcEzlt7hUDKWO4AkgNDi4N0vJuB+GLdQ2?=
 =?iso-8859-1?Q?Kqv1uFefU0McWIx8hjSOhPuDQr9xBLduHWZARe1UkwGaDOjoXZfOo5kMGG?=
 =?iso-8859-1?Q?70VQLymaUleLDdID96fToPOZJtbrLSYzci6ZULADYWAVlsqePx6+ODndB0?=
 =?iso-8859-1?Q?JrVU552/ruArWyQHJegyphT2NXJWT8ulfdLrSZ5ihZY58RRJze8ZqHOe8n?=
 =?iso-8859-1?Q?qRnfIlLDWh++20rwNDgeYQlIqdtolScEkgi1joNlqxdS92SGbBVTddPAk8?=
 =?iso-8859-1?Q?uTNNlJ7HO9W7O0zC81QSkC9GCSEmFohXXpyV+xbe0Re6WkBpHKRP4nGWjH?=
 =?iso-8859-1?Q?X7lc5H8dP1LQZ8hRgjR9fuSFJBQNHXnUnQwtAEEKBdHlGjSTaZtTy36Mx3?=
 =?iso-8859-1?Q?HrorNAhvbA2KD+rX1489b1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t5fT+6xHpsx7UUz4WREl3QgZ2I6ewSa4V1bbPycgq+wj3Br48pzVSXDeML?=
 =?iso-8859-1?Q?rqWOuVt5QJACRERhzbpKfxY/HS+g0t7vdfs7Mn8E5UP4FSvxP0ILsOdzSR?=
 =?iso-8859-1?Q?tD90FFV6Ug0ATScwnYZZK7G4T1usJefJSjcURgsGdmtGs1HuMgvwvXJaBN?=
 =?iso-8859-1?Q?4n9Ct0IfT+Xm+mYRpJtcfQbIuBAlKeY7KSCMjnjlbsUGa2EUoyT50zoLiy?=
 =?iso-8859-1?Q?0z0g0g9HHghf2IOkUJccT9I9wWHYZ0DMD756KrSs9v7qv9o+XaknKBBtmZ?=
 =?iso-8859-1?Q?0CA3M9CRNN/uUAeAp7X5a6vQZ1LWX1WMfoln5LdiwVIAL1QnEbRE4cUzuO?=
 =?iso-8859-1?Q?9wlvj4YswSmy5M2fQ02Jfs/il0PfFSN89NHV5TLu2jMyiucDtZEy2q6LbF?=
 =?iso-8859-1?Q?mSyZ8/2krf3kyZcKfzql3R+5xinACh7WYn04fJ240/yW6k8YtAYrReP4SY?=
 =?iso-8859-1?Q?Evj0ZkwrJufzC5l6I21zG9VmfbyoK6PyEF7RH7NunJuMyA1Xy+ew37OvGV?=
 =?iso-8859-1?Q?E1E7uOl4Xl1YX6PXSQGNtMEvJty5xVJq/7pcoRw3vyzB4BQB2nYGGyggMF?=
 =?iso-8859-1?Q?JJQQQdJ6wf+umujvclO63bW4B2wN3qAhtmuP5mVdDnwmyu2nt3+qLnqTmS?=
 =?iso-8859-1?Q?jH8+UYmD7RC6BbnmxL3A535257B6hn9GXcDyFdLrUkQFirGNOwfpunoXgM?=
 =?iso-8859-1?Q?QN6EKBQgHGhDoaftdnuC9uuRPYEccA4bTTTie+XT+gCLD0lIJaAraZ3cFd?=
 =?iso-8859-1?Q?YspdrPtgFJN0/An/NAFmTwjqzBqOLQIs/5/7XgfJcpPTTGY7OWEJpNGB9y?=
 =?iso-8859-1?Q?tNqtL8zIMveC5LYpAquSnerydK9/48l+rhbj6D5yyIznWPxjBK0rgYFNsv?=
 =?iso-8859-1?Q?KNQsnxdUAXocWymkI2nt+4DXC0F72LRRDsB+2QzlQZKFX8Hs0FC39ypHcm?=
 =?iso-8859-1?Q?bFBTkh9z5jv25kOYAJJdaByO3f47G8aZk64RMcwGYEA4eD6uvDbtfDhYNx?=
 =?iso-8859-1?Q?zbvIjuK6MIt4am2Ny6YecdcGVZsSt5QEKL+TVIDRivUU0V8yCQ9whkWt9y?=
 =?iso-8859-1?Q?z4JRS9EGZK826XLjFhKMLcBzyU3iJTpJYe/6qP1r4ZK11c8LZJuPwwt58m?=
 =?iso-8859-1?Q?LXKpkHmkOVWmENvZ7B+dXfDU4Ca33EenKVbTpDatdbj5bGipmfp+ydnYPP?=
 =?iso-8859-1?Q?V5I5KOBP4UfMga0JrZO4SaPSIkRvVlALNkn4etAXaYxwyZnPdPMGflijdB?=
 =?iso-8859-1?Q?97nXLFygrwqE6m/pDRpxNYBEK+yu8eeVguV+7Ov9LLeQfs537boBhLJ5Hh?=
 =?iso-8859-1?Q?2q1G/AAYKKTti0rPD50XwfFHclZH8ftZlUm8HdJJHKWWsTY4R8on0RJjcG?=
 =?iso-8859-1?Q?UXbqTYeaclHSAcDnjDZ8tAtYYKIZUdOwaGfplFin9SDr6iEM3VcWsEWzCP?=
 =?iso-8859-1?Q?MsxY0ePWbNwZemdGmZvvNDEFOdVnOedn2ThiuKpavKJ9WSt1vLOVE93lx+?=
 =?iso-8859-1?Q?bVi+xvIPT0it3Gep/3hv+A1WW2pW8bsbWJNWUKlDuNctuglX7UMM06IM12?=
 =?iso-8859-1?Q?z4NstQ0r6+jZ0/So6pBLIbZThPyiyLFe5p3zPwm4Q/emd2FyYv1nj/+x2d?=
 =?iso-8859-1?Q?+xaxaqUyBdTZrp76KBdE0lwvsNAWIqxhqBitXa8fj6GPEvl1q6hwmvfw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a592bda6-a722-4d86-8948-08de3da0a96e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 19:15:38.1968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3juwcIzVhmqE9P71i77OQFmw0065ouTUf6t9oqgj3EPI92HacV+Had/wm3HM8Kgx0OIxwVxVpFSC2Egq3oD6ycCvcXLyR+8BYAra7TaJ+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF8B526086
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

On Wed, Dec 17, 2025 at 08:07:27AM +0000, Xin Wang wrote:
> Parse the PAT software configuration from gt0/pat_sw_config instead
> of relying on hard-coded indices.
> 
> V2: (Kamil)
> - Show a detailed skip info when opening the debugfs file fails.
> V3:
> - Save the Xe PAT software configuration into the xe_dev structure
>   to prevent scenarios where certain test cases drop root privileges
>   after execution begins, which could block access to debugfs.
> V4:
> - Cache the parsed PAT table the first time we read pat_sw_config
>   and reuse it for subsequent calls. This avoids repeated debugfs
>   opens (and failures) in tests that drop root between steps, while
>   still returning the correct PAT layout.
> V5:
> - Make PAT debugfs parsing lazy: avoid requiring debugfs from
>   xe_device_get(), so tests that don't need PAT won't be skipped.
> - If PAT info isn't available at device init, keep pat_sw_config empty
>   and only require debugfs when PAT indices are requested.
> - Add xe_get_pat_entries() helper to expose the parsed PAT entry table.
> 
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_pat.c   | 140 ++++++++++++++++++++++++++++++++++++++--------
>  lib/intel_pat.h   |  21 +++++++
>  lib/xe/xe_query.c |   6 ++
>  lib/xe/xe_query.h |   4 ++
>  4 files changed, 148 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index e3588110a..46f6cd884 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -3,37 +3,118 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include "igt.h"
>  #include "intel_pat.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
> + * from debugfs
> + *
> + * @drm_fd: DRM device fd to use with igt_debugfs_open
> + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
> + *
> + * Returns: The number of PAT entries successfully read on success, or a negative error
> + *          code on failure (-ENOENT if debugfs is missing, -errno otherwise)
> + */
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
> +{
> +	char *line = NULL;
> +	size_t line_len = 0;
> +	ssize_t nread;
> +	int32_t parsed = 0;
> +	int dbgfs_fd;
> +	FILE *dbgfs_file = NULL;
> +	static __thread struct intel_pat_cache cached_pat;
> +
> +	/* Return cached value if already read for this thread */
> +	if (cached_pat.max_index != 0) {
> +		*xe_pat_cache = cached_pat;
> +		return cached_pat.max_index + 1;
> +	}

I'm not sure we really need to worry about caching the results here.  Is
this getting re-called repeatedly in a single test to the point where
it's creating a real performance problem for our tests?  If not, we can
probably just keep it simple and re-read the debugfs if this function
gets called multiple times.

I think we should really try to minimize / eliminate the whole "use a
static variable as a cached result" pattern.  It leads to inconsistency
(and possibly mistakes) when we implicitly cache some types of lookups
that IGT libraries do, but not others.  And honestly using static
variables this way just feels kind of hacky.  I think needing to add
implicit caches like this is really more a signal that the function
interface we're using isn't very good and could use some refactoring.
For example for the PAT stuff, we currently have a bunch of API's that
take a device (fd) as a parameter and return one little piece of
information.  If we want to improve that and eliminate redundant
querying/parsing, it would be better to recognize that if a test/tool is
working with PAT in the first place, it's likely to need several pieces
of PAT information and define our library API accordingly.

For example, if a test wants to get the UC, WB, and WT PAT indices,
today it does something like

        pat_uc = intel_get_pat_idx_uc(fd);
        pat_wb = intel_get_pat_idx_wb(fd);
        pat_wt = intel_get_pat_idx_wt(fd);

which triggers three separate debugfs open+parse operations unless we do
some implicit caching inside the PAT library.  I think it would be
better to just redefine the library interface to something more natural
like:

        pat_table = xe_get_pat_sw_config(fd);
        if (!pat_table)
                // error

        pat_uc = intel_get_pat_idx_uc(pat_table);
        pat_wb = intel_get_pat_idx_uc(pat_table);
        pat_wt = intel_get_pat_idx_uc(pat_table);

        free(pat_table);

so that the data is only queried once, and then the caller is empowered
to manage its lifetime and do further caching (e.g., stashing the whole
table in a 'struct xe_device') as it sees fit.


Matt

>  
> -#include "igt.h"
> +	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
> +	if (dbgfs_fd < 0)
> +		return -ENOENT;
> +	dbgfs_file = fdopen(dbgfs_fd, "r");
> +	if (!dbgfs_file) {
> +		close(dbgfs_fd);
> +		return -errno;
> +	}
>  
> -struct intel_pat_cache {
> -	uint8_t uc; /* UC + COH_NONE */
> -	uint8_t wt; /* WT + COH_NONE */
> -	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> -	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> -	uint8_t max_index;
> -};
> +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> +	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
> +		uint32_t value = 0;
> +		char *p = NULL;
> +
> +		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
> +		if (strncmp(line, "PAT[", 4) == 0) {
> +			bool is_reserved;
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1) {
> +				if (parsed < XE_PAT_MAX_ENTRIES) {
> +					is_reserved = strchr(line, '*') != NULL;
> +					xe_pat_cache->entries[parsed].pat = value;
> +					xe_pat_cache->entries[parsed].rsvd = is_reserved;
> +					xe_pat_cache->max_index = parsed;
> +					parsed++;
> +
> +					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
> +						  parsed - 1, value,
> +						  is_reserved ? " (reserved)" : "");
> +				} else {
> +					igt_warn("Too many PAT entries, line ignored: %s\n", line);
> +				}
> +			} else {
> +				igt_warn("Failed to parse PAT entry line: %s\n", line);
> +			}
> +		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_mode = value;
> +		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_ats = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wt = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wb = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc_comp = value;
> +		}
> +	}
> +
> +	free(line);
> +	fclose(dbgfs_file);
> +	cached_pat = *xe_pat_cache;
> +
> +	return parsed;
> +}
>  
>  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
>  
> -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> -		pat->uc = 3;
> -		pat->wb = 2;
> -		pat->max_index = 31;
> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> -		pat->uc = 3;
> -		pat->wt = 15; /* Compressed + WB-transient */
> -		pat->wb = 2;
> -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> -		pat->max_index = 31;
> -
> -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
'> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> -			pat->max_index -= 4;
> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> +		struct xe_device *xe_dev = xe_device_get(fd);
> +		memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));
> +		if (pat->max_index == 0) {
> +			/* If PAT info is not available, try to read it now */
> +			igt_require_f(xe_get_pat_sw_config(fd, pat) > 0,
> +				      "Unable to open the pat_sw_config file in debugfs.\n");
> +			memcpy(&xe_dev->pat_sw_config, pat, sizeof(*pat));
> +		}
>  	} else if (IS_METEORLAKE(dev_id)) {
>  		pat->uc = 2;
>  		pat->wt = 1;
> @@ -96,3 +177,16 @@ uint8_t intel_get_pat_idx_wb(int fd)
>  	intel_get_pat_idx(fd, &pat);
>  	return pat.wb;
>  }
> +
> +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry)
> +{
> +	struct intel_pat_cache pat = {};
> +	uint8_t max_index;
> +
> +	intel_get_pat_idx(drm_fd, &pat);
> +	max_index = pat.max_index;
> +
> +	memcpy(entry, pat.entries, (max_index + 1) * sizeof(*entry));
> +
> +	return max_index + 1;
> +}
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index eb48cbc65..48ee10c0e 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -6,9 +6,27 @@
>  #ifndef INTEL_PAT_H
>  #define INTEL_PAT_H
>  
> +#include <stdbool.h>
>  #include <stdint.h>
>  
>  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
> +#define XE_PAT_MAX_ENTRIES 32
> +
> +struct xe_pat_entry {
> +	uint32_t pat;
> +	bool rsvd;
> +};
> +
> +struct intel_pat_cache {
> +	uint8_t uc; /* UC + COH_NONE */
> +	uint8_t wt; /* WT + COH_NONE */
> +	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> +	uint8_t max_index;
> +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> +	uint32_t pat_mode;
> +	uint32_t pat_ats;
> +};
>  
>  uint8_t intel_get_max_pat_index(int fd);
>  
> @@ -18,4 +36,7 @@ uint8_t intel_get_pat_idx_wb(int fd);
>  
>  uint8_t intel_get_pat_idx_uc_comp(int fd);
>  
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
> +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry);
> +
>  #endif /* INTEL_PAT_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 981d76948..a456aa44e 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -299,6 +299,12 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>  
> +	/* Populate PAT software configuration */
> +	if (xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) < 0) {
> +		/* If PAT info is not available, zero it out */
> +		memset(&xe_dev->pat_sw_config, 0, sizeof(xe_dev->pat_sw_config));
> +	}
> +
>  	/* We may get here from multiple threads, use first cached xe_dev */
>  	pthread_mutex_lock(&cache.cache_mutex);
>  	prev = find_in_cache_unlocked(fd);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index d7a9f95f9..12cae99d9 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -12,6 +12,7 @@
>  #include <stdint.h>
>  #include <xe_drm.h>
>  
> +#include "intel_pat.h"
>  #include "igt_aux.h"
>  #include "igt_list.h"
>  #include "igt_sizes.h"
> @@ -74,6 +75,9 @@ struct xe_device {
>  
>  	/** @dev_id: Device id of xe device */
>  	uint16_t dev_id;
> +
> +	/** @pat_sw_config: Xe PAT software configuration */
> +	struct intel_pat_cache pat_sw_config;
>  };
>  
>  #define xe_for_each_engine(__fd, __hwe) \
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
