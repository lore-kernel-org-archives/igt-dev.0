Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BE9D262B1
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8010E684;
	Wed, 21 Jan 2026 02:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dj92KhsR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B3D10E684
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768962119; x=1800498119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5+7wMvNKiM7W8l0mTmHpF24hH2hSMuRfL1VGHYpdkmM=;
 b=Dj92KhsRsnwwqaGkMzoOzttYgmPbbpZrxmTY1xV1e8IpGV4wQkG/K7vV
 Z2IJX3oyrWspVq/4rJrAoRLk2XtGxWRoHmgZZDThtBB058ph1xoNNTVRT
 T+q4NRfC6toRrYWKsQB4LAFNPC1tp4JpL9NWuVIjiIup2uShdwu5CjVvg
 Ily02rr+JzG+ZjZDe3QgiZpSRRGEmSPIadipToIadSJ2+UcUpYkT2ePHm
 yqe18bzRogA+P1YqZgnuyBq07X8Fw7bTmqNESfX3NT3mizeLE3sZEopNb
 uQUhfJrqjSgRJOZqusC9zRhoIJ1Tpxe5O7vcuci20I16fGH1FDGUJuJc0 A==;
X-CSE-ConnectionGUID: AfU7K51ERu6PNs+HEMG2Kw==
X-CSE-MsgGUID: phP3cJy7RFuCK5v6KJ2dSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81293773"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="81293773"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:21:58 -0800
X-CSE-ConnectionGUID: bDgEJIzKQnGg15L4Qy5/2w==
X-CSE-MsgGUID: OX/MdQy+S4aGLg5ax9n0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="229257996"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:21:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:21:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:21:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OskOeHIGuyepSGx7S8CF8EuHZgVxWnDy8K6f9rzHIvWpIN5NuKcEMng1BDHR+8WNFziE01F+0E1ebp0TiuTYpt/lHvRoc6FzPr5OguE2aFibPpksjNII2rj0+eptZ5RJVjiugOHB+JMQNJj62CUfmbzfod6PaTGN3eG3b7HMz8+bcouP+4ARDjUS4jTSo/I6smFXYwTe4cKuI5zLuDxjxTC9G47uI2+9A+70xJ7I+1zNb7SW0wCY2jQKC+tfOhauOHX6je/V5efQXvWsvYUrOkm45/Sehs/zYWoL1/qHiOVvfdFSzAVHj3CWNoD4k+lDFoib7hBJouJ/awn5RwLVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDSGyZmUNNUC9R7dVBIpxrFjScXdI1/HGhbjSszT5w8=;
 b=PDph+hjQoxuL44tBAjPERMpwMv24XwRXF5zcMO9LVxNhhGcGBeJYP60r7YaBw6a0s7Z0L0iHc3qWdB3aXh+hJMrHhXxuzKtrKRqw48jRc5N7mAXsPXyCBblS+ZAbJju9ZBiTka9qQfLSI+Y/bBHQabmX5VIDBFh1p7xGUZV0LQaB9E2oT5sL5a1XPeiWtRUjJS4w4HTHTbKOJkDkhbsTvTsAyV5oxrfmynBQNaKBr3fs9X7LXMuMziG6CxUUOx//xmGsSOU9HCeOQq09MuCSA7sXKYv2jcCMA2XLQNsn84bjBF5Mg+rkhfOursmhmXNsPm6PsqITt24fmixXDCDKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 02:21:48 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:21:47 +0000
Date: Tue, 20 Jan 2026 18:21:43 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 6/9] tests/intel/xe_exec_threads: Add multi queue
 for compute mode
Message-ID: <aXA4NycUh6a7XV0j@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-7-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260114065925.197958-7-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: d27c8ce6-bca5-424b-0401-08de5893d3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7LsQg/uEi20UDJwwKZmjR6s/RVP0VxoR1BiOqwQnaAp9vvrUkry9RMm8lcvV?=
 =?us-ascii?Q?SCGJhYjTvGSBxA7TVCxfJUfWO4cXHiOzf5fp50TuVPGlgWTKBd9eOlFcZxPF?=
 =?us-ascii?Q?hKfOkSjbaFjXUI6oc2IGuv0Lm18JMUQtIP4HlSUw3TatRLZPRXpo1J8Tf98z?=
 =?us-ascii?Q?ImAAt5dC/wB7+Jbm63T4hxAx+2Ch5iO1oklq9fxTLKZeV9f56MjMpU+RABER?=
 =?us-ascii?Q?Nfy2HciKiVWKExHr4hmDYpz6oZS8yxDHsPpIPzZvyvwjDZS7Y0qjpXEe3+3n?=
 =?us-ascii?Q?va+Uwhw+wA0zWddlANU4kdW63C+id2uWLGi8XIRWxfJvyGhv6Skj6nH6EjtZ?=
 =?us-ascii?Q?l9UqOl9mnMHdtrTUo5KrHxtNHdon2aQPbRGEO4qfeP8M2C9NU/XH6r9I4qbf?=
 =?us-ascii?Q?p20en77HxXMujJhH4g/EALQB/AHD1er7rc9qZ0ItzxHK1X/RGKNzO3vrcWta?=
 =?us-ascii?Q?mMGiVf7aL9/ok8fM4Yv+rVnJigR4mZArZmsu7w39R2VPZm9Rqomro6jQTv9E?=
 =?us-ascii?Q?Su1WPIbv5NwYHtq3TTFaopHbgxpn7VdmG0KcvGWCFkTDJr+cc5byDrDVrwyP?=
 =?us-ascii?Q?KcH0ZDAtdtyOWn9/P2ZcIdYIoey0zYfDH7aK4JBZd7pYOdECKUm+4PXUSbU/?=
 =?us-ascii?Q?qUYjPP7FZe+ZwlC1/3HFW24uqf2qz3P2NM8al1uK8pFnLbp0anIB20g4Tm7H?=
 =?us-ascii?Q?XHMrbpb5ysZvFxWSPRd6+FJ4nZsVYCKgzBQ8i+1Zil9x95K1cxe0zVt7ayO3?=
 =?us-ascii?Q?sryitbnOmsZW8nAaz4H7FWQ+0OfxkDf5ApWm4Yf7deNrMxBh7t6nkYwxoltp?=
 =?us-ascii?Q?3dCkOoj1t7Vy3LOuzzPKbNsVxuHWjpQqi2POMuLMM07LMro0dRKIvQeLG2N0?=
 =?us-ascii?Q?WHJMc2ExCpZ4h06DsUoG55heBHVry/Fgo9Ef+CVq6/BAIo1sBNDJ4Ru6SdkO?=
 =?us-ascii?Q?t9L5LhzvJ9CrQjrcL8X9IvmpED8pj7guxrvswSNWWl51ZpPUFGvoiVpyb+Rx?=
 =?us-ascii?Q?AOznuiI3g5cpm0Pi0elGjZolmzj87O3OUKwrDSf3O6jANQZmqWuMilLBc1Ec?=
 =?us-ascii?Q?Sij152bChYskm/SXBMhuAgbiZu/TcNdBx3rp8eU+m7craV5oRdKJlhMA6aJk?=
 =?us-ascii?Q?o7/dTbQESBcZ+oEVX2UKlztifreqyiC2kjMsj8NKCgvsfWAMsFb6qUpXMmSE?=
 =?us-ascii?Q?ll0U09MnwmgJxGMSteUR1yslHgg/8JfWm0p1cbddk0NOqudziLJFqitGDqrn?=
 =?us-ascii?Q?j3IWaLg+vJ+7ebRaODXzADlIGaUnRtYIMjleewFrNpt0YpVOIRy4Ekzn72Xv?=
 =?us-ascii?Q?O6wxH9WVn1OGIhZHaVBqV5tS0dgTmSAO3xgeoVqPZmUp9MZwp0BNRDreVNuX?=
 =?us-ascii?Q?bzwT1+TD62VFgo5z0gRQ8doRMMaZPpXautTvkOAm1wiKZ7AJQSz7eGMzP1WC?=
 =?us-ascii?Q?vzeiU8I6Q7yFC8T+vR16BIl67UROrx/577+GGne0s6NFBZ0Qpe7p2N2/i9FN?=
 =?us-ascii?Q?KFBBNaDuG61mjcFy9hlKtTg8Yh4JVIvU3C61xgKEVNRXBRaKW60wzndEo2Fi?=
 =?us-ascii?Q?IfVSFhvDxuCwssRjC4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TN/9z+1g/OMQtVRhZ0vWBS9V+pZDCmIF07k0UHznc7bWNMUBhZAx3XAfH9MB?=
 =?us-ascii?Q?Ka/zSBV7nZaTGMCXpbbMaU5xal3thAGc/Hq6flcTEo6tdUeyik5U0o9te6G3?=
 =?us-ascii?Q?dzgjmPyDzHzH6AA6RqFtuv0Ww5Cb0F0+7RQ5+N6vqGVDd7yhcRcouXP+So0r?=
 =?us-ascii?Q?uY4iQE61UhbdeDXuCAZ4GBFo/2NcFTWGT0oZnsbN0frrANZ0qpxicA0NSiZh?=
 =?us-ascii?Q?npHft2HTik261ZFAyF3DOvtFCi8Qnz6qFI0qCGGA5V2W+VrPg2lzaDQt4LeP?=
 =?us-ascii?Q?IpS04xi2YVK1DjV+2036Km+L7PqWdZUGxeDEZ4kLb3qtEmzagVmLMlb5M45U?=
 =?us-ascii?Q?5b/z4n27RG4aSb0wklWTtiGDnpBojJ4lnwD9Y88LuragKlo4LJwQ+Ngygbol?=
 =?us-ascii?Q?yHgg6mbRH3GEcVMnUuSK+WDeK+0rxi3ZyQHv/hrleO1p8bY+Ew/0Rx2xYC73?=
 =?us-ascii?Q?raFo/+P/CkrR3N8hToAmZx1MHDvfpLpDv/25qyp8LjltKo5JYi0veSj7NL5C?=
 =?us-ascii?Q?Akdot4dz7TgOSyBYKBTzfg6eZ/8M6zDw2ayIismtF25tMDrWbZiv6C5dAb7T?=
 =?us-ascii?Q?KSNgDLBJDQm5f2RAZUokiiF4ksqcVXimp4i1uYa7Khy2P/iAoKx+jho83kg1?=
 =?us-ascii?Q?BkTs2pENXMQ34x9xEzvhSvaBiKpMrPYHZ6vFWFdnU7Fc7wiUmtuVtLbd7NIz?=
 =?us-ascii?Q?MXlSJcDFH+lgFqgiIwP/D1VrUHfhhYmUAerpdZxZpMCeOoWVENey/a4rz0AN?=
 =?us-ascii?Q?4mu8I1ybHQMXmElDPh5WTT7vWbbAgDwoNlhEmxI7WB1b9oJ7OQkTbjn+rIyc?=
 =?us-ascii?Q?LsIDhxrQWQ+G3ppYlKmwCl+lSkbAYeNjR+TvBCEkVfosWvpVuAqLleymOEgE?=
 =?us-ascii?Q?Wv2EbIu+3ldDrbOjEnfj2tLRd55oiOYUr5wins/JG3anFp9cbxOo97j9HSdS?=
 =?us-ascii?Q?DNVJm0BN8bpZk22uoryY1pn1os5uZi4n3M33qL0eVc9oTdYJ3NsnW0Vfv9o1?=
 =?us-ascii?Q?qh/mrTJIw5w6EvK0D2tpqITn+FJUfdbA5mHvZXx45w5dJV0QQYyFsv9MIeon?=
 =?us-ascii?Q?nPENqi3vAaYM9XLqnEuGd9QDVWs2Wquq+zY++AIe/Qqgwqd6nYXVr8UVuLOE?=
 =?us-ascii?Q?jPZlsY6hWA8ZjlkG0wSdcY5u2npMSx1n/0CdzWbnNvkO5FxAIPomHJKHBFMp?=
 =?us-ascii?Q?UqBo4ve4B9mrQRaXvsfisJUUWabhz8xcRn8dlB6v2R06SmVdyPGMf7v/UBUH?=
 =?us-ascii?Q?sQF5Qd2iwraVQick4vnXLSCiGoxgLnG1TBK9q2i6MLDjpwKX/m+JVf34Maqp?=
 =?us-ascii?Q?ZgvEiUYfbdKD53BIrjShmtVPq9S4MoVdhzI3lMSjEVV2SiKo+CoVHoZt1eHH?=
 =?us-ascii?Q?Y9XwZfFBfx/XgfjdifWb3+qujY98YxQrWahGHnU9k7oqR+AO//DGU+xuUD1p?=
 =?us-ascii?Q?YtOeumtCee7RGFXuNkI/R2V1uryGdFEW9dYXTXDzZsyGBcjH+NVavNKD8i6h?=
 =?us-ascii?Q?EQU9gju2SOHY3yDtnzZXOphOJanqmsoIfEGKjScKe0A5JbhHAOIevZPiBqV0?=
 =?us-ascii?Q?OvBCNLF+J1eWT/HLpCufss/LdTFjxRlgp0ozk8TlwC9COG+WqHXH3UtaGN5u?=
 =?us-ascii?Q?7jwdfCDcykEy/YilwDRsTCc0tZRSEW+L6vmyRIY4TSfR2qQVJHeeUlI7wQI/?=
 =?us-ascii?Q?P3vliuNfjmWH3sKjptS6HQHibuF0xiH3mvGAlZKZb3WUzXGd4kZsGM0u+rJo?=
 =?us-ascii?Q?DzTl6ikg2WEPYldsf5vmQdvQZZwiByvTfzp758Zj9BNGr5+UK0va?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d27c8ce6-bca5-424b-0401-08de5893d3c4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:21:47.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pS+QWcU3ccb/BgEF+pJviu0snSkv4gqoGL71FpKAjnwQLGV2uE5M9nKO6730XeZayyhufzxoO2m31i7cc+WOhB9hm/S/vHhS+quF8AaMYsm+icPa/+zI6HsRtzb6Ttro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
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

On Wed, Jan 14, 2026 at 12:29:22PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add multi queue tests for compute mode.
>

As mentioned in the previous patch, move the compute mode
multi-queue support also in this patch.

Niranjana

>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_exec_threads.c | 62 +++++++++++++++++++++++++++++++++++
> 1 file changed, 62 insertions(+)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index d63d81552..3846e0cde 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -1086,6 +1086,42 @@ static void *thread(void *data)
>  *	multi-queue-mixed fd userptr invalidate
>  * @multi-queue-mixed-fd-userptr-invalidate-race:
>  *	multi-queue-mixed fd userptr invalidate race
>+ * @multi-queue-cm-basic:
>+ * 	multi-queue cm basic
>+ * @multi-queue-cm-fd-basic:
>+ * 	multi-queue cm fd basic
>+ * @multi-queue-cm-userptr:
>+ *	multi-queue compute mode userptr
>+ * @multi-queue-cm-rebind:
>+ *	multi-queue compute mode rebind
>+ * @multi-queue-cm-userptr-rebind:
>+ *	multi-queue compute mode userptr rebind
>+ * @multi-queue-cm-userptr-invalidate:
>+ *	multi-queue compute mode userptr invalidate
>+ * @multi-queue-cm-userptr-invalidate-race:
>+ *	multi-queue compute mode userptr invalidate race
>+ * @multi-queue-cm-shared-vm-basic:
>+ *	multi-queue compute mode shared vm basic
>+ * @multi-queue-cm-shared-vm-userptr:
>+ *	multi-queue compute mode shared vm userptr
>+ * @multi-queue-cm-shared-vm-rebind:
>+ *	multi-queue compute mode shared vm rebind
>+ * @multi-queue-cm-shared-vm-userptr-rebind:
>+ *	multi-queue compute mode shared vm userptr rebind
>+ * @multi-queue-cm-shared-vm-userptr-invalidate:
>+ *	multi-queue compute mode shared vm userptr invalidate
>+ * @multi-queue-cm-shared-vm-userptr-invalidate-race:
>+ *	multi-queue compute mode shared vm userptr invalidate race
>+ * @multi-queue-cm-fd-userptr:
>+ *	multi-queue compute mode fd userptr
>+ * @multi-queue-cm-fd-rebind:
>+ *	multi-queue compute mode fd rebind
>+ * @multi-queue-cm-fd-userptr-rebind:
>+ *	multi-queue compute mode fd userptr rebind
>+ * @multi-queue-cm-fd-userptr-invalidate:
>+ *	multi-queue compute mode fd userptr invalidate
>+ * @multi-queue-cm-fd-userptr-invalidate-race:
>+ *	multi-queue compute mode fd userptr invalidate race
>  */
>
> static void threads(int fd, int flags)
>@@ -1446,6 +1482,32 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "multi-queue-mixed-fd-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | FD |
> 			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-cm-basic", MULTI_QUEUE | COMPUTE_MODE },
>+		{ "multi-queue-cm-userptr", MULTI_QUEUE | COMPUTE_MODE | USERPTR },
>+		{ "multi-queue-cm-rebind", MULTI_QUEUE | COMPUTE_MODE | REBIND },
>+		{ "multi-queue-cm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | USERPTR | REBIND },
>+		{ "multi-queue-cm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-cm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-cm-shared-vm-basic", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM },
>+		{ "multi-queue-cm-shared-vm-userptr", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | USERPTR },
>+		{ "multi-queue-cm-shared-vm-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | REBIND },
>+		{ "multi-queue-cm-shared-vm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
>+			USERPTR | REBIND },
>+		{ "multi-queue-cm-shared-vm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-cm-shared-vm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE |
>+			SHARED_VM | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-cm-fd-basic", MULTI_QUEUE | COMPUTE_MODE | FD },
>+		{ "multi-queue-cm-fd-userptr", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR },
>+		{ "multi-queue-cm-fd-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | REBIND },
>+		{ "multi-queue-cm-fd-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR |
>+			REBIND },
>+		{ "multi-queue-cm-fd-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | FD |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
>+			USERPTR | INVALIDATE | RACE },
> 		{ NULL },
> 	};
> 	int fd;
>-- 
>2.43.0
>
