Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF151C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 20:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DA910E1A3;
	Fri, 21 Jun 2024 20:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUpxWC3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88D710E1A3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 20:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719002407; x=1750538407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mp2P3ghXUXztuT8bahgcO5wYu8Qi1kWDjJfQwU+2BcQ=;
 b=bUpxWC3o14dZTk+JcTX82nadG5ip0TNUAQdPz3HXiEyRyVeLt0Q1Md+j
 4m7IkUTgBx3lw6wUwbv5n093037ai0D7meY5s/FJzUQTBX4SFFvHCydfT
 RG4otFwDm8hZ2NnHT5e2TEtg5qeQid+pEZQmyjczR3yK6K+H0O5NEaV5X
 AjHHWXd5AIgIE5goWF/sjOH5wthdGgDnuBY+9qFSZsNePKoLGUwQaQZjZ
 aczQ4d8QdO9K87X/6MA5JzjFIjIET9TGswMvv0WjqBfaC3v4FZgaKSqnb
 B9eDty8AI0usMWSO9XGxBhb0Y+TcT56NcC1ZCHyzxdvap+Et9x1wZuxDX Q==;
X-CSE-ConnectionGUID: 3QVs0efdSZKJHdAZPMq5hQ==
X-CSE-MsgGUID: 4pP9mDo+TO65WC7NRMYc4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19939121"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="19939121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 13:40:06 -0700
X-CSE-ConnectionGUID: dN2v9GidQu21UBldSihW+A==
X-CSE-MsgGUID: fA+/Qfx2QLamzBDTWwucEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="43380621"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 13:40:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 13:40:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 13:40:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 13:40:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 13:40:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lht5QSPWCiPQrvJZb7VSnlvosiX+w3MOR2MZcIzRReM61ZLUDE1eenMXLFnOWQPS1j+Ne1abqgFwnwUYRdCokJLjHv9iYFKjJMQs+46BHppvN9L4XwRrDodnDbX5J7OM7s2EWdTiXiAEqAPxFodKfE4FmLECRy7onp0pUsMDwX+ABSbVnd134+Iwae0IbF+UHIShKH8lx1XSgoBJlnEBkVdNHn+OjosFIpnTb8kbe1KPPXsE1zB3XARCgDNpW/TL9U5+wBqXCK9I+g4dYsrDFLaKzqS83jVFBjGouLV7zYnIwSH3vKE9wGHCBXfpmVN4WlGTVLtYrhMZEu0KAG9EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj6LF/1sYDEGwwam8+zo7ivVjz5UB03+Ly3bbTYBCMo=;
 b=Iq6qPZDfuMi4enl9B80HjEeUJxEp2VPvQnNbUvUnYf5pGljxu6lUtqSmbSz0xTxnzACqC0+p98ASPVi88YBDuZIMAGtKdOHDvlzLWKXza0bt/6uFBKHIg7lxwinstjtqRZ5jvEgmITDaRb21BxOpJpoRb74jCQ9GY9IyksuSkHQ+R04uoVkmlEdJgLNip/01Rs/xvmegmQOLibmw+mH1H+WSDwHXV8F/uUd3PRg3wpqVbZutaMFnfWfrWOzHGNjObkMo7BxVBYfsj/ZvHW8Ymb3SQDjraVDFwqnCd08PYMmxd+VG6jd7YdfRx3ktCrWPwNodeL/gpF2rtY5ucf2+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33; Fri, 21 Jun
 2024 20:40:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.024; Fri, 21 Jun 2024
 20:40:02 +0000
Date: Fri, 21 Jun 2024 13:40:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/intel_pat: account for Wa_16023588340
Message-ID: <20240621204000.GR2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240619143542.110461-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619143542.110461-1-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 8024354d-9229-44d6-18cc-08dc92325384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FnKcp2TzqEbSw+j509sr2miPtleW76NBuoW9fWQX9f3ZrZK2O4AAjMXWCtyF?=
 =?us-ascii?Q?9R5/YqYKwZg+yoGnXuoa9+22b1e82nG0sRYJxL+nwRIuTkS5p9aFFGXqc+JY?=
 =?us-ascii?Q?vAtzC9h0ActCv4O1AMwmBqjtthUcuH4LitZjo9RJEJ+gg4mcfIy1KcsiHKBD?=
 =?us-ascii?Q?Mg0+4HgBU8kTUPRFiCBpY371so2nprjpnv0n8JCu4NE57pG+3AJNKOjIVdCd?=
 =?us-ascii?Q?hODAQmzn9wUwXHSt4QLuZZ8r0jXnpCGd73RdqNGsrDiozUoJ59kTuNtsPu/7?=
 =?us-ascii?Q?QVYQP15Kk1Q3r9h9EeglJG3Vd9rRjgwinjhHWaQsb85XwW3zOAMTz3Cb1aaw?=
 =?us-ascii?Q?oxRI98a4lifOmHN4J5sOySbEP110LgfFDibz2LDf92LTCjbwz2l8xbqsJY9+?=
 =?us-ascii?Q?IV4wyc/hfopzHXUgpLwMKMYsDAG698LCCeqEMjO7aMpU4eOWBCXxFmCKw8Cc?=
 =?us-ascii?Q?3ECTiQN1KWliKEM8GyDefzGCziTs8xaJtqrujLbezcmeIg1F0h70UOsZp4ri?=
 =?us-ascii?Q?KbHhrHcRAmxFJPEcoVtJeuQB5kgTcc/5uFdG9eOMpjO6aqpaQCRUaFI7N+Ih?=
 =?us-ascii?Q?J4V49jqNUGmb9Eb/cxYrmpDaymj8DpIms7T3UVQ2VwI+Q3nhB7fez2gbCvU/?=
 =?us-ascii?Q?dhIndx+hr15Gd5bipGNhn3D2zu9lZbLQLtm8YZInCny0BQmd/K/roIXIvdsS?=
 =?us-ascii?Q?u3kTM5rSn+7H9yGZIa9bOnmzdAfSCMuuOkFsUgmbfwgUkT2LhAS1Mn3KOqoP?=
 =?us-ascii?Q?I0eLm8lhgsHQrXBoJtGe0+GA1T5UF0uqLl/jeWMk8zNfdhxqo9Jb0pjJqnm2?=
 =?us-ascii?Q?XvR/oDJtPmLTJfOxS4n98U9j4ND/Lqn3PNdvbUo+Y288DIexoHVWyJhMqjnV?=
 =?us-ascii?Q?JNrL77bgj3s6H0t9ccYWi4KXQhxIgZbqYWAPv5BbxEIhtdqW6R19kWja0WZ8?=
 =?us-ascii?Q?uv3EIC2tYppS7fyBCVS8JjCaZi73SjDFVW14Gy5/zVHPrg5jL9+AAtmquVxi?=
 =?us-ascii?Q?t2C9lM221VsCPqhVw7Eb/OJYF1npctvx70ZSOBUu86owRSzrtQpDPEjXnpfX?=
 =?us-ascii?Q?BhCPIRPfn0INVKMseLhrpjQ5cNg8kDynLv6iXTbyaB0g4L7JEaNzNbp1DMM0?=
 =?us-ascii?Q?RJF88mQ5KUB+FXHprMAAAKCOjY5Yr9CZnF92C31l79i4g85+SVouNM7/oX+2?=
 =?us-ascii?Q?fTnlW0S9bZdACn+/6/An7e+09DbfB8pX3eh7NpPbPoyOFMwW7KyTCn1LiXoL?=
 =?us-ascii?Q?FcGpA2PCGlnhgTp/Z8py6us+lk9pGFoD3WbGl6VGbUJxP0d4DVUr1epqpOUP?=
 =?us-ascii?Q?5CiiJOr60YOeYI5tVVv3vPV2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Qaonq6agHNDaK13pMoEt+FCTMw6oSTgFbhtrRDYH9isxCaaU2UyQA3GepG1?=
 =?us-ascii?Q?2LbjedAlQWvUpB9polQmjUO5m3LDIZ1+tP065FbHRXRUGWrM8u3QQUrmJulh?=
 =?us-ascii?Q?gnOXCBJgBpug9+k4iYC/uXFJBRvplPn99ljneTTkeoOeHlIsBax4f/sPrsX8?=
 =?us-ascii?Q?AuODWXGJDAUZP9WYPgNjEF7yqKSW5wVXO/XdCa64GZ6Iq/QjlH+3xzGzpETv?=
 =?us-ascii?Q?BNFqT9GTt56gVkvE27/kvs+6Ldqd3bS7McRnf7BvGgHB+8PzQ2vK+QkubOkA?=
 =?us-ascii?Q?Rmb0ZpHY4xEZH5HVa+X/pUYE7ReGkNjlQ0fUD99ctYvI8Xj1SkDcDufkPJH4?=
 =?us-ascii?Q?mwTEVXSpZiOX88GO8GCJwkLbDNWhqIengsE4iyz+xs9zdBJ0XTOK0MoTziGg?=
 =?us-ascii?Q?0hZwwdblKxlCIgSSpM6U58Mluaf7YGvhRJsReuQz1UTvApcAPmWFpv+nphdZ?=
 =?us-ascii?Q?m2MtbQTtQa+QQ0n10NrHVd0u7r0oBLCSEnrBYmOlezVYLxhKOckd+ezKbGvi?=
 =?us-ascii?Q?ayyeXb5fq0dUyoyJxhgUAXsO/qe6D0UHVstTIR8ehpkCtllI5ECF4602K1zq?=
 =?us-ascii?Q?CmLPnhCGp/2xcCBxGMFxEbyhhUz93bEumIM5zy5tp7ms1HMpo4tSqb9lzPGW?=
 =?us-ascii?Q?yv768Vh4WG2Dnw07dAD3MH9Qdc2w1dMX7dEXRWX6sw9Z2rF6GTnvGmv9pkXc?=
 =?us-ascii?Q?y0p329vu5oqLMomQ72oG1i2p4jv1YfA2ftPvc+Wrx32dPd17j2cCK8401Jou?=
 =?us-ascii?Q?AXmS9NejEz6IWX9XbnEdauhGP0TG8IK3Oja/BsqA3fyJjHUb5iecBgX7L6Jm?=
 =?us-ascii?Q?G3mKw+ZjYDk3hqn1pnlMLzAlT64ktTnNDZta8vTKFvT4UKTvxFcGzFK0PPms?=
 =?us-ascii?Q?8AKcKA+lrRtnYevYwclVhofpTvptjh4mtWOLERFckb6NVNoFxX9P9fcO9Aok?=
 =?us-ascii?Q?KKhstapyK5Hf2iTzygfK24GT5Xul6SR3oRhnLPORtrS8BWhNtcqVONQ31vEH?=
 =?us-ascii?Q?ghjRrHZ7OmNjafxxecnab5vEE7OlozcW3cLsPIYdwKv94pOuF/Ox+rJktnUf?=
 =?us-ascii?Q?ZoUVRWqxQIJU54mMkCDFqwy4GQriMMH8fOZnMZjCOt00DaQs3WT15eHuuU1d?=
 =?us-ascii?Q?hJjruoS88EJlhVdN9jq57IFcgEhnJE9M3obJXSmKCFa/c8z0Xz9tf968Jf5g?=
 =?us-ascii?Q?XR5V5VgdxhLmW5MPIJSpQMgNImORlFink20eQbV9EQHn1hpjvmnnKZRDhB3E?=
 =?us-ascii?Q?PcFyb4AG5zrWOZOsI9+NnYB9dOlBHi82xM6hm+JuJxYR0l37Swl5vvFESOnP?=
 =?us-ascii?Q?wls2h9uYAsy9I8x2Iz8ycueFoapw7HHuAplxzD3fKfwIMl2AZUoN99YuOzEv?=
 =?us-ascii?Q?Vy0P8dXsVMvftkD/eBhsiTTRoqR26ni7/dMH5pVUbxzyw30TZncZMc6rTk12?=
 =?us-ascii?Q?wwWN2nJ1nIgFyxDsVcSj8dTEGY0U9JDIcadCdVHuMZJnwL1kpuxmU1zUD+IZ?=
 =?us-ascii?Q?yaFHXTLCvyjC5tRn1+ooq4LlG9hsrs285djWPj3jfXRPOc1Of1DU2Ix8UL+B?=
 =?us-ascii?Q?gKrcjw5dx5wj5I25MOenF6m6taqVkS35drYKnZu8BFG6dSAPlhDasAVGL9qJ?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8024354d-9229-44d6-18cc-08dc92325384
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 20:40:02.7950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rx3XMGixP9/O6HGwlKa+S4xxKtvxKEOUNcQkxbWZdqERfjJkHTmaw1lM1YXbKpIsf6xIwgJVdPM8WH4eOfh8N0FPxEPzoTVd2LqNnxHtsS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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

On Wed, Jun 19, 2024 at 03:35:41PM +0100, Matthew Auld wrote:
> We can't use the CLOS3 entries on BMG g21.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/intel_pat.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 041952bd8..9191b3577 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -24,7 +24,11 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  		pat->wt = 15; /* Compressed + WB-transient */
>  		pat->wb = 2;
>  		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> -		pat->max_index = 31;
> +
> +		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> +			pat->max_index = 27;
> +		else
> +			pat->max_index = 31;

Nitpick:  I think it might be slightly more clear to the reader if we
leave the existing assignment of 31, and then just add

        /* Wa_16023588340: CLOS3 entries at end of table are unusable */
        if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
                pat->max_index -= 4;

Up to you though; either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


>  	} else if (IS_METEORLAKE(dev_id)) {
>  		pat->uc = 2;
>  		pat->wt = 1;
> -- 
> 2.45.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
