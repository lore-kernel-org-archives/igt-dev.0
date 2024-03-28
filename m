Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8D7CD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 18:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8514A1120CD;
	Thu, 28 Mar 2024 18:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkqfKIcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB011120CD
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711649149; x=1743185149;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lyjz2aYDPP+QQ7T+EVa51gReRg54cRAyu4PgdD3hRxI=;
 b=GkqfKIcHSn7VGZWhcgZqxQacW2sdfLrmLuH9w/VReI19Osvdg92vBAV2
 W9ukgPq+0ycr1Co1hEzwlnlRF0CZfqi2K+/jXNhEKv+PeZeij2184OT/W
 cwVz/cogKDPyX3CkTFjufoHG9TvXYkr9ojUASL5QanXCXSfGCBMQGRro1
 8VEUL1LE9A/5dYEQog5sVREEIEb3pGPgDIi0QacitpKoZcQyu9qecEA5x
 JYpLjM5lB5YmvpzggtC1FFK0Hjx6j/yTwNAI4LQFndCXYCVnHMi27wBj/
 kkPWJO2Ihy5HjOUiYF5jmTdJTu8oKX/mNkfNRowrS/gM6ngezd+FxFF0h Q==;
X-CSE-ConnectionGUID: nCRD/SzxSMmKjNjyjSP0Ig==
X-CSE-MsgGUID: sI1hONtcTSyAgAYDpwm9tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17375134"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17375134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47911581"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 11:05:41 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 11:05:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 11:05:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 11:05:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHteIEu7lCkaLeitfZcDG2ypzfoexBjpglM6Ao4TaQpZ1cv/3RKsPYavfRTAigw+Y/sHPvZziipZ2R6VMOjG/IbAq4z7J1hbbYXd9bCkJ3ouxftFhT7VE95qoZxy+POqUAnj/OWXVoDcJTETtJWMobFuHWJ6u3ipphmqMxfhvkFbXmSB/dRJ+BFEw20uymi331ErzO6xuZK/69qtzASu4MMCFaVncLWOlHP/J5HJ4g4FA8sOpaoPKAEeMicEdiPUW03I+soB0+rq/W3fkwjpzhXc08j+BI1zpYVxm+SB4idTBHflCGG/x1GVRQx5L0w2xCTDqQzMyb8/1K1/jIJwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inPvnDR6f5PKKLqlm/TFNMZqCNbtpqvXUAlKYH4aGKI=;
 b=nLrfdqzM1ANmz4Qy2H0KtGBTf9UJHwhxYSefG/3XtONesVZcz2TcfE4jnLxkOEV8Og7s0FNj9S/WiyZ9JjtAlhZ62hh0JCEYgTC9zZAPgXwirvF3RhwgTqM9mASOQG7y9XADzllcbzqSSHAOi6Rj1zbexAwS80HV4qfNi9bxa6qaMXdwyP7/+qxKkDpQiKUrosNWUqiwKtNBGfL/sQ71DAj/+qTpKu29Tr/8HXs8tVpzUbMqZDHgJVIKFpadrQSN02ADJk9BxxZLY1PaC/+FUkuHLfWuLXVNwpoikmT1Z3hby9HH2en/0tt5LllLI5kXm/NWtf3y+SnGczXnScZrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 18:05:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 18:05:35 +0000
Date: Thu, 28 Mar 2024 14:05:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pm: Validate vm-bind prefetch
 flag with suspend and resume
Message-ID: <ZgWxbKP9Rxvt1q-7@intel.com>
References: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
 <20240325201045.25805-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240325201045.25805-3-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 2638f5ef-aa42-414a-7a1d-08dc4f51aacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFrOqJhEIHw8MJTTtjOEp+5L5f4Pn5vyZQxtNvPaLAlBaOJ7O6xjQW3HVADiV7IbTmPr2L9q2V2+1EiNTMbaWPuMqX1snRvP5KqlZ9RSZ3/VgIjcIC+Y5DS9Sr9gnIPat0SjKJpfUKWTrqUprLqtsnpWG7L/w29BBcRcVF2WRo1PD/XGeaiggv360EWrBILQJImmlJni3Ba5pmEXmgS6nRKj4TGse3Kxjz2Taq9seniO9l8bfyurZtH/trsLvSxjxek/2TjXpvAhIiBKRvrxIUDsEKKbWNzkuVCawfeJg+ovphnXMEhpREHPjsdNfezfOWCTI18rYBYDS4/ue7gQPFom+ZgSMKAWsmK8IHg662xnx31DAk+92SM52skv0rowfCRkvTr6eN7T+Gr6rao554DGdWW9zTNW2Zk3yZ840zPKrOr6Tk6OQ40+zgI5szox2T3EXnaaZykWeDkm0PwiB8abAtcIjTowRaetHgO1N4BYPmThZ2xuTzbZ4DKS09d2lgOK4DIqEOEZjXYPBthCFBa9yZPsFDiq0+JzWt5zMgsq8ilQt8VKtCb4W6IRH/5N9AZ3MKtel7jCHQjRygwliCI5ipmQ7sVXiX1G8Q/+UdQXrr7Ll24MeFddtRk/T8L1H9AZExjkC97AmLvzAtUqTdjpRB4MLbPQ5RkZ2adcy7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u5yB4g4LwnKL8ZXC18FQJrgMvKjUo6oOBgQMVuIfxxtWoCayB+MrJjqVPsJj?=
 =?us-ascii?Q?RlhdRLk5LuWz4OXyMuLWhlTTn33mvoy4KlBaqqnlnfDO7AjpxQJhL3tgSROd?=
 =?us-ascii?Q?I9PLCW7XSH03kmnbLDnKSAN9//RznCn86Xy5GPAUqC+SA2FLm9UAITfZg5Kb?=
 =?us-ascii?Q?wQc8RbFUeXMUaDsK67ekvGzSWOweZwJ3QphNwQg1aajEE4W0TP93BGmr87KJ?=
 =?us-ascii?Q?dQYVYXOaJGij4p7jU9TqrahoymjZuV43f19v4wQ+s9p7699LHxeTuBlPgdPi?=
 =?us-ascii?Q?f3Xw+T5OtG0k/3AT8Mt0rvVZEkgcuBfqjHC/R0c8Rbw0nuK3cNfbV3rDDQfx?=
 =?us-ascii?Q?JGXT4fflfRBbg4ayEPTZo1TX68UFgYDQqN8saVQ8w7neAObmqteA03cnBLGR?=
 =?us-ascii?Q?Wk0phi3y4Ermy4egCa7x0HYZyQEnJXiJ2iEO1Km0Kn+y814IUKsBpjkLONWk?=
 =?us-ascii?Q?STN/lH/hHtPzlrAA8b0+H6gfhDv7JxKo6H3z/9FZdN+LkLMW9wMbfqpXzbXW?=
 =?us-ascii?Q?8R135FmoZSooxJw8LqiICd6lUO3AfmK3Lyf1OgJWjioBqpXh3qYrYYKt/tIM?=
 =?us-ascii?Q?OExhqcXc9gK/4p9A4llD6rco0VUvXLsB4JKvBNopJILN01DtbloqTHRqeczK?=
 =?us-ascii?Q?oJzCTnOJYLVRQWgyhXE93tYrAKlG6a6DJ6TXZ1Omr6G8H4WAvsBnhjhaarGO?=
 =?us-ascii?Q?U3hZyfNOYuP5mSVCC3aSpiflkDDa5Jp4lug2oMIm1+K7/45sx260fdNDHTyd?=
 =?us-ascii?Q?BgPQshLpPIrH7zm0Gt1fUYSh3TpPpf8IXK+cRVvev/aO8Q/YhzTFzdA8I11g?=
 =?us-ascii?Q?OyrtNA93RTdSI5DILLcTHiJocS3Ic8j3RtdW+SNb82lfYI9vqjyaJKwFGz22?=
 =?us-ascii?Q?deZlnLumeEUQcwjshTG3siGzFVAIGV4lvFYQvqO0i0osOFfXAa9hEh2t06wR?=
 =?us-ascii?Q?jnkHZbdncrwwD27gXlroTwcN3xeBvpdwnimzWqWLd5Ni6JD3Nd+4uGAre31b?=
 =?us-ascii?Q?HXTqmcoAj2A1GHri5/SORkQBpdIUGHuxfqTiBgVsPWHvQi3JaHk8H8Ose/Ru?=
 =?us-ascii?Q?eq5tsFWhFejxUirVGwBPazyvdkt329pvHPZY8OW0N4e8Ex2aPwxaaLtRcdIC?=
 =?us-ascii?Q?Af64Lbn6I0cF6nSBESuMk8llDFKRTC7nY4gVCBjdNPqhPm3dHFpcWwtcjesn?=
 =?us-ascii?Q?lPYnmAtKQuEb7gBMspWiMjGTgufJW6esiA+HoehEmMdya9+lKCh+mw5mj+3C?=
 =?us-ascii?Q?SymPBCNQKqMlZ1Jf0nQrgyYBzA1UQK4w6diMQPDDreRl2sOi0gKefxXbDeDC?=
 =?us-ascii?Q?LpHy7lnVaLj1/TbuCL0z3cfay/ZoCOC2us3l2+iHf1KdFDK8oY9cmTNo5pEj?=
 =?us-ascii?Q?QyhKVAkoHthuwqebcC4NJ9L32hv1QZxL1ol33DKJRsWRsYp97VpWeom5vMLY?=
 =?us-ascii?Q?CQetz9kRomwLJulMEqasyNk3mk//eREUHB0LzAff/kx0ih353SjQ7pVK80VD?=
 =?us-ascii?Q?DBRT8G93RqAFCQ5bI3r/qny137pr4hjR6R5JL+tV78fSg/YI+L+WP2Lm9aZM?=
 =?us-ascii?Q?IJ5vaKu7wILP41xFQqS0iDXxH6xRmGW7W4wQXwwCzaGdQHCvITbkLaJn8FtV?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2638f5ef-aa42-414a-7a1d-08dc4f51aacf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 18:05:35.9377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmCwjYGpjlQfQdF5M3TC57BlV4b61GoGiazBwYxAqQ/90ieb3F+GTeORrypKTwCOTZBDozHHtQs9+oeqPZU2pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

On Tue, Mar 26, 2024 at 01:40:44AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test functionality of vm_bind prefetch with S&R
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 8659e87cc..e016f2bca 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -34,6 +34,7 @@
>  #define MAGIC_2 0xdeadbeef
>  
>  #define USERPTR         (0x1 << 0)
> +#define PREFETCH        (0x1 << 5)

why 0x5? we don't need to copy verbatim this from other tests.
0x2 makes more sense here.

>  
>  typedef struct {
>  	int fd_xe;
> @@ -289,6 +290,7 @@ static void close_fw_handle(int sig)
>   * arg[2]:
>   *
>   * @usrptr:     usrptr
> + * @prefetch:  prefetch
>   */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> @@ -340,9 +342,16 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	if (flags & USERPTR) {
>  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
>  	} else {
> -		bo = xe_bo_create(device.fd_xe, vm, bo_size,
> -				  vram_if_possible(device.fd_xe, eci->gt_id),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +		if (flags & PREFETCH)
> +			bo = xe_bo_create(device.fd_xe, 0, bo_size,
> +					  all_memory_regions(device.fd_xe) |
> +					  vram_if_possible(device.fd_xe, 0),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		else
> +			bo = xe_bo_create(device.fd_xe, vm, bo_size,
> +					  vram_if_possible(device.fd_xe, eci->gt_id),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);

why? I don't see this in other tests with 'prefetch'?

>  		data = xe_bo_map(device.fd_xe, bo, bo_size);
>  	}
>  	memset(data, 0, bo_size);
> @@ -362,6 +371,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
>  
> +	if (flags & PREFETCH)
> +		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> +				     bo_size, sync, 1, 0);
> +
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
>  
> @@ -615,6 +628,7 @@ igt_main
>  		unsigned int flags;
>  	} vm_op[] = {
>  		{ "usrptr", USERPTR },
> +		{ "prefetch", PREFETCH },
>  		{ NULL },
>  	};
>  
> -- 
> 2.39.1
> 
