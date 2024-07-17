Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE53C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 13:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04DE10E111;
	Wed, 17 Jul 2024 13:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4LxnCB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4372610E111
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224432; x=1752760432;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HMrvhE9P2fLwBzYzn0YU/txgYToEBuCdJxpDikcrWNc=;
 b=Z4LxnCB7/AWQZzLmufnl9uVvGYZ0tu+bxKqjLCwZKL4gUlfEbi105jL7
 dMJIAxzqmbA6McEzXXlQ19q+SDxvhVy7SAOhXyl6avjCXqM1Ld+iGeuIn
 DRIk9gKi7hCnZQ00oRir/sQBQjqeN42m/BC0zs0ZEjtg9qADMxSfNsfj/
 un8s6P9YgK2oKP85RHjBkGxYUFdonnysoS6aQw6vO58zrQoX63kiqKi1y
 tL3B9wInRlITdYZ3FcX/UWLbkEmwl19xJ/NghnI3gE2nG2CJBfjDfa5Zw
 rPChLXUdESkOQxxF7Zfe5muQlvd5SCdVKHaEKEzmgQ0wV7h3ievB8kVIu Q==;
X-CSE-ConnectionGUID: ekb6ZUcNTayU6cYaco7Jgg==
X-CSE-MsgGUID: yNhUm18mR2iwpdWvt0+BrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="21633680"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="21633680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:53:51 -0700
X-CSE-ConnectionGUID: Z6Hh3thXTIW7Db06476UjA==
X-CSE-MsgGUID: IuoVdJ1zS/yzVbdjoGh19w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54723570"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 06:53:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 06:53:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 06:53:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 06:53:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 06:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfaZXvKhiX4ABC7SE55QIQO7EcvpcrErgThHQvSv9jDjaRoXi8ImBIjmqF/LNBUZA5K87ge6ZqvjrlXgKAb35Ws1QqnIq5ou1Sos7lMhxu6qYQKzT3IitTR64b0qx/0Bc+J5cu85OIx9SgHvEBcAfeOjNk322RvYXBSXZXbkw9AJbNZLiY9+C7+EA4Q/UrKh0/SX5RsET47DeNzRX6/bb88x/58gje7/3TIHtfQNQsfxxvn3Au3De87yT3+HE3A4JOroX4RobsUXotw5G0Q0r4lvfCITFDfWs/x1Sfqtt1I8zg7/CFMOYUQldGOPvrQpuuGjBcvQ2+Qu7UnCu/ZRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7+2QCphxURMu/JS3uZFU7f1MDxxBFbgZ5+koECPyTo=;
 b=E/TthrytsGMsjznGX/d/uQ/SZA4WCXacKEQ1ePVZZ4mGhS/E0LtOJI1aW2sUyqLHCQhH04/0GTC1ZeRnQelTWxqtHQRao9bgz7RBYZLksorJnOfBb8Wuv1YLQ9MdxUrHaXbM0hM5ghTPk+HQHshFp29NLLf0J39sOLa8JYELkRdEDzyAt5EFUF1SnXI3ciRw33dYCVCytlJ+49pX49VLmIN+gXpd7/VoFCs0Beq6nQDc420o9eHHLDOf2/xt6regtyNtgQW/DUmsskK7I3Rqv8U8oPpkBE2aMt7yn9sI8Hn5U92zvANGNnTqh7yiGH8n5cCopiqTZjTQ2vz6vRByzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 13:53:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 13:53:44 +0000
Date: Wed, 17 Jul 2024 13:52:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/xe: Add test waiting for ufence signaling
Message-ID: <ZpfMtkGAOo9FMOpX@DUT025-TGLU.fm.intel.com>
References: <20240717122302.192806-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717122302.192806-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:a03:117::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: ea456f29-3e7c-4c13-3ca4-08dca667df78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H36sE1sLhESV7ZmabrmgwLfg0kPDkn1GKyss7YLE44U5UtDW/pYL5aov48uJ?=
 =?us-ascii?Q?Pa/pGdS0zxP+kpIAeU4UlRr2XzsbsC6mBexIeE5eDxTU7/hryHBklUm0L0yJ?=
 =?us-ascii?Q?OiONucvOO3BK7ZXwkZ74KJ3uudFSuH4kv65ET0iCNe5rMPZim/1zqDKbTSOe?=
 =?us-ascii?Q?a7oEj2yUohCOTr5+fkP0Yt7OyTAG6jXyn557wB0VzjSK8Y/A592ABfnGXQtl?=
 =?us-ascii?Q?6alZozDg2yJhCQfZLsXSJbVKc+IYc0r+K8vFUYr7uL4SWF74QXYSLqoKQ9+p?=
 =?us-ascii?Q?LAekvg3EfTghtPdPzgwA39G1EntlwwxW4Q23/wy3IQCyh4KAXrHJWXD8ibiY?=
 =?us-ascii?Q?Fe7anBf0fs60A5TI3PoOMya08IAY++lc1Ca+F/uGcJWI9pJiFnuuYf677lDl?=
 =?us-ascii?Q?0mIIlvwq6dP0NQTk9XPgtsX+OAQVmw40rfICjnt3ZVxWic7nvrHOYu6xedPV?=
 =?us-ascii?Q?wT2WEGqM2oj+Fp6l1OpyJ/B1qK/gB92OZflBzUr3QYkCMtLEbL+QQmnWzZpo?=
 =?us-ascii?Q?ZxMI4z7hQLGBH0TSYSKrb9BqLqjD52nhNmCK85MkUijvFZMmvXfCUrVTzNOi?=
 =?us-ascii?Q?WZ2bgrzY0hD6D9pUDCmAqOmgUX5mnaOWR4FCZJtC/SvOJstDyGw2fu5HYs72?=
 =?us-ascii?Q?9pXB0Zy7TJynMgWJN3q52RRgjzhX+mcvrpuMRjy1L2vSrlghKk58XncCKjkG?=
 =?us-ascii?Q?blYPIZBK9q0H9C86DgCCATrkMrmhLYjkWls62m/4XIZW27CGFojsuyxnT0W/?=
 =?us-ascii?Q?QEVxptP9wD7YjA7av02gXYEjRpturnVMpq1Laup964XrbRW9tqmIQWkneoHM?=
 =?us-ascii?Q?NqK9G42wQ4M6H4ryf3ZtW01+lRaf4NQVp4kl1WLTKOoX7FRPNFr6PT1H5GB4?=
 =?us-ascii?Q?MTR6qEqbMKkTAZcp6rTjsaphpFBpE7DeaFuLirbO8X5VmOuZj7LMKZR1VaCw?=
 =?us-ascii?Q?MoJxxppWT+Q5IN1mOm6k+lwDT2Ru2uzRwrRMKxuo33q1dUueugnQL5Tv/NTt?=
 =?us-ascii?Q?vc0fXIYGAK61DeH7xVi4DwPrKP1HQRfO3VTXEH6xOtdZo+HeGPavElxHhDCi?=
 =?us-ascii?Q?BaI4aKPiPkY2bR2bLhk2Dr89Cw9PoflRdGIcGZS5sEAvlWwgDfk/q81FJlTs?=
 =?us-ascii?Q?+Vbv4hVPc6O+lYkuiiqrmxbSjy/PcbP8wS1WX7op7fKoWxKxX3xW8PzD0ABF?=
 =?us-ascii?Q?lYxUhpFFQmQBNNQ9V3MQrtLaXQmzyjtLPXd04j4dqDRtOw76wY5bE3bUB6Z4?=
 =?us-ascii?Q?KD53SHEwCt1Ywpo3JIJaVFCurRpPgcS7qdTpPJ7jsrz3z8FPZXbdvX8t25zc?=
 =?us-ascii?Q?aUdZDnAWWY1bMr5YqSQsqixMoxK8ODu+byyoND6hdzTQ+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RSFFEZ7m3mIuD/LF2QL8qsT/5crYWeBziZ8DpYgeVHq6/XEEEJin7hMBGm33?=
 =?us-ascii?Q?sIsRq/2ohE3qPLobwXrNm2kK9sWH6MlzUrZ3zjPQ0cQONhAVrZnDPjisDHKq?=
 =?us-ascii?Q?xDnkMGs6u3Gta3DjjfbGdAZnz5HRFGqgMGfzCuwHh9wiTaFixhQ49ywvDaeN?=
 =?us-ascii?Q?fR9KVscxpVYnxfV7KsNTbarLCdJqW07aSbJ+/O9bnWNpEEMpfg5BVCD2YYfC?=
 =?us-ascii?Q?Rzds8FeD5nQ5KNivFd8MoigcLMFCGgF+Z4GOw+IgW7cqNbrHER1RLrcK64Oh?=
 =?us-ascii?Q?v64ZC9vlwFbK2Oqn3SjaOoYb2GF8loiFtUwsyB2/s9TlA4CRQIvK5wZmdBvT?=
 =?us-ascii?Q?CyJRgOWwDlL/hom1bzqjD0Ddcl48xg+dKbuYDCUOw1P9p8PSkmU5y8iKtkkB?=
 =?us-ascii?Q?MjXfYSIUKCZCpLcZyEY2MTRSddWw1RwM2G0gDz7xiO9a3Lufh/C563QwAi9L?=
 =?us-ascii?Q?H9nY16W7PRfiY6zakW1B2iWkOWNS7DwQkPob3qQ2ME/PCYgJFzozMs7HdIpi?=
 =?us-ascii?Q?9Qughup4nBvR5f3iK9EHh6Jp7WVa0OnN14kx3Rpv77/X5mFH/0ofxiLXDF/C?=
 =?us-ascii?Q?g3CTTr/je4ng+4WsxTnh8uvtssynJBtliRkUWObsFfp+IV46yHj05vc30t7s?=
 =?us-ascii?Q?QF2vBUJqeP0yyb1AIGBV/uhAB4+Z/t0bS9qHV9tsUexxy7B4d/ZVOJ4ScOhJ?=
 =?us-ascii?Q?jDzr1VeX6b7Z2988OxqvfnCkLX2JBOSmUqq8WPZqTS2FowDc5N7cjMoR68JI?=
 =?us-ascii?Q?z2ies8NdhHjqWPxVeaPisytQivSACcZEwia6sPo0xqeUliTQerKRgQmHah1Q?=
 =?us-ascii?Q?Ju5UqueyC2GLDRo4DA+buUzrt/8OF1ufT9WwMtkFg/iQ/HThrp0H4BS//RUU?=
 =?us-ascii?Q?46cmh7y0E2IdI9hO12g+n6FiC9NmXlViSykkfBaXncGkRjg0VOmVS8qLV/MK?=
 =?us-ascii?Q?RFr1uE0U+7/HIesR6A8FzpsebJd/apfaqccb77N/CbuZrCHe3kI5S/jFVvf0?=
 =?us-ascii?Q?oDg+PL1Hd1KxxunNAOv2q1xtNbRSIxC9isSUEhnOC5MzDRc458bXXqdOO8OM?=
 =?us-ascii?Q?qBr9GQf7ueRLjZnAjk5EHAKKr4WNE2v/CnW+BZBWmb2xMixNuauqPRNHue0m?=
 =?us-ascii?Q?eHremAoh0l9szO7llpmX9jeRTC9kDGR2Xkc3xMb3FD2LhBhs8jXv5GUoWr34?=
 =?us-ascii?Q?9sYEBL/ieWLtG2ffssJ0Wv273h15keVcK8RkESnyGu+8J/E4B0NljZWiQ5jH?=
 =?us-ascii?Q?RLSxKA9r69dqFj96j5c2mGKuv2XBT8/1qz2sWWMCn7L3ue0VBKOJVbze9yjN?=
 =?us-ascii?Q?s89DbdVQEzFF1Ijerjx96EA8q3Etqbro8qhyrsQAQyA/WPjcBXIr9a/uhD+Y?=
 =?us-ascii?Q?UJ+6V9ITidflD8BLpzB7GkTxs6DhqweiMphgRvnhOT9juU8g+x9C4GfdWO+D?=
 =?us-ascii?Q?N+mpGoIvenkUFrtJDIK42jQbBdkuNYjmIjGoKDWcLmProhPw09B2bH8zMegx?=
 =?us-ascii?Q?xFavGuVWXme5Iy64UiAGBUChhwm0fb7tAXxmDQCkUo/nd9iO4MoGc+f2LsMA?=
 =?us-ascii?Q?thwJmHPHlQePIh4OTVdX+vT7RmcLXxMK4d+vA0j73mJ/X4bk5M2Hs0VwqJ3L?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea456f29-3e7c-4c13-3ca4-08dca667df78
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 13:53:44.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDz2SVFtDojaWPwn4la/xtPvyZOA0PDJHfFS/1UtfNs06SVNdgI9879k21L9dAcj1ux+oYASZ0Kaop73PnAn3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
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

On Wed, Jul 17, 2024 at 02:23:02PM +0200, Maarten Lankhorst wrote:
> Create a single VM_BIND that signals a valid and invalid ufence,
> to see what happens..
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  tests/intel/xe_vm.c | 67 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index a4f6c7a0b..aba2e1b82 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1839,6 +1839,70 @@ static void bind_flag_invalid(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: ufence-invalid
> + * Description:
> + *	Test what happens when trying to signal completion with read-only
> + * 	ufence address.
> + * Functionality: bind
> + * Test category: functionality test
> + */
> +static void ufence_invalid(int fd)
> +{
> +	uint32_t bo, bo_size = xe_get_default_alignment(fd);
> +	uint64_t addr = 0x1a0000;
> +	uint32_t vm;
> +	uint64_t *ro_ufence = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	uint64_t ufence = 0;
> +	struct drm_xe_vm_bind bind;
> +	struct drm_xe_sync sync[] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = 0x1234567890abcdef,
> +		}
> +	};
> +
> +	igt_assert(ro_ufence != MAP_FAILED);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> +	sync[0].handle = syncobj_create(fd, 0);
> +
> +	memset(&bind, 0, sizeof(bind));
> +	bind.vm_id = vm;
> +	bind.num_binds = 1;
> +	bind.bind.obj = bo;
> +	bind.bind.range = bo_size;
> +	bind.bind.addr = addr;
> +	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
> +	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
> +	bind.num_syncs = ARRAY_SIZE(sync);
> +	bind.syncs = to_user_pointer(sync);

Test looks good, just one question. Any particular reason to open code
the VM bind IOCTLs instead of using the helper?

Matt

> +
> +	/* Using valid with valid ufence should work */
> +	sync[1].addr = (uintptr_t)&ufence;
> +	bind.bind.flags = 0;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +	/* Small sleep to allow some time for async kernel worker to run */
> +	usleep(100000);
> +	igt_assert_eq_u64(ufence, sync[1].timeline_value);
> +
> +	/* Also with ro_ufence, but it should remain unsignaled */
> +	sync[1].addr = (uintptr_t)ro_ufence;
> +	bind.bind.flags = DRM_XE_VM_BIND_FLAG_READONLY;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +	usleep(100000);
> +	igt_assert_eq_u64(*ro_ufence, 0);
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	xe_vm_destroy(fd, vm);
> +	munmap(ro_ufence, sysconf(_SC_PAGESIZE));
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -1973,6 +2037,9 @@ igt_main
>  	igt_subtest("bind-flag-invalid")
>  		bind_flag_invalid(fd);
>  
> +	igt_subtest("ufence-invalid")
> +		ufence_invalid(fd);
> +
>  	igt_subtest("shared-pte-page")
>  		xe_for_each_engine(fd, hwe)
>  			shared_pte_page(fd, hwe, 4,
> -- 
> 2.45.2
> 
