Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF86CC25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 17:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AFF10E4C4;
	Wed,  5 Jun 2024 17:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSzmiCZ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F3010E4C4
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717607181; x=1749143181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Yl1RGDs4YTI36xj++dN4oOLgQi3CmTfZsStQvkqo/k=;
 b=KSzmiCZ6LPRFFnCRLudNuy0vLisvXu291Z6MrgzGEBb4Ga1/Z7xzhm87
 g39c9EJFLBb74CzLAUULo6lPIdONkDMw/Omo4CMhZwZnUpOu7IQVL4HTy
 kYQi2VOL0rvKiM1YZ++5h/mDROI3HO/WQ7ZGv1JIlNSU2s8LMOj0uIvvR
 7xpRH5+KEXa5n4mT2bXX50B3+W5OUQDnAi6guvKYjVhaeYdxAkgX/klTt
 eA4ufpmiYj2aogM9v8g4VUBlL213oJw5ARoOion702/j4hio8s2pR/Z/3
 AYGPZF4Z1ar30VjUeH/NQq2D8/fqfD4z6rPFBFJ4F6sZiC+F4UQlpz/yF Q==;
X-CSE-ConnectionGUID: D8KrBW7+TtCHljNhCVNObQ==
X-CSE-MsgGUID: laWVotBESBGcP2pqyaRDmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="17172665"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="17172665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:06:20 -0700
X-CSE-ConnectionGUID: l3HNrM6kTgeatvWysRa9Kw==
X-CSE-MsgGUID: egXhH+uJTuGFn43wAOUHMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="68810287"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 10:06:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 10:06:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 10:06:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 10:06:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 10:06:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8JbhyaYxCkXy3bmQIRElvAcXG1h5lHBn/K6pXXVZudTpmtB/5FAjeidbDRRnhSzGfGrCx5SThPlBXMUhmbUV8LxU8Z5B/aAibha6dpf/E66ab4tnzoX/wcazbSh4C7zH3I1ioVrDKc5xRBIlpRZxnMx975uoKHDBY4J3LF74bSyiEs9bf7jN1n9584+Xs5fK/uAMHJEb1XJUKhRZsJIOwEV/aI8j1WMD9vVexR64eqqktoL2HmyB1m+6qx8hcg3wf4upogY6WwcB/aVgf7fIYRI/AKzFuaD7eNaAJ+K7E2KzTJSH2Flkaw0gPls8cvANlyyiGCQQOUgxl38SR+TVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4HTUby9pxLs4pm/TtSB/PammUnWHbBnGBRjL9qzEaY=;
 b=W72Hy47C+EtJ328QUIcCMN3eo2pgvIah9WlgTUAf1FhJk7ZV8c1LSbVViXAV/V5y2pJtlfyC3++ZCwePact7QurlnOXWOZGiEnTbPiN+XDSUfnIgX35F3UFnWqcwlo0MVeF4Ok6OmHZxU3fPIGbTEq6dbjjAKXiEpx2UaPr2ifnep/4jXtBXZ8P8VMPpFQpMrrhlTHPddjiPsI/T3UkZUUBupmGHDnS2ylAAdW350/YQ+fPBV78bS37DgtOTXNijwnFyWa+N+n/H+ac5lRE1nrYZU7CExdFLfCKCVTzVzfg1lNPqe2WHLm6q6gLLCVfddZKXqgd6jgayQACvde328Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 17:05:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 17:05:59 +0000
Date: Wed, 5 Jun 2024 17:05:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <john.c.harrison@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] lib/xe: Add sync and async
 xe_force_gt_reset options
Message-ID: <ZmCaxdc1soZzUKMz@DUT025-TGLU.fm.intel.com>
References: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
 <20240605163344.2747072-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605163344.2747072-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: d8560bbb-fbd5-47b6-c119-08dc8581c5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ilwl+CEdkqDZs7G0OH9DKESwqVcIKPUuvloH4iGdFpgREs+vtWNgLf2Zu6KF?=
 =?us-ascii?Q?+Hi6IDVDvF76s6ID8pXBoIw8P54zZysJWwX9DSPZHuXNAGL3M257onNo2wss?=
 =?us-ascii?Q?8V4q4wN5JN5YAa8CEcZIypZW3jK+jqFx1vvdDAVCZFlVW0YKGjjt01YGrXI2?=
 =?us-ascii?Q?c7N5dJ8JotLyc/ozNqLGHptqBO5BYKb9E5oOg61BKupPsZ7J/cL7Edj6qcCY?=
 =?us-ascii?Q?hnFbWogK4TOqt1XLuq3DaYDrW6hJO82aCpvctjqFCY9GfqCRTp7uGliX+ouY?=
 =?us-ascii?Q?fkKLOk+NrxuYJGFvYlF4P9lJ3i8wkLo/ugFvC7aRif+JRAIqYk95Ty00bOqA?=
 =?us-ascii?Q?nxpVCqbRmrXQECMOifDdhll4sCmzFbKGTRNsCJVwrwyCn7AApCA4CBudrPF/?=
 =?us-ascii?Q?UH3GNynLEzd+IvC4R3BB9Jg1QvsPCDc3HKCBIXWtytIvPv/DPgl/gjjNe07M?=
 =?us-ascii?Q?nfkhu448nXkE+nOInMfhipf80FO1s4kD+VboyjSUOqgPZPpMuETkQGMFJqXU?=
 =?us-ascii?Q?fvNoadQzDuO+1EeRJogL00SgShT/ByoOKPAMxxUqdX/Eu7i36V2Er2VoTw3Q?=
 =?us-ascii?Q?gfW6mSefHnL6WjaK+zoNueTcrvH1uCOQANjOudjMddFGbOOnt8Qd61VdY28q?=
 =?us-ascii?Q?gvs5pViGDhFqZUZYR6AD4cWn2VgESrZW3QJHhtZeDyZxDYGpp24tSair2qkL?=
 =?us-ascii?Q?ooLQrKSZ7pwAt3dTpD9Zgjb9m9ltfZUxSDNcAJkL5He21iiM8PH4q4tOrM6A?=
 =?us-ascii?Q?am9JqbxfNrJJ1hloSNRPwXo/8jpt6ks+3F6wGbyiaZpwPUiMtb5C1mQNxKRU?=
 =?us-ascii?Q?JTGvabTsFwWavHSYnDDBDFeNUiPSxEqejZNrvgTNBnLg2Yct55v0jsoJbDEh?=
 =?us-ascii?Q?kPpFBdxnq/XxSo9T3E5SWLh2qFnoSBYyi/iAwfBIvLhSbQ6qHIYJCQrNdfhz?=
 =?us-ascii?Q?HjfjEYbQ+8z2I2jOh/qolQFRd15Df+nQ20HIh5MQmHR5fA+cPGK1aHh40Al0?=
 =?us-ascii?Q?h2PiUfN4W0QUTLXWnijORfn6/f8fAXOOFhEiI2SJ6qfBrzWGT7mq/QaRymDQ?=
 =?us-ascii?Q?cP2qfEwj1HD4AWbjfR3dHJ2LW6Kaa47srwbmte7O6DuNVOaIzthVbv9bL810?=
 =?us-ascii?Q?RiJDgJj1KKXJoG5COuCpMgxeQ9fJmpneOTkh5jCS7iSbh3cIxHlS6tPerl/d?=
 =?us-ascii?Q?Nfy/iwu1rrQ8wP9/V9MwXqp04KE1D8+QumOPuyXh0J1hIV7OSTZO6r4Pb1yq?=
 =?us-ascii?Q?5BcmibRTVPpXwGafv8/BtjUfmm9YeCjvhLFm4QuTTSKrw8+I3fNtdV0zpusU?=
 =?us-ascii?Q?g8A94l8tbPXFVZAM2nex10c0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HfpTUJnDNZRR6UwN23SPhc2a50gMAV28otTVTi5labRFKVNl7d/LQ8t4BY+6?=
 =?us-ascii?Q?ldP4VKDf5SJkv3203IBiHoDP6C2JcyoTUyK/EoHQeuDD7rRBNAk21Jsu2hq1?=
 =?us-ascii?Q?JZVEr5JkNefUvid9TjpOT+qnrEzmbjfUi6w7KbjcJkkd4MwIk7V4j2c2BY6I?=
 =?us-ascii?Q?PsBpTXWxeUwrh7x0fy5h+ZimX38pWO5w+cl2tmenCBXw6+TtASPTxmun4btH?=
 =?us-ascii?Q?fNad58NG4pOBrb0ebKg3KqRi6ZQ6+DpUFARSJwkzPbGVbIH3j2ATLmHfOSiP?=
 =?us-ascii?Q?RSuUYiqLtC8pa1G93YigmlqlEAdwcL1SQOYNQdWpw4xgFDHjDKtevMqsluH8?=
 =?us-ascii?Q?gokLda8zgLjFZvkV0hfGeuVaNeEu3tsuo2NYoixOJwgY92g3dvMHHx7Zw9DW?=
 =?us-ascii?Q?ciht1V30slzOEkA2w4wCdbBLvmINObq8PeLZ0eAmIPp93VHuUb9G2fIy0/qA?=
 =?us-ascii?Q?aO2yT7Ol7kLZQOOzD+crsApMWpNSSxVjy8dstGjMadNPVY7Mt6Ri9fOIxLEp?=
 =?us-ascii?Q?PLcnCZeqyWc/UhY3fCyEBvs+UN7PmBhUKAUd8ShjNwjgdfqu/L9DQkdOAlgi?=
 =?us-ascii?Q?OwLrcQk4qOSPw4MK6zyA7pjFXD5jIRZGdGm0xgInuboSMXfkyzDa0BLTYPIb?=
 =?us-ascii?Q?F2FjxYlyLYtBb8+LW4AxnsshYIoH3QjLb+eIGf2ysJ1kA0KT8oF9jKwkU5/y?=
 =?us-ascii?Q?/ce/DmeaHEpTNLJA/TXu2hVAWcyT+6EWH8wLDM1keEkDjzj0gZJ48lw4r68K?=
 =?us-ascii?Q?h5IfYGGXtDek+Dhv9jPQ7Ojl600rAxRk3OgnO1Ecsc6YiFzdnmTJwMeGtisV?=
 =?us-ascii?Q?RJz+2ExCrHAc2gn305keHgU7ob2ZkET/q8YvBgJVIDJLDWjSU6+KRtNhRqIp?=
 =?us-ascii?Q?XJ8xtYaE/KgAZKeMkXfcxbmQOXIoBhlT8HlXST8DOlVEJPhAXDs+LMVykq0g?=
 =?us-ascii?Q?MKHU4MORAA4/iwEDd6B/OO/1LE/TUXLFzG55H6NRnEnJ3459C/gYjMRsLwY+?=
 =?us-ascii?Q?pPTLZWFYds18SzgHwASE3Kg4v/vZs326StHDuPnVif/Z9+ZQpVGg3fXZABDI?=
 =?us-ascii?Q?GMu+VzpDviRer0wRJc6bUQ5Yk0/PpZYskBSEDrrlkqc8RsJb5bBr4N+Ld+AK?=
 =?us-ascii?Q?GpUkdDgt0vkZovSpopuZhlKZs5ZzpbVvpoF3l1SmMDtcyradKaicaXmptneo?=
 =?us-ascii?Q?zaL2nzWX2qwrXm0oGNoi701oLQcEM/99do4cbWCk4pyfJGeQmgw2VhK32Ael?=
 =?us-ascii?Q?OGmWe2X1oLvwvBvUbM/BhihWY1sdkKxekA75e3olVyPLpTuNeVG/NnOhkGiC?=
 =?us-ascii?Q?e8WdoHCLY6qD8S89b2c9j0OVN721RPxM7Dm8N8hWCgMpMQq3kKbUqWTBXPv1?=
 =?us-ascii?Q?rQhH9SaXwNZRhRJWyDPt0LJi/tLZmWey/kwz0AsrdkVuJe3g0vJJ3kou6K6D?=
 =?us-ascii?Q?cWqnEIWOOKD6VmK5QPzzSdxjwPVGm0GqcsvWKGalz1OyTnfqT8pq16LsUM7g?=
 =?us-ascii?Q?nO2KiuNRJP+Ix/9w5/6vnwK8XoAa0EYu19Yuko9RPjQXBzlKpeFdxiRQDdID?=
 =?us-ascii?Q?ZoO7nv0PY3aXiEFdRGCumhah7iS7YrQnadOsH/yuYgKYrZvjJU2zv7+hRnnR?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8560bbb-fbd5-47b6-c119-08dc8581c5c4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:05:59.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZCDTkAOT9WFWXCQHx6F5PXuTh10r+kDA14pVxFK8Ot3GIuPUVfJanv5l+JEWpSqIeNMQ8b1+FntMTEWe0Rf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7821
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

On Wed, Jun 05, 2024 at 09:33:43AM -0700, Jonathan Cavitt wrote:
> Add a new xe_force_gt_reset function, xe_force_gt_reset_sync, renaming
> the original xe_force_gt_reset to xe_force_gt_reset_async.  This allows
> the user to decide whether or not they want to initiate a synchronous or
> asynchronous gt reset.  The asynchronous reset function was otherwise
> unchanged, but the synchronous reset function operates by calling a new
> debugfs function.
> 
> For now, default to using the asynchronous version for all current use
> cases.
> 

Best practices are to add a change log to patches. So here is would be
something like:

v2:
 - Add *async and *sync versions of xe_force_gt_reset (Matthew Brost)

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> ---
>  lib/xe/xe_gt.c              |  2 +-
>  lib/xe/xe_ioctl.c           | 15 ++++++++++++++-
>  lib/xe/xe_ioctl.h           |  3 ++-
>  tests/intel/xe_exec_reset.c |  8 ++++----
>  tests/intel/xe_gt_freq.c    |  2 +-
>  tests/intel/xe_wedged.c     |  2 +-
>  6 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 743d7a26ec..36e8fde363 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -69,7 +69,7 @@ void xe_force_gt_reset_all(int xe_fd)
>  	int gt;
>  
>  	xe_for_each_gt(xe_fd, gt)
> -		xe_force_gt_reset(xe_fd, gt);
> +		xe_force_gt_reset_async(xe_fd, gt);
>  }
>  
>  /**
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 934c877ebc..6e3234cd3d 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -529,7 +529,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	return timeout;
>  }
>  
> -void xe_force_gt_reset(int fd, int gt)
> +void xe_force_gt_reset_async(int fd, int gt)
>  {
>  	char reset_string[128];
>  	struct stat st;
> @@ -541,3 +541,16 @@ void xe_force_gt_reset(int fd, int gt)
>  		 minor(st.st_rdev), gt);
>  	system(reset_string);
>  }
> +
> +void xe_force_gt_reset_sync(int fd, int gt)
> +{
> +	char reset_string[128];
> +	struct stat st;
> +
> +	igt_assert_eq(fstat(fd, &st), 0);
> +
> +	snprintf(reset_string, sizeof(reset_string),
> +		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
> +		 minor(st.st_rdev), gt);

Again another nit, we can have an internal (static) function which
accepts the 'bool sync' argument. The xe_force_gt_reset_sync and
xe_force_gt_reset_async would call with correct argument. This gives use
a single implmentation but hides 'bool sync' argument from the IGT
layers of the code. Make sense?

Matt

> +	system(reset_string);
> +}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 4d08402e0b..b27c0053f0 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -91,6 +91,7 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -void xe_force_gt_reset(int fd, int gt);
> +void xe_force_gt_reset_async(int fd, int gt);
> +void xe_force_gt_reset_sync(int fd, int gt);
>  
>  #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index e47c3730dd..05d63c0ba5 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -239,7 +239,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, gt);
> +		xe_force_gt_reset_async(fd, gt);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -383,7 +383,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, eci->gt_id);
> +		xe_force_gt_reset_async(fd, eci->gt_id);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, eci->gt_id);
> +		xe_force_gt_reset_async(fd, eci->gt_id);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -590,7 +590,7 @@ static void do_resets(struct gt_thread_data *t)
>  	while (!*(t->exit)) {
>  		usleep(250000);	/* 250 ms */
>  		(*t->num_reset)++;
> -		xe_force_gt_reset(t->fd, t->gt);
> +		xe_force_gt_reset_async(t->fd, t->gt);
>  	}
>  }
>  
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index ff99b46a08..d2e4d1a09c 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -324,7 +324,7 @@ static void test_reset(int fd, int gt_id, int cycles)
>  		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
>  			     "Failed after %d good cycles\n", i);
>  
> -		xe_force_gt_reset(fd, gt_id);
> +		xe_force_gt_reset_async(fd, gt_id);
>  
>  		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>  			     "Failed after %d good cycles\n", i);
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index aa4a452bfc..a4fc53869e 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -31,7 +31,7 @@ static void force_wedged(int fd)
>  	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
>  	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
>  
> -	xe_force_gt_reset(fd, 0);
> +	xe_force_gt_reset_async(fd, 0);
>  	sleep(1);
>  }
>  
> -- 
> 2.25.1
> 
