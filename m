Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6A4CD042D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 02:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3467D10E050;
	Tue,  6 Jan 2026 02:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejYlQn4O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5205210E050
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 02:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767665446; x=1799201446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wEaZ7e6zgCM6YlvjiiIiUhFgYNaAToGk/N7GZtsYsd0=;
 b=ejYlQn4OCeBrBXlYb2wHZH/9bZkIDYENXME/6kx+He8JgRTtwuZFLrob
 MSHjhfWFWlP+ylXPXG/8ReVpoC3nOoIzXBe2ZnzOtmJF2hgMTaCDH+4Ou
 ggCOG/zct64Zxvk+C+R65dkyWT40nDEYSmBed5FyXpR5YteJa2yaK1PYo
 wNee2vWgn7KiP8SUTJHE2ns75z3Zu+4x9ZxUxXooXvvfA9ZezNDgRGFGN
 fJ5A8nETQmLjZbEAgsM+99lrLAULD5/qW2Xb8oXX3XOp/TjuMXO0hfVwi
 TXnyfJleL/ogu8oQ4fQOcVa/tgDrRpsTvsAbt6Od7/Fguxqw3nffM0Vsn A==;
X-CSE-ConnectionGUID: QGb+J1hDTAecwQ49+nUY2g==
X-CSE-MsgGUID: sz5jLsgjSluXRmWhjOg9RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69109567"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69109567"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:10:46 -0800
X-CSE-ConnectionGUID: SPkI+IlESoKFKRm03Lz5rQ==
X-CSE-MsgGUID: 8ZtvwzIaTZyw9tAkrakTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202434974"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:10:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:10:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 18:10:45 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9RVRPgyw8hoppm1WxW6Rq9uU6d08Hk8Sff5m4TOnxTT2zZ3B7CGgnI+3rZP7bO32lxSlKuZipcuvcJou8loOnoUL7ftPk/0Js75I/L1utAYl1doVJ4kO7NBLTslvw5bOaWeo6q9SzlJSiJBbm642OlFOOgWzCQyde7iolJEvP2cD1qZyXpnoyhx1JXc+NrHpcuIG0TpMxodgSwA4nAYORlj0KUAa9L72vRmKy4h1VjG9j22hf1rnjVGLMEcRPpWnPlLKFaJX+4KRBVE3MT5ILYG1sv6u7LL/rfUQgfm/OQlwFJwLNj71d7Vd2nY2+RYA+duIc3GfGgVbqsNMeK5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3D2Bj2WBKqOuStUyqbEWcZT6uEzzlZ7zDJhEDyafZHI=;
 b=l3LNHiDwwmZ/WGg5C2cykBlSQkYmTYGMG5TQTBggH1vH8n4sHrpwQ9t6e/zNs/OtfxoQWCKx1kGVk3ec/aSpp1jCvCkj7pW8Q+r/v4tN6f6mvLLCUY4hHcnoigKvGGI9/5VkVAqLdUpKxMKIahtdpJG8UiUQO4rncnM40cLtaXtmMQKacfLUCnH3frUCYDJ41+zP709sx7xdNxyJJfvGyLjeY7dNNrm6p1iCWVGN7390pMPIMghK0G9XZNvHDSRaKj5TbM0XuvUo9MahI1xRKBoXZffvvr8ooZnkd7+UtVYxljEL4UvLDRWNidzaSkwWc2Dcw5aWC9FKodPn5zD0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7533.namprd11.prod.outlook.com (2603:10b6:806:306::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 02:10:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 02:10:42 +0000
Date: Mon, 5 Jan 2026 18:10:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <sai.gowtham.ch@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH 1/3] Revert "tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity"
Message-ID: <aVxvILSECMGSmzTZ@lstrano-desk.jf.intel.com>
References: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
 <20260106013018.2851521-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260106013018.2851521-6-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:a03:54::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: d6520d6d-eb26-49da-80e7-08de4cc8cbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cAPUBjeZQbyjKgLv9eGYYe9FJs4hWolAYhoEMaEPfJbe9BKr0YNAoPFSJuRs?=
 =?us-ascii?Q?bE7ecl/7dV4he6+9xCtc3k5WrfT/2FzjExJ2uz3b5HONawSOHUF2hanxuKGN?=
 =?us-ascii?Q?0lYH6AJpkgS8lL6NVj5sTHWGxtoWYJBol+NVYgoXehm0e8Ke4ULvA06IFjUl?=
 =?us-ascii?Q?QYYNpxbmso0mpEFUoqd1z2IuFJdPB/ttAfxY/0OQaeYkmzUjr7Nit6zlPc27?=
 =?us-ascii?Q?qS274lkCM+ab85arVXy67d2jhckaF+blX0OC9fAY1ApCnYffIOd7yaO9uZ5x?=
 =?us-ascii?Q?wWyhvKmUdqdJqdJGfLlnVFmE3AaiAOpyhK8dS5Md9SYBH7xZHDe4QLLfmSzL?=
 =?us-ascii?Q?EcZ2gb/uUFrNiHsXngC6yslDhLVvdMcrJuUpqX+9+gnoDIulW74t4+Da/QNS?=
 =?us-ascii?Q?FSzXVBDGIBzRvobhuFygboNJkz4HWPJI5ktjNB42jm0jndeYsfHiE1o6jSu1?=
 =?us-ascii?Q?Bf1H8HvNk7GmIBKbjv2jerF8KasQF8xIWVg8/TxVFMb66KVtLsFaZf/p3djN?=
 =?us-ascii?Q?KEBjKQ2FactLAd/EKxYH6n9spDnzf8nnuKLqT2nJCxY7qA6RKFxsqxJfvrcq?=
 =?us-ascii?Q?1k80gjnxVsJZCstF35K3JgK54xjoZHMy3RE/HSLoPzlKr1QyUmk1QcnAFZUi?=
 =?us-ascii?Q?R1xpIN+fsBtaYX6vdqeCPK2Wpl6ESrozPQj26UyTNhp8EZDk6gCPuZtFqzKM?=
 =?us-ascii?Q?LbcOmF1RIVgF/nI9h6w/WHwvzVcI4xaSwMwF8JzAyW4d2iQ5X8O5aZ1lggVt?=
 =?us-ascii?Q?mB8x+0i6Atpn93xdvtCjMAeJQ5zAGR2ghGqDXfEq94wUbFyYoaZiU6y0WGPl?=
 =?us-ascii?Q?qnfISFqlOe13V5soKDxO1r1/ERDDRzpHvxJxoxDh9nd4c3oYsxCRflO4Fkyg?=
 =?us-ascii?Q?QBldTJGw254X1IVBm7o+/mrZ+svHSMlZ+I/lcxIdTrycj9qXGNgXP7rU7wz9?=
 =?us-ascii?Q?Qz+3CwRKVmCML8raNPbL332L+DwFqi7nVUANQpLhjgBrvW3Yh9znu0j6AEq7?=
 =?us-ascii?Q?GYH3Cx/3ofgkwi19lQjCEisDJkdqKT3OuFLp2jJPk0clICRLXFJsMo4T/Lpg?=
 =?us-ascii?Q?A1HjatHCBV1rHhbTBWBfHji1W+SVV627Rx+7EQmWUn5X2o3HKAqbExsF2DLy?=
 =?us-ascii?Q?dD5PjgBp8L1A6bKl+VIhBoZ6wvxQClyirqtytVUK4yKltGJ19q3K3MdMlANd?=
 =?us-ascii?Q?yblHeUBlkDTkiXfqjC5753UEa5ZQnWM5Q0g0ksinSEIcdopTnngwRXIHjaEf?=
 =?us-ascii?Q?3pwLqniYywrCvqDQ7N4Q79ibXyw3Rxe19zgpooTyq7CpGvjHi00izCjFSaur?=
 =?us-ascii?Q?MwDJI0Gd3wgTnTb9dwj3VrKR7QMXQwf9jXMT+VYfmEGe0KcOH+pU2d2BnIIb?=
 =?us-ascii?Q?xrFLm6yDSGeCUJ+Enr1ChyDRu8hdqVS8drnf9AnKIvScdGVp/h5ta38RtOBs?=
 =?us-ascii?Q?eKB1EEfjRJRcX0mFA4MG0k/r15np8RBm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WzevQ5V1A66Wg4vyPg8iM/ogoNbwq8IVmCbm1/K8NDoMS+t35PzD27iBXCTj?=
 =?us-ascii?Q?pcj2YUcxtkitJGUMPoM9gcBVlLmNi6js4z+yaIYg3KpSOgf4agJf8t6jzBjm?=
 =?us-ascii?Q?/dNEZHVw5j/Sfa+Zv3fUSwf73Vwlh15Ab78qpWSZS/BdjiYqh01v056i1mfB?=
 =?us-ascii?Q?ihtcyzcHrz/qgAF2zP32sp1Wi6T6kEUtFVlyW9Dn6rMVm9WNWIQ2L6AnaNuc?=
 =?us-ascii?Q?2+NHJxn3pQh1GWY7iMXMmWFeqfk5Bh5k7dQuc1Hs7JAahFw4atpXPbO2x6jf?=
 =?us-ascii?Q?YKgGypS9Sj2YiK4WMfKlFGFxMB6IwUMeB0ui1o4TGPZhG4lhZs/2XjwAnHDe?=
 =?us-ascii?Q?LsdL4y7xCoChYKKyiSLENRwP8fJrmqziTWdcsbFkx5eV/hDAJG9HxiXXh02d?=
 =?us-ascii?Q?GPMXJ0p/lVD6KnDnEhbSpIjmVYg3YJb2YFtr+1UQoVkOo+5AqSVa7UhQ9iF+?=
 =?us-ascii?Q?w8WiRdaadTJ05Qr6UtZ52H4BgABUZ+Y5C+f6WSnqxJgTidGK6LcXTjpDaOFT?=
 =?us-ascii?Q?upNDHFExZnOvWYkwkv8WX9pn9e2I3M6pJuV0llU2vPFoFfg7UNajEMRwFx2m?=
 =?us-ascii?Q?T1AO3CGkbUGTtQSpvghOqnPtdfDTONLwd9sviV5Mo5Y1E80dZHDeFqGkwU6K?=
 =?us-ascii?Q?/GOLdFnDXzBk2mcAikMndTExvHAV6nXxm/3ypnSNBXwB222HeQdecb+igWz8?=
 =?us-ascii?Q?pDAx70dLkEzGp8A/rlzGj+il7+xMVk6o2d0YXccwZbkFcmPa4RytioEUcauK?=
 =?us-ascii?Q?7D4oTZ5yyIfxGFws8C8X5pUcEzTLU35i/xYd4JtZMNArDAk6IsCvQz6QmWRy?=
 =?us-ascii?Q?yJ5VgLTroG3utQ6FJMbVBNUy9p+jyWCHkRyu0TuCOyg8oVpMrIuhGsLyF5Or?=
 =?us-ascii?Q?4sQzTycGKQFWvdGPa2RFrO5X9iD+K9AEJI6c43obz7NbTqgINXQoEXyqeE/B?=
 =?us-ascii?Q?E6GliQPlgLN+EWLzaoHGYxuoK5y68/4EEguMir42GyLVUNp0Yq52GvwBV295?=
 =?us-ascii?Q?ISSc+ku9HGBOYuv9OwvhCyY62ymkPI/JvHsPAGcj5kADmZBhJtFSlRVRh0tu?=
 =?us-ascii?Q?CEMhLqLIx4dZkXCnuvk8gGz4EmS+R7yBySnRN9c7ss3JB+lmtEwcWynMBLmj?=
 =?us-ascii?Q?mELdesYHY2qEZ2J1r4m5Lz6SH3elK+VQWuvmt6cH8g78IHoXa8WcgOp1ZyBz?=
 =?us-ascii?Q?zp2ffIpx4qZ4lhbe/pIDxYP1KHTsdQVQ1TursMpAdtqVfJ2YTGrsj0/7oJY6?=
 =?us-ascii?Q?7ryy/R69mAgiX9t97ptZFIneJvySTxCeVok6DZk8IV42ABxZ9WgDVWpdH104?=
 =?us-ascii?Q?DYVf4o6xHaOmpxZId4fb6ySBuM8B1S/kRHExiyThjEbUcK+mWgE7RAVmASEo?=
 =?us-ascii?Q?A/AzfKkK4qfvqyIsqvu2ExQkXCQoFnADPJwIZBmvoO6fyZWtKuvGidY4osg2?=
 =?us-ascii?Q?q6ZX5OQqEAj+SdEuRdwxCG8xG+RfOApBomslw6GoBYb/VC85t08nMRL9Sn1f?=
 =?us-ascii?Q?XdIFZ3dWio9iDhtJYnph94i9mQLyoHMx1wfc7zzVCUapenWymh13MWgbflS/?=
 =?us-ascii?Q?XvrP8VWb8hrMvZ+ySiXSzYVaoUuzl32IeEQuQLnUsCod1TOzgrpiiUhs6dBs?=
 =?us-ascii?Q?fBH7mBzJkiOKd6QgKgBT6cqn+HRlqgvpGJMmrAyweygwLNy5/LITP4S2CFPj?=
 =?us-ascii?Q?T+osK0a+29iYv+3ZUlr7YM/gPUagTnDQuPXx87L7VA2qLKgXtwVGArO/wmwv?=
 =?us-ascii?Q?0QdvkUjVZzKf/Rn0pZdcH0N8a+jDPxQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6520d6d-eb26-49da-80e7-08de4cc8cbb0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:10:42.8953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zdF4Mzp2/N40ExEmDIIs3hGkVyuxAotS2rW7liMxzKhJK+YgLeZ2zcjW50N2yzqErSDiUdTxgWSt90yFCdacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7533
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

On Mon, Jan 05, 2026 at 05:30:18PM -0800, Niranjana Vishwanathapura wrote:
> This reverts commit 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654.
> 
> The KEEP_ACTIVE feature is being reverted, update exec-sanity test.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>


Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_multi_queue.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index 888e7f1a81..c37aea0a25 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -282,7 +282,6 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
>  	};
>  	uint64_t ext = to_user_pointer(&multi_queue);
>  	bool preempt_mode = flags & PREEMPT_MODE;
> -	bool keep_active = flags & KEEP_ACTIVE;
>  	int i;
>  
>  	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> @@ -294,13 +293,9 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
>  		sync.handle = syncobj_create(fd, 0);
>  	}
>  
> -	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
> +	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>  	bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
>  
> -	if (keep_active)
> -		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
> -
>  	for (i = 0; i < NUM_QUEUES; i++) {
>  		bo[i] = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
>  				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> @@ -348,27 +343,14 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
>  	/* Destroy primary queue */
>  	xe_exec_queue_destroy(fd, exec_queues[0]);
>  
> -	/* Validate submission on secondary queues after destroying the primary */
> +	/* Validate submission on secondary queues fail after destroying the primary */
>  	xe_spin_init_opts(spin[1], .addr = addr[1]);
>  	if (preempt_mode)
>  		sync.addr = addr[1] + (char *)&spin[1]->exec_sync - (char *)spin[1];
>  
>  	exec.exec_queue_id = exec_queues[1];
>  	exec.address = addr[1];
> -
> -	if (keep_active) {
> -		xe_exec(fd, &exec);
> -		xe_spin_wait_started(spin[1]);
> -		xe_spin_end(spin[1]);
> -		if (preempt_mode) {
> -			xe_wait_ufence(fd, &spin[1]->exec_sync, USER_FENCE_VALUE, exec_queues[1], fence_timeout);
> -		} else {
> -			igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> -			syncobj_reset(fd, &sync.handle, 1);
> -		}
> -	} else {
> -		igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
> -	}
> +	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>  
>  	if (preempt_mode)
>  		sync.addr = to_user_pointer(&vm_sync);
> @@ -408,8 +390,6 @@ test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)
>  {
>  	__test_exec_sanity(fd, eci, 0);
>  	__test_exec_sanity(fd, eci, PREEMPT_MODE);
> -	__test_exec_sanity(fd, eci, KEEP_ACTIVE);
> -	__test_exec_sanity(fd, eci, PREEMPT_MODE | KEEP_ACTIVE);
>  }
>  
>  static void
> -- 
> 2.43.0
> 
