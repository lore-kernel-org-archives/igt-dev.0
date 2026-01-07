Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62FAD0D17C
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 23:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF07A10E11D;
	Wed,  7 Jan 2026 23:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY7bbjD6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAADE10E11D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 23:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767828653; x=1799364653;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UUiADVu+IJZKfFdraDiWzbTiuOI87kz4CtcE4hCZLI0=;
 b=FY7bbjD61NwsrSDAAWtUns/BRmtxDDWdNRvtcf058+5YwJZoxsnOkZzn
 HH7AJmY2LiClo9vsXLinXxui6BKVwqfacwU2ItXpbHem2c9b2myR7L5dH
 OI5ss6AE/TSBlVuhcrOJRg4XOC/1ZiJj2LC5Gj5yNif22wBJNEuzpjcGK
 dCJJN+KDg5y75GVPWwNn3vbLVVDp3opOIpiGYoucKVt+j+wdVkLQHJOWl
 MEJV8yTX/VT4KQsT/q3KVioFfUC60X5H+ZEwHHMp54s/LyYPrIFaQIM9N
 L1BNagypT8tO0EsMjFas+iZo1ucyAZ9Jpvk+lXJ1FkAMC1rvM12x2Xw+F A==;
X-CSE-ConnectionGUID: 4GJcpwfcRZ6Xcgk8gnuK+g==
X-CSE-MsgGUID: aJ/vV7ZhQLSzEGq6+52pUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80567686"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="80567686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 15:30:52 -0800
X-CSE-ConnectionGUID: YSK8QoueR2SPEXac+7T+nA==
X-CSE-MsgGUID: WybDYyZITf+1LJVx3MBDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207530977"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 15:30:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 15:30:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 15:30:52 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 15:30:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZxhdTYYqnMNw3LwmkX0Sgkhnuf2VTb7pF75eh9H4OxVaIzomaG1bGyynB0NpROjeWGAU3gbR0jS0o8/nz5/v/O34DQj2Fx4ejwPRW+kvPPLJuo5iew5Gm2FMUWKvCYywr71gO0kUc2mwHWvn6Dourrn3Df+J1d/9YPIy9PP9VHdO5hJmKBVYbELz3BPHq8pE++op5Wk0/1ZwoGRse1BnsFln9P+ZJj+O/+tvwo7QxWZsN4Yqmpqh+xBuip9J8HfmNbDgCAPRgo3r8baBzprZQ29dRPnrP+4QxRSahpEjsBRV/6q44jgWydCOdcCehdZ3qnM8X58JMlP09AZ/mA9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlWAVecmYv0ByehtZDIb2KnUCsmqMhkzPhTvOGeTmcI=;
 b=NXV7Wt6vIOnxNN6+MGgvYichl9zGfDKETZclRi3hgJIxnLDrefktwNe3Wj23wr0hX4isBFoadBp9O9MX8OOKzObrdwI8YkMVfAGJzafvzVSZRmmyqrbD+vMyOHgfHbsrBlR0ZNAAO3+c64Zn7dVd4KEwxRdXYxsU4S5oCEe898qqCMWHfjA3wYPGw70xUKf7yP6u9j+KfPT5+C2YRtdjghCO1QlnaAfCXrMzn3vpL7Pxfu58VMGtnkW71hmsiz2LOat6JUeZiP9Swc3Kf/jGfLYK6OD2aTeluYowWckf1BVzvCFNBnMGTWbsiomI570fMvHpQZegPUZtaJjwGnrjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 23:30:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 23:30:48 +0000
Date: Wed, 7 Jan 2026 15:30:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jonathan.cavitt@intel.com>
Subject: Re: [i-g-t] tests/intel/xe_ccs: split block-multicopy into 3
 submissions
Message-ID: <20260107233046.GA193218@mdroper-desk1.amr.corp.intel.com>
References: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: BYAPR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 574bc53a-c4bf-4541-73ec-08de4e44ca07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xm5q0N4iNh2PH0s/9n3cUYJxka+rohCW0FNQ8i1C/SgMTkdoN5t+cVTb4/SW?=
 =?us-ascii?Q?ykIj0UiYTjp1KnCGWIx/iSArh72P5OmN7WEzvoHS7I75h1jDPAKk0QkQ1Fdg?=
 =?us-ascii?Q?pU88gj9PItN9x8Vk5g5gp7e/mu938VhJH8CgY9sSe6A9gx/UAAYCi2bBJzVx?=
 =?us-ascii?Q?P0ejtXBfHl8qmza/PHWVcDFwjMp88pQ2bIAMY0yCekq8s7yUHC59Xl98I2Od?=
 =?us-ascii?Q?aWYglMTzjfw3hjr/M8PqXR6ippab7+lWs8kN2cpnqU+OIAU6T2vVixzkKqjh?=
 =?us-ascii?Q?NB9gF/H6uCvZqyRuYlAMtIs5H3ThpIg7tPDEPpjcX1s1xkA68eU0lt+y2T3y?=
 =?us-ascii?Q?7TEXtEu/vVABJG4Pk4FBAsEJIRLZdqSqAQaD4lpjj+ko/7y8HX/O5cORKwlA?=
 =?us-ascii?Q?+58TF7X6d7c7d/t5VmQ/1muL5ewlXKsRAwTZxFaF11VH+vR1hKZc4FuyrFwY?=
 =?us-ascii?Q?1W10XEtMI1eEl4iyhiSEeVY71r5AXLwwdRSC92LduGMZ7vIa00CYpyP4IxgU?=
 =?us-ascii?Q?ACL91/goVAHw5GhofVQ5/Qi6PxKT9UjuRKzmKfgUPmlI3DnykapZqfimwMtc?=
 =?us-ascii?Q?3G7N1lNsunED1FAOEfXnNxzx12j5+8dYXL9onV4QyFohtZUQIo8avkAJIQ6D?=
 =?us-ascii?Q?3mQ3ZHMhWMN5wB47YMu+9pKrUy9scCkfG8dmavZYqkhS1IDrYCfeVkFLQpLU?=
 =?us-ascii?Q?VU2o1lcAMBk6EtxTkn+wxJ0O6ND+wPgEADXqhCCYE7aZrjh+cgBOI8xwWHFA?=
 =?us-ascii?Q?WbUL2em7dl4wqsPZdqi4BHmLU5Pb43r3p667789756fdHezj1mkY9kJWIYfb?=
 =?us-ascii?Q?loQOmBtkUzFbqbEIUzXwlftU5zY6j8vSZiWOICYBsbfk8W2EKUP7MRd0LACM?=
 =?us-ascii?Q?HdlpadCk+GIGWxLQD+gYgVk3PLhvpxq4XFkYu6IJQ5RLhTOlwUY/ZBYksi9L?=
 =?us-ascii?Q?WKf8NWEXCBcROJp7tRuFsUFvWiZFTY5uUo4Ox/XMmaqPtWqcvTKZBqdAlpRC?=
 =?us-ascii?Q?RE0oj39KX82qjqTmbfsPaXkQUWKVQr7AQI+QO3ql0/VemAvfuyk8KvHzwCE0?=
 =?us-ascii?Q?GTjR6csocxHNBjiGF19oe+Fv8OdjO8SEZ9VArUppResJs5jdItAcy/kChyhb?=
 =?us-ascii?Q?3Z2e/9cb983yZ9nr0yeDwI2cxQYGiL4dj54sax5BM94vkM4NmT9ipgoJOil5?=
 =?us-ascii?Q?2DXM+rmCdaCuMS4OCxfmBudxEbESv/lsZGoM2RlWc9rfQuJZo46d9TbQn9EY?=
 =?us-ascii?Q?42rVQ92i8BoO2dqlUzqs+azahbdWH0gxRWjgsbkhe10zzFaR6pMYD2h8Ww/Z?=
 =?us-ascii?Q?tYLdWBzzpzcmErXs17TZ2j3iwNBb+xkG3W3hMshEz0/V90R3ek9lIP/HlRjl?=
 =?us-ascii?Q?mW6rcdfmdMaWAv+BxpCBkcY1qp0Y2LRygextCyMtpdYkuLnQB0/CEk9Kgsv3?=
 =?us-ascii?Q?qVV6Ri+yyA6jvMIfidsus5sjU4hWtScY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rI5vWJr9q133wBxx6AhbxzFCfnbICFoR4y4P+ZHPVhqR+7sQfdOcuyIXnMca?=
 =?us-ascii?Q?vO0x245qGDicK5TXjnps/x4pdqvDc+EpzfktXnvY2p1p7eZKyxFaZ6xWDNiD?=
 =?us-ascii?Q?BBivbnQnOUqRXvddDOiCUUEz08i+lOzdF6OIEJ/9igcy4Gwzb+v+VfJ54prd?=
 =?us-ascii?Q?xRz8P8cSfu7ViHnapF3s/wDEagQbfkdPMr8RW8TVL4SSqvcBY+kmHuAGPEVy?=
 =?us-ascii?Q?qw6pKlkpnlqqKD3EtWVDFlsFi/tuw7Y5nghi1uj+45uKGwFkuGEM1CrJqyk1?=
 =?us-ascii?Q?mbliA7DRE6rcEJ0p/2GQU9KHqKwyYVc7Y6MiGK13jDItCaxb13VTbxZ8RcLv?=
 =?us-ascii?Q?wMGF0s2vjfQKUKQNkzdgyJslx50p/11ZiubZmI0Wf+Z3qCzACUkdA3LwG07M?=
 =?us-ascii?Q?km9ODZKBcKDXkuEtiohIjoTgeiCslY9VnezSGwqc6DXdp41lwlGJ79faYVPq?=
 =?us-ascii?Q?qafJlIh+Gsy3NB135LfqyKbtmRQl7YlHokgMZtYgLt43XZokoCmCCZ0h+JR1?=
 =?us-ascii?Q?b0afpEKmJ2MMJt9yffCFYX4qThj99amskBx+gyZxfUZIgD/KhmjJUpw8cog+?=
 =?us-ascii?Q?OpvxZrsKo1I2usLLSToSVzPup+e4KTylh7XNdmonKoBFYQqbwOBV8YaDPUpE?=
 =?us-ascii?Q?aDTGRL2jirQDuuqwWPuLIxbpSY5MfJkC7gJuBKGdbekniR3JBskqyRmkiy+O?=
 =?us-ascii?Q?70CpJizZbDlEXPshGs/CRJ4PGdNP99sIxiNMiGm3iHHwKPxuvHs+wGt+l6C1?=
 =?us-ascii?Q?RJobt/N0vDp8HnXH2NcLa7SnclGPHMYNatSJtAOTsBk87pTXPRhMGJsM8SOy?=
 =?us-ascii?Q?gByVfIXs6tb30qmL+KrkNnYu23fQ22uRCEwqzOd1Y2N/5+8luUBI5SRsU5Yb?=
 =?us-ascii?Q?zNrCCX+Ptu/AnUgU5k/73Rh/iFFWp6EmhOtRXU3/ZNodvPpO5Ai3+uhPOoAp?=
 =?us-ascii?Q?YequORD4Fts4HTHvAQ1KjweSeom07818YGbDGz1i6tSDB1xUxFypIxPk8+0K?=
 =?us-ascii?Q?GoaSQ9f+P8UGC5VXrnTMgw5f/lfzEhI7qfQCHwMxf+vW18FlPxC5p0qnV8KE?=
 =?us-ascii?Q?hqe3CRSZ/i+kQ5FRN1DeOuBu7D5rPn7iL7LTCT15GAW7ptN+il1yomZG41cD?=
 =?us-ascii?Q?cWnTBGdrhD4oReldMX0U+14rGLqDMRfEYzON8zykjchxeEKGeyvytro6y44M?=
 =?us-ascii?Q?X4wptJ4rzqFXLJWl3TuUsU+EeZDdwKJPecO+iMfjzSWMOyf/j5VFbi8Q6yZI?=
 =?us-ascii?Q?duT0WbC1qrRzvMVEKFCWuZhMMrjQZuHJVuIydDoB6EQCPHyBOBbZvFKHcA3N?=
 =?us-ascii?Q?blWwvM9pqVrKDUjUfO1Lmtn/BTxIamW+ur82RisOvVBRCKbRPU3esnU4sV8G?=
 =?us-ascii?Q?KlaS7Sa2qK/jSGgJmvWRb0eCdRjgZ9IwrM7OVoXA/PJqZeV6hXJcRnFzXq+O?=
 =?us-ascii?Q?ZrJnh98DoMkj1Jg/AFzePLD3noX3BWhxifvw8CZY6X7A9diciN9QBkJqpdq4?=
 =?us-ascii?Q?JKawgHFyLE12rfuVGxHo1bGEoyeypKCl27AyPUG1LoaCTW617NWVRMWMpXQz?=
 =?us-ascii?Q?r/+nKeGQkk7SDgEhPCEZbz46FxDJJTiZdOIJoviofIAAb8K4ySOy+d8FaYUf?=
 =?us-ascii?Q?eWCbN4he4aWqVeRUL/hkOwEZV1TWeuPLBnn83afKPRPj1DxdpI6j2QqsPE9A?=
 =?us-ascii?Q?O/JRcmlhEIbU4XiT5VNYkd3jja5+iCU3Kylau2lpMsVr2B+rSAv4TU4C8Tr2?=
 =?us-ascii?Q?tWjt6creGvmk0saOdTR/72gwsaYIcZc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 574bc53a-c4bf-4541-73ec-08de4e44ca07
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 23:30:48.9059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMc8PcmSi+E9cbAc0Q5lATyrkXp4sYyVoFYGQQX0vAVDhpL/C0Z53sUA/2qwLRDzvE15oGjrPIr/S6KH/Ai5xq5DAjNsujj8OCQ3HNLEGcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
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

On Thu, Jan 08, 2026 at 03:43:29AM +0800, Jagmeet Randhawa wrote:
> Split the block multicopy test into separate batch buffer
> submissions. Submitting multiple block copies within a
> single submission can  result in incorrect ordering between
> stages. Run each copy as it's own submission then wait for
> completion between stages to ensure proper sequencing
> to prevent the read-after-write hazards.

I mentioned this in an offline chat, but wouldn't it be cleaner and more
accurate to insert MI_FLUSH instructions to trigger the necessary stalls
between copies to enforce ordering and clear the RAW hazards?  Breaking
the work into three separate submissions probably winds up working
because we get implicit stalls due to the preamble and postamble
instructions that the KMD inserts into the ring between submissions, but
when there are dependencies and hazards between instructions within a
single context, I think userspace should be able to clear them on its
own by requesting the stalls explicitly.


Matt

> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_ccs.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index a21922ee5..33dde0c1f 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -281,8 +281,6 @@ static int blt_block_copy3(int xe,
>  	struct blt_copy_data blt0;
>  	struct blt_block_copy_data_ext ext0;
>  	uint64_t bb_offset, alignment;
> -	uint64_t bb_pos = 0;
> -	int ret;
>  
>  	igt_assert_f(ahnd, "block-copy3 supports softpin only\n");
>  	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
> @@ -303,7 +301,9 @@ static int blt_block_copy3(int xe,
>  	blt0.print_bb = blt3->print_bb;
>  	ext0.src = ext3->src;
>  	ext0.dst = ext3->mid;
> -	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
> +	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
> +	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
>  
>  	/* Second blit mid -> dst */
>  	blt_copy_init(xe, &blt0);
> @@ -314,7 +314,9 @@ static int blt_block_copy3(int xe,
>  	blt0.print_bb = blt3->print_bb;
>  	ext0.src = ext3->mid;
>  	ext0.dst = ext3->dst;
> -	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
> +	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
> +	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
>  
>  	/* Third blit dst -> final */
>  	blt_copy_init(xe, &blt0);
> @@ -325,11 +327,11 @@ static int blt_block_copy3(int xe,
>  	blt0.print_bb = blt3->print_bb;
>  	ext0.src = ext3->dst;
>  	ext0.dst = ext3->final;
> -	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, true);
> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
>  
>  	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  #define CHECK_MIN_WIDTH 2
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
