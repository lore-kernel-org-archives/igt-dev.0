Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B3C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A8910E411;
	Wed, 22 May 2024 16:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxoOMxMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9110E411
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394046; x=1747930046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=omW+eduZsWnjsZa0MiZ29xp0SHaJJSyIPsYu8ANiyKE=;
 b=IxoOMxMzz4jZoUPs7XbHaenBmRg8SQQQXECJDFhjN+OH8GHG8Bj0HMlZ
 X1Vq0MAByMM1qPVy6egWfY1JDmmyvlVm6SxkS/dIRg4tElnrpbI3skvfK
 MLkeyCQ3SvjiC2Q1SFlmWrFWo8RP9b7DYQOvnp7AGz+1gnI0nuufGIJJX
 npCNmJcdEk2VqnQGrnS7d6sF3QQl759a53dcauXA6uwmnDTsq8ZSmsS1y
 W2UcIsw+8KiPEK+6J1+O2IVKLt2SnaTuev8vd2h7zD58kc1kGIusS4kac
 XJte0eQxLMjxoMDTAlmhgL8n+fNt/kn3tjc0iQ1dBEWhl5NNDsEc4qB9p A==;
X-CSE-ConnectionGUID: 5mwtge4yQm+NNWQed/BwaA==
X-CSE-MsgGUID: 1+lwm9PrSeC9KWzfVl3MtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30189052"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30189052"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:07:25 -0700
X-CSE-ConnectionGUID: /MEGBPjWR7Ob5noJdOv8rQ==
X-CSE-MsgGUID: TJNt8qxHR/SUxeaobmp7Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38190459"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:07:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:07:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:07:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:07:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9uGzQMUNx0qd/ZXlxa+WJK+G6Rm7py7Y8Sk4KX3NDmvGcIJSA/o/UEEuhmXnFVzPr+PnK4p+taEeXvqDRFNCuWnZ2WNmPrr8tfpcFTnUUCtQIvYBFGBk0aXVXNy8ouCOC2NkqDfsoQR9dLQia9+tR+Y3R/1er5i4W2M+g1pwqyggbM0F3YXoO47zok8FvsYAF0Mo/WRctmT7fXGpFdRI1mUQt2kmx8A7ZB1nu1jOYQRp9qP8FI6/dejIWtyFCWOfbVFOf5FgjBVS9uv0j/1YDMGk4E7tVbiVek2P1c492+DkZne+Rs0pDjGGHu/WeGQIzjOG5P5nJGMitmIKEsS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/tfJ0ZTbZqyjtkTTBhKpPSb0UjmKIJDHfEA2iGwQjQ=;
 b=Rz1lAeiIFrJwbEVJ5JTYI5+b9n7b2cLgkTDq5zFL0jvw48hZtNYD3ERultOAlqCJX/NwZFzcB68ZD+tHzzEE+pIfMZ0KtVZTXsYqTqcLB1VFe202JRHRyUxe8sgKklGHiRukYtj7NBLsMNX8FOMKELCwzHmDNFz0YQQt067VSwteo/0hU1omH1c1whaabbGl9HlNHtFLuIWPsw0if43pGvkvMRqRbnIUcP8p+3dIc9lRP9Tvp3zqC+BerMLQZLkuvGEfL4vDzFezhlmeCiH3V/5q4n8fo/yadC+D+/fGt2TbL8/Et9NTBthuzSupSK9fzGAQ0jg3sBKM9p9M/AgFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 16:07:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:07:20 +0000
Date: Wed, 22 May 2024 12:07:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/10] lib: sync i915_pciids.h with kernel commit
 41c0f8a36f15
Message-ID: <Zk4YNW4wsZPDLNaY@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <5bd3776051b68b34c962828ea1643b856859a51a.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5bd3776051b68b34c962828ea1643b856859a51a.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c7403d-d8e0-4ca1-94f5-08dc7a79424d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DmFdlwy3JFDCIhqT2A9tyqqrUVzDmiMFcGbura/8NBCgSXGB3fcc4tjpe1g5?=
 =?us-ascii?Q?YKV28AQrCoJ3l+8FYJQ9vsL7N+2krQ+wulC5SL6tNxMaQydlO+wC91gv7d7N?=
 =?us-ascii?Q?Ac5TDJx4GXMSoiH4hsj4emGg0IqistHfDAQ2Oo4lHf53hpBmZyuEIySNraKx?=
 =?us-ascii?Q?EpwpjjNuOy1W2OveTFK1ArTs8G+AkwoPETTD596tZA/RcPgvFhXcrK3ykDS8?=
 =?us-ascii?Q?EOTymbhHW2i8SGOQHV+mM/7Mh08Yvy+WIL6oddWDQHgCX7fIGxkNiewn3X4p?=
 =?us-ascii?Q?rZESUmG+4MKljJrXB9/iklsXymKeCSWyJ7ihHjQde5QorF2YxiV+Vz46CyLw?=
 =?us-ascii?Q?dqj+83uTiNMClkbVL6DgocRKFb+dfQcNVMoBz498LBexXMbhaI3Qg2Ats5ls?=
 =?us-ascii?Q?jqq29xBHUQVLcs0GNO4K1obp17fD9YRTZtWpT3jBWEpaBPPRWdv9jjGh15D6?=
 =?us-ascii?Q?vF1nRpW3MCT5JOcs9FRtY2iIygpiCihVWRXHV87pfOoD4vkwuTDQ0Q7wyhjx?=
 =?us-ascii?Q?mKAyEKHaZ40NmGcF7xOcTdYAlUzXkATI7fBod3ekEAAT8dBxn9Y5yRxAhaBv?=
 =?us-ascii?Q?2ulzcTkH9ZUk7v02Wf+4ZbT3VuCD1bZNVvV09tB/v+vPCFWLRiNQ2KYUMuMt?=
 =?us-ascii?Q?SWAr2LSN9DI/3ZNEXrup9YtaQ7M6stdGCHMGewHP/hCEPiZ5nsP6wxb2exh8?=
 =?us-ascii?Q?bD6R98asNwODudookrokL5o6ZfCOByD0DWgQ76776Za5SsuqxmR429tz/QKt?=
 =?us-ascii?Q?HAG5qA86+LrqgnjkjSyxnMAEPtM5bj+XUY5v84tIX1BkPUrGzMzcqfHDmUiN?=
 =?us-ascii?Q?D38k2rR1ALRH1KilmOEiEbxWVqoXyPiZtM5TwJ/Gbp+gAtrYQkEZyg2jXyVD?=
 =?us-ascii?Q?mxxkCojhc2OIR8jQA46B4q/11hDPxTwVfJQH9pTxQQ91kOfeNDz7+8SS+ObH?=
 =?us-ascii?Q?aH//H0odKNfiOK4wixmn/kvvB7FaeDOGFda39TdWkl6Zcx05/QCiMRZyxliP?=
 =?us-ascii?Q?Urt8pn2UfB/LTaWwcqlDGrxoaLJxfEKstm6k7gg5CgrFxhj8+wV5MnrF3hwT?=
 =?us-ascii?Q?Dmj6j5YwupCT9qKfqwlcYv64ihlTwNDH+XiBMU0038UDcpn78Xnby+5HDTQ8?=
 =?us-ascii?Q?b/ROsTextKjET9CcsGql6SfeR4cwaJzXREaTloa+RhuAI5seeDfHb9ljJ29t?=
 =?us-ascii?Q?TOKsYU3gcl0Yt9+uKUzjNmNo/yajCRsXoJmMVNlaRnh5CLJtzpI1nsuSKeSw?=
 =?us-ascii?Q?+AOntKFRl0rBokeYbEXy6nu50MmlWtgwFjq3Y6L6cQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UDJ2Ijix0cdwp39y2mHiUYy7Rvlpe87wbxy/Xv+FkA73Ft9odB/J2i/gW5Iw?=
 =?us-ascii?Q?FMwVvXs63VQMwhPDzqo1q15lsPbfmspbTuh8plq0J+B61AXYZ3zi5vDE9e3C?=
 =?us-ascii?Q?mQ3lw+wU8qBJcY89BIZEBusHbk+PnYUZvXXv4pU8joVQGepmbAj9X3yvzq55?=
 =?us-ascii?Q?zunDv1EroF5kDQctEH/cFs9l3r9F/hjBkiL0TV30hE8z+eETxy5O7Z84hq0l?=
 =?us-ascii?Q?GH1E5CULc0fqWOArE0fEuEZF8s5wH8ewOXMYzkBq4yXuw8v29jb8ekfkSZ4Z?=
 =?us-ascii?Q?nzzEFlNi2dDY0hpiMPiFNRYf+Kd4c+fPAX1cWZIVBDexmnI05bbEFTZ2N/wf?=
 =?us-ascii?Q?yV/QL5iguGIfoykdBTFT0zPcqowBbZ/M1NHDrlRY93HAHC5o7a9fauDJrXDz?=
 =?us-ascii?Q?B5RrzJjC4mcJkfOg6eVUtULUCxwLfAalyF8Pbjbo9RdJU0oYe4vFhs0iQCyl?=
 =?us-ascii?Q?HoBYuthAvyuur25D6DYaFkee3kvU9NpjSU8++IUq0F0ayJ9TwtPVBh7FVvRN?=
 =?us-ascii?Q?sE+L0tDRbzGSBkSN6zrUG0HXEBaWcxErOcNlh9rRAH7QGYA+GjMntjmWqfSo?=
 =?us-ascii?Q?fi0f6a2UE9ywQvFosxrCcTEWvbPCncP1dRc+ZSWbLGJOm3GBM3pHNgIN+8RM?=
 =?us-ascii?Q?Vacjtre1Mpv8KkbNsKkZ1SQJInUm+lpi7osbFyI4S0WIDRAEH/VZ/VrZ1n2f?=
 =?us-ascii?Q?sepuvIyP+xm+zsEAsZ33TnPquqIbGKd9Rr4/1T4yN3H/FAHCKmLLaU3GAXGA?=
 =?us-ascii?Q?xvLJrqTuW8OR/fNcxndd3UbR9NuwIgQC+wc7xDThBaLA/gjiZunf9gXZMY0R?=
 =?us-ascii?Q?rdc0i2aigRSahoOwzQFhoQrERICx72vSwGR1P0AD2h9HA8U+EdbwqowWJ+nj?=
 =?us-ascii?Q?5NKv8yARkK+G4iY4gpW/nqV5nC1I/8Ok+8wITeiHpAjD4xNLmMI+X1E7Xv7B?=
 =?us-ascii?Q?dPZeOLR47h/x3C8qYjVoEVoUgVzoLpcXgHgR32eCeZsw4ndJcB1FGbS4flMe?=
 =?us-ascii?Q?86YJ5VP5P9GM+/ZpOL8JiFP1zwznD6XsR8xeAjG4Z1aQUY5vUY3z5tDR1TnH?=
 =?us-ascii?Q?wXvZ4Mev5gAeTRUlmXKGCLvzn0p+GpqtCbDlqMwMT24CQAJLCFFyz00CCX9o?=
 =?us-ascii?Q?hPyhXs75sK8LJ6VOGKx2kwq9PpbluPCI8EpPNpzfZfvfgInFhi0jjLGSiTo/?=
 =?us-ascii?Q?dNS/YUDqhW8cioyNQzNz+EfGjrzHijszJGcTf2XPyreSnWEZJ/WFOgqxC9bR?=
 =?us-ascii?Q?s9+Z2PrRMc1+3wsA1Rw7WEAZfoM/IUjVqHtNTWs9WVnlfn4W7iDOq0VKMypK?=
 =?us-ascii?Q?0pkxncQIXZ3KeZ3rn74Ba2e7C2cjH66qJcjw4O6v31ei0AsV27rYEvDZ1hbF?=
 =?us-ascii?Q?6HK0JxAnxEs6LWAMIirte6wxU8QApfTg7Qe2cX2S0o1OfSOlRKqBe6C37IFH?=
 =?us-ascii?Q?fnyix30rZnqd+dpzLk0MuYyHWx47oxERjI7XPio++f7IpzhbC2CjCVCIgxRf?=
 =?us-ascii?Q?4+pci3wKU68+t810Fu0pSbVUwjgJJtFZdcolGzvMrQAFPxO83dFFTr56peuQ?=
 =?us-ascii?Q?XXpB2fYfDYxMBlBHw5yK3XHi3OovA/GLpNHJq+DqMynoqcB4OQb0dDN+1+vt?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c7403d-d8e0-4ca1-94f5-08dc7a79424d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:07:20.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxRxDwhk36LGd8/PoCIkFf65YkHf0f+2a7GMKDgKIJOo66V5fcBjzJYxzlABw4nP4DFyp8lq/kjn9JTxhkwjwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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

On Wed, May 22, 2024 at 01:35:15PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> 41c0f8a36f15 ("drm/i915/pciids: add INTEL_ILK_IDS(), use acronym")
> 
> and update the references in intel_device_info.c.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h       | 8 ++++++--
>  lib/intel_device_info.c | 4 ++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 21942a3c823b..05f466ca8ce2 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -118,12 +118,16 @@
>  	INTEL_PNV_G_IDS(info), \
>  	INTEL_PNV_M_IDS(info)
>  
> -#define INTEL_IRONLAKE_D_IDS(info) \
> +#define INTEL_ILK_D_IDS(info) \
>  	INTEL_VGA_DEVICE(0x0042, info)
>  
> -#define INTEL_IRONLAKE_M_IDS(info) \
> +#define INTEL_ILK_M_IDS(info) \
>  	INTEL_VGA_DEVICE(0x0046, info)
>  
> +#define INTEL_ILK_IDS(info) \
> +	INTEL_ILK_D_IDS(info), \
> +	INTEL_ILK_M_IDS(info)
> +
>  #define INTEL_SNB_D_GT1_IDS(info) \
>  	INTEL_VGA_DEVICE(0x0102, info), \
>  	INTEL_VGA_DEVICE(0x010A, info)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 88b160ae2d69..0bff1ab4ee95 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -539,8 +539,8 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_G45_IDS(&intel_g45_info),
>  	INTEL_GM45_IDS(&intel_gm45_info),
>  
> -	INTEL_IRONLAKE_D_IDS(&intel_ironlake_info),
> -	INTEL_IRONLAKE_M_IDS(&intel_ironlake_m_info),
> +	INTEL_ILK_D_IDS(&intel_ironlake_info),
> +	INTEL_ILK_M_IDS(&intel_ironlake_m_info),
>  
>  	INTEL_SNB_D_IDS(&intel_sandybridge_info),
>  	INTEL_SNB_M_IDS(&intel_sandybridge_m_info),
> -- 
> 2.39.2
> 
