Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F1C282CD
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 17:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601DF10E4B4;
	Mon,  3 Mar 2025 17:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEdUlkZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C106310E4B4
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023676; x=1772559676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IemiB1q1IWXI857DgtTsQ6qPsxp+lfvtqAtiYjT9VgY=;
 b=IEdUlkZF3gEGN3ewA7Epd9D2CAtkGFbXKOQMBpPmNg8zCQ+vC1cPiO8m
 ogZ5KPoDAqRYzdRSdN/RnqQrqDLsCJOl7MiThMupEIAeNqAPHYOR1qYrs
 SQ7EuZN1j43sa9VCFkJmha0WcwkfCVaxK163HBKFtoTwpVlRYI482MAcA
 Px2XiDADnnXkoFdS2m/b/S6M10pyV5XXjmnVVBYFc052v3euJThcJXeK0
 MLaOiRwu2UZO4i+gHW8UHKoX77OT0y58NOxuT7iOVrc1gwvJoh1Hv+xIs
 fjheHzPmxyyummRY0P2OdOasBSH2SjnnJCF2G0ItnTYbgsxa1yADwD5YZ Q==;
X-CSE-ConnectionGUID: 3EyxyIa8SCiBeFoT2AjbkQ==
X-CSE-MsgGUID: t68cH4qqQaSPRIpIpZFkJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29498934"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="29498934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:40:16 -0800
X-CSE-ConnectionGUID: teVVroc9SUqT34wPVPjqyg==
X-CSE-MsgGUID: GfWB+Q/eSOO6i+vw5yeAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155287107"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:40:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 3 Mar 2025 09:40:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Mar 2025 09:40:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 09:40:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8nOrXjF02hgmGT7G1NAeV5XtZSMNDtVMPtInk8ISPdJsOxOZ3RtC64vR/9zYPZaL/yOkF2GLIwAwj+3Sh+lZnQDBi1b8o3eL9ReWjvyl4u3mEP6n9FxwwDqkFwQzAbaTpdVfU6evZvqgy949FAGWlR1cmSXjcHqq9Z5YXeQD41Sf4rkAJ4wiAf80gAa96nDjypgTXFERrtjRuv1k7Ba6moJc4BylzPu8H21VKUNxrHbtIra3OrPy7EIvVMh3GGxnFvrxCrpSliyKTzQdA3fDLNSmiRnCDsmo6O6hGnj90V2v/l5gXpn73TZiYGkdLOXAbDoNPJh/SQjCo6dxYlnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToOmHDdVe0yCkeJvbr4KQlgy4sBGHeQ/eEaZajM7FHo=;
 b=gSsnL8yHj5yn6kSgT/WJrXBs7QopUj6R12pQCDnfss+XhL8LyA/ye0+zHVFByCfumlImVJ5WpSRibWq5jmKJP0mcgkCqsabR3lM1lLE7jicy3nks+fYYQWrevMvzPoNCcKjYBsXSyM14vEF5O9UP5H6nc4Wwfk+FnHMtLXOhbax9Gb60Lo7YITICdLwgDkYqxuZSAaxM0LkVGkU+bEEHly0vT/xqt2VhMHse/A3a0DtyBanJGQm87QGSdvpiGncdamoImN8NDjiJJcw/2EbARnIfO8Gf25p23l413aXS3LHLDblIjq+2j5qPC+3d1dbdoUuAtRLbO/cGQiwIGoCVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN2PR11MB4647.namprd11.prod.outlook.com (2603:10b6:208:262::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 17:39:29 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 17:39:29 +0000
Date: Mon, 3 Mar 2025 12:39:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_gt_freq: Use spinner for
 throttle test
Message-ID: <Z8XpTaoQDn8_K2Ao@intel.com>
References: <20250303095712.274097-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250303095712.274097-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:303:2b::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN2PR11MB4647:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3839d9-d320-4171-eead-08dd5a7a59c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YQZZKoExyymtfghzkqrrPDhbybFQX+RP4avPUWmEPql0cHHEiTTMPx+rv/Zw?=
 =?us-ascii?Q?EREoCHVbUpTOfYavElAG/tC27PF7U2xeqjDigwMYM3uueKz/r38UlbYMV82j?=
 =?us-ascii?Q?K3eKKPTj9sn4Jl9G4Z0jVYUp9bQTbjWoNdpgHn0F+neGXBUE4u7PHy9V10UW?=
 =?us-ascii?Q?J+FOc6lfS2CxnKvsAyKNCOz24SMSiAQiU8t73ipzABaQlvE3hDM7KV7sZChk?=
 =?us-ascii?Q?C1T51hF/DAbOqwc38hhPZE8X6dTtPDiwfqBaftWioizgFqKWjLA5LHezcUfa?=
 =?us-ascii?Q?UE6u+YyNs0kC0Zv39/aAXnmtii5XmWVIkXVj1/UIk1XaF9gaO93Fvzc49T/7?=
 =?us-ascii?Q?Xcd4wXJMEU2EsXJtzEUkc3B3jMfeSjrk8V2InZqpDCVTdgne9iDhR5VLE5zV?=
 =?us-ascii?Q?m8VWYfwRW2UX3QwRT7bG1+pcnf7Ic8C/ohVu1Dl4NK4IqDwG9rkATlISOWI4?=
 =?us-ascii?Q?6yH3rybM/rtqcVoO1bGTe5wkf0tsDEHbZGYHEfZYlPCTy1Xr9MM7RLke+Hl3?=
 =?us-ascii?Q?QcIsQOTm/gsgJXW5Q9vIU+3Et2cF4ZLF5fNw0uraePRNwMoo0jpvyYu8Lu5V?=
 =?us-ascii?Q?qHhmjwzK7yrFdkdrAOqGyWYOM0PQQPrA4zNLV0l6+Xp/g14c2Pd2qq0Yh905?=
 =?us-ascii?Q?vwan61ZhitRFObzsg3zrTrAY9YaHiY71E0SVOMIMdkDAXfbQlTF8meYTCA5J?=
 =?us-ascii?Q?95IpnsprK+Rxznkl1/vwPkPXgaVJ60fdAEIpEeyQvrkWFvJkLqgQZpBhfK4q?=
 =?us-ascii?Q?9+0FdiOiuRNJalPpG5c5s1K3uV432DKUU2ELL6UBIcuokScUolTp5PujNdg4?=
 =?us-ascii?Q?r9JPghUMzoYQj3XFsmM5W+5EG0/Qs0aiHGDXSjD1tv5XxOW1OranQjUYlsCI?=
 =?us-ascii?Q?3/sop7cl66lILek8tp5LLzv3ILpPSBOSJQEN68BHOCwzuvwiDIKF126JZiiA?=
 =?us-ascii?Q?HvMG0+TGQ9WQ32wctHO/tlO7XxxvISRaEYCDmKwQV26jKjUK0d5NJ1B2jnW4?=
 =?us-ascii?Q?kie2BB0b6h/myR2HN9/7PyQUfcZKvghuEEjgK4BOOxSUxfiVsJHMiRLQuoKD?=
 =?us-ascii?Q?AIyzbVEi7Sslll9f5HwKErVxp4HXE7paxJufoP7vSXaau8jGYfqeSFC0OuDF?=
 =?us-ascii?Q?gfk03Pz3hkxqOqdDZMN6m6fRjB3j1JN+u9cpcsDWmKkGaN49dbH/JAsbpWGI?=
 =?us-ascii?Q?7gKOM+1G+siDR1UyPa55u066VbjgAnaJXxifZvK5WKJhQrbEF+RwcZmUGezE?=
 =?us-ascii?Q?0VXWZV46WEH1c7BfJZHg8cb6WZ/pCX9ffKU6GuQzSw8yymp6EdX6sljeZvne?=
 =?us-ascii?Q?QHR4O0nA3HkSMZvTQni7PXJWD1g8LqIcXBeM20aECVQoDGbOGmPJe13O7WGl?=
 =?us-ascii?Q?cB+rDDXqFfT6PvpTA110Ss8p+5ET?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hfkf29BTN2VEMY14z66IN2kkVa/Ua/x+kYpQXxehRRbwOB6593RL7gISJje3?=
 =?us-ascii?Q?2UOeyflmoNobzqgn+iMcqIQmqExcDBQvgOeaCH+pt0FP4NuZmI9ub/EpOufU?=
 =?us-ascii?Q?fyTnbAfnoF2Nq1u1N/zWcRRXwLdXRsXIZzNk0d/fkrsEmbLSm96fY2lePzaX?=
 =?us-ascii?Q?PbEGngwPe8zV76a0VbkhGk/n9HRGtmMdUA2k49Qp8/P1RgBuMEaj7F2i24g9?=
 =?us-ascii?Q?KN+aHQf3hdqFZVNKn4PFOZnoI9M4WpZBSMHeCVmada03GRUWeMrT0Vw9Jgzz?=
 =?us-ascii?Q?5bpqxoT+QMue/llO9R6bxU33bpkGLk+qVIfrD1q0MA3JIu8e2YLbdm1rHDqR?=
 =?us-ascii?Q?eb3OrGoQ4r3pn7LUEdshziN6s4zZXBk4Ne7v2TFHCPHGNitmxSy9mA+b94wp?=
 =?us-ascii?Q?QGff7nv9WyBJ/+b4sHzTF4MvKDYNjIHDncwUKaB/im5B17avW16CQm4WBFAY?=
 =?us-ascii?Q?vPb78MMAEjYE/dhm4TrdkNWqkFgg6LemFcQjXqlmzg7dcFquQ23AjmE2xhgy?=
 =?us-ascii?Q?0qCodwZ88TUL60D+WhmEhNg4SKQOrEHQcyKofBMkiwMHV+O4wwD8tPUMZsRh?=
 =?us-ascii?Q?Cpi51IbF8J/V8B77L+7XiRRE+W+eM99+1HTI0QsKLceoVtFspFnchMPi8427?=
 =?us-ascii?Q?AoQwE14i2EgnS32IjKdk75xAXIw1V1opIIF05yFZMLzCZfCOgwyJircWZ0Bd?=
 =?us-ascii?Q?mf8j87IdHYYGdR4epiklIItM+5qCfuVeuZKuiHY54Vm+hbXkVpozNweKOSn0?=
 =?us-ascii?Q?vDgM5FPOxAg0MFE6+e0mezH5A1PI4Y+CG2yyzeIV1bRhfbpY5VbYCm+Ikh9a?=
 =?us-ascii?Q?1ZSbuwD4nLLhqXjGsFa6fZ5AVJwY0SZ20ZfsNlqrql3JZbE9VSr4gL/oBjEQ?=
 =?us-ascii?Q?TMB7iR1eGRe7/+/agmyzplWdzTC+8IwFhyiX+bCOzO/7Y9SYTgabpRPaHWG8?=
 =?us-ascii?Q?UZP+2fN+DPcbli1xnBo3XGJkE8dDeN8asXNhBTAk/dwJG40GkbGygr0GVJbQ?=
 =?us-ascii?Q?fvWVGvov4GJxHHxpb5zq0hngWH1F3YHaUVqV5cMFDplsPUJFuBlS6NXqXnvk?=
 =?us-ascii?Q?YgM2ujnGZuQjyUT5DAQWOWRi+rUhwEdQUL8R+i2aUGk/8CH+7i9QpKPuB1N5?=
 =?us-ascii?Q?y5YFqT8MM0yld3PvBqiPg2kMYE1AlvgQC9wYJFJspmYEfLlBYKsrzPwFChGG?=
 =?us-ascii?Q?6WG06O9u/r5EM85RmnC3wR4RodeTR/YjNk4Z2X60+JFgKW7jITjcWpIxUv2U?=
 =?us-ascii?Q?wyK+dVmdcsc6QjZRej8qTlVLzDYtCDTrBJfy3g2DzkXypawM34SJ/cKrxry/?=
 =?us-ascii?Q?JWqneQs4ypr1ETKq7M2F1bjaj30nh479QjvV9G1PezHi2mrrpKWuz59zuTZY?=
 =?us-ascii?Q?1PJ0e+nm/rgZNW7+xhCmU9d0qfYdpy32rSXnVeG0iofGJ6csROorltpugTmN?=
 =?us-ascii?Q?nlB+rayT7KI+soxlV60x9nN9wotm3tYWJqSMK+GFcO7uQvJ2cTGpVlDs+TrT?=
 =?us-ascii?Q?hbzzVHIBrDkymYQ0OzBvZmSbTb4vWGre1RPJ1UDehPRGBWqLTE/N2IXUB+Wb?=
 =?us-ascii?Q?C+zHuFgoGl1CycluNFUjHYbue/lsrRH04Y/bBZ4Fa4eoViUCP9meNIgEHXey?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3839d9-d320-4171-eead-08dd5a7a59c9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 17:39:29.7897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nuIc9OIAK1RcayJX+I+XWxQ/aEpbCGo9hDL2Unyt5pkyoAPfcOfVve0Puy9I/IW1wVicekvmdTbjt7NTrjpSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4647
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

On Mon, Mar 03, 2025 at 03:27:12PM +0530, Raag Jadav wrote:
> Since throttling requires running workload on GPU, make use of spinner
> to get consistent results from throttle API test.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  tests/intel/xe_gt_freq.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 1fb6d2b53..b501c62db 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -36,6 +36,12 @@
>   */
>  #define SLPC_FREQ_LATENCY_US 100000
>  
> +enum spin_test {
> +	SPIN_THROTTLE,
> +	SPIN_FIXED_FREQ,
> +	SPIN_RANGE_FREQ,
> +};
> +
>  static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>  {
>  	int ret = -EAGAIN;
> @@ -352,7 +358,7 @@ static void test_reset(int fd, int gt_id, int cycles)
>  	}
>  }
>  
> -static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fixed)
> +static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, enum spin_test test)
>  {
>  	struct drm_xe_sync sync[2] = {
>  		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> @@ -406,10 +412,17 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fix
>  	igt_info("Running on GT %d Engine %s:%d\n", eci->gt_id,
>  		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
>  
> -	if (fixed)
> +	switch (test) {
> +	case SPIN_THROTTLE:
> +		test_throttle_basic_api(fd, eci->gt_id);
> +		break;
> +	case SPIN_FIXED_FREQ:
>  		test_freq_fixed(fd, eci->gt_id, false);
> -	else
> +		break;
> +	case SPIN_RANGE_FREQ:
>  		test_freq_range(fd, eci->gt_id, false);
> +		break;
> +	};
>  
>  	xe_spin_end(spin);
>  
> @@ -454,8 +467,13 @@ igt_main
>  	}
>  
>  	igt_subtest("throttle_basic_api") {
> -		xe_for_each_gt(fd, gt)
> -			test_throttle_basic_api(fd, gt);
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (hwe->gt_id != gt)
> +					continue;
> +				test_spin(fd, hwe, SPIN_THROTTLE);

I honestly doubt that any of these very basic and small batches
we have in these tests will ever cause the GT to be really throttled.

Just having them in parallel is not enough.

> +			}
> +		}
>  	}
>  
>  	igt_subtest("freq_basic_api") {
> @@ -476,7 +494,7 @@ igt_main
>  			xe_for_each_engine(fd, hwe) {
>  				if (hwe->gt_id != gt)
>  					continue;
> -				test_spin(fd, hwe, true);
> +				test_spin(fd, hwe, SPIN_FIXED_FREQ);
>  			}
>  		}
>  	}
> @@ -494,7 +512,7 @@ igt_main
>  			xe_for_each_engine(fd, hwe) {
>  				if (hwe->gt_id != gt)
>  					continue;
> -				test_spin(fd, hwe, false);
> +				test_spin(fd, hwe, SPIN_RANGE_FREQ);
>  			}
>  		}
>  	}
> -- 
> 2.34.1
> 
