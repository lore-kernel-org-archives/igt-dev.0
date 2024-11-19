Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF60D60D09
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF6E10E1A6;
	Tue, 19 Nov 2024 01:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTJC7Cn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B9A10E1A6
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731980101; x=1763516101;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vj+WchD3kdGfLK78kDWHSqti8WeY+8Dkf7ZpwoRTamM=;
 b=YTJC7Cn6jGUqwLVJsKKilxsaXr2YFHfp8QERyl3n0+gBtZgSandcI49U
 WOApZJkxWbrI/Vl92KwsOzQ92EeHdFHU7U9PMzIwQlXRYYPntQagLAk+u
 kQyqh3zw7nsFvABtsiLEV1yqYSkdLhoHCKP2X5tB8NA9UtMSWuwr4bGhg
 rHDMUorEuSRnKnUk3mvAU3nenz3yjqWY6D3vzk8IXzwEnvVi8Sw+C7Di/
 RoX5ODZP2VM8REOfXOf073fqm9SqqqBOzaI49H6jkg2skJspAnfQqg9dU
 8YaJv4qwWq7mIf0ds6bYNLDv0qCNr5mJKCgz7mCi4WClp08S7BJ2cLLDY w==;
X-CSE-ConnectionGUID: NzwSIRmvS6OHDVLYDcngUQ==
X-CSE-MsgGUID: XpTMTYwRSHuB/hu2WrQcMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43344541"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43344541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:35:01 -0800
X-CSE-ConnectionGUID: V9+3lVTuTVO2H6kKIjyrrg==
X-CSE-MsgGUID: k4zvGG/WR9q1cXmIiOdTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="93857678"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:35:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:34:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:34:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:34:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqXToPBwv9nHRFAF3oovGXyza4PiirlKmKPcErVeA8beskMncpxV9R3fZWExCbCpb2gYjjUEJNBN8VSLSVQaHcqodrewBQx31sDRw502XeJ0bLATz1YNRidMKhpJkcLBW9iHing44x0S80729adIPjdpwGLNQd7I+2HZD4cKDIO88YL/YdQc/kNcarg/ayaaWuv1F2s672uvk52Tbvc9NvN1j35JD0eS6OdQ/HZkjKL5to2HmOdWx31Wzxz3Ao/MxiWXHycw54dli0LaBFdSSZzRusdN1q6uZSE9gbUmCNKyq8lyDQxLzPEGjFm7vmMnak63RhadckmLcp6TZfVakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELCw9fAHLfkejCTLBvsPx34nTL8JstinEg/APcfUwWM=;
 b=Ay4FbgdoEjFc94ITO6Zn0Xy7ABYsLI3C2hJwMQnPXhiq90vkA4Abv6bi2jTAtIASf0fLUKz+XX2pZz5m3wcOYr6ytf/yceWCqk2PW8kIDX8sT5iZP5BapMPCNV9a6wB5XStiOZE7ohCjZGqpUqibvaSiAAuXVnN7byCx/Vd4uL7wn3wIom4FoirOVyjFHQLtMfVJpMZ9KCOzi119iMLHyg++jM1fsFD+zb+x5J94j85pBIwg0l1llVM2Xe2HMcXdwqO6rhD5XXDZ/NUOONruJ8DJPTYJwj+Rga5RPQB80pJiIMb+6/L+SYnceM4bubkWQzuVZ7edplIdPrwQpIuIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 19 Nov
 2024 01:34:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:34:53 +0000
Date: Mon, 18 Nov 2024 17:34:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 8/9] i915_module_load: Stop caring about snd
Message-ID: <20241119013450.GB4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: d487d127-0700-46e7-eee9-08dd083a5da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VcGQuFREE2dVfGxv1KdcqpLyTA8S9j/ujbgVVl+2HCwLCEYiQZ7dlj7Il2yn?=
 =?us-ascii?Q?FOkdSerQiHKyIJkoILa08IAxOCVY+ZQ+EXnhhPmK0ukykb2YuKrFPf25Vns9?=
 =?us-ascii?Q?BZE3a+3mJUgOz+/ySJRDlUnwyzeClRIlVao14/gRFVFMMgj+YHFpbKgRW5qQ?=
 =?us-ascii?Q?XDqwL5tcbGRRbw6+dVt4S+QE5JetyMadYrp+WW4OD9mbi1jw+vuw+ZykKUvi?=
 =?us-ascii?Q?qupDbGAF+Gperx/1bItXmHKq7xBhAHG3MpjuRjyrnmw2ea9+JU7nRHxQrJAq?=
 =?us-ascii?Q?yMmBVY8YlZC2hYJ9vben4e3OTnxwKqckQJV0SPyd/mjQhvsl9HE076LbG/Pq?=
 =?us-ascii?Q?Qpf1X8jfaQB6b1LxbHV1RZi/zD0xqImv3YZw9/B57tfYycNoLqtIbMeh09xo?=
 =?us-ascii?Q?XgUUvchp2RozcxbF9HAdympjRVtkx1zr3y2dRgY/PICq03XIcQA3V5LUYcJl?=
 =?us-ascii?Q?iPVssQ6aT0mnOShAnfZptSD4W/X6vPPj16XeyvWzoolcLXdcyIN5A6d1kfeo?=
 =?us-ascii?Q?hfi21SXTSeaMugsZpshN3Pfa6yOT/4Y8OyNvhnHH+p9rkTpQ+bCQ9eUaOKi5?=
 =?us-ascii?Q?NVfGCylhfC+zZ4QC3ydNxxJ62a7t9EyVOg5nQ7I5ZRmBIXpRgwIT1RBJVJ+u?=
 =?us-ascii?Q?Y8+HCprE1SFiZMLBcnIiwVZFFyKXlKBMxf/CIH0ETk/RXfwzfUKYNnDl1FwS?=
 =?us-ascii?Q?AWo4EDgEVxGI9jfkwjnLaKhwuYPbeaNh803Kf6nypAKDZQIFM9G54bkKjxNx?=
 =?us-ascii?Q?FE58FHmAmiU0PtMGiWTi4QrVsPERHTjObZc9C7s4pwuMZDOa83IDzKjKSd97?=
 =?us-ascii?Q?9NNTi2CoVGxSj7rrpIogRUSozoNsHo2zrKJuxWj40gm+UKdYnOHIt2E2E88E?=
 =?us-ascii?Q?4vg+7HEzk3ck5kMVZ95TPunsRX9uAjEebrOKT1JGzANZZWWAuptkFaHmW3if?=
 =?us-ascii?Q?u78GiR+D9IY86a20ZE/GXG98B/10MKAHn7IG4t43ZdBOC1qW3abx+OHdwr2P?=
 =?us-ascii?Q?eNYy8wztoOM6LS9ScLd4f6UErzW2yGjP5XNXc+78SIaOjwGX2ArE/4+DXeUg?=
 =?us-ascii?Q?4ADVM8gdYKxFnpncEuYwQeVFKrKTTHz63p/gDDa9jx0zXIIBJa19UQAl/ixW?=
 =?us-ascii?Q?yv/3065Yy2mdsJkkWsjpZ/dOYZgkc+zGdI8SoPPOoH76iBRD244OaJqMQ8jd?=
 =?us-ascii?Q?pfQ/cJ7UCw3wWDR3TV6Ib4e2gdYJdlfArWrBDQkfNoB6gLx9reqh1spgkHjG?=
 =?us-ascii?Q?VIL0dmgaIcLqP7m6XHNtnLh3/NyHhbBUAD7QXhZJF8qb6CmScwKAFngJrB+E?=
 =?us-ascii?Q?Aic=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b2L6GlYSxXKfIkTnNOybzZMaxbH5rhQwALq+X/UfJUPWbw9i/RKuGCA23mTV?=
 =?us-ascii?Q?kD2FQjGE4d7C8Xg3EMrjhV6cQh3JPU5OB5MQS8kjF1gXNv+Ja4BLdoBcK44C?=
 =?us-ascii?Q?SY6l/LxyFDhpNFwVbiS8cGdwXOcmgl5IorPE2K5C7xjrs2hoYUrDumHlQZC8?=
 =?us-ascii?Q?BE9WmCwyspRahbjptgMDnUQITA+9dwhXCwjLkYkTY5SAEvmdEWcILb7bHodG?=
 =?us-ascii?Q?GfW2Ugelyd1YwZjPvm+HVX/mFiAfYWPcLUibGizdCNk5YVOx+3J5l/o+v9vg?=
 =?us-ascii?Q?DYBlt37i9vo9cPahjubyHYO36v4VNmIP0vrinFdbjwH+7tIZ7BywZM8KLURs?=
 =?us-ascii?Q?v7NfXTNhAJS3w/B9rrZ6cCO03v06HCbUk0RffH629Klb0hPh1AWdVhRlGmYf?=
 =?us-ascii?Q?En1/YgLbHQUYKJGopfHXnX29fsaAyJ5bR+4rgRvncKRAgavRJFCs3zxDlP7U?=
 =?us-ascii?Q?wFbFXcYDfZNufbBfxDLKvPkg0XA8lCAQWNRMhY4ployUu271svGRbvKnU7W2?=
 =?us-ascii?Q?pxaMseNOPlPiUra4L/oYMuvEWJ+pw51bYLo2203Omg97Pvd1C8hB0Ce6F0nf?=
 =?us-ascii?Q?aUc6OAVXwX2vi9qL9vQQPR8c3/YZVqbG83Ig2Be5AD+NZSTcaVADKnPf6qYb?=
 =?us-ascii?Q?LYccY1seEWuhCxTw1q2nS0RpoBu0fczbDoMNs0StotC5VflKuaV3P3XTc1W/?=
 =?us-ascii?Q?v1xeyjZFGqs7Mod5B8YmEBLuf0+EhFDQCDZxxPTYt01cTij0UEsItNlgvnau?=
 =?us-ascii?Q?jV2Qc0Iml71xyaiisz9/uzR+nnOsWMDW82+nEAQqCjbYTwf2BBQ2gQ9pOazo?=
 =?us-ascii?Q?/T4pXAQ4mSZWeNhb8fqc9R0GCJyoVQUzbJn56gX6ntduI3cUFwjp7HvZr7Y5?=
 =?us-ascii?Q?9pkBnF6dGUyOUNOg9ZCpSnPRCpjPknAaK/nA/o/lIB1Nt6LaOhUdtg/bbIq9?=
 =?us-ascii?Q?YGT/aWDuckZlOAP7nLddEPu83CtoBUAewQt+OtzVI0pbq5XWa0oNYhkn3dFi?=
 =?us-ascii?Q?buU+vF2zNkhuuxNdN7p1ukppoCmuqDs/oOAmsMAwoLYtV1ap/Zwm3zgN62lg?=
 =?us-ascii?Q?bfylyaeSVT6JQk1TZ+CJbnS+4AmukyAgJinmtDvUYM3be74o9odnfiBHCpQd?=
 =?us-ascii?Q?buV86JKKnpPtPiJsL8kmeyGjyOcxHp46X3O+7llybMMDmQ/hm6RbDe/+Cam+?=
 =?us-ascii?Q?ELFeudMhnz9dKgh7RC6EDBe4uT+s5k/xF7W1XjA0SeS3hWLmwVPJypRGNYOA?=
 =?us-ascii?Q?B3oGprVEDqhPbPcgYYiP/8ceed2D0al1PUs8kHJz3KEabYvZnijuID4bmrK2?=
 =?us-ascii?Q?xF4oXv2fRDHjqG8AORLEYLzGrCGB/E4MJtCKNVCpGh8JL3HBV6VdEBV5Yi1M?=
 =?us-ascii?Q?kqbDCQAjAzyRc+Uo5V0fsxmIwr9w1a+t2YuxNKbZYDaBDNsU5qwE5VqAwQHx?=
 =?us-ascii?Q?wjzLd4/dmXcZYBmBgH81sR3DlqAp0NC/KfnJxS9nUFJu+2Gac6JlHub5d7G7?=
 =?us-ascii?Q?Z6JHDxJbnsJm2+Zt1tYoS11FGWYVoRHggbmP1z697S3vW9KNSwpLCNEvSiE+?=
 =?us-ascii?Q?xs0RvT/sKaA9G812Hi/eXoL+s4WvZ45tVtK9YOAdfeydURLeeI2mxN6T3+rg?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d487d127-0700-46e7-eee9-08dd083a5da8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:34:53.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcglqsIqllTpwaDyHSc1654ksRvUkwWeA3PXmPOoE4BoMW78eeFgNBe9G9gPF+1HjeBUY/7dmBvNrc0MnaJ882G4/ZJyucFFJ2FZDFqTq1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
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

On Mon, Nov 04, 2024 at 10:18:44PM -0800, Lucas De Marchi wrote:
> Just handle i915 and it should work.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/i915_module_load.c | 32 --------------------------------
>  1 file changed, 32 deletions(-)
> 
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index b3752a19c..c78b843f9 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -271,41 +271,12 @@ static void gem_sanitycheck(void)
>  	igt_assert_eq(err, expected);
>  }
>  
> -static void
> -hda_dynamic_debug(bool enable)
> -{
> -	FILE *fp;
> -	const char snd_hda_intel_on[] = "module snd_hda_intel +pf";
> -	const char snd_hda_core_on[] = "module snd_hda_core +pf";
> -
> -	const char snd_hda_intel_off[] = "module snd_hda_core =_";
> -	const char snd_hda_core_off[] = "module snd_hda_intel =_";
> -
> -	fp = fopen("/sys/kernel/debug/dynamic_debug/control", "w");
> -	if (!fp) {
> -		igt_debug("hda dynamic debug not available\n");
> -		return;
> -	}
> -
> -	if (enable) {
> -		fwrite(snd_hda_intel_on, 1, sizeof(snd_hda_intel_on), fp);
> -		fwrite(snd_hda_core_on, 1, sizeof(snd_hda_core_on), fp);
> -	} else {
> -		fwrite(snd_hda_intel_off, 1, sizeof(snd_hda_intel_off), fp);
> -		fwrite(snd_hda_core_off, 1, sizeof(snd_hda_core_off), fp);
> -	}
> -
> -	fclose(fp);
> -}
> -
>  static void load_and_check_i915(void)
>  {
>  	int error;
>  	int drm_fd;
>  
> -	hda_dynamic_debug(true);
>  	error = igt_i915_driver_load(NULL);
> -	hda_dynamic_debug(false);
>  
>  	igt_assert_eq(error, 0);
>  
> @@ -367,9 +338,6 @@ igt_main
>  	igt_subtest("load") {
>  		const char * unwanted_drivers[] = {
>  			"i915",
> -			"intel-gtt",

The intel-gtt AGP driver isn't snd-related.  You should probably either
mention it specifically in the commit message or put it in a separate
patch.

I believe it should still be fine to drop it and just unbind+unload
i915, so

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

with that mentioned.


Matt

> -			"snd_hda_intel",
> -			"snd_hdmi_lpe_audio",
>  			NULL
>  		};
>  
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
