Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60360606A31A
	for <igt-dev@archiver.kernel.org>; Sat, 31 Oct 2026 04:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lCKjDBuo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E059510E1BC;
	Sat, 31 Oct 2026 04:03:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD53E10E1AE
 for <igt-dev@lists.freedesktop.org>; Sat, 31 Oct 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793419365; x=1824955365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ThbzHT8wQjb+x0tHQLDkQZ0b9b1t/w3KOaZ3ziCWzaI=;
 b=lCKjDBuoaiZKhCBICNiLwJ6A58R6DenA8Yu9YioC0qzMo8w3QqHOpSC8
 qgDbK9n2m8dH6cktz5E7gtxlPcazSIXmrE6DSapLw8D/8HLE+WTPooj3R
 5PhyUALKGx3Bvb/9JPW8gj7BFrStowFn152/k7J3IPlno92H2JDMeLlPC
 0gRji29Kd0MpXWybXKvK4Gi+ajQsSia+g6KTFw2+xwCRaLIJwgsLHZ3+7
 v06rsY2N0hEObjtZvbwl3K7mfyoA+z+KCDS+zefCyt5Id0xfX2L19ZtiS
 zb5xvmAsuKW6RbzINyiPQiGa2ABEF8Rq6ICKxtF1cocAztm1qnni5gTSM Q==;
X-CSE-ConnectionGUID: GqHDDIEwTH2+OK7BJW57PA==
X-CSE-MsgGUID: nycYNuezQVSM2meRfxEN0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2215830"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2215830"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 21:02:44 -0700
X-CSE-ConnectionGUID: 5AvUfO56SeujJFSrnMbXGg==
X-CSE-MsgGUID: l4/LYbUwTLi6pqO60lsRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5615214"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 21:02:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 21:02:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 21:02:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 21:02:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzkkiPqxhGsuwi6QPG2QFQyvuoL3q6GZRrgU7DKUmdB+a6dFyW8gIEaueZiKuv4nPnKpotWOPPZTJ+HInIacjO8HgJ+sDhHMUODNJ66aYTfiRivBm/hGUqeBdYz8PdU0QK923ezpsIyZUjjjnl2R2Y7Z9yDdsSbwOvlQy0qRN7UdjLp/Ge+Bb0hZQe5hctvv6/ECi/FvWUWzA9SNDcicfSBmYSph/KoXuqGXdgibfqauWUZ6w/RJtuVzR/RhDaiydl7dkMrN0R4qDB4i7EP8/9Yi0ALbibeENfQSwlUQqHlXI6J9hFCud3FpivPxyYHUwOSGfvjAir64V66qQGH0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llcyBfwhRezhk4aIY7UvOCpv75xShuUwBkk2xBm+n90=;
 b=Gj7Y2+mxcBc//34ktLejAclyzvKxnTfvrzIXHBdcmEhUg2SGlUujdnd6ZSE60c5mcpMNS9up4Vp6V/tZi00J8dFLfNI8MGE5NoFoAcnBQWFUSIDEk/YOgFywEXhb6wYtUc+/nryu8psdY/dZNMH+4VTtQCFZkYGSVASknlfZPFN+vEoMY0aET/WEab4Q2MqP0GHvDdSRbIdg8H6txOtjSjlDur7NJVFfgmW4tQzpwJV49gbgmC4MilBFjdyrZYZI24shwr+Gi2KwpjQ9dxbL9PZMP4EF9noza7Y+c6jC10+YZ8KyofaosK5wv1z3fvlokO2nzdNfknzbTRGniAGmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sat, 31 Oct
 2026 04:02:38 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.009; Sat, 31 Oct 2026
 04:02:37 +0000
Date: Fri, 30 Oct 2026 21:02:35 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t, v2] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
Message-ID: <auVoW83HSwsm04qg@nvishwa1-desk>
References: <20261027211541.35132-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261027211541.35132-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: PH8PR15CA0023.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::22) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 138d7d81-15db-4c4a-0303-08df3703cd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|11063799006|261022075727099003|261026140227099003|261028144727099003|261021121427099003|261026121527099003|261022105027099003|10067099003|261021123027099003|261009221227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 0eVRQrQEf18aITgJY0tpKlDIBUnpCBCPrxGfFwP99DMp45cFA+6vjCBVAfXjvgM9zvh01ErOhcwoiw7R6BAqhFI8UriBOIkLRazGbowmX3tWFdtUUoUqP1LNlwzL9/+sNWhGItgdCodqBDWnYPdIOTfYMY8b6ikPCd7BWIjyHsFzbcqlcDh2RemWCbIee9dkP0g5fccpMz1rCUG1gNSHLsRZEmTMy2a7OYJBHl4QGmmmLWC3N8sbauGcZNgvkrdvFUw1Zw4xG3WSO4t1th1vCnQzK8lCcX2A+eanGi0kpb4umFLHEAwcd0r6zDUoSP4F4ooz9LL4C0OztC6DPM1jkVYN0duYksGYXyaAgw77d9cLhcyzDc2v4Y0EQPMzGVy5oLSlKPTZq1UbfYRwvP39WBUjglE+HBjIsKY92EtMdGw2VAESR+JYi0pBmmXop+S65Q6UGnPga0zwBJ8/JitwGtnW3aGJFQjbyzvMNnZv7b0tnQdhDohMhb17Czy/+QqJ7Y6+cx5BG+TFgCjFnJxMLm7ZmK0VAfQeGRtKbva7sg8eWPcP08UMCNcmifvLmzThQLHDSB59mg+Yh7hqBpmlap+OBosf27jYbwxsM9SeU5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261022075727099003)(261026140227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022105027099003)(10067099003)(261021123027099003)(261009221227099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tvgMVropNlMfXv98E8IVfUiULNoZ2hNmXgA6PoxRB20xwLXyXkjJB2rnkTCt?=
 =?us-ascii?Q?voPE7/bSc2+nqmEjqnvrjPqdNoB+z2GQkhcCE0lJGdwbX3F4vV0gf23XCpng?=
 =?us-ascii?Q?pqXGddLTA91htFsp2sATfgpWHTGyaUCX2jPbukVExo/yUbe2tmcKMDaad/zB?=
 =?us-ascii?Q?URrI/NbhJTpJ/S2rXFczDiy1uOxWUBAiiBsgCwDqtxzDGWp2i7vu6wBxQwo6?=
 =?us-ascii?Q?7OvreWJoFat2Mmz3sxZlLfLYkZOz1RLMFToGmZPPMgGcXRdDaThuewTBhhU0?=
 =?us-ascii?Q?kbRjJBXbUXMNGChQ6ybmNSHlxncFuN5KMFOekcteORu+Sh1DN/BOB/xmmtW5?=
 =?us-ascii?Q?JEOTU5xb+mjqvHgUgnqUq4a3qWIhGHM6finlPCDWAnJrt/d5jbIUgnw5lzmY?=
 =?us-ascii?Q?FnMgvv1XNu+YtH2EdqmYIhl28x+L6duClBAdda0D5kwaHO2SJlIi49F2pcAn?=
 =?us-ascii?Q?8XC2cgQDz9RQfKcB17Re549iraoiBHDihOSBYijLupLBg6qDBE0Wb8LUol33?=
 =?us-ascii?Q?onUkAN3Zmk04WTvLqO+K32TjD3gllVKU7taJonlSwekR/2EaMLt5iKx+IG5m?=
 =?us-ascii?Q?oRHWDDcaa3CLR4t7m7mfiPqMWK70Cir/iabUpNq1aLBoiSQwjPLTT9w7HaVC?=
 =?us-ascii?Q?832/txVbwkOm7CNHQYbbNOdzyTZrLYXQS6wg0OVgiyvXGpACJELs6e81a+0k?=
 =?us-ascii?Q?LhtYNeZZNVrXXUPt9EahGH/rhZyF1wemwBPjXQOCrLBP7TxfvyZCcgJwwsQG?=
 =?us-ascii?Q?cXotBdvEAyH34lJVF+Lb7aidvgm4qUMj9hfdRHFbaYFyJdp7kM1ty4z3XpZ0?=
 =?us-ascii?Q?3HB2rdDDZaSdbW2LIdx08JrqSXoq1YIcdF5N9zFmQB9O1Nb1mAmc3pEbFuKL?=
 =?us-ascii?Q?9W4WbPvWmKO5oR44Q481b0HkIHXh36o8VGdc9P0l8deIN8KOFS7WznT/57WG?=
 =?us-ascii?Q?tyS0CqKgzLimWo/3BPo6phm6YjvmUnWMelJm+M80PM4qGka0DNZJibvewO6G?=
 =?us-ascii?Q?scfkcyrHkLx6Ww+95KtbiII4n1fxxCag2P8dssVITQNOi8uDJq8A9o6sHykB?=
 =?us-ascii?Q?bzRTnhHYYxHZvSNTASa91gVtKmCeesOPypvaWL4rT54zvxrRzPcgtkSZ9A0U?=
 =?us-ascii?Q?CwqAnd5SiJtHFFvGMR1zzJS6lslnUoaUNxpIrN+KTklAG2w07T2xQ0cfcJhm?=
 =?us-ascii?Q?XOEzalxqKZlNPrWvI3T4NwZdSaYFil5x+aICHmIXJi26xpK44CAyQWSaBryO?=
 =?us-ascii?Q?bnZF1EyS5G0SMaI5H3VD12IHQ/JEepxFKf7l3fGst9TJmU+gyqW6W07DDKN+?=
 =?us-ascii?Q?//oUDbQoLm+kQJi0SlVpDvJDji/MoyGxWx4cj+09byYT8dTeQVsNl/RKpHCC?=
 =?us-ascii?Q?ZNWWrNIIOSDkwLy6G4MR6YvZJEiJSEmrRRPuNaw9VXmjdqL6LyDJqHiMndmp?=
 =?us-ascii?Q?SsTsKAZix9mB0hw+B8NJbwMLij1UvJwTwxSvuxBjQ2XSA6KIePVPmbEiVrRA?=
 =?us-ascii?Q?atTRE+2ypZL8JdaIwxEC5iG/IynNWPjPa2AsvT4UNx/J4zLlXZppXxsvAci7?=
 =?us-ascii?Q?wEom8SALbC1Y0PMxrkpX3N7ACqJOOcJcgDKppGZjR20YM7zH2MR2WuzRZBrX?=
 =?us-ascii?Q?u+GcyDGGLcGfEJ/Tx4pKCf8Ac54dFvsL7OwYxaYEpfIhZ30YWw40qPMnM8dZ?=
 =?us-ascii?Q?Oq44KWDxENKjysT5JIf9dyErCKOMADV0kJ/4x5Kn/EApn1oZfNFzer6nCWnr?=
 =?us-ascii?Q?Uuq3m28MLCAmRlzn74Zw3xQAdp3SZFEpnsv6gR5D/y2kNDAAgZUJ?=
X-Exchange-RoutingPolicyChecked: PjURVKdhCt+eTeRyNsbm3ZFK01qXr3olT0neX6+t5hEOoPRjmQDbKFvhrfeVD2tGA2/GH839DRyoXb9ynmQmFOIfI471PoAcuobqQfxRdWchq2x1u0m37r4XqL+nlLKQuiwxZyZhQ96kCXDeJYhdWArMI51lJu7XYIDVJU3boI/GPArAqfKA7P5H/oHYbZ/dPuGeM3SGHzFD+XrZBbyFyqcDp+fIWOhVzdCREVedXh+0+KmiG8dvGp3rr2TV3xW7SRCd+reN85OZ/Qb1Z9oHLjTypqn4eCTfmM6Cf4w+bxUX1SNtUpoRrBE/sSt1qTaVJNAghO6U6zU7V26chduY4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 138d7d81-15db-4c4a-0303-08df3703cd21
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 04:02:37.7953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bs+KlBKbUUmkRRzB5LqfT4Z5sP8oJ02ehjXrIqbvRj4y64mXtwp1zIAdw756ig1LIh44UhuBKGx4MX3zLMrKGWdHaWx3L06FmgQEGncbTiosr5G/dH9ECLlLg+Kef1oz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:15:41PM +0000, Jagmeet Randhawa wrote:
>Add coverage for the replay paths introduced by "drm/xe/multi_queue: Handle
>lost message during VF migration":
>https://patchwork.freedesktop.org/series/165324/
>
>A CGP_SYNC message can be lost during VF migration and is replayed by the
>KMD on recovery. Exercising that needs a CGP_SYNC queued or outstanding on
>a live multi-queue group when the migration lands.
>
>A group serialises on one outstanding sync, so both CGP sources are needed:
>queue creation for registration updates, MULTI_QUEUE_PRIORITY for dynamic
>ones.
>
>Add MQ_PRIORITY to issue a short burst of priority updates after each exec,
>alternating the values since the KMD ignores a set to the current value.
>
>Add MQ_SOLO_CHURN, which gives every queue its own group, so destroying a
>queue tears its group down and the recreate issues a fresh registration
>sync. A secondary cannot be replaced within a live group, so this is the
>only layout that is safe to churn.
>
>Add MQ_MANY_GROUPS, which spreads the queues over several full size groups
>registering in parallel, widening the window where one queue's sync is
>still outstanding while another queue waits on it.
>
>Add four subtests from these sources and an optional repeat_secs to repeat
>them under igt_until_timeout() with a bounded wall clock. The combined
>groups and priority subtest runs a single thread per engine: more threads
>there make a dynamic update wait behind enough registrations to exceed the
>KMD sync timeout, which bans the group instead of leaving the update to be
>replayed.
>
>v2:
> - Drop the secondary churn. A secondary cannot be replaced within a live
>   group, so MANY_QUEUES is no longer combined with MULTI_QUEUE and
>   MQ_CHURN_INTERVAL is gone.
> - Add MQ_SOLO_CHURN: churn now happens on solo groups, where destroying
>   the queue tears down the group and the recreate registers afresh.
> - Add MQ_MANY_GROUPS to register several full size groups in parallel.
> - Add the combined multi-queue-groups-priority subtest, so a dynamic
>   update can queue behind an outstanding registration sync.
> - Rename the subtests to match the new layouts.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> tests/intel/xe_exec_threads.c | 170 +++++++++++++++++++++++++++-------
> 1 file changed, 136 insertions(+), 34 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 2974fc312..c228469e2 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -31,7 +31,7 @@
> #include "xe/xe_spin.h"
> #include <string.h>
>
>-#define MAX_N_EXEC_QUEUES	16
>+#define MAX_N_EXEC_QUEUES	512
> #define USERPTR		(0x1 << 0)
> #define REBIND		(0x1 << 1)
> #define INVALIDATE	(0x1 << 2)
>@@ -49,6 +49,32 @@
> #define MANY_QUEUES	(0x1 << 14)
> #define MULTI_QUEUE		(0x1 << 15)
> #define WQ_STRESS		(0x1 << 16)
>+#define MQ_SOLO_CHURN		(0x1 << 17)
>+#define MQ_MANY_GROUPS		(0x1 << 18)
>+#define MQ_PRIORITY		(0x1 << 19)

Use 'MULTI_QUEUE' prefix instead of 'MQ' here and blow, as that is
the standard being followed.
Rename MQ_SLOLO_CHURN to MUTLI_QUEUE_PRIMARY_ONLY.
I don't think we need MQ_MANY_GROUPS, see below.

>+
>+/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
>+#define MQ_GROUP_SIZE		64
>+
>+/* Queues used by MQ_MANY_GROUPS, enough to span several full groups. */
>+#define MQ_MANY_GROUPS_QUEUES	(8 * MQ_GROUP_SIZE)
>+
>+/*
>+ * Multi-queue priority updates issued per exec. The values must alternate:
>+ * the KMD ignores a priority set to its current value, so a constant value
>+ * would generate no CGP_SYNC traffic at all.
>+ */
>+#define MQ_PRIORITY_BURST	8
>+
>+/* Wall clock budget for the CGP_SYNC replay subtests. */
>+#define CGP_REPEAT_SEC		5
>+
>+/*
>+ * Worker threads per engine for the registration subtests. Several groups
>+ * concurrently widens the window where one queue's CGP_SYNC is still
>+ * outstanding while another queue waits on it.
>+ */
>+#define MQ_THREADS_PER_ENGINE	8
>
> /*
>  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
>@@ -610,6 +636,24 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	}
> }
>
>+/*
>+ * Group membership for the queue at @i. A secondary cannot be replaced
>+ * within a live group, so only the solo layout is safe to churn: there
>+ * destroying the queue tears down the whole group.
>+ */
>+static uint64_t mq_group_value(unsigned int flags, uint32_t *exec_queues, int i)
>+{
>+	if (flags & MQ_SOLO_CHURN)
>+		return DRM_XE_MULTI_GROUP_CREATE;
>+
>+	if (flags & MQ_MANY_GROUPS)
>+		return i % MQ_GROUP_SIZE ?
>+		       exec_queues[(i / MQ_GROUP_SIZE) * MQ_GROUP_SIZE] :
>+		       DRM_XE_MULTI_GROUP_CREATE;
>+
>+	return i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;

I won't think we need MQ_MANY_GROUPS.
The maximum multi-queue group size is 64. So, if n_exec_queues is more than that,
then we have to automatically use many groups.

>+}
>+
> static void
> test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
>@@ -686,7 +730,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			multi_queue.value = mq_group_value(flags, exec_queues, i);
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> 		} else {
> 			if (!(flags & MANY_QUEUES))
>@@ -727,13 +771,32 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		if ((flags & WQ_STRESS) && atomic_load(&wq_stress_hang_detected))
> 			goto wq_stress_cleanup;
>
>-		if (flags & MANY_QUEUES) {
>+		if (flags & (MANY_QUEUES | MQ_SOLO_CHURN)) {
> 			if (exec_queues[e]) {
>-				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
>-							INT64_MAX, 0, NULL));
>+				/*
>+				 * Multi-queue creates every queue up front, so a
>+				 * slot can still be unused on its first visit and
>+				 * its syncobj would never signal.
>+				 */
>+				if (i >= n_exec_queues)
>+					igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
>+								INT64_MAX, 0, NULL));

In multi-queue case also, we can don't need to allocate everything upfront.
It is just that we can't destroy a secondary queue.
So, we can simplify this code as follows
- Pass MANY_QUEUES flag in the new subtests if we need to destroy and recreate queues.
Ensure in threads() function that when MULTI_QUEUE is set, MANY_QUEUES can only be set
if MQ_SOLO_CHURN is also set.
- Keep the condition here 'if (flags & MANY_QUEUES)' only.
- See below.

> 				xe_exec_queue_destroy(fd, exec_queues[e]);
> 			}
>-			exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
>+			if (flags & MQ_SOLO_CHURN) {
>+				struct drm_xe_ext_set_property multi_queue = {
>+					.base.next_extension = 0,
>+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+					.value = DRM_XE_MULTI_GROUP_CREATE,
>+				};
>+
>+				exec_queues[e] =
>+					xe_exec_queue_create(fd, vm, eci,
>+							     to_user_pointer(&multi_queue));
>+			} else {
>+				exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
>+			}

If we define mutli_queue extension structure once at the top, logic here can be simplified.
Like only 'ext' field passed to xe_exec_queue_create() will be different here.

> 		}
>
> 		if (flags & HANG && e == hang_exec_queue && i == e) {
>@@ -770,6 +833,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 			xe_exec(fd, &exec);
> 		}
>
>+		if (flags & MQ_PRIORITY) {
>+			uint32_t prop =
>+				DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
>+			int z;
>+
>+			for (z = 0; z < MQ_PRIORITY_BURST; z++)
>+				xe_exec_queue_set_property(fd, exec_queues[e],
>+							   prop, z & 1);
>+		}
>+
> 		if (flags & REBIND && i && !(i & 0x1f)) {
> 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> 					   0, addr, bo_size,
>@@ -1213,6 +1286,14 @@ static void *thread(void *data)
>  * arg[1]:
>  * @multi-queue-basic:
>  *	multi-queue basic
>+ * @multi-queue-solo-churn:
>+ *	multi-queue solo churn
>+ * @multi-queue-many-groups:
>+ *	multi-queue many groups
>+ * @multi-queue-priority:
>+ *	multi-queue priority
>+ * @multi-queue-groups-priority:
>+ *	multi-queue groups priority
>  * @multi-queue-userptr:
>  *	multi-queue userptr
>  * @multi-queue-rebind:
>@@ -1337,7 +1418,10 @@ static void threads(int fd, int flags)
> 	uint64_t userptr = 0x00007000eadbe000;
> 	pthread_mutex_t mutex;
> 	pthread_cond_t cond;
>-	int n_engines = 0, class;
>+	int n_engines = 0, class, t;
>+	/* Extra threads only where there is no dynamic traffic to starve. */
>+	int mq_threads = ((flags & MQ_MANY_GROUPS) &&
>+			  !(flags & MQ_PRIORITY)) ? MQ_THREADS_PER_ENGINE : 1;

Update thread() function to accept num_threads_per_engine instead. See below.

> 	uint64_t i = 0;
> 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
> 	bool go = false;
>@@ -1360,7 +1444,7 @@ static void threads(int fd, int flags)
> 			}
> 	}
>
>-	threads_data = calloc(n_engines, sizeof(*threads_data));
>+	threads_data = calloc(n_engines * mq_threads, sizeof(*threads_data));
> 	igt_assert(threads_data);
>
> 	pthread_mutex_init(&mutex, 0);
>@@ -1373,34 +1457,39 @@ static void threads(int fd, int flags)
> 					       0);
> 	}
>
>-	xe_for_each_engine(fd, hwe) {
>-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>-			continue;
>-		threads_data[i].mutex = &mutex;
>-		threads_data[i].cond = &cond;
>+	for (t = 0; t < mq_threads; t++) {
>+		xe_for_each_engine(fd, hwe) {
>+			if ((flags & MULTI_QUEUE) &&
>+			    !xe_engine_class_supports_multi_queue(fd,
>+								  hwe->engine_class))
>+				continue;
>+			threads_data[i].mutex = &mutex;
>+			threads_data[i].cond = &cond;
> #define ADDRESS_SHIFT	39
>-		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>-		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>-		threads_data[i].fd = fd;
>-		threads_data[i].vm_legacy_mode = vm_legacy_mode;
>-		threads_data[i].vm_compute_mode = vm_compute_mode;
>-		threads_data[i].eci = hwe;
>+			threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>+			threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>+			threads_data[i].fd = fd;
>+			threads_data[i].vm_legacy_mode = vm_legacy_mode;
>+			threads_data[i].vm_compute_mode = vm_compute_mode;
>+			threads_data[i].eci = hwe;
> #define N_EXEC_QUEUE	16
>-		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>+			threads_data[i].n_exec_queue = (flags & MQ_MANY_GROUPS) ?
>+				MQ_MANY_GROUPS_QUEUES : N_EXEC_QUEUE;

If we want dynamic value settings, then should first update the function
to accept the value from the caller and use it instead of trying to determine
the value from the flags.

In a preliminary patch, update the thread() function to accept values like
num_threads_per_engine and n_exec_queues with existing callers passing values
1 and 16 respectively.
Then in the subsequent patch with these new multi-queue subtests, you can pass
other values as needed by each new subtest.

> #define N_EXEC		1024
>-		threads_data[i].n_exec = N_EXEC;
>-		threads_data[i].flags = flags;
>-		if (flags & MIXED_MODE) {
>-			threads_data[i].flags &= ~MIXED_MODE;
>-			if (i & 1)
>-				threads_data[i].flags |= COMPUTE_MODE;
>-		}
>-		threads_data[i].go = &go;
>+			threads_data[i].n_exec = N_EXEC;
>+			threads_data[i].flags = flags;
>+			if (flags & MIXED_MODE) {
>+				threads_data[i].flags &= ~MIXED_MODE;
>+				if (i & 1)
>+					threads_data[i].flags |= COMPUTE_MODE;
>+			}
>+			threads_data[i].go = &go;
>
>-		++n_threads;
>-		pthread_create(&threads_data[i].thread, 0, thread,
>-			       &threads_data[i]);
>-		++i;
>+			++n_threads;
>+			pthread_create(&threads_data[i].thread, 0, thread,
>+				       &threads_data[i]);
>+			++i;
>+		}
> 	}
>
> 	if (flags & BALANCER) {
>@@ -1457,7 +1546,7 @@ static void threads(int fd, int flags)
> 	pthread_cond_broadcast(&cond);
> 	pthread_mutex_unlock(&mutex);
>
>-	for (i = 0; i < n_engines; ++i)
>+	for (i = 0; i < n_engines * mq_threads; ++i)
> 		pthread_join(threads_data[i].thread, NULL);
>
> 	if (vm_legacy_mode)
>@@ -1483,6 +1572,7 @@ int igt_main()
> 	const struct section {
> 		const char *name;
> 		unsigned int flags;
>+		unsigned int repeat_secs;
> 	} sections[] = {
> 		{ "basic", 0 },
> 		{ "many-queues", MANY_QUEUES },
>@@ -1729,6 +1819,14 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
> 			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-solo-churn", MULTI_QUEUE | MQ_SOLO_CHURN,
>+			CGP_REPEAT_SEC },
>+		{ "multi-queue-many-groups", MULTI_QUEUE | MQ_MANY_GROUPS,
>+			CGP_REPEAT_SEC },
>+		{ "multi-queue-priority", MULTI_QUEUE | MQ_PRIORITY,
>+			CGP_REPEAT_SEC },
>+		{ "multi-queue-groups-priority", MULTI_QUEUE | MQ_MANY_GROUPS |
>+			MQ_PRIORITY, CGP_REPEAT_SEC },

Do we need all 4 tests to create those 4 scenarios?

Niranjana

> 		{ NULL },
> 	};
> 	int fd;
>@@ -1748,7 +1846,11 @@ int igt_main()
> 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> 				ignore_multi_queue_hang_warnings_in_dmesg();
>
>-			threads(fd, s->flags);
>+			if (s->repeat_secs)
>+				igt_until_timeout(s->repeat_secs)
>+					threads(fd, s->flags);
>+			else
>+				threads(fd, s->flags);
> 		}
> 	}
>
>-- 
>2.53.0
>
